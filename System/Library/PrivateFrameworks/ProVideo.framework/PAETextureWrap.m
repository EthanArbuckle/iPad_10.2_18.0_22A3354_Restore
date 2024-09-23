@implementation PAETextureWrap

- (PAETextureWrap)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAETextureWrap;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (id)properties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("SupportsLargeRenderScale"), v5, CFSTR("SupportsHeliumRendering"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)addParameters
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PAETextureWrap;
  -[PAESharedDefaultBase addParameters](&v3, sel_addParameters);
  return 1;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  HGTextureWrap *v6;
  char *v7;
  HGTextureWrap *v9;
  uint64_t v10;

  if (a4)
    objc_msgSend(a4, "heliumRef");
  else
    v10 = 0;
  v6 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
  HGTextureWrap::HGTextureWrap(v6);
  (*(void (**)(HGTextureWrap *, _QWORD, uint64_t))(*(_QWORD *)v6 + 120))(v6, 0, v10);
  HGTextureWrap::SetTextureWrapMode((uint64_t)v6, (const char *)3, v7);
  v9 = v6;
  (*(void (**)(HGTextureWrap *))(*(_QWORD *)v6 + 16))(v6);
  objc_msgSend(a3, "setHeliumRef:", &v9);
  if (v9)
    (*(void (**)(HGTextureWrap *))(*(_QWORD *)v9 + 24))(v9);
  (*(void (**)(HGTextureWrap *))(*(_QWORD *)v6 + 24))(v6);
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 24))(v10);
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
