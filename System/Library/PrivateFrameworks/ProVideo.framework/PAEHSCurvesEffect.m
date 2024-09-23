@implementation PAEHSCurvesEffect

- (PAEHSCurvesEffect)initWithAPIManager:(id)a3
{
  PAEHSCurvesEffect *v3;
  PAEHSCurvesEffect *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAEHSCurvesEffect;
  v3 = -[PAEBaseCorrectorEffect initWithAPIManager:](&v6, sel_initWithAPIManager_, a3);
  v4 = v3;
  if (v3)
    PAEInitSampling((_anonymous_namespace_::_Local *)v3);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  PAEDisposeSampling((_anonymous_namespace_::_Local *)self);
  v3.receiver = self;
  v3.super_class = (Class)PAEHSCurvesEffect;
  -[PAEBaseCorrectorEffect dealloc](&v3, sel_dealloc);
}

- (void)_setGradingMode:(int)a3
{
  *(&self->super._hostApplication + 1) = a3;
}

- (void)_registerHueCurveParameter:(int)a3 name:(id)a4
{
  uint64_t v5;
  PAEHueCurveChannelData *v7;

  v5 = *(_QWORD *)&a3;
  v7 = objc_alloc_init(PAEHueCurveChannelData);
  objc_msgSend(-[PAEBaseCorrectorEffect parameterCreationAPI](self, "parameterCreationAPI"), "addCustomParameterWithName:parmId:defaultValue:parmFlags:", a4, v5, v7, 0x20000);

}

- (void)_registerOffsetColorCurveParameter:(int)a3 name:(id)a4 red:(double)a5 green:(double)a6 blue:(double)a7
{
  uint64_t v8;
  PAEOffsetColorCurveChannelData *v10;

  v8 = *(_QWORD *)&a3;
  v10 = -[PAEOffsetColorCurveChannelData initWithRed:green:blue:]([PAEOffsetColorCurveChannelData alloc], "initWithRed:green:blue:", a5, a6, a7);
  objc_msgSend(-[PAEBaseCorrectorEffect parameterCreationAPI](self, "parameterCreationAPI"), "addCustomParameterWithName:parmId:defaultValue:parmFlags:", a4, v8, v10, 0x20000);

}

- (void)_registerColorCurveParameter:(int)a3 name:(id)a4 red:(double)a5 green:(double)a6 blue:(double)a7
{
  uint64_t v8;
  PAEColorCurveChannelData *v10;

  v8 = *(_QWORD *)&a3;
  v10 = -[PAEColorCurveChannelData initWithRed:green:blue:]([PAEColorCurveChannelData alloc], "initWithRed:green:blue:", a5, a6, a7);
  objc_msgSend(-[PAEBaseCorrectorEffect parameterCreationAPI](self, "parameterCreationAPI"), "addCustomParameterWithName:parmId:defaultValue:parmFlags:", a4, v8, v10, 2);

}

- (BOOL)addParameters
{
  id v3;
  void *v4;
  unsigned int v5;
  PAEColorSelectionChannelData *v6;

  v3 = -[PAEBaseCorrectorEffect parameterCreationAPI](self, "parameterCreationAPI");
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "addCustomParameterWithName:parmId:defaultValue:parmFlags:", &stru_1E65EDDA0, 8888, 0, 17);
    -[PAEHSCurvesEffect _registerHueCurveParameter:name:](self, "_registerHueCurveParameter:name:", 1, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("PAEHSCurvesEffectHueVsHue"), 0, CFSTR("Localizable")));
    -[PAEHSCurvesEffect _registerHueCurveParameter:name:](self, "_registerHueCurveParameter:name:", 2, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("PAEHSCurvesEffectHueVsSat"), 0, CFSTR("Localizable")));
    -[PAEHSCurvesEffect _registerHueCurveParameter:name:](self, "_registerHueCurveParameter:name:", 3, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("PAEHSCurvesEffectHueVsLuma"), 0, CFSTR("Localizable")));
    -[PAEHSCurvesEffect _registerOffsetColorCurveParameter:name:red:green:blue:](self, "_registerOffsetColorCurveParameter:name:red:green:blue:", 4, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("PAEHSCurvesEffectLumaVsSat"), 0, CFSTR("Localizable")), 1.0, 1.0, 1.0);
    -[PAEHSCurvesEffect _registerOffsetColorCurveParameter:name:red:green:blue:](self, "_registerOffsetColorCurveParameter:name:red:green:blue:", 5, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("PAEHSCurvesEffectSatVsSat"), 0, CFSTR("Localizable")), 1.0, 1.0, 1.0);
    -[PAEHSCurvesEffect _registerOffsetColorCurveParameter:name:red:green:blue:](self, "_registerOffsetColorCurveParameter:name:red:green:blue:", 6, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("PAEHSCurvesEffectCustomVsSat"), 0, CFSTR("Localizable")), 0.912, 0.324, 0.002);
    v5 = objc_msgSend(-[PAEBaseCorrectorEffect versionsingAPI](self, "versionsingAPI"), "versionAtCreation");
    objc_msgSend(v4, "addCustomParameterWithName:parmId:defaultValue:parmFlags:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("PAEHSCurvesEffectGradingMode"), 0, CFSTR("Localizable")), 8893, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)&self->super._hostApplication + 1)), 627);
    if (v5 == 1)
      objc_msgSend(v4, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", CFSTR("Legacy Grading Mode"), 8889, 0, &unk_1E6649878, 531);
    objc_msgSend(v4, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("PAEColorCurvesEffectPreserveLuma"), 0, CFSTR("Localizable")), 8894, v5 > 5, 515);
    v6 = objc_alloc_init(PAEColorSelectionChannelData);
    objc_msgSend(v4, "addCustomParameterWithName:parmId:defaultValue:parmFlags:", CFSTR("OSC"), 9321, v6, 3);

  }
  return v4 != 0;
}

- (Class)classForCustomParameterID:(unsigned int)a3
{
  if ((int)a3 <= 3)
  {
    if (a3 - 1 < 3)
      return (Class)objc_opt_class();
  }
  else if ((int)a3 > 8887)
  {
    if (a3 == 8888 || a3 == 9321 || a3 == 8893)
      return (Class)objc_opt_class();
  }
  else if (a3 - 4 < 3)
  {
    return (Class)objc_opt_class();
  }
  return 0;
}

- (BOOL)useLegacyCoding
{
  return objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](-[PAEBaseCorrectorEffect apiManager](self, "apiManager"), "apiForProtocol:", &unk_1EF0A8190), "versionAtCreation") < 8;
}

- (void)resyncOnce:(id)a3 atTime:(id)a4
{
  void *v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  id v10;

  v6 = (void *)objc_msgSend(a3, "apiForProtocol:", &unk_1EF0A70B8);
  v10 = 0;
  v7 = objc_msgSend(-[PAEBaseCorrectorEffect versionsingAPI](self, "versionsingAPI"), "versionAtCreation");
  if (v7 == 1)
  {
    objc_msgSend(v6, "getIntValue:fromParm:atFxTime:", &self->super._hostApplication + 1, 8889, a4.var1);
  }
  else
  {
    v8 = v7;
    if (objc_msgSend(v6, "getCustomParameterValue:fromParm:atFxTime:", &v10, 8893, a4.var1))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = objc_msgSend(v10, "intValue");
      else
        v9 = 0;
      *(&self->super._hostApplication + 1) = v9;
    }
    if (v8 >= 6)
      objc_msgSend(v6, "getBoolValue:fromParm:atFxTime:", &self->_gradingMode, 8894, a4.var1);
  }
}

- (BOOL)resync:(id)a3 atTime:(id)a4 paramID:(unsigned int)a5 customChannelData:(id *)a6
{
  uint64_t v7;
  void *v11;
  void *v12;
  unsigned int v13;
  char v14;
  id v15;
  PAEOffsetColorCurveChannelData *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  PAEOffsetColorCurveChannelData *v22;
  unsigned int *v24;
  char v25;
  uint64_t v26;
  objc_super v27;

  v7 = *(_QWORD *)&a5;
  v11 = (void *)objc_msgSend(a3, "apiForProtocol:", &unk_1EF0A70B8);
  v12 = v11;
  if ((v7 - 1) > 5)
  {
    if ((_DWORD)v7 == 8893)
    {
      if (objc_msgSend(-[PAEBaseCorrectorEffect versionsingAPI](self, "versionsingAPI"), "versionAtCreation") == 1)
      {
        v24 = (unsigned int *)(&self->super._hostApplication + 1);
        v25 = objc_msgSend(v12, "getIntValue:fromParm:atFxTime:", v24, 8889, a4.var1);
        *a6 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *v24);
        return v25;
      }
      if (objc_msgSend(v12, "getCustomParameterValue:fromParm:atFxTime:", a6, 8893, a4.var1))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v26 = objc_msgSend(*a6, "intValue");
        else
          v26 = 0;
        -[PAEHSCurvesEffect _setGradingMode:](self, "_setGradingMode:", v26);
        return 1;
      }
      else
      {
        return 0;
      }
    }
    else
    {
      if ((_DWORD)v7 == 8894)
        return objc_msgSend(v11, "getBoolValue:fromParm:atFxTime:", &self->_gradingMode, 8894, a4.var1);
      v27.receiver = self;
      v27.super_class = (Class)PAEHSCurvesEffect;
      return -[PAEBaseCorrectorEffect resync:atTime:paramID:customChannelData:](&v27, sel_resync_atTime_paramID_customChannelData_, a3, a4.var1, v7, a6);
    }
  }
  else
  {
    v13 = objc_msgSend(-[PAEBaseCorrectorEffect versionsingAPI](self, "versionsingAPI"), "versionAtCreation");
    v14 = objc_msgSend(v12, "getCustomParameterValue:fromParm:atFxTime:", a6, v7, a4.var1);
    if ((v7 - 4) <= 2 && v13 <= 3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = *a6;
        v16 = [PAEOffsetColorCurveChannelData alloc];
        objc_msgSend(v15, "red");
        v18 = v17;
        objc_msgSend(v15, "green");
        v20 = v19;
        objc_msgSend(v15, "blue");
        v22 = -[PAEOffsetColorCurveChannelData initWithRed:green:blue:](v16, "initWithRed:green:blue:", v18, v20, v21);
        *a6 = v22;
        -[PAEOffsetColorCurveChannelData conformFromColorCurve:](v22, "conformFromColorCurve:", v15);
      }
    }
  }
  return v14;
}

- (BOOL)parameterChanged:(id)a3 atTime:(id *)a4 paramID:(unsigned int)a5 customChannelData:(id)a6
{
  int v7;
  uint64_t v8;
  objc_super v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;
  id v12;

  v12 = a6;
  if (a5 == 8893)
  {
    v7 = objc_msgSend((id)objc_msgSend(a3, "apiForProtocol:", &unk_1EF0A70B8), "getCustomParameterValue:fromParm:atFxTime:", &v12, 8893, a4);
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = objc_msgSend(v12, "intValue");
      else
        v8 = 0;
      -[PAEHSCurvesEffect willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("gradingMode"));
      -[PAEHSCurvesEffect _setGradingMode:](self, "_setGradingMode:", v8);
      -[PAEHSCurvesEffect didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("gradingMode"));
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    v11 = *a4;
    v10.receiver = self;
    v10.super_class = (Class)PAEHSCurvesEffect;
    LOBYTE(v7) = -[PAEBaseCorrectorEffect parameterChanged:atTime:paramID:customChannelData:](&v10, sel_parameterChanged_atTime_paramID_customChannelData_, a3, &v11);
  }
  return v7;
}

- (BOOL)overrideRender:(id)a3 withOutputImage:(id)a4 inputImage:(id)a5 input:(void *)a6 withInfo:(id *)a7
{
  uint64_t v12;
  HGNode *v13;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var1;
  id v15;
  id v16;
  id v17;
  PAEOffsetColorCurveChannelData *v18;
  PAEOffsetColorCurveChannelData *v19;
  PAEOffsetColorCurveChannelData *v20;
  PAEOffsetColorCurveChannelData *v21;
  _BOOL4 v22;
  int v23;
  unsigned int v24;
  int v25;
  float v26;
  uint64_t v27;
  uint64_t v28;
  float v29;
  char gradingMode;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  float v34;
  uint64_t v35;
  uint64_t v36;
  float v37;
  double v38;
  float v39;
  float v40;
  float v41;
  double v42;
  double v43;
  HGColorGamma *v44;
  HgcSatCurves *v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  uint64_t v49;
  double v50;
  double *v51;
  double v52;
  __n128 v53;
  float v54;
  float v55;
  float v56;
  float v57;
  uint64_t *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  float v65;
  float v66;
  double v67;
  float v68;
  float v69;
  float v70;
  float v71;
  float v72;
  float v73;
  double v74;
  float v75;
  float v76;
  BOOL v77;
  double v78;
  double v79;
  float v80;
  float v81;
  double v82;
  float v83;
  float v84;
  float v85;
  float v86;
  double v87;
  int v88;
  float32x4_t v89;
  float32x4_t v90;
  __n128 v91;
  __n128 v92;
  __int128 *v93;
  char *v94;
  float *v95;
  __n128 v96;
  __n128 v97;
  char *v98;
  int *v99;
  int *v100;
  __n128 v101;
  __n128 v102;
  int *v103;
  int *v104;
  int *v105;
  __n128 v106;
  __n128 v107;
  __int128 *v108;
  char *v109;
  float *v110;
  __n128 v111;
  __n128 v112;
  char *v113;
  unsigned __int32 *v114;
  float *v115;
  __n128 v116;
  __n128 v117;
  unsigned __int32 *v118;
  unsigned __int32 *v119;
  int *v120;
  HGColorGamma *v121;
  HGColorGamma *v122;
  id v124;
  unsigned int v125;
  PAEOffsetColorCurveChannelData *v126;
  PAEOffsetColorCurveChannelData *v127;
  HGColorGamma *v128;
  __int128 v129;
  uint64_t v130;
  __int128 v131;
  uint64_t v132;
  __int128 v133;
  uint64_t v134;
  __int128 v135;
  uint64_t v136;
  __int128 v137;
  uint64_t v138;
  __int128 v139;
  uint64_t v140;
  __int128 v141;
  uint64_t v142;
  HGNode *v143;

  v12 = (*(uint64_t (**)(void *, _QWORD, id, id, id))(*(_QWORD *)a6 + 128))(a6, 0, a3, a4, a5);
  v13 = (HGNode *)v12;
  if (v12)
    (*(void (**)(uint64_t))(*(_QWORD *)v12 + 16))(v12);
  v143 = v13;
  var1 = a7->var0.var1;
  if (!a7->var0.var1)
    var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)MEMORY[0x1E0CA2E68];
  v141 = *(_OWORD *)var1;
  v142 = *((_QWORD *)var1 + 2);
  v140 = v142;
  v139 = v141;
  v15 = -[PAEBaseCorrectorEffect customChannelData:ofParamID:time:](self, "customChannelData:ofParamID:time:", a3, 1, &v139);
  v124 = a4;
  v137 = v141;
  v138 = v142;
  v16 = -[PAEBaseCorrectorEffect customChannelData:ofParamID:time:](self, "customChannelData:ofParamID:time:", a3, 2, &v137);
  v135 = v141;
  v136 = v142;
  v17 = -[PAEBaseCorrectorEffect customChannelData:ofParamID:time:](self, "customChannelData:ofParamID:time:", a3, 3, &v135);
  v133 = v141;
  v134 = v142;
  v127 = -[PAEBaseCorrectorEffect customChannelData:ofParamID:time:](self, "customChannelData:ofParamID:time:", a3, 4, &v133);
  v131 = v141;
  v132 = v142;
  v126 = -[PAEBaseCorrectorEffect customChannelData:ofParamID:time:](self, "customChannelData:ofParamID:time:", a3, 5, &v131);
  v129 = v141;
  v130 = v142;
  v18 = -[PAEBaseCorrectorEffect customChannelData:ofParamID:time:](self, "customChannelData:ofParamID:time:", a3, 6, &v129);
  if (objc_msgSend(-[PAEBaseCorrectorEffect versionsingAPI](self, "versionsingAPI"), "versionAtCreation") <= 3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = objc_alloc_init(PAEOffsetColorCurveChannelData);
      -[PAEOffsetColorCurveChannelData conformFromColorCurve:](v19, "conformFromColorCurve:", v127);
      v127 = v19;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = objc_alloc_init(PAEOffsetColorCurveChannelData);
      -[PAEOffsetColorCurveChannelData conformFromColorCurve:](v20, "conformFromColorCurve:", v126);
      v126 = v20;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = objc_alloc_init(PAEOffsetColorCurveChannelData);
      -[PAEOffsetColorCurveChannelData conformFromColorCurve:](v21, "conformFromColorCurve:", v18);
      v18 = v21;
    }
  }
  if (*(&self->super._hostApplication + 1) == 1)
  {
    v22 = 1;
  }
  else
  {
  }
  v23 = objc_msgSend((id)objc_opt_class(), "colorPrimaries:", a3) == 1 || v22;
  if (v23)
    v24 = 2;
  else
    v24 = 1;
  if (v23)
    v25 = 2;
  else
    v25 = 0;
  if (v23)
    v26 = 0.0;
  else
    v26 = -0.10204;
  if (v22)
    v25 = 1;
  v125 = v25;
  v27 = operator new();
  v28 = v27;
  v29 = 1.298;
  gradingMode = self->_gradingMode;
  if (v23)
    v29 = 1.0;
  *(_QWORD *)v27 = &off_1E64E2A10;
  *(_QWORD *)(v27 + 8) = v15;
  *(_QWORD *)(v27 + 16) = v16;
  *(_QWORD *)(v27 + 24) = v17;
  *(float *)(v27 + 32) = v26;
  *(float *)(v27 + 36) = v29;
  *(_DWORD *)(v27 + 40) = v24;
  *(_BYTE *)(v27 + 44) = gradingMode;
  if (v23)
    v31 = 539;
  else
    v31 = 443;
  *(_QWORD *)(v27 + 56) = 0;
  *(_QWORD *)(v27 + 64) = 0;
  *(_QWORD *)(v27 + 48) = 0;
  *(_DWORD *)(v27 + 72) = v31;
  *(_QWORD *)(v27 + 48) = operator new[]();
  *(_QWORD *)(v28 + 56) = operator new[]();
  v32 = operator new[]();
  *(_QWORD *)(v28 + 64) = v32;
  if (*(_DWORD *)(v28 + 72))
  {
    v33 = 0;
    v34 = 1.0 / ((double)v31 + -1.0);
    v36 = *(_QWORD *)(v28 + 48);
    v35 = *(_QWORD *)(v28 + 56);
    v37 = 0.0;
    do
    {
      objc_msgSend(*(id *)(v28 + 8), "evaluate:", v37);
      *(float *)&v38 = v38;
      v39 = v37 - *(float *)&v38;
      v40 = (float)(v39 + (float)(int)(float)-v39) + 1.0;
      if (v39 >= 0.0)
        v40 = v39;
      if (v39 > 1.0)
        v41 = v39 - (float)(int)v39;
      else
        v41 = v40;
      *(float *)(v36 + 4 * v33) = v41;
      objc_msgSend(*(id *)(v28 + 16), "evaluate:", v37);
      *(float *)&v42 = v42 + v42 + 1.0;
      *(float *)(v35 + 4 * v33) = fmaxf(*(float *)&v42, 0.0);
      objc_msgSend(*(id *)(v28 + 24), "evaluate:", v37);
      *(float *)&v43 = v43 + v43 + 1.0;
      *(float *)(v32 + 4 * v33) = fmaxf(*(float *)&v43, 0.0);
      v37 = v37 + v34;
      ++v33;
    }
    while (v33 < *(_DWORD *)(v28 + 72));
  }
  v44 = PAECreateGammaEncodingNode((uint64_t)a6, v24, v24, v125, 1, 0);
  v45 = (HgcSatCurves *)HGObject::operator new(0x1A0uLL);
  HgcSatCurves::HgcSatCurves(v45);
  *(_QWORD *)v45 = off_1E64E2BB8;
  v46 = 1;
  do
  {
    (*(void (**)(HgcSatCurves *, uint64_t, uint64_t))(*(_QWORD *)v45 + 136))(v45, v46, 2);
    v46 = (v46 + 1);
  }
  while ((_DWORD)v46 != 5);
  PAEUpload3DLUTEvaluator((void *)v28, &v143, (uint64_t)v44);
  (*(void (**)(HgcSatCurves *, _QWORD, HGNode *))(*(_QWORD *)v45 + 120))(v45, 0, v143);
  v47 = -[PAEOffsetColorCurveChannelData curveRef](v127, "curveRef");
  v48 = *(double *)(v47 + 64);
  v49 = -[PAEOffsetColorCurveChannelData curveRef](v126, "curveRef");
  v50 = *(double *)(v49 + 64);
  v51 = -[PAEOffsetColorCurveChannelData curveRef](v18, "curveRef");
  v52 = v51[8];
  v53.n128_u32[0] = 1068708659;
  if (v23)
    v53.n128_f32[0] = 1.0;
  v54 = -v26 / v53.n128_f32[0];
  (*(void (**)(HgcSatCurves *, _QWORD, float, __n128, float, float))(*(_QWORD *)v45 + 96))(v45, 0, v26, v53, v54, 1.0 / v53.n128_f32[0]);
  v55 = v48 + v48;
  v56 = v50 + v50;
  v57 = v52 * 4.0;
  (*(void (**)(HgcSatCurves *, uint64_t, float, float, float, float))(*(_QWORD *)v45 + 96))(v45, 1, v55, v56, v57, 0.0);
  if (v23)
  v59 = *v58;
  v60 = HGObject::operator new(0x80uLL);
  v62 = HGRectMake4i(0, 0, 0x121u, 0x11u);
  v63 = *(_QWORD *)(v59 + 24);
  if (v63)
    v64 = *(_QWORD *)(v63 + 16);
  else
    v64 = 0;
  HGBitmap::HGBitmap((uint64_t)v60, v62, v61, 25, v64);
  PAEUploadBitmap((uint64_t)v60, (uint64_t)v45, 4);
  (*(void (**)(void *))(*(_QWORD *)v60 + 24))(v60);
  v65 = v51[5];
  v66 = v51[6];
  v67 = v51[7];
  v68 = v67;
  if (v66 >= v68)
    v69 = v67;
  else
    v69 = v51[6];
  if (v66 <= v68)
    v70 = v68;
  else
    v70 = v51[6];
  if (v69 <= v65)
    v71 = v69;
  else
    v71 = v51[5];
  if (v70 < v65)
    v70 = v51[5];
  v72 = 0.0;
  v73 = v70 - v71;
  v74 = (float)(v70 - v71);
  if ((float)(v70 - v71) < 0.0)
    v74 = -v74;
  if (v74 >= 0.00000011920929)
  {
    v75 = v65 - v70;
    if ((float)(v65 - v70) < 0.0)
      v75 = -(float)(v65 - v70);
    if (v75 >= 0.00000011921)
    {
      v80 = v66 - v70;
      if ((float)(v66 - v70) < 0.0)
        v80 = -(float)(v66 - v70);
      v81 = v65 - v71;
      if ((float)(v65 - v71) < 0.0)
        v81 = -(float)(v65 - v71);
      v82 = (float)((float)(v70 - v65) / v73);
      v78 = (float)((float)(v70 - v66) / v73) + 3.0;
      if (v81 >= 0.00000011921)
        v78 = 5.0 - v82;
      v83 = v68 - v71;
      if (v83 < 0.0)
        v83 = -v83;
      v79 = 3.0 - (float)((float)(v70 - v68) / v73);
      if (v83 < 0.00000011921)
        v79 = v82 + 1.0;
      v77 = v80 < 0.00000011921;
    }
    else
    {
      v76 = v66 - v71;
      if (v76 < 0.0)
        v76 = -v76;
      v77 = v76 < 0.00000011921;
      v78 = 1.0 - (float)((float)(v70 - v66) / v73);
      v79 = (float)((float)(v70 - v68) / v73) + 5.0;
    }
    if (!v77)
      v79 = v78;
    v84 = v79;
    v85 = v84 / 6.0;
    v72 = v85;
    if (v85 <= 1.0)
    {
      if (v85 >= 0.0)
        goto LABEL_91;
      v86 = (float)(v85 + (float)(int)(float)-v85) + 1.0;
    }
    else
    {
      v86 = v85 - (float)(int)v85;
    }
    v72 = v86;
  }
LABEL_91:
  if (v72 <= 1.0)
  {
    if (v72 < 0.0)
      v72 = (float)(v72 + (float)(int)(float)-v72) + 1.0;
  }
  else
  {
    v72 = v72 - (float)(int)v72;
  }
  v87 = v72 * 6.0;
  v88 = (int)v87;
  *(double *)v90.i64 = v87 - floor(v87);
  v89.f32[0] = *(double *)v90.i64 + 0.0;
  v90.f32[0] = 1.0 - *(double *)v90.i64;
  switch(v88)
  {
    case 1:
      v89.i32[0] = 1.0;
      goto LABEL_98;
    case 2:
      v90.i32[0] = 0;
      v90.i32[1] = 1.0;
      v90.i32[2] = v89.i32[0];
      goto LABEL_100;
    case 3:
      v89.i32[0] = 0;
      v89.i32[1] = v90.i32[0];
      goto LABEL_103;
    case 4:
      v89.i32[1] = 0;
LABEL_103:
      v90.i32[0] = 1.0;
      goto LABEL_105;
    case 5:
      v89.i64[0] = COERCE_UNSIGNED_INT(1.0);
LABEL_105:
      v89.i64[1] = v90.u32[0];
      v90 = v89;
      break;
    default:
      v90.i32[0] = 1.0;
LABEL_98:
      v90.i32[1] = v89.i32[0];
      v90.i32[2] = 0;
LABEL_100:
      v90.i32[3] = 0;
      break;
  }
  (*(void (**)(HgcSatCurves *, uint64_t, float, float, float, float))(*(_QWORD *)v45 + 96))(v45, 2, 0.0, (float)((float)(*((float *)&cc::matrix::rgb_to_YCbCr709 + 3) * v90.f32[0])+ vmuls_lane_f32(*(float *)&dword_1ED4DBE34, *(float32x2_t *)v90.f32, 1))+ vmuls_lane_f32(*(float *)&dword_1ED4DBE38, v90, 2), (float)((float)(*(float *)&dword_1ED4DBE3C * v90.f32[0])+ vmuls_lane_f32(*(float *)&dword_1ED4DBE40, *(float32x2_t *)v90.f32, 1))+ vmuls_lane_f32(*(float *)&dword_1ED4DBE44, v90, 2), 0.0);
  if (v23)
    v93 = &cc::matrix::rgb_to_YCbCr2020;
  else
    v93 = &cc::matrix::rgb_to_YCbCr709;
  v91.n128_u32[0] = *(_DWORD *)v93;
  v94 = (char *)&cc::matrix::rgb_to_YCbCr2020 + 4;
  if (!v23)
    v94 = (char *)&cc::matrix::rgb_to_YCbCr709 + 4;
  v92.n128_u32[0] = *(_DWORD *)v94;
  v95 = (float *)&cc::matrix::rgb_to_YCbCr2020 + 2;
  if (!v23)
    v95 = (float *)&cc::matrix::rgb_to_YCbCr709 + 2;
  (*(void (**)(HgcSatCurves *, uint64_t, __n128, __n128, float, float))(*(_QWORD *)v45 + 96))(v45, 3, v91, v92, *v95, 0.0);
  v98 = (char *)&cc::matrix::rgb_to_YCbCr2020 + 12;
  if (!v23)
    v98 = (char *)&cc::matrix::rgb_to_YCbCr709 + 12;
  v96.n128_u32[0] = *(_DWORD *)v98;
  v99 = &dword_1ED4DBF38;
  if (!v23)
    v99 = &dword_1ED4DBE34;
  v97.n128_u32[0] = *v99;
  v100 = &dword_1ED4DBF3C;
  if (!v23)
    v100 = &dword_1ED4DBE38;
  (*(void (**)(HgcSatCurves *, uint64_t, __n128, __n128, float, float))(*(_QWORD *)v45 + 96))(v45, 4, v96, v97, *(float *)v100, 0.0);
  v103 = &dword_1ED4DBF40;
  if (!v23)
    v103 = &dword_1ED4DBE3C;
  v101.n128_u32[0] = *v103;
  v104 = &dword_1ED4DBF44;
  if (!v23)
    v104 = &dword_1ED4DBE40;
  v102.n128_u32[0] = *v104;
  v105 = &dword_1ED4DBF48;
  if (!v23)
    v105 = &dword_1ED4DBE44;
  (*(void (**)(HgcSatCurves *, uint64_t, __n128, __n128, float, float))(*(_QWORD *)v45 + 96))(v45, 5, v101, v102, *(float *)v105, 0.0);
  if (v23)
    v108 = &cc::matrix::YCbCr2020_to_rgb;
  else
    v108 = &cc::matrix::YCbCr709_to_rgb;
  v106.n128_u32[0] = *(_DWORD *)v108;
  v109 = (char *)&cc::matrix::YCbCr2020_to_rgb + 4;
  if (!v23)
    v109 = (char *)&cc::matrix::YCbCr709_to_rgb + 4;
  v107.n128_u32[0] = *(_DWORD *)v109;
  v110 = (float *)&cc::matrix::YCbCr2020_to_rgb + 2;
  if (!v23)
    v110 = (float *)&cc::matrix::YCbCr709_to_rgb + 2;
  (*(void (**)(HgcSatCurves *, uint64_t, __n128, __n128, float, float))(*(_QWORD *)v45 + 96))(v45, 6, v106, v107, *v110, 0.0);
  v113 = (char *)&cc::matrix::YCbCr2020_to_rgb + 12;
  if (!v23)
    v113 = (char *)&cc::matrix::YCbCr709_to_rgb + 12;
  v111.n128_u32[0] = *(_DWORD *)v113;
  v114 = (unsigned __int32 *)&unk_1ED4DBEB4;
  if (!v23)
    v114 = (unsigned __int32 *)algn_1ED4DBE10;
  v112.n128_u32[0] = *v114;
  v115 = (float *)&unk_1ED4DBEB8;
  if (!v23)
    v115 = (float *)&algn_1ED4DBE10[4];
  (*(void (**)(HgcSatCurves *, uint64_t, __n128, __n128, float, float))(*(_QWORD *)v45 + 96))(v45, 7, v111, v112, *v115, 0.0);
  v118 = (unsigned __int32 *)&unk_1ED4DBEBC;
  if (!v23)
    v118 = (unsigned __int32 *)&algn_1ED4DBE10[8];
  v116.n128_u32[0] = *v118;
  v119 = (unsigned __int32 *)&unk_1ED4DBEC0;
  if (!v23)
    v119 = (unsigned __int32 *)&algn_1ED4DBE10[12];
  v117.n128_u32[0] = *v119;
  v120 = &dword_1ED4DBEC4;
  if (!v23)
    v120 = &dword_1ED4DBE20;
  (*(void (**)(HgcSatCurves *, uint64_t, __n128, __n128, float, float))(*(_QWORD *)v45 + 96))(v45, 8, v116, v117, *(float *)v120, 0.0);
  v121 = PAECreateGammaDecodingNode((uint64_t)v45, v24, v24, v125, 0, 1);
  v122 = v121;
  if (v121)
    (*(void (**)(HGColorGamma *))(*(_QWORD *)v121 + 16))(v121);
  v128 = v122;
  objc_msgSend(v124, "setHeliumRef:", &v128);
  if (v128)
    (*(void (**)(HGColorGamma *))(*(_QWORD *)v128 + 24))(v128);
  (*(void (**)(HGColorGamma *))(*(_QWORD *)v44 + 24))(v44);
  (*(void (**)(HGColorGamma *))(*(_QWORD *)v122 + 24))(v122);
  (*(void (**)(uint64_t))(*(_QWORD *)v28 + 8))(v28);
  (*(void (**)(HgcSatCurves *))(*(_QWORD *)v45 + 24))(v45);
  if (v143)
    (*(void (**)(HGNode *))(*(_QWORD *)v143 + 24))(v143);
  return 1;
}

- (id)shouldDeselectOtherMasks:(id)a3
{
  if (objc_msgSend(a3, "mode") && !objc_msgSend(a3, "state"))
    return (id)MEMORY[0x1E0C9AAB0];
  else
    return (id)MEMORY[0x1E0C9AAA0];
}

- (BOOL)needsOSCsIn360Groups
{
  return 1;
}

@end
