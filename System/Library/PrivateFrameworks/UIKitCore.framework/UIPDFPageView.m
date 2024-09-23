@implementation UIPDFPageView

- (UIPDFPageView)init
{
  UIPDFPageView *v2;
  UIPDFPageView *v3;
  UIPDFViewTouchHandler *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIPDFPageView;
  v2 = -[UIView init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_scalePageOnDraw = 1;
    v2->_animateSetFrame = 1;
    v4 = -[UIPDFViewTouchHandler initWithView:]([UIPDFViewTouchHandler alloc], "initWithView:", v2);
    v3->_touchHandler = v4;
    -[UIPDFViewTouchHandler enableRecognizers](v4, "enableRecognizers");
    v3->_searchHighlightController = -[UIPDFSearchHighlightsController initWithPageView:]([UIPDFSearchHighlightsController alloc], "initWithPageView:", v3);
    -[UIPDFPageView setAllowMenu:](v3, "setAllowMenu:", 1);
    v3->_margin = 0.0;
    v3->_delegate = 0;
    v3->_allowSelection = 1;
    v3->_allowTwoFingerSelection = 0;
    v3->_useBackingLayer = 0;
    v3->_highLightColor = 0;
    v3->_useTiledContent = 0;
    v3->_enableLightMemoryFootprint = 0;
    v3->_showActivityIndicator = 1;
    v3->_annotationController = 0;
    -[UIPDFPageView setShowAnnotations:](v3, "setShowAnnotations:", 0);
    -[UIPDFPageView setAllowHighlighting:](v3, "setAllowHighlighting:", 0);
    -[UIPDFPageView setShowTextAnnotations:](v3, "setShowTextAnnotations:", 0);
    -[UIPDFPageView setBackingLayerColor:](v3, "setBackingLayerColor:", +[UIColor lightGrayColor](UIColor, "lightGrayColor"));
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v3, sel_didReceiveMemoryWarning_, CFSTR("UIApplicationDidReceiveMemoryWarningNotification"), 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v3, sel_didScroll_, CFSTR("UITextSelectionDidScroll"), 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v3, sel_viewDidZoom_, CFSTR("UITextSelectionDidZoom"), 0);
  }
  return v3;
}

- (void)setBackingLayerColor:(id)a3
{
  id v5;

  v5 = a3;

  self->_backingLayerColor = (UIColor *)a3;
  -[UIActivityIndicatorView setActivityIndicatorViewStyle:](self->_activityIndicator, "setActivityIndicatorViewStyle:", UIActivityIndicatorViewStyleForBackingColor(a3));
}

- (void)addLayers:(BOOL)a3
{
  __objc2_class **v4;
  UIPDFPageContentDelegate *v5;

  v4 = off_1E167B148;
  if (!a3)
    v4 = off_1E167B140;
  self->_contentLayer = (CALayer *)objc_alloc_init(*v4);
  v5 = objc_alloc_init(UIPDFPageContentDelegate);
  self->_contentDelegate = v5;
  -[CALayer setDelegate:](self->_contentLayer, "setDelegate:", v5);
  -[UIPDFPageContentDelegate setOwner:](self->_contentDelegate, "setOwner:", self->_contentLayer);
  -[UIPDFPageContentDelegate setView:](self->_contentDelegate, "setView:", self);
  -[UIPDFPageContentDelegate setHighlightColor:](self->_contentDelegate, "setHighlightColor:", -[UIPDFPageView highLightColor](self, "highLightColor"));
}

- (UIPDFPageView)initWithPage:(id)a3
{
  UIPDFPageView *v4;

  if (a3)
  {
    v4 = -[UIPDFPageView init](self, "init");
    -[UIPDFPageView addLayers:](v4, "addLayers:", 1);
    -[UIPDFPageView addPage:](v4, "addPage:", a3);
  }
  else
  {

    return 0;
  }
  return v4;
}

- (UIPDFPageView)initWithPage:(id)a3 tiledContent:(BOOL)a4
{
  _BOOL8 v4;
  UIPDFPageView *v6;

  if (a3)
  {
    v4 = a4;
    v6 = -[UIPDFPageView init](self, "init");
    -[UIPDFPageView addLayers:](v6, "addLayers:", v4);
    -[UIPDFPageView addPage:](v6, "addPage:", a3);
  }
  else
  {

    return 0;
  }
  return v6;
}

- (UIPDFPageView)initWithPageLimitedMemory:(id)a3
{
  UIPDFPageView *v4;

  if (a3)
  {
    v4 = -[UIPDFPageView init](self, "init");
    -[UIPDFPageView addLayers:](v4, "addLayers:", 1);
    -[UIPDFPageView addPage:](v4, "addPage:", a3);
    -[UIPDFPageView enableLightMemoryFootprint](v4, "enableLightMemoryFootprint");
  }
  else
  {

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self->_selectionController);
  CGColorRelease(self->_highLightColor);
  -[UIPDFPage setPageImage:](-[UIPDFPageView page](self, "page"), "setPageImage:", 0);
  -[UIPDFPageView setBackgroundImage:](self, "setBackgroundImage:", 0);
  -[UIPDFPageView setBackingLayerColor:](self, "setBackingLayerColor:", 0);
  -[UIPDFPage clearAnnotations](self->_page, "clearAnnotations");
  -[UIPDFViewTouchHandler disableRecognizers](self->_touchHandler, "disableRecognizers");

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self->_activityIndicator);
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self->_selectionController);

  -[CALayer setDelegate:](self->_contentLayer, "setDelegate:", 0);
  -[CALayer setContents:](self->_contentLayer, "setContents:", 0);
  -[CALayer removeFromSuperlayer](self->_contentLayer, "removeFromSuperlayer");

  self->_contentLayer = 0;
  -[UIPDFPageContentDelegate setOwner:](self->_contentDelegate, "setOwner:", 0);
  -[UIPDFPageContentDelegate setView:](self->_contentDelegate, "setView:", 0);

  self->_contentDelegate = 0;
  -[UIPDFAnnotationController setView:](self->_annotationController, "setView:", 0);

  self->_annotationController = 0;
  self->_page = 0;

  self->_effectsLayer = 0;
  self->_document = 0;
  v3.receiver = self;
  v3.super_class = (Class)UIPDFPageView;
  -[UIView dealloc](&v3, sel_dealloc);
}

- (void)didReceiveMemoryWarning:(id)a3
{
  os_unfair_lock_s *p_lock;
  UIPDFPageContentDelegate *contentDelegate;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  contentDelegate = self->_contentDelegate;
  if (contentDelegate && !self->_enableLightMemoryFootprint)
    -[UIPDFPageContentDelegate setIsCancelled:](contentDelegate, "setIsCancelled:", 1);
  -[UIPDFPage refresh](self->_page, "refresh");
  os_unfair_lock_unlock(p_lock);
}

- (void)setDrawingSurfaceLayer:(id)a3
{
  -[UIPDFAnnotationController setDrawingSurface:](-[UIPDFPageView annotationController](self, "annotationController"), "setDrawingSurface:", a3);
}

- (UIPDFPage)page
{
  return self->_page;
}

- (unint64_t)pageIndex
{
  os_unfair_lock_s *p_lock;
  unint64_t pageIndex;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  pageIndex = self->_pageIndex;
  os_unfair_lock_unlock(p_lock);
  return pageIndex;
}

- (UIPDFDocument)document
{
  os_unfair_lock_s *p_lock;
  UIPDFDocument *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_document;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setSelectionNeedsDisplay
{
  -[CALayer setSelectionNeedsDisplay](self->_contentLayer, "setSelectionNeedsDisplay");
}

- (void)setNeedsDisplay
{
  NSMutableArray *highlights;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[CALayer setNeedsDisplay](self->_contentLayer, "setNeedsDisplay");
  -[UIPDFSearchHighlightsController setNeedsDisplay](self->_searchHighlightController, "setNeedsDisplay");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  highlights = self->_highlights;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](highlights, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(highlights);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "setNeedsDisplay");
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](highlights, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  -[UIPDFAnnotationController setNeedsDisplay](self->_annotationController, "setNeedsDisplay");
  v8.receiver = self;
  v8.super_class = (Class)UIPDFPageView;
  -[UIView setNeedsDisplay](&v8, sel_setNeedsDisplay);
}

- (void)willMoveToSuperview:(id)a3
{
  -[UIPDFSelectionController clearSelection](self->_selectionController, "clearSelection", a3);
}

- (UIImage)backgroundImage
{
  os_unfair_lock_s *p_lock;
  UIImage *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_backgroundImage;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setBackgroundImage:(id)a3
{
  os_unfair_lock_s *p_lock;
  UIImage *backgroundImage;
  id v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  backgroundImage = self->_backgroundImage;
  os_unfair_lock_unlock(p_lock);
  if (backgroundImage != a3)
  {
    -[UIPDFPageView willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("backgroundImage"));
    v7 = a3;
    os_unfair_lock_lock(p_lock);

    self->_backgroundImage = (UIImage *)a3;
    os_unfair_lock_unlock(p_lock);
    -[UIPDFPageView didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("backgroundImage"));
  }
}

- (void)scheduleBackgroundImage
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _BOOL4 backgroundIsScheduled;
  UIActivityIndicatorView *v10;
  double MidX;
  UIPDFPageImageCache *v12;
  unint64_t pageIndex;
  _BOOL4 backgroundIsFullResolution;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  BOOL v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  -[UIScreen scale](+[UIScreen mainScreen](UIScreen, "mainScreen"), "scale");
  v4 = v3;
  -[UIView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  os_unfair_lock_lock(&self->_lock);
  backgroundIsScheduled = self->_backgroundIsScheduled;
  self->_backgroundIsScheduled = 1;
  ++self->_backgroundScheduleCount;
  os_unfair_lock_unlock(&self->_lock);
  if (!backgroundIsScheduled && self->_showActivityIndicator)
  {
    if (!self->_activityIndicator)
    {
      v10 = -[UIActivityIndicatorView initWithActivityIndicatorStyle:]([UIActivityIndicatorView alloc], "initWithActivityIndicatorStyle:", UIActivityIndicatorViewStyleForBackingColor(-[UIPDFPageView backingLayerColor](self, "backingLayerColor")));
      self->_activityIndicator = v10;
      -[UIView addSubview:](self, "addSubview:", v10);
    }
    -[UIView bounds](self, "bounds");
    MidX = CGRectGetMidX(v28);
    -[UIView bounds](self, "bounds");
    -[UIView setCenter:](self->_activityIndicator, "setCenter:", MidX, CGRectGetMidY(v29));
    -[UIView bringSubviewToFront:](self, "bringSubviewToFront:", self->_activityIndicator);
    -[UIActivityIndicatorView performSelector:withObject:afterDelay:](self->_activityIndicator, "performSelector:withObject:afterDelay:", sel_startAnimating, 0, 0.5);
  }
  os_unfair_lock_lock(&self->_lock);
  v12 = -[UIPDFDocument pageImageCache](self->_document, "pageImageCache");
  pageIndex = self->_pageIndex;
  backgroundIsFullResolution = self->_backgroundIsFullResolution;
  v27 = self->_backgroundIsFullResolution;
  os_unfair_lock_unlock(&self->_lock);
  -[UIView frame](self, "frame");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[UIView bounds](-[UIView superview](self, "superview"), "bounds");
  v31.origin.x = v23;
  v31.origin.y = v24;
  v31.size.width = v25;
  v31.size.height = v26;
  v30.origin.x = v16;
  v30.origin.y = v18;
  v30.size.width = v20;
  v30.size.height = v22;
  if (CGRectIntersectsRect(v30, v31))
  {
    -[UIPDFPageImageCache deliverImageOfPage:maxSize:quality:receiver:selector:info:](v12, "deliverImageOfPage:maxSize:quality:receiver:selector:info:", pageIndex + 1, &v27, self, sel_receiveBackgroundImage_info_, 0, v4 * v6, v4 * v8);
    backgroundIsFullResolution = v27;
  }
  if (backgroundIsFullResolution)
  {
    os_unfair_lock_lock(&self->_lock);
    self->_backgroundIsFullResolution = 1;
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)didScroll:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "object");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && -[UIView isDescendantOfView:](self, "isDescendantOfView:", v4))
  {
    os_unfair_lock_lock(&self->_lock);
    if (self->_backgroundIsScheduled)
    {
      if (!self->_backgroundImage && !self->_backgroundIsFullResolution)
      {
        self->_backgroundIsFullResolution = 1;
        os_unfair_lock_unlock(&self->_lock);
        -[UIPDFPageView scheduleBackgroundImage](self, "scheduleBackgroundImage");
        return;
      }
    }
    else
    {
      self->_backgroundIsFullResolution = 1;
    }
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (void)viewDidZoom:(id)a3
{
  UIView *v4;
  CALayer *v5;
  double v6;

  v4 = -[UIView superview](self, "superview", a3);
  if (v4)
  {
    v5 = -[UIView layer](v4, "layer");
    if (v5)
    {
      -[CALayer transform](v5, "transform");
      self->_cachedScale = v6;
    }
  }
  -[UIPDFSearchHighlightsController setNeedsDisplay](self->_searchHighlightController, "setNeedsDisplay");
}

- (void)removeBackingLayer
{
  -[CALayer removeFromSuperlayer](self->_backingLayer, "removeFromSuperlayer");
}

- (id)createBackingLayer
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  objc_msgSend(v3, "setBackgroundColor:", -[UIColor CGColor](-[UIPDFPageView backingLayerColor](self, "backingLayerColor"), "CGColor"));
  objc_msgSend(v3, "setOpaque:", 1);
  -[UIView bounds](self, "bounds");
  objc_msgSend(v3, "setBounds:");
  -[CALayer position](self->_contentLayer, "position");
  objc_msgSend(v3, "setPosition:");
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;

  if (!-[UIPDFPageView document](self, "document"))
    return;
  if (self->_useBackingLayer)
  {
    if (!self->_backingLayer)
    {
      self->_backingLayer = (CALayer *)-[UIPDFPageView createBackingLayer](self, "createBackingLayer");
      -[CALayer addSublayer:](-[UIView layer](self, "layer"), "addSublayer:", self->_backingLayer);
    }
    if (-[UIPDFPageView backgroundImage](self, "backgroundImage") && !self->_boundsChanged)
      goto LABEL_13;
    if (!self->_backgroundIsScheduled)
      -[UIPDFPageView scheduleBackgroundImage](self, "scheduleBackgroundImage");
    -[CALayer position](self->_contentLayer, "position");
    v4 = v3;
    v6 = v5;
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[UIView bounds](self, "bounds");
    -[CALayer setBounds:](self->_backingLayer, "setBounds:");
    -[CALayer setPosition:](self->_backingLayer, "setPosition:", v4, v6);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    goto LABEL_12;
  }
  if (!-[CALayer superlayer](self->_contentLayer, "superlayer"))
  {
    -[CALayer addSublayer:](-[UIView layer](self, "layer"), "addSublayer:", self->_contentLayer);
    -[CALayer setNeedsDisplay](self->_contentLayer, "setNeedsDisplay");
LABEL_12:
    self->_boundsChanged = 0;
  }
LABEL_13:
  -[CALayer setNeedsLayout](self->_contentLayer, "setNeedsLayout");
  v7.receiver = self;
  v7.super_class = (Class)UIPDFPageView;
  -[UIView layoutSubviews](&v7, sel_layoutSubviews);
  +[UITextEffectsWindow sharedTextEffectsWindowAboveStatusBar](UITextEffectsWindow, "sharedTextEffectsWindowAboveStatusBar");
  if (-[UIPDFPageView showAnnotations](self, "showAnnotations")
    || -[UIPDFPageView allowHighlighting](self, "allowHighlighting"))
  {
    -[UIPDFAnnotationController layoutAnnotationViews:](self->_annotationController, "layoutAnnotationViews:", self);
  }
}

- (void)setShowActivityIndicator:(BOOL)a3
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self->_activityIndicator);
  -[UIActivityIndicatorView stopAnimating](self->_activityIndicator, "stopAnimating");
  self->_showActivityIndicator = a3;
}

- (void)stopActivityIndicator
{
  if (self->_activityIndicator)
  {
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:");
    -[UIActivityIndicatorView stopAnimating](self->_activityIndicator, "stopAnimating");
    -[UIView removeFromSuperview](self->_activityIndicator, "removeFromSuperview");

    self->_activityIndicator = 0;
  }
}

- (void)showContent
{
  NSMutableArray *highlights;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  UIImage *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  highlights = self->_highlights;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](highlights, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(highlights);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "unhide");
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](highlights, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  if (!-[CALayer superlayer](self->_contentLayer, "superlayer"))
  {
    -[CALayer insertSublayer:above:](-[UIView layer](self, "layer"), "insertSublayer:above:", self->_contentLayer, self->_backingLayer);
    -[CALayer setNeedsDisplay](self->_contentLayer, "setNeedsDisplay");
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("kUIPDFContentLayerAdded"), self);
  }
  os_unfair_lock_lock(&self->_lock);
  v8 = self->_backgroundImage;
  os_unfair_lock_unlock(&self->_lock);
  if (v8)
  {
    -[UIPDFPage setPageImage:](-[UIPDFPageView page](self, "page"), "setPageImage:", v8);

  }
  if (self->_delegate)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NSObject pageWasRendered:](self->_delegate, "pageWasRendered:", self);
  }
}

- (void)enableLightMemoryFootprint
{
  CALayer *contentLayer;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    contentLayer = self->_contentLayer;
    self->_enableLightMemoryFootprint = 1;
    -[CALayer setTileSize:](contentLayer, "setTileSize:", 512.0, 512.0);
    -[CALayer setLevelsOfDetail:](contentLayer, "setLevelsOfDetail:", 1);
    -[CALayer setLevelsOfDetailBias:](contentLayer, "setLevelsOfDetailBias:", 2);
  }
}

- (id)receiveBackgroundImage:(id)a3 info:(id)a4
{
  UIImage *backgroundImage;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  id v15;
  unint64_t v16;

  if (self->_showActivityIndicator)
    -[UIPDFPageView performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_stopActivityIndicator, 0, 0);
  os_unfair_lock_lock(&self->_lock);
  if (!a3)
  {
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_8;
  }
  backgroundImage = self->_backgroundImage;
  if (backgroundImage)
  {
    -[UIImage size](backgroundImage, "size");
    v8 = v7;
    v10 = v9;
    objc_msgSend(a3, "size");
    v13 = v11 * v12;
    os_unfair_lock_unlock(&self->_lock);
    if (v13 > v8 * v10)
      goto LABEL_10;
LABEL_8:
    os_unfair_lock_lock(&self->_lock);
    v14 = 0;
    goto LABEL_11;
  }
  os_unfair_lock_unlock(&self->_lock);
LABEL_10:
  -[UIPDFPageView willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("backgroundImage"));
  v15 = a3;
  os_unfair_lock_lock(&self->_lock);

  self->_backgroundImage = (UIImage *)a3;
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v14 = 1;
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  -[CALayer setContents:](self->_backingLayer, "setContents:", objc_msgSend(a3, "CGImage"));
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
LABEL_11:
  v16 = self->_backgroundScheduleCount - 1;
  self->_backgroundScheduleCount = v16;
  os_unfair_lock_unlock(&self->_lock);
  if (v14)
    -[UIPDFPageView didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("backgroundImage"));
  if (!v16)
  {
    -[UIPDFPageView performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_showContent, 0, 0);
    self->_backgroundIsScheduled = 0;
  }
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
  return 0;
}

- (void)setFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double MidX;
  objc_super v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  v27 = CGRectIntegral(v26);
  v16 = v27.origin.x;
  v17 = v27.origin.y;
  v18 = v27.size.width;
  v19 = v27.size.height;
  v25.receiver = self;
  v25.super_class = (Class)UIPDFPageView;
  -[UIView setFrame:](&v25, sel_setFrame_);
  v28.origin.x = v16;
  v28.origin.y = v17;
  v28.size.width = v18;
  v28.size.height = v19;
  if (!CGRectIsEmpty(v28) && self->_document)
  {
    -[UIView bounds](self, "bounds");
    v32.origin.x = v20;
    v32.origin.y = v21;
    v32.size.width = v22;
    v32.size.height = v23;
    v29.origin.x = v9;
    v29.origin.y = v11;
    v29.size.width = v13;
    v29.size.height = v15;
    self->_boundsChanged = !CGRectEqualToRect(v29, v32);
    self->_scalePageOnDraw = 1;
    -[UIView bounds](self, "bounds");
    -[CALayer setBounds:](self->_contentLayer, "setBounds:");
    -[UIView bounds](self, "bounds");
    MidX = CGRectGetMidX(v30);
    -[UIView bounds](self, "bounds");
    -[CALayer setPosition:](self->_contentLayer, "setPosition:", MidX, CGRectGetMidY(v31));
    if (self->_effectsLayer)
    {
      -[UIView bounds](self, "bounds");
      -[CALayer setBounds:](self->_effectsLayer, "setBounds:");
      -[CALayer position](self->_contentLayer, "position");
      -[CALayer setPosition:](self->_effectsLayer, "setPosition:");
    }
    if (self->_useBackingLayer && !self->_backingLayer)
    {
      self->_backingLayer = (CALayer *)-[UIPDFPageView createBackingLayer](self, "createBackingLayer");
      -[CALayer addSublayer:](-[UIView layer](self, "layer"), "addSublayer:", self->_backingLayer);
    }
    -[UIPDFPageView setTransforms](self, "setTransforms");
    -[CALayer setNeedsLayout](self->_contentLayer, "setNeedsLayout");
    -[CALayer setNeedsLayout](self->_effectsLayer, "setNeedsLayout");
    -[UIPDFPageView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  UIPDFPage *v5;
  CGFloat x;
  CGFloat y;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  double v13;
  float v14;
  float v15;
  double v16;
  double v17;
  CGSize result;
  CGRect v19;
  CGRect v20;

  height = a3.height;
  width = a3.width;
  v5 = -[UIPDFPageView page](self, "page");
  if (v5)
  {
    -[UIPDFPage cropBoxAccountForRotation](v5, "cropBoxAccountForRotation");
    x = v19.origin.x;
    y = v19.origin.y;
    v8 = v19.size.width;
    v9 = v19.size.height;
    v10 = CGRectGetWidth(v19);
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = v8;
    v20.size.height = v9;
    v11 = CGRectGetHeight(v20);
    if (v10 >= 1.0 && v11 >= 1.0)
    {
      v13 = fmin(width / v10, height / v11);
      v14 = v11 * v13;
      height = truncf(v14);
      v15 = v10 * v13;
      width = truncf(v15);
    }
  }
  v16 = width;
  v17 = height;
  result.height = v17;
  result.width = v16;
  return result;
}

- (void)layoutTextEffects
{
  -[UIPDFSelectionController layoutSelections](self->_selectionController, "layoutSelections");
}

- (void)addPage:(id)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v9;
  CGRect v10;
  CGRect v11;

  objc_msgSend(a3, "cropBoxAccountForRotation");
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  v9 = CGRectGetWidth(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  -[UIPDFPageView setFrame:](self, "setFrame:", 0.0, 0.0, v9, CGRectGetHeight(v11));
  -[UIPDFPageView setPage:](self, "setPage:", a3);
  self->_scalePageOnDraw = 0;
}

- (void)setPage:(id)a3
{
  os_unfair_lock_s *p_lock;
  UIPDFDocument *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CALayer *contentLayer;
  uint64_t v12;
  UIPDFAnnotationController *annotationController;

  if (self->_page != a3)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v6 = (UIPDFDocument *)objc_msgSend(a3, "document");
    if (self->_document != v6)
      self->_document = v6;
    self->_pageIndex = objc_msgSend(a3, "pageIndex");
    -[UIPDFPageContentDelegate setDocument:](self->_contentDelegate, "setDocument:", self->_document);
    -[UIPDFPageContentDelegate setPageIndex:](self->_contentDelegate, "setPageIndex:", self->_pageIndex);
    objc_msgSend(a3, "cropBox");
    self->_cropBox.origin.x = v7;
    self->_cropBox.origin.y = v8;
    self->_cropBox.size.width = v9;
    self->_cropBox.size.height = v10;
    -[UIPDFPageContentDelegate setPageRotation:](self->_contentDelegate, "setPageRotation:", objc_msgSend(a3, "rotation"));
    objc_msgSend(a3, "cropBoxAccountForRotation");
    -[UIPDFPageContentDelegate setBox:](self->_contentDelegate, "setBox:");
    -[CALayer setOpaque:](self->_contentLayer, "setOpaque:", 1);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      contentLayer = self->_contentLayer;
      -[CALayer setTileSize:](contentLayer, "setTileSize:", 1024.0, 1024.0);
      -[CALayer setLevelsOfDetail:](contentLayer, "setLevelsOfDetail:", 6);
      -[CALayer setMagnificationFilter:](contentLayer, "setMagnificationFilter:", *MEMORY[0x1E0CD2E68]);
      if (self->_scalePageOnDraw)
        v12 = 5;
      else
        v12 = 3;
      -[CALayer setLevelsOfDetailBias:](contentLayer, "setLevelsOfDetailBias:", v12);
    }
    annotationController = self->_annotationController;
    if (annotationController)

    self->_annotationController = -[UIPDFAnnotationController initWithPageView:]([UIPDFAnnotationController alloc], "initWithPageView:", self);
    -[UIPDFViewTouchHandler setFirstTouch](self->_touchHandler, "setFirstTouch");

    self->_page = (UIPDFPage *)a3;
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)drawAnnotations:(CGContext *)a3
{
  UIPDFAnnotationController *annotationController;

  if (-[UIPDFPageView showAnnotations](self, "showAnnotations")
    || -[UIPDFPageView allowHighlighting](self, "allowHighlighting"))
  {
    annotationController = self->_annotationController;
    if (annotationController)
      -[UIPDFAnnotationController drawAnnotations:](annotationController, "drawAnnotations:", a3);
  }
}

- (void)ignoreTouches:(BOOL)a3
{
  UIPDFViewTouchHandler *touchHandler;

  touchHandler = self->_touchHandler;
  if (a3)
    -[UIPDFViewTouchHandler disableRecognizers](touchHandler, "disableRecognizers");
  else
    -[UIPDFViewTouchHandler enableRecognizers](touchHandler, "enableRecognizers");
}

- (void)doubleTapAt:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double width;
  double height;
  unsigned int v10;
  CGRect v11;

  v10 = 0;
  if (self->_delegate)
  {
    y = a3.y;
    x = a3.x;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UIPDFPageView rectangleOfInterestAt:kind:](self, "rectangleOfInterestAt:kind:", &v10, x, y);
      v6 = v11.origin.x;
      v7 = v11.origin.y;
      width = v11.size.width;
      height = v11.size.height;
      if (CGRectIsNull(v11))
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[NSObject resetZoom:](self->_delegate, "resetZoom:", self);
      }
      else
      {
        -[NSObject zoom:to:atPoint:kind:](self->_delegate, "zoom:to:atPoint:kind:", self, v10, v6, v7, width, height, x, y);
      }
    }
  }
}

- (void)twoFingerDoubleTapAt:(CGPoint)a3
{
  CGSize v4;

  v4 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->zoomRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->zoomRect.size = v4;
  if (self->_delegate)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NSObject resetZoom:](self->_delegate, "resetZoom:", self);
  }
}

- (void)singleTapAt:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  -[UIPDFSelectionController clearSelection](self->_selectionController, "clearSelection");
  -[UIPDFPageView delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[NSObject didTap:atPoint:](-[UIPDFPageView delegate](self, "delegate"), "didTap:atPoint:", self, x, y);
}

- (BOOL)willDoSomethingWithTap:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  if (-[UIPDFPage selection](-[UIPDFPageView page](self, "page"), "selection")
    || -[UIPDFAnnotationController willDoSomethingWithTap:](-[UIPDFPageView annotationController](self, "annotationController"), "willDoSomethingWithTap:", x, y))
  {
    return 1;
  }
  -[UIPDFPageView delegate](self, "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[NSObject shouldRecognizeTapIn:atPoint:](-[UIPDFPageView delegate](self, "delegate"), "shouldRecognizeTapIn:atPoint:", self, x, y);
  else
    return 0;
}

- (void)setTransforms
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGAffineTransform *p_pageToViewTransform;
  __int128 v13;
  CGAffineTransform *p_viewToPageTransform;
  uint64_t v15;
  __int128 v16;
  CGRect *p_cropBox;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  __int128 v21;
  __int128 v22;
  CGAffineTransform v23;
  CGAffineTransform t1;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  -[UIView bounds](self, "bounds");
  v29 = CGRectInset(v28, self->_margin, self->_margin);
  x = v29.origin.x;
  y = v29.origin.y;
  width = v29.size.width;
  height = v29.size.height;
  -[UIPDFPage cropBoxAccountForRotation](-[UIPDFPageView page](self, "page"), "cropBoxAccountForRotation");
  memset(&v27, 0, sizeof(v27));
  CGPDFComputeTransform((uint64_t)&v27, -[UIPDFPage rotation](-[UIPDFPageView page](self, "page"), "rotation"), v7, v8, v9, v10, x, y, width, height);
  memset(&v26, 0, sizeof(v26));
  CGAffineTransformMakeScale(&v26, 1.0, -1.0);
  -[UIView bounds](self, "bounds");
  v11 = CGRectGetHeight(v30);
  t1 = v26;
  CGAffineTransformTranslate(&v25, &t1, 0.0, -v11);
  v26 = v25;
  p_pageToViewTransform = &self->_pageToViewTransform;
  t1 = v27;
  v23 = v25;
  CGAffineTransformConcat(&v25, &t1, &v23);
  v13 = *(_OWORD *)&v25.c;
  *(_OWORD *)&self->_pageToViewTransform.a = *(_OWORD *)&v25.a;
  *(_OWORD *)&self->_pageToViewTransform.c = v13;
  *(_OWORD *)&self->_pageToViewTransform.tx = *(_OWORD *)&v25.tx;
  p_viewToPageTransform = &self->_viewToPageTransform;
  v15 = MEMORY[0x1E0C9BAA8];
  v16 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&self->_viewToPageTransform.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&self->_viewToPageTransform.c = v16;
  *(_OWORD *)&self->_viewToPageTransform.tx = *(_OWORD *)(v15 + 32);
  p_cropBox = &self->_cropBox;
  v18 = p_cropBox->origin.x;
  *(CGFloat *)&v16 = p_cropBox->origin.y;
  v19 = p_cropBox->size.width;
  v20 = p_cropBox->size.height;
  if (CGRectGetWidth(*(CGRect *)((char *)&v16 - 8)) >= 1.0 && CGRectGetHeight(*p_cropBox) >= 1.0)
  {
    v21 = *(_OWORD *)&p_pageToViewTransform->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&p_pageToViewTransform->a;
    *(_OWORD *)&t1.c = v21;
    *(_OWORD *)&t1.tx = *(_OWORD *)&p_pageToViewTransform->tx;
    CGAffineTransformInvert(&v25, &t1);
    v22 = *(_OWORD *)&v25.c;
    *(_OWORD *)&p_viewToPageTransform->a = *(_OWORD *)&v25.a;
    *(_OWORD *)&p_viewToPageTransform->c = v22;
    *(_OWORD *)&p_viewToPageTransform->tx = *(_OWORD *)&v25.tx;
  }
}

- (CGPoint)convertPointToPDFPageSpace:(CGPoint)a3
{
  float64x2_t v3;
  double v4;
  CGPoint result;

  v3 = vaddq_f64(*(float64x2_t *)&self->_viewToPageTransform.tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&self->_viewToPageTransform.a, a3.x), vmulq_n_f64(*(float64x2_t *)&self->_viewToPageTransform.c, a3.y)));
  v4 = v3.f64[1];
  result.x = v3.f64[0];
  result.y = v4;
  return result;
}

- (CGPoint)convertPointFromPDFPageSpace:(CGPoint)a3
{
  float64x2_t v3;
  double v4;
  CGPoint result;

  v3 = vaddq_f64(*(float64x2_t *)&self->_pageToViewTransform.tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&self->_pageToViewTransform.a, a3.x), vmulq_n_f64(*(float64x2_t *)&self->_pageToViewTransform.c, a3.y)));
  v4 = v3.f64[1];
  result.x = v3.f64[0];
  result.y = v4;
  return result;
}

- (CGRect)convertRectToPDFPageSpace:(CGRect)a3
{
  __int128 v3;
  CGAffineTransform v4;

  v3 = *(_OWORD *)&self->_viewToPageTransform.c;
  *(_OWORD *)&v4.a = *(_OWORD *)&self->_viewToPageTransform.a;
  *(_OWORD *)&v4.c = v3;
  *(_OWORD *)&v4.tx = *(_OWORD *)&self->_viewToPageTransform.tx;
  return CGRectApplyAffineTransform(a3, &v4);
}

- (CGRect)convertRectFromPDFPageSpace:(CGRect)a3
{
  __int128 v3;
  CGAffineTransform v4;

  v3 = *(_OWORD *)&self->_pageToViewTransform.c;
  *(_OWORD *)&v4.a = *(_OWORD *)&self->_pageToViewTransform.a;
  *(_OWORD *)&v4.c = v3;
  *(_OWORD *)&v4.tx = *(_OWORD *)&self->_pageToViewTransform.tx;
  return CGRectApplyAffineTransform(a3, &v4);
}

- (CGRect)fitWidth:(CGRect)a3 atVertical:(double)a4
{
  double height;
  double width;
  double y;
  CGFloat x;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  if (v9 <= 0.0)
  {
    v12 = height;
    goto LABEL_10;
  }
  v11 = width * v10;
  v12 = width * v10 / v9;
  v13 = a4 + v12 * -0.5;
  if (v11 <= height * v9)
  {
    if (v13 < y)
      goto LABEL_10;
    v14 = y + height;
    if (v12 + v13 <= y + height)
      goto LABEL_5;
    goto LABEL_9;
  }
  if (v13 <= y)
  {
    v14 = y + height;
    if (v12 + v13 >= y + height)
    {
LABEL_5:
      y = a4 + v12 * -0.5;
      goto LABEL_10;
    }
LABEL_9:
    y = v14 - v12;
  }
LABEL_10:
  v15 = x;
  v16 = y;
  v17 = width;
  result.size.height = v12;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)fitRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView bounds](self, "bounds");
  v9 = height * v7;
  if (width * v8 <= height * v7)
  {
    if (v8 > 0.0)
    {
      x = x + (v9 / v8 - width) * -0.5;
      width = v9 / v8;
    }
  }
  else if (v7 > 0.0)
  {
    y = y + (width * v8 / v7 - height) * -0.5;
    height = width * v8 / v7;
  }
  v10 = x;
  v11 = y;
  v12 = width;
  v13 = height;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGRect)rectangleOfInterestAt:(CGPoint)a3 kind:(int *)a4
{
  double y;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double x;
  double v16;
  double v17;
  __int128 v18;
  int IsStandaloneGraphic;
  int v20;
  int ContentRect;
  double width;
  double height;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect *p_zoomRect;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  double v39;
  CGSize v40;
  CGPoint v41;
  CGAffineTransform v42;
  CGAffineTransform v43;
  double v44;
  CGAffineTransform v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect result;
  CGRect v51;

  y = a3.y;
  -[UIPDFPageView convertPointToPDFPageSpace:](self, "convertPointToPDFPageSpace:", a3.x);
  v8 = v7;
  v10 = v9;
  -[UIView bounds](self, "bounds");
  v39 = v11;
  v13 = v12;
  x = *MEMORY[0x1E0C9D628];
  v14 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v17 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v16 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v40 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  v41 = (CGPoint)*MEMORY[0x1E0C9D628];
  v46.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  v46.size = v40;
  v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v45.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v45.c = v18;
  *(_OWORD *)&v45.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v44 = 0.0;
  -[UIPDFPage CGPage](-[UIPDFPageView page](self, "page"), "CGPage");
  if (CGPDFSelectionCreateAtPointWithOptions())
  {
    IsStandaloneGraphic = CGPDFSelectionIsStandaloneGraphic();
    if (a4)
    {
      if (IsStandaloneGraphic)
        v20 = 1;
      else
        v20 = 2;
      *a4 = v20;
    }
    ContentRect = CGPDFSelectionGetContentRect();
    CGPDFSelectionRelease();
    if (ContentRect && !CGRectIsNull(v46))
    {
      if (v44 == 0.0 || ContentRect == 2)
      {
        v43 = v45;
        v46 = CGRectApplyAffineTransform(v46, &v43);
      }
      else
      {
        height = v46.size.height;
        width = v46.size.width;
        v24 = v46.origin.y;
        if (v46.size.height > v46.size.width)
        {
          v42 = v45;
          memset(&v43, 0, sizeof(v43));
          CGAffineTransformInvert(&v43, &v42);
          v25 = width * 0.5 + v43.ty + v8 * v43.b + v10 * v43.d;
          if (height + v24 <= v25)
            v25 = height + v24;
          v24 = v25 - width;
          v46.origin.y = v25 - width;
          v46.size.height = width;
          height = width;
        }
        v47.origin.x = v46.origin.x;
        v43 = v45;
        v47.origin.y = v24;
        v47.size.width = width;
        v47.size.height = height;
        v48 = CGRectApplyAffineTransform(v47, &v43);
        v46 = v48;
        if (v13 > 0.0 && v13 * v48.size.width < v39 * v48.size.height)
        {
          v46.origin.x = v48.origin.x + (v39 * v48.size.height / v13 - v48.size.width) * -0.5;
          v46.size.width = v39 * v48.size.height / v13;
        }
      }
      -[UIPDFPageView convertRectFromPDFPageSpace:](self, "convertRectFromPDFPageSpace:");
      x = v26;
      v14 = v27;
      v17 = v28;
      v16 = v29;
    }
    v49.origin.x = x;
    v49.origin.y = v14;
    v49.size.width = v17;
    v49.size.height = v16;
    if (CGRectIsEmpty(v49)
      || (p_zoomRect = &self->zoomRect,
          v51.origin.x = x,
          v51.origin.y = v14,
          v51.size.width = v17,
          v51.size.height = v16,
          CGRectEqualToRect(self->zoomRect, v51)))
    {
      self->zoomRect.origin = v41;
      self->zoomRect.size = v40;
    }
    else
    {
      if (ContentRect == 1)
        -[UIPDFPageView fitWidth:atVertical:](self, "fitWidth:atVertical:", x, v14, v17, v16, y);
      else
        -[UIPDFPageView fitRect:](self, "fitRect:", x, v14, v17, v16);
      if (CGRectIsEmpty(*(CGRect *)&v35))
      {
        p_zoomRect->origin = v41;
        self->zoomRect.size = v40;
      }
      else
      {
        p_zoomRect->origin.x = x;
        self->zoomRect.origin.y = v14;
        self->zoomRect.size.width = v17;
        self->zoomRect.size.height = v16;
      }
    }
    v17 = self->zoomRect.size.width;
    v16 = self->zoomRect.size.height;
    x = self->zoomRect.origin.x;
    v14 = self->zoomRect.origin.y;
  }
  v31 = x;
  v32 = v14;
  v33 = v17;
  v34 = v16;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (void)displayContent
{
  -[CALayer setNeedsDisplay](self->_contentLayer, "setNeedsDisplay");
}

- (void)clearSelection
{
  -[UIPDFSelectionController clearSelection](self->_selectionController, "clearSelection");
}

- (CGColor)highLightColor
{
  CGColor *result;
  CGColorSpace *DeviceRGB;
  _OWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  result = self->_highLightColor;
  if (!result)
  {
    v5[0] = xmmword_186683198;
    v5[1] = unk_1866831A8;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    self->_highLightColor = CGColorCreate(DeviceRGB, (const CGFloat *)v5);
    CGColorSpaceRelease(DeviceRGB);
    return self->_highLightColor;
  }
  return result;
}

- (void)hideSelection
{
  -[UIPDFViewTouchHandler hideMenu](self->_touchHandler, "hideMenu");
  -[UIPDFSelectionController hideWidget](self->_selectionController, "hideWidget");
}

- (void)showSelection
{
  -[UIPDFSelectionController layoutSelections](self->_selectionController, "layoutSelections");
  -[UIPDFViewTouchHandler showMenu](self->_touchHandler, "showMenu");
}

- (CALayer)effectsLayer
{
  CALayer *result;

  result = self->_effectsLayer;
  if (!result)
  {
    self->_effectsLayer = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    -[UIView bounds](self, "bounds");
    -[CALayer setBounds:](self->_effectsLayer, "setBounds:");
    -[CALayer position](self->_contentLayer, "position");
    -[CALayer setPosition:](self->_effectsLayer, "setPosition:");
    -[CALayer insertSublayer:above:](-[UIView layer](self, "layer"), "insertSublayer:above:", self->_effectsLayer, self->_contentLayer);
    return self->_effectsLayer;
  }
  return result;
}

- (void)highlightSearchSelection:(id)a3 animated:(BOOL)a4
{
  -[UIPDFSearchHighlightsController addSearchHighlightForSelection:animated:](self->_searchHighlightController, "addSearchHighlightForSelection:animated:", a3, a4);
}

- (void)clearSearchHighlights
{
  -[UIPDFSearchHighlightsController clearSearchHighlights](self->_searchHighlightController, "clearSearchHighlights");
}

- (BOOL)hasSearchHighlights
{
  UIPDFSearchHighlightsController *searchHighlightController;

  searchHighlightController = self->_searchHighlightController;
  if (searchHighlightController)
    LOBYTE(searchHighlightController) = -[UIPDFSearchHighlightsController hasSearchHighlights](searchHighlightController, "hasSearchHighlights");
  return (char)searchHighlightController;
}

- (id)searchHighlightSelectionAt:(CGPoint)a3
{
  return -[UIPDFSearchHighlightsController hitTest:](self->_searchHighlightController, "hitTest:", a3.x, a3.y);
}

- (void)addWidgetToSelection
{
  -[UIPDFSelectionController addSelectionWidget:](self->_selectionController, "addSelectionWidget:", -[UIPDFPage selection](-[UIPDFPageView page](self, "page"), "selection"));
}

- (BOOL)allowHighlighting
{
  return self->_allowHighlighting;
}

- (void)setAllowHighlighting:(BOOL)a3
{
  -[UIPDFSelectionController setInstantHighlightMode:](self->_selectionController, "setInstantHighlightMode:");
  self->_allowHighlighting = a3;
}

- (void)suspendInstantTouchHighlighting
{
  -[UIPDFPage setSelection:](-[UIPDFPageView page](self, "page"), "setSelection:", -[UIPDFAnnotation selection](-[UIPDFAnnotationController currentAnnotation](self->_annotationController, "currentAnnotation"), "selection"));
  -[UIPDFSelectionController suspendInstantHighlightMode](self->_selectionController, "suspendInstantHighlightMode");
  -[UIPDFViewTouchHandler showMenu](self->_touchHandler, "showMenu");
  -[UIView setNeedsLayout](self, "setNeedsLayout");
  -[UIPDFPageView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setAllowMenu:(BOOL)a3
{
  -[UIPDFViewTouchHandler setAllowMenu:](self->_touchHandler, "setAllowMenu:", a3);
}

- (BOOL)allowMenu
{
  return -[UIPDFViewTouchHandler allowMenu](self->_touchHandler, "allowMenu");
}

- (double)margin
{
  return self->_margin;
}

- (void)setMargin:(double)a3
{
  self->_margin = a3;
}

- (NSObject)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (CALayer)contentLayer
{
  return self->_contentLayer;
}

- (BOOL)allowSelection
{
  return self->_allowSelection;
}

- (void)setAllowSelection:(BOOL)a3
{
  self->_allowSelection = a3;
}

- (UIPDFSelectionController)selectionController
{
  return self->_selectionController;
}

- (void)setSelectionController:(id)a3
{
  self->_selectionController = (UIPDFSelectionController *)a3;
}

- (BOOL)animateSetFrame
{
  return self->_animateSetFrame;
}

- (void)setAnimateSetFrame:(BOOL)a3
{
  self->_animateSetFrame = a3;
}

- (UIColor)backingLayerColor
{
  return self->_backingLayerColor;
}

- (BOOL)showAnnotations
{
  return self->showAnnotations;
}

- (void)setShowAnnotations:(BOOL)a3
{
  self->showAnnotations = a3;
}

- (BOOL)useBackingLayer
{
  return self->_useBackingLayer;
}

- (void)setUseBackingLayer:(BOOL)a3
{
  self->_useBackingLayer = a3;
}

- (BOOL)showActivityIndicator
{
  return self->_showActivityIndicator;
}

- (UIPDFAnnotationController)annotationController
{
  return self->_annotationController;
}

- (BOOL)allowTwoFingerSelection
{
  return self->_allowTwoFingerSelection;
}

- (void)setAllowTwoFingerSelection:(BOOL)a3
{
  self->_allowTwoFingerSelection = a3;
}

- (BOOL)showTextAnnotations
{
  return self->_showTextAnnotations;
}

- (void)setShowTextAnnotations:(BOOL)a3
{
  self->_showTextAnnotations = a3;
}

- (BOOL)showLinkAnnotationUnderline
{
  return self->_showLinkAnnotationUnderline;
}

- (void)setShowLinkAnnotationUnderline:(BOOL)a3
{
  self->_showLinkAnnotationUnderline = a3;
}

- (CGPDFDictionary)_annotForPoint:(CGPoint)a3 rect:(CGRect *)a4
{
  CGSize v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGPDFDictionary *result;
  _BOOL4 v12;
  CGPDFDictionary *v13;
  size_t v14;
  double v15;
  double v16;
  char *v17;
  CGPDFArray *v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  CGPDFArrayRef array;
  char *__s1;
  CGPDFDictionaryRef dict;
  CGPDFArrayRef value;
  CGPDFReal v29;
  CGPDFReal v30;
  CGPDFReal v31;
  CGPDFReal v32;
  CGPoint v33;
  CGRect v34;

  if (a4)
  {
    v6 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    a4->origin = (CGPoint)*MEMORY[0x1E0C9D628];
    a4->size = v6;
  }
  -[UIPDFPageView convertPointToPDFPageSpace:](self, "convertPointToPDFPageSpace:", a3.x, a3.y);
  v8 = v7;
  v10 = v9;
  result = CGPDFPageGetDictionary(-[UIPDFPage CGPage](-[UIPDFPageView page](self, "page"), "CGPage"));
  if (result)
  {
    value = 0;
    v12 = CGPDFDictionaryGetArray(result, "Annots", &value);
    result = 0;
    if (v12)
    {
      result = (CGPDFDictionary *)CGPDFArrayGetCount(value);
      if (result)
      {
        v13 = result;
        v14 = 0;
        v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
        v23 = *(double *)(MEMORY[0x1E0C9D648] + 8);
        v24 = *MEMORY[0x1E0C9D648];
        v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
        while (1)
        {
          dict = 0;
          if (CGPDFArrayGetDictionary(value, v14, &dict))
          {
            __s1 = 0;
            if (CGPDFDictionaryGetName(dict, "Subtype", (const char **)&__s1))
            {
              v17 = __s1;
              if (!strcmp(__s1, "Link") || !strcmp(v17, "lnk"))
              {
                array = 0;
                if (CGPDFDictionaryGetArray(dict, "Rect", &array))
                {
                  v18 = array;
                  v19 = v16;
                  v20 = v15;
                  v21 = v23;
                  v22 = v24;
                  if (CGPDFArrayGetCount(array) == 4)
                  {
                    v31 = 0.0;
                    v32 = 0.0;
                    v29 = 0.0;
                    v30 = 0.0;
                    CGPDFArrayGetNumber(v18, 0, &v32);
                    CGPDFArrayGetNumber(v18, 1uLL, &v31);
                    CGPDFArrayGetNumber(v18, 2uLL, &v30);
                    CGPDFArrayGetNumber(v18, 3uLL, &v29);
                    v21 = v31;
                    v22 = v32;
                    v20 = v30 - v32;
                    v19 = v29 - v31;
                  }
                  v34.origin.x = v22;
                  v34.origin.y = v21;
                  v34.size.width = v20;
                  v34.size.height = v19;
                  v33.x = v8;
                  v33.y = v10;
                  if (CGRectContainsPoint(v34, v33))
                    break;
                }
              }
            }
          }
          if (v13 == (CGPDFDictionary *)++v14)
            return 0;
        }
        if (a4)
        {
          a4->origin.x = v22;
          a4->origin.y = v21;
          a4->size.width = v20;
          a4->size.height = v19;
        }
        return dict;
      }
    }
  }
  return result;
}

@end
