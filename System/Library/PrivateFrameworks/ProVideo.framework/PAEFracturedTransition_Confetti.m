@implementation PAEFracturedTransition_Confetti

- (PAEFracturedTransition_Confetti)initWithAPIManager:(id)a3
{
  PAEFracturedTransition_Confetti *result;
  FracturedParams *fxParams;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PAEFracturedTransition_Confetti;
  result = -[PAEFracturedTransition initWithAPIManager:](&v10, sel_initWithAPIManager_, a3);
  if (result)
  {
    fxParams = result->super._fxParams;
    fxParams->var0 = 1;
    fxParams->var1 = 41.0;
    *(_QWORD *)&fxParams->var11 = 0x3EFAE1483F800000;
    fxParams->var3 = 10;
    fxParams->var2 = 1;
    *(_QWORD *)&fxParams->var19 = 0;
    fxParams->var16 = 1.0;
    fxParams->var14 = 1;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)fxParams->var15 = _Q0;
    *(_OWORD *)&fxParams->var15[2] = _Q0;
    *(_DWORD *)&fxParams->var4 = 65793;
    fxParams->var10 = 2;
    *(_QWORD *)&fxParams->var8 = 0x3F80000000000000;
    fxParams->var21 = 0;
    fxParams->var22 = 0.21;
  }
  return result;
}

@end
