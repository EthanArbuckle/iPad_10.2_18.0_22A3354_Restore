@implementation _PXContextMenuConfigurationState

- (BOOL)isContextMenuInteractionActive
{
  return self->_isContextMenuInteractionActive;
}

- (void)setIsContextMenuInteractionActive:(BOOL)a3
{
  self->_isContextMenuInteractionActive = a3;
}

- (BOOL)actionsAllowedForContextMenuInteraction
{
  return self->_actionsAllowedForContextMenuInteraction;
}

- (void)setActionsAllowedForContextMenuInteraction:(BOOL)a3
{
  self->_actionsAllowedForContextMenuInteraction = a3;
}

- (BOOL)isPreviewCommitting
{
  return self->_isPreviewCommitting;
}

- (void)setIsPreviewCommitting:(BOOL)a3
{
  self->_isPreviewCommitting = a3;
}

- (int64_t)interactionAppearance
{
  return self->_interactionAppearance;
}

- (void)setInteractionAppearance:(int64_t)a3
{
  self->_interactionAppearance = a3;
}

@end
