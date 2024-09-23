@implementation ShelfCollectionViewLayout.LayoutAttributes

- (int64_t)hash
{
  unsigned __int8 *v2;
  int64_t v3;
  Swift::UInt v4;
  Swift::Int v5;
  _QWORD v7[9];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ShelfCollectionViewLayout.LayoutAttributes();
  v2 = (unsigned __int8 *)v8.receiver;
  v3 = -[ShelfCollectionViewLayout.LayoutAttributes hash](&v8, "hash");
  v4 = v2[OBJC_IVAR____TtCC16MusicApplication25ShelfCollectionViewLayout16LayoutAttributes_rowPosition];
  Hasher.init(_seed:)(v7);
  Hasher._combine(_:)(v4);
  v5 = Hasher._finalize()();

  return v5 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtCC16MusicApplication25ShelfCollectionViewLayout16LayoutAttributes *v5;
  uint64_t v6;
  _TtCC16MusicApplication25ShelfCollectionViewLayout16LayoutAttributes *v7;
  BOOL v8;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = sub_755030((uint64_t)v10);

  sub_56024((uint64_t)v10, (uint64_t *)&unk_14AD640);
  return v8;
}

- (id)copyWithZone:(void *)a3
{
  _TtCC16MusicApplication25ShelfCollectionViewLayout16LayoutAttributes *v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  _QWORD v9[3];
  uint64_t v10;

  v4 = self;
  sub_75524C((uint64_t)a3, v9);

  v5 = v10;
  v6 = __swift_project_boxed_opaque_existential_1(v9, v10);
  v7 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v6, v5);
  __swift_destroy_boxed_opaque_existential_1(v9);
  return v7;
}

- (_TtCC16MusicApplication25ShelfCollectionViewLayout16LayoutAttributes)init
{
  uint64_t v2;

  return (_TtCC16MusicApplication25ShelfCollectionViewLayout16LayoutAttributes *)sub_755394(self, (uint64_t)a2, &OBJC_IVAR____TtCC16MusicApplication25ShelfCollectionViewLayout16LayoutAttributes_rowPosition, v2, (uint64_t (*)(uint64_t))type metadata accessor for ShelfCollectionViewLayout.LayoutAttributes);
}

@end
