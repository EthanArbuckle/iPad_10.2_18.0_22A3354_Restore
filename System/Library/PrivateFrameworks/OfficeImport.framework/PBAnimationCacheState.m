@implementation PBAnimationCacheState

- (PBAnimationCacheState)init
{
  PBAnimationCacheState *v2;
  NSMutableSet *v3;
  NSMutableSet *mEntranceDrawables;
  NSMutableSet *v5;
  NSMutableSet *mExitDrawables;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PBAnimationCacheState;
  v2 = -[PDAnimationCacheState init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    mEntranceDrawables = v2->mEntranceDrawables;
    v2->mEntranceDrawables = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    mExitDrawables = v2->mExitDrawables;
    v2->mExitDrawables = v5;

  }
  return v2;
}

- (BOOL)isValid:(id)a3
{
  id v4;
  int *v5;
  id v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;

  v4 = a3;
  if (objc_msgSend(v4, "presetClass") == 1)
  {
    v5 = &OBJC_IVAR___PBAnimationCacheState_mEntranceDrawables;
LABEL_5:
    v6 = *(id *)((char *)&self->super.super.isa + *v5);
    goto LABEL_7;
  }
  if (objc_msgSend(v4, "presetClass") == 2)
  {
    v5 = &OBJC_IVAR___PBAnimationCacheState_mExitDrawables;
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:
  objc_msgSend(v4, "target");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v4, "target");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "target");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "drawable");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        LODWORD(v7) = objc_msgSend(v6, "containsObject:", v11) ^ 1;
        if (!(_DWORD)v7)
          goto LABEL_17;
      }
      else
      {
        LODWORD(v7) = objc_msgSend(v4, "presetClass") == 6;
        if (!(_DWORD)v7)
          goto LABEL_17;
      }
      if (v11)
      {
        objc_msgSend(v6, "addObject:", v11);
        LOBYTE(v7) = 1;
      }
    }
    else
    {
      v11 = 0;
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_17:

  return (char)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mExitDrawables, 0);
  objc_storeStrong((id *)&self->mEntranceDrawables, 0);
}

@end
