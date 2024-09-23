@implementation TUCallServicesClientCapabilities

- (TUCallServicesClientCapabilities)initWithCoder:(id)a3
{
  id v4;
  TUCallServicesClientCapabilities *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TUCallServicesClientCapabilities;
  v5 = -[TUCallServicesClientCapabilities init](&v7, sel_init);
  if (v5)
  {
    v5->_wantsCallDisconnectionOnInvalidation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wantsCallDisconnectionOnInvalidation"));
    v5->_wantsCallStopStreamingOnInvalidation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wantsCallStopStreamingOnInvalidation"));
    v5->_wantsFrequencyChangeNotifications = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wantsFrequencyChangeNotifications"));
    v5->_wantsCallNotificationsDisabledWhileSuspended = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wantsCallNotificationsDisabledWhileSuspended"));
    v5->_wantsToScreenCalls = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wantsToScreenCalls"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 wantsCallDisconnectionOnInvalidation;
  id v5;

  wantsCallDisconnectionOnInvalidation = self->_wantsCallDisconnectionOnInvalidation;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", wantsCallDisconnectionOnInvalidation, CFSTR("wantsCallDisconnectionOnInvalidation"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_wantsCallStopStreamingOnInvalidation, CFSTR("wantsCallStopStreamingOnInvalidation"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_wantsFrequencyChangeNotifications, CFSTR("wantsFrequencyChangeNotifications"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_wantsCallNotificationsDisabledWhileSuspended, CFSTR("wantsCallNotificationsDisabledWhileSuspended"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_wantsToScreenCalls, CFSTR("wantsToScreenCalls"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)save
{
  id v3;

  -[TUCallServicesClientCapabilities delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClientCapabilities:", self);

}

- (TUCallServicesClientCapabilitiesActions)delegate
{
  return (TUCallServicesClientCapabilitiesActions *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" wantsCallDisconnectionOnInvalidation: %d"), -[TUCallServicesClientCapabilities wantsCallDisconnectionOnInvalidation](self, "wantsCallDisconnectionOnInvalidation"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" wantsFrequencyChangeNotifications: %d"), -[TUCallServicesClientCapabilities wantsFrequencyChangeNotifications](self, "wantsFrequencyChangeNotifications"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" wantsCallStopStreamingOnInvalidation: %d"), -[TUCallServicesClientCapabilities wantsCallStopStreamingOnInvalidation](self, "wantsCallStopStreamingOnInvalidation"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" wantsCallNotificationsDisabledWhileSuspended: %d"), -[TUCallServicesClientCapabilities wantsCallNotificationsDisabledWhileSuspended](self, "wantsCallNotificationsDisabledWhileSuspended"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" wantsToScreenCalls: %d"), -[TUCallServicesClientCapabilities wantsToScreenCalls](self, "wantsToScreenCalls"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (BOOL)wantsCallDisconnectionOnInvalidation
{
  return self->_wantsCallDisconnectionOnInvalidation;
}

- (void)setWantsCallDisconnectionOnInvalidation:(BOOL)a3
{
  self->_wantsCallDisconnectionOnInvalidation = a3;
}

- (BOOL)wantsCallStopStreamingOnInvalidation
{
  return self->_wantsCallStopStreamingOnInvalidation;
}

- (void)setWantsCallStopStreamingOnInvalidation:(BOOL)a3
{
  self->_wantsCallStopStreamingOnInvalidation = a3;
}

- (BOOL)wantsFrequencyChangeNotifications
{
  return self->_wantsFrequencyChangeNotifications;
}

- (void)setWantsFrequencyChangeNotifications:(BOOL)a3
{
  self->_wantsFrequencyChangeNotifications = a3;
}

- (BOOL)wantsToScreenCalls
{
  return self->_wantsToScreenCalls;
}

- (void)setWantsToScreenCalls:(BOOL)a3
{
  self->_wantsToScreenCalls = a3;
}

- (BOOL)wantsCallNotificationsDisabledWhileSuspended
{
  return self->_wantsCallNotificationsDisabledWhileSuspended;
}

- (void)setWantsCallNotificationsDisabledWhileSuspended:(BOOL)a3
{
  self->_wantsCallNotificationsDisabledWhileSuspended = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
