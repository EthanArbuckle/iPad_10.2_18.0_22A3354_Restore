@implementation UIEditMenuConfiguration._Boxed

- (id)copyWithZone:(void *)a3
{
  id result;
  __int128 v4;
  _OWORD v5[2];
  uint64_t v6;

  sub_1850F28CC((uint64_t)self->value, (uint64_t)v5);
  _s6_BoxedCMa();
  result = (id)swift_allocObject();
  v4 = v5[1];
  *((_OWORD *)result + 1) = v5[0];
  *((_OWORD *)result + 2) = v4;
  *((_QWORD *)result + 6) = v6;
  return result;
}

@end
