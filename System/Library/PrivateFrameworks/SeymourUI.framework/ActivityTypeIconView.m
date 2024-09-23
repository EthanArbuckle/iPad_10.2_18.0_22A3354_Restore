@implementation ActivityTypeIconView

- (_TtC9SeymourUI20ActivityTypeIconView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  _TtC9SeymourUI20ActivityTypeIconView *v8;
  void *v9;
  _TtC9SeymourUI20ActivityTypeIconView *v10;
  id v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC9SeymourUI20ActivityTypeIconView_workoutActivityType;
  *(_QWORD *)v7 = 0;
  v7[8] = 1;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for ActivityTypeIconView();
  v8 = -[ActivityTypeIconView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v9 = (void *)objc_opt_self();
  v10 = v8;
  v11 = objc_msgSend(v9, sel_whiteColor);
  -[ActivityTypeIconView setTintColor:](v10, sel_setTintColor_, v11);

  return v10;
}

- (_TtC9SeymourUI20ActivityTypeIconView)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC9SeymourUI20ActivityTypeIconView *result;

  v4 = (char *)self + OBJC_IVAR____TtC9SeymourUI20ActivityTypeIconView_workoutActivityType;
  *(_QWORD *)v4 = 0;
  v4[8] = 1;
  v5 = a3;

  result = (_TtC9SeymourUI20ActivityTypeIconView *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI20ActivityTypeIconView)initWithImage:(id)a3
{
  id v3;
  _TtC9SeymourUI20ActivityTypeIconView *result;

  v3 = a3;
  result = (_TtC9SeymourUI20ActivityTypeIconView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI20ActivityTypeIconView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5;
  id v6;
  _TtC9SeymourUI20ActivityTypeIconView *result;

  v5 = a3;
  v6 = a4;
  result = (_TtC9SeymourUI20ActivityTypeIconView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (int64_t)accessibilityActivityType
{
  int64_t *v2;
  int64_t result;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC9SeymourUI20ActivityTypeIconView_workoutActivityType);
  if ((*((_BYTE *)&self->super.super.super._responderFlags
        + OBJC_IVAR____TtC9SeymourUI20ActivityTypeIconView_workoutActivityType) & 1) != 0)
    return -1;
  result = *v2;
  if (*v2 < 0)
    __break(1u);
  return result;
}

@end
