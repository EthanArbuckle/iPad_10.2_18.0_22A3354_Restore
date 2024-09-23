@implementation PAEZoomBlur

- (PAEZoomBlur)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEZoomBlur;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PAEZoomBlur;
  -[PAESharedDefaultBase dealloc](&v2, sel_dealloc);
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
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("MayRemapTime"), v5, CFSTR("SupportsLargeRenderScale"), v6, CFSTR("SupportsHeliumRendering"), v7, CFSTR("InputSizeLimit"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  id v7;
  uint64_t v9;
  id result;
  objc_class *v11;
  id v12;
  char v13;
  double v14;

  v7 = -[PAEFilterDefaultBase getParamAPIWithError:](self, "getParamAPIWithError:", a4);
  v14 = 0.0;
  if ((objc_msgSend(v7, "getFloatValue:fromParm:atFxTime:", &v14, 1, a3.var1) & 1) != 0
    && (v13 = 0, (objc_msgSend(v7, "getBoolValue:fromParm:atFxTime:", &v13, 3, a3.var1) & 1) != 0))
  {
    if (v14 == 0.0 && v13 == 0)
      v9 = 6;
    else
      v9 = 1;
    return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9, v14), CFSTR("PixelTransformSupport"), 0);
  }
  else if (a4)
  {
    v11 = (objc_class *)objc_opt_class();
    v12 = -[PAEFilterDefaultBase getParamErrorFor:](self, "getParamErrorFor:", NSStringFromClass(v11));
    result = 0;
    *a4 = v12;
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
  uint64_t v9;
  double v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PAEZoomBlur;
  -[PAESharedDefaultBase addParameters](&v12, sel_addParameters);
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
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Zoomblur::Look"), 0, 0), 5, 0, objc_msgSend((id)objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Zoomblur::Look Entries"), 0, 0), "componentsSeparatedByString:", CFSTR("|")), 1);
    v9 = objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Zoomblur::Amount"), 0, 0);
    if (v7 >= 2)
      v10 = 1000.0;
    else
      v10 = 100.0;
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", v9, 1, 0, 2.0, 0.0, v10, 0.0, 32.0, 1.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Zoomblur::Swirliness"), 0, 0), 4, 0, 0.0, -1.0, 1.0, -1.0, 1.0, 0.1);
    objc_msgSend(v3, "addPointParameterWithName:parmId:defaultX:defaultY:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Zoomblur::Center"), 0, 0), 2, 0, 0.5, 0.5);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Zoomblur::Crop"), 0, 0), 3, 0, 33);
  }
  return v6;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  return 1;
}

- (void)constrainWidth:(unint64_t *)a3 andHeight:(unint64_t *)a4 withImageInfo:(id *)a5
{
  double v5;
  double v6;
  unint64_t v7;
  unint64_t v8;

  v5 = (double)*a3;
  v6 = (double)*a4;
  if (v5 / v6 <= 1.0)
  {
    if (*a4 < 0xFFD)
      return;
    v8 = (unint64_t)(v5 * 4092.0 / v6);
    v7 = 4092;
  }
  else
  {
    if (*a3 < 0xFFD)
      return;
    v7 = (unint64_t)(v6 * 4092.0 / v5);
    v8 = 4092;
  }
  *a3 = v8;
  *a4 = v7;
}

- (BOOL)getOutputWidth:(unint64_t *)a3 height:(unint64_t *)a4 withInput:(id *)a5 withInfo:(id *)a6
{
  unint64_t *v9;
  unint64_t *v10;
  void *v11;
  void *v12;
  unint64_t var1;
  unint64_t var0;
  unint64_t *v15;
  double v16;
  double v17;
  double v18;
  signed int v19;
  float v20;
  float v21;
  float v22;
  __int128 v23;
  __int128 v24;
  _OWORD v26[4];
  double var8;
  double v28;
  double v29;
  int v30;
  char v31;
  double v32;
  uint64_t v33;

  if (a3)
    v9 = a3;
  else
    v9 = (unint64_t *)&v33;
  if (a4)
    v10 = a4;
  else
    v10 = (unint64_t *)&v33;
  v11 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A4590);
  v12 = v11;
  if (v11)
  {
    v32 = 0.0;
    v33 = 0;
    objc_msgSend(v11, "getFloatValue:fromParm:atFxTime:", &v32, 1, a6->var0.var1);
    v31 = 0;
    objc_msgSend(v12, "getBoolValue:fromParm:atFxTime:", &v31, 3, a6->var0.var1);
    v30 = 0;
    objc_msgSend(v12, "getIntValue:fromParm:atFxTime:", &v30, 5, a6->var0.var1);
    var0 = a5->var0;
    var1 = a5->var1;
    v28 = 0.5;
    v29 = 0.5;
    objc_msgSend(v12, "getXValue:YValue:fromParm:atFxTime:", &v29, &v28, 2, a6->var0.var1);
    v16 = v28;
    if (a5->var5 == 2)
      v16 = 1.0 - v28;
    v17 = v29 * (double)var0;
    v18 = v16 * (double)var1;
    v28 = v18;
    v29 = v17;
    if (v31 || v32 == 0.0)
    {
      *v9 = var0;
      *v10 = var1;
    }
    else if (v30 == 1)
    {
      v19 = 3 * vcvtpd_s64_f64(v32);
      *v9 = var0 + v19;
      *v10 = var1 + v19;
    }
    else
    {
      v20 = v32;
      v21 = v17;
      v22 = v18;
      HZoomBlur::getOutputWidthAndHeight((HZoomBlur *)LODWORD(a5->var0), a5->var1, v9, v20, v21, v22, v10, v15);
      v23 = *(_OWORD *)&a5->var6;
      v26[2] = *(_OWORD *)&a5->var4;
      v26[3] = v23;
      var8 = a5->var8;
      v24 = *(_OWORD *)&a5->var2;
      v26[0] = *(_OWORD *)&a5->var0;
      v26[1] = v24;
      -[PAEZoomBlur constrainWidth:andHeight:withImageInfo:](self, "constrainWidth:andHeight:withImageInfo:", v9, v10, v26);
    }
  }
  return v12 != 0;
}

- (void)polarToRect:(id)a3 withInputImage:(id)a4 withInputNode:(HGRef<HGNode>)a5 centerX:(double)a6 centerY:(double)a7 upscaleFactor:(double)a8 andOutputNode:(void *)a9
{
  id v17;
  unint64_t v18;
  unint64_t v19;
  double v20;
  double v21;
  HgcPolarToRect *v22;
  float v23;
  float v24;
  double v25;
  double v26;
  double v27;
  double v28;
  float v29;
  unsigned int v30;
  unsigned int v31;
  unsigned __int32 v32;
  float v33;
  double v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  int v46;
  HGTextureWrap *v47;
  char *v48;
  HGCrop *v49;
  uint64_t v50;
  int v51;
  int v52;
  HGTextureWrap *v53;
  char *v54;
  uint64_t v55;
  double v56;
  float v57;
  float v58;
  __n128 v59;
  double v60;
  double v61;
  double v62;
  double v63;

  if (objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190), "versionAtCreation"))v17 = a4;
  else
    v17 = a3;
  v18 = objc_msgSend(v17, "width");
  v19 = objc_msgSend(v17, "height");
  -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a3);
  -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
  v20 = v62;
  v21 = v63;
  v22 = (HgcPolarToRect *)HGObject::operator new(0x1C0uLL);
  HgcPolarToRect::HgcPolarToRect(v22);
  v23 = (double)v18 * a8;
  v24 = (double)v19 * a8;
  v25 = floor(v23 * 0.5);
  *(float *)&v25 = v25 + v25;
  *(_QWORD *)v22 = &unk_1E64E3E00;
  *((_BYTE *)v22 + 432) = 0;
  v57 = *(float *)&v25;
  v58 = v24;
  v26 = *(float *)&v25;
  v56 = *(float *)&v25 * -0.5;
  *(float *)&v25 = floor(v56);
  v27 = v24;
  v28 = floor(v24 * -0.5);
  *(float *)&v28 = v28;
  v29 = ceil(v26 * 0.5);
  v59.n128_u32[0] = HGRectfMake4f(*(float *)&v25, v28, v29);
  *(unint64_t *)((char *)v59.n128_u64 + 4) = __PAIR64__(v31, v30);
  v59.n128_u32[3] = v32;
  HFunHouse::SetRect((__n128 *)v22, &v59);
  *((_BYTE *)v22 + 432) = 1;
  v33 = 6.28318531 / (v20 * v26);
  (*(void (**)(HgcPolarToRect *, _QWORD, float, float, float, float))(*(_QWORD *)v22 + 96))(v22, 0, v33, v33, v33, v33);
  v34 = fabs(v21);
  v35 = v20 * (v26 * a6);
  v36 = v27 * a7 * v34;
  (*(void (**)(HgcPolarToRect *, uint64_t, float, float, float, float))(*(_QWORD *)v22 + 96))(v22, 1, v35, v36, 0.0, 0.0);
  v37 = v20 * v26 * 0.5;
  v38 = v34 * v27 * 0.5;
  (*(void (**)(HgcPolarToRect *, uint64_t, float, float, float, float))(*(_QWORD *)v22 + 96))(v22, 2, v37, v38, 0.0, 0.0);
  v39 = v62;
  v40 = v63;
  (*(void (**)(HgcPolarToRect *, uint64_t, float, float, float, float))(*(_QWORD *)v22 + 96))(v22, 3, v39, v40, 0.0, 0.0);
  v41 = v60;
  v42 = v61;
  (*(void (**)(HgcPolarToRect *, uint64_t, float, float, float, float))(*(_QWORD *)v22 + 96))(v22, 4, v41, v42, 0.0, 0.0);
  (*(void (**)(HgcPolarToRect *, uint64_t, float, float, float, float))(*(_QWORD *)v22 + 96))(v22, 5, 1.0, 0.0, 0.0, 0.0);
  (*(void (**)(HgcPolarToRect *, _QWORD, _QWORD))(*(_QWORD *)v22 + 120))(v22, 0, *(_QWORD *)a5.var0);
  LODWORD(v19) = (int)(v26 * 0.5);
  v43 = HGRectMake4i((int)((float)-v57 * 0.5), (int)((float)-v58 * 0.5), v19, (int)(v27 * 0.5));
  (*(void (**)(HgcPolarToRect *, _QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)v22 + 392))(v22, 0, 0, v43, v44);
  v46 = v45;
  v47 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
  HGTextureWrap::HGTextureWrap(v47);
  HGTextureWrap::SetTextureWrapMode((uint64_t)v47, (const char *)2, v48);
  (*(void (**)(HGTextureWrap *, _QWORD, HgcPolarToRect *))(*(_QWORD *)v47 + 120))(v47, 0, v22);
  v49 = (HGCrop *)HGObject::operator new(0x1A0uLL);
  HGCrop::HGCrop(v49);
  (*(void (**)(HGCrop *, _QWORD, HGTextureWrap *))(*(_QWORD *)v49 + 120))(v49, 0, v47);
  v50 = HGRectMake4i((int)v56, (int)(float)-v58, v19, (int)(float)v46);
  (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v49 + 96))(v49, 0, (float)(int)v50, (float)SHIDWORD(v50), (float)v51, (float)v52);
  v53 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
  HGTextureWrap::HGTextureWrap(v53);
  HGTextureWrap::SetTextureWrapMode((uint64_t)v53, (const char *)3, v54);
  (*(void (**)(HGTextureWrap *, _QWORD, HGCrop *))(*(_QWORD *)v53 + 120))(v53, 0, v49);
  v55 = *(_QWORD *)a9;
  if (*(HGTextureWrap **)a9 != v53)
  {
    if (v55)
      (*(void (**)(uint64_t))(*(_QWORD *)v55 + 24))(v55);
    *(_QWORD *)a9 = v53;
    (*(void (**)(HGTextureWrap *))(*(_QWORD *)v53 + 16))(v53);
  }
  (*(void (**)(HGTextureWrap *))(*(_QWORD *)v53 + 24))(v53);
  (*(void (**)(HGCrop *))(*(_QWORD *)v49 + 24))(v49);
  (*(void (**)(HGTextureWrap *))(*(_QWORD *)v47 + 24))(v47);
  (*(void (**)(HgcPolarToRect *))(*(_QWORD *)v22 + 24))(v22);
}

- (void)rectToPolar:(id)a3 withInputImage:(id)a4 withInputNode:(HGRef<HGNode>)a5 centerX:(double)a6 centerY:(double)a7 upscaleFactor:(double)a8 andOutputNode:(void *)a9
{
  int v17;
  double v18;
  double v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  HgcRectToPolar *v24;
  double v25;
  float v26;
  double v27;
  float v28;
  unsigned int v29;
  unsigned int v30;
  unsigned __int32 v31;
  float v32;
  float v33;
  double v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  double v41;
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  HGTextureWrap *v51;
  char *v52;
  HGCrop *v53;
  double v54;
  float v55;
  double v56;
  float v57;
  double v58;
  float v59;
  HgcRectToPolar *v60;
  float v61;
  float v62;
  float v63;
  HGTextureWrap *v64;
  char *v65;
  HGCrop *v66;
  double v67;
  double v68;
  float v69;
  double v70;
  float v71;
  HGHWBlendFlipped *v72;
  uint64_t v73;
  float v74;
  float v75;
  float v76;
  double v77;
  int v78;
  float v79;
  uint64_t v80;
  int v81;
  int v82;
  __n128 v83;
  double v84;
  double v85;
  double v86;
  double v87;

  v17 = objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190), "versionAtCreation");
  -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a3);
  -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
  v18 = v86;
  v19 = v87;
  if (!v17)
    a4 = a3;
  v20 = objc_msgSend(a4, "width");
  v21 = objc_msgSend(a4, "height");
  v22 = objc_msgSend(a3, "width");
  v23 = objc_msgSend(a3, "height");
  v24 = (HgcRectToPolar *)HGObject::operator new(0x1B0uLL);
  HgcRectToPolar::HgcRectToPolar(v24);
  v25 = (double)v22 * a8;
  *(_QWORD *)v24 = &unk_1E64E0058;
  v26 = v25 * -0.5;
  v27 = (double)v23 * a8 * -0.5;
  *(float *)&v27 = v27;
  v77 = v25;
  v28 = v25 * 0.5;
  v74 = v26;
  v78 = LODWORD(v27);
  v83.n128_u32[0] = HGRectfMake4f(v26, v27, v28);
  *(unint64_t *)((char *)v83.n128_u64 + 4) = __PAIR64__(v30, v29);
  v83.n128_u32[3] = v31;
  HFunHouse::SetRect((__n128 *)v24, &v83);
  v32 = v18;
  v33 = (double)v20 * a8;
  v34 = floor(v33 * 0.5);
  v35 = v34 + v34;
  v79 = v32;
  v36 = v32 * v35;
  v37 = (float)(v32 * v35) / 6.28318531;
  (*(void (**)(HgcRectToPolar *, _QWORD, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, 0, v37, v37, v37, v37);
  v38 = v19;
  v39 = fabsf(v38);
  v40 = (double)v21 * a8;
  v41 = v35;
  v42 = v35 * a6;
  v43 = v40 * a7;
  v76 = v39 * v43;
  (*(void (**)(HgcRectToPolar *, uint64_t))(*(_QWORD *)v24 + 96))(v24, 1);
  v44 = (v41 + -1.0) * v79;
  v45 = (v40 + -1.0) * v39;
  v75 = v44;
  (*(void (**)(HgcRectToPolar *, uint64_t))(*(_QWORD *)v24 + 96))(v24, 2);
  (*(void (**)(HgcRectToPolar *, uint64_t, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, 3, -1.0, 0.0, 0.0, 0.0);
  v46 = v87;
  (*(void (**)(HgcRectToPolar *, uint64_t, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, 4, v79, v46, 0.0, 0.0);
  v47 = v84;
  v48 = v85;
  (*(void (**)(HgcRectToPolar *, uint64_t, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, 5, v47, v48, 0.0, 0.0);
  v49 = v36 * 0.5;
  v50 = (float)(v39 * v40) * 0.5;
  (*(void (**)(HgcRectToPolar *, uint64_t, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, 6, v49, v50, 0.0, 0.0);
  v51 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
  HGTextureWrap::HGTextureWrap(v51);
  HGTextureWrap::SetTextureWrapMode((uint64_t)v51, (const char *)1, v52);
  (*(void (**)(HGTextureWrap *, _QWORD, _QWORD))(*(_QWORD *)v51 + 120))(v51, 0, *(_QWORD *)a5.var0);
  (*(void (**)(HgcRectToPolar *, _QWORD, HGTextureWrap *))(*(_QWORD *)v24 + 120))(v24, 0, v51);
  v53 = (HGCrop *)HGObject::operator new(0x1A0uLL);
  HGCrop::HGCrop(v53);
  (*(void (**)(HGCrop *, _QWORD, HgcRectToPolar *))(*(_QWORD *)v53 + 120))(v53, 0, v24);
  v54 = v41 * -0.5;
  *(float *)&v41 = (float)(int)vcvtmd_s64_f64(v42 + v41 * -0.5);
  v55 = v77;
  LODWORD(v54) = v78;
  *(float *)&v56 = HGRectfMake4f(*(float *)&v41, v54, v55);
  HGRect::Init(&v80, v56, v57, v58, v59);
  (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v53 + 96))(v53, 0, (float)(int)v80, (float)SHIDWORD(v80), (float)v81, (float)v82);
  v60 = (HgcRectToPolar *)HGObject::operator new(0x1B0uLL);
  HgcRectToPolar::HgcRectToPolar(v60);
  *(_QWORD *)v60 = &unk_1E64E0058;
  HFunHouse::SetRect((__n128 *)v60, &v83);
  (*(void (**)(HgcRectToPolar *, _QWORD, float, float, float, float))(*(_QWORD *)v60 + 96))(v60, 0, v37, v37, v37, v37);
  (*(void (**)(HgcRectToPolar *, uint64_t, float, float, float, float))(*(_QWORD *)v60 + 96))(v60, 1, v79 * v42, v76, 0.0, 0.0);
  (*(void (**)(HgcRectToPolar *, uint64_t, float, float, float, float))(*(_QWORD *)v60 + 96))(v60, 2, v75, v45, 0.0, 0.0);
  (*(void (**)(HgcRectToPolar *, uint64_t, float, float, float, float))(*(_QWORD *)v60 + 96))(v60, 3, 1.0, 0.0, 0.0, 0.0);
  v61 = v87;
  (*(void (**)(HgcRectToPolar *, uint64_t, float, float, float, float))(*(_QWORD *)v60 + 96))(v60, 4, v79, v61, 0.0, 0.0);
  v62 = v84;
  v63 = v85;
  (*(void (**)(HgcRectToPolar *, uint64_t, float, float, float, float))(*(_QWORD *)v60 + 96))(v60, 5, v62, v63, 0.0, 0.0);
  (*(void (**)(HgcRectToPolar *, uint64_t, float, float, float, float))(*(_QWORD *)v60 + 96))(v60, 6, v49, v50, 0.0, 0.0);
  v64 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
  HGTextureWrap::HGTextureWrap(v64);
  HGTextureWrap::SetTextureWrapMode((uint64_t)v64, (const char *)1, v65);
  (*(void (**)(HGTextureWrap *, _QWORD, _QWORD))(*(_QWORD *)v64 + 120))(v64, 0, *(_QWORD *)a5.var0);
  (*(void (**)(HgcRectToPolar *, _QWORD, HGTextureWrap *))(*(_QWORD *)v60 + 120))(v60, 0, v64);
  v66 = (HGCrop *)HGObject::operator new(0x1A0uLL);
  HGCrop::HGCrop(v66);
  (*(void (**)(HGCrop *, _QWORD, HgcRectToPolar *))(*(_QWORD *)v66 + 120))(v66, 0, v60);
  LODWORD(v67) = v78;
  *(float *)&v68 = HGRectfMake4f(v74, v67, *(float *)&v41);
  HGRect::Init(&v80, v68, v69, v70, v71);
  (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v66 + 96))(v66, 0, (float)(int)v80, (float)SHIDWORD(v80), (float)v81, (float)v82);
  v72 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
  HGHWBlendFlipped::HGHWBlendFlipped(v72);
  -[PAESharedDefaultBase getBlendingGamma](self, "getBlendingGamma");
  (*(void (**)(HGHWBlendFlipped *, uint64_t))(*(_QWORD *)v72 + 96))(v72, 5);
  (*(void (**)(HGHWBlendFlipped *, _QWORD, HGCrop *))(*(_QWORD *)v72 + 120))(v72, 0, v53);
  (*(void (**)(HGHWBlendFlipped *, uint64_t, HGCrop *))(*(_QWORD *)v72 + 120))(v72, 1, v66);
  v73 = *(_QWORD *)a9;
  if (*(HGHWBlendFlipped **)a9 != v72)
  {
    if (v73)
      (*(void (**)(uint64_t))(*(_QWORD *)v73 + 24))(v73);
    *(_QWORD *)a9 = v72;
    (*(void (**)(HGHWBlendFlipped *))(*(_QWORD *)v72 + 16))(v72);
  }
  (*(void (**)(HGHWBlendFlipped *))(*(_QWORD *)v72 + 24))(v72);
  (*(void (**)(HGCrop *))(*(_QWORD *)v66 + 24))(v66);
  (*(void (**)(HGTextureWrap *))(*(_QWORD *)v64 + 24))(v64);
  (*(void (**)(HgcRectToPolar *))(*(_QWORD *)v60 + 24))(v60);
  (*(void (**)(HGCrop *))(*(_QWORD *)v53 + 24))(v53);
  (*(void (**)(HGTextureWrap *))(*(_QWORD *)v51 + 24))(v51);
  (*(void (**)(HgcRectToPolar *))(*(_QWORD *)v24 + 24))(v24);
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  double v9;
  void *v10;
  void *v11;
  BOOL v12;
  double v13;
  double v14;
  float v15;
  double v16;
  double v17;
  float v18;
  float v19;
  float v20;
  float v21;
  double v22;
  double v23;
  uint64_t v24;
  BOOL v25;
  HGXForm *v27;
  HDirectionalBlur *v28;
  float v29;
  float v30;
  float v31;
  float v32;
  HGXForm *v33;
  unint64_t v34;
  unint64_t v35;
  HGCrop *v36;
  float v37;
  float v38;
  double v39;
  double v40;
  float v41;
  float v42;
  float v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  HGCrop *v47;
  float v48;
  float v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  void *v62;
  uint64_t v63[18];
  HDirectionalBlur *v64;
  uint64_t v65;
  HGXForm *v66;
  uint64_t v67;
  _QWORD v68[18];
  double v69[16];
  uint64_t v70;
  int v71;
  char v72;
  double v73;
  double v74;
  double v75;
  double v76;

  if (a5->var1 == 2)
    v9 = 1.5;
  else
    v9 = 1.0;
  v10 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A4590);
  if (!v10)
    return 0;
  v11 = v10;
  v76 = 0.0;
  objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v76, 1, a5->var0.var1);
  if (v76 == 0.0)
  {
    if (a4)
      objc_msgSend(a4, "heliumRef", v76);
    else
      v68[0] = 0;
    objc_msgSend(a3, "setHeliumRef:", v68);
    if (v68[0])
      (*(void (**)(_QWORD))(*(_QWORD *)v68[0] + 24))(v68[0]);
    return 1;
  }
  else
  {
    v75 = 0.0;
    objc_msgSend(v11, "getFloatValue:fromParm:atFxTime:", &v75, 4, a5->var0.var1, v76);
    v75 = v75 * 3.14159265 * 0.5 + 1.57079633;
    v73 = 0.5;
    v74 = 0.5;
    objc_msgSend(v11, "getXValue:YValue:fromParm:atFxTime:", &v74, &v73, 2, a5->var0.var1);
    v13 = v74;
    v14 = v13 * (double)(unint64_t)objc_msgSend(a4, "width");
    v15 = v14 - (double)(unint64_t)objc_msgSend(a4, "width") * 0.5;
    v16 = v73;
    v17 = v16 * (double)(unint64_t)objc_msgSend(a4, "height");
    v18 = v17 - (double)(unint64_t)objc_msgSend(a4, "height") * 0.5;
    v19 = sqrtf((float)(v15 * v15) + (float)(v18 * v18));
    if (v19 > 65000.0)
    {
      if (v19 <= -0.00001 || v19 >= 0.00001)
      {
        v15 = v15 / v19;
        v18 = v18 / v19;
      }
      v20 = v15 * 65000.0;
      v21 = v18 * 65000.0;
      v22 = (double)(unint64_t)objc_msgSend(a4, "width") * 0.5 + v20;
      v74 = v22 / (double)(unint64_t)objc_msgSend(a4, "width");
      v23 = (double)(unint64_t)objc_msgSend(a4, "height") * 0.5 + v21;
      v73 = v23 / (double)(unint64_t)objc_msgSend(a4, "height");
    }
    v72 = 0;
    objc_msgSend(v11, "getBoolValue:fromParm:atFxTime:", &v72, 3, a5->var0.var1);
    v71 = 0;
    objc_msgSend(v11, "getIntValue:fromParm:atFxTime:", &v71, 5, a5->var0.var1);
    v24 = objc_msgSend(a4, "imageType");
    if (-[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1))
      v25 = v24 == 3;
    else
      v25 = 0;
    v12 = v25;
    if (v25)
    {
      if (a4)
        objc_msgSend(a4, "heliumRef");
      else
        v70 = 0;
      if (v76 == 0.0)
      {
        objc_msgSend(a3, "setHeliumRef:", &v70, v76);
      }
      else if (v71 == 1)
      {
        -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a3, v76);
        HGTransform::HGTransform((HGTransform *)v68);
        HGTransform::Scale((HGTransform *)v68, v9, v9, 1.0);
        v27 = (HGXForm *)HGObject::operator new(0x210uLL);
        HGXForm::HGXForm(v27);
        (*(void (**)(HGXForm *, _QWORD *))(*(_QWORD *)v27 + 576))(v27, v68);
        (*(void (**)(HGXForm *, _QWORD, uint64_t))(*(_QWORD *)v27 + 120))(v27, 0, v70);
        v66 = v27;
        v67 = 0;
        (*(void (**)(HGXForm *))(*(_QWORD *)v27 + 16))(v27);
        -[PAEZoomBlur polarToRect:withInputImage:withInputNode:centerX:centerY:upscaleFactor:andOutputNode:](self, "polarToRect:withInputImage:withInputNode:centerX:centerY:upscaleFactor:andOutputNode:", a3, a4, &v66, &v67, v74, v73, v9);
        if (v66)
          (*(void (**)(HGXForm *))(*(_QWORD *)v66 + 24))(v66);
        v28 = (HDirectionalBlur *)HGObject::operator new(0x1B0uLL);
        HDirectionalBlur::HDirectionalBlur(v28);
        if (v28)
          (*(void (**)(HDirectionalBlur *))(*(_QWORD *)v28 + 16))(v28);
        v29 = v9 * v76;
        v30 = v75;
        v31 = 1.0 / v69[0];
        v32 = 1.0 / fabs(v69[5]);
        HDirectionalBlur::init(v28, v29, v30, v31, v32);
        (*(void (**)(HDirectionalBlur *, _QWORD, uint64_t))(*(_QWORD *)v28 + 120))(v28, 0, v67);
        v64 = v28;
        v65 = 0;
        (*(void (**)(HDirectionalBlur *))(*(_QWORD *)v28 + 16))(v28);
        -[PAEZoomBlur rectToPolar:withInputImage:withInputNode:centerX:centerY:upscaleFactor:andOutputNode:](self, "rectToPolar:withInputImage:withInputNode:centerX:centerY:upscaleFactor:andOutputNode:", a3, a4, &v64, &v65, v74, v73, v9);
        if (v64)
          (*(void (**)(HDirectionalBlur *))(*(_QWORD *)v64 + 24))(v64);
        HGTransform::HGTransform((HGTransform *)v63);
        HGTransform::Scale((HGTransform *)v63, 1.0 / v9, 1.0 / v9, 1.0);
        v33 = (HGXForm *)HGObject::operator new(0x210uLL);
        HGXForm::HGXForm(v33);
        (*(void (**)(HGXForm *, uint64_t *))(*(_QWORD *)v33 + 576))(v33, v63);
        (*(void (**)(HGXForm *, _QWORD, uint64_t))(*(_QWORD *)v33 + 120))(v33, 0, v65);
        if (v72)
        {
          v34 = objc_msgSend(a3, "width");
          v35 = objc_msgSend(a3, "height");
          v36 = (HGCrop *)HGObject::operator new(0x1A0uLL);
          HGCrop::HGCrop(v36);
          (*(void (**)(HGCrop *, _QWORD, HGXForm *))(*(_QWORD *)v36 + 120))(v36, 0, v33);
          v37 = (double)v34 * 0.5;
          v38 = (double)v35 * 0.5;
          (*(void (**)(HGCrop *, _QWORD, float, float))(*(_QWORD *)v36 + 96))(v36, 0, -v37, -v38);
          v62 = v36;
          (*(void (**)(HGCrop *))(*(_QWORD *)v36 + 16))(v36);
          objc_msgSend(a3, "setHeliumRef:", &v62);
          if (v62)
            (*(void (**)(void *))(*(_QWORD *)v62 + 24))(v62);
          (*(void (**)(HGCrop *))(*(_QWORD *)v36 + 24))(v36);
        }
        else
        {
          v62 = v33;
          (*(void (**)(HGXForm *))(*(_QWORD *)v33 + 16))(v33);
          objc_msgSend(a3, "setHeliumRef:", &v62);
          if (v62)
            (*(void (**)(void *))(*(_QWORD *)v62 + 24))(v62);
        }
        (*(void (**)(HGXForm *))(*(_QWORD *)v33 + 24))(v33);
        HGTransform::~HGTransform((HGTransform *)v63);
        if (v65)
          (*(void (**)(uint64_t))(*(_QWORD *)v65 + 24))(v65);
        (*(void (**)(HDirectionalBlur *))(*(_QWORD *)v28 + 24))(v28);
        (*(void (**)(HDirectionalBlur *))(*(_QWORD *)v28 + 24))(v28);
        if (v67)
          (*(void (**)(uint64_t))(*(_QWORD *)v67 + 24))(v67);
        (*(void (**)(HGXForm *))(*(_QWORD *)v27 + 24))(v27);
        HGTransform::~HGTransform((HGTransform *)v68);
      }
      else
      {
        -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a4, v76);
        v39 = v74;
        v74 = (v39 + -0.5) * (double)(unint64_t)objc_msgSend(a4, "width");
        v40 = v73;
        v73 = (v40 + -0.5) * (double)(unint64_t)objc_msgSend(a4, "height");
        v41 = v76;
        v42 = v74;
        v43 = v73;
        HZoomBlur::makeZoom(&v70, v63, v41, v42, v43);
        v69[0] = 0.0;
        *(_QWORD *)&v69[0] = objc_msgSend(a3, "width");
        v67 = 0;
        v44 = objc_msgSend(a3, "height");
        v67 = v44;
        if (!v72)
        {
          *(_QWORD *)&v69[0] *= 2;
          v67 = 2 * v44;
        }
        if (a4)
        {
          objc_msgSend(a4, "imageInfo");
        }
        else
        {
          v61 = 0;
          v59 = 0u;
          v60 = 0u;
          v57 = 0u;
          v58 = 0u;
        }
        -[PAEZoomBlur constrainWidth:andHeight:withImageInfo:](self, "constrainWidth:andHeight:withImageInfo:", v69, &v67, &v57);
        v45 = *(_QWORD *)&v69[0];
        v46 = v67;
        v47 = (HGCrop *)HGObject::operator new(0x1A0uLL);
        HGCrop::HGCrop(v47);
        (*(void (**)(HGCrop *, _QWORD, uint64_t))(*(_QWORD *)v47 + 120))(v47, 0, v63[0]);
        v48 = (double)v45 * 0.5;
        v49 = (double)v46 * 0.5;
        (*(void (**)(HGCrop *, _QWORD, float, float))(*(_QWORD *)v47 + 96))(v47, 0, -v48, -v49);
        if ((HGCrop *)v63[0] != v47)
        {
          if (v63[0])
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)v63[0] + 24))(v63[0], v50, v51, v52, v53, v54, v55, v56, v57);
          v63[0] = (uint64_t)v47;
          (*(void (**)(HGCrop *))(*(_QWORD *)v47 + 16))(v47);
        }
        objc_msgSend(a3, "setHeliumRef:", v63, v57, v58, v59, v60, v61);
        (*(void (**)(HGCrop *))(*(_QWORD *)v47 + 24))(v47);
        if (v63[0])
          (*(void (**)(uint64_t))(*(_QWORD *)v63[0] + 24))(v63[0]);
      }
      if (v70)
        (*(void (**)(uint64_t))(*(_QWORD *)v70 + 24))(v70);
    }
  }
  return v12;
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
