@implementation PAEStroke

- (PAEStroke)initWithAPIManager:(id)a3
{
  PAEStroke *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEStroke;
  result = -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
  result->_thresholdDefault = 0.5001;
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PAEStroke;
  -[PAESharedDefaultBase dealloc](&v2, sel_dealloc);
}

- (id)properties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("MayRemapTime"), v5, CFSTR("SupportsHeliumRendering"), v6, CFSTR("PixelTransformSupport"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAEStroke;
  -[PAESharedDefaultBase addParameters](&v6, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::Type"), 0, 0), 1, 0, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::Color"), 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::Gradient"), 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::OutlineGradient"), 0, 0), 0), 1);
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:defaultAlpha:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::OutlineColor"), 0, 0), 2, 0, 1.0, 0.0, 0.0, 1.0);
    objc_msgSend(v3, "addGradientPositionedWithName:parmId:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::Gradient"), 0, 0), 3, 2);
    objc_msgSend(v3, "setGradientHiddenWithOSC:toParam:", 1, 3);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::Width"), 0, 0), 4, 0, 10.0, 1.0, 300.0, 1.0, 100.0, 1.0);
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::Position"), 0, 0), 5, 0, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::Outside"), 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::Centered"), 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::Inside"), 0, 0), 0), 1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::Offset"), 0, 0), 6, 0, 0.0, -500.0, 300.0, -100.0, 100.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::Threshold"), 0, 0), 7, 0, self->_thresholdDefault, 0.0, 1.0, 0.0, 1.0, 0.01);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Hidden::ThresholdChanged"), 0, 0), 14, 0, 2);
    objc_msgSend(v3, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::FadeInside"), 0, 0), 8, 0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.01);
    objc_msgSend(v3, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::FadeOutside"), 0, 0), 9, 0, 0.0, 0.0, 1.0, 0.0, 1.0, 0.01);
    objc_msgSend(v3, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::FadeWidth"), 0, 0), 13, 0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.01);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::FadeFalloff"), 0, 0), 10, 0, 0.0, -100.0, 100.0, -100.0, 100.0, 0.1);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::Hide"), 0, 0), 12, 0, 33);
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::BlendMode"), 0, 0), 11, 0, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::NormalMode"), 0, 0), CFSTR("-"), objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::SubtractMode"), 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::DarkenMode"), 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::MultiplyMode"), 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::ColorBurnMode"), 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::LinearBurnMode"), 0, 0), CFSTR("-"), objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::AddMode"), 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::LightenMode"), 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::ScreenMode"), 0, 0),
        objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::ColorDodgeMode"), 0, 0),
        objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::LinearDodgeMode"), 0, 0),
        CFSTR("-"),
        objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::OverlayMode"), 0, 0),
        objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::SoftLightMode"), 0, 0),
        objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::HardLightMode"), 0, 0),
        objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::VividLightMode"), 0, 0),
        objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::LinearLightMode"), 0, 0),
        objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::PinLightMode"), 0, 0),
        objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::HardMixMode"), 0, 0),
        CFSTR("-"),
        objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::DifferenceMode"), 0, 0),
        objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Stroke::ExclusionMode"), 0, 0),
        0),
      1);
  }
  return v3 != 0;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  void *v11;
  double v12;
  int v13;
  double thresholdDefault;
  double v15;
  uint64_t v16;
  unsigned int *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;
  int v23;
  int v24;
  uint64_t v25;
  double v26;
  unsigned __int8 v27;
  __int128 v28;
  uint64_t v29;

  v5 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v6 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A7268);
  v7 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0B6420);
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8 || v7 == 0)
    return 0;
  v11 = (void *)v7;
  v28 = *MEMORY[0x1E0CA2E68];
  v29 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v27 = 0;
  objc_msgSend(v5, "getBoolValue:fromParm:atFxTime:", &v27, 14, &v28);
  v26 = 0.0;
  objc_msgSend(v5, "getFloatValue:fromParm:atFxTime:", &v26, 7, &v28);
  v13 = v27;
  if (a3 == 7 && v27)
  {
    v12 = v26;
    if (v26 != self->_thresholdDefault)
      goto LABEL_34;
    objc_msgSend(v6, "setBoolValue:toParm:atFxTime:", 0, 14, &v28, v26);
    LODWORD(v25) = 0;
    objc_msgSend(v5, "getIntValue:fromParm:atFxTime:", &v25, 5, &v28);
    if ((_DWORD)v25)
    {
      if ((_DWORD)v25 == 2)
      {
        thresholdDefault = 0.0;
      }
      else
      {
        if ((_DWORD)v25 != 1)
        {
LABEL_20:
          v13 = v27;
          goto LABEL_21;
        }
        thresholdDefault = 1.0;
      }
    }
    else
    {
      thresholdDefault = self->_thresholdDefault;
    }
    objc_msgSend(v6, "setFloatValue:toParm:atFxTime:", 7, &v28, thresholdDefault);
    goto LABEL_20;
  }
LABEL_21:
  if (a3 != 7 || v13)
  {
    if (a3 != 5 || v13)
      goto LABEL_34;
    LODWORD(v25) = 0;
    objc_msgSend(v5, "getIntValue:fromParm:atFxTime:", &v25, 5, &v28);
    if ((_DWORD)v25)
    {
      if ((_DWORD)v25 == 2)
      {
        v15 = 0.0;
      }
      else
      {
        if ((_DWORD)v25 != 1)
          goto LABEL_34;
        v15 = 1.0;
      }
    }
    else
    {
      v15 = self->_thresholdDefault;
    }
    objc_msgSend(v6, "setFloatValue:toParm:atFxTime:", 7, &v28, v15);
  }
  else
  {
    v12 = v26;
    if (v26 != self->_thresholdDefault)
      objc_msgSend(v6, "setBoolValue:toParm:atFxTime:", 1, 14, &v28, v26);
  }
LABEL_34:
  v25 = 0;
  objc_msgSend(v11, "keyframeCount:forParam:andChannel:", &v25, 7, 0, v12);
  if (v25)
    objc_msgSend(v6, "setBoolValue:toParm:atFxTime:", 1, 14, &v28);
  if (a3 == 12)
  {
    LOBYTE(v23) = 0;
    objc_msgSend(v5, "getBoolValue:fromParm:atFxTime:", &v23, 12, &v28);
    v24 = 0;
    objc_msgSend(v5, "getParameterFlags:fromParm:", &v24, 11);
    v18 = v24 & 0xFFFFFFFD | (2 * v23);
    v19 = v6;
    v20 = 11;
LABEL_47:
    objc_msgSend(v19, "setParameterFlags:toParm:", v18, v20);
    return 1;
  }
  if (a3 == 1)
  {
    v24 = 0;
    objc_msgSend(v5, "getIntValue:fromParm:atFxTime:", &v24, 1, &v28);
    v22 = 0;
    v23 = 0;
    objc_msgSend(v5, "getParameterFlags:fromParm:", &v23, 2);
    objc_msgSend(v5, "getParameterFlags:fromParm:", &v22, 3);
    switch(v24)
    {
      case 2:
        objc_msgSend(v5, "setGradientHiddenWithOSC:toParam:", 0, 3);
        v21 = v22 & 0xFFFFFFDD | 0x20;
        break;
      case 1:
        objc_msgSend(v5, "setGradientHiddenWithOSC:toParam:", 0, 3);
        v21 = v22 & 0xFFFFFFDD;
        break;
      case 0:
        v16 = 3;
        objc_msgSend(v5, "setGradientHiddenWithOSC:toParam:", 1, 3);
        objc_msgSend(v6, "setParameterFlags:toParm:", v23 & 0xFFFFFFFD, 2);
        v17 = &v22;
LABEL_46:
        v18 = *v17 | 2;
        v19 = v6;
        v20 = v16;
        goto LABEL_47;
      default:
        return 0;
    }
    v22 = v21;
    objc_msgSend(v6, "setParameterFlags:toParm:");
    v16 = 2;
    v17 = (unsigned int *)&v23;
    goto LABEL_46;
  }
  return 1;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  PAEStroke *v6;
  PAEStroke *v11;
  float v12;
  float v13;
  float v14;
  float v15;
  unint64_t var1;
  signed int v17;
  double v19;
  int v20;
  double v21;

  v6 = self;
  LOBYTE(self) = 0;
  if (a3)
  {
    if (a4)
    {
      self = (PAEStroke *)-[PROAPIAccessing apiForProtocol:](v6->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
      if (self)
      {
        v11 = self;
        v21 = 0.0;
        -[PAEStroke getFloatValue:fromParm:atFxTime:](self, "getFloatValue:fromParm:atFxTime:", &v21, 4, a6->var0.var1);
        v20 = 0;
        -[PAEStroke getIntValue:fromParm:atFxTime:](v11, "getIntValue:fromParm:atFxTime:", &v20, 5, a6->var0.var1);
        v19 = 0.0;
        -[PAEStroke getFloatValue:fromParm:atFxTime:](v11, "getFloatValue:fromParm:atFxTime:", &v19, 6, a6->var0.var1);
        v12 = v21 * -0.5;
        if (v20 != 1)
          v12 = 0.0;
        v13 = v21;
        v14 = -v13;
        if (v20 == 2)
          v12 = v14;
        v15 = v21 + v19 + v12;
        if (v15 > 0.0)
        {
          var1 = a5->var1;
          v17 = 2 * vcvtps_s32_f32(v15);
          *a3 = a5->var0 + v17;
          *a4 = var1 + v17;
        }
        LOBYTE(self) = 1;
      }
    }
  }
  return (char)self;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  HGXForm *v12;
  HGXForm *v13;
  double v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v21;
  float v22;
  float v23;
  HMaskAlpha *v24;
  float v25;
  HMaskAlpha *v26;
  float v27;
  HGMPSImageEDT *v28;
  char *v29;
  char *v30;
  HGMPSImageEDT *v31;
  char *v32;
  char *v33;
  HgcReconstructDT *v34;
  char *v35;
  char *v36;
  HgcReconstructDT *v37;
  char *v38;
  char *v39;
  float v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int *v48;
  int v49;
  HGBitmapLoader *v50;
  HgcOutlineGradientStroke *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  HGGradient *v58;
  float v59;
  HGSolidColor *v60;
  float v61;
  float v62;
  float v63;
  float v64;
  __n128 v65;
  __n128 v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
  HgcSimpleAdd *v72;
  char *v73;
  char *v74;
  HgcReconstructDT *v75;
  float v76;
  float v77;
  float v78;
  float v79;
  HGXForm *v80;
  uint64_t v81;
  HGHWBlendFlipped *v82;
  HMaskAlpha *v84;
  HMaskAlpha *v85;
  void *v86;
  _BYTE v88[144];
  _BYTE v89[144];
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  HGXForm *v98;
  HGXForm *v99;
  int v100;
  char v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  int v108;
  double v109;
  int v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  int v119[3];

  v8 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v9 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  v10 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A2958);
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (v11)
  {
    LOBYTE(v12) = 0;
    return (char)v12;
  }
  v86 = (void *)v10;
  LOBYTE(v12) = 0;
  if (objc_msgSend(a4, "imageType") == 3 && v86)
  {
    v119[0] = 0;
    objc_msgSend(v8, "getIntValue:fromParm:atFxTime:", v119, 1, a5->var0.var1);
    v117 = 0.0;
    v118 = 0.0;
    v115 = 0.0;
    v116 = 0.0;
    objc_msgSend(v8, "getRedValue:greenValue:blueValue:alphaValue:fromParm:atFxTime:", &v118, &v117, &v116, &v115, 2, a5->var0.var1);
    v113 = 0.0;
    v114 = 0.0;
    v111 = 0.0;
    v112 = 0.0;
    v110 = 0;
    objc_msgSend(v8, "getGradientStartEnd:startY:endX:endY:type:fromParm:atFxTime:", &v114, &v113, &v112, &v111, &v110, 3, a5->var0.var1);
    v109 = 0.0;
    objc_msgSend(v8, "getFloatValue:fromParm:atFxTime:", &v109, 4, a5->var0.var1);
    v108 = 0;
    objc_msgSend(v8, "getIntValue:fromParm:atFxTime:", &v108, 5, a5->var0.var1);
    v107 = 0.0;
    objc_msgSend(v8, "getFloatValue:fromParm:atFxTime:", &v107, 6, a5->var0.var1);
    v106 = 0.0;
    objc_msgSend(v8, "getFloatValue:fromParm:atFxTime:", &v106, 7, a5->var0.var1);
    v106 = fmin(fmax(v106, 0.01), 0.99);
    v105 = 0.0;
    objc_msgSend(v8, "getFloatValue:fromParm:atFxTime:", &v105, 8, a5->var0.var1);
    v104 = 0.0;
    objc_msgSend(v8, "getFloatValue:fromParm:atFxTime:", &v104, 9, a5->var0.var1);
    v103 = 0.0;
    objc_msgSend(v8, "getFloatValue:fromParm:atFxTime:", &v103, 13, a5->var0.var1);
    v102 = 0.0;
    objc_msgSend(v8, "getFloatValue:fromParm:atFxTime:", &v102, 10, a5->var0.var1);
    v101 = 0;
    objc_msgSend(v8, "getBoolValue:fromParm:atFxTime:", &v101, 12, a5->var0.var1);
    v100 = 0;
    objc_msgSend(v8, "getIntValue:fromParm:atFxTime:", &v100, 11, a5->var0.var1);
    if (a4)
    {
      objc_msgSend(a4, "heliumRef");
      v98 = v99;
      if (v99)
        (*(void (**)(HGXForm *))(*(_QWORD *)v99 + 16))(v99);
    }
    else
    {
      v99 = 0;
      v98 = 0;
    }
    -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a3);
    -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
    HGTransform::HGTransform((HGTransform *)v89);
    HGTransform::Scale((HGTransform *)v89, v94, v96, 1.0);
    HGTransform::Translate((HGTransform *)v89, v95, v97, 0.0);
    v13 = (HGXForm *)HGObject::operator new(0x210uLL);
    HGXForm::HGXForm(v13);
    (*(void (**)(HGXForm *, _BYTE *))(*(_QWORD *)v13 + 576))(v13, v89);
    (*(void (**)(HGXForm *, _QWORD, HGXForm *))(*(_QWORD *)v13 + 120))(v13, 0, v99);
    if (v98 != v13)
    {
      if (v98)
        (*(void (**)(void))(*(_QWORD *)v98 + 24))();
      v98 = v13;
      (*(void (**)(HGXForm *))(*(_QWORD *)v13 + 16))(v13);
    }
    v14 = v109;
    v15 = v109 * -0.5;
    if (v108 != 1)
      v15 = 0.0;
    v16 = v109;
    v17 = -v16;
    if (v108 == 2)
      v15 = v17;
    v18 = v107 + v15;
    v19 = v109 + v18;
    if (v19 >= 1.0 || v19 <= 0.0)
      v21 = v109 + v18;
    else
      v21 = 1.0;
    if (v21 == 0.0)
    {
      v21 = v21 + -0.001;
      v18 = v18 + -0.001;
    }
    v22 = ceilf(v21);
    if (v22 > 1.0)
      v23 = v22;
    else
      v23 = 1.0;
    v24 = (HMaskAlpha *)HGObject::operator new(0x1B0uLL);
    HMaskAlpha::HMaskAlpha(v24, (int)v23);
    v85 = v24;
    (*(void (**)(HMaskAlpha *, _QWORD, HGXForm *))(*(_QWORD *)v24 + 120))(v24, 0, v13);
    v25 = v106;
    (*(void (**)(HMaskAlpha *, _QWORD, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, 0, 0.0, v25, 0.0, 0.0);
    v26 = (HMaskAlpha *)HGObject::operator new(0x1B0uLL);
    HMaskAlpha::HMaskAlpha(v26, (int)v23);
    v84 = v26;
    (*(void (**)(HMaskAlpha *, _QWORD, HGXForm *))(*(_QWORD *)v26 + 120))(v26, 0, v13);
    v27 = v106;
    (*(void (**)(HMaskAlpha *, _QWORD, float, float, float, float))(*(_QWORD *)v26 + 96))(v26, 0, 1.0, v27, 0.0, 0.0);
    v28 = (HGMPSImageEDT *)HGObject::operator new(0x1B0uLL);
    HGMPSImageEDT::HGMPSImageEDT(v28, vcvtps_s32_f32(v21 + 1.0));
    (*(void (**)(HGMPSImageEDT *, _QWORD, HMaskAlpha *))(*(_QWORD *)v28 + 120))(v28, 0, v85);
    (*(void (**)(HGMPSImageEDT *, uint64_t, uint64_t))(*(_QWORD *)v28 + 136))(v28, 0xFFFFFFFFLL, 2);
    (*(void (**)(HGMPSImageEDT *, _QWORD, uint64_t))(*(_QWORD *)v28 + 136))(v28, 0, 2);
    HGNode::SetOutputFormatComponents((const char *)v28, (const char *)4, v29);
    HGNode::SetSupportedFormatPrecisions((HGNode *)v28, (const char *)0xC, v30);
    v31 = (HGMPSImageEDT *)HGObject::operator new(0x1B0uLL);
    HGMPSImageEDT::HGMPSImageEDT(v31, vcvtps_s32_f32(fabsf(v18)));
    (*(void (**)(HGMPSImageEDT *, _QWORD, HMaskAlpha *))(*(_QWORD *)v31 + 120))(v31, 0, v26);
    (*(void (**)(HGMPSImageEDT *, uint64_t, uint64_t))(*(_QWORD *)v31 + 136))(v31, 0xFFFFFFFFLL, 2);
    (*(void (**)(HGMPSImageEDT *, _QWORD, uint64_t))(*(_QWORD *)v31 + 136))(v31, 0, 2);
    HGNode::SetOutputFormatComponents((const char *)v31, (const char *)4, v32);
    HGNode::SetSupportedFormatPrecisions((HGNode *)v31, (const char *)0xC, v33);
    v34 = (HgcReconstructDT *)HGObject::operator new(0x1A0uLL);
    HgcReconstructDT::HgcReconstructDT(v34);
    (*(void (**)(HgcReconstructDT *, _QWORD, HGMPSImageEDT *))(*(_QWORD *)v34 + 120))(v34, 0, v28);
    (*(void (**)(HgcReconstructDT *, _QWORD, float, float, float, float))(*(_QWORD *)v34 + 96))(v34, 0, 1.0, 1.0, 0.0, 0.0);
    HGNode::SetOutputFormatComponents((const char *)v34, (const char *)4, v35);
    HGNode::SetSupportedFormatPrecisions((HGNode *)v34, (const char *)0xC, v36);
    v37 = (HgcReconstructDT *)HGObject::operator new(0x1A0uLL);
    HgcReconstructDT::HgcReconstructDT(v37);
    (*(void (**)(HgcReconstructDT *, _QWORD, HGMPSImageEDT *))(*(_QWORD *)v37 + 120))(v37, 0, v31);
    (*(void (**)(HgcReconstructDT *, _QWORD, float, float, float, float))(*(_QWORD *)v37 + 96))(v37, 0, 1.0, -1.0, 0.0, 0.0);
    HGNode::SetOutputFormatComponents((const char *)v37, (const char *)4, v38);
    HGNode::SetSupportedFormatPrecisions((HGNode *)v37, (const char *)0xC, v39);
    if (v119[0])
    {
      if (v119[0] == 1)
        v40 = 512.0;
      else
        v40 = v109;
      v41 = HGRectMake4i(0, 0, (int)v40, 1u);
      v43 = v42;
      v12 = (HGXForm *)HGObject::operator new(0x80uLL);
      HGBitmap::HGBitmap(v12, v41, v43, 28);
      objc_msgSend(v8, "getGradientSamples:numSamples:depth:fromParm:atFxTime:", *((_QWORD *)v12 + 10), (unint64_t)v40, 4, 3, a5->var0.var1);
      if (v40 > 0.0)
      {
        v44 = 0;
        v45 = *((_QWORD *)v12 + 10);
        v46 = v45;
        do
        {
          v47 = 0;
          v48 = (int *)(v45 + 16 * v44);
          v49 = *v48;
          do
          {
            *(_DWORD *)(v46 + v47) = *(_DWORD *)(v46 + v47 + 4);
            v47 += 4;
          }
          while (v47 != 12);
          v48[3] = v49;
          ++v44;
          v46 += 16;
        }
        while (v40 > (float)(int)v44);
      }
      v50 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
      HGBitmapLoader::HGBitmapLoader(v50, (HGBitmap *)v12);
      (*(void (**)(HGBitmapLoader *, uint64_t, uint64_t))(*(_QWORD *)v50 + 136))(v50, 0xFFFFFFFFLL, 4);
      if (v119[0] == 2)
      {
        v51 = (HgcOutlineGradientStroke *)HGObject::operator new(0x1A0uLL);
        HgcOutlineGradientStroke::HgcOutlineGradientStroke(v51);
        *(_QWORD *)v51 = &unk_1E64D9368;
        HGNode::SetInput((HGNode *)v51, 1u, (HGNode *)v50);
      }
      else
      {
        if (v119[0] != 1)
        {
          NSLog(CFSTR("Invalid stroke type!"));
          (*(void (**)(HGBitmapLoader *))(*(_QWORD *)v50 + 24))(v50);
          if (v12)
          {
            (*(void (**)(HGXForm *))(*(_QWORD *)v12 + 24))(v12);
            LOBYTE(v12) = 0;
          }
          goto LABEL_79;
        }
        v51 = (HgcOutlineGradientStroke *)HGObject::operator new(0x1A0uLL);
        HgcColorAndGradientStroke::HgcColorAndGradientStroke(v51);
        *(_QWORD *)v51 = &unk_1E64D9100;
        objc_msgSend(a3, "pixelAspect");
        v53 = v52;
        v55 = v111;
        v54 = v112;
        v56 = v113;
        v57 = v114;
        v58 = (HGGradient *)HGObject::operator new(0x210uLL);
        HGGradient::HGGradient(v58);
        if (v110)
        {
          HGGradient::SetGradientMode((uint64_t)v58, 1);
          v59 = sqrt(v53 * (v54 - v57) * (v53 * (v54 - v57)) + (v55 - v56) * (v55 - v56));
          (*(void (**)(HGGradient *, uint64_t, float, float, float, float))(*(_QWORD *)v58 + 96))(v58, 2, fabsf(v59), 0.0, 0.0, 0.0);
        }
        else
        {
          HGGradient::SetGradientMode((uint64_t)v58, 0);
          v67 = v112;
          v68 = v111;
          (*(void (**)(HGGradient *, uint64_t, float, float, float, float))(*(_QWORD *)v58 + 96))(v58, 2, v67, v68, 0.0, 0.0);
        }
        v69 = v53;
        (*(void (**)(HGGradient *, _QWORD, float, float, float, float))(*(_QWORD *)v58 + 96))(v58, 0, v69, 1.0, 1.0, 1.0);
        v70 = v114;
        v71 = v113;
        (*(void (**)(HGGradient *, uint64_t, float, float, float, float))(*(_QWORD *)v58 + 96))(v58, 1, v70, v71, 0.0, 0.0);
        (*(void (**)(HGGradient *, _QWORD, HGBitmapLoader *))(*(_QWORD *)v58 + 120))(v58, 0, v50);
        (*(void (**)(HgcOutlineGradientStroke *, uint64_t, HGGradient *))(*(_QWORD *)v51 + 120))(v51, 1, v58);
        (*(void (**)(HGGradient *))(*(_QWORD *)v58 + 24))(v58);
      }
      (*(void (**)(HGBitmapLoader *))(*(_QWORD *)v50 + 24))(v50);
      if (v12)
        (*(void (**)(HGXForm *))(*(_QWORD *)v12 + 24))(v12);
    }
    else
    {
      v51 = (HgcOutlineGradientStroke *)HGObject::operator new(0x1A0uLL);
      HgcColorAndGradientStroke::HgcColorAndGradientStroke(v51);
      *(_QWORD *)v51 = &unk_1E64D9100;
      v60 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
      HGSolidColor::HGSolidColor(v60);
      v61 = v118;
      v62 = v117;
      v63 = v116;
      v64 = v115;
      (*(void (**)(HGSolidColor *, _QWORD, float, float, float, float))(*(_QWORD *)v60 + 96))(v60, 0, v61, v62, v63, v64);
      (*(void (**)(HgcOutlineGradientStroke *, uint64_t, HGSolidColor *))(*(_QWORD *)v51 + 120))(v51, 1, v60);
      (*(void (**)(HGSolidColor *))(*(_QWORD *)v60 + 24))(v60);
    }
    if (v18 >= 0.0 || (v65.n128_f64[0] = -v14, v18 <= -v14))
    {
      if (v18 < 0.0)
        v75 = v37;
      else
        v75 = v34;
      v66.n128_f64[0] = v18;
      (*(void (**)(HgcOutlineGradientStroke *, _QWORD, HgcReconstructDT *, __n128, __n128))(*(_QWORD *)v51 + 120))(v51, 0, v75, v65, v66);
    }
    else
    {
      v72 = (HgcSimpleAdd *)HGObject::operator new(0x1A0uLL);
      HgcSimpleAdd::HgcSimpleAdd(v72);
      (*(void (**)(HgcSimpleAdd *, _QWORD, HgcReconstructDT *))(*(_QWORD *)v72 + 120))(v72, 0, v37);
      (*(void (**)(HgcSimpleAdd *, uint64_t, HgcReconstructDT *))(*(_QWORD *)v72 + 120))(v72, 1, v34);
      HGNode::SetOutputFormatComponents((const char *)v72, (const char *)4, v73);
      HGNode::SetSupportedFormatPrecisions((HGNode *)v72, (const char *)0xC, v74);
      (*(void (**)(HgcOutlineGradientStroke *, _QWORD, HgcSimpleAdd *))(*(_QWORD *)v51 + 120))(v51, 0, v72);
      (*(void (**)(HgcSimpleAdd *))(*(_QWORD *)v72 + 24))(v72);
    }
    v76 = exp(v102 / 100.0 * 0.693147181);
    v77 = v103;
    (*(void (**)(HgcOutlineGradientStroke *, _QWORD, float, float, float, float))(*(_QWORD *)v51 + 96))(v51, 0, v18, v21, v76, v77);
    v78 = v104;
    v79 = v105;
    (*(void (**)(HgcOutlineGradientStroke *, uint64_t, float, float, float, float))(*(_QWORD *)v51 + 96))(v51, 1, v78, v79, 0.0, 0.0);
    if (v98 != (HGXForm *)v51)
    {
      if (v98)
        (*(void (**)(void))(*(_QWORD *)v98 + 24))();
      v98 = (HGXForm *)v51;
      (*(void (**)(HgcOutlineGradientStroke *))(*(_QWORD *)v51 + 16))(v51);
    }
    HGTransform::HGTransform((HGTransform *)v88);
    HGTransform::Scale((HGTransform *)v88, v90, v92, 1.0);
    HGTransform::Translate((HGTransform *)v88, v91, v93, 0.0);
    v80 = (HGXForm *)HGObject::operator new(0x210uLL);
    HGXForm::HGXForm(v80);
    (*(void (**)(HGXForm *, _BYTE *))(*(_QWORD *)v80 + 576))(v80, v88);
    (*(void (**)(HGXForm *, _QWORD, HgcOutlineGradientStroke *))(*(_QWORD *)v80 + 120))(v80, 0, v51);
    if (v98 != v80)
    {
      if (v98)
        (*(void (**)(void))(*(_QWORD *)v98 + 24))();
      v98 = v80;
      (*(void (**)(HGXForm *))(*(_QWORD *)v80 + 16))(v80);
    }
    v81 = objc_msgSend(v86, "colorPrimaries");
    v12 = (HGXForm *)HGObject::operator new(0x1B0uLL);
    HGAntiAlias::HGAntiAlias((HGNode *)v12, v81 == 1);
    (*(void (**)(HGXForm *, _QWORD, float, float, float, float))(*(_QWORD *)v12 + 96))(v12, 0, 0.0, 0.0, 0.0, 0.0);
    (*(void (**)(HGXForm *, _QWORD, HGXForm *))(*(_QWORD *)v12 + 120))(v12, 0, v98);
    if (v98 != v12)
    {
      if (v98)
        (*(void (**)(void))(*(_QWORD *)v98 + 24))();
      v98 = v12;
      (*(void (**)(HGXForm *))(*(_QWORD *)v12 + 16))(v12);
    }
    if (!v101)
    {
      v82 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
      HGHWBlendFlipped::HGHWBlendFlipped(v82);
      (*(void (**)(HGHWBlendFlipped *, _QWORD, float, float, float, float))(*(_QWORD *)v82 + 96))(v82, 0, (float)kBlendConversions[v100], 0.0, 0.0, 0.0);
      (*(void (**)(HGHWBlendFlipped *, uint64_t, HGXForm *))(*(_QWORD *)v82 + 120))(v82, 1, v99);
      (*(void (**)(HGHWBlendFlipped *, _QWORD, HGXForm *))(*(_QWORD *)v82 + 120))(v82, 0, v98);
      if (v98 != (HGXForm *)v82)
      {
        if (v98)
          (*(void (**)(void))(*(_QWORD *)v98 + 24))();
        v98 = (HGXForm *)v82;
        (*(void (**)(HGHWBlendFlipped *))(*(_QWORD *)v82 + 16))(v82);
      }
      (*(void (**)(HGHWBlendFlipped *))(*(_QWORD *)v82 + 24))(v82);
    }
    objc_msgSend(a3, "setHeliumRef:", &v98);
    (*(void (**)(HGXForm *))(*(_QWORD *)v12 + 24))(v12);
    (*(void (**)(HGXForm *))(*(_QWORD *)v80 + 24))(v80);
    HGTransform::~HGTransform((HGTransform *)v88);
    (*(void (**)(HgcOutlineGradientStroke *))(*(_QWORD *)v51 + 24))(v51);
    LOBYTE(v12) = 1;
LABEL_79:
    (*(void (**)(HgcReconstructDT *))(*(_QWORD *)v37 + 24))(v37);
    (*(void (**)(HgcReconstructDT *))(*(_QWORD *)v34 + 24))(v34);
    (*(void (**)(HGMPSImageEDT *))(*(_QWORD *)v31 + 24))(v31);
    (*(void (**)(HGMPSImageEDT *))(*(_QWORD *)v28 + 24))(v28);
    (*(void (**)(HMaskAlpha *))(*(_QWORD *)v84 + 24))(v84);
    (*(void (**)(HMaskAlpha *))(*(_QWORD *)v85 + 24))(v85);
    (*(void (**)(HGXForm *))(*(_QWORD *)v13 + 24))(v13);
    HGTransform::~HGTransform((HGTransform *)v89);
    if (v98)
      (*(void (**)(HGXForm *))(*(_QWORD *)v98 + 24))(v98);
    if (v99)
      (*(void (**)(HGXForm *))(*(_QWORD *)v99 + 24))(v99);
  }
  return (char)v12;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  __int128 v6;
  _OWORD v8[3];

  *a6 = 0;
  *a5 = 0;
  v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->var4;
  -[PAESharedDefaultBase overrideFrameSetupForRenderMode:hardware:software:](self, "overrideFrameSetupForRenderMode:hardware:software:", v8, a5, a6);
  return 1;
}

@end
