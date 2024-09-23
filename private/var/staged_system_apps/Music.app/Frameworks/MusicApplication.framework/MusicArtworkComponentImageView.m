@implementation MusicArtworkComponentImageView

- (void)didMoveToSuperview
{
  MusicArtworkComponentImageView *v2;

  v2 = self;
  sub_1593A0();

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
  -[MusicArtworkComponentImageView frame](&v6, "frame");
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
  MusicArtworkComponentImageView *v9;
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
  -[MusicArtworkComponentImageView frame](&v23, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v22.receiver = v9;
  v22.super_class = v8;
  -[MusicArtworkComponentImageView setFrame:](&v22, "setFrame:", x, y, width, height);
  -[MusicArtworkComponentImageView frame](v9, "frame");
  v25.origin.x = v18;
  v25.origin.y = v19;
  v25.size.width = v20;
  v25.size.height = v21;
  v24.origin.x = v11;
  v24.origin.y = v13;
  v24.size.width = v15;
  v24.size.height = v17;
  if (!CGRectEqualToRect(v24, v25))
    sub_159948();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  MusicArtworkComponentImageView *v6;

  v5 = a3;
  v6 = self;
  sub_159638(a3);

}

- (MusicArtworkComponentImageView)initWithImage:(id)a3
{
  char *v5;
  objc_super v7;

  swift_weakInit((char *)self + OBJC_IVAR___MusicArtworkComponentImageView_artworkComponent);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___MusicArtworkComponentImageView_accessoryArtworkCatalog) = 0;
  v5 = (char *)self + OBJC_IVAR___MusicArtworkComponentImageView_accessoryStyle;
  *((_QWORD *)v5 + 1) = 0;
  *((_QWORD *)v5 + 2) = 0;
  *(_QWORD *)v5 = 0;
  v5[24] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MusicArtworkComponentImageView_accessoryImageView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MusicArtworkComponentImageView_accessoryStrokeView) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ArtworkComponentImageView();
  return -[MusicArtworkComponentImageView initWithImage:](&v7, "initWithImage:", a3);
}

- (MusicArtworkComponentImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  char *v7;
  objc_super v9;

  swift_weakInit((char *)self + OBJC_IVAR___MusicArtworkComponentImageView_artworkComponent);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___MusicArtworkComponentImageView_accessoryArtworkCatalog) = 0;
  v7 = (char *)self + OBJC_IVAR___MusicArtworkComponentImageView_accessoryStyle;
  *((_QWORD *)v7 + 1) = 0;
  *((_QWORD *)v7 + 2) = 0;
  *(_QWORD *)v7 = 0;
  v7[24] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MusicArtworkComponentImageView_accessoryImageView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MusicArtworkComponentImageView_accessoryStrokeView) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ArtworkComponentImageView();
  return -[MusicArtworkComponentImageView initWithImage:highlightedImage:](&v9, "initWithImage:highlightedImage:", a3, a4);
}

- (MusicArtworkComponentImageView)initWithFrame:(CGRect)a3
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
  swift_weakInit((char *)self + OBJC_IVAR___MusicArtworkComponentImageView_artworkComponent);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR___MusicArtworkComponentImageView_accessoryArtworkCatalog) = 0;
  v8 = (char *)self + OBJC_IVAR___MusicArtworkComponentImageView_accessoryStyle;
  *((_QWORD *)v8 + 1) = 0;
  *((_QWORD *)v8 + 2) = 0;
  *(_QWORD *)v8 = 0;
  v8[24] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MusicArtworkComponentImageView_accessoryImageView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___MusicArtworkComponentImageView_accessoryStrokeView) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ArtworkComponentImageView();
  return -[MusicArtworkComponentImageView initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (MusicArtworkComponentImageView)initWithCoder:(id)a3
{
  id v3;
  MusicArtworkComponentImageView *v4;

  v3 = a3;
  v4 = (MusicArtworkComponentImageView *)sub_15BC88((uint64_t)v3);

  return v4;
}

- (void).cxx_destruct
{
  swift_weakDestroy((char *)self + OBJC_IVAR___MusicArtworkComponentImageView_artworkComponent);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___MusicArtworkComponentImageView_accessoryArtworkCatalog));
  sub_15BC34(*(id *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR___MusicArtworkComponentImageView_accessoryStyle));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___MusicArtworkComponentImageView_accessoryImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___MusicArtworkComponentImageView_accessoryStrokeView));
}

@end
