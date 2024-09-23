@implementation PaginationSwipeTimingParameters

- (int64_t)timingCurveType
{
  return 3;
}

- (UICubicTimingParameters)cubicTimingParameters
{
  _TtC8VideosUI31PaginationSwipeTimingParameters *v2;
  id v3;

  v2 = self;
  v3 = sub_1D9FFB068();

  return (UICubicTimingParameters *)OUTLINED_FUNCTION_111(v3);
}

- (UISpringTimingParameters)springTimingParameters
{
  _TtC8VideosUI31PaginationSwipeTimingParameters *v2;
  id v3;

  v2 = self;
  v3 = sub_1D9FFB104();

  return (UISpringTimingParameters *)OUTLINED_FUNCTION_111(v3);
}

- (void)encodeWithCoder:(id)a3
{
  sub_1D9FFB1E4();
}

- (_TtC8VideosUI31PaginationSwipeTimingParameters)initWithCoder:(id)a3
{
  sub_1D9FFB220();
}

- (id)copyWithZone:(void *)a3
{
  _TtC8VideosUI31PaginationSwipeTimingParameters *v3;
  void *v4;
  uint64_t v6[4];

  v3 = self;
  sub_1D9FFB25C(v6);

  __swift_project_boxed_opaque_existential_1(v6, v6[3]);
  v4 = (void *)sub_1DA1450EC();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

- (_TtC8VideosUI31PaginationSwipeTimingParameters)init
{
  sub_1D9FFB308();
}

@end
