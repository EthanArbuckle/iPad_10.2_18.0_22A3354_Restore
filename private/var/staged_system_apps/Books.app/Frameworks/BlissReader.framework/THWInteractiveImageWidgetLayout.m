@implementation THWInteractiveImageWidgetLayout

- (THWInteractiveImageWidgetLayout)initWithInfo:(id)a3
{
  THWInteractiveImageWidgetLayout *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWInteractiveImageWidgetLayout;
  result = -[THWInteractiveImageWidgetLayout initWithInfo:](&v4, "initWithInfo:", a3);
  if (result)
    result->_viewScale = 1.0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWInteractiveImageWidgetLayout;
  -[THWContainerLayout dealloc](&v3, "dealloc");
}

- (double)baseViewScaleForStageSize:(CGSize)a3
{
  double height;
  double width;
  double v5;
  double v6;

  height = a3.height;
  width = a3.width;
  objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "stageGeometry"), "frame");
  return THScaleNeededToFitSizeInSize(v5, v6, width, height);
}

- (double)baseViewScale
{
  double v3;
  double v4;
  double result;

  if (!-[THWInteractiveImageWidgetLayout isExpanded](self, "isExpanded"))
    return 1.0;
  -[THWInteractiveImageWidgetLayout stageFrame](self, "stageFrame");
  -[THWInteractiveImageWidgetLayout baseViewScaleForStageSize:](self, "baseViewScaleForStageSize:", v3, v4);
  return result;
}

- (BOOL)stageVisible
{
  return 1;
}

- (CGSize)zoomableCanvasSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "backgroundSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)infosForStageContentViewport:(CGRect)a3
{
  return +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height), "backgroundImageInfo"));
}

- (void)setViewScale:(double)a3 contentOffset:(CGPoint)a4 animated:(BOOL)a5
{
  double y;
  double x;
  double v9;
  double v10;
  double v12;
  double v13;

  y = a4.y;
  x = a4.x;
  -[THWInteractiveImageWidgetLayout contentOffset](self, "contentOffset", a5);
  if (x == v10 && y == v9)
  {
    -[THWInteractiveImageWidgetLayout viewScale](self, "viewScale");
    if (v13 == a3)
      return;
  }
  else
  {
    -[THWInteractiveImageWidgetLayout setContentOffset:](self, "setContentOffset:", x, y);
    -[THWInteractiveImageWidgetLayout viewScale](self, "viewScale");
    if (v12 == a3)
      goto LABEL_9;
  }
  -[THWInteractiveImageWidgetLayout setViewScale:](self, "setViewScale:", a3);
LABEL_9:
  -[THWInteractiveImageWidgetLayout p_invalidateAllCalloutLayoutFrames](self, "p_invalidateAllCalloutLayoutFrames");
}

- (CGAffineTransform)transformFromContentToContainerCoords
{
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGAffineTransform v12;
  CGAffineTransform v13;

  memset(&v13, 0, sizeof(v13));
  -[THWInteractiveImageWidgetLayout contentOffset](self, "contentOffset");
  v6 = -v5;
  -[THWInteractiveImageWidgetLayout contentOffset](self, "contentOffset");
  CGAffineTransformMakeTranslation(&v13, v6, -v7);
  -[THWInteractiveImageWidgetLayout viewScale](self, "viewScale");
  v9 = v8;
  -[THWInteractiveImageWidgetLayout viewScale](self, "viewScale");
  v12 = v13;
  return CGAffineTransformScale(retstr, &v12, v9, v10);
}

- (TSUColor)primaryColor
{
  TSUColor *result;
  id v4;

  result = self->_primaryColor;
  if (!result)
  {
    v4 = objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "adornmentInfo"), "titleStorage");
    if (v4)
      -[THWInteractiveImageWidgetLayout setPrimaryColor:](self, "setPrimaryColor:", TSWPResolveColorForStyles(objc_msgSend(v4, "characterStyleAtCharIndex:effectiveRange:", 0, 0), objc_msgSend(v4, "paragraphStyleAtCharIndex:effectiveRange:", 0, 0)));
    result = self->_primaryColor;
    if (!result)
    {
      -[THWInteractiveImageWidgetLayout setPrimaryColor:](self, "setPrimaryColor:", +[TSUColor blackColor](TSUColor, "blackColor"));
      return self->_primaryColor;
    }
  }
  return result;
}

- (BOOL)p_showTransportControls
{
  if ((objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "showTransportControls") & 1) != 0)
    return 1;
  else
    return -[THWInteractiveImageWidgetLayout p_captionsInPanel](self, "p_captionsInPanel");
}

- (BOOL)hasContentForPanel:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 == 2 || a3 == 1)
    return 1;
  if (a3)
    return 0;
  return objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info", v3, v4), "adornmentInfo"), "titleStorage") != 0;
}

- (BOOL)isCompactHeight
{
  return objc_msgSend(-[THWInteractiveImageWidgetLayout layoutController](self, "layoutController"), "isCompactHeight");
}

- (id)infosForPanel:(int)a3
{
  id v5;
  id v6;

  v5 = +[NSMutableArray array](NSMutableArray, "array");
  if (a3 == 1)
  {
    if (-[THWInteractiveImageWidgetLayout p_captionsInPanel](self, "p_captionsInPanel")
      && -[THWInteractiveImageWidgetLayout selectedCalloutIndex](self, "selectedCalloutIndex"))
    {
      v6 = objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "calloutAtIndex:", -[THWInteractiveImageWidgetLayout selectedCalloutIndex](self, "selectedCalloutIndex")), "descriptionStorage");
      if (!v6)
        return v5;
      goto LABEL_12;
    }
    if (self->_captionPanelVisible
      && objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "adornmentInfo"), "captionStorage"))
    {
      v6 = objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "adornmentInfo"), "captionStorage");
      goto LABEL_12;
    }
  }
  else if (!a3
         && objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "adornmentInfo"), "titleStorage"))
  {
    v6 = objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "adornmentInfo"), "titleStorage");
LABEL_12:
    objc_msgSend(v5, "addObject:", v6);
  }
  return v5;
}

- (id)additionalLayoutsForPanel:(int)a3
{
  THWInteractiveImageRadioPanelLayout *transportControlLayout;

  if (a3 != 2
    || !self->_transportControlLayout
    || !-[THWInteractiveImageWidgetLayout isExpanded](self, "isExpanded")
    || !-[THWInteractiveImageWidgetLayout p_showTransportControls](self, "p_showTransportControls"))
  {
    return 0;
  }
  transportControlLayout = self->_transportControlLayout;
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &transportControlLayout, 1);
}

- (BOOL)isCombinedPanelVisible
{
  return -[THWInteractiveImageWidgetLayout p_showTransportControls](self, "p_showTransportControls")
      || objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "adornmentInfo"), "captionStorage") != 0;
}

- (id)layoutGeometryFromProvider
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v8;

  if (-[THWInteractiveImageWidgetLayout isExpanded](self, "isExpanded"))
  {
    -[THWWidgetLayoutDelegate widgetLayoutBounds](-[THWInteractiveImageWidgetLayout delegate](self, "delegate"), "widgetLayoutBounds");
    return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v3, v4, v5, v6);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)THWInteractiveImageWidgetLayout;
    return -[THWInteractiveImageWidgetLayout layoutGeometryFromProvider](&v8, "layoutGeometryFromProvider");
  }
}

- (id)computeLayoutGeometry
{
  id v3;
  double v4;
  id v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unsigned int v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGRect *p_sidebarFrame;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)THWInteractiveImageWidgetLayout;
  v3 = -[THWInteractiveImageWidgetLayout computeLayoutGeometry](&v23, "computeLayoutGeometry");
  if (-[THWInteractiveImageWidgetLayout isExpanded](self, "isExpanded"))
  {
    -[THWWidgetLayoutDelegate widgetLayoutBounds](-[THWInteractiveImageWidgetLayout delegate](self, "delegate"), "widgetLayoutBounds");
    -[THWInteractiveImageWidgetLayout setStageFrame:](self, "setStageFrame:");
    v4 = 0.0;
  }
  else
  {
    v5 = objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "stageGeometry");
    objc_msgSend(v5, "frame");
    -[THWInteractiveImageWidgetLayout setStageFrame:](self, "setStageFrame:");
    objc_msgSend(v5, "cornerRadius");
  }
  -[THWInteractiveImageWidgetLayout setStageCornerRadius:](self, "setStageCornerRadius:", v4);
  if (-[THWInteractiveImageWidgetLayout isExpanded](self, "isExpanded")
    && -[THWInteractiveImageWidgetLayout p_showTransportControls](self, "p_showTransportControls"))
  {
    -[THWInteractiveImageWidgetLayout stageFrame](self, "stageFrame");
    -[THWInteractiveImageWidgetLayout setStageFrame:](self, "setStageFrame:");
  }
  -[THWInteractiveImageWidgetLayout stageFrame](self, "stageFrame");
  self->_transportControlsFrame.origin.x = v6;
  self->_transportControlsFrame.origin.y = v7;
  self->_transportControlsFrame.size.width = v8;
  self->_transportControlsFrame.size.height = 44.0;
  if (!-[THWInteractiveImageWidgetLayout isExpanded](self, "isExpanded"))
  {
    -[THWInteractiveImageWidgetLayout stageFrame](self, "stageFrame");
    self->_transportControlsFrame.origin.y = self->_transportControlsFrame.origin.y + v9;
  }
  if (objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "useSidebar"))
  {
    objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "sidebarWidth");
    if (v10 <= 0.0)
    {
      -[THWInteractiveImageWidgetLayout stageFrame](self, "stageFrame");
      v15 = v16 * 0.25;
    }
    else
    {
      objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "sidebarWidth");
      v12 = v11;
      -[THWInteractiveImageWidgetLayout stageFrame](self, "stageFrame");
      if (v12 <= v13)
      {
LABEL_15:
        v17 = -[THWInteractiveImageWidgetLayout isExpanded](self, "isExpanded");
        objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "sidebarWidth");
        v19 = v18;
        -[THWInteractiveImageWidgetLayout stageFrame](self, "stageFrame");
        p_sidebarFrame = &self->_sidebarFrame;
        if (v17)
        {
          p_sidebarFrame->origin = (CGPoint)xmmword_314F40;
        }
        else
        {
          p_sidebarFrame->origin.x = 0.0;
          self->_sidebarFrame.origin.y = 0.0;
        }
        self->_sidebarFrame.size.width = v19;
        self->_sidebarFrame.size.height = v20;
        return v3;
      }
      -[THWInteractiveImageWidgetLayout stageFrame](self, "stageFrame");
      v15 = v14;
    }
    objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "setSidebarWidth:", v15);
    goto LABEL_15;
  }
  return v3;
}

- (void)updateChildrenFromInfo
{
  THWInteractiveImageRadioPanelLayout *v3;
  objc_super v4;

  if (!self->_transportControlLayout
    && -[THWInteractiveImageWidgetLayout p_showTransportControls](self, "p_showTransportControls"))
  {
    v3 = -[THWInteractiveImageRadioPanelLayout initWithInfo:]([THWInteractiveImageRadioPanelLayout alloc], "initWithInfo:", objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "transportControlsInfo"));
    self->_transportControlLayout = v3;
    -[THWInteractiveImageRadioPanelLayout setWidgetLayout:](v3, "setWidgetLayout:", self);
    -[THWInteractiveImageRadioPanelLayout setTag:](self->_transportControlLayout, "setTag:", 3);
    -[THWContainerLayout invalidate](self, "invalidate");
  }
  v4.receiver = self;
  v4.super_class = (Class)THWInteractiveImageWidgetLayout;
  -[THWContainerLayout updateChildrenFromInfo](&v4, "updateChildrenFromInfo");
}

- (void)invalidateSize
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  objc_super v12;
  _BYTE v13[128];

  v12.receiver = self;
  v12.super_class = (Class)THWInteractiveImageWidgetLayout;
  -[THWInteractiveImageWidgetLayout invalidateSize](&v12, "invalidateSize");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = -[THWInteractiveImageWidgetLayout dependentLayouts](self, "dependentLayouts", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "invalidateFrame");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }
}

- (id)childInfosForLayout
{
  if (-[THWInteractiveImageWidgetLayout isExpanded](self, "isExpanded")
    || !objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "adornmentInfo"))
  {
    return 0;
  }
  else
  {
    return objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "adornmentInfo"), "interleavedInfosWithInfos:", 0);
  }
}

- (id)additionalLayouts
{
  id v3;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  if (self->_transportControlLayout && !-[THWInteractiveImageWidgetLayout isExpanded](self, "isExpanded"))
    objc_msgSend(v3, "addObject:", self->_transportControlLayout);
  return v3;
}

- (id)layoutGeometryForLayout:(id)a3
{
  uint64_t v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  id v12;

  v5 = objc_opt_class(THWInteractiveImageRadioPanelLayout);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) != 0)
  {
    v6 = objc_alloc((Class)TSDLayoutGeometry);
    -[THWInteractiveImageWidgetLayout transportControlsFrame](self, "transportControlsFrame");
    v11 = v6;
    return objc_msgSend(v11, "initWithFrame:", v7, v8, v9, v10);
  }
  if (!-[THWInteractiveImageWidgetLayout isExpanded](self, "isExpanded")
    || (v12 = objc_msgSend(a3, "info"),
        v12 != objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "backgroundImageInfo")))
  {
    if (objc_msgSend(a3, "info") != self->_calloutContainer && objc_msgSend(a3, "info") != self->_sidebarContainer)
      return 0;
    v11 = objc_alloc((Class)TSDLayoutGeometry);
    v7 = 0.0;
    v8 = 0.0;
    v9 = 1.0;
    v10 = 1.0;
    return objc_msgSend(v11, "initWithFrame:", v7, v8, v9, v10);
  }
  return objc_msgSend(a3, "layoutGeometryFromInfo");
}

- (unsigned)autosizeFlagsForTextLayout:(id)a3
{
  return 3;
}

- (unsigned)verticalAlignmentForTextLayout:(id)a3
{
  -[THWInteractiveImageWidgetLayout updateChildrenFromInfo](self, "updateChildrenFromInfo", a3);
  return 0;
}

- (CGRect)nonAutosizedFrameForTextLayout:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)autosizedFrameForTextLayout:(id)a3 textSize:(CGSize)a4
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = CGRectZero.origin.x;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)dependentsOfTextLayout:(id)a3
{
  return 0;
}

- (Class)repClassForTextLayout:(id)a3
{
  return 0;
}

- (void)p_invalidateExternal
{
  -[THWInteractiveImageWidgetLayout invalidateFrame](self, "invalidateFrame");
  -[THWInteractiveImageWidgetLayout invalidateChildren](self, "invalidateChildren");
  -[THWInteractiveImageWidgetLayout p_updateCalloutLayouts](self, "p_updateCalloutLayouts");
  -[THWInteractiveImageWidgetLayout p_updateSidebarLayouts](self, "p_updateSidebarLayouts");
}

- (void)setDelegate:(id)a3
{
  if (self->_delegate != a3)
  {
    self->_delegate = (THWWidgetLayoutDelegate *)a3;
    -[THWInteractiveImageWidgetLayout p_invalidateExternal](self, "p_invalidateExternal");
  }
}

- (void)wasAddedToLayoutController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWInteractiveImageWidgetLayout;
  -[THWInteractiveImageWidgetLayout wasAddedToLayoutController:](&v4, "wasAddedToLayoutController:", a3);
  -[THWInteractiveImageWidgetLayout p_invalidateExternal](self, "p_invalidateExternal");
}

- (BOOL)isExpanded
{
  THWWidgetLayoutDelegate *v3;

  v3 = -[THWInteractiveImageWidgetLayout delegate](self, "delegate");
  if (v3)
    LOBYTE(v3) = -[THWWidgetLayoutDelegate widgetLayoutMode:](-[THWInteractiveImageWidgetLayout delegate](self, "delegate"), "widgetLayoutMode:", self) == 1;
  return (char)v3;
}

- (BOOL)isCompactFlowPresentation
{
  return -[THWWidgetLayoutDelegate widgetLayoutIsCompactFlow:](-[THWInteractiveImageWidgetLayout delegate](self, "delegate"), "widgetLayoutIsCompactFlow:", self);
}

- (BOOL)isReflowablePresentation
{
  return -[THWWidgetLayoutDelegate widgetLayoutIsReflowablePresentation:](-[THWInteractiveImageWidgetLayout delegate](self, "delegate"), "widgetLayoutIsReflowablePresentation:", self);
}

- (id)p_allScrollContainerLayouts
{
  id v3;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  -[TSDRootLayout addLayoutsToArray:](-[THWInteractiveImageWidgetLayout scrollContainerRootLayout](self, "scrollContainerRootLayout"), "addLayoutsToArray:", v3);
  return v3;
}

- (void)p_invalidateAllCalloutLayoutFrames
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = -[THWInteractiveImageWidgetLayout calloutLayouts](self, "calloutLayouts", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "invalidateFrame");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }
}

- (CGRect)calloutFrameWithViewScale:(double)a3
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  CGRect v26;
  CGRect v27;
  CGRect result;
  CGRect v29;

  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = -[THWInteractiveImageWidgetLayout calloutLayouts](self, "calloutLayouts", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v12), "groupFrameWithViewScale:", a3);
        v29.origin.x = v13;
        v29.origin.y = v14;
        v29.size.width = v15;
        v29.size.height = v16;
        v26.origin.x = x;
        v26.origin.y = y;
        v26.size.width = width;
        v26.size.height = height;
        v27 = CGRectUnion(v26, v29);
        x = v27.origin.x;
        y = v27.origin.y;
        width = v27.size.width;
        height = v27.size.height;
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }
  v17 = x;
  v18 = y;
  v19 = width;
  v20 = height;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)p_captionsInPanel
{
  unsigned int v3;

  v3 = -[THWInteractiveImageWidgetLayout isExpanded](self, "isExpanded");
  if (v3)
  {
    if ((objc_msgSend(-[THWInteractiveImageWidgetLayout layoutController](self, "layoutController"), "isCompactWidth") & 1) != 0)LOBYTE(v3) = 1;
    else
      LOBYTE(v3) = objc_msgSend(-[THWInteractiveImageWidgetLayout layoutController](self, "layoutController"), "isCompactHeight");
  }
  return v3;
}

- (BOOL)p_useTitleOnlyForCallout
{
  if ((objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "useSidebar") & 1) != 0)
    return 1;
  else
    return -[THWInteractiveImageWidgetLayout p_captionsInPanel](self, "p_captionsInPanel");
}

- (void)p_updateCalloutLayouts
{
  _BOOL8 v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  THWInteractiveImageCalloutLayout *v12;
  THWInteractiveImageCalloutLayout *v13;
  id v14;
  THWControlContainer *calloutContainer;
  THWControlContainer *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = -[THWInteractiveImageWidgetLayout p_useTitleOnlyForCallout](self, "p_useTitleOnlyForCallout");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info", 0), "calloutEnumerator");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v18;
    while (1)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "shouldDraw"))
        {
          if (!v7)
            v7 = (void *)objc_opt_new(TSURetainedPointerKeyDictionary, v11);
          v12 = (THWInteractiveImageCalloutLayout *)-[TSURetainedPointerKeyDictionary objectForKeyedSubscript:](self->_calloutLayoutsMap, "objectForKeyedSubscript:", v10);
          if (v12)
          {
            v13 = v12;
            -[THWInteractiveImageCalloutLayout setTitleOnly:](v12, "setTitleOnly:", v3);
          }
          else
          {
            v13 = -[THWInteractiveImageCalloutLayout initWithInfo:]([THWInteractiveImageCalloutLayout alloc], "initWithInfo:", 0);
            -[THWInteractiveImageCalloutLayout setCalloutInfo:](v13, "setCalloutInfo:", v10);
            -[THWInteractiveImageCalloutLayout setDelegate:](v13, "setDelegate:", self);
            -[THWInteractiveImageCalloutLayout setTitleOnly:](v13, "setTitleOnly:", v3);
            if (!v13)
              continue;
          }
          objc_msgSend(v7, "setObject:forUncopiedKey:", v13, v10);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (!v6)
      {
        if (v7)
        {

          self->_calloutLayoutsMap = (TSURetainedPointerKeyDictionary *)v7;
        }
        break;
      }
    }
  }
  v14 = -[TSURetainedPointerKeyDictionary count](self->_calloutLayoutsMap, "count");
  calloutContainer = self->_calloutContainer;
  if (v14)
  {
    if (calloutContainer)
      return;
    v16 = -[THWControlContainer initWithDelegate:]([THWControlContainer alloc], "initWithDelegate:", self);
  }
  else
  {
    if (!calloutContainer)
      return;

    v16 = 0;
  }
  self->_calloutContainer = v16;
}

- (void)p_updateSidebarLayouts
{
  THWControlContainer *sidebarContainer;
  THWInteractiveImageSidebarLayout *sidebarLayout;

  if (objc_msgSend(-[THWInteractiveImageWidgetLayout info](self, "info"), "useSidebar")
    && !-[THWInteractiveImageWidgetLayout p_captionsInPanel](self, "p_captionsInPanel"))
  {
    if (!self->_sidebarContainer)
      self->_sidebarContainer = -[THWControlContainer initWithDelegate:]([THWControlContainer alloc], "initWithDelegate:", self);
    if (!self->_sidebarLayout)
      self->_sidebarLayout = -[THWInteractiveImageSidebarLayout initWithDelegate:]([THWInteractiveImageSidebarLayout alloc], "initWithDelegate:", self);
  }
  else
  {
    sidebarContainer = self->_sidebarContainer;
    if (sidebarContainer)
    {

      self->_sidebarContainer = 0;
    }
    sidebarLayout = self->_sidebarLayout;
    if (sidebarLayout)
    {

      self->_sidebarLayout = 0;
    }
  }
}

- (id)calloutLayouts
{
  return -[TSURetainedPointerKeyDictionary allValues](self->_calloutLayoutsMap, "allValues");
}

- (id)infosForContainer
{
  THWControlContainer *sidebarContainer;
  THWControlContainer *calloutContainer;
  THWControlContainer **v4;
  uint64_t v5;
  THWControlContainer *v7;
  THWControlContainer *v8;
  THWControlContainer *v9;

  sidebarContainer = self->_sidebarContainer;
  calloutContainer = self->_calloutContainer;
  if (sidebarContainer)
  {
    if (calloutContainer)
    {
      v8 = self->_calloutContainer;
      v9 = sidebarContainer;
      v4 = &v8;
      v5 = 2;
      return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, v5, v7, v8, v9);
    }
  }
  else if (calloutContainer)
  {
    v7 = self->_calloutContainer;
    v4 = &v7;
    v5 = 1;
    return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, v5, v7, v8, v9);
  }
  return 0;
}

- (void)updateSelectedCallout:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = -[THWInteractiveImageWidgetLayout calloutLayouts](self, "calloutLayouts", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "setSelected:", objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "calloutInfo") == a3);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (void)invalidateForSizeChange
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  -[THWInteractiveImageWidgetLayout p_updateCalloutLayouts](self, "p_updateCalloutLayouts");
  -[THWInteractiveImageWidgetLayout p_updateSidebarLayouts](self, "p_updateSidebarLayouts");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = -[THWInteractiveImageWidgetLayout calloutLayouts](self, "calloutLayouts", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7), "invalidateTitleStyle");
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }
}

- (id)controlContainerAdditionalChildLayouts:(id)a3
{
  THWInteractiveImageSidebarLayout *sidebarLayout;

  if (objc_msgSend(a3, "info") == self->_calloutContainer)
    return -[THWInteractiveImageWidgetLayout calloutLayouts](self, "calloutLayouts");
  if (objc_msgSend(a3, "info") != self->_sidebarContainer || !self->_sidebarLayout)
    return 0;
  sidebarLayout = self->_sidebarLayout;
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &sidebarLayout, 1);
}

- (CGPoint)interactiveImageCallout:(id)a3 convertContentPointToUnscaledOverlayPoint:(CGPoint)a4
{
  double v4;
  double v5;
  CGPoint result;

  -[THWOverlayableZoomableCanvasController unscaledContainerPointFromUnscaledContentPoint:](self->_stageCanvasController, "unscaledContainerPointFromUnscaledContentPoint:", a3, a4.x, a4.y);
  result.y = v5;
  result.x = v4;
  return result;
}

- (double)interactiveImageCalloutFontScale:(id)a3
{
  unsigned int v3;
  double result;

  v3 = -[THWInteractiveImageWidgetLayout p_captionsInPanel](self, "p_captionsInPanel", a3);
  result = 0.8;
  if (!v3)
    return 1.0;
  return result;
}

- (CGSize)interactiveImageSidebarSize:(id)a3
{
  double width;
  double height;
  CGSize result;

  width = self->_sidebarFrame.size.width;
  height = self->_sidebarFrame.size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)stageCornerRadius
{
  return self->mStageCornerRadius;
}

- (void)setStageCornerRadius:(double)a3
{
  self->mStageCornerRadius = a3;
}

- (CGRect)stageFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mStageFrame.origin.x;
  y = self->mStageFrame.origin.y;
  width = self->mStageFrame.size.width;
  height = self->mStageFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setStageFrame:(CGRect)a3
{
  self->mStageFrame = a3;
}

- (THWWidgetLayoutDelegate)delegate
{
  return self->_delegate;
}

- (THWInteractiveImageSidebarLayout)sidebarLayout
{
  return self->_sidebarLayout;
}

- (void)setPrimaryColor:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 352);
}

- (CGPoint)contentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_contentOffset.x;
  y = self->_contentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  self->_contentOffset = a3;
}

- (double)viewScale
{
  return self->_viewScale;
}

- (void)setViewScale:(double)a3
{
  self->_viewScale = a3;
}

- (CGRect)sidebarFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sidebarFrame.origin.x;
  y = self->_sidebarFrame.origin.y;
  width = self->_sidebarFrame.size.width;
  height = self->_sidebarFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSidebarFrame:(CGRect)a3
{
  self->_sidebarFrame = a3;
}

- (unint64_t)selectedCalloutIndex
{
  return self->_selectedCalloutIndex;
}

- (void)setSelectedCalloutIndex:(unint64_t)a3
{
  self->_selectedCalloutIndex = a3;
}

- (TSDRootLayout)scrollContainerRootLayout
{
  return self->_scrollContainerRootLayout;
}

- (void)setScrollContainerRootLayout:(id)a3
{
  self->_scrollContainerRootLayout = (TSDRootLayout *)a3;
}

- (BOOL)captionPanelVisible
{
  return self->_captionPanelVisible;
}

- (void)setCaptionPanelVisible:(BOOL)a3
{
  self->_captionPanelVisible = a3;
}

- (THWOverlayableZoomableCanvasController)stageCanvasController
{
  return self->_stageCanvasController;
}

- (void)setStageCanvasController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 384);
}

- (THWInteractiveImageRadioPanelLayout)transportControlLayout
{
  return self->_transportControlLayout;
}

- (void)setTransportControlLayout:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 392);
}

- (CGRect)transportControlsFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_transportControlsFrame.origin.x;
  y = self->_transportControlsFrame.origin.y;
  width = self->_transportControlsFrame.size.width;
  height = self->_transportControlsFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setTransportControlsFrame:(CGRect)a3
{
  self->_transportControlsFrame = a3;
}

- (TSURetainedPointerKeyDictionary)calloutLayoutsMap
{
  return self->_calloutLayoutsMap;
}

- (void)setCalloutLayoutsMap:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 400);
}

- (THWControlContainer)calloutContainer
{
  return self->_calloutContainer;
}

- (void)setCalloutContainer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 408);
}

- (THWControlContainer)sidebarContainer
{
  return self->_sidebarContainer;
}

- (void)setSidebarContainer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 416);
}

@end
