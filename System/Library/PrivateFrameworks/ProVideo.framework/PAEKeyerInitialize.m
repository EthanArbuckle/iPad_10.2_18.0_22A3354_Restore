@implementation PAEKeyerInitialize

- (PAEKeyerInitialize)initWithAPIManager:(id)a3 keyer:(id)a4
{
  PAEKeyerInitialize *v6;
  PAEKeyerInitialize *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PAEKeyerInitialize;
  v6 = -[PAEKeyerInitialize init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_apiManager = a3;
    v8 = a4;
    v7->_keyer = (PAEKeyer *)a4;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PAEKeyerInitialize;
  -[PAEKeyerInitialize dealloc](&v3, sel_dealloc);
}

+ (void)addCorner:(const Vec3f *)a3 toSamples:(void *)a4 corner:(const Vec3f *)a5 clrScreen:(int)a6 clrA:(int)a7 clrB:(int)a8
{
  float32x2_t v8;
  float v9;
  float v10;
  float32x2_t *v12;
  uint64_t v13;
  float32x2_t v14;
  float v15;

  v8 = vadd_f32(*(float32x2_t *)a3->var0, *(float32x2_t *)a5->var0);
  v14 = v8;
  v9 = a3->var0[2] + a5->var0[2];
  v15 = v9;
  v10 = v14.f32[a6];
  if (v10 > v14.f32[a7] && v10 > v14.f32[a8])
  {
    v12 = (float32x2_t *)*((_QWORD *)a4 + 1);
    if ((unint64_t)v12 >= *((_QWORD *)a4 + 2))
    {
      v13 = std::vector<Vec3f>::__push_back_slow_path<Vec3f const&>((uint64_t *)a4, &v14);
    }
    else
    {
      *v12 = v8;
      v12[1].f32[0] = v9;
      v13 = (uint64_t)&v12[1] + 4;
    }
    *((_QWORD *)a4 + 1) = v13;
  }
}

+ (void)setInitialSamples:(void *)a3 autokeySetupUtil:(id)a4 sampleBoxHalfDim:(float)a5
{
  int v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  float v13;
  float v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  float v19;
  uint64_t v20;
  int v21;
  _DWORD v22[3];
  _DWORD v23[3];
  _DWORD v24[3];
  _DWORD v25[3];
  float v26[3];
  float v27[3];
  float v28[3];
  float v29;
  float v30;
  float v31;

  v8 = objc_msgSend(a4, "getSamplesNb");
  v9 = objc_msgSend(a4, "getInitialSamples");
  if (v8 < 1)
  {
    v14 = 0.0;
    v13 = 0.0;
  }
  else
  {
    v12 = 0;
    v13 = 0.0;
    v14 = 0.0;
    do
    {
      LODWORD(v10) = 0;
      LODWORD(v11) = 0;
      if (a4)
      {
        objc_msgSend(a4, "getInitialSample:usingArray:", v12, v9, v10, v11);
        *(float *)&v11 = v30;
        *(float *)&v10 = v31;
      }
      v14 = v14 + *(float *)&v11;
      v13 = v13 + *(float *)&v10;
      v12 = (v12 + 1);
    }
    while (v8 != (_DWORD)v12);
  }
  v29 = -a5;
  v30 = -a5;
  if (v14 >= v13)
    v15 = 1;
  else
    v15 = 2;
  if (v14 < v13)
    v16 = 1;
  else
    v16 = 2;
  v31 = -a5;
  v28[0] = -a5;
  v28[1] = -a5;
  v28[2] = a5;
  v27[0] = -a5;
  v27[1] = a5;
  v27[2] = -a5;
  v26[0] = -a5;
  v26[1] = a5;
  v26[2] = a5;
  *(float *)v25 = a5;
  *(float *)&v25[1] = -a5;
  *(float *)&v25[2] = -a5;
  *(float *)v24 = a5;
  *(float *)&v24[1] = -a5;
  *(float *)&v24[2] = a5;
  *(float *)v23 = a5;
  *(float *)&v23[1] = a5;
  *(float *)&v23[2] = -a5;
  *(float *)v22 = a5;
  *(float *)&v22[1] = a5;
  *(float *)&v22[2] = a5;
  if (v8 >= 1)
  {
    v17 = 0;
    do
    {
      if (a4)
      {
        objc_msgSend(a4, "getInitialSample:usingArray:", v17, v9);
        v18 = *(float *)&v20;
      }
      else
      {
        v21 = 0;
        v20 = 0;
        v18 = 0.0;
      }
      v19 = *((float *)&v20 + v15);
      if (v19 > v18 && v19 > *((float *)&v20 + v16))
      {
        +[PAEKeyerInitialize addCorner:toSamples:corner:clrScreen:clrA:clrB:](PAEKeyerInitialize, "addCorner:toSamples:corner:clrScreen:clrA:clrB:", &v20, a3, &v29, v15, 0, v16);
        +[PAEKeyerInitialize addCorner:toSamples:corner:clrScreen:clrA:clrB:](PAEKeyerInitialize, "addCorner:toSamples:corner:clrScreen:clrA:clrB:", &v20, a3, v28, v15, 0, v16);
        +[PAEKeyerInitialize addCorner:toSamples:corner:clrScreen:clrA:clrB:](PAEKeyerInitialize, "addCorner:toSamples:corner:clrScreen:clrA:clrB:", &v20, a3, v27, v15, 0, v16);
        +[PAEKeyerInitialize addCorner:toSamples:corner:clrScreen:clrA:clrB:](PAEKeyerInitialize, "addCorner:toSamples:corner:clrScreen:clrA:clrB:", &v20, a3, v26, v15, 0, v16);
        +[PAEKeyerInitialize addCorner:toSamples:corner:clrScreen:clrA:clrB:](PAEKeyerInitialize, "addCorner:toSamples:corner:clrScreen:clrA:clrB:", &v20, a3, v25, v15, 0, v16);
        +[PAEKeyerInitialize addCorner:toSamples:corner:clrScreen:clrA:clrB:](PAEKeyerInitialize, "addCorner:toSamples:corner:clrScreen:clrA:clrB:", &v20, a3, v24, v15, 0, v16);
        +[PAEKeyerInitialize addCorner:toSamples:corner:clrScreen:clrA:clrB:](PAEKeyerInitialize, "addCorner:toSamples:corner:clrScreen:clrA:clrB:", &v20, a3, v23, v15, 0, v16);
        +[PAEKeyerInitialize addCorner:toSamples:corner:clrScreen:clrA:clrB:](PAEKeyerInitialize, "addCorner:toSamples:corner:clrScreen:clrA:clrB:", &v20, a3, v22, v15, 0, v16);
      }
      v17 = (v17 + 1);
    }
    while (v8 != (_DWORD)v17);
  }
}

- (void)calculateInitialSamples:(void *)a3 percentageOfBaseColorIncluded:(float)a4 use32x32x32:(BOOL)a5 autokeySetupUtil:(id)a6 samples:(void *)a7 scale:(float)a8
{
  _BOOL4 v10;
  _BYTE *v14;
  _BYTE *v15;
  float v16;
  int64_t v17;
  uint64_t v18;
  BOOL v19;
  char v20;
  int v21;
  int v22;
  char v23;
  int v24;
  char v25;
  uint64_t v26;
  int v27;
  double v28;
  void *v29;
  uint64_t v30;
  float32x2_t v31;
  float v32;
  void *__p;
  _BYTE *v34;
  uint64_t v35;

  v30 = *(_QWORD *)&a8;
  v10 = a5;
  __p = 0;
  v34 = 0;
  v35 = 0;
  if (a4 != 0.0)
  {
    if (-[PAEKeyer is3DHistoExpandedForHDR](self->_keyer, "is3DHistoExpandedForHDR"))
      ColorHisto::calculateCenterSamplesHDR((ColorHisto *)a3, (uint64_t)&__p, a4);
    else
      ColorHisto::calculateCenterSamples((ColorHisto *)a3, (uint64_t)&__p, a4);
  }
  v29 = a7;
  v15 = __p;
  v14 = v34;
  if (v10)
    v16 = 0.015625;
  else
    v16 = 0.0078125;
  objc_msgSend(a6, "clearInitialSamples");
  v17 = v14 - v15;
  if ((int)((unint64_t)(v14 - v15) >> 2) >= 1)
  {
    v18 = 0;
    v19 = !v10;
    if (v10)
      v20 = 7;
    else
      v20 = 10;
    if (v19)
      v21 = -4;
    else
      v21 = -8;
    if (v19)
      v22 = 2;
    else
      v22 = 4;
    if (v19)
      v23 = 4;
    else
      v23 = 2;
    if (v19)
      v24 = 252;
    else
      v24 = 248;
    if (v19)
      v25 = 2;
    else
      v25 = 3;
    v26 = v17 & 0x3FFFFFFFCLL;
    do
    {
      v27 = *(_DWORD *)((char *)__p + v18);
      v31.f32[0] = (float)((v27 >> v20) & v21 | v22) / 255.0;
      v31.f32[1] = (float)(int)((v27 >> v23) & v24 | v22) / 255.0;
      v32 = (float)((v27 << v25) & v24 | v22) / 255.0;
      if (-[PAEKeyer is3DHistoExpandedForHDR](self->_keyer, "is3DHistoExpandedForHDR"))
      {
        v31 = vmul_n_f32(v31, *(float *)&v30);
        v32 = v32 * *(float *)&v30;
      }
      objc_msgSend(a6, "addInitialSample:", &v31);
      v18 += 4;
    }
    while (v26 != v18);
  }
  HIDWORD(v28) = HIDWORD(v30);
  *(float *)&v28 = v16 * *(float *)&v30;
  +[PAEKeyerInitialize setInitialSamples:autokeySetupUtil:sampleBoxHalfDim:](PAEKeyerInitialize, "setInitialSamples:autokeySetupUtil:sampleBoxHalfDim:", v29, a6, v28);
  if (__p)
  {
    v34 = __p;
    operator delete(__p);
  }
}

- (void)newHisto3d:(BOOL)a3 image:(id)a4
{
  _BOOL4 v5;
  OMHisto *v6;
  OMHisto *v7;
  char *v8;

  v5 = a3;
  v6 = (OMHisto *)operator new();
  v7 = v6;
  if (v5)
  {
    OMHisto::OMHisto(v6, 0x8000, (FxBitmap *)a4);
  }
  else
  {
    OMHisto::OMHisto(v6, 0x40000, (FxBitmap *)a4);
  }
  *(_QWORD *)v7 = v8 + 16;
  return v7;
}

- (BOOL)calculateInitialMatteWithInfo:(id *)a3 omSamples:(void *)a4 colorPrimaries:(int)a5 screenColor:(int *)a6 minGreenHueAngle:(float)a7 maxGreenHueAngle:(float)a8 greenChroma:(float)a9 minBlueHueAngle:(float)a10 maxBlueHueAngle:(float)a11 blueChroma:(float)a12 histoPercentageIncluded:(float)a13 use32x32x32:(BOOL)a14 simpleKey:(BOOL)a15
{
  _BOOL4 v15;
  float v25;
  HGColorClamp *v26;
  int32x2_t v27;
  int32x2_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  __int128 v32;
  double *v33;
  double v34;
  float v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  HGColorMatrix *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  HgcLocateScreen *v48;
  HgcLocateScreen *v49;
  HgcBlueGreenScreenCandidate *v50;
  HGXForm *v51;
  HGTransform *v52;
  PAEKeyer *keyer;
  __int128 v54;
  __int128 v55;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var1;
  _BOOL4 v57;
  _QWORD *v58;
  PAEKeyerAutokeySetupUtil *v59;
  double v60;
  double v61;
  float v62;
  float v63;
  double v64;
  PAEKeyerSetupUtil *v65;
  OMKeyer2D *v66;
  double v67;
  double v68;
  int v69;
  double v70;
  double v71;
  double v72;
  double v73;
  float v74;
  float v75;
  float v76;
  double v77;
  float v78;
  BOOL v80;
  int v81;
  $E4FA4CFD4E311E26FBF98BD02AE1CAB1 *v82;
  _BOOL4 v84;
  HGColorClamp *v85;
  HGColorMatrix *v88;
  __int128 v89;
  char v90;
  float v91;
  HGXForm *v92;
  _OWORD v93[3];
  void *__p[2];
  uint64_t v95;
  unsigned int v96;
  unsigned int v97;
  unsigned int v98;
  unsigned int v99;
  unsigned int v100;
  unsigned int v101;
  unsigned int v102;
  unsigned int v103;
  unsigned int v104;
  unsigned int v105;
  _OWORD v106[4];
  _OWORD v107[4];
  uint64_t v108;

  v15 = a15;
  v84 = a14;
  v108 = *MEMORY[0x1E0C80C00];
  if (-[PAEKeyer is3DHistoExpandedForHDR](self->_keyer, "is3DHistoExpandedForHDR"))
    v25 = 10.532;
  else
    v25 = 1.0;
  v26 = (HGColorClamp *)HGObject::operator new(0x1C0uLL);
  v27.i32[0] = 0;
  *(float *)v28.i32 = v25;
  HGColorClamp::HGColorClamp(v26, v27, v28);
  v85 = v26;
  v88 = (HGColorMatrix *)HGObject::operator new(0x1F0uLL);
  HGColorMatrix::HGColorMatrix(v88);
  v29 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(self->_apiManager, "apiForProtocol:", &unk_1EF0A2958), "colorMatrixFromDesiredRGBToYCbCrAtTime:", a3->var0.var1), "matrix");
  for (i = 0; i != 4; ++i)
  {
    v31 = 0;
    v32 = v107[i];
    v33 = (double *)v29;
    do
    {
      v34 = *v33;
      v33 += 4;
      v35 = v34;
      v89 = v32;
      *(float *)((unint64_t)&v89 & 0xFFFFFFFFFFFFFFF3 | (4 * (v31 & 3))) = v35;
      v32 = v89;
      v107[i] = v89;
      ++v31;
    }
    while (v31 != 4);
    v29 += 8;
  }
  HGColorMatrix::LoadMatrix(v88, v107, 0);
  if (a5 == 1)
  {
    OMColorUtil::getRec2020to709Matrix(v36, v37, v38, v39, v40, v41, v42, (Mat4f *)__p);
    v43 = (HGColorMatrix *)HGObject::operator new(0x1F0uLL);
    HGColorMatrix::HGColorMatrix(v43);
    *(_QWORD *)&v45 = __PAIR64__(HIDWORD(v95), HIDWORD(__p[0]));
    *(_QWORD *)&v44 = __PAIR64__(v95, __p[0]);
    *(_QWORD *)&v47 = __PAIR64__(v97, HIDWORD(__p[1]));
    *(_QWORD *)&v46 = __PAIR64__(v96, __p[1]);
    *((_QWORD *)&v44 + 1) = __PAIR64__(v102, v98);
    *((_QWORD *)&v45 + 1) = __PAIR64__(v103, v99);
    *((_QWORD *)&v46 + 1) = __PAIR64__(v104, v100);
    *((_QWORD *)&v47 + 1) = __PAIR64__(v105, v101);
    v106[0] = v44;
    v106[1] = v45;
    v106[2] = v46;
    v106[3] = v47;
    HGColorMatrix::LoadMatrix(v43, v106, 0);
    (*(void (**)(HGColorMatrix *, _QWORD, HGColorClamp *))(*(_QWORD *)v43 + 120))(v43, 0, v26);
    (*(void (**)(HGColorMatrix *, _QWORD, HGColorMatrix *))(*(_QWORD *)v88 + 120))(v88, 0, v43);
    (*(void (**)(HGColorMatrix *))(*(_QWORD *)v43 + 24))(v43);
  }
  else
  {
    (*(void (**)(HGColorMatrix *, _QWORD, HGColorClamp *))(*(_QWORD *)v88 + 120))(v88, 0, v26);
  }
  v48 = (HgcLocateScreen *)HGObject::operator new(0x1A0uLL);
  HgcLocateScreen::HgcLocateScreen(v48);
  (*(void (**)(HgcLocateScreen *, _QWORD, float, float, float, float))(*(_QWORD *)v48 + 96))(v48, 0, a10, a10, a10, a10);
  (*(void (**)(HgcLocateScreen *, uint64_t, float, float, float, float))(*(_QWORD *)v48 + 96))(v48, 1, a11, a11, a11, a11);
  (*(void (**)(HgcLocateScreen *, uint64_t, float, float, float, float))(*(_QWORD *)v48 + 96))(v48, 2, a12, a12, a12, a12);
  (*(void (**)(HgcLocateScreen *, _QWORD, HGColorMatrix *))(*(_QWORD *)v48 + 120))(v48, 0, v88);
  v49 = (HgcLocateScreen *)HGObject::operator new(0x1A0uLL);
  HgcLocateScreen::HgcLocateScreen(v49);
  (*(void (**)(HgcLocateScreen *, _QWORD, float, float, float, float))(*(_QWORD *)v49 + 96))(v49, 0, a7, a7, a7, a7);
  (*(void (**)(HgcLocateScreen *, uint64_t, float, float, float, float))(*(_QWORD *)v49 + 96))(v49, 1, a8, a8, a8, a8);
  (*(void (**)(HgcLocateScreen *, uint64_t, float, float, float, float))(*(_QWORD *)v49 + 96))(v49, 2, a9, a9, a9, a9);
  (*(void (**)(HgcLocateScreen *, _QWORD, HGColorMatrix *))(*(_QWORD *)v49 + 120))(v49, 0, v88);
  v50 = (HgcBlueGreenScreenCandidate *)HGObject::operator new(0x1A0uLL);
  HgcBlueGreenScreenCandidate::HgcBlueGreenScreenCandidate(v50);
  (*(void (**)(HgcBlueGreenScreenCandidate *, _QWORD, HGColorClamp *))(*(_QWORD *)v50 + 120))(v50, 0, v26);
  (*(void (**)(HgcBlueGreenScreenCandidate *, uint64_t, HgcLocateScreen *))(*(_QWORD *)v50 + 120))(v50, 1, v48);
  (*(void (**)(HgcBlueGreenScreenCandidate *, uint64_t, HgcLocateScreen *))(*(_QWORD *)v50 + 120))(v50, 2, v49);
  v51 = (HGXForm *)HGObject::operator new(0x210uLL);
  HGXForm::HGXForm(v51);
  v52 = (HGTransform *)HGObject::operator new(0x90uLL);
  HGTransform::HGTransform(v52);
  (*(void (**)(HGTransform *, double, double, double))(*(_QWORD *)v52 + 144))(v52, 1.0, 1.0, 1.0);
  (*(void (**)(HGXForm *, HGTransform *))(*(_QWORD *)v51 + 576))(v51, v52);
  (*(void (**)(HGXForm *, _QWORD, HgcBlueGreenScreenCandidate *))(*(_QWORD *)v51 + 120))(v51, 0, v50);
  *(_QWORD *)&v106[0] = 0;
  keyer = self->_keyer;
  v54 = *(_OWORD *)&a3->var0.var0;
  v55 = *(_OWORD *)&a3->var4;
  v93[1] = *(_OWORD *)&a3->var2;
  v93[2] = v55;
  v93[0] = v54;
  var1 = a3->var0.var1;
  v92 = v51;
  (*(void (**)(HGXForm *))(*(_QWORD *)v51 + 16))(v51);
  v57 = -[PAEFilterDefaultBase getInputBitmap:withInfo:atTime:appendHGGraph:](keyer, "getInputBitmap:withInfo:atTime:appendHGGraph:", v106, v93, var1, &v92);
  if (v92)
    (*(void (**)(HGXForm *))(*(_QWORD *)v92 + 24))(v92);
  if (v57)
  {
    v80 = v57;
    v81 = v15;
    v82 = a3;
    v58 = -[PAEKeyerInitialize newHisto3d:image:](self, "newHisto3d:image:", v84, *(_QWORD *)&v106[0]);
    __p[0] = 0;
    __p[1] = 0;
    v95 = 0;
    v59 = -[PAEKeyerAutokeySetupUtil initWithAPIManager:]([PAEKeyerAutokeySetupUtil alloc], "initWithAPIManager:", self->_apiManager);
    v91 = 0.0;
    OMHisto::calculateHistogram((uint64_t)v58, a6, &v91, 1.0);
    v62 = 1.0;
    if (-[PAEKeyer is3DHistoExpandedForHDR](self->_keyer, "is3DHistoExpandedForHDR"))
    {
      v63 = v91 + 0.05;
      if ((float)(v91 + 0.05) < 1.0)
        v63 = 1.0;
      if (v91 >= 3.0)
        v62 = (float)(int)v91 + 1.0;
      else
        v62 = v63;
      if (v58)
        (*(void (**)(_QWORD *))(*v58 + 8))(v58);
      v58 = -[PAEKeyerInitialize newHisto3d:image:](self, "newHisto3d:image:", v84, *(_QWORD *)&v106[0]);
      OMHisto::calculateHistogram((uint64_t)v58, a6, &v91, v62);
    }
    *(float *)&v60 = a13;
    *(float *)&v61 = v62;
    -[PAEKeyerInitialize calculateInitialSamples:percentageOfBaseColorIncluded:use32x32x32:autokeySetupUtil:samples:scale:](self, "calculateInitialSamples:percentageOfBaseColorIncluded:use32x32x32:autokeySetupUtil:samples:scale:", v58[11], v84, v59, __p, v60, v61);
    v90 = 0;
    OMSamples::syncAutokey((uint64_t)a4, (_DWORD **)__p, &v90);
    OMSamples::updateTolAddSamples((uint64_t)a4, a5);
    -[PAEKeyerAutokeySetupUtil setHistogram:](v59, "setHistogram:", v58[11]);
    *(float *)&v64 = v62;
    -[PAEKeyerAutokeySetupUtil setHistogramScale:](v59, "setHistogramScale:", v64);
    v65 = -[PAEKeyerSetupUtil initWithAPIManager:colorPrimaries:atTime:]([PAEKeyerSetupUtil alloc], "initWithAPIManager:colorPrimaries:atTime:", self->_apiManager, a5, v82->var0.var1);
    v66 = -[PAEKeyerSetupUtil omKeyer](v65, "omKeyer");
    v67 = 0.0;
    if (!v15)
    {
      -[PAEKeyerSetupUtil autoKeySoftness](v65, "autoKeySoftness");
      v67 = v68;
    }
    v69 = -[PAEKeyerSetupUtil tight](v65, "tight");
    -[PAEKeyerSetupUtil shadowsGain](v65, "shadowsGain");
    v71 = v70;
    -[PAEKeyerSetupUtil highlightsGain](v65, "highlightsGain");
    v73 = v72;
    -[PAEKeyerSetupUtil spreadGain](v65, "spreadGain");
    v74 = v67;
    v75 = v71;
    v76 = v73;
    v78 = v77;
    OMKeyer2D::computeModel(v66, 1, v74, v69, (OMSamples *)a4, v75, v76, v78, 0, v81);
    -[PAEKeyerSetupUtil syncWithDB:setAsDefault:](v65, "syncWithDB:setAsDefault:", v82->var0.var1, 1);
    -[PAEKeyerAutokeySetupUtil syncWithDBAsDefault](v59, "syncWithDBAsDefault");
    -[PAEKeyerAutokeySetupUtil syncWithDB](v59, "syncWithDB");

    (*(void (**)(_QWORD *))(*v58 + 8))(v58);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    LOBYTE(v57) = v80;
  }
  else
  {
    v65 = 0;
  }

  (*(void (**)(HGTransform *))(*(_QWORD *)v52 + 24))(v52);
  (*(void (**)(HGXForm *))(*(_QWORD *)v51 + 24))(v51);
  (*(void (**)(HgcBlueGreenScreenCandidate *))(*(_QWORD *)v50 + 24))(v50);
  (*(void (**)(HgcLocateScreen *))(*(_QWORD *)v49 + 24))(v49);
  (*(void (**)(HgcLocateScreen *))(*(_QWORD *)v48 + 24))(v48);
  (*(void (**)(HGColorMatrix *))(*(_QWORD *)v88 + 24))(v88);
  if (v85)
    (*(void (**)(HGColorClamp *))(*(_QWORD *)v85 + 24))(v85);
  return v57;
}

- (BOOL)findSampleRectsWithInfo:(id *)a3 screenColor:(int *)a4 colorPrimaries:(int)a5 width:(int)a6 height:(int)a7 minGreenHueAngle:(float)a8 maxGreenHueAngle:(float)a9 greenChroma:(float)a10 minBlueHueAngle:(float)a11 maxBlueHueAngle:(float)a12 blueChroma:(float)a13 histoPercentageIncluded:(float)a14 omSamples:(void *)a15 viewingSetupMatte:(BOOL)a16 use32x32Histogram:(BOOL)a17 simpleKey:(BOOL)a18
{
  uint64_t v19;
  __int128 v29;
  OMSamples *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  BOOL v36;
  _OWORD v38[2];
  double v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  double var4;

  v19 = *(_QWORD *)&a5;
  v29 = *(_OWORD *)&a3->var2;
  v41 = *(_OWORD *)&a3->var0.var0;
  v42 = v29;
  var4 = a3->var4;
  v30 = (OMSamples *)a15;
  if (!a15)
  {
    v30 = (OMSamples *)operator new();
    OMSamples::OMSamples(v30);
  }
  v38[0] = v41;
  v38[1] = v42;
  v39 = var4;
  v40 = 3;
  *(float *)&v31 = a10;
  *(float *)&v32 = a11;
  *(float *)&v33 = a12;
  *(float *)&v34 = a13;
  *(float *)&v35 = a14;
  v36 = -[PAEKeyerInitialize calculateInitialMatteWithInfo:omSamples:colorPrimaries:screenColor:minGreenHueAngle:maxGreenHueAngle:greenChroma:minBlueHueAngle:maxBlueHueAngle:blueChroma:histoPercentageIncluded:use32x32x32:simpleKey:](self, "calculateInitialMatteWithInfo:omSamples:colorPrimaries:screenColor:minGreenHueAngle:maxGreenHueAngle:greenChroma:minBlueHueAngle:maxBlueHueAngle:blueChroma:histoPercentageIncluded:use32x32x32:simpleKey:", v38, v30, v19, a4, a17, a18, COERCE_DOUBLE(__PAIR64__(DWORD1(v41), LODWORD(a8))), COERCE_DOUBLE(__PAIR64__(DWORD1(v42), LODWORD(a9))), v31, v32, v33, v34, v35);
  if (!a15)
    (*(void (**)(OMSamples *))(*(_QWORD *)v30 + 8))(v30);
  return v36;
}

@end
