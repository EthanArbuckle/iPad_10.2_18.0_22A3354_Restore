@implementation BEBookViewModel

- (NSString)documentUniqueID
{
  char *v2;
  uint64_t v3;
  NSString v4;
  _BYTE v6[24];

  v2 = (char *)self + OBJC_IVAR___BEBookViewModel_documentUniqueID;
  swift_beginAccess((char *)self + OBJC_IVAR___BEBookViewModel_documentUniqueID, v6, 0, 0);
  v3 = *((_QWORD *)v2 + 1);
  swift_bridgeObjectRetain(v3);
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (void)setDocumentUniqueID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9[24];

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___BEBookViewModel_documentUniqueID);
  swift_beginAccess(v7, v9, 1, 0);
  v8 = v7[1];
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease(v8);
}

- (NSString)title
{
  return (NSString *)sub_10DF7C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BEBookViewModel_title);
}

- (NSString)path
{
  return (NSString *)sub_10DF7C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BEBookViewModel_path);
}

- (NSArray)authors
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BEBookViewModel_authors);
  swift_bridgeObjectRetain(v2);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (int64_t)collection_type
{
  return 0;
}

- (BOOL)sample
{
  BOOL *v2;
  _BYTE v4[24];

  v2 = (BOOL *)self + OBJC_IVAR___BEBookViewModel_sample;
  swift_beginAccess((char *)self + OBJC_IVAR___BEBookViewModel_sample, v4, 0, 0);
  return *v2;
}

- (void)setSample:(BOOL)a3
{
  BOOL *v4;
  _BYTE v5[24];

  v4 = (BOOL *)self + OBJC_IVAR___BEBookViewModel_sample;
  swift_beginAccess((char *)self + OBJC_IVAR___BEBookViewModel_sample, v5, 1, 0);
  *v4 = a3;
}

- (BEBookViewModel)initWithBook:(id)a3
{
  swift_unknownObjectRetain(a3);
  return (BEBookViewModel *)BookViewModel.init(book:)(a3);
}

- (id)documentFor:(int64_t)a3
{
  BEBookViewModel *v4;
  void *v5;

  v4 = self;
  v5 = sub_10E8B4((id)a3);

  return v5;
}

- (NSArray)paginatableDocuments
{
  uint64_t KeyPath;
  uint64_t v4;
  BEBookViewModel *v5;
  uint64_t v6;
  Class isa;
  uint64_t v9;

  KeyPath = swift_getKeyPath(&unk_173698);
  v4 = swift_getKeyPath(&unk_1736C0);
  v5 = self;
  static Published.subscript.getter(&v9, v5, KeyPath, v4);
  swift_release(v4);
  swift_release(KeyPath);

  v6 = v9;
  sub_108F90(&qword_20F1A0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return (NSArray *)isa;
}

- (void)setPaginatableDocuments:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  uint64_t v9;

  v5 = sub_108F90(&qword_20F1A0);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  KeyPath = swift_getKeyPath(&unk_173698);
  v8 = swift_getKeyPath(&unk_1736C0);
  v9 = v6;
  static Published.subscript.setter(&v9, self, KeyPath, v8);
}

- (BEBookViewModel)init
{
  BEBookViewModel *result;

  result = (BEBookViewModel *)_swift_stdlib_reportUnimplementedInitializer("AEBookPlugins.BookViewModel", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  swift_bridgeObjectRelease(*(_QWORD *)&self->documentUniqueID[OBJC_IVAR___BEBookViewModel_documentUniqueID]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->documentUniqueID[OBJC_IVAR___BEBookViewModel_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->documentUniqueID[OBJC_IVAR___BEBookViewModel_path]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BEBookViewModel_authors));
  v3 = (char *)self + OBJC_IVAR___BEBookViewModel__paginatableDocuments;
  v4 = sub_108F90(&qword_20F1B0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___BEBookViewModel__pageTotal;
  v6 = sub_108F90(&qword_20F180);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

- (NSString)description
{
  return (NSString *)sub_10F870(self, (uint64_t)a2, (void (*)(void))BookViewModel.description.getter);
}

- (NSString)debugDescription
{
  return (NSString *)sub_10F870(self, (uint64_t)a2, (void (*)(void))BookViewModel.debugDescription.getter);
}

@end
