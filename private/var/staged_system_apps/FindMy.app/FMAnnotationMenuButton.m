@implementation FMAnnotationMenuButton

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  char *v10;
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType(self);
  v8 = a3;
  v9 = a4;
  v10 = (char *)v14.receiver;
  swift_unknownObjectRetain(a5);
  -[FMAnnotationMenuButton contextMenuInteraction:willEndForConfiguration:animator:](&v14, "contextMenuInteraction:willEndForConfiguration:animator:", v8, v9, a5);
  v11 = *(void (**)(uint64_t))&v10[OBJC_IVAR____TtC6FindMy22FMAnnotationMenuButton_didEndInteraction];
  if (v11)
  {
    v12 = *(_QWORD *)&v10[OBJC_IVAR____TtC6FindMy22FMAnnotationMenuButton_didEndInteraction + 8];
    v13 = swift_retain(v12);
    v11(v13);
    sub_1000327F0((uint64_t)v11, v12);
  }
  swift_unknownObjectRelease(a5);

}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  id v4;
  _TtC6FindMy22FMAnnotationMenuButton *v5;
  CGFloat MidX;
  double v7;
  double v8;
  CGPoint result;
  CGRect v10;

  v4 = a3;
  v5 = self;
  -[FMAnnotationMenuButton bounds](v5, "bounds");
  MidX = CGRectGetMidX(v10);

  v7 = 0.0;
  v8 = MidX;
  result.y = v7;
  result.x = v8;
  return result;
}

- (_TtC6FindMy22FMAnnotationMenuButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _QWORD *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self);
  v9 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC6FindMy22FMAnnotationMenuButton_didEndInteraction);
  *v9 = 0;
  v9[1] = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[FMAnnotationMenuButton initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC6FindMy22FMAnnotationMenuButton)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  _QWORD *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v6 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC6FindMy22FMAnnotationMenuButton_didEndInteraction);
  *v6 = 0;
  v6[1] = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[FMAnnotationMenuButton initWithCoder:](&v8, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_1000327F0(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC6FindMy22FMAnnotationMenuButton_didEndInteraction), *(_QWORD *)&self->didEndInteraction[OBJC_IVAR____TtC6FindMy22FMAnnotationMenuButton_didEndInteraction]);
}

@end
