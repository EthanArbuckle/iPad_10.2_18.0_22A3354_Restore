@implementation THWAnchoredWidgetLayout

- (THWAnchoredWidgetLayout)initWithInfo:(id)a3
{
  THWAnchoredWidgetLayout *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWAnchoredWidgetLayout;
  v3 = -[THWAnchoredWidgetLayout initWithInfo:](&v5, "initWithInfo:", a3);
  if (v3)
    v3->_stackInfo = -[THWStackedControlContainer initWithDelegate:]([THWStackedControlContainer alloc], "initWithDelegate:", v3);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[THWWidgetLayout setDelegate:](self->_widgetLayout, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THWAnchoredWidgetLayout;
  -[THWContainerLayout dealloc](&v3, "dealloc");
}

- (double)_adjustedContentPadding
{
  double v2;

  objc_msgSend(objc_msgSend(objc_msgSend(-[THWAnchoredWidgetLayout info](self, "info"), "widgetInfo"), "adornmentInfo"), "contentPadding");
  return fmin(v2, 10.0);
}

- (void)_computeInsets
{
  double v3;
  double v4;
  unsigned int v5;
  char *v6;
  BOOL v7;
  unsigned int v8;
  double v9;
  CGFloat v10;

  -[THWAnchoredWidgetLayout _adjustedContentPadding](self, "_adjustedContentPadding");
  v4 = v3;
  v5 = objc_msgSend(-[THWAnchoredWidgetLayout layoutController](self, "layoutController"), "isCompactHeight");
  v6 = (char *)objc_msgSend(objc_msgSend((id)TSUProtocolCast(&OBJC_PROTOCOL___TSWPLayoutTarget, -[THWAnchoredWidgetLayout parent](self, "parent")), "columnMetricsForCharIndex:outRange:", 0, 0), "columnCount");
  v7 = v6 == (_BYTE *)&dword_0 + 1;
  v8 = v6 != (_BYTE *)&dword_0 + 1;
  if (v7 && (v5 & 1) == 0)
    v8 = objc_msgSend(-[THWAnchoredWidgetLayout layoutController](self, "layoutController"), "isCompactWidth");
  v9 = 75.0;
  if (!v5)
    v9 = 30.0;
  if (v8)
    v9 = 10.0;
  v10 = v4 + v9;
  self->_widgetInsets.top = v4;
  self->_widgetInsets.left = v10;
  self->_widgetInsets.bottom = v4;
  self->_widgetInsets.right = v10;
}

- (void)wasAddedToLayoutController:(id)a3
{
  -[THWAnchoredWidgetLayout setStackHost:](self, "setStackHost:", objc_msgSend(a3, "ancestorLayoutOfLayout:orDelegateConformingToProtocol:", self, &OBJC_PROTOCOL___THWWidgetStackHosting));
  -[THWAnchoredWidgetLayout _computeInsets](self, "_computeInsets");
}

- (void)willBeRemovedFromLayoutController:(id)a3
{
  -[THWAnchoredWidgetLayout setStackHost:](self, "setStackHost:", 0);
}

- (id)childrenForLayout
{
  id v3;
  THWStackedControlContainer *stackInfo;
  THWStackedControlContainer **v5;
  uint64_t v6;
  THWStackedControlContainer *v8;
  id v9;
  THWStackedControlContainer *v10;

  v3 = objc_msgSend(objc_msgSend(objc_msgSend(-[THWAnchoredWidgetLayout info](self, "info"), "widgetInfo"), "adornmentInfo"), "background");
  if (v3)
  {
    stackInfo = self->_stackInfo;
    v9 = v3;
    v10 = stackInfo;
    v5 = (THWStackedControlContainer **)&v9;
    v6 = 2;
  }
  else
  {
    v8 = self->_stackInfo;
    v5 = &v8;
    v6 = 1;
  }
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, v6, v8, v9, v10);
}

- (void)updateChildrenFromInfo
{
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWAnchoredWidgetLayout;
  -[THWContainerLayout updateChildrenFromInfo](&v5, "updateChildrenFromInfo");
  v3 = objc_msgSend(-[THWAnchoredWidgetLayout layoutController](self, "layoutController"), "layoutForInfo:childOfLayout:", objc_msgSend(-[THWAnchoredWidgetLayout info](self, "info"), "widgetInfo"), -[THWAnchoredWidgetLayout _stackLayout](self, "_stackLayout"));
  v4 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___THWWidgetLayout, v3);
  objc_msgSend(v4, "setDelegate:", self);
  -[THWAnchoredWidgetLayout setWidgetLayout:](self, "setWidgetLayout:", v4);
  -[THWAnchoredWidgetLayout setWidgetStackLayout:](self, "setWidgetStackLayout:", TSUProtocolCast(&OBJC_PROTOCOL___THWWidgetStackLayout, v3));
}

- (void)setWidgetStackLayout:(id)a3
{
  THWWidgetStackLayout *widgetStackLayout;

  widgetStackLayout = self->_widgetStackLayout;
  if (widgetStackLayout != a3)
  {

    self->_widgetStackLayout = (THWWidgetStackLayout *)a3;
    objc_msgSend(-[THWAnchoredWidgetLayout _stackLayout](self, "_stackLayout"), "invalidateChildren");
  }
}

- (id)computeLayoutGeometry
{
  id v3;

  objc_msgSend(objc_msgSend(-[THWAnchoredWidgetLayout _stackLayout](self, "_stackLayout"), "geometry"), "size");
  -[THWAnchoredWidgetLayout _containerSizeClampWidth:](self, "_containerSizeClampWidth:", 0);
  v3 = objc_alloc((Class)TSDLayoutGeometry);
  return objc_msgSend(v3, "initWithFrame:", TSDRectWithSize(v3));
}

- (id)_stackLayout
{
  uint64_t v3;
  id result;

  v3 = objc_opt_class(THWStackedControlContainerLayout, a2);
  TSUDynamicCast(v3, objc_msgSend(-[THWAnchoredWidgetLayout layoutController](self, "layoutController"), "layoutForInfo:childOfLayout:", self->_stackInfo, self));
  return result;
}

- (CGSize)_containerSize
{
  double v2;
  double v3;
  CGSize result;

  -[THWAnchoredWidgetLayout _containerSizeClampWidth:](self, "_containerSizeClampWidth:", 1);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)_containerSizeClampWidth:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  THWWidgetStackHosting *stackHost;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  v3 = a3;
  v5 = objc_opt_class(TSDLayout, a2);
  *(_QWORD *)&v7 = TSUDynamicCast(v5, -[THWAnchoredWidgetLayout parent](self, "parent")).n128_u64[0];
  if (v6)
  {
    objc_msgSend(v6, "maximumFrameSizeForChild:", self, v7);
    v9 = v8;
    v11 = v10;
    if (!v3)
      goto LABEL_4;
    goto LABEL_3;
  }
  v11 = 400.0;
  v9 = 300.0;
  if (v3)
  {
LABEL_3:
    objc_msgSend(objc_msgSend(objc_msgSend(-[THWAnchoredWidgetLayout info](self, "info"), "widgetInfo"), "geometry"), "size");
    v9 = fmin(v9, fmax(v12, 100.0) + self->_widgetInsets.left + self->_widgetInsets.right);
  }
LABEL_4:
  stackHost = self->_stackHost;
  if (stackHost)
  {
    -[THWWidgetStackHosting widgetStackMaxContainerSizeForSize:](stackHost, "widgetStackMaxContainerSizeForSize:", v9, v11);
    v9 = v14;
    v11 = v15;
  }
  v16 = v9;
  v17 = v11;
  result.height = v17;
  result.width = v16;
  return result;
}

- (id)additionalDependenciesForChildLayout:(id)a3
{
  THWAnchoredWidgetLayout *v5;

  if (-[THWAnchoredWidgetLayout _stackLayout](self, "_stackLayout") != a3)
    return 0;
  v5 = self;
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1);
}

- (id)dependentLayouts
{
  id v3;
  id v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THWAnchoredWidgetLayout;
  v3 = objc_msgSend(-[THWAnchoredWidgetLayout dependentLayouts](&v7, "dependentLayouts"), "mutableCopy");
  if (!v3)
    v3 = +[NSMutableArray array](NSMutableArray, "array");
  v4 = objc_msgSend(objc_msgSend(objc_msgSend(-[THWAnchoredWidgetLayout info](self, "info"), "widgetInfo"), "adornmentInfo"), "background");
  if (v4)
  {
    v5 = objc_msgSend(-[THWAnchoredWidgetLayout layoutController](self, "layoutController"), "layoutForInfo:childOfLayout:", v4, self);
    if (v5)
      objc_msgSend(v3, "addObject:", v5);
  }
  return v3;
}

- (id)layoutGeometryForLayout:(id)a3
{
  id v4;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;

  v4 = objc_msgSend(a3, "info");
  if (v4 != objc_msgSend(objc_msgSend(objc_msgSend(-[THWAnchoredWidgetLayout info](self, "info"), "widgetInfo"), "adornmentInfo"), "background"))return 0;
  objc_msgSend(objc_msgSend(-[THWAnchoredWidgetLayout _stackLayout](self, "_stackLayout"), "geometry"), "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[THWAnchoredWidgetLayout _adjustedContentPadding](self, "_adjustedContentPadding");
  v15 = self->_widgetInsets.left - v14;
  return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v7 + v15, v9 + 0.0, v11 - (v15 + self->_widgetInsets.right - v14), v13);
}

- (double)widgetStackWidth
{
  double v3;

  -[THWAnchoredWidgetLayout _containerSize](self, "_containerSize");
  return v3 - self->_widgetInsets.left - self->_widgetInsets.right;
}

- (void)widgetStackInvalidateChildren
{
  objc_msgSend(-[THWAnchoredWidgetLayout _stackLayout](self, "_stackLayout"), "invalidateChildren");
}

- (id)controlContainerChildrenForLayout:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = +[NSMutableArray array](NSMutableArray, "array", a3);
  if ((objc_opt_respondsToSelector(self->_widgetStackLayout, "widgetStackTitleChildren:") & 1) != 0)
  {
    v5 = -[THWWidgetStackLayout widgetStackTitleChildren:](self->_widgetStackLayout, "widgetStackTitleChildren:", self);
  }
  else
  {
    v5 = objc_msgSend(objc_msgSend(objc_msgSend(-[THWAnchoredWidgetLayout info](self, "info"), "widgetInfo"), "adornmentInfo"), "topPanelInfos");
    if (!objc_msgSend(v5, "count"))
      goto LABEL_5;
  }
  objc_msgSend(v4, "addObjectsFromArray:", v5);
LABEL_5:
  if (objc_msgSend(-[THWAnchoredWidgetLayout info](self, "info"), "widgetInfo"))
    objc_msgSend(v4, "addObject:", objc_msgSend(-[THWAnchoredWidgetLayout info](self, "info"), "widgetInfo"));
  if ((objc_opt_respondsToSelector(self->_widgetStackLayout, "widgetStackCaptionChildren:") & 1) != 0)
  {
    v6 = -[THWWidgetStackLayout widgetStackCaptionChildren:](self->_widgetStackLayout, "widgetStackCaptionChildren:", self);
LABEL_10:
    objc_msgSend(v4, "addObjectsFromArray:", v6);
    return v4;
  }
  v6 = objc_msgSend(objc_msgSend(objc_msgSend(-[THWAnchoredWidgetLayout info](self, "info"), "widgetInfo"), "adornmentInfo"), "bottomPanelInfos");
  if (objc_msgSend(v6, "count"))
    goto LABEL_10;
  return v4;
}

- (CGPoint)stackedControlContainerOrigin:(id)a3
{
  double v4;
  double v5;
  id v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  -[THWAnchoredWidgetLayout _containerSizeClampWidth:](self, "_containerSizeClampWidth:", 0);
  v5 = v4;
  v6 = -[THWAnchoredWidgetLayout _containerSizeClampWidth:](self, "_containerSizeClampWidth:", 1);
  TSURound(v6, (v5 - v7) * 0.5);
  v9 = 0.0;
  result.y = v9;
  result.x = v8;
  return result;
}

- (UIEdgeInsets)stackedControlContainerInsets:(id)a3
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_widgetInsets.top;
  left = self->_widgetInsets.left;
  bottom = self->_widgetInsets.bottom;
  right = self->_widgetInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)stackedControlContainer:(id)a3 verticalPaddingAfter:(id)a4
{
  unsigned int v4;
  double result;

  v4 = objc_msgSend(-[THWAnchoredWidgetLayout layoutController](self, "layoutController", a3, a4), "isCompactHeight");
  result = 10.0;
  if (v4)
    return 5.0;
  return result;
}

- (double)stackedControlContainer:(id)a3 verticalPaddingBefore:(id)a4
{
  return 0.0;
}

- (double)stackedControlContainer:(id)a3 verticalSpacingAfter:(id)a4
{
  return 0.0;
}

- (double)stackedControlContainer:(id)a3 verticalSpacingBefore:(id)a4
{
  return 0.0;
}

- (id)stackedControlContainer:(id)a3 layoutGeometryForLayout:(id)a4
{
  if ((objc_opt_respondsToSelector(self->_widgetStackLayout, "widgetStack:layoutGeometryForLayout:", a3) & 1) != 0)
    return -[THWWidgetStackLayout widgetStack:layoutGeometryForLayout:](self->_widgetStackLayout, "widgetStack:layoutGeometryForLayout:", self, a4);
  else
    return 0;
}

- (unsigned)stackedControlContainer:(id)a3 alignmentForLayout:(id)a4
{
  return 2;
}

- (id)stackedControlContainer:(id)a3 styleProviderForLayout:(id)a4
{
  THWAnchoredWidgetWPStyleProvider *v5;

  v5 = -[THWAnchoredWidgetWPStyleProvider initWithStorage:]([THWAnchoredWidgetWPStyleProvider alloc], "initWithStorage:", objc_msgSend(a4, "info"));
  -[THWAnchoredWidgetWPStyleProvider setFilterDelegate:](v5, "setFilterDelegate:", objc_msgSend(-[THWAnchoredWidgetLayout layoutController](self, "layoutController"), "ancestorLayoutOfLayout:orDelegateConformingToProtocol:", self, &OBJC_PROTOCOL___THWPCoreTextPropertiesFilterDelegate));
  return v5;
}

- (id)stackedControlContainer:(id)a3 styleProviderForStorage:(id)a4
{
  THWAnchoredWidgetWPStyleProvider *v5;

  v5 = -[THWAnchoredWidgetWPStyleProvider initWithStorage:]([THWAnchoredWidgetWPStyleProvider alloc], "initWithStorage:", a4);
  -[THWAnchoredWidgetWPStyleProvider setFilterDelegate:](v5, "setFilterDelegate:", objc_msgSend(-[THWAnchoredWidgetLayout layoutController](self, "layoutController"), "ancestorLayoutOfLayout:orDelegateConformingToProtocol:", self, &OBJC_PROTOCOL___THWPCoreTextPropertiesFilterDelegate));
  return v5;
}

- (BOOL)stackedControlContainer:(id)a3 isHeightFlexibleForLayout:(id)a4
{
  id v5;

  v5 = objc_msgSend(a4, "info", a3);
  return v5 == objc_msgSend(-[THWAnchoredWidgetLayout info](self, "info"), "widgetInfo");
}

- (double)stackedControlContainer:(id)a3 heightForFlexibleLayout:(id)a4 withTotalFixedHeight:(double)a5
{
  double v7;
  double v8;
  double left;
  double right;
  double v11;
  double v12;
  double result;

  TSDRectWithSize(-[THWAnchoredWidgetLayout _containerSize](self, "_containerSize", a3, a4));
  v8 = v7;
  left = self->_widgetInsets.left;
  right = self->_widgetInsets.right;
  v12 = v11 - (self->_widgetInsets.top + self->_widgetInsets.bottom) - a5;
  if ((objc_opt_respondsToSelector(self->_widgetStackLayout, "widgetStack:idealHeightForMaxSize:") & 1) == 0)
    return fmax(v12, 100.0);
  -[THWWidgetStackLayout widgetStack:idealHeightForMaxSize:](self->_widgetStackLayout, "widgetStack:idealHeightForMaxSize:", self, v8 - (left + right), v12);
  return result;
}

- (BOOL)stackedControlContainer:(id)a3 allowsLastLineTruncationForLayout:(id)a4
{
  return 1;
}

- (unsigned)stackedControlContainer:(id)a3 maxLineCountForLayout:(id)a4
{
  uint64_t v6;

  v6 = 1;
  if ((objc_msgSend(-[THWAnchoredWidgetLayout layoutController](self, "layoutController", a3), "isCompactWidth") & 1) == 0)
  {
    if (objc_msgSend(-[THWAnchoredWidgetLayout layoutController](self, "layoutController"), "isCompactHeight"))v6 = 1;
    else
      v6 = 2;
  }
  if ((objc_opt_respondsToSelector(self->_widgetStackLayout, "widgetStack:maxLinesForWPLayout:withDefault:") & 1) != 0)
    return -[THWWidgetStackLayout widgetStack:maxLinesForWPLayout:withDefault:](self->_widgetStackLayout, "widgetStack:maxLinesForWPLayout:withDefault:", self, a4, v6);
  else
    return v6;
}

- (double)stackedControlContainer:(id)a3 minHeightForChildLayout:(id)a4
{
  double v7;
  double v8;
  double result;

  objc_msgSend(a4, "frame");
  v8 = v7;
  if ((objc_opt_respondsToSelector(self->_widgetStackLayout, "widgetStack:stackedControlContainer:minHeightForLayout:") & 1) == 0)
    return v8;
  -[THWWidgetStackLayout widgetStack:stackedControlContainer:minHeightForLayout:](self->_widgetStackLayout, "widgetStack:stackedControlContainer:minHeightForLayout:", self, a3, a4);
  return result;
}

- (int)widgetLayoutMode:(id)a3
{
  return 3;
}

- (BOOL)widgetLayoutIsCompactFlow:(id)a3
{
  return 1;
}

- (BOOL)widgetLayoutIsReflowablePresentation:(id)a3
{
  return 0;
}

- (CGRect)widgetLayoutBounds
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

- (THWWidgetLayout)widgetLayout
{
  return self->_widgetLayout;
}

- (void)setWidgetLayout:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 280);
}

- (THWStackedControlContainer)stackInfo
{
  return self->_stackInfo;
}

- (void)setStackInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 288);
}

- (THWWidgetStackLayout)widgetStackLayout
{
  return self->_widgetStackLayout;
}

- (UIEdgeInsets)widgetInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_widgetInsets.top;
  left = self->_widgetInsets.left;
  bottom = self->_widgetInsets.bottom;
  right = self->_widgetInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setWidgetInsets:(UIEdgeInsets)a3
{
  self->_widgetInsets = a3;
}

- (THWWidgetStackHosting)stackHost
{
  return self->_stackHost;
}

- (void)setStackHost:(id)a3
{
  self->_stackHost = (THWWidgetStackHosting *)a3;
}

@end
