@implementation BlueprintLayoutCollectionLayoutAttributes

- (id)copyWithZone:(void *)a3
{
  _TtC5TeaUI41BlueprintLayoutCollectionLayoutAttributes *v4;
  void *v5;
  _QWORD v7[4];

  v4 = self;
  BlueprintLayoutCollectionLayoutAttributes.copy(with:)((uint64_t)a3, v7);

  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  v5 = (void *)sub_1B16BA8F8();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _TtC5TeaUI41BlueprintLayoutCollectionLayoutAttributes *v4;
  _TtC5TeaUI41BlueprintLayoutCollectionLayoutAttributes *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B16BA3AC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = BlueprintLayoutCollectionLayoutAttributes.isEqual(_:)((uint64_t)v8);

  sub_1B13E0BC4((uint64_t)v8, (uint64_t (*)(_QWORD))sub_1B1406008);
  return v6 & 1;
}

- (_TtC5TeaUI41BlueprintLayoutCollectionLayoutAttributes)init
{
  return (_TtC5TeaUI41BlueprintLayoutCollectionLayoutAttributes *)BlueprintLayoutCollectionLayoutAttributes.init()();
}

- (void).cxx_destruct
{
  sub_1B1410744((uint64_t)self + OBJC_IVAR____TtC5TeaUI41BlueprintLayoutCollectionLayoutAttributes_model, &qword_1ED182BF8, (void (*)(uint64_t))sub_1B1406A1C);
  sub_1B1410744((uint64_t)self + OBJC_IVAR____TtC5TeaUI41BlueprintLayoutCollectionLayoutAttributes_source, (unint64_t *)&qword_1ED181FE8, (void (*)(uint64_t))type metadata accessor for CollectionViewSupplementaryKind.Source);
  sub_1B13E0BC4((uint64_t)self + OBJC_IVAR____TtC5TeaUI41BlueprintLayoutCollectionLayoutAttributes_layoutData, (uint64_t (*)(_QWORD))sub_1B1406008);
  OUTLINED_FUNCTION_10_61();
  OUTLINED_FUNCTION_10_61();
  OUTLINED_FUNCTION_10_61();
  sub_1B1410744((uint64_t)self + OBJC_IVAR____TtC5TeaUI41BlueprintLayoutCollectionLayoutAttributes_compositionalIndexPath, (unint64_t *)&qword_1ED17E140, (void (*)(uint64_t))MEMORY[0x1E0CB1658]);
}

@end
