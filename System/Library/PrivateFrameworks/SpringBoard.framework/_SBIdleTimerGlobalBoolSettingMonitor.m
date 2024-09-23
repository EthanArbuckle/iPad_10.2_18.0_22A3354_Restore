@implementation _SBIdleTimerGlobalBoolSettingMonitor

- (BOOL)BOOLValue
{
  void *v2;
  char v3;

  -[_SBIdleTimerGlobalNumericSettingMonitor numericValue](self, "numericValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (_SBIdleTimerGlobalBoolSettingMonitor)initWithLabel:(id)a3 delegate:(id)a4 updatingForNotification:(id)a5 fetchingWith:(id)a6
{
  id v10;
  _SBIdleTimerGlobalBoolSettingMonitor *v11;
  objc_super v13;
  _QWORD v14[4];
  id v15;

  v14[1] = 3221225472;
  v14[2] = __100___SBIdleTimerGlobalBoolSettingMonitor_initWithLabel_delegate_updatingForNotification_fetchingWith___block_invoke;
  v14[3] = &unk_1E8EBD608;
  v15 = a6;
  v13.receiver = self;
  v13.super_class = (Class)_SBIdleTimerGlobalBoolSettingMonitor;
  v14[0] = MEMORY[0x1E0C809B0];
  v10 = v15;
  v11 = -[_SBIdleTimerGlobalNumericSettingMonitor initWithLabel:delegate:updatingForNotification:fetchingWith:](&v13, sel_initWithLabel_delegate_updatingForNotification_fetchingWith_, a3, a4, a5, v14);

  return v11;
}

- (id)formattedValue
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SBIdleTimerGlobalBoolSettingMonitor BOOLValue](self, "BOOLValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
