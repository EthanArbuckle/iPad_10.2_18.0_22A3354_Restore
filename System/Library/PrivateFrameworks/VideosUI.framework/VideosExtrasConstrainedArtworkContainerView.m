@implementation VideosExtrasConstrainedArtworkContainerView

- (VideosExtrasConstrainedArtworkContainerView)initWithFrame:(CGRect)a3
{
  VideosExtrasConstrainedArtworkContainerView *v3;
  VideosExtrasArtworkLayoutTriggeringView *v4;
  VideosExtrasArtworkLayoutTriggeringView *v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VideosExtrasConstrainedArtworkContainerView;
  v3 = -[VideosExtrasConstrainedArtworkContainerView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [VideosExtrasArtworkLayoutTriggeringView alloc];
    -[VideosExtrasConstrainedArtworkContainerView bounds](v3, "bounds");
    v5 = -[MPUArtworkView initWithFrame:](v4, "initWithFrame:");
    -[VideosExtrasConstrainedArtworkContainerView addSubview:](v3, "addSubview:", v5);
    -[VideosExtrasConstrainedArtworkContainerView setArtworkView:](v3, "setArtworkView:", v5);
    v6 = objc_alloc_init(MEMORY[0x1E0DC3890]);
    objc_msgSend(v6, "setContentMode:", 1);
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[VideosExtrasConstrainedArtworkContainerView addSubview:](v3, "addSubview:", v6);
    -[VideosExtrasConstrainedArtworkContainerView setOverlayView:](v3, "setOverlayView:", v6);

  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  int v17;
  double v18;
  int v19;
  double v20;
  double v21;
  double MidY;
  double MaxY;
  double MidX;
  uint64_t v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  objc_super v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v38.receiver = self;
  v38.super_class = (Class)VideosExtrasConstrainedArtworkContainerView;
  -[VideosExtrasConstrainedArtworkContainerView layoutSubviews](&v38, sel_layoutSubviews);
  -[VideosExtrasConstrainedArtworkContainerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[VideosExtrasConstrainedArtworkContainerView artworkView](self, "artworkView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "image");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "size");
  v14 = v13;
  v16 = v15;

  v17 = MPUFloatLessThanOrEqualToFloat();
  if (v8 >= 1.0)
    v18 = v8;
  else
    v18 = 1.0;
  if (v17)
    v14 = v18;
  v19 = MPUFloatLessThanOrEqualToFloat();
  if (v10 >= 1.0)
    v20 = v10;
  else
    v20 = 1.0;
  if (!v19)
    v20 = v16;
  v21 = v8 / v14;
  if (v8 / v14 >= v10 / v20)
    v21 = v10 / v20;
  objc_msgSend(v11, "setBounds:", 0.0, 0.0, v14 * v21, v20 * v21);
  v39.origin.x = v4;
  v39.origin.y = v6;
  v39.size.width = v8;
  v39.size.height = v10;
  MidY = CGRectGetMidY(v39);
  if (-[VideosExtrasConstrainedArtworkContainerView shouldBottomAlignArtwork](self, "shouldBottomAlignArtwork"))
  {
    v40.origin.x = v4;
    v40.origin.y = v6;
    v40.size.width = v8;
    v40.size.height = v10;
    MaxY = CGRectGetMaxY(v40);
    objc_msgSend(v11, "bounds");
    MidY = MaxY + CGRectGetHeight(v41) * -0.5;
  }
  v42.origin.x = v4;
  v42.origin.y = v6;
  v42.size.width = v8;
  v42.size.height = v10;
  MidX = CGRectGetMidX(v42);
  objc_msgSend(v11, "setCenter:", MidX, MidY);
  if (self->_overlayImage
    && (objc_msgSend(v11, "image"), (v25 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v26 = (void *)v25, v27 = objc_msgSend(v11, "isDisplayingPlaceholder"), v26, (v27 & 1) == 0))
  {
    objc_msgSend(v11, "bounds");
    v32 = v31;
    objc_msgSend(v11, "bounds");
    if (v32 >= v33)
      v34 = v33;
    else
      v34 = v32;
    v35 = self->_overlayScale * v34;
    -[VideosExtrasConstrainedArtworkContainerView overlayView](self, "overlayView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setBounds:", 0.0, 0.0, v35, v35);
    objc_msgSend(v29, "setCenter:", MidX, MidY);
    v28 = v29;
    v30 = 0;
  }
  else
  {
    -[VideosExtrasConstrainedArtworkContainerView overlayView](self, "overlayView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    v30 = 1;
  }
  objc_msgSend(v28, "setHidden:", v30);

  if (-[VideosExtrasConstrainedArtworkContainerView shouldAutoresizeMaskLayerToFillBounds](self, "shouldAutoresizeMaskLayerToFillBounds"))
  {
    -[VideosExtrasConstrainedArtworkContainerView layer](self, "layer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "mask");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bounds");
    objc_msgSend(v37, "setFrame:");

  }
}

- (void)setOverlayImage:(id)a3
{
  UIImage *v5;
  void *v6;
  UIImage *v7;

  v5 = (UIImage *)a3;
  if (self->_overlayImage != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_overlayImage, a3);
    -[VideosExtrasConstrainedArtworkContainerView overlayView](self, "overlayView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", self->_overlayImage);
    -[VideosExtrasConstrainedArtworkContainerView setNeedsLayout](self, "setNeedsLayout");

    v5 = v7;
  }

}

- (void)setOverlayScale:(double)a3
{
  if (self->_overlayScale != a3)
  {
    if (a3 == 0.0)
      a3 = 1.0;
    self->_overlayScale = a3;
    -[VideosExtrasConstrainedArtworkContainerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (MPUArtworkView)artworkView
{
  return self->_artworkView;
}

- (void)setArtworkView:(id)a3
{
  objc_storeStrong((id *)&self->_artworkView, a3);
}

- (BOOL)shouldAutoresizeMaskLayerToFillBounds
{
  return self->_shouldAutoresizeMaskLayerToFillBounds;
}

- (void)setShouldAutoresizeMaskLayerToFillBounds:(BOOL)a3
{
  self->_shouldAutoresizeMaskLayerToFillBounds = a3;
}

- (BOOL)shouldBottomAlignArtwork
{
  return self->_shouldBottomAlignArtwork;
}

- (void)setShouldBottomAlignArtwork:(BOOL)a3
{
  self->_shouldBottomAlignArtwork = a3;
}

- (UIImage)overlayImage
{
  return self->_overlayImage;
}

- (double)overlayScale
{
  return self->_overlayScale;
}

- (UIImageView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_overlayView, a3);
}

- (NSArray)overlaySizeConstraints
{
  return self->_overlaySizeConstraints;
}

- (void)setOverlaySizeConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_overlaySizeConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlaySizeConstraints, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_overlayImage, 0);
  objc_storeStrong((id *)&self->_artworkView, 0);
}

@end
