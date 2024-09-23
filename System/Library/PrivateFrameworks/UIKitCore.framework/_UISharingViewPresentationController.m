@implementation _UISharingViewPresentationController

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void (**v6)(void);
  objc_super v7;

  v3 = a3;
  if (-[UIPresentationController dismissing](self, "dismissing")
    && (!self->_suppressDismissalHandlerUnlessDimmingViewTapped
     || -[UIPopoverPresentationController _popoverIsDismissingBecauseDismissInteractionOccurred](self, "_popoverIsDismissingBecauseDismissInteractionOccurred")))
  {
    -[_UISharingViewPresentationController dismissalHandler](self, "dismissalHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[_UISharingViewPresentationController dismissalHandler](self, "dismissalHandler");
      v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v6[2]();

      -[_UISharingViewPresentationController setDismissalHandler:](self, "setDismissalHandler:", 0);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)_UISharingViewPresentationController;
  -[UIPopoverPresentationController dismissalTransitionDidEnd:](&v7, sel_dismissalTransitionDidEnd_, v3);
}

- (id)dismissalHandler
{
  return self->_dismissalHandler;
}

- (void)setDismissalHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 848);
}

- (BOOL)suppressDismissalHandlerUnlessDimmingViewTapped
{
  return self->_suppressDismissalHandlerUnlessDimmingViewTapped;
}

- (void)setSuppressDismissalHandlerUnlessDimmingViewTapped:(BOOL)a3
{
  self->_suppressDismissalHandlerUnlessDimmingViewTapped = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissalHandler, 0);
}

@end
