@implementation PAEBumpMap

- (PAEBumpMap)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEBumpMap;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

- (id)properties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("MayRemapTime"), v5, CFSTR("SupportsLargeRenderScale"), v6, CFSTR("SupportsHeliumRendering"), v7, CFSTR("InputSizeLimit"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  uint64_t v6;
  id result;
  objc_class *v8;
  id v9;
  double v10;

  v10 = 0.0;
  if ((objc_msgSend(-[PAEFilterDefaultBase getParamAPIWithError:](self, "getParamAPIWithError:", a4), "getFloatValue:fromParm:atFxTime:", &v10, 3, a3.var1) & 1) != 0)
  {
    if (v10 == 0.0)
      v6 = 6;
    else
      v6 = 1;
    return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6, v10), CFSTR("PixelTransformSupport"), 0);
  }
  else if (a4)
  {
    v8 = (objc_class *)objc_opt_class();
    v9 = -[PAEFilterDefaultBase getParamErrorFor:](self, "getParamErrorFor:", NSStringFromClass(v8));
    result = 0;
    *a4 = v9;
  }
  else
  {
    return 0;
  }
  return result;
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  BOOL v5;
  BOOL v6;
  unsigned int v7;
  void *v8;
  double v9;
  uint64_t v10;
  double v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PAEBumpMap;
  -[PAESharedDefaultBase addParameters](&v13, sel_addParameters);
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
    objc_msgSend(v3, "addImageReferenceWithName:parmId:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("BumpMap::Map Image"), 0, 0), 1, 0);
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("BumpMap::Controls"), 0, 0), 5, 0, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("BumpMap::Angle And Scale"), 0, 0), objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("BumpMap::X and Y Distance"), 0, 0), 0), 1);
    v9 = 10.0;
    objc_msgSend(v3, "addAngleSliderWithName:parmId:defaultValue:parameterMin:parameterMax:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("BumpMap::Direction"), 0, 0), 2, 0, 10.0, -6.28318531, 6.28318531);
    v10 = objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("BumpMap::Amount"), 0, 0);
    if (v7 >= 2)
      v11 = -10.0;
    else
      v11 = -1.0;
    if (v7 < 2)
      v9 = 1.0;
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", v10, 3, 0, 0.1, v11, v9, -1.0, 1.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("BumpMap::XScale"), 0, 0), 6, 2, 0.1, v11, v9, -1.0, 1.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("BumpMap::YScale"), 0, 0), 7, 2, 0.1, v11, v9, -1.0, 1.0, 0.1);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("BumpMap::Repeat Edges"), 0, 0), 4, 0, 33);
  }
  return v6;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  __double2 v9;
  void *v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  long double v16;
  double v17;
  int v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;

  v5 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v6 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A7268);
  v20 = *MEMORY[0x1E0CA2E68];
  v21 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  if (a3 != 5)
  {
    if ((a3 & 0xFFFFFFFE) == 6)
    {
      v16 = 0.0;
      v17 = 0.0;
      objc_msgSend(v5, "getFloatValue:fromParm:atFxTime:", &v17, 6, &v20);
      objc_msgSend(v5, "getFloatValue:fromParm:atFxTime:", &v16, 7, &v20);
      v14 = v16;
      v13 = v17;
      objc_msgSend(v6, "setFloatValue:toParm:atFxTime:", 2, &v20, (double)atan2(v17, v16));
      v10 = v6;
      v11 = sqrt(v13 * v13 + v14 * v14);
      v12 = 3;
    }
    else
    {
      if ((a3 & 0xFFFFFFFE) != 2)
        return 1;
      v16 = 0.0;
      v17 = 0.0;
      objc_msgSend(v5, "getFloatValue:fromParm:atFxTime:", &v17, 2, &v20);
      objc_msgSend(v5, "getFloatValue:fromParm:atFxTime:", &v16, 3, &v20);
      v8 = v16;
      v9 = __sincos_stret(v17);
      objc_msgSend(v6, "setFloatValue:toParm:atFxTime:", 6, &v20, v8 * v9.__sinval);
      v10 = v6;
      v11 = v8 * v9.__cosval;
      v12 = 7;
    }
    objc_msgSend(v10, "setFloatValue:toParm:atFxTime:", v12, &v20, v11);
    return 1;
  }
  LODWORD(v17) = 0;
  objc_msgSend(v5, "getIntValue:fromParm:atFxTime:", &v17, 5, &v20);
  LODWORD(v16) = 0;
  v19 = 0;
  v18 = 0;
  objc_msgSend(v5, "getParameterFlags:fromParm:", &v16, 2);
  objc_msgSend(v5, "getParameterFlags:fromParm:", (char *)&v19 + 4, 3);
  objc_msgSend(v5, "getParameterFlags:fromParm:", &v19, 6);
  objc_msgSend(v5, "getParameterFlags:fromParm:", &v18, 7);
  if (LODWORD(v17))
  {
    objc_msgSend(v6, "setParameterFlags:toParm:", LODWORD(v16) | 2u, 2);
    objc_msgSend(v6, "setParameterFlags:toParm:", HIDWORD(v19) | 2u, 3);
    objc_msgSend(v6, "setParameterFlags:toParm:", v19 & 0xFFFFFFFD, 6);
    v7 = v18 & 0xFFFFFFFD;
  }
  else
  {
    objc_msgSend(v6, "setParameterFlags:toParm:", LODWORD(v16) & 0xFFFFFFFD, 2);
    objc_msgSend(v6, "setParameterFlags:toParm:", HIDWORD(v19) & 0xFFFFFFFD, 3);
    objc_msgSend(v6, "setParameterFlags:toParm:", v19 | 2, 6);
    v7 = v18 | 2u;
  }
  objc_msgSend(v6, "setParameterFlags:toParm:", v7, 7);
  return 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  uint64_t v10;
  void *v12;
  unsigned int v13;
  int v14;
  unint64_t var2;
  unint64_t var5;
  uint64_t v21;
  double v22;
  unint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  __double2 v29;
  HGNode *v30;
  HgcBumpMap *v31;
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
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  uint64_t v51;
  HGNode *v52;
  _QWORD v53[17];
  double v54[16];
  _QWORD v55[3];
  __int128 v56;
  unint64_t v57;
  id v58;
  int v59;
  double v60;
  double v61;
  double v62;
  double v63;
  char v64;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v10 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v9)
    _ZF = v10 == 0;
  else
    _ZF = 1;
  if (_ZF)
    goto LABEL_16;
  v12 = (void *)v10;
  if (objc_msgSend(a4, "imageType") != 3)
    goto LABEL_16;
  v13 = objc_msgSend(v12, "versionAtCreation");
  v64 = 0;
  v62 = 0.0;
  v63 = 0.0;
  v60 = 0.0;
  v61 = 0.0;
  v59 = 0;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v62, 3, a5->var0.var1);
  if (v62 != 0.0)
  {
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v63, 2, a5->var0.var1, v62);
    objc_msgSend(v9, "getBoolValue:fromParm:atFxTime:", &v64, 4, a5->var0.var1);
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v61, 6, a5->var0.var1);
    objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v60, 7, a5->var0.var1);
    objc_msgSend(v9, "getIntValue:fromParm:atFxTime:", &v59, 5, a5->var0.var1);
    v14 = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
    if (!v14)
      return v14;
    if (objc_msgSend(a4, "imageType") == 3)
    {
      var2 = a5->var2;
      var5 = a5->var5;
      v55[0] = a5->var0.var1;
      v55[1] = 2;
      v55[2] = var2;
      __asm { FMOV            V1.2D, #1.0 }
      v56 = _Q1;
      v57 = var5;
      v58 = 0;
      -[PAESharedDefaultBase getHeliumImage:layerOffsetX:layerOffsetY:requestInfo:fromParm:atTime:](self, "getHeliumImage:layerOffsetX:layerOffsetY:requestInfo:fromParm:atTime:", &v58, 0, 0, v55, 1, v55[0]);
      -[PAESharedDefaultBase getImageBoundary:](self, "getImageBoundary:", a4);
      -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a3);
      -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
      if (v58)
      {
        -[PAESharedDefaultBase transformFromImage:toImage:fit:](self, "transformFromImage:toImage:fit:", v58, a4, 1);
        v21 = v53[0];
        if (v53[0] && fabs(v62) >= 0.0000001)
        {
          if (a4)
            objc_msgSend(a4, "heliumRef");
          else
            v53[0] = 0;
          if (v13 > 1)
          {
            if (v59)
            {
              v25 = v61 * 1.6875;
              v26 = v60 * 1.6875;
              goto LABEL_39;
            }
            v28 = v62 * 1.6875;
          }
          else
          {
            if (v59)
            {
              v22 = v61;
              v23 = objc_msgSend(a3, "height");
              v24 = v60;
              v25 = v22 * (double)v23 / 640.0;
              v26 = v24 * (double)(unint64_t)objc_msgSend(a3, "height") / 640.0;
              goto LABEL_39;
            }
            v27 = v62;
            v28 = v27 * (double)(unint64_t)objc_msgSend(a3, "height") / 640.0;
            v62 = v28;
          }
          v29 = __sincos_stret(v63);
          v25 = v28 * v29.__sinval;
          v26 = v28 * v29.__cosval;
LABEL_39:
          v30 = (HGNode *)v53[0];
          if (v53[0])
          {
            (*(void (**)(_QWORD))(*(_QWORD *)v53[0] + 16))(v53[0]);
            if (v64)
            {
              v51 = v53[0];
              (*(void (**)(_QWORD))(*(_QWORD *)v53[0] + 16))(v53[0]);
LABEL_44:
              -[PAESharedDefaultBase smear:fromImage:toImage:](self, "smear:fromImage:toImage:", &v51, a4, a4);
              if (v30 == v52)
              {
                if (v30)
                  (*(void (**)(HGNode *))(*(_QWORD *)v30 + 24))(v30);
              }
              else
              {
                if (v30)
                  (*(void (**)(HGNode *))(*(_QWORD *)v30 + 24))(v30);
                v30 = v52;
                v52 = 0;
              }
              if (v51)
                (*(void (**)(uint64_t))(*(_QWORD *)v51 + 24))(v51);
            }
          }
          else
          {
            if (v64)
            {
              v51 = 0;
              goto LABEL_44;
            }
            v30 = 0;
          }
          v31 = (HgcBumpMap *)HGObject::operator new(0x1A0uLL);
          HgcBumpMap::HgcBumpMap(v31);
          *(_QWORD *)v31 = &unk_1E64DCE38;
          HGNode::SetInput((HGNode *)v31, 1u, v30);
          (*(void (**)(HgcBumpMap *, _QWORD, uint64_t))(*(_QWORD *)v31 + 120))(v31, 0, v21);
          v32 = v26;
          v33 = v25;
          (*(void (**)(HgcBumpMap *, _QWORD, float, float, float, float))(*(_QWORD *)v31 + 96))(v31, 0, v33, v32, 0.0, 0.0);
          v34 = v54[0];
          v35 = v54[1];
          v36 = v54[2];
          v37 = v54[3];
          (*(void (**)(HgcBumpMap *, uint64_t, float, float, float, float))(*(_QWORD *)v31 + 96))(v31, 1, v34, v35, v36, v37);
          v38 = v54[4];
          v39 = v54[5];
          v40 = v54[6];
          v41 = v54[7];
          (*(void (**)(HgcBumpMap *, uint64_t, float, float, float, float))(*(_QWORD *)v31 + 96))(v31, 2, v38, v39, v40, v41);
          v42 = *(double *)&v53[1];
          v43 = *(double *)&v53[2];
          v44 = *(double *)&v53[3];
          v45 = *(double *)&v53[4];
          (*(void (**)(HgcBumpMap *, uint64_t, float, float, float, float))(*(_QWORD *)v31 + 96))(v31, 3, v42, v43, v44, v45);
          v46 = *(double *)&v53[5];
          v47 = *(double *)&v53[6];
          v48 = *(double *)&v53[7];
          v49 = *(double *)&v53[8];
          (*(void (**)(HgcBumpMap *, uint64_t, float, float, float, float))(*(_QWORD *)v31 + 96))(v31, 4, v46, v47, v48, v49);
          (*(void (**)(HgcBumpMap *, uint64_t, float, float, float, float))(*(_QWORD *)v31 + 96))(v31, 5, (float)v13, 0.0, 0.0, 0.0);
          v52 = (HGNode *)v31;
          (*(void (**)(HgcBumpMap *))(*(_QWORD *)v31 + 16))(v31);
          if (v64)
            -[PAESharedDefaultBase crop:fromImage:toImage:](self, "crop:fromImage:toImage:", &v52, a4, a3);
          objc_msgSend(a3, "setHeliumRef:", &v52, v51);
          if (v52)
            (*(void (**)(HGNode *))(*(_QWORD *)v52 + 24))(v52);
          (*(void (**)(HgcBumpMap *))(*(_QWORD *)v31 + 24))(v31);
          if (v30)
            (*(void (**)(HGNode *))(*(_QWORD *)v30 + 24))(v30);
          if (v53[0])
            (*(void (**)(_QWORD))(*(_QWORD *)v53[0] + 24))(v53[0]);
LABEL_28:

          if (v21)
            (*(void (**)(uint64_t))(*(_QWORD *)v21 + 24))(v21);
          goto LABEL_21;
        }
      }
      else
      {
        v21 = 0;
      }
      if (a4)
        objc_msgSend(a4, "heliumRef");
      else
        v53[0] = 0;
      objc_msgSend(a3, "setHeliumRef:", v53);
      if (v53[0])
        (*(void (**)(_QWORD))(*(_QWORD *)v53[0] + 24))(v53[0]);
      goto LABEL_28;
    }
LABEL_16:
    LOBYTE(v14) = 0;
    return v14;
  }
  if (a4)
    objc_msgSend(a4, "heliumRef", v62);
  else
    v54[0] = 0.0;
  objc_msgSend(a3, "setHeliumRef:", v54);
  if (*(_QWORD *)&v54[0])
    (*(void (**)(_QWORD))(**(_QWORD **)&v54[0] + 24))(*(_QWORD *)&v54[0]);
LABEL_21:
  LOBYTE(v14) = 1;
  return v14;
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
