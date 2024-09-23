@implementation SBSUIInCallDestroySceneAction

- (SBSUIInCallDestroySceneAction)initWithDestructionReason:(int64_t)a3 analyticsSource:(id)a4 timeout:(double)a5 withResponseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  SBSUIInCallDestroySceneAction *v14;
  objc_super v16;

  v10 = a4;
  v11 = a6;
  v12 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forSetting:", v13, 1);

  if (v10)
    objc_msgSend(v12, "setObject:forSetting:", v10, 2);
  v16.receiver = self;
  v16.super_class = (Class)SBSUIInCallDestroySceneAction;
  v14 = -[SBSUIInCallDestroySceneAction initWithInfo:timeout:forResponseOnQueue:withHandler:](&v16, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, v12, MEMORY[0x1E0C80D38], v11, a5);

  return v14;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("analyticsSource");
  if (a3 != 2)
    v3 = 0;
  if (a3 == 1)
    return CFSTR("destructionReason");
  else
    return (id)v3;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;

  v6 = a4;
  v7 = v6;
  if (a5 == 2)
  {
    v8 = v6;
  }
  else
  {
    if (a5 != 1)
    {
      v9 = 0;
      goto LABEL_7;
    }
    SBSUIInCallWindowSceneSessionDestructionReasonDescription(objc_msgSend(v6, "integerValue"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
LABEL_7:

  return v9;
}

- (NSString)analyticsSource
{
  void *v2;
  void *v3;

  -[SBSUIInCallDestroySceneAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (int64_t)destructionReason
{
  void *v2;
  void *v3;
  int64_t v4;

  -[SBSUIInCallDestroySceneAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

@end
