@implementation PAEBadTV

- (PAEBadTV)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEBadTV;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PAEBadTV;
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
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("MayRemapTime"), v5, CFSTR("PreservesAlpha"), v6, CFSTR("SupportsLargeRenderScale"), v7, CFSTR("SupportsHeliumRendering"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)variesOverTime
{
  return 1;
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PAEBadTV;
  -[PAESharedDefaultBase addParameters](&v10, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  v4 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v4)
  {
    v5 = objc_msgSend(v4, "versionAtCreation");
    if (!v3)
      return v3 != 0;
  }
  else
  {
    v5 = 0;
    if (!v3)
      return v3 != 0;
  }
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("BadTV::Waviness"), 0, 0), 1, 0, 10.0, 0.0, 200.0, 0.0, 200.0, 1.0);
  objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("BadTV::Roll"), 0, 0), 2, 0, 45.0, -1000.0, 1000.0, -100.0, 100.0, 1.0);
  objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("BadTV::Static"), 0, 0), 3, 0, 0.1, 0.0, 4.0, 0.0, 1.0, 0.1);
  objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("BadTV::ColorSync"), 0, 0), 4, 0, 0.8, 0.0, 1.0, 0.0, 1.0, 0.1);
  objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("BadTV::Saturation"), 0, 0), 5, 0, -25.0, -100.0, 100.0, -100.0, 100.0, 1.0);
  objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("BadTV::ScanLineBrightness"), 0, 0), 6, 0, 1.5, 0.0, 5.0, 0.0, 5.0, 0.1);
  if (v5)
  {
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("BadTV::ScanLinePercentage"), 0, 0), 9, 0, 0.5, 0.0, 1.0, 0.0, 1.0, 0.1);
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("BadTV::NumScanLines"), 0, 0), 10, 0, 100.0, 1.0, 10000.0, 1.0, 1080.0, 1.0);
  }
  else
  {
    LODWORD(v8) = 0;
    objc_msgSend(v3, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("BadTV::ScanLineThickness"), 0, 0), 7, 2, 0, 100, 0, 0x100000064, v8);
    LODWORD(v9) = 0;
    objc_msgSend(v3, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("BadTV::ScanLineDistance"), 0, 0), 8, 1, 1, 100, 1, 0x100000064, v9);
  }
  return v3 != 0;
}

- (void)createWavyTableOfHeight:(int)a3 rowBytes:(unint64_t)a4 table:(char *)a5 flip:(BOOL)a6 atTime:(id)a7
{
  _BOOL4 v8;
  double v13;
  int v14;
  int v15;
  float v16;
  float v17;
  float v18;
  float *v19;
  uint64_t v20;
  double v21;
  float v22;
  float v23;
  float v24;
  uint64_t v25;
  float *v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  uint64_t v30;
  float v31;
  float v32;
  uint64_t v33;
  float *v34;
  float v35;
  float v36;
  float v37;
  uint64_t v38;
  _QWORD v39[384];
  int v40;
  void *v41[3];

  v8 = a6;
  std::vector<float>::vector(v41, a3);
  RandMersenne::RandMersenne((RandMersenne *)&v38);
  -[PAESharedDefaultBase frameFromFxTime:forPlugIn:](self, "frameFromFxTime:forPlugIn:", a7.var1, self);
  RandMersenne::SetSeed((RandMersenne *)&v38, (v13 + v13) + 1);
  v14 = v40;
  if (v40 >= 382)
  {
    dsfmt_gen_rand_all((uint64_t)v39);
    v14 = 0;
  }
  v15 = v14 + 1;
  v40 = v14 + 1;
  v16 = (float)(a3 + 1);
  v17 = (float)~a3;
  v18 = *(double *)&v39[v14] + -1.0;
  v19 = (float *)v41[0];
  *(float *)v41[0] = v18;
  if (a3 > 1)
  {
    v20 = 1;
    do
    {
      if (v15 >= 382)
      {
        dsfmt_gen_rand_all((uint64_t)v39);
        v15 = 0;
        v19 = (float *)v41[0];
      }
      v21 = *(double *)&v39[v15++];
      v40 = v15;
      *(float *)&v21 = v21 + -1.0;
      v18 = v18 + (float)(*(float *)&v21 + -0.5);
      v19[v20] = v18;
      if (v18 >= v16)
      {
        if (v18 > v17)
          v17 = v18;
      }
      else
      {
        v16 = v18;
      }
      ++v20;
    }
    while (a3 != v20);
  }
  v22 = fabsf(v16);
  v23 = fabsf(v17);
  if (v23 > v22)
    v22 = v23;
  if (a3 >= 1)
  {
    v24 = v22 + v22;
    v25 = a3;
    v26 = v19;
    do
    {
      *v26 = (float)(*v26 / v24) + 0.5;
      ++v26;
      --v25;
    }
    while (v25);
  }
  v27 = (a3 - 1) * a4;
  if (v8)
  {
    v28 = -(uint64_t)a4;
  }
  else
  {
    v27 = 0;
    v28 = a4;
  }
  v29 = &a5[v27];
  v30 = (a3 - 1);
  if (a3 == 1)
  {
    *v29 = -1;
    v31 = *v19;
  }
  else
  {
    v32 = *v19 + v19[1];
    *v29 = -1;
    v29[1] = (int)(float)((float)(v32 * 255.0) * 0.5);
    *((_WORD *)v29 + 1) = 0;
    if (a3 < 3)
      goto LABEL_27;
    v29 += v28;
    v33 = v30 - 1;
    v34 = v19 + 2;
    do
    {
      v35 = *(v34 - 2);
      v36 = *(v34 - 1);
      v37 = *v34++;
      *v29 = -1;
      v29[1] = (int)(float)((float)((float)((float)(v35 + v36) + v37) * 255.0) / 3.0);
      *((_WORD *)v29 + 1) = 0;
      v29 += v28;
      --v33;
    }
    while (v33);
    v31 = v19[a3 - 2] + v19[v30];
    *v29 = -1;
  }
  v29[1] = (int)(float)((float)(v31 * 255.0) * 0.5);
  *((_WORD *)v29 + 1) = 0;
LABEL_27:
  RandMersenne::~RandMersenne((RandMersenne *)&v38);
  if (v41[0])
  {
    v41[1] = v41[0];
    operator delete(v41[0]);
  }
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  float v9;
  double v10;
  float v11;
  double v12;
  float32x2_t v13;
  float32x2_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  BOOL v21;
  BOOL v22;
  char v23;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  HGBitmap *v29;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var1;
  unint64_t v31;
  unint64_t v32;
  double v33;
  unint64_t v34;
  double v35;
  float v36;
  float v37;
  double v38;
  HSampleTiledNoise *v39;
  double v40;
  HGBitmapLoader *v41;
  int v42;
  int v43;
  double *v44;
  HGTextureWrap *v45;
  char *v46;
  double v47;
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
  float v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float v69;
  float v70;
  float v71;
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
  HGCrop *v91;
  uint64_t v92;
  int v93;
  int v94;
  HGTextureWrap *v95;
  char *v96;
  HGXForm *v97;
  void *v98;
  float v99;
  float v100;
  float v101;
  float v102;
  float v103;
  float v104;
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
  float v139;
  float v140;
  float v141;
  id v143;
  unint64_t v144;
  unint64_t v145;
  char v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  double v177;
  double v178;
  HSampleTiledNoise *v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  double v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  double v202;
  double v203;
  double v204;
  _OWORD v205[2];
  _OWORD v206[8];
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  uint64_t v219;

  v219 = 0;
  v217 = 0u;
  v218 = 0u;
  v215 = 0u;
  v216 = 0u;
  if (a4)
    objc_msgSend(a4, "imageInfo");
  if (self)
  {
    -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a3);
    -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
    v9 = *(double *)&v207;
    v10 = v9;
    v11 = *((double *)&v209 + 1);
    v12 = fabsf(v11);
    -[PAESharedDefaultBase getImageBoundary:](self, "getImageBoundary:", a4);
    v13 = *(float32x2_t *)&v147;
    v14 = *(float32x2_t *)&v148;
  }
  else
  {
    v213 = 0u;
    v214 = 0u;
    v211 = 0u;
    v212 = 0u;
    v209 = 0u;
    v210 = 0u;
    v207 = 0u;
    v208 = 0u;
    v13 = 0;
    v12 = 0.0;
    v10 = 0.0;
    memset(v206, 0, sizeof(v206));
    v14 = 0;
  }
  v205[0] = vcvtq_f64_f32(v13);
  v205[1] = vcvtq_f64_f32(v14);
  v15 = PCMatrix44Tmpl<double>::transformRect<double>((double *)v206, (double *)v205, (uint64_t)v205);
  if (v15)
  {
    v16 = objc_msgSend(a4, "width");
    v17 = objc_msgSend(a4, "height");
    v18 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
    v19 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
    v20 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A2958);
    if (v18)
      v21 = v19 == 0;
    else
      v21 = 1;
    v22 = v21 || v20 == 0;
    v23 = v22;
    if (v22)
      goto LABEL_49;
    v24 = (void *)v20;
    v144 = v17;
    v145 = v16;
    v146 = v23;
    v143 = a3;
    v25 = objc_msgSend(v19, "versionAtCreation");
    v204 = 0.0;
    objc_msgSend(v18, "getFloatValue:fromParm:atFxTime:", &v204, 1, a5->var0.var1);
    v26 = HGRectMake4i(0, 0, 1u, 0x438u);
    v28 = v27;
    v29 = (HGBitmap *)HGObject::operator new(0x80uLL);
    HGBitmap::HGBitmap(v29, v26, v28, 22);
    if (!*((_QWORD *)v29 + 10))
    {
LABEL_48:
      (*(void (**)(HGBitmap *))(*(_QWORD *)v29 + 24))(v29);
      v23 = v146;
LABEL_49:
      LOBYTE(v15) = v23 ^ 1;
      return v15;
    }
    -[PAEBadTV createWavyTableOfHeight:rowBytes:table:flip:atTime:](self, "createWavyTableOfHeight:rowBytes:table:flip:atTime:", 1080, *((_QWORD *)v29 + 8));
    v203 = 0.0;
    objc_msgSend(v18, "getFloatValue:fromParm:atFxTime:", &v203, 2, a5->var0.var1);
    v202 = 1.0;
    objc_msgSend(v18, "getFloatValue:fromParm:atFxTime:", &v202, 5, a5->var0.var1);
    v202 = v202 / 100.0 + 1.0;
    v201 = 1.0;
    objc_msgSend(v18, "getFloatValue:fromParm:atFxTime:", &v201, 6, a5->var0.var1);
    v200 = 1.0;
    var1 = a5->var0.var1;
    if (v25)
    {
      objc_msgSend(v18, "getFloatValue:fromParm:atFxTime:", &v200, 9, var1);
      v199 = 1.0;
      v147 = 0.0;
      objc_msgSend(v18, "getFloatValue:fromParm:atFxTime:", &v147, 10, a5->var0.var1);
      v32 = v144;
      v31 = v145;
      v33 = v147;
      if (v147 == 0.0)
        v147 = 1.0;
      v34 = objc_msgSend(a4, "height", v33);
      v35 = (double)v34 / v147;
      v199 = v35 - v35 * v200;
      v200 = v35 * v200;
    }
    else
    {
      objc_msgSend(v18, "getFloatValue:fromParm:atFxTime:", &v200, 7, var1);
      v199 = 1.0;
      objc_msgSend(v18, "getFloatValue:fromParm:atFxTime:", &v199, 8, a5->var0.var1);
      v32 = v144;
      v31 = v145;
    }
    v198 = 1.0;
    objc_msgSend(v18, "getFloatValue:fromParm:atFxTime:", &v198, 4, a5->var0.var1);
    v198 = (1.0 - v198) * 10.0;
    v197 = 0.0;
    objc_msgSend(v18, "getFloatValue:fromParm:atFxTime:", &v197, 3, a5->var0.var1);
    v36 = (float)v31;
    v37 = (float)v32;
    if (v197 <= 0.0)
    {
      v39 = 0;
      if (!a4)
        goto LABEL_25;
    }
    else
    {
      -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a4, v197);
      -[PAESharedDefaultBase frameFromFxTime:forPlugIn:](self, "frameFromFxTime:forPlugIn:", a5->var0.var1, self);
      PAEGenerateNoise((int)v36, (int)v37, 0, 0, 1, 0, &v179, v197, v38);
      v39 = v179;
      if (!a4)
      {
LABEL_25:
        v195 = 0.0;
        v196 = 0.0;
LABEL_29:
        -[PAESharedDefaultBase changeDOD:withRect:](self, "changeDOD:withRect:", &v195, v205);
        v40 = v147;
        if (*(_QWORD *)&v196 == *(_QWORD *)&v147)
        {
          if (v196 != 0.0)
            (*(void (**)(void))(**(_QWORD **)&v196 + 24))();
        }
        else
        {
          if (v196 != 0.0)
          {
            (*(void (**)(void))(**(_QWORD **)&v196 + 24))();
            v40 = v147;
          }
          v196 = v40;
          v147 = 0.0;
        }
        if (v195 != 0.0)
          (*(void (**)(double))(**(_QWORD **)&v195 + 24))(COERCE_DOUBLE(*(_QWORD *)&v195));
        v41 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
        HGBitmapLoader::HGBitmapLoader(v41, v29);
        v42 = objc_msgSend(a4, "height");
        v43 = objc_msgSend(a4, "width");
        v203 = fmod(v203 * 1080.0 / 100.0, 1080.0);
        v44 = (double *)objc_msgSend((id)objc_msgSend(v24, "colorMatrixFromDesiredRGBToYCbCrAtTime:", a5->var0.var1), "matrix");
        v45 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
        HGTextureWrap::HGTextureWrap(v45);
        HGTextureWrap::SetTextureWrapMode((uint64_t)v45, (const char *)3, v46);
        (*(void (**)(HGTextureWrap *, _QWORD, double))(*(_QWORD *)v45 + 120))(v45, 0, COERCE_DOUBLE(*(_QWORD *)&v196));
        if (v197 <= 0.0)
        {
          v47 = COERCE_DOUBLE(HGObject::operator new(0x1B0uLL));
          HgcBadTV::HgcBadTV(*(HgcBadTV **)&v47);
          **(_QWORD **)&v47 = &unk_1E64DF5D8;
          *(_DWORD *)(*(_QWORD *)&v47 + 416) = v43;
          *(_DWORD *)(*(_QWORD *)&v47 + 420) = v42;
          HGObject::Retain(*(uint64_t *)&v47);
          (*(void (**)(double, uint64_t, HGTextureWrap *))(**(_QWORD **)&v47 + 120))(COERCE_DOUBLE(*(_QWORD *)&v47), 1, v45);
          (*(void (**)(double, _QWORD, HGBitmapLoader *))(**(_QWORD **)&v47 + 120))(COERCE_DOUBLE(*(_QWORD *)&v47), 0, v41);
          v99 = v203;
          (*(void (**)(double, uint64_t, float, float, float, float))(**(_QWORD **)&v47 + 96))(COERCE_DOUBLE(*(_QWORD *)&v47), 8, v99, 0.0, 0.0, 0.0);
          v100 = v202;
          (*(void (**)(double, uint64_t, float, float, float, float))(**(_QWORD **)&v47 + 96))(COERCE_DOUBLE(*(_QWORD *)&v47), 9, v100, 0.0, 0.0, 0.0);
          v101 = v204;
          (*(void (**)(double, uint64_t, float, float, float, float))(**(_QWORD **)&v47 + 96))(COERCE_DOUBLE(*(_QWORD *)&v47), 10, v101, 0.0, 0.0, 0.0);
          v102 = v200;
          v103 = 1.0 / (v200 + v199);
          v104 = v200 + v199;
          v105 = v201;
          (*(void (**)(double, uint64_t, float, float, float, float))(**(_QWORD **)&v47 + 96))(COERCE_DOUBLE(*(_QWORD *)&v47), 12, v102, v103, v104, v105);
          v106 = v198;
          (*(void (**)(double, uint64_t, float, float, float, float))(**(_QWORD **)&v47 + 96))(COERCE_DOUBLE(*(_QWORD *)&v47), 13, v106, 0.0, 0.0, 0.0);
          v107 = *v44;
          v108 = v44[1];
          v109 = v44[2];
          (*(void (**)(double, uint64_t, float, float, float, float))(**(_QWORD **)&v47 + 96))(COERCE_DOUBLE(*(_QWORD *)&v47), 14, v107, v108, v109, 0.0);
          -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
          v98 = v143;
          -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a4);
          v110 = v147;
          v111 = v148;
          v112 = v149;
          v113 = v150;
          (*(void (**)(double, _QWORD, float, float, float, float))(**(_QWORD **)&v47 + 96))(COERCE_DOUBLE(*(_QWORD *)&v47), 0, v110, v111, v112, v113);
          v114 = v151;
          v115 = v152;
          v116 = v153;
          v117 = v154;
          (*(void (**)(double, uint64_t, float, float, float, float))(**(_QWORD **)&v47 + 96))(COERCE_DOUBLE(*(_QWORD *)&v47), 1, v114, v115, v116, v117);
          v118 = v155;
          v119 = v156;
          v120 = v157;
          v121 = v158;
          (*(void (**)(double, uint64_t, float, float, float, float))(**(_QWORD **)&v47 + 96))(COERCE_DOUBLE(*(_QWORD *)&v47), 2, v118, v119, v120, v121);
          v122 = v159;
          v123 = v160;
          v124 = v161;
          v125 = v162;
          (*(void (**)(double, uint64_t, float, float, float, float))(**(_QWORD **)&v47 + 96))(COERCE_DOUBLE(*(_QWORD *)&v47), 3, v122, v123, v124, v125);
          v126 = *(double *)&v179;
          v127 = v180;
          v128 = v181;
          v129 = v182;
          (*(void (**)(double, uint64_t, float, float, float, float))(**(_QWORD **)&v47 + 96))(COERCE_DOUBLE(*(_QWORD *)&v47), 4, v126, v127, v128, v129);
          v130 = v183;
          v131 = v184;
          v132 = v185;
          v133 = v186;
          (*(void (**)(double, uint64_t, float, float, float, float))(**(_QWORD **)&v47 + 96))(COERCE_DOUBLE(*(_QWORD *)&v47), 5, v130, v131, v132, v133);
          v134 = v187;
          v135 = v188;
          v136 = v189;
          v137 = v190;
          (*(void (**)(double, uint64_t, float, float, float, float))(**(_QWORD **)&v47 + 96))(COERCE_DOUBLE(*(_QWORD *)&v47), 6, v134, v135, v136, v137);
          v138 = v191;
          v139 = v192;
          v140 = v193;
          v141 = v194;
          (*(void (**)(double, uint64_t, float, float, float, float))(**(_QWORD **)&v47 + 96))(COERCE_DOUBLE(*(_QWORD *)&v47), 7, v138, v139, v140, v141);
          (*(void (**)(double, uint64_t, float, float, float, float))(**(_QWORD **)&v47 + 96))(COERCE_DOUBLE(*(_QWORD *)&v47), 11, 1080.0, 0.0, 0.0, 0.0);
        }
        else
        {
          v47 = COERCE_DOUBLE(HGObject::operator new(0x1B0uLL));
          HgcBadTVNoise::HgcBadTVNoise(*(HgcBadTVNoise **)&v47);
          **(_QWORD **)&v47 = &unk_1E64DA6E8;
          *(_DWORD *)(*(_QWORD *)&v47 + 416) = v43;
          *(_DWORD *)(*(_QWORD *)&v47 + 420) = v42;
          HGObject::Retain(*(uint64_t *)&v47);
          (*(void (**)(double, uint64_t, HGTextureWrap *))(**(_QWORD **)&v47 + 120))(COERCE_DOUBLE(*(_QWORD *)&v47), 1, v45);
          (*(void (**)(double, _QWORD, HGBitmapLoader *))(**(_QWORD **)&v47 + 120))(COERCE_DOUBLE(*(_QWORD *)&v47), 0, v41);
          v48 = v203;
          (*(void (**)(double, uint64_t, float, float, float, float))(**(_QWORD **)&v47 + 96))(COERCE_DOUBLE(*(_QWORD *)&v47), 8, v48, 0.0, 0.0, 0.0);
          v49 = v202;
          (*(void (**)(double, uint64_t, float, float, float, float))(**(_QWORD **)&v47 + 96))(COERCE_DOUBLE(*(_QWORD *)&v47), 9, v49, 0.0, 0.0, 0.0);
          v50 = v204;
          (*(void (**)(double, uint64_t, float, float, float, float))(**(_QWORD **)&v47 + 96))(COERCE_DOUBLE(*(_QWORD *)&v47), 10, v50, 0.0, 0.0, 0.0);
          v51 = v200;
          v52 = 1.0 / (v200 + v199);
          v53 = v200 + v199;
          v54 = v201;
          (*(void (**)(double, uint64_t, float, float, float, float))(**(_QWORD **)&v47 + 96))(COERCE_DOUBLE(*(_QWORD *)&v47), 12, v51, v52, v53, v54);
          v55 = v198;
          (*(void (**)(double, uint64_t, float, float, float, float))(**(_QWORD **)&v47 + 96))(COERCE_DOUBLE(*(_QWORD *)&v47), 13, v55, 0.0, 0.0, 0.0);
          v56 = *v44;
          v57 = v44[1];
          v58 = v44[2];
          (*(void (**)(double, uint64_t, float, float, float, float))(**(_QWORD **)&v47 + 96))(COERCE_DOUBLE(*(_QWORD *)&v47), 14, v56, v57, v58, 0.0);
          -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a4);
          -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a4);
          v59 = *(double *)&v179;
          v60 = v180;
          v61 = v181;
          v62 = v182;
          (*(void (**)(double, _QWORD, float, float, float, float))(**(_QWORD **)&v47 + 96))(COERCE_DOUBLE(*(_QWORD *)&v47), 0, v59, v60, v61, v62);
          v63 = v183;
          v64 = v184;
          v65 = v185;
          v66 = v186;
          (*(void (**)(double, uint64_t, float, float, float, float))(**(_QWORD **)&v47 + 96))(COERCE_DOUBLE(*(_QWORD *)&v47), 1, v63, v64, v65, v66);
          v67 = v187;
          v68 = v188;
          v69 = v189;
          v70 = v190;
          (*(void (**)(double, uint64_t, float, float, float, float))(**(_QWORD **)&v47 + 96))(COERCE_DOUBLE(*(_QWORD *)&v47), 2, v67, v68, v69, v70);
          v71 = v191;
          v72 = v192;
          v73 = v193;
          v74 = v194;
          (*(void (**)(double, uint64_t, float, float, float, float))(**(_QWORD **)&v47 + 96))(COERCE_DOUBLE(*(_QWORD *)&v47), 3, v71, v72, v73, v74);
          v75 = v163;
          v76 = v164;
          v77 = v165;
          v78 = v166;
          (*(void (**)(double, uint64_t, float, float, float, float))(**(_QWORD **)&v47 + 96))(COERCE_DOUBLE(*(_QWORD *)&v47), 4, v75, v76, v77, v78);
          v79 = v167;
          v80 = v168;
          v81 = v169;
          v82 = v170;
          (*(void (**)(double, uint64_t, float, float, float, float))(**(_QWORD **)&v47 + 96))(COERCE_DOUBLE(*(_QWORD *)&v47), 5, v79, v80, v81, v82);
          v83 = v171;
          v84 = v172;
          v85 = v173;
          v86 = v174;
          (*(void (**)(double, uint64_t, float, float, float, float))(**(_QWORD **)&v47 + 96))(COERCE_DOUBLE(*(_QWORD *)&v47), 6, v83, v84, v85, v86);
          v87 = v175;
          v88 = v176;
          v89 = v177;
          v90 = v178;
          (*(void (**)(double, uint64_t, float, float, float, float))(**(_QWORD **)&v47 + 96))(COERCE_DOUBLE(*(_QWORD *)&v47), 7, v87, v88, v89, v90);
          (*(void (**)(double, uint64_t, float, float, float, float))(**(_QWORD **)&v47 + 96))(COERCE_DOUBLE(*(_QWORD *)&v47), 11, 1080.0, 0.0, 0.0, 0.0);
          v91 = (HGCrop *)HGObject::operator new(0x1A0uLL);
          HGCrop::HGCrop(v91);
          v92 = HGRectMake4i((int)((float)-v36 * 0.5), (int)((float)-v37 * 0.5), (int)(v36 * 0.5), (int)(v37 * 0.5));
          (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v91 + 96))(v91, 0, (float)(int)v92, (float)SHIDWORD(v92), (float)v93, (float)v94);
          (*(void (**)(HGCrop *, _QWORD, HSampleTiledNoise *))(*(_QWORD *)v91 + 120))(v91, 0, v39);
          v95 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
          HGTextureWrap::HGTextureWrap(v95);
          (*(void (**)(HGTextureWrap *, _QWORD, HGCrop *))(*(_QWORD *)v95 + 120))(v95, 0, v91);
          HGTextureWrap::SetTextureWrapMode((uint64_t)v95, (const char *)3, v96);
          HGTransform::HGTransform((HGTransform *)&v147);
          HGTransform::Scale((HGTransform *)&v147, v10, v12, 1.0);
          v97 = (HGXForm *)HGObject::operator new(0x210uLL);
          HGXForm::HGXForm(v97);
          (*(void (**)(HGXForm *, double *))(*(_QWORD *)v97 + 576))(v97, &v147);
          (*(void (**)(HGXForm *, _QWORD, HGTextureWrap *))(*(_QWORD *)v97 + 120))(v97, 0, v95);
          (*(void (**)(double, uint64_t, HGXForm *))(**(_QWORD **)&v47 + 120))(COERCE_DOUBLE(*(_QWORD *)&v47), 2, v97);
          (*(void (**)(HGXForm *))(*(_QWORD *)v97 + 24))(v97);
          HGTransform::~HGTransform((HGTransform *)&v147);
          (*(void (**)(HGTextureWrap *))(*(_QWORD *)v95 + 24))(v95);
          (*(void (**)(HGCrop *))(*(_QWORD *)v91 + 24))(v91);
          v98 = v143;
        }
        (*(void (**)(double))(**(_QWORD **)&v47 + 24))(COERCE_DOUBLE(*(_QWORD *)&v47));
        v147 = v47;
        (*(void (**)(double))(**(_QWORD **)&v47 + 16))(COERCE_DOUBLE(*(_QWORD *)&v47));
        -[PAESharedDefaultBase crop:fromImage:toImage:](self, "crop:fromImage:toImage:", &v147, a4, v98);
        objc_msgSend(v98, "setHeliumRef:", &v147);
        if (v147 != 0.0)
          (*(void (**)(double))(**(_QWORD **)&v147 + 24))(COERCE_DOUBLE(*(_QWORD *)&v147));
        (*(void (**)(double))(**(_QWORD **)&v47 + 24))(COERCE_DOUBLE(*(_QWORD *)&v47));
        (*(void (**)(HGTextureWrap *))(*(_QWORD *)v45 + 24))(v45);
        if (v41)
          (*(void (**)(HGBitmapLoader *))(*(_QWORD *)v41 + 24))(v41);
        if (v196 != 0.0)
          (*(void (**)(double))(**(_QWORD **)&v196 + 24))(COERCE_DOUBLE(*(_QWORD *)&v196));
        if (v39)
          (*(void (**)(HSampleTiledNoise *))(*(_QWORD *)v39 + 24))(v39);
        goto LABEL_48;
      }
    }
    objc_msgSend(a4, "heliumRef");
    v195 = v196;
    if (v196 != 0.0)
      (*(void (**)(double))(**(_QWORD **)&v196 + 16))(COERCE_DOUBLE(*(_QWORD *)&v196));
    goto LABEL_29;
  }
  return v15;
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
