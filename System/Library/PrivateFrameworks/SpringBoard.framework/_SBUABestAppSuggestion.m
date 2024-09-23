@implementation _SBUABestAppSuggestion

- (uint64_t)appSuggestion
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (id)initWithAppSuggestion:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)_SBUABestAppSuggestion;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

- (id)uniqueIdentifier
{
  return (id)-[UABestAppSuggestion uniqueIdentifier](self->_appSuggestion, "uniqueIdentifier");
}

- (id)bundleIdentifier
{
  return (id)-[UABestAppSuggestion bundleIdentifier](self->_appSuggestion, "bundleIdentifier");
}

- (id)activityType
{
  return (id)-[UABestAppSuggestion activityType](self->_appSuggestion, "activityType");
}

- (id)lastUpdateTime
{
  return (id)-[UABestAppSuggestion lastUpdateTime](self->_appSuggestion, "lastUpdateTime");
}

- (id)originatingDeviceIdentifier
{
  return (id)-[UABestAppSuggestion originatingDeviceIdentifier](self->_appSuggestion, "originatingDeviceIdentifier");
}

- (id)originatingDeviceName
{
  return (id)-[UABestAppSuggestion originatingDeviceName](self->_appSuggestion, "originatingDeviceName");
}

- (id)originatingDeviceType
{
  return (id)-[UABestAppSuggestion originatingDeviceType](self->_appSuggestion, "originatingDeviceType");
}

- (BOOL)isNotificationSuggestion
{
  void *v2;
  void *v3;
  char v4;

  -[UABestAppSuggestion options](self->_appSuggestion, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0DC5ED8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isOpenURLSuggestion
{
  return -[UABestAppSuggestion type](self->_appSuggestion, "type") == 10;
}

- (BOOL)isCallContinuitySuggestion
{
  void *v4;
  char v5;

  if (-[UABestAppSuggestion type](self->_appSuggestion, "type") == 12)
    return 1;
  -[UABestAppSuggestion activityType](self->_appSuggestion, "activityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = TUIsCallHandoffActivityType();

  return v5;
}

- (BOOL)isLocallyGeneratedSuggestion
{
  return -[UABestAppSuggestion type](self->_appSuggestion, "type") == 5
      || -[UABestAppSuggestion type](self->_appSuggestion, "type") == 10;
}

- (BOOL)isLocationBasedSuggestion
{
  return -[UABestAppSuggestion type](self->_appSuggestion, "type") == 5;
}

- (BOOL)isHandoff
{
  return -[UABestAppSuggestion type](self->_appSuggestion, "type") != 5
      && -[UABestAppSuggestion type](self->_appSuggestion, "type") != 10;
}

- (BOOL)isEqual:(id)a3
{
  _SBUABestAppSuggestion *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (_SBUABestAppSuggestion *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_SBUABestAppSuggestion uniqueIdentifier](v4, "uniqueIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SBUABestAppSuggestion uniqueIdentifier](self, "uniqueIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[_SBUABestAppSuggestion uniqueIdentifier](self, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appSuggestion, 0);
}

@end
