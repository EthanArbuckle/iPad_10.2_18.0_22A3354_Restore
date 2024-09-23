@implementation STUMutePropertyProvider

- (STUMutePropertyProvider)init
{
  STUMutePropertyProvider *v2;
  STUMutePropertyProvider *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUMutePropertyProvider;
  v2 = -[STUMutePropertyProvider init](&v5, "init");
  v3 = v2;
  if (v2)
    -[STUDevicePropertyProvider setValue:](v2, "setValue:", &__kCFBooleanFalse);
  return v3;
}

- (id)key
{
  return CRKDeviceMutedKey;
}

- (BOOL)isMuted
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevicePropertyProvider value](self, "value"));
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setMuted:(BOOL)a3
{
  void *v3;
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;

  v4 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevicePropertyProvider value](self, "value"));
  if (v6
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4))) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevicePropertyProvider value](self, "value"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if (v6)
    {

      if ((v9 & 1) != 0)
        return;
LABEL_7:
      v10 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
      -[STUDevicePropertyProvider setValue:](self, "setValue:", v10);

      return;
    }

    if ((v9 & 1) == 0)
      goto LABEL_7;
  }
}

@end
