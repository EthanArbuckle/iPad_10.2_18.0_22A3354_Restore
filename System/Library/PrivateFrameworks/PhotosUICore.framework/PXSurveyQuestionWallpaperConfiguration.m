@implementation PXSurveyQuestionWallpaperConfiguration

- (PXSurveyQuestionWallpaperConfiguration)initWithTitle:(id)a3 asset:(id)a4
{
  id v6;
  id v7;
  PXSurveyQuestionWallpaperConfiguration *v8;
  uint64_t v9;
  NSString *title;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXSurveyQuestionWallpaperConfiguration;
  v8 = -[PXSurveyQuestionWallpaperConfiguration init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    title = v8->_title;
    v8->_title = (NSString *)v9;

    objc_storeStrong((id *)&v8->_asset, a4);
    v8->_isStale = 0;
  }

  return v8;
}

- (PXSurveyQuestionWallpaperConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSurveyQuestionWallpaperConfiguration.m"), 34, CFSTR("%s is not available as initializer"), "-[PXSurveyQuestionWallpaperConfiguration init]");

  abort();
}

- (UIView)contentView
{
  PXWallpaperSuggestionView *wallpaperView;
  PXWallpaperSuggestionView *v4;
  PXWallpaperSuggestionView *v5;
  void *v6;

  wallpaperView = self->_wallpaperView;
  if (!wallpaperView)
  {
    v4 = objc_alloc_init(PXWallpaperSuggestionView);
    v5 = self->_wallpaperView;
    self->_wallpaperView = v4;

    -[PXWallpaperSuggestionView setShowClockOverlay:](self->_wallpaperView, "setShowClockOverlay:", 0);
    -[PXSurveyQuestionWallpaperConfiguration asset](self, "asset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXWallpaperSuggestionView setAsset:](self->_wallpaperView, "setAsset:", v6);

    wallpaperView = self->_wallpaperView;
  }
  return (UIView *)wallpaperView;
}

- (void)layoutContentViewInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  void *v7;
  double v8;
  double v9;
  double v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen", a3.origin.x);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  PXSizeGetAspectRatio();
  v9 = v8;

  if (v9 >= 1.0)
    v10 = 1.0 / v9;
  else
    v10 = v9;
  -[PXWallpaperSuggestionView setFrame:](self->_wallpaperView, "setFrame:", (width - height * v10) * 0.5, y + 8.0, height * v10, height);
}

- (UIImage)contentImageForOneUp
{
  return (UIImage *)-[PXWallpaperSuggestionView image](self->_wallpaperView, "image");
}

- (CGRect)contentRectForOneUp
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)needsQuestionInvalidationForChange:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "changeDetailsForObject:", self->_asset);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "objectWasDeleted");

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (PXSurveyQuestionConfigurationHandlers)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_handlers, a3);
}

- (BOOL)isStale
{
  return self->_isStale;
}

- (void)setIsStale:(BOOL)a3
{
  self->_isStale = a3;
}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_wallpaperView, 0);
}

@end
