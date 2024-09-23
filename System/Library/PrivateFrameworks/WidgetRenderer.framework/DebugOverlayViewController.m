@implementation DebugOverlayViewController

- (_TtC14WidgetRenderer26DebugOverlayViewController)init
{
  _QWORD *v3;
  id v4;
  _TtC14WidgetRenderer26DebugOverlayViewController *v5;
  objc_class *v6;
  objc_super v8;

  v3 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC14WidgetRenderer26DebugOverlayViewController_debugText);
  *v3 = 0;
  v3[1] = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC14WidgetRenderer26DebugOverlayViewController_animationsPaused) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC14WidgetRenderer26DebugOverlayViewController_isSnapshotting) = 0;
  v4 = objc_allocWithZone((Class)type metadata accessor for DebugView());
  v5 = self;
  v6 = (objc_class *)objc_msgSend(v4, sel_init);
  *(Class *)((char *)&v5->super.super.super.isa + OBJC_IVAR____TtC14WidgetRenderer26DebugOverlayViewController_debugView) = v6;

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for DebugOverlayViewController();
  return -[DebugOverlayViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
}

- (_TtC14WidgetRenderer26DebugOverlayViewController)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC14WidgetRenderer26DebugOverlayViewController *result;

  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC14WidgetRenderer26DebugOverlayViewController_debugText);
  *v4 = 0;
  v4[1] = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC14WidgetRenderer26DebugOverlayViewController_animationsPaused) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC14WidgetRenderer26DebugOverlayViewController_isSnapshotting) = 0;
  v5 = a3;

  result = (_TtC14WidgetRenderer26DebugOverlayViewController *)sub_24A55985C();
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC14WidgetRenderer26DebugOverlayViewController *v3;
  id v4;
  id v5;

  v3 = self;
  v4 = -[DebugOverlayViewController view](v3, sel_view);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, sel_setNeedsLayout);

  }
  else
  {
    __break(1u);
  }
}

- (void)loadView
{
  -[DebugOverlayViewController setView:](self, sel_setView_, *(Class *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC14WidgetRenderer26DebugOverlayViewController_debugView));
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_willEnterAlwaysOn
{
  _BYTE *v2;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC14WidgetRenderer26DebugOverlayViewController_debugView);
  v2[OBJC_IVAR____TtC14WidgetRendererP33_E3A435B0BE3B48C7282CA1845A4013709DebugView_inAlwaysOnDisplay] = 1;
  objc_msgSend(v2, sel_setNeedsLayout);
}

- (void)_didExitAlwaysOn
{
  _BYTE *v2;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC14WidgetRenderer26DebugOverlayViewController_debugView);
  v2[OBJC_IVAR____TtC14WidgetRendererP33_E3A435B0BE3B48C7282CA1845A4013709DebugView_inAlwaysOnDisplay] = 0;
  objc_msgSend(v2, sel_setNeedsLayout);
}

- (_TtC14WidgetRenderer26DebugOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC14WidgetRenderer26DebugOverlayViewController *result;

  v4 = a4;
  result = (_TtC14WidgetRenderer26DebugOverlayViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14WidgetRenderer26DebugOverlayViewController_debugView));
  swift_bridgeObjectRelease();
}

@end
