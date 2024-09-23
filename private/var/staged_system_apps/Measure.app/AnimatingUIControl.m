@implementation AnimatingUIControl

- (BOOL)isEnabled
{
  return sub_100073F44(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtC7Measure18AnimatingUIControl *v6;
  unsigned int v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for AnimatingUIControl();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  v7 = -[AnimatingUIControl isEnabled](&v9, "isEnabled");
  v8.receiver = v6;
  v8.super_class = v5;
  -[AnimatingUIControl setEnabled:](&v8, "setEnabled:", v3);
  if (v7 != -[AnimatingUIControl isEnabled](v6, "isEnabled"))
    sub_100073D6C(-[AnimatingUIControl isEnabled](v6, "isEnabled"));

}

- (BOOL)isHighlighted
{
  return sub_100073F44(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _TtC7Measure18AnimatingUIControl *v4;

  v4 = self;
  sub_100073FC0(a3);

}

- (_TtC7Measure18AnimatingUIControl)initWithFrame:(CGRect)a3
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
  v8.super_class = (Class)type metadata accessor for AnimatingUIControl();
  return -[AnimatingUIControl initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC7Measure18AnimatingUIControl)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AnimatingUIControl();
  return -[AnimatingUIControl initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
