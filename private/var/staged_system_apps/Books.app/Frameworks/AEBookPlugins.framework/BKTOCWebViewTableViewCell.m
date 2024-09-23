@implementation BKTOCWebViewTableViewCell

- (void)setCacheKey:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_msgSend(v4, "copy");
    v6.receiver = self;
    v6.super_class = (Class)BKTOCWebViewTableViewCell;
    -[BKTOCTableViewCell setCacheKey:](&v6, "setCacheKey:", v5);

    -[BKTOCWebViewTableViewCell _setSelectedAppearance:](self, "_setSelectedAppearance:", -[BKTOCWebViewTableViewCell isSelected](self, "isSelected"));
  }

}

- (NSString)selectedCacheKey
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell cacheKey](self, "cacheKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingString:", CFSTR("-selected")));

  return (NSString *)v3;
}

- (void)prepareForReuse
{
  objc_super v3;

  -[UIImageView setImage:](self->_webViewCachedImageView, "setImage:", 0);
  -[BKTOCWebViewTableViewCell setCacheKey:](self, "setCacheKey:", 0);
  v3.receiver = self;
  v3.super_class = (Class)BKTOCWebViewTableViewCell;
  -[BKTOCTableViewCell prepareForReuse](&v3, "prepareForReuse");
}

- (UIImageView)webViewCachedImageView
{
  UIImageView *webViewCachedImageView;
  UIImageView *v4;
  UIImageView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];

  webViewCachedImageView = self->_webViewCachedImageView;
  if (!webViewCachedImageView)
  {
    v4 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    v5 = self->_webViewCachedImageView;
    self->_webViewCachedImageView = v4;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_webViewCachedImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setUserInteractionEnabled:](self->_webViewCachedImageView, "setUserInteractionEnabled:", 0);
    -[UIImageView setContentMode:](self->_webViewCachedImageView, "setContentMode:", 7);
    -[UIImageView setClipsToBounds:](self->_webViewCachedImageView, "setClipsToBounds:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UIImageView setBackgroundColor:](self->_webViewCachedImageView, "setBackgroundColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewTableViewCell contentView](self, "contentView"));
    objc_msgSend(v7, "addSubview:", self->_webViewCachedImageView);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewTableViewCell contentView](self, "contentView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell pageLabel](self, "pageLabel"));
    objc_msgSend(v8, "bringSubviewToFront:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView superview](self->_webViewCachedImageView, "superview"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](self->_webViewCachedImageView, "topAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v23));
    v25[0] = v22;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](self->_webViewCachedImageView, "bottomAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
    v25[1] = v19;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](self->_webViewCachedImageView, "leadingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v12));
    v25[2] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](self->_webViewCachedImageView, "trailingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "trailingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
    v25[3] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 4));
    objc_msgSend(v10, "addConstraints:", v17);

    webViewCachedImageView = self->_webViewCachedImageView;
  }
  return webViewCachedImageView;
}

- (void)_setSelectedAppearance:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[BKTOCTableViewCell cacheKey](self, "cacheKey"));
  if (v3)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[BKTOCWebViewTableViewCell selectedCacheKey](self, "selectedCacheKey"));

    v9 = (id)v5;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewTableViewCell imageCache](self, "imageCache"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v9));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKTOCWebViewTableViewCell webViewCachedImageView](self, "webViewCachedImageView"));
  objc_msgSend(v8, "setImage:", v7);

}

- (BKTOCImageCache2)imageCache
{
  return (BKTOCImageCache2 *)objc_loadWeakRetained((id *)&self->_imageCache);
}

- (void)setImageCache:(id)a3
{
  objc_storeWeak((id *)&self->_imageCache, a3);
}

- (void)setWebViewCachedImageView:(id)a3
{
  objc_storeStrong((id *)&self->_webViewCachedImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webViewCachedImageView, 0);
  objc_destroyWeak((id *)&self->_imageCache);
}

@end
