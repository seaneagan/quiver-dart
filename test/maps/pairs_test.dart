// Copyright 2013 Google Inc. All Rights Reserved.
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

library quiver.maps.pairs_test;

import 'package:quiver/base.dart';
import 'package:quiver/maps.dart';
import 'package:unittest/unittest.dart';

main() {
  group('pairs', () {

    test("should return an empty iterable given an empty map", () {
      expect(pairs({}), isEmpty);
    });

    test("should yield only Pairs", () {
      var p = pairs({'a': 0, 'b': 1, 'c': 2});
      expect(p.every((pair) => pair is Pair), isTrue);
    });

    test("should yield corresponding keys from map", () {
      var p = pairs({'a': 0, 'b': 1, 'c': 2});
      expect(p.map((v) => v.key), ['a', 'b', 'c']);
    });

    test("should yield corresponding values from map", () {
      var p = pairs({'a': 0, 'b': 1, 'c': 2});
      expect(p.map((v) => v.value), [0, 1, 2]);
    });

    test("should allow iterating multiple times", () {
      var p = pairs({'a': 0, 'b': 1, 'c': 2});
      expect(p.map((v) => v.key), ['a', 'b', 'c']);
      expect(p.map((v) => v.key), ['a', 'b', 'c']);
    });

    test("should correctly implement length", () {
      expect(pairs({'a': 0, 'b': 1, 'c': 2}).length, 3);
    });

    test("should correctly implement isEmpty", () {
      expect(pairs({}).isEmpty, isTrue);
      expect(pairs({'a' : 0}).isEmpty, isFalse);
    });

    test("should correctly implement contains", () {
      var p = pairs({'a' : 0});
      expect(p.contains(new Pair('a', 0)), isTrue);
      expect(p.contains(new Pair('b', 0)), isFalse);
      expect(p.contains(new Pair('a', 1)), isFalse);
    });

  });

  group('fromPairs', () {

    test("should return an empty map given an empty iterable", () {
      expect(fromPairs([]), isEmpty);
    });

    test("should yield map with associations for each Pair", () {
      var m = fromPairs([new Pair('a', 0), new Pair('b', 1), new Pair('c', 2)]);
      expect(m, {'a': 0, 'b': 1, 'c': 2});
    });

    test("should use last value on duplicated key", () {
      var m = fromPairs([new Pair('a', 0), new Pair('a', 1)]);
      expect(m, {'a': 1});
    });

  });
}
