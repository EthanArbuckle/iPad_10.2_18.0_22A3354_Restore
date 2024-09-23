@implementation TSDConnectionLineRep

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDConnectionLineRep;
  -[TSDStyledRep dealloc](&v3, sel_dealloc);
}

- (id)connectionLineLayout
{
  objc_opt_class();
  -[TSDRep layout](self, "layout");
  return (id)TSUDynamicCast();
}

+ (id)infosToConnectFromSelection:(id)a3 withInteractiveCanvasController:(id)a4
{
  void *v6;
  void *v7;
  _QWORD v9[6];

  v6 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_msgSend(a3, "infos");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __84__TSDConnectionLineRep_infosToConnectFromSelection_withInteractiveCanvasController___block_invoke;
  v9[3] = &unk_24D82C908;
  v9[4] = a4;
  v9[5] = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);
  if (objc_msgSend(v6, "count") == 2)
    return v6;
  else
    return 0;
}

unint64_t __84__TSDConnectionLineRep_infosToConnectFromSelection_withInteractiveCanvasController___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  unint64_t result;

  result = +[TSDConnectionLineRep canConnectToRep:](TSDConnectionLineRep, "canConnectToRep:", objc_msgSend(*(id *)(a1 + 32), "repForInfo:", a2));
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", a2);
    result = objc_msgSend(*(id *)(a1 + 40), "count");
    if (result >= 3)
      *a3 = 1;
  }
  return result;
}

+ (BOOL)canConnectToRep:(id)a3
{
  void *v3;
  int v4;

  v3 = (void *)objc_msgSend(a3, "repForSelecting");
  objc_opt_class();
  objc_msgSend(v3, "layout");
  if ((objc_msgSend((id)TSUDynamicCast(), "pathIsLineSegment") & 1) != 0)
    goto LABEL_4;
  v4 = objc_msgSend((id)objc_msgSend(v3, "layout"), "allowsConnections");
  if (v4)
  {
    if ((objc_msgSend((id)objc_msgSend(v3, "info"), "isAnchoredToText") & 1) != 0)
    {
LABEL_4:
      LOBYTE(v4) = 0;
      return v4;
    }
    LOBYTE(v4) = objc_msgSend((id)objc_msgSend(v3, "info"), "isInlineWithText") ^ 1;
  }
  return v4;
}

- (BOOL)canConnectToRep:(id)a3
{
  TSDConnectionLineRep *v4;
  TSDConnectionLineRep *v5;
  _BOOL4 v6;
  TSDAbstractLayout *v7;

  v4 = (TSDConnectionLineRep *)objc_msgSend(a3, "repForSelecting");
  if (v4 == self)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    v5 = v4;
    v6 = +[TSDConnectionLineRep canConnectToRep:](TSDConnectionLineRep, "canConnectToRep:", v4);
    if (v6)
    {
      v7 = -[TSDAbstractLayout parent](-[TSDRep layout](v5, "layout"), "parent");
      LOBYTE(v6) = v7 == -[TSDAbstractLayout parent](-[TSDRep layout](self, "layout"), "parent");
    }
  }
  return v6;
}

- (BOOL)shouldShowSmartShapeKnobs
{
  int v3;
  _BOOL4 v4;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v14;

  v3 = objc_msgSend((id)objc_msgSend(-[TSDConnectionLineRep connectionLineLayout](self, "connectionLineLayout"), "connectedPathSource"), "type");
  v4 = -[TSDConnectionLineRep shouldCreateKnobs](self, "shouldCreateKnobs");
  if (v3 == 1 || !v4)
  {
    if (!v4)
      return v4;
  }
  else
  {
    -[TSDRep boundsForStandardKnobs](self, "boundsForStandardKnobs");
    v7 = v6;
    v9 = v8;
    -[TSDCanvas viewScale](-[TSDRep canvas](self, "canvas"), "viewScale");
    v11 = TSDMultiplySizeScalar(v7, v9, v10);
    *(float *)&v11 = v12 * v12 + v11 * v11;
    if (sqrtf(*(float *)&v11) < 60.0)
      goto LABEL_11;
  }
  if (!-[TSDRep isPlaceholder](self, "isPlaceholder"))
  {
    v14.receiver = self;
    v14.super_class = (Class)TSDConnectionLineRep;
    if ((-[TSDShapeRep enabledKnobMask](&v14, sel_enabledKnobMask) & 0x800) != 0)
    {
      LOBYTE(v4) = !-[TSDRep isLocked](self, "isLocked");
      return v4;
    }
  }
LABEL_11:
  LOBYTE(v4) = 0;
  return v4;
}

- (BOOL)shouldCreateKnobs
{
  id v2;

  v2 = -[TSDConnectionLineRep connectionLineLayout](self, "connectionLineLayout");
  if ((objc_msgSend(v2, "isInvisible") & 1) != 0)
    return 0;
  else
    return objc_msgSend(v2, "validLine");
}

- (BOOL)shouldShowCommentHighlight
{
  id v3;
  int v4;
  objc_super v6;

  v3 = -[TSDConnectionLineRep connectionLineLayout](self, "connectionLineLayout");
  if ((objc_msgSend(v3, "isInvisible") & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = objc_msgSend(v3, "validLine");
    if (v4)
    {
      v6.receiver = self;
      v6.super_class = (Class)TSDConnectionLineRep;
      LOBYTE(v4) = -[TSDRep shouldShowCommentHighlight](&v6, sel_shouldShowCommentHighlight);
    }
  }
  return v4;
}

- (BOOL)containsPoint:(CGPoint)a3
{
  double y;
  double x;
  id v6;
  int v7;
  objc_super v9;

  y = a3.y;
  x = a3.x;
  v6 = -[TSDConnectionLineRep connectionLineLayout](self, "connectionLineLayout");
  if ((objc_msgSend(v6, "isInvisible") & 1) != 0)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    v7 = objc_msgSend(v6, "validLine");
    if (v7)
    {
      v9.receiver = self;
      v9.super_class = (Class)TSDConnectionLineRep;
      LOBYTE(v7) = -[TSDShapeRep containsPoint:](&v9, sel_containsPoint_, x, y);
    }
  }
  return v7;
}

- (double)shortestDistanceToPoint:(CGPoint)a3 countAsHit:(BOOL *)a4
{
  double y;
  double x;
  id v8;
  double v9;
  double v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v8 = -[TSDConnectionLineRep connectionLineLayout](self, "connectionLineLayout");
  v9 = 3.40282347e38;
  if ((objc_msgSend(v8, "isInvisible") & 1) == 0 && objc_msgSend(v8, "validLine"))
  {
    v12.receiver = self;
    v12.super_class = (Class)TSDConnectionLineRep;
    -[TSDShapeRep shortestDistanceToPoint:countAsHit:](&v12, sel_shortestDistanceToPoint_countAsHit_, a4, x, y);
    return v10;
  }
  return v9;
}

- (unint64_t)enabledKnobMask
{
  unint64_t v3;
  objc_super v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSDConnectionLineRep;
  v3 = -[TSDShapeRep enabledKnobMask](&v6, sel_enabledKnobMask);
  v5.receiver = self;
  v5.super_class = (Class)TSDConnectionLineRep;
  if (-[TSDRep shouldCreateKnobs](&v5, sel_shouldCreateKnobs))
    return v3;
  else
    return v3 & 0xFFFFFFFFFFFFF3FFLL;
}

- (BOOL)shouldCreateSelectionKnobs
{
  uint64_t v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSDConnectionLineRep;
  if (-[TSDRep shouldCreateSelectionKnobs](&v6, sel_shouldCreateSelectionKnobs))
    goto LABEL_2;
  if (objc_msgSend((id)objc_msgSend(-[TSDConnectionLineRep connectionLineLayout](self, "connectionLineLayout"), "connectedPathSource"), "type") != 1)
  {
    LOBYTE(v3) = 0;
    return v3;
  }
  v4 = -[TSDConnectionLineRep connectionLineLayout](self, "connectionLineLayout");
  if (objc_msgSend(v4, "connectedFrom")
    && objc_msgSend(-[TSDCanvas repForLayout:](-[TSDRep canvas](self, "canvas"), "repForLayout:", objc_msgSend(v4, "connectedFrom")), "shouldCreateKnobs")&& objc_msgSend((id)objc_msgSend(v4, "connectedFrom"), "layoutState") == 2)
  {
LABEL_2:
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = objc_msgSend(v4, "connectedTo");
    if (v3)
    {
      LODWORD(v3) = objc_msgSend(-[TSDCanvas repForLayout:](-[TSDRep canvas](self, "canvas"), "repForLayout:", objc_msgSend(v4, "connectedTo")), "shouldCreateKnobs");
      if ((_DWORD)v3)
        LOBYTE(v3) = objc_msgSend((id)objc_msgSend(v4, "connectedTo"), "layoutState") == 2;
    }
  }
  return v3;
}

- (id)additionalRepsForDragging
{
  id v3;
  id v4;

  if (!-[TSDConnectionLineRep p_isConnected](self, "p_isConnected"))
    return (id)objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v3 = -[TSDConnectionLineRep connectionLineLayout](self, "connectionLineLayout");
  v4 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  if (objc_msgSend(v3, "connectedFrom"))
    objc_msgSend(v4, "addObject:", -[TSDCanvas repForLayout:](-[TSDRep canvas](self, "canvas"), "repForLayout:", objc_msgSend(v3, "connectedFrom")));
  if (objc_msgSend(v3, "connectedTo"))
    objc_msgSend(v4, "addObject:", -[TSDCanvas repForLayout:](-[TSDRep canvas](self, "canvas"), "repForLayout:", objc_msgSend(v3, "connectedTo")));
  return v4;
}

- (BOOL)isSelectable
{
  return -[TSDLayout isInTopLevelContainerForEditing](-[TSDRep layout](self, "layout"), "isInTopLevelContainerForEditing");
}

- (BOOL)isDraggable
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDConnectionLineRep;
  v3 = -[TSDShapeRep isDraggable](&v5, sel_isDraggable);
  if (v3)
    LOBYTE(v3) = !-[TSDConnectionLineRep p_isConnectedToLockedObjects](self, "p_isConnectedToLockedObjects");
  return v3;
}

- (BOOL)canMakePathEditable
{
  return 0;
}

- (CGRect)targetRectForEditMenu
{
  id v3;
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
  double v16;
  CGRect result;

  v3 = -[TSDRep knobForTag:](self, "knobForTag:", 12);
  v4 = *MEMORY[0x24BDBF070];
  v5 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF070] + 24);
  if (-[TSDConnectionLineRep p_controlKnobVisible](self, "p_controlKnobVisible")
    && !-[TSDConnectionLineRep i_editMenuOverlapsEndKnobs](self, "i_editMenuOverlapsEndKnobs"))
  {
    objc_msgSend(v3, "position");
    v4 = TSDRectWithCenterAndSize(v8, v9, 2.0);
    v5 = v10;
    v6 = v11;
    v7 = v12;
  }
  v13 = v4;
  v14 = v5;
  v15 = v6;
  v16 = v7;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (BOOL)canUseSpecializedHitRegionForKnob:(id)a3
{
  objc_super v6;

  if (objc_msgSend(a3, "tag") == 12)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)TSDConnectionLineRep;
  return -[TSDShapeRep canUseSpecializedHitRegionForKnob:](&v6, sel_canUseSpecializedHitRegionForKnob_, a3);
}

- (BOOL)directlyManagesLayerContent
{
  objc_super v4;

  if ((objc_msgSend(-[TSDConnectionLineRep connectionLineLayout](self, "connectionLineLayout"), "shouldValidate") & 1) != 0)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)TSDConnectionLineRep;
  return -[TSDShapeRep directlyManagesLayerContent](&v4, sel_directlyManagesLayerContent);
}

- (BOOL)canBeUsedForImageMask
{
  return 0;
}

- (void)updateFromLayout
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDConnectionLineRep;
  -[TSDRep updateFromLayout](&v4, sel_updateFromLayout);
  v3 = (void *)objc_msgSend(-[TSDShapeRep shapeLayout](self, "shapeLayout"), "pathSource");
  if ((objc_msgSend(v3, "isEqual:", self->mLastPathSource) & 1) == 0)
  {
    -[TSDShapeRep layoutInRootChangedFrom:to:translatedOnly:](self, "layoutInRootChangedFrom:to:translatedOnly:", 0, 0, 0);

    self->mLastPathSource = (TSDPathSource *)objc_msgSend(v3, "copy");
  }
}

- (CGPoint)i_dragOffset
{
  id v3;
  _BOOL4 v4;
  double v5;
  double v6;
  objc_super v7;
  CGPoint result;

  v3 = -[TSDConnectionLineRep connectionLineLayout](self, "connectionLineLayout");
  v4 = objc_msgSend(v3, "connectedTo") != 0;
  if (((v4 ^ (objc_msgSend(v3, "connectedFrom") == 0)) & 1) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)TSDConnectionLineRep;
    -[TSDRep i_dragOffset](&v7, sel_i_dragOffset);
  }
  else
  {
    if (objc_msgSend(v3, "isBeingTransformed"))
      objc_msgSend(v3, "pauseDynamicTransformation");
    objc_msgSend(v3, "i_accumulatedDrag");
  }
  result.y = v6;
  result.x = v5;
  return result;
}

- (BOOL)i_editMenuOverlapsEndKnobs
{
  id v3;
  id v4;
  id v5;
  TSDCanvas *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  TSDCanvas *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  TSDCanvas *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGPoint v26;
  CGPoint v27;
  CGRect v28;
  CGRect v29;

  v3 = -[TSDRep knobForTag:](self, "knobForTag:", 12);
  v4 = -[TSDRep knobForTag:](self, "knobForTag:", 11);
  v5 = -[TSDRep knobForTag:](self, "knobForTag:", 10);
  v6 = -[TSDRep canvas](self, "canvas");
  objc_msgSend(v3, "position");
  -[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:");
  -[TSDCanvas convertUnscaledToBoundsPoint:](v6, "convertUnscaledToBoundsPoint:");
  v8 = v7;
  v10 = v9;
  v11 = -[TSDRep canvas](self, "canvas");
  objc_msgSend(v4, "position");
  -[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:");
  -[TSDCanvas convertUnscaledToBoundsPoint:](v11, "convertUnscaledToBoundsPoint:");
  v13 = v12;
  v15 = v14;
  v16 = -[TSDRep canvas](self, "canvas");
  objc_msgSend(v5, "position");
  -[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:");
  -[TSDCanvas convertUnscaledToBoundsPoint:](v16, "convertUnscaledToBoundsPoint:");
  v18 = v17;
  v20 = v19;
  -[TSDCanvas i_approximateScaledFrameOfEditingMenuAtPoint:](-[TSDRep canvas](self, "canvas"), "i_approximateScaledFrameOfEditingMenuAtPoint:", v8, v10);
  x = v28.origin.x;
  y = v28.origin.y;
  width = v28.size.width;
  height = v28.size.height;
  v26.x = v13;
  v26.y = v15;
  if (CGRectContainsPoint(v28, v26))
    return 1;
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  v27.x = v18;
  v27.y = v20;
  return CGRectContainsPoint(v29, v27);
}

- (BOOL)p_isConnected
{
  id v2;

  v2 = -[TSDConnectionLineRep connectionLineLayout](self, "connectionLineLayout");
  return objc_msgSend(v2, "connectedFrom") || objc_msgSend(v2, "connectedTo") != 0;
}

- (BOOL)p_isConnectedToLockedObjects
{
  id v2;
  void *v3;
  void *v4;

  v2 = -[TSDConnectionLineRep connectionLineLayout](self, "connectionLineLayout");
  objc_opt_class();
  objc_msgSend((id)objc_msgSend(v2, "connectedFrom"), "info");
  v3 = (void *)TSUDynamicCast();
  objc_opt_class();
  objc_msgSend((id)objc_msgSend(v2, "connectedTo"), "info");
  v4 = (void *)TSUDynamicCast();
  if ((objc_msgSend(v3, "isLocked") & 1) != 0)
    return 1;
  else
    return objc_msgSend(v4, "isLocked");
}

- (BOOL)p_controlKnobVisible
{
  _BOOL4 v3;
  id v4;
  TSDCanvas *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGPoint v11;
  CGRect v12;

  v3 = -[TSDConnectionLineRep shouldShowSmartShapeKnobs](self, "shouldShowSmartShapeKnobs");
  if (v3)
  {
    v4 = -[TSDRep knobForTag:](self, "knobForTag:", 12);
    v5 = -[TSDRep canvas](self, "canvas");
    objc_msgSend(v4, "position");
    -[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:");
    -[TSDCanvas convertUnscaledToBoundsPoint:](v5, "convertUnscaledToBoundsPoint:");
    v7 = v6;
    v9 = v8;
    -[TSDInteractiveCanvasController visibleBoundsRect](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "visibleBoundsRect");
    v11.x = v7;
    v11.y = v9;
    LOBYTE(v3) = CGRectContainsPoint(v12, v11);
  }
  return v3;
}

@end
