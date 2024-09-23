@implementation PVMultiBlendEffect

+ (void)registerEffectWithID:(id)a3 displayName:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v5, CFSTR("FFEffectProperty_DisplayName"), CFSTR("Helium"), CFSTR("FFEffectProperty_Category"), CFSTR("effect.video.compositor"), CFSTR("FFEffectProperty_EffectType"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PVEffect registerEffectClass:forEffectID:withProperties:](PVEffect, "registerEffectClass:forEffectID:withProperties:", objc_opt_class(), v9, v6);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", v5, CFSTR("displayName"), CFSTR("BuiltIn"), CFSTR("contentGroup"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PVContentRegistry sharedInstance](PVContentRegistry, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerContentClass:forID:type:withProperties:", objc_opt_class(), v9, CFSTR("effect.video.compositor"), v7);

}

- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  HGHWMultiBlend **v6;
  HGHWMultiBlend **v9;
  HGHWMultiBlend *v10;
  void *v11;
  unsigned int *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  float v16;
  float v17;
  uint64_t v18;
  void *v19;
  HGNode *v20;
  void *__p;
  unsigned int *v22;

  v9 = v6;
  PVInputHGNodeMap<unsigned int>::MapKeys(a4, (char **)&__p);
  v10 = (HGHWMultiBlend *)HGObject::operator new(0x280uLL);
  HGHWMultiBlend::HGHWMultiBlend(v10);
  -[NSLock lock](self->super.super._inspectablePropertiesLock, "lock");
  -[NSMutableDictionary objectForKeyedSubscript:](self->super.super._inspectableProperties, "objectForKeyedSubscript:", CFSTR("MultiBlendLayerParams"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->super.super._inspectablePropertiesLock, "unlock");
  v12 = (unsigned int *)__p;
  if (__p != v22)
  {
    do
    {
      v13 = *v12;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v15, "opacity");
        v17 = v16;
        v18 = objc_msgSend(v15, "hgBlendMode");
      }
      else
      {
        v18 = 9;
        v17 = 1.0;
      }
      PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, v13, &v20);
      (*(void (**)(HGHWMultiBlend *, uint64_t, HGNode *, uint64_t, float))(*(_QWORD *)v10 + 624))(v10, v13, v20, v18, v17);
      if (v20)
        (*(void (**)(HGNode *))(*(_QWORD *)v20 + 24))(v20);

      ++v12;
    }
    while (v12 != v22);
  }
  *v9 = v10;

  v19 = __p;
  if (__p)
  {
    v22 = (unsigned int *)__p;
    operator delete(__p);
  }
  return (HGRef<HGNode>)v19;
}

@end
