@implementation IntentHandler

- (_TtC16NewsTodayIntents13IntentHandler)init
{
  uint64_t v3;
  uint64_t v4;
  _TtC16NewsTodayIntents13IntentHandler *v5;
  char *v6;
  char *v7;
  char *v8;
  objc_super v10;

  v3 = OBJC_IVAR____TtC16NewsTodayIntents13IntentHandler_container;
  v4 = type metadata accessor for TodayIntentsContainer();
  swift_allocObject(v4, 64, 7);
  v5 = self;
  *(Class *)((char *)&self->super.super.isa + v3) = (Class)sub_100008CCC();
  v6 = (char *)v5 + OBJC_IVAR____TtC16NewsTodayIntents13IntentHandler____lazy_storage___resolver;
  *((_QWORD *)v6 + 4) = 0;
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  v7 = (char *)v5 + OBJC_IVAR____TtC16NewsTodayIntents13IntentHandler____lazy_storage___followingTagsService;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_QWORD *)v7 + 4) = 0;
  v8 = (char *)v5 + OBJC_IVAR____TtC16NewsTodayIntents13IntentHandler____lazy_storage___searchService;
  *((_QWORD *)v8 + 4) = 0;
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;

  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for IntentHandler();
  return -[IntentHandler init](&v10, "init");
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC16NewsTodayIntents13IntentHandler_container));
  sub_10000BB1C((uint64_t)self + OBJC_IVAR____TtC16NewsTodayIntents13IntentHandler____lazy_storage___resolver, (uint64_t *)&unk_100021890);
  sub_10000BB1C((uint64_t)self + OBJC_IVAR____TtC16NewsTodayIntents13IntentHandler____lazy_storage___followingTagsService, (uint64_t *)&unk_100021880);
  sub_10000BB1C((uint64_t)self + OBJC_IVAR____TtC16NewsTodayIntents13IntentHandler____lazy_storage___searchService, &qword_100021870);
}

- (void)handleToday:(id)a3 completion:(id)a4
{
  sub_10000A45C(self, (int)a2, a3, a4, (uint64_t (*)(_QWORD))type metadata accessor for TodayIntentResponse, &OBJC_IVAR___TodayIntentResponse_code);
}

- (void)provideTagOptionsCollectionForTag:(id)a3 searchTerm:(id)a4 withCompletion:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  _TtC16NewsTodayIntents13IntentHandler *v13;

  v8 = _Block_copy(a5);
  if (a4)
  {
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v10;
  }
  else
  {
    v9 = 0;
  }
  v11 = swift_allocObject(&unk_100018CE8, 24, 7);
  *(_QWORD *)(v11 + 16) = v8;
  v12 = a3;
  v13 = self;
  sub_10000A9C0(v9, (unint64_t)a4, sub_10000B8AC, v11);

  swift_release(v11);
  swift_bridgeObjectRelease(a4);
}

- (void)handleTag:(id)a3 completion:(id)a4
{
  sub_10000A45C(self, (int)a2, a3, a4, (uint64_t (*)(_QWORD))type metadata accessor for TagIntentResponse, &OBJC_IVAR___TagIntentResponse_code);
}

- (id)defaultTagForTag:(id)a3
{
  id v4;
  _TtC16NewsTodayIntents13IntentHandler *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_10000B464();

  return v6;
}

@end
