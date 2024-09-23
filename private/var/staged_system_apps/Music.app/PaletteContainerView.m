@implementation PaletteContainerView

- (_TtC5Music20PaletteContainerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10004D6BC();
}

- (void)layoutSubviews
{
  _TtC5Music20PaletteContainerView *v2;

  v2 = self;
  sub_10004C810();

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

- (_TtC5Music20PaletteContainerView)initWithFrame:(CGRect)a3
{
  _TtC5Music20PaletteContainerView *result;

  result = (_TtC5Music20PaletteContainerView *)_swift_stdlib_reportUnimplementedInitializer("Music.PaletteContainerView", 26, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music20PaletteContainerView____lazy_storage___separator));

}

@end
