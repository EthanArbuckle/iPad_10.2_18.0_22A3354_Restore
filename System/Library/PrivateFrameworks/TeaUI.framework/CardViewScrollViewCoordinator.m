@implementation CardViewScrollViewCoordinator

- (_TtC5TeaUI29CardViewScrollViewCoordinator)init
{
  CardViewScrollViewCoordinator.init()();
}

- (void).cxx_destruct
{
  sub_1B13C076C((uint64_t)self + OBJC_IVAR____TtC5TeaUI29CardViewScrollViewCoordinator_delegate);

}

- (void)scrollViewDidScroll:(id)a3
{
  UIScrollView *v4;
  _TtC5TeaUI29CardViewScrollViewCoordinator *v5;

  v4 = (UIScrollView *)a3;
  v5 = self;
  CardViewScrollViewCoordinator.scrollViewDidScroll(_:)(v4);

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  _TtC5TeaUI29CardViewScrollViewCoordinator *v5;

  v4 = a3;
  v5 = self;
  CardViewScrollViewCoordinator.scrollViewWillBeginDragging(_:)((UIScrollView *)v5);

}

@end
