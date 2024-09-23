@implementation _UIFocusFastScrollingIndexBarEntry

+ (_UIFocusFastScrollingIndexBarEntry)entryWithTitle:(id)a3 contentOffset:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:contentOffset:", v7, x, y);

  return (_UIFocusFastScrollingIndexBarEntry *)v8;
}

- (_UIFocusFastScrollingIndexBarEntry)initWithTitle:(id)a3 contentOffset:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  _UIFocusFastScrollingIndexBarEntry *v8;
  uint64_t v9;
  NSString *title;
  objc_super v12;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIFocusFastScrollingIndexBarEntry;
  v8 = -[_UIFocusFastScrollingIndexBarEntry init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    title = v8->_title;
    v8->_title = (NSString *)v9;

    v8->_hasCachedContentOffset = 1;
    v8->_cachedContentOffset.x = x;
    v8->_cachedContentOffset.y = y;
  }

  return v8;
}

+ (_UIFocusFastScrollingIndexBarEntry)entryWithTitle:(id)a3 generator:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:generator:", v7, v6);

  return (_UIFocusFastScrollingIndexBarEntry *)v8;
}

- (_UIFocusFastScrollingIndexBarEntry)initWithTitle:(id)a3 generator:(id)a4
{
  id v6;
  id v7;
  _UIFocusFastScrollingIndexBarEntry *v8;
  uint64_t v9;
  NSString *title;
  uint64_t v11;
  id contentOffsetGenerator;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UIFocusFastScrollingIndexBarEntry;
  v8 = -[_UIFocusFastScrollingIndexBarEntry init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    title = v8->_title;
    v8->_title = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    contentOffsetGenerator = v8->_contentOffsetGenerator;
    v8->_contentOffsetGenerator = (id)v11;

    v8->_cachedContentOffset = (CGPoint)_UIFocusFastScrollingIndexBarEntryContentOffsetNone;
  }

  return v8;
}

+ (id)placeholderEntryWithEntryBefore:(id)a3 after:(id)a4
{
  id v6;
  id v7;
  _BYTE *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)a1);
  v8[8] = 1;
  v9 = (void *)*((_QWORD *)v8 + 5);
  *((_QWORD *)v8 + 5) = CFSTR("•");

  *((_OWORD *)v8 + 1) = _UIFocusFastScrollingIndexBarEntryContentOffsetNone;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __76___UIFocusFastScrollingIndexBarEntry_placeholderEntryWithEntryBefore_after___block_invoke;
  v15[3] = &unk_1E16C6EB8;
  v16 = v6;
  v17 = v7;
  v10 = v7;
  v11 = v6;
  v12 = _Block_copy(v15);
  v13 = (void *)*((_QWORD *)v8 + 4);
  *((_QWORD *)v8 + 4) = v12;

  return v8;
}

- (CGPoint)contentOffset
{
  CGPoint *p_cachedContentOffset;
  CGFloat *p_y;
  double (**contentOffsetGenerator)(id, SEL);
  double x;
  double y;
  _BOOL4 v8;
  id v9;
  double v10;
  double v11;
  CGPoint result;

  if (self->_hasCachedContentOffset)
  {
    p_cachedContentOffset = &self->_cachedContentOffset;
    p_y = &self->_cachedContentOffset.y;
  }
  else
  {
    contentOffsetGenerator = (double (**)(id, SEL))self->_contentOffsetGenerator;
    if (contentOffsetGenerator)
    {
      x = contentOffsetGenerator[2](contentOffsetGenerator, a2);
      self->_cachedContentOffset.x = x;
      self->_cachedContentOffset.y = y;
    }
    else
    {
      x = self->_cachedContentOffset.x;
      y = self->_cachedContentOffset.y;
    }
    v8 = x != INFINITY;
    if (y != INFINITY)
      v8 = 1;
    self->_hasCachedContentOffset = v8;
    p_cachedContentOffset = (CGPoint *)MEMORY[0x1E0C9D538];
    p_y = (CGFloat *)(MEMORY[0x1E0C9D538] + 8);
    if (v8)
    {
      v9 = self->_contentOffsetGenerator;
      self->_contentOffsetGenerator = 0;

      if (self->_hasCachedContentOffset)
      {
        p_cachedContentOffset = &self->_cachedContentOffset;
        p_y = &self->_cachedContentOffset.y;
      }
    }
  }
  v10 = *p_y;
  v11 = p_cachedContentOffset->x;
  result.y = v10;
  result.x = v11;
  return result;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; title = \"%@\"), v5, self, self->_title);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_hasCachedContentOffset)
  {
    NSStringFromCGPoint(self->_cachedContentOffset);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("unresolved");
  }
  objc_msgSend(v6, "appendFormat:", CFSTR("; contentOffset = %@"), v7);
  if (self->_targetFocusedIndexPath)
    objc_msgSend(v6, "appendFormat:", CFSTR("; indexPath = %@"), self->_targetFocusedIndexPath);
  if (self->_isPlaceholder)
    objc_msgSend(v6, "appendString:", CFSTR("; isPlaceholder = YES"));
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  v8 = (void *)objc_msgSend(v6, "copy");

  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (NSIndexPath)targetFocusedIndexPath
{
  return self->_targetFocusedIndexPath;
}

- (void)setTargetFocusedIndexPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetFocusedIndexPath, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_contentOffsetGenerator, 0);
}

@end
