@implementation SBWorkspaceEntityRemovalContext

- (SBWorkspaceEntityRemovalContext)initWithAnimationStyle:(unint64_t)a3 removalActionType:(unint64_t)a4
{
  SBWorkspaceEntityRemovalContext *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBWorkspaceEntityRemovalContext;
  result = -[SBWorkspaceEntityRemovalContext init](&v7, sel_init);
  if (result)
  {
    result->_animationStyle = a3;
    result->_removalActionType = a4;
  }
  return result;
}

- (unint64_t)animationStyle
{
  return self->_animationStyle;
}

- (unint64_t)removalActionType
{
  return self->_removalActionType;
}

@end
