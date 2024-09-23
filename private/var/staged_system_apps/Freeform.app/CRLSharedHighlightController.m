@implementation CRLSharedHighlightController

- (_TtC8Freeform28CRLSharedHighlightController)init
{
  _TtC8Freeform28CRLSharedHighlightController *result;

  sub_1004DE55C();
  return result;
}

- (void)iCloudStatusDidChangeWithNotification:(id)a3
{
  _TtC8Freeform28CRLSharedHighlightController *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_1004E21EC();

}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLSharedHighlightController_initialSyncTimer));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform28CRLSharedHighlightController_sharedHighlights));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform28CRLSharedHighlightController_highlightObservers));
}

- (void)highlightCenterHighlightsDidChange:(id)a3
{
  id v4;
  _TtC8Freeform28CRLSharedHighlightController *v5;

  v4 = a3;
  v5 = self;
  sub_1004E17F8(v4);

}

@end
