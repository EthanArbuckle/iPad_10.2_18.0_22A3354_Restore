@implementation TTRIBoardColumnDraggingAnimationCellBackgroundView

+ (Class)layerClass
{
  uint64_t v2;

  v2 = sub_100005ED8(0, (unint64_t *)&unk_10064F2A0, CAShapeLayer_ptr);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (void)layoutSubviews
{
  char *v2;
  uint64_t v3;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType(self, a2);
  v2 = (char *)v7.receiver;
  -[TTRIBoardColumnDraggingAnimationCellBackgroundView layoutSubviews](&v7, "layoutSubviews");
  objc_msgSend(v2, "bounds", v7.receiver, v7.super_class);
  if ((v2[OBJC_IVAR____TtC9Reminders50TTRIBoardColumnDraggingAnimationCellBackgroundView_boundsUsedForShapePath + 32] & 1) == 0
    && !CGRectEqualToRect(*(CGRect *)&v3, *(CGRect *)&v2[OBJC_IVAR____TtC9Reminders50TTRIBoardColumnDraggingAnimationCellBackgroundView_boundsUsedForShapePath]))
  {
    sub_10023D7F4();
  }
  sub_10023D6B8();

}

- (_TtC9Reminders50TTRIBoardColumnDraggingAnimationCellBackgroundView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _QWORD *v9;
  char *v10;
  char *v11;
  char *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v9 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC9Reminders50TTRIBoardColumnDraggingAnimationCellBackgroundView_fill);
  *v9 = 0;
  v9[1] = 0;
  v10 = (char *)self + OBJC_IVAR____TtC9Reminders50TTRIBoardColumnDraggingAnimationCellBackgroundView_shape;
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = 0;
  v10[16] = 1;
  v11 = (char *)self + OBJC_IVAR____TtC9Reminders50TTRIBoardColumnDraggingAnimationCellBackgroundView_shadow;
  *(_OWORD *)v11 = 0u;
  *((_OWORD *)v11 + 1) = 0u;
  *((_QWORD *)v11 + 4) = 0;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC9Reminders50TTRIBoardColumnDraggingAnimationCellBackgroundView_debugShowsBoundingBox) = 0;
  v12 = (char *)self
      + OBJC_IVAR____TtC9Reminders50TTRIBoardColumnDraggingAnimationCellBackgroundView_boundsUsedForShapePath;
  *(_OWORD *)v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;
  v12[32] = 1;
  v14.receiver = self;
  v14.super_class = ObjectType;
  return -[TTRIBoardColumnDraggingAnimationCellBackgroundView initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
}

- (_TtC9Reminders50TTRIBoardColumnDraggingAnimationCellBackgroundView)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC9Reminders50TTRIBoardColumnDraggingAnimationCellBackgroundView *)sub_10023E004(v3, v4);
}

- (void).cxx_destruct
{
  sub_10007EDD8(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC9Reminders50TTRIBoardColumnDraggingAnimationCellBackgroundView_fill), *(void **)&self->fill[OBJC_IVAR____TtC9Reminders50TTRIBoardColumnDraggingAnimationCellBackgroundView_fill]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders50TTRIBoardColumnDraggingAnimationCellBackgroundView_shadow));
}

@end
