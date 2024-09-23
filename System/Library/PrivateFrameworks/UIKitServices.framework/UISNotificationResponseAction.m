@implementation UISNotificationResponseAction

- (UISNotificationResponseAction)initWithResponse:(id)a3 withHandler:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  UISNotificationResponseAction *v12;
  uint64_t v13;
  UNNotificationResponse *response;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISNotificationResponseAction.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("response"));

  }
  v9 = objc_alloc_init(MEMORY[0x1E0D22FF0]);
  objc_msgSend(v9, "setObject:forSetting:", v7, 1);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D22F60], "responderWithHandler:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      objc_msgSend(v10, "setQueue:", MEMORY[0x1E0C80D38]);
  }
  else
  {
    v11 = 0;
  }
  v17.receiver = self;
  v17.super_class = (Class)UISNotificationResponseAction;
  v12 = -[UISNotificationResponseAction initWithInfo:responder:](&v17, sel_initWithInfo_responder_, v9, v11);
  if (v12)
  {
    v13 = objc_msgSend(v7, "copy");
    response = v12->_response;
    v12->_response = (UNNotificationResponse *)v13;

  }
  return v12;
}

- (BOOL)isLocal
{
  return !-[UISNotificationResponseAction isRemote](self, "isRemote");
}

- (BOOL)isRemote
{
  void *v2;
  char isKindOfClass;

  -[UISNotificationResponseAction _trigger](self, "_trigger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("UNPushNotificationTrigger"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)isDefaultAction
{
  void *v2;
  void *v3;
  _QWORD *v4;
  char v5;
  BOOL result;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  -[UISNotificationResponseAction response](self, "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v4 = (_QWORD *)_MergedGlobals_6;
  v13 = _MergedGlobals_6;
  if (!_MergedGlobals_6)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __getUNNotificationDefaultActionIdentifierSymbolLoc_block_invoke;
    v9[3] = &unk_1E2CAF658;
    v9[4] = &v10;
    __getUNNotificationDefaultActionIdentifierSymbolLoc_block_invoke(v9);
    v4 = (_QWORD *)v11[3];
  }
  _Block_object_dispose(&v10, 8);
  if (v4)
  {
    v5 = objc_msgSend(v3, "isEqualToString:", *v4);

    return v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *const getUNNotificationDefaultActionIdentifier(void)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("UISNotificationResponseAction.m"), 19, CFSTR("%s"), dlerror());

    __break(1u);
  }
  return result;
}

- (id)_trigger
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[UISNotificationResponseAction response](self, "response");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trigger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)UIActionType
{
  return 26;
}

- (UISNotificationResponseAction)initWithXPCDictionary:(id)a3
{
  UISNotificationResponseAction *v3;
  UISNotificationResponseAction *v4;
  void *v5;
  uint64_t v6;
  UNNotificationResponse *response;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UISNotificationResponseAction;
  v3 = -[UISNotificationResponseAction initWithXPCDictionary:](&v9, sel_initWithXPCDictionary_, a3);
  v4 = v3;
  if (v3)
  {
    -[UISNotificationResponseAction info](v3, "info");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForSetting:", 1);
    v6 = objc_claimAutoreleasedReturnValue();

    response = v4->_response;
    v4->_response = (UNNotificationResponse *)v6;

  }
  return v4;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("response");
  else
    return 0;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v6;

  if (a5 != 1)
    return 0;
  -[UNNotificationResponse description](self->_response, "description", a3, a4, v5, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UISNotificationResponseAction;
  if (-[UISNotificationResponseAction isKindOfClass:](&v5, sel_isKindOfClass_))
    return 1;
  else
    return -[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class());
}

- (UNNotificationResponse)response
{
  return self->_response;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
}

@end
