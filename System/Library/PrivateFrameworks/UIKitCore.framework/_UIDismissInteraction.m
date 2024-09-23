@implementation _UIDismissInteraction

- (UIView)view
{
  return (UIView *)(id)MEMORY[0x186DCA138]((char *)self + OBJC_IVAR____UIDismissInteraction__view, a2);
}

- (_UIDismissInteractionDelegate)delegate
{
  return (_UIDismissInteractionDelegate *)(id)MEMORY[0x186DCA138]((char *)self+ OBJC_IVAR____UIDismissInteraction_delegate, a2);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (BOOL)isEnabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____UIDismissInteraction_isEnabled);
}

- (void)setIsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  _UIDismissInteraction *v4;

  v3 = a3;
  v4 = self;
  sub_185712320(v3);

}

- (unint64_t)styles
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____UIDismissInteraction_styles);
}

- (void)setStyles:(unint64_t)a3
{
  _UIDismissInteraction *v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____UIDismissInteraction_styles) = (Class)a3;
  v3 = self;
  sub_18571243C();

}

- (BOOL)isActive
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____UIDismissInteraction__isActive);
}

- (_UIDismissInteraction)init
{
  return (_UIDismissInteraction *)sub_185712790();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_18563E558((uint64_t)self + OBJC_IVAR____UIDismissInteraction_delegate);
  swift_bridgeObjectRelease();

}

- (void)willMoveToView:(id)a3
{
  id v5;
  _UIDismissInteraction *v6;

  v5 = a3;
  v6 = self;
  sub_1857128F8(a3);

}

- (void)didMoveToView:(id)a3
{
  id v5;
  _UIDismissInteraction *v6;

  v5 = a3;
  v6 = self;
  sub_185712A8C(a3);

}

@end
