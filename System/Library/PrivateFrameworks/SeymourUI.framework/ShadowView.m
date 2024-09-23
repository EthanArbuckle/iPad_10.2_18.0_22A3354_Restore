@implementation ShadowView

- (_TtC9SeymourUI10ShadowView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI10ShadowView *)sub_22BA27A4C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ShadowView();
  v2 = (char *)v5.receiver;
  -[ShadowView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = (void *)objc_opt_self();
  objc_msgSend(v3, sel_begin, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_setDisableActions_, 1);
  v4 = *(void **)&v2[OBJC_IVAR____TtC9SeymourUI10ShadowView_shadowGradient];
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v4, sel_setFrame_);
  objc_msgSend(v3, sel_commit);

}

- (_TtC9SeymourUI10ShadowView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC9SeymourUI10ShadowView *result;

  v5 = OBJC_IVAR____TtC9SeymourUI10ShadowView_shadowGradient;
  v6 = objc_allocWithZone(MEMORY[0x24BDE56B8]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC9SeymourUI10ShadowView *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
