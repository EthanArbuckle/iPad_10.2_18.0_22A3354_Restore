@implementation SiriSharedUIStandardViewDropletMaterial

- (_TtC12SiriSharedUI39SiriSharedUIStandardViewDropletMaterial)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC12SiriSharedUI39SiriSharedUIStandardViewDropletMaterial *result;

  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC12SiriSharedUI39SiriSharedUIStandardViewDropletMaterial_isLightMode) = 1;
  v5 = OBJC_IVAR____TtC12SiriSharedUI39SiriSharedUIStandardViewDropletMaterial_fresnelView;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3F10]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC12SiriSharedUI39SiriSharedUIStandardViewDropletMaterial *)sub_1DE130BFC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SiriSharedUIStandardViewDropletMaterial();
  v2 = (char *)v4.receiver;
  -[SiriSharedUIStandardVisualEffectView layoutSubviews](&v4, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC12SiriSharedUI39SiriSharedUIStandardViewDropletMaterial_fresnelView];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);
  sub_1DE0FF8EC();

}

- (_TtC12SiriSharedUI39SiriSharedUIStandardViewDropletMaterial)initWithEffect:(id)a3
{
  id v3;
  _TtC12SiriSharedUI39SiriSharedUIStandardViewDropletMaterial *result;

  v3 = a3;
  result = (_TtC12SiriSharedUI39SiriSharedUIStandardViewDropletMaterial *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12SiriSharedUI39SiriSharedUIStandardViewDropletMaterial_fresnelView));
}

@end
