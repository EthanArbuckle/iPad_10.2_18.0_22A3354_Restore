@implementation LemonadeInlineStoryContentPlayerUIView

- (_TtC12PhotosUICoreP33_D5BBB978DC5D9E9CCAD66E47379B868438LemonadeInlineStoryContentPlayerUIView)initWithCoder:(id)a3
{
  _TtC12PhotosUICoreP33_D5BBB978DC5D9E9CCAD66E47379B868438LemonadeInlineStoryContentPlayerUIView *result;

  result = (_TtC12PhotosUICoreP33_D5BBB978DC5D9E9CCAD66E47379B868438LemonadeInlineStoryContentPlayerUIView *)sub_1A7AE4AFC();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for LemonadeInlineStoryContentPlayerUIView();
  v2 = (char *)v4.receiver;
  -[LemonadeInlineStoryContentPlayerUIView layoutSubviews](&v4, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC12PhotosUICoreP33_D5BBB978DC5D9E9CCAD66E47379B868438LemonadeInlineStoryContentPlayerUIView_collectionPreviewPlayerView];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);

}

- (_TtC12PhotosUICoreP33_D5BBB978DC5D9E9CCAD66E47379B868438LemonadeInlineStoryContentPlayerUIView)initWithFrame:(CGRect)a3
{
  sub_1A6891054();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12PhotosUICoreP33_D5BBB978DC5D9E9CCAD66E47379B868438LemonadeInlineStoryContentPlayerUIView_collectionPreviewPlayerView));
}

@end
