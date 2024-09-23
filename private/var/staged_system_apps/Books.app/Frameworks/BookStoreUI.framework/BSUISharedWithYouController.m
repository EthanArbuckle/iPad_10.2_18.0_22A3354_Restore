@implementation BSUISharedWithYouController

+ (_TtC11BookStoreUI27BSUISharedWithYouController)shared
{
  if (qword_31E540 != -1)
    swift_once(&qword_31E540, sub_53A50);
  return (_TtC11BookStoreUI27BSUISharedWithYouController *)(id)qword_31E548;
}

- (_TtC11BookStoreUI27BSUISharedWithYouController)init
{
  return (_TtC11BookStoreUI27BSUISharedWithYouController *)sub_53AFC();
}

- (id)createHighlightAttributionViewFor:(id)a3 viewController:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _TtC11BookStoreUI27BSUISharedWithYouController *v10;
  id v11;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = a4;
  v10 = self;
  v11 = sub_55124(v6, v8, a4);

  swift_bridgeObjectRelease(v8);
  return v11;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC11BookStoreUI27BSUISharedWithYouController_refreshPublisher));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11BookStoreUI27BSUISharedWithYouController_highlightCenter));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC11BookStoreUI27BSUISharedWithYouController_highlights));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC11BookStoreUI27BSUISharedWithYouController_attributionViews));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC11BookStoreUI27BSUISharedWithYouController_observers));
}

- (void)highlightCenterHighlightsDidChange:(id)a3
{
  id v4;
  _TtC11BookStoreUI27BSUISharedWithYouController *v5;

  v4 = a3;
  v5 = self;
  _s11BookStoreUI27BSUISharedWithYouControllerC34highlightCenterHighlightsDidChangeyySo011SWHighlightI0CF_0();

}

@end
