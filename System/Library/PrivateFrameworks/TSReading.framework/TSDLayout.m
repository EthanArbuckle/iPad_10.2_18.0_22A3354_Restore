@implementation TSDLayout

- (id)layoutController
{
  return (id)objc_msgSend(-[TSDLayout rootLayout](self, "rootLayout"), "layoutController");
}

- (id)rootLayout
{
  objc_opt_class();
  -[TSDAbstractLayout root](self, "root");
  return (id)TSUDynamicCast();
}

- (void)setAdjustedInterimPositionX:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  if (objc_msgSend((id)-[TSDInfo owningAttachmentNoRecurse](-[TSDLayout info](self, "info"), "owningAttachmentNoRecurse"), "isAnchored"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v5 = (void *)-[TSDLayout performSelector:](self, "performSelector:", sel_stroke);
      if (!v5)
      {
        v6 = 0.0;
LABEL_8:
        a3 = a3 - v6;
        goto LABEL_9;
      }
    }
    else
    {
      -[TSDLayout info](self, "info");
      v6 = 0.0;
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_8;
      v5 = (void *)-[TSDInfo performSelector:](-[TSDLayout info](self, "info"), "performSelector:", sel_stroke);
      if (!v5)
        goto LABEL_8;
    }
    objc_msgSend(v5, "outsets");
    v6 = v7;
    goto LABEL_8;
  }
LABEL_9:
  if (-[TSDLayout wantsRoundedInlinePosition](self, "wantsRoundedInlinePosition"))
  {
    TSURound();
    a3 = v8;
  }
  v9.receiver = self;
  v9.super_class = (Class)TSDLayout;
  -[TSDAbstractLayout setInterimPositionX:](&v9, sel_setInterimPositionX_, a3);
}

- (BOOL)wantsRoundedInlinePosition
{
  return 1;
}

- (TSDInfo)info
{
  return self->mInfo;
}

- (CGPoint)alignmentFrameOriginForFixingInterimPosition
{
  double x;
  double y;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  objc_super v9;
  CGPoint result;

  if (self->mLayoutState == 2)
  {
    x = self->mBaseAlignmentFrameOriginForFixingInterimPosition.x;
    y = self->mBaseAlignmentFrameOriginForFixingInterimPosition.y;
  }
  else if (-[TSDLayout i_useBaseCapturedAlignmentFrameOriginForInline](self, "i_useBaseCapturedAlignmentFrameOriginForInline"))
  {
    v5 = TSDSubtractPoints(self->mCapturedAlignmentFrameOriginForInline.x, self->mCapturedAlignmentFrameOriginForInline.y, self->mBaseCapturedAlignmentFrameOriginForInline.x);
    v9.receiver = self;
    v9.super_class = (Class)TSDLayout;
    -[TSDAbstractLayout alignmentFrameOriginForFixingInterimPosition](&v9, sel_alignmentFrameOriginForFixingInterimPosition);
    x = TSDSubtractPoints(v6, v7, v5);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TSDLayout;
    -[TSDAbstractLayout alignmentFrameOriginForFixingInterimPosition](&v8, sel_alignmentFrameOriginForFixingInterimPosition);
  }
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)i_useBaseCapturedAlignmentFrameOriginForInline
{
  return (self->mLayoutState - 3) < 2;
}

- (TSDLayout)initWithInfo:(id)a3
{
  TSDLayout *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSDLayout;
  v4 = -[TSDAbstractLayout init](&v6, sel_init);
  if (v4)
  {
    v4->mInfo = (TSDInfo *)a3;
    *(_BYTE *)&v4->mInvalidFlags |= 3u;
  }
  return v4;
}

- (void)setAdjustedInterimPositionY:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  if (objc_msgSend((id)-[TSDInfo owningAttachmentNoRecurse](-[TSDLayout info](self, "info"), "owningAttachmentNoRecurse"), "isAnchored"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v5 = (void *)-[TSDLayout performSelector:](self, "performSelector:", sel_stroke);
      if (!v5)
      {
        v6 = 0.0;
LABEL_8:
        a3 = a3 - v6;
        goto LABEL_9;
      }
    }
    else
    {
      -[TSDLayout info](self, "info");
      v6 = 0.0;
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_8;
      v5 = (void *)-[TSDInfo performSelector:](-[TSDLayout info](self, "info"), "performSelector:", sel_stroke);
      if (!v5)
        goto LABEL_8;
    }
    objc_msgSend(v5, "outsets");
    v6 = v7;
    goto LABEL_8;
  }
LABEL_9:
  if (-[TSDLayout wantsRoundedInlinePosition](self, "wantsRoundedInlinePosition"))
  {
    TSURound();
    a3 = v8;
  }
  v9.receiver = self;
  v9.super_class = (Class)TSDLayout;
  -[TSDAbstractLayout setInterimPositionY:](&v9, sel_setInterimPositionY_, a3);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDLayout;
  -[TSDAbstractLayout dealloc](&v3, sel_dealloc);
}

- (TSDLayoutGeometry)dynamicGeometry
{
  if (self->mBaseGeometry)
    return -[TSDAbstractLayout geometry](self, "geometry");
  else
    return 0;
}

- (void)setDynamicGeometry:(id)a3
{
  void *v5;
  uint64_t v6;

  if (!self->mBaseGeometry)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDLayout setDynamicGeometry:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDLayout.m"), 126, CFSTR("setting dynamic geometry when not in dynamic operation"));
  }
  -[TSDAbstractLayout setGeometry:](self, "setGeometry:", a3);
  objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "layoutInvalidated");
}

- (BOOL)shouldValidate
{
  return 1;
}

- (void)finishIterativePositioning
{
  self->mHasFinishedIterativePositioning = 1;
}

- (void)invalidate
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "invalidateLayout:", self);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = -[TSDLayout dependentLayouts](self, "dependentLayouts", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "invalidate");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
  -[TSDLayout p_invalidateConnectedLayouts](self, "p_invalidateConnectedLayouts");
}

- (void)invalidatePosition
{
  *(_BYTE *)&self->mInvalidFlags |= 1u;
  self->mHasFinishedIterativePositioning = 0;
  -[TSDLayout invalidate](self, "invalidate");
}

- (void)invalidateSize
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)&self->mInvalidFlags |= 2u;
  -[TSDLayout invalidate](self, "invalidate");
  if (-[TSDLayout dependentsRelyOnSize](self, "dependentsRelyOnSize"))
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = -[TSDLayout dependentLayouts](self, "dependentLayouts", 0);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "invalidateFrame");
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }
  }
}

- (BOOL)dependentsRelyOnSize
{
  return 0;
}

- (void)invalidateFrame
{
  -[TSDLayout invalidateSize](self, "invalidateSize");
  -[TSDLayout invalidatePosition](self, "invalidatePosition");
}

- (void)invalidateChildren
{
  objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "invalidateChildrenOfLayout:", self);
}

- (void)unregisterFromLayoutController
{
  if (-[TSDLayout layoutController](self, "layoutController"))
    -[TSDLayout p_unregisterWithLayoutController:](self, "p_unregisterWithLayoutController:", -[TSDLayout layoutController](self, "layoutController"));
}

- (void)setParent:(id)a3
{
  TSDAbstractLayout *v5;
  uint64_t v6;
  id v7;
  id v8;
  objc_super v9;

  if (-[TSDAbstractLayout parent](self, "parent") != a3)
  {
    -[TSDLayout parentWillChangeTo:](self, "parentWillChangeTo:", a3);
    v5 = -[TSDAbstractLayout root](self, "root");
    v6 = objc_msgSend(a3, "root");
    if (v5 == (TSDAbstractLayout *)v6)
    {
      v9.receiver = self;
      v9.super_class = (Class)TSDLayout;
      -[TSDAbstractLayout setParent:](&v9, sel_setParent_, a3);
    }
    else
    {
      v7 = -[TSDLayout layoutController](self, "layoutController");
      if (v7)
        -[TSDLayout p_unregisterWithLayoutController:](self, "p_unregisterWithLayoutController:", v7);
      v9.receiver = self;
      v9.super_class = (Class)TSDLayout;
      -[TSDAbstractLayout setParent:](&v9, sel_setParent_, a3);
      v8 = -[TSDLayout layoutController](self, "layoutController");
      if (v8)
      {
        -[TSDLayout p_registerWithLayoutController:](self, "p_registerWithLayoutController:", v8);
        -[TSDLayout p_recursiveInvalidate](self, "p_recursiveInvalidate");
      }
    }
    -[TSDLayout parentDidChange](self, "parentDidChange");
    if (v6)
      -[TSDLayout p_invalidateConnectedLayouts](self, "p_invalidateConnectedLayouts");
  }
}

- (BOOL)invalidGeometry
{
  return (*(_BYTE *)&self->mInvalidFlags & 3) != 0;
}

- (void)validate
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;

  if (-[TSDLayout invalidGeometry](self, "invalidGeometry"))
  {
    -[TSDLayout capturedInfoPositionForAttachment](self, "capturedInfoPositionForAttachment");
    self->mCapturedInfoGeometryPositionForInline.x = v3;
    self->mCapturedInfoGeometryPositionForInline.y = v4;
    -[TSDAbstractLayout setGeometry:](self, "setGeometry:", -[TSDLayout computeLayoutGeometry](self, "computeLayoutGeometry"));
    -[TSDAbstractLayout alignmentFrame](self, "alignmentFrame");
    self->mCapturedAlignmentFrameOriginForInline.x = v5;
    self->mCapturedAlignmentFrameOriginForInline.y = v6;
    *(_BYTE *)&self->mInvalidFlags &= 0xFCu;
  }
}

- (CGPoint)capturedInfoPositionForAttachment
{
  double v2;
  double v3;
  CGPoint result;

  objc_msgSend((id)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry"), "position");
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)i_layoutGeometryProvider
{
  return (id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "layoutGeometryProviderForLayout:", self);
}

- (id)layoutGeometryFromProvider
{
  id v3;
  id result;

  v3 = -[TSDLayout i_layoutGeometryProvider](self, "i_layoutGeometryProvider");
  if (!v3)
    return -[TSDLayout layoutGeometryFromInfo](self, "layoutGeometryFromInfo");
  result = (id)objc_msgSend(v3, "layoutGeometryForLayout:", self);
  if (!result)
    return -[TSDLayout layoutGeometryFromInfo](self, "layoutGeometryFromInfo");
  return result;
}

- (id)layoutGeometryFromInfo
{
  void *v3;
  uint64_t v4;

  if (!self->mInfo)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDLayout layoutGeometryFromInfo]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDLayout.m"), 345, CFSTR("Layouts must either override computeLayoutGeometry, or have a non-nil info to query for geometry"));
  }
  return -[TSDLayoutGeometry initWithInfoGeometry:]([TSDLayoutGeometry alloc], "initWithInfoGeometry:", -[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry"));
}

- (id)computeInfoGeometryFromLayoutGeometry:(id)a3
{
  _OWORD v4[3];

  if (a3)
    objc_msgSend(a3, "fullTransform");
  else
    memset(v4, 0, sizeof(v4));
  return +[TSDInfoGeometry geometryFromFullTransform:](TSDInfoGeometry, "geometryFromFullTransform:", v4);
}

- (void)processChanges:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
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
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        objc_opt_class();
        objc_msgSend(v9, "details");
        v10 = (void *)TSUDynamicCast();
        if (v10)
        {
          v11 = (void *)objc_msgSend(v10, "changedProperties");
          v12[0] = MEMORY[0x24BDAC760];
          v12[1] = 3221225472;
          v12[2] = __28__TSDLayout_processChanges___block_invoke;
          v12[3] = &unk_24D82AF28;
          v12[4] = self;
          objc_msgSend(v11, "enumeratePropertiesUsingBlock:", v12);
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
}

uint64_t __28__TSDLayout_processChanges___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processChangedProperty:", a2);
}

- (Class)repClassOverride
{
  return (Class)-[TSDInfo repClass](self->mInfo, "repClass");
}

- (CGPoint)infoGeometryPositionForCurrentAttachedLayoutGeometry
{
  void *v3;
  uint64_t v4;
  double x;
  double v6;
  double y;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  if (!-[TSDInfo owningAttachment](-[TSDLayout info](self, "info"), "owningAttachment"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDLayout infoGeometryPositionForCurrentAttachedLayoutGeometry]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDLayout.m"), 376, CFSTR("don't use unless the object is attached"));
  }
  x = self->mCapturedAlignmentFrameOriginForInline.x;
  v6 = self->mCapturedInfoGeometryPositionForInline.x;
  y = self->mCapturedInfoGeometryPositionForInline.y;
  -[TSDAbstractLayout alignmentFrame](self, "alignmentFrame");
  v9 = v8;
  v11 = v10;
  v12 = TSDSubtractPoints(v6, y, x);
  v13 = TSDAddPoints(v9, v11, v12);
  result.y = v14;
  result.x = v13;
  return result;
}

- (BOOL)shouldBeDisplayedInShowMode
{
  return 1;
}

- (BOOL)isInGroup
{
  TSDAbstractLayout *v2;
  TSDAbstractLayout *v3;
  char v4;

  v2 = -[TSDAbstractLayout parent](self, "parent");
  if (!v2)
    return 0;
  v3 = v2;
  do
  {
    v4 = -[TSDAbstractLayout isMemberOfClass:](v3, "isMemberOfClass:", objc_opt_class());
    if ((v4 & 1) != 0)
      break;
    v3 = -[TSDAbstractLayout parent](v3, "parent");
  }
  while (v3);
  return v4;
}

- (BOOL)isInTopLevelContainerForEditing
{
  void *v3;
  TSDAbstractLayout *v4;
  uint64_t v5;
  BOOL result;
  char v7;
  uint64_t v8;

  v3 = (void *)objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "canvasController");
  v4 = -[TSDAbstractLayout parent](self, "parent");
  v5 = objc_msgSend((id)objc_msgSend(v3, "topLevelContainerRepForEditing"), "layout");
  result = 1;
  if (v4 && v4 != (TSDAbstractLayout *)v5)
  {
    do
    {
      v7 = -[TSDAbstractLayout isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class());
      if ((v7 & 1) != 0)
        break;
      v8 = -[TSDAbstractLayout parent](v4, "parent");
      if (!v8)
        break;
      v4 = (TSDAbstractLayout *)v8;
    }
    while (v8 != v5);
    return v7 ^ 1;
  }
  return result;
}

- (id)stroke
{
  return 0;
}

- (BOOL)isStrokeBeingManipulated
{
  return 0;
}

- (void)i_setBaseCapturedAlignmentFrameOriginForInline
{
  if (-[TSDInfo owningAttachment](-[TSDLayout info](self, "info"), "owningAttachment"))
    self->mBaseCapturedAlignmentFrameOriginForInline = self->mCapturedAlignmentFrameOriginForInline;
}

- (void)beginDynamicOperation
{
  CGRect *p_mInitialBoundsForStandardKnobs;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  TSDLayoutGeometry *mBaseGeometry;
  void *v9;
  uint64_t v10;

  p_mInitialBoundsForStandardKnobs = &self->mInitialBoundsForStandardKnobs;
  -[TSDLayout boundsForStandardKnobs](self, "boundsForStandardKnobs");
  p_mInitialBoundsForStandardKnobs->origin.x = v4;
  p_mInitialBoundsForStandardKnobs->origin.y = v5;
  p_mInitialBoundsForStandardKnobs->size.width = v6;
  p_mInitialBoundsForStandardKnobs->size.height = v7;
  mBaseGeometry = self->mBaseGeometry;
  if (mBaseGeometry)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDLayout beginDynamicOperation]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDLayout.m"), 503, CFSTR("beginning dynamic operation when there is already a base geometry"));
    mBaseGeometry = self->mBaseGeometry;
  }

  self->mBaseGeometry = (TSDLayoutGeometry *)-[TSDLayoutGeometry copy](-[TSDAbstractLayout geometry](self, "geometry"), "copy");
  self->mLayoutState = 1;
}

- (void)endDynamicOperation
{
  TSDLayoutGeometry *mBaseGeometry;

  if (self->mLayoutState == 2)
    -[TSDLayout invalidateFrame](self, "invalidateFrame");
  mBaseGeometry = self->mBaseGeometry;
  if (mBaseGeometry)
  {

    self->mBaseGeometry = 0;
  }
  self->mLayoutState = 0;
}

- (BOOL)isBeingTransformed
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "canvasController");
  v4 = objc_msgSend(v3, "dynamicOperationController");
  if (v4)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = (void *)objc_msgSend((id)objc_msgSend(v3, "dynamicOperationController", 0), "currentlyTransformingReps");
    v4 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v6 = v4;
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v5);
          if ((TSDLayout *)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "layout") == self)
          {
            LOBYTE(v4) = 1;
            return v4;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        LOBYTE(v4) = 0;
        if (v6)
          continue;
        break;
      }
    }
  }
  return v4;
}

- (void)beginDrag
{
  CGPoint *p_mBaseAlignmentFrameOriginForFixingInterimPosition;
  CGFloat v4;
  CGFloat v5;

  p_mBaseAlignmentFrameOriginForFixingInterimPosition = &self->mBaseAlignmentFrameOriginForFixingInterimPosition;
  -[TSDLayout alignmentFrameOriginForFixingInterimPosition](self, "alignmentFrameOriginForFixingInterimPosition");
  p_mBaseAlignmentFrameOriginForFixingInterimPosition->x = v4;
  p_mBaseAlignmentFrameOriginForFixingInterimPosition->y = v5;
  self->mLayoutState = 2;
}

- (void)dragByUnscaled:(CGPoint)a3
{
  double y;
  double x;
  TSDAbstractLayout *v6;
  double v7;
  CGAffineTransform v8;
  CGAffineTransform v9;

  y = a3.y;
  x = a3.x;
  if (-[TSDAbstractLayout parent](self, "parent"))
  {
    v6 = -[TSDAbstractLayout parent](self, "parent");
    if (v6)
      -[TSDAbstractLayout transformInRoot](v6, "transformInRoot");
    else
      memset(&v8, 0, sizeof(v8));
    CGAffineTransformInvert(&v9, &v8);
    x = TSDDeltaApplyAffineTransform((float64x2_t *)&v9, x, y);
    y = v7;
  }
  -[TSDLayout dragBy:](self, "dragBy:", x, y, *(_OWORD *)&v8.a, *(_OWORD *)&v8.c, *(_OWORD *)&v8.tx);
}

- (void)dragBy:(CGPoint)a3
{
  double y;
  double x;
  void *v7;
  uint64_t v8;

  y = a3.y;
  x = a3.x;
  if (a3.x != *MEMORY[0x24BDBEFB0] || a3.y != *(double *)(MEMORY[0x24BDBEFB0] + 8))
  {
    if (!self->mBaseGeometry)
    {
      v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDLayout dragBy:]");
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDLayout.m"), 571, CFSTR("invalid nil value for '%s'"), "mBaseGeometry");
    }
    -[TSDLayout setDynamicGeometry:](self, "setDynamicGeometry:", -[TSDLayoutGeometry geometryByTranslatingBy:](-[TSDAbstractLayout geometry](self, "geometry"), "geometryByTranslatingBy:", x, y));
    -[TSDLayout p_invalidateConnectedLayouts](self, "p_invalidateConnectedLayouts");
    objc_msgSend((id)objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "canvas"), "layoutInvalidated");
  }
}

- (CGAffineTransform)originalTransformInRoot
{
  uint64_t v4;
  __int128 v5;
  CGAffineTransform *v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[3];
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v4 = MEMORY[0x24BDBD8B8];
  v5 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v4 + 32);
  if (self)
  {
    v6 = self;
    do
    {
      objc_opt_class();
      v7 = (void *)TSUDynamicCast();
      if (objc_msgSend(v7, "originalGeometry"))
      {
        v8 = (void *)objc_msgSend(v7, "originalGeometry");
        if (!v8)
          goto LABEL_7;
      }
      else
      {
        v8 = (void *)-[CGAffineTransform geometry](v6, "geometry");
        if (!v8)
        {
LABEL_7:
          v13 = 0u;
          v14 = 0u;
          v12 = 0u;
          goto LABEL_8;
        }
      }
      v9 = *(_OWORD *)&retstr->c;
      v11[0] = *(_OWORD *)&retstr->a;
      v11[1] = v9;
      v11[2] = *(_OWORD *)&retstr->tx;
      objc_msgSend(v8, "transformByConcatenatingTransformTo:", v11);
LABEL_8:
      v10 = v13;
      *(_OWORD *)&retstr->a = v12;
      *(_OWORD *)&retstr->c = v10;
      *(_OWORD *)&retstr->tx = v14;
      self = (CGAffineTransform *)-[CGAffineTransform parent](v6, "parent");
      v6 = self;
    }
    while (self);
  }
  return self;
}

- (CGAffineTransform)originalTransformForProvidingGuides
{
  if (self)
    return (CGAffineTransform *)-[CGAffineTransform originalTransformInRoot](self, "originalTransformInRoot");
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return self;
}

- (CGAffineTransform)layoutTransformInInfoSpace:(SEL)a3
{
  void *v7;
  CGAffineTransform *result;
  double v9;
  double v10;
  __int128 v11;
  id v12;
  void *v13;
  __int128 v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform t2;
  CGAffineTransform v19;
  CGAffineTransform t1;
  CGAffineTransform v21;

  v7 = (void *)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry");
  result = (CGAffineTransform *)objc_msgSend(v7, "heightValid");
  if ((_DWORD)result
    && (result = (CGAffineTransform *)objc_msgSend(v7, "widthValid"), (_DWORD)result)
    && (result = (CGAffineTransform *)objc_msgSend(v7, "size"), v9 != 0.0)
    && (result = (CGAffineTransform *)objc_msgSend(v7, "size"), v10 != 0.0))
  {
    memset(&v21, 0, sizeof(v21));
    v12 = -[TSDLayout originalPureGeometry](self, "originalPureGeometry");
    if (v12)
      objc_msgSend(v12, "fullTransform");
    else
      memset(&v19, 0, sizeof(v19));
    CGAffineTransformInvert(&t1, &v19);
    v13 = (void *)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry");
    if (v13)
      objc_msgSend(v13, "fullTransform");
    else
      memset(&t2, 0, sizeof(t2));
    CGAffineTransformConcat(&v21, &t1, &t2);
    v15 = v21;
    CGAffineTransformInvert(&v16, &v15);
    v14 = *(_OWORD *)&a4->c;
    *(_OWORD *)&v15.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&v15.c = v14;
    *(_OWORD *)&v15.tx = *(_OWORD *)&a4->tx;
    CGAffineTransformConcat(&v17, &v16, &v15);
    v15 = v21;
    return CGAffineTransformConcat(retstr, &v17, &v15);
  }
  else
  {
    v11 = *(_OWORD *)&a4->c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&a4->a;
    *(_OWORD *)&retstr->c = v11;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&a4->tx;
  }
  return result;
}

- (BOOL)shouldProvideGuidesDuringExclusiveAlignmentOperation
{
  return 0;
}

- (void)beginRotate
{
  -[TSDLayout i_setBaseCapturedAlignmentFrameOriginForInline](self, "i_setBaseCapturedAlignmentFrameOriginForInline");
  self->mLayoutState = 3;
}

- (BOOL)resizeMayChangeAspectRatio
{
  void *v3;

  objc_opt_class();
  -[TSDLayout info](self, "info");
  v3 = (void *)TSUDynamicCast();
  if (v3)
    return objc_msgSend(v3, "aspectRatioLocked") ^ 1;
  else
    return 1;
}

- (BOOL)canAspectRatioLockBeChangedByUser
{
  objc_opt_class();
  -[TSDLayout info](self, "info");
  return objc_msgSend((id)TSUDynamicCast(), "isLocked") ^ 1;
}

- (void)beginResize
{
  -[TSDLayout i_setBaseCapturedAlignmentFrameOriginForInline](self, "i_setBaseCapturedAlignmentFrameOriginForInline");
  self->mLayoutState = 4;
}

- (CGSize)minimumSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 1.0;
  v3 = 1.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)maximumSizeForChildLayout:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = INFINITY;
  v4 = INFINITY;
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)isBeingManipulated
{
  return self->mLayoutState != 0;
}

- (CGRect)initialBoundsForStandardKnobs
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mInitialBoundsForStandardKnobs.origin.x;
  y = self->mInitialBoundsForStandardKnobs.origin.y;
  width = self->mInitialBoundsForStandardKnobs.size.width;
  height = self->mInitialBoundsForStandardKnobs.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)initialInfoGeometry
{
  return (id)-[TSDInfo geometry](-[TSDLayout info](self, "info"), "geometry");
}

- (id)originalPureGeometry
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  TSDLayoutGeometry *v11;
  TSDLayoutGeometry *v12;
  CGAffineTransform v14;
  CGAffineTransform t1;
  CGAffineTransform v16;
  CGAffineTransform v17;

  -[TSDLayout initialBoundsForStandardKnobs](self, "initialBoundsForStandardKnobs");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  memset(&v17, 0, sizeof(v17));
  v11 = -[TSDLayout originalGeometry](self, "originalGeometry");
  if (v11)
    -[TSDLayoutGeometry transform](v11, "transform");
  else
    memset(&v17, 0, sizeof(v17));
  CGAffineTransformMakeTranslation(&t1, v4, v6);
  v14 = v17;
  CGAffineTransformConcat(&v16, &t1, &v14);
  v17 = v16;
  v12 = [TSDLayoutGeometry alloc];
  v16 = v17;
  return -[TSDLayoutGeometry initWithSize:transform:](v12, "initWithSize:transform:", &v16, v8, v10);
}

- (id)pureGeometry
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  TSDLayoutGeometry *v11;
  TSDLayoutGeometry *v12;
  CGAffineTransform v14;
  CGAffineTransform t1;
  CGAffineTransform v16;
  CGAffineTransform v17;

  -[TSDLayout boundsForStandardKnobs](self, "boundsForStandardKnobs");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  memset(&v17, 0, sizeof(v17));
  v11 = -[TSDAbstractLayout geometry](self, "geometry");
  if (v11)
    -[TSDLayoutGeometry transform](v11, "transform");
  else
    memset(&v17, 0, sizeof(v17));
  CGAffineTransformMakeTranslation(&t1, v4, v6);
  v14 = v17;
  CGAffineTransformConcat(&v16, &t1, &v14);
  v17 = v16;
  v12 = [TSDLayoutGeometry alloc];
  v16 = v17;
  return -[TSDLayoutGeometry initWithSize:transform:](v12, "initWithSize:transform:", &v16, v8, v10);
}

- (id)pureGeometryInRoot
{
  return -[TSDAbstractLayout geometryInRoot:](self, "geometryInRoot:", -[TSDLayout pureGeometry](self, "pureGeometry"));
}

- (id)inspectorGeometry
{
  id v3;
  __int128 v4;
  TSDAbstractLayout *v5;
  TSDAbstractLayout *v6;
  TSDLayoutGeometry *v7;
  _OWORD v9[3];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v3 = -[TSDLayout pureGeometry](self, "pureGeometry");
  v4 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v13 = *MEMORY[0x24BDBD8B8];
  v14 = v4;
  v15 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  v5 = -[TSDAbstractLayout parent](self, "parent");
  if (v5)
  {
    v6 = v5;
    do
    {
      if (-[TSDAbstractLayout isRootLayoutForInspectorGeometry](v6, "isRootLayoutForInspectorGeometry"))
        break;
      v7 = -[TSDAbstractLayout geometry](v6, "geometry");
      if (v7)
      {
        v9[0] = v13;
        v9[1] = v14;
        v9[2] = v15;
        -[TSDLayoutGeometry transformByConcatenatingTransformTo:](v7, "transformByConcatenatingTransformTo:", v9);
      }
      else
      {
        v11 = 0u;
        v12 = 0u;
        v10 = 0u;
      }
      v13 = v10;
      v14 = v11;
      v15 = v12;
      v6 = -[TSDAbstractLayout parent](v6, "parent");
    }
    while (v6);
  }
  v10 = v13;
  v11 = v14;
  v12 = v15;
  return (id)objc_msgSend(v3, "geometryByTransformingBy:", &v10);
}

- (CGAffineTransform)pureTransformInRoot
{
  id v5;
  CGAffineTransform *result;
  CGAffineTransform *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[3];
  __int128 v12;
  __int128 v13;
  __int128 v14;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  v5 = -[TSDLayout pureGeometry](self, "pureGeometry");
  if (v5)
  {
    objc_msgSend(v5, "transform");
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
  result = -[TSDAbstractLayout parent](self, "parent");
  if (result)
  {
    v7 = result;
    do
    {
      v8 = (void *)-[CGAffineTransform geometry](v7, "geometry");
      if (v8)
      {
        v9 = *(_OWORD *)&retstr->c;
        v11[0] = *(_OWORD *)&retstr->a;
        v11[1] = v9;
        v11[2] = *(_OWORD *)&retstr->tx;
        objc_msgSend(v8, "transformByConcatenatingTransformTo:", v11);
      }
      else
      {
        v13 = 0u;
        v14 = 0u;
        v12 = 0u;
      }
      v10 = v13;
      *(_OWORD *)&retstr->a = v12;
      *(_OWORD *)&retstr->c = v10;
      *(_OWORD *)&retstr->tx = v14;
      result = (CGAffineTransform *)-[CGAffineTransform parent](v7, "parent");
      v7 = result;
    }
    while (result);
  }
  return result;
}

- (CGAffineTransform)originalPureTransformInRoot
{
  id v5;
  CGAffineTransform *result;
  CGAffineTransform *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[3];
  __int128 v12;
  __int128 v13;
  __int128 v14;

  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  v5 = -[TSDLayout originalPureGeometry](self, "originalPureGeometry");
  if (v5)
  {
    objc_msgSend(v5, "transform");
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }
  result = -[TSDAbstractLayout parent](self, "parent");
  if (result)
  {
    v7 = result;
    do
    {
      v8 = (void *)-[CGAffineTransform geometry](v7, "geometry");
      if (v8)
      {
        v9 = *(_OWORD *)&retstr->c;
        v11[0] = *(_OWORD *)&retstr->a;
        v11[1] = v9;
        v11[2] = *(_OWORD *)&retstr->tx;
        objc_msgSend(v8, "transformByConcatenatingTransformTo:", v11);
      }
      else
      {
        v13 = 0u;
        v14 = 0u;
        v12 = 0u;
      }
      v10 = v13;
      *(_OWORD *)&retstr->a = v12;
      *(_OWORD *)&retstr->c = v10;
      *(_OWORD *)&retstr->tx = v14;
      result = (CGAffineTransform *)-[CGAffineTransform parent](v7, "parent");
      v7 = result;
    }
    while (result);
  }
  return result;
}

- (BOOL)canFlip
{
  return 0;
}

- (void)validateFromLastInterimPosition
{
  objc_msgSend(-[TSDLayout layoutController](self, "layoutController"), "validateLayoutWithDependencies:", self);
  if (-[TSDInfo owningAttachment](-[TSDLayout info](self, "info"), "owningAttachment"))
    -[TSDAbstractLayout fixTransformFromLastInterimPosition](self, "fixTransformFromLastInterimPosition");
}

- (CGRect)boundsForStandardKnobs
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TSDLayoutGeometry size](-[TSDAbstractLayout geometry](self, "geometry"), "size");
  v2 = TSDRectWithSize();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGPoint)centerForRotation
{
  CGFloat v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  double v6;
  double v7;
  CGPoint result;

  -[TSDLayout boundsForStandardKnobs](self, "boundsForStandardKnobs");
  v6 = TSDCenterOfRect(v2, v3, v4, v5);
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGPoint)centerForConnecting
{
  double v3;
  double v4;
  TSDLayoutGeometry *v5;
  float64x2_t v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  double v10;
  double v11;
  double v12;
  float64x2_t v13;
  float64x2_t v14;
  float64x2_t v15;
  CGPoint result;

  -[TSDLayout centerForRotation](self, "centerForRotation");
  v11 = v4;
  v12 = v3;
  v5 = -[TSDAbstractLayout geometry](self, "geometry");
  if (v5)
  {
    -[TSDLayoutGeometry transform](v5, "transform");
    v6 = v13;
    v7 = v14;
    v8 = v15;
  }
  else
  {
    v8 = 0uLL;
    v6 = 0uLL;
    v7 = 0uLL;
  }
  v9 = vaddq_f64(v8, vmlaq_n_f64(vmulq_n_f64(v7, v11), v6, v12));
  v10 = v9.f64[1];
  result.x = v9.f64[0];
  result.y = v10;
  return result;
}

- (id)computeInfoGeometryDuringResize
{
  return 0;
}

- (id)computeLayoutGeometry
{
  id v3;
  TSDLayoutGeometry *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  TSDLayoutGeometry *v14;
  __int128 *v15;
  TSDLayoutGeometry *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  v3 = -[TSDLayout layoutGeometryFromProvider](self, "layoutGeometryFromProvider");
  objc_opt_class();
  -[TSDAbstractLayout parent](self, "parent");
  if (TSUDynamicCast() && -[TSDLayout layoutState](self, "layoutState") != 4)
  {
    if (-[TSDLayout layoutState](self, "layoutState") == 3)
    {
      v4 = [TSDLayoutGeometry alloc];
      objc_msgSend(-[TSDLayout originalPureGeometry](self, "originalPureGeometry"), "size");
      v6 = v5;
      v8 = v7;
      if (v3)
      {
        objc_msgSend(v3, "transform");
      }
      else
      {
        v22 = 0u;
        v23 = 0u;
        v21 = 0u;
      }
      v15 = &v21;
      v16 = v4;
    }
    else
    {
      objc_msgSend(v3, "size");
      -[TSDLayout scaleForInlineClampingUnrotatedSize:withGeometry:](self, "scaleForInlineClampingUnrotatedSize:withGeometry:", v3);
      v10 = v9;
      objc_msgSend(v3, "size");
      v6 = TSDMultiplySizeScalar(v11, v12, v10);
      v8 = v13;
      v14 = [TSDLayoutGeometry alloc];
      if (v3)
      {
        objc_msgSend(v3, "transform");
      }
      else
      {
        v19 = 0u;
        v20 = 0u;
        v18 = 0u;
      }
      v15 = &v18;
      v16 = v14;
    }
    return -[TSDLayoutGeometry initWithSize:transform:](v16, "initWithSize:transform:", v15, v6, v8, v18, v19, v20, v21, v22, v23);
  }
  return v3;
}

- (double)scaleForInlineClampingUnrotatedSize:(CGSize)a3 withGeometry:(id)a4
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  long double v19;
  float v21;
  float v22;
  _OWORD v24[3];
  CGAffineTransform v25;
  CGRect v26;
  CGRect v27;

  objc_opt_class();
  -[TSDAbstractLayout parent](self, "parent");
  v6 = (void *)TSUDynamicCast();
  v7 = 1.0;
  if (v6)
  {
    objc_msgSend(v6, "maximumFrameSizeForChild:", self);
    v9 = v8;
    v11 = v10;
    v12 = TSDRectWithSize();
    v14 = v13;
    v16 = v15;
    v18 = v17;
    if (a4)
      objc_msgSend(a4, "transform");
    else
      memset(v24, 0, sizeof(v24));
    v19 = TSDTransformAngle((double *)v24);
    CGAffineTransformMakeRotation(&v25, v19 * 0.0174532925);
    v26.origin.x = v12;
    v26.origin.y = v14;
    v26.size.width = v16;
    v26.size.height = v18;
    v27 = CGRectApplyAffineTransform(v26, &v25);
    if (v27.size.width > v9 || v27.size.height > v11)
    {
      v21 = 1.0;
      v22 = 1.0;
      if (v27.size.width > v9)
        v22 = v9 / v27.size.width;
      if (v27.size.height > v11)
        v21 = v11 / v27.size.height;
      return fminf(v22, v21);
    }
  }
  return v7;
}

- (void)processChangedProperty:(int)a3
{
  if (a3 == 513)
  {
    -[TSDLayout invalidatePosition](self, "invalidatePosition");
  }
  else if (a3 == 512)
  {
    -[TSDLayout invalidateFrame](self, "invalidateFrame");
  }
}

- (id)searchTarget
{
  return 0;
}

- (id)additionalDependenciesForChildLayout:(id)a3
{
  return 0;
}

- (id)dependentLayouts
{
  return -[TSDAbstractLayout additionalDependenciesForChildLayout:](-[TSDAbstractLayout parent](self, "parent"), "additionalDependenciesForChildLayout:", self);
}

- (id)reliedOnLayouts
{
  return 0;
}

- (id)additionalLayoutsForRepCreation
{
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "array");
}

- (CGSize)maximumFrameSizeForChild:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 1.79769313e308;
  v4 = 1.79769313e308;
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)orderedBefore:(id)a3
{
  return 0;
}

- (BOOL)shouldDisplayGuides
{
  return 1;
}

- (BOOL)shouldProvideSizingGuides
{
  _OWORD v3[3];

  if (self)
    -[TSDAbstractLayout transform](self, "transform");
  else
    memset(v3, 0, sizeof(v3));
  return TSDIsTransformAxisAlignedWithThreshold((double *)v3, 0.002);
}

- (id)additionalGuides
{
  return 0;
}

- (double)inlineVerticalOffset
{
  return 0.0;
}

- (double)inlineCenteredAlignmentOffset
{
  return 0.0;
}

- (void)setNeedsDisplay
{
  CGSize v2;

  v2 = *(CGSize *)(MEMORY[0x24BDBF028] + 16);
  self->mDirtyRect.origin = (CGPoint)*MEMORY[0x24BDBF028];
  self->mDirtyRect.size = v2;
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  self->mDirtyRect = CGRectUnion(self->mDirtyRect, a3);
}

- (BOOL)attachmentLayoutDisplacedByDropCap
{
  return 1;
}

- (void)i_accumulateLayoutsIntoSet:(id)a3
{
  objc_msgSend(a3, "addObject:", self);
  -[NSArray makeObjectsPerformSelector:withObject:](-[TSDAbstractLayout children](self, "children"), "makeObjectsPerformSelector:withObject:", a2, a3);
}

- (CGRect)i_takeDirtyRect
{
  double x;
  double y;
  double width;
  double height;
  CGSize v6;
  CGRect result;

  x = self->mDirtyRect.origin.x;
  y = self->mDirtyRect.origin.y;
  width = self->mDirtyRect.size.width;
  height = self->mDirtyRect.size.height;
  v6 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
  self->mDirtyRect.origin = (CGPoint)*MEMORY[0x24BDBF070];
  self->mDirtyRect.size = v6;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)i_wrapPath
{
  -[TSDLayoutGeometry size](-[TSDAbstractLayout geometry](self, "geometry"), "size");
  return +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:", TSDRectWithSize());
}

- (void)p_registerWithLayoutController:(id)a3
{
  objc_msgSend(a3, "i_registerLayout:", self);
  -[NSArray makeObjectsPerformSelector:withObject:](-[TSDAbstractLayout children](self, "children"), "makeObjectsPerformSelector:withObject:", a2, a3);
}

- (void)p_unregisterWithLayoutController:(id)a3
{
  objc_msgSend(a3, "i_unregisterLayout:", self);
  -[NSArray makeObjectsPerformSelector:withObject:](-[TSDAbstractLayout children](self, "children"), "makeObjectsPerformSelector:withObject:", a2, a3);
}

- (void)p_recursiveInvalidate
{
  -[TSDLayout invalidate](self, "invalidate");
  -[NSArray makeObjectsPerformSelector:](-[TSDAbstractLayout children](self, "children"), "makeObjectsPerformSelector:", a2);
}

- (void)layoutSearchForAnnotationWithHitBlock:(id)a3
{
  void *v5;
  TSDCanvasSearchReference *v6;

  objc_opt_class();
  -[TSDLayout info](self, "info");
  v5 = (void *)TSUDynamicCast();
  if (objc_msgSend(v5, "comment"))
  {
    v6 = +[TSDCanvasSearchReference searchReferenceWithDrawableInfo:](TSDCanvasSearchReference, "searchReferenceWithDrawableInfo:", v5);
    -[TSDCanvasSearchReference setAnnotation:](v6, "setAnnotation:", objc_msgSend(v5, "comment"));
    -[TSDLayout calculatePointFromSearchReference:](self, "calculatePointFromSearchReference:", v6);
    -[TSDCanvasSearchReference setSearchReferencePoint:](v6, "setSearchReferencePoint:");
    (*((void (**)(id, TSDCanvasSearchReference *))a3 + 2))(a3, v6);
  }
}

- (id)childSearchTargets
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = -[TSDAbstractLayout children](self, "children", 0);
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v11;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v11 != v6)
        objc_enumerationMutation(v2);
      v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
      if (!objc_msgSend((id)objc_msgSend(v8, "info"), "owningAttachment")
        || objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "info"), "owningAttachment"), "isSearchable"))
      {
        if (!v5)
          v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        objc_msgSend(v5, "addObject:", v8);
      }
    }
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v4);
  return v5;
}

- (CGRect)rectForSelection:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[TSDAbstractLayout frame](self, "frame", a3);
  v5 = 0.0;
  v6 = 0.0;
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)rectForPresentingAnnotationPopoverForSelection:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[TSDLayoutGeometry size](-[TSDAbstractLayout geometry](self, "geometry", a3), "size");
  v3 = TSDRectWithSize();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)allowsConnections
{
  return 0;
}

- (void)addConnectedLayout:(id)a3
{
  NSMutableSet *mConnectedLayouts;

  mConnectedLayouts = self->mConnectedLayouts;
  if (!mConnectedLayouts)
  {
    mConnectedLayouts = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    self->mConnectedLayouts = mConnectedLayouts;
  }
  -[NSMutableSet addObject:](mConnectedLayouts, "addObject:", a3);
}

- (void)removeConnectedLayout:(id)a3
{
  -[NSMutableSet removeObject:](self->mConnectedLayouts, "removeObject:", a3);
}

- (void)p_invalidateConnectedLayouts
{
  NSMutableSet *mConnectedLayouts;
  id v4;

  mConnectedLayouts = self->mConnectedLayouts;
  if (mConnectedLayouts)
  {
    if (-[NSMutableSet count](mConnectedLayouts, "count"))
    {
      v4 = (id)-[NSMutableSet copy](self->mConnectedLayouts, "copy");
      objc_msgSend(v4, "makeObjectsPerformSelector:withObject:", sel_connectedLayoutInvalidated_, self);

    }
  }
}

- (TSDLayoutGeometry)originalGeometry
{
  return self->mBaseGeometry;
}

- (int)layoutState
{
  return self->mLayoutState;
}

- (NSSet)connectedLayouts
{
  return &self->mConnectedLayouts->super;
}

- (id)iterativePositioningState
{
  return self->mIterativePositioningState;
}

- (void)setIterativePositioningState:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 256);
}

- (BOOL)hasFinishedIterativePositioning
{
  return self->mHasFinishedIterativePositioning;
}

+ (id)descendentWrappablesOfLayout:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(a3, "children"), "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_msgSend(a3, "children", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        v11 = (void *)TSUProtocolCast();
        if (v11 && !objc_msgSend(v11, "wrapContainerMode"))
        {
          objc_msgSend(v4, "addObjectsFromArray:", objc_msgSend(v10, "descendentWrappables"));
        }
        else if (objc_msgSend(v10, "conformsToProtocol:", &unk_254F77D68))
        {
          objc_msgSend(v4, "addObject:", v10);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  return v4;
}

@end
