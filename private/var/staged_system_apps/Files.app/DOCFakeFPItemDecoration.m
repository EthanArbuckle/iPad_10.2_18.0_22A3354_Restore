@implementation DOCFakeFPItemDecoration

- (NSString)bundleIdentifier
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (NSString)imageType
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->ut[OBJC_IVAR____TtC5FilesP33_0D3D84D98814A1E39FA4FAA1E54BDD7A23DOCFakeFPItemDecoration_ut];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (_TtC5FilesP33_0D3D84D98814A1E39FA4FAA1E54BDD7A23DOCFakeFPItemDecoration)init
{
  _TtC5FilesP33_0D3D84D98814A1E39FA4FAA1E54BDD7A23DOCFakeFPItemDecoration *result;

  result = (_TtC5FilesP33_0D3D84D98814A1E39FA4FAA1E54BDD7A23DOCFakeFPItemDecoration *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCFakeFPItemDecoration", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->ut[OBJC_IVAR____TtC5FilesP33_0D3D84D98814A1E39FA4FAA1E54BDD7A23DOCFakeFPItemDecoration_ut]);
}

@end
