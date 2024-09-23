@implementation NowPlayingTransportButton

- (_TtC5Music25NowPlayingTransportButton)initWithFrame:(CGRect)a3
{
  _TtC5Music25NowPlayingTransportButton *result;

  sub_1003B42DC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC5Music25NowPlayingTransportButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003B50CC();
}

- (BOOL)isHighlighted
{
  return sub_1003B4C84(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
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
  sub_1003B4808();

}

- (BOOL)isEnabled
{
  return sub_1003B4C84(self, (uint64_t)a2, (SEL *)&selRef_isEnabled);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtC5Music25NowPlayingTransportButton *v6;
  unsigned int v7;
  unsigned int v8;
  double v9;
  objc_super v10;
  objc_super v11;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for NowPlayingTransportButton();
  v11.receiver = self;
  v11.super_class = v5;
  v6 = self;
  v7 = -[NowPlayingTransportButton isEnabled](&v11, "isEnabled");
  v10.receiver = v6;
  v10.super_class = v5;
  -[NowPlayingTransportButton setEnabled:](&v10, "setEnabled:", v3);
  if (v7 != -[NowPlayingTransportButton isEnabled](v6, "isEnabled"))
  {
    v8 = -[NowPlayingTransportButton isEnabled](v6, "isEnabled");
    v9 = 0.5;
    if (v8)
      v9 = 1.0;
    -[NowPlayingTransportButton setAlpha:](v6, "setAlpha:", v9);
  }

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
  v7 = *(double *)&v2[OBJC_IVAR____TtC5Music25NowPlayingTransportButton_highlightIndicatorWidth];

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
  _TtC5Music25NowPlayingTransportButton *v2;

  v2 = self;
  sub_1003B4E00();

}

- (void)tintColorDidChange
{
  char *v2;
  void *v3;
  _QWORD *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for NowPlayingTransportButton();
  v2 = (char *)v6.receiver;
  -[NowPlayingTransportButton tintColorDidChange](&v6, "tintColorDidChange");
  v3 = *(void **)&v2[OBJC_IVAR____TtC5Music25NowPlayingTransportButton_packageView];
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v2, "tintColor", v6.receiver, v6.super_class);
    (*(void (**)(id))((swift_isaMask & *v4) + 0xD8))(v5);

    v2 = (char *)v4;
  }

}

- (void).cxx_destruct
{

  sub_10013C57C(*(_QWORD *)&self->MPButton_opaque[OBJC_IVAR____TtC5Music25NowPlayingTransportButton_packageDefinition], *(_QWORD *)&self->packageView[OBJC_IVAR____TtC5Music25NowPlayingTransportButton_packageDefinition], *(void **)&self->packageDefinition[OBJC_IVAR____TtC5Music25NowPlayingTransportButton_packageDefinition], *(_QWORD *)&self->packageDefinition[OBJC_IVAR____TtC5Music25NowPlayingTransportButton_packageDefinition + 8], *(_QWORD *)&self->packageDefinition[OBJC_IVAR____TtC5Music25NowPlayingTransportButton_packageDefinition + 16], *(_QWORD *)&self->packageDefinition[OBJC_IVAR____TtC5Music25NowPlayingTransportButton_packageDefinition + 24], *(_QWORD *)&self->packageDefinition[OBJC_IVAR____TtC5Music25NowPlayingTransportButton_packageDefinition + 32], *(_QWORD *)&self->packageDefinition[OBJC_IVAR____TtC5Music25NowPlayingTransportButton_packageDefinition + 40], *(_QWORD *)&self->packageDefinition[OBJC_IVAR____TtC5Music25NowPlayingTransportButton_packageDefinition + 48], *(_QWORD *)&self->packageDefinition[OBJC_IVAR____TtC5Music25NowPlayingTransportButton_packageDefinition + 56]);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  id v7;
  _TtC5Music25NowPlayingTransportButton *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_1003B5178();

  return v9;
}

@end
