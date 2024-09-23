@implementation _UIFocusCastingController

- (_UIFocusCastingController)init
{
  _UIFocusCastingController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIFocusCastingController;
  result = -[_UIFocusCastingController init](&v3, sel_init);
  if (result)
  {
    result->_screenEntryPoint = (CGPoint)_UIFocusCastingPointNone;
    result->_isRememberingEntryPoint = 0;
    result->_entryPointMemorizationTimeout = 0.5;
    result->_entryPointAxis = 0;
  }
  return result;
}

- (void)updateFocusCastingWithContext:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  unint64_t v27;
  NSObject *v28;
  uint8_t v29[16];

  v4 = a3;
  -[_UIFocusCastingController _normalizedCoordinateSpace](self, "_normalizedCoordinateSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = *MEMORY[0x1E0C9D628];
    v7 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    objc_msgSend(v4, "previouslyFocusedItem");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v7;
    v12 = v9;
    v13 = v8;
    v14 = v6;
    if (v10)
    {
      v15 = (void *)v10;
      objc_msgSend(v4, "previouslyFocusedItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIFocusSystem focusSystemForEnvironment:](UIFocusSystem, "focusSystemForEnvironment:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v7;
      v12 = v9;
      v13 = v8;
      v14 = v6;
      if (v17)
      {
        objc_msgSend(v4, "previouslyFocusedItem");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = _UIFocusItemFrameInCoordinateSpace(v18, v5);
        v11 = v19;
        v12 = v20;
        v13 = v21;

      }
    }
    objc_msgSend(v4, "nextFocusedItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v4, "nextFocusedItem");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = _UIFocusItemFrameInCoordinateSpace(v23, v5);
      v7 = v24;
      v9 = v25;
      v8 = v26;

    }
    -[_UIFocusCastingController _updateFocusItemFromNormalizedFrame:toNormalizedFrame:withHeading:](self, "_updateFocusItemFromNormalizedFrame:toNormalizedFrame:withHeading:", objc_msgSend(v4, "focusHeading"), v14, v11, v12, v13, v6, v7, v9, v8);
  }
  else
  {
    v27 = updateFocusCastingWithContext____s_category;
    if (!updateFocusCastingWithContext____s_category)
    {
      v27 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v27, (unint64_t *)&updateFocusCastingWithContext____s_category);
    }
    if ((*(_BYTE *)v27 & 1) != 0)
    {
      v28 = *(NSObject **)(v27 + 8);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_185066000, v28, OS_LOG_TYPE_ERROR, "Unable to get normalized coordinate space for focus casting.", v29, 2u);
      }
    }
  }

}

- (CGRect)castingFrameForFocusedItem:(id)a3 heading:(unint64_t)a4 inCoordinateSpace:(id)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  BOOL v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  NSObject *v33;
  __int16 v34[8];
  CGRect result;

  v8 = a3;
  v9 = a5;
  if (!v8
    && ((-[_UIFocusCastingController screenEntryPoint](self, "screenEntryPoint"), v11 == INFINITY)
      ? (v12 = v10 == INFINITY)
      : (v12 = 0),
        v12))
  {
    v19 = *MEMORY[0x1E0C9D628];
    v20 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v21 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v22 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    -[_UIFocusCastingController _normalizedCoordinateSpace](self, "_normalizedCoordinateSpace");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if (v8)
      {
        v14 = _UIFocusItemFrameInCoordinateSpace(v8, v13);
      }
      else
      {
        -[_UIFocusCastingController screenEntryPoint](self, "screenEntryPoint");
        v15 = round(v23 + -5.0);
        v14 = round(v24 + -5.0);
        v16 = 10.0;
        v17 = 10.0;
      }
      -[_UIFocusCastingController _castingFrameForFocusedNormalizedFrame:heading:](self, "_castingFrameForFocusedNormalizedFrame:heading:", a4, v14, v15, v16, v17);
      objc_msgSend(v13, "convertRect:toCoordinateSpace:", v9);
      v19 = v25;
      v20 = v26;
      v21 = v27;
      v22 = v28;
    }
    else
    {
      v18 = castingFrameForFocusedItem_heading_inCoordinateSpace____s_category;
      if (!castingFrameForFocusedItem_heading_inCoordinateSpace____s_category)
      {
        v18 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v18, (unint64_t *)&castingFrameForFocusedItem_heading_inCoordinateSpace____s_category);
      }
      if ((*(_BYTE *)v18 & 1) != 0)
      {
        v33 = *(NSObject **)(v18 + 8);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v34[0] = 0;
          _os_log_impl(&dword_185066000, v33, OS_LOG_TYPE_ERROR, "Unable to get normalized coordinate space for focus casting.", (uint8_t *)v34, 2u);
        }
      }
      v19 = *MEMORY[0x1E0C9D628];
      v20 = *(double *)(MEMORY[0x1E0C9D628] + 8);
      v21 = *(double *)(MEMORY[0x1E0C9D628] + 16);
      v22 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    }

  }
  v29 = v19;
  v30 = v20;
  v31 = v21;
  v32 = v22;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (void)forceUpdateFocusCastingFocusedRect:(CGRect)a3 coordinateSpace:(id)a4 heading:(unint64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unint64_t v18;
  NSObject *v19;
  uint8_t v20[16];
  CGRect v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  if (CGRectIsNull(v21))
  {
    -[_UIFocusCastingController setScreenEntryPoint:](self, "setScreenEntryPoint:", INFINITY, INFINITY);
    -[_UIFocusCastingController _stopRememberingEntryPoint](self, "_stopRememberingEntryPoint");
  }
  else
  {
    -[_UIFocusCastingController _normalizedCoordinateSpace](self, "_normalizedCoordinateSpace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "convertRect:fromCoordinateSpace:", v11, x, y, width, height);
      -[_UIFocusCastingController _updateFocusItemFromNormalizedFrame:toNormalizedFrame:withHeading:](self, "_updateFocusItemFromNormalizedFrame:toNormalizedFrame:withHeading:", a5, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24), v14, v15, v16, v17);
    }
    else
    {
      v18 = forceUpdateFocusCastingFocusedRect_coordinateSpace_heading____s_category;
      if (!forceUpdateFocusCastingFocusedRect_coordinateSpace_heading____s_category)
      {
        v18 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v18, (unint64_t *)&forceUpdateFocusCastingFocusedRect_coordinateSpace_heading____s_category);
      }
      if ((*(_BYTE *)v18 & 1) != 0)
      {
        v19 = *(NSObject **)(v18 + 8);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v20 = 0;
          _os_log_impl(&dword_185066000, v19, OS_LOG_TYPE_ERROR, "Unable to get normalized coordinate space for focus casting.", v20, 2u);
        }
      }
    }

  }
}

- (id)_normalizedCoordinateSpace
{
  void *v2;
  void *v3;
  void *v4;

  -[_UIFocusCastingController focusSystem](self, "focusSystem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIFocusSystemSceneComponent sceneComponentForFocusSystem:](_UIFocusSystemSceneComponent, "sceneComponentForFocusSystem:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "coordinateSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGRect)_castingFrameForFocusedNormalizedFrame:(CGRect)a3 heading:(unint64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v17;
  double MinX;
  double MinY;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectIsNull(a3))
  {
    -[_UIFocusCastingController _castingPointInNormalizedFrame:forHeading:](self, "_castingPointInNormalizedFrame:forHeading:", a4, x, y, width, height);
    v15 = v13;
    if (v13 == INFINITY && v14 == INFINITY)
    {
      v10 = x;
      v11 = width;
      v12 = height;
      goto LABEL_21;
    }
    v11 = fmin(width, 10.0);
    v12 = fmin(height, 10.0);
    if ((a4 & 3) != 0)
    {
      v15 = v13 + v11 * -0.5;
      if ((a4 & 1) != 0)
      {
        v17 = 0.0;
        goto LABEL_17;
      }
      if ((a4 & 2) != 0)
      {
        v25.origin.x = x;
        v25.origin.y = y;
        v25.size.width = width;
        v25.size.height = height;
        v17 = CGRectGetMaxY(v25) - v12;
LABEL_17:
        v24 = v17;
LABEL_20:
        v27.origin.x = x;
        v27.origin.y = y;
        v27.size.width = width;
        v27.size.height = height;
        MinX = CGRectGetMinX(v27);
        v28.origin.x = x;
        v28.origin.y = y;
        v28.size.width = width;
        v28.size.height = height;
        v10 = fmax(MinX, fmin(v15, CGRectGetMaxX(v28) - v11));
        v29.origin.x = x;
        v29.origin.y = y;
        v29.size.width = width;
        v29.size.height = height;
        MinY = CGRectGetMinY(v29);
        v30.origin.x = x;
        v30.origin.y = y;
        v30.size.width = width;
        v30.size.height = height;
        y = fmax(MinY, fmin(v24, CGRectGetMaxY(v30) - v12));
        goto LABEL_21;
      }
    }
    else if ((a4 & 0xC) != 0)
    {
      v24 = v14 + v12 * -0.5;
      if ((a4 & 4) != 0)
      {
        v15 = 0.0;
      }
      else if ((a4 & 8) != 0)
      {
        v26.origin.x = x;
        v26.origin.y = y;
        v26.size.width = width;
        v26.size.height = height;
        v15 = CGRectGetMaxX(v26) - v11;
      }
      goto LABEL_20;
    }
    v24 = v14;
    goto LABEL_20;
  }
  v10 = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v11 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v12 = *(double *)(MEMORY[0x1E0C9D628] + 24);
LABEL_21:
  v20 = v10;
  v21 = y;
  v22 = v11;
  v23 = v12;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void)_updateFocusItemFromNormalizedFrame:(CGRect)a3 toNormalizedFrame:(CGRect)a4 withHeading:(unint64_t)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double MinX;
  double v26;
  double MaxX;
  double v28;
  double MidX;
  double MidY;
  double v31;
  double v32;
  double MinY;
  double v34;
  double MaxY;
  double v36;
  double v37;
  CGFloat rect;
  CGFloat recta;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.size.height;
  v11 = a3.size.width;
  v12 = a3.origin.y;
  v13 = a3.origin.x;
  if (CGRectIsNull(a4) || (a5 & 0xF) == 0)
  {
    -[_UIFocusCastingController _stopRememberingEntryPoint](self, "_stopRememberingEntryPoint");
    v19 = INFINITY;
    v20 = INFINITY;
    goto LABEL_17;
  }
  v40.origin.x = v13;
  v40.origin.y = v12;
  v40.size.width = v11;
  v40.size.height = v10;
  if (CGRectIsNull(v40))
  {
    v15 = x;
    v16 = y;
    v17 = width;
    v18 = height;
  }
  else
  {
    -[_UIFocusCastingController _castingFrameForFocusedNormalizedFrame:heading:](self, "_castingFrameForFocusedNormalizedFrame:heading:", a5, v13, v12, v11, v10);
    v15 = v21;
    v16 = v22;
    v17 = v23;
    v18 = v24;
  }
  if (_UIRectIntersectsRectAlongFocusHeading(a5, x, y, width, height, v15, v16, v17, v18))
  {
    if ((a5 & 3) == 0)
    {
      if ((a5 & 0xC) != 0)
      {
        v51.origin.x = v15;
        v51.origin.y = v16;
        v51.size.width = v17;
        v51.size.height = v18;
        recta = v15;
        MinY = CGRectGetMinY(v51);
        v52.origin.x = x;
        v52.origin.y = y;
        v52.size.width = width;
        v52.size.height = height;
        v34 = CGRectGetMinY(v52);
        if (MinY >= v34)
          v34 = MinY;
        v37 = v34;
        v53.origin.x = recta;
        v53.origin.y = v16;
        v53.size.width = v17;
        v53.size.height = v18;
        MaxY = CGRectGetMaxY(v53);
        v54.origin.x = x;
        v54.origin.y = y;
        v54.size.width = width;
        v54.size.height = height;
        v36 = CGRectGetMaxY(v54);
        if (MaxY < v36)
          v36 = MaxY;
        MidY = (v37 + v36) * 0.5;
        v55.origin.x = x;
        v55.origin.y = y;
        v55.size.width = width;
        v55.size.height = height;
        MidX = CGRectGetMidX(v55);
      }
      else
      {
        MidX = INFINITY;
        MidY = INFINITY;
      }
      goto LABEL_16;
    }
    v41.origin.x = v15;
    v41.origin.y = v16;
    v41.size.width = v17;
    v41.size.height = v18;
    rect = v15;
    MinX = CGRectGetMinX(v41);
    v42.origin.x = x;
    v42.origin.y = y;
    v42.size.width = width;
    v42.size.height = height;
    v26 = CGRectGetMinX(v42);
    if (MinX >= v26)
      v26 = MinX;
    v37 = v26;
    v43.origin.x = rect;
    v43.origin.y = v16;
    v43.size.width = v17;
    v43.size.height = v18;
    MaxX = CGRectGetMaxX(v43);
    v44.origin.x = x;
    v44.origin.y = y;
    v44.size.width = width;
    v44.size.height = height;
    v28 = CGRectGetMaxX(v44);
    if (MaxX < v28)
      v28 = MaxX;
    MidX = (v37 + v28) * 0.5;
  }
  else
  {
    v45.origin.x = x;
    v45.origin.y = y;
    v45.size.width = width;
    v45.size.height = height;
    MidX = CGRectGetMidX(v45);
  }
  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.width = width;
  v46.size.height = height;
  MidY = CGRectGetMidY(v46);
LABEL_16:
  v47.origin.x = x;
  v47.origin.y = y;
  v47.size.width = width;
  v47.size.height = height;
  v31 = CGRectGetMinX(v47);
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  v19 = fmax(v31, fmin(MidX, CGRectGetMaxX(v48)));
  v49.origin.x = x;
  v49.origin.y = y;
  v49.size.width = width;
  v49.size.height = height;
  v32 = CGRectGetMinY(v49);
  v50.origin.x = x;
  v50.origin.y = y;
  v50.size.width = width;
  v50.size.height = height;
  v20 = fmax(v32, fmin(MidY, CGRectGetMaxY(v50)));
  -[_UIFocusCastingController _startRememberingEntryPoint](self, "_startRememberingEntryPoint");
LABEL_17:
  -[_UIFocusCastingController setScreenEntryPoint:](self, "setScreenEntryPoint:", v19, v20, *(_QWORD *)&v37);
  -[_UIFocusCastingController setEntryPointAxis:](self, "setEntryPointAxis:", -[_UIFocusCastingController _axisForHeading:](self, "_axisForHeading:", a5));
  if (_UIGetFocusCastingVisualization())
    -[_UIFocusCastingController _updateFocusMovementIndicatorDisplay](self, "_updateFocusMovementIndicatorDisplay");
}

- (unint64_t)_axisForHeading:(unint64_t)a3
{
  if ((a3 & 3) != 0)
    return 2;
  else
    return (a3 & 0xC) != 0;
}

- (CGPoint)_castingPointInNormalizedFrame:(CGRect)a3 forHeading:(unint64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  CGPoint result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[_UIFocusCastingController isRememberingEntryPoint](self, "isRememberingEntryPoint"))
    -[_UIFocusCastingController _entryPointInNormalizedFrame:forHeading:](self, "_entryPointInNormalizedFrame:forHeading:", a4, x, y, width, height);
  else
    -[_UIFocusCastingController _movementPointInNormalizedFrame:](self, "_movementPointInNormalizedFrame:", x, y, width, height);
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)_stopRememberingEntryPoint
{
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_forgetEntryPoint, 0);
  -[_UIFocusCastingController setIsRememberingEntryPoint:](self, "setIsRememberingEntryPoint:", 0);
}

- (void)_startRememberingEntryPoint
{
  double v3;

  -[_UIFocusCastingController _stopRememberingEntryPoint](self, "_stopRememberingEntryPoint");
  -[_UIFocusCastingController setIsRememberingEntryPoint:](self, "setIsRememberingEntryPoint:", 1);
  -[_UIFocusCastingController entryPointMemorizationTimeout](self, "entryPointMemorizationTimeout");
  if (v3 > 0.0)
    -[_UIFocusCastingController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_forgetEntryPoint, 0);
}

- (void)forgetEntryPoint
{
  if (-[_UIFocusCastingController isRememberingEntryPoint](self, "isRememberingEntryPoint"))
  {
    -[_UIFocusCastingController _stopRememberingEntryPoint](self, "_stopRememberingEntryPoint");
    if (_UIGetFocusCastingVisualization())
      -[_UIFocusCastingController _positionFocusMovementIndicators](self, "_positionFocusMovementIndicators");
  }
}

- (void)setEntryPointMemorizationTimeout:(double)a3
{
  _BOOL4 v5;

  self->_entryPointMemorizationTimeout = a3;
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_forgetEntryPoint, 0);
  v5 = -[_UIFocusCastingController isRememberingEntryPoint](self, "isRememberingEntryPoint");
  if (a3 > 0.0 && v5)
    -[_UIFocusCastingController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_forgetEntryPoint, 0, a3);
}

- (CGPoint)_entryPointInNormalizedFrame:(CGRect)a3 forHeading:(unint64_t)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  double v15;
  BOOL v16;
  double v17;
  double MinX;
  double MinY;
  double v20;
  CGPoint result;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UIFocusCastingController screenEntryPoint](self, "screenEntryPoint");
  v11 = v10;
  v13 = v12;
  v14 = -[_UIFocusCastingController _axisForHeading:](self, "_axisForHeading:", a4);
  v15 = INFINITY;
  v16 = v11 == INFINITY && v13 == INFINITY;
  v17 = INFINITY;
  if (!v16)
  {
    if (-[_UIFocusCastingController entryPointAxis](self, "entryPointAxis") == v14)
    {
      v22.origin.x = x;
      v22.origin.y = y;
      v22.size.width = width;
      v22.size.height = height;
      MinX = CGRectGetMinX(v22);
      v23.origin.x = x;
      v23.origin.y = y;
      v23.size.width = width;
      v23.size.height = height;
      v15 = fmax(MinX, fmin(v11, CGRectGetMaxX(v23)));
      v24.origin.x = x;
      v24.origin.y = y;
      v24.size.width = width;
      v24.size.height = height;
      MinY = CGRectGetMinY(v24);
      v25.origin.x = x;
      v25.origin.y = y;
      v25.size.width = width;
      v25.size.height = height;
      v17 = fmax(MinY, fmin(v13, CGRectGetMaxY(v25)));
    }
    else
    {
      v15 = INFINITY;
      v17 = INFINITY;
    }
  }
  v20 = v15;
  result.y = v17;
  result.x = v20;
  return result;
}

- (CGPoint)_movementPointInNormalizedFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UIFocusCastingController _focusEffectsControllerForFocusedItem](self, "_focusEffectsControllerForFocusedItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "displayOffset");
    v10 = x + width * (v9 + 1.0) * 0.5;
    v12 = y + height * (v11 + 1.0) * 0.5;
  }
  else
  {
    v12 = INFINITY;
    v10 = INFINITY;
  }

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (id)_focusEffectsControllerForFocusedItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[_UIFocusCastingController focusSystem](self, "focusSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_focusedWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_focusEventRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_motionEffectsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (_UIGetFocusCastingVisualization() && v6)
    objc_msgSend(v6, "addObserver:", self);

  return v6;
}

- (void)_updateFocusMovementIndicatorDisplay
{
  -[_UIFocusCastingController _createFocusMovementIndicator](self, "_createFocusMovementIndicator");
  -[_UIFocusCastingController _positionFocusMovementIndicators](self, "_positionFocusMovementIndicators");
}

- (void)_createFocusMovementIndicator
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  UIView *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIView *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  UIView *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  UIView *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.PineBoard"));

  if ((v5 & 1) == 0)
  {
    -[_UIFocusCastingController focusSystem](self, "focusSystem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_focusedWindow");
    v36 = (id)objc_claimAutoreleasedReturnValue();

    -[_UIFocusCastingController focusCastingIndicator](self, "focusCastingIndicator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v36 != v8)
      -[_UIFocusCastingController _destroyFocusMovementIndicator](self, "_destroyFocusMovementIndicator");
    if (v36)
    {
      -[_UIFocusCastingController focusCastingIndicator](self, "focusCastingIndicator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v10 = [UIView alloc];
        v11 = *MEMORY[0x1E0C9D648];
        v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
        v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
        v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
        v15 = -[UIView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E0C9D648], v12, v13, v14);
        -[_UIFocusCastingController setFocusCastingIndicator:](self, "setFocusCastingIndicator:", v15);

        +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.543, 1.11, 0.678, 7.0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIFocusCastingController focusCastingIndicator](self, "focusCastingIndicator");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setBackgroundColor:", v16);

        -[_UIFocusCastingController focusCastingIndicator](self, "focusCastingIndicator");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "layer");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setZPosition:", 100.0);

        -[_UIFocusCastingController focusCastingIndicator](self, "focusCastingIndicator");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setUserInteractionEnabled:", 0);

        -[_UIFocusCastingController focusCastingIndicator](self, "focusCastingIndicator");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addSubview:", v21);

        v22 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v11, v12, v13, v14);
        -[_UIFocusCastingController setFocusMovementIndicator:](self, "setFocusMovementIndicator:", v22);

        +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 1.11, 0.543, 0.678, 1.0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIFocusCastingController focusMovementIndicator](self, "focusMovementIndicator");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setBackgroundColor:", v23);

        -[_UIFocusCastingController focusMovementIndicator](self, "focusMovementIndicator");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "layer");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setZPosition:", 100.0);

        -[_UIFocusCastingController focusMovementIndicator](self, "focusMovementIndicator");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setUserInteractionEnabled:", 0);

        -[_UIFocusCastingController focusMovementIndicator](self, "focusMovementIndicator");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addSubview:", v28);

        v29 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v11, v12, v13, v14);
        -[_UIFocusCastingController setFocusEntryIndicator:](self, "setFocusEntryIndicator:", v29);

        +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.678, 0.543, 1.11, 1.0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIFocusCastingController focusEntryIndicator](self, "focusEntryIndicator");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setBackgroundColor:", v30);

        -[_UIFocusCastingController focusEntryIndicator](self, "focusEntryIndicator");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "layer");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setZPosition:", 100.0);

        -[_UIFocusCastingController focusEntryIndicator](self, "focusEntryIndicator");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setUserInteractionEnabled:", 0);

        -[_UIFocusCastingController focusEntryIndicator](self, "focusEntryIndicator");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addSubview:", v35);

      }
    }

  }
}

- (void)_positionFocusMovementIndicators
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double x;
  double y;
  double width;
  double height;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  _BOOL8 v36;
  void *v37;
  void *v38;
  void *v39;
  _BOOL8 v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  NSObject *v48;
  uint8_t v49[16];
  CGRect v50;

  -[_UIFocusCastingController focusCastingIndicator](self, "focusCastingIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UIFocusCastingController _normalizedCoordinateSpace](self, "_normalizedCoordinateSpace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[_UIFocusCastingController focusMovementIndicator](self, "focusMovementIndicator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setHidden:", 1);

      -[_UIFocusCastingController focusEntryIndicator](self, "focusEntryIndicator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setHidden:", 1);

      -[_UIFocusCastingController focusCastingIndicator](self, "focusCastingIndicator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHidden:", 1);

      -[_UIFocusCastingController focusSystem](self, "focusSystem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "focusedItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v50.origin.x = _UIFocusItemFrameInCoordinateSpace(v9, v4);
      x = v50.origin.x;
      y = v50.origin.y;
      width = v50.size.width;
      height = v50.size.height;
      if (!CGRectIsNull(v50))
      {
        -[_UIFocusCastingController _focusEffectsControllerForFocusedItem](self, "_focusEffectsControllerForFocusedItem");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "displayOffset");
        v16 = v15;
        v18 = v17;

        v19 = -v16;
        if (v16 >= 0.0)
          v19 = v16;
        v20 = -v18;
        v21 = 4;
        if (v16 > 0.0)
          v21 = 8;
        if (v18 >= 0.0)
          v20 = v18;
        v22 = 2;
        if (v18 <= 0.0)
          v22 = 1;
        if (v19 <= v20)
          v23 = v22;
        else
          v23 = v21;
        -[_UIFocusCastingController _movementPointInNormalizedFrame:](self, "_movementPointInNormalizedFrame:", x, y, width, height);
        v25 = v24;
        v27 = v26;
        -[_UIFocusCastingController _entryPointInNormalizedFrame:forHeading:](self, "_entryPointInNormalizedFrame:forHeading:", v23, x, y, width, height);
        v29 = v28;
        v31 = v30;
        -[_UIFocusCastingController _castingPointInNormalizedFrame:forHeading:](self, "_castingPointInNormalizedFrame:forHeading:", v23, x, y, width, height);
        v33 = v32;
        v35 = v34;
        v36 = v31 == INFINITY && v29 == INFINITY;
        -[_UIFocusCastingController focusEntryIndicator](self, "focusEntryIndicator");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setHidden:", v36);

        -[_UIFocusCastingController focusEntryIndicator](self, "focusEntryIndicator");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setBounds:", 0.0, 0.0, 20.0, 20.0);

        -[_UIFocusCastingController focusEntryIndicator](self, "focusEntryIndicator");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setCenter:", v29, v31);

        v40 = v27 == INFINITY && v25 == INFINITY;
        -[_UIFocusCastingController focusMovementIndicator](self, "focusMovementIndicator");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setHidden:", v40);

        -[_UIFocusCastingController focusMovementIndicator](self, "focusMovementIndicator");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setBounds:", 0.0, 0.0, 25.0, 25.0);

        -[_UIFocusCastingController focusMovementIndicator](self, "focusMovementIndicator");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setCenter:", v25, v27);

        -[_UIFocusCastingController focusCastingIndicator](self, "focusCastingIndicator");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setHidden:", 0);

        -[_UIFocusCastingController focusCastingIndicator](self, "focusCastingIndicator");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "setBounds:", 0.0, 0.0, 30.0, 30.0);

        -[_UIFocusCastingController focusCastingIndicator](self, "focusCastingIndicator");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "setCenter:", v33, v35);

      }
    }
    else
    {
      v47 = _positionFocusMovementIndicators___s_category;
      if (!_positionFocusMovementIndicators___s_category)
      {
        v47 = __UILogCategoryGetNode("UIFocus", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v47, (unint64_t *)&_positionFocusMovementIndicators___s_category);
      }
      if ((*(_BYTE *)v47 & 1) != 0)
      {
        v48 = *(NSObject **)(v47 + 8);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v49 = 0;
          _os_log_impl(&dword_185066000, v48, OS_LOG_TYPE_ERROR, "Unable to get normalized coordinate space for focus casting.", v49, 2u);
        }
      }
    }

  }
}

- (void)_destroyFocusMovementIndicator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[_UIFocusCastingController focusMovementIndicator](self, "focusMovementIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UIFocusCastingController focusMovementIndicator](self, "focusMovementIndicator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[_UIFocusCastingController setFocusMovementIndicator:](self, "setFocusMovementIndicator:", 0);
  }
  -[_UIFocusCastingController focusEntryIndicator](self, "focusEntryIndicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UIFocusCastingController focusEntryIndicator](self, "focusEntryIndicator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[_UIFocusCastingController setFocusEntryIndicator:](self, "setFocusEntryIndicator:", 0);
  }
  -[_UIFocusCastingController focusCastingIndicator](self, "focusCastingIndicator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_UIFocusCastingController focusCastingIndicator](self, "focusCastingIndicator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[_UIFocusCastingController setFocusCastingIndicator:](self, "setFocusCastingIndicator:", 0);
  }
}

- (UIFocusSystem)focusSystem
{
  return (UIFocusSystem *)objc_loadWeakRetained((id *)&self->_focusSystem);
}

- (void)setFocusSystem:(id)a3
{
  objc_storeWeak((id *)&self->_focusSystem, a3);
}

- (double)entryPointMemorizationTimeout
{
  return self->_entryPointMemorizationTimeout;
}

- (CGPoint)screenEntryPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_screenEntryPoint.x;
  y = self->_screenEntryPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setScreenEntryPoint:(CGPoint)a3
{
  self->_screenEntryPoint = a3;
}

- (unint64_t)entryPointAxis
{
  return self->_entryPointAxis;
}

- (void)setEntryPointAxis:(unint64_t)a3
{
  self->_entryPointAxis = a3;
}

- (BOOL)isRememberingEntryPoint
{
  return self->_isRememberingEntryPoint;
}

- (void)setIsRememberingEntryPoint:(BOOL)a3
{
  self->_isRememberingEntryPoint = a3;
}

- (UIView)focusMovementIndicator
{
  return self->_focusMovementIndicator;
}

- (void)setFocusMovementIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_focusMovementIndicator, a3);
}

- (UIView)focusEntryIndicator
{
  return self->_focusEntryIndicator;
}

- (void)setFocusEntryIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_focusEntryIndicator, a3);
}

- (UIView)focusCastingIndicator
{
  return self->_focusCastingIndicator;
}

- (void)setFocusCastingIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_focusCastingIndicator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusCastingIndicator, 0);
  objc_storeStrong((id *)&self->_focusEntryIndicator, 0);
  objc_storeStrong((id *)&self->_focusMovementIndicator, 0);
  objc_destroyWeak((id *)&self->_focusSystem);
}

@end
