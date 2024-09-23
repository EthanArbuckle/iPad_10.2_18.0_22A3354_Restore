@implementation RCSiriTipContainerView

- (double)preferredHeight
{
  _TtC10VoiceMemos22RCSiriTipContainerView *v2;
  double v3;

  v2 = self;
  v3 = sub_10000E054();

  return v3;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC10VoiceMemos22RCSiriTipContainerView_delegate, a3);
}

- (_TtC10VoiceMemos22RCSiriTipContainerView)initWithFrame:(CGRect)a3
{
  return (_TtC10VoiceMemos22RCSiriTipContainerView *)sub_10000E880(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtP10VoiceMemos21RCSiriTipViewDelegate_)delegate
{
  return (_TtP10VoiceMemos21RCSiriTipViewDelegate_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC10VoiceMemos22RCSiriTipContainerView_delegate);
}

- (_TtC10VoiceMemos22RCSiriTipContainerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000A2FC4();
}

- (void).cxx_destruct
{
  sub_1000A3170((uint64_t)self + OBJC_IVAR____TtC10VoiceMemos22RCSiriTipContainerView_delegate);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC10VoiceMemos22RCSiriTipContainerView_cancellables));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10VoiceMemos22RCSiriTipContainerView_siriTipView));
}

@end
