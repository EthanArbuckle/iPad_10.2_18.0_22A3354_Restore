@implementation CatalogPage

- (void)rebuildLocations
{
  _TtC9SeymourUI11CatalogPage *v2;

  v2 = self;
  sub_22B0EDFEC();

}

- (UICollectionView)accessibilityCollectionView
{
  return (UICollectionView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC9SeymourUI11CatalogPage_collectionView));
}

- (_TtC9SeymourUI11CatalogPage)init
{
  _TtC9SeymourUI11CatalogPage *result;

  result = (_TtC9SeymourUI11CatalogPage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI11CatalogPage_delegate);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI11CatalogPage_impressionsTracker);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI11CatalogPage_locationStore);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9SeymourUI11CatalogPage_mostRecentlyPresentedOverlayDisplayingCell));
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC9SeymourUI11CatalogPage *v11;
  uint64_t v12;

  v6 = sub_22BA79C14();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BA79BCC();
  v10 = a3;
  v11 = self;
  CatalogPage.collectionView(_:didSelectItemAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  id v20;
  _TtC9SeymourUI11CatalogPage *v21;
  void (*v22)(char *, uint64_t);
  void *v23;
  uint64_t v25;
  _TtC9SeymourUI11CatalogPage *v26;

  v26 = self;
  v7 = sub_22BA79C14();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v25 - v12;
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v25 - v15;
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v25 - v18;
  sub_22BA79BCC();
  sub_22BA79BCC();
  sub_22BA79BCC();
  v20 = a3;
  v21 = v26;
  CatalogPage.collectionView(_:targetIndexPathForMoveOfItemFromOriginalIndexPath:atCurrentIndexPath:toProposedIndexPath:)(v20, (uint64_t)v10, (uint64_t)v19);

  v22 = *(void (**)(char *, uint64_t))(v8 + 8);
  v22(v10, v7);
  v22(v13, v7);
  v22(v16, v7);
  v23 = (void *)sub_22BA79BA8();
  v22(v19, v7);
  return v23;
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC9SeymourUI11CatalogPage *v15;
  uint64_t v16;

  v9 = sub_22BA79C14();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BA79BCC();
  v13 = a3;
  v14 = a4;
  v15 = self;
  sub_22B7C5E80(a4);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_22B68DD90(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, char *))sub_22BA1D440);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_22B68DD90(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, char *))sub_22BA1D688);
}

- (void)scrollViewDidChangeAdjustedContentInset:(id)a3
{
  UIScrollView *v4;
  _TtC9SeymourUI11CatalogPage *v5;

  v4 = (UIScrollView *)a3;
  v5 = self;
  CatalogPage.scrollViewDidChangeAdjustedContentInset(_:)(v4);

}

- (void)scrollViewDidScroll:(id)a3
{
  UIScrollView *v4;
  _TtC9SeymourUI11CatalogPage *v5;

  v4 = (UIScrollView *)a3;
  v5 = self;
  CatalogPage.scrollViewDidScroll(_:)(v4);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  char *v9;
  uint64_t v10;
  void (*v11)(double, double);
  id v12;
  _TtC9SeymourUI11CatalogPage *v13;

  y = a4.y;
  x = a4.x;
  v9 = (char *)self + OBJC_IVAR____TtC9SeymourUI11CatalogPage_delegate;
  if (MEMORY[0x22E2F3FFC]((char *)self + OBJC_IVAR____TtC9SeymourUI11CatalogPage_delegate, a2))
  {
    v10 = *((_QWORD *)v9 + 1);
    swift_getObjectType();
    v11 = *(void (**)(double, double))(v10 + 144);
    v12 = a3;
    v13 = self;
    v11(x, y);

    swift_unknownObjectRelease();
  }
}

- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  double y;
  double x;
  char *v8;
  uint64_t v9;
  double (*v10)(double, double);
  id v11;
  _TtC9SeymourUI11CatalogPage *v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v8 = (char *)self + OBJC_IVAR____TtC9SeymourUI11CatalogPage_delegate;
  if (MEMORY[0x22E2F3FFC]((char *)self + OBJC_IVAR____TtC9SeymourUI11CatalogPage_delegate, a2))
  {
    v9 = *((_QWORD *)v8 + 1);
    swift_getObjectType();
    v10 = *(double (**)(double, double))(v9 + 152);
    v11 = a3;
    v12 = self;
    x = v10(x, y);
    y = v13;

    swift_unknownObjectRelease();
  }
  v14 = x;
  v15 = y;
  result.y = v15;
  result.x = v14;
  return result;
}

- (void)collectionView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v8;
  id v9;
  _TtC9SeymourUI11CatalogPage *v10;
  char *v11;
  uint64_t v12;
  uint64_t ObjectType;
  id v14;

  v8 = a3;
  v14 = a4;
  v9 = a5;
  v10 = self;
  sub_22B7C4B70(v14, v9);
  v11 = (char *)v10 + OBJC_IVAR____TtC9SeymourUI11CatalogPage_delegate;
  if (MEMORY[0x22E2F3FFC]((char *)v10 + OBJC_IVAR____TtC9SeymourUI11CatalogPage_delegate))
  {
    v12 = *((_QWORD *)v11 + 1);
    ObjectType = swift_getObjectType();
    (*(void (**)(_TtC9SeymourUI11CatalogPage *, id, id, uint64_t, uint64_t))(v12 + 208))(v10, v14, v9, ObjectType, v12);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemsAtIndexPaths:(id)a4 point:(CGPoint)a5
{
  uint64_t v7;
  id v8;
  _TtC9SeymourUI11CatalogPage *v9;
  void *v10;

  sub_22BA79C14();
  v7 = sub_22BA808BC();
  v8 = a3;
  v9 = self;
  v10 = (void *)_s9SeymourUI11CatalogPageC14collectionView_34contextMenuConfigurationForItemsAt5pointSo09UIContexthI0CSgSo012UICollectionF0C_Say10Foundation9IndexPathVGSo7CGPointVtF_0(v8, v7);

  swift_bridgeObjectRelease();
  return v10;
}

- (void)collectionView:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  char *v8;
  uint64_t v9;
  void (*v10)(void);
  id v11;
  id v12;
  _TtC9SeymourUI11CatalogPage *v13;

  v8 = (char *)self + OBJC_IVAR____TtC9SeymourUI11CatalogPage_delegate;
  if (MEMORY[0x22E2F3FFC]((char *)self + OBJC_IVAR____TtC9SeymourUI11CatalogPage_delegate, a2))
  {
    v9 = *((_QWORD *)v8 + 1);
    swift_getObjectType();
    v10 = *(void (**)(void))(v9 + 328);
    v11 = a3;
    v12 = a4;
    swift_unknownObjectRetain();
    v13 = self;
    v10();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
}

- (id)indexPathForPreferredFocusedViewInCollectionView:(id)a3
{
  uint64_t v5;
  __n128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(void);
  id v12;
  _TtC9SeymourUI11CatalogPage *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B87230);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (char *)self + OBJC_IVAR____TtC9SeymourUI11CatalogPage_delegate;
  if (MEMORY[0x22E2F3FFC]((char *)self + OBJC_IVAR____TtC9SeymourUI11CatalogPage_delegate, v6))
  {
    v10 = *((_QWORD *)v9 + 1);
    swift_getObjectType();
    v11 = *(void (**)(void))(v10 + 200);
    v12 = a3;
    v13 = self;
    v11();

    swift_unknownObjectRelease();
    v14 = sub_22BA79C14();
    v15 = *(_QWORD *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v8, 1, v14) != 1)
    {
      v16 = (void *)sub_22BA79BA8();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v8, v14);
      return v16;
    }
  }
  else
  {
    v18 = sub_22BA79C14();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v8, 1, 1, v18);
  }
  return 0;
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  uint64_t v6;
  _TtC9SeymourUI11CatalogPage *v7;
  id v8;

  sub_22BA79C14();
  v6 = sub_22BA808BC();
  v7 = self;
  v8 = a3;
  sub_22BA1D008(v6, (uint64_t)v7);

  swift_bridgeObjectRelease();
}

@end
