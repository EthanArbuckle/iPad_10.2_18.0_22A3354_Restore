@implementation VKCExternalQuickActionsResult

- (NSArray)quickActions
{
  return self->_quickActions;
}

- (void)setQuickActions:(id)a3
{
  objc_storeStrong((id *)&self->_quickActions, a3);
}

- (UIButton)moreButton
{
  return self->_moreButton;
}

- (void)setMoreButton:(id)a3
{
  objc_storeStrong((id *)&self->_moreButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_quickActions, 0);
}

@end
