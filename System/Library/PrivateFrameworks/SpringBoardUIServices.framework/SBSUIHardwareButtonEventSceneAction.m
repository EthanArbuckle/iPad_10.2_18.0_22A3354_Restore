@implementation SBSUIHardwareButtonEventSceneAction

- (SBSUIHardwareButtonEventSceneAction)initWithButtonEventType:(int64_t)a3 timeout:(double)a4 withResponseHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  SBSUIHardwareButtonEventSceneAction *v12;
  objc_super v14;
  _QWORD v15[4];
  id v16;

  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forSetting:", v10, 1);

  v15[1] = 3221225472;
  v15[2] = __91__SBSUIHardwareButtonEventSceneAction_initWithButtonEventType_timeout_withResponseHandler___block_invoke;
  v15[3] = &unk_1E4C3ED20;
  v16 = v8;
  v14.receiver = self;
  v14.super_class = (Class)SBSUIHardwareButtonEventSceneAction;
  v15[0] = MEMORY[0x1E0C809B0];
  v11 = v8;
  v12 = -[SBSUIHardwareButtonEventSceneAction initWithInfo:timeout:forResponseOnQueue:withHandler:](&v14, sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, v9, MEMORY[0x1E0C80D38], v15, a4);

  return v12;
}

void __91__SBSUIHardwareButtonEventSceneAction_initWithButtonEventType_timeout_withResponseHandler___block_invoke(uint64_t a1, void *a2)
{
  char isKindOfClass;
  uint64_t v4;
  id v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v5 = v6;
    if ((isKindOfClass & 1) == 0)
      v5 = 0;
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }

}

- (void)sendResponse:(id)a3
{
  id v5;
  void *v6;
  objc_super v7;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSUIHardwareButtonEventSceneAction.m"), 40, CFSTR("SBSUIHardwareButtonEventSceneActionResponse is the only supported response class."), v5);

  }
  v7.receiver = self;
  v7.super_class = (Class)SBSUIHardwareButtonEventSceneAction;
  -[SBSUIHardwareButtonEventSceneAction sendResponse:](&v7, sel_sendResponse_, v5);

}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("buttonEventType");
  else
    return 0;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v6;

  if (a5 != 1)
    return 0;
  SBSUIHardwareButtonEventTypeDescription(objc_msgSend(a4, "integerValue", a3, v5, v6));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)buttonEventType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[SBSUIHardwareButtonEventSceneAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

@end
