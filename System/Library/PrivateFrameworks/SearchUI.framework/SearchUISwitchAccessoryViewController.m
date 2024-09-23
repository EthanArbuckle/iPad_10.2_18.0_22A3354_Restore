@implementation SearchUISwitchAccessoryViewController

+ (BOOL)supportsRowModel:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  +[SearchUIShortcutsUtilities commandForSettingTogglesFromRowModel:](SearchUIShortcutsUtilities, "commandForSettingTogglesFromRowModel:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "biomeStreamIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length") != 0;

  return v5;
}

- (id)setupView
{
  return (id)objc_opt_new();
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SearchUISwitchAccessoryViewController subscriber](self, "subscriber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SearchUISwitchAccessoryViewController;
  -[SearchUISwitchAccessoryViewController dealloc](&v4, sel_dealloc);
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SearchUISwitchAccessoryViewController;
  v4 = a3;
  -[SearchUIAccessoryViewController updateWithRowModel:](&v15, sel_updateWithRowModel_, v4);
  -[SearchUISwitchAccessoryViewController subscriber](self, "subscriber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SearchUISwitchAccessoryViewController subscriber](self, "subscriber");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:", self);

    -[SearchUISwitchAccessoryViewController setSubscriber:](self, "setSubscriber:", 0);
  }
  objc_msgSend(v4, "contextualAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIShortcutsUtilities commandForSettingTogglesFromRowModel:](SearchUIShortcutsUtilities, "commandForSettingTogglesFromRowModel:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "biomeStreamIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUISwitchAccessoryViewController setAction:](self, "setAction:", v7);
  +[SearchUIBiomeSubscriberRegistry sharedManager](SearchUIBiomeSubscriberRegistry, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestSubscriberForIdentifier:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUISwitchAccessoryViewController setSubscriber:](self, "setSubscriber:", v11);

  -[SearchUISwitchAccessoryViewController subscriber](self, "subscriber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__SearchUISwitchAccessoryViewController_updateWithRowModel___block_invoke;
  v14[3] = &unk_1EA1F8A60;
  v14[4] = self;
  objc_msgSend(v12, "getLatestEventWithCompletion:", v14);

  -[SearchUISwitchAccessoryViewController subscriber](self, "subscriber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:", self, sel_updateWithNotification_);

}

uint64_t __60__SearchUISwitchAccessoryViewController_updateWithRowModel___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateForEvent:animated:", a2, 0);
}

- (void)updateWithNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("event"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    -[SearchUISwitchAccessoryViewController updateForEvent:animated:](self, "updateForEvent:animated:", v6, 1);
    v5 = v6;
  }

}

- (void)updateForEvent:(id)a3 animated:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  id v17;
  BOOL v18;
  id location;

  v6 = a3;
  -[SearchUISwitchAccessoryViewController action](self, "action");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SearchUISwitchAccessoryViewController action](self, "action");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SearchUIBiomeEvent eventForEvent:contextualAction:](SearchUIBiomeEvent, "eventForEvent:contextualAction:", v6, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v9;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = v6;
    objc_initWeak(&location, self);
    -[SearchUISwitchAccessoryViewController subscriber](self, "subscriber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "streamIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __65__SearchUISwitchAccessoryViewController_updateForEvent_animated___block_invoke;
    v15[3] = &unk_1EA1F8A88;
    objc_copyWeak(&v17, &location);
    v13 = v12;
    v16 = v13;
    v18 = a4;
    objc_msgSend(v10, "getEnabledStatusWithCompletion:", v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __65__SearchUISwitchAccessoryViewController_updateForEvent_animated___block_invoke_52;
    v14[3] = &unk_1EA1F62F0;
    v14[4] = self;
    +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v14);
  }

}

void __65__SearchUISwitchAccessoryViewController_updateForEvent_animated___block_invoke(uint64_t a1, char a2)
{
  _QWORD v4[4];
  id v5;
  id v6;
  char v7;
  char v8;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__SearchUISwitchAccessoryViewController_updateForEvent_animated___block_invoke_2;
  v4[3] = &unk_1EA1F60A8;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v5 = *(id *)(a1 + 32);
  v7 = a2;
  v8 = *(_BYTE *)(a1 + 48);
  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", v4);

  objc_destroyWeak(&v6);
}

void __65__SearchUISwitchAccessoryViewController_updateForEvent_animated___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  SearchUIBiomeLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(unsigned __int8 *)(a1 + 48);
    v12 = 138412546;
    v13 = v4;
    v14 = 1024;
    v15 = v5;
    _os_log_impl(&dword_1DAD39000, v3, OS_LOG_TYPE_DEFAULT, "Evaluated event from BiomeStream (%@) to %d", (uint8_t *)&v12, 0x12u);
  }

  objc_msgSend(WeakRetained, "subscriber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "streamIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    SearchUIBiomeLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(unsigned __int8 *)(a1 + 48);
      v12 = 138412546;
      v13 = v10;
      v14 = 1024;
      v15 = v11;
      _os_log_impl(&dword_1DAD39000, v9, OS_LOG_TYPE_DEFAULT, "Updated switch for BiomeStream (%@) to state: %d", (uint8_t *)&v12, 0x12u);
    }

    objc_msgSend(WeakRetained, "debounceSetOn:animated:", *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
    objc_msgSend(WeakRetained, "setIsHiddenByEvent:", 0);
  }

}

uint64_t __65__SearchUISwitchAccessoryViewController_updateForEvent_animated___block_invoke_52(uint64_t a1)
{
  NSObject *v2;

  SearchUIBiomeLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __65__SearchUISwitchAccessoryViewController_updateForEvent_animated___block_invoke_52_cold_1(a1, v2);

  return objc_msgSend(*(id *)(a1 + 32), "setIsHiddenByEvent:", 1);
}

- (void)setIsHiddenByEvent:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL8 v5;
  void *v6;
  double v7;
  id v8;

  v3 = a3;
  self->_isHiddenByEvent = a3;
  v5 = !a3;
  -[SearchUIAccessoryViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v5);

  if (v3)
    v7 = 0.0;
  else
    v7 = 1.0;
  -[SearchUIAccessoryViewController view](self, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", v7);

}

- (void)debounceSetOn:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  dispatch_block_t v9;
  dispatch_time_t v10;
  void *v11;
  _QWORD v12[5];
  BOOL v13;
  BOOL v14;

  v4 = a4;
  v5 = a3;
  if (-[SearchUISwitchAccessoryViewController isAwaitingUpdate](self, "isAwaitingUpdate"))
  {
    -[SearchUISwitchAccessoryViewController debounceBlock](self, "debounceBlock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[SearchUISwitchAccessoryViewController debounceBlock](self, "debounceBlock");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_block_cancel(v8);

    }
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __64__SearchUISwitchAccessoryViewController_debounceSetOn_animated___block_invoke;
    v12[3] = &unk_1EA1F8AB0;
    v12[4] = self;
    v13 = v5;
    v14 = v4;
    v9 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, v12);
    -[SearchUISwitchAccessoryViewController setDebounceBlock:](self, "setDebounceBlock:", v9);

    v10 = dispatch_time(0, 50000000);
    -[SearchUISwitchAccessoryViewController debounceBlock](self, "debounceBlock");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_after(v10, MEMORY[0x1E0C80D38], v11);

  }
  else
  {
    -[SearchUISwitchAccessoryViewController setOn:animated:](self, "setOn:animated:", v5, v4);
  }
}

uint64_t __64__SearchUISwitchAccessoryViewController_debounceSetOn_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setOn:animated:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
  return objc_msgSend(*(id *)(a1 + 32), "setIsAwaitingUpdate:", 0);
}

- (void)setOn:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  int v8;
  id v9;

  v4 = a4;
  v5 = a3;
  -[SearchUIAccessoryViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isOn");

  if (v8 != v5)
  {
    -[SearchUIAccessoryViewController view](self, "view");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setOn:animated:", v5, v4);

  }
}

- (void)buttonPressed
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SearchUISwitchAccessoryViewController setIsAwaitingUpdate:](self, "setIsAwaitingUpdate:", 1);
  -[SearchUIAccessoryViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUISwitchAccessoryViewController setExpectedUpdateState:](self, "setExpectedUpdateState:", objc_msgSend(v3, "isOn"));

  -[SearchUIAccessoryViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "feedbackDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIUtilities environmentForDelegate:](SearchUIUtilities, "environmentForDelegate:", v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[SearchUIAccessoryViewController rowModel](self, "rowModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUIShortcutsUtilities commandForSettingTogglesFromRowModel:](SearchUIShortcutsUtilities, "commandForSettingTogglesFromRowModel:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SearchUIAccessoryViewController rowModel](self, "rowModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SearchUICommandHandler handlerForCommand:rowModel:button:sectionModel:environment:](SearchUICommandHandler, "handlerForCommand:rowModel:button:sectionModel:environment:", v7, v8, 0, 0, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "executeWithTriggerEvent:", 3);
}

- (BOOL)isAwaitingUpdate
{
  return self->_isAwaitingUpdate;
}

- (void)setIsAwaitingUpdate:(BOOL)a3
{
  self->_isAwaitingUpdate = a3;
}

- (BOOL)expectedUpdateState
{
  return self->_expectedUpdateState;
}

- (void)setExpectedUpdateState:(BOOL)a3
{
  self->_expectedUpdateState = a3;
}

- (SearchUIBiomeStreamSubscriber)subscriber
{
  return (SearchUIBiomeStreamSubscriber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSubscriber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (WFContextualAction)action
{
  return (WFContextualAction *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)isHiddenByEvent
{
  return self->_isHiddenByEvent;
}

- (id)debounceBlock
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setDebounceBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_debounceBlock, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_subscriber, 0);
}

void __65__SearchUISwitchAccessoryViewController_updateForEvent_animated___block_invoke_52_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settingBiomeStreamIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1DAD39000, a2, OS_LOG_TYPE_ERROR, "Could not get enablement status for biome event (%@)", (uint8_t *)&v5, 0xCu);

}

@end
