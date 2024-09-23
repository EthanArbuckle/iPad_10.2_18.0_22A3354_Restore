@implementation TTRIRemindersListCellLocationView

- (void)layoutSubviews
{
  _TtC15RemindersUICore33TTRIRemindersListCellLocationView *v2;

  v2 = self;
  sub_1B454DE60();

}

- (_TtC15RemindersUICore33TTRIRemindersListCellLocationView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore33TTRIRemindersListCellLocationView_imageView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore33TTRIRemindersListCellLocationView_iconBackingView) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[TTRIRemindersListCellAttributePillView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
}

- (_TtC15RemindersUICore33TTRIRemindersListCellLocationView)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore33TTRIRemindersListCellLocationView_imageView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore33TTRIRemindersListCellLocationView_iconBackingView) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[TTRIRemindersListCellAttributePillView initWithCoder:](&v7, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore33TTRIRemindersListCellLocationView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore33TTRIRemindersListCellLocationView_iconBackingView));
}

@end
