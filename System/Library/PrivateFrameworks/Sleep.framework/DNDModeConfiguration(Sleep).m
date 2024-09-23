@implementation DNDModeConfiguration(Sleep)

- (uint64_t)hksp_configurationState
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "configuration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "senderConfigurationType") == 2 && objc_msgSend(v1, "applicationConfigurationType") == 2)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "senderConfigurationType") || objc_msgSend(v1, "applicationConfigurationType"))
  {
    if (objc_msgSend(v1, "senderConfigurationType") == 1 && objc_msgSend(v1, "applicationConfigurationType") == 1)
      v2 = 2;
    else
      v2 = 0;
  }
  else
  {
    v2 = 3;
  }

  return v2;
}

- (id)hksp_configurationWithConfigurationState:()Sleep
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if ((unint64_t)(a3 - 1) <= 2)
  {
    v7 = 3 - a3;
    objc_msgSend(v6, "setSenderConfigurationType:", v7);
    objc_msgSend(v6, "setApplicationConfigurationType:", v7);
  }
  objc_msgSend(v4, "setConfiguration:", v6);
  v8 = (void *)objc_msgSend(v4, "copy");

  return v8;
}

@end
