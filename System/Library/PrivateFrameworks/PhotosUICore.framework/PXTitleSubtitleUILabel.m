@implementation PXTitleSubtitleUILabel

- (PXTitleSubtitleUILabel)initWithCoder:(id)a3
{
  PXTitleSubtitleUILabel *v3;
  PXTitleSubtitleUILabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXTitleSubtitleUILabel;
  v3 = -[PXTitleSubtitleUILabel initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[PXTitleSubtitleUILabel _PXTitleSubtitleUILabelCommonInitialization](v3, "_PXTitleSubtitleUILabelCommonInitialization");
  return v4;
}

- (PXTitleSubtitleUILabel)initWithFrame:(CGRect)a3
{
  PXTitleSubtitleUILabel *v3;
  PXTitleSubtitleUILabel *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXTitleSubtitleUILabel;
  v3 = -[PXTitleSubtitleUILabel initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PXTitleSubtitleUILabel _PXTitleSubtitleUILabelCommonInitialization](v3, "_PXTitleSubtitleUILabelCommonInitialization");
  return v4;
}

- (void)_PXTitleSubtitleUILabelCommonInitialization
{
  void *v3;
  id v4;

  +[PXKitSettings sharedInstance](PXKitSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_rendersTextAsynchronously = objc_msgSend(v3, "defaultAsyncTextRenderingEnabled");

  +[PXKitSettings sharedInstance](PXKitSettings, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  self->_typesettingMode = objc_msgSend(v4, "defaultLabelTypesettingMode");

}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXTitleSubtitleUILabel bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16.receiver = self;
  v16.super_class = (Class)PXTitleSubtitleUILabel;
  -[PXTitleSubtitleUILabel setBounds:](&v16, sel_setBounds_, x, y, width, height);
  -[PXTitleSubtitleUILabel _handleChangeFromBounds:](self, "_handleChangeFromBounds:", v9, v11, v13, v15);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXTitleSubtitleUILabel bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16.receiver = self;
  v16.super_class = (Class)PXTitleSubtitleUILabel;
  -[PXTitleSubtitleUILabel setFrame:](&v16, sel_setFrame_, x, y, width, height);
  -[PXTitleSubtitleUILabel _handleChangeFromBounds:](self, "_handleChangeFromBounds:", v9, v11, v13, v15);
}

- (void)_handleChangeFromBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect v8;
  CGRect v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXTitleSubtitleUILabel bounds](self, "bounds");
  v9.origin.x = x;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  if (!CGRectEqualToRect(v8, v9))
    -[PXTitleSubtitleUILabel _invalidateLayerPromise](self, "_invalidateLayerPromise");
}

- (void)setTitleText:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *titleText;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_titleText;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      titleText = self->_titleText;
      self->_titleText = v6;

      -[PXTitleSubtitleUILabel _invalidateLayerPromise](self, "_invalidateLayerPromise");
    }
  }

}

- (void)setSubtitleText:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *subtitleText;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_subtitleText;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      subtitleText = self->_subtitleText;
      self->_subtitleText = v6;

      -[PXTitleSubtitleUILabel _invalidateLayerPromise](self, "_invalidateLayerPromise");
    }
  }

}

- (void)setSpec:(id)a3
{
  PXTitleSubtitleLabelSpec *v5;
  char v6;
  PXTitleSubtitleLabelSpec *v7;

  v7 = (PXTitleSubtitleLabelSpec *)a3;
  v5 = self->_spec;
  if (v5 == v7)
  {

  }
  else
  {
    v6 = -[PXTitleSubtitleLabelSpec isEqual:](v7, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_spec, a3);
      -[PXTitleSubtitleUILabel _invalidateLayerPromise](self, "_invalidateLayerPromise");
    }
  }

}

- (void)setTypesettingMode:(int64_t)a3
{
  if (self->_typesettingMode != a3)
  {
    self->_typesettingMode = a3;
    -[PXTitleSubtitleUILabel _invalidateLayerPromise](self, "_invalidateLayerPromise");
  }
}

- (void)setRendersTextAsynchronously:(BOOL)a3
{
  if (self->_rendersTextAsynchronously != a3)
  {
    self->_rendersTextAsynchronously = a3;
    -[PXTitleSubtitleUILabel _invalidateLayerPromise](self, "_invalidateLayerPromise");
  }
}

- (void)setShouldRasterizeTextLayer:(BOOL)a3
{
  if (self->_shouldRasterizeTextLayer != a3)
  {
    self->_shouldRasterizeTextLayer = a3;
    -[PXTitleSubtitleUILabel _updateContentLayer](self, "_updateContentLayer");
  }
}

- (double)lastBaseline
{
  void *v3;
  double v4;
  double v5;

  -[PXTitleSubtitleUILabel _updateLayerPromiseIfNeeded](self, "_updateLayerPromiseIfNeeded");
  -[PXTitleSubtitleUILabel _layerPromise](self, "_layerPromise");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layerLastBaseline");
  v5 = v4;

  return v5;
}

- (NSArray)diagnosticsRenderedLines
{
  void *v2;
  void *v3;

  -[PXTitleSubtitleUILabel _layerPromise](self, "_layerPromise");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "diagnosticsRenderedLines");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)_setLayerPromise:(id)a3
{
  PXTitleSubtitleCALayerPromise *v5;
  PXTitleSubtitleCALayerPromise **p_layerPromise;
  PXTitleSubtitleCALayerPromise *layerPromise;
  PXTitleSubtitleCALayerPromise *v8;

  v5 = (PXTitleSubtitleCALayerPromise *)a3;
  p_layerPromise = &self->__layerPromise;
  layerPromise = self->__layerPromise;
  if (layerPromise != v5)
  {
    v8 = v5;
    -[PXTitleSubtitleCALayerPromise unregisterChangeObserver:context:](layerPromise, "unregisterChangeObserver:context:", self, PXLayerPromiseObservationContext);
    objc_storeStrong((id *)&self->__layerPromise, a3);
    -[PXTitleSubtitleCALayerPromise registerChangeObserver:context:](*p_layerPromise, "registerChangeObserver:context:", self, PXLayerPromiseObservationContext);
    -[PXCALayerPromise startLayerRealization](*p_layerPromise, "startLayerRealization");
    -[PXTitleSubtitleUILabel _updateContentLayer](self, "_updateContentLayer");
    v5 = v8;
  }

}

- (void)_setContentLayer:(id)a3
{
  CALayer *v5;
  CALayer **p_contentLayer;
  CALayer *contentLayer;
  void *v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double Width;
  double Height;
  void *v25;
  double v26;
  double v27;
  CALayer *v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v5 = (CALayer *)a3;
  p_contentLayer = &self->__contentLayer;
  contentLayer = self->__contentLayer;
  if (contentLayer != v5)
  {
    v28 = v5;
    -[CALayer removeFromSuperlayer](contentLayer, "removeFromSuperlayer");
    objc_storeStrong((id *)&self->__contentLayer, a3);
    v5 = v28;
    if (v28)
    {
      +[PXMemoriesRelatedSettings sharedInstance](PXMemoriesRelatedSettings, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "showMemoryTitleLayer");

      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "colorWithAlphaComponent:", 0.5);
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        -[CALayer setBackgroundColor:](v28, "setBackgroundColor:", objc_msgSend(v11, "CGColor"));

      }
      -[PXTitleSubtitleUILabel layer](self, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bounds");
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;
      -[CALayer setAnchorPoint:](v28, "setAnchorPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
      -[CALayer bounds](v28, "bounds");
      v22 = v21;
      if (-[PXTitleSubtitleUILabel effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == 1)
      {
        v29.origin.x = v14;
        v29.origin.y = v16;
        v29.size.width = v18;
        v29.size.height = v20;
        Width = CGRectGetWidth(v29);
        -[CALayer bounds](v28, "bounds");
        v22 = Width - CGRectGetMaxX(v30);
      }
      -[CALayer bounds](v28, "bounds");
      Height = CGRectGetHeight(v31);
      -[PXTitleSubtitleUILabel _layerPromise](self, "_layerPromise");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "layerLastBaseline");
      v27 = Height - v26;

      -[CALayer setPosition:](v28, "setPosition:", v22, v27);
      objc_msgSend(v12, "addSublayer:", *p_contentLayer);

      v5 = v28;
    }
  }

}

- (CGRect)contentBounds
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[PXTitleSubtitleUILabel _updateLayerPromiseIfNeeded](self, "_updateLayerPromiseIfNeeded");
  -[PXTitleSubtitleUILabel _layerPromise](self, "_layerPromise");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layerContentBounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXTitleSubtitleUILabel;
  -[PXTitleSubtitleUILabel layoutSubviews](&v3, sel_layoutSubviews);
  -[PXTitleSubtitleUILabel _updateLayerPromiseIfNeeded](self, "_updateLayerPromiseIfNeeded");
}

- (void)_invalidateLayerPromise
{
  self->_needsUpdateLayerPromise = 1;
  -[PXTitleSubtitleUILabel setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateLayerPromiseIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  PXTitleSubtitleCALayerPromise *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  if (self->_needsUpdateLayerPromise)
  {
    self->_needsUpdateLayerPromise = 0;
    -[PXTitleSubtitleUILabel spec](self, "spec");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
      objc_msgSend(v3, "padding");
    -[PXTitleSubtitleUILabel bounds](self, "bounds");
    PXEdgeInsetsInsetRect();
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    objc_msgSend(v4, "displayScale");
    if (v13 > 0.0)
    {
      objc_msgSend(v4, "displayScale");
      v16 = v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "scale");
      v16 = v15;

    }
    objc_msgSend(off_1E50B3470, "defaultHelper");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXTitleSubtitleUILabel titleText](self, "titleText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "displayableTextForTitle:intent:", v19, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXTitleSubtitleUILabel subtitleText](self, "subtitleText");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_alloc_init(PXTitleSubtitleCALayerPromise);
    -[PXTitleSubtitleCALayerPromise setDiagnosticsEnabled:](v22, "setDiagnosticsEnabled:", -[PXTitleSubtitleUILabel diagnosticsEnabled](self, "diagnosticsEnabled"));
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __53__PXTitleSubtitleUILabel__updateLayerPromiseIfNeeded__block_invoke;
    v26[3] = &unk_1E5146B18;
    v30 = v6;
    v31 = v8;
    v32 = v10;
    v33 = v12;
    v34 = v16;
    v26[4] = self;
    v27 = v20;
    v28 = v21;
    v29 = v4;
    v23 = v4;
    v24 = v21;
    v25 = v20;
    -[PXTitleSubtitleCALayerPromise performChanges:](v22, "performChanges:", v26);
    -[PXTitleSubtitleUILabel _setLayerPromise:](self, "_setLayerPromise:", v22);

  }
}

- (void)_updateContentLayer
{
  void *v3;
  id v4;

  -[PXTitleSubtitleUILabel _layerPromise](self, "_layerPromise");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShouldRasterize:", -[PXTitleSubtitleUILabel shouldRasterizeTextLayer](self, "shouldRasterizeTextLayer"));
  objc_msgSend(v4, "contentsScale");
  objc_msgSend(v3, "setRasterizationScale:");
  if (v3)
    -[PXTitleSubtitleUILabel _setContentLayer:](self, "_setContentLayer:", v3);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)PXLayerPromiseObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXTitleSubtitleUILabel.m"), 233, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
    v11 = v9;
    -[PXTitleSubtitleUILabel _updateContentLayer](self, "_updateContentLayer");
    v9 = v11;
  }

}

- (NSString)titleText
{
  return self->_titleText;
}

- (NSString)subtitleText
{
  return self->_subtitleText;
}

- (PXTitleSubtitleLabelSpec)spec
{
  return self->_spec;
}

- (int64_t)typesettingMode
{
  return self->_typesettingMode;
}

- (BOOL)rendersTextAsynchronously
{
  return self->_rendersTextAsynchronously;
}

- (BOOL)shouldRasterizeTextLayer
{
  return self->_shouldRasterizeTextLayer;
}

- (PXTitleSubtitleCALayerPromise)_layerPromise
{
  return self->__layerPromise;
}

- (CALayer)_contentLayer
{
  return self->__contentLayer;
}

- (BOOL)diagnosticsEnabled
{
  return self->_diagnosticsEnabled;
}

- (void)setDiagnosticsEnabled:(BOOL)a3
{
  self->_diagnosticsEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__contentLayer, 0);
  objc_storeStrong((id *)&self->__layerPromise, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_subtitleText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
}

void __53__PXTitleSubtitleUILabel__updateLayerPromiseIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  v3 = *(double *)(a1 + 64);
  v4 = *(double *)(a1 + 72);
  v5 = *(double *)(a1 + 80);
  v6 = *(double *)(a1 + 88);
  v7 = a2;
  objc_msgSend(v7, "setBounds:", v3, v4, v5, v6);
  objc_msgSend(v7, "setContentsScale:", *(double *)(a1 + 96));
  objc_msgSend(v7, "setRendersAsynchronously:", objc_msgSend(*(id *)(a1 + 32), "rendersTextAsynchronously"));
  objc_msgSend(v7, "setTitleText:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v7, "setSubtitleText:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v7, "setSpec:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v7, "setTypesettingMode:", objc_msgSend(*(id *)(a1 + 32), "typesettingMode"));

}

@end
