@implementation UpsellBannerView

- (_TtC16MusicApplication16UpsellBannerView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication16UpsellBannerView *)sub_44C5FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication16UpsellBannerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_44EDE8();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC16MusicApplication16UpsellBannerView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_44BB80(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  _TtC16MusicApplication16UpsellBannerView *v2;

  v2 = self;
  sub_44D358();

}

- (void)music_inheritedLayoutInsetsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[UpsellBannerView music_inheritedLayoutInsetsDidChange](&v3, "music_inheritedLayoutInsetsDidChange");
  objc_msgSend(v2, "setNeedsLayout", v3.receiver, v3.super_class);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v6.receiver;
  -[UpsellBannerView traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  sub_44CF18();
  sub_44CD94();
  objc_msgSend(v5, "setNeedsLayout", v6.receiver, v6.super_class);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  _TtC16MusicApplication16UpsellBannerView *v9;
  char *v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_44BA5C((uint64_t)a4, x, y);

  return v10;
}

- (void)tintColorDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[UpsellBannerView tintColorDidChange](&v3, "tintColorDidChange");
  sub_44CD94();

}

- (NSString)compactText
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication16UpsellBannerView_compactText);
}

- (void)setCompactText:(id)a3
{
  sub_44DBE8(self, (uint64_t)a2, a3, &OBJC_IVAR____TtC16MusicApplication16UpsellBannerView_compactText);
}

- (NSString)regularText
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication16UpsellBannerView_regularText);
}

- (void)setRegularText:(id)a3
{
  sub_44DBE8(self, (uint64_t)a2, a3, &OBJC_IVAR____TtC16MusicApplication16UpsellBannerView_regularText);
}

- (BOOL)showsAppleMusicLogo
{
  return *((_BYTE *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC16MusicApplication16UpsellBannerView_showsAppleMusicLogo);
}

- (void)setShowsAppleMusicLogo:(BOOL)a3
{
  int v3;
  _TtC16MusicApplication16UpsellBannerView *v4;

  v3 = *((unsigned __int8 *)&self->super.super.super.super.isa
       + OBJC_IVAR____TtC16MusicApplication16UpsellBannerView_showsAppleMusicLogo);
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC16MusicApplication16UpsellBannerView_showsAppleMusicLogo) = a3;
  if (v3 != a3)
  {
    v4 = self;
    sub_44CF18();
    -[UpsellBannerView setNeedsLayout](v4, "setNeedsLayout");

  }
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->compactText[OBJC_IVAR____TtC16MusicApplication16UpsellBannerView_compactText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->compactText[OBJC_IVAR____TtC16MusicApplication16UpsellBannerView_regularText]);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication16UpsellBannerView_textDrawingCache));
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication16UpsellBannerView_onSelection), *(_QWORD *)&self->compactText[OBJC_IVAR____TtC16MusicApplication16UpsellBannerView_onSelection]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication16UpsellBannerView_jsUpsellBanner));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication16UpsellBannerView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication16UpsellBannerView_measurementStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication16UpsellBannerView_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication16UpsellBannerView_backgroundImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication16UpsellBannerView_logoImageView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication16UpsellBannerView_textComponent));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication16UpsellBannerView_textMeasurementComponent));
}

@end
