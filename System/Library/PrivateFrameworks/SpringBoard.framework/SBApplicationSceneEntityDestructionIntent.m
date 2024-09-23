@implementation SBApplicationSceneEntityDestructionIntent

- (unint64_t)animation
{
  return self->_animation;
}

- (void)setAnimation:(unint64_t)a3
{
  self->_animation = a3;
}

- (BOOL)shouldRemoveFromHistory
{
  return self->_shouldRemoveFromHistory;
}

- (void)setShouldRemoveFromHistory:(BOOL)a3
{
  self->_shouldRemoveFromHistory = a3;
}

@end
