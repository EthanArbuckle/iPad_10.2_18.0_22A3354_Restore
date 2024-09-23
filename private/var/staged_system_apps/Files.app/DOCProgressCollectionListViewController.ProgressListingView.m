@implementation DOCProgressCollectionListViewController.ProgressListingView

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[DOCProgressCollectionListViewController.ProgressListingView contentSize](self, "contentSize");
  v3 = fmax(v2, 300.0);
  v5 = fmax(v4, 1.0);
  result.height = v5;
  result.width = v3;
  return result;
}

- (double)fittingHeight
{
  return *(double *)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR____TtCC5Files39DOCProgressCollectionListViewController19ProgressListingView_fittingHeight);
}

- (void)setFittingHeight:(double)a3
{
  double v3;

  v3 = *(double *)((char *)&self->super.super.super.super.super.isa
                 + OBJC_IVAR____TtCC5Files39DOCProgressCollectionListViewController19ProgressListingView_fittingHeight);
  *(double *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtCC5Files39DOCProgressCollectionListViewController19ProgressListingView_fittingHeight) = a3;
  if (v3 != a3)
    -[DOCProgressCollectionListViewController.ProgressListingView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)layoutSubviews
{
  _TtCC5Files39DOCProgressCollectionListViewController19ProgressListingView *v2;

  v2 = self;
  sub_100449D08();

}

- (_TtCC5Files39DOCProgressCollectionListViewController19ProgressListingView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtCC5Files39DOCProgressCollectionListViewController19ProgressListingView *v12;
  _TtCC5Files39DOCProgressCollectionListViewController19ProgressListingView *v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = OBJC_IVAR____TtCC5Files39DOCProgressCollectionListViewController19ProgressListingView_fittingHeight;
  v10 = qword_100641168;
  v11 = a4;
  v12 = self;
  if (v10 != -1)
    swift_once(&qword_100641168, sub_100449C8C);
  *(Class *)((char *)&v12->super.super.super.super.super.isa + v9) = (Class)qword_100672DF8;
  *(Class *)((char *)&v12->super.super.super.super.super.isa
           + OBJC_IVAR____TtCC5Files39DOCProgressCollectionListViewController19ProgressListingView_fittingHeightUpdateDisabledCount) = 0;

  v15.receiver = v12;
  v15.super_class = (Class)type metadata accessor for DOCProgressCollectionListViewController.ProgressListingView();
  v13 = -[DOCProgressCollectionListViewController.ProgressListingView initWithFrame:collectionViewLayout:](&v15, "initWithFrame:collectionViewLayout:", v11, x, y, width, height);

  return v13;
}

- (_TtCC5Files39DOCProgressCollectionListViewController19ProgressListingView)initWithCoder:(id)a3
{
  return (_TtCC5Files39DOCProgressCollectionListViewController19ProgressListingView *)sub_100449EB4(a3);
}

@end
