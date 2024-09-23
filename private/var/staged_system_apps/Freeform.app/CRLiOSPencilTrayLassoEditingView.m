@implementation CRLiOSPencilTrayLassoEditingView

- (CRLiOSPencilTrayLassoEditingView)initWithFrame:(CGRect)a3
{
  CRLiOSPencilTrayLassoEditingView *v3;
  CRLiOSPencilTrayLassoEditingView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLiOSPencilTrayLassoEditingView;
  v3 = -[CRLiOSPencilTrayLassoEditingView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CRLiOSPencilTrayLassoEditingView p_commonInit](v3, "p_commonInit");
  return v4;
}

- (CRLiOSPencilTrayLassoEditingView)initWithCoder:(id)a3
{
  CRLiOSPencilTrayLassoEditingView *v3;
  CRLiOSPencilTrayLassoEditingView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLiOSPencilTrayLassoEditingView;
  v3 = -[CRLiOSPencilTrayLassoEditingView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[CRLiOSPencilTrayLassoEditingView p_commonInit](v3, "p_commonInit");
  return v4;
}

- (void)p_commonInit
{
  CRLiOSPencilTrayColorWell *v3;
  CRLiOSPencilTrayColorWell *fillColorWell;
  void *v5;
  void *v6;
  CRLiOSPencilTrayColorWell *v7;
  CRLiOSPencilTrayColorWell *strokeColorWell;
  void *v9;
  void *v10;
  CRLAXZorderButton *v11;
  CRLAXZorderButton *sendBackwardButton;
  void *v13;
  UILongPressGestureRecognizer *v14;
  UILongPressGestureRecognizer *sendToBackGR;
  UILargeContentViewerInteraction *v16;
  UILargeContentViewerInteraction *largeContentViewerInteractionForSendBackwardButton;
  CRLAXZorderButton *v18;
  CRLAXZorderButton *bringForwardButton;
  void *v20;
  void *v21;
  UILongPressGestureRecognizer *v22;
  UILongPressGestureRecognizer *bringToFrontGR;
  UILargeContentViewerInteraction *v24;
  UILargeContentViewerInteraction *largeContentViewerInteractionForBringForwardButton;
  void *v26;
  id v27;

  v3 = objc_alloc_init(CRLiOSPencilTrayColorWell);
  fillColorWell = self->_fillColorWell;
  self->_fillColorWell = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Fill color"), 0, 0));
  -[CRLiOSPencilTrayColorWell setAccessibilityLabel:](self->_fillColorWell, "setAccessibilityLabel:", v6);

  -[CRLiOSPencilTrayColorWell setIsAccessibilityElement:](self->_fillColorWell, "setIsAccessibilityElement:", 1);
  -[CRLiOSPencilTrayLassoEditingView addSubview:](self, "addSubview:", self->_fillColorWell);
  v7 = objc_alloc_init(CRLiOSPencilTrayColorWell);
  strokeColorWell = self->_strokeColorWell;
  self->_strokeColorWell = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Stroke color"), 0, 0));
  -[CRLiOSPencilTrayColorWell setAccessibilityLabel:](self->_strokeColorWell, "setAccessibilityLabel:", v10);

  -[CRLiOSPencilTrayColorWell setIsAccessibilityElement:](self->_strokeColorWell, "setIsAccessibilityElement:", 1);
  -[CRLiOSPencilTrayColorWell setForStrokeColor:](self->_strokeColorWell, "setForStrokeColor:", 1);
  -[CRLiOSPencilTrayLassoEditingView addSubview:](self, "addSubview:", self->_strokeColorWell);
  v11 = (CRLAXZorderButton *)objc_claimAutoreleasedReturnValue(-[CRLiOSPencilTrayLassoEditingView p_makeZOrderButton](self, "p_makeZOrderButton"));
  sendBackwardButton = self->_sendBackwardButton;
  self->_sendBackwardButton = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Send backward"), 0, 0));

  -[CRLAXZorderButton setAccessibilityLabel:](self->_sendBackwardButton, "setAccessibilityLabel:", v27);
  -[CRLAXZorderButton setLargeContentTitle:](self->_sendBackwardButton, "setLargeContentTitle:", v27);
  v14 = (UILongPressGestureRecognizer *)objc_alloc_init((Class)UILongPressGestureRecognizer);
  sendToBackGR = self->_sendToBackGR;
  self->_sendToBackGR = v14;

  -[UILongPressGestureRecognizer setDelegate:](self->_sendToBackGR, "setDelegate:", self);
  -[CRLAXZorderButton addGestureRecognizer:](self->_sendBackwardButton, "addGestureRecognizer:", self->_sendToBackGR);
  v16 = (UILargeContentViewerInteraction *)objc_alloc_init((Class)UILargeContentViewerInteraction);
  largeContentViewerInteractionForSendBackwardButton = self->_largeContentViewerInteractionForSendBackwardButton;
  self->_largeContentViewerInteractionForSendBackwardButton = v16;

  -[CRLAXZorderButton addInteraction:](self->_sendBackwardButton, "addInteraction:", self->_largeContentViewerInteractionForSendBackwardButton);
  -[CRLiOSPencilTrayLassoEditingView addSubview:](self, "addSubview:", self->_sendBackwardButton);
  v18 = (CRLAXZorderButton *)objc_claimAutoreleasedReturnValue(-[CRLiOSPencilTrayLassoEditingView p_makeZOrderButton](self, "p_makeZOrderButton"));
  bringForwardButton = self->_bringForwardButton;
  self->_bringForwardButton = v18;

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Bring forward"), 0, 0));

  -[CRLAXZorderButton setAccessibilityLabel:](self->_bringForwardButton, "setAccessibilityLabel:", v21);
  -[CRLAXZorderButton setLargeContentTitle:](self->_bringForwardButton, "setLargeContentTitle:", v21);
  v22 = (UILongPressGestureRecognizer *)objc_alloc_init((Class)UILongPressGestureRecognizer);
  bringToFrontGR = self->_bringToFrontGR;
  self->_bringToFrontGR = v22;

  -[UILongPressGestureRecognizer setDelegate:](self->_bringToFrontGR, "setDelegate:", self);
  -[CRLAXZorderButton addGestureRecognizer:](self->_bringForwardButton, "addGestureRecognizer:", self->_bringToFrontGR);
  v24 = (UILargeContentViewerInteraction *)objc_alloc_init((Class)UILargeContentViewerInteraction);
  largeContentViewerInteractionForBringForwardButton = self->_largeContentViewerInteractionForBringForwardButton;
  self->_largeContentViewerInteractionForBringForwardButton = v24;

  -[CRLAXZorderButton addInteraction:](self->_bringForwardButton, "addInteraction:", self->_largeContentViewerInteractionForBringForwardButton);
  -[CRLiOSPencilTrayLassoEditingView addSubview:](self, "addSubview:", self->_bringForwardButton);
  -[CRLiOSPencilTrayLassoEditingView p_updateLongPressGestureDurations](self, "p_updateLongPressGestureDurations");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v26, "addObserver:selector:name:object:", self, "p_updateLongPressGestureDurations", UILargeContentViewerInteractionEnabledStatusDidChangeNotification, 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UILargeContentViewerInteractionEnabledStatusDidChangeNotification, 0);

  v4.receiver = self;
  v4.super_class = (Class)CRLiOSPencilTrayLassoEditingView;
  -[CRLiOSPencilTrayLassoEditingView dealloc](&v4, "dealloc");
}

- (id)p_makeZOrderButton
{
  CRLAXZorderButton *v3;
  void *v4;

  v3 = objc_alloc_init(CRLAXZorderButton);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPencilTrayLassoEditingView p_makeZOrderButtonConfiguration](self, "p_makeZOrderButtonConfiguration"));
  -[CRLAXZorderButton setConfiguration:](v3, "setConfiguration:", v4);

  -[CRLAXZorderButton setIsAccessibilityElement:](v3, "setIsAccessibilityElement:", 1);
  -[CRLAXZorderButton setPointerInteractionEnabled:](v3, "setPointerInteractionEnabled:", 1);
  -[CRLAXZorderButton setShowsLargeContentViewer:](v3, "setShowsLargeContentViewer:", 1);
  return v3;
}

- (id)p_makeZOrderButtonConfiguration
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration grayButtonConfiguration](UIButtonConfiguration, "grayButtonConfiguration"));
  objc_msgSend(v2, "setCornerStyle:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemFillColor](UIColor, "tertiarySystemFillColor"));
  objc_msgSend(v2, "setBaseBackgroundColor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  objc_msgSend(v2, "setBaseForegroundColor:", v4);

  return v2;
}

- (id)p_makeZOrderButtonImageForForward:(BOOL)a3 pointSize:(double)a4
{
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  v5 = CFSTR("square.2.stack.3d.bottom.filled");
  if (a3)
    v5 = CFSTR("square.2.stack.3d.top.filled");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 6, 2, a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v6, v7));

  return v8;
}

- (UIColor)selectedFillColor
{
  return -[CRLiOSPencilTrayColorWell selectedColor](self->_fillColorWell, "selectedColor");
}

- (void)setSelectedFillColor:(id)a3
{
  -[CRLiOSPencilTrayColorWell setSelectedColor:](self->_fillColorWell, "setSelectedColor:");
  -[CRLiOSPencilTrayColorWell setHidden:](self->_fillColorWell, "setHidden:", a3 == 0);
}

- (UIColor)selectedStrokeColor
{
  return -[CRLiOSPencilTrayColorWell selectedColor](self->_strokeColorWell, "selectedColor");
}

- (void)setSelectedStrokeColor:(id)a3
{
  -[CRLiOSPencilTrayColorWell setSelectedColor:](self->_strokeColorWell, "setSelectedColor:");
  -[CRLiOSPencilTrayColorWell setHidden:](self->_strokeColorWell, "setHidden:", a3 == 0);
}

- (BOOL)isSendBackwardEnabled
{
  return -[CRLAXZorderButton isEnabled](self->_sendBackwardButton, "isEnabled");
}

- (void)setSendBackwardEnabled:(BOOL)a3
{
  -[CRLAXZorderButton setEnabled:](self->_sendBackwardButton, "setEnabled:", a3);
  -[CRLAXZorderButton layoutIfNeeded](self->_sendBackwardButton, "layoutIfNeeded");
}

- (BOOL)isBringForwardEnabled
{
  return -[CRLAXZorderButton isEnabled](self->_bringForwardButton, "isEnabled");
}

- (void)setBringForwardEnabled:(BOOL)a3
{
  -[CRLAXZorderButton setEnabled:](self->_bringForwardButton, "setEnabled:", a3);
  -[CRLAXZorderButton layoutIfNeeded](self->_bringForwardButton, "layoutIfNeeded");
}

- (void)forFillColorChangeAddTarget:(id)a3 action:(SEL)a4
{
  -[CRLiOSPencilTrayColorWell addTarget:action:forControlEvents:](self->_fillColorWell, "addTarget:action:forControlEvents:", a3, a4, 4096);
}

- (void)forStrokeColorChangeAddTarget:(id)a3 action:(SEL)a4
{
  -[CRLiOSPencilTrayColorWell addTarget:action:forControlEvents:](self->_strokeColorWell, "addTarget:action:forControlEvents:", a3, a4, 4096);
}

- (void)forSendBackwardAddTarget:(id)a3 action:(SEL)a4
{
  -[CRLAXZorderButton addTarget:action:forControlEvents:](self->_sendBackwardButton, "addTarget:action:forControlEvents:", a3, a4, 64);
}

- (void)forSendToBackAddTarget:(id)a3 action:(SEL)a4
{
  UILongPressGestureRecognizer *sendToBackGR;
  id v7;
  void *v8;
  id v9;

  sendToBackGR = self->_sendToBackGR;
  v7 = a3;
  -[UILongPressGestureRecognizer addTarget:action:](sendToBackGR, "addTarget:action:", v7, a4);
  -[CRLAXZorderButton setTarget:](self->_sendBackwardButton, "setTarget:", v7);

  -[CRLAXZorderButton setAction:](self->_sendBackwardButton, "setAction:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Send to back"), 0, 0));
  -[CRLAXZorderButton setActionTitle:](self->_sendBackwardButton, "setActionTitle:", v8);

}

- (void)forBringForwardAddTarget:(id)a3 action:(SEL)a4
{
  -[CRLAXZorderButton addTarget:action:forControlEvents:](self->_bringForwardButton, "addTarget:action:forControlEvents:", a3, a4, 64);
}

- (void)forBringToFrontAddTarget:(id)a3 action:(SEL)a4
{
  UILongPressGestureRecognizer *bringToFrontGR;
  id v7;
  void *v8;
  id v9;

  bringToFrontGR = self->_bringToFrontGR;
  v7 = a3;
  -[UILongPressGestureRecognizer addTarget:action:](bringToFrontGR, "addTarget:action:", v7, a4);
  -[CRLAXZorderButton setTarget:](self->_bringForwardButton, "setTarget:", v7);

  -[CRLAXZorderButton setAction:](self->_bringForwardButton, "setAction:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Bring to front"), 0, 0));
  -[CRLAXZorderButton setActionTitle:](self->_bringForwardButton, "setActionTitle:", v8);

}

- (void)toggleFillColorPickerPresentation
{
  void *v3;
  void *v4;
  void *v5;

  if (-[CRLiOSPencilTrayColorWell isHidden](self->_fillColorWell, "isHidden"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012453C8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0DC48();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_1012453E8);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSPencilTrayLassoEditingView toggleFillColorPickerPresentation]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTrayLassoEditingView.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 237, 0, "Should not try to toggle fill color picker presentation while its color well is hidden.");

  }
  else
  {
    -[CRLiOSPencilTrayColorWell toggleColorPickerPresentation](self->_fillColorWell, "toggleColorPickerPresentation");
  }
}

- (void)toggleStrokeColorPickerPresentation
{
  void *v3;
  void *v4;
  void *v5;

  if (-[CRLiOSPencilTrayColorWell isHidden](self->_strokeColorWell, "isHidden"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101245408);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0DCCC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101245428);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSPencilTrayLassoEditingView toggleStrokeColorPickerPresentation]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/iOS/Views/CRLiOSPencilTrayLassoEditingView.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 246, 0, "Should not try to toggle stroke color picker presentation while its color well is hidden.");

  }
  else
  {
    -[CRLiOSPencilTrayColorWell toggleColorPickerPresentation](self->_strokeColorWell, "toggleColorPickerPresentation");
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  double v11;
  unint64_t v12;
  unint64_t v13;
  double v14;
  CRLiOSPencilTrayColorWell *strokeColorWell;
  CRLAXZorderButton *bringForwardButton;
  id v17;
  id v18;
  id v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  void *v25;
  CRLiOSPencilTrayColorWell *v26;
  id v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  _QWORD v38[4];

  v36.receiver = self;
  v36.super_class = (Class)CRLiOSPencilTrayLassoEditingView;
  -[CRLiOSPencilTrayLassoEditingView layoutSubviews](&v36, "layoutSubviews");
  -[CRLiOSPencilTrayLassoEditingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPencilTrayLassoEditingView traitCollection](self, "traitCollection"));
  if (objc_msgSend(v7, "userInterfaceIdiom") && objc_msgSend(v7, "horizontalSizeClass") != (id)1)
  {
    if (v4 >= v6)
      v14 = v6;
    else
      v14 = v4;
    v10 = (v14 + -12.0) * 0.5;
    v9 = 12.0;
    v11 = 0.0;
    v8 = 1;
    v13 = 2;
    v12 = 2;
  }
  else
  {
    v8 = 0;
    v9 = (v4 + -28.0 + -112.0) / 3.0;
    v10 = 28.0;
    v11 = 14.0;
    v12 = 4;
    v13 = 1;
  }
  v31 = v7;
  strokeColorWell = self->_strokeColorWell;
  v38[0] = self->_fillColorWell;
  v38[1] = strokeColorWell;
  bringForwardButton = self->_bringForwardButton;
  v38[2] = self->_sendBackwardButton;
  v38[3] = bringForwardButton;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v17 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 4));
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v18)
  {
    v19 = v18;
    v20 = (v4 - (v9 * (double)(v12 - 1) + v10 * (double)v12 + v11 * 2.0)) * 0.5;
    v21 = (v6 - (v9 * (double)(v13 - 1) + v10 * (double)v13)) * 0.5;
    v22 = *(_QWORD *)v33;
    v23 = v9 + v10;
    v24 = v20;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(v17);
        v26 = *(CRLiOSPencilTrayColorWell **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v25);
        -[CRLiOSPencilTrayColorWell setFrame:](v26, "setFrame:", v24, v21, v10, v10);
        if (v8 && v26 == self->_strokeColorWell)
        {
          v21 = v23 + v21;
          v24 = v20;
        }
        else
        {
          v24 = v23 + v24;
        }
        v25 = (char *)v25 + 1;
      }
      while (v19 != v25);
      v27 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      v19 = v27;
    }
    while (v27);
  }

  v28 = round(v10 * 0.45);
  if (v28 != self->_currentZOrderImagePoints)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPencilTrayLassoEditingView p_makeZOrderButtonImageForForward:pointSize:](self, "p_makeZOrderButtonImageForForward:pointSize:", 0, v28));
    -[CRLAXZorderButton setImage:forState:](self->_sendBackwardButton, "setImage:forState:", v29, 0);
    -[CRLAXZorderButton setLargeContentImage:](self->_sendBackwardButton, "setLargeContentImage:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPencilTrayLassoEditingView p_makeZOrderButtonImageForForward:pointSize:](self, "p_makeZOrderButtonImageForForward:pointSize:", 1, v28));
    -[CRLAXZorderButton setImage:forState:](self->_bringForwardButton, "setImage:forState:", v30, 0);
    -[CRLAXZorderButton setLargeContentImage:](self->_bringForwardButton, "setLargeContentImage:", v30);
    self->_currentZOrderImagePoints = v28;

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  UILongPressGestureRecognizer *v6;
  id v7;
  BOOL v8;
  int *v9;
  id v10;

  v6 = (UILongPressGestureRecognizer *)a3;
  v7 = a4;
  if (self->_sendToBackGR == v6)
  {
    v9 = &OBJC_IVAR___CRLiOSPencilTrayLassoEditingView__largeContentViewerInteractionForSendBackwardButton;
LABEL_6:
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v9), "gestureRecognizerForExclusionRelationship"));
    v8 = v10 == v7;

    goto LABEL_7;
  }
  if (self->_bringToFrontGR == v6)
  {
    v9 = &OBJC_IVAR___CRLiOSPencilTrayLassoEditingView__largeContentViewerInteractionForBringForwardButton;
    goto LABEL_6;
  }
  v8 = 0;
LABEL_7:

  return v8;
}

- (void)p_updateLongPressGestureDurations
{
  double v3;

  if (+[UILargeContentViewerInteraction isEnabled](UILargeContentViewerInteraction, "isEnabled"))
    v3 = 3.0;
  else
    v3 = 1.0;
  -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_sendToBackGR, "setMinimumPressDuration:", v3);
  -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_bringToFrontGR, "setMinimumPressDuration:", v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_largeContentViewerInteractionForBringForwardButton, 0);
  objc_storeStrong((id *)&self->_largeContentViewerInteractionForSendBackwardButton, 0);
  objc_storeStrong((id *)&self->_bringToFrontGR, 0);
  objc_storeStrong((id *)&self->_bringForwardButton, 0);
  objc_storeStrong((id *)&self->_sendToBackGR, 0);
  objc_storeStrong((id *)&self->_sendBackwardButton, 0);
  objc_storeStrong((id *)&self->_strokeColorWell, 0);
  objc_storeStrong((id *)&self->_fillColorWell, 0);
}

@end
