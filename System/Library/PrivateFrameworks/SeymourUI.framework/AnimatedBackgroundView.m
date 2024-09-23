@implementation AnimatedBackgroundView

- (_TtC9SeymourUI22AnimatedBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI22AnimatedBackgroundView *)sub_22B916738(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI22AnimatedBackgroundView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B917680();
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AnimatedBackgroundView();
  v2 = (char *)v4.receiver;
  -[AnimatedBackgroundView layoutSubviews](&v4, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC9SeymourUI22AnimatedBackgroundView_gradientLayer];
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC9SeymourUI22AnimatedBackgroundView_gradientView], sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);

}

- (void).cxx_destruct
{
  void *v3;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22AnimatedBackgroundView_gradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22AnimatedBackgroundView_gradientView));
  v3 = *(void **)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC9SeymourUI22AnimatedBackgroundView_layout);
  objc_release(*(id *)((char *)&self->super._cachedTraitCollection
                     + OBJC_IVAR____TtC9SeymourUI22AnimatedBackgroundView_layout));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22AnimatedBackgroundView_metalView));

}

@end
