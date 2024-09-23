@implementation DOCModalBlurViewControllerTransition.BackgroundView

- (void)dismissPresentedViewController:(id)a3
{
  uint64_t Strong;
  id v6;
  _TtCC5Files36DOCModalBlurViewControllerTransitionP33_4C4C64B830FA27D5F7277025BBE0D4FD14BackgroundView *v7;
  id v8;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtCC5Files36DOCModalBlurViewControllerTransitionP33_4C4C64B830FA27D5F7277025BBE0D4FD14BackgroundView_presented, a2);
  if (Strong)
  {
    v8 = (id)Strong;
    v6 = a3;
    v7 = self;
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (_TtCC5Files36DOCModalBlurViewControllerTransitionP33_4C4C64B830FA27D5F7277025BBE0D4FD14BackgroundView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  swift_unknownObjectWeakInit((char *)self+ OBJC_IVAR____TtCC5Files36DOCModalBlurViewControllerTransitionP33_4C4C64B830FA27D5F7277025BBE0D4FD14BackgroundView_presented);
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCModalBlurViewControllerTransition.BackgroundView();
  return -[DOCModalBlurViewControllerTransition.BackgroundView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtCC5Files36DOCModalBlurViewControllerTransitionP33_4C4C64B830FA27D5F7277025BBE0D4FD14BackgroundView)initWithCoder:(id)a3
{
  objc_super v6;

  swift_unknownObjectWeakInit((char *)self+ OBJC_IVAR____TtCC5Files36DOCModalBlurViewControllerTransitionP33_4C4C64B830FA27D5F7277025BBE0D4FD14BackgroundView_presented);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCModalBlurViewControllerTransition.BackgroundView();
  return -[DOCModalBlurViewControllerTransition.BackgroundView initWithCoder:](&v6, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self+ OBJC_IVAR____TtCC5Files36DOCModalBlurViewControllerTransitionP33_4C4C64B830FA27D5F7277025BBE0D4FD14BackgroundView_presented);
}

@end
