@implementation PAEFlop

- (PAEFlop)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEFlop;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
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
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("MayRemapTime"), v5, CFSTR("SupportsLargeRenderScale"), v6, CFSTR("SupportsHeliumRendering"), v7, CFSTR("PixelTransformSupport"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAEFlop;
  -[PAESharedDefaultBase addParameters](&v6, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Flop::Flop"), 0, 0), 1, 0, objc_msgSend((id)objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Flop::FlopEntries"), 0, 0), "componentsSeparatedByString:", CFSTR("|")), 1);
  }
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  _BOOL4 v10;
  unsigned int v11;
  int v12;
  unint64_t var1;
  uint64_t i;
  _OWORD *v15;
  __int128 v16;
  uint64_t v17;
  _QWORD v19[16];
  uint64_t v20[16];
  _BYTE v21[48];
  int64x2_t v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  unsigned int v28;
  __int128 v29[8];
  _BYTE v30[128];

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a3);
  -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a3);
  if (!v9)
    goto LABEL_18;
  v28 = 0;
  objc_msgSend(v9, "getIntValue:fromParm:atFxTime:", &v28, 1, a5->var0.var1);
  v10 = v28 > 2 || (v28 & 1) == 0;
  if (v28 <= 2)
    v11 = (6u >> (v28 & 7)) & 1;
  else
    v11 = 1;
  v12 = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
  if (!v12)
    return v12;
  var1 = a5->var1;
  if (objc_msgSend(a4, "imageType") != 3)
  {
LABEL_18:
    LOBYTE(v12) = 0;
    return v12;
  }
  v27 = 0x3FF0000000000000;
  v24 = 0x3FF0000000000000;
  *(_QWORD *)&v21[40] = 0x3FF0000000000000;
  *(_QWORD *)v21 = 0x3FF0000000000000;
  memset(&v21[8], 0, 32);
  v22 = 0u;
  v23 = 0u;
  v25 = 0u;
  v26 = 0u;
  if (v10)
  {
    *(_OWORD *)v21 = xmmword_1B30506A0;
    *(int64x2_t *)&v21[16] = vdupq_n_s64(0x8000000000000000);
  }
  if (v11)
  {
    *(_OWORD *)&v21[32] = xmmword_1B304F610;
    v22 = vdupq_n_s64(0x8000000000000000);
  }
  PCMatrix44Tmpl<double>::operator*((uint64_t)v30, (__int128 *)v21, (uint64_t)v19);
  PCMatrix44Tmpl<double>::operator*((uint64_t)v19, v29, (uint64_t)v20);
  for (i = 0; i != 16; i += 4)
  {
    v15 = &v21[i * 8];
    v16 = *(_OWORD *)&v20[i + 2];
    *v15 = *(_OWORD *)&v20[i];
    v15[1] = v16;
  }
  if (a4)
    objc_msgSend(a4, "heliumRef");
  else
    v20[0] = 0;
  FxSupport::makeHeliumXForm((double *)v21, v20, var1 == 2, var1 == 2, v19);
  v17 = v19[0];
  if (v20[0] == v19[0])
  {
    if (v20[0])
      (*(void (**)(void))(*(_QWORD *)v20[0] + 24))();
  }
  else
  {
    if (v20[0])
    {
      (*(void (**)(void))(*(_QWORD *)v20[0] + 24))();
      v17 = v19[0];
    }
    v20[0] = v17;
  }
  objc_msgSend(a3, "setHeliumRef:", v20);
  if (v20[0])
    (*(void (**)(uint64_t))(*(_QWORD *)v20[0] + 24))(v20[0]);
  LOBYTE(v12) = 1;
  return v12;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  __int128 v6;
  _OWORD v8[3];

  *a6 = 1;
  *a5 = 1;
  v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->var4;
  -[PAESharedDefaultBase overrideFrameSetupForRenderMode:hardware:software:](self, "overrideFrameSetupForRenderMode:hardware:software:", v8, a5, a6);
  return 1;
}

@end
