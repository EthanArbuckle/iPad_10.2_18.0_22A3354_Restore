@implementation AttachmentSearchResult

- (NSString)title
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->isModernAttachment[OBJC_IVAR____TtC11MobileNotesP33_F583289AB4A4398FFA2D9CF750E5A2EB22AttachmentSearchResult_title];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (int64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  _TtC11MobileNotesP33_F583289AB4A4398FFA2D9CF750E5A2EB22AttachmentSearchResult *v5;
  uint64_t v6;
  uint64_t v7;
  Swift::Int v8;
  _OWORD v10[4];
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  Hasher.init()(v10, self);
  v3 = type metadata accessor for AttachmentID(0);
  v4 = sub_100019C6C(&qword_1005D2BD8, (uint64_t (*)(uint64_t))&type metadata accessor for AttachmentID, (uint64_t)&protocol conformance descriptor for AttachmentID);
  v5 = self;
  dispatch thunk of Hashable.hash(into:)(v10, v3, v4);
  v6 = *(uint64_t *)((char *)&v5->super.isa
                  + OBJC_IVAR____TtC11MobileNotesP33_F583289AB4A4398FFA2D9CF750E5A2EB22AttachmentSearchResult_title);
  v7 = *(_QWORD *)&v5->isModernAttachment[OBJC_IVAR____TtC11MobileNotesP33_F583289AB4A4398FFA2D9CF750E5A2EB22AttachmentSearchResult_title];
  swift_bridgeObjectRetain(v7);
  String.hash(into:)(v10, v6, v7);
  swift_bridgeObjectRelease(v7);
  v14 = v10[2];
  v15 = v10[3];
  v16 = v11;
  v12 = v10[0];
  v13 = v10[1];
  v8 = Hasher.finalize()();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  _TtC11MobileNotesP33_F583289AB4A4398FFA2D9CF750E5A2EB22AttachmentSearchResult *v5;
  uint64_t v6;
  uint64_t v7;
  _TtC11MobileNotesP33_F583289AB4A4398FFA2D9CF750E5A2EB22AttachmentSearchResult *v8;
  char v9;
  _OWORD v11[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v11, v6);
    swift_unknownObjectRelease(a3, v7);
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v8 = self;
  }
  v9 = sub_10022BDC4((uint64_t)v11);

  sub_100012DDC((uint64_t)v11, &qword_1005CF190);
  return v9 & 1;
}

- (_TtC11MobileNotesP33_F583289AB4A4398FFA2D9CF750E5A2EB22AttachmentSearchResult)init
{
  _TtC11MobileNotesP33_F583289AB4A4398FFA2D9CF750E5A2EB22AttachmentSearchResult *result;

  result = (_TtC11MobileNotesP33_F583289AB4A4398FFA2D9CF750E5A2EB22AttachmentSearchResult *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.AttachmentSearchResult", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC11MobileNotesP33_F583289AB4A4398FFA2D9CF750E5A2EB22AttachmentSearchResult_id;
  v4 = type metadata accessor for AttachmentID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(_QWORD *)&self->isModernAttachment[OBJC_IVAR____TtC11MobileNotesP33_F583289AB4A4398FFA2D9CF750E5A2EB22AttachmentSearchResult_title]);
}

@end
