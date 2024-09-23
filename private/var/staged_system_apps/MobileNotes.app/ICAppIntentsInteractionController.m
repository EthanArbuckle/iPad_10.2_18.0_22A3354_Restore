@implementation ICAppIntentsInteractionController

- (_TtC11MobileNotes33ICAppIntentsInteractionController)init
{
  objc_class *ObjectType;
  _TtC11MobileNotes33ICAppIntentsInteractionController *v4;
  objc_class *v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = self;
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0
    && _CocoaArrayWrapper.endIndex.getter(_swiftEmptyArrayStorage))
  {
    sub_100127F34((uint64_t)_swiftEmptyArrayStorage);
  }
  else
  {
    v5 = (objc_class *)&_swiftEmptySetSingleton;
  }
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC11MobileNotes33ICAppIntentsInteractionController_interactions) = v5;
  swift_unknownObjectWeakInit((char *)v4 + OBJC_IVAR____TtC11MobileNotes33ICAppIntentsInteractionController_window, 0);

  v7.receiver = v4;
  v7.super_class = ObjectType;
  return -[ICAppIntentsInteractionController init](&v7, "init");
}

- (void)setWindow:(id)a3
{
  _TtC11MobileNotes33ICAppIntentsInteractionController *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_100016E7C((uint64_t)a3);

}

- (void)rootViewControllerDidChange:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC11MobileNotes33ICAppIntentsInteractionController *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1000170F0();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (ICWindow)window
{
  return (ICWindow *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC11MobileNotes33ICAppIntentsInteractionController_window);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC11MobileNotes33ICAppIntentsInteractionController_interactions));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC11MobileNotes33ICAppIntentsInteractionController_window);
}

@end
