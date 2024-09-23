@implementation BrowsingVideoModel.TimeRangeMarkUIProvider

- (CGSize)timeRangeMark:(id)a3 sizeInFrame:(CGRect)a4
{
  id v5;
  _TtCC15PhotosUIPrivate18BrowsingVideoModelP33_3E2DB3DF5DA24823FD948C2812C855DC23TimeRangeMarkUIProvider *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v5 = a3;
  v6 = self;
  sub_1AAB8E774(v5);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)uiProxyForTimeRangeMark:(id)a3 withSource:(id)a4
{
  id v5;
  _TtCC15PhotosUIPrivate18BrowsingVideoModelP33_3E2DB3DF5DA24823FD948C2812C855DC23TimeRangeMarkUIProvider *v6;
  id v7;

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  v7 = sub_1AAB8E888();

  swift_unknownObjectRelease();
  return v7;
}

- (_TtCC15PhotosUIPrivate18BrowsingVideoModelP33_3E2DB3DF5DA24823FD948C2812C855DC23TimeRangeMarkUIProvider)init
{
  return (_TtCC15PhotosUIPrivate18BrowsingVideoModelP33_3E2DB3DF5DA24823FD948C2812C855DC23TimeRangeMarkUIProvider *)sub_1AAB8E980();
}

@end
