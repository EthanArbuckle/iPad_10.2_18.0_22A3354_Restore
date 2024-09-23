@implementation PFPseudoRandomNumberGenerator

- (PFPseudoRandomNumberGenerator)init
{
  return -[PFPseudoRandomNumberGenerator initWithSeed:](self, "initWithSeed:", 0);
}

- (PFPseudoRandomNumberGenerator)initWithSeed:(unint64_t)a3
{
  PFPseudoRandomNumberGenerator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFPseudoRandomNumberGenerator;
  v4 = -[PFPseudoRandomNumberGenerator init](&v6, sel_init);
  -[PFPseudoRandomNumberGenerator setSeed:](v4, "setSeed:", a3);
  return v4;
}

- (unint64_t)nextUnsignedIntegerLessThan:(unint64_t)a3
{
  double v4;
  double v5;
  double v6;

  if (!a3)
    return 0;
  v4 = (double)a3;
  -[PFPseudoRandomNumberGenerator _next](self, "_next");
  v6 = v5 * v4;
  if (v6 >= (double)(a3 - 1))
    return (unint64_t)(double)(a3 - 1);
  return (unint64_t)v6;
}

- (double)_next
{
  uint32x2_t v2;

  v2 = vsra_n_u32((uint32x2_t)vmul_s32((int32x2_t)vand_s8(*(int8x8_t *)&self->_z, (int8x8_t)0xFFFF0000FFFFLL), (int32x2_t)0x465000009069), *(uint32x2_t *)&self->_z, 0x10uLL);
  *(uint32x2_t *)&self->_z = v2;
  return (double)(v2.i32[1] + (v2.i32[0] << 16)) * 2.32830644e-10;
}

- (unint64_t)seed
{
  return *(_QWORD *)&self->_z;
}

- (void)setSeed:(unint64_t)a3
{
  *(_QWORD *)&self->_z = a3;
  if ((_DWORD)a3)
  {
    if (HIDWORD(a3))
      return;
LABEL_5:
    self->_w = 1;
    return;
  }
  self->_z = 1;
  if (!HIDWORD(a3))
    goto LABEL_5;
}

@end
