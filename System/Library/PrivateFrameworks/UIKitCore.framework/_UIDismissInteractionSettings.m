@implementation _UIDismissInteractionSettings

- (_TtC5UIKit43_UIDismissInteractionSubInteractionSettings)edgePan
{
  return (_TtC5UIKit43_UIDismissInteractionSubInteractionSettings *)*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UIDismissInteractionSettings_edgePan);
}

- (void)setEdgePan:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UIDismissInteractionSettings_edgePan);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UIDismissInteractionSettings_edgePan) = (Class)a3;
  v3 = a3;

}

- (_TtC5UIKit43_UIDismissInteractionSubInteractionSettings)scroll
{
  return (_TtC5UIKit43_UIDismissInteractionSubInteractionSettings *)*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UIDismissInteractionSettings_scroll);
}

- (void)setScroll:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UIDismissInteractionSettings_scroll);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UIDismissInteractionSettings_scroll) = (Class)a3;
  v3 = a3;

}

- (_TtC5UIKit43_UIDismissInteractionSubInteractionSettings)swipeDown
{
  return (_TtC5UIKit43_UIDismissInteractionSubInteractionSettings *)*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UIDismissInteractionSettings_swipeDown);
}

- (void)setSwipeDown:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UIDismissInteractionSettings_swipeDown);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UIDismissInteractionSettings_swipeDown) = (Class)a3;
  v3 = a3;

}

- (_TtC5UIKit43_UIDismissInteractionSubInteractionSettings)pinch
{
  return (_TtC5UIKit43_UIDismissInteractionSubInteractionSettings *)*(id *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UIDismissInteractionSettings_pinch);
}

- (void)setPinch:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UIDismissInteractionSettings_pinch);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UIDismissInteractionSettings_pinch) = (Class)a3;
  v3 = a3;

}

- (BOOL)showDebugUI
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UIDismissInteractionSettings_showDebugUI);
}

- (void)setShowDebugUI:(BOOL)a3
{
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC5UIKit29_UIDismissInteractionSettings_showDebugUI) = a3;
}

- (void)setDefaultValues
{
  _TtC5UIKit29_UIDismissInteractionSettings *v2;

  v2 = self;
  sub_18563B550();

}

+ (id)settingsControllerModule
{
  id v2;

  sub_18563BBA0();
  return v2;
}

- (_TtC5UIKit29_UIDismissInteractionSettings)initWithDefaultValues
{
  return (_TtC5UIKit29_UIDismissInteractionSettings *)sub_18563B640();
}

- (void).cxx_destruct
{

}

@end
