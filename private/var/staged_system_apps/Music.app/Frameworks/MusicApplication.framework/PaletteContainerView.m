@implementation PaletteContainerView

- (_TtC16MusicApplication20PaletteContainerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_737174();
}

- (void)layoutSubviews
{
  _TtC16MusicApplication20PaletteContainerView *v2;

  v2 = self;
  sub_736478();

}

- (void)layoutMarginsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PaletteContainerView();
  v2 = v3.receiver;
  -[PaletteContainerView layoutMarginsDidChange](&v3, "layoutMarginsDidChange");
  objc_msgSend(v2, "setNeedsLayout", v3.receiver, v3.super_class);

}

- (_TtC16MusicApplication20PaletteContainerView)initWithFrame:(CGRect)a3
{
  _TtC16MusicApplication20PaletteContainerView *result;

  result = (_TtC16MusicApplication20PaletteContainerView *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.PaletteContainerView", 37, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20PaletteContainerView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20PaletteContainerView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20PaletteContainerView_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20PaletteContainerView____lazy_storage___separator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20PaletteContainerView_gradientView));
}

@end
