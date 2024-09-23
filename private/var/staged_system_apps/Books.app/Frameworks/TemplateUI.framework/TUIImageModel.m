@implementation TUIImageModel

- (TUIImageModel)initWithIdentifier:(id)a3 image:(id)a4 size:(CGSize)a5 renderMode:(int64_t)a6 alignmentRectInsets:(UIEdgeInsets)a7
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  CGFloat height;
  CGFloat width;
  id v17;
  id v18;
  TUIImageModel *v19;
  TUIImageModel *v20;
  uint64_t v21;
  UIImage *image;
  objc_super v24;

  right = a7.right;
  bottom = a7.bottom;
  left = a7.left;
  top = a7.top;
  height = a5.height;
  width = a5.width;
  v17 = a3;
  v18 = a4;
  v24.receiver = self;
  v24.super_class = (Class)TUIImageModel;
  v19 = -[TUIImageModel init](&v24, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_identifier, a3);
    v20->_size.width = width;
    v20->_size.height = height;
    v20->_renderMode = a6;
    v20->_alignmentRectInsets.top = top;
    v20->_alignmentRectInsets.left = left;
    v20->_alignmentRectInsets.bottom = bottom;
    v20->_alignmentRectInsets.right = right;
    v21 = objc_claimAutoreleasedReturnValue(-[TUIImageModel _configuredImage:](v20, "_configuredImage:", v18));
    image = v20->_image;
    v20->_image = (UIImage *)v21;

    v20->_isLoaded = 1;
  }

  return v20;
}

- (TUIImageModel)initWithIdentifier:(id)a3 urlString:(id)a4 baseURL:(id)a5 size:(CGSize)a6 renderMode:(int64_t)a7 alignmentRectInsets:(UIEdgeInsets)a8
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  CGFloat height;
  CGFloat width;
  id v19;
  id v20;
  id v21;
  TUIImageModel *v22;
  TUIImageModel *v23;
  objc_super v25;

  right = a8.right;
  bottom = a8.bottom;
  left = a8.left;
  top = a8.top;
  height = a6.height;
  width = a6.width;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v25.receiver = self;
  v25.super_class = (Class)TUIImageModel;
  v22 = -[TUIImageModel init](&v25, "init");
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_identifier, a3);
    objc_storeStrong((id *)&v23->_urlString, a4);
    objc_storeStrong((id *)&v23->_baseURL, a5);
    v23->_size.width = width;
    v23->_size.height = height;
    v23->_renderMode = a7;
    v23->_alignmentRectInsets.top = top;
    v23->_alignmentRectInsets.left = left;
    v23->_alignmentRectInsets.bottom = bottom;
    v23->_alignmentRectInsets.right = right;
  }

  return v23;
}

- (void)loadImageFromResource:(id)a3 placeholderImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  UIImage *v13;
  UIImage *image;
  id v15;

  if (!self->_isLoaded)
  {
    v6 = a4;
    v7 = a3;
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageContentWithOptions:", 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "image"));
    v9 = objc_msgSend(v8, "newImage");
    v10 = v9;
    if (v9)
      v11 = v9;
    else
      v11 = v6;
    v12 = v11;

    v13 = (UIImage *)objc_claimAutoreleasedReturnValue(-[TUIImageModel _configuredImage:](self, "_configuredImage:", v12));
    image = self->_image;
    self->_image = v13;

    LOBYTE(v13) = objc_msgSend(v7, "isImageLoaded");
    self->_isLoaded = (char)v13;

  }
}

- (BOOL)isEqual:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;

  if (self != a3)
  {
    v5 = a3;
    v7 = objc_opt_class(TUIImageModel, v6);
    v8 = TUIDynamicCast(v7, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  }
  return self == a3;
}

- (id)_configuredImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  BOOL v9;
  uint64_t v10;
  float64x2_t v11;
  float64x2_t v12;
  uint64_t v13;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    if (self->_size.width > 0.0)
    {
      v6 = v4;
      if (self->_size.height > 0.0)
      {
        objc_msgSend(v4, "size");
        v9 = v8 == self->_size.width && v7 == self->_size.height;
        v6 = v5;
        if (!v9)
        {
          v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageByPreparingThumbnailOfSize:"));

        }
      }
    }
    if (objc_msgSend(v5, "renderingMode") != (id)self->_renderMode)
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageWithRenderingMode:"));

      v6 = (void *)v10;
    }
    v11 = *(float64x2_t *)&self->_alignmentRectInsets.top;
    v12 = *(float64x2_t *)&self->_alignmentRectInsets.bottom;
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(v11, *(float64x2_t *)&UIEdgeInsetsZero.top), (int32x4_t)vceqq_f64(v12, *(float64x2_t *)&UIEdgeInsetsZero.bottom))), 0xFuLL))) & 1) == 0)
    {
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageWithAlignmentRectInsets:", *(_OWORD *)&v11, *(_OWORD *)&v12));

      v6 = (void *)v13;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (TUIIdentifier)identifier
{
  return self->_identifier;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)renderMode
{
  return self->_renderMode;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_alignmentRectInsets.top;
  left = self->_alignmentRectInsets.left;
  bottom = self->_alignmentRectInsets.bottom;
  right = self->_alignmentRectInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)isLoaded
{
  return self->_isLoaded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
