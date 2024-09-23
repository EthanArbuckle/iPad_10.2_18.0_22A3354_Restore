@implementation AudioTraitButton

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AudioTraitButton();
  return -[AudioTraitButton isHighlighted](&v3, "isHighlighted");
}

- (void)setHighlighted:(BOOL)a3
{
  _TtC5Music16AudioTraitButton *v4;

  v4 = self;
  sub_100138664(a3);

}

- (CGRect)hitRect
{
  _TtC5Music16AudioTraitButton *v2;
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
  CGRect result;

  v2 = self;
  v3 = sub_100138764();
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v3;
  v11 = v5;
  v12 = v7;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  _TtC5Music16AudioTraitButton *v8;
  unsigned __int8 v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  if (UIViewIgnoresTouchEvents())
  {

LABEL_4:
    v8 = 0;
    return v8;
  }
  v9 = -[AudioTraitButton pointInside:withEvent:](v8, "pointInside:withEvent:", v7, x, y);

  if ((v9 & 1) == 0)
    goto LABEL_4;
  return v8;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  _TtC5Music16AudioTraitButton *v8;
  BOOL v9;
  CGPoint v11;
  CGRect v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  -[AudioTraitButton hitRect](v8, "hitRect");
  v11.x = x;
  v11.y = y;
  v9 = CGRectContainsPoint(v12, v11);

  return v9;
}

- (_TtC5Music16AudioTraitButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v8;
  objc_class *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Music16AudioTraitButton_isShowingDisclosure) = 0;
  v8 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC5Music16AudioTraitButton_hitRectMinimumSize);
  v9 = (objc_class *)type metadata accessor for AudioTraitButton();
  *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[AudioTraitButton initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC5Music16AudioTraitButton)initWithCoder:(id)a3
{
  _QWORD *v5;
  objc_class *v6;
  objc_super v8;

  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Music16AudioTraitButton_isShowingDisclosure) = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC5Music16AudioTraitButton_hitRectMinimumSize);
  v6 = (objc_class *)type metadata accessor for AudioTraitButton();
  *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[AudioTraitButton initWithCoder:](&v8, "initWithCoder:", a3);
}

@end
