@implementation PAEGradient

- (PAEGradient)initWithAPIManager:(id)a3
{
  PAEGradient *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEGradient;
  result = -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
  if (result)
    *(_DWORD *)(&result->super.super._hostIsVertigo + 2) = 0;
  return result;
}

- (BOOL)initPAEGradientWithHeight:(id)a3
{
  void *v5;
  uint64_t v6;
  BOOL v7;
  BOOL v8;
  void *v9;
  double v10;
  double v11;
  __int128 v13;
  uint64_t v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v5 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A7358);
  v6 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A4BC8);
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  v8 = !v7;
  if (!v7)
  {
    v9 = (void *)v6;
    v18 = 0.0;
    v19 = 0.0;
    v16 = 0.0;
    v17 = 0.0;
    v15 = 0;
    v13 = *MEMORY[0x1E0CA2E68];
    v14 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    objc_msgSend(v5, "getGradientStartEnd:startY:endX:endY:type:fromParm:atFxTime:", &v19, &v18, &v17, &v16, &v15, 310, &v13);
    objc_msgSend(a3, "doubleValue");
    v18 = v10 * 0.5;
    objc_msgSend(a3, "doubleValue");
    v16 = v11 * -0.5;
    objc_msgSend(v9, "setGradientStartEnd:startY:endX:endY:toParm:atTime:", 310, &v13, v19, v18, v17);
  }
  return v8;
}

- (id)properties
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v2)
  {
    if (objc_msgSend(v2, "versionAtCreation") < 3)
      v3 = 1;
    else
      v3 = 3;
  }
  else
  {
    v3 = 1;
  }
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 65792);
  v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 590080);
  return (id)objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", v5, CFSTR("MayRemapTime"), v6, CFSTR("SupportsLargeRenderScale"), v7, CFSTR("SupportsHeliumRendering"), v8, CFSTR("PixelTransformSupport"), v9, CFSTR("SDRWorkingSpace"), v10, CFSTR("HDRWorkingSpace"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 3), CFSTR("AutoColorProcessingSupport"), 0);
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;
  char v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PAEGradient;
  -[PAESharedDefaultBase addParameters](&v12, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A6DD0);
  v4 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A4A30);
  v5 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  v7 = v6 || v5 == 0;
  v8 = v7;
  if (!v7)
  {
    v9 = (void *)v5;
    v10 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v4, "addGradientPositionedWithName:parmId:parmFlags:", objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Gradient::Gradient"), 0, 0), 310, 0);
    if (objc_msgSend(v9, "versionAtCreation"))
      objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Gradient::End Condition"), 0, 0), 2, 0, objc_msgSend((id)objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Gradient::End Condition Options"), 0, 0), "componentsSeparatedByString:", CFSTR("|")), 5);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Gradient::Equirect"), 0, 0), 3, 0, 1);
  }
  return v8 ^ 1;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v11;
  uint64_t v12;
  unsigned int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;

  v5 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v5)
  {
    if (!objc_msgSend(v5, "versionAtCreation"))
    {
LABEL_20:
      LOBYTE(v5) = 1;
      return (char)v5;
    }
    v6 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
    v7 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A7358);
    v8 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A7268);
    if (v6)
      v9 = v8 == 0;
    else
      v9 = 1;
    if (!v9 && v7 != 0)
    {
      v11 = (void *)v8;
      v20 = *MEMORY[0x1E0CA2E68];
      v21 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
      if (a3 == 3)
      {
        LOBYTE(v18) = 0;
        objc_msgSend(v6, "getBoolValue:fromParm:atFxTime:", &v18, 3, &v20);
        LODWORD(v19) = 0;
        objc_msgSend(v6, "getParameterFlags:fromParm:", &v19, 2);
        if ((_BYTE)v18)
          v12 = 4;
        else
          v12 = 4 * (*(_DWORD *)(&self->super.super._hostIsVertigo + 2) == 0);
        objc_msgSend(v11, "setParameterFlags:toParm:", v12, 2);
        objc_msgSend(v11, "setGradientFlags:toParam:", (_BYTE)v18 == 0, 310);
      }
      else if (a3 == 310)
      {
        v18 = 0;
        v19 = 0;
        v16 = 0;
        v17 = 0;
        v15 = 0;
        objc_msgSend(v7, "getGradientStartEnd:startY:endX:endY:type:fromParm:atFxTime:", &v19, &v18, &v17, &v16, &v15, 310, &v20);
        v14 = 0;
        objc_msgSend(v6, "getParameterFlags:fromParm:", &v14, 2);
        if (*(_DWORD *)(&self->super.super._hostIsVertigo + 2) != v15)
        {
          v14 = v14 & 0xFFFFFFFB | (4 * (v15 == 0));
          objc_msgSend(v11, "setParameterFlags:toParm:");
          *(_DWORD *)(&self->super.super._hostIsVertigo + 2) = v15;
        }
      }
      goto LABEL_20;
    }
    LOBYTE(v5) = 0;
  }
  return (char)v5;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInfo:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v13;
  int v14;
  uint64_t i;
  _OWORD *v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  HGBitmap *v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char v28;
  unint64_t v29;
  unint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  HGradientRadial *v38;
  unint64_t v39;
  unint64_t v40;
  float v41;
  float v42;
  float v43;
  float v44;
  HgcRadialMask *v45;
  float v46;
  float v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float v52;
  float v53;
  float v54;
  float v55;
  float v56;
  __n128 v58;
  BOOL v59;
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
  HGBitmapLoader *v79;
  HGradientRadial *v80;
  char v81;
  int v82;
  int v83;
  double v84;
  double v85;
  double v86;
  double v87[16];
  double v88;
  __int128 v89;
  __int128 v90;
  double v91;
  __int128 v92;
  __int128 v93;
  uint64_t v94;
  __int128 v95;
  __int128 v96;
  double v97;

  v7 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v8 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A7358);
  v9 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A3A58);
  v10 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190);
  if (v7)
    v11 = v8 == 0;
  else
    v11 = 1;
  if (v11 || v10 == 0)
    return 0;
  v13 = (void *)v10;
  if (objc_msgSend(a3, "imageType") != 3)
    return 0;
  v14 = objc_msgSend(v13, "versionAtCreation");
  v97 = 1.0;
  v94 = 0x3FF0000000000000;
  v91 = 1.0;
  v88 = 1.0;
  v89 = 0u;
  v90 = 0u;
  v92 = 0u;
  v93 = 0u;
  v95 = 0u;
  v96 = 0u;
  if (v9)
  {
    objc_msgSend(v9, "inversePixelTransform");
    for (i = 0; i != 16; i += 4)
    {
      v16 = (_OWORD *)((char *)&v88 + i * 8);
      v17 = *(_OWORD *)&v87[i + 2];
      *v16 = *(_OWORD *)&v87[i];
      v16[1] = v17;
    }
  }
  v18 = HGRectMake4i(0, 0, 0x400u, 1u);
  v20 = v19;
  v21 = (HGBitmap *)HGObject::operator new(0x80uLL);
  *(_QWORD *)&v22 = HGBitmap::HGBitmap(v21, v18, v20, 24).n128_u64[0];
  v23 = *((_QWORD *)v21 + 10);
  objc_msgSend(v8, "getGradientSamples:numSamples:depth:fromParm:atFxTime:", v23, 1024, 8, 310, a4->var0.var1, v22);
  v24 = 0;
  v25 = v23;
  do
  {
    v26 = 0;
    v27 = (char *)(v23 + 4 * v24);
    v28 = *v27;
    do
    {
      *(_BYTE *)(v25 + v26) = *(_BYTE *)(v25 + v26 + 1);
      ++v26;
    }
    while (v26 != 3);
    v27[3] = v28;
    ++v24;
    v25 += 4;
  }
  while (v24 != 1024);
  v86 = 0.0;
  v87[0] = 0.0;
  v84 = 0.0;
  v85 = 0.0;
  v83 = 0;
  objc_msgSend(v8, "getGradientStartEnd:startY:endX:endY:type:fromParm:atFxTime:", v87, &v86, &v85, &v84, &v83, 310, a4->var0.var1);
  v82 = 0;
  if (v14)
    objc_msgSend(v7, "getIntValue:fromParm:atFxTime:", &v82, 2, a4->var0.var1);
  v81 = 0;
  objc_msgSend(v7, "getBoolValue:fromParm:atFxTime:", &v81, 3, a4->var0.var1);
  if (v81)
  {
    v83 = 0;
    v29 = objc_msgSend(a3, "height");
    v30 = objc_msgSend(a3, "height");
    v31 = (double)v29 * 0.5;
    v32 = (double)v30 * -0.5;
    v33 = v97 + *((double *)&v95 + 1) * 0.0 + v31 * *(double *)&v96;
    v34 = v97 + *((double *)&v95 + 1) * 0.0 + v32 * *(double *)&v96;
    v86 = (*((double *)&v92 + 1) + *((double *)&v90 + 1) * 0.0 + v31 * v91) / v33;
    v87[0] = (*(double *)&v90 + v88 * 0.0 + v31 * *(double *)&v89) / v33;
    v84 = (*((double *)&v92 + 1) + *((double *)&v90 + 1) * 0.0 + v32 * v91) / v34;
    v85 = (*(double *)&v90 + v88 * 0.0 + v32 * *(double *)&v89) / v34;
  }
  objc_msgSend(a3, "pixelAspect");
  v36 = v35;
  v80 = 0;
  v37 = sqrt(v36 * (v85 - v87[0]) * (v36 * (v85 - v87[0])) + (v84 - v86) * (v84 - v86));
  if (PCMatrix44Tmpl<double>::isIdentity(&v88))
  {
    if (v83)
    {
      v38 = (HGradientRadial *)HGObject::operator new(0x1A0uLL);
      HGradientRadial::HGradientRadial(v38);
      if (v38)
        v80 = v38;
      v39 = objc_msgSend(a3, "width");
      v87[0] = (double)v39 * 0.5 + v87[0];
      v40 = objc_msgSend(a3, "height");
      v86 = (double)v40 * 0.5 + v86;
      v41 = v87[0];
      v42 = v86;
      (*(void (**)(HGradientRadial *, _QWORD, float, float, float, float))(*(_QWORD *)v38 + 96))(v38, 0, v41, v42, 0.0, 0.0);
      v43 = fabs(v37);
      (*(void (**)(HGradientRadial *, uint64_t, float, float, float, float))(*(_QWORD *)v38 + 96))(v38, 1, 0.0, v43, 1024.0, 1023.0);
      v44 = v36;
      (*(void (**)(HGradientRadial *, uint64_t, float, float, float, float))(*(_QWORD *)v38 + 96))(v38, 2, v44, 1.0, 1.0, 1.0);
      if (!v14 || v82 == 1)
      {
        v45 = (HgcRadialMask *)HGObject::operator new(0x1A0uLL);
        HgcRadialMask::HgcRadialMask(v45);
        (*(void (**)(HgcRadialMask *, _QWORD, float, float, float, float))(*(_QWORD *)v45 + 96))(v45, 0, v44, 1.0, 1.0, 1.0);
        v46 = v87[0];
        v47 = v86;
        (*(void (**)(HgcRadialMask *, uint64_t, float, float, float, float))(*(_QWORD *)v45 + 96))(v45, 1, v46, v47, 0.0, 0.0);
        (*(void (**)(HgcRadialMask *, uint64_t, float, float, float, float))(*(_QWORD *)v45 + 96))(v45, 2, v43, 0.0, 0.0, 0.0);
        v48 = v88;
        v49 = *(double *)&v89;
        v50 = *(double *)&v90;
        (*(void (**)(HgcRadialMask *, uint64_t, float, float, float, float))(*(_QWORD *)v45 + 96))(v45, 3, v48, v49, 0.0, v50);
        v51 = *((double *)&v90 + 1);
        v52 = v91;
        v53 = *((double *)&v92 + 1);
        (*(void (**)(HgcRadialMask *, uint64_t, float, float, float, float))(*(_QWORD *)v45 + 96))(v45, 4, v51, v52, 0.0, v53);
        v54 = *((double *)&v95 + 1);
        v55 = *(double *)&v96;
        v56 = v97;
        (*(void (**)(HgcRadialMask *, uint64_t, float, float, float, float))(*(_QWORD *)v45 + 96))(v45, 5, v54, v55, 0.0, v56);
        (*(void (**)(HgcRadialMask *, _QWORD, HGradientRadial *))(*(_QWORD *)v45 + 120))(v45, 0, v38);
        if (v38 != v45)
        {
          (*(void (**)(HGradientRadial *))(*(_QWORD *)v38 + 24))(v38);
          v80 = v45;
          (*(void (**)(HgcRadialMask *))(*(_QWORD *)v45 + 16))(v45);
          v38 = v45;
        }
        (*(void (**)(HgcRadialMask *))(*(_QWORD *)v45 + 24))(v45);
      }
    }
    else
    {
      v38 = (HGradientRadial *)HGObject::operator new(0x1A0uLL);
      HGradientLinear::HGradientLinear(v38);
      if (v38)
        v80 = v38;
      v61 = v87[0];
      v62 = v86;
      (*(void (**)(HGradientRadial *, _QWORD, float, float, float, float))(*(_QWORD *)v38 + 96))(v38, 0, v61, v62, 0.0, 0.0);
      v63 = v85;
      v64 = v84;
      (*(void (**)(HGradientRadial *, uint64_t, float, float, float, float))(*(_QWORD *)v38 + 96))(v38, 1, v63, v64, 0.0, 0.0);
      (*(void (**)(HGradientRadial *, uint64_t, float, float, float, float))(*(_QWORD *)v38 + 96))(v38, 2, 1024.0, 1023.0, 0.0, 0.0);
    }
  }
  else
  {
    v38 = (HGradientRadial *)HGObject::operator new(0x210uLL);
    HGGradient::HGGradient(v38);
    if (v38)
    {
      v80 = v38;
      (*(void (**)(HGradientRadial *))(*(_QWORD *)v38 + 16))(v38);
    }
    if (v83)
    {
      HGGradient::SetGradientMode((uint64_t)v38, 1);
      v59 = v82 == 1 || v14 == 0;
      v58.n128_u32[0] = 1.0;
      if (!v59)
        v58.n128_f32[0] = 0.0;
      v60 = v37;
      (*(void (**)(HGradientRadial *, uint64_t, float, __n128, float, float))(*(_QWORD *)v38 + 96))(v38, 2, fabsf(v60), v58, 0.0, 0.0);
    }
    else
    {
      HGGradient::SetGradientMode((uint64_t)v38, 0);
      v65 = v85;
      v66 = v84;
      (*(void (**)(HGradientRadial *, uint64_t, float, float, float, float))(*(_QWORD *)v38 + 96))(v38, 2, v65, v66, 0.0, 0.0);
    }
    v67 = v36;
    (*(void (**)(HGradientRadial *, _QWORD, float, float, float, float))(*(_QWORD *)v38 + 96))(v38, 0, v67, 1.0, 1.0, 1.0);
    v68 = v87[0];
    v69 = v86;
    (*(void (**)(HGradientRadial *, uint64_t, float, float, float, float))(*(_QWORD *)v38 + 96))(v38, 1, v68, v69, 0.0, 0.0);
    v70 = v88;
    v71 = *(double *)&v89;
    v72 = *(double *)&v90;
    (*(void (**)(HGradientRadial *, uint64_t, float, float, float, float))(*(_QWORD *)v38 + 96))(v38, 3, v70, v71, 0.0, v72);
    v73 = *((double *)&v90 + 1);
    v74 = v91;
    v75 = *((double *)&v92 + 1);
    (*(void (**)(HGradientRadial *, uint64_t, float, float, float, float))(*(_QWORD *)v38 + 96))(v38, 4, v73, v74, 0.0, v75);
    v76 = *((double *)&v95 + 1);
    v77 = *(double *)&v96;
    v78 = v97;
    (*(void (**)(HGradientRadial *, uint64_t, float, float, float, float))(*(_QWORD *)v38 + 96))(v38, 5, v76, v77, 0.0, v78);
    (*(void (**)(HGradientRadial *))(*(_QWORD *)v38 + 24))(v38);
  }
  v79 = (HGBitmapLoader *)HGObject::operator new(0x1F0uLL);
  HGBitmapLoader::HGBitmapLoader(v79, v21);
  (*(void (**)(HGradientRadial *, _QWORD, HGBitmapLoader *))(*(_QWORD *)v38 + 120))(v38, 0, v79);
  objc_msgSend(a3, "setHeliumRef:", &v80);
  if (v79)
    (*(void (**)(HGBitmapLoader *))(*(_QWORD *)v79 + 24))(v79);
  if (v80)
    (*(void (**)(HGradientRadial *))(*(_QWORD *)v80 + 24))(v80);
  if (v21)
    (*(void (**)(HGBitmap *))(*(_QWORD *)v21 + 24))(v21);
  return 1;
}

- (BOOL)frameSetup:(id *)a3 hardware:(BOOL *)a4 software:(BOOL *)a5
{
  __int128 v5;
  _OWORD v7[3];

  *a5 = 0;
  *a4 = 1;
  v5 = *(_OWORD *)&a3->var2;
  v7[0] = *(_OWORD *)&a3->var0.var0;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a3->var4;
  -[PAESharedDefaultBase overrideFrameSetupForRenderMode:hardware:software:](self, "overrideFrameSetupForRenderMode:hardware:software:", v7);
  return 1;
}

@end
