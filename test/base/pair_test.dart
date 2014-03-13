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

library quiver.base.pair_test;

import 'package:quiver/base.dart';
import 'package:unittest/unittest.dart';

main() {
  group('Pair', () {

    group("equals and hashCode", () {
      test('should be equal iff key and value are equal', () {
        var sample = new Pair('a', 0);
        var equal = new Pair('a', 0);
        var differentKey = new Pair('b', 0);
        var differentValue = new Pair('a', 1);

        expectEqual(Pair p1, Pair p2, bool equal) {
          expect(p1 == p2, equal ? isTrue : isFalse, reason: 'were${equal ? '' : ' not'} equal');
          expect(p1.hashCode == p2.hashCode, equal ? isTrue : isFalse, reason: 'hashCodes were${equal ? '' : ' not'} equal');
          expect(identical(p1, p2), isFalse);
        }

        expectEqual(sample, equal, true);
        expectEqual(sample, differentKey, false);
        expectEqual(sample, differentValue, false);
      });
    });

  });

}
