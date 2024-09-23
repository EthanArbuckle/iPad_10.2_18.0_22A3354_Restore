@implementation STConversationContext

- (STConversationContext)init
{
  STConversationContext *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STConversationContext;
  result = -[STConversationContext init](&v3, sel_init);
  if (result)
  {
    result->_allowedByScreenTime = 1;
    *(_WORD *)&result->_shouldBeAllowedByScreenTimeWhenLimited = 257;
  }
  return result;
}

- (NSArray)whitelistedHandles
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAllowedByContactsHandle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSDictionary)contactsByHandle
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)allowedByScreenTime
{
  return self->_allowedByScreenTime;
}

- (BOOL)shouldBeAllowedByScreenTimeWhenLimited
{
  return self->_shouldBeAllowedByScreenTimeWhenLimited;
}

- (BOOL)emergencyModeEnabled
{
  return self->_emergencyModeEnabled;
}

- (BOOL)applicationCurrentlyLimited
{
  return self->_applicationCurrentlyLimited;
}

- (NSDictionary)allowedByContactsHandle
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)updateShouldBeAllowedDuringGeneralScreenTime:(BOOL)a3 shouldBeAllowedByScreenTimeWhenLimited:(BOOL)a4 currentApplicationState:(unint64_t)a5 emergencyModeEnabled:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v8;
  _BOOL8 v9;

  v6 = a6;
  v8 = a4;
  v9 = a3;
  if (-[STConversationContext shouldBeAllowedDuringGeneralScreenTime](self, "shouldBeAllowedDuringGeneralScreenTime") != a3)
    -[STConversationContext setShouldBeAllowedDuringGeneralScreenTime:](self, "setShouldBeAllowedDuringGeneralScreenTime:", v9);
  if (-[STConversationContext shouldBeAllowedByScreenTimeWhenLimited](self, "shouldBeAllowedByScreenTimeWhenLimited") != v8)
    -[STConversationContext setShouldBeAllowedByScreenTimeWhenLimited:](self, "setShouldBeAllowedByScreenTimeWhenLimited:", v8);
  if (-[STConversationContext currentApplicationState](self, "currentApplicationState") != a5)
    -[STConversationContext setCurrentApplicationState:](self, "setCurrentApplicationState:", a5);
  if (-[STConversationContext emergencyModeEnabled](self, "emergencyModeEnabled") != v6)
    -[STConversationContext setEmergencyModeEnabled:](self, "setEmergencyModeEnabled:", v6);
  if ((a5 == 1) != -[STConversationContext applicationCurrentlyLimited](self, "applicationCurrentlyLimited"))
    -[STConversationContext setApplicationCurrentlyLimited:](self, "setApplicationCurrentlyLimited:", a5 == 1);
  if (v6)
    goto LABEL_12;
  if (a5)
  {
    if (a5 == 2)
    {
      if (!-[STConversationContext allowedByScreenTime](self, "allowedByScreenTime"))
        return;
      v9 = 0;
      goto LABEL_21;
    }
    v9 = v8;
    if (a5 != 1)
    {
LABEL_12:
      if (-[STConversationContext allowedByScreenTime](self, "allowedByScreenTime"))
        return;
      v9 = 1;
      goto LABEL_21;
    }
  }
  if (v9 != -[STConversationContext allowedByScreenTime](self, "allowedByScreenTime"))
LABEL_21:
    -[STConversationContext setAllowedByScreenTime:](self, "setAllowedByScreenTime:", v9);
}

- (BOOL)shouldBeAllowedDuringGeneralScreenTime
{
  return self->_shouldBeAllowedDuringGeneralScreenTime;
}

- (unint64_t)currentApplicationState
{
  return self->_currentApplicationState;
}

- (void)updateForThirdPartyApplicationState:(int64_t)a3
{
  if ((a3 == 0) != -[STConversationContext allowedByScreenTime](self, "allowedByScreenTime"))
    -[STConversationContext setAllowedByScreenTime:](self, "setAllowedByScreenTime:", a3 == 0);
}

- (void)setAllowedByScreenTime:(BOOL)a3
{
  self->_allowedByScreenTime = a3;
}

- (void)setApplicationCurrentlyLimited:(BOOL)a3
{
  self->_applicationCurrentlyLimited = a3;
}

- (void)setShouldBeAllowedByScreenTimeWhenLimited:(BOOL)a3
{
  self->_shouldBeAllowedByScreenTimeWhenLimited = a3;
}

- (void)setShouldBeAllowedDuringGeneralScreenTime:(BOOL)a3
{
  self->_shouldBeAllowedDuringGeneralScreenTime = a3;
}

- (void)setContactsByHandle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void)setWhitelistedHandles:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void)setCurrentApplicationState:(unint64_t)a3
{
  self->_currentApplicationState = a3;
}

- (void)setEmergencyModeEnabled:(BOOL)a3
{
  self->_emergencyModeEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whitelistedHandles, 0);
  objc_storeStrong((id *)&self->_contactsByHandle, 0);
  objc_storeStrong((id *)&self->_allowedByContactsHandle, 0);
}

@end
