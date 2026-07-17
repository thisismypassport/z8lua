
assert(max(4, 7) == 7, 1)
assert(max(-3, -6) == -3, 1.1)
assert(max(0x7000, 0x8000) == 0x7000, 1.3) -- overflow
assert(max(-3) == 0, 1.4)
assert(max(0.5, true) == 0.5, 1.5)

assert(min(4, 7) == 4, 2)
assert(min(-3, -6) == -6, 2.1)
assert(min(3, "2") == 2, 2.3)
assert(min(-3) == -3, 2.4)
assert(min(0.5, true) == 0, 2.5)

assert(mid(1, 4, 7) == 4, 3)
assert(mid(4, 1, 7) == 4, 3.1)
assert(mid(1, 7, 4) == 4, 3.2)
assert(mid(7, 1, 4) == 4, 3.3)
assert(mid(4, 7, 1) == 4, 3.4)
assert(mid(7, 4, 1) == 4, 3.5)
assert(mid({}, nil, "9") == 0, 3.6)

assert(abs(5) == 5, 4)
assert(abs(-5.2) == 5.2, 4.1)
assert(abs(0x8000) == 0x7fff.ffff, 4.2)

assert(atan2(1,3) == 0x.cd19, 5)
assert(atan2(3.2,1.3) == 0x.f04b, 5.1)

assert(sin(1.2) == -0x.f37a, 6)
assert(sin(9) == 0, 6.1)
assert(cos(1.2) == 0x.4f17, 6.2)

assert(sqrt(44) == 0x6.a21c, 7)
assert(sqrt(-44) == 0, 7.1)

assert(band(0xf0f0.0f0f, "0x1234.5678") == 0x1030.0608, 8)
assert(bor(0xf0f0.0f0f, "0x1234.5678") == 0xf2f4.5f7f, 8.1)
assert(bxor(0xf0f0.0f0f, "0x1234.5678") == 0xe2c4.5977, 8.2)
assert(bnot(0xf0f0.0f0f) == 0xf0f.f0f, 8.3)

assert(flr(-3.7) == -4, 9)
assert(flr(3.7) == 3, 9.1)
assert(ceil(-3.3) == -3, 9.2)
assert(ceil(3.3) == 4, 9.3)

assert(shl(1, 4) == 0x10, 10)
assert(shl(1, -4) == 0x.1, 10.1)
assert(shl(0x1234.5678, 16) == 0x5678, 10.2)

assert(shr(0x1234.5678, 16) == 0x.1234, 11)
assert(shr(0x9876.5432, 16) == 0xffff.9876, 11.1)
assert(lshr(0x1234.5678, "16") == 0x.1234, 11.2)
assert(lshr(0x9876.5432, "16") == 0x.9876, 11.3)

assert(rotl(0x1234.5678, 4) == 0x2345.6781, 12)
assert(rotr(0x1234.5678, 4) == 0x8123.4567, 12.1)

assert(sgn(4.5) == 1, 13)
assert(sgn(-4.5) == -1, 13.1)
assert(sgn(0) == 1, 13.2)

-- intentionally not implemented:
--   rnd/srand
