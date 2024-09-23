@implementation AmbientCollectionViewLayout

- (void)prepareLayout
{
  _TtC11PosterBoard27AmbientCollectionViewLayout *v2;

  v2 = self;
  sub_1CBB2668C();

}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (CGSize)collectionViewContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)((char *)&self->super.super._collectionViewBoundsSize.width
                 + OBJC_IVAR____TtC11PosterBoard27AmbientCollectionViewLayout_contentBounds);
  v3 = *(double *)((char *)&self->super.super._collectionViewBoundsSize.height
                 + OBJC_IVAR____TtC11PosterBoard27AmbientCollectionViewLayout_contentBounds);
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC11PosterBoard27AmbientCollectionViewLayout *v12;
  void *v13;
  uint64_t v15;

  v5 = sub_1CBB8234C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1CBB824CC();
  v11 = v10;
  sub_1CBB822F8();
  v12 = self;
  v13 = (void *)sub_1CBB2718C(v9, v11);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v13;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC11PosterBoard27AmbientCollectionViewLayout *v8;
  id v9;
  uint64_t v11;

  v4 = sub_1CBB8234C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CBB822F8();
  v8 = self;
  v9 = sub_1CBB273C8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC11PosterBoard27AmbientCollectionViewLayout *v7;
  uint64_t v8;
  void *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_1CBB27774(x, y, width, height);

  if (v8)
  {
    sub_1CBB28688();
    v9 = (void *)sub_1CBB82550();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double y;
  double x;
  _TtC11PosterBoard27AmbientCollectionViewLayout *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v5 = self;
  v6 = sub_1CBB2813C(x, y);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (_TtC11PosterBoard27AmbientCollectionViewLayout)init
{
  _OWORD *v2;
  objc_class *v3;
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard27AmbientCollectionViewLayout_cardSizeMultiplier) = (Class)0x3FE6147AE147AE14;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard27AmbientCollectionViewLayout_spacingBetweenCards) = (Class)0x4049000000000000;
  v2 = (_OWORD *)((char *)self + OBJC_IVAR____TtC11PosterBoard27AmbientCollectionViewLayout_contentBounds);
  *v2 = 0u;
  v2[1] = 0u;
  v3 = (objc_class *)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard27AmbientCollectionViewLayout_cachedAttributes) = (Class)MEMORY[0x1E0DEE9D8];
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard27AmbientCollectionViewLayout_cachedSupplementaryFooterAttributes) = v3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AmbientCollectionViewLayout();
  return -[UICollectionViewFlowLayout init](&v5, sel_init);
}

- (_TtC11PosterBoard27AmbientCollectionViewLayout)initWithCoder:(id)a3
{
  return (_TtC11PosterBoard27AmbientCollectionViewLayout *)sub_1CBB28530(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
