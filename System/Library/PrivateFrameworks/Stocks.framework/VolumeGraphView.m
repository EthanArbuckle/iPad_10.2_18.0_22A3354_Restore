@implementation VolumeGraphView

- (VolumeGraphView)initWithFrame:(CGRect)a3
{
  VolumeGraphView *v3;
  VolumeGraphView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VolumeGraphView;
  v3 = -[VolumeGraphView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[VolumeGraphView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  return v4;
}

- (void)setGraphImageSet:(id)a3
{
  UIImage *v4;
  UIImage *volumeImage;
  UIImage *v6;
  UIImage *v7;
  CGImage *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "volumeGraphImage");
  v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
  volumeImage = self->_volumeImage;

  if (v4 != volumeImage)
  {
    objc_msgSend(v10, "volumeGraphImage");
    v6 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v7 = self->_volumeImage;
    self->_volumeImage = v6;

    v8 = -[UIImage CGImage](self->_volumeImage, "CGImage");
    -[VolumeGraphView layer](self, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContents:", v8);

    -[TintedView setImage:](self->_tintedVolumeView, "setImage:", self->_volumeImage);
  }

}

- (void)setShowingSelectedRegion:(BOOL)a3
{
  _BOOL4 v3;
  TintedView *v5;
  TintedView *tintedVolumeView;
  TintedView *v7;
  void *v8;
  void *v9;
  id v10;
  UIView *v11;
  UIView *tintedRegionClipView;

  if (self->_showingTintedRegion != a3)
  {
    v3 = a3;
    self->_showingTintedRegion = a3;
    if (a3)
    {
      if (!self->_tintedVolumeView)
      {
        v5 = objc_alloc_init(TintedView);
        tintedVolumeView = self->_tintedVolumeView;
        self->_tintedVolumeView = v5;

        v7 = self->_tintedVolumeView;
        +[StocksStyle sharedStyle](StocksStyle, "sharedStyle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "chartHighlightColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[TintedView setTintColor:](v7, "setTintColor:", v9);

        v10 = objc_alloc(MEMORY[0x24BDF6F90]);
        -[VolumeGraphView bounds](self, "bounds");
        v11 = (UIView *)objc_msgSend(v10, "initWithFrame:");
        tintedRegionClipView = self->_tintedRegionClipView;
        self->_tintedRegionClipView = v11;

        -[UIView setClipsToBounds:](self->_tintedRegionClipView, "setClipsToBounds:", 1);
        -[UIView addSubview:](self->_tintedRegionClipView, "addSubview:", self->_tintedVolumeView);
        -[UIView setAlpha:](self->_tintedRegionClipView, "setAlpha:", 0.0);
        -[VolumeGraphView addSubview:](self, "addSubview:", self->_tintedRegionClipView);
      }
      if (self->_volumeImage)
        -[TintedView setImage:](self->_tintedVolumeView, "setImage:");
    }
    -[UIView setAlpha:](self->_tintedRegionClipView, "setAlpha:", (double)v3);
  }
}

- (void)resizeSelectedVolumeClipViewWithLeftX:(double)a3 rightX:(double)a4
{
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  TintedView *tintedVolumeView;

  -[TintedView layer](self->_tintedVolumeView, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllAnimations");

  -[UIView layer](self->_tintedRegionClipView, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeAllAnimations");

  -[VolumeGraphView bounds](self, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[UIView setFrame:](self->_tintedRegionClipView, "setFrame:", a3, 0.0, a4 - a3);
  tintedVolumeView = self->_tintedVolumeView;
  -[VolumeGraphView convertRect:toView:](self, "convertRect:toView:", self->_tintedRegionClipView, v10, v12, v14, v16);
  -[TintedView setFrame:](tintedVolumeView, "setFrame:");
}

- (StockGraphImageSet)graphImageSet
{
  return self->_graphImageSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphImageSet, 0);
  objc_storeStrong((id *)&self->_volumeImage, 0);
  objc_storeStrong((id *)&self->_tintedRegionClipView, 0);
  objc_storeStrong((id *)&self->_tintedVolumeView, 0);
}

@end
