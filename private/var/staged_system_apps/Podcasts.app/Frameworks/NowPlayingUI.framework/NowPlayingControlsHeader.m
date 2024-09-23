@implementation NowPlayingControlsHeader

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self);
  v2 = (char *)v5.receiver;
  -[NowPlayingControlsHeader layoutSubviews](&v5, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC12NowPlayingUI24NowPlayingControlsHeader_controlsView];
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v2, "bounds", v5.receiver, v5.super_class);
    objc_msgSend(v4, "setFrame:");

  }
  else
  {
    __break(1u);
  }
}

- (_TtC12NowPlayingUI24NowPlayingControlsHeader)initWithFrame:(CGRect)a3
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
  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingControlsHeader_controlsView) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[NowPlayingControlsHeader initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC12NowPlayingUI24NowPlayingControlsHeader)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingControlsHeader_controlsView) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[NowPlayingControlsHeader initWithCoder:](&v7, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI24NowPlayingControlsHeader_controlsView));
}

@end
