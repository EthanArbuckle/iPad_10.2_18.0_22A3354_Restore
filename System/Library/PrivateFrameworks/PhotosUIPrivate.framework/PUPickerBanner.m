@implementation PUPickerBanner

- (double)height
{
  void *v2;
  double v3;
  double v4;

  +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bannerHeight");
  v4 = v3;

  return v4;
}

- (id)view
{
  UIView *view;
  PUPickerBannerView *v4;
  UIView *v5;
  UIView *v6;

  view = self->_view;
  if (!view)
  {
    v4 = [PUPickerBannerView alloc];
    v5 = -[PUPickerBannerView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_view;
    self->_view = v5;

    view = self->_view;
  }
  return view;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
}

@end
