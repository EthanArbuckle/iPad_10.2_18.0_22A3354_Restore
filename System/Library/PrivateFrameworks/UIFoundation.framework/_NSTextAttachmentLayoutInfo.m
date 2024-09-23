@implementation _NSTextAttachmentLayoutInfo

- (void)dealloc
{
  __CTRunDelegate *runDelegate;
  objc_super v4;

  runDelegate = self->_runDelegate;
  if (runDelegate)
    CFRelease(runDelegate);
  v4.receiver = self;
  v4.super_class = (Class)_NSTextAttachmentLayoutInfo;
  -[_NSTextAttachmentLayoutInfo dealloc](&v4, sel_dealloc);
}

- (__CTRunDelegate)runDelegate
{
  __CTRunDelegate *runDelegate;
  CTRunDelegateCallbacks v5;

  objc_sync_enter(self);
  runDelegate = self->_runDelegate;
  if (!runDelegate)
  {
    *(_OWORD *)&v5.version = xmmword_1E260C1A0;
    *(_OWORD *)&v5.getAscent = *(_OWORD *)off_1E260C1B0;
    v5.getWidth = (CTRunDelegateGetWidthCallback)__NSTextAttachmentLayoutInfoGetWidth;
    runDelegate = CTRunDelegateCreate(&v5, self);
    self->_runDelegate = runDelegate;
  }
  objc_sync_exit(self);
  return runDelegate;
}

- (_NSTextAttachmentLayoutInfo)initWithContext:(id)a3 location:(id)a4 attributes:(id)a5
{
  _NSTextAttachmentLayoutInfo *v8;
  _NSTextAttachmentLayoutInfo *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_NSTextAttachmentLayoutInfo;
  v8 = -[_NSTextAttachmentLayoutInfo init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_layoutContext = (_NSTextAttachmentLayoutContext *)a3;
    v10 = objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("NSAttachment"));
    v9->_textAttachment = (NSTextAttachment *)v10;
    if (v10)
    {
      v9->_location = (NSTextLocation *)a4;
      v9->_attributes = (NSDictionary *)a5;
      v9->_isLineFragmentLayout = 1;
      v11 = -[_NSTextAttachmentLayoutContext baseLocation](v9->_layoutContext, "baseLocation");
      if (v11)
      {
        v12 = v11;
        v13 = (void *)objc_msgSend(-[_NSTextAttachmentLayoutInfo textLayoutFragment](v9, "textLayoutFragment"), "textParagraph");
        if (!v13
          || (v14 = objc_msgSend(v13, "rangeForLocation:allowsTrailingEdge:", a4, 0), v14 == 0x7FFFFFFFFFFFFFFFLL))
        {
          v14 = objc_msgSend((id)objc_msgSend(-[_NSTextAttachmentLayoutInfo textLayoutFragment](v9, "textLayoutFragment"), "textLayoutManager"), "offsetFromLocation:toLocation:", v12, v9->_location);
        }
        v9->_locationOffsetFromBase = v14;
      }
    }
    else
    {

      return 0;
    }
  }
  return v9;
}

- (void)_queryLayout
{
  NSTextLocation *v3;
  int64_t v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double horizontalOffset;
  double baselineOffset;
  id v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  UIImage *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGRect v23;
  CGRect v24;

  if (self->_isLineFragmentLayout && !self->_isBoundsValid)
  {
    v3 = -[_NSTextAttachmentLayoutInfo location](self, "location");
    v4 = -[_NSTextAttachmentLayoutContext applicationFrameworkContext](self->_layoutContext, "applicationFrameworkContext");
    -[_NSTextAttachmentLayoutContext proposedLineFragmentRectForLocation:attributes:baselineOffset:](self->_layoutContext, "proposedLineFragmentRectForLocation:attributes:baselineOffset:", v3, self->_attributes, &self->_baselineOffset);
    self->_proposedLineFragment.origin.x = v5;
    self->_proposedLineFragment.origin.y = v6;
    self->_proposedLineFragment.size.width = v7;
    self->_proposedLineFragment.size.height = v8;
    baselineOffset = self->_baselineOffset;
    horizontalOffset = self->_horizontalOffset;
    v11 = -[_NSTextAttachmentLayoutContext textContainerForLocation:](self->_layoutContext, "textContainerForLocation:", v3);
    -[NSTextAttachment attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:](self->_textAttachment, "attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:", self->_attributes, v3, v11, self->_proposedLineFragment.origin.x, self->_proposedLineFragment.origin.y, self->_proposedLineFragment.size.width, self->_proposedLineFragment.size.height, horizontalOffset, baselineOffset);
    self->_bounds.origin.x = v12;
    self->_bounds.origin.y = v13;
    self->_bounds.size.width = v14;
    self->_bounds.size.height = v15;
    if (v4 == 2)
    {
      -[NSTextAttachment bounds](self->_textAttachment, "bounds");
      if (CGRectIsEmpty(v23))
      {
        v16 = -[NSTextAttachment image](self->_textAttachment, "image");
        if (-[UIImage conformsToProtocol:](v16, "conformsToProtocol:", &unk_1EE095188))
        {
          -[UIImage size](v16, "size");
          v24.size.width = v17;
          v24.size.height = v18;
          v24.origin.x = 0.0;
          v24.origin.y = 0.0;
          if (CGRectEqualToRect(self->_bounds, v24))
          {
            if (-[UIImage willProvideAdaptedImageForPresentation](v16, "willProvideAdaptedImageForPresentation"))
            {
              -[UIImage attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:](v16, "attachmentBoundsForAttributes:location:textContainer:proposedLineFragment:position:", self->_attributes, v3, v11, self->_proposedLineFragment.origin.x, self->_proposedLineFragment.origin.y, self->_proposedLineFragment.size.width, self->_proposedLineFragment.size.height, horizontalOffset, baselineOffset);
              self->_bounds.origin.x = v19;
              self->_bounds.origin.y = v20;
              self->_bounds.size.width = v21;
              self->_bounds.size.height = v22;
            }
          }
        }
      }
    }
    self->_isBoundsValid = 1;
  }
}

- (void)_queryLayoutWithHorizontalOffset:(double)a3
{
  if (self->_horizontalOffset != a3)
  {
    self->_horizontalOffset = a3;
    self->_isBoundsValid = 0;
  }
  -[_NSTextAttachmentLayoutInfo _queryLayout](self, "_queryLayout");
}

- (NSTextLocation)location
{
  NSTextLocation *location;
  NSTextLocation *v4;
  void *v5;
  NSTextLocation *v6;

  objc_sync_enter(self);
  location = self->_location;
  if (!location)
  {
    v4 = -[_NSTextAttachmentLayoutContext baseLocation](self->_layoutContext, "baseLocation");
    v5 = (void *)objc_msgSend(-[_NSTextAttachmentLayoutInfo textLayoutFragment](self, "textLayoutFragment"), "textParagraph");
    if (v5)
    {
      v6 = (NSTextLocation *)(id)objc_msgSend(v5, "locationForCharacterIndex:dataSourceLocationsOnly:actualRange:", self->_locationOffsetFromBase, 0, 0);
      self->_location = v6;
      if (!v6)
        goto LABEL_6;
    }
    else
    {
      v6 = self->_location;
      if (!v6)
      {
LABEL_6:
        v6 = (NSTextLocation *)(id)objc_msgSend((id)objc_msgSend(-[_NSTextAttachmentLayoutInfo textLayoutFragment](self, "textLayoutFragment"), "textLayoutManager"), "locationFromLocation:withOffset:", v4, self->_locationOffsetFromBase);
        self->_location = v6;
      }
    }
    -[NSTextAttachmentViewProvider setLocation:](-[_NSTextAttachmentLayoutInfo textAttachmentViewProvider](self, "textAttachmentViewProvider"), "setLocation:", v6);
    location = self->_location;
  }
  objc_sync_exit(self);
  return location;
}

- (id)textLayoutFragment
{
  return -[_NSTextAttachmentLayoutContext textLayoutFragment](self->_layoutContext, "textLayoutFragment");
}

- (NSTextAttachmentViewProvider)textAttachmentViewProvider
{
  NSTextAttachmentViewProvider *textAttachmentViewProvider;
  NSTextAttachmentViewProvider *v4;

  objc_sync_enter(self);
  textAttachmentViewProvider = self->_textAttachmentViewProvider;
  if (textAttachmentViewProvider && !self->_location)
  {
    -[_NSTextAttachmentLayoutInfo location](self, "location");
    textAttachmentViewProvider = self->_textAttachmentViewProvider;
  }
  v4 = textAttachmentViewProvider;
  objc_sync_exit(self);
  return v4;
}

- (void)setTextAttachmentViewProvider:(id)a3
{
  NSTextAttachmentViewProvider *textAttachmentViewProvider;

  objc_sync_enter(self);
  textAttachmentViewProvider = self->_textAttachmentViewProvider;
  if (textAttachmentViewProvider != a3)
  {

    a3 = a3;
    self->_textAttachmentViewProvider = (NSTextAttachmentViewProvider *)a3;
  }
  if (a3)
    -[_NSTextAttachmentLayoutContext setHasViewProvider:](self->_layoutContext, "setHasViewProvider:", 1);
  objc_sync_exit(self);
}

- (void)setAttachmentFrameOrigin:(CGPoint)a3
{
  self->_resolvedAttachmentFrame.origin = a3;
  self->_resolvedAttachmentFrame.size = self->_bounds.size;
  -[_NSTextAttachmentLayoutContext setHasResolvedAttachmentFrame:](self->_layoutContext, "setHasResolvedAttachmentFrame:", 1);
}

- (CGRect)resolvedAttachmentFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_resolvedAttachmentFrame, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)invalidateAttachmentMeasurements
{
  self->_isBoundsValid = 0;
}

- (CGPoint)attachmentFrameOrigin
{
  _BOOL4 v3;
  CGRect *p_resolvedAttachmentFrame;
  CGFloat *p_y;
  double v6;
  double x;
  CGPoint result;

  v3 = -[_NSTextAttachmentLayoutContext hasResolvedAttachmentFrame](self->_layoutContext, "hasResolvedAttachmentFrame");
  p_resolvedAttachmentFrame = &self->_resolvedAttachmentFrame;
  p_y = &self->_resolvedAttachmentFrame.origin.y;
  if (!v3)
  {
    p_resolvedAttachmentFrame = (CGRect *)MEMORY[0x1E0C9D538];
    p_y = (CGFloat *)(MEMORY[0x1E0C9D538] + 8);
  }
  v6 = *p_y;
  x = p_resolvedAttachmentFrame->origin.x;
  result.y = v6;
  result.x = x;
  return result;
}

- (void)_invalidateLocations
{

  self->_location = 0;
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSTextAttachment)textAttachment
{
  return self->_textAttachment;
}

- (_NSTextAttachmentLayoutContext)layoutContext
{
  return self->_layoutContext;
}

@end
