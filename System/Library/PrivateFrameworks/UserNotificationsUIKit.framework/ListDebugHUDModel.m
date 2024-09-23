@implementation ListDebugHUDModel

- (NCNotificationListView)listView
{
  return (NCNotificationListView *)(id)MEMORY[0x1D17DD63C]((char *)self+ OBJC_IVAR____TtC22UserNotificationsUIKit17ListDebugHUDModel_listView, a2);
}

- (void)setListView:(id)a3
{
  _TtC22UserNotificationsUIKit17ListDebugHUDModel *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_1CFD6EFB8();

}

- (_TtC22UserNotificationsUIKit17ListDebugHUDModel)init
{
  return (_TtC22UserNotificationsUIKit17ListDebugHUDModel *)sub_1CFD67F14();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC22UserNotificationsUIKit17ListDebugHUDModel___observationRegistrar;
  v4 = sub_1CFD7BF20();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
