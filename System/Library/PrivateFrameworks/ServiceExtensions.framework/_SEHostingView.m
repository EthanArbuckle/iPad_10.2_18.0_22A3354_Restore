@implementation _SEHostingView

- (_SEHostingHandle)handle
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR____SEHostingView_handle);
  swift_beginAccess();
  return (_SEHostingHandle *)*v2;
}

- (void)setHandle:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  _SEHostingView *v8;

  v5 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR____SEHostingView_handle);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  sub_245DC16A0();
}

+ (Class)layerClass
{
  sub_245DB431C(0, &qword_25751C5F0);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_SEHostingView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____SEHostingView__visibility) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____SEHostingView_handle) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for _SEHostingView();
  return -[_SEHostingView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_SEHostingView)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____SEHostingView__visibility) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____SEHostingView_handle) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for _SEHostingView();
  return -[_SEHostingView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

}

@end
