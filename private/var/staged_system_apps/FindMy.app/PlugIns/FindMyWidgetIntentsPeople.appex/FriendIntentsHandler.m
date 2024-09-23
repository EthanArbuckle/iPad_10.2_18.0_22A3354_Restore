@implementation FriendIntentsHandler

- (_TtC25FindMyWidgetIntentsPeople20FriendIntentsHandler)init
{
  return (_TtC25FindMyWidgetIntentsPeople20FriendIntentsHandler *)sub_10000F188();
}

- (void)dealloc
{
  _TtC25FindMyWidgetIntentsPeople20FriendIntentsHandler *v2;

  v2 = self;
  sub_10000F6EC();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->instanceId[OBJC_IVAR____TtC25FindMyWidgetIntentsPeople20FriendIntentsHandler_instanceId]);
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC25FindMyWidgetIntentsPeople20FriendIntentsHandler_peopleDataService));
}

- (void)handleFriendSelector:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC25FindMyWidgetIntentsPeople20FriendIntentsHandler *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_100011270(v7, v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (id)defaultContactForFriendSelector:(id)a3
{
  id v4;
  _TtC25FindMyWidgetIntentsPeople20FriendIntentsHandler *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_10000FA34(v4);

  return v6;
}

- (void)provideContactOptionsForFriendSelector:(id)a3 withCompletion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC25FindMyWidgetIntentsPeople20FriendIntentsHandler *v10;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject(&unk_10001D7A8, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = swift_allocObject(&unk_10001D7D0, 32, 7);
  *(_QWORD *)(v8 + 16) = sub_100011B68;
  *(_QWORD *)(v8 + 24) = v7;
  v9 = a3;
  v10 = self;
  swift_retain(v7);
  sub_100011520(v9, (uint64_t)sub_100011B94, v8);

  swift_release(v7);
  swift_release(v8);
}

- (void)provideContactOptionsCollectionForFriendSelector:(id)a3 searchTerm:(id)a4 withCompletion:(id)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  _TtC25FindMyWidgetIntentsPeople20FriendIntentsHandler *v12;

  v8 = _Block_copy(a5);
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v9;
  }
  v10 = swift_allocObject(&unk_10001D668, 24, 7);
  *(_QWORD *)(v10 + 16) = v8;
  v11 = a3;
  v12 = self;
  sub_100011520(v11, (uint64_t)sub_1000110E8, v10);

  swift_bridgeObjectRelease(a4);
  swift_release(v10);
}

@end
