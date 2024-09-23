@implementation MessagesDataSource

- (_TtC19MailWidgetExtension18MessagesDataSource)init
{
  return (_TtC19MailWidgetExtension18MessagesDataSource *)sub_10004AC28();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19MailWidgetExtension18MessagesDataSource_messageRepository));
  sub_1000119D0((id *)((char *)&self->super.isa + OBJC_IVAR____TtC19MailWidgetExtension18MessagesDataSource_messageList));
  sub_10001B7F0((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC19MailWidgetExtension18MessagesDataSource_resultHandler));
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5
{
  id v6;
  _TtC19MailWidgetExtension18MessagesDataSource *v7;
  uint64_t v8;

  swift_unknownObjectRetain(a3);
  v6 = a4;
  swift_unknownObjectRetain(a5);
  v7 = self;
  sub_100008AC0(&qword_10008BF20);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4);
  sub_10004AF34((uint64_t)a3, v8, (uint64_t)a5);
  swift_bridgeObjectRelease(v8);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5
{
  id v6;
  _TtC19MailWidgetExtension18MessagesDataSource *v7;
  uint64_t v8;

  swift_unknownObjectRetain(a3);
  v6 = a4;
  swift_unknownObjectRetain(a5);
  v7 = self;
  sub_100008AC0(&qword_10008BF20);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4);
  sub_10004C21C((uint64_t)a3, v8, (uint64_t)a5);
  swift_bridgeObjectRelease(v8);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)collectionDidFinishInitialLoad:(id)a3
{
  _TtC19MailWidgetExtension18MessagesDataSource *v4;

  swift_unknownObjectRetain(a3);
  v4 = self;
  sub_10004D0F4(a3);

  swift_unknownObjectRelease();
}

- (void)collection:(id)a3 movedItemIDs:(id)a4 before:(id)a5
{
  id v6;
  _TtC19MailWidgetExtension18MessagesDataSource *v7;
  uint64_t v8;

  swift_unknownObjectRetain(a3);
  v6 = a4;
  swift_unknownObjectRetain(a5);
  v7 = self;
  sub_100008AC0(&qword_10008BF20);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4);
  sub_10004E76C();
  swift_bridgeObjectRelease(v8);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)collection:(id)a3 movedItemIDs:(id)a4 after:(id)a5
{
  id v6;
  _TtC19MailWidgetExtension18MessagesDataSource *v7;
  uint64_t v8;

  swift_unknownObjectRetain(a3);
  v6 = a4;
  swift_unknownObjectRetain(a5);
  v7 = self;
  sub_100008AC0(&qword_10008BF20);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4);
  sub_10004E76C();
  swift_bridgeObjectRelease(v8);

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)collection:(id)a3 changedItemIDs:(id)a4
{
  id v5;
  _TtC19MailWidgetExtension18MessagesDataSource *v6;
  uint64_t v7;

  swift_unknownObjectRetain(a3);
  v5 = a4;
  v6 = self;
  sub_100008AC0(&qword_10008BF20);
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4);
  sub_10004E8E8();
  swift_bridgeObjectRelease(v7);

  swift_unknownObjectRelease();
}

- (void)collection:(id)a3 deletedItemIDs:(id)a4
{
  id v5;
  _TtC19MailWidgetExtension18MessagesDataSource *v6;
  uint64_t v7;

  swift_unknownObjectRetain(a3);
  v5 = a4;
  v6 = self;
  sub_100008AC0(&qword_10008BF20);
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4);
  sub_10004E8E8();
  swift_bridgeObjectRelease(v7);

  swift_unknownObjectRelease();
}

- (void)collection:(id)a3 replacedExistingItemID:(id)a4 withNewItemID:(id)a5
{
  _TtC19MailWidgetExtension18MessagesDataSource *v6;

  swift_unknownObjectRetain(a3);
  swift_unknownObjectRetain(a4);
  swift_unknownObjectRetain(a5);
  v6 = self;
  sub_10004E76C();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end
