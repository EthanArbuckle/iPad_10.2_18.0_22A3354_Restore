@implementation PAEFracturedTransition_Extend

- (PAEFracturedTransition_Extend)initWithAPIManager:(id)a3
{
  PAEFracturedTransition_Extend *result;
  FracturedParams *fxParams;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PAEFracturedTransition_Extend;
  result = -[PAEFracturedTransition initWithAPIManager:](&v10, sel_initWithAPIManager_, a3);
  if (result)
  {
    fxParams = result->super._fxParams;
    fxParams->var0 = 1;
    fxParams->var1 = 25.0;
    *(_QWORD *)&fxParams->var11 = 0x400000003F800000;
    fxParams->var3 = 14;
    fxParams->var2 = 0;
    *(_QWORD *)&fxParams->var19 = 0x13F800000;
    fxParams->var16 = 0.08;
    fxParams->var14 = 0;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)fxParams->var15 = _Q0;
    *(_OWORD *)&fxParams->var15[2] = _Q0;
    *(_DWORD *)&fxParams->var4 = 16777217;
    fxParams->var10 = 5;
    *(_QWORD *)&fxParams->var8 = 0x3F80000000000000;
    fxParams->var24 = 1;
    fxParams->var21 = 1;
    *(_QWORD *)&fxParams->var22 = 0x424000003E99999ALL;
  }
  return result;
}

@end
