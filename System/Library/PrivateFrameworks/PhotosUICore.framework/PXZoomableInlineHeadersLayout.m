@implementation PXZoomableInlineHeadersLayout

- (PXZoomableInlineHeadersLayout)initWithDataSourceManager:(id)a3
{
  id v5;
  PXZoomableInlineHeadersLayout *v6;
  PXZoomableInlineHeadersLayout *v7;
  PXInlineHeadersSpriteLayout *v8;
  PXInlineHeadersSpriteLayout *yearsLayout;
  PXInlineHeadersSpriteLayout *v10;
  PXInlineHeadersSpriteLayout *monthsLayout;
  uint64_t *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v16;
  void *v17;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXZoomableInlineHeadersLayout;
  v6 = -[PXGLayout init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataSourceManager, a3);
    objc_msgSend(v5, "registerChangeObserver:context:", v7, PXCuratedLibraryInlineHeadersObserverContext);
    v8 = -[PXInlineHeadersSpriteLayout initWithLevel:]([PXInlineHeadersSpriteLayout alloc], "initWithLevel:", 0);
    yearsLayout = v7->_yearsLayout;
    v7->_yearsLayout = v8;

    v10 = -[PXInlineHeadersSpriteLayout initWithLevel:]([PXInlineHeadersSpriteLayout alloc], "initWithLevel:", 1);
    monthsLayout = v7->_monthsLayout;
    v7->_monthsLayout = v10;

    -[PXGSplitLayout setFirstSublayout:](v7, "setFirstSublayout:", v7->_yearsLayout);
    -[PXGSplitLayout setSecondSublayout:](v7, "setSecondSublayout:", v7->_monthsLayout);
    -[PXGSplitLayout setMode:](v7, "setMode:", 4);
    p_updateFlags = (uint64_t *)&v7->_updateFlags;
    needsUpdate = v7->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!v7->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        *p_updateFlags = needsUpdate | 1;
        goto LABEL_8;
      }
LABEL_6:
      if ((v7->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomableInlineHeadersLayout initWithDataSourceManager:]");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PXZoomableInlineHeadersLayout.m"), 63, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_7;
    }
    if (v7->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = v7->_updateFlags.willPerformUpdate;
    *p_updateFlags = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](v7, "setNeedsUpdate");
  }
LABEL_8:

  return v7;
}

- (void)setGeometrySource:(id)a3
{
  PXInlineHeadersSpriteLayout *yearsLayout;
  id v5;

  yearsLayout = self->_yearsLayout;
  v5 = a3;
  -[PXInlineHeadersSpriteLayout setGeometrySource:](yearsLayout, "setGeometrySource:", v5);
  -[PXInlineHeadersSpriteLayout setGeometrySource:](self->_monthsLayout, "setGeometrySource:", v5);

}

- (void)setSpec:(id)a3
{
  PXZoomableInlineHeadersLayoutSpec *v5;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v9;
  void *v10;
  PXZoomableInlineHeadersLayoutSpec *v11;

  v5 = (PXZoomableInlineHeadersLayoutSpec *)a3;
  if (self->_spec != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    -[PXInlineHeadersSpriteLayout setSpec:](self->_yearsLayout, "setSpec:", v11);
    -[PXInlineHeadersSpriteLayout setSpec:](self->_monthsLayout, "setSpec:", v11);
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
LABEL_8:
        v5 = v11;
        goto LABEL_9;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 1;
      v5 = v11;
      if (willPerformUpdate)
        goto LABEL_9;
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate", v11);
      goto LABEL_8;
    }
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomableInlineHeadersLayout setSpec:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXZoomableInlineHeadersLayout.m"), 80, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_7;
  }
LABEL_9:

}

- (void)setYearsAlpha:(double)a3
{
  -[PXGLayout setAlpha:](self->_yearsLayout, "setAlpha:", a3);
}

- (double)yearsAlpha
{
  double result;

  -[PXGLayout alpha](self->_yearsLayout, "alpha");
  return result;
}

- (void)setMonthsAlpha:(double)a3
{
  -[PXGLayout setAlpha:](self->_monthsLayout, "setAlpha:", a3);
}

- (double)monthsAlpha
{
  double result;

  -[PXGLayout alpha](self->_monthsLayout, "alpha");
  return result;
}

- (void)invalidateAnchorItemFrames
{
  -[PXInlineHeadersSpriteLayout invalidateAnchorItemFrames](self->_yearsLayout, "invalidateAnchorItemFrames");
  -[PXInlineHeadersSpriteLayout invalidateAnchorItemFrames](self->_monthsLayout, "invalidateAnchorItemFrames");
}

- (void)invalidateGeometry
{
  -[PXInlineHeadersSpriteLayout invalidateAnchorItemFrames](self->_yearsLayout, "invalidateAnchorItemFrames");
  -[PXInlineHeadersSpriteLayout invalidateAnchorItemFrames](self->_monthsLayout, "invalidateAnchorItemFrames");
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomableInlineHeadersLayout update]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXZoomableInlineHeadersLayout.m"), 110, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXZoomableInlineHeadersLayout _updateSublayouts](self, "_updateSublayouts");
      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (needsUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomableInlineHeadersLayout update]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXZoomableInlineHeadersLayout.m"), 116, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v9.receiver = self;
  v9.super_class = (Class)PXZoomableInlineHeadersLayout;
  -[PXGSplitLayout update](&v9, sel_update);
}

- (void)_updateSublayouts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[PXZoomableInlineHeadersLayout dataSourceManager](self, "dataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "yearsDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXInlineHeadersSpriteLayout setDataSource:](self->_yearsLayout, "setDataSource:", v4);

  -[PXZoomableInlineHeadersLayout dataSourceManager](self, "dataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "monthsDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXInlineHeadersSpriteLayout setDataSource:](self->_monthsLayout, "setDataSource:", v6);

  -[PXZoomableInlineHeadersLayout spec](self, "spec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "style");

  -[PXInlineHeadersSpriteLayout setStyle:](self->_yearsLayout, "setStyle:", v8);
  -[PXInlineHeadersSpriteLayout setStyle:](self->_monthsLayout, "setStyle:", v8);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a4;
  v9 = a3;
  if ((void *)PXCuratedLibraryInlineHeadersObserverContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXZoomableInlineHeadersLayout.m"), 135, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
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
LABEL_7:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXZoomableInlineHeadersLayout observable:didChange:context:]");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("PXZoomableInlineHeadersLayout.m"), 132, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_8;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_7;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
    {
      v16 = v9;
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      v9 = v16;
    }
  }
LABEL_9:

}

- (PXZoomableInlineHeadersDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (PXZoomableInlineHeadersLayoutSpec)spec
{
  return self->_spec;
}

- (PXZoomableInlineHeadersLayoutGeometrySource)geometrySource
{
  return (PXZoomableInlineHeadersLayoutGeometrySource *)objc_loadWeakRetained((id *)&self->_geometrySource);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_geometrySource);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_monthsLayout, 0);
  objc_storeStrong((id *)&self->_yearsLayout, 0);
}

@end
