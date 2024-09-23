@implementation CSRecieverState

- (BOOL)checkBundleIdentifier:(id)a3
{
  id v4;
  CSRecieverState *v5;
  BOOL v6;
  int check;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  check = 0;
  notify_check(v5->_notifyToken, &check);
  if (check == 1)
    -[CSRecieverState _updateFromPreferences](v5, "_updateFromPreferences");
  v6 = -[NSSet containsObject:](v5->_disabledBundleIdentifiers, "containsObject:", v4);
  if (!v6 && !-[NSSet containsObject:](v5->_enabledBundleIdentifiers, "containsObject:", v4))
    -[CSReceiverPreferences enableBundleIdentifier:](v5->_receiverPreferences, "enableBundleIdentifier:", v4);
  objc_sync_exit(v5);

  return !v6;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_9);
  return (id)sCSRecieverState;
}

- (CSRecieverState)init
{
  CSRecieverState *v2;
  CSReceiverPreferences *v3;
  CSReceiverPreferences *receiverPreferences;
  int v5;
  int check;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSRecieverState;
  v2 = -[CSRecieverState init](&v8, sel_init);
  if (v2)
  {
    v3 = (CSReceiverPreferences *)objc_alloc_init(MEMORY[0x24BDC2448]);
    receiverPreferences = v2->_receiverPreferences;
    v2->_receiverPreferences = v3;

    if (-[CSReceiverPreferences notifyStart](v2->_receiverPreferences, "notifyStart"))
    {
      v5 = -[CSReceiverPreferences notifyToken](v2->_receiverPreferences, "notifyToken");
      v2->_notifyToken = v5;
      check = 0;
      notify_check(v5, &check);
      -[CSRecieverState _updateFromPreferences](v2, "_updateFromPreferences");
    }
  }
  return v2;
}

void __33__CSRecieverState_sharedInstance__block_invoke()
{
  CSRecieverState *v0;
  void *v1;

  v0 = objc_alloc_init(CSRecieverState);
  v1 = (void *)sCSRecieverState;
  sCSRecieverState = (uint64_t)v0;

}

- (void)_updateFromPreferences
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSSet *v7;
  NSSet *enabledBundleIdentifiers;
  NSSet *v9;
  NSSet *disabledBundleIdentifiers;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  -[CSReceiverPreferences dictionary](self->_receiverPreferences, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __41__CSRecieverState__updateFromPreferences__block_invoke;
  v12[3] = &unk_24D0EDDE8;
  v13 = v3;
  v14 = v4;
  v6 = v4;
  v11 = v3;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v12);

  v7 = (NSSet *)objc_msgSend(v11, "copy");
  enabledBundleIdentifiers = self->_enabledBundleIdentifiers;
  self->_enabledBundleIdentifiers = v7;

  v9 = (NSSet *)objc_msgSend(v6, "copy");
  disabledBundleIdentifiers = self->_disabledBundleIdentifiers;
  self->_disabledBundleIdentifiers = v9;

}

void __41__CSRecieverState__updateFromPreferences__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = objc_msgSend(v5, "BOOLValue");
      v7 = 40;
      if (v6)
        v7 = 32;
      objc_msgSend(*(id *)(a1 + v7), "addObject:", v8);
    }
  }

}

- (CSReceiverPreferences)receiverPreferences
{
  return self->_receiverPreferences;
}

- (NSSet)enabledBundleIdentifiers
{
  return self->_enabledBundleIdentifiers;
}

- (NSSet)disabledBundleIdentifiers
{
  return self->_disabledBundleIdentifiers;
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_enabledBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_receiverPreferences, 0);
}

@end
