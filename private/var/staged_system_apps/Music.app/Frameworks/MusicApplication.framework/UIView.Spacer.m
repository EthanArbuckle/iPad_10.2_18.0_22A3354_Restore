@implementation UIView.Spacer

+ (Class)layerClass
{
  sub_4E684(0, &qword_14D9100, UIStackView_ptr);
  return (Class)objc_msgSend((id)swift_getObjCClassFromMetadata(), "layerClass");
}

- (_TtCE16MusicApplicationCSo6UIView6Spacer)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v8;
  objc_class *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtCE16MusicApplicationCSo6UIView6Spacer_debugName);
  v9 = (objc_class *)_s6SpacerCMa();
  *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[UIView.Spacer initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtCE16MusicApplicationCSo6UIView6Spacer)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtCE16MusicApplicationCSo6UIView6Spacer *v6;
  objc_super v8;

  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtCE16MusicApplicationCSo6UIView6Spacer_debugName);
  *v4 = 0;
  v4[1] = 0;
  v8.receiver = self;
  v8.super_class = (Class)_s6SpacerCMa();
  v5 = a3;
  v6 = -[UIView.Spacer initWithCoder:](&v8, "initWithCoder:", v5);

  return v6;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->debugName[OBJC_IVAR____TtCE16MusicApplicationCSo6UIView6Spacer_debugName]);
}

@end
