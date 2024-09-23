@implementation DOCCircularCancelButton

- (BOOL)translatesAutoresizingMaskIntoConstraints
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCCircularCancelButton();
  return -[DOCCircularCancelButton translatesAutoresizingMaskIntoConstraints](&v3, "translatesAutoresizingMaskIntoConstraints");
}

- (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCCircularCancelButton();
  -[DOCCircularCancelButton setTranslatesAutoresizingMaskIntoConstraints:](&v4, "setTranslatesAutoresizingMaskIntoConstraints:", v3);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  _TtC5Files23DOCCircularCancelButton *v8;
  void *v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  v9 = sub_10037283C(x, y);

  return v9;
}

- (_TtC5Files23DOCCircularCancelButton)initWithFrame:(CGRect)a3
{
  _TtC5Files23DOCCircularCancelButton *result;

  result = (_TtC5Files23DOCCircularCancelButton *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCCircularCancelButton", 29, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

@end
