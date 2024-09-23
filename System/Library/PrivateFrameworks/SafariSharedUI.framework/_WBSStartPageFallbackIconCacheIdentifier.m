@implementation _WBSStartPageFallbackIconCacheIdentifier

- (_WBSStartPageFallbackIconCacheIdentifier)initWithConfiguration:(id)a3 imageSize:(CGSize)a4 title:(id)a5 url:(id)a6 baseImage:(id)a7
{
  CGFloat height;
  CGFloat width;
  id v14;
  id v15;
  id v16;
  id v17;
  _WBSStartPageFallbackIconCacheIdentifier *v18;
  _WBSStartPageFallbackIconCacheIdentifier *v19;
  uint64_t v20;
  NSString *title;
  uint64_t v22;
  NSString *url;
  _WBSStartPageFallbackIconCacheIdentifier *v24;
  objc_super v26;

  height = a4.height;
  width = a4.width;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v26.receiver = self;
  v26.super_class = (Class)_WBSStartPageFallbackIconCacheIdentifier;
  v18 = -[_WBSStartPageFallbackIconCacheIdentifier init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_configuration, a3);
    v19->_imageSize.width = width;
    v19->_imageSize.height = height;
    v20 = objc_msgSend(v15, "copy");
    title = v19->_title;
    v19->_title = (NSString *)v20;

    v22 = objc_msgSend(v16, "copy");
    url = v19->_url;
    v19->_url = (NSString *)v22;

    objc_storeStrong((id *)&v19->_baseImage, a7);
    v24 = v19;
  }

  return v19;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  v3 = (unint64_t)self->_imageSize.width | ((unint64_t)self->_imageSize.height << 32);
  v4 = -[NSString hash](self->_title, "hash");
  return v3 ^ v4 ^ -[NSString hash](self->_url, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _WBSStartPageFallbackIconCacheIdentifier *v4;
  _WBSStartPageFallbackIconCacheIdentifier *v5;
  BOOL v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (_WBSStartPageFallbackIconCacheIdentifier *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else if (-[_WBSStartPageFallbackIconCacheIdentifier isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = self->_imageSize.width == v5->_imageSize.width && self->_imageSize.height == v5->_imageSize.height;
    if (v6 && WBSIsEqual() && WBSIsEqual() && WBSIsEqual())
    {
      -[WBSTemplateIconMonogramConfiguration backgroundColor](self->_configuration, "backgroundColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WBSTemplateIconMonogramConfiguration backgroundColor](v5->_configuration, "backgroundColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = WBSIsEqual();

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (WBSTemplateIconMonogramConfiguration)configuration
{
  return self->_configuration;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)url
{
  return self->_url;
}

- (UIImage)baseImage
{
  return self->_baseImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseImage, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
