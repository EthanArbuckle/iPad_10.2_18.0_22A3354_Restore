@implementation BEDocument

- (int64_t)ordinal
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___BEDocument_ordinal);
}

- (NSString)href
{
  return (NSString *)sub_10DF7C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BEDocument_href);
}

- (NSString)title
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->ordinal[OBJC_IVAR___BEDocument_title];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->ordinal[OBJC_IVAR___BEDocument_title]);
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSString)manifestId
{
  return (NSString *)sub_10DF7C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BEDocument_manifestId);
}

- (NSString)assetId
{
  return (NSString *)sub_10DF7C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BEDocument_assetId);
}

- (int64_t)file_size
{
  int64_t *v2;
  _BYTE v4[24];

  v2 = (int64_t *)((char *)self + OBJC_IVAR___BEDocument_file_size);
  swift_beginAccess((char *)self + OBJC_IVAR___BEDocument_file_size, v4, 0, 0);
  return *v2;
}

- (void)setFile_size:(int64_t)a3
{
  int64_t *v4;
  _BYTE v5[24];

  v4 = (int64_t *)((char *)self + OBJC_IVAR___BEDocument_file_size);
  swift_beginAccess((char *)self + OBJC_IVAR___BEDocument_file_size, v5, 1, 0);
  *v4 = a3;
}

- (_TtP13AEBookPlugins38DocumentCollectionInformationCacheType_)protocolCacheItem
{
  return (_TtP13AEBookPlugins38DocumentCollectionInformationCacheType_ *)0;
}

- (NSArray)contentFragments
{
  uint64_t KeyPath;
  uint64_t v4;
  BEDocument *v5;
  uint64_t v6;
  uint64_t v7;
  Class isa;
  uint64_t v10;

  KeyPath = swift_getKeyPath(&unk_173EC0);
  v4 = swift_getKeyPath(&unk_173EE8);
  v5 = self;
  static Published.subscript.getter(&v10, v5, KeyPath, v4);
  swift_release(v4);
  swift_release(KeyPath);
  v6 = v10;
  v7 = sub_119534(v10);
  swift_bridgeObjectRelease(v6);

  sub_108F90(&qword_20F470);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  return (NSArray *)isa;
}

- (int64_t)pageOffset
{
  uint64_t KeyPath;
  uint64_t v4;
  BEDocument *v5;
  int64_t v7;

  KeyPath = swift_getKeyPath(&unk_173F20);
  v4 = swift_getKeyPath(&unk_173F48);
  v5 = self;
  static Published.subscript.getter(&v7, v5, KeyPath, v4);
  swift_release(v4);
  swift_release(KeyPath);

  return v7;
}

- (void)setPageOffset:(int64_t)a3
{
  uint64_t KeyPath;
  uint64_t v6;
  int64_t v7;

  KeyPath = swift_getKeyPath(&unk_173F20);
  v6 = swift_getKeyPath(&unk_173F48);
  v7 = a3;
  static Published.subscript.setter(&v7, self, KeyPath, v6);
}

- (NSArray)pages
{
  uint64_t KeyPath;
  uint64_t v4;
  BEDocument *v5;
  uint64_t v6;
  Class isa;
  uint64_t v9;

  KeyPath = swift_getKeyPath(&unk_173EC0);
  v4 = swift_getKeyPath(&unk_173EE8);
  v5 = self;
  static Published.subscript.getter(&v9, v5, KeyPath, v4);
  swift_release(v4);
  swift_release(KeyPath);

  v6 = v9;
  type metadata accessor for Page(0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return (NSArray *)isa;
}

- (void)setPages:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  uint64_t v9;

  v5 = type metadata accessor for Page(0);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  KeyPath = swift_getKeyPath(&unk_173EC0);
  v8 = swift_getKeyPath(&unk_173EE8);
  v9 = v6;
  static Published.subscript.setter(&v9, self, KeyPath, v8);
}

- (_TtP13AEBookPlugins30DocumentPaginationDataProvider_)paginationData
{
  return (_TtP13AEBookPlugins30DocumentPaginationDataProvider_ *)(id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BEDocument_paginationData));
}

- (void)setPaginationData:(id)a3
{
  BEDocument *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_11BFD0((uint64_t)a3);
  swift_unknownObjectRelease(a3);

}

- (BEDocument)init
{
  BEDocument *result;

  result = (BEDocument *)_swift_stdlib_reportUnimplementedInitializer("AEBookPlugins.Document", 22, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  swift_bridgeObjectRelease(*(_QWORD *)&self->ordinal[OBJC_IVAR___BEDocument_href]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->ordinal[OBJC_IVAR___BEDocument_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->ordinal[OBJC_IVAR___BEDocument_manifestId]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->ordinal[OBJC_IVAR___BEDocument_assetId]);
  v3 = (char *)self + OBJC_IVAR___BEDocument__pageOffset;
  v4 = sub_108F90(&qword_20F180);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___BEDocument__pages;
  v6 = sub_108F90(&qword_20F428);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BEDocument_paginationData));
}

- (NSString)description
{
  return (NSString *)sub_10F870(self, (uint64_t)a2, (void (*)(void))Document.description.getter);
}

- (NSString)debugDescription
{
  return (NSString *)sub_10F870(self, (uint64_t)a2, (void (*)(void))Document.debugDescription.getter);
}

@end
