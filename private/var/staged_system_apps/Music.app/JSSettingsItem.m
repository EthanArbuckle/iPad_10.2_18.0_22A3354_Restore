@implementation JSSettingsItem

- (NSString)description
{
  _TtC11MusicJSCore14JSSettingsItem *v2;
  NSString v3;

  v2 = self;
  JSSettingsItem.description.getter();

  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t);
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;

  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore14JSSettingsItem__title;
  v4 = sub_100007E8C(&qword_10119F090);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore14JSSettingsItem__detailText, v4);
  v6 = (char *)self + OBJC_IVAR____TtC11MusicJSCore14JSSettingsItem__kind;
  v7 = sub_100007E8C(&qword_1011E9D70);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = (char *)self + OBJC_IVAR____TtC11MusicJSCore14JSSettingsItem__artwork;
  v9 = sub_100007E8C(&qword_1011E8D68);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = (char *)self + OBJC_IVAR____TtC11MusicJSCore14JSSettingsItem__usesApplicationTintColor;
  v11 = sub_100007E8C((uint64_t *)&unk_1011A3380);
  v12 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8);
  v12(v10, v11);
  v12((char *)self + OBJC_IVAR____TtC11MusicJSCore14JSSettingsItem__hasChevron, v11);
  v12((char *)self + OBJC_IVAR____TtC11MusicJSCore14JSSettingsItem__hasEditButton, v11);
  v12((char *)self + OBJC_IVAR____TtC11MusicJSCore14JSSettingsItem__isDeletable, v11);
  v13 = (char *)self + OBJC_IVAR____TtC11MusicJSCore14JSSettingsItem__followRequestsCount;
  v14 = sub_100007E8C(&qword_1011A4330);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  v15 = (char *)self + OBJC_IVAR____TtC11MusicJSCore14JSSettingsItem__accessoryItem;
  v16 = sub_100007E8C(&qword_1011E9DB8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
}

@end
