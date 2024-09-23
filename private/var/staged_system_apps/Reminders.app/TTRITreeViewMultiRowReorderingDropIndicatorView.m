@implementation TTRITreeViewMultiRowReorderingDropIndicatorView

- (_TtC9Reminders47TTRITreeViewMultiRowReorderingDropIndicatorView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  char *v9;
  _TtC9Reminders47TTRITreeViewMultiRowReorderingDropIndicatorView *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v9 = (char *)self + OBJC_IVAR____TtC9Reminders47TTRITreeViewMultiRowReorderingDropIndicatorView_shadowPathSize;
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  v9[16] = 1;
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = -[TTRITreeViewMultiRowReorderingDropIndicatorView initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
  sub_10028ADC4();

  return v10;
}

- (_TtC9Reminders47TTRITreeViewMultiRowReorderingDropIndicatorView)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  char *v6;
  id v7;
  _TtC9Reminders47TTRITreeViewMultiRowReorderingDropIndicatorView *v8;
  _TtC9Reminders47TTRITreeViewMultiRowReorderingDropIndicatorView *v9;
  _TtC9Reminders47TTRITreeViewMultiRowReorderingDropIndicatorView *v10;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v6 = (char *)self + OBJC_IVAR____TtC9Reminders47TTRITreeViewMultiRowReorderingDropIndicatorView_shadowPathSize;
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v6[16] = 1;
  v12.receiver = self;
  v12.super_class = ObjectType;
  v7 = a3;
  v8 = -[TTRITreeViewMultiRowReorderingDropIndicatorView initWithCoder:](&v12, "initWithCoder:", v7);
  v9 = v8;
  if (v8)
  {
    v10 = v8;
    sub_10028ADC4();

  }
  return v9;
}

- (void)layoutSubviews
{
  uint64_t v2;
  _TtC9Reminders47TTRITreeViewMultiRowReorderingDropIndicatorView *v3;

  v3 = self;
  sub_10028B188((uint64_t)v3, v2);

}

@end
