@implementation _UIFocusPromiseRegion

- (_UIFocusPromiseRegion)initWithFrame:(CGRect)a3 coordinateSpace:(id)a4
{
  return -[_UIFocusPromiseRegion initWithFrame:coordinateSpace:identifier:](self, "initWithFrame:coordinateSpace:identifier:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_UIFocusPromiseRegion)initWithFrame:(CGRect)a3 coordinateSpace:(id)a4 identifier:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  _UIFocusPromiseRegion *v13;
  _UIFocusPromiseRegion *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_UIFocusPromiseRegion;
  v13 = -[_UIFocusRegion initWithFrame:coordinateSpace:](&v16, sel_initWithFrame_coordinateSpace_, a4, x, y, width, height);
  v14 = v13;
  if (v13)
    objc_storeStrong(&v13->_identifier, a5);

  return v14;
}

- (id)_focusRegionWithAdjustedFrame:(CGRect)a3 coordinateSpace:(id)a4
{
  id *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIFocusPromiseRegion;
  -[_UIFocusRegion _focusRegionWithAdjustedFrame:coordinateSpace:](&v8, sel__focusRegionWithAdjustedFrame_coordinateSpace_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusPromiseRegion contentFulfillmentHandler](self, "contentFulfillmentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentFulfillmentHandler:", v6);

  objc_storeStrong(v5 + 6, self->_identifier);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  char v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIFocusPromiseRegion;
  if (-[_UIFocusRegion isEqual:](&v13, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = (void *)v5[6];
    v7 = self->_identifier;
    v8 = v6;
    v9 = v8;
    if (v7 == v8)
    {
      v11 = 1;
    }
    else
    {
      if (v7)
        v10 = v8 == 0;
      else
        v10 = 1;
      if (v10)
        v11 = 0;
      else
        v11 = objc_msgSend(v7, "isEqual:", v8);
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_nextFocusedItemForFocusMovementRequest:(id)a3 inMap:(id)a4 withSnapshot:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**contentFulfillmentHandler)(id, _UIFocusPromiseRegion *);
  uint64_t v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _UIFocusMapSnapshotter *v22;
  void *v23;
  void *v24;
  void *v25;
  _UIFocusMapSnapshotter *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _UIFocusMapSnapshotter *v37;
  CGRect v38;
  CGRect v39;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  contentFulfillmentHandler = (void (**)(id, _UIFocusPromiseRegion *))self->_contentFulfillmentHandler;
  if (contentFulfillmentHandler)
  {
    contentFulfillmentHandler[2](contentFulfillmentHandler, self);
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (id)v12;
      objc_msgSend(v10, "snapshotFrameForRegion:", self);
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v22 = [_UIFocusMapSnapshotter alloc];
      objc_msgSend(v8, "focusSystem");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "coordinateSpace");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "searchInfo");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = -[_UIFocusMapSnapshotter initWithFocusSystem:rootContainer:coordinateSpace:searchInfo:ignoresRootContainerClippingRect:](v22, "initWithFocusSystem:rootContainer:coordinateSpace:searchInfo:ignoresRootContainerClippingRect:", v23, v13, v24, v25, 0);

      -[_UIFocusMapSnapshotter setSnapshotFrame:](v26, "setSnapshotFrame:", v15, v17, v19, v21);
      -[_UIFocusMapSnapshotter captureSnapshot](v26, "captureSnapshot");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "regions");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "count") == 1)
      {
        objc_msgSend(v27, "regions");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "firstObject");
        v37 = v26;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "snapshotFrameForRegion:", v30);
        v39.origin.x = v15;
        v39.origin.y = v17;
        v39.size.width = v19;
        v39.size.height = v21;
        v31 = CGRectEqualToRect(v38, v39);

        v26 = v37;
        if (v31)
          goto LABEL_11;
      }
      else
      {

      }
      objc_msgSend(v9, "_trackExternalSnapshot:", v27);
LABEL_11:
      objc_msgSend(v10, "occludingRegionsForRegion:", self);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "consumeRegionInformationForRegions:fromSnapshot:", v33, v10);
      objc_msgSend(v27, "regions");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIFocusRegionEvaluator regionsByOccludingRegions:beneathRegions:inSnapshot:](_UIFocusRegionEvaluator, "regionsByOccludingRegions:beneathRegions:inSnapshot:", v34, v33, v27);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "_nextFocusedItemForFocusMovementRequest:inRegions:withSnapshot:", v8, v35, v27);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
    v13 = self->_contentFulfillmentHandler;
  }
  else
  {
    v13 = 0;
  }
  v32 = 0;
  self->_contentFulfillmentHandler = 0;
LABEL_12:

  return v32;
}

- (unint64_t)_focusableBoundaries
{
  void *v2;
  _BOOL4 v3;

  -[_UIFocusPromiseRegion contentFulfillmentHandler](self, "contentFulfillmentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return 32 * v3;
}

- (id)_debugDrawingConfigurationWithDebugInfo:(id)a3
{
  void *v4;

  v4 = -[_UIFocusPromiseRegion _focusableBoundaries](self, "_focusableBoundaries", a3);
  if (v4)
  {
    +[_UIFocusRegionDebugDrawingConfiguration promiseConfigurationForRegion:](_UIFocusRegionDebugDrawingConfiguration, "promiseConfigurationForRegion:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_descriptionBuilder
{
  void *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIFocusPromiseRegion;
  -[_UIFocusRegion _descriptionBuilder](&v6, sel__descriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("identifier"), self->_identifier);
  return v3;
}

- (id)contentFulfillmentHandler
{
  return self->_contentFulfillmentHandler;
}

- (void)setContentFulfillmentHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_contentFulfillmentHandler, 0);
  objc_storeStrong(&self->_identifier, 0);
}

@end
