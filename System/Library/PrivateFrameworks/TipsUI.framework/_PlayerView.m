@implementation _PlayerView

- (void)layoutSubviews
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for _PlayerView();
  v2 = v4.receiver;
  -[_PlayerView layoutSubviews](&v4, sel_layoutSubviews);
  v3 = objc_msgSend(v2, sel_layer, v4.receiver, v4.super_class);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v3, sel_setBounds_);

}

+ (Class)layerClass
{
  sub_20CF82AEC();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC6TipsUI11_PlayerView)initWithCoder:(id)a3
{
  objc_super v4;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6TipsUI11_PlayerView_player) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for _PlayerView();
  return -[_PlayerView initWithFrame:](&v4, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
}

- (_TtC6TipsUI11_PlayerView)initWithFrame:(CGRect)a3
{
  _TtC6TipsUI11_PlayerView *result;

  result = (_TtC6TipsUI11_PlayerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
