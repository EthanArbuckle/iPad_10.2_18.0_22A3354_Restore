@implementation PAEAddNoise

- (PAEAddNoise)initWithAPIManager:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PAEAddNoise;
  return -[PAESharedDefaultBase initWithAPIManager:](&v4, sel_initWithAPIManager_, a3);
}

- (BOOL)variesOverTime
{
  return 1;
}

- (BOOL)addParameters
{
  void *v3;
  void *v4;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PAEAddNoise;
  -[PAESharedDefaultBase addParameters](&v7, sel_addParameters);
  v3 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A41C0);
  if (v3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    objc_msgSend(v3, "addFloatSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddNoise::Amount"), 0, 0), 1, 0, 0.33, 0.0, 4.0, 0.0, 1.0, 0.1);
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddNoise::Type"), 0, 0), 2, 1, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddNoise::TVNoise"), 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddNoise::WhiteNoise"), 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddNoise::GaussianNoise"), 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddNoise::BlueNoise"), 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddNoise::PinkNoise"), 0, 0), 0), 1);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddNoise::Monochrome"), 0, 0), 3, 0, 1);
    objc_msgSend(v3, "addPopupMenuWithName:parmId:defaultValue:menuEntries:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddNoise::BlendMode"), 0, 0), 4, 0, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddNoise::NormalMode"), 0, 0), CFSTR("-"), objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddNoise::SubtractMode"), 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddNoise::MultiplyMode"), 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddNoise::DarkenMode"), 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddNoise::ColorBurnMode"), 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddNoise::LinearBurnMode"), 0, 0), CFSTR("-"), objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddNoise::AddMode"), 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddNoise::LightenMode"), 0, 0), objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddNoise::ScreenMode"), 0, 0),
        objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddNoise::ColorDodgeMode"), 0, 0),
        objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddNoise::LinearDodgeMode"), 0, 0),
        CFSTR("-"),
        objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddNoise::OverlayMode"), 0, 0),
        objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddNoise::SoftLightMode"), 0, 0),
        objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddNoise::HardLightMode"), 0, 0),
        objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddNoise::VividLightMode"), 0, 0),
        objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddNoise::LinearLightMode"), 0, 0),
        objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddNoise::PinLightMode"), 0, 0),
        objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddNoise::HardMixMode"), 0, 0),
        CFSTR("-"),
        objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddNoise::DifferenceMode"), 0, 0),
        objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddNoise::ExclusionMode"), 0, 0),
        0),
      1);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddNoise::Autoanimate"), 0, 0), 5, 1, 1);
    LODWORD(v6) = 4;
    objc_msgSend(v3, "addIntSliderWithName:parmId:defaultValue:parameterMin:parameterMax:sliderMin:sliderMax:delta:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddNoise::RandomSeed"), 0, 0), 6, 25, 2294967296, 2000000000, 1, 0x1000003E8, v6);
    objc_msgSend(v3, "addToggleButtonWithName:parmId:defaultValue:parmFlags:", objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AddNoise::RandomSeed"), 0, 0), 7, 0, 2);
  }
  return v3 != 0;
}

- (BOOL)parameterChanged:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  uint64_t v7;
  BOOL v8;
  void *v10;
  int v11;
  unsigned __int8 v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (a3 != 5)
    return 1;
  v15 = v3;
  v16 = v4;
  v6 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  v7 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A7268);
  if (v6)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
    return 0;
  v10 = (void *)v7;
  v13 = *MEMORY[0x1E0CA2E18];
  v14 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v12 = 0;
  if (objc_msgSend(v6, "getBoolValue:fromParm:atFxTime:", &v12, 5, &v13))
  {
    v11 = 0;
    objc_msgSend(v6, "getParameterFlags:fromParm:", &v11, 6);
    objc_msgSend(v10, "setParameterFlags:toParm:", v11 & 0xFFFFFFFB | (4 * v12), 6);
  }
  return 1;
}

- (HGRef<HGNode>)translateNode:(HGRef<HGNode>)a3 byAmount:(PCVector2<double>)a4 andCropTo:(HGRect)a5
{
  uint64_t v5;
  HGCrop **v6;
  uint64_t v7;
  uint64_t v8;
  double *v9;
  HGCrop **v11;
  HGXForm *v12;
  HGCrop *v13;
  HGRef<HGNode> v14;
  _BYTE v15[144];

  v7 = v5;
  v8 = *(_QWORD *)&a5.var2;
  v9 = *(double **)&a5.var0;
  v11 = v6;
  HGTransform::HGTransform((HGTransform *)v15);
  HGTransform::LoadIdentity((HGTransform *)v15);
  HGTransform::Translate((HGTransform *)v15, *v9, v9[1], 0.0);
  v12 = (HGXForm *)HGObject::operator new(0x210uLL);
  HGXForm::HGXForm(v12);
  (*(void (**)(HGXForm *, _QWORD, _QWORD))(*(_QWORD *)v12 + 120))(v12, 0, *(_QWORD *)a3.var0);
  (*(void (**)(HGXForm *, _BYTE *))(*(_QWORD *)v12 + 576))(v12, v15);
  v13 = (HGCrop *)HGObject::operator new(0x1A0uLL);
  HGCrop::HGCrop(v13);
  (*(void (**)(HGCrop *, _QWORD, HGXForm *))(*(_QWORD *)v13 + 120))(v13, 0, v12);
  (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v13 + 96))(v13, 0, (float)(int)v8, (float)SHIDWORD(v8), (float)(int)v7, (float)SHIDWORD(v7));
  *v11 = v13;
  (*(void (**)(HGXForm *))(*(_QWORD *)v12 + 24))(v12);
  HGTransform::~HGTransform((HGTransform *)v15);
  return v14;
}

- (HGRef<HGNode>)noiseNodeWithWidth:(int)a3 height:(int)a4 noiseType:(int)a5 isMono:(BOOL)a6 frameNum:(double)a7 autoAnimate:(BOOL)a8 randomSeed:(int)a9 inputPixelTransform:(PCMatrix44Tmpl<double> *)a10 outputPixelTransform:(PCMatrix44Tmpl<double> *)a11 outputInvPixelTransform:(PCMatrix44Tmpl<double> *)a12 is360:(BOOL)a13
{
  uint64_t *v13;
  uint64_t *v16;
  HGCrop *v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  float64x2_t v25;
  double v26;
  HSampleTiledNoise *v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  HRenderToEquirect *v34;
  HRenderToEquirect *v35;
  _QWORD v36[2];
  HSampleTiledNoise *v37;
  uint64_t v38;
  _QWORD v39[2];
  HSampleTiledNoise *v40;
  uint64_t v41;
  _QWORD v42[2];
  HSampleTiledNoise *v43;
  uint64_t v44;
  _QWORD v45[2];
  HSampleTiledNoise *v46;
  uint64_t v47;
  double v48[2];
  HSampleTiledNoise *v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  HSampleTiledNoise *v61;

  v16 = v13;
  *v13 = 0;
  if (a13)
  {
    PAEGenerateNoise(3 * a4 / 2, a4, a5, a6, a8, a9, &v61, 1.0, a7);
    v18 = (HGCrop *)HGObject::operator new(0x1A0uLL);
    HGCrop::HGCrop(v18);
    if (a4 >= 0)
      v19 = a4;
    else
      v19 = a4 + 1;
    v20 = v19 >> 1;
    v21 = HGRectMake4i(0, 0, v19 >> 1, v19 >> 1);
    v23 = v22;
    (*(void (**)(HGCrop *, _QWORD, HSampleTiledNoise *))(*(_QWORD *)v18 + 120))(v18, 0, v61);
    (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v18 + 96))(v18, 0, (float)(int)v21, (float)SHIDWORD(v21), (float)(int)v23, (float)SHIDWORD(v23));
    v60 = 0x3FF0000000000000;
    v57 = 0x3FF0000000000000;
    v54 = 0x3FF0000000000000;
    v51 = 0x3FF0000000000000;
    v52 = 0u;
    v53 = 0u;
    v55 = 0u;
    v56 = 0u;
    v58 = 0u;
    v59 = 0u;
    v24 = (double)a4;
    v25 = PCMatrix44Tmpl<double>::leftTranslate((float64x2_t *)&v51, (float64x2_t)COERCE_UNSIGNED_INT64((double)a4 * 0.25), (double)a4 * 0.25, 0.0);
    v49 = v61;
    if (v61)
      (*(void (**)(HSampleTiledNoise *, float64x2_t))(*(_QWORD *)v61 + 16))(v61, v25);
    v26 = v24 * 0.5;
    v48[0] = v24 * 0.5;
    v48[1] = 0.0;
    if (self)
      -[PAEAddNoise translateNode:byAmount:andCropTo:](self, "translateNode:byAmount:andCropTo:", &v49, v48, v21, v23);
    else
      v50 = 0;
    if (v49)
      (*(void (**)(HSampleTiledNoise *))(*(_QWORD *)v49 + 24))(v49);
    v46 = v61;
    if (v61)
      (*(void (**)(HSampleTiledNoise *))(*(_QWORD *)v61 + 16))(v61);
    v28 = v24 * 3.0 * 0.25;
    *(double *)v45 = v28;
    v45[1] = 0;
    if (self)
      -[PAEAddNoise translateNode:byAmount:andCropTo:](self, "translateNode:byAmount:andCropTo:", &v46, v45, v21, v23);
    else
      v47 = 0;
    if (v46)
      (*(void (**)(HSampleTiledNoise *))(*(_QWORD *)v46 + 24))(v46);
    v43 = v61;
    if (v61)
      (*(void (**)(HSampleTiledNoise *))(*(_QWORD *)v61 + 16))(v61);
    *(double *)v42 = v28;
    *(double *)&v42[1] = v26;
    if (self)
      -[PAEAddNoise translateNode:byAmount:andCropTo:](self, "translateNode:byAmount:andCropTo:", &v43, v42, v21, v23);
    else
      v44 = 0;
    if (v43)
      (*(void (**)(HSampleTiledNoise *))(*(_QWORD *)v43 + 24))(v43);
    v40 = v61;
    if (v61)
      (*(void (**)(HSampleTiledNoise *))(*(_QWORD *)v61 + 16))(v61);
    *(double *)v39 = v26;
    *(double *)&v39[1] = v26;
    if (self)
      -[PAEAddNoise translateNode:byAmount:andCropTo:](self, "translateNode:byAmount:andCropTo:", &v40, v39, v21, v23);
    else
      v41 = 0;
    if (v40)
      (*(void (**)(HSampleTiledNoise *))(*(_QWORD *)v40 + 24))(v40);
    v37 = v61;
    if (v61)
      (*(void (**)(HSampleTiledNoise *))(*(_QWORD *)v61 + 16))(v61);
    v36[0] = 0;
    *(double *)&v36[1] = v26;
    if (self)
      -[PAEAddNoise translateNode:byAmount:andCropTo:](self, "translateNode:byAmount:andCropTo:", &v37, v36, v21, v23);
    else
      v38 = 0;
    if (v37)
      (*(void (**)(HSampleTiledNoise *))(*(_QWORD *)v37 + 24))(v37);
    v29 = v41;
    if (v41)
      (*(void (**)(uint64_t))(*(_QWORD *)v41 + 16))(v41);
    v30 = v38;
    if (v38)
      (*(void (**)(uint64_t))(*(_QWORD *)v38 + 16))(v38);
    v31 = v50;
    if (v50)
      (*(void (**)(uint64_t))(*(_QWORD *)v50 + 16))(v50);
    (*(void (**)(HGCrop *))(*(_QWORD *)v18 + 16))(v18);
    v32 = v47;
    if (v47)
      (*(void (**)(uint64_t))(*(_QWORD *)v47 + 16))(v47);
    v33 = v44;
    if (v44)
      (*(void (**)(uint64_t))(*(_QWORD *)v44 + 16))(v44);
    fx_RenderToEquirect((uint64_t)v18, v31, v32, v33, v29, v30, v20, a3, &v35, a4, (double *)a12, (double *)&v51, (double *)&v51, (double *)&v51, (double *)&v51, (double *)&v51, (double *)&v51);
    v34 = v35;
    if (v35)
    {
      *v16 = (uint64_t)v35;
      (*(void (**)(HRenderToEquirect *))(*(_QWORD *)v34 + 16))(v34);
      if (v35)
        (*(void (**)(HRenderToEquirect *))(*(_QWORD *)v35 + 24))(v35);
    }
    if (v33)
      (*(void (**)(uint64_t))(*(_QWORD *)v33 + 24))(v33);
    if (v32)
      (*(void (**)(uint64_t))(*(_QWORD *)v32 + 24))(v32);
    (*(void (**)(HGCrop *))(*(_QWORD *)v18 + 24))(v18);
    if (v31)
      (*(void (**)(uint64_t))(*(_QWORD *)v31 + 24))(v31);
    if (v30)
      (*(void (**)(uint64_t))(*(_QWORD *)v30 + 24))(v30);
    if (v29)
      (*(void (**)(uint64_t))(*(_QWORD *)v29 + 24))(v29);
    if (v38)
      (*(void (**)(uint64_t))(*(_QWORD *)v38 + 24))(v38);
    if (v41)
      (*(void (**)(uint64_t))(*(_QWORD *)v41 + 24))(v41);
    if (v44)
      (*(void (**)(uint64_t))(*(_QWORD *)v44 + 24))(v44);
    if (v47)
      (*(void (**)(uint64_t))(*(_QWORD *)v47 + 24))(v47);
    if (v50)
      (*(void (**)(uint64_t))(*(_QWORD *)v50 + 24))(v50);
    (*(void (**)(HGCrop *))(*(_QWORD *)v18 + 24))(v18);
    v27 = v61;
    if (v61)
      return (HGRef<HGNode>)(*(uint64_t (**)(HSampleTiledNoise *))(*(_QWORD *)v61 + 24))(v61);
  }
  else
  {
    PAEGenerateNoise(a3, a4, a5, a6, a8, a9, (HSampleTiledNoise **)&v51, 1.0, a7);
    if (v51)
      *v16 = v51;
  }
  return (HGRef<HGNode>)v27;
}

- (BOOL)canThrowRenderOutput:(id)a3 withInput:(id)a4 withInfo:(id *)a5
{
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  HGHWBlendFlipped *v17;
  HgcAddNoise *v18;
  float v19;
  __n128 v20;
  HgcAddNoiseNormal *v21;
  float v22;
  __n128 v23;
  float v24;
  HGColorClamp *v25;
  uint64_t v27;
  HGColorClamp *v28;
  HGHWBlendFlipped *v29;
  uint64_t v30;
  _OWORD v31[8];
  _OWORD v32[8];
  _OWORD v33[8];
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _OWORD v51[8];
  int v52;
  unsigned int v53;
  unsigned __int8 v54;
  unsigned __int8 v55;
  unsigned int v56;
  double v57;

  v9 = -[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A70B8);
  if (v9)
  {
    v10 = (void *)v9;
    if (objc_msgSend(a4, "imageType") == 3)
    {
      v57 = 0.33;
      objc_msgSend(v10, "getFloatValue:fromParm:atFxTime:", &v57, 1, a5->var0.var1);
      if (v57 == 0.0)
      {
        if (a4)
          objc_msgSend(a4, "heliumRef", v57);
        else
          *(_QWORD *)&v51[0] = 0;
        objc_msgSend(a3, "setHeliumRef:", v51);
        if (*(_QWORD *)&v51[0])
          (*(void (**)(_QWORD))(**(_QWORD **)&v51[0] + 24))(*(_QWORD *)&v51[0]);
      }
      else
      {
        v11 = (void *)-[PROAPIAccessing apiForProtocol:](self->super.super._apiManager, "apiForProtocol:", &unk_1EF0A8190, v57);
        if (v11)
          v12 = objc_msgSend(v11, "versionAtCreation") == 0;
        else
          v12 = 0;
        v56 = 1;
        objc_msgSend(v10, "getIntValue:fromParm:atFxTime:", &v56, 2, a5->var0.var1);
        v55 = 0;
        objc_msgSend(v10, "getBoolValue:fromParm:atFxTime:", &v55, 3, a5->var0.var1);
        v54 = 1;
        objc_msgSend(v10, "getBoolValue:fromParm:atFxTime:", &v54, 5, a5->var0.var1);
        v53 = 25;
        objc_msgSend(v10, "getIntValue:fromParm:atFxTime:", &v53, 6, a5->var0.var1);
        v52 = 0;
        objc_msgSend(v10, "getIntValue:fromParm:atFxTime:", &v52, 4, a5->var0.var1);
        -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a4);
        -[PAESharedDefaultBase getInversePixelTransformForImage:](self, "getInversePixelTransformForImage:", a3);
        -[PAESharedDefaultBase getPixelTransformForImage:](self, "getPixelTransformForImage:", a3);
        -[PAESharedDefaultBase frameFromFxTime:forPlugIn:](self, "frameFromFxTime:forPlugIn:", a5->var0.var1, self);
        v14 = v13;
        v15 = objc_msgSend(a4, "width");
        v16 = objc_msgSend(a4, "height");
        v33[5] = v51[5];
        v33[6] = v51[6];
        v33[7] = v51[7];
        v33[1] = v51[1];
        v33[2] = v51[2];
        v33[3] = v51[3];
        v33[4] = v51[4];
        v32[5] = v40;
        v32[6] = v41;
        v32[7] = v42;
        v33[0] = v51[0];
        v32[1] = v36;
        v32[2] = v37;
        v32[3] = v38;
        v32[4] = v39;
        v31[2] = v45;
        v31[3] = v46;
        v31[0] = v43;
        v31[1] = v44;
        v31[7] = v50;
        v32[0] = v35;
        v31[5] = v48;
        v31[6] = v49;
        v31[4] = v47;
        LOBYTE(v27) = 0;
        -[PAEAddNoise noiseNodeWithWidth:height:noiseType:isMono:frameNum:autoAnimate:randomSeed:inputPixelTransform:outputPixelTransform:outputInvPixelTransform:is360:](self, "noiseNodeWithWidth:height:noiseType:isMono:frameNum:autoAnimate:randomSeed:inputPixelTransform:outputPixelTransform:outputInvPixelTransform:is360:", v15, v16, v56, v55, v54, v53, v14, v33, v32, v31, v27);
        if (a4)
          objc_msgSend(a4, "heliumRef");
        else
          v30 = 0;
        objc_msgSend(a4, "width");
        objc_msgSend(a4, "height");
        v17 = (HGHWBlendFlipped *)HGObject::operator new(0x220uLL);
        HGHWBlendFlipped::HGHWBlendFlipped(v17);
        v29 = v17;
        -[PAESharedDefaultBase getBlendingGamma](self, "getBlendingGamma");
        (*(void (**)(HGHWBlendFlipped *, uint64_t))(*(_QWORD *)v17 + 96))(v17, 5);
        if (a4)
          objc_msgSend(a4, "heliumRef");
        else
          v28 = 0;
        if (v52)
        {
          v18 = (HgcAddNoise *)HGObject::operator new(0x1A0uLL);
          HgcAddNoise::HgcAddNoise(v18);
          if (v18)
            (*(void (**)(HgcAddNoise *))(*(_QWORD *)v18 + 16))(v18);
          (*(void (**)(HgcAddNoise *, _QWORD, uint64_t))(*(_QWORD *)v18 + 120))(v18, 0, v34);
          (*(void (**)(HgcAddNoise *, uint64_t, uint64_t))(*(_QWORD *)v18 + 120))(v18, 1, v30);
          if (v12)
          {
            v19 = v57;
            (*(void (**)(HgcAddNoise *, _QWORD, float, float, float, float))(*(_QWORD *)v18 + 96))(v18, 0, v19, v19, v19, 1.0);
            v20.n128_u32[0] = 0;
            if (v52)
              v20.n128_f32[0] = 1.0;
          }
          else
          {
            (*(void (**)(HgcAddNoise *, _QWORD, float, float, float, float))(*(_QWORD *)v18 + 96))(v18, 0, 1.0, 1.0, 1.0, 1.0);
            v20.n128_u32[0] = 0;
            if ((v52 - 2) < 5)
              v20.n128_f32[0] = 1.0;
          }
          (*(void (**)(HgcAddNoise *, uint64_t, __n128, float, float, float))(*(_QWORD *)v18 + 96))(v18, 1, v20, v20.n128_f32[0], v20.n128_f32[0], v20.n128_f32[0]);
          (*(void (**)(HGHWBlendFlipped *, _QWORD, float, float, float, float))(*(_QWORD *)v29 + 96))(v29, 0, (float)kBlendConversions[v52], 0.0, 0.0, 0.0);
          v23.n128_u32[1] = HIDWORD(v57);
          v23.n128_f32[0] = v57;
          if (v12)
            v23.n128_f32[0] = 1.0;
          (*(void (**)(__n128, float, float, float))(*(_QWORD *)v29 + 96))(v23, 0.0, 0.0, 0.0);
          v24 = v57;
          (*(void (**)(HGHWBlendFlipped *, uint64_t, float, float, float, float))(*(_QWORD *)v29 + 96))(v29, 1, v24, 0.0, 0.0, 0.0);
          (*(void (**)(HGHWBlendFlipped *, uint64_t, float, float, float, float))(*(_QWORD *)v29 + 96))(v29, 2, 0.0, 0.0, 0.0, 0.0);
          if (!a5->var5)
          {
            v25 = (HGColorClamp *)HGObject::operator new(0x1C0uLL);
            HGColorClamp::HGColorClamp(v25);
            (*(void (**)(HGColorClamp *, _QWORD, HGColorClamp *))(*(_QWORD *)v25 + 120))(v25, 0, v28);
            if (v28 != v25)
            {
              if (v28)
                (*(void (**)(void))(*(_QWORD *)v28 + 24))();
              v28 = v25;
              (*(void (**)(HGColorClamp *))(*(_QWORD *)v25 + 16))(v25);
            }
            (*(void (**)(HGColorClamp *))(*(_QWORD *)v25 + 24))(v25);
          }
          (*(void (**)(HGHWBlendFlipped *, _QWORD, HGColorClamp *))(*(_QWORD *)v29 + 120))(v29, 0, v28);
          (*(void (**)(HGHWBlendFlipped *, uint64_t, HgcAddNoise *))(*(_QWORD *)v29 + 120))(v29, 1, v18);
          (*(void (**)(HgcAddNoise *))(*(_QWORD *)v18 + 24))(v18);
          (*(void (**)(HgcAddNoise *))(*(_QWORD *)v18 + 24))(v18);
        }
        else
        {
          v21 = (HgcAddNoiseNormal *)HGObject::operator new(0x1A0uLL);
          HgcAddNoiseNormal::HgcAddNoiseNormal(v21);
          if (v21)
            (*(void (**)(HgcAddNoiseNormal *))(*(_QWORD *)v21 + 16))(v21);
          (*(void (**)(HgcAddNoiseNormal *, _QWORD, uint64_t))(*(_QWORD *)v21 + 120))(v21, 0, v34);
          (*(void (**)(HgcAddNoiseNormal *, uint64_t, uint64_t))(*(_QWORD *)v21 + 120))(v21, 1, v30);
          v22 = v57;
          (*(void (**)(HgcAddNoiseNormal *, _QWORD, float, float, float, float))(*(_QWORD *)v21 + 96))(v21, 0, v22, v22, v22, 1.0);
          (*(void (**)(HGHWBlendFlipped *, _QWORD, float, float, float, float))(*(_QWORD *)v29 + 96))(v29, 0, (float)kBlendConversions[v52], 0.0, 0.0, 0.0);
          (*(void (**)(HGHWBlendFlipped *, _QWORD, float, float, float, float))(*(_QWORD *)v29 + 96))(v29, 0, 41.0, 0.0, 0.0, 0.0);
          (*(void (**)(HGHWBlendFlipped *, uint64_t, float, float, float, float))(*(_QWORD *)v29 + 96))(v29, 1, 1.0, 0.0, 0.0, 0.0);
          (*(void (**)(HGHWBlendFlipped *, _QWORD, HgcAddNoiseNormal *))(*(_QWORD *)v29 + 120))(v29, 0, v21);
          (*(void (**)(HgcAddNoiseNormal *))(*(_QWORD *)v21 + 24))(v21);
          (*(void (**)(HgcAddNoiseNormal *))(*(_QWORD *)v21 + 24))(v21);
        }
        -[PAESharedDefaultBase crop:fromImage:toImage:](self, "crop:fromImage:toImage:", &v29, a4, a3);
        objc_msgSend(a3, "setHeliumRef:", &v29);
        if (v28)
          (*(void (**)(HGColorClamp *))(*(_QWORD *)v28 + 24))(v28);
        if (v29)
          (*(void (**)(HGHWBlendFlipped *))(*(_QWORD *)v29 + 24))(v29);
        if (v30)
          (*(void (**)(uint64_t))(*(_QWORD *)v30 + 24))(v30);
        if (v34)
          (*(void (**)(uint64_t))(*(_QWORD *)v34 + 24))(v34);
      }
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

  *a6 = 0;
  *a5 = 0;
  v6 = *(_OWORD *)&a3->var2;
  v8[0] = *(_OWORD *)&a3->var0.var0;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&a3->var4;
  -[PAESharedDefaultBase overrideFrameSetupForRenderMode:hardware:software:](self, "overrideFrameSetupForRenderMode:hardware:software:", v8, a5, a6);
  return 1;
}

- (id)properties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  return (id)objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", v3, CFSTR("PositionIndependent"), v4, CFSTR("MayRemapTime"), v5, CFSTR("SupportsLargeRenderScale"), v6, CFSTR("SupportsHeliumRendering"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1), CFSTR("AutoColorProcessingSupport"), 0);
}

- (id)dynamicPropertiesAtTime:(id)a3 withError:(id *)a4
{
  uint64_t v6;
  id result;
  objc_class *v8;
  id v9;
  double v10;

  v10 = 0.0;
  if ((objc_msgSend(-[PAEFilterDefaultBase getParamAPIWithError:](self, "getParamAPIWithError:", a4), "getFloatValue:fromParm:atFxTime:", &v10, 1, a3.var1) & 1) != 0)
  {
    if (v10 == 0.0)
      v6 = 6;
    else
      v6 = 1;
    return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6, v10), CFSTR("PixelTransformSupport"), 0);
  }
  else if (a4)
  {
    v8 = (objc_class *)objc_opt_class();
    v9 = -[PAEFilterDefaultBase getParamErrorFor:](self, "getParamErrorFor:", NSStringFromClass(v8));
    result = 0;
    *a4 = v9;
  }
  else
  {
    return 0;
  }
  return result;
}

@end
