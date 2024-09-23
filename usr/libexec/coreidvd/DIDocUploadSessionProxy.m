@implementation DIDocUploadSessionProxy

- (void)dealloc
{
  _TtC8coreidvd23DIDocUploadSessionProxy *v2;

  v2 = self;
  sub_1000F080C();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8coreidvd23DIDocUploadSessionProxy_jetsamTransaction));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8coreidvd23DIDocUploadSessionProxy_connection);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8coreidvd23DIDocUploadSessionProxy_docUploadHandler));
}

- (void)uploadDocData:(id)a3 uploadSettings:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC8coreidvd23DIDocUploadSessionProxy *v13;

  v8 = _Block_copy(a5);
  v9 = sub_10001CFF8(0, &qword_1006344F8, DIUploadAsset_ptr);
  v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v9);
  v11 = swift_allocObject(&unk_100607D30, 24, 7);
  *(_QWORD *)(v11 + 16) = v8;
  v12 = a4;
  v13 = self;
  sub_1000F09B4(v10, v12, sub_1000F179C, v11);

  swift_bridgeObjectRelease(v10);
  swift_release(v11);
}

- (void)cancelUploads
{
  _TtC8coreidvd23DIDocUploadSessionProxy *v2;

  v2 = self;
  sub_1000F0D64();

}

- (_TtC8coreidvd23DIDocUploadSessionProxy)init
{
  _TtC8coreidvd23DIDocUploadSessionProxy *result;

  result = (_TtC8coreidvd23DIDocUploadSessionProxy *)_swift_stdlib_reportUnimplementedInitializer("coreidvd.DIDocUploadSessionProxy", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
