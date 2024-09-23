@implementation UserInterfaceStyleObserverView

- (_TtC7MeasureP33_EDD96BC629EA7EBD01211224C3FF48E430UserInterfaceStyleObserverView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC7MeasureP33_EDD96BC629EA7EBD01211224C3FF48E430UserInterfaceStyleObserverView *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType(self);
  v7 = -[UserInterfaceStyleObserverView initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
  -[UserInterfaceStyleObserverView setAutoresizingMask:](v7, "setAutoresizingMask:", 0);
  -[UserInterfaceStyleObserverView setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", 0);

  return v7;
}

- (_TtC7MeasureP33_EDD96BC629EA7EBD01211224C3FF48E430UserInterfaceStyleObserverView)initWithCoder:(id)a3
{
  _TtC7MeasureP33_EDD96BC629EA7EBD01211224C3FF48E430UserInterfaceStyleObserverView *result;

  result = (_TtC7MeasureP33_EDD96BC629EA7EBD01211224C3FF48E430UserInterfaceStyleObserverView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001003D8190, "Measure/UserInterfaceStyleObserver.swift", 40, 2, 34, 0);
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _TtC7MeasureP33_EDD96BC629EA7EBD01211224C3FF48E430UserInterfaceStyleObserverView *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = -[UserInterfaceStyleObserverView traitCollection](v5, "traitCollection");
  sub_1001CA0EC(v6);

}

- (void)didMoveToSuperview
{
  _TtC7MeasureP33_EDD96BC629EA7EBD01211224C3FF48E430UserInterfaceStyleObserverView *v2;
  id v3;

  v2 = self;
  v3 = -[UserInterfaceStyleObserverView traitCollection](v2, "traitCollection");
  sub_1001CA0EC(v3);

}

@end
