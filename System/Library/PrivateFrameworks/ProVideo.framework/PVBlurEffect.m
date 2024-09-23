@implementation PVBlurEffect

+ (void)registerEffectWithID:(id)a3 displayName:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v5, CFSTR("FFEffectProperty_DisplayName"), CFSTR("Helium"), CFSTR("FFEffectProperty_Category"), CFSTR("effect.video.filter"), CFSTR("FFEffectProperty_EffectType"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PVEffect registerEffectClass:forEffectID:withProperties:](PVEffect, "registerEffectClass:forEffectID:withProperties:", objc_opt_class(), v9, v6);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v5, CFSTR("displayName"), CFSTR("BuiltIn"), CFSTR("contentGroup"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PVContentRegistry sharedInstance](PVContentRegistry, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerContentClass:forID:type:withProperties:", objc_opt_class(), v9, CFSTR("effect.video.filter"), v7);

}

- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  HGCrop **v6;
  HGCrop **v9;
  HGNode *v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  void *v15;
  int v16;
  HGTextureWrap *v17;
  char *v18;
  HGBlur *v19;
  uint64_t DOD;
  uint64_t v21;
  uint64_t v22;
  HGCrop *v23;
  HGCrop *v24;
  HGNode *v25;
  HGNode *v26;

  v9 = v6;
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 0, &v26);
  v10 = v26;
  *v9 = (HGCrop *)v26;
  if (v10)
    (*(void (**)(HGNode *))(*(_QWORD *)v10 + 16))(v10);
  -[NSLock lock](self->super.super._inspectablePropertiesLock, "lock");
  -[NSMutableDictionary objectForKeyedSubscript:](self->super.super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("kPVBlurEffectRadius"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  v13 = v12;

  -[NSMutableDictionary objectForKeyedSubscript:](self->super.super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("kPVBlurEffectClampToEdge"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->super.super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("kPVBlurEffectClampToEdge"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

  }
  else
  {
    v16 = 0;
  }

  -[NSLock unlock](self->super.super._inspectablePropertiesLock, "unlock");
  if (v16)
  {
    v17 = (HGTextureWrap *)HGObject::operator new(0x1D0uLL);
    HGTextureWrap::HGTextureWrap(v17);
    (*(void (**)(HGTextureWrap *, _QWORD, HGNode *))(*(_QWORD *)v17 + 120))(v17, 0, v10);
    HGTextureWrap::SetTextureWrapMode((uint64_t)v17, (const char *)1, v18);
    if (v10 != (HGNode *)v17)
    {
      if (v10)
        (*(void (**)(HGNode *))(*(_QWORD *)v10 + 24))(v10);
      *v9 = v17;
      v10 = (HGNode *)v17;
      (*(void (**)(HGTextureWrap *))(*(_QWORD *)v17 + 16))(v17);
    }
    (*(void (**)(HGTextureWrap *))(*(_QWORD *)v17 + 24))(v17);
  }
  v19 = (HGBlur *)HGObject::operator new(0x220uLL);
  HGBlur::HGBlur(v19);
  (*(void (**)(HGBlur *, _QWORD, HGNode *))(*(_QWORD *)v19 + 120))(v19, 0, v10);
  (*(void (**)(HGBlur *, _QWORD, float, float, float, float))(*(_QWORD *)v19 + 96))(v19, 0, v13, v13, 0.0, 0.0);
  (*(void (**)(HGBlur *, uint64_t, float, float, float, float))(*(_QWORD *)v19 + 96))(v19, 2, 1.0, 0.0, 0.0, 0.0);
  if (v10 != (HGNode *)v19)
  {
    if (v10)
      (*(void (**)(HGNode *))(*(_QWORD *)v10 + 24))(v10);
    *v9 = v19;
    (*(void (**)(HGBlur *))(*(_QWORD *)v19 + 16))(v19);
  }
  if (v16)
  {
    DOD = HGRenderer::GetDOD(*(HGRenderer **)a5, v26);
    v22 = v21;
    v23 = (HGCrop *)HGObject::operator new(0x1A0uLL);
    HGCrop::HGCrop(v23);
    v24 = *v9;
    (*(void (**)(HGCrop *, _QWORD, HGCrop *))(*(_QWORD *)v23 + 120))(v23, 0, *v9);
    (*(void (**)(HGCrop *, _QWORD, float, float, float, float))(*(_QWORD *)v23 + 96))(v23, 0, (float)(int)DOD, (float)SHIDWORD(DOD), (float)(int)v22, (float)SHIDWORD(v22));
    if (v24 != v23)
    {
      if (v24)
        (*(void (**)(HGCrop *))(*(_QWORD *)v24 + 24))(v24);
      *v9 = v23;
      (*(void (**)(HGCrop *))(*(_QWORD *)v23 + 16))(v23);
    }
    (*(void (**)(HGCrop *))(*(_QWORD *)v23 + 24))(v23);
  }
  (*(void (**)(HGBlur *))(*(_QWORD *)v19 + 24))(v19);
  v25 = v26;
  if (v26)
    return (HGRef<HGNode>)(*(uint64_t (**)(HGNode *))(*(_QWORD *)v26 + 24))(v26);
  return (HGRef<HGNode>)v25;
}

@end
