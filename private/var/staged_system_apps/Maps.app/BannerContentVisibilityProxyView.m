@implementation BannerContentVisibilityProxyView

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_visibilityModel);
  objc_msgSend(WeakRetained, "removeObserver:forKeyPath:context:", self, CFSTR("hidden"), &off_1011BDED0);

  v4.receiver = self;
  v4.super_class = (Class)BannerContentVisibilityProxyView;
  -[BannerContentVisibilityProxyView dealloc](&v4, "dealloc");
}

- (void)setVisibilityModel:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_visibilityModel);
  if (WeakRetained != obj)
  {
    if (WeakRetained)
      objc_msgSend(WeakRetained, "removeObserver:forKeyPath:context:", self, CFSTR("hidden"), &off_1011BDED0);
    v5 = obj;
    if (obj)
    {
      objc_msgSend(obj, "addObserver:forKeyPath:options:context:", self, CFSTR("hidden"), 0, &off_1011BDED0);
      -[BannerContentVisibilityProxyView setHidden:](self, "setHidden:", objc_msgSend(obj, "isHidden"));
      v5 = obj;
    }
    objc_storeWeak((id *)&self->_visibilityModel, v5);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  uint64_t v11;
  objc_super v12;

  v10 = a4;
  if (a6 == &off_1011BDED0)
  {
    v11 = objc_opt_class(UIView);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
      -[BannerContentVisibilityProxyView setHidden:](self, "setHidden:", objc_msgSend(v10, "isHidden"));
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)BannerContentVisibilityProxyView;
    -[BannerContentVisibilityProxyView observeValueForKeyPath:ofObject:change:context:](&v12, "observeValueForKeyPath:ofObject:change:context:", a3, v10, a5, a6);
  }

}

- (UIView)visibilityModel
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_visibilityModel);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_visibilityModel);
}

@end
