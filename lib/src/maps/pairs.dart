// Copyright 2014 Google Inc. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

part of quiver.maps;

Iterable<Pair> pairs(Map map) => new _PairsIterable(map);
Map fromPairs(Iterable<Pair> pairs) =>
    new Map.fromIterable(
        pairs,
        key: (pair) => pair.key,
        value: (pair) => pair.value);

class _PairsIterable<K, V> extends IterableBase<Pair<K, V>> {
  final Map _map;

  _PairsIterable(this._map);

  Iterator<Pair<K, V>> get iterator =>
      new _PairsIterator<K, V>(_map, _map.keys.iterator);

  // Some operations can avoid iteration.
  int get length => _map.length;
  bool get isEmpty => _map.isEmpty;
  bool contains(Pair<K, V> pair) =>
      pair is Pair &&
      _map.containsKey(pair.key) &&
      _map[pair.key] == pair.value;
  // TODO:  Are there any common ordered Map implementations, such as
  // LinkedHashMap, such that `map.keys.elementAt(i)` is O(1)?  If so, add an
  // override for elementAt here.
}

class _PairsIterator<K, V> extends Iterator<Pair<K, V>> {
  final Map<K, V> _map;
  final Iterator<K> _keyIterator;
  Pair<K, V> _current;

  _PairsIterator(this._map, this._keyIterator);

  Pair<K, V> get current => _current;

  bool moveNext() {
    if (_keyIterator.moveNext()) {
      _current = new Pair<K, V>(_keyIterator.current, _map[_keyIterator.current]);
      return true;
    }
    _current = null;
    return false;
  }
}

