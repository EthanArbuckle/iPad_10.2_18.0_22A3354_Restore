@implementation PAEFracturedTransition_Shatter

- (PAEFracturedTransition_Shatter)initWithAPIManager:(id)a3
{
  PAEFracturedTransition_Shatter *result;
  FracturedParams *fxParams;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PAEFracturedTransition_Shatter;
  result = -[PAEFracturedTransition initWithAPIManager:](&v11, sel_initWithAPIManager_, a3);
  if (result)
  {
    fxParams = result->super._fxParams;
    fxParams->var0 = 1;
    fxParams->var1 = 38.0;
    __asm { FMOV            V0.2S, #1.0 }
    *(_QWORD *)&fxParams->var11 = _D0;
    fxParams->var3 = 10;
    fxParams->var2 = 0;
    *(_QWORD *)&fxParams->var19 = 0x100000000;
    fxParams->var16 = 1.38;
    fxParams->var14 = 0;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)fxParams->var15 = _Q0;
    *(_OWORD *)&fxParams->var15[2] = _Q0;
    *(_DWORD *)&fxParams->var4 = 1;
    fxParams->var10 = 4;
    *(_QWORD *)&fxParams->var8 = 0x3F8000003F3851ECLL;
    fxParams->var24 = 1;
    fxParams->var21 = 0;
    *(_QWORD *)&fxParams->var22 = 0x412000003DCCCCCDLL;
  }
  return result;
}

@end
