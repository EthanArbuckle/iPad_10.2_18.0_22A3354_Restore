@implementation CRLAssetFileManager

- (_TtC8Freeform19CRLAssetFileManager)init
{
  _TtC8Freeform19CRLAssetFileManager *result;

  result = (_TtC8Freeform19CRLAssetFileManager *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLAssetFileManager", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform19CRLAssetFileManager_store);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform19CRLAssetFileManager_lock));
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform19CRLAssetFileManager_assetsDirectoryURL;
  v4 = type metadata accessor for URL(0);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC8Freeform19CRLAssetFileManager_deletedAssetsDirectoryURL, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Freeform19CRLAssetFileManager_assetFileURLCache));

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8Freeform19CRLAssetFileManager_purgeDeletedAssetsWorkItem));
}

@end
