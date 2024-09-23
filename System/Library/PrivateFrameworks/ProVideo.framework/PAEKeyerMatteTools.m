@implementation PAEKeyerMatteTools

- (PAEKeyerMatteTools)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PAEKeyerMatteTools;
  return -[PAEKeyerMatteTools init](&v3, sel_init);
}

- (BOOL)addParametersWithParamAPI:(id)a3 hideSimpleViewParam:(unsigned int)a4 isLumaKey:(BOOL)a5
{
  uint64_t v5;
  void *v7;

  if (a3)
  {
    v5 = *(_QWORD *)&a4;
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(a3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Keyer::MatteFillHoles"), CFSTR("Fill Holes"), 0), 48, v5, 0.0, 0.0, 10.0, 0.0, 10.0, 0.1);
    objc_msgSend(a3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Keyer::MatteFillHolesDistance"), CFSTR("Edge Distance"), 0), 54, v5, 3.0, 0.0, 100.0, 0.0, 25.0, 0.1);
  }
  return 1;
}

- (BOOL)addLevelsParametersWithParamAPI:(id)a3 hideSimpleViewParam:(unsigned int)a4
{
  if (a3)
    objc_msgSend(a3, "addLevelsWithName:parmId:hideGamma:parmFlags:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("Keyer::MatteLevels"), CFSTR("Levels"), 0), 49, 0, a4 | 0x20);
  return 1;
}

- (BOOL)addAdvancedParametersWithParamAPI:(id)a3 hideSimpleViewParam:(unsigned int)a4
{
  void *v6;
  uint64_t v7;

  if (a3)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = a4 | 0x20;
    objc_msgSend(a3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Keyer::kMatteExpand"), CFSTR("Shrink/Expand"), 0), 53, v7, 0.0, -100.0, 100.0, -10.0, 10.0, 0.1);
    objc_msgSend(a3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Keyer::MatteSoften"), CFSTR("Soften"), 0), 51, v7, 0.0, 0.0, 10.0, 0.0, 10.0, 0.1);
    objc_msgSend(a3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Keyer::Erode"), CFSTR("Erode"), 0), 52, v7, 0.0, 0.0, 10.0, 0.0, 10.0, 0.1);
  }
  return 1;
}

- (BOOL)doMatteManipulationWithParamAPI:(id)a3 withPrivateParamAPI:(id)a4 withInfo:(id *)a5 pixelAspectRatio:(float)a6 fieldHeight:(float)a7 doInvertMatte:(BOOL)a8 inputIsInverted:(BOOL)a9 fillHoles:(BOOL)a10 scaling:(BOOL)a11 blendingGamma:(float)a12 preKeyedInputNode:(void *)a13 outputNode:(void *)a14
{
  _BOOL4 v15;
  _BOOL4 v16;
  HgcInvertAlpha *v22;
  uint64_t v23;
  double v24;
  double v27;
  HLevels *v28;
  float v29;
  float v30;
  float v31;
  uint64_t v32;
  float *v33;
  float v34;
  float *v35;
  float v36;
  HGHWBlendFlipped *v37;
  uint64_t v38;
  double v39;
  float *v40;
  float v41;
  uint64_t v42;
  double v43;
  HGaussianBlur *v44;
  float v45;
  float v46;
  float v47;
  uint64_t v48;
  float *v49;
  float v50;
  uint64_t v51;
  HgcInvertAlpha *v52;
  uint64_t v53;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;

  v15 = a10;
  v16 = a8;
  if (a9)
  {
    v22 = (HgcInvertAlpha *)HGObject::operator new(0x1A0uLL);
    HgcInvertAlpha::HgcInvertAlpha(v22);
    (*(void (**)(HgcInvertAlpha *, _QWORD, _QWORD))(*(_QWORD *)v22 + 120))(v22, 0, *(_QWORD *)a14);
    v23 = *(_QWORD *)a14;
    if (*(HgcInvertAlpha **)a14 != v22)
    {
      if (v23)
        (*(void (**)(uint64_t))(*(_QWORD *)v23 + 24))(v23);
      *(_QWORD *)a14 = v22;
      (*(void (**)(HgcInvertAlpha *))(*(_QWORD *)v22 + 16))(v22);
    }
    (*(void (**)(HgcInvertAlpha *))(*(_QWORD *)v22 + 24))(v22);
  }
  v59 = 0.0;
  v60 = 0.0;
  v58 = 0.0;
  objc_msgSend(a4, "getLevelsBlack:White:Gamma:fromParm:atTime:", &v60, &v59, &v58, 49, a5->var0.var1);
  v24 = v58;
  if (v60 != 0.0 || v59 != 1.0 || v58 != 1.0)
  {
    v27 = 1000.0;
    if (v58 >= 0.001)
      v27 = 1.0 / v58;
    v58 = v27;
    v28 = (HLevels *)HGObject::operator new(0x1A0uLL);
    HLevels::HLevels(v28);
    (*(void (**)(HLevels *, _QWORD, _QWORD))(*(_QWORD *)v28 + 120))(v28, 0, *(_QWORD *)a14);
    (*(void (**)(HLevels *, _QWORD, float, float, float, float))(*(_QWORD *)v28 + 96))(v28, 0, 0.0, 0.0, 0.0, 0.0);
    (*(void (**)(HLevels *, uint64_t, float, float, float, float))(*(_QWORD *)v28 + 96))(v28, 1, 0.0, 0.0, 0.0, 0.0);
    (*(void (**)(HLevels *, uint64_t, float, float, float, float))(*(_QWORD *)v28 + 96))(v28, 2, 1.0, 1.0, 1.0, 1.0);
    (*(void (**)(HLevels *, uint64_t, float, float, float, float))(*(_QWORD *)v28 + 96))(v28, 3, 1.0, 1.0, 1.0, 1.0);
    (*(void (**)(HLevels *, uint64_t, float, float, float, float))(*(_QWORD *)v28 + 96))(v28, 4, 1.0, 1.0, 1.0, 1.0);
    v29 = v60;
    (*(void (**)(HLevels *, uint64_t, float, float, float, float))(*(_QWORD *)v28 + 96))(v28, 5, v29, v29, v29, v29);
    (*(void (**)(HLevels *, uint64_t, float, float, float, float))(*(_QWORD *)v28 + 96))(v28, 6, 0.0, 0.0, 0.0, 0.0);
    v30 = v59;
    (*(void (**)(HLevels *, uint64_t, float, float, float, float))(*(_QWORD *)v28 + 96))(v28, 7, v30, v30, v30, v30);
    (*(void (**)(HLevels *, uint64_t, float, float, float, float))(*(_QWORD *)v28 + 96))(v28, 8, 1.0, 1.0, 1.0, 1.0);
    v31 = v58;
    (*(void (**)(HLevels *, uint64_t, float, float, float, float))(*(_QWORD *)v28 + 96))(v28, 9, v31, v31, v31, v31);
    v32 = *(_QWORD *)a14;
    if (*(HLevels **)a14 != v28)
    {
      if (v32)
        (*(void (**)(uint64_t))(*(_QWORD *)v32 + 24))(v32);
      *(_QWORD *)a14 = v28;
      (*(void (**)(HLevels *))(*(_QWORD *)v28 + 16))(v28);
    }
    (*(void (**)(HLevels *))(*(_QWORD *)v28 + 24))(v28);
  }
  if (v15)
  {
    v57 = 0.0;
    objc_msgSend(a3, "getFloatValue:fromParm:atFxTime:", &v57, 48, a5->var0.var1);
    v24 = v57;
    if (v57 != 0.0)
    {
      v33 = (float *)HGObject::operator new(0x1B0uLL);
      HGrowShrinkMatte::HGrowShrinkMatte((HGrowShrinkMatte *)v33);
      v34 = v57;
      v33[102] = v34;
      (*(void (**)(float *, _QWORD, _QWORD))(*(_QWORD *)v33 + 120))(v33, 0, *(_QWORD *)a14);
      v56 = 0.0;
      objc_msgSend(a3, "getFloatValue:fromParm:atFxTime:", &v56, 54, a5->var0.var1);
      v35 = (float *)HGObject::operator new(0x1B0uLL);
      HGrowShrinkMatte::HGrowShrinkMatte((HGrowShrinkMatte *)v35);
      v36 = -v57 - v56;
      v35[102] = v36;
      (*(void (**)(float *, _QWORD, float *))(*(_QWORD *)v35 + 120))(v35, 0, v33);
      v37 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
      HGHWBlendFlipped::HGHWBlendFlipped(v37);
      (*(void (**)(HGHWBlendFlipped *, _QWORD, float, float, float, float))(*(_QWORD *)v37 + 96))(v37, 0, 39.0, 0.0, 0.0, 0.0);
      (*(void (**)(HGHWBlendFlipped *, uint64_t, float, float, float, float))(*(_QWORD *)v37 + 96))(v37, 5, a12, 0.0, 0.0, 0.0);
      (*(void (**)(HGHWBlendFlipped *, _QWORD, _QWORD))(*(_QWORD *)v37 + 120))(v37, 0, *(_QWORD *)a14);
      (*(void (**)(HGHWBlendFlipped *, uint64_t, float *))(*(_QWORD *)v37 + 120))(v37, 1, v35);
      v38 = *(_QWORD *)a14;
      if (*(HGHWBlendFlipped **)a14 != v37)
      {
        if (v38)
          (*(void (**)(uint64_t))(*(_QWORD *)v38 + 24))(v38);
        *(_QWORD *)a14 = v37;
        (*(void (**)(HGHWBlendFlipped *))(*(_QWORD *)v37 + 16))(v37);
      }
      (*(void (**)(HGHWBlendFlipped *))(*(_QWORD *)v37 + 24))(v37);
      (*(void (**)(float *))(*(_QWORD *)v35 + 24))(v35);
      (*(void (**)(float *))(*(_QWORD *)v33 + 24))(v33);
    }
  }
  if (a11)
  {
    v57 = 0.0;
    objc_msgSend(a3, "getFloatValue:fromParm:atFxTime:", &v57, 53, a5->var0.var1, v24);
    v39 = v57;
    if (v57 != 0.0)
    {
      v40 = (float *)HGObject::operator new(0x1B0uLL);
      HGrowShrinkMatte::HGrowShrinkMatte((HGrowShrinkMatte *)v40);
      v41 = v57;
      v40[102] = v41;
      (*(void (**)(float *, _QWORD, _QWORD))(*(_QWORD *)v40 + 120))(v40, 0, *(_QWORD *)a14);
      v42 = *(_QWORD *)a14;
      if (*(float **)a14 != v40)
      {
        if (v42)
          (*(void (**)(uint64_t))(*(_QWORD *)v42 + 24))(v42);
        *(_QWORD *)a14 = v40;
        (*(void (**)(float *))(*(_QWORD *)v40 + 16))(v40);
      }
      (*(void (**)(float *))(*(_QWORD *)v40 + 24))(v40);
    }
    v56 = 0.0;
    objc_msgSend(a3, "getFloatValue:fromParm:atFxTime:", &v56, 51, a5->var0.var1, v39);
    v43 = v56;
    if (v56 != 0.0)
    {
      v56 = v56 * 4.0;
      v44 = (HGaussianBlur *)HGObject::operator new(0x1B0uLL);
      HGaussianBlur::HGaussianBlur(v44);
      v45 = v56;
      v46 = a5->var3 / a6;
      v47 = a5->var4 / a7;
      HGaussianBlur::init(v44, v45, v46, v47, 0, 0, 0);
      (*(void (**)(HGaussianBlur *, _QWORD, _QWORD))(*(_QWORD *)v44 + 120))(v44, 0, *(_QWORD *)a14);
      v48 = *(_QWORD *)a14;
      if (*(HGaussianBlur **)a14 != v44)
      {
        if (v48)
          (*(void (**)(uint64_t))(*(_QWORD *)v48 + 24))(v48);
        *(_QWORD *)a14 = v44;
        (*(void (**)(HGaussianBlur *))(*(_QWORD *)v44 + 16))(v44);
      }
      (*(void (**)(HGaussianBlur *))(*(_QWORD *)v44 + 24))(v44);
    }
    v55 = 0.0;
    objc_msgSend(a3, "getFloatValue:fromParm:atFxTime:", &v55, 52, a5->var0.var1, v43);
    if (v55 > 0.0)
    {
      v49 = (float *)HGObject::operator new(0x1B0uLL);
      HErode::HErode((HErode *)v49);
      v50 = v55;
      v49[102] = v50;
      (*(void (**)(float *, _QWORD, _QWORD))(*(_QWORD *)v49 + 120))(v49, 0, *(_QWORD *)a14);
      v51 = *(_QWORD *)a14;
      if (*(float **)a14 != v49)
      {
        if (v51)
          (*(void (**)(uint64_t))(*(_QWORD *)v51 + 24))(v51);
        *(_QWORD *)a14 = v49;
        (*(void (**)(float *))(*(_QWORD *)v49 + 16))(v49);
      }
      (*(void (**)(float *))(*(_QWORD *)v49 + 24))(v49);
    }
  }
  if (v16)
  {
    v52 = (HgcInvertAlpha *)HGObject::operator new(0x1A0uLL);
    HgcInvertAlpha::HgcInvertAlpha(v52);
    (*(void (**)(HgcInvertAlpha *, _QWORD, _QWORD))(*(_QWORD *)v52 + 120))(v52, 0, *(_QWORD *)a14);
    v53 = *(_QWORD *)a14;
    if (*(HgcInvertAlpha **)a14 != v52)
    {
      if (v53)
        (*(void (**)(uint64_t))(*(_QWORD *)v53 + 24))(v53);
      *(_QWORD *)a14 = v52;
      (*(void (**)(HgcInvertAlpha *))(*(_QWORD *)v52 + 16))(v52);
    }
    (*(void (**)(HgcInvertAlpha *))(*(_QWORD *)v52 + 24))(v52);
  }
  return 1;
}

- (BOOL)doMatteManipulationWithInfo:(id *)a3 pixelAspectRatio:(float)a4 fieldHeight:(float)a5 doInvertMatte:(BOOL)a6 inputIsInverted:(BOOL)a7 fillHoles:(BOOL)a8 scaling:(BOOL)a9 blendingGamma:(float)a10 blackLevel:(double)a11 whiteLevel:(double)a12 gammaLevel:(double)a13 preKeyedInputNode:(void *)a14 outputNode:(void *)a15
{
  _BOOL4 v18;
  HgcInvertAlpha *v19;
  uint64_t v20;
  double v23;
  HLevels *v24;
  float v25;
  float v26;
  float v27;
  uint64_t v28;
  HgcInvertAlpha *v29;
  uint64_t v30;

  v18 = a6;
  if (a7)
  {
    v19 = (HgcInvertAlpha *)HGObject::operator new(0x1A0uLL);
    HgcInvertAlpha::HgcInvertAlpha(v19);
    (*(void (**)(HgcInvertAlpha *, _QWORD, _QWORD))(*(_QWORD *)v19 + 120))(v19, 0, *(_QWORD *)a15);
    v20 = *(_QWORD *)a15;
    if (*(HgcInvertAlpha **)a15 != v19)
    {
      if (v20)
        (*(void (**)(uint64_t))(*(_QWORD *)v20 + 24))(v20);
      *(_QWORD *)a15 = v19;
      (*(void (**)(HgcInvertAlpha *))(*(_QWORD *)v19 + 16))(v19);
    }
    (*(void (**)(HgcInvertAlpha *))(*(_QWORD *)v19 + 24))(v19);
  }
  if (a11 != 0.0 || a12 != 1.0 || a13 != 1.0)
  {
    if (a13 >= 0.001)
      v23 = 1.0 / a13;
    else
      v23 = 1000.0;
    v24 = (HLevels *)HGObject::operator new(0x1A0uLL);
    HLevels::HLevels(v24);
    (*(void (**)(HLevels *, _QWORD, _QWORD))(*(_QWORD *)v24 + 120))(v24, 0, *(_QWORD *)a15);
    (*(void (**)(HLevels *, _QWORD, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, 0, 0.0, 0.0, 0.0, 0.0);
    (*(void (**)(HLevels *, uint64_t, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, 1, 0.0, 0.0, 0.0, 0.0);
    (*(void (**)(HLevels *, uint64_t, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, 2, 1.0, 1.0, 1.0, 1.0);
    (*(void (**)(HLevels *, uint64_t, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, 3, 1.0, 1.0, 1.0, 1.0);
    (*(void (**)(HLevels *, uint64_t, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, 4, 1.0, 1.0, 1.0, 1.0);
    v25 = a11;
    (*(void (**)(HLevels *, uint64_t, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, 5, v25, v25, v25, v25);
    (*(void (**)(HLevels *, uint64_t, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, 6, 0.0, 0.0, 0.0, 0.0);
    v26 = a12;
    (*(void (**)(HLevels *, uint64_t, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, 7, v26, v26, v26, v26);
    (*(void (**)(HLevels *, uint64_t, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, 8, 1.0, 1.0, 1.0, 1.0);
    v27 = v23;
    (*(void (**)(HLevels *, uint64_t, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, 9, v27, v27, v27, v27);
    v28 = *(_QWORD *)a15;
    if (*(HLevels **)a15 != v24)
    {
      if (v28)
        (*(void (**)(uint64_t))(*(_QWORD *)v28 + 24))(v28);
      *(_QWORD *)a15 = v24;
      (*(void (**)(HLevels *))(*(_QWORD *)v24 + 16))(v24);
    }
    (*(void (**)(HLevels *))(*(_QWORD *)v24 + 24))(v24);
  }
  if (v18)
  {
    v29 = (HgcInvertAlpha *)HGObject::operator new(0x1A0uLL);
    HgcInvertAlpha::HgcInvertAlpha(v29);
    (*(void (**)(HgcInvertAlpha *, _QWORD, _QWORD))(*(_QWORD *)v29 + 120))(v29, 0, *(_QWORD *)a15);
    v30 = *(_QWORD *)a15;
    if (*(HgcInvertAlpha **)a15 != v29)
    {
      if (v30)
        (*(void (**)(uint64_t))(*(_QWORD *)v30 + 24))(v30);
      *(_QWORD *)a15 = v29;
      (*(void (**)(HgcInvertAlpha *))(*(_QWORD *)v29 + 16))(v29);
    }
    (*(void (**)(HgcInvertAlpha *))(*(_QWORD *)v29 + 24))(v29);
  }
  return 1;
}

@end
