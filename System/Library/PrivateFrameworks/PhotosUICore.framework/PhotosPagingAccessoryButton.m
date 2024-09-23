@implementation PhotosPagingAccessoryButton

- (_TtC12PhotosUICore27PhotosPagingAccessoryButton)initWithCoder:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  _TtC12PhotosUICore27PhotosPagingAccessoryButton *result;

  v5 = OBJC_IVAR____TtC12PhotosUICore27PhotosPagingAccessoryButton_foregroundColor;
  v6 = (void *)objc_opt_self();
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_systemWhiteColor);

  result = (_TtC12PhotosUICore27PhotosPagingAccessoryButton *)sub_1A7AE4AFC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PhotosPagingAccessoryButton();
  v2 = (char *)v4.receiver;
  -[PhotosPagingAccessoryButton layoutSubviews](&v4, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC12PhotosUICore27PhotosPagingAccessoryButton_button];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore27PhotosPagingAccessoryButton_button), sel_sizeThatFits_, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC12PhotosUICore27PhotosPagingAccessoryButton)initWithFrame:(CGRect)a3
{
  _TtC12PhotosUICore27PhotosPagingAccessoryButton *result;

  result = (_TtC12PhotosUICore27PhotosPagingAccessoryButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore27PhotosPagingAccessoryButton_button));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore27PhotosPagingAccessoryButton_foregroundColor));
}

@end
