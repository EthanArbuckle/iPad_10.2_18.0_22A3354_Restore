@implementation CarouselAdView

- (uint64_t)collectionView:(void *)a3 willDisplayCell:(void *)a4 forItemAtIndexPath:
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v15;

  v7 = sub_1B1371F80();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B1371F5C();
  v11 = a3;
  v12 = a4;
  v13 = a1;
  _s17PromotedContentUI14CarouselAdViewC010collectionF0_11willDisplay9forItemAtySo012UICollectionF0C_So0mF4CellC10Foundation9IndexPathVtF_0();

  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC17PromotedContentUI14CarouselAdView *v11;
  uint64_t v12;

  v6 = sub_1B1371F80();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B1371F5C();
  v10 = a3;
  v11 = self;
  CarouselAdView.collectionView(_:didSelectItemAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)scrollViewDidScroll:(id)a3
{
  UIScrollView *v4;
  _TtC17PromotedContentUI14CarouselAdView *v5;

  v4 = (UIScrollView *)a3;
  v5 = self;
  CarouselAdView.scrollViewDidScroll(_:)(v4);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  _TtC17PromotedContentUI14CarouselAdView *v5;

  v4 = a3;
  v5 = self;
  _s17PromotedContentUI14CarouselAdViewC010collectionF0_11willDisplay9forItemAtySo012UICollectionF0C_So0mF4CellC10Foundation9IndexPathVtF_0();

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v5;
  _TtC17PromotedContentUI14CarouselAdView *v6;

  if (!a4)
  {
    v5 = a3;
    v6 = self;
    _s17PromotedContentUI14CarouselAdViewC010collectionF0_11willDisplay9forItemAtySo012UICollectionF0C_So0mF4CellC10Foundation9IndexPathVtF_0();

  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x;
  id v8;
  _TtC17PromotedContentUI14CarouselAdView *v9;

  x = a4.x;
  v8 = a3;
  v9 = self;
  CarouselAdView.scrollViewWillEndDragging(_:withVelocity:targetContentOffset:)(v8, &a5->x, x);

}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  sub_1B130380C(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t))sub_1B1303880);
}

- (void)collectionView:(id)a3 cancelPrefetchingForItemsAtIndexPaths:(id)a4
{
  sub_1B130380C(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t))sub_1B1303A08);
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC17PromotedContentUI14CarouselAdView *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  CGSize result;

  v8 = sub_1B1371F80();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B1371F5C();
  v12 = a3;
  v13 = a4;
  v14 = self;
  v15 = sub_1B131A2C4();
  v17 = v16;

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v18 = v15;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CarouselAdView();
  -[APPCPromotedContentView frame](&v6, sel_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC17PromotedContentUI14CarouselAdView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_1B1358820(x, y, width, height);

}

- (void)didMoveToWindow
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CarouselAdView();
  v2 = v3.receiver;
  -[CarouselAdView didMoveToWindow](&v3, sel_didMoveToWindow);
  _s17PromotedContentUI14CarouselAdViewC010collectionF0_11willDisplay9forItemAtySo012UICollectionF0C_So0mF4CellC10Foundation9IndexPathVtF_0();

}

- (void)didSelectActionButtonWithSender:(id)a3
{
  id v4;
  _TtC17PromotedContentUI14CarouselAdView *v5;

  v4 = a3;
  v5 = self;
  sub_1B135E43C(v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___backgroundCollectionController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___backgroundCollectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___blurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___headlineLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___advertiserContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___advertiserLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___logoImageView));
  sub_1B12EA250(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView____lazy_storage___actionButton));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_dataRepresentation));
  swift_bridgeObjectRelease();
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return (*(_QWORD **)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI14CarouselAdView_elements))[2];
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC17PromotedContentUI14CarouselAdView *v11;
  char *v12;
  uint64_t v14;

  v6 = sub_1B1371F80();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B1371F5C();
  v10 = a3;
  v11 = self;
  v12 = CarouselAdView.collectionView(_:cellForItemAt:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

@end
