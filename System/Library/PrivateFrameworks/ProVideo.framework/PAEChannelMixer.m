@implementation PAEChannelMixer

- (PAEChannelMixer)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEChannelMixer;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (id)properties
{
  if (-[PAEChannelMixer properties]::once != -1)
    dispatch_once(&-[PAEChannelMixer properties]::once, &__block_literal_global_35);
  return (id)-[PAEChannelMixer properties]::sPropertiesDict;
}

uint64_t __29__PAEChannelMixer_properties__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  v1 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  result = objc_msgSend(v0, "initWithObjectsAndKeys:", &unk_1E6649150, CFSTR("PixelTransformSupport"), v1, CFSTR("PixelIndependent"), v2, CFSTR("PositionIndependent"), v3, CFSTR("MayRemapTime"), v4, CFSTR("SupportsLargeRenderScale"), v5, CFSTR("SupportsHeliumRendering"), v6, CFSTR("SupportsInternalMixing"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
  -[PAEChannelMixer properties]::sPropertiesDict = result;
  return result;
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAEChannelMixer;
  -[PAESharedDefaultBase addParameters](&v6, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "startParameterSubGroup:parmId:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ChannelMixer::RedOutput"), CFSTR("Red Output"), 0), 1, 0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ChannelMixer::RedInputRed"), CFSTR("Red - Red"), 0), 2, 0, 1.0, -2.0, 2.0, -2.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ChannelMixer::RedInputGreen"), CFSTR("Red - Green"), 0), 3, 0, 0.0, -2.0, 2.0, -2.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ChannelMixer::RedInputBlue"), CFSTR("Red - Blue"), 0), 4, 0, 0.0, -2.0, 2.0, -2.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ChannelMixer::RedInputAlpha"), CFSTR("Red - Alpha"), 0), 5, 0, 0.0, -2.0, 2.0, -2.0, 2.0, 0.1);
    objc_msgSend(v3, "endParameterSubGroup");
    objc_msgSend(v3, "startParameterSubGroup:parmId:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ChannelMixer::GreenOutput"), CFSTR("Green Output"), 0), 6, 0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ChannelMixer::GreenInputRed"), CFSTR("Green - Red"), 0), 7, 0, 0.0, -2.0, 2.0, -2.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ChannelMixer::GreenInputGreen"), CFSTR("Green - Green"), 0), 8, 0, 1.0, -2.0, 2.0, -2.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ChannelMixer::GreenInputBlue"), CFSTR("Green - Blue"), 0), 9, 0, 0.0, -2.0, 2.0, -2.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ChannelMixer::GreenInputAlpha"), CFSTR("Green - Alpha"), 0), 10, 0, 0.0, -2.0, 2.0, -2.0, 2.0, 0.1);
    objc_msgSend(v3, "endParameterSubGroup");
    objc_msgSend(v3, "startParameterSubGroup:parmId:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ChannelMixer::BlueOutput"), CFSTR("Blue Output"), 0), 11, 0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ChannelMixer::BlueInputRed"), CFSTR("Blue - Red"), 0), 12, 0, 0.0, -2.0, 2.0, -2.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ChannelMixer::BlueInputGreen"), CFSTR("Blue - Green"), 0), 13, 0, 0.0, -2.0, 2.0, -2.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ChannelMixer::BlueInputBlue"), CFSTR("Blue - Blue"), 0), 14, 0, 1.0, -2.0, 2.0, -2.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ChannelMixer::BlueInputAlpha"), CFSTR("Blue - Alpha"), 0), 15, 0, 0.0, -2.0, 2.0, -2.0, 2.0, 0.1);
    objc_msgSend(v3, "endParameterSubGroup");
    objc_msgSend(v3, "startParameterSubGroup:parmId:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ChannelMixer::AlphaOutput"), CFSTR("Alpha Output"), 0), 16, 0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ChannelMixer::AlphaInputRed"), CFSTR("Alpha - Red"), 0), 17, 0, 0.0, -2.0, 2.0, -2.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ChannelMixer::AlphaInputGreen"), CFSTR("Alpha - Green"), 0), 18, 0, 0.0, -2.0, 2.0, -2.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ChannelMixer::AlphaInputBlue"), CFSTR("Alpha - Blue"), 0), 19, 0, 0.0, -2.0, 2.0, -2.0, 2.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ChannelMixer::AlphaInputAlpha"), CFSTR("Alpha - Alpha"), 0), 20, 0, 1.0, -2.0, 2.0, -2.0, 2.0, 0.1);
    objc_msgSend(v3, "endParameterSubGroup");
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ChannelMixer::Monochrome"), CFSTR("Monochrome"), 0), 21, 0, 1);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ChannelMixer::AllowOverMax"), CFSTR("Allow Values Over Maximum"), 0), 22, 1, 5);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ChannelMixer::IncludeAlpha"), CFSTR("Include Alpha When Constraining"), 0), 23, 0, 5);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ChannelMixer::ProcessInGamma"), 0, 0), 24, 0, 0);
  }
  return v3 != 0;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  return 0;
}

- (BOOL)monochromeChanged:(id)a3
{
  void *v5;
  uint64_t v6;
  BOOL v7;
  BOOL result;
  void *v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  char v15;

  v5 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v6 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A7268);
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
    return 0;
  v9 = (void *)v6;
  v15 = 0;
  v10 = objc_msgSend(v5, "getBoolValue:fromParm:atFxTime:", &v15, 21, a3.var1);
  result = 0;
  if (v10)
  {
    v14 = 0;
    v13 = 0;
    v12 = 0;
    if (objc_msgSend(v5, "getParameterFlags:fromParm:", &v14, 22)
      && objc_msgSend(v5, "getParameterFlags:fromParm:", (char *)&v13 + 4, 23)
      && objc_msgSend(v5, "getParameterFlags:fromParm:", &v13, 6)
      && objc_msgSend(v5, "getParameterFlags:fromParm:", &v12, 11))
    {
      if (v15)
      {
        if ((v14 & 4) != 0)
          objc_msgSend(v9, "setParameterFlags:toParm:", v14 & 0xFFFFFFFB, 22);
        if ((v13 & 0x400000000) != 0)
          objc_msgSend(v9, "setParameterFlags:toParm:", HIDWORD(v13) & 0xFFFFFFFB, 23);
        if ((v13 & 4) == 0)
          objc_msgSend(v9, "setParameterFlags:toParm:", v13 | 4, 6);
        if ((v12 & 4) != 0)
          return -[PAEChannelMixer constrainMonoParams:atTime:](self, "constrainMonoParams:atTime:", 2, a3.var1);
        v11 = v12 | 4u;
      }
      else
      {
        if ((v14 & 4) == 0)
          objc_msgSend(v9, "setParameterFlags:toParm:", v14 | 4u, 22);
        if ((v13 & 0x400000000) == 0)
          objc_msgSend(v9, "setParameterFlags:toParm:", HIDWORD(v13) | 4u, 23);
        if ((v13 & 4) != 0)
          objc_msgSend(v9, "setParameterFlags:toParm:", v13 & 0xFFFFFFFB, 6);
        if ((v12 & 4) == 0)
          return -[PAEChannelMixer constrainMonoParams:atTime:](self, "constrainMonoParams:atTime:", 2, a3.var1);
        v11 = v12 & 0xFFFFFFFB;
      }
      objc_msgSend(v9, "setParameterFlags:toParm:", v11, 11);
    }
    return -[PAEChannelMixer constrainMonoParams:atTime:](self, "constrainMonoParams:atTime:", 2, a3.var1);
  }
  return result;
}

- (BOOL)constrainMonoParams:(int)a3 atTime:(id)a4
{
  int v4;
  void *v8;
  uint64_t v9;
  BOOL v10;
  int v11;
  void *v12;
  int v13;
  BOOL v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  float v25;
  double v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  void *v35;
  uint64_t v36;
  double v38;
  double v39;
  double v40;
  double v41;
  char v42;
  char v43;
  char v44;

  v4 = a3 - 2;
  if ((a3 - 2) > 3)
  {
LABEL_68:
    LOBYTE(v11) = 1;
    return v11;
  }
  v8 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v9 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A7268);
  if (v8)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10)
  {
LABEL_7:
    LOBYTE(v11) = 0;
    return v11;
  }
  v12 = (void *)v9;
  v44 = 0;
  v43 = 1;
  v42 = 0;
  v13 = objc_msgSend(v8, "getBoolValue:fromParm:atFxTime:", &v44, 21, a4.var1);
  LOBYTE(v11) = 0;
  if (v13)
  {
    v11 = objc_msgSend(v8, "getBoolValue:fromParm:atFxTime:", &v43, 22, a4.var1);
    if (v11)
    {
      if (objc_msgSend(v8, "getBoolValue:fromParm:atFxTime:", &v42, 23, a4.var1))
        v14 = v44 == 0;
      else
        v14 = 1;
      v15 = !v14 && v43 == 0;
      if (v15 && (a3 != 5 || v42))
      {
        v40 = 0.0;
        v41 = 0.0;
        v38 = 0.0;
        v39 = 0.0;
        objc_msgSend(v8, "getFloatValue:fromParm:atFxTime:", &v41, 2, a4.var1);
        objc_msgSend(v8, "getFloatValue:fromParm:atFxTime:", &v40, 3, a4.var1);
        objc_msgSend(v8, "getFloatValue:fromParm:atFxTime:", &v39, 4, a4.var1);
        objc_msgSend(v8, "getFloatValue:fromParm:atFxTime:", &v38, 5, a4.var1);
        HIDWORD(v24) = HIDWORD(v40);
        *(float *)&v23 = v41;
        *(float *)&v24 = v40;
        v25 = v39;
        if (v42)
        {
          switch(v4)
          {
            case 0:
              v26 = v38;
              v27 = v41;
              *(float *)&v23 = v40;
              goto LABEL_44;
            case 1:
              v26 = v38;
              v27 = v40;
LABEL_44:
              *(float *)&v24 = v39;
              goto LABEL_46;
            case 2:
              v26 = v38;
              v27 = v39;
LABEL_46:
              v25 = v26;
              break;
            case 3:
              v27 = v38;
              break;
            default:
              PCPrint("File %s, line %d should not have been reached:\n\t", v16, v17, v18, v19, v20, v21, v22, (char)"/Library/Caches/com.apple.xbs/Sources/FiltersiOS/Filters/PAEChannelMixer.mm");
              pcAbortImpl();
          }
          v31 = 1.0 - v27;
          if (v25 == 0.0 || v25 == (float)-(float)(*(float *)&v23 + *(float *)&v24))
          {
            v32 = v31 / 3.0;
            v33 = v31 / 3.0;
            v34 = v31 / 3.0;
          }
          else
          {
            v34 = v31 / ((float)((float)(*(float *)&v23 + *(float *)&v24) / v25) + 1.0);
            v33 = (float)(*(float *)&v24 * v34) / v25;
            v32 = (float)(*(float *)&v23 * v34) / v25;
          }
          switch(v4)
          {
            case 0:
              v41 = v27;
              v39 = v33;
              v40 = v32;
              v38 = v34;
              goto LABEL_62;
            case 1:
              v40 = v27;
              v41 = v32;
              v38 = v34;
              v39 = v33;
              goto LABEL_60;
            case 2:
              v39 = v27;
              v40 = v33;
              v41 = v32;
              v38 = v34;
              goto LABEL_56;
            case 3:
              v38 = v27;
              v40 = v33;
              v41 = v32;
              v39 = v34;
              goto LABEL_56;
            default:
              goto LABEL_56;
          }
        }
        if (a3 == 3)
          v28 = v40;
        else
          v28 = v41;
        if (a3 == 3)
          v29 = v41;
        else
          v29 = v40;
        if (a3 == 4)
          v28 = v39;
        else
          *(float *)&v23 = v29;
        if (a3 == 4)
          v25 = v40;
        v30 = 1.0 - v28;
        if (*(float *)&v23 == 0.0 || *(float *)&v23 == (float)-v25)
        {
          *(float *)&v24 = v30 * 0.5;
          LODWORD(v23) = LODWORD(v24);
        }
        else
        {
          v23 = v30 / ((float)(*(float *)&v23 / v25) + 1.0);
          *(float *)&v23 = v23;
          *(float *)&v24 = v30 - *(float *)&v23;
        }
        switch(a3)
        {
          case 2:
            v40 = *(float *)&v24;
            v41 = v28;
            v39 = *(float *)&v23;
            break;
          case 3:
            v40 = v28;
            v41 = *(float *)&v24;
            v39 = *(float *)&v23;
LABEL_60:
            v35 = v12;
            v36 = 2;
            goto LABEL_63;
          case 4:
            v41 = *(float *)&v24;
            v39 = v28;
            v40 = *(float *)&v23;
LABEL_56:
            objc_msgSend(v12, "setFloatValue:toParm:atFxTime:", 2, a4.var1);
            objc_msgSend(v12, "setFloatValue:toParm:atFxTime:", 3, a4.var1, v40);
            if (a3 == 4)
              goto LABEL_65;
            goto LABEL_64;
          default:
            objc_msgSend(v12, "setFloatValue:toParm:atFxTime:", 2, a4.var1, v41, v23, v24, v28);
            break;
        }
LABEL_62:
        v35 = v12;
        v36 = 3;
LABEL_63:
        objc_msgSend(v35, "setFloatValue:toParm:atFxTime:", v36, a4.var1);
LABEL_64:
        objc_msgSend(v12, "setFloatValue:toParm:atFxTime:", 4, a4.var1, v39);
LABEL_65:
        if (a3 != 5 && v42)
          objc_msgSend(v12, "setFloatValue:toParm:atFxTime:", 5, a4.var1, v38);
        goto LABEL_68;
      }
      goto LABEL_7;
    }
  }
  return v11;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  HChannelMixer *v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  float v18;
  float v19;
  float v20;
  float v21;
  void (*v22)(float, float, float, float);
  float v23;
  float v24;
  float v25;
  float v26;
  double *v27;
  double *v28;
  double *v29;
  double *v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  char v44;
  uint64_t v45;
  uint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  int v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  double v56;
  double v57;
  double v58;
  double v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;

  v9 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (v9)
  {
    v10 = (void *)v9;
    v70 = 0.0;
    v71 = 1.0;
    v68 = 0.0;
    v69 = 0.0;
    v66 = 1.0;
    v67 = 0.0;
    v64 = 0.0;
    v65 = 0.0;
    v62 = 0;
    v63 = 0;
    v60 = 0;
    v61 = 0x3FF0000000000000;
    v58 = 0.0;
    v59 = 0.0;
    v56 = 1.0;
    v57 = 0.0;
    v55 = 0;
    -[PAEChannelMixer getRed:green:blue:alpha:fromParam:atFxTime:](self, "getRed:green:blue:alpha:fromParam:atFxTime:", &v71, &v70, &v69, &v68, 2, a5->var0.var1);
    -[PAEChannelMixer getRed:green:blue:alpha:fromParam:atFxTime:](self, "getRed:green:blue:alpha:fromParam:atFxTime:", &v67, &v66, &v65, &v64, 7, a5->var0.var1);
    -[PAEChannelMixer getRed:green:blue:alpha:fromParam:atFxTime:](self, "getRed:green:blue:alpha:fromParam:atFxTime:", &v63, &v62, &v61, &v60, 12, a5->var0.var1);
    -[PAEChannelMixer getRed:green:blue:alpha:fromParam:atFxTime:](self, "getRed:green:blue:alpha:fromParam:atFxTime:", &v59, &v58, &v57, &v56, 17, a5->var0.var1);
    objc_msgSend(v10, "getBoolValue:fromParm:atFxTime:", &v55, 21, a5->var0.var1);
    objc_msgSend(v10, "mixAmountAtTime:", a5->var0.var1);
    v12 = v11;
    LODWORD(v9) = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
    if ((_DWORD)v9)
    {
      if (objc_msgSend(a4, "imageType") == 3)
      {
        if (a4)
          objc_msgSend(a4, "heliumRef");
        else
          v54 = 0;
        v13 = (HChannelMixer *)HGObject::operator new(0x1A0uLL);
        HChannelMixer::HChannelMixer(v13);
        v53 = (uint64_t)v13;
        v52 = 0;
        objc_msgSend(v10, "getBoolValue:fromParm:atFxTime:", &v52, 24, a5->var0.var1);
        v50 = 0xD0000000CLL;
        v51 = 0;
        v48 = 0x800000009;
        v49 = 0;
        v14 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A2958);
        if (v14)
        {
          v15 = objc_msgSend(v14, "colorPrimaries");
          v16 = v15 != 1;
          if (v15 == 1 && v52)
          {
            FxApplyColorConform(&v54, (uint64_t)&v48, 1, (uint64_t)&v50, (char *)1, &v47);
            v17 = v47;
            if (v54 == v47)
            {
              if (v54)
                (*(void (**)(void))(*(_QWORD *)v54 + 24))();
            }
            else
            {
              if (v54)
              {
                (*(void (**)(void))(*(_QWORD *)v54 + 24))();
                v17 = v47;
              }
              v54 = v17;
            }
            v16 = 0;
          }
        }
        else
        {
          v16 = 1;
        }
        (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v53 + 120))(v53, 0, v54);
        v18 = v71;
        v19 = v70;
        v20 = v69;
        v21 = v68;
        (*(void (**)(uint64_t, _QWORD, float, float, float, float))(*(_QWORD *)v53 + 96))(v53, 0, v18, v19, v20, v21);
        v22 = *(void (**)(float, float, float, float))(*(_QWORD *)v53 + 96);
        if (v55)
        {
          v23 = v71;
          v24 = v70;
          v25 = v69;
          v26 = v68;
          v22(v23, v24, v25, v26);
          v27 = &v69;
          v28 = &v70;
          v29 = &v71;
          v30 = &v68;
        }
        else
        {
          v31 = v67;
          v32 = v66;
          v33 = v65;
          v34 = v64;
          v22(v31, v32, v33, v34);
          v27 = (double *)&v61;
          v28 = (double *)&v62;
          v29 = (double *)&v63;
          v30 = (double *)&v60;
        }
        v35 = *v27;
        v36 = *v28;
        v37 = *v29;
        v38 = *v30;
        (*(void (**)(uint64_t, uint64_t, float, float, float, float))(*(_QWORD *)v53 + 96))(v53, 2, v37, v36, v35, v38);
        v39 = v59;
        v40 = v58;
        v41 = v57;
        v42 = v56;
        (*(void (**)(uint64_t, uint64_t, float, float, float, float))(*(_QWORD *)v53 + 96))(v53, 3, v39, v40, v41, v42);
        v43 = v12;
        (*(void (**)(uint64_t, uint64_t, float, float, float, float))(*(_QWORD *)v53 + 96))(v53, 4, v43, v43, v43, v43);
        if (v52)
          v44 = v16;
        else
          v44 = 1;
        if ((v44 & 1) == 0)
        {
          FxApplyColorConform(&v53, (uint64_t)&v50, 1, (uint64_t)&v48, (char *)1, &v47);
          v45 = v47;
          if (v53 == v47)
          {
            if (v53)
              (*(void (**)(void))(*(_QWORD *)v53 + 24))();
          }
          else
          {
            if (v53)
            {
              (*(void (**)(void))(*(_QWORD *)v53 + 24))();
              v45 = v47;
            }
            v53 = v45;
          }
        }
        objc_msgSend(a3, "setHeliumRef:", &v53);
        if (v53)
          (*(void (**)(uint64_t))(*(_QWORD *)v53 + 24))(v53);
        if (v54)
          (*(void (**)(uint64_t))(*(_QWORD *)v54 + 24))(v54);
        LOBYTE(v9) = 1;
      }
      else
      {
        LOBYTE(v9) = 0;
      }
    }
  }
  return v9;
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

- (void)getRed:(double *)a3 green:(double *)a4 blue:(double *)a5 alpha:(double *)a6 fromParam:(int)a7 atFxTime:(id)a8
{
  uint64_t v9;
  void *v14;

  v9 = *(_QWORD *)&a7;
  v14 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  objc_msgSend(v14, "getFloatValue:fromParm:atFxTime:", a3, v9, a8.var1);
  objc_msgSend(v14, "getFloatValue:fromParm:atFxTime:", a4, (v9 + 1), a8.var1);
  objc_msgSend(v14, "getFloatValue:fromParm:atFxTime:", a5, (v9 + 2), a8.var1);
  objc_msgSend(v14, "getFloatValue:fromParm:atFxTime:", a6, (v9 + 3), a8.var1);
}

@end
