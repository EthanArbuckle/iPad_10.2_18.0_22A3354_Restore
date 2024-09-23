@implementation SearchFindMySession

- (_TtC4Maps19SearchFindMySession)init
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *MySession;
  _TtC4Maps19SearchFindMySession *v7;
  uint64_t v8;
  _QWORD *v9;
  _TtC4Maps19SearchFindMySession *v10;
  objc_super v12;

  v3 = sub_100008B04(&qword_101494070);
  __chkstk_darwin(v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps19SearchFindMySession_session) = 0;
  MySession = (objc_class *)type metadata accessor for SearchFindMySession();
  v12.receiver = self;
  v12.super_class = MySession;
  v7 = -[SearchFindMySession init](&v12, "init");
  v8 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = (_QWORD *)swift_allocObject(&unk_1011A5588, 40, 7);
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v7;
  v10 = v7;
  sub_1001B0C08((uint64_t)v5, (uint64_t)&unk_10149C568, (uint64_t)v9);
  swift_release();
  return v10;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps19SearchFindMySession_session));
}

@end
