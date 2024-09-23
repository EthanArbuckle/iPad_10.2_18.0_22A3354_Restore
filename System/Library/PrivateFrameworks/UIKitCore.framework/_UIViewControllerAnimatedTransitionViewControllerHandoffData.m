@implementation _UIViewControllerAnimatedTransitionViewControllerHandoffData

- (_UIViewControllerAnimatedTransitionViewControllerHandoffData)initWithViewController:(id)a3 containerView:(id)a4 snapshot:(id)a5 frame:(CGRect)a6 targetFrame:(CGRect)a7 dimmingAmount:(double)a8 targetDimmingAmount:(double)a9
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  id v20;
  id v21;
  id v22;
  _UIViewControllerAnimatedTransitionViewControllerHandoffData *v23;
  _UIViewControllerAnimatedTransitionViewControllerHandoffData *v24;
  objc_super v26;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v13 = a6.size.height;
  v14 = a6.size.width;
  v15 = a6.origin.y;
  v16 = a6.origin.x;
  v20 = a3;
  v21 = a4;
  v22 = a5;
  v26.receiver = self;
  v26.super_class = (Class)_UIViewControllerAnimatedTransitionViewControllerHandoffData;
  v23 = -[_UIViewControllerAnimatedTransitionViewControllerHandoffData init](&v26, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeWeak((id *)&v23->_viewController, v20);
    objc_storeStrong((id *)&v24->_containerView, a4);
    objc_storeStrong((id *)&v24->_snapshot, a5);
    v24->_frame.origin.x = v16;
    v24->_frame.origin.y = v15;
    v24->_frame.size.width = v14;
    v24->_frame.size.height = v13;
    v24->_targetFrame.origin.x = x;
    v24->_targetFrame.origin.y = y;
    v24->_targetFrame.size.width = width;
    v24->_targetFrame.size.height = height;
    v24->_dimmingAmount = a8;
    v24->_targetDimmingAmount = a9;
  }

  return v24;
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_viewController);
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UIView)snapshot
{
  return self->_snapshot;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)targetFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_targetFrame.origin.x;
  y = self->_targetFrame.origin.y;
  width = self->_targetFrame.size.width;
  height = self->_targetFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)dimmingAmount
{
  return self->_dimmingAmount;
}

- (double)targetDimmingAmount
{
  return self->_targetDimmingAmount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_destroyWeak((id *)&self->_viewController);
}

@end
