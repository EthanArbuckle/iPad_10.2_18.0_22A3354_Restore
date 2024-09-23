@implementation PopTransitionDelegate

- (id)animationControllerForDismissedController:(id)a3
{
  objc_class *v5;
  _BYTE *v6;
  id v7;
  _TtC9SeymourUI21PopTransitionDelegate *v8;
  _TtC9SeymourUI21PopTransitionDelegate *v9;
  objc_super v11;

  v5 = (objc_class *)type metadata accessor for PopTransitionAnimator();
  v6 = objc_allocWithZone(v5);
  *(_QWORD *)&v6[OBJC_IVAR____TtC9SeymourUI21PopTransitionAnimator_scale] = 0x3FEC28F5C28F5C29;
  v6[OBJC_IVAR____TtC9SeymourUI21PopTransitionAnimator_isPresenting] = 0;
  v11.receiver = v6;
  v11.super_class = v5;
  v7 = a3;
  v8 = self;
  v9 = -[PopTransitionDelegate init](&v11, sel_init);

  return v9;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  objc_class *v9;
  _BYTE *v10;
  id v11;
  id v12;
  id v13;
  _TtC9SeymourUI21PopTransitionDelegate *v14;
  _TtC9SeymourUI21PopTransitionDelegate *v15;
  objc_super v17;

  v9 = (objc_class *)type metadata accessor for PopTransitionAnimator();
  v10 = objc_allocWithZone(v9);
  *(_QWORD *)&v10[OBJC_IVAR____TtC9SeymourUI21PopTransitionAnimator_scale] = 0x3FEC28F5C28F5C29;
  v10[OBJC_IVAR____TtC9SeymourUI21PopTransitionAnimator_isPresenting] = 1;
  v17.receiver = v10;
  v17.super_class = v9;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = self;
  v15 = -[PopTransitionDelegate init](&v17, sel_init);

  return v15;
}

- (_TtC9SeymourUI21PopTransitionDelegate)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PopTransitionDelegate();
  return -[PopTransitionDelegate init](&v3, sel_init);
}

@end
