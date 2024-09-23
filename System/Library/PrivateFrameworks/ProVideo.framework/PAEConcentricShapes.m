@implementation PAEConcentricShapes

- (PAEConcentricShapes)initWithAPIManager:(id)a3
{
  PAEConcentricShapes *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEConcentricShapes;
  result = -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
  if (result)
  {
    result->_lastWidth = 0.0;
    result->_lastHeight = 0.0;
    result->_lastScale = 1.0;
  }
  return result;
}

- (BOOL)variesOverTime
{
  return 0;
}

- (id)properties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("MayRemapTime"), v4, CFSTR("SupportsHeliumRendering"), v5, CFSTR("PixelTransformSupport"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  BOOL v5;
  BOOL v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PAEConcentricShapes;
  -[PAESharedDefaultBase addParameters](&v17, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
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
    objc_msgSend(v3, "startParameterSubGroup:parmId:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ConcentricCircles::Geometry"), 0, 0), 1, 0);
    v9 = objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ConcentricCircles::Shape"), 0, 0);
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", v9, 2, 0, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ConcentricCircles::Circles"), 0, 0), objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ConcentricCircles::Polygons"), 0, 0), 0), 1);
    LODWORD(v16) = 4;
    objc_msgSend(v3, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ConcentricCircles::Number of Sides"), 0, 0), 3, 3, 3, 100, 3, 0x100000064, v16);
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ConcentricCircles::Rotation"), 0, 0), 4, 4, 0.0, -3600.0, 3600.0);
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ConcentricCircles::Center"), 0, 0), 5, 0, 0.5, 0.5);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ConcentricCircles::Inner Cutoff"), 0, 0), 17, 0, 0.0, 0.0, 10000.0, 0.0, 2250.0, 10.0);
    v10 = objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ConcentricCircles::Cutoff"), 0, 0);
    if (v7)
      v11 = 4096.0;
    else
      v11 = 2048.0;
    if (v7)
      v12 = 4096.0;
    else
      v12 = 2250.0;
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", v10, 16, 0, v11, 0.0, 10000.0, 0.0, v12, 10.0);
    objc_msgSend(v3, "endParameterSubGroup");
    objc_msgSend(v3, "startParameterSubGroup:parmId:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ConcentricCircles::Coloring"), 0, 0), 7, 0);
    v13 = objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ConcentricCircles::Color Type"), 0, 0);
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", v13, 8, 0, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ConcentricCircles::2 Color"), 0, 0), objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ConcentricCircles::CTGradient"), 0, 0), 0), 1);
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:defaultAlpha:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ConcentricCircles::Color 1"), 0, 0), 9, 0, 0.0, 0.0, 0.0, 1.0);
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:defaultAlpha:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ConcentricCircles::Color 2"), 0, 0), 10, 0, 1.0, 1.0, 1.0, 1.0);
    objc_msgSend(v3, "addGradientWithName:parmId:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ConcentricCircles::Gradient"), 0, 0), 11, 2);
    v14 = objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ConcentricCircles::Gradient Handling"), 0, 0);
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", v14, 12, 0, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ConcentricCircles::GHClamp"), 0, 0), objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ConcentricCircles::GHMirror"), 0, 0), objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ConcentricCircles::GHRepeat"), 0, 0), 0), 3);
    objc_msgSend(v3, "endParameterSubGroup");
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ConcentricCircles::Width"), 0, 0), 13, 0, 50.0, 1.0, 2048.0, 1.0, 500.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ConcentricCircles::Contrast"), 0, 0), 14, 0, 0.84, 0.0, 1.0, 0.0, 1.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ConcentricCircles::Phase"), 0, 0), 15, 256, 0.0, -10000.0, 10000.0, -1000.0, 1000.0, 10.0);
  }
  return v6;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  void *v5;
  uint64_t v6;
  BOOL v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  int v19;
  unsigned int v20;
  unint64_t v21;
  unint64_t v22;
  __int128 v23;
  uint64_t v24;

  v5 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v6 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A7268);
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  v8 = !v7;
  if (!v7)
  {
    v9 = (void *)v6;
    v23 = *MEMORY[0x1E0CA2E68];
    v24 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    if (a3 == 8)
    {
      v21 = 0;
      v22 = 0;
      v20 = 0;
      objc_msgSend(v5, "getParameterFlags:fromParm:", (char *)&v22 + 4, 9);
      objc_msgSend(v5, "getParameterFlags:fromParm:", &v22, 10);
      objc_msgSend(v5, "getParameterFlags:fromParm:", (char *)&v21 + 4, 11);
      objc_msgSend(v5, "getParameterFlags:fromParm:", &v21, 14);
      objc_msgSend(v5, "getParameterFlags:fromParm:", &v20, 12);
      v19 = 0;
      objc_msgSend(v5, "getIntValue:fromParm:atFxTime:", &v19, 8, &v23);
      if (v19)
        v13 = HIDWORD(v22) | 2;
      else
        v13 = HIDWORD(v22) & 0xFFFFFFFD;
      if (v19)
        v14 = v22 | 2;
      else
        v14 = v22 & 0xFFFFFFFD;
      v22 = __PAIR64__(v13, v14);
      if (v19)
        v15 = v21 | 2;
      else
        v15 = v21 & 0xFFFFFFFD;
      if (v19)
        v16 = HIDWORD(v21) & 0xFFFFFFFD;
      else
        v16 = HIDWORD(v21) | 2;
      if (v19)
        v17 = v20 & 0xFFFFFFFD;
      else
        v17 = v20 | 2;
      v21 = __PAIR64__(v16, v15);
      v20 = v17;
      objc_msgSend(v9, "setParameterFlags:toParm:");
      objc_msgSend(v9, "setParameterFlags:toParm:", v22, 10);
      objc_msgSend(v9, "setParameterFlags:toParm:", v21, 14);
      objc_msgSend(v9, "setParameterFlags:toParm:", HIDWORD(v21), 11);
      v10 = v20;
      v11 = v9;
      v12 = 12;
      goto LABEL_27;
    }
    if (a3 == 2)
    {
      v22 = 0;
      objc_msgSend(v5, "getParameterFlags:fromParm:", (char *)&v22 + 4, 3);
      objc_msgSend(v5, "getParameterFlags:fromParm:", &v22, 4);
      HIDWORD(v21) = 0;
      objc_msgSend(v5, "getIntValue:fromParm:atFxTime:", (char *)&v21 + 4, 2, &v23);
      LODWORD(v22) = v22 & 0xFFFFFFFB | (4 * (HIDWORD(v21) == 0));
      HIDWORD(v22) = HIDWORD(v22) & 0xFFFFFFFB | (4 * (HIDWORD(v21) == 0));
      objc_msgSend(v9, "setParameterFlags:toParm:");
      v10 = v22;
      v11 = v9;
      v12 = 4;
LABEL_27:
      objc_msgSend(v11, "setParameterFlags:toParm:", v10, v12);
    }
  }
  return v8;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInfo:(id *)a4
{
  void *v7;
  uint64_t v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  int v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  double v18;
  double v19;
  double v20;
  int v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  HGBitmap *v28;
  double v29;
  uint64_t v30;
  uint64_t i;
  float *v32;
  float v33;
  float v34;
  float v35;
  float v36;
  BOOL v37;
  HgcConcentricPolygonsGradient *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  HGBitmapLoader *v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  float v57;
  float v58;
  float v59;
  float v60;
  __double2 v61;
  float cosval;
  float sinval;
  float v64;
  float v65;
  float v66;
  uint64_t v68;
  unsigned int v69;
  unsigned int v70;
  __int128 v71;
  double v72;
  HgcConcentricPolygonsGradient *v73;
  double v74;
  double v75;
  uint64_t v76;
  double v77;
  double v78;
  int v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  __int128 v90;
  int v91[3];

  self->_lastWidth = (double)(unint64_t)objc_msgSend(a3, "width");
  self->_lastHeight = (double)(unint64_t)objc_msgSend(a3, "height");
  self->_lastScale = a4->var4;
  v7 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v8 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A4B18);
  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
    return 0;
  v11 = (void *)v8;
  v12 = objc_msgSend(a3, "imageType");
  v13 = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a4->var0.var1);
  v91[0] = 0;
  v90 = 0uLL;
  v88 = 0.0;
  v89 = 0.0;
  v86 = 0.0;
  v87 = 0.0;
  v84 = 0.0;
  v85 = 0.0;
  v83 = 0.0;
  v81 = 0.0;
  v82 = 0.0;
  v80 = 0.0;
  v79 = 0;
  v77 = 0.0;
  v78 = 0.0;
  v75 = 2048.0;
  v76 = 0;
  v74 = 0.0;
  objc_msgSend(v7, "getIntValue:fromParm:atFxTime:", v91, 2, a4->var0.var1);
  objc_msgSend(v7, "getIntValue:fromParm:atFxTime:", &v79, 3, a4->var0.var1);
  objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v78, 4, a4->var0.var1);
  objc_msgSend(v7, "getXValue:YValue:fromParm:atFxTime:", &v90, (char *)&v90 + 8, 5, a4->var0.var1);
  -[PAESharedDefaultBase convertRelativeToPixelCoordinates:withImage:](self, "convertRelativeToPixelCoordinates:withImage:", &v90, a3);
  v90 = v71;
  objc_msgSend(v7, "getRedValue:greenValue:blueValue:alphaValue:fromParm:atFxTime:", &v89, &v88, &v87, &v86, 9, a4->var0.var1);
  v88 = v86 * v88;
  v89 = v86 * v89;
  v87 = v86 * v87;
  objc_msgSend(v7, "getRedValue:greenValue:blueValue:alphaValue:fromParm:atFxTime:", &v85, &v84, &v83, &v82, 10, a4->var0.var1);
  v84 = v82 * v84;
  v85 = v82 * v85;
  v83 = v82 * v83;
  objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v81, 13, a4->var0.var1);
  v14 = v81;
  objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v80, 14, a4->var0.var1);
  v15 = log10(v80 * 10.0);
  v16 = 1.0 / (1.0 - v15);
  v17 = v15 < 0.999999999;
  v18 = 1000000030.0;
  if (v17)
    v18 = v16;
  v80 = v18;
  objc_msgSend(v7, "getIntValue:fromParm:atFxTime:", (char *)&v76 + 4, 8, a4->var0.var1);
  objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v77, 15, a4->var0.var1);
  v19 = v77;
  v20 = -v77;
  v77 = -v77;
  v21 = HIDWORD(v76);
  if (v91[0] == 1)
  {
    v22 = v81;
    if (!HIDWORD(v76))
    {
      v28 = 0;
      v77 = fmod(v20, v81) / v22;
      goto LABEL_20;
    }
    v23 = fmod(v20, v81) / v22;
    v24 = floor(fabs(v20) / v22);
    if (v19 > 0.0)
      v24 = -v24;
    v77 = v23 + v24;
  }
  if (v21 == 1)
  {
    v25 = HGRectMake4i(0, 0, 0x100u, 1u);
    v27 = v26;
    v28 = (HGBitmap *)HGObject::operator new(0x80uLL);
    *(_QWORD *)&v29 = HGBitmap::HGBitmap(v28, v25, v27, 29).n128_u64[0];
    v30 = *((_QWORD *)v28 + 10);
    objc_msgSend(v11, "getGradientSamples:numSamples:depth:fromParm:atFxTime:", v30, 256, 4, 11, a4->var0.var1, v29);
    for (i = 0; i != 4096; i += 16)
    {
      v32 = (float *)(v30 + i);
      v33 = *(float *)(v30 + i);
      v34 = v33 * *(float *)(v30 + i + 4);
      v35 = v33 * *(float *)(v30 + i + 8);
      v36 = v33 * *(float *)(v30 + i + 12);
      v32[1] = v34;
      v32[2] = v35;
      v32[3] = v36;
    }
  }
  else
  {
    v28 = 0;
  }
LABEL_20:
  objc_msgSend(v7, "getIntValue:fromParm:atFxTime:", &v76, 12, a4->var0.var1);
  objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v75, 16, a4->var0.var1);
  objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v74, 17, a4->var0.var1);
  if (v13)
    v37 = v12 == 3;
  else
    v37 = 0;
  v10 = v37;
  if (v37)
  {
    v73 = 0;
    if (v91[0])
    {
      if (HIDWORD(v76))
      {
        v38 = (HgcConcentricPolygonsGradient *)HGObject::operator new(0x1A0uLL);
        HgcConcentricPolygonsGradient::HgcConcentricPolygonsGradient(v38);
        *(_QWORD *)v38 = &unk_1E64D95D0;
        v68 = 0x700000008;
        v69 = 6;
        v70 = 5;
        v73 = v38;
        v39 = 4;
        v40 = 3;
        v41 = 2;
        v42 = 1;
      }
      else
      {
        v38 = (HgcConcentricPolygonsGradient *)HGObject::operator new(0x1A0uLL);
        HgcConcentricPolygons::HgcConcentricPolygons(v38);
        if (v38)
          v73 = v38;
        v69 = 9;
        v70 = 8;
        v39 = 7;
        v40 = 6;
        v41 = 5;
        v42 = 3;
        v68 = 0x800000009;
      }
    }
    else if (HIDWORD(v76))
    {
      v38 = (HgcConcentricPolygonsGradient *)HGObject::operator new(0x1A0uLL);
      HgcConcentricCirclesGradient::HgcConcentricCirclesGradient(v38);
      *(_QWORD *)v38 = &unk_1E64E3578;
      v69 = 4;
      v70 = 3;
      v39 = 7;
      v73 = v38;
      v40 = 6;
      v41 = 2;
      v42 = 1;
      v68 = 0x500000006;
    }
    else
    {
      v38 = (HgcConcentricPolygonsGradient *)HGObject::operator new(0x1A0uLL);
      HgcConcentricCircles::HgcConcentricCircles(v38);
      if (v38)
        v73 = v38;
      v69 = 9;
      v70 = 8;
      v39 = 7;
      v40 = 6;
      v41 = 5;
      v42 = 3;
      v68 = 0x600000007;
    }
    if (HIDWORD(v76) == 1)
    {
      v43 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
      HGBitmapLoader::HGBitmapLoader(v43, v28);
      (*(void (**)(HgcConcentricPolygonsGradient *, _QWORD, HGBitmapLoader *))(*(_QWORD *)v38 + 120))(v38, 0, v43);
      if (v43)
        (*(void (**)(HGBitmapLoader *))(*(_QWORD *)v43 + 24))(v43);
    }
    -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a3);
    v44 = *(double *)&v90;
    v45 = *((double *)&v90 + 1);
    (*(void (**)(HgcConcentricPolygonsGradient *, _QWORD, float, float, float, float))(*(_QWORD *)v38 + 96))(v38, 0, v44, v45, 0.0, 0.0);
    v46 = v89;
    v47 = v88;
    v48 = v87;
    v49 = v86;
    (*(void (**)(HgcConcentricPolygonsGradient *, uint64_t, float, float, float, float))(*(_QWORD *)v38 + 96))(v38, 1, v46, v47, v48, v49);
    v50 = v85;
    v51 = v84;
    v52 = v83;
    v53 = v82;
    (*(void (**)(HgcConcentricPolygonsGradient *, uint64_t, float, float, float, float))(*(_QWORD *)v38 + 96))(v38, 2, v50, v51, v52, v53);
    v54 = v81;
    v55 = v77;
    (*(void (**)(HgcConcentricPolygonsGradient *, uint64_t, float, float, float, float))(*(_QWORD *)v38 + 96))(v38, v42, v54, v55, 0.0, 0.0);
    v56 = v80;
    (*(void (**)(HgcConcentricPolygonsGradient *, uint64_t, float, float, float, float))(*(_QWORD *)v38 + 96))(v38, 4, v56, 0.0, 0.0, 0.0);
    v57 = *(double *)&v71;
    v58 = v72;
    (*(void (**)(HgcConcentricPolygonsGradient *, uint64_t, float, float, float, float))(*(_QWORD *)v38 + 96))(v38, v41, v57, fabsf(v58), 1.0, 0.0);
    v59 = 6.28318531 / (double)v79;
    v60 = (double)v79 / 6.28318531;
    (*(void (**)(HgcConcentricPolygonsGradient *, uint64_t, float, float, float, float))(*(_QWORD *)v38 + 96))(v38, v40, v59, v60, 0.0, 0.0);
    v61 = __sincos_stret(v78);
    cosval = v61.__cosval;
    sinval = v61.__sinval;
    (*(void (**)(HgcConcentricPolygonsGradient *, uint64_t, float, float, float))(*(_QWORD *)v38 + 96))(v38, v39, cosval, sinval, -sinval);
    v64 = 1.0 / v14;
    (*(void (**)(HgcConcentricPolygonsGradient *, _QWORD, float, float, float, float))(*(_QWORD *)v38 + 96))(v38, v70, v64, 0.0, 0.0, 0.0);
    (*(void (**)(HgcConcentricPolygonsGradient *, _QWORD, float, float, float, float))(*(_QWORD *)v38 + 96))(v38, v69, (float)(v76 - 1), 0.0, 0.0, 0.0);
    v65 = v75;
    (*(void (**)(HgcConcentricPolygonsGradient *, _QWORD, float, float, float, float))(*(_QWORD *)v38 + 96))(v38, HIDWORD(v68), v65, 0.0, 0.0, 0.0);
    v66 = v74;
    (*(void (**)(HgcConcentricPolygonsGradient *, _QWORD, float, float, float, float))(*(_QWORD *)v38 + 96))(v38, v68, v66, 0.0, 0.0, 0.0);
    objc_msgSend(a3, "setHeliumRef:", &v73);
    if (v73)
      (*(void (**)(HgcConcentricPolygonsGradient *))(*(_QWORD *)v73 + 24))(v73);
  }
  if (v28)
    (*(void (**)(HGBitmap *))(*(_QWORD *)v28 + 24))(v28);
  return v10;
}

- (BOOL)frameSetup:(id *)a3 hardware:(BOOL *)a4 software:(BOOL *)a5
{
  __int128 v5;
  _OWORD v7[3];

  *a5 = 0;
  *a4 = 0;
  v5 = *(_OWORD *)&a3->var2;
  v7[0] = *(_OWORD *)&a3->var0.var0;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a3->var4;
  -[PAESharedDefaultBase overrideFrameSetupForRenderMode:hardware:software:](self, "overrideFrameSetupForRenderMode:hardware:software:", v7);
  return 1;
}

- (BOOL)frameCleanup
{
  return 1;
}

@end
