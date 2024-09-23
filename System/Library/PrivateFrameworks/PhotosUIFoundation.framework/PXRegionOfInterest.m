@implementation PXRegionOfInterest

- (PXRegionOfInterest)initWithRect:(CGRect)a3 inCoordinateSpace:(id)a4
{
  PXRegionOfInterest *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXRegionOfInterest;
  result = -[PXDisplayRect initWithRect:inCoordinateSpace:](&v5, sel_initWithRect_inCoordinateSpace_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_imageContentsRect.origin = (CGPoint)PXRectUnit;
    result->_imageContentsRect.size = (CGSize)unk_24438BAA0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXRegionOfInterest;
  v4 = -[PXDisplayRect copyWithZone:](&v6, sel_copyWithZone_, a3);
  -[PXRegionOfInterest _copyPropertiesTo:](self, "_copyPropertiesTo:", v4);
  return v4;
}

- (CGRect)uncroppedImageFrameInCoordinateSpace:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  NSObject *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  CGRect v30;
  CGRect result;

  v29 = *MEMORY[0x24BDAC8D0];
  -[PXDisplayRect rectInCoordinateSpace:](self, "rectInCoordinateSpace:", a3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PXRegionOfInterest imageContentsRect](self, "imageContentsRect");
  v15 = v14;
  v17 = v16;
  v18 = v12;
  v19 = v13;
  if (v12 == 0.0
    || v13 == 0.0
    || (v12 == INFINITY ? (v20 = v13 == INFINITY) : (v20 = 0),
        v20 || !CGFloatIsValid() || (CGFloatIsValid() & 1) == 0))
  {
    PXAssertGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v30.origin.x = v15;
      v30.origin.y = v17;
      v30.size.width = v18;
      v30.size.height = v19;
      NSStringFromCGRect(v30);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138412290;
      v28 = v26;
      _os_log_error_impl(&dword_24430E000, v21, OS_LOG_TYPE_ERROR, "Contents rect size is invalid %@", (uint8_t *)&v27, 0xCu);

    }
    v18 = 1.0;
    v15 = 0.0;
    v17 = 0.0;
    v19 = 1.0;
  }
  v22 = v9 / v18;
  v23 = v11 / v19;
  v24 = v5 - v9 / v18 * v15;
  v25 = v7 - v11 / v19 * v17;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (PXAnonymousView)trackingContainerView
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;

  -[PXRegionOfInterest trackingContainerViewFactory](self, "trackingContainerViewFactory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PXRegionOfInterest trackingContainerViewFactory](self, "trackingContainerViewFactory");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, PXRegionOfInterest *))v4)[2](v4, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (PXAnonymousView *)v5;
}

- (id)copyWithRect:(CGRect)a3 inCoordinateSpace:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRect:inCoordinateSpace:", v9, x, y, width, height);

  -[PXRegionOfInterest _copyPropertiesTo:](self, "_copyPropertiesTo:", v10);
  return v10;
}

- (void)_copyPropertiesTo:(id)a3
{
  CGSize size;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char *v14;

  objc_storeStrong((id *)a3 + 10, self->_imageRequester);
  v14 = (char *)a3;
  size = self->_imageContentsRect.size;
  *(CGPoint *)(v14 + 136) = self->_imageContentsRect.origin;
  *(CGSize *)(v14 + 152) = size;
  v6 = -[PXViewSpec copy](self->_imageViewSpec, "copy");
  v7 = (void *)*((_QWORD *)v14 + 11);
  *((_QWORD *)v14 + 11) = v6;

  objc_storeStrong((id *)v14 + 12, self->_title);
  objc_storeStrong((id *)v14 + 13, self->_subtitle);
  v8 = -[PXTitleSubtitleLabelSpec copy](self->_textViewSpec, "copy");
  v9 = (void *)*((_QWORD *)v14 + 14);
  *((_QWORD *)v14 + 14) = v8;

  v10 = _Block_copy(self->_placeholderViewFactory);
  v11 = (void *)*((_QWORD *)v14 + 15);
  *((_QWORD *)v14 + 15) = v10;

  v12 = _Block_copy(self->_trackingContainerViewFactory);
  v13 = (void *)*((_QWORD *)v14 + 16);
  *((_QWORD *)v14 + 16) = v12;

  v14[72] = self->_isRepresentingPlaceholderContent;
  objc_storeStrong((id *)v14 + 8, self->_scrollViews);

}

- (void)setContainingScrollViews:(id)a3
{
  id v4;
  NSPointerArray *v5;
  NSPointerArray *scrollViews;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
  v5 = (NSPointerArray *)objc_claimAutoreleasedReturnValue();
  scrollViews = self->_scrollViews;
  self->_scrollViews = v5;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[NSPointerArray addPointer:](self->_scrollViews, "addPointer:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (NSArray)containingScrollViews
{
  return -[NSPointerArray allObjects](self->_scrollViews, "allObjects");
}

- (PXRegionOfInterestImage)imageRequester
{
  return self->_imageRequester;
}

- (void)setImageRequester:(id)a3
{
  objc_storeStrong((id *)&self->_imageRequester, a3);
}

- (CGRect)imageContentsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_imageContentsRect.origin.x;
  y = self->_imageContentsRect.origin.y;
  width = self->_imageContentsRect.size.width;
  height = self->_imageContentsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setImageContentsRect:(CGRect)a3
{
  self->_imageContentsRect = a3;
}

- (PXViewSpec)imageViewSpec
{
  return self->_imageViewSpec;
}

- (void)setImageViewSpec:(id)a3
{
  objc_storeStrong((id *)&self->_imageViewSpec, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (PXTitleSubtitleLabelSpec)textViewSpec
{
  return self->_textViewSpec;
}

- (void)setTextViewSpec:(id)a3
{
  objc_storeStrong((id *)&self->_textViewSpec, a3);
}

- (id)placeholderViewFactory
{
  return self->_placeholderViewFactory;
}

- (void)setPlaceholderViewFactory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)trackingContainerViewFactory
{
  return self->_trackingContainerViewFactory;
}

- (void)setTrackingContainerViewFactory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)isRepresentingPlaceholderContent
{
  return self->_isRepresentingPlaceholderContent;
}

- (void)setIsRepresentingPlaceholderContent:(BOOL)a3
{
  self->_isRepresentingPlaceholderContent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_trackingContainerViewFactory, 0);
  objc_storeStrong(&self->_placeholderViewFactory, 0);
  objc_storeStrong((id *)&self->_textViewSpec, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_imageViewSpec, 0);
  objc_storeStrong((id *)&self->_imageRequester, 0);
  objc_storeStrong((id *)&self->_scrollViews, 0);
}

+ (CGRect)convertedImageContentsRectOfRegionOfInterest:(id)a3 toCoordinateSpace:(id)a4 fittingSize:(CGSize)a5 flipped:(BOOL)a6
{
  _BOOL4 v6;
  double height;
  double width;
  id v10;
  id v11;
  double x;
  double y;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect result;
  CGRect v24;

  v6 = a6;
  height = a5.height;
  width = a5.width;
  v10 = a3;
  v11 = a4;
  if (v10)
  {
    objc_msgSend(v10, "imageContentsRect");
    x = v22.origin.x;
    y = v22.origin.y;
    v14 = v22.size.width;
    v15 = v22.size.height;
    v24.origin.x = 0.0;
    v24.origin.y = 0.0;
    v24.size.width = 1.0;
    v24.size.height = 1.0;
    if (CGRectEqualToRect(v22, v24))
    {
      objc_msgSend(v10, "rectInCoordinateSpace:", v11);
      v15 = 0.0;
      PFSizeWithAspectRatioFittingSize();
      x = width * 0.5 + 0.0 + v16 * -0.5;
      v14 = 0.0;
      if (width != 0.0)
      {
        x = x / width;
        v14 = v16 / width;
      }
      y = height * 0.5 + 0.0 + v17 * -0.5;
      if (height != 0.0)
      {
        y = y / height;
        v15 = v17 / height;
      }
    }
    if (v6)
      y = 1.0 - (y + v15);
  }
  else
  {
    y = 0.0;
    v15 = 1.0;
    v14 = 1.0;
    x = 0.0;
  }

  v18 = x;
  v19 = y;
  v20 = v14;
  v21 = v15;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

@end
