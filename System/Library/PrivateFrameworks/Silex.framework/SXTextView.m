@implementation SXTextView

- (SXTextView)initWithFrame:(CGRect)a3
{
  SXTextView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXTextView;
  v3 = -[SXTextView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXTextView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[SXTextView setIsSelectable:](v3, "setIsSelectable:", 1);
  }
  return v3;
}

- (SXTextView)initWithCoder:(id)a3
{
  id v4;
  SXTextView *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SXTextView;
  v5 = -[SXTextView initWithCoder:](&v8, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXTextView setBackgroundColor:](v5, "setBackgroundColor:", v6);

    -[SXTextView setIsSelectable:](v5, "setIsSelectable:", 1);
  }

  return v5;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[SXTextView mightBeVisuallyMisplaced](self, "mightBeVisuallyMisplaced"))
  {
    -[SXTextView rep](self, "rep");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "updateFromVisualPosition");

    if (v9)
    {
      -[SXTextView rep](self, "rep");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "icc");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "invalidateLayers");

    }
  }
  if (-[SXTextView pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
  {
    -[SXTextView canvas](self, "canvas");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "canvasController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "canvasView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)invalidate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[SXTextView infoGeometry](self, "infoGeometry");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SXTextView textInfo](self, "textInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGeometry:", v6);

  -[SXTextView layoutController](self, "layoutController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SXTextView textInfo](self, "textInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutForInfo:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

}

- (void)directLayerHostRemoveIfMatchingContainerLayer:(id)a3 forRep:(id)a4
{
  id v6;

  v6 = a4;
  if (self->_repContainerLayer == a3)
    -[SXTextView directLayerHostUpdateWithContainerLayer:forRep:](self, "directLayerHostUpdateWithContainerLayer:forRep:", 0, v6);

}

- (void)directLayerHostUpdateWithContainerLayer:(id)a3 forRep:(id)a4
{
  CALayer *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CALayer **p_repContainerLayer;
  CALayer *repContainerLayer;
  CALayer *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  CATransform3D v28;
  CATransform3D v29;

  v7 = (CALayer *)a3;
  v8 = a4;
  -[SXTextView setRep:](self, "setRep:", v8);
  -[SXTextView rep](self, "rep");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SXAXCustomRotorDefinition linksRotor]();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SXAXCustomRotor rotorWithName:](SXAXCustomRotor, "rotorWithName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLinkRotor:", v11);

  -[SXTextView rep](self, "rep");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SXAXCustomRotorDefinition headingsRotor]();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SXAXCustomRotor rotorWithName:](SXAXCustomRotor, "rotorWithName:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHeadingsRotor:", v14);

  -[SXTextView rep](self, "rep");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTextView frameInCanvas](self, "frameInCanvas");
  objc_msgSend(v15, "setFrameInCanvas:");

  objc_msgSend(v8, "canvas");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "canvasController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTextView rep](self, "rep");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setIcc:", v17);

  objc_msgSend(v8, "canvas");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTextView setCanvas:](self, "setCanvas:", v19);

  -[SXTextView rep](self, "rep");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAccessibilityDataSource:", self);

  p_repContainerLayer = &self->_repContainerLayer;
  repContainerLayer = self->_repContainerLayer;
  v23 = v7;
  if (repContainerLayer != v7)
  {
    -[CALayer removeFromSuperlayer](repContainerLayer, "removeFromSuperlayer");
    objc_storeStrong((id *)&self->_repContainerLayer, a3);
    if (!*p_repContainerLayer)
      goto LABEL_6;
    -[SXTextView layer](self, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "insertSublayer:atIndex:", *p_repContainerLayer, 0);

    v23 = *p_repContainerLayer;
  }
  if (v23)
  {
    -[SXTextView frameInCanvas](self, "frameInCanvas");
    memset(&v29, 0, sizeof(v29));
    CATransform3DMakeTranslation(&v29, -v25, -v26, 0.0);
    v28 = v29;
    -[CALayer setSublayerTransform:](*p_repContainerLayer, "setSublayerTransform:", &v28);
    -[SXTextView rep](self, "rep");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "updateFromVisualPosition");

  }
LABEL_6:

}

- (void)directLayerhostUpdateTopLevelTilingLayers:(id)a3 forRep:(id)a4
{
  id v5;

  v5 = a3;
  if (self->_repContainerLayer)
    objc_msgSend(v5, "addObject:");

}

- (void)_updateOverlayTransform
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CATransform3D v7;
  CATransform3D v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  -[SXTextView rep](self, "rep");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v10 = 0u;
    v11 = 0u;
    v9 = 0u;
    -[SXTextView rep](self, "rep");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "transformInRoot");
    }
    else
    {
      v10 = 0u;
      v11 = 0u;
      v9 = 0u;
    }

    CATransform3DMakeTranslation(&v8, -(*(double *)&v11+ *(double *)(MEMORY[0x24BDBEFB0] + 8) * *(double *)&v10+ *(double *)&v9 * *MEMORY[0x24BDBEFB0]), -(*((double *)&v11 + 1)+ *(double *)(MEMORY[0x24BDBEFB0] + 8) * *((double *)&v10 + 1)+ *((double *)&v9 + 1) * *MEMORY[0x24BDBEFB0]), 0.0);
    v7 = v8;
    -[CALayer setSublayerTransform:](self->_overlayContainerLayer, "setSublayerTransform:", &v7);
  }
}

- (void)directLayerHostUpdateOverlayLayers:(id)a3 forRep:(id)a4
{
  uint64_t v5;
  CALayer *overlayContainerLayer;
  CALayer *v7;
  CALayer *v8;
  void *v9;
  CALayer *v10;
  void *v11;
  char v12;
  id v13;

  v13 = a3;
  v5 = objc_msgSend(v13, "count");
  overlayContainerLayer = self->_overlayContainerLayer;
  if (v5)
  {
    if (!overlayContainerLayer)
    {
      objc_msgSend(MEMORY[0x24BEB3AB0], "layer");
      v7 = (CALayer *)objc_claimAutoreleasedReturnValue();
      v8 = self->_overlayContainerLayer;
      self->_overlayContainerLayer = v7;

      if (self->_repContainerLayer)
      {
        -[SXTextView layer](self, "layer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "insertSublayer:above:", self->_overlayContainerLayer, self->_repContainerLayer);
      }
      else
      {
        -[SXTextView layer](self, "layer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "insertSublayer:atIndex:", self->_overlayContainerLayer, 0);
      }

    }
    -[SXTextView _updateOverlayTransform](self, "_updateOverlayTransform");
    -[CALayer sublayers](self->_overlayContainerLayer, "sublayers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqual:", v13);

    if ((v12 & 1) == 0)
      -[CALayer setSublayers:](self->_overlayContainerLayer, "setSublayers:", v13);
  }
  else if (overlayContainerLayer)
  {
    -[CALayer removeFromSuperlayer](overlayContainerLayer, "removeFromSuperlayer");
    v10 = self->_overlayContainerLayer;
    self->_overlayContainerLayer = 0;

  }
}

- (void)setFrame:(CGRect)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SXTextView;
  -[SXTextView setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SXTextView rep](self, "rep");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTextView frameInCanvas](self, "frameInCanvas");
  objc_msgSend(v4, "setFrameInCanvas:");

}

- (CGRect)frameInCanvas
{
  CGRect *p_frameInCanvas;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  p_frameInCanvas = &self->_frameInCanvas;
  if (CGRectIsEmpty(self->_frameInCanvas))
  {
    -[SXTextView frame](self, "frame");
  }
  else
  {
    x = p_frameInCanvas->origin.x;
    y = p_frameInCanvas->origin.y;
    width = p_frameInCanvas->size.width;
    height = p_frameInCanvas->size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrameInCanvas:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  self->_frameInCanvas = a3;
  -[SXTextView rep](self, "rep");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrameInCanvas:", x, y, width, height);

}

- (void)setShouldHyphenate:(BOOL)a3
{
  _BOOL8 v4;
  id v5;

  self->_shouldHyphenate = a3;
  v4 = -[SXTextView shouldHyphenate](self, "shouldHyphenate");
  -[SXTextView textInfo](self, "textInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShouldHyphenate:", v4);

}

- (void)setIsSelectable:(BOOL)a3
{
  _BOOL8 v4;
  id v5;

  self->_isSelectable = a3;
  v4 = -[SXTextView isSelectable](self, "isSelectable");
  -[SXTextView textInfo](self, "textInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsSelectable:", v4);

}

- (id)infoGeometry
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;

  -[SXTextView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SXTextView canvas](self, "canvas");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "canvasController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "canvasView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SXTextView convertRect:toView:](self, "convertRect:toView:", v13, v4, v6, v8, v10);
    v4 = v14;
    v6 = v15;
    v8 = v16;
    v10 = v17;
  }
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3A88]), "initWithPosition:size:", v4, v6, v8, v10);

  return v18;
}

- (void)setMightBeVisuallyMisplaced:(BOOL)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;

  if (self->_mightBeVisuallyMisplaced)
  {
    -[SXTextView rep](self, "rep");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "updateFromVisualPosition");

    if (v6)
    {
      -[SXTextView rep](self, "rep");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "icc");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "currentlyScrolling");

      if ((v9 & 1) == 0)
      {
        -[SXTextView rep](self, "rep");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "icc");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "invalidateLayers");

      }
    }
  }
  self->_mightBeVisuallyMisplaced = a3;
}

- (void)provideInfosLayoutTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[SXTextView delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textRulesForTextView:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXTextView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentIdentifierForTextView:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "textFlow") == 1)
    v8 = CFSTR("body");
  else
    v8 = v7;
  -[SXTextView textLayouter](self, "textLayouter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "wpStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTextView textLayouter](self, "textLayouter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "wpLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addTextStorage:withLayout:forNamedFlow:directLayerHostView:selectable:componentIdentifier:", v10, v12, v8, self, -[SXTextView isSelectable](self, "isSelectable"), v7);

}

- (id)accessibilityCustomRotorMembershipForRep:(id)a3
{
  void *v4;
  void *v5;

  -[SXTextView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityCustomRotorMembershipForTextView:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;

  -[SXTextView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityContextualLabelForTextView:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)accessibilityContainerType
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  -[SXTextView accessibilityLabel](self, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
    return 4;
  v6.receiver = self;
  v6.super_class = (Class)SXTextView;
  return -[SXTextView accessibilityContainerType](&v6, sel_accessibilityContainerType);
}

- (id)accessibilityElements
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  -[SXTextView rep](self, "rep");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v10[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityContainer:", self);
  }
  else
  {
    v5 = 0;
  }
  if (_AXSCommandAndControlEnabled() && !UIAccessibilityIsVoiceOverRunning())
  {
    objc_msgSend(v4, "valueForKey:", CFSTR("sxaxLinkElements"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "arrayByAddingObject:", v4);
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v8;
    }

  }
  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  CGRect v18;
  CGRect v19;

  -[SXTextView textInfo](self, "textInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTextView textInfo](self, "textInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9 >= 0xF)
    v10 = 15;
  else
    v10 = v9;
  objc_msgSend(v5, "substringWithRange:", 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BDD17C8];
  v13 = objc_opt_class();
  -[SXTextView frame](self, "frame");
  NSStringFromCGRect(v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXTextView frameInCanvas](self, "frameInCanvas");
  NSStringFromCGRect(v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("<%@: %p; frame: %@; frameInCanvas: %@; string: %@>"),
    v13,
    self,
    v14,
    v15,
    v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v16;
}

- (SXTextLayouter)textLayouter
{
  return self->_textLayouter;
}

- (void)setTextLayouter:(id)a3
{
  objc_storeStrong((id *)&self->_textLayouter, a3);
}

- (SXTextViewDelegate)delegate
{
  return (SXTextViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SXTextSource)textSource
{
  return self->_textSource;
}

- (CGRect)parentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_parentFrame.origin.x;
  y = self->_parentFrame.origin.y;
  width = self->_parentFrame.size.width;
  height = self->_parentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setParentFrame:(CGRect)a3
{
  self->_parentFrame = a3;
}

- (BOOL)isSelectable
{
  return self->_isSelectable;
}

- (BOOL)shouldHyphenate
{
  return self->_shouldHyphenate;
}

- (SXTextTangierContainerInfo)textInfo
{
  return self->_textInfo;
}

- (BOOL)mightBeVisuallyMisplaced
{
  return self->_mightBeVisuallyMisplaced;
}

- (SXTextTangierRepAccessibilityElement)rep
{
  return (SXTextTangierRepAccessibilityElement *)objc_loadWeakRetained((id *)&self->_rep);
}

- (void)setRep:(id)a3
{
  objc_storeWeak((id *)&self->_rep, a3);
}

- (TSDLayoutController)layoutController
{
  return self->_layoutController;
}

- (CALayer)repContainerLayer
{
  return self->_repContainerLayer;
}

- (void)setRepContainerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_repContainerLayer, a3);
}

- (CALayer)overlayContainerLayer
{
  return self->_overlayContainerLayer;
}

- (void)setOverlayContainerLayer:(id)a3
{
  objc_storeStrong((id *)&self->_overlayContainerLayer, a3);
}

- (TSDCanvas)canvas
{
  return (TSDCanvas *)objc_loadWeakRetained((id *)&self->_canvas);
}

- (void)setCanvas:(id)a3
{
  objc_storeWeak((id *)&self->_canvas, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_canvas);
  objc_storeStrong((id *)&self->_overlayContainerLayer, 0);
  objc_storeStrong((id *)&self->_repContainerLayer, 0);
  objc_storeStrong((id *)&self->_layoutController, 0);
  objc_destroyWeak((id *)&self->_rep);
  objc_storeStrong((id *)&self->_textInfo, 0);
  objc_storeStrong((id *)&self->_textSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textLayouter, 0);
}

@end
