@implementation ScrollTracker

- (_TtC5TeaUI13ScrollTracker)init
{
  return (_TtC5TeaUI13ScrollTracker *)ScrollTracker.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (void)scrollViewDidScroll:(id)a3
{
  UIScrollView *v4;
  _TtC5TeaUI13ScrollTracker *v5;

  v4 = (UIScrollView *)a3;
  v5 = self;
  ScrollTracker.scrollViewDidScroll(_:)(v4);

}

@end
