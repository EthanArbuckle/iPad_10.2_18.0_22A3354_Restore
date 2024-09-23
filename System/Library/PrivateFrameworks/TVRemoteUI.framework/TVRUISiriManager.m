@implementation TVRUISiriManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_13);
  return (id)sharedManager_manager;
}

void __33__TVRUISiriManager_sharedManager__block_invoke()
{
  TVRUISiriManager *v0;
  void *v1;

  v0 = objc_alloc_init(TVRUISiriManager);
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;

}

- (void)registerForSiriEvents
{
  -[TVRUISiriManager _activateSiriAssertion](self, "_activateSiriAssertion");
  -[TVRUISiriManager _registerForSiriButtonEvents](self, "_registerForSiriButtonEvents");
}

- (void)unregisterForSiriEvents
{
  -[TVRUISiriManager _releaseSiriAssertion](self, "_releaseSiriAssertion");
  -[TVRUISiriManager _unregisterForSiriButtonEvents](self, "_unregisterForSiriButtonEvents");
}

- (void)dealloc
{
  objc_super v3;

  -[TVRUISiriManager unregisterForSiriEvents](self, "unregisterForSiriEvents");
  v3.receiver = self;
  v3.super_class = (Class)TVRUISiriManager;
  -[TVRUISiriManager dealloc](&v3, sel_dealloc);
}

- (void)_activateSiriAssertion
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  -[TVRUISiriManager siriAssertion](self, "siriAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    _TVRUISiriLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, "Grabbing activation assertion", v9, 2u);
    }

    v5 = objc_alloc(MEMORY[0x24BE90810]);
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithIdentifier:reason:", v7, 1);
    -[TVRUISiriManager setSiriAssertion:](self, "setSiriAssertion:", v8);

  }
}

- (void)_releaseSiriAssertion
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[TVRUISiriManager siriAssertion](self, "siriAssertion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    _TVRUISiriLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, "Releasing activation assertion", v6, 2u);
    }

    -[TVRUISiriManager siriAssertion](self, "siriAssertion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    -[TVRUISiriManager setSiriAssertion:](self, "setSiriAssertion:", 0);
  }
}

- (void)_registerForSiriButtonEvents
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE90818], "listener");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerWithListener:identifier:", self, v4);

}

- (void)_unregisterForSiriButtonEvents
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BE90818], "listener");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unregisterListenerWithIdentifier:", v3);

}

- (void)buttonEventListenerDidReceiveButtonDownWithButtonIdentifier:(int64_t)a3 atTimestamp:(double)a4
{
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 3, 4, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __92__TVRUISiriManager_buttonEventListenerDidReceiveButtonDownWithButtonIdentifier_atTimestamp___block_invoke;
  v7[3] = &unk_24DE2C830;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __92__TVRUISiriManager_buttonEventListenerDidReceiveButtonDownWithButtonIdentifier_atTimestamp___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "buttonActionsDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "generatedButtonEvent:", *(_QWORD *)(a1 + 40));

}

- (void)buttonEventListenerDidReceiveButtonLongPressWithButtonIdentifier:(int64_t)a3 atTimestamp:(double)a4
{
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 1, 4, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __97__TVRUISiriManager_buttonEventListenerDidReceiveButtonLongPressWithButtonIdentifier_atTimestamp___block_invoke;
  v7[3] = &unk_24DE2C830;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __97__TVRUISiriManager_buttonEventListenerDidReceiveButtonLongPressWithButtonIdentifier_atTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "buttonActionsDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "generatedButtonEvent:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "_donateTipsTrigger");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("TVRUISiriManagerSiriActivated"), 0);

}

- (void)buttonEventListenerDidReceiveButtonUpWithButtonIdentifier:(int64_t)a3 atTimestamp:(double)a4
{
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 2, 4, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __90__TVRUISiriManager_buttonEventListenerDidReceiveButtonUpWithButtonIdentifier_atTimestamp___block_invoke;
  v7[3] = &unk_24DE2C830;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __90__TVRUISiriManager_buttonEventListenerDidReceiveButtonUpWithButtonIdentifier_atTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "buttonActionsDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "generatedButtonEvent:", *(_QWORD *)(a1 + 40));

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("TVRUISiriManagerSiriDeactivated"), 0);

}

- (void)_donateTipsTrigger
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  _TVRUITipsLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21B042000, v2, OS_LOG_TYPE_DEFAULT, "Donating trigger for Siri tip context", v8, 2u);
  }

  BiomeLibrary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "Discoverability");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "Signals");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0C3A0]), "initWithContentIdentifier:context:osBuild:userInfo:", CFSTR("com.apple.TVRemoteUI.userIntentButton-tapped"), 0, 0, 0);
  objc_msgSend(v6, "sendEvent:", v7);

}

- (_TVRUIEventDelegate)buttonActionsDelegate
{
  return (_TVRUIEventDelegate *)objc_loadWeakRetained((id *)&self->_buttonActionsDelegate);
}

- (void)setButtonActionsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_buttonActionsDelegate, a3);
}

- (SiriActivationAssertion)siriAssertion
{
  return self->_siriAssertion;
}

- (void)setSiriAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_siriAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriAssertion, 0);
  objc_destroyWeak((id *)&self->_buttonActionsDelegate);
}

@end
