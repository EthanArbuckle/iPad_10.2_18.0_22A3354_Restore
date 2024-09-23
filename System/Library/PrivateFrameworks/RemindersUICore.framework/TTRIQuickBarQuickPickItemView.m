@implementation TTRIQuickBarQuickPickItemView

- (_TtC15RemindersUICore29TTRIQuickBarQuickPickItemView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  char *v9;
  _TtC15RemindersUICore29TTRIQuickBarQuickPickItemView *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (char *)self + OBJC_IVAR____TtC15RemindersUICore29TTRIQuickBarQuickPickItemView_itemID;
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  *((_QWORD *)v9 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore29TTRIQuickBarQuickPickItemView_button) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore29TTRIQuickBarQuickPickItemView_label) = 0;
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = -[TTRIQuickBarQuickPickItemView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  sub_1B43F6694();

  return v10;
}

- (_TtC15RemindersUICore29TTRIQuickBarQuickPickItemView)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore29TTRIQuickBarQuickPickItemView *)sub_1B43F6E20(a3);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSArray)accessibilityElements
{
  return (NSArray *)0;
}

- (unint64_t)accessibilityTraits
{
  _TtC15RemindersUICore29TTRIQuickBarQuickPickItemView *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_1B43F6F30();

  return v3;
}

- (BOOL)showsLargeContentViewer
{
  return 1;
}

- (char)accessibilityLabel
{
  void *v1;
  char *v2;
  id v3;
  void *v4;
  void *v5;

  v1 = *(void **)&result[OBJC_IVAR____TtC15RemindersUICore29TTRIQuickBarQuickPickItemView_label];
  if (v1)
  {
    v2 = result;
    v3 = objc_msgSend(v1, sel_text);
    if (v3)
    {
      v4 = v3;
      sub_1B4906A64();

      v5 = (void *)sub_1B4906A34();
      swift_bridgeObjectRelease();
    }
    else
    {

      v5 = 0;
    }
    return (char *)v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (UIImage)largeContentImage
{
  UIImage *result;

  result = *(UIImage **)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC15RemindersUICore29TTRIQuickBarQuickPickItemView_button);
  if (result)
    return (UIImage *)-[UIImage imageForState:](result, sel_imageForState_, 0);
  __break(1u);
  return result;
}

- (BOOL)scalesLargeContentImage
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  void *v2;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore29TTRIQuickBarQuickPickItemView_button);
  if (v2)
  {
    objc_msgSend(v2, sel_sendActionsForControlEvents_, 0x2000);
    LOBYTE(v2) = 1;
  }
  else
  {
    __break(1u);
  }
  return (char)v2;
}

- (void).cxx_destruct
{
  sub_1B43F7170((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore29TTRIQuickBarQuickPickItemView_itemID);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore29TTRIQuickBarQuickPickItemView_button));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore29TTRIQuickBarQuickPickItemView_label));
}

@end
