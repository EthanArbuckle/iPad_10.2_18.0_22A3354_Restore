@implementation AssetMediaStreamLoader

- (_TtC15SeymourServices22AssetMediaStreamLoader)init
{
  _TtC15SeymourServices22AssetMediaStreamLoader *result;

  result = (_TtC15SeymourServices22AssetMediaStreamLoader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15SeymourServices22AssetMediaStreamLoader_assetFileStore);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15SeymourServices22AssetMediaStreamLoader_persistenceStore);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15SeymourServices22AssetMediaStreamLoader____lazy_storage___userInitiatedSession));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15SeymourServices22AssetMediaStreamLoader____lazy_storage___systemPrefetchSession));
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  _TtC15SeymourServices22AssetMediaStreamLoader *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_1CF00CA48(v8, v9, a5);

}

- (void)URLSession:(id)a3 aggregateAssetDownloadTask:(id)a4 willDownloadToURL:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  id v12;
  id v13;
  _TtC15SeymourServices22AssetMediaStreamLoader *v14;
  _BYTE v15[16];
  _TtC15SeymourServices22AssetMediaStreamLoader *v16;
  id v17;
  _BYTE *v18;

  v8 = sub_1CF14AC58();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = &v15[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1CF14AC10();
  v16 = self;
  v17 = a4;
  v18 = v11;
  v12 = a3;
  v13 = a4;
  v14 = self;
  sub_1CF14FA28();

  (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)URLSession:(id)a3 aggregateAssetDownloadTask:(id)a4 didLoadTimeRange:(id *)a5 totalTimeRangesLoaded:(id)a6 timeRangeExpectedToLoad:(id *)a7 forMediaSelection:(id)a8
{
  unint64_t v12;
  id v13;
  id v14;
  id v15;
  _TtC15SeymourServices22AssetMediaStreamLoader *v16;

  sub_1CEAE96C4(0, &qword_1EFB750F8);
  v12 = sub_1CF151D68();
  v13 = a3;
  v14 = a4;
  v15 = a8;
  v16 = self;
  sub_1CF013B04(v14, v12);

  swift_bridgeObjectRelease();
}

@end
