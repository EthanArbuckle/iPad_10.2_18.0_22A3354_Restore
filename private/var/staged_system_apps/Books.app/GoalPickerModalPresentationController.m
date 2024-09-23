@implementation GoalPickerModalPresentationController

- (_TtC5Books37GoalPickerModalPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v6;
  id v7;
  _TtC5Books37GoalPickerModalPresentationController *v8;
  _TtC5Books37GoalPickerModalPresentationController *v9;
  Class isa;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)swift_getObjectType();
  v6 = a3;
  v7 = a4;
  v8 = -[GoalPickerModalPresentationController initWithPresentedViewController:presentingViewController:](&v12, "initWithPresentedViewController:presentingViewController:", v6, v7);
  sub_10058DE94();
  v9 = v8;
  isa = UIColor.init(_colorLiteralRed:green:blue:alpha:)(0.0, 0.0, 0.0, 0.49818).super.isa;
  -[GoalPickerModalPresentationController setDimmingViewBackgroundColor:](v9, "setDimmingViewBackgroundColor:", isa, v12.receiver, v12.super_class);

  return v9;
}

- (CGRect)frameOfPresentedViewInContainerView
{
  _TtC5Books37GoalPickerModalPresentationController *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  v2 = self;
  v3 = sub_100606E04();
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v3;
  v11 = v5;
  v12 = v7;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

@end
