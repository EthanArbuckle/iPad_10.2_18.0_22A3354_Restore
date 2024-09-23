@implementation SplitDisplayView

- (void)layoutSubviews
{
  _TtC16MusicApplicationP33_F7781D2616362938348079397DDE4DAC16SplitDisplayView *v2;

  v2 = self;
  sub_20E8FC();

}

- (_TtC16MusicApplicationP33_F7781D2616362938348079397DDE4DAC16SplitDisplayView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplicationP33_F7781D2616362938348079397DDE4DAC16SplitDisplayView *)sub_20EF8C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplicationP33_F7781D2616362938348079397DDE4DAC16SplitDisplayView)initWithCoder:(id)a3
{
  id v3;
  _TtC16MusicApplicationP33_F7781D2616362938348079397DDE4DAC16SplitDisplayView *v4;

  v3 = a3;
  v4 = (_TtC16MusicApplicationP33_F7781D2616362938348079397DDE4DAC16SplitDisplayView *)sub_20F64C((uint64_t)v3);

  return v4;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_F7781D2616362938348079397DDE4DAC16SplitDisplayView_leftContentItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_F7781D2616362938348079397DDE4DAC16SplitDisplayView_rightContentItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_F7781D2616362938348079397DDE4DAC16SplitDisplayView_gradientColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplicationP33_F7781D2616362938348079397DDE4DAC16SplitDisplayView_gradientView));
}

@end
