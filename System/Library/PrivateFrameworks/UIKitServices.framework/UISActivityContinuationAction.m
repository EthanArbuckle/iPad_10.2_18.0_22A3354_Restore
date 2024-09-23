@implementation UISActivityContinuationAction

+ (void)buildWithUserActivity:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "activityType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__UISActivityContinuationAction_buildWithUserActivity_completion___block_invoke;
  v11[3] = &unk_1E2CAF798;
  v13 = v6;
  v14 = a1;
  v12 = v8;
  v9 = v8;
  v10 = v6;
  objc_msgSend(v7, "_createUserActivityDataWithOptions:completionHandler:", MEMORY[0x1E0C9AA70], v11);

}

void __66__UISActivityContinuationAction_buildWithUserActivity_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    if (v5)
    {
      v7 = objc_alloc(*(Class *)(a1 + 48));
      v12[0] = &unk_1E2CBABF0;
      v12[1] = &unk_1E2CBAC08;
      v8 = *(_QWORD *)(a1 + 32);
      v13[0] = v5;
      v13[1] = v8;
      v12[2] = &unk_1E2CBAC20;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13[2] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v7, "initWithSettings:", v10);

    }
    else
    {
      v11 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (UISActivityContinuationAction)initWithSettings:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UISActivityContinuationAction *v14;
  void *v16;
  objc_super v17;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISActivityContinuationAction.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("settings"));

  }
  v6 = objc_alloc_init(MEMORY[0x1E0D22FF0]);
  objc_msgSend(v5, "objectForKey:", &unk_1E2CBAC38);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forSetting:", v7, 1);

  objc_msgSend(v5, "objectForKey:", &unk_1E2CBAC50);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forSetting:", v8, 2);

  objc_msgSend(v5, "objectForKey:", &unk_1E2CBAC68);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forSetting:", v9, 3);

  objc_msgSend(v5, "objectForKey:", &unk_1E2CBAC80);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forSetting:", v10, 4);

  objc_msgSend(v5, "objectForKey:", &unk_1E2CBAC08);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forSetting:", v11, 5);

  objc_msgSend(v5, "objectForKey:", &unk_1E2CBAC20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forSetting:", v12, 6);

  objc_msgSend(v5, "objectForKey:", &unk_1E2CBABF0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forSetting:", v13, 7);

  v17.receiver = self;
  v17.super_class = (Class)UISActivityContinuationAction;
  v14 = -[UISActivityContinuationAction initWithInfo:responder:](&v17, sel_initWithInfo_responder_, v6, 0);

  return v14;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[UISActivityContinuationAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)activityTypeIdentifier
{
  void *v2;
  void *v3;

  -[UISActivityContinuationAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)originatingDeviceType
{
  void *v2;
  void *v3;

  -[UISActivityContinuationAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)originatingDeviceName
{
  void *v2;
  void *v3;

  -[UISActivityContinuationAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)activityType
{
  void *v2;
  void *v3;

  -[UISActivityContinuationAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDate)lastUpdateTime
{
  void *v2;
  void *v3;

  -[UISActivityContinuationAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSData)userActivityData
{
  void *v2;
  void *v3;

  -[UISActivityContinuationAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (int64_t)UIActionType
{
  return 6;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 - 1 > 6)
    return 0;
  else
    return off_1E2CAF7B8[a3 - 1];
}

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UISActivityContinuationAction;
  if (-[UISActivityContinuationAction isKindOfClass:](&v5, sel_isKindOfClass_))
    return 1;
  else
    return -[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class());
}

@end
