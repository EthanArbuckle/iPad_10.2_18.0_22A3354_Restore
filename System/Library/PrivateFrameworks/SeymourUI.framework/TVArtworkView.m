@implementation TVArtworkView

- (UIImage)image
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TVArtworkView();
  return -[SMUTVStackedImageView image](&v3, sel_image);
}

- (void)setImage:(id)a3
{
  id v5;
  _TtC9SeymourUI13TVArtworkView *v6;

  v5 = a3;
  v6 = self;
  sub_22B55F3A8(a3);

}

- (_TtC9SeymourUI13TVArtworkView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  id v5;
  double v6;
  double v7;
  char *v8;

  height = a3.size.height;
  width = a3.size.width;
  v5 = objc_allocWithZone((Class)type metadata accessor for TVArtworkView());
  v8 = sub_22B55F674(0, v6, v7, width, height);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC9SeymourUI13TVArtworkView *)v8;
}

- (_TtC9SeymourUI13TVArtworkView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B5600E0();
}

- (void)layoutSubviews
{
  _TtC9SeymourUI13TVArtworkView *v2;

  v2 = self;
  sub_22B55F908();

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BEBE9C8];
  v3 = *MEMORY[0x24BEBE9C8];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13TVArtworkView_completedIconView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13TVArtworkView_recencyIconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13TVArtworkView_stackIconView));
  sub_22B3E903C((uint64_t)self + OBJC_IVAR____TtC9SeymourUI13TVArtworkView_artwork);
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI13TVArtworkView_layoutHandler));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI13TVArtworkView_layout);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13TVArtworkView_stackedOverlayView));
}

@end
