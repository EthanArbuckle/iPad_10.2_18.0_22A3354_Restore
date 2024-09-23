@implementation SFAnnounceMessagesEvent

+ (NSString)eventName
{
  return (NSString *)CFSTR("com.apple.Sharing.SiriAnnounceMessages");
}

+ (id)stringForExitView:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 4)
    return CFSTR("Unknown");
  else
    return off_1E482FEC0[a3 - 1];
}

- (NSDictionary)eventPayload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[7];
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("allowsSiriWhenLocked");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SFAnnounceMessagesEvent allowsSiriWhenLocked](self, "allowsSiriWhenLocked"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("announceMessagesAlreadyEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SFAnnounceMessagesEvent announceMessagesAlreadyEnabled](self, "announceMessagesAlreadyEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v4;
  v12[2] = CFSTR("pairingExitView");
  objc_msgSend((id)objc_opt_class(), "stringForExitView:", -[SFAnnounceMessagesEvent pairingExitView](self, "pairingExitView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v5;
  v12[3] = CFSTR("skippedTutorialCards");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SFAnnounceMessagesEvent skippedTutorialCards](self, "skippedTutorialCards"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v6;
  v12[4] = CFSTR("userAutomaticallyEnrolled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SFAnnounceMessagesEvent userAutomaticallyEnrolled](self, "userAutomaticallyEnrolled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v7;
  v12[5] = CFSTR("userExplicitlyOptedIn");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SFAnnounceMessagesEvent userExplicitlyOptedIn](self, "userExplicitlyOptedIn"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v8;
  v12[6] = CFSTR("userExplicitlyOptedOut");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[SFAnnounceMessagesEvent userExplicitlyOptedOut](self, "userExplicitlyOptedOut"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[6] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v10;
}

- (void)submitEvent
{
  void *v3;
  id v4;

  +[SFAnnounceMessagesEvent eventName](SFAnnounceMessagesEvent, "eventName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SFAnnounceMessagesEvent eventPayload](self, "eventPayload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SFMetricsLog(v4, v3);

}

- (BOOL)allowsSiriWhenLocked
{
  return self->_allowsSiriWhenLocked;
}

- (void)setAllowsSiriWhenLocked:(BOOL)a3
{
  self->_allowsSiriWhenLocked = a3;
}

- (BOOL)announceMessagesAlreadyEnabled
{
  return self->_announceMessagesAlreadyEnabled;
}

- (void)setAnnounceMessagesAlreadyEnabled:(BOOL)a3
{
  self->_announceMessagesAlreadyEnabled = a3;
}

- (int64_t)pairingExitView
{
  return self->_pairingExitView;
}

- (void)setPairingExitView:(int64_t)a3
{
  self->_pairingExitView = a3;
}

- (BOOL)skippedTutorialCards
{
  return self->_skippedTutorialCards;
}

- (void)setSkippedTutorialCards:(BOOL)a3
{
  self->_skippedTutorialCards = a3;
}

- (BOOL)userAutomaticallyEnrolled
{
  return self->_userAutomaticallyEnrolled;
}

- (void)setUserAutomaticallyEnrolled:(BOOL)a3
{
  self->_userAutomaticallyEnrolled = a3;
}

- (BOOL)userExplicitlyOptedIn
{
  return self->_userExplicitlyOptedIn;
}

- (void)setUserExplicitlyOptedIn:(BOOL)a3
{
  self->_userExplicitlyOptedIn = a3;
}

- (BOOL)userExplicitlyOptedOut
{
  return self->_userExplicitlyOptedOut;
}

- (void)setUserExplicitlyOptedOut:(BOOL)a3
{
  self->_userExplicitlyOptedOut = a3;
}

@end
