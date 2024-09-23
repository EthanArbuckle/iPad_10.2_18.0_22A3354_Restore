@implementation SearchUIScreenTimeRequestButton

+ (BOOL)supportsRowModel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v3 = a3;
  objc_msgSend(v3, "buttonItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1 && objc_msgSend(v3, "buttonItemsAreTrailing"))
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "command");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "punchout");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "label");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_msgSend(v7, "urls");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "firstObject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "scheme");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("prefs"));

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)requestIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[SearchUIRequestButton command](self, "command");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "punchout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "label");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)getRequestState
{
  void *v2;
  void *v3;
  int v4;
  int v5;
  int v6;

  -[SearchUIScreenTimeRequestButton requestIdentifier](self, "requestIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[SearchUIScreenTimeRequestStatusManager sharedManager](SearchUIScreenTimeRequestStatusManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "statusForRequestID:", v2);

    if (v4 == 2)
      v5 = 3;
    else
      v5 = 1;
    if (v4 == 3)
      v6 = 2;
    else
      v6 = v5;
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SearchUIScreenTimeRequestButton;
  v4 = a3;
  -[SearchUIAccessoryViewController updateWithRowModel:](&v13, sel_updateWithRowModel_, v4);
  objc_msgSend(v4, "buttonItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "command");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIRequestButton setCommand:](self, "setCommand:", v7);
  objc_msgSend(v6, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIRequestButton viewButton](self, "viewButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTitle:", v8);

  v10 = objc_msgSend(v4, "useCompactVersionOfUI");
  -[SearchUIRequestButton viewButton](self, "viewButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUseCompactMode:", v10);

  -[SearchUIScreenTimeRequestButton setupSubscription](self, "setupSubscription");
  v12.receiver = self;
  v12.super_class = (Class)SearchUIScreenTimeRequestButton;
  -[SearchUIRequestButton updateButtonState:withState:](&v12, sel_updateButtonState_withState_, 0, -[SearchUIScreenTimeRequestButton getRequestState](self, "getRequestState"));

}

- (void)setupSubscription
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[SearchUIScreenTimeRequestButton screentimeRequestStatusObserver](self, "screentimeRequestStatusObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[SearchUIScreenTimeRequestStatusManager sharedManager](SearchUIScreenTimeRequestStatusManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __52__SearchUIScreenTimeRequestButton_setupSubscription__block_invoke;
    v6[3] = &unk_1EA1F6540;
    v6[4] = self;
    objc_msgSend(v4, "addObserver:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUIScreenTimeRequestButton setScreentimeRequestStatusObserver:](self, "setScreentimeRequestStatusObserver:", v5);

  }
}

void __52__SearchUIScreenTimeRequestButton_setupSubscription__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SearchUIScreenTimeRequestButton_setupSubscription__block_invoke_2;
  block[3] = &unk_1EA1F62F0;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

id __52__SearchUIScreenTimeRequestButton_setupSubscription__block_invoke_2(uint64_t a1)
{
  void *v1;
  objc_super v3;

  v1 = *(void **)(a1 + 32);
  v3.receiver = v1;
  v3.super_class = (Class)SearchUIScreenTimeRequestButton;
  return objc_msgSendSuper2(&v3, sel_updateButtonState_withState_, 1, objc_msgSend(v1, "getRequestState"));
}

- (void)dealloc
{
  void *v3;
  void *v4;
  NSObject *screentimeRequestStatusObserver;
  objc_super v6;

  +[SearchUIScreenTimeRequestStatusManager sharedManager](SearchUIScreenTimeRequestStatusManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUIScreenTimeRequestButton screentimeRequestStatusObserver](self, "screentimeRequestStatusObserver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", v4);

  screentimeRequestStatusObserver = self->_screentimeRequestStatusObserver;
  self->_screentimeRequestStatusObserver = 0;

  v6.receiver = self;
  v6.super_class = (Class)SearchUIScreenTimeRequestButton;
  -[SearchUIScreenTimeRequestButton dealloc](&v6, sel_dealloc);
}

- (unint64_t)type
{
  return 8;
}

- (NSObject)screentimeRequestStatusObserver
{
  return self->_screentimeRequestStatusObserver;
}

- (void)setScreentimeRequestStatusObserver:(id)a3
{
  objc_storeStrong((id *)&self->_screentimeRequestStatusObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screentimeRequestStatusObserver, 0);
}

@end
