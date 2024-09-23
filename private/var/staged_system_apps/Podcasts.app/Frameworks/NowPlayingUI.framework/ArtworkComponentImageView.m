@implementation ArtworkComponentImageView

- (void)didMoveToSuperview
{
  _TtC12NowPlayingUI25ArtworkComponentImageView *v2;

  v2 = self;
  sub_10153C();

}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ArtworkComponentImageView();
  -[ArtworkComponentImageView frame](&v6, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *v8;
  _TtC12NowPlayingUI25ArtworkComponentImageView *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  objc_super v22;
  objc_super v23;
  CGRect v24;
  CGRect v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (objc_class *)type metadata accessor for ArtworkComponentImageView();
  v23.receiver = self;
  v23.super_class = v8;
  v9 = self;
  -[ArtworkComponentImageView frame](&v23, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v22.receiver = v9;
  v22.super_class = v8;
  -[ArtworkComponentImageView setFrame:](&v22, "setFrame:", x, y, width, height);
  -[ArtworkComponentImageView frame](v9, "frame");
  v25.origin.x = v18;
  v25.origin.y = v19;
  v25.size.width = v20;
  v25.size.height = v21;
  v24.origin.x = v11;
  v24.origin.y = v13;
  v24.size.width = v15;
  v24.size.height = v17;
  if (!CGRectEqualToRect(v24, v25))
    sub_1018A4();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  double v7;
  id v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ArtworkComponentImageView();
  v4 = v10.receiver;
  v5 = a3;
  v6 = -[ArtworkComponentImageView traitCollectionDidChange:](&v10, "traitCollectionDidChange:", v5);
  if (v5)
    v7 = UITraitCollection.safeDisplayScale.getter(v6);
  else
    v7 = 0.0;
  v8 = objc_msgSend(v4, "traitCollection", v10.receiver, v10.super_class);
  v9 = UITraitCollection.safeDisplayScale.getter(v8);

  if (!v5 || v7 != v9)
    sub_101CB0();

}

- (_TtC12NowPlayingUI25ArtworkComponentImageView)initWithImage:(id)a3
{
  char *v5;
  objc_super v7;

  swift_weakInit((char *)self + OBJC_IVAR____TtC12NowPlayingUI25ArtworkComponentImageView_artworkComponent, 0);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI25ArtworkComponentImageView_accessoryArtworkCatalog) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC12NowPlayingUI25ArtworkComponentImageView_accessoryStyle;
  *((_QWORD *)v5 + 1) = 0;
  *((_QWORD *)v5 + 2) = 0;
  *(_QWORD *)v5 = 0;
  v5[24] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI25ArtworkComponentImageView_accessoryImageView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI25ArtworkComponentImageView_accessoryStrokeView) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ArtworkComponentImageView();
  return -[ArtworkComponentImageView initWithImage:](&v7, "initWithImage:", a3);
}

- (_TtC12NowPlayingUI25ArtworkComponentImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  char *v7;
  objc_super v9;

  swift_weakInit((char *)self + OBJC_IVAR____TtC12NowPlayingUI25ArtworkComponentImageView_artworkComponent, 0);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI25ArtworkComponentImageView_accessoryArtworkCatalog) = 0;
  v7 = (char *)self + OBJC_IVAR____TtC12NowPlayingUI25ArtworkComponentImageView_accessoryStyle;
  *((_QWORD *)v7 + 1) = 0;
  *((_QWORD *)v7 + 2) = 0;
  *(_QWORD *)v7 = 0;
  v7[24] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI25ArtworkComponentImageView_accessoryImageView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI25ArtworkComponentImageView_accessoryStrokeView) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ArtworkComponentImageView();
  return -[ArtworkComponentImageView initWithImage:highlightedImage:](&v9, "initWithImage:highlightedImage:", a3, a4);
}

- (_TtC12NowPlayingUI25ArtworkComponentImageView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  swift_weakInit((char *)self + OBJC_IVAR____TtC12NowPlayingUI25ArtworkComponentImageView_artworkComponent, 0);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI25ArtworkComponentImageView_accessoryArtworkCatalog) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC12NowPlayingUI25ArtworkComponentImageView_accessoryStyle;
  *((_QWORD *)v8 + 1) = 0;
  *((_QWORD *)v8 + 2) = 0;
  *(_QWORD *)v8 = 0;
  v8[24] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI25ArtworkComponentImageView_accessoryImageView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC12NowPlayingUI25ArtworkComponentImageView_accessoryStrokeView) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ArtworkComponentImageView();
  return -[ArtworkComponentImageView initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC12NowPlayingUI25ArtworkComponentImageView)initWithCoder:(id)a3
{
  return (_TtC12NowPlayingUI25ArtworkComponentImageView *)sub_101FF8(a3);
}

- (void).cxx_destruct
{
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC12NowPlayingUI25ArtworkComponentImageView_artworkComponent);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI25ArtworkComponentImageView_accessoryArtworkCatalog));
  sub_C0C60(*(id *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC12NowPlayingUI25ArtworkComponentImageView_accessoryStyle));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI25ArtworkComponentImageView_accessoryImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI25ArtworkComponentImageView_accessoryStrokeView));
}

@end
