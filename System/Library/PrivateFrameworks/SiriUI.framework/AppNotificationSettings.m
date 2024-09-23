@implementation AppNotificationSettings

- (AppNotificationSettings)initWithAnnounceEnabled:(BOOL)a3 carPlayBannersEnabled:(BOOL)a4
{
  AppNotificationSettings *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AppNotificationSettings;
  result = -[AppNotificationSettings init](&v7, sel_init);
  if (result)
  {
    result->_announceEnabled = a3;
    result->_carPlayBannersEnabled = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  _BOOL4 v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[AppNotificationSettings isAnnounceEnabled](self, "isAnnounceEnabled");
    if (v6 == objc_msgSend(v5, "isAnnounceEnabled"))
    {
      v8 = -[AppNotificationSettings areCarPlayBannersEnabled](self, "areCarPlayBannersEnabled");
      v7 = v8 ^ objc_msgSend(v5, "areCarPlayBannersEnabled") ^ 1;
    }
    else
    {
      LOBYTE(v7) = 0;
    }

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)isAnnounceEnabled
{
  return self->_announceEnabled;
}

- (void)setAnnounceEnabled:(BOOL)a3
{
  self->_announceEnabled = a3;
}

- (BOOL)areCarPlayBannersEnabled
{
  return self->_carPlayBannersEnabled;
}

- (void)setCarPlayBannersEnabled:(BOOL)a3
{
  self->_carPlayBannersEnabled = a3;
}

@end
