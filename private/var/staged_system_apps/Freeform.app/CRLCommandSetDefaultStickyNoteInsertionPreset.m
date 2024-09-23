@implementation CRLCommandSetDefaultStickyNoteInsertionPreset

- (_TtC8Freeform45CRLCommandSetDefaultStickyNoteInsertionPreset)initWithStickyNoteItem:(id)a3
{
  id v4;
  Swift::String v5;
  objc_class *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  _TtC8Freeform45CRLCommandSetDefaultStickyNoteInsertionPreset *v13;
  uint64_t ObjectType;
  objc_super v16;
  _BYTE v17[880];
  void *v18;

  v4 = a3;
  sub_100C8E820(v4, 0, (uint64_t)v17);
  v18 = &_swiftEmptyDictionarySingleton;
  SyncEvent.FetchedRecordZoneChanges.Deletion.init(recordID:recordType:)((CKRecordID)v17, v5);
  v6 = (objc_class *)type metadata accessor for CRLCommandSetDefaultStickyNoteInsertionPreset();
  v7 = objc_allocWithZone(v6);
  v8 = OBJC_IVAR____TtC8Freeform45CRLCommandSetDefaultStickyNoteInsertionPreset_actionString;
  v9 = qword_1013DC880;
  v10 = (char *)v7;
  if (v9 != -1)
    swift_once(&qword_1013DC880, sub_1004C34DC);
  v11 = &v10[v8];
  v12 = unk_1013DF950;
  *(_QWORD *)v11 = qword_1013DF948;
  *((_QWORD *)v11 + 1) = v12;
  sub_1004C4938((uint64_t)v17, (uint64_t)&v10[OBJC_IVAR____TtC8Freeform45CRLCommandSetDefaultStickyNoteInsertionPreset_stickyStyle], &qword_1013DFA70);
  swift_bridgeObjectRetain(v12);

  v16.receiver = v10;
  v16.super_class = v6;
  v13 = -[CRLCommand init](&v16, "init");

  ObjectType = swift_getObjectType(self);
  swift_deallocPartialClassInstance(self, ObjectType, 920, 7);
  return v13;
}

- (_TtC8Freeform45CRLCommandSetDefaultStickyNoteInsertionPreset)init
{
  _TtC8Freeform45CRLCommandSetDefaultStickyNoteInsertionPreset *result;

  result = (_TtC8Freeform45CRLCommandSetDefaultStickyNoteInsertionPreset *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLCommandSetDefaultStickyNoteInsertionPreset", 54, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __n128 v3;
  _BYTE v4[888];

  sub_1004C4938((uint64_t)self + OBJC_IVAR____TtC8Freeform45CRLCommandSetDefaultStickyNoteInsertionPreset_stickyStyle, (uint64_t)v4, &qword_1013DFA70);
  sub_1004C4254(v4, sub_1004C3D60, v3);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.committed[OBJC_IVAR____TtC8Freeform45CRLCommandSetDefaultStickyNoteInsertionPreset_actionString]);
}

@end
