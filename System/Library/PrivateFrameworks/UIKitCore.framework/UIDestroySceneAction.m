@implementation UIDestroySceneAction

- (UIDestroySceneAction)initWithPreferredAnimationType:(unint64_t)a3 callbackQueue:(id)a4 completion:(id)a5
{
  return -[UIDestroySceneAction initWithPersistedIdentifiers:preferredAnimationType:forDestroyingSession:callbackQueue:completion:](self, "initWithPersistedIdentifiers:preferredAnimationType:forDestroyingSession:callbackQueue:completion:", 0, a3, 1, a4, a5);
}

- (UIDestroySceneAction)initWithPersistedIdentifiers:(id)a3 preferredAnimationType:(unint64_t)a4 callbackQueue:(id)a5 completion:(id)a6
{
  return -[UIDestroySceneAction initWithPersistedIdentifiers:preferredAnimationType:forDestroyingSession:callbackQueue:completion:](self, "initWithPersistedIdentifiers:preferredAnimationType:forDestroyingSession:callbackQueue:completion:", a3, a4, 1, a5, a6);
}

- (UIDestroySceneAction)initWithPersistedIdentifiers:(id)a3 preferredAnimationType:(unint64_t)a4 forDestroyingSession:(BOOL)a5 callbackQueue:(id)a6 completion:(id)a7
{
  return -[UIDestroySceneAction initWithPersistedIdentifiers:preferredAnimationType:forDestroyingSession:userOriginatedRequest:callbackQueue:completion:](self, "initWithPersistedIdentifiers:preferredAnimationType:forDestroyingSession:userOriginatedRequest:callbackQueue:completion:", a3, a4, a5, 0, a6, a7);
}

- (UIDestroySceneAction)initWithPersistedIdentifiers:(id)a3 preferredAnimationType:(unint64_t)a4 forDestroyingSession:(BOOL)a5 userOriginatedRequest:(BOOL)a6 callbackQueue:(id)a7 completion:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  UIDestroySceneAction *v18;
  void *v20;
  objc_super v21;

  v13 = a3;
  v14 = a7;
  v15 = a8;
  if (a4 - 4 <= 0xFFFFFFFFFFFFFFFCLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDestroySceneAction.m"), 58, CFSTR("A valid animation type must be provided."));

  }
  v16 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forSetting:", v17, 1);

  if (v13 && objc_msgSend(v13, "count"))
    objc_msgSend(v16, "setObject:forSetting:", v13, 2);
  objc_msgSend(v16, "setFlag:forSetting:", BSSettingFlagForBool(), 3);
  objc_msgSend(v16, "setFlag:forSetting:", BSSettingFlagForBool(), 4);
  v21.receiver = self;
  v21.super_class = (Class)UIDestroySceneAction;
  v18 = -[UIDestroySceneAction initWithInfo:timeout:forResponseOnQueue:withHandler:](&v21, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, v16, v14, v15, 5.0);

  return v18;
}

- (unint64_t)preferredAnimationType
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[UIDestroySceneAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "unsignedIntValue");
  else
    v4 = 0;

  return v4;
}

- (NSSet)persistedIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[UIDestroySceneAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = 0u;
    v14 = 0u;
    v12 = 0u;
    objc_msgSend(v3, "allObjects", 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v9 = 0;
            goto LABEL_13;
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          continue;
        break;
      }
    }

  }
  v9 = v3;
LABEL_13:

  return (NSSet *)v9;
}

- (BOOL)destroySceneSession
{
  void *v2;
  char v3;

  -[UIDestroySceneAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 3);

  return v3;
}

- (BOOL)isUserOriginatedRequest
{
  void *v2;
  char v3;

  -[UIDestroySceneAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 4);

  return v3;
}

- (int64_t)UIActionType
{
  return 35;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return 0;
  else
    return off_1E16C6028[a3 - 1];
}

@end
