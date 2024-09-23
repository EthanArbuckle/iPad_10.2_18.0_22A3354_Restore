@implementation PVClearAlphaEffect

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
  _QWORD *v6;
  _QWORD *v8;
  HGPremultiply *v9;
  HGPremultiply *v10;
  HGNode *v11;
  HGPremultiply *v12;
  HGNode *v13;

  v8 = v6;
  PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 0, &v13);
  v9 = (HGPremultiply *)v13;
  *v8 = v13;
  if (v9)
    (*(void (**)(HGPremultiply *))(*(_QWORD *)v9 + 16))(v9);
  -[NSLock lock](self->super.super._inspectablePropertiesLock, "lock");
  -[NSLock unlock](self->super.super._inspectablePropertiesLock, "unlock");
  FxApplyAlphaRequest((HGPremultiply **)&v13, 0, 0, 0, &v12);
  if (v9 == v12)
    goto LABEL_8;
  if (v9)
    (*(void (**)(HGPremultiply *))(*(_QWORD *)v9 + 24))(v9);
  v10 = v12;
  *v8 = v12;
  if (v10)
  {
    (*(void (**)(HGPremultiply *))(*(_QWORD *)v10 + 16))(v10);
    v9 = v12;
LABEL_8:
    if (v9)
      (*(void (**)(HGPremultiply *))(*(_QWORD *)v9 + 24))(v9);
  }
  v11 = v13;
  if (v13)
    return (HGRef<HGNode>)(*(uint64_t (**)(HGNode *))(*(_QWORD *)v13 + 24))(v13);
  return (HGRef<HGNode>)v11;
}

@end
