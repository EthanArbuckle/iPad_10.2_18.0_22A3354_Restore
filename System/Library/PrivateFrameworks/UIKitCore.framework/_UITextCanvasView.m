@implementation _UITextCanvasView

- (_UITextCanvasView)initWithFrame:(CGRect)a3
{
  _UITextCanvasView *v3;
  _UITextCanvasView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UITextCanvasView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    -[UIView setContentMode:](v4, "setContentMode:", 9);
    if (-[_UITextCanvasView _enableAutoConstraining](v4, "_enableAutoConstraining"))
      -[UIView _addGeometryChangeObserver:](v4, v4);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  if (-[_UITextCanvasView _enableAutoConstraining](self, "_enableAutoConstraining"))
    -[UIView _removeGeometryChangeObserver:](self, self);
  v3.receiver = self;
  v3.super_class = (Class)_UITextCanvasView;
  -[UIView dealloc](&v3, sel_dealloc);
}

+ (Class)layerClass
{
  if (_MergedGlobals_9_7 != -1)
    dispatch_once(&_MergedGlobals_9_7, &__block_literal_global_564);
  return (Class)(id)qword_1ECD7ADC0;
}

- (BOOL)_enableAutoConstraining
{
  return 1;
}

- (void)_updateTilingViewportLayer
{
  void *v3;
  id v4;

  if (-[_UITextCanvasView _enableAutoConstraining](self, "_enableAutoConstraining"))
  {
    -[UIView layer](self, "layer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UIView window](self, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_updateTilingViewportWindow:", v3);

  }
}

- (void)setBounds:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UITextCanvasView;
  -[UIView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_UITextCanvasView _updateTilingViewportLayer](self, "_updateTilingViewportLayer");
}

- (void)setFrame:(CGRect)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UITextCanvasView;
  -[UIView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[_UITextCanvasView _updateTilingViewportLayer](self, "_updateTilingViewportLayer");
}

- (void)setTilingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UIView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUsesTiledLayers:", v3);

}

- (BOOL)isTilingEnabled
{
  void *v2;
  char v3;

  -[UIView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usesTiledLayers");

  return v3;
}

- (void)setMaxTileHeight:(double)a3
{
  id v4;

  -[UIView layer](self, "layer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaxTileHeight:", a3);

}

- (double)maxTileHeight
{
  void *v2;
  double v3;
  double v4;

  -[UIView layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maxTileHeight");
  v4 = v3;

  return v4;
}

- (void)suspendTiling
{
  id v2;

  -[UIView layer](self, "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suspendTiling");

}

- (void)resumeTiling
{
  id v2;

  -[UIView layer](self, "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resumeTiling");

}

- (void)_setDrawsDebugBaselines:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[_UITextCanvasView context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textLayoutController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDrawsDebugBaselines:", v3);

  -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  -[UIView _setNeedsContentsFormatUpdate](self, "_setNeedsContentsFormatUpdate");
}

- (BOOL)_drawsDebugBaselines
{
  void *v2;
  void *v3;
  char v4;

  -[_UITextCanvasView context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textLayoutController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "drawsDebugBaselines");

  return v4;
}

- (id)_textTiledLayer:(id)a3 maskedRectsInVisibleRect:(CGRect)a4
{
  NSArray *v5;
  NSArray *v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _UIBoundingTextRectsSolver *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  uint64_t k;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  _UIBoundingTextRectsSolver *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t m;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  NSArray *maskedRects;
  NSArray *v48;
  NSMutableSet *obj;
  NSMutableSet *obja;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  NSArray *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  if (!self->_maskedRects)
  {
    if (-[NSMutableSet count](self->_ghostedRanges, "count", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height)|| -[NSMutableSet count](self->_invisibleRanges, "count"))
    {
      -[_UITextCanvasView context](self, "context");
      v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v6 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableSet count](self->_invisibleRanges, "count")+ -[NSMutableSet count](self->_ghostedRanges, "count"));
      v59 = v5;
      -[NSArray textContainer](v5, "textContainer");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = 0u;
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      obj = self->_ghostedRanges;
      v54 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
      if (v54)
      {
        v52 = *(_QWORD *)v73;
        do
        {
          for (i = 0; i != v54; ++i)
          {
            if (*(_QWORD *)v73 != v52)
              objc_enumerationMutation(obj);
            v8 = objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * i), "rangeValue");
            v10 = v9;
            -[NSArray textLayoutController](v59, "textLayoutController");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "textRangeForCharacterRange:", v8, v10);
            v12 = objc_claimAutoreleasedReturnValue();

            v56 = (void *)v12;
            v13 = -[_UIBoundingTextRectsSolver initWithTextContainer:range:unifyRects:]([_UIBoundingTextRectsSolver alloc], "initWithTextContainer:range:unifyRects:", v58, v12, 0);
            v68 = 0u;
            v69 = 0u;
            v70 = 0u;
            v71 = 0u;
            -[_UIBoundingTextRectsSolver rects](v13, "rects");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
            if (v15)
            {
              v16 = v15;
              v17 = *(_QWORD *)v69;
              do
              {
                for (j = 0; j != v16; ++j)
                {
                  if (*(_QWORD *)v69 != v17)
                    objc_enumerationMutation(v14);
                  objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * j), "CGRectValue");
                  UIFloorToViewScale(self);
                  v20 = v19;
                  UIFloorToViewScale(self);
                  v22 = v21;
                  UIFloorToViewScale(self);
                  v24 = v23;
                  UIFloorToViewScale(self);
                  +[_UITextTiledLayerMaskedRect ghostedRect:](_UITextTiledLayerMaskedRect, "ghostedRect:", v20, v22, v24, v25);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSArray addObject:](v6, "addObject:", v26);

                }
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
              }
              while (v16);
            }

          }
          v54 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
        }
        while (v54);
      }

      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      obja = self->_invisibleRanges;
      v55 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
      if (v55)
      {
        v53 = *(_QWORD *)v65;
        do
        {
          for (k = 0; k != v55; ++k)
          {
            if (*(_QWORD *)v65 != v53)
              objc_enumerationMutation(obja);
            v28 = objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * k), "rangeValue");
            v30 = v29;
            -[NSArray textLayoutController](v59, "textLayoutController");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "textRangeForCharacterRange:", v28, v30);
            v32 = objc_claimAutoreleasedReturnValue();

            v57 = (void *)v32;
            v33 = -[_UIBoundingTextRectsSolver initWithTextContainer:range:unifyRects:]([_UIBoundingTextRectsSolver alloc], "initWithTextContainer:range:unifyRects:", v58, v32, 0);
            v60 = 0u;
            v61 = 0u;
            v62 = 0u;
            v63 = 0u;
            -[_UIBoundingTextRectsSolver rects](v33, "rects");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
            if (v35)
            {
              v36 = v35;
              v37 = *(_QWORD *)v61;
              do
              {
                for (m = 0; m != v36; ++m)
                {
                  if (*(_QWORD *)v61 != v37)
                    objc_enumerationMutation(v34);
                  objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * m), "CGRectValue");
                  UIFloorToViewScale(self);
                  v40 = v39;
                  UIFloorToViewScale(self);
                  v42 = v41;
                  UIFloorToViewScale(self);
                  v44 = v43;
                  UIFloorToViewScale(self);
                  +[_UITextTiledLayerMaskedRect rect:alpha:](_UITextTiledLayerMaskedRect, "rect:alpha:", v40, v42, v44, v45, 0.0);
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSArray addObject:](v6, "addObject:", v46);

                }
                v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v60, v76, 16);
              }
              while (v36);
            }

          }
          v55 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
        }
        while (v55);
      }

      maskedRects = self->_maskedRects;
      self->_maskedRects = v6;

      v48 = v59;
    }
    else
    {
      v48 = self->_maskedRects;
      self->_maskedRects = (NSArray *)MEMORY[0x1E0C9AA60];
    }

  }
  return self->_maskedRects;
}

- (void)addGhostedRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSMutableSet *ghostedRanges;
  NSMutableSet *v7;
  NSMutableSet *v8;
  void *v9;

  length = a3.length;
  location = a3.location;
  ghostedRanges = self->_ghostedRanges;
  if (!ghostedRanges)
  {
    v7 = (NSMutableSet *)objc_opt_new();
    v8 = self->_ghostedRanges;
    self->_ghostedRanges = v7;

    ghostedRanges = self->_ghostedRanges;
  }
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", location, length);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](ghostedRanges, "addObject:", v9);

  -[_UITextCanvasView setNeedsLayout](self, "setNeedsLayout");
  -[UIView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)removeAllGhostedRanges
{
  NSMutableSet *ghostedRanges;

  ghostedRanges = self->_ghostedRanges;
  if (ghostedRanges)
  {
    self->_ghostedRanges = 0;

    -[_UITextCanvasView setNeedsLayout](self, "setNeedsLayout");
    -[UIView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)addInvisibleRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSMutableSet *invisibleRanges;
  NSMutableSet *v7;
  NSMutableSet *v8;
  void *v9;

  length = a3.length;
  location = a3.location;
  invisibleRanges = self->_invisibleRanges;
  if (!invisibleRanges)
  {
    v7 = (NSMutableSet *)objc_opt_new();
    v8 = self->_invisibleRanges;
    self->_invisibleRanges = v7;

    invisibleRanges = self->_invisibleRanges;
  }
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", location, length);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](invisibleRanges, "addObject:", v9);

  -[_UITextCanvasView setNeedsLayout](self, "setNeedsLayout");
  -[UIView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)removeInvisibleRange:(_NSRange)a3
{
  id v4;

  if (self->_invisibleRanges)
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a3.location, a3.length);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (-[NSMutableSet containsObject:](self->_invisibleRanges, "containsObject:"))
    {
      -[NSMutableSet removeObject:](self->_invisibleRanges, "removeObject:", v4);
      -[_UITextCanvasView setNeedsLayout](self, "setNeedsLayout");
      -[UIView setNeedsDisplay](self, "setNeedsDisplay");
    }

  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UITextCanvasView;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[_UITextCanvasView _updateTilingViewportLayer](self, "_updateTilingViewportLayer");
}

- (void)setNeedsLayout
{
  NSArray *maskedRects;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UITextCanvasView;
  -[UIView setNeedsLayout](&v4, sel_setNeedsLayout);
  maskedRects = self->_maskedRects;
  self->_maskedRects = 0;

}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  _QWORD *ContextStack;
  CGContext *v14;
  CGAffineTransform v15;
  CGRect v16;
  CGRect v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UITextCanvasView context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "drawingScale");
  v10 = v9;
  v12 = v11;

  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1)
    v14 = 0;
  else
    v14 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  CGContextSaveGState(v14);
  CGContextScaleCTM(v14, v10, v12);
  CGAffineTransformMakeScale(&v15, 1.0 / v10, 1.0 / v12);
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  v17 = CGRectApplyAffineTransform(v16, &v15);
  -[_UITextCanvasView drawTextInRect:](self, "drawTextInRect:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
  CGContextRestoreGState(v14);
}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  if ((a3->var0 & 0xE) != 0)
    -[_UITextCanvasView setNeedsLayout](self, "setNeedsLayout");
}

- (void)configureCustomTextRenderer
{
  unint64_t v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  _UITextCanvasView *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = configureCustomTextRenderer___s_category;
  if (!configureCustomTextRenderer___s_category)
  {
    v3 = __UILogCategoryGetNode("Text", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&configureCustomTextRenderer___s_category);
  }
  v4 = *(NSObject **)(v3 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 136446466;
    v6 = "-[_UITextCanvasView configureCustomTextRenderer]";
    v7 = 2050;
    v8 = self;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "Unexpected call to %{public}s on _UITextCanvasView %{public}p. This method is only expected to be called in a TextKit 2 context and is a no-op in TextKit 1.", (uint8_t *)&v5, 0x16u);
  }
}

- (void)flushFragmentViews
{
  unint64_t v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  _UITextCanvasView *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = flushFragmentViews___s_category;
  if (!flushFragmentViews___s_category)
  {
    v3 = __UILogCategoryGetNode("Text", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v3, (unint64_t *)&flushFragmentViews___s_category);
  }
  v4 = *(NSObject **)(v3 + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 136446466;
    v6 = "-[_UITextCanvasView flushFragmentViews]";
    v7 = 2050;
    v8 = self;
    _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "Unexpected call to %{public}s on _UITextCanvasView %{public}p. This method is only expected to be called in a TextKit 2 context and is a no-op in TextKit 1.", (uint8_t *)&v5, 0x16u);
  }
}

- (_UITextKit1CanvasContext)context
{
  return (_UITextKit1CanvasContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void)setContext:(id)a3
{
  objc_storeWeak((id *)&self->_context, a3);
}

- (BOOL)layoutFragmentViewsNeedDisplay
{
  return self->_layoutFragmentViewsNeedDisplay;
}

- (void)setLayoutFragmentViewsNeedDisplay:(BOOL)a3
{
  self->_layoutFragmentViewsNeedDisplay = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_context);
  objc_storeStrong((id *)&self->_maskedRects, 0);
  objc_storeStrong((id *)&self->_invisibleRanges, 0);
  objc_storeStrong((id *)&self->_ghostedRanges, 0);
}

@end
