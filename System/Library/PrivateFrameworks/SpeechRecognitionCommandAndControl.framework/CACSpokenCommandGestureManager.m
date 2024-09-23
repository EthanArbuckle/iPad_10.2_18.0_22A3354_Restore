@implementation CACSpokenCommandGestureManager

- (CACSpokenCommandGestureManager)initWithDisplayID:(unsigned int)a3
{
  CACSpokenCommandGestureManager *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CACSpokenCommandGestureManager;
  result = -[CACSpokenCommandGestureManager init](&v5, sel_init);
  if (result)
    result->_displayID = a3;
  return result;
}

+ (void)initializeSharedManagerTable
{
  if (initializeSharedManagerTable_onceToken != -1)
    dispatch_once(&initializeSharedManagerTable_onceToken, &__block_literal_global_11);
}

void __62__CACSpokenCommandGestureManager_initializeSharedManagerTable__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_sharedManagerTable;
  _sharedManagerTable = v0;

}

+ (id)carScreenGestureManager
{
  void *v2;
  uint64_t v3;
  void *v4;

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "carPlayDisplayID");

  if ((_DWORD)v3)
  {
    +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)mainScreenGestureManager
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CACSpokenCommandGestureManager managerForDisplayID:](CACSpokenCommandGestureManager, "managerForDisplayID:", objc_msgSend(v2, "_integerDisplayID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)allManagers
{
  id v2;
  void *v3;

  objc_msgSend(a1, "initializeSharedManagerTable");
  v2 = (id)_sharedManagerTable;
  objc_sync_enter(v2);
  objc_msgSend((id)_sharedManagerTable, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

+ (id)defaultGestureManager
{
  void *v3;
  int v4;

  +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "carPlayConnected");

  if (v4)
    objc_msgSend(a1, "carScreenGestureManager");
  else
    objc_msgSend(a1, "mainScreenGestureManager");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)managerForDisplayID:(unsigned int)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  CACSpokenCommandGestureManager *v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v3 = *(_QWORD *)&a3;
    objc_msgSend(a1, "initializeSharedManagerTable");
    v4 = (id)_sharedManagerTable;
    objc_sync_enter(v4);
    v5 = (void *)_sharedManagerTable;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (CACSpokenCommandGestureManager *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v7 = -[CACSpokenCommandGestureManager initWithDisplayID:]([CACSpokenCommandGestureManager alloc], "initWithDisplayID:", v3);
      v8 = (void *)_sharedManagerTable;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v7, v9);

    }
    objc_sync_exit(v4);

  }
  else
  {
    objc_msgSend(a1, "defaultGestureManager");
    v7 = (CACSpokenCommandGestureManager *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (AXPIFingerController)fingerController
{
  AXPIFingerController *fingerController;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  AXPIFingerController *v11;
  AXPIFingerController *v12;
  void *v13;

  fingerController = self->_fingerController;
  if (!fingerController)
  {
    +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "overlayViewForDisplayID:", self->_displayID);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_alloc(MEMORY[0x24BDFF598]);
    objc_msgSend(v5, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "screen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hardwareIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (AXPIFingerController *)objc_msgSend(v6, "initWithDisplayUUID:", v10);
    v12 = self->_fingerController;
    self->_fingerController = v11;

    -[AXPIFingerController fingerContainerView](self->_fingerController, "fingerContainerView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    objc_msgSend(v13, "setFrame:");
    objc_msgSend(v13, "setAutoresizingMask:", 18);
    objc_msgSend(v5, "addSubview:", v13);

    fingerController = self->_fingerController;
  }
  return fingerController;
}

- (CGPoint)_fingerControllerPointForPortraitUpPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[CACSpokenCommandGestureManager fingerController](self, "fingerController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fingerContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CACViewPointFromPortraitUpPoint(v6, x, y);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)_performGesture:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CACSpokenCommandGestureManager fingerController](self, "fingerController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performGesture:", v4);

}

- (void)performPinchInGestureAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;

  y = a3.y;
  x = a3.x;
  -[CACSpokenCommandGestureManager fingerController](self, "fingerController");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BE00680];
  -[CACSpokenCommandGestureManager _pointForGestureGivenPortraitUpPoint:](self, "_pointForGestureGivenPortraitUpPoint:", x, y);
  v8 = v7;
  v10 = v9;
  -[CACSpokenCommandGestureManager fingerController](self, "fingerController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fingerContainerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  objc_msgSend(v6, "pinchInGestureWithPoint:bounds:", v8, v10, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "performGesture:", v17);

}

- (void)performPinchOutGestureAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;

  y = a3.y;
  x = a3.x;
  -[CACSpokenCommandGestureManager fingerController](self, "fingerController");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BE00680];
  -[CACSpokenCommandGestureManager _pointForGestureGivenPortraitUpPoint:](self, "_pointForGestureGivenPortraitUpPoint:", x, y);
  v8 = v7;
  v10 = v9;
  -[CACSpokenCommandGestureManager fingerController](self, "fingerController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fingerContainerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  objc_msgSend(v6, "pinchOutGestureWithPoint:bounds:", v8, v10, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "performGesture:", v17);

}

- (void)performRotateRightGestureAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;

  y = a3.y;
  x = a3.x;
  -[CACSpokenCommandGestureManager fingerController](self, "fingerController");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BE00680];
  -[CACSpokenCommandGestureManager _pointForGestureGivenPortraitUpPoint:](self, "_pointForGestureGivenPortraitUpPoint:", x, y);
  v8 = v7;
  v10 = v9;
  -[CACSpokenCommandGestureManager fingerController](self, "fingerController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fingerContainerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  objc_msgSend(v6, "rotateRightGestureWithPoint:bounds:", v8, v10, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "performGesture:", v17);

}

- (void)performRotateLeftGestureAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;

  y = a3.y;
  x = a3.x;
  -[CACSpokenCommandGestureManager fingerController](self, "fingerController");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BE00680];
  -[CACSpokenCommandGestureManager _pointForGestureGivenPortraitUpPoint:](self, "_pointForGestureGivenPortraitUpPoint:", x, y);
  v8 = v7;
  v10 = v9;
  -[CACSpokenCommandGestureManager fingerController](self, "fingerController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fingerContainerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  objc_msgSend(v6, "rotateLeftGestureWithPoint:bounds:", v8, v10, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "performGesture:", v17);

}

- (CGPoint)_pointForGestureGivenPortraitUpPoint:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[CACSpokenCommandGestureManager _pointForGestureGivenPortraitUpPoint:shouldToggleSelectionOptions:](self, "_pointForGestureGivenPortraitUpPoint:shouldToggleSelectionOptions:", 0, a3.x, a3.y);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)_pointForGestureGivenPortraitUpPoint:(CGPoint)a3 shouldToggleSelectionOptions:(BOOL)a4
{
  double y;
  double x;
  CACSpokenCommandGestureManager *v6;
  double v7;
  double v8;
  void *v10;
  void *v11;
  uint64_t v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat width;
  CGFloat height;
  BOOL v17;
  double v18;
  double v19;
  double v21;
  double v22;
  double v23;
  double v24;
  CGPoint result;
  CGRect v26;
  CGRect v27;

  y = a3.y;
  x = a3.x;
  v6 = self;
  v7 = *MEMORY[0x24BDBEFB0];
  v8 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  if (a3.x != *MEMORY[0x24BDBEFB0] || a3.y != v8)
    goto LABEL_20;
  if (a4)
  {
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "focusedElement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = objc_msgSend(v11, "selectedTextRange");
      if (v12 != 0x7FFFFFFF)
      {
        objc_msgSend(v11, "boundsForTextRange:", v12, 0);
        v13 = v26.origin.x;
        v14 = v26.origin.y;
        width = v26.size.width;
        height = v26.size.height;
        v17 = CGRectEqualToRect(v26, *MEMORY[0x24BDBF090]);
        x = *MEMORY[0x24BDBF070];
        y = *(double *)(MEMORY[0x24BDBF070] + 8);
        if (v17
          || (v27.origin.x = v13,
              v27.origin.y = v14,
              v27.size.width = width,
              v27.size.height = height,
              CGRectEqualToRect(v27, *MEMORY[0x24BDBF070])))
        {
          objc_msgSend(v11, "performAction:", 2057);
        }
        else
        {
          AX_CGRectGetCenter();
          -[CACSpokenCommandGestureManager _fingerControllerPointForPortraitUpPoint:](v6, "_fingerControllerPointForPortraitUpPoint:");
          x = v18;
          y = v19;
        }
      }
    }

  }
  if (x == v7 && y == v8)
  {
    -[CACSpokenCommandGestureManager defaultPortraitUpPointForGestures](v6, "defaultPortraitUpPointForGestures");
    self = v6;
LABEL_20:
    -[CACSpokenCommandGestureManager _fingerControllerPointForPortraitUpPoint:](self, "_fingerControllerPointForPortraitUpPoint:", a4);
    x = v21;
    y = v22;
  }
  v23 = x;
  v24 = y;
  result.y = v24;
  result.x = v23;
  return result;
}

- (void)performSwipeGestureAtPoint:(CGPoint)a3 inDirection:(int64_t)a4 fast:(BOOL)a5 numberOfFingers:(unint64_t)a6
{
  _BOOL4 v7;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __double2 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double Width;
  double Height;
  double v41;
  double v42;
  void *v43;
  double v44;
  void *v45;
  _QWORD v46[2];
  _QWORD v47[3];
  CGPoint v48;
  CGPoint v49;
  CGPoint v50;
  CGPoint v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v7 = a5;
  v47[2] = *MEMORY[0x24BDAC8D0];
  -[CACSpokenCommandGestureManager _pointForGestureGivenPortraitUpPoint:](self, "_pointForGestureGivenPortraitUpPoint:", a3.x, a3.y);
  v11 = v10;
  v13 = v12;
  if (!v7)
  {
    -[CACSpokenCommandGestureManager fingerController](self, "fingerController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "fingerContainerView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bounds");
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;

    v52.origin.x = v32;
    v52.origin.y = v34;
    v52.size.width = v36;
    v52.size.height = v38;
    Width = CGRectGetWidth(v52);
    v53.origin.x = v32;
    v53.origin.y = v34;
    v53.size.width = v36;
    v53.size.height = v38;
    Height = CGRectGetHeight(v53);
    if (Width < Height)
      Height = Width;
    v41 = Height * 0.25;
    switch(a4)
    {
      case 0:
        v42 = v11 - fmin(v41, v11);
        goto LABEL_13;
      case 1:
        v54.origin.x = v32;
        v54.origin.y = v34;
        v54.size.width = v36;
        v54.size.height = v38;
        v42 = v11 + fmin(v41, CGRectGetMaxX(v54) - v11);
LABEL_13:
        v44 = v13;
        break;
      case 2:
        v44 = v13 - fmin(v41, v13);
        goto LABEL_16;
      case 3:
        v55.origin.x = v32;
        v55.origin.y = v34;
        v55.size.width = v36;
        v55.size.height = v38;
        v44 = v13 + fmin(v41, CGRectGetMaxY(v55) - v13);
LABEL_16:
        v42 = v11;
        break;
      default:
        v42 = 0.0;
        v44 = 0.0;
        break;
    }
    v45 = (void *)MEMORY[0x24BE00680];
    v50.x = v11;
    v50.y = v13;
    NSStringFromCGPoint(v50);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v23;
    v51.x = v42;
    v51.y = v44;
    NSStringFromCGPoint(v51);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0.6;
    v26 = v45;
    v27 = v25;
    goto LABEL_18;
  }
  v14 = 0.0;
  if ((unint64_t)a4 <= 3)
    v14 = dbl_229AD40D0[a4];
  -[CACSpokenCommandGestureManager fingerController](self, "fingerController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fingerContainerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17;
  v20 = v19;

  if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v21 = __sincos_stret(v14);
    v22 = (void *)MEMORY[0x24BE00680];
    v48.x = v11;
    v48.y = v13;
    NSStringFromCGPoint(v48);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v23;
    v49.x = v11 + v21.__cosval * 100.0;
    v49.y = v13 + v21.__sinval * 100.0;
    NSStringFromCGPoint(v49);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v22;
    v27 = v25;
    v28 = fmax(v18 / v20 / 0.461538462, 1.0) * 0.1;
LABEL_18:
    objc_msgSend(v26, "lineGestureBetweenPoints:duration:numberOfFingers:", v27, a6, v28);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x24BE00680], "flickGestureAtPoint:angle:numberOfFingers:", a6, v11, v13, v14);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:
  -[CACSpokenCommandGestureManager _performGesture:](self, "_performGesture:", v43);

}

- (void)performTapAtPoint:(CGPoint)a3 numberOfFingers:(unint64_t)a4
{
  double v6;
  double v7;
  id v9;

  -[CACSpokenCommandGestureManager _pointForGestureGivenPortraitUpPoint:shouldToggleSelectionOptions:](self, "_pointForGestureGivenPortraitUpPoint:shouldToggleSelectionOptions:", a4 == 1, a3.x, a3.y);
  if (v7 != *MEMORY[0x24BDBF070] || v6 != *(double *)(MEMORY[0x24BDBF070] + 8))
  {
    objc_msgSend(MEMORY[0x24BE00680], "tapGestureAtPoint:isDoubleTap:numberOfFingers:", 0, a4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[CACSpokenCommandGestureManager _performGesture:](self, "_performGesture:", v9);

  }
}

- (void)performDoubleTapAtPoint:(CGPoint)a3 numberOfFingers:(unint64_t)a4
{
  id v6;

  -[CACSpokenCommandGestureManager _pointForGestureGivenPortraitUpPoint:](self, "_pointForGestureGivenPortraitUpPoint:", a3.x, a3.y);
  objc_msgSend(MEMORY[0x24BE00680], "tapGestureAtPoint:isDoubleTap:numberOfFingers:", 1, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CACSpokenCommandGestureManager _performGesture:](self, "_performGesture:", v6);

}

- (void)performLongPressAtPoint:(CGPoint)a3 numberOfFingers:(unint64_t)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  CGPoint v25;
  void *v26;
  void *v27;
  void *v28;
  dispatch_time_t v29;
  _QWORD block[5];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  -[CACSpokenCommandGestureManager _pointForGestureGivenPortraitUpPoint:](self, "_pointForGestureGivenPortraitUpPoint:", a3.x, a3.y);
  v7 = v6;
  v9 = v8;
  v10 = (void *)MEMORY[0x24BDFF5A8];
  -[CACSpokenCommandGestureManager fingerController](self, "fingerController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fingerContainerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  objc_msgSend(v10, "defaultLocationsForNumberOfFingers:aroundPoint:withinBounds:", a4, v7, v9, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v17, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v19 = v17;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v32;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v32 != v22)
          objc_enumerationMutation(v19);
        v24 = (void *)MEMORY[0x24BDFF5A0];
        v25 = CGPointFromString((NSString *)*(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v23));
        objc_msgSend(v24, "fingerModelForLocation:", v25.x, v25.y);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v26);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v21);
  }

  -[CACSpokenCommandGestureManager fingerController](self, "fingerController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "showFingerModels:animated:startPointForAnimation:", v18, 0, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));

  -[CACSpokenCommandGestureManager fingerController](self, "fingerController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "pressFingersDownAnimated:", 1);

  v29 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__CACSpokenCommandGestureManager_performLongPressAtPoint_numberOfFingers___block_invoke;
  block[3] = &unk_24F2AA860;
  block[4] = self;
  dispatch_after(v29, MEMORY[0x24BDAC9B8], block);

}

void __74__CACSpokenCommandGestureManager_performLongPressAtPoint_numberOfFingers___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "fingerController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "liftFingersUpAnimated:", 1);

  objc_msgSend(*(id *)(a1 + 32), "fingerController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearAllFingersAnimated:endPointForAnimation:", 1, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));

}

- (BOOL)isInDragGesture
{
  CACSpokenCommandGestureManager *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[CACSpokenCommandGestureManager didStartDrag](v2, "didStartDrag");
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isIn3DTouchGesture
{
  CACSpokenCommandGestureManager *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[CACSpokenCommandGestureManager didStart3DTouch](v2, "didStart3DTouch");
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isInGesture
{
  return -[CACSpokenCommandGestureManager isInDragGesture](self, "isInDragGesture")
      || -[CACSpokenCommandGestureManager isIn3DTouchGesture](self, "isIn3DTouchGesture");
}

- (void)setDidStartDrag:(BOOL)a3
{
  id v3;

  if (self->_didStartDrag != a3)
  {
    self->_didStartDrag = a3;
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "synchronizeRecognizersWithReason:", kSRUISyncReasonGestureStateChange);

  }
}

- (void)setDidStart3DTouch:(BOOL)a3
{
  id v3;

  if (self->_didStart3DTouch != a3)
  {
    self->_didStart3DTouch = a3;
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "synchronizeRecognizersWithReason:", kSRUISyncReasonGestureStateChange);

  }
}

- (void)startDragAtPoint:(CGPoint)a3
{
  -[CACSpokenCommandGestureManager _startDragWithHold:atPoint:](self, "_startDragWithHold:atPoint:", 0, a3.x, a3.y);
}

- (void)startHoldAndDragAtPoint:(CGPoint)a3
{
  -[CACSpokenCommandGestureManager _startDragWithHold:atPoint:](self, "_startDragWithHold:atPoint:", 1, a3.x, a3.y);
}

- (void)_startDragWithHold:(BOOL)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  _BOOL8 v6;
  CACSpokenCommandGestureManager *v7;
  double v8;
  double v9;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  y = a4.y;
  x = a4.x;
  v6 = a3;
  v18[1] = *MEMORY[0x24BDAC8D0];
  v7 = self;
  objc_sync_enter(v7);
  v8 = *MEMORY[0x24BDBEFB0];
  v9 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  if (x == *MEMORY[0x24BDBEFB0] && y == v9)
  {
    -[CACSpokenCommandGestureManager defaultPortraitUpPointForGestures](v7, "defaultPortraitUpPointForGestures");
    x = v11;
    y = v12;
  }
  -[CACSpokenCommandGestureManager setDidStartDrag:](v7, "setDidStartDrag:", 1);
  -[CACSpokenCommandGestureManager setShouldHoldStartPointForDrag:](v7, "setShouldHoldStartPointForDrag:", v6);
  -[CACSpokenCommandGestureManager setStartPointForDrag:](v7, "setStartPointForDrag:", x, y);
  objc_sync_exit(v7);

  -[CACSpokenCommandGestureManager fingerController](v7, "fingerController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BDFF5A0];
  -[CACSpokenCommandGestureManager _fingerControllerPointForPortraitUpPoint:](v7, "_fingerControllerPointForPortraitUpPoint:", x, y);
  objc_msgSend(v14, "fingerModelForLocation:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "showFingerModels:animated:startPointForAnimation:", v16, 1, v8, v9);

  if (v6)
  {
    -[CACSpokenCommandGestureManager fingerController](v7, "fingerController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "pressFingersDownAnimated:", 1);

  }
}

- (void)endDragAtPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  CACSpokenCommandGestureManager *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  _QWORD v20[3];
  CGPoint v21;
  CGPoint v22;

  y = a3.y;
  x = a3.x;
  v20[2] = *MEMORY[0x24BDAC8D0];
  -[CACSpokenCommandGestureManager _clearStateFlags](self, "_clearStateFlags");
  -[CACSpokenCommandGestureManager startPointForDrag](self, "startPointForDrag");
  AX_CGPointGetDistanceToPoint();
  v7 = v6;
  v8 = self;
  objc_sync_enter(v8);
  -[CACSpokenCommandGestureManager startPointForDrag](v8, "startPointForDrag");
  v10 = v9;
  v12 = v11;
  v13 = -[CACSpokenCommandGestureManager shouldHoldStartPointForDrag](v8, "shouldHoldStartPointForDrag");
  objc_sync_exit(v8);

  v14 = (void *)MEMORY[0x24BE00680];
  -[CACSpokenCommandGestureManager _fingerControllerPointForPortraitUpPoint:](v8, "_fingerControllerPointForPortraitUpPoint:", v10, v12);
  NSStringFromCGPoint(v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v15;
  -[CACSpokenCommandGestureManager _fingerControllerPointForPortraitUpPoint:](v8, "_fingerControllerPointForPortraitUpPoint:", x, y);
  NSStringFromCGPoint(v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0.0;
  if (v13)
    v18 = 0.5;
  objc_msgSend(v14, "lineGestureBetweenPoints:duration:numberOfFingers:initialHoldDuration:", v17, 1, v7 / 140.0, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CACSpokenCommandGestureManager _performGesture:](v8, "_performGesture:", v19);

}

- (void)_adjust3DTouchToForce:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  unint64_t i;
  void *v11;
  void *v12;
  void *v13;

  -[CACSpokenCommandGestureManager fingerController](self, "fingerController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fingerModels");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "force");
  v9 = v8;

  for (i = 1; i != 11; ++i)
  {
    usleep(0xC350u);
    -[CACSpokenCommandGestureManager fingerController](self, "fingerController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fingerModels");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setForce:", v9 + (a3 - v9) * (double)i / 10.0);

  }
}

- (void)start3DTouchAtPoint:(CGPoint)a3
{
  double y;
  double x;
  CACSpokenCommandGestureManager *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  y = a3.y;
  x = a3.x;
  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = self;
  objc_sync_enter(v5);
  -[CACSpokenCommandGestureManager setDidStart3DTouch:](v5, "setDidStart3DTouch:", 1);
  -[CACSpokenCommandGestureManager setStartPointFor3DTouch:](v5, "setStartPointFor3DTouch:", x, y);
  objc_sync_exit(v5);

  -[CACSpokenCommandGestureManager _fingerControllerPointForPortraitUpPoint:](v5, "_fingerControllerPointForPortraitUpPoint:", x, y);
  v7 = v6;
  v9 = v8;
  -[CACSpokenCommandGestureManager fingerController](v5, "fingerController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDFF5A0], "fingerModelForLocation:", v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "showFingerModels:animated:startPointForAnimation:", v12, 1, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));

  -[CACSpokenCommandGestureManager fingerController](v5, "fingerController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fingerModels");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setPressed:", 1);

  AXForceTouchThresholdPeek();
  -[CACSpokenCommandGestureManager _adjust3DTouchToForce:](v5, "_adjust3DTouchToForce:");
}

- (void)reveal3DTouchActions
{
  CACSpokenCommandGestureManager *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  -[CACSpokenCommandGestureManager _clearStateFlags](self, "_clearStateFlags");
  v3 = self;
  objc_sync_enter(v3);
  -[CACSpokenCommandGestureManager startPointFor3DTouch](v3, "startPointFor3DTouch");
  -[CACSpokenCommandGestureManager _fingerControllerPointForPortraitUpPoint:](v3, "_fingerControllerPointForPortraitUpPoint:");
  v5 = v4;
  v7 = v6;
  objc_sync_exit(v3);

  -[CACSpokenCommandGestureManager fingerController](v3, "fingerController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE00680], "flickGestureAtPoint:angle:", v5, v7, -1.57079633);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__CACSpokenCommandGestureManager_reveal3DTouchActions__block_invoke;
  v10[3] = &unk_24F2AB328;
  v10[4] = v3;
  objc_msgSend(v8, "performWithoutPreparingGesture:completion:", v9, v10);

}

void __54__CACSpokenCommandGestureManager_reveal3DTouchActions__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "fingerController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "clearAllFingersAnimated:endPointForAnimation:", 1, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));

}

- (void)maximize3DTouch
{
  void *v3;
  id v4;

  -[CACSpokenCommandGestureManager _clearStateFlags](self, "_clearStateFlags");
  AXForceTouchThresholdPop();
  -[CACSpokenCommandGestureManager _adjust3DTouchToForce:](self, "_adjust3DTouchToForce:");
  -[CACSpokenCommandGestureManager fingerController](self, "fingerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "liftFingersUpAnimated:", 1);

  -[CACSpokenCommandGestureManager fingerController](self, "fingerController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearAllFingersAnimated:endPointForAnimation:", 1, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));

}

- (void)_clearStateFlags
{
  CACSpokenCommandGestureManager *obj;

  obj = self;
  objc_sync_enter(obj);
  -[CACSpokenCommandGestureManager setDidStartDrag:](obj, "setDidStartDrag:", 0);
  -[CACSpokenCommandGestureManager setDidStart3DTouch:](obj, "setDidStart3DTouch:", 0);
  -[CACSpokenCommandGestureManager setShouldHoldStartPointForDrag:](obj, "setShouldHoldStartPointForDrag:", 0);
  objc_sync_exit(obj);

}

- (void)resetState
{
  _QWORD block[5];

  -[CACSpokenCommandGestureManager _clearStateFlags](self, "_clearStateFlags");
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__CACSpokenCommandGestureManager_resetState__block_invoke;
  block[3] = &unk_24F2AA860;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __44__CACSpokenCommandGestureManager_resetState__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "fingerController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "clearAllFingersAnimated:endPointForAnimation:", 1, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));

}

- (CGPoint)defaultPortraitUpPointForGestures
{
  double x;
  double y;
  CGPoint result;

  x = self->_defaultPortraitUpPointForGestures.x;
  y = self->_defaultPortraitUpPointForGestures.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setDefaultPortraitUpPointForGestures:(CGPoint)a3
{
  self->_defaultPortraitUpPointForGestures = a3;
}

- (BOOL)didStartDrag
{
  return self->_didStartDrag;
}

- (CGPoint)startPointForDrag
{
  double x;
  double y;
  CGPoint result;

  x = self->_startPointForDrag.x;
  y = self->_startPointForDrag.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setStartPointForDrag:(CGPoint)a3
{
  self->_startPointForDrag = a3;
}

- (BOOL)shouldHoldStartPointForDrag
{
  return self->_shouldHoldStartPointForDrag;
}

- (void)setShouldHoldStartPointForDrag:(BOOL)a3
{
  self->_shouldHoldStartPointForDrag = a3;
}

- (BOOL)didStart3DTouch
{
  return self->_didStart3DTouch;
}

- (CGPoint)startPointFor3DTouch
{
  double x;
  double y;
  CGPoint result;

  x = self->_startPointFor3DTouch.x;
  y = self->_startPointFor3DTouch.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setStartPointFor3DTouch:(CGPoint)a3
{
  self->_startPointFor3DTouch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fingerController, 0);
}

@end
