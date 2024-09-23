@implementation WFRunActionEvent

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

- (NSString)shortcutSource
{
  return self->_shortcutSource;
}

- (void)setShortcutSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)runSource
{
  return self->_runSource;
}

- (void)setRunSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)setActionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)externalBundleIdentifier
{
  return self->_externalBundleIdentifier;
}

- (void)setExternalBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)externalActionIdentifier
{
  return self->_externalActionIdentifier;
}

- (void)setExternalActionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (BOOL)didRunRemotely
{
  return self->_didRunRemotely;
}

- (void)setDidRunRemotely:(BOOL)a3
{
  self->_didRunRemotely = a3;
}

- (NSString)automationType
{
  return self->_automationType;
}

- (void)setAutomationType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isInvalidatedSystemAction
{
  return self->_isInvalidatedSystemAction;
}

- (void)setIsInvalidatedSystemAction:(BOOL)a3
{
  self->_isInvalidatedSystemAction = a3;
}

- (NSString)galleryIdentifier
{
  return self->_galleryIdentifier;
}

- (void)setGalleryIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_galleryIdentifier, 0);
  objc_storeStrong((id *)&self->_automationType, 0);
  objc_storeStrong((id *)&self->_externalActionIdentifier, 0);
  objc_storeStrong((id *)&self->_externalBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_runSource, 0);
  objc_storeStrong((id *)&self->_shortcutSource, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
