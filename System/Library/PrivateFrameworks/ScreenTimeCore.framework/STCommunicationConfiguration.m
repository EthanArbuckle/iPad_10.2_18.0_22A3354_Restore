@implementation STCommunicationConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isCommunicationSafetyNotificationEnabled
{
  return self->_isCommunicationSafetyNotificationEnabled;
}

- (BOOL)isCommunicationSafetyAnalyticsEnabled
{
  return self->_isCommunicationSafetyAnalyticsEnabled;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 isCommunicationSafetySendingRestricted;
  id v5;

  isCommunicationSafetySendingRestricted = self->_isCommunicationSafetySendingRestricted;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", isCommunicationSafetySendingRestricted, CFSTR("isCommunicationSafetySendingRestricted"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isCommunicationSafetyReceivingRestricted, CFSTR("isCommunicationSafetyReceivingRestricted"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isCommunicationSafetyNotificationEnabled, CFSTR("isCommunicationSafetyNotificationEnabled"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isCommunicationSafetyAnalyticsEnabled, CFSTR("isCommunicationSafetyAnalyticsEnabled"));

}

- (STCommunicationConfiguration)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCommunicationSafetySendingRestricted"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCommunicationSafetyReceivingRestricted"));
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCommunicationSafetyNotificationEnabled"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCommunicationSafetyAnalyticsEnabled"));

  return -[STCommunicationConfiguration initWithCommunicationSafetySendingRestricted:communicationSafetyReceivingRestricted:communicationSafetyNotificationEnabled:communicationSafetyAnalyticsEnabled:](self, "initWithCommunicationSafetySendingRestricted:communicationSafetyReceivingRestricted:communicationSafetyNotificationEnabled:communicationSafetyAnalyticsEnabled:", v5, v6, v7, v8);
}

- (STCommunicationConfiguration)initWithCommunicationSafetySendingRestricted:(BOOL)a3 communicationSafetyReceivingRestricted:(BOOL)a4 communicationSafetyNotificationEnabled:(BOOL)a5 communicationSafetyAnalyticsEnabled:(BOOL)a6
{
  STCommunicationConfiguration *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)STCommunicationConfiguration;
  result = -[STCommunicationConfiguration init](&v11, sel_init);
  result->_isCommunicationSafetySendingRestricted = a3;
  result->_isCommunicationSafetyReceivingRestricted = a4;
  result->_isCommunicationSafetyNotificationEnabled = a5;
  result->_isCommunicationSafetyAnalyticsEnabled = a6;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithCommunicationSafetySendingRestricted:communicationSafetyReceivingRestricted:communicationSafetyNotificationEnabled:communicationSafetyAnalyticsEnabled:", self->_isCommunicationSafetySendingRestricted, self->_isCommunicationSafetyReceivingRestricted, self->_isCommunicationSafetyNotificationEnabled, self->_isCommunicationSafetyAnalyticsEnabled);
}

- (BOOL)isEqual:(id)a3
{
  STCommunicationConfiguration *v4;
  BOOL v5;

  v4 = (STCommunicationConfiguration *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[STCommunicationConfiguration isEqualToCommunicationConfiguration:](self, "isEqualToCommunicationConfiguration:", v4);
  }

  return v5;
}

- (BOOL)isEqualToCommunicationConfiguration:(id)a3
{
  STCommunicationConfiguration *v4;
  STCommunicationConfiguration *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  int v9;
  _BOOL4 v11;

  v4 = (STCommunicationConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    v6 = -[STCommunicationConfiguration isCommunicationSafetySendingRestricted](v4, "isCommunicationSafetySendingRestricted");
    if (v6 == -[STCommunicationConfiguration isCommunicationSafetySendingRestricted](self, "isCommunicationSafetySendingRestricted")&& (v7 = -[STCommunicationConfiguration isCommunicationSafetyReceivingRestricted](v5, "isCommunicationSafetyReceivingRestricted"), v7 == -[STCommunicationConfiguration isCommunicationSafetyReceivingRestricted](self, "isCommunicationSafetyReceivingRestricted"))&& (v8 = -[STCommunicationConfiguration isCommunicationSafetyNotificationEnabled](v5, "isCommunicationSafetyNotificationEnabled"), v8 == -[STCommunicationConfiguration isCommunicationSafetyNotificationEnabled](self, "isCommunicationSafetyNotificationEnabled")))
    {
      v11 = -[STCommunicationConfiguration isCommunicationSafetyAnalyticsEnabled](v5, "isCommunicationSafetyAnalyticsEnabled");
      v9 = v11 ^ -[STCommunicationConfiguration isCommunicationSafetyAnalyticsEnabled](self, "isCommunicationSafetyAnalyticsEnabled") ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v9;

  v3 = -[STCommunicationConfiguration isCommunicationSafetySendingRestricted](self, "isCommunicationSafetySendingRestricted");
  v4 = -[STCommunicationConfiguration isCommunicationSafetyReceivingRestricted](self, "isCommunicationSafetyReceivingRestricted");
  v5 = 2;
  if (!v4)
    v5 = 0;
  v6 = v5 | v3;
  if (-[STCommunicationConfiguration isCommunicationSafetyNotificationEnabled](self, "isCommunicationSafetyNotificationEnabled"))
  {
    v7 = 4;
  }
  else
  {
    v7 = 0;
  }
  v8 = -[STCommunicationConfiguration isCommunicationSafetyAnalyticsEnabled](self, "isCommunicationSafetyAnalyticsEnabled");
  v9 = 8;
  if (!v8)
    v9 = 0;
  return v6 | v7 | v9;
}

- (BOOL)isCommunicationSafetySendingRestricted
{
  return self->_isCommunicationSafetySendingRestricted;
}

- (BOOL)isCommunicationSafetyReceivingRestricted
{
  return self->_isCommunicationSafetyReceivingRestricted;
}

@end
