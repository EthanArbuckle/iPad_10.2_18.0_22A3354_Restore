@implementation PAETransitionDefaultBase

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInputA:(id *)a5 withInputB:(id *)a6 withTimeFraction:(float)a7 withInfo:(id *)a8
{
  unint64_t var0;
  unint64_t var1;

  var0 = a5->var0;
  if (a5->var0 <= a6->var0)
    var0 = a6->var0;
  *a3 = var0;
  var1 = a5->var1;
  if (var1 <= a6->var1)
    var1 = a6->var1;
  *a4 = var1;
  return 1;
}

- (BOOL)frameSetup:(id *)a3 inputInfoA:(id *)a4 inputInfoB:(id *)a5 timeFraction:(float)a6 hardware:(BOOL *)a7 software:(BOOL *)a8
{
  *a7 = 1;
  *a8 = 1;
  return 1;
}

- (BOOL)finishInitialSetup:(id *)a3
{
  if (a3)
    *a3 = 0;
  return a3 != 0;
}

- (BOOL)addParameters
{
  double v2;

  LODWORD(v2) = 1112014848;
  return -[PAETransitionDefaultBase addEaseParametersWithDefault:andFlags:](self, "addEaseParametersWithDefault:andFlags:", 2, v2);
}

- (BOOL)addEaseParametersWithDefault:(float)a3 andFlags:(unsigned int)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  void *v9;

  v4 = *(_QWORD *)&a4;
  v7 = (void *)-[PROAPIAccessing apiForProtocol:](self->super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v7)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Transition::Ease In"), 0, 0), objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Transition::Ease Out"), 0, 0), objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Transition::Ease In Out"), 0, 0), 0);
    objc_msgSend(v7, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Transition::Ease Type"), 0, 0), 50, 2, v9, v4 | 1);

    objc_msgSend(v7, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Transition::Ease Amount"), 0, 0), 51, v4, a3, 0.0, 100.0, 0.0, 100.0, 1.0);
    *(&self->super._hostIsVertigo + 1) = 1;
  }
  return v7 != 0;
}

- (BOOL)addMotionBlurParameters
{
  void *v3;
  void *v4;

  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Transition::Motion Blur"), 0, 0), 52, 1, 3);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Transition::Shutter Angle"), 0, 0), 53, 2, 180.0, 0.0, 360.0, 0.0, 360.0, 1.0);
    *(&self->super._hostIsVertigo + 2) = 1;
  }
  return v3 != 0;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  return 1;
}

- (BOOL)convertTimeFraction:(double)a3 toLocal:(double *)a4 andDerivative:(double *)a5 atTime:(id)a6
{
  double *v9;
  _BOOL4 v10;
  double v12;
  double v13;

  if (*(&self->super._hostIsVertigo + 1))
  {
    v12 = 0.0;
    v13 = 0.0;
    v10 = -[PAETransitionDefaultBase getEaseIn:easeOut:atTime:](self, "getEaseIn:easeOut:atTime:", &v13, &v12, a6.var1);
    if (v10)
      PCMath::easeInOut(a4, a3, v13, v12, 0.0, 1.0, a5, v9);
  }
  else
  {
    if (a4)
      *a4 = a3;
    if (a5)
      *a5 = 1.0;
    LOBYTE(v10) = 1;
  }
  return v10;
}

- (BOOL)getEaseIn:(double *)a3 easeOut:(double *)a4 atTime:(id)a5
{
  void *v8;
  void *v9;
  int v10;
  double v11;
  double v12;
  double v14;
  int v15;

  *a4 = 0.0;
  *a3 = 0.0;
  if (*(&self->super._hostIsVertigo + 1))
  {
    v8 = (void *)-[PROAPIAccessing apiForProtocol:](self->super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
    if (v8)
    {
      v9 = v8;
      v15 = 0;
      v14 = 0.0;
      v10 = objc_msgSend(v8, "getIntValue:fromParm:atFxTime:", &v15, 50, a5.var1);
      LODWORD(v8) = v10 & objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v14, 51, a5.var1);
      if ((_DWORD)v8 == 1)
      {
        v11 = v14 / 100.0;
        switch(v15)
        {
          case 0:
            v12 = v14 / 100.0;
            v11 = 0.0;
            goto LABEL_11;
          case 2:
            v12 = v11 * 0.5;
            v11 = v11 * 0.5;
            goto LABEL_11;
          case 1:
            v12 = 0.0;
LABEL_11:
            *a3 = v12;
            *a4 = v11;
            break;
        }
      }
    }
  }
  else
  {
    LOBYTE(v8) = 1;
  }
  return (char)v8;
}

- (double)relativeShutterAtTime:(id)a3
{
  double v3;
  void *v6;
  void *v7;
  double v8;
  double v10;
  char v11;

  v3 = 0.0;
  if (*(&self->super._hostIsVertigo + 2))
  {
    v6 = (void *)-[PROAPIAccessing apiForProtocol:](self->super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
    if (v6)
    {
      v7 = v6;
      v11 = 0;
      objc_msgSend(v6, "getBoolValue:fromParm:atFxTime:", &v11, 52, a3.var1);
      if (v11)
      {
        v10 = 0.0;
        objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v10, 53, a3.var1);
        -[PAESharedDefaultBase relativeShutterForAngle:](self, "relativeShutterForAngle:", v10);
        return v8;
      }
    }
  }
  return v3;
}

- (BOOL)renderOutput:(id)a3 withInputA:(id)a4 withInputB:(id)a5 withTimeFraction:(float)a6 withInfo:(id *)a7
{
  __int128 v7;
  _OWORD v9[3];

  v7 = *(_OWORD *)&a7->var2;
  v9[0] = *(_OWORD *)&a7->var0.var0;
  v9[1] = v7;
  v9[2] = *(_OWORD *)&a7->var4;
  return -[PAETransitionDefaultBase canThrowRenderOutput:withInputA:withInputB:withTimeFraction:withInfo:](self, "canThrowRenderOutput:withInputA:withInputB:withTimeFraction:withInfo:", a3, a4, a5, v9);
}

- (BOOL)canThrowRenderOutput:(id)a3 withInputA:(id)a4 withInputB:(id)a5 withTimeFraction:(float)a6 withInfo:(id *)a7
{
  _BOOL4 v12;
  double v13;
  double v14;
  __int128 v15;
  _OWORD v17[3];
  double v18;
  double v19;

  v18 = 0.0;
  v19 = 0.0;
  v12 = -[PAETransitionDefaultBase convertTimeFraction:toLocal:andDerivative:atTime:](self, "convertTimeFraction:toLocal:andDerivative:atTime:", &v19, &v18, a7->var0.var1, a6);
  if (v12)
  {
    HIDWORD(v14) = HIDWORD(v18);
    HIDWORD(v13) = HIDWORD(v19);
    *(float *)&v13 = v19;
    *(float *)&v14 = v18;
    v15 = *(_OWORD *)&a7->var2;
    v17[0] = *(_OWORD *)&a7->var0.var0;
    v17[1] = v15;
    v17[2] = *(_OWORD *)&a7->var4;
    LOBYTE(v12) = -[PAETransitionDefaultBase canThrowRenderOutput:withInputA:withInputB:withTimeFraction:withSpeed:withInfo:](self, "canThrowRenderOutput:withInputA:withInputB:withTimeFraction:withSpeed:withInfo:", a3, a4, a5, v17, v13, v14);
  }
  return v12;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInputA:(id)a4 withInputB:(id)a5 withTimeFraction:(float)a6 withSpeed:(float)a7 withInfo:(id *)a8
{
  return 0;
}

- (BOOL)isFrontGap
{
  void *v3;
  char v4;

  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super._apiManager, "apiForProtocol:", &unk_1EF0B64E0);
  v4 = objc_msgSend(v3, "isGapBefore:", self);
  return objc_msgSend(v3, "isAtStartofStoryline:", self) | v4;
}

- (BOOL)isEndGap
{
  void *v3;
  char v4;

  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super._apiManager, "apiForProtocol:", &unk_1EF0B64E0);
  v4 = objc_msgSend(v3, "isGapAfter:", self);
  return objc_msgSend(v3, "isAtEndofStoryline:", self) | v4;
}

- (BOOL)versionSupportsHDRWhiteLevel
{
  return 0;
}

- (BOOL)addHDRWhiteLevelParameter
{
  return objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](self->super._apiManager, "apiForProtocol:", &unk_1EF0A41C0), "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("PAETransitionDefaultBase::HDRWhiteLevel"), 0, 0), 18, 1, 0.949999988, 0.5, 1.0, 0.5, 1.0, 0.01);
}

- (BOOL)showHideHDRWhiteLevelParameterForColorModel:(id)a3
{
  void *v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  unsigned int v11;

  v5 = (void *)-[PROAPIAccessing apiForProtocol:](self->super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v6 = (void *)-[PROAPIAccessing apiForProtocol:](self->super._apiManager, "apiForProtocol:", &unk_1EF0A7268);
  v7 = objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](self->super._apiManager, "apiForProtocol:", &unk_1EF0B6540), "shouldDisableDRTandHideWhiteLevel");
  v11 = 0;
  v8 = objc_msgSend(v5, "getParameterFlags:fromParm:", &v11, 18);
  if (v8)
  {
    if (objc_msgSend(a3, "isEqualToString:", kFxColorSpaceChange_HDR) ^ 1 | v7)
      v9 = 131074;
    else
      v9 = 0;
    v11 = v11 & 0xFFFDFFFD | v9;
    objc_msgSend(v6, "setParameterFlags:toParm:");
  }
  return v8;
}

- (BOOL)disableHDRWhiteLevelParameter:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  unsigned int v11;

  v3 = a3;
  v5 = (void *)-[PROAPIAccessing apiForProtocol:](self->super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v6 = (void *)-[PROAPIAccessing apiForProtocol:](self->super._apiManager, "apiForProtocol:", &unk_1EF0A7268);
  v7 = objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](self->super._apiManager, "apiForProtocol:", &unk_1EF0B6540), "shouldDisableDRTandHideWhiteLevel");
  v11 = 0;
  v8 = objc_msgSend(v5, "getParameterFlags:fromParm:", &v11, 18);
  if (v8)
  {
    if (v3 | v7)
      v9 = 4;
    else
      v9 = 0;
    v11 = v11 & 0xFFFFFFFB | v9;
    objc_msgSend(v6, "setParameterFlags:toParm:");
  }
  return v8;
}

- (BOOL)applyHDRWhiteLevelForRed:(double *)a3 green:(double *)a4 blue:(double *)a5 inColorSpace:(CGColorSpace *)a6
{
  void *v10;
  BOOL v11;
  PCColorUtil *v12;
  int32x2_t v13;
  double WhiteGainForHLGLevel;
  float v15;
  float v16;
  float v17;
  CGColorSpace *v18;
  uint64_t v20;
  float v21;
  float v22;
  uint64_t v23;
  PCColor v24;
  double v25;
  __int128 v26;
  uint64_t v27;
  int v28;

  v10 = (void *)-[PROAPIAccessing apiForProtocol:](self->super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v28 = 0;
  v11 = 0;
  if (objc_msgSend(v10, "getParameterFlags:fromParm:", &v28, 18))
  {
    if ((v28 & 2) != 0)
    {
      return 1;
    }
    else
    {
      v26 = *MEMORY[0x1E0CA2E68];
      v27 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      v25 = 0.0;
      v12 = (PCColorUtil *)objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v25, 18, &v26);
      v11 = (char)v12;
      if ((_DWORD)v12)
      {
        v13.i32[1] = HIDWORD(v25);
        *(float *)v13.i32 = v25;
        WhiteGainForHLGLevel = PCColorUtil::getWhiteGainForHLGLevel(v12, v13);
        v15 = *(float *)&WhiteGainForHLGLevel;
        *(float *)&WhiteGainForHLGLevel = *a3;
        v16 = *a4;
        v17 = *a5;
        PCColor::PCColor(&v24, *(float *)&WhiteGainForHLGLevel, v16, v17, a6);
        v18 = PCGetNCLCColorSpace((unsigned int *)&kPCNCLC_Rec2020Linear);
        v23 = 0;
        v22 = 0.0;
        PCColor::getRGB(&v24, (float *)&v23 + 1, (float *)&v23, &v22, v18);
        *(float *)&v23 = v15 * *(float *)&v23;
        *((float *)&v23 + 1) = v15 * *((float *)&v23 + 1);
        v22 = v15 * v22;
        v21 = 0.0;
        v20 = 0;
        PCColor::setRGB(&v24, *((float *)&v23 + 1), *(float *)&v23, v22, v18);
        PCColor::getRGB(&v24, &v21, (float *)&v20 + 1, (float *)&v20, a6);
        *a3 = v21;
        *a4 = *((float *)&v20 + 1);
        *a5 = *(float *)&v20;
        PCCFRef<CGColorSpace *>::~PCCFRef(&v24.var1._obj);
      }
    }
  }
  return v11;
}

- (BOOL)applyHDRWhiteLevelForRGBComponents:(double *)a3 inColorSpace:(CGColorSpace *)a4
{
  return -[PAETransitionDefaultBase applyHDRWhiteLevelForRed:green:blue:inColorSpace:](self, "applyHDRWhiteLevelForRed:green:blue:inColorSpace:", a3, a3 + 1, a3 + 2, a4);
}

@end
