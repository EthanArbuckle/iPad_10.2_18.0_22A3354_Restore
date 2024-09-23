@implementation PosterRackStackedLayout

- (_TtC11PosterBoard23PosterRackStackedLayout)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1CBB08060();
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  _TtC11PosterBoard23PosterRackStackedLayout *v4;
  void *v5;
  objc_super v6;

  sub_1CBAEE3F0(0, &qword_1EF9B4D08);
  sub_1CBB8255C();
  v4 = self;
  v5 = (void *)sub_1CBB82550();
  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for PosterRackStackedLayout();
  -[PosterRackStackedLayout prepareForCollectionViewUpdates:](&v6, sel_prepareForCollectionViewUpdates_, v5);

  swift_bridgeObjectRelease();
}

- (void)finalizeCollectionViewUpdates
{
  char *v2;
  char *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PosterRackStackedLayout();
  v2 = (char *)v4.receiver;
  -[PosterRackStackedLayout finalizeCollectionViewUpdates](&v4, sel_finalizeCollectionViewUpdates);
  v3 = &v2[OBJC_IVAR____TtC11PosterBoard23PosterRackStackedLayout_sectionIndexPathsToDelete];
  swift_beginAccess();
  *(_QWORD *)v3 = MEMORY[0x1E0DEE9D8];

  swift_bridgeObjectRelease();
}

- (void)prepareForTransitionToLayout:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  char *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PosterRackStackedLayout();
  v4 = a3;
  v5 = (char *)v8.receiver;
  -[PosterRackStackedLayout prepareForTransitionToLayout:](&v8, sel_prepareForTransitionToLayout_, v4);
  v6 = swift_dynamicCastClass();
  if (v6)
  {
    v7 = &v5[OBJC_IVAR____TtC11PosterBoard23PosterRackStackedLayout_layoutModeTransitioningTo];
    *(_QWORD *)v7 = *(_QWORD *)(v6 + OBJC_IVAR____TtC11PosterBoard23PosterRackStackedLayout_layoutMode);
    v7[8] = 0;
  }

}

- (void)prepareForTransitionFromLayout:(id)a3
{
  id v4;
  _TtC11PosterBoard23PosterRackStackedLayout *v5;

  v4 = a3;
  v5 = self;
  sub_1CBB02CA0(v4);

}

- (void)finalizeLayoutTransition
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  _TtC11PosterBoard23PosterRackStackedLayout *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  objc_super v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED89A0D0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for PosterRackStackedLayout();
  v12.receiver = self;
  v12.super_class = v6;
  v7 = self;
  -[PosterRackStackedLayout finalizeLayoutTransition](&v12, sel_finalizeLayoutTransition);
  v8 = sub_1CBB8234C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = (uint64_t)v7 + OBJC_IVAR____TtC11PosterBoard23PosterRackStackedLayout_indexPathToMaintainForTransition;
  swift_beginAccess();
  sub_1CBB08018((uint64_t)v5, v9);
  swift_endAccess();
  v10 = (char *)v7 + OBJC_IVAR____TtC11PosterBoard23PosterRackStackedLayout_layoutModeTransitioningTo;
  *(_QWORD *)v10 = 0;
  v10[8] = 1;

}

- (void)prepareLayout
{
  _TtC11PosterBoard23PosterRackStackedLayout *v2;

  v2 = self;
  sub_1CBB03170();

}

- (CGSize)collectionViewContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)((char *)&self->super._collectionViewBoundsSize.width
                 + OBJC_IVAR____TtC11PosterBoard23PosterRackStackedLayout_contentBounds);
  v3 = *(double *)((char *)&self->super._collectionViewBoundsSize.height
                 + OBJC_IVAR____TtC11PosterBoard23PosterRackStackedLayout_contentBounds);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  return sub_1CBB064B8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_1CBB057B4);
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  return sub_1CBB069F8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, char *))sub_1CBB05AD8);
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  return sub_1CBB069F8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, char *))sub_1CBB05D30);
}

- (BOOL)_disablesDoubleSidedAnimations
{
  return 1;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  return sub_1CBB064B8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_1CBB05EA8);
}

- (id)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  return sub_1CBB069F8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, char *))sub_1CBB06560);
}

- (id)indexPathsToDeleteForSupplementaryViewOfKind:
{
  void *v0;

  swift_beginAccess();
  sub_1CBB8234C();
  swift_bridgeObjectRetain();
  v0 = (void *)sub_1CBB82550();
  swift_bridgeObjectRelease();
  return v0;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC11PosterBoard23PosterRackStackedLayout *v7;
  uint64_t v8;
  void *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_1CBB06B44(x, y, width, height);

  if (v8)
  {
    sub_1CBAEE3F0(0, (unint64_t *)&qword_1ED89A538);
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
  double x;
  _TtC11PosterBoard23PosterRackStackedLayout *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  x = a3.x;
  v4 = self;
  sub_1CBB076D4(x);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

- (_TtC11PosterBoard23PosterRackStackedLayout)init
{
  _TtC11PosterBoard23PosterRackStackedLayout *result;

  result = (_TtC11PosterBoard23PosterRackStackedLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1CBB08008(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC11PosterBoard23PosterRackStackedLayout_sectionRevealProgressProvider));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1CBAFFB5C((uint64_t)self + OBJC_IVAR____TtC11PosterBoard23PosterRackStackedLayout_indexPathToMaintainForTransition, &qword_1ED89A0D0);
}

@end
