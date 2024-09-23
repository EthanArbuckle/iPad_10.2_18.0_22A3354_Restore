@implementation MediaRemoteSubscriptionController

- (_TtC11PodcastsKit33MediaRemoteSubscriptionController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MediaRemoteSubscriptionController();
  return -[MediaRemoteSubscriptionController init](&v3, sel_init);
}

- (void)subscribeToStoreId:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC11PodcastsKit33MediaRemoteSubscriptionController *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_22FB2DC5C((uint64_t)v8, 0, (uint64_t)sub_22FB2E2E8, v7);

  swift_release();
}

- (void)subscribeToStoreId:(id)a3 siriContext:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC11PodcastsKit33MediaRemoteSubscriptionController *v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_22FB2DC5C((uint64_t)v10, (char *)a4, (uint64_t)sub_22FB2E2E8, v9);

  swift_release();
}

- (void)subscribeToFeedUrl:(id)a3 completion:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  _TtC11PodcastsKit33MediaRemoteSubscriptionController *v12;
  uint64_t v13;

  v6 = sub_22FB37974();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  sub_22FB3795C();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = self;
  sub_22FB2DFBC((uint64_t)v9, (uint64_t)sub_22FB2DAF4, v11);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

@end
