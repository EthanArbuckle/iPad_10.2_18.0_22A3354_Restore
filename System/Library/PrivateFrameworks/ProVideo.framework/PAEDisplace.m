@implementation PAEDisplace

- (PAEDisplace)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEDisplace;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (void)getEdgeMode:(unsigned int *)a3 withInfo:(id *)a4
{
  *a3 = 1;
}

- (void)filteredEdges:(BOOL *)a3 withInfo:(id *)a4
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
  uint64_t v8;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("MayRemapTime"), v5, CFSTR("SupportsLargeRenderScale"), v6, CFSTR("SupportsHeliumRendering"), v7, CFSTR("InputSizeLimit"), v8, CFSTR("PixelTransformSupport"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAEDisplace;
  -[PAESharedDefaultBase addParameters](&v6, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addImageReferenceWithName:parmId:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Displace::Map Image"), 0, 0), 1, 0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Displace::Horizontal Scale"), 0, 0), 3, 0, 0.1, -1.0, 1.0, -1.0, 1.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Displace::Vertical Scale"), 0, 0), 4, 0, 0.1, -1.0, 1.0, -1.0, 1.0, 0.1);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Displace::Repeat Edges"), 0, 0), 5, 0, 1);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  BOOL v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  float v19;
  float v20;
  float v21;
  float v22;
  HGXForm *v23;
  HgcDisplace *v24;
  __n128 v25;
  float v26;
  float v27;
  float v28;
  char *v29;
  float v30;
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
  double v42;
  double v43;
  float v44;
  float v45;
  HgcDisplace *v47;
  uint64_t v48;
  uint64_t v49;
  float v50;
  float v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  _OWORD v68[3];
  id v69;
  double v70;
  double v71;
  char v72;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (!v9)
    return 0;
  v10 = v9;
  v72 = 0;
  v70 = 0.0;
  v71 = 0.0;
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v71, 3, a5->var0.var1);
  objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v70, 4, a5->var0.var1);
  objc_msgSend(v10, "getBoolValue:fromParm:atFxTime:", &v72, 5, a5->var0.var1);
  v11 = objc_msgSend(a3, "imageType");
  if (-[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1))
    v12 = v11 == 3;
  else
    v12 = 0;
  v13 = v12;
  if (v12)
  {
    v69 = 0;
    v14 = *(_OWORD *)&a5->var2;
    v15 = *(_OWORD *)&a5->var4;
    v68[0] = *(_OWORD *)&a5->var0.var0;
    v68[1] = v14;
    v68[2] = v15;
    -[PAESharedDefaultBase getHeliumImage:layerOffsetX:layerOffsetY:requestInfo:fromParm:atTime:](self, "getHeliumImage:layerOffsetX:layerOffsetY:requestInfo:fromParm:atTime:", &v69, 0, 0, v68, 1, a5->var0.var1);
    if (v69)
    {
      objc_msgSend(v69, "heliumRef");
      v16 = v49;
      v17 = objc_msgSend(v69, "width");
      v18 = objc_msgSend(v69, "height");
    }
    else
    {
      v16 = 0;
      v17 = 0;
      v18 = 0;
    }
    -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
    -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a4);
    if (v16 && v17 && v18)
    {
      -[PAESharedDefaultBase getImageBoundary:](self, "getImageBoundary:", a4);
      v19 = v50;
      v20 = v51;
      HGTransform::HGTransform((HGTransform *)&v49);
      v21 = (double)v17 / a5->var3;
      v22 = (double)v18 / a5->var4;
      HGTransform::Scale((HGTransform *)&v49, v19 / (v21 + 4.0), v20 / (v22 + 4.0), 1.0);
      v23 = (HGXForm *)HGObject::operator new(0x210uLL);
      HGXForm::HGXForm(v23);
      (*(void (**)(HGXForm *, uint64_t *))(*(_QWORD *)v23 + 576))(v23, &v49);
      (*(void (**)(HGXForm *, _QWORD, uint64_t))(*(_QWORD *)v23 + 120))(v23, 0, v16);
      (*(void (**)(HGXForm *, _QWORD, uint64_t))(*(_QWORD *)v23 + 136))(v23, 0, 32);
      if (a4)
        objc_msgSend(a4, "heliumRef");
      else
        v48 = 0;
      v24 = (HgcDisplace *)HGObject::operator new(0x1A0uLL);
      HgcDisplace::HgcDisplace(v24);
      *(_QWORD *)v24 = &unk_1E64DD0A0;
      v25.n128_u32[1] = HIDWORD(v60);
      v25.n128_f32[0] = v60;
      v26 = v61;
      v27 = v62;
      v28 = v63;
      HgcDisplace::SetParameter(v24, 0, v25, v26, v27, v28, v29);
      v30 = v64;
      v31 = v65;
      v32 = v66;
      v33 = v67;
      (*(void (**)(HgcDisplace *, uint64_t, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, 1, v30, v31, v32, v33);
      v34 = v52;
      v35 = v53;
      v36 = v54;
      v37 = v55;
      (*(void (**)(HgcDisplace *, uint64_t, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, 2, v34, v35, v36, v37);
      v38 = v56;
      v39 = v57;
      v40 = v58;
      v41 = v59;
      (*(void (**)(HgcDisplace *, uint64_t, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, 3, v38, v39, v40, v41);
      v70 = v70 * v57;
      v71 = v71 * v52;
      v42 = v71;
      v71 = v42 * (float)(unint64_t)objc_msgSend(a3, "height") / -640.0;
      v43 = v70;
      v70 = v43 * (float)(unint64_t)objc_msgSend(a3, "height") / 640.0;
      v44 = v71;
      v45 = v70;
      (*(void (**)(HgcDisplace *, uint64_t, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, 4, v44, v45, 0.0, 0.0);
      (*(void (**)(HgcDisplace *, uint64_t, uint64_t))(*(_QWORD *)v24 + 120))(v24, 1, v48);
      (*(void (**)(HgcDisplace *, _QWORD, HGXForm *))(*(_QWORD *)v24 + 120))(v24, 0, v23);
      v47 = v24;
      (*(void (**)(HgcDisplace *))(*(_QWORD *)v24 + 16))(v24);
      if (v72)
        -[PAESharedDefaultBase crop:fromImage:toImage:](self, "crop:fromImage:toImage:", &v47, a4, a3);
      objc_msgSend(a3, "setHeliumRef:", &v47);

      if (v47)
        (*(void (**)(HgcDisplace *))(*(_QWORD *)v47 + 24))(v47);
      (*(void (**)(HgcDisplace *))(*(_QWORD *)v24 + 24))(v24);
      if (v48)
        (*(void (**)(uint64_t))(*(_QWORD *)v48 + 24))(v48);
      (*(void (**)(HGXForm *))(*(_QWORD *)v23 + 24))(v23);
      HGTransform::~HGTransform((HGTransform *)&v49);
    }
    else
    {
      if (a4)
        objc_msgSend(a4, "heliumRef");
      else
        v49 = 0;
      objc_msgSend(a3, "setHeliumRef:", &v49);
      if (v49)
        (*(void (**)(uint64_t))(*(_QWORD *)v49 + 24))(v49);
      if (!v16)
        return v13;
    }
    (*(void (**)(uint64_t))(*(_QWORD *)v16 + 24))(v16);
  }
  return v13;
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
