@implementation NSTextContainer

- (void)_commonInit
{
  self->_layoutManager = 0;
  self->_lineFragmentPadding = 5.0;
  *(_WORD *)&self->_tcFlags &= 0xFFF8u;
  self->_minimumWidth = 15.0;
  self->_applicationFrameworkContext = _NSTextScalingTypeForCurrentEnvironment();
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

- (NSUInteger)maximumNumberOfLines
{
  return self->_maximumLines;
}

- (BOOL)isSimpleRectangularTextContainer
{
  uint64_t v3;

  v3 = __NSBaseLineFragmentIMP;
  if (v3 != -[NSTextContainer methodForSelector:](self, "methodForSelector:", sel_lineFragmentRectForProposedRect_atIndex_writingDirection_remainingRect_)|| (*(_WORD *)&self->_tcFlags & 0x80) != 0|| -[NSArray count](-[NSTextContainer exclusionPaths](self, "exclusionPaths"), "count"))
  {
    return 0;
  }
  if (-[NSTextContainer maximumNumberOfLines](self, "maximumNumberOfLines"))
    return -[NSTextContainer textLayoutManager](self, "textLayoutManager") != 0;
  return 1;
}

- (NSArray)exclusionPaths
{
  if (self->_exclusionPaths)
    return self->_exclusionPaths;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (CGFloat)lineFragmentPadding
{
  return self->_lineFragmentPadding;
}

- (void)dealloc
{
  NSTextContainerView **p_textView;
  NSTextContainerView *v4;
  __CFArray *cachedClippingAttributes;
  __CFArray *cachedBounds;
  objc_super v7;

  p_textView = &self->_textView;
  -[NSTextContainerView setTextContainer:](self->_textView, "setTextContainer:", 0);
  objc_destroyWeak((id *)p_textView);

  v4 = p_textView[8];
  if (v4)
    CFRelease(v4);
  cachedClippingAttributes = self->_cachedClippingAttributes;
  if (cachedClippingAttributes)
    CFRelease(cachedClippingAttributes);
  cachedBounds = self->_cachedBounds;
  if (cachedBounds)
    CFRelease(cachedBounds);

  -[NSTextContainer setTextLayoutManager:](self, "setTextLayoutManager:", 0);
  v7.receiver = self;
  v7.super_class = (Class)NSTextContainer;
  -[NSTextContainer dealloc](&v7, sel_dealloc);
}

- (void)setTextLayoutManager:(id)a3
{
  NSTextLayoutManager **p_textLayoutManager;
  NSTextLayoutManager *textLayoutManager;
  int64_t v7;
  NSTextViewportLayoutController *textViewportLayoutController;

  textLayoutManager = self->_textLayoutManager;
  p_textLayoutManager = &self->_textLayoutManager;
  if (textLayoutManager != a3)
  {
    objc_storeWeak((id *)p_textLayoutManager, a3);
    if (a3)
    {
      v7 = objc_msgSend(a3, "applicationFrameworkContext");
      self->_layoutManager = 0;
    }
    else
    {
      v7 = _NSTextScalingTypeForCurrentEnvironment();
    }
    self->_applicationFrameworkContext = v7;
    objc_sync_enter(self);
    textViewportLayoutController = self->_textViewportLayoutController;
    self->_textViewportLayoutController = 0;

    objc_sync_exit(self);
  }
  if ((NSTextContainer *)-[NSTextContainerView textContainer](self->_textView, "textContainer") == self)
    -[NSTextContainerView setTextContainer:](self->_textView, "setTextContainer:", self);
}

- (id)attributesForExtraLineFragment
{
  return self->_attributesForExtraLineFragment;
}

- (void)setSize:(CGSize)size
{
  CGFloat height;
  CGFloat width;
  NSTextLayoutManager *v6;
  NSLayoutManager *v7;
  id v8;
  double v9;
  double v10;
  CGPath *cachedBoundingPath;

  height = size.height;
  width = size.width;
  if (!NSEqualSizes(self->_size, size))
  {
    v6 = -[NSTextContainer textLayoutManager](self, "textLayoutManager");
    if (v6)
    {
      v7 = 0;
      v8 = 0;
    }
    else
    {
      v7 = -[NSTextContainer layoutManager](self, "layoutManager");
      v8 = -[NSLayoutManager delegate](v7, "delegate");
    }
    v9 = self->_size.width;
    v10 = self->_size.height;
    self->_size.width = width;
    self->_size.height = height;
    cachedBoundingPath = self->_cachedBoundingPath;
    if (cachedBoundingPath)
    {
      CFRelease(cachedBoundingPath);
      self->_cachedBoundingPath = 0;
    }
    if (!v6)
      -[NSLayoutManager textContainerChangedGeometry:](v7, "textContainerChangedGeometry:", self);
    -[NSTextLayoutManager textContainerChangedGeometry:](-[NSTextContainer textLayoutManager](self, "textLayoutManager"), "textContainerChangedGeometry:", self);
    if (v8)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v8, "layoutManager:textContainer:didChangeGeometryFromSize:", v7, self, v9, v10);
    }
  }
}

- (NSTextLayoutManager)textLayoutManager
{
  return (NSTextLayoutManager *)objc_loadWeak((id *)&self->_textLayoutManager);
}

- (int64_t)layoutOrientation
{
  -[NSTextContainer textView](self, "textView");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[NSTextView layoutOrientation](-[NSTextContainer textView](self, "textView"), "layoutOrientation");
  else
    return self->_layoutOrientation;
}

- (NSTextView)textView
{
  return (NSTextView *)objc_loadWeak((id *)&self->_textView);
}

- (NSLineBreakMode)lineBreakMode
{
  return ((unint64_t)*(_WORD *)&self->_tcFlags >> 3) & 0xF;
}

- (void)invalidateTextContainerOrigin
{
  -[NSTextContainerView invalidateTextContainerOrigin](self->_textView, "invalidateTextContainerOrigin");
}

- (id)defaultParagraphStyle
{
  id result;

  if (!self->_textViewHasDefaultParagraphStyle)
    return +[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle");
  result = (id)-[NSTextContainerView defaultParagraphStyle](self->_textView, "defaultParagraphStyle");
  if (!result)
    return +[NSParagraphStyle defaultParagraphStyle](NSParagraphStyle, "defaultParagraphStyle");
  return result;
}

- (id)markedTextAttributesAtCharacterIndex:(int64_t)a3 effectiveRange:(_NSRange *)a4
{
  NSTextView *v7;
  char v8;
  id result;
  unint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  unint64_t v14;
  void *v15;
  void *v16;
  NSUInteger v17;
  unint64_t v18;
  unint64_t v19;
  _NSRange v20;

  v7 = -[NSTextContainer textView](self, "textView");
  v20 = (_NSRange)0;
  v8 = objc_opt_respondsToSelector();
  result = 0;
  if ((v8 & 1) != 0)
  {
    v10 = -[NSTextView markedRange](v7, "markedRange");
    if (v11)
    {
      v12 = v10;
      v13 = v11;
      v14 = a3 - v10;
      if (a3 >= v10 && v14 < v11)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v15 = (void *)-[NSTextView attributedSubstringForMarkedRange](v7, "attributedSubstringForMarkedRange");
          if (v15)
          {
            v16 = v15;
            if (v13 == objc_msgSend(v15, "length"))
            {
              result = (id)objc_msgSend(v16, "attributesAtIndex:effectiveRange:", v14, &v20);
              v20.location += v12;
              goto LABEL_20;
            }
          }
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          result = -[NSTextView markedTextAttributes](v7, "markedTextAttributes");
LABEL_18:
          v20.location = v12;
          v20.length = v13;
          goto LABEL_20;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          result = (id)-[NSTextView markedTextStyle](v7, "markedTextStyle");
          goto LABEL_18;
        }
        goto LABEL_19;
      }
      v17 = v10 - a3;
      if (v10 > a3)
      {
        result = 0;
        v20.location = a3;
        goto LABEL_15;
      }
      v18 = -[NSTextContainer _textLength](self, "_textLength");
      if (v18 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v19 = v18;
        result = 0;
        v17 = v19 - (v12 + v13);
        v20.location = v12 + v13;
LABEL_15:
        v20.length = v17;
        goto LABEL_20;
      }
    }
LABEL_19:
    result = 0;
  }
LABEL_20:
  if (a4)
    *a4 = v20;
  if (!result)
    return (id)MEMORY[0x1E0C9AA70];
  return result;
}

- (void)setAttributesForExtraLineFragment:(id)a3
{
  NSTextLayoutManager *v5;
  NSTextLayoutManager *v6;
  NSTextContainer *v7;
  NSTextContainer *v8;
  NSDictionary *v9;
  uint64_t v10;
  _QWORD v11[5];
  NSRect v12;

  if ((objc_msgSend(a3, "isEqualToDictionary:", self->_attributesForExtraLineFragment) & 1) == 0)
  {
    v5 = -[NSTextContainer textLayoutManager](self, "textLayoutManager");
    v6 = v5;
    v7 = v5
       ? -[NSTextLayoutManager textContainer](v5, "textContainer")
       : -[NSLayoutManager extraLineFragmentTextContainer](self->_layoutManager, "extraLineFragmentTextContainer");
    v8 = v7;
    v9 = (NSDictionary *)objc_msgSend(a3, "copyWithZone:", 0);

    self->_attributesForExtraLineFragment = v9;
    if (v8 == self)
    {
      if (v6)
      {
        if (!-[NSArray count](-[NSTextLayoutManager textSelections](v6, "textSelections"), "count"))
        {
          v10 = -[NSTextRange endLocation](-[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](v6, "textContentManager"), "documentRange"), "endLocation");
          v11[0] = MEMORY[0x1E0C809B0];
          v11[1] = 3221225472;
          v11[2] = __53__NSTextContainer_setAttributesForExtraLineFragment___block_invoke;
          v11[3] = &unk_1E2603A58;
          v11[4] = self;
          -[NSTextLayoutManager enumerateTextLayoutFragmentsFromLocation:options:usingBlock:](v6, "enumerateTextLayoutFragmentsFromLocation:options:usingBlock:", v10, 1, v11);
          -[NSTextLayoutManager _invalidateTextParagraphForEmptyDocument](v6, "_invalidateTextParagraphForEmptyDocument");
        }
      }
      else
      {
        -[NSLayoutManager extraLineFragmentRect](self->_layoutManager, "extraLineFragmentRect");
        if (!NSEqualRects(v12, *MEMORY[0x1E0CB3438]))
          -[NSLayoutManager textContainerChangedGeometry:](self->_layoutManager, "textContainerChangedGeometry:", self);
      }
    }
  }
}

- (id)renderingColorForDocumentColor:(id)a3
{
  id result;

  if (self->_textViewSupportsAdaptiveColor)
    result = (id)-[NSTextContainerView renderingColorForDocumentColor:](self->_textView, "renderingColorForDocumentColor:", a3);
  else
    result = 0;
  if (!result)
    return a3;
  return result;
}

- (BOOL)widthTracksTextView
{
  return *(_WORD *)&self->_tcFlags & 1;
}

- (BOOL)heightTracksTextView
{
  return (*(_WORD *)&self->_tcFlags >> 1) & 1;
}

- (void)setTextView:(NSTextView *)textView
{
  NSTextContainerView *v5;
  NSTextContainerView **p_textView;
  NSTextContainerView *v7;
  NSLayoutManager *layoutManager;

  p_textView = &self->_textView;
  v5 = self->_textView;
  -[NSTextContainerView setTextContainer:](v5, "setTextContainer:", 0);
  v7 = (NSTextContainerView *)objc_storeWeak((id *)p_textView, textView);
  *p_textView = v7;
  -[NSTextContainerView setTextContainer:](v7, "setTextContainer:", self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[NSTextView setTextContainer:](textView, "setTextContainer:", self);
  layoutManager = self->_layoutManager;
  if (layoutManager)
    -[NSLayoutManager textContainerChangedTextView:fromTextView:](layoutManager, "textContainerChangedTextView:fromTextView:", self, v5);
  if (textView)
    -[NSTextContainer _resizeAccordingToTextView:](self, "_resizeAccordingToTextView:", textView);
  self->_textViewSupportsAdaptiveColor = objc_opt_respondsToSelector() & 1;
  self->_textViewSupportsDowngrade = objc_opt_respondsToSelector() & 1;
  self->_textViewHasDefaultParagraphStyle = objc_opt_respondsToSelector() & 1;
  self->_textViewHasLinkTextAttributes = objc_opt_respondsToSelector() & 1;
  self->_textViewHasHighlightAttributes = objc_opt_respondsToSelector() & 1;
}

- (NSEdgeInsets)textContainerInsetsForView_iOS:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  NSEdgeInsets result;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a3, "textContainerInsets");
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a3, "textContainerInset");
  }
  else
  {
    v4 = *MEMORY[0x1E0CB2990];
    v5 = *(double *)(MEMORY[0x1E0CB2990] + 8);
    v6 = *(double *)(MEMORY[0x1E0CB2990] + 16);
    v7 = *(double *)(MEMORY[0x1E0CB2990] + 24);
  }
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (NSEdgeInsets)textContainerInsetsForView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSEdgeInsets result;

  if (self->_applicationFrameworkContext == 2)
    -[NSTextContainer textContainerInsetsForView_macOS:](self, "textContainerInsetsForView_macOS:", a3);
  else
    -[NSTextContainer textContainerInsetsForView_iOS:](self, "textContainerInsetsForView_iOS:", a3);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (CGPoint)textContainerOrigin
{
  NSTextView *v2;
  double v3;
  double v4;
  CGPoint result;

  v2 = -[NSTextContainer textView](self, "textView");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NSTextView bounds](v2, "bounds");
    -[NSTextView textContainerFrameForBounds:](v2, "textContainerFrameForBounds:");
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[NSTextView textContainerOrigin](v2, "textContainerOrigin");
  }
  else
  {
    v3 = *MEMORY[0x1E0CB3430];
    v4 = *(double *)(MEMORY[0x1E0CB3430] + 8);
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (NSTextContainer)init
{
  return -[NSTextContainer initWithSize:](self, "initWithSize:", 10000000.0, 10000000.0);
}

- (void)setWidthTracksTextView:(BOOL)widthTracksTextView
{
  *(_WORD *)&self->_tcFlags = *(_WORD *)&self->_tcFlags & 0xFFFE | widthTracksTextView;
}

- (id)textViewportLayoutController
{
  uint64_t v3;
  NSTextViewportLayoutController *textViewportLayoutController;
  void *v5;

  v3 = objc_sync_enter(self);
  textViewportLayoutController = self->_textViewportLayoutController;
  if (!textViewportLayoutController)
  {
    v5 = (void *)MEMORY[0x18D7917B4](v3);
    self->_textViewportLayoutController = (NSTextViewportLayoutController *)-[NSTextLayoutManager _textViewportLayoutControllerForTextContainer:](-[NSTextContainer textLayoutManager](self, "textLayoutManager"), "_textViewportLayoutControllerForTextContainer:", self);
    objc_autoreleasePoolPop(v5);
    textViewportLayoutController = self->_textViewportLayoutController;
  }
  objc_sync_exit(self);
  return textViewportLayoutController;
}

- (void)setHeightTracksTextView:(BOOL)heightTracksTextView
{
  __int16 v3;

  if (heightTracksTextView)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_tcFlags = *(_WORD *)&self->_tcFlags & 0xFFFD | v3;
}

- (void)setLineFragmentPadding:(CGFloat)lineFragmentPadding
{
  NSTextLayoutManager *v4;

  if (self->_lineFragmentPadding != lineFragmentPadding)
  {
    self->_lineFragmentPadding = lineFragmentPadding;
    if (-[NSTextContainer textLayoutManager](self, "textLayoutManager"))
      v4 = -[NSTextContainer textLayoutManager](self, "textLayoutManager");
    else
      v4 = -[NSTextContainer layoutManager](self, "layoutManager");
    -[NSTextLayoutManager textContainerChangedGeometry:](v4, "textContainerChangedGeometry:", self);
  }
}

- (NSLayoutManager)layoutManager
{
  if (-[NSTextContainer _textViewAllowsMigratingToLayoutManager](self, "_textViewAllowsMigratingToLayoutManager"))
    -[NSTextContainerView reconfigureWithLayoutManager:triggeredBySelector:](self->_textView, "reconfigureWithLayoutManager:triggeredBySelector:", 0, sel_layoutManager);
  return self->_layoutManager;
}

- (BOOL)_textViewAllowsMigratingToLayoutManager
{
  return self->_textViewSupportsDowngrade && self->_textLayoutManager != 0;
}

- (NSTextContainer)initWithSize:(CGSize)size
{
  CGFloat height;
  CGFloat width;
  NSTextContainer *v5;
  NSTextContainer *v6;
  objc_super v8;

  height = size.height;
  width = size.width;
  v8.receiver = self;
  v8.super_class = (Class)NSTextContainer;
  v5 = -[NSTextContainer init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[NSTextContainer _commonInit](v5, "_commonInit");
    v6->_size.width = width;
    v6->_size.height = height;
  }
  return v6;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(a1, "setVersion:", 1);
    __NSBaseLineFragmentIMP = objc_msgSend(a1, "instanceMethodForSelector:", sel_lineFragmentRectForProposedRect_atIndex_writingDirection_remainingRect_);
  }
}

- (void)setMaximumNumberOfLines:(NSUInteger)maximumNumberOfLines
{
  NSTextLayoutManager *v4;

  if (self->_maximumLines != maximumNumberOfLines)
  {
    self->_maximumLines = maximumNumberOfLines;
    v4 = -[NSTextContainer textLayoutManager](self, "textLayoutManager");
    if (!v4)
      v4 = -[NSTextContainer layoutManager](self, "layoutManager");
    -[NSTextLayoutManager textContainerChangedGeometry:](v4, "textContainerChangedGeometry:", self);
  }
}

- (void)setLayoutManager:(NSLayoutManager *)layoutManager
{
  if (-[NSTextContainer _textViewAllowsMigratingToLayoutManager](self, "_textViewAllowsMigratingToLayoutManager"))
    -[NSTextContainerView reconfigureWithLayoutManager:triggeredBySelector:](self->_textView, "reconfigureWithLayoutManager:triggeredBySelector:", 0, sel_layoutManager);
  self->_layoutManager = layoutManager;
  if (layoutManager)
  {
    self->_applicationFrameworkContext = -[NSLayoutManager applicationFrameworkContext](layoutManager, "applicationFrameworkContext");
    objc_storeWeak((id *)&self->_textLayoutManager, 0);
  }
  else
  {
    self->_applicationFrameworkContext = _NSTextScalingTypeForCurrentEnvironment();
  }
  if ((NSTextContainer *)-[NSTextContainerView textContainer](self->_textView, "textContainer") == self)
    -[NSTextContainerView setTextContainer:](self->_textView, "setTextContainer:", self);
}

- (CGRect)lineFragmentRectForProposedRect:(CGRect)proposedRect atIndex:(NSUInteger)characterIndex writingDirection:(NSWritingDirection)baseWritingDirection remainingRect:(CGRect *)remainingRect
{
  double height;
  double width;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double x;
  double y;
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
  CFIndex v29;
  CFIndex v30;
  const CFArrayCallBacks *v31;
  double v32;
  CGFloat v33;
  double v34;
  __CFArray *cachedBounds;
  CGFloat v36;
  uint64_t v37;
  uint64_t v38;
  NSArray *v39;
  CFIndex Count;
  __CFArray *Mutable;
  __CFArray *v42;
  CFIndex v43;
  CFIndex v44;
  const __CFDictionary *ValueAtIndex;
  double v46;
  double v47;
  double v48;
  double v49;
  CFIndex v50;
  const __CFDictionary *v51;
  BOOL v52;
  CGFloat v53;
  CGFloat v54;
  double v55;
  double v56;
  double v57;
  double v58;
  __CFArray *v59;
  double v60;
  double v61;
  CGFloat v62;
  double cacheBoundsMinY;
  double v64;
  double v65;
  double v66;
  CGFloat v67;
  double v68;
  CGRect rect;
  _QWORD v70[6];
  double v71;
  double *v72;
  uint64_t v73;
  void (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  uint64_t v76;
  NSRect v77;
  NSRect v78;
  NSRect v79;
  NSRect v80;
  NSRect v81;
  NSRect v82;
  CGRect result;

  height = proposedRect.size.height;
  width = self->_size.width;
  v11 = self->_size.height;
  v12 = *MEMORY[0x1E0CB3438];
  v13 = *(double *)(MEMORY[0x1E0CB3438] + 8);
  v15 = *(double *)(MEMORY[0x1E0CB3438] + 16);
  v14 = *(double *)(MEMORY[0x1E0CB3438] + 24);
  if (width <= 0.0)
    v16 = proposedRect.size.width;
  else
    v16 = self->_size.width;
  if (width <= 0.0)
    x = proposedRect.origin.x;
  else
    x = 0.0;
  if (proposedRect.origin.y < 0.0)
    y = proposedRect.origin.y + 0.0 - proposedRect.origin.y;
  else
    y = proposedRect.origin.y;
  if (v11 > 0.0)
    v19 = 0.0;
  else
    v19 = proposedRect.origin.y;
  if (v11 > 0.0)
    proposedRect.origin.y = y;
  v22 = NSTCIntersectionRect(proposedRect.origin.x, proposedRect.origin.y, proposedRect.size.width, height, x, v19, v16);
  v24 = v23;
  if (height - v21 <= 0.0001)
  {
    v25 = v21;
    v26 = v20;
  }
  else
  {
    v25 = v14;
    v26 = v15;
    v24 = v13;
    v22 = v12;
  }
  v77.origin.x = v22;
  v77.origin.y = v24;
  v77.size.width = v26;
  v77.size.height = v25;
  if (NSIsEmptyRect(v77) || !-[NSArray count](self->_exclusionPaths, "count"))
  {
    v33 = v14;
    v53 = v15;
    v54 = v13;
    if (!remainingRect)
      goto LABEL_66;
LABEL_65:
    remainingRect->origin.x = v12;
    remainingRect->origin.y = v54;
    remainingRect->size.width = v53;
    remainingRect->size.height = v33;
    goto LABEL_66;
  }
  memset(&rect, 0, sizeof(rect));
  -[NSTextContainer minimumLineFragmentWidth](self, "minimumLineFragmentWidth");
  v68 = v26;
  if (v27 <= v26)
    v28 = v27;
  else
    v28 = 0.0;
  v78.origin.x = v12;
  v78.origin.y = v13;
  v78.size.width = v15;
  v78.size.height = v14;
  if (NSIsEmptyRect(v78))
  {
    v29 = 0;
    v30 = 0;
    v64 = v22;
    v31 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
    v22 = v12;
    v66 = v13;
    v67 = v12;
    v62 = v12;
    cacheBoundsMinY = v13;
    v65 = v15;
    v61 = v15;
    v32 = v14;
    v33 = v14;
    do
    {
      v60 = v33;
      while (1)
      {
        v34 = self->_size.height;
        if (v24 > v34)
          goto LABEL_71;
        cachedBounds = self->_cachedBounds;
        if (cachedBounds && v24 == self->_cacheBoundsMinY && v25 + v24 == self->_cacheBoundsMaxY)
          goto LABEL_37;
        if (!self->_cachedBoundingPath)
        {
          v36 = self->_size.width;
          v37 = 0;
          v38 = 0;
          self->_cachedBoundingPath = CGPathCreateWithRect(*(CGRect *)(&v34 - 3), 0);
        }
        if (!self->_cachedClippingAttributes)
        {
          v39 = -[NSTextContainer exclusionPaths](self, "exclusionPaths");
          Count = CFArrayGetCount((CFArrayRef)v39);
          v71 = 0.0;
          v72 = &v71;
          v73 = 0x3052000000;
          v74 = __Block_byref_object_copy__12;
          v75 = __Block_byref_object_dispose__12;
          v76 = 0;
          Mutable = CFArrayCreateMutable(0, Count, v31);
          v70[0] = MEMORY[0x1E0C809B0];
          v70[1] = 3221225472;
          v70[2] = ____NSCreateClippingAttributesForExclusionPaths_block_invoke;
          v70[3] = &unk_1E2605938;
          v70[4] = &v71;
          v70[5] = Mutable;
          -[NSArray enumerateObjectsUsingBlock:](v39, "enumerateObjectsUsingBlock:", v70);

          _Block_object_dispose(&v71, 8);
          self->_cachedClippingAttributes = Mutable;
        }
        self->_cacheBoundsMinY = v24;
        self->_cacheBoundsMaxY = v25 + v24;
        v42 = self->_cachedBounds;
        if (v42)
          CFRelease(v42);
        cachedBounds = (__CFArray *)CTFramesetterCreateCGRectArray();
        self->_cachedBounds = cachedBounds;
        if (cachedBounds)
        {
LABEL_37:
          v29 = CFArrayGetCount(cachedBounds);
          v30 = 0;
        }
        if (v30 < v29)
        {
          v43 = ~v30 + v29;
          do
          {
            if (baseWritingDirection)
              v44 = v43;
            else
              v44 = v30;
            ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(self->_cachedBounds, v44);
            CGRectMakeWithDictionaryRepresentation(ValueAtIndex, &rect);
            v46 = NSTCIntersectionRect(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, v64, v24, v68);
            v13 = v66;
            v22 = v67;
            v15 = v65;
            v14 = v32;
            if (v48 >= v28)
            {
              v22 = v46;
              v13 = v47;
              v15 = v48;
              v14 = v49;
            }
            ++v30;
            v79.origin.x = v22;
            v79.origin.y = v13;
            v79.size.width = v15;
            v79.size.height = v14;
            if (!NSIsEmptyRect(v79))
              break;
            --v43;
          }
          while (v30 < v29);
        }
        v80.origin.x = v22;
        v80.origin.y = v13;
        v80.size.width = v15;
        v80.size.height = v14;
        if (!NSIsEmptyRect(v80))
          break;
        v71 = 0.0;
        if (v28 <= 0.0 || !CTFramesetterFindRectPosition() || (v24 = v71, v71 == self->_cacheBoundsMinY))
        {
          v59 = self->_cachedBounds;
          if (v59)
            CFRelease(v59);
          self->_cachedBounds = 0;
LABEL_71:
          v33 = v60;
          goto LABEL_72;
        }
        v81.origin.x = v22;
        v81.origin.y = v13;
        v81.size.width = v15;
        v81.size.height = v14;
        if (!NSIsEmptyRect(v81))
          goto LABEL_71;
      }
      if (remainingRect && v30 < v29)
      {
        v50 = baseWritingDirection ? v29 + ~v30 : v30;
        v51 = (const __CFDictionary *)CFArrayGetValueAtIndex(self->_cachedBounds, v50);
        CGRectMakeWithDictionaryRepresentation(v51, &rect);
        if (!NSIsEmptyRect(rect))
        {
          cacheBoundsMinY = self->_cacheBoundsMinY;
          v60 = self->_cacheBoundsMaxY - cacheBoundsMinY;
          if (baseWritingDirection)
          {
            v61 = rect.origin.x + rect.size.width;
            v62 = 0.0;
          }
          else
          {
            v61 = self->_size.width - rect.origin.x;
            v62 = rect.origin.x;
          }
        }
      }
      v24 = v25 + v24;
      v82.origin.x = v22;
      v82.origin.y = v13;
      v82.size.width = v15;
      v82.size.height = v14;
      v52 = NSIsEmptyRect(v82);
      v33 = v60;
    }
    while (v52);
  }
  else
  {
    v33 = v14;
    v61 = v15;
    v62 = v12;
    cacheBoundsMinY = v13;
    v22 = v12;
  }
LABEL_72:
  v53 = v61;
  v12 = v62;
  v54 = cacheBoundsMinY;
  v25 = v14;
  v26 = v15;
  v24 = v13;
  if (remainingRect)
    goto LABEL_65;
LABEL_66:
  v55 = v22;
  v56 = v24;
  v57 = v26;
  v58 = v25;
  result.size.height = v58;
  result.size.width = v57;
  result.origin.y = v56;
  result.origin.x = v55;
  return result;
}

- (void)setLineBreakMode:(NSLineBreakMode)lineBreakMode
{
  NSTextLayoutManager *v5;
  NSLayoutManager *v6;
  __int16 v7;
  NSArray *v8;
  uint64_t v9;
  NSTextContainer *v10;
  uint64_t v11;
  NSTextContainer *v12;
  NSTextView *v13;
  NSTextView *v14;
  uint64_t v15;
  uint64_t v16;

  if ((((unint64_t)*(_WORD *)&self->_tcFlags >> 3) & 0xF) != lineBreakMode)
  {
    v5 = -[NSTextContainer textLayoutManager](self, "textLayoutManager");
    if (v5)
      v6 = 0;
    else
      v6 = -[NSTextContainer layoutManager](self, "layoutManager");
    v7 = 8 * (lineBreakMode & 0xF);
    if (lineBreakMode > NSLineBreakByTruncatingMiddle)
      v7 = 0;
    *(_WORD *)&self->_tcFlags = *(_WORD *)&self->_tcFlags & 0xFF87 | v7;
    if (v5)
    {
      -[NSTextLayoutManager textContainerChangedGeometry:](v5, "textContainerChangedGeometry:", self);
    }
    else
    {
      if (-[NSTextStorage length](-[NSLayoutManager textStorage](v6, "textStorage"), "length"))
      {
        v8 = -[NSLayoutManager textContainers](v6, "textContainers");
        v15 = 0;
        v16 = 0;
        v9 = -[NSLayoutManager textContainerForGlyphAtIndex:effectiveRange:withoutAdditionalLayout:](v6, "textContainerForGlyphAtIndex:effectiveRange:withoutAdditionalLayout:", 0, &v15, 1);
        if (v9)
        {
          v10 = (NSTextContainer *)v9;
          if (-[NSArray count](v8, "count") && v10 != self)
          {
            v11 = v15;
            do
            {
              v12 = -[NSLayoutManager textContainerForGlyphAtIndex:effectiveRange:withoutAdditionalLayout:](v6, "textContainerForGlyphAtIndex:effectiveRange:withoutAdditionalLayout:", v11, &v15, 1);
              v10 = v12;
              v11 = v16 + v15;
              v15 += v16;
            }
            while (v12 && v12 != self);
          }
          v13 = -[NSTextContainer textView](v10, "textView", v15);
          if (v13)
          {
            v14 = v13;
            -[NSTextView bounds](v13, "bounds");
            -[NSTextView setNeedsDisplayInRect:avoidAdditionalLayout:](v14, "setNeedsDisplayInRect:avoidAdditionalLayout:", 0);
          }
        }
      }
      -[NSLayoutManager textContainerChangedGeometry:](v6, "textContainerChangedGeometry:", self);
    }
  }
}

uint64_t __53__NSTextContainer_setAttributesForExtraLineFragment___block_invoke(uint64_t a1, void *a2)
{
  void *v4;

  if (objc_msgSend(a2, "state") == 3)
  {
    v4 = (void *)objc_msgSend(a2, "extraLineFragmentAttributes");
    if (v4)
    {
      if ((objc_msgSend(v4, "isEqualToDictionary:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136)) & 1) == 0)
        objc_msgSend(a2, "invalidateLayout");
    }
  }
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  __int16 tcFlags;
  uint64_t v6;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) != 0)
  {
    tcFlags = (__int16)self->_tcFlags;
    objc_msgSend(a3, "encodeObject:forKey:", self->_layoutManager, CFSTR("NSLayoutManager"));
    objc_msgSend(a3, "encodeObject:forKey:", self->_textLayoutManager, CFSTR("NSTextLayoutManager"));
    if (self->_size.width != 10000000.0)
      objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NSWidth"));
    if (self->_size.height != 10000000.0)
      objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NSHeight"));
    v6 = tcFlags & 3;
    if (self->_lineFragmentPadding != 5.0)
      objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NSPadding"));
    if (self->_minimumWidth != 0.0)
      objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("NSMinWidth"));
    objc_msgSend(a3, "encodeInt:forKey:", v6, CFSTR("NSTCFlags"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@ *** NSTextContainer does not support non-keyed coding."), _NSFullMethodName());
  }
}

- (NSTextContainer)initWithCoder:(NSCoder *)coder
{
  unsigned int v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  _BOOL4 v9;
  double v10;

  if (-[NSCoder allowsKeyedCoding](coder, "allowsKeyedCoding"))
  {
    -[NSTextContainer _commonInit](self, "_commonInit");
    self->_size = (CGSize)vdupq_n_s64(0x416312D000000000uLL);
    v5 = -[NSCoder decodeIntForKey:](coder, "decodeIntForKey:", CFSTR("NSTCFlags"));
    if (-[NSCoder containsValueForKey:](coder, "containsValueForKey:", CFSTR("NSWidth")))
    {
      -[NSCoder decodeDoubleForKey:](coder, "decodeDoubleForKey:", CFSTR("NSWidth"));
      self->_size.width = v6;
    }
    if (-[NSCoder containsValueForKey:](coder, "containsValueForKey:", CFSTR("NSHeight")))
    {
      -[NSCoder decodeDoubleForKey:](coder, "decodeDoubleForKey:", CFSTR("NSHeight"));
      self->_size.height = v7;
    }
    if (-[NSCoder containsValueForKey:](coder, "containsValueForKey:", CFSTR("NSPadding")))
    {
      -[NSCoder decodeDoubleForKey:](coder, "decodeDoubleForKey:", CFSTR("NSPadding"));
      self->_lineFragmentPadding = v8;
    }
    v9 = -[NSCoder containsValueForKey:](coder, "containsValueForKey:", CFSTR("NSMinWidth"));
    v10 = 0.0;
    if (v9)
      -[NSCoder decodeDoubleForKey:](coder, "decodeDoubleForKey:", CFSTR("NSMinWidth"), 0.0);
    self->_minimumWidth = v10;
    -[NSTextContainer setWidthTracksTextView:](self, "setWidthTracksTextView:", v5 & 1);
    -[NSTextContainer setHeightTracksTextView:](self, "setHeightTracksTextView:", (v5 >> 1) & 1);
    self->_layoutManager = (NSLayoutManager *)-[NSCoder decodeObjectOfClass:forKey:](coder, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSLayoutManager"));
    -[NSTextContainer setTextLayoutManager:](self, "setTextLayoutManager:", -[NSCoder decodeObjectOfClass:forKey:](coder, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSTextLayoutManager")));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("%@ *** NSTextContainer does not support non-keyed coding."), _NSFullMethodName());
  }
  return self;
}

- (void)replaceLayoutManager:(NSLayoutManager *)newLayoutManager
{
  NSLayoutManager *layoutManager;
  NSArray *v6;
  uint64_t v7;
  NSTextStorage *v8;
  NSTextStorage *v9;
  NSTextStorage *v10;
  uint64_t v11;
  NSTextContentManager *v12;
  NSTextContainer *v13;
  NSTextStorage *v14;
  NSTextStorage *v15;

  if (!newLayoutManager)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("*** %@: nil NSLayoutManager given.  You must supply a NSLayoutManager."), NSStringFromSelector(a2));
  layoutManager = self->_layoutManager;
  if (layoutManager)
  {
    v6 = -[NSLayoutManager textContainers](layoutManager, "textContainers");
    v7 = -[NSArray count](v6, "count");
    v8 = -[NSLayoutManager textStorage](self->_layoutManager, "textStorage");
    if (v8)
    {
      v9 = v8;
      v10 = v8;
      -[NSTextStorage removeLayoutManager:](v9, "removeLayoutManager:", self->_layoutManager);
      -[NSTextStorage addLayoutManager:](v9, "addLayoutManager:", newLayoutManager);

    }
    while (v7)
    {
      --v7;
      v11 = -[NSArray objectAtIndex:](v6, "objectAtIndex:", 0);
      -[NSLayoutManager removeTextContainerAtIndex:](self->_layoutManager, "removeTextContainerAtIndex:", 0);
      -[NSLayoutManager addTextContainer:](newLayoutManager, "addTextContainer:", v11);
    }
  }
  else if (self->_textLayoutManager)
  {
    if (-[NSTextContainer _textViewAllowsMigratingToLayoutManager](self, "_textViewAllowsMigratingToLayoutManager"))
    {
      -[NSTextContainerView reconfigureWithLayoutManager:triggeredBySelector:](self->_textView, "reconfigureWithLayoutManager:triggeredBySelector:", newLayoutManager, sel_replaceLayoutManager_);
    }
    else
    {
      v12 = -[NSTextLayoutManager textContentManager](self->_textLayoutManager, "textContentManager");
      v13 = self;
      if (!v12
        || (objc_opt_respondsToSelector() & 1) == 0
        || (v14 = (NSTextStorage *)(id)-[NSTextContentManager textStorage](v12, "textStorage")) == 0)
      {
        v14 = objc_alloc_init(NSTextStorage);
      }
      -[NSTextContainer setTextLayoutManager:](self, "setTextLayoutManager:", 0);
      -[NSTextStorage addLayoutManager:](v14, "addLayoutManager:", newLayoutManager);
      -[NSLayoutManager addTextContainer:](newLayoutManager, "addTextContainer:", self);

      v15 = v14;
    }
  }
  else
  {
    -[NSLayoutManager addTextContainer:](newLayoutManager, "addTextContainer:", self);
  }
}

- (BOOL)_hasLayoutManager:(id)a3
{
  return self->_layoutManager == a3;
}

- (void)setExclusionPaths:(NSArray *)exclusionPaths
{
  NSTextLayoutManager *v5;
  NSLayoutManager *v6;
  __CFArray *cachedClippingAttributes;
  __CFArray *cachedBounds;
  NSArray *v9;
  uint64_t v10;
  NSTextContainer *v11;
  uint64_t v12;
  NSTextContainer *v13;
  NSTextView *v14;
  NSTextView *v15;
  uint64_t v16;
  uint64_t v17;

  if (!-[NSArray isEqualToArray:](self->_exclusionPaths, "isEqualToArray:"))
  {
    v5 = -[NSTextContainer textLayoutManager](self, "textLayoutManager");
    if (v5)
      v6 = 0;
    else
      v6 = -[NSTextContainer layoutManager](self, "layoutManager");

    self->_exclusionPaths = (NSArray *)-[NSArray copy](exclusionPaths, "copy");
    cachedClippingAttributes = self->_cachedClippingAttributes;
    if (cachedClippingAttributes)
    {
      CFRelease(cachedClippingAttributes);
      self->_cachedClippingAttributes = 0;
    }
    cachedBounds = self->_cachedBounds;
    if (cachedBounds)
    {
      CFRelease(cachedBounds);
      self->_cachedBounds = 0;
    }
    if (v5)
    {
      -[NSTextLayoutManager textContainerChangedGeometry:](v5, "textContainerChangedGeometry:", self);
    }
    else
    {
      if (-[NSTextStorage length](-[NSLayoutManager textStorage](v6, "textStorage"), "length"))
      {
        v9 = -[NSLayoutManager textContainers](v6, "textContainers");
        v16 = 0;
        v17 = 0;
        v10 = -[NSLayoutManager textContainerForGlyphAtIndex:effectiveRange:withoutAdditionalLayout:](v6, "textContainerForGlyphAtIndex:effectiveRange:withoutAdditionalLayout:", 0, &v16, 1);
        if (v10)
        {
          v11 = (NSTextContainer *)v10;
          if (-[NSArray count](v9, "count") && v11 != self)
          {
            v12 = v16;
            do
            {
              v13 = -[NSLayoutManager textContainerForGlyphAtIndex:effectiveRange:withoutAdditionalLayout:](v6, "textContainerForGlyphAtIndex:effectiveRange:withoutAdditionalLayout:", v12, &v16, 1);
              v11 = v13;
              v12 = v17 + v16;
              v16 += v17;
            }
            while (v13 && v13 != self);
          }
          v14 = -[NSTextContainer textView](v11, "textView", v16);
          if (v14)
          {
            v15 = v14;
            -[NSTextView bounds](v14, "bounds");
            -[NSTextView setNeedsDisplayInRect:avoidAdditionalLayout:](v15, "setNeedsDisplayInRect:avoidAdditionalLayout:", 0);
          }
        }
      }
      -[NSLayoutManager textContainerChangedGeometry:](v6, "textContainerChangedGeometry:", self);
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSTextContainer *v4;
  NSTextContainer *v5;

  v4 = +[NSTextContainer allocWithZone:](NSTextContainer, "allocWithZone:", a3);
  -[NSTextContainer size](self, "size");
  v5 = -[NSTextContainer initWithSize:](v4, "initWithSize:");
  -[NSTextContainer setExclusionPaths:](v5, "setExclusionPaths:", -[NSTextContainer exclusionPaths](self, "exclusionPaths"));
  -[NSTextContainer setLineBreakMode:](v5, "setLineBreakMode:", -[NSTextContainer lineBreakMode](self, "lineBreakMode"));
  -[NSTextContainer lineFragmentPadding](self, "lineFragmentPadding");
  -[NSTextContainer setLineFragmentPadding:](v5, "setLineFragmentPadding:");
  -[NSTextContainer setMaximumNumberOfLines:](v5, "setMaximumNumberOfLines:", -[NSTextContainer maximumNumberOfLines](self, "maximumNumberOfLines"));
  -[NSTextContainer setWidthTracksTextView:](v5, "setWidthTracksTextView:", -[NSTextContainer widthTracksTextView](self, "widthTracksTextView"));
  -[NSTextContainer setHeightTracksTextView:](v5, "setHeightTracksTextView:", -[NSTextContainer heightTracksTextView](self, "heightTracksTextView"));
  return v5;
}

- (CGRect)lineFragmentRectForProposedRect:(CGRect)a3 remainingRect:(CGRect *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[NSTextContainer lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:](self, "lineFragmentRectForProposedRect:atIndex:writingDirection:remainingRect:", 0, 0, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (BOOL)containsPoint:(NSPoint)point
{
  NSRect v4;

  v4.size.width = self->_size.width;
  v4.size.height = self->_size.height;
  v4.origin.x = 0.0;
  v4.origin.y = 0.0;
  return NSPointInRect(point, v4);
}

- (void)setLayoutOrientation:(int64_t)a3
{
  -[NSTextContainer textView](self, "textView");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[NSTextView setLayoutOrientation:](-[NSTextContainer textView](self, "textView"), "setLayoutOrientation:", a3);
  else
    self->_layoutOrientation = a3;
}

- (id)selectedTextAttributes
{
  NSTextView *v2;
  id result;

  v2 = -[NSTextContainer textView](self, "textView");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    result = -[NSTextView selectedTextAttributes](v2, "selectedTextAttributes");
  else
    result = 0;
  if (!result)
    return (id)MEMORY[0x1E0C9AA70];
  return result;
}

- (unint64_t)_textLength
{
  NSTextRange *v3;

  if (-[NSTextContainer textLayoutManager](self, "textLayoutManager"))
  {
    v3 = -[NSTextContentManager documentRange](-[NSTextLayoutManager textContentManager](-[NSTextContainer textLayoutManager](self, "textLayoutManager"), "textContentManager"), "documentRange");
    return -[NSTextContentManager offsetFromLocation:toLocation:](-[NSTextLayoutManager textContentManager](-[NSTextContainer textLayoutManager](self, "textLayoutManager"), "textContentManager"), "offsetFromLocation:toLocation:", -[NSTextRange location](v3, "location"), -[NSTextRange endLocation](v3, "endLocation"));
  }
  else if (-[NSTextContainer layoutManager](self, "layoutManager"))
  {
    return -[NSTextStorage length](-[NSLayoutManager textStorage](-[NSTextContainer layoutManager](self, "layoutManager"), "textStorage"), "length");
  }
  else
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (id)linkTextAttributes
{
  if (self->_textViewHasLinkTextAttributes)
    return (id)-[NSTextContainerView linkTextAttributes](self->_textView, "linkTextAttributes");
  else
    return 0;
}

- (id)textHighlightRenderingAttributesForAttributes:(id)a3
{
  if (self->_textViewHasHighlightAttributes)
    return (id)-[NSTextContainerView textHighlightRenderingAttributesForAttributes:](self->_textView, "textHighlightRenderingAttributesForAttributes:", a3);
  else
    return 0;
}

- (void)_resizeAccordingToTextView:(id)a3
{
  double width;
  double height;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  __int16 tcFlags;
  double v14;
  double v15;
  double v16;
  double v17;

  if ((*(_WORD *)&self->_tcFlags & 3) != 0)
  {
    width = self->_size.width;
    height = self->_size.height;
    -[NSTextContainer textContainerInsetsForView:](self, "textContainerInsetsForView:");
    v10 = v9;
    v12 = v11;
    tcFlags = (__int16)self->_tcFlags;
    if ((tcFlags & 1) != 0)
    {
      v14 = v7;
      v15 = v8;
      objc_msgSend(a3, "bounds");
      width = v16 - (v14 + v15);
      tcFlags = (__int16)self->_tcFlags;
    }
    if ((tcFlags & 2) != 0)
    {
      objc_msgSend(a3, "bounds");
      height = v17 - (v10 + v12);
    }
    -[NSTextContainer setSize:](self, "setSize:", width, height);
  }
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  float width;
  double v7;
  float height;
  __int16 tcFlags;
  const __CFString *v10;
  const __CFString *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  width = self->_size.width;
  v7 = width;
  tcFlags = (__int16)self->_tcFlags;
  if ((tcFlags & 1) != 0)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if ((tcFlags & 2) != 0)
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  height = self->_size.height;
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p size = (%f,%f); widthTracksTextView = %@; heightTracksTextView = %@>; exclusionPaths = %p; lineBreakMode = %ld"),
               v5,
               self,
               *(_QWORD *)&v7,
               height,
               v10,
               v11,
               -[NSTextContainer exclusionPaths](self, "exclusionPaths"),
               -[NSTextContainer lineBreakMode](self, "lineBreakMode"));
}

- (void)setMinimumLineFragmentWidth:(double)a3
{
  self->_minimumWidth = a3;
}

- (double)minimumLineFragmentWidth
{
  return self->_minimumWidth;
}

- (void)coordinateAccess:(id)a3
{
  (*((void (**)(id, NSTextContainer *))a3 + 2))(a3, self);
}

- (BOOL)_containerObservesTextViewFrameChanges
{
  _BOOL4 v2;

  if (self->_applicationFrameworkContext == 2)
    return (*(_WORD *)&self->_tcFlags >> 2) & 1;
  else
    LOBYTE(v2) = 0;
  return v2;
}

- (void)_containerTextViewFrameChanged:(id)a3
{
  if (self->_applicationFrameworkContext == 2)
  {
    if (self->_textView)
      -[NSTextContainer _resizeAccordingToTextView:](self, "_resizeAccordingToTextView:");
  }
}

@end
