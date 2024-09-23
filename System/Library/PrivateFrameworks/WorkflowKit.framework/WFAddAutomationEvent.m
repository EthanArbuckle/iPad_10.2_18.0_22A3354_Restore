@implementation WFAddAutomationEvent

+ (Class)codableEventClass
{
  return (Class)objc_opt_class();
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)triggerType
{
  return self->_triggerType;
}

- (void)setTriggerType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)intentType
{
  return self->_intentType;
}

- (void)setIntentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unsigned)actionCount
{
  return self->_actionCount;
}

- (void)setActionCount:(unsigned int)a3
{
  self->_actionCount = a3;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)automationSuggestionsTrialIdentifier
{
  return self->_automationSuggestionsTrialIdentifier;
}

- (void)setAutomationSuggestionsTrialIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)shortcutIdentifier
{
  return self->_shortcutIdentifier;
}

- (void)setShortcutIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)showsNotification
{
  return self->_showsNotification;
}

- (void)setShowsNotification:(BOOL)a3
{
  self->_showsNotification = a3;
}

- (BOOL)requiresRuntimeConfirmation
{
  return self->_requiresRuntimeConfirmation;
}

- (void)setRequiresRuntimeConfirmation:(BOOL)a3
{
  self->_requiresRuntimeConfirmation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutIdentifier, 0);
  objc_storeStrong((id *)&self->_automationSuggestionsTrialIdentifier, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_intentType, 0);
  objc_storeStrong((id *)&self->_triggerType, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
