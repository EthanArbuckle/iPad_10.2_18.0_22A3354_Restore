@implementation PlaybackMetadataView

- (_TtC9SeymourUI20PlaybackMetadataView)init
{
  return (_TtC9SeymourUI20PlaybackMetadataView *)sub_22B4E4018();
}

- (_TtC9SeymourUI20PlaybackMetadataView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B4E68C8();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC9SeymourUI20PlaybackMetadataView *v6;

  v5 = a3;
  v6 = self;
  sub_22B4E506C(a3);

}

- (_TtC9SeymourUI20PlaybackMetadataView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI20PlaybackMetadataView *result;

  result = (_TtC9SeymourUI20PlaybackMetadataView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _BYTE __dst[296];

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20PlaybackMetadataView_titleLabelLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20PlaybackMetadataView_metadataMaximumContentSizeCategory));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20PlaybackMetadataView_gymKitMarqueeView));

  memcpy(__dst, (char *)self + OBJC_IVAR____TtC9SeymourUI20PlaybackMetadataView_styleProvider, sizeof(__dst));
  sub_22B4E6B60((uint64_t)__dst);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20PlaybackMetadataView_subtitleMarqueeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20PlaybackMetadataView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20PlaybackMetadataView_titleMarqueeView));

}

@end
