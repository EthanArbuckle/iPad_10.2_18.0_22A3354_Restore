@implementation StackCollectionViewCompositionalLayout

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  uint64_t v3;
  id v4;

  v4 = OUTLINED_FUNCTION_15_12(self);
  OUTLINED_FUNCTION_11();
  sub_1D97BBEBC();
  OUTLINED_FUNCTION_214();
  if (v3)
  {
    sub_1D97AF838();
    sub_1DA1440F0();
    OUTLINED_FUNCTION_35_1();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (Class)layoutAttributesClass
{
  j__s8VideosUI35StackCollectionViewLayoutAttributesCMa();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC8VideosUI38StackCollectionViewCompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  void *v5;
  uint64_t v6;
  _TtC8VideosUI38StackCollectionViewCompositionalLayout *result;

  v5 = OUTLINED_FUNCTION_33_7((int)self, (int)a2, a3);
  v6 = OUTLINED_FUNCTION_37();
  *(_QWORD *)(v6 + 16) = v5;
  sub_1D97BBFE4((uint64_t)sub_1D97B1A9C, v6, a4);
  OUTLINED_FUNCTION_9();
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  id v3;
  double v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  char v8;

  v3 = OUTLINED_FUNCTION_15_12(self);
  v4 = OUTLINED_FUNCTION_11();
  v8 = sub_1D97BC6E0(v4, v5, v6, v7);

  return v8 & 1;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC8VideosUI38StackCollectionViewCompositionalLayout *v9;
  uint64_t v11;

  v5 = OUTLINED_FUNCTION_29_8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA13F6BC();
  v9 = self;
  sub_1D9A8F7D0();
  OUTLINED_FUNCTION_214();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return a3;
}

- (_TtC8VideosUI38StackCollectionViewCompositionalLayout)initWithSection:(id)a3
{
  _TtC8VideosUI38StackCollectionViewCompositionalLayout *result;

  OUTLINED_FUNCTION_34_5((uint64_t)self, (uint64_t)a2, a3);
  sub_1D9A8F8F4();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI38StackCollectionViewCompositionalLayout)initWithSection:(id)a3 configuration:(id)a4
{
  id v5;
  _TtC8VideosUI38StackCollectionViewCompositionalLayout *result;

  v5 = OUTLINED_FUNCTION_34_5((uint64_t)self, (uint64_t)a2, a3);
  sub_1D9A8F948(v5, a4);
  OUTLINED_FUNCTION_9();
  return result;
}

- (_TtC8VideosUI38StackCollectionViewCompositionalLayout)initWithSectionProvider:(id)a3
{
  void *v3;
  uint64_t v4;
  _TtC8VideosUI38StackCollectionViewCompositionalLayout *result;

  v3 = OUTLINED_FUNCTION_33_7((int)self, (int)a2, a3);
  v4 = OUTLINED_FUNCTION_37();
  *(_QWORD *)(v4 + 16) = v3;
  sub_1D9A8F9D0((uint64_t)sub_1D9A8FB28, v4);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI38StackCollectionViewCompositionalLayout)initWithCoder:(id)a3
{
  _TtC8VideosUI38StackCollectionViewCompositionalLayout *result;

  OUTLINED_FUNCTION_34_5((uint64_t)self, (uint64_t)a2, a3);
  sub_1D9A8FAB0();
  OUTLINED_FUNCTION_2_1();
  return result;
}

@end
