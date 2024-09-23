@implementation PVCompositeDelegateEffect

+ (void)registerEffects
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", CFSTR("CompositeDelegate"), CFSTR("FFEffectProperty_DisplayName"), CFSTR("Internal"), CFSTR("FFEffectProperty_Category"), CFSTR("effect.video.compositor"), CFSTR("FFEffectProperty_EffectType"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[PVEffect registerEffectClass:forEffectID:withProperties:](PVEffect, "registerEffectClass:forEffectID:withProperties:", objc_opt_class(), CFSTR("F3D8E4D0-686B-44C6-8966-E50856A94959"));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", CFSTR("CompositeDelegate"), CFSTR("displayName"), CFSTR("BuiltIn"), CFSTR("contentGroup"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PVContentRegistry sharedInstance](PVContentRegistry, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerContentClass:forID:type:withProperties:", objc_opt_class(), CFSTR("F3D8E4D0-686B-44C6-8966-E50856A94959"), CFSTR("effect.video.compositor"), v2);

}

- (PVCompositeDelegateEffect)initWithEffectID:(id)a3
{
  PVCompositeDelegateEffect *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PVCompositeDelegateEffect;
  result = -[PVEffect initWithEffectID:](&v4, sel_initWithEffectID_, a3);
  if (result)
    atomic_store(0, (unsigned int *)&result->_loaded);
  return result;
}

- (BOOL)loadEffect
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  atomic<int> *p_loaded;
  unsigned int v8;
  void *v9;
  void *v10;
  objc_super v12;

  -[PVCompositeDelegateEffect renderDelegate](self, "renderDelegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[PVCompositeDelegateEffect renderDelegate](self, "renderDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      p_loaded = &self->_loaded;
      do
        v8 = __ldaxr((unsigned int *)p_loaded);
      while (__stlxr(v8 + 1, (unsigned int *)p_loaded));
      if (!v8)
      {
        -[PVCompositeDelegateEffect renderDelegate](self, "renderDelegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PVCompositeDelegateEffect userContext](self, "userContext");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "loadWithUserContext:", v10);

      }
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)PVCompositeDelegateEffect;
  return -[PVEffect loadEffect](&v12, sel_loadEffect);
}

- (void)releaseEffect
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  atomic<int> *p_loaded;
  unsigned int v8;
  unsigned int v9;
  void *v10;
  void *v11;
  objc_super v12;

  -[PVCompositeDelegateEffect renderDelegate](self, "renderDelegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[PVCompositeDelegateEffect renderDelegate](self, "renderDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      p_loaded = &self->_loaded;
      do
      {
        v8 = __ldaxr((unsigned int *)p_loaded);
        v9 = v8 - 1;
      }
      while (__stlxr(v9, (unsigned int *)p_loaded));
      if (!v9)
      {
        -[PVCompositeDelegateEffect renderDelegate](self, "renderDelegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PVCompositeDelegateEffect userContext](self, "userContext");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "unloadWithUserContext:", v11);

      }
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)PVCompositeDelegateEffect;
  -[PVEffect releaseEffect](&v12, sel_releaseEffect);
}

- (PVCompositeDelegate)renderDelegate
{
  return self->_renderDelegate;
}

- (void)setRenderDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_renderDelegate, a3);
}

- (id)userContext
{
  return self->_userContext;
}

- (void)setUserContext:(id)a3
{
  objc_storeStrong(&self->_userContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userContext, 0);
  objc_storeStrong((id *)&self->_renderDelegate, 0);
}

@end
