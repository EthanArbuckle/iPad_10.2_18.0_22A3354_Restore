@implementation ICArchiveExporter

- (ICArchiveExporter)init
{
  ICArchiveExporter *result;

  sub_10007BEBC();
  return result;
}

+ (ICArchiveExporter)exporterForHandoffToPages
{
  id v2;

  sub_10007E5F0();
  return (ICArchiveExporter *)v2;
}

- (id)createArchiveForObjects:(id)a3 progress:(id)a4 error:(id *)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  ICArchiveExporter *v14;
  id v15;
  char *v16;
  NSURL *v17;
  void *v18;
  void *v19;
  uint64_t v21;

  v8 = type metadata accessor for URL(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100036000(0, (unint64_t *)&qword_1000EB810, ICCloudSyncingObject_ptr);
  v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v12);
  v14 = self;
  v15 = a4;
  v16 = sub_10007D668(v13, (uint64_t)v14);
  sub_10006E404((uint64_t)v16, (uint64_t)v15, (uint64_t)v11);
  swift_bridgeObjectRelease(v13);

  swift_bridgeObjectRelease(v16);
  URL._bridgeToObjectiveC()(v17);
  v19 = v18;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v19;
}

- (BOOL)removeArchiveAt:(id)a3 error:(id *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  ICArchiveExporter *v10;
  uint64_t v12;

  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = self;
  sub_10006E6EC((uint64_t)v9);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return 1;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___ICArchiveExporter_exporter), a2);
}

@end
