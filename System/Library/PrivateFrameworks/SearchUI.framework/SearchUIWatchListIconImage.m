@implementation SearchUIWatchListIconImage

- (SearchUIWatchListIconImage)initWithArtwork:(id)a3
{
  id v5;
  SearchUIWatchListIconImage *v6;
  SearchUIWatchListIconImage *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUIWatchListIconImage;
  v6 = -[SearchUIWatchListIconImage init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_artwork, a3);

  return v7;
}

- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v5 = a4;
  v8 = a5;
  -[SearchUIImage size](self, "size");
  v10 = v9 * a3;
  -[SearchUIImage size](self, "size");
  v12 = v11 * a3;
  -[SearchUIWatchListIconImage artwork](self, "artwork");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bestArtworkVariantOfType:forSize:", 10, v10, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_opt_new();
  objc_msgSend(v14, "artworkURLForSize:format:", CFSTR("png"), v10, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setUrlValue:", v16);

  -[SearchUIImage setSfImage:](self, "setSfImage:", v15);
  v17.receiver = self;
  v17.super_class = (Class)SearchUIWatchListIconImage;
  -[SearchUIImage loadImageWithScale:isDarkStyle:completionHandler:](&v17, sel_loadImageWithScale_isDarkStyle_completionHandler_, v5, v8, a3);

}

- (int)defaultCornerRoundingStyle
{
  return 3;
}

- (WLKArtworkVariantListing)artwork
{
  return (WLKArtworkVariantListing *)objc_getProperty(self, a2, 136, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artwork, 0);
}

@end
