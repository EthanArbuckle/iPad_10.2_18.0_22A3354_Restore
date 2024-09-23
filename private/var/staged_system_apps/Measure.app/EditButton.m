@implementation EditButton

- (BOOL)editEnabled
{
  return *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure10EditButton_editEnabled);
}

- (void)setEditEnabled:(BOOL)a3
{
  int v3;
  _BOOL4 v4;
  float v5;
  _TtC7Measure10EditButton *v6;

  v3 = *((unsigned __int8 *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure10EditButton_editEnabled);
  *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure10EditButton_editEnabled) = a3;
  if (v3 != a3)
  {
    v4 = a3;
    v6 = self;
    v5 = 0.5;
    if (v4)
      v5 = 1.0;
    sub_10007CC5C(v5);

  }
}

- (BOOL)isInputEnabled
{
  return *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure10EditButton_isInputEnabled);
}

- (void)setIsInputEnabled:(BOOL)a3
{
  _TtC7Measure10EditButton *v4;

  v4 = self;
  sub_10007BDC8(a3);

}

- (_TtC7Measure10EditButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10007CFCC();
}

- (void)editBegan
{
  _TtC7Measure10EditButton *v2;

  if (*((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure10EditButton_editEnabled) == 1
    && *((_BYTE *)&self->super.super.super.super.isa + OBJC_IVAR____TtC7Measure10EditButton_isInputEnabled) == 1)
  {
    v2 = self;
    sub_10007C674();

  }
}

- (void)editEnded
{
  uint64_t v2;
  _TtC7Measure10EditButton *v3;

  v3 = self;
  sub_10007C868((uint64_t)v3, v2);

}

- (void)editCancelled
{
  uint64_t v2;
  _TtC7Measure10EditButton *v3;

  v3 = self;
  sub_10007CB0C((uint64_t)v3, v2);

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  _TtC7Measure10EditButton *v8;
  BOOL v9;
  CGPoint v11;
  CGRect v12;
  CGRect v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  -[EditButton bounds](v8, "bounds");
  v13 = CGRectInset(v12, -30.0, -30.0);
  v11.x = x;
  v11.y = y;
  v9 = CGRectContainsPoint(v13, v11);

  return v9;
}

- (_TtC7Measure10EditButton)initWithFrame:(CGRect)a3
{
  _TtC7Measure10EditButton *result;

  result = (_TtC7Measure10EditButton *)_swift_stdlib_reportUnimplementedInitializer("Measure.EditButton", 18, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10001ADF4((uint64_t)self + OBJC_IVAR____TtC7Measure10EditButton_delegate);

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure10EditButton_pressUpDownAnimation));
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  id v7;
  _TtC7Measure10EditButton *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_10007D0F4();

  return v9;
}

@end
