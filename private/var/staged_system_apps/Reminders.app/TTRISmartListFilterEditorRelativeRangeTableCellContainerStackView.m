@implementation TTRISmartListFilterEditorRelativeRangeTableCellContainerStackView

- (UIEdgeInsets)effectiveLayoutMargins
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  UIEdgeInsets result;

  v16.receiver = self;
  v16.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v16.receiver;
  -[TTRISmartListFilterEditorRelativeRangeTableCellContainerStackView effectiveLayoutMargins](&v16, "effectiveLayoutMargins");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (qword_10063D548 != -1)
    swift_once(&qword_10063D548, sub_1002419EC);
  v11 = *(double *)&qword_10064F558;

  v12 = v6 - v11;
  v13 = v10 - v11;
  v14 = v4;
  v15 = v8;
  result.right = v13;
  result.bottom = v15;
  result.left = v12;
  result.top = v14;
  return result;
}

- (_TtC9Reminders65TTRISmartListFilterEditorRelativeRangeTableCellContainerStackView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType(self, a2);
  return -[TTRISmartListFilterEditorRelativeRangeTableCellContainerStackView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC9Reminders65TTRISmartListFilterEditorRelativeRangeTableCellContainerStackView)initWithArrangedSubviews:(id)isa
{
  objc_class *ObjectType;
  double v6;
  uint64_t v7;
  uint64_t v8;
  _TtC9Reminders65TTRISmartListFilterEditorRelativeRangeTableCellContainerStackView *v9;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  if (isa)
  {
    v7 = sub_100005ED8(0, (unint64_t *)&qword_1006406F0, UIView_ptr);
    v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(isa, v7);
    isa = Array._bridgeToObjectiveC()().super.isa;
    *(_QWORD *)&v6 = swift_bridgeObjectRelease(v8).n128_u64[0];
  }
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = -[TTRISmartListFilterEditorRelativeRangeTableCellContainerStackView initWithArrangedSubviews:](&v11, "initWithArrangedSubviews:", isa, v6);

  return v9;
}

- (_TtC9Reminders65TTRISmartListFilterEditorRelativeRangeTableCellContainerStackView)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  return -[TTRISmartListFilterEditorRelativeRangeTableCellContainerStackView initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
