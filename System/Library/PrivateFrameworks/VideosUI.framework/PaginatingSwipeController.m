@implementation PaginatingSwipeController

- (_TtC8VideosUI25PaginatingSwipeController)init
{
  sub_1DA066E84();
}

- (void).cxx_destruct
{
  sub_1D97BDBFC((uint64_t)self + OBJC_IVAR____TtC8VideosUI25PaginatingSwipeController_dataSource);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI25PaginatingSwipeController_containerView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI25PaginatingSwipeController____lazy_storage___gesture);
  OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_72_2();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI25PaginatingSwipeController_currentView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI25PaginatingSwipeController_leadingView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI25PaginatingSwipeController_trailingView);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8VideosUI25PaginatingSwipeController____lazy_storage___mediaShowcaseConfig));
}

- (void)didPanOnView:(id)a3
{
  id v4;
  _TtC8VideosUI25PaginatingSwipeController *v5;

  v4 = a3;
  v5 = self;
  sub_1DA066F38(v4);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _TtC8VideosUI25PaginatingSwipeController *v5;

  v4 = a3;
  v5 = self;
  sub_1DA0683B0();
}

@end
