@implementation PAEColorSolid

- (PAEColorSolid)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEColorSolid;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (id)properties
{
  if (-[PAEColorSolid properties]::once != -1)
    dispatch_once(&-[PAEColorSolid properties]::once, &__block_literal_global_33);
  return (id)-[PAEColorSolid properties]::sPropertiesDict;
}

uint64_t __27__PAEColorSolid_properties__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  v1 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 6);
  result = objc_msgSend(v0, "initWithObjectsAndKeys:", &unk_1E6649108, CFSTR("PixelTransformSupport"), v1, CFSTR("SupportsHeliumRendering"), v2, CFSTR("PixelTransformSupport"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
  -[PAEColorSolid properties]::sPropertiesDict = result;
  return result;
}

- (BOOL)addParameters
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PAEColorSolid;
  -[PAESharedDefaultBase addParameters](&v5, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", CFSTR("ColorSolid::Color"), 0, 0), 1, 0, 0.0, 0.0, 1.0);
  return v3 != 0;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInfo:(id *)a4
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  double v15;
  int v16;
  int v17;
  uint64_t v18;
  HGSolidColor *v19;
  float v20;
  float v21;
  float v22;
  HGSolidColor *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29[16];
  double v30;
  double v31;
  double v32;
  HGRect v33;

  v7 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (v7)
  {
    v31 = 0.0;
    v32 = 0.0;
    v30 = 0.0;
    objc_msgSend(v7, "getRedValue:greenValue:blueValue:fromParm:atFxTime:", &v32, &v31, &v30, 1, a4->var0.var1);
    LODWORD(v7) = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a4->var0.var1);
    if ((_DWORD)v7)
    {
      if (objc_msgSend(a3, "imageType") == 3)
      {
        objc_msgSend(a3, "bounds");
        v9 = v8;
        v11 = v10;
        -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a3);
        v25 = v9 * -0.5;
        v26 = v11 * -0.5;
        v27 = v9;
        v28 = v11;
        if (PCMatrix44Tmpl<double>::transformRect<double>(v29, &v25, (uint64_t)&v25)
          && v25 >= -2147483650.0
          && v25 <= 2147483650.0
          && (v13 = v25 + v27, HIDWORD(v14) = -1042284544, v25 + v27 >= -2147483650.0)
          && v13 <= 2147483650.0
          && v26 >= -2147483650.0
          && v26 <= 2147483650.0
          && (v15 = v26 + v28, v26 + v28 <= 2147483650.0)
          && v15 >= -2147483650.0)
        {
          v16 = vcvtmd_s64_f64(v25);
          v17 = vcvtmd_s64_f64(v26);
          LODWORD(v14) = vcvtpd_s64_f64(v13);
          LODWORD(v12) = vcvtpd_s64_f64(v15);
          v18 = v14 | (v12 << 32);
        }
        else
        {
          v16 = 0x80000000;
          v17 = 0x80000000;
          v18 = 0x7FFFFFFF7FFFFFFFLL;
        }
        v19 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
        v33.var0 = v16;
        v33.var1 = v17;
        *(_QWORD *)&v33.var2 = v18;
        HGSolidColor::HGSolidColor(v19, v33);
        v24 = v19;
        v20 = v32;
        v21 = v31;
        v22 = v30;
        (*(void (**)(HGSolidColor *, _QWORD, float, float, float, float))(*(_QWORD *)v19 + 96))(v19, 0, v20, v21, v22, 1.0);
        objc_msgSend(a3, "setHeliumRef:", &v24);
        if (v24)
          (*(void (**)(HGSolidColor *))(*(_QWORD *)v24 + 24))(v24);
        LOBYTE(v7) = 1;
      }
      else
      {
        LOBYTE(v7) = 0;
      }
    }
  }
  return (char)v7;
}

- (BOOL)frameSetup:(id *)a3 hardware:(BOOL *)a4 software:(BOOL *)a5
{
  __int128 v5;
  _OWORD v7[3];

  *a5 = 0;
  *a4 = 0;
  v5 = *(_OWORD *)&a3->var2;
  v7[0] = *(_OWORD *)&a3->var0.var0;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a3->var4;
  -[PAESharedDefaultBase overrideFrameSetupForRenderMode:hardware:software:](self, "overrideFrameSetupForRenderMode:hardware:software:", v7);
  return 1;
}

@end
