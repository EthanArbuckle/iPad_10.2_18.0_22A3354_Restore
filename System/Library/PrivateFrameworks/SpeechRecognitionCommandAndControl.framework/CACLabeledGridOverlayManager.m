@implementation CACLabeledGridOverlayManager

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[CACSimpleContentViewManager setContentViewManagerDelegate:](self, "setContentViewManagerDelegate:", obj);
  }

}

- (void)showOverlayWithStartingNumber:(unint64_t)a3
{
  _QWORD v3[5];
  _QWORD v4[6];

  v3[4] = self;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __62__CACLabeledGridOverlayManager_showOverlayWithStartingNumber___block_invoke;
  v4[3] = &unk_24F2AA8D8;
  v4[4] = self;
  v4[5] = a3;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __62__CACLabeledGridOverlayManager_showOverlayWithStartingNumber___block_invoke_2;
  v3[3] = &unk_24F2AA900;
  -[CACSimpleContentViewManager showViewControllerWithCreationHandler:updateHandler:](self, "showViewControllerWithCreationHandler:updateHandler:", v4, v3);
}

CACLabeledGridOverlayViewController *__62__CACLabeledGridOverlayManager_showOverlayWithStartingNumber___block_invoke(uint64_t a1)
{
  CACLabeledGridOverlayViewController *v2;

  v2 = objc_alloc_init(CACLabeledGridOverlayViewController);
  objc_msgSend(*(id *)(a1 + 32), "resetAndDrawAtTopLevelWithStartingNumber:", *(_QWORD *)(a1 + 40));
  return v2;
}

void __62__CACLabeledGridOverlayManager_showOverlayWithStartingNumber___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsNumbersInTopLeft:", objc_msgSend(v5, "showsNumbersInTopLeftForLabeledGridOverlayManager:", *(_QWORD *)(a1 + 32)));

}

- (void)resetAndDrawAtTopLevelWithStartingNumber:(unint64_t)a3
{
  CGSize v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  -[CACLabeledGridOverlayManager setCurrentLevel:](self, "setCurrentLevel:", 0);
  v5 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
  self->_currentGridPortraitUpFrame.origin = (CGPoint)*MEMORY[0x24BDBF090];
  self->_currentGridPortraitUpFrame.size = v5;
  -[CACLabeledGridOverlayManager delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screenForLabeledGridOverlayManager:", self);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "bounds");
  *(float *)&v8 = v7;
  -[CACLabeledGridOverlayManager setMaxX:](self, "setMaxX:", v8);
  objc_msgSend(v13, "bounds");
  *(float *)&v10 = v9;
  -[CACLabeledGridOverlayManager setMaxY:](self, "setMaxY:", v10);
  objc_msgSend(v13, "scale");
  *(float *)&v11 = v11;
  -[CACLabeledGridOverlayManager setScale:](self, "setScale:", v11);
  -[CACLabeledGridOverlayManager setStartingNumber:](self, "setStartingNumber:", a3);
  -[CACLabeledGridOverlayManager delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topLevelPortraitUpRectForLabeledGridOverlayManager:", self);
  -[CACLabeledGridOverlayManager updateOverlayWithPortraitUpRect:gridContainingLabel:](self, "updateOverlayWithPortraitUpRect:gridContainingLabel:", 0);

}

- (CGPoint)portraitUpCenterPoint
{
  CGRect *p_currentGridPortraitUpFrame;
  CGFloat MidX;
  double MidY;
  double v5;
  CGPoint result;

  p_currentGridPortraitUpFrame = &self->_currentGridPortraitUpFrame;
  MidX = CGRectGetMidX(self->_currentGridPortraitUpFrame);
  MidY = CGRectGetMidY(*p_currentGridPortraitUpFrame);
  v5 = MidX;
  result.y = MidY;
  result.x = v5;
  return result;
}

- (void)startDelayedDimmingOfNumbers
{
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  dispatch_time_t v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD block[5];

  if (self->_currentLevel <= 1
    && (-[CACLabeledGridOverlayManager delegate](self, "delegate"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isAlwaysShowingLabeledGridOverlayManager:", self),
        v3,
        v4))
  {
    -[CACSimpleContentViewManager setPendingDimmingTransactionID:](self, "setPendingDimmingTransactionID:", -[CACSimpleContentViewManager pendingDimmingTransactionID](self, "pendingDimmingTransactionID") + 1);
    -[CACSimpleContentViewManager setActiveDimmingTransactionID:](self, "setActiveDimmingTransactionID:", -[CACSimpleContentViewManager pendingDimmingTransactionID](self, "pendingDimmingTransactionID"));
    v5 = MEMORY[0x24BDAC760];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __60__CACLabeledGridOverlayManager_startDelayedDimmingOfNumbers__block_invoke;
    block[3] = &unk_24F2AA860;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    -[CACLabeledGridOverlayManager delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isOverlayFadingEnabledForLabeledGridOverlayManager:", self);

    if (v7)
    {
      -[CACLabeledGridOverlayManager delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "overlayFadeDelayForLabeledGridOverlayManager:", self);
      v10 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
      v13[0] = v5;
      v13[1] = 3221225472;
      v13[2] = __60__CACLabeledGridOverlayManager_startDelayedDimmingOfNumbers__block_invoke_2;
      v13[3] = &unk_24F2AA860;
      v13[4] = self;
      v11 = (void *)MEMORY[0x24BDAC9B8];
      dispatch_after(v10, MEMORY[0x24BDAC9B8], v13);

    }
  }
  else
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __60__CACLabeledGridOverlayManager_startDelayedDimmingOfNumbers__block_invoke_4;
    v12[3] = &unk_24F2AA860;
    v12[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], v12);
  }
}

void __60__CACLabeledGridOverlayManager_startDelayedDimmingOfNumbers__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t __60__CACLabeledGridOverlayManager_startDelayedDimmingOfNumbers__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  _QWORD v4[5];

  v2 = objc_msgSend(*(id *)(a1 + 32), "activeDimmingTransactionID");
  result = objc_msgSend(*(id *)(a1 + 32), "pendingDimmingTransactionID");
  if (v2 == result)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __60__CACLabeledGridOverlayManager_startDelayedDimmingOfNumbers__block_invoke_3;
    v4[3] = &unk_24F2AA860;
    v4[4] = *(_QWORD *)(a1 + 32);
    return objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v4, 0, 1.0);
  }
  return result;
}

void __60__CACLabeledGridOverlayManager_startDelayedDimmingOfNumbers__block_invoke_3(uint64_t a1)
{
  float v2;
  double v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "overlayFadeOpacityForLabeledGridOverlayManager:", *(_QWORD *)(a1 + 32));
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v3);

}

void __60__CACLabeledGridOverlayManager_startDelayedDimmingOfNumbers__block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)stopDelayedDimmingOfNumbers
{
  void *v3;
  id v4;

  -[CACSimpleContentViewManager setPendingDimmingTransactionID:](self, "setPendingDimmingTransactionID:", -[CACSimpleContentViewManager pendingDimmingTransactionID](self, "pendingDimmingTransactionID") + 1);
  -[CACSimpleContentViewManager viewController](self, "viewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

}

- (BOOL)updateOverlayWithPortraitUpRect:(CGRect)a3 gridContainingLabel:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  BOOL v9;
  NSObject *v10;
  _QWORD block[9];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = -[CACLabeledGridOverlayManager _isNextLevelAvailable](self, "_isNextLevelAvailable", a4);
  if (v9)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __84__CACLabeledGridOverlayManager_updateOverlayWithPortraitUpRect_gridContainingLabel___block_invoke;
    block[3] = &unk_24F2AA928;
    block[4] = self;
    *(CGFloat *)&block[5] = x;
    *(CGFloat *)&block[6] = y;
    *(CGFloat *)&block[7] = width;
    *(CGFloat *)&block[8] = height;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    CACLogGrid();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[CACLabeledGridOverlayManager updateOverlayWithPortraitUpRect:gridContainingLabel:].cold.1(v10);

  }
  return v9;
}

void __84__CACLabeledGridOverlayManager_updateOverlayWithPortraitUpRect_gridContainingLabel___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "setNeedsToBeRedrawn:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setCurrentLevel:", objc_msgSend(*(id *)(a1 + 32), "currentLevel") + 1);
  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  v4 = *(double *)(a1 + 56);
  v5 = *(double *)(a1 + 64);
  if (objc_msgSend(*(id *)(a1 + 32), "currentLevel") >= 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "stopDelayedDimmingOfNumbers");
    objc_msgSend(*(id *)(a1 + 32), "bestDrilledGridRectForPortraitUpRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    v2 = v6;
    v3 = v7;
    v4 = v8;
    v5 = v9;
  }
  v10 = (double *)(*(_QWORD *)(a1 + 32) + 56);
  *v10 = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  objc_msgSend(*(id *)(a1 + 32), "_generateLabeledElementsForPortraitUpRect:", v2, v3, v4, v5);
  v11 = objc_msgSend(*(id *)(a1 + 32), "_isNextLevelAvailable") ^ 1;
  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setShowsElementsAsClickable:", v11);

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "labeledElements");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLabeledElements:", v14);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "didUpdateElementsForLabeledGridOverlayManager:", *(_QWORD *)(a1 + 32));

}

- (BOOL)_isNextLevelAvailable
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  int64_t currentLevel;
  double height;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  CACLogGrid();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromCGRect(self->_currentGridPortraitUpFrame);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_229A40000, v3, OS_LOG_TYPE_DEFAULT, "Grid size %@", (uint8_t *)&v10, 0xCu);

  }
  -[CACLabeledGridOverlayManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPressOnFirstLevelEnabledForLabeledGridOverlayManager:", self);

  currentLevel = self->_currentLevel;
  if (currentLevel >= 1 && (v6 & 1) != 0)
    return 0;
  height = self->_currentGridPortraitUpFrame.size.height;
  if (currentLevel >= 1 && height < 36.0000011 && self->_currentGridPortraitUpFrame.size.width < 36.0000011)
    return 0;
  if (height == 27.0)
    return self->_currentGridPortraitUpFrame.size.width != 27.0;
  return 1;
}

- (CGRect)bestDrilledGridRectForPortraitUpRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float v17;
  double v18;
  float v19;
  double v20;
  NSObject *v21;
  double v22;
  double v23;
  NSObject *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CACSimpleContentViewManager viewController](self, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CACViewRectFromPortraitUpRect(v9, x, y, width, height);
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[CACLabeledGridOverlayManager maxX](self, "maxX");
  v18 = v17;
  -[CACLabeledGridOverlayManager maxY](self, "maxY");
  v20 = v19;
  CACLogGrid();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    -[CACLabeledGridOverlayManager bestDrilledGridRectForPortraitUpRect:].cold.2();

  v22 = fmax(v16, 27.0);
  v23 = fmax(v14, 27.0);
  if (v10 + v23 > v18)
    v10 = v18 - v23;
  if (v12 + v22 > v20)
    v12 = v20 - v22;
  if (v10 < 0.0 || v12 < 0.0)
  {
    CACLogGrid();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[CACLabeledGridOverlayManager bestDrilledGridRectForPortraitUpRect:].cold.1();

  }
  v25 = CACPortraitUpRectFromViewRect(0, v10, v12, v23, v22);
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

+ (CGSize)gridResolutionForTopLevelWithPortraitUpRect:(CGRect)a3 desiredColumns:(unint64_t)a4 desiredRows:(unint64_t)a5 screen:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a6;
  objc_msgSend((id)objc_opt_class(), "bestGridResolutionForPortraitUpRect:desiredColumns:desiredRows:level:screen:", a4, a5, 1, v12, x, y, width, height);
  v14 = v13;
  v16 = v15;

  v17 = v14;
  v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (CGSize)bestGridResolutionForPortraitUpRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[CACLabeledGridOverlayManager currentNumberOfColumns](self, "currentNumberOfColumns");
  v9 = -[CACLabeledGridOverlayManager currentNumberOfRows](self, "currentNumberOfRows");
  if (!(v8 | v9))
  {
    -[CACLabeledGridOverlayManager delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "defaultNumberOfColumnsForLabeledGridOverlayManager:", self);

  }
  -[CACLabeledGridOverlayManager delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "screenForLabeledGridOverlayManager:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "bestGridResolutionForPortraitUpRect:desiredColumns:desiredRows:level:screen:", v8, v9, self->_currentLevel, v12, x, y, width, height);
  v14 = v13;
  v16 = v15;

  v17 = v14;
  v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

+ (CGSize)bestGridResolutionForPortraitUpRect:(CGRect)a3 desiredColumns:(unint64_t)a4 desiredRows:(unint64_t)a5 level:(unint64_t)a6 screen:(id)a7
{
  double v10;
  double v11;
  double v12;
  double v13;
  _BOOL4 v14;
  _BOOL4 v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  double v19;
  BOOL v20;
  double v21;
  BOOL v22;
  double v23;
  double v24;
  CGSize result;

  CACViewRectFromPortraitUpRect(0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v12 = v10;
  v13 = v11;
  v14 = v11 / v10 <= 0.666666667 || v11 / v10 >= 1.5;
  v15 = a4 == 0;
  if (a6 <= 1)
    LOBYTE(v14) = a5 == 0;
  else
    v15 = v14;
  v16 = a4;
  if (v10 < (double)(20 * a4))
    v16 = (unint64_t)(v10 / 20.0);
  if (v11 < (double)(20 * a5))
    a5 = (unint64_t)(v11 / 20.0);
  if (v14)
  {
    a5 = vcvtad_u64_f64(v11 / (v10 / (double)v16));
    if (v16 * a5 > 0x96)
    {
      if (!v15)
        goto LABEL_19;
      goto LABEL_17;
    }
  }
  else if (v15)
  {
    v16 = vcvtad_u64_f64(v10 / (v11 / (double)a5));
    if (a5 * v16 > 0x96)
LABEL_17:
      v16 = 0x96 / a5;
  }
  else if (a5 * v16 > 0x96)
  {
LABEL_19:
    a5 = 0x96 / v16;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v16 * a5 / 0xA + 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  +[CACLabeledBadgeView sizeOfBadgeGivenNumberOfDisplayedDigits:arrowOrientation:badgePresentation:badgeIndicator:](CACLabeledBadgeView, "sizeOfBadgeGivenNumberOfDisplayedDigits:arrowOrientation:badgePresentation:badgeIndicator:", v18, 0, 0, 0);
  if (!a4 || a6 >= 2)
  {
    v20 = v12 / (double)v16 < v19;
    v21 = v12 / v19;
    if (v20)
      v16 = (unint64_t)v21;
    if (a6 >= 2)
    {
      v22 = a5 >= 3 && v16 > 2;
      if (!v22 && (vabdd_f64(v12, v13) + 1.0) / (v12 + v13) < 0.2)
      {
        a5 = 3;
        v16 = 3;
      }
    }
  }
  v23 = (double)v16;
  v24 = (double)a5;
  result.height = v24;
  result.width = v23;
  return result;
}

+ (unint64_t)maxNumberOfRowsForDevice
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  CACPortraitUpRectFromViewRect(0, v3, v4, v5, v6);
  v8 = v7;

  v9 = v8 / 27.0;
  return vcvtms_u32_f32(v9);
}

+ (unint64_t)maxNumberOfColumnsForDevice
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  CACPortraitUpRectFromViewRect(0, v3, v4, v5, v6);
  v8 = v7;

  v9 = v8 / 27.0;
  return vcvtms_u32_f32(v9);
}

- (void)_generateLabeledElementsForPortraitUpRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CACLabeledGridOverlayManager *v23;
  uint64_t v24;
  NSMutableArray *labeledElements;
  uint64_t v26;
  uint64_t j;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t i;
  uint8_t buf[4];
  double v46;
  __int16 v47;
  double v48;
  __int16 v49;
  double v50;
  __int16 v51;
  double v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  CACViewRectFromPortraitUpRect(0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[CACLabeledGridOverlayManager bestGridResolutionForPortraitUpRect:](self, "bestGridResolutionForPortraitUpRect:", self->_currentGridPortraitUpFrame.origin.x, self->_currentGridPortraitUpFrame.origin.y, self->_currentGridPortraitUpFrame.size.width, self->_currentGridPortraitUpFrame.size.height);
  v5 = v4;
  v7 = v6;
  CACLogGrid();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (uint64_t)v5;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CACLabeledGridOverlayManager _generateLabeledElementsForPortraitUpRect:].cold.2((uint64_t)v5, v8, v10, v11, v12, v13, v14, v15);

  CACLogGrid();
  v16 = objc_claimAutoreleasedReturnValue();
  v43 = (uint64_t)v7;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[CACLabeledGridOverlayManager _generateLabeledElementsForPortraitUpRect:].cold.1(v43, v16, v17, v18, v19, v20, v21, v22);

  v23 = self;
  objc_sync_enter(v23);
  v24 = objc_opt_new();
  labeledElements = v23->_labeledElements;
  v23->_labeledElements = (NSMutableArray *)v24;

  if (v43 >= 1)
  {
    v26 = 0;
    for (i = 0; i != v43; ++i)
    {
      if (v9 >= 1)
      {
        for (j = 0; j != v9; ++j)
        {
          -[CACLabeledGridOverlayManager scale](v23, "scale");
          UIRoundToScale();
          v29 = v28;
          UIRoundToScale();
          v31 = v30;
          UIRoundToScale();
          v33 = v32;
          UIRoundToScale();
          v35 = v34;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v26 + j + -[CACLabeledGridOverlayManager startingNumber](v23, "startingNumber"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[CACLabeledGridOverlayManager delegate](v23, "delegate");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[CACSimpleContentViewManager viewController](v23, "viewController");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "view");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "labeledGridOverlayManager:elementWithTitle:rectangle:", v23, v36, CACPortraitUpRectFromViewRect(v39, v29, v31, v33, v35));
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSMutableArray addObject:](v23->_labeledElements, "addObject:", v40);
          CACLogGrid();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218752;
            v46 = v29;
            v47 = 2048;
            v48 = v31;
            v49 = 2048;
            v50 = v35;
            v51 = 2048;
            v52 = v33;
            _os_log_debug_impl(&dword_229A40000, v41, OS_LOG_TYPE_DEBUG, "element.rectangle: origin (%f, %f),size (%f, %f)", buf, 0x2Au);
          }

          CACLogGrid();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v46 = *(double *)&v36;
            _os_log_debug_impl(&dword_229A40000, v42, OS_LOG_TYPE_DEBUG, "element.label: %@", buf, 0xCu);
          }

        }
      }
      v26 += v9;
    }
  }
  objc_sync_exit(v23);

}

- (BOOL)isOverlay
{
  return 1;
}

- (void)hide
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CACLabeledGridOverlayManager;
  -[CACSimpleContentViewManager hide](&v2, sel_hide);
}

- (void)hideWithoutAnimation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CACLabeledGridOverlayManager;
  -[CACSimpleContentViewManager hideWithoutAnimation](&v2, sel_hideWithoutAnimation);
}

- (void)hideAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a3;
  v6 = a4;
  -[CACLabeledGridOverlayManager setLabeledElements:](self, "setLabeledElements:", 0);
  v7.receiver = self;
  v7.super_class = (Class)CACLabeledGridOverlayManager;
  -[CACSimpleContentViewManager hideAnimated:completion:](&v7, sel_hideAnimated_completion_, v4, v6);

}

- (BOOL)shouldZoom
{
  CACLabeledGridOverlayManager *v2;
  void *v3;

  v2 = self;
  -[CACLabeledGridOverlayManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "isZoomEnabledForGridOverlayManager:", v2);

  return (char)v2;
}

- (NSArray)labeledElements
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLabeledElements:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (int64_t)currentLevel
{
  return self->_currentLevel;
}

- (void)setCurrentLevel:(int64_t)a3
{
  self->_currentLevel = a3;
}

- (CGRect)currentGridPortraitUpFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  _QWORD v6[4];
  CGRect result;

  objc_copyStruct(v6, &self->_currentGridPortraitUpFrame, 32, 1, 0);
  v2 = *(double *)v6;
  v3 = *(double *)&v6[1];
  v4 = *(double *)&v6[2];
  v5 = *(double *)&v6[3];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setCurrentGridPortraitUpFrame:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  objc_copyStruct(&self->_currentGridPortraitUpFrame, &v3, 32, 1, 0);
}

- (CACLabeledGridOverlayManagerDelegate)delegate
{
  return (CACLabeledGridOverlayManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)needsToBeRedrawn
{
  return self->_needsToBeRedrawn;
}

- (void)setNeedsToBeRedrawn:(BOOL)a3
{
  self->_needsToBeRedrawn = a3;
}

- (int64_t)currentNumberOfColumns
{
  return self->_currentNumberOfColumns;
}

- (void)setCurrentNumberOfColumns:(int64_t)a3
{
  self->_currentNumberOfColumns = a3;
}

- (int64_t)currentNumberOfRows
{
  return self->_currentNumberOfRows;
}

- (void)setCurrentNumberOfRows:(int64_t)a3
{
  self->_currentNumberOfRows = a3;
}

- (int64_t)startingNumber
{
  return self->_startingNumber;
}

- (void)setStartingNumber:(int64_t)a3
{
  self->_startingNumber = a3;
}

- (float)maxX
{
  return self->_maxX;
}

- (void)setMaxX:(float)a3
{
  self->_maxX = a3;
}

- (float)maxY
{
  return self->_maxY;
}

- (void)setMaxY:(float)a3
{
  self->_maxY = a3;
}

- (float)scale
{
  return self->_scale;
}

- (void)setScale:(float)a3
{
  self->_scale = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_labeledElements, 0);
}

- (void)updateOverlayWithPortraitUpRect:(os_log_t)log gridContainingLabel:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_229A40000, log, OS_LOG_TYPE_DEBUG, "Next level is not available, returning", v1, 2u);
}

- (void)bestDrilledGridRectForPortraitUpRect:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_229A40000, v0, OS_LOG_TYPE_ERROR, "Grid rect's origin is off-screen! {%f, %f}", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)bestDrilledGridRectForPortraitUpRect:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_229A40000, v0, OS_LOG_TYPE_DEBUG, "maxX, maxY {%f, %f}", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)_generateLabeledElementsForPortraitUpRect:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_229A40000, a2, a3, "vertSectionsCount: %ld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_generateLabeledElementsForPortraitUpRect:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_229A40000, a2, a3, "hortSectionsCount, %ld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
