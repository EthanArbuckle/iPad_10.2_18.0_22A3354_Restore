@implementation ICArchiveImportNoteFileParser

- (_TtC38com_apple_mobilenotes_SharingExtension29ICArchiveImportNoteFileParser)init
{
  return (_TtC38com_apple_mobilenotes_SharingExtension29ICArchiveImportNoteFileParser *)sub_100056A34();
}

- (_TtC38com_apple_mobilenotes_SharingExtension29ICArchiveImportNoteFileParser)initWithArchiveImporter:(id)a3
{
  id v3;
  _TtC38com_apple_mobilenotes_SharingExtension29ICArchiveImportNoteFileParser *v4;

  v3 = a3;
  v4 = (_TtC38com_apple_mobilenotes_SharingExtension29ICArchiveImportNoteFileParser *)sub_10005C634(v3);

  return v4;
}

- (NSArray)allowedContentTypes
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC38com_apple_mobilenotes_SharingExtension29ICArchiveImportNoteFileParser_allowedContentTypes);
  type metadata accessor for UTType(0, a2);
  swift_bridgeObjectRetain(v2);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (BOOL)canHandleFileURL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC38com_apple_mobilenotes_SharingExtension29ICArchiveImportNoteFileParser *v9;
  uint64_t v11;

  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  LOBYTE(a3) = sub_100056E98();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return a3 & 1;
}

- (void)totalNotesFoundAtFileURL:(id)a3 completionBlock:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  _TtC38com_apple_mobilenotes_SharingExtension29ICArchiveImportNoteFileParser *v13;
  uint64_t v14;
  uint64_t v15;

  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = swift_allocObject(&unk_1000D8820, 24, 7);
  *(_QWORD *)(v12 + 16) = v11;
  v13 = self;
  sub_10005704C((uint64_t)v10, (uint64_t)sub_10005BED4, v12);

  swift_release(v12, v14);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)parseFileURL:(id)a3 newNoteBlock:(id)a4 updatedNoteBlock:(id)a5 errorBlock:(id)a6 completionBlock:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _TtC38com_apple_mobilenotes_SharingExtension29ICArchiveImportNoteFileParser *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v13 = type metadata accessor for URL(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = _Block_copy(a4);
  v18 = _Block_copy(a5);
  v19 = _Block_copy(a6);
  v20 = _Block_copy(a7);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v21 = swift_allocObject(&unk_1000D8708, 24, 7);
  *(_QWORD *)(v21 + 16) = v17;
  v22 = swift_allocObject(&unk_1000D8730, 24, 7);
  *(_QWORD *)(v22 + 16) = v18;
  v23 = swift_allocObject(&unk_1000D8758, 24, 7);
  *(_QWORD *)(v23 + 16) = v19;
  v24 = swift_allocObject(&unk_1000D8780, 24, 7);
  *(_QWORD *)(v24 + 16) = v20;
  v25 = self;
  sub_100057C28((uint64_t)v16, (uint64_t)sub_10005BEB4, v21, (uint64_t)sub_10005BED4, v22, (void (*)(uint64_t))sub_10005BEE4, v23, (void (*)(void))sub_10005BF24, (void (*)(void))v24);

  swift_release(v21, v26);
  swift_release(v22, v27);
  swift_release(v23, v28);
  swift_release(v24, v29);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

- (void)cancelParsing
{
  _TtC38com_apple_mobilenotes_SharingExtension29ICArchiveImportNoteFileParser *v2;

  v2 = self;
  sub_100058B18();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC38com_apple_mobilenotes_SharingExtension29ICArchiveImportNoteFileParser_queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC38com_apple_mobilenotes_SharingExtension29ICArchiveImportNoteFileParser_archiveImporter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC38com_apple_mobilenotes_SharingExtension29ICArchiveImportNoteFileParser_userDefaults));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC38com_apple_mobilenotes_SharingExtension29ICArchiveImportNoteFileParser_allowedContentTypes));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC38com_apple_mobilenotes_SharingExtension29ICArchiveImportNoteFileParser_importStates));
}

@end
