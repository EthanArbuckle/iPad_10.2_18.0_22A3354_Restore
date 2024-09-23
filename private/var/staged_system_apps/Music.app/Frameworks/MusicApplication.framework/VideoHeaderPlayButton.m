@implementation VideoHeaderPlayButton

- (_TtC16MusicApplication21VideoHeaderPlayButton)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication21VideoHeaderPlayButton *)sub_95EC94(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication21VideoHeaderPlayButton)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC16MusicApplication21VideoHeaderPlayButton *result;

  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC16MusicApplication21VideoHeaderPlayButton_isBlurBackgroundEnabled) = 0;
  v5 = OBJC_IVAR____TtC16MusicApplication21VideoHeaderPlayButton_backgroundView;
  v6 = objc_allocWithZone((Class)UIView);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC16MusicApplication21VideoHeaderPlayButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/VideoHeaderPlayButton.swift", 44, 2, 37, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC16MusicApplication21VideoHeaderPlayButton *v2;

  v2 = self;
  sub_95F210();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  char v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  CGSize result;

  if (a3.height >= a3.width)
    width = a3.width;
  else
    width = a3.height;
  v8 = width;
  v7 = 0x4050000000000000;
  sub_E1C20();
  v4 = static ApproximatelyComparable<>.>=~ infix(_:_:)(&v8, &v7);
  v5 = 64.0;
  if ((v4 & 1) == 0)
    v5 = width;
  v6 = v5;
  result.height = v6;
  result.width = v5;
  return result;
}

- (BOOL)isHighlighted
{
  return sub_95F4BC(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  sub_95F504(self, (uint64_t)a2, a3, (const char **)&selRef_setHighlighted_);
}

- (BOOL)isSelected
{
  return sub_95F4BC(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  sub_95F504(self, (uint64_t)a2, a3, (const char **)&selRef_setSelected_);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21VideoHeaderPlayButton_playImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication21VideoHeaderPlayButton_backgroundView));
}

@end
