@implementation _UIKeyboardAnimatorAnimationStyleControllerContext

- (_UIKeyboardAnimatorAnimationStyleControllerContext)initWithHost:(id)a3 startPlacement:(id)a4 endPlacement:(id)a5
{
  id v9;
  id v10;
  id v11;
  _UIKeyboardAnimatorAnimationStyleControllerContext *v12;
  _UIKeyboardAnimatorAnimationStyleControllerContext *v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  objc_super v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)_UIKeyboardAnimatorAnimationStyleControllerContext;
  v12 = -[_UIKeyboardAnimatorAnimationStyleControllerContext init](&v25, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_host, a3);
    objc_storeStrong((id *)&v13->_start, a4);
    objc_storeStrong((id *)&v13->_end, a5);
    objc_msgSend(v9, "updateToPlacement:withNormalAnimationsAndNotifications:", v13->_end, 0);
    -[_UIKeyboardAnimatorAnimationStyleControllerContext animatingView](v13, "animatingView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frame");
    v13->_endFrame.origin.x = v15;
    v13->_endFrame.origin.y = v16;
    v13->_endFrame.size.width = v17;
    v13->_endFrame.size.height = v18;

    objc_msgSend(v9, "updateToPlacement:withNormalAnimationsAndNotifications:", v13->_start, 0);
    -[_UIKeyboardAnimatorAnimationStyleControllerContext animatingView](v13, "animatingView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "frame");
    v13->_startFrame.origin.x = v20;
    v13->_startFrame.origin.y = v21;
    v13->_startFrame.size.width = v22;
    v13->_startFrame.size.height = v23;

  }
  return v13;
}

- (UIView)animatingView
{
  return (UIView *)-[UIInputViewAnimationHost viewForTransitionScreenSnapshot](self->_host, "viewForTransitionScreenSnapshot");
}

- (void)setInputViewsHidden:(BOOL)a3
{
  self->_hidden = a3;
  -[UIInputViewAnimationHost setInputViewsHidden:](self->_host, "setInputViewsHidden:");
}

- (void)complete
{
  -[UIInputViewAnimationHost updateToPlacement:withNormalAnimationsAndNotifications:](self->_host, "updateToPlacement:withNormalAnimationsAndNotifications:", self->_end, 1);
}

- (CGRect)startFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_startFrame.origin.x;
  y = self->_startFrame.origin.y;
  width = self->_startFrame.size.width;
  height = self->_startFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)endFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_endFrame.origin.x;
  y = self->_endFrame.origin.y;
  width = self->_endFrame.size.width;
  height = self->_endFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)inputViewsHidden
{
  return self->_hidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

@end
