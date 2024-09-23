@implementation VUIPlayerValidationManager

void __44__VUIPlayerValidationManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VUIPlayerValidationManager _init]([VUIPlayerValidationManager alloc], "_init");
  v1 = (void *)sharedInstance___sharedInstance_2;
  sharedInstance___sharedInstance_2 = (uint64_t)v0;

}

- (NSMapTable)playerCounts
{
  return self->_playerCounts;
}

- (void)addReferenceForPlayer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  if (a3)
  {
    v4 = a3;
    -[VUIPlayerValidationManager playerCounts](self, "playerCounts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = &unk_1EA0B93D0;
    if (v6)
      v8 = (void *)v6;
    v9 = v8;

    v10 = (void *)MEMORY[0x1E0CB37E8];
    v11 = objc_msgSend(v9, "intValue");

    objc_msgSend(v10, "numberWithInt:", (v11 + 1));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[VUIPlayerValidationManager playerCounts](self, "playerCounts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v13, v4);

  }
}

- (id)_init
{
  VUIPlayerValidationManager *v2;
  uint64_t v3;
  NSMapTable *playerCounts;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIPlayerValidationManager;
  v2 = -[VUIPlayerValidationManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    playerCounts = v2->_playerCounts;
    v2->_playerCounts = (NSMapTable *)v3;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance___onceToken_6 != -1)
    dispatch_once(&sharedInstance___onceToken_6, &__block_literal_global_54);
  return (id)sharedInstance___sharedInstance_2;
}

- (VUIPlayerValidationManager)init
{

  return 0;
}

- (void)removeReferenceForPlayer:(id)a3 stoppingIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    v20 = v6;
    -[VUIPlayerValidationManager playerCounts](self, "playerCounts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v20);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = &unk_1EA0B93D0;
    if (v8)
      v10 = (void *)v8;
    v11 = v10;

    v12 = (void *)MEMORY[0x1E0CB37E8];
    v13 = objc_msgSend(v11, "intValue");

    objc_msgSend(v12, "numberWithInt:", (v13 - 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "intValue");
    -[VUIPlayerValidationManager playerCounts](self, "playerCounts");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15 <= 0)
    {
      objc_msgSend(v16, "removeObjectForKey:", v20);

      if (v4)
      {
        objc_msgSend(v20, "state");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DB1958], "stopped");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18 != v19)
          objc_msgSend(v20, "stop");
        objc_msgSend(v20, "invalidate");
      }
    }
    else
    {
      objc_msgSend(v16, "setObject:forKey:", v14, v20);

    }
    v6 = v20;
  }

}

- (void)removeReferenceForPlayer:(id)a3
{
  -[VUIPlayerValidationManager removeReferenceForPlayer:stoppingIfNeeded:](self, "removeReferenceForPlayer:stoppingIfNeeded:", a3, 1);
}

- (void)setPlayerCounts:(id)a3
{
  objc_storeStrong((id *)&self->_playerCounts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerCounts, 0);
}

@end
