@implementation TTRIListSharingController

- (_TtC9Reminders25TTRIListSharingController)init
{
  _TtC9Reminders25TTRIListSharingController *result;

  result = (_TtC9Reminders25TTRIListSharingController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIListSharingController", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000381C8((uint64_t)self + OBJC_IVAR____TtC9Reminders25TTRIListSharingController_delegate);

}

- (void)cloudSharingController:(id)a3 failedToSaveShareWithError:(id)a4
{
  id v6;
  _TtC9Reminders25TTRIListSharingController *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_1004B2F28((uint64_t)v8);

}

- (void)cloudSharingControllerDidSaveShare:(id)a3
{
  id v4;
  _TtC9Reminders25TTRIListSharingController *v5;

  v4 = a3;
  v5 = self;
  sub_1004B2858(v4, (uint64_t)sub_1004B27E0, (uint64_t)&unk_100609BC8, (SEL *)&selRef_updateShare_accountID_queue_completion_);

}

- (void)cloudSharingControllerDidStopSharing:(id)a3
{
  id v4;
  _TtC9Reminders25TTRIListSharingController *v5;

  v4 = a3;
  v5 = self;
  sub_1004B2858(v4, (uint64_t)sub_1004B2A54, (uint64_t)&unk_100609BA0, (SEL *)&selRef_stopShare_accountID_queue_completion_);

}

- (id)itemThumbnailDataForCloudSharingController:(id)a3
{
  UIImage *v3;
  unint64_t v4;
  Class isa;
  uint64_t v6;
  unint64_t v7;

  v3 = sub_1004B3130();
  if (v4 >> 60 == 15)
  {
    isa = 0;
  }
  else
  {
    v6 = (uint64_t)v3;
    v7 = v4;
    isa = Data._bridgeToObjectiveC()().super.isa;
    sub_1004187BC(v6, v7);
  }
  return isa;
}

- (id)itemTitleForCloudSharingController:(id)a3
{
  void *v4;
  id v5;
  _TtC9Reminders25TTRIListSharingController *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9Reminders25TTRIListSharingController_list);
  v5 = a3;
  v6 = self;
  v7 = objc_msgSend(v4, "displayName");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
  v9 = v8;

  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  return v10;
}

- (void)_cloudSharingControllerDidModifyPrimarySwitch:(BOOL)a3
{
  _TtC9Reminders25TTRIListSharingController *v4;

  v4 = self;
  sub_1004B2190(a3);

}

- (void)_cloudSharingControllerDidModifySecondarySwitch:(BOOL)a3
{
  _TtC9Reminders25TTRIListSharingController *v4;

  v4 = self;
  sub_1004B2494(a3);

}

@end
