@implementation SVAutomaticFullscreenVideoPlaybackBehaviorManager

- (void)setVideoBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_videoBounds))
  {
    self->_videoBounds.origin.x = x;
    self->_videoBounds.origin.y = y;
    self->_videoBounds.size.width = width;
    self->_videoBounds.size.height = height;
    -[SVAutomaticFullscreenVideoPlaybackBehaviorManager conditionsChanged](self, "conditionsChanged");
  }
}

- (void)setBehavior:(unint64_t)a3
{
  if (self->_behavior != a3)
  {
    self->_behavior = a3;
    -[SVAutomaticFullscreenVideoPlaybackBehaviorManager conditionsChanged](self, "conditionsChanged");
  }
}

- (BOOL)fullscreenPlaybackRequiredForCurrentConditions
{
  BOOL v3;
  double Width;
  CGRect v6;
  CGRect v7;
  CGRect v8;

  v3 = -[SVAutomaticFullscreenVideoPlaybackBehaviorManager behavior](self, "behavior") == 2;
  if (-[SVAutomaticFullscreenVideoPlaybackBehaviorManager behavior](self, "behavior") == 1)
  {
    -[SVAutomaticFullscreenVideoPlaybackBehaviorManager videoBounds](self, "videoBounds");
    if (!CGRectIsEmpty(v6))
    {
      -[SVAutomaticFullscreenVideoPlaybackBehaviorManager videoBounds](self, "videoBounds");
      Width = CGRectGetWidth(v7);
      -[SVAutomaticFullscreenVideoPlaybackBehaviorManager videoBounds](self, "videoBounds");
      return Width / CGRectGetHeight(v8) < 0.95;
    }
  }
  return v3;
}

- (void)conditionsChanged
{
  void *v3;
  char v4;
  id v5;

  if (-[SVAutomaticFullscreenVideoPlaybackBehaviorManager fullscreenPlaybackRequiredForCurrentConditions](self, "fullscreenPlaybackRequiredForCurrentConditions"))
  {
    -[SVAutomaticFullscreenVideoPlaybackBehaviorManager delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      -[SVAutomaticFullscreenVideoPlaybackBehaviorManager delegate](self, "delegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fullscreenBehaviorManagerRequiresFullscreenPlayback:", self);

    }
  }
}

- (CGRect)videoBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_videoBounds.origin.x;
  y = self->_videoBounds.origin.y;
  width = self->_videoBounds.size.width;
  height = self->_videoBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)behavior
{
  return self->_behavior;
}

- (SVAutomaticFullscreenVideoPlaybackBehaviorManagerDelegate)delegate
{
  return (SVAutomaticFullscreenVideoPlaybackBehaviorManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
