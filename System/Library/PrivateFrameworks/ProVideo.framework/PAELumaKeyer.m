@implementation PAELumaKeyer

- (PAELumaKeyer)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAELumaKeyer;
  return -[PAEKeyer initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (void)createLutForNode:(void *)a3 input:(int)a4 rect:(const HGRect *)a5 omKeyer:(void *)a6
{
  uint64_t v8;
  PCMutex *p_cacheMutex;
  HGBitmap *v12;
  double v13;
  _DWORD *v14;
  _BOOL4 v15;
  int v16;
  float v17;
  int v18;
  float v19;
  int v20;
  HGTexture *v21;
  void *lutsBitmapLoaderCache;
  HGBitmapLoader *v23;
  PCMutex *v24;
  uint64_t v25;

  v8 = *(_QWORD *)&a4;
  p_cacheMutex = &self->super._cacheMutex;
  v24 = &self->super._cacheMutex;
  PCMutex::lock(&self->super._cacheMutex);
  LOBYTE(v25) = 1;
  v12 = (HGBitmap *)HGObject::operator new(0x80uLL);
  *(_QWORD *)&v13 = HGBitmap::HGBitmap(v12, *(_QWORD *)&a5->var0, *(_QWORD *)&a5->var2, 28).n128_u64[0];
  v14 = (_DWORD *)*((_QWORD *)v12 + 10);
  v15 = -[PAEKeyer isLutExpandedForHDR](self, "isLutExpandedForHDR", v13, v24, v25);
  v16 = 0;
  if (v15)
    v17 = 11.0;
  else
    v17 = 1.0;
  if (v15)
    v18 = 2816;
  else
    v18 = 256;
  do
  {
    v19 = (double)v16 / (double)(v18 - 1);
    OMKeyer2D::getAlphaLuma((OMKeyer2D *)a6, v17 * v19);
    *v14 = v20;
    v14 += 4;
    ++v16;
  }
  while (v18 != v16);
  v21 = (HGTexture *)HGObject::operator new(0x80uLL);
  HGTexture::HGTexture(v21, *a5, v12);
  lutsBitmapLoaderCache = self->super._lutsBitmapLoaderCache;
  if (lutsBitmapLoaderCache)
    (*(void (**)(void *))(*(_QWORD *)lutsBitmapLoaderCache + 24))(lutsBitmapLoaderCache);
  v23 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
  HGBitmapLoader::HGBitmapLoader(v23, (HGBitmap *)v21);
  self->super._lutsBitmapLoaderCache = v23;
  (*(void (**)(HGTexture *))(*(_QWORD *)v21 + 24))(v21);
  (*(void (**)(HGBitmap *))(*(_QWORD *)v12 + 24))(v12);
  (*(void (**)(void *, uint64_t, void *))(*(_QWORD *)a3 + 120))(a3, v8, self->super._lutsBitmapLoaderCache);
  PCMutex::unlock(p_cacheMutex);
}

- (HGRef<HGNode>)getKeyerNode:(HGRef<HGNode>)a3 omKeyer:(void *)a4 atTime:(id)a5
{
  HLumaKeyer **v5;
  HLumaKeyer **v9;
  HGColorMatrix *v10;
  _BOOL4 v11;
  HLumaKeyer *v12;
  __n128 v13;
  unsigned int v14;
  uint64_t v15;
  _QWORD v17[2];
  _OWORD v18[4];
  uint64_t v19;

  v9 = v5;
  v19 = *MEMORY[0x1E0C80C00];
  desiredRGBToYCbCrMatrix(self->super.super.super._apiManager, (uint64_t)v18, (uint64_t)a5.var1);
  v10 = (HGColorMatrix *)HGObject::operator new(0x1F0uLL);
  HGColorMatrix::HGColorMatrix(v10);
  HGColorMatrix::LoadMatrix(v10, v18, 0);
  (*(void (**)(HGColorMatrix *, _QWORD, _QWORD))(*(_QWORD *)v10 + 120))(v10, 0, *(_QWORD *)a3.var0);
  v11 = -[PAEKeyer isLutExpandedForHDR](self, "isLutExpandedForHDR");
  v12 = (HLumaKeyer *)HGObject::operator new(0x1B0uLL);
  HLumaKeyer::HLumaKeyer(v12, v11);
  (*(void (**)(HLumaKeyer *, _QWORD, HGColorMatrix *))(*(_QWORD *)v12 + 120))(v12, 0, v10);
  (*(void (**)(HLumaKeyer *, _QWORD, float, float, float, float))(*(_QWORD *)v12 + 96))(v12, 0, 0.0, 0.0, 0.0, 0.0);
  (*(void (**)(HLumaKeyer *, uint64_t, float, float, float, float))(*(_QWORD *)v12 + 96))(v12, 1, 1.0, 1.0, 1.0, 1.0);
  v13.n128_u32[0] = 1093173615;
  if (!v11)
    v13.n128_f32[0] = 1.0;
  (*(void (**)(HLumaKeyer *, uint64_t, __n128, float, float, float))(*(_QWORD *)v12 + 96))(v12, 2, v13, v13.n128_f32[0], v13.n128_f32[0], v13.n128_f32[0]);
  if (v11)
    v14 = 2816;
  else
    v14 = 256;
  v17[0] = HGRectMake4i(0, 0, v14, 1u);
  v17[1] = v15;
  -[PAELumaKeyer createLutForNode:input:rect:omKeyer:](self, "createLutForNode:input:rect:omKeyer:", v12, 1, v17, a4);
  *v9 = v12;
  return (HGRef<HGNode>)(*(uint64_t (**)(HGColorMatrix *))(*(_QWORD *)v10 + 24))(v10);
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  __int128 v5;
  objc_super v7;
  _OWORD v8[3];

  v5 = *(_OWORD *)&a5->var2;
  v8[0] = *(_OWORD *)&a5->var0.var0;
  v8[1] = v5;
  v8[2] = *(_OWORD *)&a5->var4;
  v7.receiver = self;
  v7.super_class = (Class)PAELumaKeyer;
  return -[PAEKeyer canThrowRenderOutput:withInput:withInfo:](&v7, sel_canThrowRenderOutput_withInput_withInfo_, a3, a4, v8);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PAELumaKeyer;
  -[PAEKeyer dealloc](&v2, sel_dealloc);
}

- (BOOL)isLumaKey
{
  return 1;
}

- (BOOL)finishInitialSetup:(id *)a3
{
  PAEKeyerSetupUtil *v4;
  OMKeyer2D *v5;
  double v6;
  float v7;
  int v8;
  OMSamples *omSamples;
  double v10;
  float v11;
  double v12;
  float v13;
  double v14;
  float v15;
  __int128 v17;
  uint64_t v18;

  v17 = *MEMORY[0x1E0CA2E68];
  v18 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  v4 = -[PAEKeyerSetupUtil initWithAPIManager:colorPrimaries:atTime:]([PAEKeyerSetupUtil alloc], "initWithAPIManager:colorPrimaries:atTime:", self->super.super.super._apiManager, -[PAEKeyer getColorPrimaries](self, "getColorPrimaries", v17, v18), &v17);
  v5 = -[PAEKeyerSetupUtil omKeyer](v4, "omKeyer");
  (*(void (**)(OMKeyer2D *, float))(*(_QWORD *)v5 + 64))(v5, -1.0);
  (*(void (**)(OMKeyer2D *, float))(*(_QWORD *)v5 + 72))(v5, 1.0);
  (*(void (**)(OMKeyer2D *, float))(*(_QWORD *)v5 + 80))(v5, 100000.0);
  (*(void (**)(OMKeyer2D *, float))(*(_QWORD *)v5 + 88))(v5, 100000.0);
  -[PAEKeyerSetupUtil autoAdjustSoftGap](v4, "autoAdjustSoftGap");
  v7 = v6;
  v8 = -[PAEKeyerSetupUtil tight](v4, "tight");
  omSamples = (OMSamples *)self->super._omSamples;
  -[PAEKeyerSetupUtil shadowsGain](v4, "shadowsGain");
  v11 = v10;
  -[PAEKeyerSetupUtil highlightsGain](v4, "highlightsGain");
  v13 = v12;
  -[PAEKeyerSetupUtil spreadGain](v4, "spreadGain");
  v15 = v14;
  OMKeyer2D::computeModel(v5, 0, v7, v8, omSamples, v11, v13, v15, 1, 0);
  -[PAEKeyerSetupUtil syncWithDB:setAsDefault:](v4, "syncWithDB:setAsDefault:", &v17, 1);

  return 1;
}

- (BOOL)oscIsPublishable:(BOOL)a3
{
  return 0;
}

@end
