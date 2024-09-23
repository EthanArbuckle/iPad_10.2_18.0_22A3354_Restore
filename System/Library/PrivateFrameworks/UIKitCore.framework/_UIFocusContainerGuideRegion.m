@implementation _UIFocusContainerGuideRegion

- (id)_focusRegionWithAdjustedFrame:(CGRect)a3 coordinateSpace:(id)a4
{
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIFocusContainerGuideRegion;
  -[_UIFocusGuideRegion _focusRegionWithAdjustedFrame:coordinateSpace:](&v8, sel__focusRegionWithAdjustedFrame_coordinateSpace_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusContainerGuideRegion contentFocusRegionContainer](self, "contentFocusRegionContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentFocusRegionContainer:", v6);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  _UIFocusRegionContainer *v7;
  _UIFocusRegionContainer *v8;
  _UIFocusRegionContainer *v9;
  BOOL v10;
  char v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIFocusContainerGuideRegion;
  if (-[_UIFocusGuideRegion isEqual:](&v13, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = (void *)v5[9];
    v7 = self->_contentFocusRegionContainer;
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
        v11 = -[_UIFocusRegionContainer isEqual:](v7, "isEqual:", v8);
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_fallbackFocusItemForMovementRequest:(id)a3 inFocusMap:(id)a4 withSnapshot:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_UIFocusContainerGuideRegion;
  -[_UIFocusGuideRegion _fallbackFocusItemForMovementRequest:inFocusMap:withSnapshot:](&v16, sel__fallbackFocusItemForMovementRequest_inFocusMap_withSnapshot_, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    -[_UIFocusContainerGuideRegion contentFocusRegionContainer](self, "contentFocusRegionContainer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[_UIFocusContainerGuideRegion contentFocusRegionContainer](self, "contentFocusRegionContainer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "originalRegionForRegion:", self);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_allDefaultFocusableRegionsInContainer:intersectingRegion:", v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "_nextFocusedItemForFocusMovementRequest:inRegions:withSnapshot:", v8, v14, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v11;
}

- (unint64_t)_focusableBoundaries
{
  return 64;
}

- (id)_debugDrawingConfigurationWithDebugInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  void *v23;
  objc_super v25;
  CGRect v26;
  CGRect v27;

  v4 = a3;
  objc_msgSend(v4, "snapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "originalRegionForRegion:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snapshotFrameForRegion:", v7);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v4, "snapshot");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_searchArea");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  v27.origin.x = v18;
  v27.origin.y = v19;
  v27.size.width = v20;
  v27.size.height = v21;
  v26.origin.x = v9;
  v26.origin.y = v11;
  v26.size.width = v13;
  v26.size.height = v15;
  if (!CGRectEqualToRect(v26, v27))
  {

    goto LABEL_5;
  }
  v25.receiver = self;
  v25.super_class = (Class)_UIFocusContainerGuideRegion;
  -[_UIFocusGuideRegion _debugDrawingConfigurationWithDebugInfo:](&v25, sel__debugDrawingConfigurationWithDebugInfo_, v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
LABEL_5:
    v23 = 0;
    goto LABEL_6;
  }
  +[_UIFocusRegionDebugDrawingConfiguration containerGuideConfigurationForRegion:](_UIFocusRegionDebugDrawingConfiguration, "containerGuideConfigurationForRegion:", self);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v23;
}

- (_UIFocusRegionContainer)contentFocusRegionContainer
{
  return self->_contentFocusRegionContainer;
}

- (void)setContentFocusRegionContainer:(id)a3
{
  objc_storeStrong((id *)&self->_contentFocusRegionContainer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentFocusRegionContainer, 0);
}

@end
