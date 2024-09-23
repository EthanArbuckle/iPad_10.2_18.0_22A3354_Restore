@implementation TSWPShapeRep

- (TSWPShapeRep)initWithLayout:(id)a3 canvas:(id)a4
{
  void *v7;
  uint64_t v8;
  TSWPShapeRep *v9;
  TSWPShapeRep *v10;
  objc_super v12;

  objc_opt_class();
  if (!TSUDynamicCast())
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPShapeRep initWithLayout:canvas:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeRep.mm"), 69, CFSTR("bad layout class"));
  }
  v12.receiver = self;
  v12.super_class = (Class)TSWPShapeRep;
  v9 = -[TSDShapeRep initWithLayout:canvas:](&v12, sel_initWithLayout_canvas_, a3, a4);
  v10 = v9;
  if (v9)
    -[TSDLayout setDelegate:](-[TSDRep layout](v9, "layout"), "setDelegate:", v9);
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  *(_QWORD *)&self->_editingContainedRep = 0;
  -[CALayer setParentRep:](self->_overflowGlyphLayer, "setParentRep:", 0);

  v3.receiver = self;
  v3.super_class = (Class)TSWPShapeRep;
  -[TSDStyledRep dealloc](&v3, sel_dealloc);
}

- (void)updateChildrenFromLayout
{
  uint64_t v3;
  uint64_t v4;
  CALayer *overflowGlyphLayer;
  CALayer *v6;

  v3 = -[CALayer layout](self->_overflowGlyphLayer, "layout");
  v4 = -[TSDLayout containedLayout](-[TSDRep layout](self, "layout"), "containedLayout");
  overflowGlyphLayer = self->_overflowGlyphLayer;
  if (v3 != v4)
  {
    -[CALayer setParentRep:](overflowGlyphLayer, "setParentRep:", 0);

    self->_overflowGlyphLayer = 0;
LABEL_4:
    v6 = (CALayer *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)-[TSDLayout containedLayout](-[TSDRep layout](self, "layout"), "containedLayout"), "repClassOverride")), "initWithLayout:canvas:", -[TSDLayout containedLayout](-[TSDRep layout](self, "layout"), "containedLayout"), -[TSDRep canvas](self, "canvas"));
    self->_overflowGlyphLayer = v6;
    -[CALayer setParentRep:](v6, "setParentRep:", self);
    overflowGlyphLayer = self->_overflowGlyphLayer;
    goto LABEL_5;
  }
  if (!overflowGlyphLayer)
    goto LABEL_4;
LABEL_5:
  -[CALayer updateChildrenFromLayout](overflowGlyphLayer, "updateChildrenFromLayout");
}

- (void)willBeginEditingContainedRep
{
  *(&self->super.mShadowOnChildrenDisabled + 1) = 1;
  -[TSDLayout createContainedLayoutForEditing](-[TSDRep layout](self, "layout"), "createContainedLayoutForEditing");
  -[TSWPShapeRep updateChildrenFromLayout](self, "updateChildrenFromLayout");
  -[TSDStyledRep setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)willEndEditingContainedRep
{
  if (!objc_msgSend((id)objc_msgSend(-[TSDRep info](self, "info"), "containedStorage"), "length"))
  {
    -[TSDLayout createContainedLayoutForInstructionalText](-[TSDRep layout](self, "layout"), "createContainedLayoutForInstructionalText");
    -[TSWPShapeRep updateChildrenFromLayout](self, "updateChildrenFromLayout");
    -[TSDStyledRep setNeedsDisplay](self, "setNeedsDisplay");
  }
  *(&self->super.mShadowOnChildrenDisabled + 1) = 0;
}

- (id)hitRep:(CGPoint)a3
{
  CALayer *overflowGlyphLayer;
  void *v5;
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

  overflowGlyphLayer = self->_overflowGlyphLayer;
  if (!overflowGlyphLayer)
    goto LABEL_6;
  x = a3.x;
  y = a3.y;
  v5 = (void *)objc_msgSend((id)-[CALayer layout](overflowGlyphLayer, "layout"), "geometry");
  if (v5)
  {
    objc_msgSend(v5, "inverseTransform");
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
  result = (id)-[CALayer hitRep:](self->_overflowGlyphLayer, "hitRep:", vaddq_f64(v8, vmlaq_n_f64(vmulq_n_f64(v7, y), v6, x)));
  a3.x = x;
  a3.y = y;
  if (!result)
  {
LABEL_6:
    v12.receiver = self;
    v12.super_class = (Class)TSWPShapeRep;
    return -[TSDRep hitRep:](&v12, sel_hitRep_, a3.x, a3.y);
  }
  return result;
}

- (id)hitReps:(CGPoint)a3 withSlop:(CGSize)a4
{
  double height;
  double width;
  id v7;
  CALayer *overflowGlyphLayer;
  void *v9;
  float64x2_t v10;
  float64x2_t v11;
  float64x2_t v12;
  void *v13;
  void *v14;
  double y;
  double x;
  float64x2_t v18;
  float64x2_t v19;
  float64x2_t v20;
  objc_super v21;

  height = a4.height;
  width = a4.width;
  v21.receiver = self;
  v21.super_class = (Class)TSWPShapeRep;
  y = a3.y;
  x = a3.x;
  v7 = -[TSDRep hitReps:withSlop:](&v21, sel_hitReps_withSlop_);
  if (v7)
  {
    overflowGlyphLayer = self->_overflowGlyphLayer;
    if (overflowGlyphLayer)
    {
      v9 = (void *)objc_msgSend((id)-[CALayer layout](overflowGlyphLayer, "layout"), "geometry");
      if (v9)
      {
        objc_msgSend(v9, "inverseTransform");
        v10 = v18;
        v11 = v19;
        v12 = v20;
      }
      else
      {
        v12 = 0uLL;
        v10 = 0uLL;
        v11 = 0uLL;
      }
      v13 = (void *)-[CALayer hitReps:withSlop:](self->_overflowGlyphLayer, "hitReps:withSlop:", vaddq_f64(v12, vmlaq_n_f64(vmulq_n_f64(v11, y), v10, x)), width, height);
      if (objc_msgSend(v13, "count"))
      {
        v14 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        objc_msgSend(v14, "addObjectsFromArray:", v13);
        objc_msgSend(v14, "addObjectsFromArray:", v7);
        return v14;
      }
    }
  }
  return v7;
}

- (int)dragTypeAtCanvasPoint:(CGPoint)a3
{
  return -[CALayer dragTypeAtCanvasPoint:](self->_overflowGlyphLayer, "dragTypeAtCanvasPoint:", a3.x, a3.y);
}

- (BOOL)shouldIgnoreEditMenuTapAtPoint:(CGPoint)a3 withRecognizer:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;

  -[CALayer convertNaturalPointFromUnscaledCanvas:](self->_overflowGlyphLayer, "convertNaturalPointFromUnscaledCanvas:", a4, a3.x, a3.y);
  v6 = v5;
  v8 = v7;
  objc_opt_class();
  -[CALayer smartFieldAtPoint:](self->_overflowGlyphLayer, "smartFieldAtPoint:", v6, v8);
  return TSUDynamicCast() != 0;
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3
{
  double y;
  double x;
  objc_super v7;

  y = a3.y;
  x = a3.x;
  if ((-[CALayer handleSingleTapAtPoint:](self->_overflowGlyphLayer, "handleSingleTapAtPoint:") & 1) != 0)
    return 1;
  v7.receiver = self;
  v7.super_class = (Class)TSWPShapeRep;
  return -[TSDRep handleSingleTapAtPoint:](&v7, sel_handleSingleTapAtPoint_, x, y);
}

- (BOOL)wantsToHandleTapsOnContainingGroup
{
  objc_super v4;

  if ((-[CALayer wantsToHandleTapsOnContainingGroup](self->_overflowGlyphLayer, "wantsToHandleTapsOnContainingGroup") & 1) != 0)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)TSWPShapeRep;
  return -[TSDRep wantsToHandleTapsOnContainingGroup](&v4, sel_wantsToHandleTapsOnContainingGroup);
}

- (BOOL)wantsToHandleTapsWhenLocked
{
  objc_super v4;

  if ((-[CALayer wantsToHandleTapsWhenLocked](self->_overflowGlyphLayer, "wantsToHandleTapsWhenLocked") & 1) != 0)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)TSWPShapeRep;
  return -[TSDRep wantsToHandleTapsWhenLocked](&v4, sel_wantsToHandleTapsWhenLocked);
}

- (void)willBeRemoved
{
  objc_super v3;

  -[TSDLayout setDelegate:](-[TSDRep layout](self, "layout"), "setDelegate:", 0);
  objc_msgSend(*(id *)&self->_editingContainedRep, "setDelegate:", 0);

  *(_QWORD *)&self->_editingContainedRep = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWPShapeRep;
  -[TSDShapeRep willBeRemoved](&v3, sel_willBeRemoved);
}

- (id)hyperlinkRegions
{
  void *v3;
  id result;
  BOOL v5;
  BOOL v6;
  objc_super v7;

  v3 = (void *)-[CALayer hyperlinkRegions](self->_overflowGlyphLayer, "hyperlinkRegions");
  v7.receiver = self;
  v7.super_class = (Class)TSWPShapeRep;
  result = -[TSDRep hyperlinkRegions](&v7, sel_hyperlinkRegions);
  if (v3)
    v5 = result == 0;
  else
    v5 = 1;
  if (!v5)
    return (id)objc_msgSend(v3, "arrayByAddingObjectsFromArray:", result);
  if (result)
    v6 = v3 == 0;
  else
    v6 = 0;
  if (!v6)
    return v3;
  return result;
}

- (BOOL)shouldShowSelectionHighlight
{
  objc_super v4;

  if (-[TSWPRep isEditing](-[TSWPShapeRep containedRep](self, "containedRep"), "isEditing"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)TSWPShapeRep;
  return -[TSDShapeRep shouldShowSelectionHighlight](&v4, sel_shouldShowSelectionHighlight);
}

- (BOOL)shouldShowKnobs
{
  objc_super v4;

  if (-[TSWPRep isEditing](-[TSWPShapeRep containedRep](self, "containedRep"), "isEditing"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)TSWPShapeRep;
  return -[TSDRep shouldShowKnobs](&v4, sel_shouldShowKnobs);
}

- (BOOL)p_shouldShowTextOverflowGlyph
{
  int v3;
  objc_super v5;

  v3 = -[TSDCanvas shouldShowTextOverflowGlyphs](-[TSDRep canvas](self, "canvas"), "shouldShowTextOverflowGlyphs");
  if (v3)
  {
    if (-[TSDShapeRep isEditingPath](self, "isEditingPath"))
    {
      LOBYTE(v3) = 0;
    }
    else
    {
      v3 = -[CALayer isOverflowing](self->_overflowGlyphLayer, "isOverflowing");
      if (v3)
      {
        v5.receiver = self;
        v5.super_class = (Class)TSWPShapeRep;
        LOBYTE(v3) = -[TSDRep shouldShowKnobs](&v5, sel_shouldShowKnobs);
      }
    }
  }
  return v3;
}

- (TSDContainerInfo)containerInfo
{
  -[TSDRep info](self, "info");
  return (TSDContainerInfo *)TSUProtocolCast();
}

- (id)childReps
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  if (!self->_overflowGlyphLayer)
    return 0;
  v3[0] = self->_overflowGlyphLayer;
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  objc_super v8;

  if (*(id *)&self->_editingContainedRep == a3 && objc_msgSend(a4, "isEqualToString:", CFSTR("position")))
    return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v8.receiver = self;
  v8.super_class = (Class)TSWPShapeRep;
  return -[TSDStyledRep actionForLayer:forKey:](&v8, sel_actionForLayer_forKey_, a3, a4);
}

- (BOOL)mustDrawTilingLayerOnMainThread:(id)a3
{
  void *v5;
  uint64_t v6;

  if (-[TSDStyledRep shadowLayer](self, "shadowLayer") != a3
    && -[TSDStyledRep reflectionLayer](self, "reflectionLayer") != a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPShapeRep mustDrawTilingLayerOnMainThread:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPShapeRep.mm"), 347, CFSTR("image rep's tiling layer delegate being called for wrong layer"));
  }
  return -[TSDInteractiveCanvasController allowLayoutAndRenderOnThread](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "allowLayoutAndRenderOnThread")|| objc_msgSend((id)objc_msgSend((id)-[TSDLayout containedLayout](-[TSDRep layout](self, "layout"), "containedLayout"), "info"), "length") != 0;
}

- (BOOL)canSelectChildRep:(id)a3
{
  return 0;
}

- (BOOL)canBeginEditingChildRepOnDoubleTap:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = -[TSDEditorController currentEditors](-[TSDInteractiveCanvasController editorController](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController", 0), "editorController"), "currentEditors");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v11 = objc_msgSend(v10, "canBeginEditingRepOnDoubleTap:", self);
        if (!v11)
          break;
      }
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    if (self->_overflowGlyphLayer == a3)
    {
      v11 = -[TSDLayout isInTopLevelContainerForEditing](-[TSDRep layout](self, "layout"), "isInTopLevelContainerForEditing");
      if (!v11)
        return v11;
      if ((!objc_msgSend(-[TSDRep info](self, "info"), "owningAttachment")
         || (int)objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSDRep info](self, "info"), "owningAttachment"), "parentStorage"), "wpKind") <= 2)&& (objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "pathIsLineSegment") & 1) == 0)
      {
        LOBYTE(v11) = !-[TSDRep isLocked](self, "isLocked");
        return v11;
      }
    }
    LOBYTE(v11) = 0;
  }
  return v11;
}

- (void)p_resetOverflowGlyphLayerIfNecessary
{
  double v3;
  double v4;
  void *v5;
  double v6;
  id v7;

  if (!*(_QWORD *)&self->_editingContainedRep)
    goto LABEL_4;
  -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
  v4 = v3;
  objc_msgSend(*(id *)&self->_editingContainedRep, "contentsScale");
  v5 = *(void **)&self->_editingContainedRep;
  if (v4 != v6)
  {

    *(_QWORD *)&self->_editingContainedRep = 0;
LABEL_4:
    v7 = -[TSWPShapeRep p_overflowKnobImage](self, "p_overflowKnobImage");
    *(_QWORD *)&self->_editingContainedRep = objc_alloc_init(MEMORY[0x24BDE56D0]);
    -[TSDCanvas contentsScale](-[TSDRep canvas](self, "canvas"), "contentsScale");
    objc_msgSend(*(id *)&self->_editingContainedRep, "setContents:", objc_msgSend(v7, "CGImageForContentsScale:"));
    objc_msgSend(v7, "size");
    objc_msgSend(*(id *)&self->_editingContainedRep, "setBounds:", TSDRectWithSize());
    objc_msgSend(*(id *)&self->_editingContainedRep, "setDelegate:", self);
    return;
  }
  if (!v5)
    goto LABEL_4;
}

- (id)overlayLayers
{
  id v3;
  TSDInteractiveCanvasController *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)TSWPShapeRep;
  v3 = (id)objc_msgSend(-[TSDShapeRep overlayLayers](&v25, sel_overlayLayers), "mutableCopy");
  if (-[TSWPShapeRep p_shouldShowTextOverflowGlyph](self, "p_shouldShowTextOverflowGlyph")
    && -[TSDRep isSelectedIgnoringLocking](self, "isSelectedIgnoringLocking"))
  {
    -[TSWPShapeRep p_resetOverflowGlyphLayerIfNecessary](self, "p_resetOverflowGlyphLayerIfNecessary");
    v4 = -[TSDRep interactiveCanvasController](self, "interactiveCanvasController");
    -[TSDRep boundsForStandardKnobs](self, "boundsForStandardKnobs");
    -[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", TSDPositionOfKnobOnRectangle(8, v5, v6, v7, v8));
    -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](v4, "convertUnscaledToBoundsPoint:");
    v10 = v9;
    v12 = v11;
    objc_msgSend(*(id *)&self->_editingContainedRep, "bounds");
    v17 = TSDCenterOfRect(v13, v14, v15, v16);
    v18 = TSDSubtractPoints(v10, v12, v17);
    v20 = v19;
    -[TSDCanvas contentsScale](-[TSDInteractiveCanvasController canvas](v4, "canvas"), "contentsScale");
    v22 = TSDRoundedPointForScale(v18, v20, v21);
    objc_msgSend(*(id *)&self->_editingContainedRep, "setPosition:", TSDAddPoints(v22, v23, v17));
    objc_msgSend(v3, "addObject:", *(_QWORD *)&self->_editingContainedRep);
  }
  return v3;
}

- (id)additionalLayersOverLayer
{
  id v3;
  id v4;
  TSDInteractiveCanvasController *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)TSWPShapeRep;
  v3 = -[TSDShapeRep additionalLayersOverLayer](&v28, sel_additionalLayersOverLayer);
  if (-[TSWPShapeRep p_shouldShowTextOverflowGlyph](self, "p_shouldShowTextOverflowGlyph")
    && !-[TSDRep isSelectedIgnoringLocking](self, "isSelectedIgnoringLocking"))
  {
    if (v3)
      v4 = (id)objc_msgSend(v3, "mutableCopy");
    else
      v4 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = v4;
    -[TSWPShapeRep p_resetOverflowGlyphLayerIfNecessary](self, "p_resetOverflowGlyphLayerIfNecessary");
    v5 = -[TSDRep interactiveCanvasController](self, "interactiveCanvasController");
    -[TSDRep boundsForStandardKnobs](self, "boundsForStandardKnobs");
    -[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", TSDPositionOfKnobOnRectangle(8, v6, v7, v8, v9));
    -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:](v5, "convertUnscaledToBoundsPoint:");
    v11 = v10;
    v13 = v12;
    objc_msgSend(*(id *)&self->_editingContainedRep, "bounds");
    v18 = TSDCenterOfRect(v14, v15, v16, v17);
    v19 = TSDSubtractPoints(v11, v13, v18);
    v21 = v20;
    if (-[TSDRep parentRep](self, "parentRep"))
    {
      -[TSDRep layerFrameInScaledCanvas](-[TSDRep parentRep](self, "parentRep"), "layerFrameInScaledCanvas");
      v19 = TSDSubtractPoints(v19, v21, v22);
      v21 = v23;
    }
    -[TSDCanvas contentsScale](-[TSDInteractiveCanvasController canvas](v5, "canvas"), "contentsScale");
    v25 = TSDRoundedPointForScale(v19, v21, v24);
    objc_msgSend(*(id *)&self->_editingContainedRep, "setPosition:", TSDAddPoints(v25, v26, v18));
    objc_msgSend(v3, "addObject:", *(_QWORD *)&self->_editingContainedRep);
  }
  return v3;
}

- (BOOL)isDraggable
{
  unsigned int v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSWPShapeRep;
  v3 = -[TSDShapeRep isDraggable](&v5, sel_isDraggable);
  if (v3)
    LOBYTE(v3) = objc_msgSend(-[TSDRep info](self, "info"), "isTextUserEditable");
  return v3;
}

- (BOOL)isInvisible
{
  int v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSWPShapeRep;
  if (-[TSDShapeRep isInvisible](&v5, sel_isInvisible)
    || (v3 = objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "isInvisibleAutosizingShape")) != 0)
  {
    if (objc_msgSend((id)objc_msgSend((id)-[TSDLayout containedLayout](-[TSDRep layout](self, "layout"), "containedLayout"), "info"), "length"))
    {
      LOBYTE(v3) = (objc_msgSend((id)objc_msgSend(-[TSDShapeRep shapeInfo](self, "shapeInfo"), "shadow"), "isEnabled") & 1) == 0
                && -[TSDStyledRep reflection](self, "reflection") == 0;
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)processChangedProperty:(int)a3
{
  uint64_t v3;
  objc_super v5;

  v3 = *(_QWORD *)&a3;
  switch(a3)
  {
    case 146:
      goto LABEL_4;
    case 153:
      -[CALayer verticalTextPropertyChanged](self->_overflowGlyphLayer, "verticalTextPropertyChanged");
      -[TSDRep invalidateKnobs](self, "invalidateKnobs");
      break;
    case 149:
LABEL_4:
      -[CALayer invalidateKnobs](self->_overflowGlyphLayer, "invalidateKnobs");
      -[CALayer setNeedsDisplay](self->_overflowGlyphLayer, "setNeedsDisplay");
      break;
  }
  v5.receiver = self;
  v5.super_class = (Class)TSWPShapeRep;
  -[TSDShapeRep processChangedProperty:](&v5, sel_processChangedProperty_, v3);
}

- (id)p_overflowKnobImage
{
  return (id)objc_msgSend(MEMORY[0x24BEB3C90], "imageNamed:inBundle:", CFSTR("TSWPOverflowGlyph"), TSWPBundle());
}

- (unint64_t)enabledKnobMask
{
  objc_super v4;

  if (-[TSDLayout autosizes](-[TSDRep layout](self, "layout"), "autosizes"))
  {
    if (objc_msgSend(-[TSDRep info](self, "info"), "textIsVertical"))
      return 260;
    else
      return 80;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)TSWPShapeRep;
    return -[TSDShapeRep enabledKnobMask](&v4, sel_enabledKnobMask);
  }
}

- (double)pParagraphAlignmentOffset
{
  int v3;
  double result;
  int v5;

  v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSDRep info](self, "info"), "containedStorage"), "paragraphStyleAtParIndex:effectiveRange:", 0, 0), "intValueForProperty:", 86);
  if (v3 == 1)
    return 1.0;
  if (v3 == 2)
    return 0.5;
  result = 0.0;
  if (v3 == 4)
  {
    v5 = objc_msgSend((id)objc_msgSend(-[TSDRep info](self, "info", 0.0), "containedStorage"), "isWritingDirectionRightToLeftForParagraphAtParIndex:", 0);
    result = 0.0;
    if (v5)
      return 1.0;
  }
  return result;
}

- (BOOL)isEditingChildRep
{
  return *(&self->super.mShadowOnChildrenDisabled + 1);
}

- (BOOL)shapeLayoutShouldUpdateInstructionalText:(id)a3
{
  return !*(&self->super.mShadowOnChildrenDisabled + 1);
}

- (void)shapeLayoutDidChangeContainedStorage:(id)a3
{
  if (-[TSDRep texture](self, "texture", a3) && self->super.super.super.mTextureDeliveryStyle)
    -[TSDRep setTexture:](self, "setTexture:", 0);
  if (-[TSDStyledRep reflectionLayer](self, "reflectionLayer"))
    -[CALayer setNeedsDisplay](-[TSDStyledRep reflectionLayer](self, "reflectionLayer"), "setNeedsDisplay");
}

- (TSWPRep)containedRep
{
  return (TSWPRep *)self->_overflowGlyphLayer;
}

@end
