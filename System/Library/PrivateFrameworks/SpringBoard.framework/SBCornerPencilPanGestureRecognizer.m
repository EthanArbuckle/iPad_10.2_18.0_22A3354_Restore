@implementation SBCornerPencilPanGestureRecognizer

+ (unint64_t)_edgesForCorner:(unint64_t)a3
{
  if (a3 - 1 > 7)
    return 0;
  else
    return qword_1D0E89B00[a3 - 1];
}

+ (id)interactiveCornerPanGestureRecognizerWithSettings:(id)a3 corner:(unint64_t)a4 target:(id)a5 action:(SEL)a6
{
  id v10;
  id v11;
  void *v12;

  v10 = a5;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithSettings:corner:target:action:type:options:", v11, a4, v10, a6, 3, 1);

  return v12;
}

- (id)_initWithSettings:(id)a3 corner:(unint64_t)a4 target:(id)a5 action:(SEL)a6 type:(int64_t)a7 options:(unint64_t)a8
{
  id v15;
  id v16;
  uint64_t v17;
  SBCornerPencilPanGestureRecognizer *v18;
  SBCornerPencilPanGestureRecognizer *v19;
  SBTouchHistory *v20;
  SBTouchHistory *touchHistory;
  void *v23;
  objc_super v24;
  objc_super v25;

  v15 = a3;
  v16 = a5;
  v17 = objc_msgSend((id)objc_opt_class(), "_edgesForCorner:", a4);
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCornerPencilPanGestureRecognizer.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuredEdges != UIRectEdgeNone"));

  }
  v25.receiver = self;
  v25.super_class = (Class)SBCornerPencilPanGestureRecognizer;
  v18 = -[SBScreenEdgePanGestureRecognizer initWithTarget:action:type:options:](&v25, sel_initWithTarget_action_type_options_, v16, a6, a7, a8);
  v19 = v18;
  if (v18)
  {
    -[SBCornerPencilPanGestureRecognizer _updateSettingsDerivedValues:](v18, "_updateSettingsDerivedValues:", v15);
    objc_msgSend(v15, "addKeyObserver:", v19);
    v20 = objc_alloc_init(SBTouchHistory);
    touchHistory = v19->_touchHistory;
    v19->_touchHistory = v20;

    v19->_corner = a4;
    v24.receiver = v19;
    v24.super_class = (Class)SBCornerPencilPanGestureRecognizer;
    -[UIScreenEdgePanGestureRecognizer setEdges:](&v24, sel_setEdges_, v17);
    -[SBCornerPencilPanGestureRecognizer setAllowedTouchTypes:](v19, "setAllowedTouchTypes:", &unk_1E91CE950);
    -[SBCornerPencilPanGestureRecognizer setMaximumNumberOfTouches:](v19, "setMaximumNumberOfTouches:", 1);
    -[UIScreenEdgePanGestureRecognizer _setHysteresis:](v19, "_setHysteresis:", 5.0);
  }

  return v19;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[SBCornerPencilPanGestureRecognizer _updateSettingsDerivedValues:](self, "_updateSettingsDerivedValues:", v5);

}

- (void)_SBLogTouchesWithMethodName:(id)a3 withMethodName:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  SBCornerPencilPanGestureRecognizer *v13;
  id v14;

  v10 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEnabled");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __81__SBCornerPencilPanGestureRecognizer__SBLogTouchesWithMethodName_withMethodName___block_invoke;
    v11[3] = &unk_1E8EAE6B8;
    v12 = v10;
    v13 = self;
    v14 = v6;
    objc_msgSend(v9, "logBlock:", v11);

  }
}

id __81__SBCornerPencilPanGestureRecognizer__SBLogTouchesWithMethodName_withMethodName___block_invoke(uint64_t a1)
{
  uint64_t i;
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  uint64_t v34;
  id obj;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[3];
  _QWORD v51[3];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[13];
  _QWORD v55[13];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v34 = a1;
  obj = *(id *)(a1 + 32);
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
  if (v38)
  {
    v36 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v38; ++i)
      {
        if (*(_QWORD *)v47 != v36)
          objc_enumerationMutation(obj);
        v3 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        v4 = _SBLocationForTouch(v3);
        v6 = v5;
        v54[0] = CFSTR("timestamp");
        v7 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v3, "timestamp");
        objc_msgSend(v7, "numberWithDouble:");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v55[0] = v45;
        v54[1] = CFSTR("phase");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "phase"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v55[1] = v44;
        v54[2] = CFSTR("tapCount");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "tapCount"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v55[2] = v43;
        v54[3] = CFSTR("type");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "type"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v55[3] = v42;
        v54[4] = CFSTR("majorRadius");
        v8 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v3, "majorRadius");
        objc_msgSend(v8, "numberWithDouble:");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v55[4] = v41;
        v54[5] = CFSTR("majorRadiusToTolerance");
        v9 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v3, "majorRadiusTolerance");
        objc_msgSend(v9, "numberWithDouble:");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v55[5] = v40;
        v54[6] = CFSTR("force");
        v10 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v3, "force");
        objc_msgSend(v10, "numberWithDouble:");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v55[6] = v39;
        v54[7] = CFSTR("maximumPossibleForce");
        v11 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v3, "maximumPossibleForce");
        objc_msgSend(v11, "numberWithDouble:");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v55[7] = v12;
        v54[8] = CFSTR("altitudeAngle");
        v13 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v3, "altitudeAngle");
        objc_msgSend(v13, "numberWithDouble:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v55[8] = v14;
        v54[9] = CFSTR("estimationUpdateIndex");
        objc_msgSend(v3, "estimationUpdateIndex");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        v17 = &unk_1E91D0EF0;
        if (v15)
          v17 = (void *)v15;
        v55[9] = v17;
        v54[10] = CFSTR("estimatedProperties");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "estimatedProperties"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v55[10] = v18;
        v54[11] = CFSTR("estimatedPropertiesExpectingUpdates");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "estimatedPropertiesExpectingUpdates"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v55[11] = v19;
        v54[12] = CFSTR("location");
        v52[0] = CFSTR("x");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v52[1] = CFSTR("y");
        v53[0] = v20;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v53[1] = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v55[12] = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 13);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v37, "addObject:", v23);
      }
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    }
    while (v38);
  }

  v24 = (void *)MEMORY[0x1E0CB3940];
  v25 = (objc_class *)objc_opt_class();
  NSStringFromClass(v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("[%@ %@]"), v26, *(_QWORD *)(v34 + 48));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v51[0] = v37;
  v50[0] = v27;
  v50[1] = CFSTR("address");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(v34 + 40));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v28;
  v50[2] = CFSTR("name");
  objc_msgSend(*(id *)(v34 + 40), "name");
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v29;
  v31 = &stru_1E8EC7EC0;
  if (v29)
    v31 = (const __CFString *)v29;
  v51[2] = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (void)setEdges:(unint64_t)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCornerPencilPanGestureRecognizer.m"), 181, CFSTR("configure edges by passing in corner"));

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coalescedTouchesForTouch:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _SBUpdateTouchHistoryWithCoalescedTouches(self->_touchHistory, v10, self, 0, 0);
  _SBLogCoalescedTouchesForGestureAndView_0(v10, self);
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCornerPencilPanGestureRecognizer _SBLogTouchesWithMethodName:withMethodName:](self, "_SBLogTouchesWithMethodName:withMethodName:", v8, v11);

  v12.receiver = self;
  v12.super_class = (Class)SBCornerPencilPanGestureRecognizer;
  -[UIScreenEdgePanGestureRecognizer touchesBegan:withEvent:](&v12, sel_touchesBegan_withEvent_, v8, v7);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coalescedTouchesForTouch:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _SBUpdateTouchHistoryWithCoalescedTouches(self->_touchHistory, v10, self, 0, 0);
  _SBLogCoalescedTouchesForGestureAndView_0(v10, self);
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCornerPencilPanGestureRecognizer _SBLogTouchesWithMethodName:withMethodName:](self, "_SBLogTouchesWithMethodName:withMethodName:", v8, v11);

  v12.receiver = self;
  v12.super_class = (Class)SBCornerPencilPanGestureRecognizer;
  -[UIScreenEdgePanGestureRecognizer touchesMoved:withEvent:](&v12, sel_touchesMoved_withEvent_, v8, v7);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "coalescedTouchesForTouch:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _SBUpdateTouchHistoryWithCoalescedTouches(self->_touchHistory, v10, self, 0, 0);
  _SBLogCoalescedTouchesForGestureAndView_0(v10, self);
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCornerPencilPanGestureRecognizer _SBLogTouchesWithMethodName:withMethodName:](self, "_SBLogTouchesWithMethodName:withMethodName:", v8, v11);

  v12.receiver = self;
  v12.super_class = (Class)SBCornerPencilPanGestureRecognizer;
  -[UIScreenEdgePanGestureRecognizer touchesEnded:withEvent:](&v12, sel_touchesEnded_withEvent_, v8, v7);

}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBCornerPencilPanGestureRecognizer;
  -[UIScreenEdgePanGestureRecognizer reset](&v3, sel_reset);
  self->_touchInterfaceOrientationWhenGestureBegan = 0;
  -[SBTouchHistory reset](self->_touchHistory, "reset");
}

- (void)setState:(int64_t)a3
{
  void *v5;
  objc_super v6;
  _QWORD v7[6];

  if (a3 == 1)
    self->_touchInterfaceOrientationWhenGestureBegan = -[SBCornerPencilPanGestureRecognizer _touchInterfaceOrientation](self, "_touchInterfaceOrientation");
  objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__SBCornerPencilPanGestureRecognizer_setState___block_invoke;
  v7[3] = &unk_1E8EAF208;
  v7[4] = self;
  v7[5] = a3;
  objc_msgSend(v5, "logBlock:", v7);

  v6.receiver = self;
  v6.super_class = (Class)SBCornerPencilPanGestureRecognizer;
  -[SBCornerPencilPanGestureRecognizer setState:](&v6, sel_setState_, a3);
}

id __47__SBCornerPencilPanGestureRecognizer_setState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[6];
  _QWORD v14[6];
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v15 = CFSTR("[SBCornerPencilPanGestureRecognizer setState:]");
  v13[0] = CFSTR("state");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v2;
  v13[1] = CFSTR("address");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v3;
  v13[2] = CFSTR("name");
  objc_msgSend(*(id *)(a1 + 32), "name");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_1E8EC7EC0;
  if (v4)
    v6 = (const __CFString *)v4;
  v14[2] = v6;
  v13[3] = CFSTR("horizontalEdgeLength");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 536));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v7;
  v13[4] = CFSTR("verticalEdgeLength");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(*(_QWORD *)(a1 + 32) + 544));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v8;
  v13[5] = CFSTR("corner");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (int64_t)_touchInterfaceOrientation
{
  int64_t result;
  objc_super v4;

  result = self->_touchInterfaceOrientationWhenGestureBegan;
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)SBCornerPencilPanGestureRecognizer;
    return -[SBScreenEdgePanGestureRecognizer _touchInterfaceOrientation](&v4, sel__touchInterfaceOrientation);
  }
  return result;
}

+ (BOOL)_shouldSupportStylusTouches
{
  return 1;
}

- (BOOL)shouldReceiveTouch:(id)a3
{
  unint64_t corner;
  double v5;
  double v6;
  __int128 v8;
  __int128 v9;
  double v10;
  double v11;

  v10 = 0.0;
  v11 = 0.0;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(a3, "locationInView:", 0);
  -[SBCornerPencilPanGestureRecognizer _convertReferenceLocation:toOrientedLocation:orientedBounds:](self, "_convertReferenceLocation:toOrientedLocation:orientedBounds:", &v10, &v8);
  corner = self->_corner;
  -[SBCornerPencilPanGestureRecognizer _edgeOffsets](self, "_edgeOffsets");
  return -[SBCornerPencilPanGestureRecognizer _isOrientedLocation:inCorner:forOrientedBounds:withEdgeOffsets:](self, "_isOrientedLocation:inCorner:forOrientedBounds:withEdgeOffsets:", corner, v10, v11, v8, v9, v5, v6);
}

- (void)_updateSettingsDerivedValues:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;

  v4 = a3;
  objc_msgSend(v4, "cornerHorizontalEdgeLength");
  self->_cornerHorizontalEdgeLength = v5;
  objc_msgSend(v4, "cornerVerticalEdgeLength");
  v7 = v6;

  self->_cornerVerticalEdgeLength = v7;
}

- (void)_convertReferenceLocation:(CGPoint)a3 toOrientedLocation:(CGPoint *)a4 orientedBounds:(CGRect *)a5
{
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  id v16;

  -[SBCornerPencilPanGestureRecognizer view](self, "view");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[SBCornerPencilPanGestureRecognizer _touchInterfaceOrientation](self, "_touchInterfaceOrientation");
  objc_msgSend(v16, "bounds");
  _UIWindowConvertPointFromOrientationToOrientation();
  v9 = v8;
  v11 = v10;
  _UIWindowConvertRectFromOrientationToOrientation();
  if (a4)
  {
    a4->x = v9;
    a4->y = v11;
  }
  if (a5)
  {
    a5->origin.x = v12;
    a5->origin.y = v13;
    a5->size.width = v14;
    a5->size.height = v15;
  }

}

- (UIOffset)_edgeOffsets
{
  double cornerHorizontalEdgeLength;
  double cornerVerticalEdgeLength;
  UIOffset result;

  cornerHorizontalEdgeLength = self->_cornerHorizontalEdgeLength;
  cornerVerticalEdgeLength = self->_cornerVerticalEdgeLength;
  result.vertical = cornerVerticalEdgeLength;
  result.horizontal = cornerHorizontalEdgeLength;
  return result;
}

- (BOOL)_isOrientedLocation:(CGPoint)a3 inCorner:(unint64_t)a4 forOrientedBounds:(CGRect)a5 withEdgeOffsets:(UIOffset)a6
{
  BOOL result;
  double vertical;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v12;
  double v13;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  result = 0;
  vertical = a6.vertical;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = a3.y;
  v13 = a3.x;
  switch(a4)
  {
    case 1uLL:
      if (a3.x > a6.horizontal + CGRectGetMinX(a5))
        return 0;
      v16.origin.x = x;
      v16.origin.y = y;
      v16.size.width = width;
      v16.size.height = height;
      if (v13 < CGRectGetMinX(v16) || v12 > vertical)
        return 0;
      goto LABEL_17;
    case 2uLL:
      if (a3.x < CGRectGetMaxX(a5) - a6.horizontal)
        return 0;
      v18.origin.x = x;
      v18.origin.y = y;
      v18.size.width = width;
      v18.size.height = height;
      if (v13 > CGRectGetMaxX(v18) || v12 > vertical)
        return 0;
LABEL_17:
      v19.origin.x = x;
      v19.origin.y = y;
      v19.size.width = width;
      v19.size.height = height;
      return v12 >= CGRectGetMinY(v19);
    case 4uLL:
      if (a3.x > a6.horizontal + CGRectGetMinX(a5))
        return 0;
      v17.origin.x = x;
      v17.origin.y = y;
      v17.size.width = width;
      v17.size.height = height;
      if (v13 < CGRectGetMinX(v17))
        return 0;
      goto LABEL_20;
    case 8uLL:
      if (a3.x < CGRectGetMaxX(a5) - a6.horizontal)
        return 0;
      v20.origin.x = x;
      v20.origin.y = y;
      v20.size.width = width;
      v20.size.height = height;
      if (v13 > CGRectGetMaxX(v20))
        return 0;
LABEL_20:
      v21.origin.x = x;
      v21.origin.y = y;
      v21.size.width = width;
      v21.size.height = height;
      if (v12 < CGRectGetMaxY(v21) - vertical)
        return 0;
      v22.origin.x = x;
      v22.origin.y = y;
      v22.size.width = width;
      v22.size.height = height;
      return v12 <= CGRectGetMaxY(v22);
    default:
      return result;
  }
}

- (unint64_t)corner
{
  return self->_corner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchHistory, 0);
}

@end
