@implementation THWInteractiveImageCalloutLayout

- (THWInteractiveImageCalloutLayout)initWithInfo:(id)a3
{
  THWInteractiveImageCalloutLayout *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWInteractiveImageCalloutLayout;
  v3 = -[THWInteractiveImageCalloutLayout initWithInfo:](&v5, "initWithInfo:", a3);
  if (v3)
    v3->_stackedControlContainer = -[THWStackedControlContainer initWithDelegate:]([THWStackedControlContainer alloc], "initWithDelegate:", v3);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWInteractiveImageCalloutLayout;
  -[THWContainerLayout dealloc](&v3, "dealloc");
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class(THWInteractiveImageCalloutRep, a2);
}

- (id)childInfosForLayout
{
  THWStackedControlContainer *stackedControlContainer;

  stackedControlContainer = self->_stackedControlContainer;
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &stackedControlContainer, 1);
}

- (id)additionalDependenciesForChildLayout:(id)a3
{
  THWInteractiveImageCalloutLayout *v4;

  v4 = self;
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v4, 1);
}

- (id)sccLayout
{
  uint64_t v3;
  id result;

  v3 = objc_opt_class(THWStackedControlContainerLayout);
  TSUDynamicCast(v3, objc_msgSend(-[THWInteractiveImageCalloutLayout children](self, "children"), "firstObject"));
  return result;
}

- (id)computeLayoutGeometry
{
  id v3;
  THWInteractiveImageCalloutLayoutDelegate *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  id v18;
  double v19;

  v3 = -[THWInteractiveImageCalloutLayout sccLayout](self, "sccLayout");
  -[THWInteractiveImageCalloutLayout p_scaledInsets](self, "p_scaledInsets");
  objc_msgSend(objc_msgSend(objc_msgSend(-[THWInteractiveImageCalloutLayout layoutController](self, "layoutController"), "layoutForInfo:childOfLayout:", -[THWInteractiveImageCalloutInfo titleStorage](self->_calloutInfo, "titleStorage"), v3), "geometry"), "size");
  -[THWInteractiveImageCalloutLayout p_scaledWidth](self, "p_scaledWidth");
  v4 = -[THWInteractiveImageCalloutLayout delegate](self, "delegate");
  -[THWInteractiveImageCalloutInfo placardFixedPoint](self->_calloutInfo, "placardFixedPoint");
  -[THWInteractiveImageCalloutLayoutDelegate interactiveImageCallout:convertContentPointToUnscaledOverlayPoint:](v4, "interactiveImageCallout:convertContentPointToUnscaledOverlayPoint:", self);
  v6 = TSDRectWithCenterAndSize(v5);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = TSDRectWithSize(v13);
  self->_backgroundRectTitleOnly.origin.x = v14;
  self->_backgroundRectTitleOnly.origin.y = v15;
  self->_backgroundRectTitleOnly.size.width = v16;
  self->_backgroundRectTitleOnly.size.height = v17;
  if (self->_selected)
  {
    v18 = objc_msgSend(objc_msgSend(v3, "geometry"), "size");
    v12 = v19;
    v14 = TSDRectWithSize(v18);
  }
  self->_backgroundRect.origin.x = v14;
  self->_backgroundRect.origin.y = v15;
  self->_backgroundRect.size.width = v16;
  self->_backgroundRect.size.height = v17;
  return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v6, v8, v10, v12);
}

- (BOOL)hasTitle
{
  return -[TSWPStorage length](-[THWInteractiveImageCalloutInfo titleStorage](self->_calloutInfo, "titleStorage"), "length") != 0;
}

- (BOOL)hasDescription
{
  return -[TSWPStorage length](-[THWInteractiveImageCalloutInfo descriptionStorage](self->_calloutInfo, "descriptionStorage"), "length") != 0;
}

- (void)setSelected:(BOOL)a3
{
  if (self->_selected != a3)
  {
    self->_selected = a3;
    if (!self->_titleOnly)
    {
      -[THWInteractiveImageCalloutLayout invalidateSize](self, "invalidateSize");
      objc_msgSend(-[THWInteractiveImageCalloutLayout sccLayout](self, "sccLayout"), "invalidateSize");
    }
    objc_msgSend(objc_msgSend(-[THWInteractiveImageCalloutLayout layoutController](self, "layoutController"), "canvas"), "invalidateLayers");
    -[THWInteractiveImageCalloutLayout p_invalidateTitleIfNeeded](self, "p_invalidateTitleIfNeeded");
  }
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    objc_msgSend(objc_msgSend(-[THWInteractiveImageCalloutLayout layoutController](self, "layoutController"), "canvas"), "invalidateLayers");
    -[THWInteractiveImageCalloutLayout p_invalidateTitleIfNeeded](self, "p_invalidateTitleIfNeeded");
  }
}

- (void)setTitleOnly:(BOOL)a3
{
  if (self->_titleOnly != a3)
  {
    self->_titleOnly = a3;
    -[THWInteractiveImageCalloutLayout invalidateSize](self, "invalidateSize");
    objc_msgSend(-[THWInteractiveImageCalloutLayout sccLayout](self, "sccLayout"), "invalidateSize");
    objc_msgSend(-[THWInteractiveImageCalloutLayout sccLayout](self, "sccLayout"), "invalidateChildren");
    -[THWInteractiveImageCalloutLayout invalidateTitleStyle](self, "invalidateTitleStyle");
  }
}

- (void)p_invalidateTitleIfNeeded
{
  if (self->_titleOnly)
    -[THWInteractiveImageCalloutLayout invalidateTitleStyle](self, "invalidateTitleStyle");
}

- (void)invalidateTitleStyle
{
  -[TSWPStorage styleDidChangeInRange:](-[THWInteractiveImageCalloutInfo titleStorage](self->_calloutInfo, "titleStorage"), "styleDidChangeInRange:", 0, -[TSWPStorage length](-[THWInteractiveImageCalloutInfo titleStorage](self->_calloutInfo, "titleStorage"), "length"));
}

- (CGRect)groupFrameWithViewScale:(double)a3
{
  THWInteractiveImageCalloutInfo *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  v5 = -[THWInteractiveImageCalloutLayout calloutInfo](self, "calloutInfo");
  objc_msgSend(-[TSDShapeInfo geometry](-[THWInteractiveImageCalloutInfo groupShape](-[THWInteractiveImageCalloutLayout calloutInfo](self, "calloutInfo"), "groupShape"), "geometry"), "boundsBeforeRotation");
  -[THWInteractiveImageCalloutInfo placardFixedPoint](v5, "placardFixedPoint");
  v8 = TSDMultiplyPointScalar(v6, v7, a3);
  v9 = TSDRectWithCenterAndSize(v8);
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (id)controlContainerChildInfosForLayout:(id)a3
{
  unsigned int v4;
  unsigned int v5;
  TSWPStorage **v6;
  uint64_t v7;
  TSWPStorage *v9;
  _QWORD v10[2];
  TSWPStorage *v11;

  v4 = -[THWInteractiveImageCalloutLayout hasTitle](self, "hasTitle", a3);
  v5 = -[THWInteractiveImageCalloutLayout hasDescription](self, "hasDescription");
  if (self->_titleOnly)
  {
    if (v4)
    {
      v11 = -[THWInteractiveImageCalloutInfo titleStorage](self->_calloutInfo, "titleStorage");
      v6 = &v11;
LABEL_8:
      v7 = 1;
      return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, v7);
    }
  }
  else
  {
    if ((v4 & v5) == 1)
    {
      v10[0] = -[THWInteractiveImageCalloutInfo titleStorage](self->_calloutInfo, "titleStorage");
      v10[1] = -[THWInteractiveImageCalloutInfo descriptionStorage](self->_calloutInfo, "descriptionStorage");
      v6 = (TSWPStorage **)v10;
      v7 = 2;
      return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, v7);
    }
    if (v4)
    {
      v9 = -[THWInteractiveImageCalloutInfo titleStorage](self->_calloutInfo, "titleStorage");
      v6 = &v9;
      goto LABEL_8;
    }
  }
  return 0;
}

- (id)stackedControlContainerHeightLastChild:(id)a3
{
  if (self->_selected)
    return 0;
  else
    return objc_msgSend(objc_msgSend(a3, "children"), "firstObject");
}

- (double)p_scaledWidth
{
  double v3;
  double v4;
  id v5;
  double v6;

  objc_msgSend(-[TSDShapeInfo geometry](-[THWInteractiveImageCalloutInfo groupShape](self->_calloutInfo, "groupShape"), "geometry"), "size");
  v4 = v3;
  v5 = -[THWInteractiveImageCalloutLayoutDelegate interactiveImageCalloutFontScale:](self->_delegate, "interactiveImageCalloutFontScale:", self);
  return fmax(TSURound(v5, v4 * v6), 1.0);
}

- (CGPoint)stackedControlContainerOrigin:(id)a3
{
  double x;
  double y;
  CGPoint result;

  x = CGPointZero.x;
  y = CGPointZero.y;
  result.y = y;
  result.x = x;
  return result;
}

- (UIEdgeInsets)p_scaledInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  UIEdgeInsets result;

  -[THWInteractiveImageCalloutInfo contentInset](self->_calloutInfo, "contentInset");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[THWInteractiveImageCalloutLayoutDelegate interactiveImageCalloutFontScale:](self->_delegate, "interactiveImageCalloutFontScale:", self);
  v13 = v12;
  if (v12 != 1.0)
  {
    v4 = TSURound(v11, v4 * v12);
    v8 = TSURound(v14, v8 * v13);
    v6 = TSURound(v15, v6 * v13);
    v10 = TSURound(v16, v10 * v13);
  }
  v17 = v4;
  v18 = v6;
  v19 = v8;
  v20 = v10;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (double)stackedControlContainer:(id)a3 verticalPaddingAfter:(id)a4
{
  double v5;
  double v6;
  id v7;
  double v8;

  -[THWInteractiveImageCalloutInfo verticalSpacing](self->_calloutInfo, "verticalSpacing", a3, a4);
  v6 = v5;
  v7 = -[THWInteractiveImageCalloutLayoutDelegate interactiveImageCalloutFontScale:](self->_delegate, "interactiveImageCalloutFontScale:", self);
  return TSURound(v7, v6 * v8);
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
  double v5;
  id v6;
  double v7;

  if (objc_msgSend(objc_msgSend(a3, "children"), "firstObject") == a4)
    v5 = 0.0;
  else
    v5 = 3.0;
  v6 = -[THWInteractiveImageCalloutLayoutDelegate interactiveImageCalloutFontScale:](self->_delegate, "interactiveImageCalloutFontScale:", self);
  return TSURound(v6, v5 * v7);
}

- (id)stackedControlContainer:(id)a3 layoutGeometryForLayout:(id)a4
{
  return 0;
}

- (unsigned)stackedControlContainer:(id)a3 alignmentForLayout:(id)a4
{
  return 0;
}

- (id)stackedControlContainer:(id)a3 styleProviderForLayout:(id)a4
{
  TSWPStorage *v5;
  _BOOL8 v7;

  if (!self->_titleOnly)
    return 0;
  v5 = (TSWPStorage *)objc_msgSend(a4, "info", a3);
  if (v5 != -[THWInteractiveImageCalloutInfo titleStorage](self->_calloutInfo, "titleStorage"))
    return 0;
  if (!self->_styleProvider)
    self->_styleProvider = -[THWInteractiveImageCalloutStyleProvider initWithStorage:]([THWInteractiveImageCalloutStyleProvider alloc], "initWithStorage:", -[THWInteractiveImageCalloutInfo titleStorage](self->_calloutInfo, "titleStorage"));
  -[THWInteractiveImageCalloutLayoutDelegate interactiveImageCalloutFontScale:](-[THWInteractiveImageCalloutLayout delegate](self, "delegate"), "interactiveImageCalloutFontScale:", self);
  -[THWInteractiveImageCalloutStyleProvider setFontScale:](self->_styleProvider, "setFontScale:");
  v7 = self->_selected || self->_highlighted;
  -[THWInteractiveImageCalloutStyleProvider setSelected:](self->_styleProvider, "setSelected:", v7);
  return self->_styleProvider;
}

- (THWInteractiveImageCalloutInfo)calloutInfo
{
  return self->_calloutInfo;
}

- (void)setCalloutInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 288);
}

- (BOOL)titleOnly
{
  return self->_titleOnly;
}

- (THWInteractiveImageCalloutLayoutDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWInteractiveImageCalloutLayoutDelegate *)a3;
}

- (BOOL)selected
{
  return self->_selected;
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (CGRect)backgroundRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_backgroundRect.origin.x;
  y = self->_backgroundRect.origin.y;
  width = self->_backgroundRect.size.width;
  height = self->_backgroundRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)backgroundRectTitleOnly
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_backgroundRectTitleOnly.origin.x;
  y = self->_backgroundRectTitleOnly.origin.y;
  width = self->_backgroundRectTitleOnly.size.width;
  height = self->_backgroundRectTitleOnly.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (THWStackedControlContainer)stackedControlContainer
{
  return self->_stackedControlContainer;
}

- (void)setStackedControlContainer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 304);
}

- (double)marginInset
{
  return self->_marginInset;
}

- (void)setMarginInset:(double)a3
{
  self->_marginInset = a3;
}

- (THWInteractiveImageCalloutStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 320);
}

@end
