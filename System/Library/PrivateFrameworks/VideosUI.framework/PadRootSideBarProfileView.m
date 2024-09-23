@implementation PadRootSideBarProfileView

- (_TtC8VideosUI25PadRootSideBarProfileView)init
{
  return (_TtC8VideosUI25PadRootSideBarProfileView *)sub_1D9C09588();
}

- (_TtC8VideosUI25PadRootSideBarProfileView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9C097FC();
}

- (void)layoutSubviews
{
  _TtC8VideosUI25PadRootSideBarProfileView *v2;

  v2 = self;
  sub_1D9C09898();

}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double width;
  _TtC8VideosUI25PadRootSideBarProfileView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  width = a3.width;
  v6 = self;
  v7 = sub_1D9C09930(width);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (_TtC8VideosUI25PadRootSideBarProfileView)initWithFrame:(CGRect)a3
{
  sub_1D9C099B4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25PadRootSideBarProfileView_profileView));
}

@end
