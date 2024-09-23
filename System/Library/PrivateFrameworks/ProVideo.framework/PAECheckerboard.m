@implementation PAECheckerboard

- (PAECheckerboard)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAECheckerboard;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (BOOL)variesOverTime
{
  return 0;
}

- (void)filteredEdges:(BOOL *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  BOOL v5;
  BOOL v6;
  unsigned int v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PAECheckerboard;
  -[PAESharedDefaultBase addParameters](&v14, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A4358);
  v4 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  v6 = !v5;
  if (!v5)
  {
    v7 = objc_msgSend(v4, "versionAtCreation");
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Checkerboard::Type"), 0, 0), 1, 0, objc_msgSend((id)objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Checkerboard::Types"), 0, 0), "componentsSeparatedByString:", CFSTR(";")),
      1);
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Checkerboard::Center"), 0, 0), 310, 0, 0.5, 0.5);
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:defaultAlpha:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Checkerboard::Color 1"), 0, 0), 311, 0, 1.0, 1.0, 1.0, 1.0);
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:defaultAlpha:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Checkerboard::Color 2"), 0, 0), 312, 0, 0.0, 0.0, 0.0, 1.0);
    v9 = objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Checkerboard::Size"), 0, 0);
    if (v7 >= 2)
      v10 = 3200.0;
    else
      v10 = 800.0;
    if (v7 >= 2)
      v11 = 1600.0;
    else
      v11 = 800.0;
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", v9, 313, 0, 80.0, 0.0, v10, 0.0, v11, 10.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Checkerboard::Divisions"), 0, 0), 3, 2, 8.0, 0.0, 180.0, 0.0, 180.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Checkerboard::Twirl"), 0, 0), 4, 2, 0.0, -1.0, 1.0, -1.0, 1.0, 0.01);
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Checkerboard::Board Angle"), 0, 0), 2, 288, 0.0, -3600.0, 3600.0);
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Checkerboard::Radial Shape"), 0, 0), 5, 0, objc_msgSend((id)objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Checkerboard::Radial Shapes"), 0, 0), "componentsSeparatedByString:", CFSTR(";")),
      3);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Checkerboard::Radial Scale"), 0, 0), 6, 2, 1.0, 0.5, 2.0, 0.5, 2.0, 0.1);
    v12 = objc_msgSend((id)objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Checkerboard::Shapes"), 0, 0), "componentsSeparatedByString:", CFSTR(";"));
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Checkerboard::Shape 1"), 0, 0), 7, 0, v12, 3);
    objc_msgSend(v3, "startParameterSubGroup:parmId:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Checkerboard::Shape 1 Group"), 0, 0), 8, 10);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Checkerboard::Num Sides 1"), 0, 0), 9, 34, 5.0, 3.0, 50.0, 3.0, 50.0, 1.0);
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Checkerboard::Shape Angle 1"), 0, 0), 10, 290, 0.0, -3600.0, 3600.0);
    objc_msgSend(v3, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Checkerboard::Shape Radius 1"), 0, 0), 11, 34, 0.5, 0.0, 1.0, 0.0, 1.0, 0.1);
    objc_msgSend(v3, "endParameterSubGroup");
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Checkerboard::Shape 2"), 0, 0), 12, 1, v12, 3);
    objc_msgSend(v3, "startParameterSubGroup:parmId:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Checkerboard::Shape 2 Group"), 0, 0), 13, 10);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Checkerboard::Num Sides 2"), 0, 0), 14, 34, 5.0, 3.0, 50.0, 3.0, 50.0, 1.0);
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Checkerboard::Shape Angle 2"), 0, 0), 15, 290, 0.0, -3600.0, 3600.0);
    objc_msgSend(v3, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Checkerboard::Shape Radius 2"), 0, 0), 16, 34, 0.5, 0.0, 1.0, 0.0, 1.0, 0.1);
    objc_msgSend(v3, "endParameterSubGroup");
    objc_msgSend(v3, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Checkerboard::Vertical Scale"), 0, 0), 17, 2, 1.0, 0.0, 100.0, 0.0, 10.0, 0.5);
    objc_msgSend(v3, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Checkerboard::Contrast"), 0, 0), 314, 0, 1.0, 0.0, 1.0, 0.0, 1.0, 0.1);
  }
  return v6;
}

- (void)updateShapeParameter:(unsigned int)a3 atTime:(id)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v8 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A4858);
  v15 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0AFFE0);
  v9 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v20 = 0;
  objc_msgSend(v7, "getIntValue:fromParm:atFxTime:", &v20, v5, a4.var1);
  v19 = 0;
  v18 = 0;
  v17 = 0;
  objc_msgSend(v7, "getParameterFlags:fromParm:", &v19, (v5 + 1));
  objc_msgSend(v7, "getParameterFlags:fromParm:", (char *)&v18 + 4, (v5 + 2));
  objc_msgSend(v7, "getParameterFlags:fromParm:", &v18, (v5 + 3));
  objc_msgSend(v7, "getParameterFlags:fromParm:", &v17, (v5 + 4));
  if (v20 == 3)
  {
    if ((_DWORD)v5 == 7)
      v12 = CFSTR("Checkerboard::Num Points 1");
    else
      v12 = CFSTR("Checkerboard::Num Points 2");
    v13 = objc_msgSend(v9, "localizedStringForKey:value:table:", v12, 0, 0, v15);
    objc_msgSend(v16, "setParameter:name:", (v5 + 2), v13);
    objc_msgSend(v8, "setParameterFlags:toParm:", v19 & 0xFFFFFFFD, (v5 + 1));
    objc_msgSend(v8, "setParameterFlags:toParm:", HIDWORD(v18) & 0xFFFFFFFD, (v5 + 2));
    objc_msgSend(v8, "setParameterFlags:toParm:", v18 & 0xFFFFFFFD, (v5 + 3));
    v14 = v17 & 0xFFFFFFFD;
  }
  else
  {
    if (v20 == 2)
    {
      if ((_DWORD)v5 == 7)
        v10 = CFSTR("Checkerboard::Num Sides 1");
      else
        v10 = CFSTR("Checkerboard::Num Sides 2");
      objc_msgSend(v9, "localizedStringForKey:value:table:", v10, 0, 0, v15);
      objc_msgSend(v15, "setParameter:name:", (v5 + 2), 0);
      objc_msgSend(v8, "setParameterFlags:toParm:", v19 & 0xFFFFFFFD, (v5 + 1));
      objc_msgSend(v8, "setParameterFlags:toParm:", HIDWORD(v18) & 0xFFFFFFFD, (v5 + 2));
      v11 = v18 & 0xFFFFFFFD;
    }
    else
    {
      objc_msgSend(v8, "setParameterFlags:toParm:", v19 | 2u, (v5 + 1));
      objc_msgSend(v8, "setParameterFlags:toParm:", HIDWORD(v18) | 2u, (v5 + 2));
      v11 = v18 | 2;
    }
    objc_msgSend(v8, "setParameterFlags:toParm:", v11, (v5 + 3), v15);
    v14 = v17 | 2u;
  }
  objc_msgSend(v8, "setParameterFlags:toParm:", v14, (v5 + 4));
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  BOOL v9;
  char v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  PAECheckerboard *v14;
  uint64_t v15;
  uint64_t v16;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  __int128 v29;
  uint64_t v30;

  v5 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v6 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A4858);
  v7 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0AFFE0);
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  v9 = v8 || v7 == 0;
  v10 = v9;
  if (v9)
    return v10 ^ 1;
  v29 = *MEMORY[0x1E0CA2E18];
  v30 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  switch(a3)
  {
    case 0xCu:
      v14 = self;
      v15 = 12;
LABEL_18:
      -[PAECheckerboard updateShapeParameter:atTime:](v14, "updateShapeParameter:atTime:", v15, &v29);
      return v10 ^ 1;
    case 7u:
      v14 = self;
      v15 = 7;
      goto LABEL_18;
    case 1u:
      v11 = (void *)v7;
      v12 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v28 = 0;
      objc_msgSend(v5, "getIntValue:fromParm:atFxTime:", &v28, 1, &v29);
      v27 = 0;
      v25 = 0;
      v26 = 0;
      v23 = 0;
      v24 = 0;
      v21 = 0;
      v22 = 0;
      v20 = 0;
      objc_msgSend(v5, "getParameterFlags:fromParm:", &v27, 3);
      objc_msgSend(v5, "getParameterFlags:fromParm:", (char *)&v26 + 4, 4);
      objc_msgSend(v5, "getParameterFlags:fromParm:", &v26, 5);
      objc_msgSend(v5, "getParameterFlags:fromParm:", (char *)&v25 + 4, 6);
      objc_msgSend(v5, "getParameterFlags:fromParm:", &v25, 7);
      objc_msgSend(v5, "getParameterFlags:fromParm:", (char *)&v24 + 4, 8);
      objc_msgSend(v5, "getParameterFlags:fromParm:", &v24, 9);
      objc_msgSend(v5, "getParameterFlags:fromParm:", (char *)&v23 + 4, 10);
      objc_msgSend(v5, "getParameterFlags:fromParm:", &v23, 11);
      objc_msgSend(v5, "getParameterFlags:fromParm:", (char *)&v22 + 4, 12);
      objc_msgSend(v5, "getParameterFlags:fromParm:", &v22, 13);
      objc_msgSend(v5, "getParameterFlags:fromParm:", (char *)&v21 + 4, 14);
      objc_msgSend(v5, "getParameterFlags:fromParm:", &v21, 15);
      objc_msgSend(v5, "getParameterFlags:fromParm:", (char *)&v20 + 4, 16);
      objc_msgSend(v5, "getParameterFlags:fromParm:", &v20, 17);
      switch(v28)
      {
        case 0:
          objc_msgSend(v6, "setParameterFlags:toParm:", v27 | 2u, 3);
          objc_msgSend(v6, "setParameterFlags:toParm:", HIDWORD(v26) | 2u, 4);
          objc_msgSend(v6, "setParameterFlags:toParm:", v26 | 2, 5);
          objc_msgSend(v6, "setParameterFlags:toParm:", HIDWORD(v25) | 2u, 6);
          v13 = CFSTR("Checkerboard::Size");
          goto LABEL_20;
        case 1:
          objc_msgSend(v6, "setParameterFlags:toParm:", v27 & 0xFFFFFFFD, 3);
          objc_msgSend(v6, "setParameterFlags:toParm:", HIDWORD(v26) & 0xFFFFFFFD, 4);
          objc_msgSend(v6, "setParameterFlags:toParm:", v26 & 0xFFFFFFFD, 5);
          objc_msgSend(v6, "setParameterFlags:toParm:", HIDWORD(v25) & 0xFFFFFFFD, 6);
          v13 = CFSTR("Checkerboard::Tile Height");
LABEL_20:
          objc_msgSend(v11, "setParameter:name:", 313, objc_msgSend(v12, "localizedStringForKey:value:table:", v13, 0, 0));
          objc_msgSend(v6, "setParameterFlags:toParm:", v25 | 2, 7);
          objc_msgSend(v6, "setParameterFlags:toParm:", HIDWORD(v24) | 2u, 8);
          objc_msgSend(v6, "setParameterFlags:toParm:", v24 | 2, 9);
          objc_msgSend(v6, "setParameterFlags:toParm:", HIDWORD(v23) | 2u, 10);
          objc_msgSend(v6, "setParameterFlags:toParm:", v23 | 2, 11);
          objc_msgSend(v6, "setParameterFlags:toParm:", HIDWORD(v22) | 2u, 12);
          objc_msgSend(v6, "setParameterFlags:toParm:", v22 | 2, 13);
          objc_msgSend(v6, "setParameterFlags:toParm:", HIDWORD(v21) | 2u, 14);
          objc_msgSend(v6, "setParameterFlags:toParm:", v21 | 2, 15);
          objc_msgSend(v6, "setParameterFlags:toParm:", HIDWORD(v20) | 2u, 16);
          goto LABEL_22;
        case 2:
          objc_msgSend(v11, "setParameter:name:", 313, objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Checkerboard::Size"), 0, 0));
          v18 = 1;
          v19 = 0;
          objc_msgSend(v5, "getIntValue:fromParm:atFxTime:", &v19, 7, &v29);
          objc_msgSend(v5, "getIntValue:fromParm:atFxTime:", &v18, 12, &v29);
          objc_msgSend(v6, "setParameterFlags:toParm:", v27 | 2u, 3);
          objc_msgSend(v6, "setParameterFlags:toParm:", HIDWORD(v26) | 2u, 4);
          objc_msgSend(v6, "setParameterFlags:toParm:", v26 | 2, 5);
          objc_msgSend(v6, "setParameterFlags:toParm:", HIDWORD(v25) | 2u, 6);
          objc_msgSend(v6, "setParameterFlags:toParm:", v25 & 0xFFFFFFFD, 7);
          objc_msgSend(v6, "setParameterFlags:toParm:", HIDWORD(v22) & 0xFFFFFFFD, 12);
          -[PAECheckerboard updateShapeParameter:atTime:](self, "updateShapeParameter:atTime:", 7, &v29);
          -[PAECheckerboard updateShapeParameter:atTime:](self, "updateShapeParameter:atTime:", 12, &v29);
LABEL_22:
          v16 = v20 | 2;
          goto LABEL_24;
        case 3:
          objc_msgSend(v11, "setParameter:name:", 313, objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Checkerboard::Size"), 0, 0));
          objc_msgSend(v6, "setParameterFlags:toParm:", v27 | 2u, 3);
          objc_msgSend(v6, "setParameterFlags:toParm:", HIDWORD(v26) | 2u, 4);
          objc_msgSend(v6, "setParameterFlags:toParm:", v26 | 2, 5);
          objc_msgSend(v6, "setParameterFlags:toParm:", HIDWORD(v25) | 2u, 6);
          objc_msgSend(v6, "setParameterFlags:toParm:", v25 | 2, 7);
          objc_msgSend(v6, "setParameterFlags:toParm:", HIDWORD(v24) | 2u, 8);
          objc_msgSend(v6, "setParameterFlags:toParm:", v24 | 2, 9);
          objc_msgSend(v6, "setParameterFlags:toParm:", HIDWORD(v23) | 2u, 10);
          objc_msgSend(v6, "setParameterFlags:toParm:", v23 | 2, 11);
          objc_msgSend(v6, "setParameterFlags:toParm:", HIDWORD(v22) | 2u, 12);
          objc_msgSend(v6, "setParameterFlags:toParm:", v22 | 2, 13);
          objc_msgSend(v6, "setParameterFlags:toParm:", HIDWORD(v21) | 2u, 14);
          objc_msgSend(v6, "setParameterFlags:toParm:", v21 | 2, 15);
          objc_msgSend(v6, "setParameterFlags:toParm:", HIDWORD(v20) | 2u, 16);
          v16 = v20 & 0xFFFFFFFD;
LABEL_24:
          objc_msgSend(v6, "setParameterFlags:toParm:", v16, 17);
          break;
        default:
          return v10 ^ 1;
      }
      break;
  }
  return v10 ^ 1;
}

- (id)properties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("MayRemapTime"), v4, CFSTR("PreservesAlpha"), v5, CFSTR("SupportsHeliumRendering"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (id)multiplyMatrix:(id)a3 byMatrix:(id)a4
{
  uint64_t v5;
  double *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double *v29;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "matrix", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  v6 = (double *)objc_msgSend(a4, "matrix");
  v7 = 0;
  v8 = *v6;
  v9 = v6[1];
  v10 = v6[2];
  v11 = v6[3];
  v12 = v6[4];
  v13 = v6[5];
  v14 = v6[6];
  v15 = v6[7];
  v16 = v6[8];
  v17 = v6[9];
  v18 = v6[10];
  v19 = v6[11];
  v20 = v6[12];
  v21 = v6[13];
  v22 = v5 + 96;
  v23 = v6[14];
  v24 = v6[15];
  do
  {
    v25 = *(double *)(v5 + v7);
    v26 = *(double *)(v22 + v7 - 64);
    v27 = *(double *)(v22 + v7 - 32);
    v28 = *(double *)(v22 + v7);
    v29 = (double *)((char *)&v31 + v7);
    *v29 = v25 * v8 + v26 * v9 + v27 * v10 + v28 * v11;
    v29[4] = v25 * v12 + v26 * v13 + v27 * v14 + v28 * v15;
    v29[8] = v25 * v16 + v26 * v17 + v27 * v18 + v28 * v19;
    v29[12] = v25 * v20 + v26 * v21 + v27 * v23 + v28 * v24;
    v7 += 8;
  }
  while (v7 != 32);
  return -[FxMatrix44 initWithMatrix44Data:]([FxMatrix44 alloc], "initWithMatrix44Data:", &v31);
}

- (void)getTransformMatrix:(double *)(a3 forCenterX:centerY:angle:andOutputImage:
{
  __double2 v12;
  _QWORD v13[4];
  __int128 v14;
  uint64_t v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  __double2 v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v12 = __sincos_stret(a6);
  v21[0] = *(_QWORD *)&v12.__cosval;
  *(double *)&v21[1] = -v12.__sinval;
  v21[2] = 0;
  v21[3] = 0;
  v22 = v12;
  v23 = 0;
  v24 = 0;
  v25 = xmmword_1B3050788;
  v26 = unk_1B3050798;
  v27 = xmmword_1B30507A8;
  v28 = unk_1B30507B8;
  v13[1] = 0;
  v13[2] = 0;
  v13[0] = 0x3FF0000000000000;
  *(double *)&v13[3] = a4;
  v14 = xmmword_1B304EEE0;
  v15 = 0;
  v16 = a5;
  v17 = xmmword_1B3050788;
  v18 = unk_1B3050798;
  v19 = xmmword_1B30507A8;
  v20 = unk_1B30507B8;
  *a3 = (double (*)[4][4])objc_msgSend(-[PAECheckerboard multiplyMatrix:byMatrix:](self, "multiplyMatrix:byMatrix:", -[PAECheckerboard multiplyMatrix:byMatrix:](self, "multiplyMatrix:byMatrix:", -[FxMatrix44 initWithMatrix44Data:]([FxMatrix44 alloc], "initWithMatrix44Data:", v13), objc_msgSend(a7, "inversePixelTransform")), -[FxMatrix44 initWithMatrix44Data:]([FxMatrix44 alloc], "initWithMatrix44Data:", v21)), "matrix");
}

- (BOOL)canThrowRenderOutput:(id)a3 withInfo:(id *)a4
{
  void *v7;
  void *v8;
  BOOL v10;
  int v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  HgcCheckerboard *v16;
  double v17;
  float v18;
  float v19;
  double v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  __n128 v35;
  __n128 v36;
  __double2 v37;
  float cosval;
  float sinval;
  __double2 v40;
  float v41;
  float v42;
  __n128 v43;
  double v44;
  double v45;
  float64x2_t v50;
  float64x2_t v52;
  void *v53;
  float64_t v54;
  float64_t v55;
  double v56;
  double v57;
  double v58;
  double v59;
  unint64_t v60;
  double v61;
  int v62;
  long double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  int v69;
  HgcConcentricTriangleChecker *v70;
  HgcShapeCheckerboard *v71;
  float v72;
  float v73;
  float v74;
  float v75;
  float v76;
  float v77;
  float v78;
  float v79;
  float v80;
  float v81;
  float v82;
  float v83;
  float v84;
  float v85;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  float v91;
  float v92;
  float v93;
  float v94;
  float v95;
  float v96;
  float v97;
  void *v98;
  double v99;
  double v100;
  double v101;
  double v102;
  float64_t v103;
  float64_t v104;
  float v105;
  float v106;
  float v107;
  float v108;
  float v109;
  float v110;
  float v111;
  float v112;
  float v113;
  float v114;
  float v115;
  float v116;
  float v117;
  float v118;
  float v119;
  float v120;
  float v121;
  float v122;
  float v123;
  float v124;
  float v125;
  float v126;
  HgcTriangularCheckerboard *v127;
  double v128;
  double v129;
  double v130;
  __double2 v131;
  void *v132;
  double v133;
  double v134;
  double v135;
  double v136;
  float64_t v137;
  float64_t v138;
  float v139;
  float v140;
  float v141;
  float v142;
  float v143;
  float v144;
  float v145;
  float v146;
  float v147;
  float v148;
  float v149;
  float v150;
  float v151;
  float v152;
  float v153;
  float v154;
  float v155;
  float v156;
  float v157;
  float v158;
  float v159;
  float v160;
  float v161;
  float v162;
  float v163;
  float v164;
  float v165;
  float v166;
  float v167;
  float v168;
  float v169;
  float v170;
  float v171;
  float v172;
  float v173;
  float v174;
  float v175;
  float v176;
  float v177;
  float v178;
  float v179;
  float v180;
  float v181;
  float v182;
  float v183;
  float v184;
  float v185;
  float v186;
  float v187;
  float64_t v189;
  float64_t v190;
  double v191;
  HgcShapeCheckerboard *v192;
  double *v193;
  float64x2_t v194;
  double v195;
  double v196;
  int v197;
  double v198;
  double v199;
  double v200;
  double v201;
  double v202;
  int v203;
  int v204;
  double v205;
  double v206;
  int v207;
  int v208;
  double v209;
  double v210;
  double v211;
  double v212;
  double v213;
  double v214;
  double v215;
  double v216;
  double v217;
  double v218;
  double v219;
  double v220;
  double v221;
  int v222;

  v7 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v8 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v7)
    _ZF = v8 == 0;
  else
    _ZF = 1;
  if (_ZF)
    return 0;
  v11 = objc_msgSend(v8, "versionAtCreation");
  v222 = 0;
  v220 = 0.5;
  v221 = 0.5;
  v218 = 1.0;
  v219 = 1.0;
  v216 = 1.0;
  v217 = 1.0;
  v214 = 0.0;
  v215 = 0.0;
  v212 = 1.0;
  v213 = 0.0;
  v210 = 0.0;
  v211 = 80.0;
  v209 = 1.0;
  v208 = 0;
  v207 = 5;
  v205 = 1.0;
  v206 = 0.0;
  v203 = 5;
  v204 = 1;
  v201 = 1.0;
  v202 = 0.0;
  v199 = 8.0;
  v200 = 1.0;
  v198 = 0.0;
  v197 = 0;
  v196 = 1.0;
  v12 = objc_msgSend(a3, "height");
  v13 = objc_msgSend(a3, "width");
  objc_msgSend(v7, "getIntValue:fromParm:atFxTime:", &v222, 1, a4->var0.var1);
  objc_msgSend(v7, "getXValue:YValue:fromParm:atFxTime:", &v221, &v220, 310, a4->var0.var1);
  objc_msgSend(v7, "getRedValue:greenValue:blueValue:alphaValue:fromParm:atFxTime:", &v219, &v218, &v217, &v216, 311, a4->var0.var1);
  if (v11)
  {
    v218 = v216 * v218;
    v219 = v216 * v219;
    v217 = v216 * v217;
    objc_msgSend(v7, "getRedValue:greenValue:blueValue:alphaValue:fromParm:atFxTime:", &v215, &v214, &v213, &v212, 312, a4->var0.var1);
    v214 = v212 * v214;
    v215 = v212 * v215;
    v213 = v212 * v213;
  }
  else
  {
    objc_msgSend(v7, "getRedValue:greenValue:blueValue:alphaValue:fromParm:atFxTime:", &v215, &v214, &v213, &v212, 312, a4->var0.var1);
  }
  objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v211, 313, a4->var0.var1);
  objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v210, 2, a4->var0.var1);
  objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v209, 314, a4->var0.var1);
  objc_msgSend(v7, "getIntValue:fromParm:atFxTime:", &v208, 7, a4->var0.var1);
  objc_msgSend(v7, "getIntValue:fromParm:atFxTime:", &v207, 9, a4->var0.var1);
  objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v206, 10, a4->var0.var1);
  objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v205, 11, a4->var0.var1);
  objc_msgSend(v7, "getIntValue:fromParm:atFxTime:", &v204, 12, a4->var0.var1);
  objc_msgSend(v7, "getIntValue:fromParm:atFxTime:", &v203, 14, a4->var0.var1);
  objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v202, 15, a4->var0.var1);
  objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v201, 16, a4->var0.var1);
  objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v200, 17, a4->var0.var1);
  objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v199, 3, a4->var0.var1);
  objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v198, 4, a4->var0.var1);
  objc_msgSend(v7, "getIntValue:fromParm:atFxTime:", &v197, 5, a4->var0.var1);
  objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v196, 6, a4->var0.var1);
  v14 = objc_msgSend(a3, "origin");
  v15 = objc_msgSend(a3, "imageType");
  v10 = v15 == 3;
  if (v15 == 3)
  {
    switch(v222)
    {
      case 0:
        v16 = (HgcCheckerboard *)HGObject::operator new(0x1A0uLL);
        HgcCheckerboard::HgcCheckerboard(v16);
        *(_QWORD *)v16 = &unk_1E64E13B8;
        -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a3);
        v17 = (double)v12;
        if (v11)
        {
          v18 = v194.f64[0];
          v19 = v18;
        }
        else
        {
          v19 = 1.0;
        }
        v20 = v220 + -0.5;
        if (v14 != 2)
          v20 = -v20;
        v220 = v20 * v17;
        v221 = (v221 + -0.5) * (double)v13;
        v21 = v221;
        v22 = v20 * v17;
        (*(void (**)(HgcCheckerboard *, _QWORD, float, float, float, float))(*(_QWORD *)v16 + 96))(v16, 0, v21, v22, 0.0, 0.0);
        v23 = v219;
        v24 = v218;
        v25 = v217;
        v26 = v216;
        (*(void (**)(HgcCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v16 + 96))(v16, 1, v23, v24, v25, v26);
        v27 = v215;
        v28 = v214;
        v29 = v213;
        v30 = v212;
        (*(void (**)(HgcCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v16 + 96))(v16, 2, v27, v28, v29, v30);
        v209 = v209 * (v211 * 0.5);
        v31 = 1.0 / (v211 + v211);
        v32 = v209 + v209;
        v33 = (1.0 - v209) * 0.5;
        v34 = v17 * 0.5;
        (*(void (**)(HgcCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v16 + 96))(v16, 3, v31, v32, v33, v34);
        v36.n128_u32[0] = -1.0;
        if (v14 != 2)
          v36.n128_f32[0] = 1.0;
        v35.n128_f32[0] = v195;
        (*(void (**)(HgcCheckerboard *, uint64_t, float, __n128, __n128, float))(*(_QWORD *)v16 + 96))(v16, 4, v19, v35, v36, 0.0);
        v37 = __sincos_stret(v210);
        cosval = v37.__cosval;
        sinval = v37.__sinval;
        (*(void (**)(HgcCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v16 + 96))(v16, 5, cosval, -sinval, 0.0, 0.0);
        v40 = __sincos_stret(v210);
        v41 = v40.__sinval;
        v42 = v40.__cosval;
        (*(void (**)(HgcCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v16 + 96))(v16, 6, v41, v42, 0.0, 0.0);
        v43.n128_u32[0] = 1.0;
        if (!v11)
          v43.n128_f32[0] = 0.0;
        (*(void (**)(HgcCheckerboard *, uint64_t, __n128, float, float, float))(*(_QWORD *)v16 + 96))(v16, 7, v43, v43.n128_f32[0], v43.n128_f32[0], v43.n128_f32[0]);
        v193 = (double *)v16;
        (*(void (**)(HgcCheckerboard *))(*(_QWORD *)v16 + 16))(v16);
        objc_msgSend(a3, "setHeliumRef:", &v193);
        if (v193)
          (*(void (**)(double *))(*(_QWORD *)v193 + 24))(v193);
        (*(void (**)(HgcCheckerboard *))(*(_QWORD *)v16 + 24))(v16);
        break;
      case 1:
        objc_msgSend(a3, "bounds");
        v189 = v45;
        v190 = v44;
        v194 = (float64x2_t)xmmword_1B30507D0;
        objc_msgSend(v7, "getXValue:YValue:fromParm:atFxTime:", &v194, &v194.f64[1], 310, a4->var0.var1);
        __asm { FMOV            V1.2D, #1.0 }
        v50 = vsubq_f64(_Q1, v194);
        __asm { FMOV            V1.2D, #-0.5 }
        v52 = vaddq_f64(v50, _Q1);
        _Q1.f64[0] = v190;
        _Q1.f64[1] = v189;
        v194 = vmulq_f64(_Q1, v52);
        v53 = (void *)objc_msgSend(a3, "pixelTransform");
        objc_msgSend(v53, "transform2DPoint:", *(_OWORD *)&v194);
        v194.f64[0] = v54;
        v194.f64[1] = v55;
        v56 = v216 + v212;
        v57 = v219 + v215;
        v191 = v218 + v214;
        v58 = v217 + v213;
        v199 = 360.0 / (v199 + v199);
        v59 = v199 * 3.14159265;
        v60 = objc_msgSend(a3, "height");
        v198 = v198 * (6.28318531 / ((double)v60 / a4->var4));
        v61 = 1.0 / v196;
        v196 = v61;
        v211 = pow(v211, v61);
        v62 = v197;
        v63 = pow(v209 * 1.25, 3.0);
        if (v62)
          v63 = pow(v63, 1.0 / v61);
        v64 = v56 * 0.5;
        v65 = v57 * 0.5;
        v209 = v63;
        v193 = 0;
        v66 = v191 * 0.5;
        v67 = v58 * 0.5;
        v68 = v59 / 180.0;
        -[PAECheckerboard getTransformMatrix:forCenterX:centerY:angle:andOutputImage:](self, "getTransformMatrix:forCenterX:centerY:angle:andOutputImage:", &v193, a3, *(_OWORD *)&v194, v210);
        v69 = v197;
        v70 = (HgcConcentricTriangleChecker *)HGObject::operator new(0x1A0uLL);
        v71 = v70;
        if (v69)
        {
          HgcConcentricTriangleChecker::HgcConcentricTriangleChecker(v70);
          v72 = v199;
          (*(void (**)(HgcShapeCheckerboard *, _QWORD, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 0, v72, 0.0, 0.0, 0.0);
          v73 = v211;
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 1, v73, 0.0, 0.0, 0.0);
          v74 = v68;
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 2, v74, 0.0, 0.0, 0.0);
          v75 = v196;
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 3, v75, 0.0, 0.0, 0.0);
          v76 = v198;
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 4, v76, 0.0, 0.0, 0.0);
          v77 = v219;
          v78 = v218;
          v79 = v217;
          v80 = v216;
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 5, v77, v78, v79, v80);
          v81 = v215;
          v82 = v214;
          v83 = v213;
          v84 = v212;
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 6, v81, v82, v83, v84);
          v85 = v65;
          v86 = v66;
          v87 = v67;
          v88 = v64;
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 7, v85, v86, v87, v88);
          v89 = v209;
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 8, v89, 0.0, 0.0, 0.0);
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 9, 0.0, 0.0, 0.0, 0.0);
          v90 = *v193;
          v91 = v193[1];
          v92 = v193[2];
          v93 = v193[3];
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 10, v90, v91, v92, v93);
          v94 = v193[4];
          v95 = v193[5];
          v96 = v193[6];
          v97 = v193[7];
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 11, v94, v95, v96, v97);
          v192 = v71;
          (*(void (**)(HgcShapeCheckerboard *))(*(_QWORD *)v71 + 16))(v71);
          objc_msgSend(a3, "setHeliumRef:", &v192);
          if (v192)
            (*(void (**)(HgcShapeCheckerboard *))(*(_QWORD *)v192 + 24))(v192);
        }
        else
        {
          HgcConcentricSquareChecker::HgcConcentricSquareChecker(v70);
          v162 = v199;
          (*(void (**)(HgcShapeCheckerboard *, _QWORD, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 0, v162, 0.0, 0.0, 0.0);
          v163 = v211;
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 1, v163, 0.0, 0.0, 0.0);
          v164 = v68;
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 2, v164, 0.0, 0.0, 0.0);
          v165 = v196;
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 3, v165, 0.0, 0.0, 0.0);
          v166 = v198;
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 4, v166, 0.0, 0.0, 0.0);
          v167 = v219;
          v168 = v218;
          v169 = v217;
          v170 = v216;
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 5, v167, v168, v169, v170);
          v171 = v215;
          v172 = v214;
          v173 = v213;
          v174 = v212;
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 6, v171, v172, v173, v174);
          v175 = v65;
          v176 = v66;
          v177 = v67;
          v178 = v64;
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 7, v175, v176, v177, v178);
          v179 = v209;
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 8, v179, 0.0, 0.0, 0.0);
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 9, 0.0, 0.0, 0.0, 0.0);
          v180 = *v193;
          v181 = v193[1];
          v182 = v193[2];
          v183 = v193[3];
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 10, v180, v181, v182, v183);
          v184 = v193[4];
          v185 = v193[5];
          v186 = v193[6];
          v187 = v193[7];
          (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 11, v184, v185, v186, v187);
          v192 = v71;
          (*(void (**)(HgcShapeCheckerboard *))(*(_QWORD *)v71 + 16))(v71);
          objc_msgSend(a3, "setHeliumRef:", &v192);
          if (v192)
            (*(void (**)(HgcShapeCheckerboard *))(*(_QWORD *)v192 + 24))(v192);
        }
        goto LABEL_38;
      case 2:
        v98 = (void *)objc_msgSend(a3, "pixelTransform");
        objc_msgSend(a3, "bounds");
        v100 = v99;
        v102 = v101;
        v194 = (float64x2_t)xmmword_1B30507D0;
        objc_msgSend(v7, "getXValue:YValue:fromParm:atFxTime:", &v194, &v194.f64[1], 310, a4->var0.var1);
        v194.f64[0] = v100 * (0.5 - v194.f64[0]);
        v194.f64[1] = v102 * (0.5 - v194.f64[1]);
        objc_msgSend(v98, "transform2DPoint:");
        v194.f64[0] = v103;
        v194.f64[1] = v104;
        v209 = v209 * v209;
        v193 = 0;
        -[PAECheckerboard getTransformMatrix:forCenterX:centerY:angle:andOutputImage:](self, "getTransformMatrix:forCenterX:centerY:angle:andOutputImage:", &v193, a3);
        v71 = (HgcShapeCheckerboard *)HGObject::operator new(0x1A0uLL);
        HgcShapeCheckerboard::HgcShapeCheckerboard(v71);
        v105 = v211;
        (*(void (**)(HgcShapeCheckerboard *, _QWORD, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 0, v105, 0.0, 0.0, 0.0);
        v106 = v219;
        v107 = v218;
        v108 = v217;
        v109 = v216;
        (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 1, v106, v107, v108, v109);
        v110 = v215;
        v111 = v214;
        v112 = v213;
        v113 = v212;
        (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 2, v110, v111, v112, v113);
        (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 3, (float)v208, 0.0, 0.0, 0.0);
        (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 4, (float)v204, 0.0, 0.0, 0.0);
        (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 5, (float)v207, 0.0, 0.0, 0.0);
        (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 6, (float)v203, 0.0, 0.0, 0.0);
        v114 = v206;
        (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 7, v114, 0.0, 0.0, 0.0);
        v115 = v202;
        (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 8, v115, 0.0, 0.0, 0.0);
        v116 = v205;
        (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 9, v116, 0.0, 0.0, 0.0);
        v117 = v201;
        (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 10, v117, 0.0, 0.0, 0.0);
        v118 = v209;
        (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 11, v118, 0.0, 0.0, 0.0);
        v119 = *v193;
        v120 = v193[1];
        v121 = v193[2];
        v122 = v193[3];
        (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 12, v119, v120, v121, v122);
        v123 = v193[4];
        v124 = v193[5];
        v125 = v193[6];
        v126 = v193[7];
        (*(void (**)(HgcShapeCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v71 + 96))(v71, 13, v123, v124, v125, v126);
        v192 = v71;
        (*(void (**)(HgcShapeCheckerboard *))(*(_QWORD *)v71 + 16))(v71);
        objc_msgSend(a3, "setHeliumRef:", &v192);
        if (v192)
          (*(void (**)(HgcShapeCheckerboard *))(*(_QWORD *)v192 + 24))(v192);
LABEL_38:
        (*(void (**)(HgcShapeCheckerboard *))(*(_QWORD *)v71 + 24))(v71);
        break;
      case 3:
        v127 = (HgcTriangularCheckerboard *)HGObject::operator new(0x1A0uLL);
        HgcTriangularCheckerboard::HgcTriangularCheckerboard(v127);
        v209 = pow(v209, 3.0);
        v128 = v211 * 0.5;
        v129 = v200 * sqrt(v211 * v211 + v128 * v128 + v211 * (v128 + v128) * -0.5);
        v130 = atan(v129 / (v211 * 0.5));
        v131 = __sincos_stret(v130);
        v132 = (void *)objc_msgSend(a3, "pixelTransform");
        objc_msgSend(a3, "bounds");
        v134 = v133;
        v136 = v135;
        v194 = (float64x2_t)xmmword_1B30507D0;
        objc_msgSend(v7, "getXValue:YValue:fromParm:atFxTime:", &v194, &v194.f64[1], 310, a4->var0.var1);
        v194.f64[0] = v134 * (1.0 - v194.f64[0] + -0.5);
        v194.f64[1] = v136 * (1.0 - v194.f64[1] + -0.5);
        objc_msgSend(v132, "transform2DPoint:");
        v194.f64[0] = v137;
        v194.f64[1] = v138;
        v193 = 0;
        -[PAECheckerboard getTransformMatrix:forCenterX:centerY:angle:andOutputImage:](self, "getTransformMatrix:forCenterX:centerY:angle:andOutputImage:", &v193, a3);
        v139 = 1.0 / v128;
        v140 = 1.0 / v129;
        v141 = v128;
        v142 = v129;
        (*(void (**)(HgcTriangularCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v127 + 96))(v127, 6, v139, v140, v141, v142);
        v143 = v131.__sinval;
        v144 = v131.__cosval;
        (*(void (**)(HgcTriangularCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v127 + 96))(v127, 5, v143, v144, 0.0, 0.0);
        v145 = v209;
        (*(void (**)(HgcTriangularCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v127 + 96))(v127, 2, v145, 0.0, 0.0, 0.0);
        v146 = *v193;
        v147 = v193[1];
        v148 = v193[2];
        v149 = v193[3];
        (*(void (**)(HgcTriangularCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v127 + 96))(v127, 3, v146, v147, v148, v149);
        v150 = v193[4];
        v151 = v193[5];
        v152 = v193[6];
        v153 = v193[7];
        (*(void (**)(HgcTriangularCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v127 + 96))(v127, 4, v150, v151, v152, v153);
        v154 = v219;
        v155 = v218;
        v156 = v217;
        v157 = v216;
        (*(void (**)(HgcTriangularCheckerboard *, _QWORD, float, float, float, float))(*(_QWORD *)v127 + 96))(v127, 0, v154, v155, v156, v157);
        v158 = v215;
        v159 = v214;
        v160 = v213;
        v161 = v212;
        (*(void (**)(HgcTriangularCheckerboard *, uint64_t, float, float, float, float))(*(_QWORD *)v127 + 96))(v127, 1, v158, v159, v160, v161);
        v192 = v127;
        (*(void (**)(HgcTriangularCheckerboard *))(*(_QWORD *)v127 + 16))(v127);
        objc_msgSend(a3, "setHeliumRef:", &v192);
        if (v192)
          (*(void (**)(HgcShapeCheckerboard *))(*(_QWORD *)v192 + 24))(v192);
        (*(void (**)(HgcTriangularCheckerboard *))(*(_QWORD *)v127 + 24))(v127);
        break;
      default:
        return v10;
    }
  }
  return v10;
}

- (BOOL)frameSetup:(id *)a3 hardware:(BOOL *)a4 software:(BOOL *)a5
{
  __int128 v5;
  _OWORD v7[3];

  *a5 = 0;
  *a4 = 1;
  v5 = *(_OWORD *)&a3->var2;
  v7[0] = *(_OWORD *)&a3->var0.var0;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a3->var4;
  -[PAESharedDefaultBase overrideFrameSetupForRenderMode:hardware:software:](self, "overrideFrameSetupForRenderMode:hardware:software:", v7);
  return 1;
}

@end
