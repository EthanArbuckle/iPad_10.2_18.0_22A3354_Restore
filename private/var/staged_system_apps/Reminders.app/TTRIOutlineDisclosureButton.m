@implementation TTRIOutlineDisclosureButton

- (void)layoutSubviews
{
  uint64_t v2;
  _TtC9Reminders27TTRIOutlineDisclosureButton *v3;

  v3 = self;
  sub_10008CA48((uint64_t)v3, v2);

}

- (BOOL)isSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  return -[TTRIOutlineDisclosureButton isSelected](&v3, "isSelected");
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  _TtC9Reminders27TTRIOutlineDisclosureButton *v6;
  unsigned int v7;
  char v8;
  objc_super v9;
  objc_super v10;
  objc_super v11;
  objc_super v12;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v12.receiver = self;
  v12.super_class = ObjectType;
  v6 = self;
  v7 = -[TTRIOutlineDisclosureButton isSelected](&v12, "isSelected");
  v11.receiver = v6;
  v11.super_class = ObjectType;
  -[TTRIOutlineDisclosureButton setSelected:](&v11, "setSelected:", v3);
  v10.receiver = v6;
  v10.super_class = ObjectType;
  if (v7 != -[TTRIOutlineDisclosureButton isSelected](&v10, "isSelected"))
  {
    v9.receiver = v6;
    v9.super_class = ObjectType;
    v8 = -[TTRIOutlineDisclosureButton isSelected](&v9, "isSelected");
    sub_10008CCB0(v8);
  }

}

- (_TtC9Reminders27TTRIOutlineDisclosureButton)initWithFrame:(CGRect)a3
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
  return -[TTRIOutlineDisclosureButton initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC9Reminders27TTRIOutlineDisclosureButton)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  return -[TTRIOutlineDisclosureButton initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
