@implementation RecentlyPlayedObserver

- (void)registerHandler:(id)a3
{
  uint64_t ObjectType;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _TtC5Music22RecentlyPlayedObserver *v13;
  uint64_t v14;

  ObjectType = swift_getObjectType();
  v6 = sub_100007E8C((uint64_t *)&unk_1011A13B0);
  __chkstk_darwin(v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  v10 = swift_allocObject(&unk_1010DBAF0, 24, 7);
  *(_QWORD *)(v10 + 16) = v9;
  v11 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject(&unk_1010DBB18, 64, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = self;
  v12[5] = sub_1007953C0;
  v12[6] = v10;
  v12[7] = ObjectType;
  v13 = self;
  swift_retain();
  sub_100167078((uint64_t)v8, (uint64_t)&unk_1011C8488, (uint64_t)v12);

  swift_release();
  swift_release();
}

- (_TtC5Music22RecentlyPlayedObserver)init
{
  objc_class *ObjectType;
  uint64_t v4;
  _TtC5Music22RecentlyPlayedObserver *v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR____TtC5Music22RecentlyPlayedObserver_pushObserver;
  type metadata accessor for PushNotificationObserver();
  v5 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)PushNotificationObserver.__allocating_init()();

  v7.receiver = v5;
  v7.super_class = ObjectType;
  return -[RecentlyPlayedObserver init](&v7, "init");
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music22RecentlyPlayedObserver_pushObserver));
}

@end
