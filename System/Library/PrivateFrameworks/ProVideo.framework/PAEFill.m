@implementation PAEFill

- (PAEFill)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEFill;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (id)properties
{
  if (-[PAEFill properties]::once != -1)
    dispatch_once(&-[PAEFill properties]::once, &__block_literal_global_32);
  return (id)-[PAEFill properties]::sPropertiesDict;
}

uint64_t __21__PAEFill_properties__block_invoke()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v0 = objc_alloc(MEMORY[0x1E0C99D80]);
  v1 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v2 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 67584);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 591872);
  result = objc_msgSend(v0, "initWithObjectsAndKeys:", &unk_1E66490F0, CFSTR("PixelTransformSupport"), v1, CFSTR("PositionIndependent"), v2, CFSTR("MayRemapTime"), v3, CFSTR("SupportsLargeRenderScale"), v4, CFSTR("SupportsHeliumRendering"), v5, CFSTR("SupportsInternalMixing"), v6, CFSTR("SDRWorkingSpace"), v7, CFSTR("HDRWorkingSpace"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 3),
             CFSTR("AutoColorProcessingSupport"),
             0);
  -[PAEFill properties]::sPropertiesDict = result;
  return result;
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAEFill;
  -[PAESharedDefaultBase addParameters](&v6, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Fill::Type"), 0, 0), 1, 0, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Fill::Color"), 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Fill::Gradient"), 0, 0), 0), 1);
    objc_msgSend(v3, "addColorParameterWithName:parmId:defaultRed:defaultGreen:defaultBlue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Fill::Color"), 0, 0), 2, 0, 0.5, 0.5, 0.5);
    objc_msgSend(v3, "addGradientPositionedWithName:parmId:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Fill::Gradient"), 0, 0), 3, 2);
    objc_msgSend(v3, "setGradientHiddenWithOSC:toParam:", 1, 3);
  }
  return v3 != 0;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  BOOL v8;
  int *v9;
  _BOOL8 v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  int v15;
  int v16;
  int v17;
  __int128 v18;
  uint64_t v19;

  if (a3 != 1)
    return 1;
  v4 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v5 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A7268);
  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
    return 0;
  v7 = (void *)v5;
  v18 = *MEMORY[0x1E0CA2E18];
  v19 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v17 = 0;
  v8 = 1;
  objc_msgSend(v4, "getIntValue:fromParm:atFxTime:", &v17, 1, &v18);
  v15 = 0;
  v16 = 0;
  objc_msgSend(v4, "getParameterFlags:fromParm:", &v16, 2);
  v9 = &v15;
  objc_msgSend(v4, "getParameterFlags:fromParm:", &v15, 3);
  v10 = v17 == 0;
  if (v17)
    v11 = &v15;
  else
    v11 = &v16;
  if (v17)
    v12 = 3;
  else
    v12 = 2;
  if (v17)
  {
    v9 = &v16;
    v13 = 2;
  }
  else
  {
    v13 = 3;
  }
  objc_msgSend(v7, "setParameterFlags:toParm:", *v11 & 0xFFFFFFFD, v12);
  objc_msgSend(v7, "setParameterFlags:toParm:", *v9 | 2u, v13);
  objc_msgSend(v7, "setGradientHiddenWithOSC:toParam:", v10, 3);
  return v8;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  int v16;
  double v17;
  double v18;
  uint64_t i;
  _OWORD *v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  HGBitmap *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  HGGradient *v34;
  float v35;
  HgcFillColor *v36;
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
  float v52;
  float v53;
  float v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char v60;
  HGBitmapLoader *v61;
  HGHWBlendFlipped *v62;
  float v63;
  HGGradient *v64;
  HGradientBlend *v65;
  int v66;
  double v67;
  double v68[16];
  double v69;
  __int128 v70;
  __int128 v71;
  double v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  double v78;
  double v79;
  double v80;
  uint64_t v81;
  int v82;

  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v10 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A7358);
  v11 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A3A58);
  v12 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A2958);
  if (v9)
    v13 = v10 == 0;
  else
    v13 = 1;
  if (v13 || v11 == 0 || v12 == 0)
    return 0;
  v82 = 0;
  objc_msgSend(v9, "getIntValue:fromParm:atFxTime:", &v82, 1, a5->var0.var1);
  v16 = -[PAESharedDefaultBase getRenderMode:](self, "getRenderMode:", a5->var0.var1);
  objc_msgSend(v9, "mixAmountAtTime:", a5->var0.var1);
  if (!v16)
    return 0;
  v18 = v17;
  if (objc_msgSend(a4, "imageType") != 3)
    return 0;
  if (a4)
    objc_msgSend(a4, "heliumRef");
  else
    v81 = 0;
  if (v82)
  {
    v78 = 1.0;
    v75 = 0x3FF0000000000000;
    v72 = 1.0;
    v69 = 1.0;
    v70 = 0u;
    v71 = 0u;
    v73 = 0u;
    v74 = 0u;
    v76 = 0u;
    v77 = 0u;
    objc_msgSend(v11, "inversePixelTransform");
    for (i = 0; i != 16; i += 4)
    {
      v21 = (_OWORD *)((char *)&v69 + i * 8);
      v22 = *(_OWORD *)&v68[i + 2];
      *v21 = *(_OWORD *)&v68[i];
      v21[1] = v22;
    }
    v23 = HGRectMake4i(0, 0, 0x400u, 1u);
    v25 = v24;
    v26 = (HGBitmap *)HGObject::operator new(0x80uLL);
    *(_QWORD *)&v27 = HGBitmap::HGBitmap(v26, v23, v25, 24).n128_u64[0];
    v67 = 0.0;
    v68[0] = 0.0;
    v79 = 0.0;
    v80 = 0.0;
    v66 = 0;
    objc_msgSend(v10, "getGradientSamples:numSamples:depth:fromParm:atFxTime:", *((_QWORD *)v26 + 10), 1024, 1, 3, a5->var0.var1, v27);
    objc_msgSend(v10, "getGradientStartEnd:startY:endX:endY:type:fromParm:atFxTime:", v68, &v80, &v79, &v67, &v66, 3, a5->var0.var1);
    objc_msgSend(a3, "pixelAspect");
    v29 = v28;
    v30 = v79;
    v31 = v80;
    v32 = v67;
    v33 = v68[0];
    v34 = (HGGradient *)HGObject::operator new(0x210uLL);
    HGGradient::HGGradient(v34);
    if (v66)
    {
      HGGradient::SetGradientMode((uint64_t)v34, 1);
      v35 = sqrt(v29 * (v30 - v33) * (v29 * (v30 - v33)) + (v32 - v31) * (v32 - v31));
      (*(void (**)(HGGradient *, uint64_t, float, float, float, float))(*(_QWORD *)v34 + 96))(v34, 2, fabsf(v35), 0.0, 0.0, 0.0);
    }
    else
    {
      HGGradient::SetGradientMode((uint64_t)v34, 0);
      v41 = v79;
      v42 = v67;
      (*(void (**)(HGGradient *, uint64_t, float, float, float, float))(*(_QWORD *)v34 + 96))(v34, 2, v41, v42, 0.0, 0.0);
    }
    v43 = v29;
    (*(void (**)(HGGradient *, _QWORD, float, float, float, float))(*(_QWORD *)v34 + 96))(v34, 0, v43, 1.0, 1.0, 1.0);
    v44 = v68[0];
    v45 = v80;
    (*(void (**)(HGGradient *, uint64_t, float, float, float, float))(*(_QWORD *)v34 + 96))(v34, 1, v44, v45, 0.0, 0.0);
    v46 = v69;
    v47 = *(double *)&v70;
    v48 = *(double *)&v71;
    (*(void (**)(HGGradient *, uint64_t, float, float, float, float))(*(_QWORD *)v34 + 96))(v34, 3, v46, v47, 0.0, v48);
    v49 = *((double *)&v71 + 1);
    v50 = v72;
    v51 = *((double *)&v73 + 1);
    (*(void (**)(HGGradient *, uint64_t, float, float, float, float))(*(_QWORD *)v34 + 96))(v34, 4, v49, v50, 0.0, v51);
    v52 = *((double *)&v76 + 1);
    v53 = *(double *)&v77;
    v54 = v78;
    (*(void (**)(HGGradient *, uint64_t, float, float, float, float))(*(_QWORD *)v34 + 96))(v34, 5, v52, v53, 0.0, v54);
    v55 = 0;
    v56 = *((_QWORD *)v26 + 10);
    v57 = v56;
    do
    {
      v58 = 0;
      v59 = (char *)(v56 + 4 * v55);
      v60 = *v59;
      do
      {
        *(_BYTE *)(v57 + v58) = *(_BYTE *)(v57 + v58 + 1);
        ++v58;
      }
      while (v58 != 3);
      v59[3] = v60;
      ++v55;
      v57 += 4;
    }
    while (v55 != 1024);
    v61 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
    HGBitmapLoader::HGBitmapLoader(v61, v26);
    (*(void (**)(HGGradient *, _QWORD, HGBitmapLoader *))(*(_QWORD *)v34 + 120))(v34, 0, v61);
    v64 = v34;
    (*(void (**)(HGGradient *))(*(_QWORD *)v34 + 16))(v34);
    FxApplyGradientBlendRequest(&v81, &v64, &v65);
    if (v64)
      (*(void (**)(HGGradient *))(*(_QWORD *)v64 + 24))(v64);
    v62 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
    HGHWBlendFlipped::HGHWBlendFlipped(v62);
    (*(void (**)(HGHWBlendFlipped *, _QWORD, uint64_t))(*(_QWORD *)v62 + 120))(v62, 0, v81);
    (*(void (**)(HGHWBlendFlipped *, uint64_t, HGradientBlend *))(*(_QWORD *)v62 + 120))(v62, 1, v65);
    (*(void (**)(HGHWBlendFlipped *, _QWORD, float, float, float, float))(*(_QWORD *)v62 + 96))(v62, 0, 8.0, 0.0, 0.0, 0.0);
    v63 = v18;
    (*(void (**)(HGHWBlendFlipped *, uint64_t, float, float, float, float))(*(_QWORD *)v62 + 96))(v62, 1, v63, 0.0, 0.0, 0.0);
    (*(void (**)(HGHWBlendFlipped *, uint64_t, float, float, float, float))(*(_QWORD *)v62 + 96))(v62, 2, 0.0, 0.0, 0.0, 0.0);
    v64 = v62;
    (*(void (**)(HGHWBlendFlipped *))(*(_QWORD *)v62 + 16))(v62);
    objc_msgSend(a3, "setHeliumRef:", &v64);
    if (v64)
      (*(void (**)(HGGradient *))(*(_QWORD *)v64 + 24))(v64);
    (*(void (**)(HGHWBlendFlipped *))(*(_QWORD *)v62 + 24))(v62);
    if (v65)
      (*(void (**)(HGradientBlend *))(*(_QWORD *)v65 + 24))(v65);
    if (v61)
      (*(void (**)(HGBitmapLoader *))(*(_QWORD *)v61 + 24))(v61);
    (*(void (**)(HGGradient *))(*(_QWORD *)v34 + 24))(v34);
    if (v26)
      (*(void (**)(HGBitmap *))(*(_QWORD *)v26 + 24))(v26);
  }
  else
  {
    v69 = 0.0;
    v68[0] = 0.0;
    v80 = 0.0;
    objc_msgSend(v9, "getRedValue:greenValue:blueValue:fromParm:atFxTime:", &v69, v68, &v80, 2, a5->var0.var1);
    *(double *)&v36 = COERCE_DOUBLE(HGObject::operator new(0x1A0uLL));
    HgcFillColor::HgcFillColor(v36);
    (*(void (**)(HgcFillColor *, _QWORD, uint64_t))(*(_QWORD *)v36 + 120))(v36, 0, v81);
    v37 = v69;
    v38 = v68[0];
    v39 = v80;
    (*(void (**)(HgcFillColor *, _QWORD, float, float, float, float))(*(_QWORD *)v36 + 96))(v36, 0, v37, v38, v39, 0.0);
    v40 = v18;
    (*(void (**)(HgcFillColor *, uint64_t, float, float, float, float))(*(_QWORD *)v36 + 96))(v36, 1, v40, 0.0, 0.0, 0.0);
    v79 = *(double *)&v36;
    (*(void (**)(HgcFillColor *))(*(_QWORD *)v36 + 16))(v36);
    objc_msgSend(a3, "setHeliumRef:", &v79);
    if (v79 != 0.0)
      (*(void (**)(double))(**(_QWORD **)&v79 + 24))(COERCE_DOUBLE(*(_QWORD *)&v79));
    (*(void (**)(HgcFillColor *))(*(_QWORD *)v36 + 24))(v36);
  }
  if (v81)
    (*(void (**)(uint64_t))(*(_QWORD *)v81 + 24))(v81);
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
