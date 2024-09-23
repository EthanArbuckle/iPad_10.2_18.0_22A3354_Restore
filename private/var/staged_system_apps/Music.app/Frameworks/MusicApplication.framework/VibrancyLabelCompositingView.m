@implementation VibrancyLabelCompositingView

- (_TtC16MusicApplication28VibrancyLabelCompositingView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_824CFC();
}

- (NSString)text
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->text[OBJC_IVAR____TtC16MusicApplication28VibrancyLabelCompositingView_text];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->text[OBJC_IVAR____TtC16MusicApplication28VibrancyLabelCompositingView_text]);
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setText:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC16MusicApplication28VibrancyLabelCompositingView *v9;
  double v10;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16MusicApplication28VibrancyLabelCompositingView_text);
  v7 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication28VibrancyLabelCompositingView_text);
  v8 = *(_QWORD *)&self->text[OBJC_IVAR____TtC16MusicApplication28VibrancyLabelCompositingView_text];
  *v6 = v4;
  v6[1] = v5;
  v9 = self;
  sub_824168(v7, v8, v10);

  swift_bridgeObjectRelease();
}

- (void)layoutSubviews
{
  char *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for VibrancyLabelCompositingView();
  v2 = (char *)v11.receiver;
  -[VibrancyLabelCompositingView layoutSubviews](&v11, "layoutSubviews");
  objc_msgSend(v2, "bounds", v11.receiver, v11.super_class);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC16MusicApplication28VibrancyLabelCompositingView_mainLabel], "setFrame:");
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC16MusicApplication28VibrancyLabelCompositingView_overlayLabel], "setFrame:", v4, v6, v8, v10);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC16MusicApplication28VibrancyLabelCompositingView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_824380();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication28VibrancyLabelCompositingView_mainLabel), "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC16MusicApplication28VibrancyLabelCompositingView)initWithFrame:(CGRect)a3
{
  _TtC16MusicApplication28VibrancyLabelCompositingView *result;

  result = (_TtC16MusicApplication28VibrancyLabelCompositingView *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.VibrancyLabelCompositingView", 45, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;

  swift_bridgeObjectRelease(*(_QWORD *)&self->text[OBJC_IVAR____TtC16MusicApplication28VibrancyLabelCompositingView_text]);
  v3 = *(void **)&self->text[OBJC_IVAR____TtC16MusicApplication28VibrancyLabelCompositingView_properties + 8];
  v4 = *(void **)&self->properties[OBJC_IVAR____TtC16MusicApplication28VibrancyLabelCompositingView_properties];

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication28VibrancyLabelCompositingView_mainLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication28VibrancyLabelCompositingView_overlayLabel));
}

@end
