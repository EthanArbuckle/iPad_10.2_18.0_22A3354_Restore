@implementation NowPlayingTransportButton

- (_TtC5Books25NowPlayingTransportButton)initWithFrame:(CGRect)a3
{
  _TtC5Books25NowPlayingTransportButton *result;

  sub_10055BCB0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC5Books25NowPlayingTransportButton)initWithCoder:(id)a3
{
  id v4;
  _TtC5Books25NowPlayingTransportButton *result;

  *(_QWORD *)&self->MPButton_opaque[OBJC_IVAR____TtC5Books25NowPlayingTransportButton_highlightIndicatorView] = 0;
  *(_QWORD *)&self->MPButton_opaque[OBJC_IVAR____TtC5Books25NowPlayingTransportButton_highlightIndicatorWidthConstraint] = 0;
  *(_QWORD *)&self->MPButton_opaque[OBJC_IVAR____TtC5Books25NowPlayingTransportButton_highlightIndicatorWidth] = 0x4046000000000000;
  v4 = a3;

  result = (_TtC5Books25NowPlayingTransportButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001007B93A0, "Books/NowPlayingTransportButton.swift", 37, 2, 64, 0);
  __break(1u);
  return result;
}

- (BOOL)isHighlighted
{
  return sub_10055C5F4(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for NowPlayingTransportButton();
  v4 = v5.receiver;
  -[NowPlayingTransportButton setHighlighted:](&v5, "setHighlighted:", v3);
  sub_10055C224();

}

- (BOOL)isEnabled
{
  return sub_10055C5F4(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  double v5;
  id v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for NowPlayingTransportButton();
  v4 = v7.receiver;
  -[NowPlayingTransportButton setEnabled:](&v7, "setEnabled:", v3);
  if (objc_msgSend(v4, "isEnabled", v7.receiver, v7.super_class))
    v5 = 1.0;
  else
    v5 = 0.5;
  v6 = objc_msgSend(objc_allocWithZone((Class)UIColor), "initWithWhite:alpha:", 0.0, v5);
  objc_msgSend(v4, "setTintColor:", v6);

}

- (CGSize)intrinsicContentSize
{
  char *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v10;
  CGSize result;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for NowPlayingTransportButton();
  v2 = (char *)v10.receiver;
  -[NowPlayingTransportButton intrinsicContentSize](&v10, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;
  v7 = *(double *)&v2[OBJC_IVAR____TtC5Books25NowPlayingTransportButton_highlightIndicatorWidth];

  if (v4 > v7)
    v8 = v4;
  else
    v8 = v7;
  if (v6 > v7)
    v9 = v6;
  else
    v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  _TtC5Books25NowPlayingTransportButton *v2;

  v2 = self;
  sub_10055C770();

}

- (void).cxx_destruct
{

}

@end
