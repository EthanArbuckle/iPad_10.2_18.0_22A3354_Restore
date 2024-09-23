@implementation TTRIQuickBarInputAccessoryView

- (_TtC15RemindersUICore30TTRIQuickBarInputAccessoryView)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC15RemindersUICore30TTRIQuickBarInputAccessoryView *result;

  v4 = (char *)self + OBJC_IVAR____TtC15RemindersUICore30TTRIQuickBarInputAccessoryView_cachedQuickBarFittingSize;
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v4[16] = 1;
  v5 = a3;

  result = (_TtC15RemindersUICore30TTRIQuickBarInputAccessoryView *)sub_1B4908144();
  __break(1u);
  return result;
}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  char *v5;
  char *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = (char *)v7.receiver;
  -[TTRIQuickBarInputAccessoryView willMoveToWindow:](&v7, sel_willMoveToWindow_, v4);
  v6 = &v5[OBJC_IVAR____TtC15RemindersUICore30TTRIQuickBarInputAccessoryView_cachedQuickBarFittingSize];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v6[16] = 1;
  objc_msgSend(v5, sel_invalidateIntrinsicContentSize, v7.receiver, v7.super_class);

}

- (CGSize)intrinsicContentSize
{
  _TtC15RemindersUICore30TTRIQuickBarInputAccessoryView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_1B43EE2B8();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  -[TTRIQuickBarInputAccessoryView bounds](&v6, sel_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _TtC15RemindersUICore30TTRIQuickBarInputAccessoryView *v9;
  double v10;
  double v11;
  char *v12;
  objc_super v13;
  objc_super v14;
  CGRect v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = self;
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v10 = CGRectGetWidth(v15);
  v14.receiver = v9;
  v14.super_class = ObjectType;
  -[TTRIQuickBarInputAccessoryView bounds](&v14, sel_bounds);
  v11 = CGRectGetWidth(v16);
  v13.receiver = v9;
  v13.super_class = ObjectType;
  -[TTRIQuickBarInputAccessoryView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (v10 != v11)
  {
    v12 = (char *)v9 + OBJC_IVAR____TtC15RemindersUICore30TTRIQuickBarInputAccessoryView_cachedQuickBarFittingSize;
    *(_QWORD *)v12 = 0;
    *((_QWORD *)v12 + 1) = 0;
    v12[16] = 1;
    -[TTRIQuickBarInputAccessoryView invalidateIntrinsicContentSize](v9, sel_invalidateIntrinsicContentSize);
  }

}

- (NSString)accessibilityLabel
{
  uint64_t v2;
  _TtC15RemindersUICore30TTRIQuickBarInputAccessoryView *v3;
  void *v4;

  v2 = qword_1ED4EE550;
  v3 = self;
  if (v2 != -1)
    swift_once();
  sub_1B4903434();

  v4 = (void *)sub_1B4906A34();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (_TtC15RemindersUICore30TTRIQuickBarInputAccessoryView)initWithFrame:(CGRect)a3
{
  _TtC15RemindersUICore30TTRIQuickBarInputAccessoryView *result;

  result = (_TtC15RemindersUICore30TTRIQuickBarInputAccessoryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore30TTRIQuickBarInputAccessoryView_quickBar));
}

@end
