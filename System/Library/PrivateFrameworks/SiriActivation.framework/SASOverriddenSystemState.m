@implementation SASOverriddenSystemState

- (SASOverriddenSystemState)initWithSystemState:(id)a3 contextOverride:(id)a4
{
  id v6;
  id v7;
  SASOverriddenSystemState *v8;
  SASOverriddenSystemState *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SASOverriddenSystemState;
  v8 = -[SASSystemState init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[SASOverriddenSystemState setSystemState:](v8, "setSystemState:", v6);
    -[SASOverriddenSystemState setContextOverride:](v9, "setContextOverride:", v7);
  }

  return v9;
}

- (id)lockStateMonitor
{
  void *v2;
  void *v3;

  -[SASOverriddenSystemState systemState](self, "systemState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockStateMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setLockStateMonitor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SASOverriddenSystemState systemState](self, "systemState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLockStateMonitor:", v4);

}

- (id)currentSpokenLanguageCode
{
  void *v3;
  void *v4;
  void *v5;

  -[SASOverriddenSystemState contextOverride](self, "contextOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASOverriddenSystemState systemState](self, "systemState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentSpokenLanguageCodeForSystemState:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)hasUnlockedSinceBoot
{
  void *v3;
  void *v4;
  char v5;

  -[SASOverriddenSystemState contextOverride](self, "contextOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASOverriddenSystemState systemState](self, "systemState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hasUnlockedSinceBootForSystemState:", v4);

  return v5;
}

- (BOOL)deviceIsBlocked
{
  void *v3;
  void *v4;
  char v5;

  -[SASOverriddenSystemState contextOverride](self, "contextOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASOverriddenSystemState systemState](self, "systemState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "deviceIsBlockedForSystemState:", v4);

  return v5;
}

- (BOOL)deviceIsPasscodeLocked
{
  void *v3;
  void *v4;
  char v5;

  -[SASOverriddenSystemState contextOverride](self, "contextOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASOverriddenSystemState systemState](self, "systemState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "deviceIsPasscodeLockedForSystemState:", v4);

  return v5;
}

- (BOOL)pocketStateShouldPreventVoiceTrigger
{
  void *v3;
  void *v4;
  char v5;

  -[SASOverriddenSystemState contextOverride](self, "contextOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASOverriddenSystemState systemState](self, "systemState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "pocketStateShouldPreventVoiceTriggerForSystemState:", v4);

  return v5;
}

- (BOOL)isPad
{
  void *v3;
  void *v4;
  char v5;

  -[SASOverriddenSystemState contextOverride](self, "contextOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASOverriddenSystemState systemState](self, "systemState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isPadForSystemState:", v4);

  return v5;
}

- (BOOL)smartCoverClosed
{
  void *v3;
  void *v4;
  char v5;

  -[SASOverriddenSystemState contextOverride](self, "contextOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASOverriddenSystemState systemState](self, "systemState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "smartCoverClosedForSystemState:", v4);

  return v5;
}

- (BOOL)accessibilityShortcutEnabled
{
  void *v3;
  void *v4;
  char v5;

  -[SASOverriddenSystemState contextOverride](self, "contextOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASOverriddenSystemState systemState](self, "systemState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "accessibilityShortcutEnabledForSystemState:", v4);

  return v5;
}

- (BOOL)carDNDActive
{
  void *v3;
  void *v4;
  char v5;

  -[SASOverriddenSystemState contextOverride](self, "contextOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASOverriddenSystemState systemState](self, "systemState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "carDNDActiveForSystemState:", v4);

  return v5;
}

- (BOOL)isConnectedToCarPlay
{
  void *v3;
  void *v4;
  char v5;

  -[SASOverriddenSystemState contextOverride](self, "contextOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASOverriddenSystemState systemState](self, "systemState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isConnectedToCarPlayForSystemState:", v4);

  return v5;
}

- (BOOL)isConnectedToTrustedCarPlay
{
  void *v3;
  void *v4;
  char v5;

  -[SASOverriddenSystemState contextOverride](self, "contextOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASOverriddenSystemState systemState](self, "systemState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isConnectedToTrustedCarPlayForSystemState:", v4);

  return v5;
}

- (BOOL)siriIsEnabled
{
  void *v3;
  void *v4;
  char v5;

  -[SASOverriddenSystemState contextOverride](self, "contextOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASOverriddenSystemState systemState](self, "systemState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "siriIsEnabledForSystemState:", v4);

  return v5;
}

- (BOOL)siriIsRestricted
{
  void *v3;
  void *v4;
  char v5;

  -[SASOverriddenSystemState contextOverride](self, "contextOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASOverriddenSystemState systemState](self, "systemState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "siriIsRestrictedForSystemState:", v4);

  return v5;
}

- (BOOL)siriIsSupported
{
  void *v3;
  void *v4;
  char v5;

  -[SASOverriddenSystemState contextOverride](self, "contextOverride");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASOverriddenSystemState systemState](self, "systemState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "siriIsSupportedForSystemState:", v4);

  return v5;
}

- (SASSystemState)systemState
{
  return self->_systemState;
}

- (void)setSystemState:(id)a3
{
  objc_storeStrong((id *)&self->_systemState, a3);
}

- (SiriContextOverride)contextOverride
{
  return self->_contextOverride;
}

- (void)setContextOverride:(id)a3
{
  objc_storeStrong((id *)&self->_contextOverride, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextOverride, 0);
  objc_storeStrong((id *)&self->_systemState, 0);
}

@end
