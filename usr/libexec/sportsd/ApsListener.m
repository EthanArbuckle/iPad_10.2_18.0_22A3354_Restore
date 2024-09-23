@implementation ApsListener

- (_TtC7sportsd11ApsListener)init
{
  sub_10000E324();
}

- (void).cxx_destruct
{

  sub_100018D4C(OBJC_IVAR____TtC7sportsd11ApsListener_currentAPSConnectionEnvironment);
  sub_100007618((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7sportsd11ApsListener_messageProcessing));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7sportsd11ApsListener_cancellables));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7sportsd11ApsListener_tokenPublisher));
  sub_100018D4C(OBJC_IVAR____TtC7sportsd11ApsListener_pushToken);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7sportsd11ApsListener_scoreboardProcessor));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7sportsd11ApsListener_connection));
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _TtC7sportsd11ApsListener *v12;

  v6 = a3;
  v7 = a4;
  v12 = self;
  v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = v9;

  sub_10000E41C(v11, v8, v10);
  sub_1000096A0(v8, v10);

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6;
  id v7;
  _TtC7sportsd11ApsListener *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10000E674();

}

- (void)connection:(id)a3 channelSubscriptionsFailedWithFailures:(id)a4
{
  id v4;
  uint64_t v7;
  id v8;
  _TtC7sportsd11ApsListener *v9;

  v4 = a4;
  if (a4)
  {
    v7 = sub_100018468(0, &qword_1000D0568, APSChannelSubscriptionFailure_ptr);
    v4 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v7);
  }
  v8 = a3;
  v9 = self;
  sub_100012C74();

  swift_bridgeObjectRelease(v4);
}

@end
