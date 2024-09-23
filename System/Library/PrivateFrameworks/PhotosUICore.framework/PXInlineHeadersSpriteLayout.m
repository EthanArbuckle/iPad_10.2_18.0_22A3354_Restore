@implementation PXInlineHeadersSpriteLayout

- (PXInlineHeadersSpriteLayout)initWithLevel:(unint64_t)a3
{
  PXInlineHeadersSpriteLayout *v4;
  PXInlineHeadersSpriteLayout *v5;
  uint64_t v6;
  NSCalendar *calendar;
  void *v8;
  uint64_t *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PXInlineHeadersSpriteLayout;
  v4 = -[PXGItemsLayout init](&v15, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_level = a3;
    -[PXGLayout setContentSource:](v4, "setContentSource:", v4);
    objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
    v6 = objc_claimAutoreleasedReturnValue();
    calendar = v5->_calendar;
    v5->_calendar = (NSCalendar *)v6;

    -[PXInlineHeadersSpriteLayout _setupDateFormatters](v5, "_setupDateFormatters");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v5, sel__currentLocaleChanged_, *MEMORY[0x1E0C99720], 0);

    p_updateFlags = (uint64_t *)&v5->_updateFlags;
    needsUpdate = v5->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!v5->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        *p_updateFlags = needsUpdate | 1;
        return v5;
      }
LABEL_6:
      if ((v5->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXInlineHeadersSpriteLayout initWithLevel:]");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXZoomableInlineHeadersLayout.m"), 164, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_7;
    }
    if (v5->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = v5->_updateFlags.willPerformUpdate;
    *p_updateFlags = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](v5, "setNeedsUpdate");
  }
  return v5;
}

- (void)visibleRectDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXInlineHeadersSpriteLayout;
  -[PXGLayout visibleRectDidChange](&v8, sel_visibleRectDidChange);
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXInlineHeadersSpriteLayout visibleRectDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXZoomableInlineHeadersLayout.m"), 171, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)displayScaleDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXInlineHeadersSpriteLayout;
  -[PXGLayout displayScaleDidChange](&v8, sel_displayScaleDidChange);
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXInlineHeadersSpriteLayout displayScaleDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXZoomableInlineHeadersLayout.m"), 176, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)alphaDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXInlineHeadersSpriteLayout;
  -[PXGLayout alphaDidChange](&v8, sel_alphaDidChange);
  self->_didHideSprites = 0;
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXInlineHeadersSpriteLayout alphaDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXZoomableInlineHeadersLayout.m"), 182, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)setDataSource:(id)a3
{
  PXZoomableInlineHeadersDataSource *v5;
  NSIndexSet *axSpriteIndexes;
  PXZoomableInlineHeadersDataSource *v7;

  v5 = (PXZoomableInlineHeadersDataSource *)a3;
  if (self->_dataSource != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_dataSource, a3);
    axSpriteIndexes = self->_axSpriteIndexes;
    self->_axSpriteIndexes = 0;

    -[PXInlineHeadersSpriteLayout _bumpMediaVersion](self, "_bumpMediaVersion");
    v5 = v7;
  }

}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[PXInlineHeadersSpriteLayout _bumpMediaVersion](self, "_bumpMediaVersion");
  }
}

- (void)setSpec:(id)a3
{
  PXZoomableInlineHeadersLayoutSpec *v5;
  PXZoomableInlineHeadersLayoutSpec *spec;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v10;
  void *v11;
  PXZoomableInlineHeadersLayoutSpec *v12;

  v5 = (PXZoomableInlineHeadersLayoutSpec *)a3;
  spec = self->_spec;
  if (spec != v5)
  {
    v12 = v5;
    -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
    -[PXZoomableInlineHeadersLayoutSpec headerFloatMarginsForSafeAreaInsets:](spec, "headerFloatMarginsForSafeAreaInsets:");
    -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
    -[PXZoomableInlineHeadersLayoutSpec headerFloatMarginsForSafeAreaInsets:](v12, "headerFloatMarginsForSafeAreaInsets:");
    if ((PXEdgeInsetsEqualToEdgeInsets() & 1) != 0)
    {
LABEL_9:
      objc_storeStrong((id *)&self->_spec, a3);
      v5 = v12;
      goto LABEL_10;
    }
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_8:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        goto LABEL_9;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 1;
      if (!willPerformUpdate)
        -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_9;
    }
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXInlineHeadersSpriteLayout setSpec:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXZoomableInlineHeadersLayout.m"), 210, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_8;
  }
LABEL_10:

}

- (void)_setupDateFormatters
{
  NSDateFormatter *v3;
  uint64_t v4;
  NSDateFormatter *yearFormatter;
  NSDateFormatter *v6;
  NSDateFormatter *v7;
  NSDateFormatter *monthFormatter;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
  -[NSDateFormatter setLocale:](v3, "setLocale:", v9);
  -[NSDateFormatter setTimeStyle:](v3, "setTimeStyle:", 0);
  -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v3, "setLocalizedDateFormatFromTemplate:", CFSTR("yyyy"));
  if (self->_level)
    v4 = 5;
  else
    v4 = 2;
  -[NSDateFormatter setFormattingContext:](v3, "setFormattingContext:", v4);
  yearFormatter = self->_yearFormatter;
  self->_yearFormatter = v3;
  v6 = v3;

  v7 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
  -[NSDateFormatter setLocale:](v7, "setLocale:", v9);
  -[NSDateFormatter setTimeStyle:](v7, "setTimeStyle:", 0);
  -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v7, "setLocalizedDateFormatFromTemplate:", CFSTR("MMM"));
  -[NSDateFormatter setFormattingContext:](v7, "setFormattingContext:", 4);
  monthFormatter = self->_monthFormatter;
  self->_monthFormatter = v7;

}

- (void)_currentLocaleChanged:(id)a3
{
  -[PXInlineHeadersSpriteLayout _setupDateFormatters](self, "_setupDateFormatters", a3);
  -[PXInlineHeadersSpriteLayout _bumpMediaVersion](self, "_bumpMediaVersion");
}

- (void)invalidateAnchorItemFrames
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXInlineHeadersSpriteLayout invalidateAnchorItemFrames]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXZoomableInlineHeadersLayout.m"), 238, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_bumpMediaVersion
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  ++self->_mediaVersion;
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXInlineHeadersSpriteLayout _bumpMediaVersion]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXZoomableInlineHeadersLayout.m"), 243, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXInlineHeadersSpriteLayout update]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXZoomableInlineHeadersLayout.m"), 247, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXInlineHeadersSpriteLayout _updateSprites](self, "_updateSprites");
      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXInlineHeadersSpriteLayout update]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXZoomableInlineHeadersLayout.m"), 251, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PXInlineHeadersSpriteLayout;
  -[PXGItemsLayout update](&v9, sel_update);
}

- (void)_updateSprites
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  uint64_t v8;
  _QWORD v9[5];

  v3 = -[PXGItemsLayout numberOfItems](self, "numberOfItems");
  -[PXInlineHeadersSpriteLayout dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfSections");

  if (v3 != v5)
  {
    -[PXInlineHeadersSpriteLayout dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGItemsLayout setNumberOfItems:](self, "setNumberOfItems:", objc_msgSend(v6, "numberOfSections"));

  }
  -[PXGLayout alpha](self, "alpha");
  if (v7 != 0.0 || !self->_didHideSprites)
  {
    v8 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __45__PXInlineHeadersSpriteLayout__updateSprites__block_invoke;
    v9[3] = &unk_1E5127210;
    v9[4] = self;
    -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v8 << 32, v9);
  }
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return (Class)objc_opt_class();
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  __CFString *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  uint64_t v20;
  BOOL v21;
  PXZoomableInlineHeaderViewConfiguration *v22;

  -[PXInlineHeadersSpriteLayout dataSource](self, "dataSource", *(_QWORD *)&a3, a4);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v6, "sectionInfos");
  v8 = a3;

  v9 = -[PXInlineHeadersSpriteLayout level](self, "level");
  v10 = objc_msgSend(MEMORY[0x1E0CB3578], "px_shouldAlwaysDisplayYearBeforeMonthForCurrentLocale");
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", *(double *)(v7 + 32 * v8 + 24));
  if (v9)
  {
    -[NSDateFormatter stringFromDate:](self->_monthFormatter, "stringFromDate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter stringFromDate:](self->_yearFormatter, "stringFromDate:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSDateFormatter stringFromDate:](self->_yearFormatter, "stringFromDate:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PXInlineHeadersSpriteLayout dataSource](self, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "type");

  if (v14 == 2)
  {
    if (v9)
      v15 = v12 == 0;
    else
      v15 = 1;
    if (v15)
      v16 = CFSTR("PXLibraryAllPhotosAddedOnYear");
    else
      v16 = CFSTR("PXLibraryAllPhotosAddedOnMonthYear");
    PXLocalizedStringFromTable(v16, CFSTR("PhotosUICore"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v9 != 0;
    if (objc_msgSend(v17, "hasPrefix:", CFSTR("%")))
    {
      if ((v18 & ~(_DWORD)v10) != 0)
        v19 = v9;
      else
        v19 = v12;
      PXStringWithValidatedFormat();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (v18 & ~(_DWORD)v10) == 0;
    }
    else
    {
      if ((v10 & v18) != 0)
        v19 = v9;
      else
        v19 = v12;
      PXStringWithValidatedFormat();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (v10 & v18) == 0;
    }
    if (v21)
      v12 = (void *)v20;
    if (!v21)
      v9 = (void *)v20;

  }
  v22 = -[PXZoomableInlineHeaderViewConfiguration initWithTitle:subtitle:swapTitleAndSubtitle:style:]([PXZoomableInlineHeaderViewConfiguration alloc], "initWithTitle:subtitle:swapTitleAndSubtitle:style:", v12, v9, v10, -[PXInlineHeadersSpriteLayout style](self, "style"));

  return v22;
}

- (int64_t)itemClosestToItem:(int64_t)a3 inDirection:(unint64_t)a4
{
  return PXGItemsGeometryItemClosestToItemVerticalGridDefaultImplementation(a3, a4, 1, -[PXGItemsLayout numberOfItems](self, "numberOfItems"));
}

- (id)itemsBetweenItem:(int64_t)a3 andItem:(int64_t)a4
{
  return PXGItemsGeometryItemsBetweenItemAndItemDefaultImplementation(a3, a4);
}

- (id)itemsInRect:(CGRect)a3 inLayout:(id)a4
{
  void *v5;
  void *v6;

  -[PXInlineHeadersSpriteLayout axSpriteIndexesInRect:](self, "axSpriteIndexesInRect:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGItemsLayout itemsForSpriteIndexes:](self, "itemsForSpriteIndexes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)axSpriteIndexes
{
  NSIndexSet *v3;
  NSIndexSet *axSpriteIndexes;
  NSIndexSet *v5;

  if (!self->_axSpriteIndexes)
  {
    v3 = (NSIndexSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites"));
    axSpriteIndexes = self->_axSpriteIndexes;
    self->_axSpriteIndexes = v3;

  }
  if (self->_didHideSprites)
    v5 = (NSIndexSet *)objc_alloc_init(MEMORY[0x1E0CB36B8]);
  else
    v5 = self->_axSpriteIndexes;
  return v5;
}

- (unsigned)axSpriteIndexClosestToSpriteIndex:(unsigned int)a3 inDirection:(unint64_t)a4
{
  unsigned int v5;

  v5 = -1;
  if (a4 - 4 < 2)
  {
    if (-[PXGLayout localNumberOfSprites](self, "localNumberOfSprites") - 1 > a3)
      return a3 + 1;
    else
      return -1;
  }
  else if (a4 == 6 || a4 == 3)
  {
    return a3 - 1;
  }
  return v5;
}

- (unint64_t)level
{
  return self->_level;
}

- (unint64_t)style
{
  return self->_style;
}

- (PXZoomableInlineHeadersLayoutSpec)spec
{
  return self->_spec;
}

- (PXZoomableInlineHeadersDataSource)dataSource
{
  return self->_dataSource;
}

- (PXZoomableInlineHeadersLayoutGeometrySource)geometrySource
{
  return (PXZoomableInlineHeadersLayoutGeometrySource *)objc_loadWeakRetained((id *)&self->_geometrySource);
}

- (void)setGeometrySource:(id)a3
{
  objc_storeWeak((id *)&self->_geometrySource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_geometrySource);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_axSpriteIndexes, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_monthFormatter, 0);
  objc_storeStrong((id *)&self->_yearFormatter, 0);
}

void __45__PXInlineHeadersSpriteLayout__updateSprites__block_invoke(uint64_t a1, unint64_t a2, float32x2_t *a3, float *a4, float32x2_t *a5)
{
  unsigned int v6;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  CGFloat *v13;
  uint64_t v14;
  uint64_t v15;
  PXZoomableInlineHeaderViewConfiguration *v16;
  uint64_t v17;
  PXZoomableInlineHeaderViewConfiguration *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  _WORD *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double MinY;
  double v47;
  double v48;
  CGFloat MaxY;
  uint64_t v50;
  CGFloat v51;
  float v52;
  uint64_t v53;
  double v54;
  float32x2_t *v55;
  float *v56;
  double v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  unsigned int v67;
  BOOL v68;
  void *v69;
  _BOOL4 v70;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat v73;
  float64x2_t v74;
  float64_t v75;
  float64x2_t v76;
  BOOL v77;
  float v78;
  float32x2_t *v79;
  float *v80;
  float *v81;
  unsigned int v82;
  float v83;
  float32x2_t v84;
  float32x2_t v85;
  CGFloat v86;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
  float32x2_t *v90;
  float32x2_t v91;
  float32x2_t v92;
  double v93;
  double v94;
  float v95;
  void *v96;
  uint64_t v97;
  PXZoomableInlineHeaderViewConfiguration *v98;
  void *v99;
  double v102;
  double v103;
  __int16 v104;
  uint64_t v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  float v116;
  double v117;
  CGFloat v118;
  double v119;
  CGFloat height;
  CGFloat width;
  uint64_t v122;
  CGFloat y;
  uint64_t v124;
  CGFloat x;
  CGFloat v126;
  uint64_t v127;
  double v128;
  uint64_t v129;
  CGFloat v130;
  uint64_t v131;
  CGFloat v132;
  CGFloat rect;
  CGAffineTransform v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;

  v6 = a2;
  v8 = HIDWORD(a2);
  objc_msgSend(*(id *)(a1 + 32), "spec");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assetsDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = (CGFloat *)objc_msgSend(v12, "sectionInfos");

  objc_msgSend(*(id *)(a1 + 32), "geometrySource");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(*(id *)(a1 + 32), "level");
  objc_msgSend(*(id *)(a1 + 32), "displayScale");
  v16 = [PXZoomableInlineHeaderViewConfiguration alloc];
  v17 = objc_msgSend(*(id *)(a1 + 32), "style");
  v18 = v16;
  v19 = (void *)v14;
  v98 = -[PXZoomableInlineHeaderViewConfiguration initWithTitle:subtitle:swapTitleAndSubtitle:style:](v18, "initWithTitle:subtitle:swapTitleAndSubtitle:style:", CFSTR("AUGUST"), CFSTR("2019"), 0, v17);
  +[PXZoomableInlineHeaderView sizeWithConfiguration:](PXZoomableInlineHeaderView, "sizeWithConfiguration:");
  rect = v20;
  v118 = v21;
  objc_msgSend(*(id *)(a1 + 32), "alpha");
  v102 = v22;
  v23 = *(_WORD **)(a1 + 32);
  v24 = v23[556];
  objc_msgSend(v23, "visibleRect");
  v26 = v25;
  v131 = v27;
  v29 = v28;
  v31 = v30;
  objc_msgSend(*(id *)(a1 + 32), "safeAreaInsets");
  PXEdgeInsetsInsetRect();
  v127 = v33;
  v129 = v32;
  v122 = v35;
  v124 = v34;
  objc_msgSend(v19, "floatingHeadersMarginsForLevel:", v15);
  v37 = v36;
  v97 = a1;
  objc_msgSend(*(id *)(a1 + 32), "safeAreaInsets");
  objc_msgSend(v9, "headerFloatMarginsForSafeAreaInsets:");
  PXEdgeInsetsAdd();
  v39 = v38;
  v41 = v40;
  v42 = v129;
  v43 = v131;
  if (v37 <= 0.0)
    v43 = v127;
  else
    v42 = v26;
  v45 = v122;
  v44 = v124;
  if (v37 > 0.0)
  {
    v44 = v29;
    v45 = v31;
  }
  MinY = CGRectGetMinY(*(CGRect *)&v42);
  objc_msgSend(v9, "headerOffsetY");
  v48 = v47;
  if (v19)
    objc_msgSend(v19, "spriteTransformForLevel:", v15);
  objc_msgSend(v19, "boundsForLevel:", v15);
  MaxY = CGRectGetMaxY(v135);
  v99 = v11;
  *(double *)&v50 = COERCE_DOUBLE(objc_msgSend(v11, "identifier"));
  if ((_DWORD)v8)
  {
    v51 = *(double *)&v50;
    v96 = v9;
    v117 = v39 + MinY;
    v52 = v102;
    LODWORD(v53) = -1;
    v54 = 0.0;
    v114 = *(_OWORD *)off_1E50B83A0;
    v115 = *((_OWORD *)off_1E50B83A0 + 1);
    v132 = -100.0;
    v112 = *((_OWORD *)off_1E50B83A0 + 4);
    v113 = *((_OWORD *)off_1E50B83A0 + 5);
    v110 = *((_OWORD *)off_1E50B83A0 + 2);
    v111 = *((_OWORD *)off_1E50B83A0 + 3);
    v108 = *((_OWORD *)off_1E50B83A0 + 8);
    v109 = *((_OWORD *)off_1E50B83A0 + 9);
    v106 = *((_OWORD *)off_1E50B83A0 + 6);
    v107 = *((_OWORD *)off_1E50B83A0 + 7);
    v105 = v15;
    v56 = a4;
    v55 = a3;
    v128 = v48;
    v130 = 0.0;
    v57 = 0.0;
    v58 = rect;
    v59 = v118;
    v104 = v24;
    v103 = MaxY;
    v116 = v52;
    do
    {
      v60 = *v13;
      v134.a = v51;
      v134.b = 0.0;
      v134.c = v60;
      v134.d = NAN;
      objc_msgSend(v19, "frameForItemAtIndexPath:level:", &v134, v105, v96);
      y = v136.origin.y;
      x = v136.origin.x;
      height = v136.size.height;
      width = v136.size.width;
      v61 = v128 + CGRectGetMinY(v136);
      v137.origin.x = v41;
      v137.origin.y = v61;
      v137.size.width = v58;
      v137.size.height = v59;
      v62 = CGRectGetMinY(v137);
      v138.origin.x = v57;
      v64 = v130;
      v63 = v132;
      v138.origin.y = v132;
      v138.size.width = v130;
      v138.size.height = v54;
      v119 = v62 - CGRectGetMaxY(v138);
      v139.origin.x = v41;
      v139.origin.y = v61;
      v139.size.width = rect;
      v139.size.height = v59;
      v65 = v103 - CGRectGetMaxY(v139);
      memset(&v134, 0, sizeof(v134));
      v140.origin.y = y;
      v140.origin.x = x;
      v140.size.height = height;
      v140.size.width = width;
      v141 = CGRectApplyAffineTransform(v140, &v134);
      v66 = v128 + CGRectGetMinY(v141);
      if (v66 > v117)
        v67 = v53;
      else
        v67 = v6;
      v68 = v119 < 50.0 || v65 < 50.0;
      v59 = v118;
      if (v68)
        v53 = v53;
      else
        v53 = v67;
      if (!v68)
      {
        v57 = v41;
        v63 = v61;
        v64 = rect;
      }
      v130 = v64;
      v132 = v63;
      if (!v68)
        v54 = v118;
      v69 = v19;
      v70 = v68 || v66 <= v117;
      v142.origin.x = v41;
      v142.origin.y = v66;
      v142.size.width = rect;
      v142.size.height = v118;
      MidX = CGRectGetMidX(v142);
      v143.origin.x = v41;
      v143.origin.y = v66;
      v143.size.width = rect;
      v143.size.height = v118;
      MidY = CGRectGetMidY(v143);
      v144.origin.x = v41;
      v144.origin.y = v66;
      v144.size.width = rect;
      v144.size.height = v118;
      v126 = CGRectGetWidth(v144);
      v145.origin.x = v41;
      v145.origin.y = v66;
      v58 = rect;
      v145.size.width = rect;
      v145.size.height = v118;
      v73 = CGRectGetHeight(v145);
      v74.f64[0] = v126;
      v74.f64[1] = v73;
      *(CGFloat *)v55 = MidX;
      *(CGFloat *)&v55[1] = MidY;
      v55[3] = vcvt_f32_f64(v74);
      v55[2] = (float32x2_t)0xBFF0000000000000;
      a5->i16[0] = 2561;
      PXSizeScale();
      v76.f64[1] = v75;
      a5[1] = vcvt_f32_f64(v76);
      a5[4].i16[0] = v104;
      *(_OWORD *)v56 = v114;
      *((_OWORD *)v56 + 1) = v115;
      *((_OWORD *)v56 + 4) = v112;
      *((_OWORD *)v56 + 5) = v113;
      *((_OWORD *)v56 + 2) = v110;
      *((_OWORD *)v56 + 3) = v111;
      *((_OWORD *)v56 + 8) = v108;
      *((_OWORD *)v56 + 9) = v109;
      *((_OWORD *)v56 + 6) = v106;
      *((_OWORD *)v56 + 7) = v107;
      v77 = !v70;
      v19 = v69;
      ++v6;
      a5 += 5;
      v78 = 0.0;
      if (v77)
        v78 = v116;
      *v56 = v78;
      v56 += 40;
      v13 += 4;
      v55 += 4;
      LODWORD(v8) = v8 - 1;
    }
    while ((_DWORD)v8);
    v9 = v96;
    *(_BYTE *)(*(_QWORD *)(v97 + 32) + 1114) = v102 == 0.0;
    if ((_DWORD)v53 != -1)
    {
      v79 = &a3[4 * v53];
      v80 = &a4[40 * v53];
      *(double *)&v79[1] = v117 + v79[3].f32[1] * 0.5;
      *v80 = v116;
      v81 = v80 + 40;
      v82 = objc_msgSend(*(id *)(v97 + 32), "localNumberOfSprites");
      while (++v53 < (unint64_t)v82)
      {
        v83 = *v81;
        v81 += 40;
        if (v83 != 0.0)
        {
          v84 = v79[3];
          v85 = vmul_f32(v84, (float32x2_t)0x3F0000003F000000);
          v86 = *(double *)v79 - v85.f32[0];
          v87 = *(double *)&v79[1] - v85.f32[1];
          v88 = v84.f32[0];
          v89 = v84.f32[1];
          v90 = &a3[4 * v53];
          v91 = v90[3];
          v92 = vmul_f32(v91, (float32x2_t)0x3F0000003F000000);
          v146.origin.x = *(double *)v90 - v92.f32[0];
          v146.origin.y = *(double *)&v90[1] - v92.f32[1];
          v146.size.width = v91.f32[0];
          v146.size.height = v91.f32[1];
          v93 = CGRectGetMinY(v146);
          v147.origin.x = v86;
          v147.origin.y = v87;
          v147.size.width = v88;
          v147.size.height = v89;
          if (v93 - CGRectGetMaxY(v147) < 10.0)
          {
            PXClamp();
            if (v102 < v94)
              v94 = v102;
            v95 = v94;
            *v80 = v95;
          }
          break;
        }
      }
    }
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1114) = v102 == 0.0;
  }

}

@end
