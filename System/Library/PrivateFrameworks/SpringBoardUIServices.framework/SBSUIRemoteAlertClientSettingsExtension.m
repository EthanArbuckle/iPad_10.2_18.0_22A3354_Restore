@implementation SBSUIRemoteAlertClientSettingsExtension

+ (id)protocol
{
  return &unk_1EE7D2828;
}

+ (id)valueForUndefinedSetting:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "matchesProperty:", sel_backgroundActivitiesToSuppress))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___SBSUIRemoteAlertClientSettingsExtension;
    objc_msgSendSuper2(&v8, sel_valueForUndefinedSetting_, v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

@end
