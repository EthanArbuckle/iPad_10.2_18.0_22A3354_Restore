@implementation PVColorCorrectEffect

+ (void)registerEffects
{
  +[PVColorCorrectEffect_BnW registerEffectWithID:displayName:](PVColorCorrectEffect_BnW, "registerEffectWithID:displayName:", CFSTR("Helium:CBA2376C-F0E0-4D55-8C97-0A3ECF72CE63"), CFSTR("Black and White"));
  +[PVColorCorrectEffect_Contrast registerEffectWithID:displayName:](PVColorCorrectEffect_Contrast, "registerEffectWithID:displayName:", CFSTR("Helium:D47A107B-85CF-4DC8-B580-060F272D611F"), CFSTR("Contrast"));
  +[PVColorCorrectEffect_Bright registerEffectWithID:displayName:](PVColorCorrectEffect_Bright, "registerEffectWithID:displayName:", CFSTR("Helium:0B37D582-6CFF-48BA-B57A-85FE45E14AAE"), CFSTR("Brighten"));
  +[PVColorCorrectEffect_Warm registerEffectWithID:displayName:](PVColorCorrectEffect_Warm, "registerEffectWithID:displayName:", CFSTR("Helium:73A91088-DD32-4B19-B7AE-A27F070A926D"), CFSTR("Warmth"));
  +[PVColorCorrectEffect_Cool registerEffectWithID:displayName:](PVColorCorrectEffect_Cool, "registerEffectWithID:displayName:", CFSTR("Helium:9215A4CB-FB6F-47F8-944B-1785F0551131"), CFSTR("Cool"));
}

- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  HGColorCorrect **v6;
  HGColorCorrect **v9;
  uint64_t look;
  float v11;
  float v12;
  float v13;
  float v14;
  NSMutableDictionary *inspectableProperties;
  void *v16;
  float v17;
  float v18;
  void *v19;
  float v20;
  void *v21;
  void *v22;
  float v23;
  HGColorCorrect *v24;
  HGNode *v25;
  HGNode *v26;

  v9 = v6;
  look = self->_look;
  if (look > 4)
  {
    v11 = 1.0;
    v14 = 6504.0;
    v12 = 1.0;
    v13 = 1.0;
  }
  else
  {
    v11 = flt_1B304FA60[look];
    v12 = flt_1B304FA74[look];
    v13 = flt_1B304FA88[look];
    v14 = flt_1B304FA9C[look];
  }
  -[NSLock lock](self->super.super._inspectablePropertiesLock, "lock", a3, a4, a5, a6.m_Obj);
  inspectableProperties = self->super.super._inspectableProperties;
  if (inspectableProperties)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](inspectableProperties, "objectForKeyedSubscript:", CFSTR("xParam"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0.0;
    v18 = 0.0;
    if (v16)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->super.super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("xParam"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "floatValue");
      v18 = v20 / 100.0;

    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->super.super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("yParam"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->super.super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("yParam"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "floatValue");
      v17 = v23 / 100.0;

    }
    v12 = v12 + v18;
    v13 = v13 + v17;
  }
  -[NSLock unlock](self->super.super._inspectablePropertiesLock, "unlock");
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 0, &v26);
  v24 = (HGColorCorrect *)HGObject::operator new(0x1A0uLL);
  HGColorCorrect::HGColorCorrect(v24);
  (*(void (**)(HGColorCorrect *, _QWORD, HGNode *))(*(_QWORD *)v24 + 120))(v24, 0, v26);
  (*(void (**)(HGColorCorrect *, _QWORD, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, HGColorCorrect::kParam_wgt, 0.2126, 0.7152, 0.0722, 0.0);
  (*(void (**)(HGColorCorrect *, _QWORD, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, HGColorCorrect::kParam_hue_saturation_temp, 0.0, v11, v14, 0.0);
  (*(void (**)(HGColorCorrect *, _QWORD, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, HGColorCorrect::kParam_brightness, v12, v12, v12, 1.0);
  (*(void (**)(HGColorCorrect *, _QWORD, float, float, float, float))(*(_QWORD *)v24 + 96))(v24, HGColorCorrect::kParam_contrast, v13, v13, v13, 1.0);
  *v9 = v24;
  v25 = v26;
  if (v26)
    return (HGRef<HGNode>)(*(uint64_t (**)(HGNode *))(*(_QWORD *)v26 + 24))(v26);
  return (HGRef<HGNode>)v25;
}

@end
