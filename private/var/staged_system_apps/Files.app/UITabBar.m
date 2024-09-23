@implementation UITabBar

- (NSArray)DOCTabBarItems
{
  UITabBar *v2;
  _QWORD *v3;
  Class isa;

  v2 = self;
  v3 = UITabBar.DOCTabBarItems.getter();

  type metadata accessor for DOCTabBarItem();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

@end
