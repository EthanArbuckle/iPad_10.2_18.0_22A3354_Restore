@implementation MediaAPISubscriptionController

- (void)subscribeToStoreId:(id)a3 completion:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  v7 = a3;
  swift_retain();
  sub_22FB316F8(v7, 0, (uint64_t)sub_22FB32564, v6);

  swift_release();
  swift_release();
}

- (void)subscribeToStoreId:(id)a3 siriContext:(id)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v7 = _Block_copy(a5);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  v9 = a3;
  v10 = a4;
  swift_retain();
  sub_22FB316F8(v9, (uint64_t)a4, (uint64_t)sub_22FB32460, v8);

  swift_release();
  swift_release();
}

- (void)subscribeToFeedUrl:(id)a3 completion:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD *v9;
  void (*v10)(_QWORD *, uint64_t);
  uint64_t v11;

  v5 = sub_22FB37974();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  sub_22FB3795C();
  v10 = (void (*)(_QWORD *, uint64_t))v9[2];
  swift_retain();
  v10(v9, 4);
  _Block_release(v9);
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

@end
