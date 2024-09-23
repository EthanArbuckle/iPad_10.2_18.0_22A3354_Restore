@implementation ArtworkView

- (void)layoutSubviews
{
  _TtC9SeymourUI11ArtworkView *v2;

  v2 = self;
  sub_22B0F2344();

}

- (_TtC9SeymourUI11ArtworkView)initWithFrame:(CGRect)a3
{
  id v3;
  char *v4;

  v3 = objc_allocWithZone((Class)type metadata accessor for ArtworkView());
  v4 = sub_22B0F80AC(0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC9SeymourUI11ArtworkView *)v4;
}

- (_TtC9SeymourUI11ArtworkView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B3E8EA4();
}

- (void).cxx_destruct
{
  sub_22B3E903C((uint64_t)self + OBJC_IVAR____TtC9SeymourUI11ArtworkView_artwork);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI11ArtworkView_layoutHandler));

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI11ArtworkView_layout);
}

@end
