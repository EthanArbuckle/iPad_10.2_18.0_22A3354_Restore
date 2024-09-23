@implementation SBCornerFingerPanGestureRecognizer

- (SBCornerFingerPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4 corner:(unint64_t)a5 classifier:(id)a6
{
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  SBCornerFingerPanGestureRecognizer *v17;
  SBTouchHistory *v18;
  SBTouchHistory *touchHistory;
  unint64_t v20;
  uint64_t v21;
  objc_super v23;
  objc_super v24;

  v11 = a6;
  v12 = (void *)MEMORY[0x1E0D01800];
  v13 = a3;
  objc_msgSend(v12, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "homeButtonType");

  if (v15 == 2)
    v16 = 5;
  else
    v16 = 3;
  v24.receiver = self;
  v24.super_class = (Class)SBCornerFingerPanGestureRecognizer;
  v17 = -[SBScreenEdgePanGestureRecognizer initWithTarget:action:type:options:](&v24, sel_initWithTarget_action_type_options_, v13, a4, v16, 0);

  if (v17)
  {
    v18 = objc_alloc_init(SBTouchHistory);
    touchHistory = v17->_touchHistory;
    v17->_touchHistory = v18;

    v17->_corner = a5;
    objc_storeStrong((id *)&v17->_classifier, a6);
    -[SBCornerFingerPanGestureRecognizer setMaximumNumberOfTouches:](v17, "setMaximumNumberOfTouches:", 1);
    -[SBCornerFingerPanGestureRecognizer setAllowedTouchTypes:](v17, "setAllowedTouchTypes:", &unk_1E91CF5B0);
    v20 = v17->_corner - 1;
    if (v20 > 7)
      v21 = 0;
    else
      v21 = qword_1D0E8BFC8[v20];
    v23.receiver = v17;
    v23.super_class = (Class)SBCornerFingerPanGestureRecognizer;
    -[UIScreenEdgePanGestureRecognizer setEdges:](&v23, sel_setEdges_, v21);
  }

  return v17;
}

- (BOOL)_shouldBegin
{
  double MinY;
  double MaxX;
  _BOOL4 v6;
  const __CFString *v7;
  void *v8;
  double MinX;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  long double v16;
  long double v17;
  double i;
  double j;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _QWORD v27[5];
  __CFString *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  CGRect v33;
  double v34;
  double v35;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)SBCornerFingerPanGestureRecognizer;
  if (-[SBCornerFingerPanGestureRecognizer _shouldBegin](&v36, sel__shouldBegin))
  {
    v34 = 0.0;
    v35 = 0.0;
    memset(&v33, 0, sizeof(v33));
    -[SBCornerFingerPanGestureRecognizer _convertReferenceLocation:toOrientedLocation:orientedBounds:](self, "_convertReferenceLocation:toOrientedLocation:orientedBounds:", &v34, &v33, self->_firstTouchReferenceLocation.x, self->_firstTouchReferenceLocation.y);
    switch(self->_corner)
    {
      case 1uLL:
        MaxX = *MEMORY[0x1E0C9D538];
        MinY = *(double *)(MEMORY[0x1E0C9D538] + 8);
        break;
      case 2uLL:
        MaxX = CGRectGetMaxX(v33);
        MinY = CGRectGetMinY(v33);
        break;
      case 4uLL:
        MinX = CGRectGetMinX(v33);
        goto LABEL_9;
      case 8uLL:
        MinX = CGRectGetMaxX(v33);
LABEL_9:
        MaxX = MinX;
        MinY = CGRectGetMaxY(v33);
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCornerFingerPanGestureRecognizer.m"), 184, CFSTR("_corner incorrectly configured"));

        MinY = 0.0;
        MaxX = 0.0;
        break;
    }
    v10 = vabdd_f64(v34, MaxX);
    v11 = vabdd_f64(v35, MinY);
    if (v10 >= v11)
      v12 = v10;
    else
      v12 = v11;
    v13 = SBMainScreenPointsPerMillimeter();
    -[SBTouchHistory averageTouchVelocityOverTimeDuration:](self->_touchHistory, "averageTouchVelocityOverTimeDuration:", 0.0416666667);
    -[SBCornerFingerPanGestureRecognizer _convertReferenceVector:toCorner:orientation:](self, "_convertReferenceVector:toCorner:orientation:", self->_corner, -[SBCornerFingerPanGestureRecognizer _touchInterfaceOrientation](self, "_touchInterfaceOrientation"), v14, v15);
    for (i = atan2(v17, v16) / 0.0174532925 + -45.0; i < -180.0; i = i + 360.0)
      ;
    for (j = v12 / v13; i > 180.0; i = i + -360.0)
      ;
    v6 = -[SBCornerFingerGestureClassifier classifySwipeWithOffsettedAngle:distanceToCorner:portrait:](self->_classifier, "classifySwipeWithOffsettedAngle:distanceToCorner:portrait:", (unint64_t)(-[SBCornerFingerPanGestureRecognizer _touchInterfaceOrientation](self, "_touchInterfaceOrientation")- 1) < 2, i, j);
    if (v6)
      v7 = 0;
    else
      v7 = CFSTR("rejected by classifier");
  }
  else
  {
    LOBYTE(v6) = 0;
    v7 = CFSTR("rejected by super");
  }
  v20 = -[UIScreenEdgePanGestureRecognizer touchedEdges](self, "touchedEdges");
  -[SBTouchHistory averageTouchVelocityOverTimeDuration:](self->_touchHistory, "averageTouchVelocityOverTimeDuration:", 0.0416666667);
  v22 = v21;
  v24 = v23;
  objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __50__SBCornerFingerPanGestureRecognizer__shouldBegin__block_invoke;
  v27[3] = &unk_1E8EC18C8;
  v32 = v6;
  v27[4] = self;
  v28 = (__CFString *)v7;
  v29 = v20;
  v30 = v22;
  v31 = v24;
  objc_msgSend(v25, "logBlock:", v27);

  return v6;
}

id __50__SBCornerFingerPanGestureRecognizer__shouldBegin__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[7];
  _QWORD v20[7];
  const __CFString *v21;
  _QWORD v22[3];

  v22[1] = *MEMORY[0x1E0C80C00];
  v21 = CFSTR("[SBCornerFingerPanGestureRecognizer _shouldBegin]");
  v19[0] = CFSTR("shouldBegin");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 72));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  v19[1] = CFSTR("address");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v2;
  v19[2] = CFSTR("name");
  objc_msgSend(*(id *)(a1 + 32), "name");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &stru_1E8EC7EC0;
  if (v3)
    v6 = (const __CFString *)v3;
  else
    v6 = &stru_1E8EC7EC0;
  v7 = *(_QWORD *)(a1 + 48);
  if (*(_QWORD *)(a1 + 40))
    v5 = *(const __CFString **)(a1 + 40);
  v20[2] = v6;
  v20[3] = v5;
  v19[3] = CFSTR("failureReason");
  v19[4] = CFSTR("touchedEdges");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v8;
  v19[5] = CFSTR("touchVector");
  v17[0] = CFSTR("x");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = CFSTR("y");
  v18[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[5] = v11;
  v19[6] = CFSTR("corner");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[6] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
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

  -[SBCornerFingerPanGestureRecognizer view](self, "view");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[SBCornerFingerPanGestureRecognizer _touchInterfaceOrientation](self, "_touchInterfaceOrientation");
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

- (CGVector)_convertReferenceVector:(CGVector)a3 toCorner:(unint64_t)a4 orientation:(int64_t)a5
{
  CGFloat dy;
  double dx;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  CGVector result;

  dy = a3.dy;
  dx = a3.dx;
  v9 = a3.dy;
  switch(a5)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCornerFingerPanGestureRecognizer.m"), 285, CFSTR("dealing with unknown orientation"));

      goto LABEL_3;
    case 1:
      break;
    case 2:
      dx = -a3.dx;
      v9 = -a3.dy;
      break;
    case 3:
      v9 = -a3.dx;
      dx = a3.dy;
      break;
    case 4:
      v9 = a3.dx;
      dx = -a3.dy;
      break;
    default:
LABEL_3:
      v9 = dy;
      break;
  }
  switch(self->_corner)
  {
    case 1uLL:
      break;
    case 2uLL:
      dx = -dx;
      break;
    case 4uLL:
      goto LABEL_11;
    case 8uLL:
      dx = -dx;
LABEL_11:
      v9 = -v9;
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCornerFingerPanGestureRecognizer.m"), 304, CFSTR("_corner incorrectly configured"));

      break;
  }
  v12 = dx;
  v13 = v9;
  result.dy = v13;
  result.dx = v12;
  return result;
}

- (int64_t)_touchInterfaceOrientation
{
  int64_t result;
  objc_super v4;

  result = self->_touchInterfaceOrientationWhenGestureBegan;
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)SBCornerFingerPanGestureRecognizer;
    return -[SBScreenEdgePanGestureRecognizer _touchInterfaceOrientation](&v4, sel__touchInterfaceOrientation);
  }
  return result;
}

- (unint64_t)edges
{
  unint64_t v2;

  v2 = self->_corner - 1;
  if (v2 > 7)
    return 0;
  else
    return qword_1D0E8BFC8[v2];
}

- (void)setEdges:(unint64_t)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCornerFingerPanGestureRecognizer.m"), 326, CFSTR("edges are readonly"));

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v7;
  id v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  void *v13;
  objc_super v14;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "anyObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "locationInView:", 0);
  self->_firstTouchReferenceLocation.x = v10;
  self->_firstTouchReferenceLocation.y = v11;
  objc_msgSend(v7, "coalescedTouchesForTouch:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _SBUpdateTouchHistoryWithCoalescedTouches(self->_touchHistory, v12, self, 0, 0);
  _SBLogCoalescedTouchesForGestureAndView_1(v12, self);
  NSStringFromSelector(a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCornerFingerPanGestureRecognizer _SBLogTouchesWithMethodName:withMethodName:](self, "_SBLogTouchesWithMethodName:withMethodName:", v8, v13);

  v14.receiver = self;
  v14.super_class = (Class)SBCornerFingerPanGestureRecognizer;
  -[UIScreenEdgePanGestureRecognizer touchesBegan:withEvent:](&v14, sel_touchesBegan_withEvent_, v8, v7);

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
  _SBLogCoalescedTouchesForGestureAndView_1(v10, self);
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCornerFingerPanGestureRecognizer _SBLogTouchesWithMethodName:withMethodName:](self, "_SBLogTouchesWithMethodName:withMethodName:", v8, v11);

  v12.receiver = self;
  v12.super_class = (Class)SBCornerFingerPanGestureRecognizer;
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
  _SBLogCoalescedTouchesForGestureAndView_1(v10, self);
  NSStringFromSelector(a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCornerFingerPanGestureRecognizer _SBLogTouchesWithMethodName:withMethodName:](self, "_SBLogTouchesWithMethodName:withMethodName:", v8, v11);

  v12.receiver = self;
  v12.super_class = (Class)SBCornerFingerPanGestureRecognizer;
  -[UIScreenEdgePanGestureRecognizer touchesEnded:withEvent:](&v12, sel_touchesEnded_withEvent_, v8, v7);

}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBCornerFingerPanGestureRecognizer;
  -[UIScreenEdgePanGestureRecognizer reset](&v3, sel_reset);
  self->_touchInterfaceOrientationWhenGestureBegan = 0;
  self->_firstTouchReferenceLocation = (CGPoint)*MEMORY[0x1E0C9D538];
  -[SBTouchHistory reset](self->_touchHistory, "reset");
}

- (void)setState:(int64_t)a3
{
  void *v5;
  objc_super v6;
  _QWORD v7[6];

  if (a3 == 1)
    self->_touchInterfaceOrientationWhenGestureBegan = -[SBCornerFingerPanGestureRecognizer _touchInterfaceOrientation](self, "_touchInterfaceOrientation");
  objc_msgSend(MEMORY[0x1E0DAFEC0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__SBCornerFingerPanGestureRecognizer_setState___block_invoke;
  v7[3] = &unk_1E8EAF208;
  v7[4] = self;
  v7[5] = a3;
  objc_msgSend(v5, "logBlock:", v7);

  v6.receiver = self;
  v6.super_class = (Class)SBCornerFingerPanGestureRecognizer;
  -[SBCornerFingerPanGestureRecognizer setState:](&v6, sel_setState_, a3);
}

id __47__SBCornerFingerPanGestureRecognizer_setState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[4];
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = CFSTR("[SBCornerFingerPanGestureRecognizer setState:]");
  v11[0] = CFSTR("state");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v2;
  v11[1] = CFSTR("address");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v3;
  v11[2] = CFSTR("name");
  objc_msgSend(*(id *)(a1 + 32), "name");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_1E8EC7EC0;
  if (v4)
    v6 = (const __CFString *)v4;
  v12[2] = v6;
  v11[3] = CFSTR("corner");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 528));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
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
  SBCornerFingerPanGestureRecognizer *v13;
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
    v11[2] = __81__SBCornerFingerPanGestureRecognizer__SBLogTouchesWithMethodName_withMethodName___block_invoke;
    v11[3] = &unk_1E8EAE6B8;
    v12 = v10;
    v13 = self;
    v14 = v6;
    objc_msgSend(v9, "logBlock:", v11);

  }
}

id __81__SBCornerFingerPanGestureRecognizer__SBLogTouchesWithMethodName_withMethodName___block_invoke(uint64_t a1)
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
        v17 = &unk_1E91D23D8;
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

- (unint64_t)corner
{
  return self->_corner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classifier, 0);
  objc_storeStrong((id *)&self->_touchHistory, 0);
}

@end
