@implementation WFConfiguredTriggerRecord

- (NSData)triggerData
{
  return self->_triggerData;
}

- (void)setTriggerData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSData)selectedEntryMetadata
{
  return self->_selectedEntryMetadata;
}

- (void)setSelectedEntryMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)shouldPrompt
{
  return self->_shouldPrompt;
}

- (void)setShouldPrompt:(BOOL)a3
{
  self->_shouldPrompt = a3;
}

- (BOOL)shouldNotify
{
  return self->_shouldNotify;
}

- (void)setShouldNotify:(BOOL)a3
{
  self->_shouldNotify = a3;
}

- (BOOL)shouldRecur
{
  return self->_shouldRecur;
}

- (void)setShouldRecur:(BOOL)a3
{
  self->_shouldRecur = a3;
}

- (BOOL)editableShortcut
{
  return self->_editableShortcut;
}

- (void)setEditableShortcut:(BOOL)a3
{
  self->_editableShortcut = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (int)source
{
  return self->_source;
}

- (void)setSource:(int)a3
{
  self->_source = a3;
}

- (int)notificationLevel
{
  return self->_notificationLevel;
}

- (void)setNotificationLevel:(int)a3
{
  self->_notificationLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedEntryMetadata, 0);
  objc_storeStrong((id *)&self->_triggerData, 0);
}

@end
