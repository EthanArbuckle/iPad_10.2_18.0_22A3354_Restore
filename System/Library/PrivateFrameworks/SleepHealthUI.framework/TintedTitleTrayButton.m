@implementation TintedTitleTrayButton

- (void)tintColorDidChange
{
  _TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0621TintedTitleTrayButton *v2;

  v2 = self;
  sub_1A9CCD4B8();

}

- (_TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0621TintedTitleTrayButton)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for TintedTitleTrayButton();
  return -[TintedTitleTrayButton initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0621TintedTitleTrayButton)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TintedTitleTrayButton();
  return -[TintedTitleTrayButton initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
