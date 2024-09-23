@implementation _UIViewLayoutEngineRelativeAlignmentRectOriginCache

- (CGPoint)origin
{
  _BOOL4 v3;
  id WeakRetained;
  void *v5;
  int v6;
  CGPoint *p_cachedOrigin;
  CGFloat *p_y;
  double x;
  double v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  double v23;
  id v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  CGPoint result;

  v3 = -[_UIViewLayoutEngineRelativeAlignmentRectOriginCache isValid](self, "isValid");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (v3)
  {
    v6 = objc_msgSend(WeakRetained, "_canBecomeLayoutEngineDelegate");
    p_cachedOrigin = &self->_cachedOrigin;
    p_y = &self->_cachedOrigin.y;
    if (v6)
    {
      p_y = (CGFloat *)(MEMORY[0x1E0C9D538] + 8);
      p_cachedOrigin = (CGPoint *)MEMORY[0x1E0C9D538];
    }
    x = p_cachedOrigin->x;
    v10 = *p_y;
    goto LABEL_11;
  }
  objc_msgSend(WeakRetained, "_layoutEngine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v12, "_layoutEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v13, "superview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "_layoutEngine");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15 == v5)
    {
      -[UIView _alignmentRectOriginCacheCreateIfNecessary:](v14, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "origin");
      v16 = v19;
      v17 = v20;

    }
    else
    {
      v16 = *MEMORY[0x1E0C9D538];
      v17 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    }
    v21 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v21, "nsli_minXVariable");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForVariable:", v22);
    x = v16 + round(v23);

    v24 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v24, "nsli_minYVariable");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForVariable:", v25);
    v10 = v17 + round(v26);

    self->_cachedOrigin.x = x;
    self->_cachedOrigin.y = v10;
    -[_UIViewLayoutEngineRelativeAlignmentRectOriginCache setCacheEngine:](self, "setCacheEngine:", v5);
    self->_variableChangeCount = objc_msgSend(v5, "variableChangeCount");

LABEL_11:
    goto LABEL_12;
  }
  x = *MEMORY[0x1E0C9D538];
  v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
LABEL_12:
  v27 = x;
  v28 = v10;
  result.y = v28;
  result.x = v27;
  return result;
}

- (BOOL)isValid
{
  UIView **p_delegate;
  id WeakRetained;
  id v5;
  id v6;
  BOOL v7;
  id v8;
  id v9;
  uint64_t v10;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "_layoutEngine");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = objc_loadWeakRetained((id *)p_delegate);
  if ((objc_msgSend(v6, "_canBecomeLayoutEngineDelegate") & 1) != 0)
  {
    v7 = 1;
  }
  else if (v5)
  {
    v8 = objc_loadWeakRetained((id *)&self->_cacheEngine);
    if (v5 == v8)
    {
      v9 = objc_loadWeakRetained((id *)&self->_cacheEngine);
      v10 = objc_msgSend(v9, "variableChangeCount");
      v7 = v10 == -[_UIViewLayoutEngineRelativeAlignmentRectOriginCache variableChangeCount](self, "variableChangeCount");

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)variableChangeCount
{
  return self->_variableChangeCount;
}

- (void)setCacheEngine:(id)a3
{
  objc_storeWeak((id *)&self->_cacheEngine, a3);
}

- (_UIViewLayoutEngineRelativeAlignmentRectOriginCache)initWithDelegate:(id)a3
{
  id v4;
  _UIViewLayoutEngineRelativeAlignmentRectOriginCache *v5;
  _UIViewLayoutEngineRelativeAlignmentRectOriginCache *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIViewLayoutEngineRelativeAlignmentRectOriginCache;
  v5 = -[_UIViewLayoutEngineRelativeAlignmentRectOriginCache init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cacheEngine);
  objc_destroyWeak((id *)&self->_delegate);
}

- (UIView)delegate
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSISEngine)cacheEngine
{
  return (NSISEngine *)objc_loadWeakRetained((id *)&self->_cacheEngine);
}

- (void)setVariableChangeCount:(unint64_t)a3
{
  self->_variableChangeCount = a3;
}

@end
