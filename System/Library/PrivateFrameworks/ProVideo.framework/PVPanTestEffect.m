@implementation PVPanTestEffect

+ (void)registerEffectWithID:(id)a3 displayName:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v5, CFSTR("FFEffectProperty_DisplayName"), CFSTR("Helium"), CFSTR("FFEffectProperty_Category"), CFSTR("effect.video.filter"), CFSTR("FFEffectProperty_EffectType"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PVEffect registerEffectClass:forEffectID:withProperties:](PVEffect, "registerEffectClass:forEffectID:withProperties:", objc_opt_class(), v7, v6);

}

- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  HGHWMultiBlend **v6;
  HGHWMultiBlend **v9;
  double v10;
  double v11;
  double v12;
  float v13;
  float v14;
  void *v15;
  double v16;
  void *v17;
  float v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  float v24;
  void *v25;
  void *v26;
  float v27;
  void *v28;
  void *v29;
  float v30;
  double v31;
  uint64_t v32;
  HGNode *v33;
  float v34;
  float v35;
  float v36;
  float v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  HGSolidColor *v41;
  HGCrop *v42;
  HGHWMultiBlend *v43;
  HGNode *v44;
  HGNode *v45;

  v9 = v6;
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 0, &v45);
  v10 = (*(double (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 40))(*(_QWORD *)a6.m_Obj);
  v12 = v11;
  v13 = (*(float (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 48))(*(_QWORD *)a6.m_Obj);
  v14 = (*(float (**)(_QWORD))(**(_QWORD **)a6.m_Obj + 48))(*(_QWORD *)a6.m_Obj);
  -[NSLock lock](self->super.super._inspectablePropertiesLock, "lock");
  -[NSMutableDictionary objectForKeyedSubscript:](self->super.super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("startPanX"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10 * v13;

  if (v15)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super.super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("startPanX"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "floatValue");
    v19 = v16 * v18;

  }
  else
  {
    v19 = 0.0;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->super.super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("startPanY"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v12 * v14;

  v22 = v21 * 0.5;
  if (v20)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super.super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("startPanY"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "floatValue");
    v22 = v21 * v24;

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->super.super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("deltaPanX"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super.super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("deltaPanX"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "floatValue");
    v16 = v19 + v16 * v27;

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->super.super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("deltaPanY"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super.super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("deltaPanY"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "floatValue");
    v31 = v22 + v21 * v30;

  }
  else
  {
    v31 = v21 * 0.5 + 10.0;
  }
  -[NSLock unlock](self->super.super._inspectablePropertiesLock, "unlock");
  v33 = v45;
  *v9 = (HGHWMultiBlend *)v45;
  if (v33)
    (*(void (**)(HGNode *))(*(_QWORD *)v33 + 16))(v33);
  v34 = v19;
  v35 = v22;
  v36 = v16;
  v37 = v31;
  v38 = HGRectMake4f(v32, v34, v35, v36, v37);
  v40 = v39;
  v41 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
  HGSolidColor::HGSolidColor(v41);
  (*(void (**)(HGSolidColor *, _QWORD, float, float, float, float))(*(_QWORD *)v41 + 96))(v41, 0, 1.0, 1.0, 1.0, 1.0);
  v42 = (HGCrop *)HGObject::operator new(0x1A0uLL);
  HGCrop::HGCrop(v42);
  (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v42 + 96))(v42, 0, (float)(int)v38, (float)SHIDWORD(v38), (float)(int)v40, (float)SHIDWORD(v40));
  (*(void (**)(HGCrop *, _QWORD, HGSolidColor *))(*(_QWORD *)v42 + 120))(v42, 0, v41);
  v43 = (HGHWMultiBlend *)HGObject::operator new(0x280uLL);
  HGHWMultiBlend::HGHWMultiBlend(v43);
  (*(void (**)(HGHWMultiBlend *, _QWORD, HGNode *))(*(_QWORD *)v43 + 120))(v43, 0, v45);
  (*(void (**)(HGHWMultiBlend *, uint64_t, HGCrop *))(*(_QWORD *)v43 + 120))(v43, 1, v42);
  if (v33 != (HGNode *)v43)
  {
    if (v33)
      (*(void (**)(HGNode *))(*(_QWORD *)v33 + 24))(v33);
    *v9 = v43;
    (*(void (**)(HGHWMultiBlend *))(*(_QWORD *)v43 + 16))(v43);
  }
  (*(void (**)(HGHWMultiBlend *))(*(_QWORD *)v43 + 24))(v43);
  (*(void (**)(HGCrop *))(*(_QWORD *)v42 + 24))(v42);
  (*(void (**)(HGSolidColor *))(*(_QWORD *)v41 + 24))(v41);
  v44 = v45;
  if (v45)
    return (HGRef<HGNode>)(*(uint64_t (**)(HGNode *))(*(_QWORD *)v45 + 24))(v45);
  return (HGRef<HGNode>)v44;
}

@end
