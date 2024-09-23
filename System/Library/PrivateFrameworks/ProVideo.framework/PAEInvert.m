@implementation PAEInvert

- (PAEInvert)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEInvert;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (id)properties
{
  if (-[PAEInvert properties]::once != -1)
    dispatch_once(&-[PAEInvert properties]::once, &__block_literal_global_39);
  return (id)-[PAEInvert properties]::sPropertiesDict;
}

uint64_t __23__PAEInvert_properties__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  v1 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  result = objc_msgSend(v0, "initWithObjectsAndKeys:", &unk_1E6649198, CFSTR("PixelTransformSupport"), v1, CFSTR("PixelIndependent"), v2, CFSTR("PositionIndependent"), v3, CFSTR("MayRemapTime"), v4, CFSTR("SupportsLargeRenderScale"), v5, CFSTR("SupportsHeliumRendering"), v6, CFSTR("SupportsInternalMixing"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1), CFSTR("AutoColorProcessingSupport"), 0);
  -[PAEInvert properties]::sPropertiesDict = result;
  return result;
}

- (BOOL)addParameters
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PAEInvert;
  -[PAESharedDefaultBase addParameters](&v3, sel_addParameters);
  return 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9;
  void *v10;
  int v11;
  double v12;
  double v13;
  HgcInvert *v14;
  float v15;
  HgcInvert *v17;
  uint64_t v18;

  v9 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (v9)
  {
    v10 = (void *)v9;
    v11 = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
    objc_msgSend(v10, "mixAmountAtTime:", a5->var0.var1);
    if (v11 && (v13 = v12, objc_msgSend(a4, "imageType") == 3))
    {
      if (a4)
        objc_msgSend(a4, "heliumRef");
      else
        v18 = 0;
      v14 = (HgcInvert *)HGObject::operator new(0x1A0uLL);
      HgcInvert::HgcInvert(v14);
      v17 = v14;
      (*(void (**)(HgcInvert *, _QWORD, uint64_t))(*(_QWORD *)v14 + 120))(v14, 0, v18);
      v15 = v13;
      (*(void (**)(HgcInvert *, _QWORD, float, float, float, float))(*(_QWORD *)v14 + 96))(v14, 0, v15, v15, v15, v15);
      objc_msgSend(a3, "setHeliumRef:", &v17);
      if (v17)
        (*(void (**)(HgcInvert *))(*(_QWORD *)v17 + 24))(v17);
      if (v18)
        (*(void (**)(uint64_t))(*(_QWORD *)v18 + 24))(v18);
      LOBYTE(v9) = 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (BOOL)frameSetup:(id *)a3 inputInfo:(id *)a4 hardware:(BOOL *)a5 software:(BOOL *)a6
{
  __int128 v6;
  _OWORD v8[3];

  *a5 = 0;
  *a6 = 0;
  v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->var4;
  -[PAESharedDefaultBase overrideFrameSetupForRenderMode:hardware:software:](self, "overrideFrameSetupForRenderMode:hardware:software:", v8, a5, a6);
  return 1;
}

@end
