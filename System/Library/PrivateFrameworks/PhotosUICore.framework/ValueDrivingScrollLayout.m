@implementation ValueDrivingScrollLayout

- (void)scrollLayoutDidScroll:(id)a3
{
  id v4;
  _TtC12PhotosUICore24ValueDrivingScrollLayout *v5;

  v4 = a3;
  v5 = self;
  sub_1A6D5425C();

}

- (void)scrollLayoutWillEndScrolling:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5 currentContentOffset:(CGPoint)a6
{
  id v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  double v15;
  double v16;
  CGFloat v17;
  _TtC12PhotosUICore24ValueDrivingScrollLayout *v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  char v22;

  v8 = a3;
  v18 = self;
  -[PXGLayout referenceSize](v18, sel_referenceSize);
  v10 = v9;
  v11 = sub_1A687C078();
  static ScrollBehavior.paging(axis:pagingOrigin:pageOffset:decelerationRate:allowFlickAcrossMultiplePages:)(2, v11, 0, (uint64_t)&v19, 0.0, v10);
  v12 = v20;
  v13 = v21;
  v14 = v22;
  v15 = ScrollBehavior.adjustedScrollTargetContentOffset(for:velocity:currentContentOffset:decelerationRate:)(0, a5->x, a5->y);
  v17 = v16;
  sub_1A6A42FC8(v12, v13, v14);
  a5->x = v15;
  a5->y = v17;

}

- (void)isScrollingDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[PXGScrollLayout isScrollingDidChange](&v3, sel_isScrollingDidChange);
  sub_1A6D539BC();

}

- (_TtC12PhotosUICore24ValueDrivingScrollLayout)initWithContentLayout:(id)a3
{
  id v3;
  _TtC12PhotosUICore24ValueDrivingScrollLayout *result;

  v3 = a3;
  result = (_TtC12PhotosUICore24ValueDrivingScrollLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC12PhotosUICore24ValueDrivingScrollLayout)init
{
  _TtC12PhotosUICore24ValueDrivingScrollLayout *result;

  result = (_TtC12PhotosUICore24ValueDrivingScrollLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore24ValueDrivingScrollLayout_scrollContentLayout));
}

@end
