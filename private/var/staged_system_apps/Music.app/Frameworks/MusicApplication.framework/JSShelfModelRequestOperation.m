@implementation JSShelfModelRequestOperation

- (void)execute
{
  id v2;
  uint64_t v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for JSShelfModelRequestOperation();
  v2 = v5.receiver;
  -[JSShelfModelRequestOperation execute](&v5, "execute");
  sub_4E684(0, (unint64_t *)&qword_14AD360, OS_dispatch_queue_ptr);
  v3 = swift_allocObject(&unk_1377540, 24, 7);
  *(_QWORD *)(v3 + 16) = v2;
  v4 = v2;
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)((uint64_t (*)(void))sub_6729D8, v3);

  swift_release(v3);
}

- (_TtC16MusicApplication28JSShelfModelRequestOperation)init
{
  _TtC16MusicApplication28JSShelfModelRequestOperation *result;

  result = (_TtC16MusicApplication28JSShelfModelRequestOperation *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.JSShelfModelRequestOperation", 45, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release(*(_QWORD *)&self->request[OBJC_IVAR____TtC16MusicApplication28JSShelfModelRequestOperation_responseHandler]);
}

@end
