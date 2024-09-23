@implementation PAELevels

- (PAELevels)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAELevels;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (id)properties
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v15;

  v2 = objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190), "versionAtCreation");
  if (v2 <= 2)
    v3 = 1;
  else
    v3 = 3;
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
  if (v2 <= 1)
    v5 = 590080;
  else
    v5 = 593920;
  v15 = (void *)MEMORY[0x1E0C99D80];
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 65792);
  v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  return (id)objc_msgSend(v15, "dictionaryWithObjectsAndKeys:", v6, CFSTR("PixelTransformSupport"), v7, CFSTR("PixelIndependent"), v8, CFSTR("PositionIndependent"), v9, CFSTR("MayRemapTime"), v10, CFSTR("SupportsLargeRenderScale"), v11, CFSTR("SupportsHeliumRendering"), v12, CFSTR("SDRWorkingSpace"), v13, CFSTR("HDRWorkingSpace"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1),
               CFSTR("SupportsInternalMixing"),
               v4,
               CFSTR("AutoColorProcessingSupport"),
               0);
}

- (BOOL)addParameters
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PAELevels;
  -[PAESharedDefaultBase addParameters](&v8, sel_addParameters);
  v3 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A4A30);
  if (!v3)
    return 0;
  v4 = (void *)v3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = objc_msgSend(v4, "addHistogramWithName:parmId:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Levels::Histogram"), 0, 0), 1, 0);
  objc_msgSend(v4, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Levels::HDR In Rec. 709"), 0, 0), 2, 0, 2);
  return v6;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  double *v19;
  double v20;
  _BOOL4 v21;
  void *v22;
  _BOOL4 v23;
  int v24;
  HLevels *v25;
  float v26;
  float v27;
  float v28;
  float v29;
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
  float v42;
  float v43;
  float v44;
  float v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v55;
  uint64_t v56;
  id v57;
  void *v58;
  PAELevels *v59;
  HLevels *v60;
  HLevels *v61;
  HLevels *v62;
  char v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69[4];
  double v70[4];
  double v71[4];
  double v72[4];
  double v73[6];

  v73[4] = *(double *)MEMORY[0x1E0C80C00];
  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A7358);
  v10 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A2958);
  v11 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v9)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (v12 || v11 == 0)
    goto LABEL_23;
  v59 = self;
  v58 = (void *)v11;
  v57 = a3;
  v67 = 0.0;
  v68 = 0.0;
  v65 = 0.0;
  v66 = 0.0;
  v64 = 0.0;
  objc_msgSend(v9, "mixAmountAtTime:", a5->var0.var1);
  v15 = v14;
  LODWORD(v55) = 1;
  objc_msgSend(v9, "getHistogramBlackIn:BlackOut:WhiteIn:WhiteOut:Gamma:forChannel:fromParm:atFxTime:", &v68, &v67, &v66, &v65, &v64, 0, v55, a5->var0.var1);
  v16 = 0;
  if (v64 >= 0.001)
    v17 = 1.0 / v64;
  else
    v17 = 1000.0;
  v64 = v17;
  v18 = 1;
  do
  {
    v19 = &v69[v16];
    LODWORD(v56) = 1;
    objc_msgSend(v9, "getHistogramBlackIn:BlackOut:WhiteIn:WhiteOut:Gamma:forChannel:fromParm:atFxTime:", &v73[v16], &v72[v16], &v71[v16], &v70[v16], &v69[v16], v18, v56, a5->var0.var1);
    if (v69[v16] >= 0.001)
      v20 = 1.0 / *v19;
    else
      v20 = 1000.0;
    *v19 = v20;
    ++v16;
    ++v18;
  }
  while (v16 != 4);
  v21 = objc_msgSend(v10, "colorPrimaries") == 1;
  v22 = (void *)-[PROAPIAccessing apiForProtocol:](v59->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v63 = 0;
  objc_msgSend(v22, "getBoolValue:fromParm:atFxTime:", &v63, 2, a5->var0.var1);
  if (v63)
    v23 = v21;
  else
    v23 = 0;
  v24 = -[PAESharedDefaultBase getRenderMode:](v59, "getRenderMode:", a5->var0.var1);
  if (!v24)
    return v24;
  if (objc_msgSend(a4, "imageType") != 3)
  {
LABEL_23:
    LOBYTE(v24) = 0;
    return v24;
  }
  if (a4)
    objc_msgSend(a4, "heliumRef");
  else
    v62 = 0;
  v61 = 0;
  v25 = (HLevels *)HGObject::operator new(0x1A0uLL);
  HLevels::HLevels(v25);
  v26 = v68;
  (*(void (**)(HLevels *, _QWORD, float, float, float, float))(*(_QWORD *)v25 + 96))(v25, 0, v26, v26, v26, 0.0);
  v27 = v67;
  (*(void (**)(HLevels *, uint64_t, float, float, float, float))(*(_QWORD *)v25 + 96))(v25, 1, v27, v27, v27, 0.0);
  v28 = v66;
  (*(void (**)(HLevels *, uint64_t, float, float, float, float))(*(_QWORD *)v25 + 96))(v25, 2, v28, v28, v28, 1.0);
  v29 = v65;
  (*(void (**)(HLevels *, uint64_t, float, float, float, float))(*(_QWORD *)v25 + 96))(v25, 3, v29, v29, v29, 1.0);
  v30 = v64;
  (*(void (**)(HLevels *, uint64_t, float, float, float, float))(*(_QWORD *)v25 + 96))(v25, 4, v30, v30, v30, 1.0);
  v31 = v73[0];
  v32 = v73[1];
  v33 = v73[2];
  v34 = v73[3];
  (*(void (**)(HLevels *, uint64_t, float, float, float, float))(*(_QWORD *)v25 + 96))(v25, 5, v31, v32, v33, v34);
  v35 = v72[0];
  v36 = v72[1];
  v37 = v72[2];
  v38 = v72[3];
  (*(void (**)(HLevels *, uint64_t, float, float, float, float))(*(_QWORD *)v25 + 96))(v25, 6, v35, v36, v37, v38);
  v39 = v71[0];
  v40 = v71[1];
  v41 = v71[2];
  v42 = v71[3];
  (*(void (**)(HLevels *, uint64_t, float, float, float, float))(*(_QWORD *)v25 + 96))(v25, 7, v39, v40, v41, v42);
  v43 = v70[0];
  v44 = v70[1];
  v45 = v70[2];
  v46 = v70[3];
  (*(void (**)(HLevels *, uint64_t, float, float, float, float))(*(_QWORD *)v25 + 96))(v25, 8, v43, v44, v45, v46);
  v47 = v69[0];
  v48 = v69[1];
  v49 = v69[2];
  v50 = v69[3];
  (*(void (**)(HLevels *, uint64_t, float, float, float, float))(*(_QWORD *)v25 + 96))(v25, 9, v47, v48, v49, v50);
  v51 = v15;
  (*(void (**)(HLevels *, uint64_t, float, float, float, float))(*(_QWORD *)v25 + 96))(v25, 10, v51, v51, v51, v51);
  if (objc_msgSend(v58, "versionAtCreation") < 2)
  {
    if (v23)
    {
      FxApplyColorConform((uint64_t *)&v62, (uint64_t)&kPCNCLC_Rec2020, 1, (uint64_t)&kPCNCLC_Rec709, (char *)1, (uint64_t *)&v60);
      v52 = (uint64_t)v60;
      if (v62 == v60)
      {
        if (v62)
          (*(void (**)(void))(*(_QWORD *)v62 + 24))();
      }
      else
      {
        if (v62)
        {
          (*(void (**)(void))(*(_QWORD *)v62 + 24))();
          v52 = (uint64_t)v60;
        }
        v62 = (HLevels *)v52;
      }
    }
    (*(void (**)(HLevels *, _QWORD, HLevels *))(*(_QWORD *)v25 + 120))(v25, 0, v62);
    if (v61 != v25)
    {
      if (v61)
        (*(void (**)(void))(*(_QWORD *)v61 + 24))();
      v61 = v25;
      (*(void (**)(HLevels *))(*(_QWORD *)v25 + 16))(v25);
    }
    if (v23)
    {
      FxApplyColorConform((uint64_t *)&v61, (uint64_t)&kPCNCLC_Rec709, 1, (uint64_t)&kPCNCLC_Rec2020, (char *)1, (uint64_t *)&v60);
      v53 = (uint64_t)v60;
      if (v61 == v60)
      {
        if (v61)
          (*(void (**)(void))(*(_QWORD *)v61 + 24))();
      }
      else
      {
        if (v61)
        {
          (*(void (**)(void))(*(_QWORD *)v61 + 24))();
          v53 = (uint64_t)v60;
        }
        v61 = (HLevels *)v53;
      }
    }
  }
  else
  {
    (*(void (**)(HLevels *, _QWORD, HLevels *))(*(_QWORD *)v25 + 120))(v25, 0, v62);
    if (v61 != v25)
    {
      v61 = v25;
      (*(void (**)(HLevels *))(*(_QWORD *)v25 + 16))(v25);
    }
  }
  objc_msgSend(v57, "setHeliumRef:", &v61);
  (*(void (**)(HLevels *))(*(_QWORD *)v25 + 24))(v25);
  if (v61)
    (*(void (**)(HLevels *))(*(_QWORD *)v61 + 24))(v61);
  if (v62)
    (*(void (**)(HLevels *))(*(_QWORD *)v62 + 24))(v62);
  LOBYTE(v24) = 1;
  return v24;
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
