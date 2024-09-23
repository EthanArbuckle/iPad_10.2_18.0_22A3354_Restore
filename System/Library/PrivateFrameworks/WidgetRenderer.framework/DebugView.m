@implementation DebugView

- (void)layoutSubviews
{
  _TtC14WidgetRendererP33_E3A435B0BE3B48C7282CA1845A4013709DebugView *v2;

  v2 = self;
  sub_24A536CE0();

}

- (_TtC14WidgetRendererP33_E3A435B0BE3B48C7282CA1845A4013709DebugView)init
{
  return (_TtC14WidgetRendererP33_E3A435B0BE3B48C7282CA1845A4013709DebugView *)sub_24A5375C4();
}

- (_TtC14WidgetRendererP33_E3A435B0BE3B48C7282CA1845A4013709DebugView)initWithCoder:(id)a3
{
  return (_TtC14WidgetRendererP33_E3A435B0BE3B48C7282CA1845A4013709DebugView *)sub_24A53767C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14WidgetRendererP33_E3A435B0BE3B48C7282CA1845A4013709DebugView_debugTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14WidgetRendererP33_E3A435B0BE3B48C7282CA1845A4013709DebugView_animationsPausedView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14WidgetRendererP33_E3A435B0BE3B48C7282CA1845A4013709DebugView_isSnapshottingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC14WidgetRendererP33_E3A435B0BE3B48C7282CA1845A4013709DebugView_inAlwaysOnDisplayView));
  swift_bridgeObjectRelease();
}

@end
