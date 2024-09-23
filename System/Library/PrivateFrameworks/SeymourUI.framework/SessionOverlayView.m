@implementation SessionOverlayView

- (void)willMoveToSuperview:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[6];
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for SessionOverlayView();
  v4 = a3;
  v5 = (char *)v12.receiver;
  -[SessionOverlayView willMoveToSuperview:](&v12, sel_willMoveToSuperview_, v4);
  v6 = *(void **)&v5[OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_metricContainer];
  v7 = (void *)objc_opt_self();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v6;
  *(_BYTE *)(v8 + 24) = 0;
  v11[4] = sub_22BA78720;
  v11[5] = v8;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 1107296256;
  v11[2] = sub_22B0F2EEC;
  v11[3] = &block_descriptor_29_1;
  v9 = _Block_copy(v11);
  v10 = v6;
  swift_release();
  objc_msgSend(v7, sel_animateWithDuration_delay_options_animations_completion_, 0, v9, 0, 0.5, 0.0);
  _Block_release(v9);

}

- (void)layoutSubviews
{
  _TtC9SeymourUI18SessionOverlayView *v2;

  v2 = self;
  sub_22BA74ED4();

}

- (void)safeAreaInsetsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SessionOverlayView();
  v2 = v3.receiver;
  -[SessionOverlayView safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  sub_22BA75158();
  sub_22BA7530C();

}

- (_TtC9SeymourUI18SessionOverlayView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22BA78594();
}

- (_TtC9SeymourUI18SessionOverlayView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI18SessionOverlayView *result;

  result = (_TtC9SeymourUI18SessionOverlayView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_contentLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_unobscuredLayoutGuide));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_heartRateView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_metricContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_multiUserCelebrationView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_highlightPlatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_highlightLabel));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_intensityView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_separatorView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_trackViewRightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_multiUserCelebrationViewRightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_overlayLayoutGuide));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_overlayLayoutGuideTop));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_overlayLayoutGuideBottom));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_overlayLayoutGuideLeft));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18SessionOverlayView_overlayLayoutGuideRight));
}

- (void)updateConstraints
{
  _TtC9SeymourUI18SessionOverlayView *v2;

  v2 = self;
  sub_22BA76A44();

}

@end
