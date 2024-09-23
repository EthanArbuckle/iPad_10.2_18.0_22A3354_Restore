@implementation NoteSearchResult

- (NSString)title
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->isModernNote[OBJC_IVAR____TtC11MobileNotesP33_10D1876D3C9D5070F0B0F84A41ABC8CB16NoteSearchResult_title];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (NSDate)creationDate
{
  return (NSDate *)sub_1001DB080((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC11MobileNotesP33_10D1876D3C9D5070F0B0F84A41ABC8CB16NoteSearchResult_creationDate);
}

- (NSDate)modificationDate
{
  return (NSDate *)sub_1001DB080((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC11MobileNotesP33_10D1876D3C9D5070F0B0F84A41ABC8CB16NoteSearchResult_modificationDate);
}

- (NSString)folderName
{
  return (NSString *)sub_1001DB160((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC11MobileNotesP33_10D1876D3C9D5070F0B0F84A41ABC8CB16NoteSearchResult_folderName);
}

- (NSString)folderManagedIdentifier
{
  return (NSString *)sub_1001DB160((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC11MobileNotesP33_10D1876D3C9D5070F0B0F84A41ABC8CB16NoteSearchResult_folderManagedIdentifier);
}

- (int64_t)hash
{
  _TtC11MobileNotesP33_10D1876D3C9D5070F0B0F84A41ABC8CB16NoteSearchResult *v2;
  Swift::Int v3;

  v2 = self;
  v3 = sub_1001DB1E8();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC11MobileNotesP33_10D1876D3C9D5070F0B0F84A41ABC8CB16NoteSearchResult *v5;
  uint64_t v6;
  uint64_t v7;
  _TtC11MobileNotesP33_10D1876D3C9D5070F0B0F84A41ABC8CB16NoteSearchResult *v8;
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
  v9 = sub_1001DB50C((uint64_t)v11);

  sub_100012DDC((uint64_t)v11, &qword_1005CF190);
  return v9 & 1;
}

- (_TtC11MobileNotesP33_10D1876D3C9D5070F0B0F84A41ABC8CB16NoteSearchResult)init
{
  _TtC11MobileNotesP33_10D1876D3C9D5070F0B0F84A41ABC8CB16NoteSearchResult *result;

  result = (_TtC11MobileNotesP33_10D1876D3C9D5070F0B0F84A41ABC8CB16NoteSearchResult *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.NoteSearchResult", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC11MobileNotesP33_10D1876D3C9D5070F0B0F84A41ABC8CB16NoteSearchResult_id;
  v4 = type metadata accessor for NoteID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(_QWORD *)&self->isModernNote[OBJC_IVAR____TtC11MobileNotesP33_10D1876D3C9D5070F0B0F84A41ABC8CB16NoteSearchResult_title]);
  sub_100012DDC((uint64_t)self + OBJC_IVAR____TtC11MobileNotesP33_10D1876D3C9D5070F0B0F84A41ABC8CB16NoteSearchResult_creationDate, (uint64_t *)&unk_1005D7B20);
  sub_100012DDC((uint64_t)self + OBJC_IVAR____TtC11MobileNotesP33_10D1876D3C9D5070F0B0F84A41ABC8CB16NoteSearchResult_modificationDate, (uint64_t *)&unk_1005D7B20);
  swift_bridgeObjectRelease(*(_QWORD *)&self->isModernNote[OBJC_IVAR____TtC11MobileNotesP33_10D1876D3C9D5070F0B0F84A41ABC8CB16NoteSearchResult_folderName]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->isModernNote[OBJC_IVAR____TtC11MobileNotesP33_10D1876D3C9D5070F0B0F84A41ABC8CB16NoteSearchResult_folderManagedIdentifier]);
}

@end
