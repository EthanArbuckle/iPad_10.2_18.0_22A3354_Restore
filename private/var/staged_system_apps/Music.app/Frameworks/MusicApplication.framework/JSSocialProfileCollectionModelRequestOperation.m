@implementation JSSocialProfileCollectionModelRequestOperation

- (void)execute
{
  id v2;
  uint64_t v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for JSSocialProfileCollectionModelRequestOperation();
  v2 = v5.receiver;
  -[JSSocialProfileCollectionModelRequestOperation execute](&v5, "execute");
  sub_4E684(0, (unint64_t *)&qword_14AD360, OS_dispatch_queue_ptr);
  v3 = swift_allocObject(&unk_1352EF8, 24, 7);
  *(_QWORD *)(v3 + 16) = v2;
  v4 = v2;
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)((uint64_t (*)(void))sub_2580F4, v3);

  swift_release(v3);
}

- (_TtC16MusicApplicationP33_9AFC986C3EE3F16591D3B34D5D62C9B146JSSocialProfileCollectionModelRequestOperation)init
{
  _TtC16MusicApplicationP33_9AFC986C3EE3F16591D3B34D5D62C9B146JSSocialProfileCollectionModelRequestOperation *result;

  result = (_TtC16MusicApplicationP33_9AFC986C3EE3F16591D3B34D5D62C9B146JSSocialProfileCollectionModelRequestOperation *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.JSSocialProfileCollectionModelRequestOperation", 63, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release(*(_QWORD *)&self->request[OBJC_IVAR____TtC16MusicApplicationP33_9AFC986C3EE3F16591D3B34D5D62C9B146JSSocialProfileCollectionModelRequestOperation_responseHandler]);
}

@end
