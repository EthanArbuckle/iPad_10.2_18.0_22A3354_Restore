@implementation _UIProxyDismissInteraction

- (void)beginAtLocation:(CGPoint)a3 withVelocity:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  _UIProxyDismissInteraction *v8;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  v8 = self;
  sub_1856F1844(v7, v6, x, y);

}

- (void)issueUpdate:(id)a3
{
  id v4;
  _UIDismissInteractionDelegate *v5;
  _UIProxyDismissInteraction *v6;

  v4 = a3;
  v6 = self;
  if (-[_UIDismissInteraction isActive](v6, sel_isActive)
    && (v5 = -[_UIDismissInteraction delegate](v6, sel_delegate)) != 0)
  {
    -[_UIDismissInteractionDelegate dismissInteraction:didIssueUpdate:](v5, sel_dismissInteraction_didIssueUpdate_, v6, v4);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (void)dismissWithVelocity:(CGPoint)a3
{
  double y;
  double x;
  _UIDismissInteractionDelegate *v5;
  _UIProxyDismissInteraction *v6;

  y = a3.y;
  x = a3.x;
  v6 = self;
  if (-[_UIDismissInteraction isActive](v6, sel_isActive))
  {
    v5 = -[_UIDismissInteraction delegate](v6, sel_delegate);
    if (v5)
    {
      -[_UIDismissInteractionDelegate dismissInteraction:didDismissWithVelocity:](v5, sel_dismissInteraction_didDismissWithVelocity_, v6, x, y);
      swift_unknownObjectRelease();
    }
    *((_BYTE *)&v6->super.super.isa + OBJC_IVAR____UIDismissInteraction__isActive) = 0;
  }

}

- (void)cancelWithVelocity:(CGPoint)a3 originalPosition:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  _UIDismissInteractionDelegate *v8;
  _UIProxyDismissInteraction *v9;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  v9 = self;
  if (-[_UIDismissInteraction isActive](v9, sel_isActive))
  {
    v8 = -[_UIDismissInteraction delegate](v9, sel_delegate);
    if (v8)
    {
      -[_UIDismissInteractionDelegate dismissInteraction:didCancelWithVelocity:originalPosition:](v8, sel_dismissInteraction_didCancelWithVelocity_originalPosition_, v9, v7, v6, x, y);
      swift_unknownObjectRelease();
    }
    *((_BYTE *)&v9->super.super.isa + OBJC_IVAR____UIDismissInteraction__isActive) = 0;
  }

}

- (_UIProxyDismissInteraction)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIProxyDismissInteraction;
  return -[_UIDismissInteraction init](&v3, sel_init);
}

@end
