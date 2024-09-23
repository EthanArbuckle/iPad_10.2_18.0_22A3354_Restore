@implementation PUTilingLayoutTransitionContext

- (BOOL)isCancelingTransition
{
  return self->_isCancelingTransition;
}

- (void)setCancelingTransition:(BOOL)a3
{
  self->_isCancelingTransition = a3;
}

- (BOOL)isViewControllerTransition
{
  return self->_isViewControllerTransition;
}

- (void)setIsViewControllerTransition:(BOOL)a3
{
  self->_isViewControllerTransition = a3;
}

- (BOOL)isUpdatingDisplayedContent
{
  return self->_isUpdatingDisplayedContent;
}

- (void)setIsUpdatingDisplayedContent:(BOOL)a3
{
  self->_isUpdatingDisplayedContent = a3;
}

- (OS_dispatch_group)displayedContentUpdateGroup
{
  return self->_displayedContentUpdateGroup;
}

- (void)setDisplayedContentUpdateGroup:(id)a3
{
  objc_storeStrong((id *)&self->_displayedContentUpdateGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedContentUpdateGroup, 0);
}

@end
