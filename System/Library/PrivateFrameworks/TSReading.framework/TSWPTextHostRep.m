@implementation TSWPTextHostRep

- (TSWPTextHostRep)initWithLayout:(id)a3 canvas:(id)a4
{
  TSWPTextHostRep *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSWPTextHostRep;
  v5 = -[TSDRep initWithLayout:canvas:](&v8, sel_initWithLayout_canvas_, a3);
  if (v5 && objc_msgSend(a4, "isCanvasInteractive"))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel_p_activeFindHighlightChangedNotification_, CFSTR("TSKActiveFindHighlightChangedNotification"), -[TSDRep interactiveCanvasController](v5, "interactiveCanvasController"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel_p_findUIStateChangedNotification_, CFSTR("TSKFindUIStateChanged"), -[TSDRep interactiveCanvasController](v5, "interactiveCanvasController"));
    -[TSWPTextHostRep p_setActiveSearchReference:](v5, "p_setActiveSearchReference:", -[TSKDocumentRoot activeSearchReference](-[TSDInteractiveCanvasController documentRoot](-[TSDRep interactiveCanvasController](v5, "interactiveCanvasController"), "documentRoot"), "activeSearchReference"));
    -[TSWPTextHostRep p_setSearchReferencesToHighlight:](v5, "p_setSearchReferencesToHighlight:", -[TSKDocumentRoot searchReferencesToHighlight](-[TSDInteractiveCanvasController documentRoot](-[TSDRep interactiveCanvasController](v5, "interactiveCanvasController"), "documentRoot"), "searchReferencesToHighlight"));
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);
  -[TSDRep setParentRep:](self->_editingRep, "setParentRep:", 0);

  self->_editingRep = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWPTextHostRep;
  -[TSDRep dealloc](&v3, sel_dealloc);
}

- (void)willBeRemoved
{
  void *v3;

  if (-[TSDCanvas isCanvasInteractive](-[TSDRep canvas](self, "canvas"), "isCanvasInteractive"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("TSKActiveFindHighlightChangedNotification"), 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("TSKFindUIStateChanged"), 0);
  }
}

- (void)updateChildrenFromLayout
{
  TSDLayout *v3;
  TSDLayout *v4;
  TSWPShapeRep *editingRep;
  BOOL v6;
  TSWPShapeRep *v7;

  v3 = (TSDLayout *)-[TSDLayout editingShapeLayout](-[TSDRep layout](self, "layout"), "editingShapeLayout");
  v4 = -[TSDRep layout](self->_editingRep, "layout");
  editingRep = self->_editingRep;
  if (v4 != v3)
  {
    -[TSDRep setParentRep:](editingRep, "setParentRep:", 0);

    editingRep = 0;
    self->_editingRep = 0;
  }
  if (editingRep)
    v6 = 1;
  else
    v6 = v3 == 0;
  if (!v6)
  {
    v7 = (TSWPShapeRep *)objc_msgSend(objc_alloc(-[TSDLayout repClassOverride](v3, "repClassOverride")), "initWithLayout:canvas:", v3, -[TSDRep canvas](self, "canvas"));
    self->_editingRep = v7;
    -[TSDRep setParentRep:](v7, "setParentRep:", self);
    editingRep = self->_editingRep;
  }
  -[TSWPShapeRep updateChildrenFromLayout](editingRep, "updateChildrenFromLayout");
}

- (id)hitRep:(CGPoint)a3
{
  TSWPShapeRep *editingRep;
  TSDLayoutGeometry *v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  id result;
  double x;
  double y;
  objc_super v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;

  editingRep = self->_editingRep;
  if (!editingRep)
    goto LABEL_6;
  x = a3.x;
  y = a3.y;
  v5 = -[TSDAbstractLayout geometry](-[TSDRep layout](editingRep, "layout"), "geometry");
  if (v5)
  {
    -[TSDLayoutGeometry inverseTransform](v5, "inverseTransform");
    v6 = v13;
    v7 = v14;
    v8 = v15;
  }
  else
  {
    v8 = 0uLL;
    v14 = 0u;
    v15 = 0u;
    v13 = 0u;
    v6 = 0uLL;
    v7 = 0uLL;
  }
  result = -[TSWPShapeRep hitRep:](self->_editingRep, "hitRep:", vaddq_f64(v8, vmlaq_n_f64(vmulq_n_f64(v7, y), v6, x)));
  a3.x = x;
  a3.y = y;
  if (!result)
  {
LABEL_6:
    v12.receiver = self;
    v12.super_class = (Class)TSWPTextHostRep;
    return -[TSDRep hitRep:](&v12, sel_hitRep_, a3.x, a3.y);
  }
  return result;
}

- (id)childReps
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  if (!self->_editingRep)
    return 0;
  v3[0] = self->_editingRep;
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
}

- (BOOL)canSelectChildRep:(id)a3
{
  return 0;
}

- (void)selectChildRep:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPTextHostRep selectChildRep:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTextHostRep.mm"), 154, CFSTR("can't select children of a text editing host rep"));
}

- (void)setPulseControllerActive:(BOOL)a3 autohide:(BOOL)a4
{
  _BOOL8 v5;
  TSDLayout *v6;
  TSKHighlightArrayController *v7;
  double v8;
  _OWORD v9[3];
  __int128 v10;
  __int128 v11;
  __int128 v12;

  if (a3)
  {
    v5 = a4;
    if (!-[TSWPTextHostRep pulseArrayController](self, "pulseArrayController"))
      self->_pulseArrayController = -[TSKHighlightArrayController initWithZOrder:delegate:]([TSKHighlightArrayController alloc], "initWithZOrder:delegate:", self, 8.0);
    -[TSKHighlightArrayController setShouldPulsate:](-[TSWPTextHostRep pulseArrayController](self, "pulseArrayController"), "setShouldPulsate:", 1);
    -[TSKHighlightArrayController setAutohide:](-[TSWPTextHostRep pulseArrayController](self, "pulseArrayController"), "setAutohide:", v5);
    v6 = -[TSDRep layout](self, "layout");
    if (v6)
    {
      -[TSDAbstractLayout transformInRoot](v6, "transformInRoot");
    }
    else
    {
      v11 = 0u;
      v12 = 0u;
      v10 = 0u;
    }
    v7 = -[TSWPTextHostRep pulseArrayController](self, "pulseArrayController");
    v9[0] = v10;
    v9[1] = v11;
    v9[2] = v12;
    -[TSKHighlightArrayController setTransform:](v7, "setTransform:", v9);
    -[TSDCanvas viewScale](self->super.mCanvas, "viewScale");
    -[TSKHighlightArrayController setViewScale:](-[TSWPTextHostRep pulseArrayController](self, "pulseArrayController"), "setViewScale:", v8);
  }
  else
  {
    -[TSWPTextHostRep setPulseArrayController:](self, "setPulseArrayController:", 0, a4);
  }
}

- (CGPath)newPathForSearchReference:(id)a3
{
  return 0;
}

- (id)imageForSearchReference:(id)a3 forPath:(CGPath *)a4 shouldPulsate:(BOOL)a5
{
  return 0;
}

- (void)pulseAnimationDidStop:(id)a3
{
  if (-[TSWPTextHostRep pulseArrayController](self, "pulseArrayController") == a3)
  {
    if (-[TSKHighlightArrayController autohide](-[TSWPTextHostRep pulseArrayController](self, "pulseArrayController"), "autohide"))
    {
      -[TSWPTextHostRep setPulseControllerActive:autohide:](self, "setPulseControllerActive:autohide:", 0, 0);
      -[TSDRep invalidateKnobs](self, "invalidateKnobs");
      -[TSDInteractiveCanvasController layoutInvalidated](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "layoutInvalidated");
    }
    -[TSKSearchReference setPulseHighlight:](-[TSWPTextHostRep activeSearchReference](self, "activeSearchReference"), "setPulseHighlight:", 0);
  }
}

- (BOOL)doesRepContainSearchReference:(id)a3
{
  return 1;
}

- (void)p_activeFindHighlightChangedNotification:(id)a3
{
  -[TSWPTextHostRep p_setActiveSearchReference:](self, "p_setActiveSearchReference:", objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", CFSTR("TSKActiveSearchReferenceKey")));
  -[TSDCanvas invalidateLayers](-[TSDRep canvas](self, "canvas"), "invalidateLayers");
}

- (void)p_setActiveSearchReference:(id)a3
{
  if (a3 && -[TSWPTextHostRep doesRepContainSearchReference:](self, "doesRepContainSearchReference:"))
  {
    if ((-[TSKSearchReference isEqual:](-[TSWPTextHostRep activeSearchReference](self, "activeSearchReference"), "isEqual:", a3) & 1) == 0)
    {
      -[TSKHighlightArrayController stop](-[TSWPTextHostRep pulseArrayController](self, "pulseArrayController"), "stop");
      -[TSWPTextHostRep setPulseControllerActive:autohide:](self, "setPulseControllerActive:autohide:", 1, objc_msgSend(a3, "autohideHighlight"));
      -[TSWPTextHostRep setActiveSearchReference:](self, "setActiveSearchReference:", a3);
      -[TSWPTextHostRep updateFindAnimationWithAnimatingPulse:](self, "updateFindAnimationWithAnimatingPulse:", objc_msgSend(a3, "pulseHighlight"));
    }
  }
  else
  {
    -[TSKHighlightArrayController stop](-[TSWPTextHostRep pulseArrayController](self, "pulseArrayController"), "stop");
    -[TSWPTextHostRep setPulseControllerActive:autohide:](self, "setPulseControllerActive:autohide:", 0, 0);
    -[TSWPTextHostRep setActiveSearchReference:](self, "setActiveSearchReference:", 0);
  }
}

- (void)p_findUIStateChangedNotification:(id)a3
{
  -[TSWPTextHostRep p_setSearchReferencesToHighlight:](self, "p_setSearchReferencesToHighlight:", objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKeyedSubscript:", CFSTR("TSWPSearchReferencesToHighlightKey")));
}

- (void)p_setSearchReferencesToHighlight:(id)a3
{
  NSArray *v4;

  v4 = (NSArray *)objc_msgSend(a3, "objectForKeyedSubscript:", -[TSDRep info](self, "info"));
  if (-[TSWPTextHostRep searchReferences](self, "searchReferences") != v4)
  {
    -[TSWPTextHostRep setSearchReferences:](self, "setSearchReferences:", v4);
    -[TSWPTextHostRep updateHighlights](self, "updateHighlights");
  }
}

- (void)updateFindAnimationWithAnimatingPulse:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  TSKHighlightArrayController *v6;

  v3 = a3;
  if (!-[TSKHighlightArrayController pulsating](-[TSWPTextHostRep pulseArrayController](self, "pulseArrayController"), "pulsating")&& -[TSWPTextHostRep activeSearchReference](self, "activeSearchReference"))
  {
    v5 = -[TSWPTextHostRep lineSearchReferencesForSearchReference:](self, "lineSearchReferencesForSearchReference:", -[TSWPTextHostRep activeSearchReference](self, "activeSearchReference"));
    -[TSKHighlightArrayController reset](-[TSWPTextHostRep pulseArrayController](self, "pulseArrayController"), "reset");
    v6 = -[TSWPTextHostRep pulseArrayController](self, "pulseArrayController");
    -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
    -[TSKHighlightArrayController buildHighlightsForSearchReferences:contentsScaleForLayers:](v6, "buildHighlightsForSearchReferences:contentsScaleForLayers:", v5);
    if (v3)
      -[TSKHighlightArrayController startAnimating](-[TSWPTextHostRep pulseArrayController](self, "pulseArrayController"), "startAnimating");
  }
}

- (id)lineSearchReferencesForSearchReference:(id)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v4[0] = a3;
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
}

- (void)updateHighlights
{
  TSDLayout *v3;
  TSKHighlightArrayController *v4;
  double v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  TSKHighlightArrayController *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _OWORD v18[3];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (-[NSArray count](-[TSWPTextHostRep searchReferences](self, "searchReferences"), "count"))
  {
    if (!-[TSWPTextHostRep highlightArrayController](self, "highlightArrayController"))
      self->_highlightArrayController = -[TSKHighlightArrayController initWithZOrder:delegate:]([TSKHighlightArrayController alloc], "initWithZOrder:delegate:", self, 3.0);
    v3 = -[TSDRep layout](self, "layout");
    if (v3)
    {
      -[TSDAbstractLayout transformInRoot](v3, "transformInRoot");
    }
    else
    {
      v20 = 0u;
      v21 = 0u;
      v19 = 0u;
    }
    v4 = -[TSWPTextHostRep highlightArrayController](self, "highlightArrayController");
    v18[0] = v19;
    v18[1] = v20;
    v18[2] = v21;
    -[TSKHighlightArrayController setTransform:](v4, "setTransform:", v18);
    -[TSDCanvas viewScale](self->super.mCanvas, "viewScale");
    -[TSKHighlightArrayController setViewScale:](-[TSWPTextHostRep highlightArrayController](self, "highlightArrayController"), "setViewScale:", v5);
    -[TSKHighlightArrayController reset](-[TSWPTextHostRep highlightArrayController](self, "highlightArrayController"), "reset");
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = -[TSWPTextHostRep searchReferences](self, "searchReferences", 0);
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          v12 = -[TSWPTextHostRep highlightArrayController](self, "highlightArrayController");
          v22 = v11;
          v13 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
          -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
          objc_msgSend(v11, "setFindHighlights:", -[TSKHighlightArrayController buildHighlightsForSearchReferences:contentsScaleForLayers:](v12, "buildHighlightsForSearchReferences:contentsScaleForLayers:", v13));
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v23, 16);
      }
      while (v8);
    }
  }
  else
  {
    -[TSWPTextHostRep setHighlightArrayController:](self, "setHighlightArrayController:", 0);
  }
}

- (BOOL)useFindOverlayers
{
  return 1;
}

- (id)overlayLayers
{
  void *v3;
  NSArray *v4;
  NSArray *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSWPTextHostRep;
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", -[TSDRep overlayLayers](&v7, sel_overlayLayers));
  if (-[TSWPTextHostRep useFindOverlayers](self, "useFindOverlayers"))
  {
    v4 = -[TSKHighlightArrayController layers](-[TSWPTextHostRep highlightArrayController](self, "highlightArrayController"), "layers");
    if (-[NSArray count](v4, "count"))
    {
      -[NSArray makeObjectsPerformSelector:withObject:](v4, "makeObjectsPerformSelector:withObject:", sel_setDelegate_, -[TSDRep interactiveCanvasController](self, "interactiveCanvasController"));
      objc_msgSend(v3, "addObjectsFromArray:", v4);
    }
    v5 = -[TSKHighlightArrayController layers](-[TSWPTextHostRep pulseArrayController](self, "pulseArrayController"), "layers");
    if (-[NSArray count](v5, "count"))
    {
      -[NSArray makeObjectsPerformSelector:withObject:](v5, "makeObjectsPerformSelector:withObject:", sel_setDelegate_, -[TSDRep interactiveCanvasController](self, "interactiveCanvasController"));
      objc_msgSend(v3, "addObjectsFromArray:", v5);
    }
  }
  return v3;
}

- (void)drawTextBackground:(CGContext *)a3 insetRect:(CGRect)a4 pulsating:(BOOL)a5
{
  _BOOL4 v5;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CGGradient *v15;
  CGPath *v16;
  CGColor *v17;
  CGFloat MinY;
  CGColor *v19;
  _QWORD v20[3];
  CGSize v21;
  CGPoint v22;
  CGSize v23;
  CGPoint v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v20[2] = *MEMORY[0x24BDAC8D0];
  CGContextBeginTransparencyLayer(a3, 0);
  CGContextSaveGState(a3);
  v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
  v12 = v11;
  if (v5)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.960784316, 0.917647064, 0.184313729, 1.0);
    v14 = (void *)objc_msgSend(MEMORY[0x24BEB3C40], "colorWithRed:green:blue:alpha:", 0.941176474, 0.776470602, 0.156862751, 1.0);
    v20[0] = objc_msgSend(v13, "CGColor");
    v20[1] = objc_msgSend(v14, "CGColor");
    v15 = CGGradientCreateWithColors(0, (CFArrayRef)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2), 0);
    v16 = TSDCreateRoundRectPathForRectWithRadius(x, y, width, height, 3.0);
    if (v12)
    {
      CGContextSaveGState(a3);
      v17 = (CGColor *)objc_msgSend(v12, "CGColor");
      v21.width = 0.0;
      v21.height = -1.0;
      CGContextSetShadowWithColor(a3, v21, 2.0, v17);
      CGContextAddPath(a3, v16);
      CGContextSetFillColorWithColor(a3, (CGColorRef)objc_msgSend(v13, "CGColor"));
      CGContextFillPath(a3);
      CGContextRestoreGState(a3);
    }
    CGContextAddPath(a3, v16);
    CGContextClip(a3);
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    MinY = CGRectGetMinY(v25);
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    v24.y = CGRectGetMaxY(v26);
    v22.x = 0.0;
    v24.x = 0.0;
    v22.y = MinY;
    CGContextDrawLinearGradient(a3, v15, v22, v24, 0);
    CGGradientRelease(v15);
    CGPathRelease(v16);
  }
  else
  {
    v19 = (CGColor *)objc_msgSend(v11, "CGColor");
    v23.width = 0.0;
    v23.height = -1.0;
    CGContextSetShadowWithColor(a3, v23, 2.0, v19);
    CGContextSetRGBFillColor(a3, 1.0, 1.0, 1.0, 1.0);
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    CGContextFillRect(a3, v27);
  }
  CGContextRestoreGState(a3);
  CGContextEndTransparencyLayer(a3);
}

- (TSKHighlightArrayController)pulseArrayController
{
  return self->_pulseArrayController;
}

- (void)setPulseArrayController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 280);
}

- (TSKHighlightArrayController)highlightArrayController
{
  return self->_highlightArrayController;
}

- (void)setHighlightArrayController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 288);
}

- (TSKSearchReference)activeSearchReference
{
  return self->_activeSearchReference;
}

- (void)setActiveSearchReference:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 296);
}

- (NSArray)searchReferences
{
  return self->_searchReferences;
}

- (void)setSearchReferences:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 304);
}

@end
