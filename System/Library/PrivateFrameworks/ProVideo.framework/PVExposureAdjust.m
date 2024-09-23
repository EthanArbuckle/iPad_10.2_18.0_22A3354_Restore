@implementation PVExposureAdjust

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
  HgcExposureAdjust **v6;
  HgcExposureAdjust **v9;
  void *v10;
  float v11;
  float v12;
  HGNode *Node;
  HgcExposureAdjust *v14;
  HGNode *v15;

  v9 = v6;
  -[NSLock lock](self->super.super._inspectablePropertiesLock, "lock", a3, a4, a5, a6.m_Obj);
  -[NSMutableDictionary objectForKeyedSubscript:](self->super.super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("kPVExposureAdjustOffset"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  v12 = v11;

  -[NSLock unlock](self->super.super._inspectablePropertiesLock, "unlock");
  Node = PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 0, &v15);
  if (fabsf(v12) >= 0.0001)
  {
    v14 = (HgcExposureAdjust *)HGObject::operator new(0x1A0uLL);
    HgcExposureAdjust::HgcExposureAdjust(v14);
    (*(void (**)(HgcExposureAdjust *, _QWORD, HGNode *))(*(_QWORD *)v14 + 120))(v14, 0, v15);
    (*(void (**)(HgcExposureAdjust *, _QWORD, float, float, float, float))(*(_QWORD *)v14 + 96))(v14, 0, v12, v12, v12, v12);
    *v9 = v14;
    Node = v15;
    if (v15)
      return (HGRef<HGNode>)(*(uint64_t (**)(HGNode *))(*(_QWORD *)v15 + 24))(v15);
  }
  else
  {
    *v9 = (HgcExposureAdjust *)v15;
  }
  return (HGRef<HGNode>)Node;
}

@end
