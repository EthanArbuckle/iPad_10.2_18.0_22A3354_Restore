@implementation AssetImageLoader

- (_TtC15SeymourServices16AssetImageLoader)init
{
  _TtC15SeymourServices16AssetImageLoader *result;

  result = (_TtC15SeymourServices16AssetImageLoader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15SeymourServices16AssetImageLoader_assetFileStore);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15SeymourServices16AssetImageLoader____lazy_storage___session));
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didFinishDownloadingToURL:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC15SeymourServices16AssetImageLoader *v14;
  uint64_t v15;

  v8 = sub_1CF14AC58();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CF14AC10();
  v12 = a3;
  v13 = a4;
  v14 = self;
  sub_1CEC5FD18(v13, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)URLSession:(id)a3 downloadTask:(id)a4 didWriteData:(int64_t)a5 totalBytesWritten:(int64_t)a6 totalBytesExpectedToWrite:(int64_t)a7
{
  id v11;
  id v12;
  _TtC15SeymourServices16AssetImageLoader *v13;

  v11 = a3;
  v12 = a4;
  v13 = self;
  sub_1CEC6055C(v12, a6, a7);

}

- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4
{
  id v6;
  id v7;
  _TtC15SeymourServices16AssetImageLoader *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1CEC60B04(v7);

}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  _TtC15SeymourServices16AssetImageLoader *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_1CEC60EE0(v9, a5);

}

@end
