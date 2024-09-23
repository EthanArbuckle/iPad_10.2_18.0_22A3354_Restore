@implementation PXPlacesPopoverImageFactory

- (PXPlacesPopoverImageFactory)init
{
  PXPlacesPopoverImageFactory *v2;
  NSCache *v3;
  NSCache *cachedBackgroundImages;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXPlacesPopoverImageFactory;
  v2 = -[PXPlacesPopoverImageFactory init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    cachedBackgroundImages = v2->_cachedBackgroundImages;
    v2->_cachedBackgroundImages = v3;

  }
  return v2;
}

- (id)createPopoverImageForGeotaggable:(id)a3 withImage:(CGImage *)a4 imageType:(int64_t)a5 imageOptions:(unint64_t)a6 usingTraitCollection:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGImage *v29;
  id v30;
  void *v31;
  CGContext *CurrentContext;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  id v43;
  CGColor *v44;
  double v45;
  CGContext *v46;
  const CGPath *v47;
  CGGradient *v48;
  CGContext *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  double v55;
  double v56;
  CGSize v57;
  CGSize v58;
  CGPoint v59;
  CGPoint v60;
  CGRect v61;

  v12 = a3;
  v13 = a7;
  if (a6 == 1)
  {
    -[PXPlacesPopoverImageFactory _thumbnailShadowForType:usingTraitCollection:](self, "_thumbnailShadowForType:usingTraitCollection:", a5, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  v15 = 0;
  v16 = 65.0;
  v17 = 65.0;
  if (a5 != 1 && a5 != 4)
  {
    -[PXPlacesPopoverImageFactory backgroundImageNameForType:usingTraitCollection:](self, "backgroundImageNameForType:usingTraitCollection:", a5, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPlacesPopoverImageFactory _fetchAndCacheBackgroundImageWithName:](self, "_fetchAndCacheBackgroundImageWithName:", v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "size");
    v17 = v19;
    objc_msgSend(v15, "size");
    v16 = v20;

  }
  if (v14)
    objc_msgSend(v14, "shadowBlurRadius");
  else
    v21 = 0.0;
  v57.height = v16 + v21;
  v57.width = v17;
  UIGraphicsBeginImageContextWithOptions(v57, 0, 0.0);
  -[PXPlacesPopoverImageFactory thumbnailTopMarginForImageType:usingTraitCollection:](self, "thumbnailTopMarginForImageType:usingTraitCollection:", a5, v13);
  v56 = v22;
  -[PXPlacesPopoverImageFactory thumbnailImageSizeForImageType:usingTraitCollection:includeScale:](self, "thumbnailImageSizeForImageType:usingTraitCollection:includeScale:", a5, v13, 0);
  v24 = v23;
  v26 = v25;
  v27 = v17 * 0.5;
  v28 = v23 * 0.5;
  v29 = -[PXPlacesPopoverImageFactory newImage:croppedToAspectRatio:](self, "newImage:croppedToAspectRatio:", a4, v23);
  v30 = objc_alloc(MEMORY[0x1E0DC3870]);
  objc_msgSend(v13, "displayScale");
  v31 = (void *)objc_msgSend(v30, "initWithCGImage:scale:orientation:", v29, 0);
  CGImageRelease(v29);
  if (v14)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    objc_msgSend(v14, "shadowOffset");
    v34 = v33;
    v55 = v24;
    v35 = v17 * 0.5;
    v36 = v26;
    v37 = v17;
    v38 = v16;
    v40 = v39;
    objc_msgSend(v14, "shadowBlurRadius");
    v42 = v41;
    objc_msgSend(v14, "shadowColor");
    v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v44 = (CGColor *)objc_msgSend(v43, "CGColor");
    v58.width = v34;
    v58.height = v40;
    v16 = v38;
    v17 = v37;
    v26 = v36;
    v27 = v35;
    v24 = v55;
    CGContextSetShadowWithColor(CurrentContext, v58, v42, v44);

  }
  v45 = v27 - v28;
  if (v15)
  {
    if (a5 == 3)
    {
      v46 = UIGraphicsGetCurrentContext();
      CGContextSaveGState(v46);
      v61.origin.x = v27 - v28;
      v61.origin.y = v56;
      v61.size.width = v24;
      v61.size.height = v26;
      v47 = CGPathCreateWithRoundedRect(v61, 10.0, 10.0, 0);
      CGContextAddPath(v46, v47);
      CGContextClip(v46);
      CGPathRelease(v47);
      objc_msgSend(v31, "drawInRect:", v45, v56, v24, v26);
      v48 = -[PXPlacesPopoverImageFactory createLegibilityGradient](self, "createLegibilityGradient");
      v59.y = v56 + v26;
      v59.x = v27 - v28;
      v60.x = v27 - v28;
      v60.y = v56;
      CGContextDrawLinearGradient(v46, v48, v59, v60, 0);
      CGGradientRelease(v48);
      CGContextRestoreGState(v46);
    }
    else
    {
      objc_msgSend(v31, "drawInRect:", v27 - v28, v56, v24, v26);
    }
    objc_msgSend(v15, "drawInRect:", 0.0, 0.0, v17, v16);
  }
  else
  {
    v49 = UIGraphicsGetCurrentContext();
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v17, v16, 6.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(v49, (CGColorRef)objc_msgSend(v51, "CGColor"));

    objc_msgSend(v50, "fill");
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", v27 - v28, v56, v24, v26, 6.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "addClip");

    objc_msgSend(v31, "drawInRect:", v45, v56, v24, v26);
  }
  UIGraphicsGetImageFromCurrentImageContext();
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v53;
}

- (id)createAlbumPlaceHolderImageUsingTraitCollection:(id)a3
{
  void *v4;
  void *v5;

  -[PXPlacesPopoverImageFactory backgroundImageNameForType:usingTraitCollection:](self, "backgroundImageNameForType:usingTraitCollection:", 0, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlacesPopoverImageFactory _fetchAndCacheBackgroundImageWithName:](self, "_fetchAndCacheBackgroundImageWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)placeholderImageForImageType:(int64_t)a3 usingTraitCollection:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGContext *CurrentContext;
  CGContext *v30;
  void *v31;
  id v32;
  void *v33;
  CGSize v35;
  CGRect v36;
  CGRect v37;

  v6 = a4;
  -[PXPlacesPopoverImageFactory defaultBackgroundColor](self, "defaultBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traitCollectionForMapKit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "traitCollectionForMapKit");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resolvedColorWithTraitCollection:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "traitCollectionForMapKit");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resolvedColorWithTraitCollection:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v13;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PXPlacesPlaceholderImage-%@-%@"), v8, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlacesPopoverImageFactory cachedBackgroundImages](self, "cachedBackgroundImages");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = v16;
  }
  else
  {
    -[PXPlacesPopoverImageFactory thumbnailImageSizeForImageType:usingTraitCollection:includeScale:](self, "thumbnailImageSizeForImageType:usingTraitCollection:includeScale:", a3, v6, 0);
    v19 = v18;
    v21 = v20;
    -[PXPlacesPopoverImageFactory imageNamed:](self, "imageNamed:", CFSTR("PXAssetsSceneBadgeInCloud"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "size");
    v24 = v23;
    v26 = v25;
    v27 = v19 - v23 + -5.0;
    v28 = v21 - v25 + -5.0;
    v35.width = v19;
    v35.height = v21;
    UIGraphicsBeginImageContextWithOptions(v35, 0, 0.0);
    if (v8)
    {
      objc_msgSend(v8, "setFill");
      CurrentContext = UIGraphicsGetCurrentContext();
      v36.origin.x = 0.0;
      v36.origin.y = 0.0;
      v36.size.width = v19;
      v36.size.height = v21;
      CGContextFillRect(CurrentContext, v36);
    }
    objc_msgSend(v7, "setFill");
    v30 = UIGraphicsGetCurrentContext();
    v37.origin.x = 0.0;
    v37.origin.y = 0.0;
    v37.size.width = v19;
    v37.size.height = v21;
    CGContextFillRect(v30, v37);
    objc_msgSend(v22, "drawInRect:", v27, v28, v24, v26);
    UIGraphicsGetImageFromCurrentImageContext();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
    v32 = objc_retainAutorelease(v31);
    -[PXPlacesPopoverImageFactory createPopoverImageForGeotaggable:withImage:imageType:imageOptions:usingTraitCollection:](self, "createPopoverImageForGeotaggable:withImage:imageType:imageOptions:usingTraitCollection:", 0, objc_msgSend(v32, "CGImage"), a3, 0, v6);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    -[PXPlacesPopoverImageFactory cachedBackgroundImages](self, "cachedBackgroundImages");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKey:", v17, v14);

  }
  return v17;
}

- (UIColor)defaultBackgroundColor
{
  UIColor *defaultBackgroundColor;
  UIColor *v4;
  UIColor *v5;

  defaultBackgroundColor = self->_defaultBackgroundColor;
  if (!defaultBackgroundColor)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.941176474, 0.941176474, 0.941176474, 1.0);
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v5 = self->_defaultBackgroundColor;
    self->_defaultBackgroundColor = v4;

    defaultBackgroundColor = self->_defaultBackgroundColor;
  }
  return defaultBackgroundColor;
}

- (CGSize)backgroundImageSizeForType:(int64_t)a3 usingTraitCollection:(id)a4
{
  int64_t v4;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v4 = a3;
  if (a3 == 1)
    a3 = 0;
  -[PXPlacesPopoverImageFactory backgroundImageNameForType:usingTraitCollection:](self, "backgroundImageNameForType:usingTraitCollection:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlacesPopoverImageFactory _fetchAndCacheBackgroundImageWithName:](self, "_fetchAndCacheBackgroundImageWithName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "size");
  v10 = v8;
  if (v4 == 1)
    v11 = v8;
  else
    v11 = v9;

  v12 = v10;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (id)_thumbnailShadowForType:(int64_t)a3 usingTraitCollection:(id)a4
{
  id v4;
  void *v5;
  void *v6;

  if (a3 == 5)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC1298]);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorWithAlphaComponent:", 0.2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShadowColor:", v6);

    objc_msgSend(v4, "setShadowBlurRadius:", 4.0);
    objc_msgSend(v4, "setShadowOffset:", 0.0, 2.0);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)backgroundImageNameForType:(int64_t)a3 usingTraitCollection:(id)a4
{
  id v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a4;
  v6 = v5;
  v7 = 0;
  switch(a3)
  {
    case 0:
      v8 = objc_msgSend(v5, "userInterfaceIdiom");
      v9 = objc_msgSend(v6, "layoutSizeSubclass");
      v7 = 0;
      switch(v8)
      {
        case 0:
        case 2:
          v7 = CFSTR("PXPlacesAlbumCover-iPad");
          break;
        case 1:
          if ((unint64_t)(v9 - 1) >= 3)
            v7 = 0;
          else
            v7 = off_1E51254F0[v9 - 1];
          break;
        case 4:
          v7 = CFSTR("PXPlacesAlbumCover-OSX");
          break;
        default:
          goto LABEL_7;
      }
      break;
    case 2:
    case 4:
      v7 = CFSTR("PXPlacesThumbnailPopover");
      break;
    case 3:
      v7 = CFSTR("PXPlacesThumbnail2024");
      break;
    case 5:
      v7 = CFSTR("PXPlacesThumbnailPopoverInfoPanel");
      break;
    default:
      break;
  }
LABEL_7:

  return (id)v7;
}

- (double)thumbnailTopMarginForImageType:(int64_t)a3 usingTraitCollection:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  double result;

  v5 = a4;
  v6 = objc_msgSend(v5, "userInterfaceIdiom");
  v7 = objc_msgSend(v5, "layoutSizeSubclass");

  result = 3.0;
  switch(a3)
  {
    case 0:
      if (v6 == 4)
        goto LABEL_9;
      if (v6 == 2)
      {
        result = 39.0;
      }
      else
      {
        if (v6 != 1 || (unint64_t)(v7 - 1) >= 3)
          goto LABEL_8;
        result = dbl_1A7C09798[v7 - 1];
      }
      break;
    case 1:
    case 4:
      result = 2.5;
      break;
    case 2:
LABEL_9:
      result = 4.0;
      break;
    case 3:
      result = 5.0;
      break;
    case 5:
      return result;
    default:
LABEL_8:
      result = 0.0;
      break;
  }
  return result;
}

- (CGSize)thumbnailImageSizeForImageType:(int64_t)a3 usingTraitCollection:(id)a4 includeScale:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  double v8;
  double v9;
  int64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  v5 = a5;
  v7 = a4;
  objc_msgSend(v7, "displayScale");
  v9 = v8;
  v10 = a3 - 1;
  if ((unint64_t)(a3 - 1) >= 5)
  {
    v12 = *MEMORY[0x1E0C9D820];
    v11 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v13 = objc_msgSend(v7, "userInterfaceIdiom");
    v14 = objc_msgSend(v7, "layoutSizeSubclass");
    switch(v13)
    {
      case 0:
      case 2:
      case 4:
        v11 = 74.0;
        goto LABEL_5;
      case 1:
        if ((unint64_t)(v14 - 1) < 3)
        {
          v11 = dbl_1A7C09800[v14 - 1];
LABEL_5:
          v12 = v11;
        }
        break;
      default:
        break;
    }
  }
  else
  {
    v11 = dbl_1A7C097B0[v10];
    v12 = dbl_1A7C097D8[v10];
  }
  v15 = 1.0;
  if (v5)
    v15 = v9;
  v16 = v15 * v11;
  v17 = v15 * v12;

  v18 = v17;
  v19 = v16;
  result.height = v19;
  result.width = v18;
  return result;
}

- (CGImage)newImage:(CGImage *)a3 croppedToAspectRatio:(CGSize)a4
{
  double height;
  double width;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  height = a4.height;
  width = a4.width;
  v7 = (double)CGImageGetWidth(a3);
  v8 = (double)CGImageGetHeight(a3);
  v9 = width / height;
  if (v7 / v8 >= width / height)
  {
    v11 = 0.0;
    if (v7 / v8 <= width / height)
    {
      v12 = 0.0;
    }
    else
    {
      v13 = v9 * v8;
      v12 = (v7 - v9 * v8) * 0.5;
      v7 = v13;
    }
  }
  else
  {
    v10 = v7 / v9;
    v11 = (v8 - v7 / v9) * 0.5;
    v12 = 0.0;
    v8 = v10;
  }
  v14 = v7;
  return CGImageCreateWithImageInRect(a3, *(CGRect *)(&v8 - 3));
}

- (CGGradient)createLegibilityGradient
{
  void *v2;
  void *v3;
  id v4;
  const __CFArray *v5;
  void *v6;
  const CGFloat *v7;
  unint64_t v8;
  void *v9;
  CGFloat v10;
  CGGradient *v11;
  uint64_t v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlackColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E50B2F48, "opacityValuesForSmoothDescendingGradient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v4 = v2;
  v14 = v4;
  v5 = (const __CFArray *)PXMap();

  objc_msgSend(off_1E50B2F48, "stopLocationsForSmoothDescendingGradient", v13, 3221225472, __55__PXPlacesPopoverImageFactory_createLegibilityGradient__block_invoke, &unk_1E51254B0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (const CGFloat *)((char *)&v13 - ((8 * objc_msgSend(v6, "count") + 15) & 0xFFFFFFFFFFFFFFF0));
  if (objc_msgSend(v6, "count"))
  {
    v8 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      v7[v8] = v10;

      ++v8;
    }
    while (v8 < objc_msgSend(v6, "count"));
  }
  v11 = CGGradientCreateWithColors(0, v5, v7);

  return v11;
}

- (id)_fetchAndCacheBackgroundImageWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[PXPlacesPopoverImageFactory cachedBackgroundImages](self, "cachedBackgroundImages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[PXPlacesPopoverImageFactory imageNamed:](self, "imageNamed:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[PXPlacesPopoverImageFactory cachedBackgroundImages](self, "cachedBackgroundImages");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v8, v4);

      v6 = v8;
    }
  }
  v10 = v6;

  return v10;
}

- (id)imageNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXPlacesPopoverImageFactory _placesKitFrameworkBundle](self, "_placesKitFrameworkBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_placesKitFrameworkBundle
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PXPlacesPopoverImageFactory__placesKitFrameworkBundle__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  if (_placesKitFrameworkBundle_onceToken != -1)
    dispatch_once(&_placesKitFrameworkBundle_onceToken, block);
  return (id)_placesKitFrameworkBundle_frameworkBundle;
}

- (NSCache)cachedBackgroundImages
{
  return self->_cachedBackgroundImages;
}

- (void)setCachedBackgroundImages:(id)a3
{
  objc_storeStrong((id *)&self->_cachedBackgroundImages, a3);
}

- (void)setDefaultBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_defaultBackgroundColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultBackgroundColor, 0);
  objc_storeStrong((id *)&self->_cachedBackgroundImages, 0);
}

void __56__PXPlacesPopoverImageFactory__placesKitFrameworkBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_placesKitFrameworkBundle_frameworkBundle;
  _placesKitFrameworkBundle_frameworkBundle = v0;

}

id __55__PXPlacesPopoverImageFactory_createLegibilityGradient__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  id v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "doubleValue");
  objc_msgSend(v2, "colorWithAlphaComponent:", v3 * 0.4);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "CGColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (CGSize)backgroundImageSizeForType:(int64_t)a3 usingTraitCollection:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v5 = a4;
  +[PXPlacesPopoverImageFactory sharedInstance](PXPlacesPopoverImageFactory, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "backgroundImageSizeForType:usingTraitCollection:", a3, v5);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

+ (PXPlacesPopoverImageFactory)sharedInstance
{
  if (sharedInstance_token != -1)
    dispatch_once(&sharedInstance_token, &__block_literal_global_95515);
  return (PXPlacesPopoverImageFactory *)(id)_sharedInstance;
}

void __45__PXPlacesPopoverImageFactory_sharedInstance__block_invoke()
{
  PXPlacesPopoverImageFactory *v0;
  void *v1;

  v0 = objc_alloc_init(PXPlacesPopoverImageFactory);
  v1 = (void *)_sharedInstance;
  _sharedInstance = (uint64_t)v0;

}

@end
