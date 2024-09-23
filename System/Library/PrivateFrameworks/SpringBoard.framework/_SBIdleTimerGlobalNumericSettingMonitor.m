@implementation _SBIdleTimerGlobalNumericSettingMonitor

- (NSNumber)numericValue
{
  NSNumber *settingCache;

  settingCache = self->_settingCache;
  if (!settingCache)
  {
    -[_SBIdleTimerGlobalNumericSettingMonitor _updateCache](self, "_updateCache");
    settingCache = self->_settingCache;
  }
  return settingCache;
}

- (_SBIdleTimerGlobalNumericSettingMonitor)initWithLabel:(id)a3 delegate:(id)a4 updatingForNotification:(id)a5 fetchingWith:(id)a6
{
  id v10;
  id v11;
  _SBIdleTimerGlobalNumericSettingMonitor *v12;
  uint64_t v13;
  id fetchSettingFromSource;
  void *v15;
  objc_super v17;

  v10 = a5;
  v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_SBIdleTimerGlobalNumericSettingMonitor;
  v12 = -[_SBIdleTimerGlobalSettingMonitor initWithLabel:delegate:](&v17, sel_initWithLabel_delegate_, a3, a4);
  if (v12)
  {
    v13 = objc_msgSend(v11, "copy");
    fetchSettingFromSource = v12->_fetchSettingFromSource;
    v12->_fetchSettingFromSource = (id)v13;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v12, sel__settingChanged_, v10, 0);

  }
  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_SBIdleTimerGlobalNumericSettingMonitor;
  -[_SBIdleTimerGlobalNumericSettingMonitor dealloc](&v4, sel_dealloc);
}

- (BOOL)_updateCache
{
  void *v3;
  id *p_settingCache;
  id v5;
  BOOL v6;

  (*((void (**)(void))self->_fetchSettingFromSource + 2))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_settingCache = (id *)&self->_settingCache;
  v5 = *p_settingCache;
  if (!v3)
  {
    if (v5)
    {
      *p_settingCache = 0;

      goto LABEL_6;
    }
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  if ((objc_msgSend(v5, "isEqualToNumber:", v3) & 1) != 0)
    goto LABEL_7;
  objc_storeStrong(p_settingCache, v3);
LABEL_6:
  v6 = 1;
LABEL_8:

  return v6;
}

- (void)_settingChanged:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  BSDispatchMain();

}

- (id)formattedValue
{
  void *v2;
  void *v3;

  -[_SBIdleTimerGlobalNumericSettingMonitor numericValue](self, "numericValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fetchSettingFromSource, 0);
  objc_storeStrong((id *)&self->_settingCache, 0);
}

@end
