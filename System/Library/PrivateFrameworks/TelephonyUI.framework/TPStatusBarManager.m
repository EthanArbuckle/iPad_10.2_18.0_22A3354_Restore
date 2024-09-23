@implementation TPStatusBarManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__TPStatusBarManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance_sharedInstance_0;
}

void __36__TPStatusBarManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v1;

}

- (TPStatusBarManager)init
{
  TPStatusBarManager *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPStatusBarManager;
  v2 = -[TPStatusBarManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_updateCurrentAbbreviatedStatusBarStringAndSendNotification, *MEMORY[0x1E0DBD4A0], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_updateCurrentAbbreviatedStatusBarStringAndSendNotification, *MEMORY[0x1E0DBD4F0], 0);

    -[TPStatusBarManager updateCurrentAbbreviatedStatusBarString](v2, "updateCurrentAbbreviatedStatusBarString");
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[TPStatusBarManager callDurationTimer](self, "callDurationTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  v5.receiver = self;
  v5.super_class = (Class)TPStatusBarManager;
  -[TPStatusBarManager dealloc](&v5, sel_dealloc);
}

- (void)updateCurrentAbbreviatedStatusBarString
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeVideoCall");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (id)v4;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayedCall");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v5 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "incomingVideoCall");
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (!v5)
    {
      v19 = 0;
      goto LABEL_11;
    }
  }
  objc_msgSend(v5, "callDurationString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%02d:%02d"), 0, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = v12;

LABEL_11:
  -[TPStatusBarManager currentAbbreviatedStatusBarString](self, "currentAbbreviatedStatusBarString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = TUStringsAreEqualOrNil();

  if ((v14 & 1) == 0)
  {
    -[TPStatusBarManager setCurrentAbbreviatedStatusBarString:](self, "setCurrentAbbreviatedStatusBarString:", v19);
    -[TPStatusBarManager currentAbbreviatedStatusBarString](self, "currentAbbreviatedStatusBarString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[TPStatusBarManager callDurationTimer](self, "callDurationTimer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15)
    {

      if (!v17)
      {
        objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_updateCurrentAbbreviatedStatusBarStringAndSendNotification, 0, 1, 1.0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[TPStatusBarManager setCallDurationTimer:](self, "setCallDurationTimer:", v18);

      }
    }
    else
    {
      objc_msgSend(v16, "invalidate");

      -[TPStatusBarManager setCallDurationTimer:](self, "setCallDurationTimer:", 0);
    }
  }

}

- (void)updateCurrentAbbreviatedStatusBarStringAndSendNotification
{
  id v3;

  -[TPStatusBarManager updateCurrentAbbreviatedStatusBarString](self, "updateCurrentAbbreviatedStatusBarString");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("TPStatusBarManagerStringChangedNotification"), self);

}

- (NSString)currentAbbreviatedStatusBarString
{
  return self->_currentAbbreviatedStatusBarString;
}

- (void)setCurrentAbbreviatedStatusBarString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSTimer)callDurationTimer
{
  return self->_callDurationTimer;
}

- (void)setCallDurationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_callDurationTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callDurationTimer, 0);
  objc_storeStrong((id *)&self->_currentAbbreviatedStatusBarString, 0);
}

@end
