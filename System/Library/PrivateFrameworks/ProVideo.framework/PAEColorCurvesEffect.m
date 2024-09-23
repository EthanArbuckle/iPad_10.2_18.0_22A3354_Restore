@implementation PAEColorCurvesEffect

- (PAEColorCurvesEffect)initWithAPIManager:(id)a3
{
  PAEColorCurvesEffect *v3;
  PAEColorCurvesEffect *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAEColorCurvesEffect;
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
  v3.super_class = (Class)PAEColorCurvesEffect;
  -[PAEBaseCorrectorEffect dealloc](&v3, sel_dealloc);
}

- (void)_setGradingMode:(int)a3
{
  *(&self->super._hostApplication + 1) = a3;
}

- (void)newNodeForCorrector
{
  HgcColorCurves *v2;
  uint64_t v3;

  v2 = (HgcColorCurves *)HGObject::operator new(0x1A0uLL);
  HgcColorCurves::HgcColorCurves(v2);
  *(_QWORD *)v2 = off_1E64DFA50;
  v3 = 1;
  do
  {
    (*(void (**)(HgcColorCurves *, uint64_t, uint64_t))(*(_QWORD *)v2 + 136))(v2, v3, 2);
    v3 = (v3 + 1);
  }
  while ((_DWORD)v3 != 5);
  return v2;
}

- (void)_registerCurveParameter:(int)a3 name:(id)a4 red:(double)a5 green:(double)a6 blue:(double)a7
{
  uint64_t v8;
  PAEColorCurveChannelData *v10;

  v8 = *(_QWORD *)&a3;
  v10 = -[PAEColorCurveChannelData initWithRed:green:blue:]([PAEColorCurveChannelData alloc], "initWithRed:green:blue:", a5, a6, a7);
  objc_msgSend(-[PAEBaseCorrectorEffect parameterCreationAPI](self, "parameterCreationAPI"), "addCustomParameterWithName:parmId:defaultValue:parmFlags:", a4, v8, v10, 0x20000);

}

- (BOOL)addParameters
{
  id v3;
  void *v4;
  int v5;
  PAEColorSelectionChannelData *v6;

  v3 = -[PAEBaseCorrectorEffect parameterCreationAPI](self, "parameterCreationAPI");
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "addCustomParameterWithName:parmId:defaultValue:parmFlags:", &stru_1E65EDDA0, 8888, 0, 17);
    objc_msgSend(v4, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("PAEColorCurvesEffectPreserveLuma"), 0, CFSTR("Localizable")), 8889, 1, 545);
    -[PAEColorCurvesEffect _registerCurveParameter:name:red:green:blue:](self, "_registerCurveParameter:name:red:green:blue:", 1, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("PAEColorCurvesEffectCustom1"), 0, CFSTR("Localizable")), 1.0, 0.0, 0.0);
    -[PAEColorCurvesEffect _registerCurveParameter:name:red:green:blue:](self, "_registerCurveParameter:name:red:green:blue:", 2, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("PAEColorCurvesEffectCustom2"), 0, CFSTR("Localizable")), 0.0, 1.0, 0.0);
    -[PAEColorCurvesEffect _registerCurveParameter:name:red:green:blue:](self, "_registerCurveParameter:name:red:green:blue:", 3, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("PAEColorCurvesEffectCustom3"), 0, CFSTR("Localizable")), 0.0, 0.0, 1.0);
    -[PAEColorCurvesEffect _registerCurveParameter:name:red:green:blue:](self, "_registerCurveParameter:name:red:green:blue:", 4, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("PAEColorCurvesEffectLuma"), 0, CFSTR("Localizable")), 1.0, 1.0, 1.0);
    v5 = objc_msgSend(-[PAEBaseCorrectorEffect versionsingAPI](self, "versionsingAPI"), "versionAtCreation");
    objc_msgSend(v4, "addCustomParameterWithName:parmId:defaultValue:parmFlags:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("PAEColorCurvesEffectGradingMode"), 0, CFSTR("Localizable")), 8893, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)&self->super._hostApplication + 1)), 627);
    if (v5 == 1)
      objc_msgSend(v4, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", CFSTR("Legacy Grading Mode"), 8890, 0, &unk_1E6649848, 531);
    v6 = objc_alloc_init(PAEColorSelectionChannelData);
    objc_msgSend(v4, "addCustomParameterWithName:parmId:defaultValue:parmFlags:", CFSTR("OSC"), 9321, v6, 3);

  }
  return v4 != 0;
}

- (Class)classForCustomParameterID:(unsigned int)a3
{
  if ((int)a3 > 8887)
  {
    if (a3 == 8888 || a3 == 8893 || a3 == 9321)
      return (Class)objc_opt_class();
    return 0;
  }
  if (a3 - 1 >= 4)
    return 0;
  return (Class)objc_opt_class();
}

- (BOOL)useLegacyCoding
{
  return objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](-[PAEBaseCorrectorEffect apiManager](self, "apiManager"), "apiForProtocol:", &unk_1EF0A8190), "versionAtCreation") < 8;
}

- (void)resyncOnce:(id)a3 atTime:(id)a4
{
  void *v6;
  int v7;
  id v8;

  v6 = (void *)objc_msgSend(a3, "apiForProtocol:", &unk_1EF0A70B8);
  v8 = 0;
  if (objc_msgSend(-[PAEBaseCorrectorEffect versionsingAPI](self, "versionsingAPI"), "versionAtCreation") == 1)
  {
    objc_msgSend(v6, "getIntValue:fromParm:atFxTime:", &self->super._hostApplication + 1, 8890, a4.var1);
  }
  else if (objc_msgSend(v6, "getCustomParameterValue:fromParm:atFxTime:", &v8, 8893, a4.var1))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = objc_msgSend(v8, "intValue");
    else
      v7 = 0;
    *(&self->super._hostApplication + 1) = v7;
  }
  objc_msgSend(v6, "getBoolValue:fromParm:atFxTime:", &self->_gradingMode, 8889, a4.var1);
}

- (BOOL)resync:(id)a3 atTime:(id)a4 paramID:(unsigned int)a5 customChannelData:(id *)a6
{
  uint64_t v7;
  void *v11;
  void *v12;
  int v13;
  unsigned int *v14;
  char v15;
  uint64_t v16;
  objc_super v18;

  v7 = *(_QWORD *)&a5;
  v11 = (void *)objc_msgSend(a3, "apiForProtocol:", &unk_1EF0A70B8);
  v12 = v11;
  if ((v7 - 1) > 3)
  {
    if ((_DWORD)v7 == 8893)
    {
      if (objc_msgSend(-[PAEBaseCorrectorEffect versionsingAPI](self, "versionsingAPI"), "versionAtCreation") == 1)
      {
        v14 = (unsigned int *)(&self->super._hostApplication + 1);
        v15 = objc_msgSend(v12, "getIntValue:fromParm:atFxTime:", v14, 8890, a4.var1);
        *a6 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *v14);
        LOBYTE(v13) = v15;
      }
      else
      {
        v13 = objc_msgSend(v12, "getCustomParameterValue:fromParm:atFxTime:", a6, 8893, a4.var1);
        if (v13)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v16 = objc_msgSend(*a6, "intValue");
          else
            v16 = 0;
          -[PAEColorCurvesEffect _setGradingMode:](self, "_setGradingMode:", v16);
          LOBYTE(v13) = 1;
        }
      }
    }
    else if ((_DWORD)v7 == 8889)
    {
      LOBYTE(v13) = objc_msgSend(v11, "getBoolValue:fromParm:atFxTime:", &self->_gradingMode, 8889, a4.var1);
    }
    else
    {
      v18.receiver = self;
      v18.super_class = (Class)PAEColorCurvesEffect;
      LOBYTE(v13) = -[PAEBaseCorrectorEffect resync:atTime:paramID:customChannelData:](&v18, sel_resync_atTime_paramID_customChannelData_, a3, a4.var1, v7, a6);
    }
  }
  else
  {
    LOBYTE(v13) = objc_msgSend(v11, "getCustomParameterValue:fromParm:atFxTime:", a6, v7, a4.var1);
  }
  return v13;
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
      -[PAEColorCurvesEffect willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("gradingMode"));
      -[PAEColorCurvesEffect _setGradingMode:](self, "_setGradingMode:", v8);
      -[PAEColorCurvesEffect didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("gradingMode"));
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    v11 = *a4;
    v10.receiver = self;
    v10.super_class = (Class)PAEColorCurvesEffect;
    LOBYTE(v7) = -[PAEBaseCorrectorEffect parameterChanged:atTime:paramID:customChannelData:](&v10, sel_parameterChanged_atTime_paramID_customChannelData_, a3, &v11);
  }
  return v7;
}

- (BOOL)overrideRender:(id)a3 withOutputImage:(id)a4 inputImage:(id)a5 input:(void *)a6 withInfo:(id *)a7
{
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  int v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  HGColorGamma *v19;
  HGColorGamma *v20;
  HGColorGamma *v21;
  HGColorGamma *v22;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var1;
  uint64_t v24;
  HGColorGamma *v26;
  __int128 v27;
  uint64_t v28;

  v12 = (*(uint64_t (**)(void *, _QWORD, id, id, id))(*(_QWORD *)a6 + 128))(a6, 0, a3, a4, a5);
  v13 = v12;
  if (v12)
    (*(void (**)(uint64_t))(*(_QWORD *)v12 + 16))(v12);
  if (*(&self->super._hostApplication + 1) == 1)
  {
    v14 = 1;
  }
  else
  {
  }
  v15 = objc_msgSend((id)objc_opt_class(), "colorPrimaries:", a3) == 1 || v14;
  if (v15)
    v16 = 2;
  else
    v16 = 1;
  if (v15)
    v17 = 2;
  else
    v17 = 0;
  if (v14)
    v18 = 1;
  else
    v18 = v17;
  v19 = PAECreateGammaEncodingNode((uint64_t)a6, v16, v16, v18, 1, 0);
  v20 = -[PAEColorCurvesEffect newNodeForCorrector](self, "newNodeForCorrector");
  v21 = v20;
  if (!v20)
    v20 = v19;
  v22 = PAECreateGammaDecodingNode((uint64_t)v20, v16, v16, v18, 0, 1);
  if (v21)
  {
    var1 = a7->var0.var1;
    if (!a7->var0.var1)
      var1 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)MEMORY[0x1E0CA2E68];
    v24 = *((_QWORD *)var1 + 2);
    v27 = *(_OWORD *)var1;
    v28 = v24;
    -[PAEColorCurvesEffect setParameters:onNodeCorrector:time:](self, "setParameters:onNodeCorrector:time:", a3, v21, &v27);
    (*(void (**)(HGColorGamma *, _QWORD, HGColorGamma *))(*(_QWORD *)v21 + 120))(v21, 0, v19);
  }
  if (v22)
    (*(void (**)(HGColorGamma *))(*(_QWORD *)v22 + 16))(v22);
  v26 = v22;
  objc_msgSend(a4, "setHeliumRef:", &v26);
  if (v26)
    (*(void (**)(HGColorGamma *))(*(_QWORD *)v26 + 24))(v26);
  if (v21)
    (*(void (**)(HGColorGamma *))(*(_QWORD *)v21 + 24))(v21);
  (*(void (**)(HGColorGamma *))(*(_QWORD *)v19 + 24))(v19);
  (*(void (**)(HGColorGamma *))(*(_QWORD *)v22 + 24))(v22);
  if (v13)
    (*(void (**)(uint64_t))(*(_QWORD *)v13 + 24))(v13);
  return 1;
}

- (void)setParameters:(id)a3 onNodeCorrector:(void *)a4 time:(id *)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  _BOOL4 v14;
  _BOOL4 v15;
  __n128 v16;
  __n128 v17;
  __n128 v18;
  BOOL v19;
  __int128 *v20;
  char *v21;
  char *v22;
  float *v23;
  int *v24;
  int *v25;
  int *v26;
  int *v27;
  int *v28;
  __int128 *v29;
  float *v30;
  float *v31;
  float *v32;
  float *v33;
  float *v34;
  float *v35;
  float *v36;
  int *v37;
  float *v38;
  float *v39;
  float *v40;
  float *v41;
  float *v42;
  float *v43;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v44;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v45;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v46;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v47;

  v47 = *a5;
  v9 = -[PAEBaseCorrectorEffect customChannelData:ofParamID:time:](self, "customChannelData:ofParamID:time:", a3, 4, &v47);
  v46 = *a5;
  v10 = -[PAEBaseCorrectorEffect customChannelData:ofParamID:time:](self, "customChannelData:ofParamID:time:", a3, 1, &v46);
  v45 = *a5;
  v11 = -[PAEBaseCorrectorEffect customChannelData:ofParamID:time:](self, "customChannelData:ofParamID:time:", a3, 2, &v45);
  v44 = *a5;
  v12 = -[PAEBaseCorrectorEffect customChannelData:ofParamID:time:](self, "customChannelData:ofParamID:time:", a3, 3, &v44);
  v13 = objc_msgSend(v9, "curveRef");
  if (*(&self->super._hostApplication + 1) == 1)
  {
    v14 = 0;
  }
  else
  {
  }
  v15 = objc_msgSend((id)objc_opt_class(), "colorPrimaries:", a3) != 1;
  (*(void (**)(void *, uint64_t, float, float, float, float))(*(_QWORD *)a4 + 96))(a4, 3, (float)(char)-LOBYTE(self->_gradingMode), 0.0, 0.0, 0.0);
  v19 = !v14 || !v15;
  if (v14 && v15)
    v20 = &cc::matrix::rgb_to_YCbCr709;
  else
    v20 = &cc::matrix::rgb_to_YCbCr2020;
  v16.n128_u32[0] = *(_DWORD *)v20;
  v21 = (char *)&cc::matrix::rgb_to_YCbCr709 + 4;
  if (!v14 || !v15)
    v21 = (char *)&cc::matrix::rgb_to_YCbCr2020 + 4;
  v17.n128_u32[0] = *(_DWORD *)v21;
  v22 = (char *)&cc::matrix::rgb_to_YCbCr709 + 8;
  if (v14 && v15)
  {
    v23 = (float *)&cc::matrix::rgb_to_YCbCr709 + 3;
  }
  else
  {
    v22 = (char *)&cc::matrix::rgb_to_YCbCr2020 + 8;
    v23 = (float *)&cc::matrix::rgb_to_YCbCr2020 + 3;
  }
  if (v19)
    v24 = &dword_1ED4DBF38;
  else
    v24 = &dword_1ED4DBE34;
  if (v19)
    v25 = &dword_1ED4DBF3C;
  else
    v25 = &dword_1ED4DBE38;
  if (v19)
    v26 = &dword_1ED4DBF40;
  else
    v26 = &dword_1ED4DBE3C;
  if (v19)
    v27 = &dword_1ED4DBF44;
  else
    v27 = &dword_1ED4DBE40;
  if (v19)
    v28 = &dword_1ED4DBF48;
  else
    v28 = &dword_1ED4DBE44;
  if (v19)
    v29 = &cc::matrix::YCbCr2020_to_rgb;
  else
    v29 = &cc::matrix::YCbCr709_to_rgb;
  if (v19)
    v30 = (float *)&cc::matrix::YCbCr2020_to_rgb + 1;
  else
    v30 = (float *)&cc::matrix::YCbCr709_to_rgb + 1;
  if (v19)
    v31 = (float *)&cc::matrix::YCbCr2020_to_rgb + 2;
  else
    v31 = (float *)&cc::matrix::YCbCr709_to_rgb + 2;
  v32 = (float *)&cc::matrix::YCbCr709_to_rgb + 3;
  if (v19)
    v32 = (float *)&cc::matrix::YCbCr2020_to_rgb + 3;
  v40 = v32;
  v33 = (float *)algn_1ED4DBE10;
  if (v19)
    v33 = (float *)&unk_1ED4DBEB4;
  v39 = v33;
  v34 = (float *)&algn_1ED4DBE10[4];
  if (v19)
    v34 = (float *)&unk_1ED4DBEB8;
  v38 = v34;
  v35 = (float *)&algn_1ED4DBE10[8];
  if (v19)
    v35 = (float *)&unk_1ED4DBEBC;
  v43 = v35;
  v36 = (float *)&algn_1ED4DBE10[12];
  if (v19)
    v36 = (float *)&unk_1ED4DBEC0;
  v37 = &dword_1ED4DBE20;
  if (v19)
    v37 = &dword_1ED4DBEC4;
  v41 = (float *)v37;
  v42 = v36;
  v18.n128_u32[0] = *(_DWORD *)v22;
  (*(void (**)(void *, uint64_t, __n128, __n128, __n128, float))(*(_QWORD *)a4 + 96))(a4, 5, v16, v17, v18, 0.0);
  (*(void (**)(void *, uint64_t, float, float, float, float))(*(_QWORD *)a4 + 96))(a4, 6, *v23, *(float *)v24, *(float *)v25, 0.0);
  (*(void (**)(void *, uint64_t, float, float, float, float))(*(_QWORD *)a4 + 96))(a4, 7, *(float *)v26, *(float *)v27, *(float *)v28, 0.0);
  (*(void (**)(void *, uint64_t, float, float, float, float))(*(_QWORD *)a4 + 96))(a4, 8, *(float *)v29, *v30, *v31, 0.0);
  (*(void (**)(void *, uint64_t, float, float, float, float))(*(_QWORD *)a4 + 96))(a4, 9, *v40, *v39, *v38, 0.0);
  (*(void (**)(void *, uint64_t, float, float, float, float))(*(_QWORD *)a4 + 96))(a4, 10, *v43, *v42, *v41, 0.0);
}

- (id)shouldDeselectOtherMasks:(id)a3
{
  if (objc_msgSend(a3, "mode") == 1 && !objc_msgSend(a3, "state"))
    return (id)MEMORY[0x1E0C9AAB0];
  else
    return (id)MEMORY[0x1E0C9AAA0];
}

- (BOOL)needsOSCsIn360Groups
{
  return 1;
}

@end
