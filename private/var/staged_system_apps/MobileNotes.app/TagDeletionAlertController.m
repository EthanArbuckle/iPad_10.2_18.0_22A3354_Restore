@implementation TagDeletionAlertController

- (_TtC11MobileNotes26TagDeletionAlertController)initWithViewControllerManager:(id)a3 window:(id)a4 eventReporter:(id)a5 deletionMethod:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  _TtC11MobileNotes26TagDeletionAlertController *v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (_TtC11MobileNotes26TagDeletionAlertController *)sub_100214EA4(a3, a4, a5, a6);

  return v13;
}

- (id)makeDeleteTagAlertControllerWithTags:(id)a3 sendNotification:(BOOL)a4
{
  uint64_t v7;
  unint64_t v8;
  _TtC11MobileNotes26TagDeletionAlertController *v9;
  id v10;

  v7 = sub_1000163BC(0, (unint64_t *)&qword_1005D86F0, ICHashtag_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v9 = self;
  v10 = sub_1002132B8(v8, a4);

  swift_bridgeObjectRelease(v8);
  return v10;
}

- (_TtC11MobileNotes26TagDeletionAlertController)init
{
  _TtC11MobileNotes26TagDeletionAlertController *result;

  result = (_TtC11MobileNotes26TagDeletionAlertController *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.TagDeletionAlertController", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11MobileNotes26TagDeletionAlertController_viewControllerManager));

}

@end
