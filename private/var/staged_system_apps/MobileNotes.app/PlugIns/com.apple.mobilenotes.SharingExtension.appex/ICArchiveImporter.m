@implementation ICArchiveImporter

- (_TtC38com_apple_mobilenotes_SharingExtension17ICArchiveImporter)init
{
  _TtC38com_apple_mobilenotes_SharingExtension17ICArchiveImporter *result;
  _TtC38com_apple_mobilenotes_SharingExtension17ICArchiveImporter *v4;
  id v5;
  _TtC38com_apple_mobilenotes_SharingExtension17ICArchiveImporter *v6;

  result = (_TtC38com_apple_mobilenotes_SharingExtension17ICArchiveImporter *)objc_msgSend((id)objc_opt_self(ICNoteContext), "sharedContext");
  if (result
    && (v4 = result,
        v5 = -[ICArchiveImporter snapshotManagedObjectContext](result, "snapshotManagedObjectContext"),
        v4,
        v5))
  {
    v6 = -[ICArchiveImporter initWithContext:](self, "initWithContext:", v5);

    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC38com_apple_mobilenotes_SharingExtension17ICArchiveImporter)initWithContext:(id)a3
{
  objc_class *ObjectType;
  void *v6;
  id v7;
  id v8;
  __int16 IsAlexandriaDemoModeEnabled;
  int v10;
  _BYTE *v11;
  __int16 v12;
  _TtC38com_apple_mobilenotes_SharingExtension17ICArchiveImporter *v13;
  uint64_t v14;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v6 = (void *)objc_opt_self(NSFileManager);
  v7 = a3;
  v8 = objc_msgSend(v6, "defaultManager");
  IsAlexandriaDemoModeEnabled = ICInternalSettingsIsAlexandriaDemoModeEnabled();
  v10 = ICInternalSettingsIsAlexandriaDemoModeEnabled();
  v11 = objc_allocWithZone(ObjectType);
  if (v10)
    v12 = 256;
  else
    v12 = 0;
  v13 = (_TtC38com_apple_mobilenotes_SharingExtension17ICArchiveImporter *)sub_10004027C(v7, v12 | IsAlexandriaDemoModeEnabled, 0, 0, v8, v11, 0.0);
  v14 = swift_getObjectType(self);
  swift_deallocPartialClassInstance(self, v14, 128, 7);
  return v13;
}

- (void)dealloc
{
  objc_class *ObjectType;
  char *v4;
  void *v5;
  _TtC38com_apple_mobilenotes_SharingExtension17ICArchiveImporter *v6;
  id v7;
  objc_super v8;
  _BYTE v9[32];
  _BYTE v10[24];

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = (char *)self
     + OBJC_IVAR____TtC38com_apple_mobilenotes_SharingExtension17ICArchiveImporter_didReceiveMemoryWarningObserver;
  swift_beginAccess((char *)self+ OBJC_IVAR____TtC38com_apple_mobilenotes_SharingExtension17ICArchiveImporter_didReceiveMemoryWarningObserver, v10, 0, 0);
  sub_100031044((uint64_t)v4, (uint64_t)v9, &qword_1000EB6E8);
  v5 = (void *)objc_opt_self(NSNotificationCenter);
  v6 = self;
  v7 = objc_msgSend(v5, "defaultCenter");
  sub_100040578((uint64_t)v9, v7);

  sub_100036060((uint64_t)v9, &qword_1000EB6E8);
  v8.receiver = v6;
  v8.super_class = ObjectType;
  -[ICArchiveImporter dealloc](&v8, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC38com_apple_mobilenotes_SharingExtension17ICArchiveImporter_context));

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC38com_apple_mobilenotes_SharingExtension17ICArchiveImporter_fileManager));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC38com_apple_mobilenotes_SharingExtension17ICArchiveImporter_errors));
  sub_100036060((uint64_t)self+ OBJC_IVAR____TtC38com_apple_mobilenotes_SharingExtension17ICArchiveImporter_didReceiveMemoryWarningObserver, &qword_1000EB6E8);
}

- (NSDictionary)errors
{
  uint64_t *v2;
  uint64_t v3;
  Class isa;
  _BYTE v6[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC38com_apple_mobilenotes_SharingExtension17ICArchiveImporter_errors);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC38com_apple_mobilenotes_SharingExtension17ICArchiveImporter_errors, v6, 0, 0);
  v3 = *v2;
  type metadata accessor for URL(0);
  swift_bridgeObjectRetain(v3);
  sub_100030EE4(&qword_1000EBAA0);
  sub_100042114(&qword_1000EBAA8, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSDictionary *)isa;
}

- (void)setErrors:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11[24];

  v5 = type metadata accessor for URL(0);
  v6 = sub_100030EE4(&qword_1000EBAA0);
  v7 = sub_100042114(&qword_1000EBAA8, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
  v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, v5, v6, v7);
  v9 = (uint64_t *)((char *)self + OBJC_IVAR____TtC38com_apple_mobilenotes_SharingExtension17ICArchiveImporter_errors);
  swift_beginAccess(v9, v11, 1, 0);
  v10 = *v9;
  *v9 = v8;
  swift_bridgeObjectRelease(v10);
}

- (BOOL)importArchiveAtURL:(id)a3 intoNoteContainerWithID:(id)a4 progress:(id)a5 error:(id *)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  id v14;
  id v15;
  _TtC38com_apple_mobilenotes_SharingExtension17ICArchiveImporter *v16;
  _BYTE v18[16];
  _TtC38com_apple_mobilenotes_SharingExtension17ICArchiveImporter *v19;
  id v20;
  _BYTE *v21;
  id v22;

  v10 = type metadata accessor for URL(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = &v18[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v19 = self;
  v20 = a4;
  v21 = v13;
  v22 = a5;
  v14 = a4;
  v15 = a5;
  v16 = self;
  NSManagedObjectContext.performAndWait<A>(_:)(sub_1000424DC, v18, (char *)&type metadata for () + 8);
  (*(void (**)(_BYTE *, uint64_t))(v11 + 8))(v13, v10);

  return 1;
}

@end
