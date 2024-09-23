@implementation PAEChromaKeyeriOS

- (PAEChromaKeyeriOS)initWithAPIManager:(id)a3
{
  PAEChromaKeyeriOS *v3;
  PAEKeyerPreprocess *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAEChromaKeyeriOS;
  v3 = -[PAESharedDefaultBase initWithAPIManager:](&v6, sel_initWithAPIManager_, a3);
  v3->_matteTools = objc_alloc_init(PAEKeyerMatteTools);
  v4 = objc_alloc_init(PAEKeyerPreprocess);
  v3->_preprocessTools = v4;
  v4->_apiManager = v3->super.super._apiManager;
  v3->_lutsBitmapLoaderCache = 0;
  return v3;
}

- (void)dealloc
{
  void *lutsBitmapLoaderCache;
  objc_super v4;

  lutsBitmapLoaderCache = self->_lutsBitmapLoaderCache;
  if (lutsBitmapLoaderCache)
    (*(void (**)(void *))(*(_QWORD *)lutsBitmapLoaderCache + 24))(lutsBitmapLoaderCache);
  v4.receiver = self;
  v4.super_class = (Class)PAEChromaKeyeriOS;
  -[PAESharedDefaultBase dealloc](&v4, sel_dealloc);
}

- (id)properties
{
  if (-[PAEChromaKeyeriOS properties]::once != -1)
    dispatch_once(&-[PAEChromaKeyeriOS properties]::once, &__block_literal_global_28);
  return (id)-[PAEChromaKeyeriOS properties]::sPropertiesDict;
}

uint64_t __31__PAEChromaKeyeriOS_properties__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  v1 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 65792);
  result = objc_msgSend(v0, "initWithObjectsAndKeys:", v1, CFSTR("PositionIndependent"), v2, CFSTR("MayRemapTime"), v3, CFSTR("SupportsLargeRenderScale"), v4, CFSTR("SupportsHeliumRendering"), v5, CFSTR("SDRWorkingSpace"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 590080), CFSTR("HDRWorkingSpace"), 0);
  -[PAEChromaKeyeriOS properties]::sPropertiesDict = result;
  return result;
}

- (BOOL)addParameters
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("iOSChroma::TargetColor"), 0, 0), 1, 0, 0.0, 0.75, 0.0);
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("iOSChroma::TargetColor HDR"), 0, 0), 5, 0, 0.0, 0.75, 0.0);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("iOSChroma::Tolerance"), 0, 0), 2, 0, 0.1, 0.0, 0.5, 0.0, 0.5, 0.001);
    objc_msgSend(v3, "addPercentSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("iOSChroma::SpillLevel"), 0, 0), 3, 0, 0.3, 0.0, 1.0, 0.0, 1.0, 0.001);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("iOSChroma::Softness"), 0, 0), 4, 0, 9.0, 0.0, 20.0, 0.0, 20.0, 0.1);
  }
  return 1;
}

- (void)createLutForNode:(void *)a3 input:(int)a4 rect:(const HGRect *)a5 omKeyer:(void *)a6
{
  uint64_t v8;
  HGBitmap *v11;
  int v12;
  uint64_t v13;
  double v14;
  float v15;
  _DWORD *v16;
  float v17;
  int v18;
  float v19;
  uint64_t v20;
  HGTexture *v21;
  void *lutsBitmapLoaderCache;
  HGBitmapLoader *v23;

  v8 = *(_QWORD *)&a4;
  v11 = (HGBitmap *)HGObject::operator new(0x80uLL);
  HGBitmap::HGBitmap(v11, *(_QWORD *)&a5->var0, *(_QWORD *)&a5->var2, 28);
  v12 = 0;
  v13 = *((_QWORD *)v11 + 10);
  v14 = 0.0;
  do
  {
    v15 = v14 / 255.0;
    OMKeyer2D::getAlphaLuma((OMKeyer2D *)a6, v15);
    v16 = (_DWORD *)*((_QWORD *)a6 + 15);
    v17 = (float)(unint64_t)((uint64_t)(*((_QWORD *)a6 + 16) - (_QWORD)v16) >> 2);
    *(_DWORD *)v13 = v18;
    v19 = v17 + -1.0;
    v20 = (uint64_t)rintf((float)(v17 + -1.0) * v15);
    if ((v20 & 0x8000000000000000) == 0)
    {
      if (v19 < (float)v20)
        v20 = (unint64_t)v19;
      v16 += v20;
    }
    *(_DWORD *)(v13 + 4) = *v16;
    *(float *)(v13 + 8) = OMKeyer2D::getAlphaSatOffset((OMKeyer2D *)a6, v12);
    v14 = v14 + 1.0;
    ++v12;
    v13 += 16;
  }
  while (v12 != 256);
  v21 = (HGTexture *)HGObject::operator new(0x80uLL);
  HGTexture::HGTexture(v21, *a5, v11);
  lutsBitmapLoaderCache = self->_lutsBitmapLoaderCache;
  if (lutsBitmapLoaderCache)
    (*(void (**)(void *))(*(_QWORD *)lutsBitmapLoaderCache + 24))(lutsBitmapLoaderCache);
  v23 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
  HGBitmapLoader::HGBitmapLoader(v23, (HGBitmap *)v21);
  self->_lutsBitmapLoaderCache = v23;
  (*(void (**)(HGTexture *))(*(_QWORD *)v21 + 24))(v21);
  (*(void (**)(HGBitmap *))(*(_QWORD *)v11 + 24))(v11);
  (*(void (**)(void *, uint64_t, void *))(*(_QWORD *)a3 + 120))(a3, v8, self->_lutsBitmapLoaderCache);
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  float v28;
  float v29;
  double v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  _DWORD *v37;
  uint64_t v38;
  float *v39;
  _BOOL8 v40;
  PAEKeyerSetupUtil *v41;
  OMKeyer2D *v42;
  double v43;
  int v44;
  double v45;
  double v46;
  double v47;
  double v48;
  float v49;
  float v50;
  float v51;
  double v52;
  float v53;
  uint64_t v54;
  HGGLNode *v55;
  uint64_t v56;
  HGColorClamp *v57;
  HGColorMatrix *v58;
  HAlphaKeyer *v59;
  uint64_t v60;
  PAEKeyerMatteTools *matteTools;
  __int128 v62;
  double v63;
  double v64;
  int v65;
  double v66;
  double v67;
  double v68;
  BOOL v69;
  HgcPostKeyer *v70;
  uint64_t v71;
  float v72;
  float v73;
  HgcSpillRemovalDarkEdges *v74;
  float v75;
  float v77;
  float v78;
  float v79;
  float v80;
  id v81;
  float v82[16];
  float v83[16];
  char v84[16];
  float v85;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  float v91;
  float v92;
  uint64_t v93;
  int v94;
  _OWORD v95[3];
  _QWORD v96[2];
  HGGLNode *v97;
  char v98;
  char v99;
  void *__p;
  void *v101;
  unint64_t v102;
  _DWORD v103[3];
  _BYTE v104[144];
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  _OWORD v114[4];
  float v115[24];
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
  float v127;
  float v128;
  float v129;
  float v130;
  float v131;
  float v132;
  float v133;
  float v134;
  float v135;
  float v136;
  float v137;
  float v138;
  float64x2_t v139;
  double v140[4];

  v140[2] = *(double *)MEMORY[0x1E0C80C00];
  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v10 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A4F90);
  v11 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A2958);
  if (!v9)
    return 0;
  v12 = (void *)v11;
  if (!a4)
  {
    v113 = 0;
    v112 = 0;
    goto LABEL_7;
  }
  objc_msgSend(a4, "heliumRef");
  v112 = v113;
  if (!v113)
  {
LABEL_7:
    v111 = 0;
    goto LABEL_8;
  }
  (*(void (**)(uint64_t))(*(_QWORD *)v113 + 16))(v113);
  v111 = v113;
  (*(void (**)(uint64_t))(*(_QWORD *)v113 + 16))(v113);
  if (!-[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1)
    || objc_msgSend(a4, "imageType") != 3)
  {
    goto LABEL_68;
  }
LABEL_8:
  v110 = 0.0;
  v109 = 1.0;
  v108 = 1.0;
  objc_msgSend(v10, "getLevelsBlack:White:Gamma:fromParm:atTime:", &v110, &v109, &v108, 26, a5->var0.var1);
  v107 = 0.0;
  v105 = 0.0;
  v106 = 0.0;
  objc_msgSend(v9, "getRedValue:greenValue:blueValue:fromParm:atFxTime:", &v139, &v139.f64[1], v140, 1, a5->var0.var1);
  v14 = objc_msgSend(v12, "colorPrimaries");
  if (v14 == 1)
  {
    objc_msgSend(v9, "getRedValue:greenValue:blueValue:fromParm:atFxTime:", &v139, &v139.f64[1], v140, 5, a5->var0.var1);
    v139 = vmulq_f64(v139, (float64x2_t)vdupq_n_s64(0x3FD1FA3F40000000uLL));
    v140[0] = v140[0] * 0.280898869;
  }
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v107, 2, a5->var0.var1);
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v106, 3, a5->var0.var1);
  objc_msgSend(v9, "getFloatValue:fromParm:atFxTime:", &v105, 4, a5->var0.var1);
  OMSamples::OMSamples((OMSamples *)v104);
  v15 = v139.f64[0];
  v16 = v139.f64[1];
  v17 = v140[0];
  v18 = v15 <= v16 ? v139.f64[1] : v139.f64[0];
  v19 = v18 <= v17 ? v140[0] : v18;
  v20 = 0.0;
  v79 = v139.f64[0];
  v80 = v139.f64[1];
  v78 = v140[0];
  if (v19 <= 0.0)
  {
    v23 = 0.0;
  }
  else
  {
    if (v15 >= v16)
      v21 = v139.f64[1];
    else
      v21 = v139.f64[0];
    if (v21 >= v17)
      v21 = v140[0];
    v22 = v19 - v21;
    v23 = v22 / v19;
    if ((float)(v22 / v19) != 0.0)
    {
      v24 = (float)(v19 - v15) / v22;
      v25 = (float)(v19 - v16) / v22;
      v26 = (float)(v19 - v17) / v22;
      v27 = (float)(v25 + 4.0) - v24;
      v28 = (float)(v24 + 2.0) - v26;
      if (v19 != v16)
        v28 = v27;
      v29 = v26 - v25;
      if (v19 == v15)
        v20 = v29;
      else
        v20 = v28;
      if (v20 < 0.0)
        v20 = v20 + 6.0;
    }
  }
  v30 = v107;
  v31 = v20 - (v30 + v30);
  v32 = v30 + v30 + v20;
  v33 = v23 - v107 * 0.5;
  v34 = v107 * 0.5 + v23;
  v35 = v19 - v107 * 0.5;
  v36 = v107 * 0.5 + v19;
  v77 = v36;
  hsvtorgb(v31, v33, v35, v115, &v116, &v117);
  hsvtorgb(v31, v23, v19, &v118, &v119, &v120);
  hsvtorgb(v20, v33, v19, &v121, &v122, &v123);
  hsvtorgb(v20, v23, v35, &v124, &v125, &v126);
  hsvtorgb(v32, v34, v77, &v127, &v128, &v129);
  hsvtorgb(v32, v23, v19, &v130, &v131, &v132);
  hsvtorgb(v20, v34, v19, &v133, &v134, &v135);
  hsvtorgb(v20, v23, v77, &v136, &v137, &v138);
  *(float *)v103 = v79;
  *(float *)&v103[1] = v80;
  *(float *)&v103[2] = v78;
  __p = 0;
  v101 = 0;
  v102 = 0;
  v37 = (_DWORD *)std::vector<Vec3f>::__push_back_slow_path<Vec3f const&>((uint64_t *)&__p, v103);
  v38 = 0;
  v101 = v37;
  do
  {
    v39 = &v115[v38];
    if ((unint64_t)v37 >= v102)
    {
      v37 = (_DWORD *)std::vector<Vec3f>::__push_back_slow_path<Vec3f const&>((uint64_t *)&__p, v39);
    }
    else
    {
      *v37 = *(_DWORD *)v39;
      v37[1] = *((_DWORD *)v39 + 1);
      v37[2] = *((_DWORD *)v39 + 2);
      v37 += 3;
    }
    v101 = v37;
    v38 += 3;
  }
  while (v38 != 24);
  v81 = a3;
  v99 = 0;
  v40 = v14 != 0;
  OMSamples::syncAutokey((uint64_t)v104, (_DWORD **)&__p, &v99);
  OMSamples::addTolAddSamples((uint64_t)v104, (char *)&__p);
  OMSamples::updateTolAddSamples((uint64_t)v104, v40);
  v41 = -[PAEKeyerSetupUtil initWithOMSamples:colorPrimaries:atTime:]([PAEKeyerSetupUtil alloc], "initWithOMSamples:colorPrimaries:atTime:", v104, v40, a5->var0.var1);
  v42 = -[PAEKeyerSetupUtil omKeyer](v41, "omKeyer");
  v43 = v105;
  v44 = -[PAEKeyerSetupUtil tight](v41, "tight");
  -[PAEKeyerSetupUtil shadowsGain](v41, "shadowsGain");
  v46 = v45;
  -[PAEKeyerSetupUtil highlightsGain](v41, "highlightsGain");
  v48 = v47;
  -[PAEKeyerSetupUtil spreadGain](v41, "spreadGain");
  v49 = v43;
  v50 = v46;
  v51 = v48;
  v53 = v52;
  OMKeyer2D::computeModel(v42, 1, v49, v44, (OMSamples *)v104, v50, v51, v53, 0, 0);
  v54 = -[PAEKeyerSetupUtil omKeyer](v41, "omKeyer");
  v55 = (HGGLNode *)HGObject::operator new(0x1B0uLL);
  HGGLNode::HGGLNode(v55, 0);
  HGGLNode::hglClearToBlack(v55);
  v97 = v55;
  if (v55)
    (*(void (**)(HGGLNode *))(*(_QWORD *)v55 + 16))(v55);
  PAEKeyerDrawAlpha::drawAlpha_in_HGGLNode((uint64_t)&v98, v54, &v97);
  if (v97)
    (*(void (**)(HGGLNode *))(*(_QWORD *)v97 + 24))(v97);
  if (v14 == 1)
  {
    FxSupport::newHGRefWithInput<HGColorMatrix>(v113, (HGColorMatrix **)v114);
    (*(void (**)(_QWORD, _QWORD, float, float, float, float))(**(_QWORD **)&v114[0] + 96))(*(_QWORD *)&v114[0], 0, 0.2809, 0.0, 0.0, 0.0);
    (*(void (**)(_QWORD, uint64_t, float, float, float, float))(**(_QWORD **)&v114[0] + 96))(*(_QWORD *)&v114[0], 1, 0.0, 0.2809, 0.0, 0.0);
    (*(void (**)(_QWORD, uint64_t, float, float, float, float))(**(_QWORD **)&v114[0] + 96))(*(_QWORD *)&v114[0], 2, 0.0, 0.0, 0.2809, 0.0);
    (*(void (**)(_QWORD, uint64_t, float, float, float, float))(**(_QWORD **)&v114[0] + 96))(*(_QWORD *)&v114[0], 3, 0.0, 0.0, 0.0, 1.0);
    v56 = *(_QWORD *)&v114[0];
    if (v113 == *(_QWORD *)&v114[0])
    {
      if (*(_QWORD *)&v114[0])
        (*(void (**)(_QWORD))(**(_QWORD **)&v114[0] + 24))(*(_QWORD *)&v114[0]);
    }
    else
    {
      if (v113)
        (*(void (**)(void))(*(_QWORD *)v113 + 24))();
      v113 = v56;
    }
  }
  v57 = (HGColorClamp *)HGObject::operator new(0x1C0uLL);
  HGColorClamp::HGColorClamp(v57);
  (*(void (**)(HGColorClamp *, _QWORD, uint64_t))(*(_QWORD *)v57 + 120))(v57, 0, v113);
  v58 = (HGColorMatrix *)HGObject::operator new(0x1F0uLL);
  HGColorMatrix::HGColorMatrix(v58);
  desiredRGBToYCbCrMatrix(self->super.super._apiManager, (uint64_t)v114, (uint64_t)a5->var0.var1);
  HGColorMatrix::LoadMatrix(v58, v114, 0);
  (*(void (**)(HGColorMatrix *, _QWORD, HGColorClamp *))(*(_QWORD *)v58 + 120))(v58, 0, v57);
  v59 = (HAlphaKeyer *)HGObject::operator new(0x1B0uLL);
  HAlphaKeyer::HAlphaKeyer(v59, 0, 512);
  (*(void (**)(HAlphaKeyer *, _QWORD, HGColorMatrix *))(*(_QWORD *)v59 + 120))(v59, 0, v58);
  (*(void (**)(HAlphaKeyer *, uint64_t, HGGLNode *))(*(_QWORD *)v59 + 120))(v59, 1, v55);
  (*(void (**)(HAlphaKeyer *, _QWORD, float, float, float, float))(*(_QWORD *)v59 + 96))(v59, 0, 0.0, *(float *)(v54 + 56) * -0.5, *(float *)(v54 + 60) * -0.5, 0.0);
  (*(void (**)(HAlphaKeyer *, uint64_t, float, float, float, float))(*(_QWORD *)v59 + 96))(v59, 1, 0.0, 0.0, 0.0, 0.0);
  (*(void (**)(HAlphaKeyer *, uint64_t, float, float, float, float))(*(_QWORD *)v59 + 96))(v59, 2, 1.0, 1.0, 1.0, 1.0);
  (*(void (**)(HAlphaKeyer *, uint64_t, float, float, float, float))(*(_QWORD *)v59 + 96))(v59, 3, 1.0, 1.0, 1.0, 1.0);
  (*(void (**)(HAlphaKeyer *, uint64_t, float, float, float, float))(*(_QWORD *)v59 + 96))(v59, 4, 511.0, 511.0, 511.0, 511.0);
  v96[0] = HGRectMake4i(0, 0, 0x100u, 1u);
  v96[1] = v60;
  -[PAEChromaKeyeriOS createLutForNode:input:rect:omKeyer:](self, "createLutForNode:input:rect:omKeyer:", v59, 2, v96, v54);
  if ((HAlphaKeyer *)v112 != v59)
  {
    if (v112)
      (*(void (**)(void))(*(_QWORD *)v112 + 24))();
    v112 = (uint64_t)v59;
    (*(void (**)(HAlphaKeyer *))(*(_QWORD *)v59 + 16))(v59);
  }
  matteTools = self->_matteTools;
  v62 = *(_OWORD *)&a5->var2;
  v95[0] = *(_OWORD *)&a5->var0.var0;
  v95[1] = v62;
  v95[2] = *(_OWORD *)&a5->var4;
  objc_msgSend(v81, "pixelAspect");
  v64 = v63;
  -[PAESharedDefaultBase getBlendingGamma](self, "getBlendingGamma");
  LODWORD(v66) = v65;
  *(float *)&v67 = v64;
  LODWORD(v68) = 1.0;
  v69 = -[PAEKeyerMatteTools doMatteManipulationWithInfo:pixelAspectRatio:fieldHeight:doInvertMatte:inputIsInverted:fillHoles:scaling:blendingGamma:blackLevel:whiteLevel:gammaLevel:preKeyedInputNode:outputNode:](matteTools, "doMatteManipulationWithInfo:pixelAspectRatio:fieldHeight:doInvertMatte:inputIsInverted:fillHoles:scaling:blendingGamma:blackLevel:whiteLevel:gammaLevel:preKeyedInputNode:outputNode:", v95, 0, 1, 0, 0, &v111, v67, v68, v66, v110, v109, v108, &v112);
  if (v69)
  {
    v70 = (HgcPostKeyer *)HGObject::operator new(0x1A0uLL);
    HgcPostKeyer::HgcPostKeyer(v70);
    (*(void (**)(HgcPostKeyer *, _QWORD, uint64_t))(*(_QWORD *)v70 + 120))(v70, 0, v112);
    (*(void (**)(HgcPostKeyer *, uint64_t, uint64_t))(*(_QWORD *)v70 + 120))(v70, 1, v111);
    if (v106 >= 0.100000001)
    {
      v106 = (v106 + -0.100000001) / 9.0;
      v93 = 0x3F0000003F000000;
      v94 = 1056964608;
      v71 = -[PAEKeyerSetupUtil omKeyer](v41, "omKeyer");
      v72 = v106;
      v73 = v110;
      OMKeyer2D::getSpillSuppressTransf(v71, (uint64_t)&v93, (uint64_t)v84, (uint64_t)v83, (uint64_t)v82, v40, 0, v72, v73, 0.0, 0.0, 1.0);
      v74 = (HgcSpillRemovalDarkEdges *)HGObject::operator new(0x1A0uLL);
      HgcSpillRemovalDarkEdges::HgcSpillRemovalDarkEdges(v74);
      (*(void (**)(HgcSpillRemovalDarkEdges *, _QWORD, float, float, float, float))(*(_QWORD *)v74 + 96))(v74, 0, v83[0], v83[1], v83[2], v83[3]);
      (*(void (**)(HgcSpillRemovalDarkEdges *, uint64_t, float, float, float, float))(*(_QWORD *)v74 + 96))(v74, 1, v83[4], v83[5], v83[6], v83[7]);
      (*(void (**)(HgcSpillRemovalDarkEdges *, uint64_t, float, float, float, float))(*(_QWORD *)v74 + 96))(v74, 2, v83[8], v83[9], v83[10], v83[11]);
      (*(void (**)(HgcSpillRemovalDarkEdges *, uint64_t, float, float, float, float))(*(_QWORD *)v74 + 96))(v74, 3, v89, v90, v91, v92);
      (*(void (**)(HgcSpillRemovalDarkEdges *, uint64_t, float, float, float, float))(*(_QWORD *)v74 + 96))(v74, 4, v85, v86, v87, v88);
      (*(void (**)(HgcSpillRemovalDarkEdges *, uint64_t, float, float, float, float))(*(_QWORD *)v74 + 96))(v74, 5, 0.0, 0.0, 0.0, 0.0);
      (*(void (**)(HgcSpillRemovalDarkEdges *, uint64_t, float, float, float, float))(*(_QWORD *)v74 + 96))(v74, 6, v82[0], v82[1], v82[2], v82[3]);
      (*(void (**)(HgcSpillRemovalDarkEdges *, uint64_t, float, float, float, float))(*(_QWORD *)v74 + 96))(v74, 7, v82[4], v82[5], v82[6], v82[7]);
      (*(void (**)(HgcSpillRemovalDarkEdges *, uint64_t, float, float, float, float))(*(_QWORD *)v74 + 96))(v74, 8, v82[8], v82[9], v82[10], v82[11]);
      (*(void (**)(HgcSpillRemovalDarkEdges *, uint64_t, float, float, float, float))(*(_QWORD *)v74 + 96))(v74, 9, 0.0, 0.0, 0.0, 0.0);
      v75 = v109;
      (*(void (**)(HgcSpillRemovalDarkEdges *, uint64_t, float, float, float, float))(*(_QWORD *)v74 + 96))(v74, 10, v75, v75, v75, 1.0);
      (*(void (**)(HgcSpillRemovalDarkEdges *, uint64_t, float, float, float, float))(*(_QWORD *)v74 + 96))(v74, 11, 10.0, 10.0, 10.0, 10.0);
      (*(void (**)(HgcSpillRemovalDarkEdges *, _QWORD, uint64_t))(*(_QWORD *)v74 + 120))(v74, 0, v111);
      (*(void (**)(HgcPostKeyer *, uint64_t, HgcSpillRemovalDarkEdges *))(*(_QWORD *)v70 + 120))(v70, 2, v74);
      (*(void (**)(HgcSpillRemovalDarkEdges *))(*(_QWORD *)v74 + 24))(v74);
    }
    else
    {
      (*(void (**)(HgcPostKeyer *, uint64_t, uint64_t, double))(*(_QWORD *)v70 + 120))(v70, 2, v111, v106);
    }
    (*(void (**)(HgcPostKeyer *, _QWORD, float, float, float, float))(*(_QWORD *)v70 + 96))(v70, 0, -1.0, -1.0, -1.0, -1.0);
    if ((HgcPostKeyer *)v112 != v70)
    {
      if (v112)
        (*(void (**)(void))(*(_QWORD *)v112 + 24))();
      v112 = (uint64_t)v70;
      (*(void (**)(HgcPostKeyer *))(*(_QWORD *)v70 + 16))(v70);
    }

    objc_msgSend(v81, "setHeliumRef:", &v112);
    (*(void (**)(HgcPostKeyer *))(*(_QWORD *)v70 + 24))(v70);
  }
  else
  {

  }
  (*(void (**)(HAlphaKeyer *))(*(_QWORD *)v59 + 24))(v59);
  (*(void (**)(HGColorMatrix *))(*(_QWORD *)v58 + 24))(v58);
  (*(void (**)(HGColorClamp *))(*(_QWORD *)v57 + 24))(v57);
  if (v55)
    (*(void (**)(HGGLNode *))(*(_QWORD *)v55 + 24))(v55);
  if (__p)
  {
    v101 = __p;
    operator delete(__p);
  }
  OMSamples::~OMSamples((OMSamples *)v104);
  if (!v69)
    v13 = 0;
  else
LABEL_68:
    v13 = 1;
  if (v111)
    (*(void (**)(uint64_t))(*(_QWORD *)v111 + 24))(v111);
  if (v112)
    (*(void (**)(uint64_t))(*(_QWORD *)v112 + 24))(v112);
  if (v113)
    (*(void (**)(uint64_t))(*(_QWORD *)v113 + 24))(v113);
  return v13;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  __int128 v6;
  _OWORD v8[3];

  v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->var4;
  -[PAESharedDefaultBase overrideFrameSetupForRenderMode:hardware:software:](self, "overrideFrameSetupForRenderMode:hardware:software:", v8, a5, a6);
  return 1;
}

@end
