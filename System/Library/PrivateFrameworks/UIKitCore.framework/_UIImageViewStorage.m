@implementation _UIImageViewStorage

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  return -[_UIImageViewStorage preferredSymbolConfiguration](self->_storage, "preferredSymbolConfiguration");
}

- (void)setResolvedImage:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UIImageViewStorage resolvedImage](self, "resolvedImage");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[_UIImageViewStorage simpleStorage](self, "simpleStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setResolvedImage:", v6);

  }
}

- (id)simpleStorage
{
  _UIImageViewStorage **p_storage;
  _UIImageViewStorage *v3;
  _UIImageViewStorage *v4;

  p_storage = &self->_storage;
  v3 = self->_storage;
  if (!*p_storage)
  {
    v4 = (_UIImageViewStorage *)objc_opt_new();

    objc_storeStrong((id *)p_storage, v4);
    v3 = v4;
  }
  return v3;
}

- (UIImage)resolvedImage
{
  return -[_UIImageViewStorage resolvedImage](self->_storage, "resolvedImage");
}

- (UIImage)image
{
  return -[_UIImageViewStorage image](self->_storage, "image");
}

- (int64_t)defaultRenderingMode
{
  return -[_UIImageViewStorage defaultRenderingMode](self->_storage, "defaultRenderingMode");
}

- (void)setResolvedHighlightedImage:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UIImageViewStorage resolvedHighlightedImage](self, "resolvedHighlightedImage");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[_UIImageViewStorage extendedStorage](self, "extendedStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setResolvedHighlightedImage:", v6);

  }
}

- (BOOL)isHighlighted
{
  return -[_UIImageViewStorage isHighlighted](self->_storage, "isHighlighted");
}

- (UIImage)imageBeingSetByLoader
{
  return -[_UIImageViewStorage imageBeingSetByLoader](self->_storage, "imageBeingSetByLoader");
}

- (NSMapTable)layouts
{
  return -[_UIImageViewStorage layouts](self->_storage, "layouts");
}

- (UIImage)highlightedImage
{
  return -[_UIImageViewStorage highlightedImage](self->_storage, "highlightedImage");
}

- (UIImage)resolvedHighlightedImage
{
  return -[_UIImageViewStorage resolvedHighlightedImage](self->_storage, "resolvedHighlightedImage");
}

- (NSArray)animationImages
{
  return -[_UIImageViewStorage animationImages](self->_storage, "animationImages");
}

- (NSArray)highlightedAnimationImages
{
  return -[_UIImageViewStorage highlightedAnimationImages](self->_storage, "highlightedAnimationImages");
}

- (BOOL)adjustsImageSizeForAccessibilityContentSizeCategory
{
  return -[_UIImageViewStorage adjustsImageSizeForAccessibilityContentSizeCategory](self->_storage, "adjustsImageSizeForAccessibilityContentSizeCategory");
}

- (UIView)placeholderView
{
  return -[_UIImageViewStorage placeholderView](self->_storage, "placeholderView");
}

- (void)setLayouts:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UIImageViewStorage layouts](self, "layouts");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[_UIImageViewStorage simpleStorage](self, "simpleStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLayouts:", v6);

  }
}

- (unsigned)drawMode
{
  return -[_UIImageViewStorage drawMode](self->_storage, "drawMode");
}

- (UILayoutGuide)imageContentGuide
{
  return -[_UIImageViewStorage imageContentGuide](self->_storage, "imageContentGuide");
}

- (BOOL)masksTemplateImages
{
  return -[_UIImageViewStorage masksTemplateImages](self->_storage, "masksTemplateImages");
}

- (void)setDrawMode:(unsigned int)a3
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)&a3;
  if (-[_UIImageViewStorage drawMode](self, "drawMode") != a3)
  {
    -[_UIImageViewStorage extendedStorage](self, "extendedStorage");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDrawMode:", v3);

  }
}

- (_UIImageLoader)imageLoader
{
  return -[_UIImageViewStorage imageLoader](self->_storage, "imageLoader");
}

- (void)setCIRenderer:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UIImageViewStorage CIRenderer](self, "CIRenderer");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[_UIImageViewStorage extendedStorage](self, "extendedStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCIRenderer:", v6);

  }
}

- (_UIImageCIImageRenderer)CIRenderer
{
  return -[_UIImageViewStorage CIRenderer](self->_storage, "CIRenderer");
}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UIImageViewStorage image](self, "image");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[_UIImageViewStorage simpleStorage](self, "simpleStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v6);

  }
}

- (void)setHighlightedImage:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UIImageViewStorage highlightedImage](self, "highlightedImage");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[_UIImageViewStorage extendedStorage](self, "extendedStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHighlightedImage:", v6);

  }
}

- (void)setHighlightedAnimationImages:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UIImageViewStorage highlightedAnimationImages](self, "highlightedAnimationImages");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[_UIImageViewStorage extendedStorage](self, "extendedStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHighlightedAnimationImages:", v6);

  }
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[_UIImageViewStorage isHighlighted](self, "isHighlighted") != a3)
  {
    -[_UIImageViewStorage extendedStorage](self, "extendedStorage");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHighlighted:", v3);

  }
}

- (void)setAdjustsImageSizeForAccessibilityContentSizeCategory:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[_UIImageViewStorage adjustsImageSizeForAccessibilityContentSizeCategory](self, "adjustsImageSizeForAccessibilityContentSizeCategory") != a3)
  {
    -[_UIImageViewStorage extendedStorage](self, "extendedStorage");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAdjustsImageSizeForAccessibilityContentSizeCategory:", v3);

  }
}

- (void)setDefaultRenderingMode:(int64_t)a3
{
  id v5;

  if (-[_UIImageViewStorage defaultRenderingMode](self, "defaultRenderingMode") != a3)
  {
    -[_UIImageViewStorage extendedStorage](self, "extendedStorage");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDefaultRenderingMode:", a3);

  }
}

- (void)setPreferredSymbolConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UIImageViewStorage preferredSymbolConfiguration](self, "preferredSymbolConfiguration");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[_UIImageViewStorage extendedStorage](self, "extendedStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPreferredSymbolConfiguration:", v6);

  }
}

- (id)extendedStorage
{
  id *p_storage;
  _UIImageViewStorage *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _UIImageViewStorage *v8;

  p_storage = (id *)&self->_storage;
  v4 = self->_storage;
  if (!*p_storage)
  {
    v8 = (_UIImageViewStorage *)objc_opt_new();
    goto LABEL_5;
  }
  v5 = objc_opt_class();
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((void *)v5 == v6)
  {
    -[_UIImageViewStorage simpleStorage](self, "simpleStorage");
    v7 = objc_claimAutoreleasedReturnValue();
    +[_UIImageViewExtendedStorage storageFromSimpleStorage:](_UIImageViewExtendedStorage, "storageFromSimpleStorage:", v7);
    v8 = (_UIImageViewStorage *)objc_claimAutoreleasedReturnValue();

    v4 = (_UIImageViewStorage *)v7;
LABEL_5:

    objc_storeStrong(p_storage, v8);
    v4 = v8;
  }
  return v4;
}

- (void)setOverridingSymbolConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UIImageViewStorage overridingSymbolConfiguration](self, "overridingSymbolConfiguration");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[_UIImageViewStorage extendedStorage](self, "extendedStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOverridingSymbolConfiguration:", v6);

  }
}

- (UIImageSymbolConfiguration)overridingSymbolConfiguration
{
  return -[_UIImageViewStorage overridingSymbolConfiguration](self->_storage, "overridingSymbolConfiguration");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_destroyWeak((id *)&self->_imageView);
}

- (void)setAnimationDuration:(double)a3
{
  double v5;
  id v6;

  -[_UIImageViewStorage animationDuration](self, "animationDuration");
  if (v5 != a3)
  {
    -[_UIImageViewStorage extendedStorage](self, "extendedStorage");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAnimationDuration:", a3);

  }
}

- (double)animationDuration
{
  double result;

  -[_UIImageViewStorage animationDuration](self->_storage, "animationDuration");
  return result;
}

- (void)setAnimationImages:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UIImageViewStorage animationImages](self, "animationImages");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[_UIImageViewStorage extendedStorage](self, "extendedStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAnimationImages:", v6);

  }
}

+ (id)storageForImageView:(id)a3
{
  id v3;
  id *v4;

  v3 = a3;
  v4 = (id *)objc_opt_new();
  objc_storeWeak(v4 + 1, v3);

  return v4;
}

- (void)setAnimationRepeatCount:(int64_t)a3
{
  id v5;

  if (-[_UIImageViewStorage animationRepeatCount](self, "animationRepeatCount") != a3)
  {
    -[_UIImageViewStorage extendedStorage](self, "extendedStorage");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAnimationRepeatCount:", a3);

  }
}

- (int64_t)animationRepeatCount
{
  return -[_UIImageViewStorage animationRepeatCount](self->_storage, "animationRepeatCount");
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id WeakRetained;

  if (-[_UIImageViewStorage animationRepeatCount](self, "animationRepeatCount", a3, a4) >= 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_imageView);
    objc_msgSend(WeakRetained, "_cleanUpForStopAnimating");

  }
}

- (_UIImageSymbolVariant)preferredSymbolVariant
{
  return -[_UIImageViewStorage preferredSymbolVariant](self->_storage, "preferredSymbolVariant");
}

- (void)setPreferredSymbolVariant:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UIImageViewStorage preferredSymbolVariant](self, "preferredSymbolVariant");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[_UIImageViewStorage extendedStorage](self, "extendedStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPreferredSymbolVariant:", v6);

  }
}

- (void)setImageContentGuide:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UIImageViewStorage imageContentGuide](self, "imageContentGuide");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[_UIImageViewStorage extendedStorage](self, "extendedStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImageContentGuide:", v6);

  }
}

- (void)setImageLoader:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UIImageViewStorage imageLoader](self, "imageLoader");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[_UIImageViewStorage extendedStorage](self, "extendedStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImageLoader:", v6);

  }
}

- (_UIImageViewLoadingDelegate)loadingDelegate
{
  return -[_UIImageViewStorage loadingDelegate](self->_storage, "loadingDelegate");
}

- (void)setLoadingDelegate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UIImageViewStorage loadingDelegate](self, "loadingDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[_UIImageViewStorage extendedStorage](self, "extendedStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLoadingDelegate:", v6);

  }
}

- (void)setImageBeingSetByLoader:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UIImageViewStorage imageBeingSetByLoader](self, "imageBeingSetByLoader");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[_UIImageViewStorage extendedStorage](self, "extendedStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImageBeingSetByLoader:", v6);

  }
}

- (void)setPlaceholderView:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UIImageViewStorage placeholderView](self, "placeholderView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
  {
    -[_UIImageViewStorage extendedStorage](self, "extendedStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPlaceholderView:", v6);

  }
}

- (void)setMasksTemplateImages:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[_UIImageViewStorage masksTemplateImages](self, "masksTemplateImages") != a3)
  {
    -[_UIImageViewStorage extendedStorage](self, "extendedStorage");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMasksTemplateImages:", v3);

  }
}

- (BOOL)isStartingLoad
{
  return -[_UIImageViewStorage isStartingLoad](self->_storage, "isStartingLoad");
}

- (void)setStartingLoad:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[_UIImageViewStorage isStartingLoad](self, "isStartingLoad") != a3)
  {
    -[_UIImageViewStorage extendedStorage](self, "extendedStorage");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStartingLoad:", v3);

  }
}

- (BOOL)isEnqueueingLoad
{
  return -[_UIImageViewStorage isEnqueueingLoad](self->_storage, "isEnqueueingLoad");
}

- (void)setEnqueueingLoad:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[_UIImageViewStorage isEnqueueingLoad](self, "isEnqueueingLoad") != a3)
  {
    -[_UIImageViewStorage extendedStorage](self, "extendedStorage");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEnqueueingLoad:", v3);

  }
}

- (BOOL)isStoppingLoad
{
  return -[_UIImageViewStorage isStoppingLoad](self->_storage, "isStoppingLoad");
}

- (void)setStoppingLoad:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[_UIImageViewStorage isStoppingLoad](self, "isStoppingLoad") != a3)
  {
    -[_UIImageViewStorage extendedStorage](self, "extendedStorage");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStoppingLoad:", v3);

  }
}

@end
