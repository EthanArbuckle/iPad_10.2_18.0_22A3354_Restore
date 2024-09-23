@implementation PAEPageCurlTransition

- (BOOL)addParameters
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  int v9;
  objc_super v11;

  v3 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A4260);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PageCurl::Right"), 0, 0), objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PageCurl::Left"), 0, 0), objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PageCurl::Custom"), 0, 0), 0);
    objc_msgSend(v4, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PageCurl::Direction Preset"), 0, 0), 1, 0, v6, 1);

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Transition Direction::Open"), 0, 0), objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Transition Direction::Close"), 0, 0), objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Transition Direction::Automatic Direction"), 0, 0), 0);
    objc_msgSend(v4, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Transition Direction::Direction"), 0, 0), 9, 2, v7, 1);

    v8 = objc_msgSend((id)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190), "versionAtCreation");
    self->super._initGap = v8;
    LOBYTE(v3) = 0;
    if (v9)
    {
      v11.receiver = self;
      v11.super_class = (Class)PAEPageCurlTransition;
      LOBYTE(v3) = -[PAETransitionDefaultBase addParameters](&v11, sel_addParameters);
    }
  }
  return v3;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  BOOL v9;
  int v11;
  __int128 v12;
  uint64_t v13;

  if (a3 == 1)
  {
    v4 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A7268);
    v5 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
    v12 = *MEMORY[0x1E0CA2E68];
    v13 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v11 = 0;
    if (objc_msgSend(v5, "getIntValue:fromParm:atFxTime:", &v11, 1, &v12))
    {
      if (!v11)
      {
        v6 = -0.41887902;
        v7 = -0.314159265;
        goto LABEL_10;
      }
      if (v11 == 1)
      {
        v6 = 0.41887902;
        v7 = 3.45575192;
LABEL_10:
        objc_msgSend(v4, "setFloatValue:toParm:atFxTime:", 2, &v12, v7);
        objc_msgSend(v4, "setFloatValue:toParm:atFxTime:", 3, &v12, v6);
      }
      return 1;
    }
    return 0;
  }
  else
  {
    if ((a3 & 0xFFFFFFFE) != 2)
      return 1;
    v8 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A7268);
    v12 = *MEMORY[0x1E0CA2E68];
    v13 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v9 = 1;
    objc_msgSend(v8, "setIntValue:toParm:atFxTime:", 2, 1, &v12);
  }
  return v9;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInputA:(id)a4 withInputB:(id)a5 withTimeFraction:(float)a6 withSpeed:(float)a7 withInfo:(id *)a8
{
  FxHeliumImage *v11;
  void *v14;
  BOOL v15;
  int v17;
  int v18;
  int v19;
  HGSolidColor *v20;
  __n128 v21;
  __n128 v22;
  HGCrop *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  FxHeliumImage *v27;
  FxHeliumImage *v28;
  int v29;
  int v30;
  HGSolidColor *v31;
  __n128 v32;
  __n128 v33;
  HGCrop *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  FxHeliumImage *v38;
  id v39;
  float v40;
  id v41;
  id v42;
  HGHWMultiBlend *v43;
  HGHWBlendFlipped *v44;
  int v45;
  int v46;
  HGHWBlendFlipped *v47;
  uint64_t v48;
  _OWORD v49[4];
  uint64_t v50;
  HGHWMultiBlend *v51;
  _OWORD v52[4];
  uint64_t v53;
  int v54[3];

  v11 = (FxHeliumImage *)a4;
  if (objc_msgSend(a4, "imageType") != 3)
    return 0;
  if (objc_msgSend(a5, "imageType") != 3)
    return 0;
  if (objc_msgSend(a3, "imageType") != 3)
    return 0;
  v14 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (!v14)
    return 0;
  v54[0] = 0;
  objc_msgSend(v14, "getIntValue:fromParm:atFxTime:", v54, 9, a8->var0.var1);
  if (v54[0] == 2)
    v54[0] = -[PAETransitionDefaultBase isFrontGap](self, "isFrontGap");
  v17 = 9;
  if (-[PAETransitionDefaultBase isFrontGap](self, "isFrontGap"))
  {
    v18 = v54[0];
    if (v54[0])
      v19 = 9;
    else
      v19 = 31;
    v45 = v19;
    v20 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
    HGSolidColor::HGSolidColor(v20);
    v22.n128_u32[0] = 0;
    if (v18)
      v21.n128_f32[0] = 0.0;
    else
      v21.n128_f32[0] = 1.0;
    (*(void (**)(HGSolidColor *, _QWORD, __n128, float, float, __n128))(*(_QWORD *)v20 + 96))(v20, 0, v22, 0.0, 0.0, v21);
    v23 = (HGCrop *)HGObject::operator new(0x1A0uLL);
    HGCrop::HGCrop(v23);
    v24 = HGRectMake4f(1141309440, -960.0, -540.0, 960.0, 540.0);
    v26 = v25;
    (*(void (**)(HGCrop *, _QWORD, HGSolidColor *))(*(_QWORD *)v23 + 120))(v23, 0, v20);
    (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v23 + 96))(v23, 0, (float)(int)v24, (float)SHIDWORD(v24), (float)(int)v26, (float)SHIDWORD(v26));
    v27 = [FxHeliumImage alloc];
    if (v11)
    {
      -[FxImage imageInfo](v11, "imageInfo");
    }
    else
    {
      v53 = 0;
      memset(v52, 0, sizeof(v52));
    }
    v51 = v23;
    (*(void (**)(HGCrop *))(*(_QWORD *)v23 + 16))(v23);
    v11 = -[FxHeliumImage initWithInfo:andHeliumRef:](v27, "initWithInfo:andHeliumRef:", v52, &v51);
    if (v51)
      (*(void (**)(HGHWMultiBlend *))(*(_QWORD *)v51 + 24))(v51);
    v28 = v11;
    (*(void (**)(HGCrop *))(*(_QWORD *)v23 + 24))(v23);
    (*(void (**)(HGSolidColor *))(*(_QWORD *)v20 + 24))(v20);
    v17 = v45;
  }
  if (-[PAETransitionDefaultBase isEndGap](self, "isEndGap"))
  {
    v29 = v54[0];
    if (v54[0] == 1)
      v30 = 31;
    else
      v30 = 9;
    v46 = v30;
    v31 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
    HGSolidColor::HGSolidColor(v31);
    v33.n128_u32[0] = 0;
    if (v29 == 1)
      v32.n128_f32[0] = 1.0;
    else
      v32.n128_f32[0] = 0.0;
    (*(void (**)(HGSolidColor *, _QWORD, __n128, float, float, __n128))(*(_QWORD *)v31 + 96))(v31, 0, v33, 0.0, 0.0, v32);
    v34 = (HGCrop *)HGObject::operator new(0x1A0uLL);
    HGCrop::HGCrop(v34);
    v35 = HGRectMake4f(1141309440, -960.0, -540.0, 960.0, 540.0);
    v37 = v36;
    (*(void (**)(HGCrop *, _QWORD, HGSolidColor *))(*(_QWORD *)v34 + 120))(v34, 0, v31);
    (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v34 + 96))(v34, 0, (float)(int)v35, (float)SHIDWORD(v35), (float)(int)v37, (float)SHIDWORD(v37));
    v38 = [FxHeliumImage alloc];
    if (a5)
    {
      objc_msgSend(a5, "imageInfo");
    }
    else
    {
      v50 = 0;
      memset(v49, 0, sizeof(v49));
    }
    v51 = v34;
    (*(void (**)(HGCrop *))(*(_QWORD *)v34 + 16))(v34);
    a5 = -[FxHeliumImage initWithInfo:andHeliumRef:](v38, "initWithInfo:andHeliumRef:", v49, &v51);
    if (v51)
      (*(void (**)(HGHWMultiBlend *))(*(_QWORD *)v51 + 24))(v51);
    v39 = a5;
    (*(void (**)(HGCrop *))(*(_QWORD *)v34 + 24))(v34);
    (*(void (**)(HGSolidColor *))(*(_QWORD *)v31 + 24))(v31);
    v17 = v46;
  }
  v40 = 1.0 - a6;
  if (v54[0] == 1)
    v41 = v11;
  else
    v41 = a5;
  if (v54[0] == 1)
    v42 = a5;
  else
    v42 = v11;
  if (v54[0] != 1)
    v40 = a6;
  v43 = v51;
  v15 = v51 != 0;
  if (v51)
  {
    if (v41)
      objc_msgSend(v41, "heliumRef");
    else
      v48 = 0;
    v44 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
    HGHWBlendFlipped::HGHWBlendFlipped(v44);
    v47 = v44;
    (*(void (**)(HGHWBlendFlipped *, _QWORD, float, float, float, float))(*(_QWORD *)v44 + 96))(v44, 0, (float)v17, 0.0, 0.0, 0.0);
    -[PAESharedDefaultBase getBlendingGamma](self, "getBlendingGamma");
    (*(void (**)(HGHWBlendFlipped *, uint64_t))(*(_QWORD *)v44 + 96))(v44, 5);
    (*(void (**)(HGHWBlendFlipped *, _QWORD, HGHWMultiBlend *))(*(_QWORD *)v44 + 120))(v44, 0, v43);
    (*(void (**)(HGHWBlendFlipped *, uint64_t, uint64_t))(*(_QWORD *)v44 + 120))(v44, 1, v48);
    objc_msgSend(a3, "setHeliumRef:", &v47);
    if (v47)
      (*(void (**)(HGHWBlendFlipped *))(*(_QWORD *)v47 + 24))(v47);
    if (v48)
      (*(void (**)(uint64_t))(*(_QWORD *)v48 + 24))(v48);
    (*(void (**)(HGHWMultiBlend *))(*(_QWORD *)v43 + 24))(v43);
  }
  return v15;
}

- (void)observeNotification:(id)a3
{
  void *v5;

  v5 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", kFxNotificationName_NotificationTypeKey);
  if (self->super._initGap >= 2u)
  {
    if (objc_msgSend(v5, "isEqualToString:", kFxNotificationName_ColorModelChanged))
      -[PAETransitionDefaultBase showHideHDRWhiteLevelParameterForColorModel:](self, "showHideHDRWhiteLevelParameterForColorModel:", objc_msgSend(a3, "objectForKeyedSubscript:", kFxNotificationKey_ColorModel));
  }
}

@end
