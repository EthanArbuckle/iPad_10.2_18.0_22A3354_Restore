@implementation _UITransitionOverlayView

- (id)transitionCompletionBlock
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD aBlock[6];

  v2 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____UITransitionOverlayView_transitionCompletionBlock);
  swift_beginAccess();
  if (!*v2)
    return 0;
  v3 = v2[1];
  aBlock[4] = *v2;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1856DAA30;
  aBlock[3] = &block_descriptor_15_2;
  v4 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v4;
}

- (void)setTransitionCompletionBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1855B1090;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____UITransitionOverlayView_transitionCompletionBlock);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_18518D718(v7);
}

- (_UITransitionOverlayView)initWithSnapshot:(id)a3
{
  return (_UITransitionOverlayView *)_UITransitionOverlayView.init(snapshot:)(a3);
}

- (void)startTransition
{
  _UITransitionOverlayView *v2;

  v2 = self;
  _UITransitionOverlayView.startTransition()();

}

- (void)finishTransitionImmediately
{
  _UITransitionOverlayView *v2;

  v2 = self;
  _sSo24_UITransitionOverlayViewC5UIKitE27finishTransitionImmediatelyyyF_0();

}

- (_UITransitionOverlayView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _UITransitionOverlayView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____UITransitionOverlayView_state) = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____UITransitionOverlayView_transitionCompletionBlock);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_UITransitionOverlayView *)sub_186507E04();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _UITransitionOverlayView *v2;
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UITransitionOverlayView;
  v2 = self;
  -[UIView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = *(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR____UITransitionOverlayView_snapshot);
  -[UIView bounds](v2, sel_bounds, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_setFrame_);
  v4 = *(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR____UITransitionOverlayView_backdrop);
  -[UIView bounds](v2, sel_bounds);
  objc_msgSend(v4, sel_setFrame_);

}

- (_UITransitionOverlayView)initWithFrame:(CGRect)a3
{
  _UITransitionOverlayView *result;

  result = (_UITransitionOverlayView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1856DB49C(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____UITransitionOverlayView_state));

  sub_18518D718(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____UITransitionOverlayView_transitionCompletionBlock));
}

@end
