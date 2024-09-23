@implementation TTRIOptionMenuTitlelessPopupButton

- (_TtC15RemindersUICore34TTRIOptionMenuTitlelessPopupButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC15RemindersUICore34TTRIOptionMenuTitlelessPopupButton *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v7 = -[TTRIOptionMenuTitlelessPopupButton initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  sub_1B43195A4();

  return v7;
}

- (_TtC15RemindersUICore34TTRIOptionMenuTitlelessPopupButton)initWithCoder:(id)a3
{
  id v4;
  _TtC15RemindersUICore34TTRIOptionMenuTitlelessPopupButton *v5;
  _TtC15RemindersUICore34TTRIOptionMenuTitlelessPopupButton *v6;
  _TtC15RemindersUICore34TTRIOptionMenuTitlelessPopupButton *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = -[TTRIOptionMenuTitlelessPopupButton initWithCoder:](&v9, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    sub_1B43195A4();

  }
  return v6;
}

- (void)setTitle:(id)a3 forState:(unint64_t)a4
{
  objc_class *ObjectType;
  _TtC15RemindersUICore34TTRIOptionMenuTitlelessPopupButton *v7;
  id v8;
  id v9;
  void *v10;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
    sub_1B4906A64();
  v7 = self;
  v8 = -[TTRIOptionMenuTitlelessPopupButton traitCollection](v7, sel_traitCollection);
  v9 = objc_msgSend(v8, sel_preferredContentSizeCategory);

  sub_1B4907724();
  v10 = (void *)sub_1B4906A34();
  swift_bridgeObjectRelease();
  v11.receiver = v7;
  v11.super_class = ObjectType;
  -[TTRIOptionMenuTitlelessPopupButton setTitle:forState:](&v11, sel_setTitle_forState_, v10, 0);

  swift_bridgeObjectRelease();
}

@end
