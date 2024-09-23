@implementation TTRIRemindersListMessagingView

- (_TtC9Reminders30TTRIRemindersListMessagingView)initWithFrame:(CGRect)a3
{
  return (_TtC9Reminders30TTRIRemindersListMessagingView *)sub_1001DBE64(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
}

- (_TtC9Reminders30TTRIRemindersListMessagingView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001DC76C();
}

- (NSString)accessibilityLabel
{
  _TtC9Reminders30TTRIRemindersListMessagingView *v2;
  Swift::String v3;
  Swift::String v4;
  void *object;
  NSString v6;

  v2 = self;
  v3._object = (void *)0x800000010056B250;
  v4._countAndFlagsBits = 0x7265646E696D6552;
  v4._object = (void *)0xEE007473694C2073;
  v3._countAndFlagsBits = 0xD000000000000042;
  object = TTRLocalizedString(_:comment:)(v4, v3)._object;

  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  return (NSString *)v6;
}

- (_TtC9Reminders30TTRIRemindersListMessagingView)initWithArrangedSubviews:(id)a3
{
  _TtC9Reminders30TTRIRemindersListMessagingView *result;

  result = (_TtC9Reminders30TTRIRemindersListMessagingView *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIRemindersListMessagingView", 40, "init(arrangedSubviews:)", 23, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000381C8((uint64_t)&self->NUIContainerStackView_opaque[OBJC_IVAR____TtC9Reminders30TTRIRemindersListMessagingView_messagingViewDelegate]);

}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC9Reminders30TTRIRemindersListMessagingView *v13;
  uint64_t v15;

  v8 = type metadata accessor for URL(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = a3;
  v13 = self;
  LOBYTE(self) = sub_1001DC814();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return self & 1;
}

@end
