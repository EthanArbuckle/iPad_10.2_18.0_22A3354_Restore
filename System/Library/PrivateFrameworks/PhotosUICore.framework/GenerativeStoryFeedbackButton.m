@implementation GenerativeStoryFeedbackButton

- (_TtC12PhotosUICore29GenerativeStoryFeedbackButton)initWithCoder:(id)a3
{
  _TtC12PhotosUICore29GenerativeStoryFeedbackButton *result;

  result = (_TtC12PhotosUICore29GenerativeStoryFeedbackButton *)sub_1A7AE4AFC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for GenerativeStoryFeedbackButton();
  v2 = (char *)v4.receiver;
  -[GenerativeStoryFeedbackButton layoutSubviews](&v4, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC12PhotosUICore29GenerativeStoryFeedbackButton_button];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore29GenerativeStoryFeedbackButton_button), sel_sizeThatFits_, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC12PhotosUICore29GenerativeStoryFeedbackButton)initWithFrame:(CGRect)a3
{
  _TtC12PhotosUICore29GenerativeStoryFeedbackButton *result;

  result = (_TtC12PhotosUICore29GenerativeStoryFeedbackButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore29GenerativeStoryFeedbackButton_centralizedFeedbackActionPerformer);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore29GenerativeStoryFeedbackButton_memory));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICore29GenerativeStoryFeedbackButton_button));
}

@end
