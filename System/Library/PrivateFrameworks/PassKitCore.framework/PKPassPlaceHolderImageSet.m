@implementation PKPassPlaceHolderImageSet

- (PKPassPlaceHolderImageSet)initWithCoder:(id)a3
{
  id v4;
  PKPassPlaceHolderImageSet *v5;
  void *v6;
  uint64_t v7;
  PKImage *placeHolderImage;
  uint64_t v9;
  PKColor *placeHolderImageAverageColor;
  NSString *v11;
  NSString *v12;
  CGFloat *p_x;
  CGSize v14;
  objc_super v16;
  NSRect v17;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKPassPlaceHolderImageSet;
  v5 = -[PKImageSet initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x19400CFE8]();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placeHolderImage"));
    v7 = objc_claimAutoreleasedReturnValue();
    placeHolderImage = v5->_placeHolderImage;
    v5->_placeHolderImage = (PKImage *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("placeHolderImageAverageColor"));
    v9 = objc_claimAutoreleasedReturnValue();
    placeHolderImageAverageColor = v5->_placeHolderImageAverageColor;
    v5->_placeHolderImageAverageColor = (PKColor *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("logoRect"));
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    p_x = &v5->_logoRect.origin.x;
    if (v11)
    {
      v17 = NSRectFromString(v11);
      *p_x = v17.origin.x;
      v5->_logoRect.origin.y = v17.origin.y;
      v5->_logoRect.size.width = v17.size.width;
      v5->_logoRect.size.height = v17.size.height;
    }
    else
    {
      v14 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
      *(_OWORD *)p_x = *MEMORY[0x1E0C9D628];
      v5->_logoRect.size = v14;
    }

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

+ (int64_t)imageSetType
{
  return 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKImage)placeHolderImage
{
  return self->_placeHolderImage;
}

- (PKColor)placeHolderImageAverageColor
{
  return self->_placeHolderImageAverageColor;
}

+ (unsigned)currentVersion
{
  return 18;
}

+ (id)archiveName
{
  return CFSTR("PlaceHolder");
}

- (PKPassPlaceHolderImageSet)initWithDisplayProfile:(id)a3 fileURL:(id)a4 screenScale:(double)a5 suffix:(id)a6
{
  return (PKPassPlaceHolderImageSet *)-[PKPassPlaceHolderImageSet _initWithDisplayProfile:fileURL:screenScale:suffix:frontFaceImageSet:](self, "_initWithDisplayProfile:fileURL:screenScale:suffix:frontFaceImageSet:", a3, a4, a6, 0, a5);
}

- (id)_initWithDisplayProfile:(id)a3 fileURL:(id)a4 screenScale:(double)a5 suffix:(id)a6 frontFaceImageSet:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  PKPassPlaceHolderImageSet *v16;
  uint64_t v17;
  void *v18;
  id v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  uint64_t v24;
  PKColor *placeHolderImageAverageColor;
  void *v26;
  uint64_t v27;
  void *placeHolderImage;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  PKImage *v34;
  void *v36;
  objc_super v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v37.receiver = self;
  v37.super_class = (Class)PKPassPlaceHolderImageSet;
  v16 = -[PKImageSet initWithDisplayProfile:fileURL:screenScale:suffix:](&v37, sel_initWithDisplayProfile_fileURL_screenScale_suffix_, v12, v13, v14, a5);
  if (v16)
  {
    v17 = MEMORY[0x19400CFE8]();
    v18 = (void *)v17;
    if (v15)
    {
      v19 = v12;
      objc_msgSend(v15, "logoRect");
      v16->_logoRect.origin.x = v20;
      v16->_logoRect.origin.y = v21;
      v16->_logoRect.size.width = v22;
      v16->_logoRect.size.height = v23;
      objc_msgSend(v15, "faceImageAverageColor");
      v24 = objc_claimAutoreleasedReturnValue();
      placeHolderImageAverageColor = v16->_placeHolderImageAverageColor;
      v16->_placeHolderImageAverageColor = (PKColor *)v24;

      objc_msgSend(v15, "faceImage");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      PKPassPartialFrontFaceImage(v26, v19);
      v27 = objc_claimAutoreleasedReturnValue();

      placeHolderImage = v16->_placeHolderImage;
      v16->_placeHolderImage = (PKImage *)v27;
    }
    else
    {
      v36 = (void *)v17;
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v13);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v26)
      {
        PKLogFacilityTypeGetObject(0);
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "bundleIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v39 = v31;
          v40 = 2112;
          v41 = v13;
          _os_log_impl(&dword_18FC92000, v29, OS_LOG_TYPE_DEFAULT, "Could not instantiate bundle for process(%@): %@", buf, 0x16u);

        }
      }
      v32 = v12;
      PKPassFrontFaceImage(v32, v26, &v16->_logoRect.origin.x, 0, 0, (uint64_t)&v16->_placeHolderImageAverageColor, v14, a5);
      placeHolderImage = (void *)objc_claimAutoreleasedReturnValue();
      PKPassPartialFrontFaceImage(placeHolderImage, v32);
      v33 = objc_claimAutoreleasedReturnValue();

      v34 = v16->_placeHolderImage;
      v16->_placeHolderImage = (PKImage *)v33;

      v18 = v36;
    }

    objc_autoreleasePoolPop(v18);
  }

  return v16;
}

- (void)preheatImages
{
  -[PKImage preheatBitmapData](self->_placeHolderImage, "preheatBitmapData");
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  CGRect *p_logoRect;
  void *v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassPlaceHolderImageSet;
  v5 = -[PKImageSet encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  v6 = (void *)MEMORY[0x19400CFE8](v5);
  objc_msgSend(v4, "encodeObject:forKey:", self->_placeHolderImage, CFSTR("placeHolderImage"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_placeHolderImageAverageColor, CFSTR("placeHolderImageAverageColor"));
  p_logoRect = &self->_logoRect;
  if (CGRectIsNull(*p_logoRect))
  {
    v8 = 0;
  }
  else
  {
    NSStringFromRect(*p_logoRect);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("logoRect"));

  objc_autoreleasePoolPop(v6);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (char *)v4;
    -[PKImage imageHash](self->_placeHolderImage, "imageHash");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v5 + 3), "imageHash");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
      v8 = CGRectEqualToRect(self->_logoRect, *(CGRect *)(v5 + 40));
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PKImage imageHash](self->_placeHolderImage, "imageHash");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)setPlaceHolderImage:(id)a3
{
  objc_storeStrong((id *)&self->_placeHolderImage, a3);
}

- (void)setPlaceHolderImageAverageColor:(id)a3
{
  objc_storeStrong((id *)&self->_placeHolderImageAverageColor, a3);
}

- (CGRect)logoRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_logoRect.origin.x;
  y = self->_logoRect.origin.y;
  width = self->_logoRect.size.width;
  height = self->_logoRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setLogoRect:(CGRect)a3
{
  self->_logoRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeHolderImageAverageColor, 0);
  objc_storeStrong((id *)&self->_placeHolderImage, 0);
}

@end
