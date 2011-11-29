#/usr/bin/env winxed

$load "rosella/test.pbc";
$load "parrot-math-primality/primality.pbc";

class Test_parrot_math_primality {
    function test_is_small_prime() {
        using Math.Primality.is_small_prime;

        var bi = new 'BigInt';

        bi = 3;
        self.assert.is_true(is_small_prime(bi));
        bi = 4;
        self.assert.is_false(is_small_prime(bi));
        bi = 1601; # prime
        self.assert.is_false(is_small_prime(bi));
    }
}

function main[main]() {
    using Rosella.Test.test;
    test(class Test_parrot_math_primality);
}
