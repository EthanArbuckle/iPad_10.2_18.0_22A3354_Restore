@implementation PlayButton

- (_TtC9SeymourUI10PlayButton)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI10PlayButton *)sub_22B7BFFDC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PlayButton();
  v2 = (char *)v6.receiver;
  -[PlayButton layoutSubviews](&v6, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC9SeymourUI10PlayButton_visualEffectView];
  v4 = objc_msgSend(v3, sel_layer, v6.receiver, v6.super_class);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v4, sel_setCornerRadius_, v5 * 0.5);

  objc_msgSend(v3, sel_setClipsToBounds_, 1);
}

- (_TtC9SeymourUI10PlayButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B7C07E8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.__layeringSceneIdentity
                     + OBJC_IVAR____TtC9SeymourUI10PlayButton_layout));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI10PlayButton_visualEffectView));
}

@end
