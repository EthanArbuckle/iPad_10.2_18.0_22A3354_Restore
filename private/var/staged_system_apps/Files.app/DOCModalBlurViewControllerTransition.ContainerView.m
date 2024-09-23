@implementation DOCModalBlurViewControllerTransition.ContainerView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for DOCModalBlurViewControllerTransition.ContainerView();
  v7 = v13.receiver;
  v8 = a4;
  v9 = -[DOCModalBlurViewControllerTransition.ContainerView hitTest:withEvent:](&v13, "hitTest:withEvent:", v8, x, y);
  if (v9)
  {
    v10 = v9;
    sub_10004F2F0(0, (unint64_t *)&qword_100645B80, UIView_ptr);
    v11 = v7;
    v7 = v10;
    LOBYTE(v10) = static NSObject.== infix(_:_:)(v7, v11);

    if ((v10 & 1) == 0)
      return v7;
  }
  else
  {

  }
  v7 = 0;
  return v7;
}

- (void)didMoveToWindow
{
  id v2;
  _TtCC5Files36DOCModalBlurViewControllerTransitionP33_4C4C64B830FA27D5F7277025BBE0D4FD13ContainerView *v3;

  v3 = self;
  v2 = -[DOCModalBlurViewControllerTransition.ContainerView window](v3, "window");

  if (!v2)
    sub_1003C42BC();

}

- (void)layoutSubviews
{
  _TtCC5Files36DOCModalBlurViewControllerTransitionP33_4C4C64B830FA27D5F7277025BBE0D4FD13ContainerView *v2;

  v2 = self;
  sub_1003C4460();

}

- (_TtCC5Files36DOCModalBlurViewControllerTransitionP33_4C4C64B830FA27D5F7277025BBE0D4FD13ContainerView)initWithFrame:(CGRect)a3
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
  swift_unknownObjectWeakInit((char *)self+ OBJC_IVAR____TtCC5Files36DOCModalBlurViewControllerTransitionP33_4C4C64B830FA27D5F7277025BBE0D4FD13ContainerView_presented);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Files36DOCModalBlurViewControllerTransitionP33_4C4C64B830FA27D5F7277025BBE0D4FD13ContainerView_keyboardObservations) = (Class)_swiftEmptyArrayStorage;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCModalBlurViewControllerTransition.ContainerView();
  return -[DOCModalBlurViewControllerTransition.ContainerView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtCC5Files36DOCModalBlurViewControllerTransitionP33_4C4C64B830FA27D5F7277025BBE0D4FD13ContainerView)initWithCoder:(id)a3
{
  objc_super v6;

  swift_unknownObjectWeakInit((char *)self+ OBJC_IVAR____TtCC5Files36DOCModalBlurViewControllerTransitionP33_4C4C64B830FA27D5F7277025BBE0D4FD13ContainerView_presented);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtCC5Files36DOCModalBlurViewControllerTransitionP33_4C4C64B830FA27D5F7277025BBE0D4FD13ContainerView_keyboardObservations) = (Class)_swiftEmptyArrayStorage;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCModalBlurViewControllerTransition.ContainerView();
  return -[DOCModalBlurViewControllerTransition.ContainerView initWithCoder:](&v6, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self+ OBJC_IVAR____TtCC5Files36DOCModalBlurViewControllerTransitionP33_4C4C64B830FA27D5F7277025BBE0D4FD13ContainerView_presented);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtCC5Files36DOCModalBlurViewControllerTransitionP33_4C4C64B830FA27D5F7277025BBE0D4FD13ContainerView_keyboardObservations));
}

@end
