@implementation TVSlideTransitionAnimationCoordinator

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _TtC9SeymourUI37TVSlideTransitionAnimationCoordinator *v14;
  id v15;

  v10 = objc_allocWithZone((Class)type metadata accessor for TVSlideTransitionAnimator());
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = self;
  v15 = objc_msgSend(v10, sel_init);

  return v15;
}

- (_TtC9SeymourUI37TVSlideTransitionAnimationCoordinator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TVSlideTransitionAnimationCoordinator();
  return -[TVSlideTransitionAnimationCoordinator init](&v3, sel_init);
}

@end
