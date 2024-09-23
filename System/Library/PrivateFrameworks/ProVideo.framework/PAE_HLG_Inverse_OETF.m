@implementation PAE_HLG_Inverse_OETF

- (PAE_HLG_Inverse_OETF)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAE_HLG_Inverse_OETF;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (id)properties
{
  if (-[PAE_HLG_Inverse_OETF properties]::once != -1)
    dispatch_once(&-[PAE_HLG_Inverse_OETF properties]::once, &__block_literal_global_46);
  return (id)-[PAE_HLG_Inverse_OETF properties]::sPropertiesDict;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;

  if (a4)
    objc_msgSend(a4, "heliumRef");
  else
    v13 = 0;
  v11 = 0x1200000009;
  v12 = 0;
  v9 = 0x800000009;
  v10 = 0;
  FxApplyColorConform(&v13, (uint64_t)&v11, 1, (uint64_t)&v9, (char *)1, &v8);
  v6 = v8;
  if (v13 == v8)
  {
    if (v13)
      (*(void (**)(uint64_t))(*(_QWORD *)v13 + 24))(v13);
  }
  else
  {
    if (v13)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v13 + 24))(v13);
      v6 = v8;
    }
    v13 = v6;
  }
  objc_msgSend(a3, "setHeliumRef:", &v13);
  if (v13)
    (*(void (**)(uint64_t))(*(_QWORD *)v13 + 24))(v13);
  return 1;
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
