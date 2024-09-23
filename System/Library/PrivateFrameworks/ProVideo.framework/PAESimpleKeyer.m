@implementation PAESimpleKeyer

- (id)properties
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAESimpleKeyer;
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", -[PAEKeyer properties](&v4, sel_properties));
  objc_msgSend(v2, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3), CFSTR("PixelTransformSupport"));
  return v2;
}

- (BOOL)isSimpleKey
{
  return 1;
}

- (PAESimpleKeyer)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAESimpleKeyer;
  return -[PAEKeyer initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (void)createLutForNode:(void *)a3 input:(int)a4 rect:(const HGRect *)a5 omKeyer:(void *)a6
{
  PCMutex *p_cacheMutex;
  HGBitmap *v12;
  _DWORD *v13;
  _BOOL4 v14;
  int v15;
  float v16;
  int v17;
  float v18;
  int v19;
  _DWORD *v20;
  float v21;
  float v22;
  float v23;
  uint64_t v24;
  HGTexture *v25;
  void *lutsBitmapLoaderCache;
  HGBitmapLoader *v27;

  p_cacheMutex = &self->super._cacheMutex;
  PCMutex::lock(&self->super._cacheMutex);
  v12 = (HGBitmap *)HGObject::operator new(0x80uLL);
  HGBitmap::HGBitmap(v12, *(_QWORD *)&a5->var0, *(_QWORD *)&a5->var2, 28);
  v13 = (_DWORD *)*((_QWORD *)v12 + 10);
  v14 = -[PAEKeyer isLutExpandedForHDR](self, "isLutExpandedForHDR");
  v15 = 0;
  if (v14)
    v16 = 11.0;
  else
    v16 = 1.0;
  if (v14)
    v17 = 2816;
  else
    v17 = 256;
  do
  {
    v18 = (double)v15 / (double)(v17 - 1);
    OMKeyer2D::getAlphaLuma((OMKeyer2D *)a6, v16 * v18);
    *v13 = v19;
    v20 = (_DWORD *)*((_QWORD *)a6 + 15);
    v21 = (float)(unint64_t)((uint64_t)(*((_QWORD *)a6 + 16) - (_QWORD)v20) >> 2);
    if ((float)((float)v15 / 255.0) <= 1.0)
      v22 = (float)v15 / 255.0;
    else
      v22 = 1.0;
    v23 = v21 + -1.0;
    v24 = (uint64_t)rintf(v22 * (float)(v21 + -1.0));
    if ((v24 & 0x8000000000000000) == 0)
    {
      if (v23 < (float)v24)
        v24 = (unint64_t)v23;
      v20 += v24;
    }
    v13[1] = *v20;
    v13[2] = 0;
    ++v15;
    v13 += 4;
  }
  while (v17 != v15);
  v25 = (HGTexture *)HGObject::operator new(0x80uLL);
  HGTexture::HGTexture(v25, *a5, v12);
  lutsBitmapLoaderCache = self->super._lutsBitmapLoaderCache;
  if (lutsBitmapLoaderCache)
    (*(void (**)(void *))(*(_QWORD *)lutsBitmapLoaderCache + 24))(lutsBitmapLoaderCache);
  v27 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
  HGBitmapLoader::HGBitmapLoader(v27, (HGBitmap *)v25);
  self->super._lutsBitmapLoaderCache = v27;
  (*(void (**)(HGTexture *))(*(_QWORD *)v25 + 24))(v25);
  (*(void (**)(HGBitmap *))(*(_QWORD *)v12 + 24))(v12);
  (*(void (**)(void *, _QWORD, void *))(*(_QWORD *)a3 + 120))(a3, a4, self->super._lutsBitmapLoaderCache);
  PCMutex::unlock(p_cacheMutex);
}

- (HGRef<HGNode>)getKeyerNode:(HGRef<HGNode>)a3 omKeyer:(void *)a4 atTime:(id)a5
{
  HAlphaKeyer **v5;
  HAlphaKeyer **v10;
  HGGLNode *v11;
  HGColorMatrix *v12;
  _BOOL4 v13;
  HGColorClamp *v14;
  int v15;
  HAlphaKeyer *v16;
  __n128 v17;
  int v18;
  unsigned int v19;
  uint64_t v20;
  HGRef<HGNode> v21;
  _QWORD v22[2];
  HGGLNode *v23;
  char v24;
  _OWORD v25[4];
  uint64_t v26;

  v10 = v5;
  v26 = *MEMORY[0x1E0C80C00];
  v11 = (HGGLNode *)HGObject::operator new(0x1B0uLL);
  HGGLNode::HGGLNode(v11, 0);
  HGGLNode::hglClearToBlack(v11);
  v23 = v11;
  if (v11)
    (*(void (**)(HGGLNode *))(*(_QWORD *)v11 + 16))(v11);
  PAEKeyerDrawAlpha::drawAlpha_in_HGGLNode((uint64_t)&v24, (uint64_t)a4, &v23);
  if (v23)
    (*(void (**)(HGGLNode *))(*(_QWORD *)v23 + 24))(v23);
  v12 = (HGColorMatrix *)HGObject::operator new(0x1F0uLL);
  HGColorMatrix::HGColorMatrix(v12);
  desiredRGBToYCbCrMatrix(self->super.super.super._apiManager, (uint64_t)v25, (uint64_t)a5.var1);
  HGColorMatrix::LoadMatrix(v12, v25, 0);
  v13 = -[PAEKeyer isLutExpandedForHDR](self, "isLutExpandedForHDR");
  if (v13)
  {
    (*(void (**)(HGColorMatrix *, _QWORD, _QWORD))(*(_QWORD *)v12 + 120))(v12, 0, *(_QWORD *)a3.var0);
  }
  else
  {
    v14 = (HGColorClamp *)HGObject::operator new(0x1C0uLL);
    HGColorClamp::HGColorClamp(v14);
    (*(void (**)(HGColorClamp *, _QWORD, _QWORD))(*(_QWORD *)v14 + 120))(v14, 0, *(_QWORD *)a3.var0);
    (*(void (**)(HGColorMatrix *, _QWORD, HGColorClamp *))(*(_QWORD *)v12 + 120))(v12, 0, v14);
    (*(void (**)(HGColorClamp *))(*(_QWORD *)v14 + 24))(v14);
  }
  v15 = -[PAEKeyer lut2DSize](self, "lut2DSize");
  v16 = (HAlphaKeyer *)HGObject::operator new(0x1B0uLL);
  HAlphaKeyer::HAlphaKeyer(v16, v13, v15);
  (*(void (**)(HAlphaKeyer *, _QWORD, HGColorMatrix *))(*(_QWORD *)v16 + 120))(v16, 0, v12);
  (*(void (**)(HAlphaKeyer *, uint64_t, HGGLNode *))(*(_QWORD *)v16 + 120))(v16, 1, v11);
  (*(void (**)(HAlphaKeyer *, _QWORD, float, float, float, float))(*(_QWORD *)v16 + 96))(v16, 0, 0.0, *((float *)a4 + 14) * -0.5, *((float *)a4 + 15) * -0.5, 0.0);
  (*(void (**)(HAlphaKeyer *, uint64_t, float, float, float, float))(*(_QWORD *)v16 + 96))(v16, 1, 0.0, 0.0, 0.0, 0.0);
  (*(void (**)(HAlphaKeyer *, uint64_t, float, float, float, float))(*(_QWORD *)v16 + 96))(v16, 2, 1.0, 1.0, 1.0, 1.0);
  v17.n128_u32[0] = 1093173615;
  if (!v13)
    v17.n128_f32[0] = 1.0;
  (*(void (**)(HAlphaKeyer *, uint64_t, __n128, float, float, float))(*(_QWORD *)v16 + 96))(v16, 3, v17, v17.n128_f32[0], v17.n128_f32[0], v17.n128_f32[0]);
  v18 = -[PAEKeyer lut2DSize](self, "lut2DSize");
  (*(void (**)(HAlphaKeyer *, uint64_t, float, float, float, float))(*(_QWORD *)v16 + 96))(v16, 4, (float)v18 + -1.0, (float)v18 + -1.0, (float)v18 + -1.0, (float)v18 + -1.0);
  if (v13)
    v19 = 2816;
  else
    v19 = 256;
  v22[0] = HGRectMake4i(0, 0, v19, 1u);
  v22[1] = v20;
  -[PAESimpleKeyer createLutForNode:input:rect:omKeyer:](self, "createLutForNode:input:rect:omKeyer:", v16, 2, v22, a4);
  *v10 = v16;
  v21.var0 = (HGNode *)(*(uint64_t (**)(HGColorMatrix *))(*(_QWORD *)v12 + 24))(v12);
  if (v11)
    return (HGRef<HGNode>)(*(uint64_t (**)(HGGLNode *))(*(_QWORD *)v11 + 24))(v11);
  return v21;
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
  v7.super_class = (Class)PAESimpleKeyer;
  return -[PAEKeyer canThrowRenderOutput:withInput:withInfo:](&v7, sel_canThrowRenderOutput_withInput_withInfo_, a3, a4, v8);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PAESimpleKeyer;
  -[PAEKeyer dealloc](&v2, sel_dealloc);
}

- (BOOL)pullInitialKey:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 *v17;
  double v22;
  float v23;
  double v24;
  double v25;
  double v26;
  PAEKeyerInitialize *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  void *omSamples;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  float v45;
  double v46;
  uint64_t v48;
  __int128 v49;
  _QWORD v50[3];
  __int128 v51;
  uint64_t v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  _QWORD v58[3];
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  __int128 v63;
  uint64_t v64;
  double v65;
  __int128 v66;
  uint64_t v67;
  double v68;
  __int128 v69;
  uint64_t v70;
  char v71;
  __int128 v72;
  uint64_t v73;

  v5 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v6 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super.super._apiManager, "apiForProtocol:", &unk_1EF0B64E0);
  v7 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super.super._apiManager, "apiForProtocol:", &unk_1EF0A7268);
  v8 = -[PROAPIAccessing apiForProtocol:](self->super.super.super._apiManager, "apiForProtocol:", &unk_1EF0A7DB0);
  if (v5)
    _ZF = v6 == 0;
  else
    _ZF = 1;
  v10 = _ZF || v7 == 0;
  v11 = v10;
  if (v10)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Keyer::UnableToObtainAPIsDescription"), 0, 0);
    v14 = objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Keyer::UnableToObtainAPIsReason"), 0, 0);
    v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v13, *MEMORY[0x1E0CB2D50], v14, *MEMORY[0x1E0CB2D68], 0);
    if (a3)
      *a3 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", FxPlugErrorDomain, 100001, v15);
  }
  else
  {
    v16 = (void *)v8;
    v17 = (__int128 *)MEMORY[0x1E0CA2E68];
    v72 = *MEMORY[0x1E0CA2E68];
    v73 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v71 = 0;
    objc_msgSend(v5, "getBoolValue:fromParm:atFxTime:", &v71, 8, &v72);
    if (!v71)
    {
      v69 = *v17;
      v70 = *((_QWORD *)v17 + 2);
      v68 = COERCE_DOUBLE(&v69);
      v66 = v69;
      v67 = v70;
      v65 = COERCE_DOUBLE(&v66);
      objc_msgSend(v6, "startFxTimeOfMedia:", &v68);
      objc_msgSend(v6, "durationFxTimeOfMedia:", &v65);
      if (v68 != -1.0 && v65 != -1.0)
      {
        v63 = *v17;
        v64 = *((_QWORD *)v17 + 2);
        v62 = COERCE_DOUBLE(&v63);
        objc_msgSend(v16, "frameDuration:", &v62);
      }
      v58[1] = 0;
      v58[2] = 0;
      v58[0] = &v72;
      __asm { FMOV            V0.2D, #1.0 }
      v49 = _Q0;
      v59 = _Q0;
      v60 = 3;
      v61 = 0;
      -[PAEKeyer getInputWidth:height:renderInfo:](self, "getInputWidth:height:renderInfo:", (char *)&v61 + 4, &v61, v58);
      if (*((float *)&v61 + 1) > 0.0)
      {
        LODWORD(v22) = v61;
        if (*(float *)&v61 > 0.0)
        {
          v62 = 0.0;
          objc_msgSend(v5, "getFloatValue:fromParm:atFxTime:", &v62, 38, &v72, v22);
          v57 = 0.0;
          objc_msgSend(v5, "getFloatValue:fromParm:atFxTime:", &v57, 39, &v72);
          v56 = 0.0;
          objc_msgSend(v5, "getFloatValue:fromParm:atFxTime:", &v56, 40, &v72);
          v55 = 0.0;
          objc_msgSend(v5, "getFloatValue:fromParm:atFxTime:", &v55, 41, &v72);
          v54 = 0.0;
          objc_msgSend(v5, "getFloatValue:fromParm:atFxTime:", &v54, 42, &v72);
          v53 = 0.0;
          objc_msgSend(v5, "getFloatValue:fromParm:atFxTime:", &v53, 43, &v72);
          *(_QWORD *)&v63 = 0;
          objc_msgSend(v5, "getFloatValue:fromParm:atFxTime:", &v63, 36, &v72);
          v23 = *(double *)&v63;
          v24 = 0.5;
          -[PAEKeyer autokeyAmountToHistoPercent:](self, "autokeyAmountToHistoPercent:", v23 * 0.5);
          v26 = v25;
          v27 = -[PAEKeyerInitialize initWithAPIManager:keyer:]([PAEKeyerInitialize alloc], "initWithAPIManager:keyer:", self->super.super.super._apiManager, self);
          LODWORD(v63) = 0;
          v50[1] = 0;
          v50[2] = 0;
          v50[0] = &v72;
          v51 = v49;
          v52 = 3;
          v28 = -[PAEKeyer getColorPrimaries](self, "getColorPrimaries");
          v29 = (int)*((float *)&v61 + 1);
          v30 = (int)*(float *)&v61;
          v31 = v62;
          v32 = v57;
          v33 = v56;
          v34 = v55;
          v35 = v54;
          v36 = v53;
          omSamples = self->super._omSamples;
          BYTE2(v48) = 1;
          BYTE1(v48) = -[PAEKeyer use32x32Histogram](self, "use32x32Histogram");
          LOBYTE(v48) = 0;
          *(float *)&v38 = v31;
          *(float *)&v39 = v32;
          *(float *)&v40 = v33;
          *(float *)&v41 = v34;
          *(float *)&v42 = v35;
          *(float *)&v43 = v36;
          *(float *)&v26 = v26;
          LODWORD(v44) = LODWORD(v26);
          -[PAEKeyerInitialize findSampleRectsWithInfo:screenColor:colorPrimaries:width:height:minGreenHueAngle:maxGreenHueAngle:greenChroma:minBlueHueAngle:maxBlueHueAngle:blueChroma:histoPercentageIncluded:omSamples:viewingSetupMatte:use32x32Histogram:simpleKey:](v27, "findSampleRectsWithInfo:screenColor:colorPrimaries:width:height:minGreenHueAngle:maxGreenHueAngle:greenChroma:minBlueHueAngle:maxBlueHueAngle:blueChroma:histoPercentageIncluded:omSamples:viewingSetupMatte:use32x32Histogram:simpleKey:", v50, &v63, v28, v29, v30, omSamples, v38, v39, v40, v41, v42, v43, v44, v48);
          if ((_DWORD)v63)
          {
            if ((_DWORD)v63 != 1)
            {
LABEL_25:
              objc_msgSend(v7, "setBoolValue:toParm:atFxTime:", 1, 8, &v72);

              return v11 ^ 1;
            }
            v24 = 1.0;
            v45 = 0.0;
            v46 = 0.460000008;
          }
          else
          {
            v45 = 1.6;
            v46 = 0.730000019;
          }
          objc_msgSend(v7, "setFloatValue:toParm:atFxTime:", 20, &v72, v46);
          objc_msgSend(v7, "setFloatValue:toParm:atFxTime:", 23, &v72, (float)(v45 / 20.0));
          objc_msgSend(v7, "setFloatValue:toParm:atFxTime:", 24, &v72, v24);
          goto LABEL_25;
        }
      }
    }
  }
  return v11 ^ 1;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAESimpleKeyer;
  return -[PAESimpleKeyer parameterChanged:](&v4, sel_parameterChanged_, *(_QWORD *)&a3);
}

- (BOOL)oscIsPublishable:(BOOL)a3
{
  return 0;
}

@end
