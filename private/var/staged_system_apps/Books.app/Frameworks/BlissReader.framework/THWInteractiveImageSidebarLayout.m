@implementation THWInteractiveImageSidebarLayout

- (THWInteractiveImageSidebarLayout)initWithDelegate:(id)a3
{
  THWInteractiveImageSidebarLayout *v4;
  THWInteractiveImageSidebarLayout *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THWInteractiveImageSidebarLayout;
  v4 = -[THWInteractiveImageSidebarLayout initWithInfo:](&v7, "initWithInfo:", 0);
  v5 = v4;
  if (v4)
  {
    v4->_delegate = (THWInteractiveImageSidebarLayoutDelegate *)a3;
    v4->_calloutToStackedControlContainerMap = (TSURetainedPointerKeyDictionary *)objc_alloc_init((Class)TSURetainedPointerKeyDictionary);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWInteractiveImageSidebarLayout;
  -[THWContainerLayout dealloc](&v3, "dealloc");
}

- (Class)repClassOverride
{
  return (Class)objc_opt_class(THWInteractiveImageSidebarRep, a2);
}

- (id)additionalDependenciesForChildLayout:(id)a3
{
  THWInteractiveImageSidebarLayout *v4;

  v4 = self;
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v4, 1);
}

- (id)computeLayoutGeometry
{
  THWInteractiveImageSidebarLayoutDelegate *delegate;
  unsigned __int8 v4;
  double v5;
  double x;
  double v7;
  double y;
  double width;
  double v10;
  double height;
  id v12;
  id v13;
  double v14;

  delegate = self->_delegate;
  if (!delegate)
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", x, y, width, height);
  }
  v4 = -[THWInteractiveImageSidebarLayoutDelegate interactiveImageSidebarIsExpanded:](delegate, "interactiveImageSidebarIsExpanded:", self);
  x = TSDRectWithSize(-[THWInteractiveImageSidebarLayoutDelegate interactiveImageSidebarSize:](self->_delegate, "interactiveImageSidebarSize:", self));
  y = v7;
  width = v5;
  height = v10;
  if (!self->_currentCallout)
  {
    if ((v4 & 1) != 0)
    {
      if (!self->_previousCallout)
        return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", x, y, width, height);
      goto LABEL_12;
    }
LABEL_10:
    x = -v5;
    return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", x, y, width, height);
  }
  if (!self->_hidden)
  {
    if ((v4 & 1) == 0)
      return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", x, y, width, height);
    goto LABEL_12;
  }
  if ((v4 & 1) == 0)
    goto LABEL_10;
LABEL_12:
  v12 = -[TSURetainedPointerKeyDictionary objectForKeyedSubscript:](self->_calloutToStackedControlContainerMap, "objectForKeyedSubscript:");
  if (v12)
  {
    v13 = objc_msgSend(-[THWInteractiveImageSidebarLayout layoutController](self, "layoutController"), "layoutForInfo:childOfLayout:", v12, self);
    if (v13)
    {
      objc_msgSend(objc_msgSend(v13, "geometry"), "size");
      height = v14;
      x = 17.0;
      y = 94.0;
    }
  }
  return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", x, y, width, height);
}

- (void)setCurrentCallout:(id)a3
{
  THWInteractiveImageCalloutInfo *currentCallout;

  currentCallout = self->_currentCallout;
  if (currentCallout != a3)
  {

    self->_currentCallout = (THWInteractiveImageCalloutInfo *)a3;
    -[THWInteractiveImageSidebarLayout invalidateChildren](self, "invalidateChildren");
  }
}

- (void)setPreviousCallout:(id)a3
{
  THWInteractiveImageCalloutInfo *previousCallout;

  previousCallout = self->_previousCallout;
  if (previousCallout != a3)
  {

    self->_previousCallout = (THWInteractiveImageCalloutInfo *)a3;
    -[THWInteractiveImageSidebarLayout invalidateChildren](self, "invalidateChildren");
  }
}

- (void)setHidden:(BOOL)a3
{
  if (self->_hidden != a3)
  {
    self->_hidden = a3;
    -[THWInteractiveImageSidebarLayout invalidateFrame](self, "invalidateFrame");
  }
}

- (void)p_updateContainerMap:(id)a3 forCallout:(id)a4
{
  THWStackedControlContainer *v7;

  if (a4)
  {
    v7 = (THWStackedControlContainer *)-[TSURetainedPointerKeyDictionary objectForKeyedSubscript:](self->_calloutToStackedControlContainerMap, "objectForKeyedSubscript:", a4);
    if (v7
      || (v7 = -[THWStackedControlContainer initWithDelegate:]([THWStackedControlContainer alloc], "initWithDelegate:", self), -[THWControlContainer setInstanceData:](v7, "setInstanceData:", a4), v7))
    {
      objc_msgSend(a3, "setObject:forUncopiedKey:", v7, a4);
    }
  }
}

- (void)p_updateContainers
{
  TSURetainedPointerKeyDictionary *v3;

  v3 = (TSURetainedPointerKeyDictionary *)objc_alloc_init((Class)TSURetainedPointerKeyDictionary);
  -[THWInteractiveImageSidebarLayout p_updateContainerMap:forCallout:](self, "p_updateContainerMap:forCallout:", v3, self->_currentCallout);
  -[THWInteractiveImageSidebarLayout p_updateContainerMap:forCallout:](self, "p_updateContainerMap:forCallout:", v3, self->_previousCallout);

  self->_calloutToStackedControlContainerMap = v3;
}

- (id)childInfosForLayout
{
  id v3;
  id v4;
  id result;
  BOOL v6;
  id *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[2];

  -[THWInteractiveImageSidebarLayout p_updateContainers](self, "p_updateContainers");
  if (self->_currentCallout)
  {
    v3 = -[TSURetainedPointerKeyDictionary objectForKeyedSubscript:](self->_calloutToStackedControlContainerMap, "objectForKeyedSubscript:");
    v4 = v3;
    if (!self->_previousCallout)
    {
      if (!v3)
        return 0;
LABEL_13:
      v10 = v4;
      v7 = &v10;
LABEL_14:
      v8 = 1;
      return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, v8);
    }
  }
  else
  {
    if (!self->_previousCallout)
      return 0;
    v4 = 0;
  }
  result = -[TSURetainedPointerKeyDictionary objectForKeyedSubscript:](self->_calloutToStackedControlContainerMap, "objectForKeyedSubscript:");
  if (v4)
    v6 = result == 0;
  else
    v6 = 1;
  if (!v6)
  {
    v11[0] = v4;
    v11[1] = result;
    v7 = (id *)v11;
    v8 = 2;
    return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, v8);
  }
  if (v4)
    goto LABEL_13;
  if (result)
  {
    v9 = result;
    v7 = &v9;
    goto LABEL_14;
  }
  return result;
}

- (void)updateCallout:(id)a3
{
  if (self->_currentCallout != a3)
  {
    -[THWInteractiveImageSidebarLayout invalidateFrame](self, "invalidateFrame");
    -[THWInteractiveImageSidebarLayout setPreviousCallout:](self, "setPreviousCallout:", self->_currentCallout);
    -[THWInteractiveImageSidebarLayout setCurrentCallout:](self, "setCurrentCallout:", a3);
  }
}

- (void)clearPreviousCallout
{
  -[THWInteractiveImageSidebarLayout setPreviousCallout:](self, "setPreviousCallout:", 0);
}

- (id)p_stackForCallout:(id)a3
{
  if (a3)
    return -[TSURetainedPointerKeyDictionary objectForKeyedSubscript:](self->_calloutToStackedControlContainerMap, "objectForKeyedSubscript:");
  else
    return 0;
}

- (id)layoutForCallout:(id)a3
{
  id result;

  result = -[THWInteractiveImageSidebarLayout p_stackForCallout:](self, "p_stackForCallout:", a3);
  if (result)
    return objc_msgSend(-[THWInteractiveImageSidebarLayout layoutController](self, "layoutController"), "layoutForInfo:childOfLayout:", result, self);
  return result;
}

- (id)controlContainerChildInfosForLayout:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id result;
  id *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[2];

  v3 = objc_msgSend(objc_msgSend(a3, "info"), "instanceData");
  v4 = objc_msgSend(v3, "titleStorage");
  v5 = objc_msgSend(v3, "descriptionStorage");
  v6 = objc_msgSend(v4, "length");
  result = objc_msgSend(v5, "length");
  if (v6 && result)
  {
    v12[0] = v4;
    v12[1] = v5;
    v8 = (id *)v12;
    v9 = 2;
  }
  else
  {
    if (v6)
    {
      v11 = v4;
      v8 = &v11;
    }
    else
    {
      if (!result)
        return result;
      v10 = v5;
      v8 = &v10;
    }
    v9 = 1;
  }
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, v9);
}

- (double)stackedControlContainerWidth:(id)a3
{
  double result;

  -[THWInteractiveImageSidebarLayoutDelegate interactiveImageSidebarSize:](self->_delegate, "interactiveImageSidebarSize:", self);
  return result;
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

- (UIEdgeInsets)stackedControlContainerInsets:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  objc_msgSend(objc_msgSend(objc_msgSend(a3, "info"), "instanceData"), "contentInset");
  v4 = v3 + -1.0;
  v6 = v5 + -1.0;
  v7 = 8.0;
  v8 = 8.0;
  result.right = v8;
  result.bottom = v6;
  result.left = v7;
  result.top = v4;
  return result;
}

- (double)stackedControlContainer:(id)a3 verticalPaddingAfter:(id)a4
{
  double v4;

  objc_msgSend(objc_msgSend(objc_msgSend(a3, "info"), "instanceData"), "verticalSpacing");
  return v4 + 4.0;
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
  return 0;
}

- (unsigned)stackedControlContainer:(id)a3 alignmentForLayout:(id)a4
{
  return 0;
}

- (id)stackedControlContainer:(id)a3 styleProviderForLayout:(id)a4
{
  return 0;
}

- (THWInteractiveImageCalloutInfo)currentCallout
{
  return self->_currentCallout;
}

- (THWInteractiveImageCalloutInfo)previousCallout
{
  return self->_previousCallout;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (THWInteractiveImageSidebarLayoutDelegate)delegate
{
  return self->_delegate;
}

@end
