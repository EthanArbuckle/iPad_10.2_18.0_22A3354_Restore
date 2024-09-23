@implementation EditingSectionedCollection

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (_TtC16MusicApplication26EditingSectionedCollection)initWithCoder:(id)a3
{
  id v4;
  _TtC16MusicApplication26EditingSectionedCollection *result;

  *(_QWORD *)&self->MPSectionedCollection_opaque[OBJC_IVAR____TtC16MusicApplication26EditingSectionedCollection_changeRecords] = _swiftEmptyArrayStorage;
  *(_QWORD *)&self->MPSectionedCollection_opaque[OBJC_IVAR____TtC16MusicApplication26EditingSectionedCollection_entries] = _swiftEmptyArrayStorage;
  v4 = a3;

  result = (_TtC16MusicApplication26EditingSectionedCollection *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/EditingSectionedCollection.swift", 49, 2, 32, 0);
  __break(1u);
  return result;
}

- (int64_t)numberOfSections
{
  return *(_QWORD *)(*(_QWORD *)&self->MPSectionedCollection_opaque[OBJC_IVAR____TtC16MusicApplication26EditingSectionedCollection_entries]
                   + 16);
}

- (id)sectionAtIndex:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  _TtC16MusicApplication26EditingSectionedCollection *v7;
  NSString v8;
  void *v9;

  v5 = OBJC_IVAR____TtC16MusicApplication26EditingSectionedCollection_baseSectionedCollection;
  v6 = *(void **)&self->MPSectionedCollection_opaque[OBJC_IVAR____TtC16MusicApplication26EditingSectionedCollection_baseSectionedCollection];
  v7 = self;
  if ((uint64_t)objc_msgSend(v6, "numberOfSections") <= a3)
    v8 = String._bridgeToObjectiveC()();
  else
    v8 = objc_msgSend(*(id *)&self->MPSectionedCollection_opaque[v5], "sectionAtIndex:", a3);
  v9 = v8;

  return v9;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return sub_8E9C68(a3);
}

- (id)itemAtIndexPath:(id)a3
{
  return sub_8EAD98(self, (uint64_t)a2, a3, (uint64_t (*)(char *))sub_8E9CC4);
}

- (void)enumerateSectionsUsingBlock:(id)a3
{
  void *v4;
  _TtC16MusicApplication26EditingSectionedCollection *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_8EC738(v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)enumerateItemsInSectionAtIndex:(int64_t)a3 usingBlock:(id)a4
{
  void *v6;
  _TtC16MusicApplication26EditingSectionedCollection *v7;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  sub_8EC82C(a3, v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)enumerateItemsUsingBlock:(id)a3
{
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _TtC16MusicApplication26EditingSectionedCollection *v9;
  __n128 v10;
  _QWORD v11[4];
  _QWORD aBlock[5];
  uint64_t v13;

  v4 = _Block_copy(a3);
  v11[2] = v4;
  v5 = (_QWORD *)swift_allocObject(&unk_138B788, 40, 7);
  v5[2] = self;
  v5[3] = sub_8EC670;
  v5[4] = v11;
  v6 = swift_allocObject(&unk_138B7B0, 32, 7);
  *(_QWORD *)(v6 + 16) = sub_8EC6F0;
  *(_QWORD *)(v6 + 24) = v5;
  aBlock[4] = sub_D7318;
  v13 = v6;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_42FC3C;
  aBlock[3] = &block_descriptor_14_7;
  v7 = _Block_copy(aBlock);
  v8 = v13;
  v9 = self;
  swift_retain(v6);
  -[EditingSectionedCollection enumerateSectionsUsingBlock:](v9, "enumerateSectionsUsingBlock:", v7, swift_release(v8).n128_f64[0]);
  _Block_release(v7);
  LOBYTE(v7) = swift_isEscapingClosureAtFileLocation(v6, "", 118, 203, 32, 1, v10);
  swift_release(v5);
  swift_release(v6);
  _Block_release(v4);

  if ((v7 & 1) != 0)
    __break(1u);
}

- (id)itemsInSectionAtIndex:(int64_t)a3
{
  _TtC16MusicApplication26EditingSectionedCollection *v4;
  Class isa;

  v4 = self;
  sub_8EA294(a3);

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)firstSection
{
  _TtC16MusicApplication26EditingSectionedCollection *v2;
  id v3;

  v2 = self;
  if (-[EditingSectionedCollection numberOfSections](v2, "numberOfSections") < 1)
    v3 = 0;
  else
    v3 = -[EditingSectionedCollection sectionAtIndex:](v2, "sectionAtIndex:", 0);

  return v3;
}

- (id)lastSection
{
  _TtC16MusicApplication26EditingSectionedCollection *v2;
  char *v3;
  id v4;

  v2 = self;
  v3 = -[EditingSectionedCollection numberOfSections](v2, "numberOfSections");
  if ((uint64_t)v3 < 1)
    v4 = 0;
  else
    v4 = -[EditingSectionedCollection sectionAtIndex:](v2, "sectionAtIndex:", v3 - 1);

  return v4;
}

- (id)firstItem
{
  _TtC16MusicApplication26EditingSectionedCollection *v2;
  id v3;

  v2 = self;
  v3 = sub_8EA590();

  return v3;
}

- (id)lastItem
{
  _TtC16MusicApplication26EditingSectionedCollection *v2;
  id v3;

  v2 = self;
  v3 = sub_8EA6C4();

  return v3;
}

- (id)allItems
{
  _TtC16MusicApplication26EditingSectionedCollection *v2;
  Class isa;

  v2 = self;
  sub_8EA7D4();

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (id)identifiersForItemAtIndexPath:(id)a3
{
  return sub_8EAD98(self, (uint64_t)a2, a3, (uint64_t (*)(char *))sub_8EABF8);
}

- (id)identifiersForSectionAtIndex:(int64_t)a3
{
  _TtC16MusicApplication26EditingSectionedCollection *v4;
  id v5;

  v4 = self;
  v5 = sub_8EAE54(a3);

  return v5;
}

- (_TtC16MusicApplication26EditingSectionedCollection)init
{
  _TtC16MusicApplication26EditingSectionedCollection *result;

  result = (_TtC16MusicApplication26EditingSectionedCollection *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.EditingSectionedCollection", 43, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(_QWORD *)&self->MPSectionedCollection_opaque[OBJC_IVAR____TtC16MusicApplication26EditingSectionedCollection_changeRecords]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->MPSectionedCollection_opaque[OBJC_IVAR____TtC16MusicApplication26EditingSectionedCollection_entries]);
}

@end
