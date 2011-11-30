#/usr/bin/env winxed

namespace GMP {
    class Integer;
}

$load "rosella/test.pbc";
$load "parrot-math-primality/primality.pbc";
$load "GMP/Integer.pbc";

class Test_parrot_math_primality {
    function test_is_small_prime() {
        using Math.Primality.is_small_prime;

        self.assert.is_true(is_small_prime(3));
        self.assert.is_false(is_small_prime(4));
        self.assert.is_false(is_small_prime(1601));
    }

    function test_is_strong_pseudoprime() {
        using Math.Primality._check_two_and_even;
        using Math.Primality.is_strong_pseudoprime;

        var spsp = [2047, 3277, 4033, 4681, 8321, 15841, 29341, 42799, 49141, 52633, 65281, 74665, 80581,
85489, 88357, 90751, 104653, 130561, 196093, 220729, 233017, 252601, 253241, 256999, 271951, 280601, 314821,
357761, 390937, 458989, 476971, 486737, 489997, 514447, 580337, 635401, 647089, 741751, 800605, 818201,
838861, 873181, 877099, 916327, 976873, 983401, 1004653, 1016801, 1023121, 1082401, 1145257, 1194649,
1207361, 1251949, 1252697, 1302451, 1325843, 1357441, 1373653, 1397419, 1441091, 1493857, 1507963, 1509709,
1530787, 1678541, 1730977, 1811573, 1876393, 1907851, 1909001, 1969417, 1987021, 2004403, 2081713, 2181961,
2205967, 2264369, 2269093, 2284453, 2304167, 2387797, 2419385, 2510569, 2746477, 2748023, 2757241, 2811271,
2909197, 2953711, 2976487, 3090091, 3116107, 3125281, 3375041, 3400013, 3429037, 3539101, 3567481, 3581761,
3605429, 3898129, 4181921, 4188889, 4335241, 4360621, 4469471, 4502485, 4513841, 4682833, 4835209, 4863127,
5016191, 5044033, 5049001, 5173169, 5173601, 5256091, 5310721, 5444489, 5489641, 5590621, 5599765, 5672041,
5681809, 5919187, 6140161, 6226193, 6233977, 6334351, 6368689, 6386993, 6787327, 6836233, 6952037, 7177105,
7306261, 7306561, 7462001, 7674967, 7759937, 7820201, 7883731, 8036033, 8095447, 8384513, 8388607, 8534233,
8725753, 8727391, 9006401, 9056501, 9069229, 9073513, 9371251, 9564169, 9567673, 9588151, 9729301, 9774181,
9863461, 9995671, 10323769, 10386241, 10425511, 10610063, 10655905, 10712857, 10763653, 10974881, 11081459,
11335501, 11473885, 11541307, 11585293, 11777599, 12263131, 12327121, 13057787, 13216141, 13338371, 13421773,
13446253, 13500313, 13635289, 13694761, 13747361, 14179537, 14324473, 14709241, 14794081, 14865121, 15101893,
15139199, 15188557, 15220951, 15247621, 15479777, 15510041, 15603391, 15698431, 15802681, 15976747, 15978007,
16070429, 16132321, 16324001, 16360381, 16705021, 16773121, 16822081, 16853077, 16879501, 17116837, 17134043,
17208601, 17327773, 17375249, 17509501, 17585969, 18073817, 18366937, 18443701, 18454921, 18535177, 18653353,
18740971, 19328653, 19404139, 19471033, 19607561, 20261251, 20417311, 20647621, 21303343, 21306157, 21359521,
21400481, 21417991, 21623659, 22075579, 22087477, 22564081, 22591301, 22669501, 22849481, 22953673, 23464033,
23577497, 23734901, 23828017, 23872213, 23963869, 24214051, 25080101, 25326001, 25629913, 26254801, 26377921,
26758057, 26821601, 26840269, 26877421, 27108397, 27118601, 27219697, 27271151, 27279409, 27331921, 27380831,
27392041, 27509653, 27664033, 27798461, 27808463, 27966709, 28325881, 28527049, 28572961, 29111881, 29214541,
29581501, 29878381, 30022129, 30185569, 30219757, 30295141, 30388753, 30418957, 30576151, 30662497, 30740417,
30881551, 30894307, 31166803, 31436123, 33627301, 33704101, 34003061, 34856167, 35576599, 35703361, 35820937,
35851037, 36307981, 36338653, 36765901, 36861901, 36919681, 37109467, 37439201, 37769887, 38010307, 38046817,
38118763, 38210323, 38342071, 38624041, 39465091, 39655153, 40629601, 40782589, 40827473, 40987201, 41121433,
41604109, 41642681, 41662297, 41840809, 42485119, 42623017, 42984589, 43363601, 43397551, 43661257, 44314129,
44963029, 45100177, 45414433, 45485881, 45769645, 45819541, 46325029, 46517857, 46679761, 47220367, 47349373,
47759041, 47903701, 47918581, 48191653, 48269761, 48316969, 48369727, 48448661, 48551161, 49303801, 49411801,
50155733, 51129781, 51302353, 51340807, 51500521, 52072021, 52119289, 52204237, 53399449, 53656021, 53675623, 53695721,
53711113, 54029741, 54449431, 54468001, 55109401, 55318957, 55729957, 56420033, 57561085, 58422409, 58449847, 58509977,
59631211, 59840537, 59913157, 60155201, 60352921, 60547831, 60566431, 60581401, 60696661, 60738257, 61201009, 61219789,
61377109, 61755751, 61832377, 63001801, 63065281, 63167743, 63318169, 63346999, 63388033, 64605041, 65254393, 65301013,
65359477, 66096253, 66977281, 67194401, 67642513, 68102641, 68154001, 68165761, 68512867, 69030901, 69128641, 69176647,
69228967, 69231061, 69485281, 69885649, 70030501, 70149631, 70593931, 70728121, 71572957, 71734417, 72498253, 72543547,
73562833, 73645001, 74329399, 74411131, 74927161, 75140137, 75565873, 76725091, 76745101, 77533123, 77576401, 77812153,
77817979, 78939089, 79398901, 79417801, 79786523, 80375707, 80556337, 80687881, 81433591, 81445585, 82273201, 82506439,
82870517, 83204801, 84421081, 84487457, 84998503, 85519337, 86027329, 86067241, 86530621, 86999837, 87499651, 87694261,
88368853, 89308771, 90626185, 91433281, 91659283, 93431521, 93541537, 94316401, 94502701, 95451361, 95452781, 96618397,
96904081, 96925921, 97496449, 97796953, 97863529, 97924217, 99036001, 99115297, 99486889, 99789673, 100463443,
100618933, 100943201, 101270251, 101276579, 101649241, 102004421, 102678031, 102690677, 104078857, 104852881, 104857391];

        self.assert.equal(_check_two_and_even(new GMP.Integer(2)), 1, "2 is 2");
        self.assert.equal(_check_two_and_even(new GMP.Integer(20)), 0, "20 is even");
        self.assert.equal(_check_two_and_even(new GMP.Integer(1)), 0, "1 is not prime");

        self.assert.is_false(is_strong_pseudoprime(-1), "-1 is not a spsp");
        self.assert.is_false(is_strong_pseudoprime(0), "0 is not a spsp");
        self.assert.is_false(is_strong_pseudoprime(1), "1 is not a spsp");
        self.assert.is_true(is_strong_pseudoprime(2, 3), "2 is a spsp(3)");
        self.assert.is_true(is_strong_pseudoprime(3), "3 is a spsp");
        self.assert.is_false(is_strong_pseudoprime(4), "4 is not a spsp");
        self.assert.is_true(is_strong_pseudoprime(1093 * 1093), "1093 ** 2 is a spsp");
        self.assert.is_false(is_strong_pseudoprime(1000), "1000 is not a spsp");

        for(int i = 0; i < elements(spsp); i++)
            self.assert.is_true(is_strong_pseudoprime(spsp[i]), spsp[i]);
    }

    function test_is_strong_lucas_pseudoprime() {
        using Math.Primality._check_two_and_even;
        using Math.Primality._find_s_d;
        using Math.Primality._find_dqp_selfridge;
        using Math.Primality.is_strong_lucas_pseudoprime;

        self.assert.is_true(is_strong_lucas_pseudoprime(2), "is_strong_lucas_pseudoprime should return true for 2");

        self.assert.is_false(is_strong_lucas_pseudoprime(9), 'is_strong_lucas_pseudoprime deals with perfect squares');
        self.assert.is_false(is_strong_lucas_pseudoprime(16), 'is_strong_lucas_pseudoprime deals with perfect squares');
        self.assert.is_false(is_strong_lucas_pseudoprime(100), 'is_strong_lucas_pseudoprime deals with perfect squares');

        self.assert.equal(_check_two_and_even(new GMP.Integer(2)), 1, "_check_two_and_even(2) should return 1");
        self.assert.equal(_check_two_and_even(new GMP.Integer(20)), 0, "_check_two_and_even(20) should return 0");
        self.assert.equal(_check_two_and_even(new GMP.Integer(1)), 0, "_check_two_and_even(1) should return 0");

        // Check first five strong Lucas pseudoprimes.
        self.assert.is_true(is_strong_lucas_pseudoprime(5459),
            "is_strong_lucas_pseudoprime should return true for the first lucas pseudoprime");
        self.assert.is_true(is_strong_lucas_pseudoprime(5777),
            "is_strong_lucas_pseudoprime should return true for the second lucas pseudoprime");
        self.assert.is_true(is_strong_lucas_pseudoprime(10877),
            "is_strong_lucas_pseudoprime should return true for the third lucas pseudoprime");
        self.assert.is_true(is_strong_lucas_pseudoprime(16109),
            "is_strong_lucas_pseudoprime should return true for the fourth lucas pseudoprime");
        self.assert.is_true(is_strong_lucas_pseudoprime(18971),
            "is_strong_lucas_pseudoprime should return true for the fifth lucas pseudoprime");

        // Check random non-prime numbers.
        self.assert.is_false(is_strong_lucas_pseudoprime(5455),
            "is_strong_lucas_pseudoprime should not return true for a composite and non psuedoprime");
        self.assert.is_false(is_strong_lucas_pseudoprime(5781),
            "is_strong_lucas_pseudoprime should not return true for a composite and non psuedoprime");

        // Test internal methods.
        self.assert.equal(_find_dqp_selfridge(new GMP.Integer(1993)), [5, 1, -1],
            "_find_dpq_selfridge should return (5, 1, -1) for 1993");
        self.assert.equal(_find_dqp_selfridge(new GMP.Integer(1759)), [-11, 1, 3],
            "_find_dpq_selfridge should return (-11, 1, 3) for 1759");

        var sd = _find_s_d(new GMP.Integer(7));
        self.assert.equal(sd[0], 1, "_find_s_d should return 7 = 3 * 2^1 + 1");
        self.assert.equal(sd[1], new GMP.Integer(3), "_find_s_d should return 7 = 3 * 2^1 + 1");

        sd = _find_s_d(new GMP.Integer(17));
        self.assert.equal(sd[0], 4, "_find_s_d should return 17 = 1 * 2^4 + 1");
        self.assert.equal(sd[1], new GMP.Integer(1), "_find_s_d should return 17 = 1 * 2^4 + 1");

        sd = _find_s_d(new GMP.Integer(53525));
        self.assert.equal(sd[0], 2, "_find_s_d should return 53525 = 13381 * 2^2 + 1");
        self.assert.equal(sd[1], new GMP.Integer(13381), "_find_s_d should return 53525 = 13381 * 2^2 + 1");
    }

    function test_is_prime() {
        using Math.Primality.is_prime;

        self.assert.is_true(is_prime(2), "2 is prime");
        self.assert.is_false(is_prime(1), "1 is not prime");
        self.assert.is_false(is_prime(0), "0 is not prime");
        self.assert.is_false(is_prime(-1), "-1 is not prime");
        self.assert.is_false(is_prime(-2), "-2 is not prime");
        is_prime(20);
        return;
        self.assert.is_true(is_prime(20) == 0, "20 is not prime");



        var z = new GMP.Integer();
        for (int i = 2; i <= 20; i++) {
            mpz_ui_pow_ui(z, 2, i);
            self.assert.is_true(is_prime(z) == 0, sprintf("2**%d is not prime", [i]));
        }

        var smalls = [5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71,
            73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173,
            179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281,
            283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409,
            419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 541,
            547, 557, 563, 569, 571, 577, 587, 593, 599, 601, 607, 613, 617, 619, 631, 641, 643, 647, 653, 659,
            661, 673, 677, 683, 691, 701, 709, 719, 727, 733, 739, 743, 751, 757, 761, 769, 773, 787, 797, 809,
            811, 821, 823, 827, 829, 839, 853, 857, 859, 863, 877, 881, 883, 887, 907, 911, 919, 929, 937, 941,
            947, 953, 967, 971, 977, 983, 991, 997, 1009, 1013, 1019, 1021, 1031, 1033, 1039, 1049, 1051, 1061, 1063, 1069,
            1087, 1091, 1093, 1097, 1103, 1109, 1117, 1123, 1129, 1151, 1153, 1163, 1171, 1181, 1187, 1193, 1201, 1213, 1217, 1223,
            1229, 1231, 1237, 1249, 1259, 1277, 1279, 1283, 1289, 1291, 1297, 1301, 1303, 1307, 1319, 1321, 1327, 1361, 1367, 1373,
            1381, 1399, 1409, 1423, 1427, 1429, 1433, 1439, 1447, 1451, 1453, 1459, 1471, 1481, 1483, 1487, 1489, 1493, 1499, 1511,
            1523, 1531, 1543, 1549, 1553, 1559, 1567, 1571, 1579, 1583, 1597, 1601, 1607, 1609, 1613, 1619, 1621, 1627, 1637, 1657,
            1663, 1667, 1669, 1693, 1697, 1699, 1709, 1721, 1723, 1733, 1741, 1747, 1753, 1759, 1777, 1783, 1787, 1789, 1801, 1811,
            1823, 1831, 1847, 1861, 1867, 1871, 1873, 1877, 1879, 1889, 1901, 1907, 1913, 1931, 1933, 1949, 1951, 1973, 1979, 1987,
            1993, 1997, 1999, 2003, 2011, 2017, 2027, 2029, 2039, 2053, 2063, 2069, 2081, 2083, 2087, 2089, 2099, 2111, 2113, 2129,
            2131, 2137, 2141, 2143, 2153, 2161, 2179, 2203, 2207, 2213, 2221, 2237, 2239, 2243, 2251, 2267, 2269, 2273, 2281, 2287,
            2293, 2297, 2309, 2311, 2333, 2339, 2341, 2347, 2351, 2357, 2371, 2377, 2381, 2383, 2389, 2393, 2399, 2411, 2417, 2423,
            2437, 2441, 2447, 2459, 2467, 2473, 2477, 2503, 2521, 2531, 2539, 2543, 2549, 2551, 2557, 2579, 2591, 2593, 2609, 2617,
            2621, 2633, 2647, 2657, 2659, 2663, 2671, 2677, 2683, 2687, 2689, 2693, 2699, 2707, 2711, 2713, 2719, 2729, 2731, 2741,
            2749, 2753, 2767, 2777, 2789, 2791, 2797, 2801, 2803, 2819, 2833, 2837, 2843, 2851, 2857, 2861, 2879, 2887, 2897, 2903,
            2909, 2917, 2927, 2939, 2953, 2957, 2963, 2969, 2971, 2999, 3001, 3011, 3019, 3023, 3037, 3041, 3049, 3061, 3067, 3079,
            3083, 3089, 3109, 3119, 3121, 3137, 3163, 3167, 3169, 3181, 3187, 3191, 3203, 3209, 3217, 3221, 3229, 3251, 3253, 3257,
            3259, 3271, 3299, 3301, 3307, 3313, 3319, 3323, 3329, 3331, 3343, 3347, 3359, 3361, 3371, 3373, 3389, 3391, 3407, 3413,
            3433, 3449, 3457, 3461, 3463, 3467, 3469, 3491, 3499, 3511, 3517, 3527, 3529, 3533, 3539, 3541];

        for (int i = 0; i < elements(smalls); i++)
            self.assert.is_true(is_prime(smalls[i]) != 0, sprintf("%d is a prime", [smalls[i]]));

        var carmichael = [561, 1105, 1729, 2465, 2821, 6601, 8911,
                          10585, 15841, 29341, 41041, 46657, 52633,
                          62745, 63973, 75361, 101101, new GMP.Integer("999838193331601"), new GMP.Integer("999840927672001"),
                          new GMP.Integer("999851057445241"), new GMP.Integer("999878556600001"),
                          new GMP.Integer("999885684921481"), new GMP.Integer("999895175363161"),
                          new GMP.Integer("999902676805201"), new GMP.Integer("999907821232321"),
                          new GMP.Integer("999919121100481"), new GMP.Integer("999922265173441")];

        for (int i = 0; i < elements(carmichael); i++)
            self.assert.is_true(is_prime(carmichael[i]) == 0, sprintf("Carmichael number %d is not prime", [carmichael[i]]));

        var psps = [341, 561, 645, 1105, 1387, 1729, 1905, 2047,
                    2465, 2701, 2821, 3277, 4033, 4369, 4371,
                    4681, 5461, 6601, 7957, 8321];

        for (int i = 0; i < elements(psps); i++)
            self.assert.is_true(is_prime(psps[i]) == 0, sprintf("Pseudoprime %d (base 2) is not prime", [psps[i]]));
    }
}

function main[main]() {
    using Rosella.Test.test;
    test(class Test_parrot_math_primality);
}
