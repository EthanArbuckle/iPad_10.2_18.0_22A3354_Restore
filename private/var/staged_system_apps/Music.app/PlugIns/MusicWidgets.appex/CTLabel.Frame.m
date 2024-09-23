@implementation CTLabel.Frame

- (_TtCO14MusicUtilities7CTLabel5Frame)initWithCoder:(id)a3
{
  id v4;
  _TtCO14MusicUtilities7CTLabel5Frame *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtCO14MusicUtilities7CTLabel5Frame_colorOverride) = 0;
  v4 = a3;

  result = (_TtCO14MusicUtilities7CTLabel5Frame *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010044BC20, "MusicUtilities/CoreText+Utilities.swift", 39, 2, 210, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtCO14MusicUtilities7CTLabel5Frame_suggestedSize);
  v4 = *(double *)&self->ctFrame[OBJC_IVAR____TtCO14MusicUtilities7CTLabel5Frame_suggestedSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtCO14MusicUtilities7CTLabel5Frame *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  CTLabel.Frame.draw(_:)(x, y, width, height);

}

- (_TtCO14MusicUtilities7CTLabel5Frame)initWithFrame:(CGRect)a3
{
  sub_1002AA940((uint64_t)self, (uint64_t)a2, (uint64_t)"MusicUtilities.Frame", 20);
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCO14MusicUtilities7CTLabel5Frame_colorOverride));
}

@end
