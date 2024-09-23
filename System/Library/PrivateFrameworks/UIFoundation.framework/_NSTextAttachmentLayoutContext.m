@implementation _NSTextAttachmentLayoutContext

- (void)setTextContainer:(id)a3
{
  self->_textContainer = (NSTextContainer *)a3;
}

- (void)setUsesFontLeading:(BOOL)a3
{
  self->_usesFontLeading = a3;
}

- (void)setApplicationFrameworkContext:(int64_t)a3
{
  self->_applicationFrameworkContext = a3;
}

- (void)setAllowsFontOverridingTextAttachmentVerticalMetrics:(BOOL)a3
{
  self->_allowsFontOverridingTextAttachmentVerticalMetrics = a3;
}

- (_NSTextAttachmentLayoutContext)init
{
  return -[_NSTextAttachmentLayoutContext initWithDelegate:](self, "initWithDelegate:", 0);
}

- (_NSTextAttachmentLayoutContext)initWithDelegate:(id)a3
{
  _NSTextAttachmentLayoutContext *v4;
  _NSTextAttachmentLayoutContext *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_NSTextAttachmentLayoutContext;
  v4 = -[_NSTextAttachmentLayoutContext init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_delegate = (_NSTextLayoutAttachmentLayoutContextDelegate *)a3;
    v4->_applicationFrameworkContext = _NSTextScalingTypeForCurrentEnvironment();
    v5->_allowsFontOverridingTextAttachmentVerticalMetrics = 1;
  }
  return v5;
}

- (id)textAttachmentLayoutInfoForLocation:(id)a3 attributes:(id)a4
{
  NSTextLocation *v7;
  id v8;
  NSTextLayoutFragment *v9;
  NSTextParagraph *v10;
  uint64_t v11;
  _NSTextAttachmentLayoutInfo *v12;
  NSMapTable *textAttachmentInfoTable;

  objc_sync_enter(self);
  v7 = -[_NSTextAttachmentLayoutContext baseLocation](self, "baseLocation");
  v8 = a3;
  if (v7)
  {
    v9 = -[_NSTextAttachmentLayoutContext textLayoutFragment](self, "textLayoutFragment");
    v10 = -[NSTextLayoutFragment textParagraph](v9, "textParagraph");
    if (!v10
      || (v11 = -[NSTextParagraph rangeForLocation:allowsTrailingEdge:](v10, "rangeForLocation:allowsTrailingEdge:", a3, 0), v11 == 0x7FFFFFFFFFFFFFFFLL))
    {
      v11 = -[NSTextLayoutManager offsetFromLocation:toLocation:](-[NSTextLayoutFragment textLayoutManager](v9, "textLayoutManager"), "offsetFromLocation:toLocation:", v7, a3);
    }
    v8 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
  }
  v12 = -[NSMapTable objectForKey:](self->_textAttachmentInfoTable, "objectForKey:", v8);
  if (!v12)
  {
    v12 = -[_NSTextAttachmentLayoutInfo initWithContext:location:attributes:]([_NSTextAttachmentLayoutInfo alloc], "initWithContext:location:attributes:", self, a3, a4);
    if (v12)
    {
      textAttachmentInfoTable = self->_textAttachmentInfoTable;
      if (!textAttachmentInfoTable)
      {
        textAttachmentInfoTable = (NSMapTable *)(id)objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
        self->_textAttachmentInfoTable = textAttachmentInfoTable;
      }
      -[NSMapTable setObject:forKey:](textAttachmentInfoTable, "setObject:forKey:", v12, v8);

      -[_NSTextAttachmentLayoutContext _flushCachedInfo](self, "_flushCachedInfo");
    }
  }
  objc_sync_exit(self);
  return v12;
}

- (void)_flushCachedInfo
{

  self->_sortedKeys = 0;
  self->_textAttachmentViewProviders = 0;
}

- (NSTextLocation)baseLocation
{
  -[_NSTextAttachmentLayoutContext _adjustLocations](self, "_adjustLocations");
  return self->_baseLocation;
}

- (void)_adjustLocations
{
  NSTextLayoutFragment *v3;
  id v4;
  NSEnumerator *v5;
  id v6;

  v3 = -[_NSTextAttachmentLayoutContext textLayoutFragment](self, "textLayoutFragment");
  if (-[NSTextLayoutFragment textLayoutManager](v3, "textLayoutManager"))
  {
    v4 = -[NSTextRange location](-[NSTextLayoutFragment rangeInElement](v3, "rangeInElement"), "location");
    if ((objc_msgSend(v4, "isEqual:", self->_baseLocation) & 1) == 0)
    {
      v5 = -[NSMapTable objectEnumerator](self->_textAttachmentInfoTable, "objectEnumerator");
      -[_NSTextAttachmentLayoutContext _flushCachedInfo](self, "_flushCachedInfo");

      self->_baseLocation = (NSTextLocation *)v4;
      while (1)
      {
        v6 = -[NSEnumerator nextObject](v5, "nextObject");
        if (!v6)
          break;
        objc_msgSend(v6, "_invalidateLocations");
      }
    }
  }
}

- (NSTextLayoutFragment)textLayoutFragment
{
  return self->_textLayoutFragment;
}

- (CGRect)proposedLineFragmentRectForLocation:(id)a3 attributes:(id)a4 baselineOffset:(double *)a5
{
  __int128 v8;
  _NSTextLayoutAttachmentLayoutContextDelegate *delegate;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  CGRect result;

  v8 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v28 = *MEMORY[0x1E0C9D648];
  v29 = v8;
  v27 = 0;
  delegate = self->_delegate;
  if (delegate)
  {
    -[_NSTextLayoutAttachmentLayoutContextDelegate proposedLineFragmentRectForLocation:](delegate, "proposedLineFragmentRectForLocation:", a3, a4);
    v11 = v10;
    *(_QWORD *)&v28 = v12;
    *((_QWORD *)&v28 + 1) = v13;
    *((_QWORD *)&v29 + 1) = v14;
    -[_NSTextLayoutAttachmentLayoutContextDelegate baselineOffsetForLocation:](self->_delegate, "baselineOffsetForLocation:", a3);
    v27 = v15;
    if (!a5)
      goto LABEL_10;
    goto LABEL_9;
  }
  v17 = objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("NSParagraphStyle"));
  v18 = -[_NSTextAttachmentLayoutContext textContainerForLocation:](self, "textContainerForLocation:", a3);
  +[NSCoreTypesetter _lineMetricsForAttributes:typesetterBehavior:usesFontLeading:applySpacings:usesSystemFontLeading:usesNegativeFontLeading:layoutOrientation:lineHeight:baselineOffset:spacing:](NSCoreTypesetter, "_lineMetricsForAttributes:typesetterBehavior:usesFontLeading:applySpacings:usesSystemFontLeading:usesNegativeFontLeading:layoutOrientation:lineHeight:baselineOffset:spacing:", a4, objc_msgSend(MEMORY[0x1E0CB3940], "typesetterBehavior"), -[_NSTextAttachmentLayoutContext usesFontLeading](self, "usesFontLeading"), v17 != 0, 0, 0, objc_msgSend(v18, "layoutOrientation"), (char *)&v29 + 8, &v27, 0);
  if (!v18)
  {
    v11 = 40000.0;
    if (!a5)
      goto LABEL_10;
    goto LABEL_9;
  }
  objc_msgSend(v18, "lineFragmentPadding");
  v20 = v19;
  objc_msgSend(v18, "size");
  v22 = v21 + v20 * -2.0;
  if (v22 >= 0.0)
    v11 = v22;
  else
    v11 = 0.0;
  if (a5)
LABEL_9:
    *(_QWORD *)a5 = v27;
LABEL_10:
  v24 = *((double *)&v28 + 1);
  v23 = *(double *)&v28;
  v25 = *((double *)&v29 + 1);
  v26 = v11;
  result.size.height = v25;
  result.size.width = v26;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (id)textContainerForLocation:(id)a3
{
  id result;

  result = (id)-[_NSTextLayoutAttachmentLayoutContextDelegate textContainerForLocation:](self->_delegate, "textContainerForLocation:", a3);
  if (!result)
    return self->_textContainer;
  return result;
}

- (BOOL)usesFontLeading
{
  return self->_usesFontLeading;
}

- (int64_t)applicationFrameworkContext
{
  return self->_applicationFrameworkContext;
}

- (void)dealloc
{
  objc_super v3;

  -[_NSTextAttachmentLayoutContext _flushCachedInfo](self, "_flushCachedInfo");
  v3.receiver = self;
  v3.super_class = (Class)_NSTextAttachmentLayoutContext;
  -[_NSTextAttachmentLayoutContext dealloc](&v3, sel_dealloc);
}

- (NSArray)textAttachmentViewProviders
{
  NSArray *textAttachmentViewProviders;
  NSArray *v5;
  NSEnumerator *v6;
  id i;
  uint64_t v8;

  objc_sync_enter(self);
  -[_NSTextAttachmentLayoutContext _adjustLocations](self, "_adjustLocations");
  if (!self->_sortedKeys && -[NSMapTable count](self->_textAttachmentInfoTable, "count"))
  {
    v5 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMapTable count](self->_textAttachmentInfoTable, "count"));
    v6 = -[NSMapTable objectEnumerator](self->_textAttachmentInfoTable, "objectEnumerator");
    for (i = -[NSEnumerator nextObject](v6, "nextObject"); i; i = -[NSEnumerator nextObject](v6, "nextObject", v8))
    {
      v8 = objc_msgSend(i, "textAttachmentViewProvider");
      if (v8)
        -[NSArray addObject:](v5, "addObject:", v8);
    }
    if (-[NSArray count](v5, "count"))
    {

      self->_textAttachmentViewProviders = v5;
    }
    else
    {

    }
  }
  textAttachmentViewProviders = self->_textAttachmentViewProviders;
  objc_sync_exit(self);
  return textAttachmentViewProviders;
}

- (void)setTextLayoutFragment:(id)a3
{
  self->_textLayoutFragment = (NSTextLayoutFragment *)a3;
}

- (void)setHasViewProvider:(BOOL)a3
{
  self->_hasViewProvider = a3;
}

- (void)setHasResolvedAttachmentFrame:(BOOL)a3
{
  self->_hasResolvedAttachmentFrame = a3;
}

- (void)reset
{
  NSEnumerator *v3;
  id v4;

  objc_sync_enter(self);
  v3 = -[NSMapTable objectEnumerator](self->_textAttachmentInfoTable, "objectEnumerator");
  while (1)
  {
    v4 = -[NSEnumerator nextObject](v3, "nextObject");
    if (!v4)
      break;
    objc_msgSend(v4, "invalidateAttachmentMeasurements");
  }
  self->_textContainer = 0;
  -[_NSTextAttachmentLayoutContext _flushCachedInfo](self, "_flushCachedInfo");
  -[_NSTextAttachmentLayoutContext invalidateAttachmentFrames](self, "invalidateAttachmentFrames");
  objc_sync_exit(self);
}

- (BOOL)hasResolvedAttachmentFrame
{
  return self->_hasResolvedAttachmentFrame;
}

- (id)_sortedKeys
{
  NSArray *sortedKeys;

  objc_sync_enter(self);
  sortedKeys = self->_sortedKeys;
  if (!sortedKeys)
  {
    if (-[NSMapTable count](self->_textAttachmentInfoTable, "count"))
    {
      sortedKeys = -[NSArray sortedArrayUsingSelector:](NSAllMapTableKeys(self->_textAttachmentInfoTable), "sortedArrayUsingSelector:", sel_compare_);
      self->_sortedKeys = sortedKeys;
    }
    else
    {
      sortedKeys = self->_sortedKeys;
    }
  }
  objc_sync_exit(self);
  return sortedKeys;
}

- (void)invalidateAttachmentFrames
{
  -[_NSTextAttachmentLayoutContext setHasResolvedAttachmentFrame:](self, "setHasResolvedAttachmentFrame:", 0);
}

- (void)enumerateViewportElementsFromLocation:(id)a3 options:(int64_t)a4 usingBlock:(id)a5
{
  id v7;
  _QWORD v8[6];

  if (-[_NSTextAttachmentLayoutContext hasViewProvider](self, "hasViewProvider", a3, a4))
  {
    v7 = -[_NSTextAttachmentLayoutContext _sortedKeys](self, "_sortedKeys");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __91___NSTextAttachmentLayoutContext_enumerateViewportElementsFromLocation_options_usingBlock___block_invoke;
    v8[3] = &unk_1E260C1D0;
    v8[4] = self;
    v8[5] = a5;
    objc_msgSend(v7, "enumerateObjectsWithOptions:usingBlock:", 0, v8);
  }
}

- (_NSTextLayoutAttachmentLayoutContextDelegate)delegate
{
  return self->_delegate;
}

- (NSTextContainer)textContainer
{
  return self->_textContainer;
}

- (BOOL)hasViewProvider
{
  return self->_hasViewProvider;
}

- (BOOL)allowsFontOverridingTextAttachmentVerticalMetrics
{
  return self->_allowsFontOverridingTextAttachmentVerticalMetrics;
}

@end
