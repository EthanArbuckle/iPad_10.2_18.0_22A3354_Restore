@implementation MigrationButton

- (_TtC9RemindersP33_7A55288D58EEB9990EBCDDE62250269515MigrationButton)initWithFrame:(CGRect)a3
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
  return -[MigrationButton initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC9RemindersP33_7A55288D58EEB9990EBCDDE62250269515MigrationButton)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  return -[MigrationButton initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
