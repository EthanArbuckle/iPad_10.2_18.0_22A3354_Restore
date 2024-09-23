@implementation TabBarButton

- (BOOL)showsLargeContentViewer
{
  return 1;
}

- (NSString)largeContentTitle
{
  _TtC15RemindersUICoreP33_F67546AE838D2B2D0B8FE7194B3E29A712TabBarButton *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = self;
  v3 = -[TabBarButton accessibilityLabel](v2, sel_accessibilityLabel);
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
  return (NSString *)v5;
}

- (UIImage)largeContentImage
{
  return (UIImage *)-[TabBarButton imageForState:](self, sel_imageForState_, 0);
}

- (BOOL)scalesLargeContentImage
{
  return 1;
}

- (_TtC15RemindersUICoreP33_F67546AE838D2B2D0B8FE7194B3E29A712TabBarButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  char *v9;
  _QWORD *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (char *)self + OBJC_IVAR____TtC15RemindersUICoreP33_F67546AE838D2B2D0B8FE7194B3E29A712TabBarButton_itemID;
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  *((_QWORD *)v9 + 4) = 0;
  v10 = (Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICoreP33_F67546AE838D2B2D0B8FE7194B3E29A712TabBarButton_ttriAccessibilityHint);
  *v10 = 0;
  v10[1] = 0;
  v12.receiver = self;
  v12.super_class = ObjectType;
  return -[TTRIQuickBarDragSelectableButton initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
}

- (_TtC15RemindersUICoreP33_F67546AE838D2B2D0B8FE7194B3E29A712TabBarButton)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  char *v6;
  _QWORD *v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (char *)self + OBJC_IVAR____TtC15RemindersUICoreP33_F67546AE838D2B2D0B8FE7194B3E29A712TabBarButton_itemID;
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_QWORD *)v6 + 4) = 0;
  v7 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC15RemindersUICoreP33_F67546AE838D2B2D0B8FE7194B3E29A712TabBarButton_ttriAccessibilityHint);
  *v7 = 0;
  v7[1] = 0;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return -[TTRIQuickBarDragSelectableButton initWithCoder:](&v9, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_1B41EA560((uint64_t)self + OBJC_IVAR____TtC15RemindersUICoreP33_F67546AE838D2B2D0B8FE7194B3E29A712TabBarButton_itemID, &qword_1ED4E9398);
  swift_bridgeObjectRelease();
}

@end
