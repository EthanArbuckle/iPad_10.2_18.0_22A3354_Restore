@implementation TSWPopoverController

- (TSWPopoverController)initWithContentProvider:(id)a3
{
  TSWPopoverController *v5;
  TSWPopoverController *v6;
  TSWPopoverTheme *v7;
  objc_super v9;

  if (!a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWPopoverController initWithContentProvider:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/TSWPopoverController.m"), 98, CFSTR("invalid nil value for '%s'"), "contentProvider");
  v9.receiver = self;
  v9.super_class = (Class)TSWPopoverController;
  v5 = -[TSWPopoverController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0, 0);
  v6 = v5;
  if (v5)
  {
    if (a3)
    {
      v5->_contentProvider = (TSWPopoverControllerContentProvider *)a3;
      if (-[TSWPopoverControllerContentProvider popoverTheme](-[TSWPopoverController contentProvider](v6, "contentProvider"), "popoverTheme"))
      {
        v7 = (TSWPopoverTheme *)-[TSWPopoverControllerContentProvider popoverTheme](-[TSWPopoverController contentProvider](v6, "contentProvider"), "popoverTheme");
      }
      else
      {
        v7 = objc_alloc_init(TSWPopoverTheme);
      }
      -[TSWPopoverController p_customizeWithTheme:](v6, "p_customizeWithTheme:", v7);
      v6->_popUpInfo = (TSWPopUpInfo *)-[TSWPopoverControllerContentProvider popupInfo](-[TSWPopoverController contentProvider](v6, "contentProvider"), "popupInfo");
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_dismissGR)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWPopoverController dealloc]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/TSWPopoverController.m"), 121, CFSTR("expected nil value for '%s'"), "_dismissGR");

  -[TSWPopoverControllerContentProvider teardown](self->_contentProvider, "teardown");
  v3.receiver = self;
  v3.super_class = (Class)TSWPopoverController;
  -[TSWPopoverController dealloc](&v3, "dealloc");
}

- (void)loadView
{
  TSWClipView *v3;

  -[TSWPopoverController setView:](self, "setView:", objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height));
  v3 = [TSWClipView alloc];
  objc_msgSend(-[TSWPopoverController view](self, "view"), "bounds");
  self->_clipView = -[TSWClipView initWithFrame:](v3, "initWithFrame:");
  objc_msgSend(-[TSWPopoverController view](self, "view"), "addSubview:", self->_clipView);
  -[TSWClipView addContentView:](self->_clipView, "addContentView:", -[TSWPopoverControllerContentProvider popoverContentView](-[TSWPopoverController contentProvider](self, "contentProvider"), "popoverContentView"));
}

- (BOOL)isPopoverVisible
{
  return !-[TSWPopoverController isDismissing](self, "isDismissing")
      && objc_msgSend(-[TSWPopoverController view](self, "view"), "superview") != 0;
}

- (BOOL)shouldDismissWhileRotating:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;

  v3 = a3;
  v5 = -[TSWPopoverController isPopoverVisible](self, "isPopoverVisible");
  if (v5 && v3)
    LOBYTE(v5) = -[TSWPopoverTheme presentationMode](-[TSWPopoverController theme](self, "theme"), "presentationMode") != 1;
  return v5;
}

- (void)pFadeInIncludeScrim:(BOOL)a3
{
  _QWORD v5[5];
  _QWORD v6[5];
  BOOL v7;

  -[TSWPopoverController p_willFade](self, "p_willFade");
  objc_msgSend(-[TSWPopoverController view](self, "view"), "setAlpha:", 0.0);
  -[UIButton setAlpha:](-[TSWPopoverController closeButton](self, "closeButton"), "setAlpha:", 0.0);
  v5[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1143C0;
  v6[3] = &unk_427268;
  v6[4] = self;
  v7 = a3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_11441C;
  v5[3] = &unk_427130;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v6, v5, 0.150000006);
}

- (void)presentPopoverFromRect:(CGRect)a3 inView:(id)a4 viewBounds:(CGRect)a5 permittedArrowDirections:(unint64_t)a6 displayMode:(int)a7 animated:(BOOL)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat v13;
  CGFloat v14;
  CGFloat y;
  CGFloat x;
  id v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  double v39;
  double v40;
  double v41;
  double v42;
  __n128 v43;
  __n128 v44;
  double v45;
  double v46;
  BOOL v47;
  double v48;
  double v49;
  double v50;
  _BOOL4 v51;
  double v52;
  uint64_t v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  id v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  id v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  unint64_t v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  void *v100;
  TSWPopoverDismissGestureRecognizer *v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  CGFloat rect;
  double recta;
  double rect_8;
  double rect_8a;
  CGFloat rect_16;
  double rect_16a;
  double rect_24;
  double rect_24a;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;

  height = a5.size.height;
  width = a5.size.width;
  rect_16 = a5.origin.y;
  rect = a5.origin.x;
  v13 = a3.size.height;
  v14 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (objc_msgSend(-[TSWPopoverController view](self, "view", a4, a6, *(_QWORD *)&a7, a8), "superview")
    || self->_dismissGR)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWPopoverController presentPopoverFromRect:inView:viewBounds:permittedArrowDirections:displayMode:animated:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/TSWPopoverController.m"), 222, CFSTR("shouldn't present more than once before being dismissed"));
  }
  self->_displayMode = a7;
  if (-[TSWPopoverTheme presentationMode](-[TSWPopoverController theme](self, "theme"), "presentationMode") == 1)
  {
    v107 = v14;
    v109 = v13;
    rect_8 = width;
    rect_24 = height;
    if (self->_scrimView)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWPopoverController presentPopoverFromRect:inView:viewBounds:permittedArrowDirections:displayMode:animated:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/TSWPopoverController.m"), 229, CFSTR("shouldn't have a scrim at this point"));
    v18 = objc_alloc((Class)UIView);
    objc_msgSend(a4, "bounds");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    objc_msgSend(a4, "bounds");
    v28 = v27 * -1.414;
    objc_msgSend(a4, "bounds");
    v30 = v29 * -1.414;
    v119.origin.x = v20;
    v119.origin.y = v22;
    v119.size.width = v24;
    v119.size.height = v26;
    v120 = CGRectInset(v119, v28, v30);
    self->_scrimView = (UIView *)objc_msgSend(v18, "initWithFrame:", v120.origin.x, v120.origin.y, v120.size.width, v120.size.height);
    -[UIView setBackgroundColor:](-[TSWPopoverController scrimView](self, "scrimView"), "setBackgroundColor:", objc_msgSend(+[TSUColor blackColor](TSUColor, "blackColor"), "platformColor"));
    -[UIView setAutoresizingMask:](-[TSWPopoverController scrimView](self, "scrimView"), "setAutoresizingMask:", 18);
    -[UIView setAlpha:](-[TSWPopoverController scrimView](self, "scrimView"), "setAlpha:", 0.0);
    objc_msgSend(a4, "addSubview:", -[TSWPopoverController scrimView](self, "scrimView"));
    height = rect_24;
    width = rect_8;
    v14 = v107;
    v13 = v109;
  }
  objc_msgSend(a4, "addSubview:", -[TSWPopoverController view](self, "view"));
  objc_msgSend(objc_msgSend(-[TSWPopoverController view](self, "view"), "layer"), "setZPosition:", 3.0);
  -[TSWPopoverControllerContentProvider scale](-[TSWPopoverController contentProvider](self, "contentProvider"), "scale");
  v32 = v31 * -12.0;
  -[TSWPopoverControllerContentProvider scale](-[TSWPopoverController contentProvider](self, "contentProvider"), "scale");
  v34 = v33 * -12.0;
  v121.origin.x = x;
  v121.origin.y = y;
  v121.size.width = v14;
  v121.size.height = v13;
  v122 = CGRectInset(v121, v32, v34);
  rect_24a = v122.origin.x;
  rect_8a = v122.origin.y;
  v35 = v122.size.width;
  v36 = v122.size.height;
  v122.origin.x = rect;
  v122.origin.y = rect_16;
  v122.size.width = width;
  v122.size.height = height;
  v123 = CGRectInset(v122, 15.0, 15.0);
  v37 = v123.origin.x;
  v38 = v123.origin.y;
  v39 = v123.size.width;
  v40 = v123.size.height;
  objc_msgSend(-[TSWPopoverController view](self, "view"), "bounds");
  -[TSWPopoverController setOriginalViewSize:](self, "setOriginalViewSize:", v41, v42);
  -[TSWPopoverController originalViewSize](self, "originalViewSize");
  v45 = v43.n128_f64[0];
  v46 = v44.n128_f64[0];
  rect_16a = v39;
  v47 = v43.n128_f64[0] <= v39;
  v48 = v40;
  v110 = v38;
  recta = v37;
  if (v47 && v44.n128_f64[0] <= v40)
  {
    v49 = v36;
    v50 = v35;
    v51 = 0;
    v52 = rect_24a;
  }
  else
  {
    v49 = v36;
    v50 = v35;
    v105 = v43.n128_f64[0];
    v106 = v44.n128_f64[0];
    v108 = v40;
    v53 = TSDFitOrFillSizeInSize(0, v43, v44, rect_16a, v40);
    v54 = TSDRectWithSize(v53);
    v58 = TSDRoundedRectForMainScreen(v54, v55, v56, v57);
    v60 = v59;
    v62 = v61;
    v63 = objc_msgSend(objc_msgSend(-[TSWPopoverControllerContentProvider popoverContentController](-[TSWPopoverController contentProvider](self, "contentProvider", v58), "popoverContentController"), "mainView"), "frame");
    v66 = v65;
    v68 = v67;
    if (v60 != v69 || v62 != v64)
    {
      objc_msgSend(objc_msgSend(-[TSWPopoverControllerContentProvider popupInfo](-[TSWPopoverController contentProvider](self, "contentProvider"), "popupInfo"), "frameViewSettings"), "frameViewSize");
      if (v60 / v70 >= v62 / v71)
        v72 = v62 / v71;
      else
        v72 = v60 / v70;
      v63 = objc_msgSend(-[TSWPopoverControllerContentProvider popoverContentController](-[TSWPopoverController contentProvider](self, "contentProvider"), "popoverContentController"), "setFrame:scale:", v66, v68, v70 * v72, v71 * v72, v72);
    }
    v73 = TSDRectWithSize(v63);
    v75 = v74;
    v77 = v76;
    v78 = v62;
    v79 = v60;
    v81 = v80;
    v82 = -[TSWPopoverController view](self, "view");
    v83 = v81;
    v84 = v79;
    v46 = v78;
    objc_msgSend(v82, "setFrame:", v73, v75, v77, v83);
    v52 = rect_24a;
    v48 = v108;
    if (-[TSWPopoverTheme presentationMode](-[TSWPopoverController theme](self, "theme"), "presentationMode") == 1)
      v51 = v108 / v106 < 0.8 || rect_16a / v105 < 0.8;
    else
      v51 = 0;
    v45 = v84;
  }
  objc_msgSend(-[TSWPopoverControllerContentProvider popoverContentView](-[TSWPopoverController contentProvider](self, "contentProvider"), "popoverContentView"), "bounds");
  if (v87 < v45)
    v45 = v87;
  if (v88 < v46)
    v46 = v88;
  objc_msgSend(-[TSWPopoverControllerContentProvider popoverContentView](-[TSWPopoverController contentProvider](self, "contentProvider"), "popoverContentView"), "setBounds:", v85, v86, v45, v46);
  v89 = -[TSWPopoverController p_arrowDirectionForTargetRect:targetBounds:permittedDirections:](self, "p_arrowDirectionForTargetRect:targetBounds:permittedDirections:", a6, v52, rect_8a, v50, v49, recta, v110, rect_16a, v48);
  -[TSWPopoverController p_popoverCenterForArrowDirection:targetRect:targetBounds:](self, "p_popoverCenterForArrowDirection:targetRect:targetBounds:", v89, v52, rect_8a, v50, v49, recta, v110, rect_16a, v48);
  v91 = v90;
  objc_msgSend(-[TSWPopoverController view](self, "view"), "bounds");
  v92 = TSDRectWithCenterAndSize(v91);
  v96 = TSDRoundedRectForMainScreen(v92, v93, v94, v95);
  objc_msgSend(-[TSWPopoverController view](self, "view"), "setFrame:", v96, v97, v98, v99);
  -[TSWPopoverController boundsIncludingStroke](self, "boundsIncludingStroke");
  objc_msgSend(objc_msgSend(-[TSWPopoverController view](self, "view"), "layer"), "setShadowPath:", -[TSDBezierPath CGPath](+[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:"), "CGPath"));
  objc_msgSend(-[TSWPopoverController view](self, "view"), "convertPoint:fromView:", a4, TSDCenterOfRect(rect_24a, rect_8a, v50, v49));
  -[TSWPopoverController p_arrowBoundsForArrowDirection:targetPoint:](self, "p_arrowBoundsForArrowDirection:targetPoint:", v89);
  -[TSWPopoverController p_updateAppearanceForArrowDirection:arrowBounds:](self, "p_updateAppearanceForArrowDirection:arrowBounds:", v89);
  v100 = (void *)TSUProtocolCast(&OBJC_PROTOCOL___TSWPopoverControllerDisplayDelegate, -[TSWPopoverController contentProvider](self, "contentProvider"));
  objc_msgSend(v100, "displayModeDidChange:", self->_displayMode);
  if (v51 || -[TSWPopoverTheme presentationMode](-[TSWPopoverController theme](self, "theme"), "presentationMode") == 1)
    objc_msgSend(v100, "disableCanvasInteraction");
  v101 = -[TSWPopoverDismissGestureRecognizer initWithTarget:action:]([TSWPopoverDismissGestureRecognizer alloc], "initWithTarget:action:", self, "p_handleDismissGR:");
  self->_dismissGR = &v101->super;
  -[TSWPopoverDismissGestureRecognizer setDelegate:](v101, "setDelegate:", self);
  objc_msgSend(a4, "addGestureRecognizer:", self->_dismissGR);
  if (v51)
  {
    -[TSWPopoverController setDoubleTapGR:](self, "setDoubleTapGR:", objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "p_handleDoubleTapGR:"));
    -[UITapGestureRecognizer setNumberOfTapsRequired:](-[TSWPopoverController doubleTapGR](self, "doubleTapGR"), "setNumberOfTapsRequired:", 2);
    -[UITapGestureRecognizer setDelegate:](-[TSWPopoverController doubleTapGR](self, "doubleTapGR"), "setDelegate:", self);
    objc_msgSend(-[TSWPopoverController view](self, "view"), "addGestureRecognizer:", -[TSWPopoverController doubleTapGR](self, "doubleTapGR"));
  }
  if (-[TSWPopoverTheme presentationMode](-[TSWPopoverController theme](self, "theme"), "presentationMode") == 1)
  {
    if (self->_closeButton)
      objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWPopoverController presentPopoverFromRect:inView:viewBounds:permittedArrowDirections:displayMode:animated:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/TSWPopoverController.m"), 335, CFSTR("shouldn't have a close button at this point"));
    -[TSWPopoverController setCloseButton:](self, "setCloseButton:", +[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    -[UIButton setImage:forState:](-[TSWPopoverController closeButton](self, "closeButton"), "setImage:forState:", +[UIImage th_imageNamed:](UIImage, "th_imageNamed:", CFSTR("closebox-black_N")), 0);
    -[UIButton setImage:forState:](-[TSWPopoverController closeButton](self, "closeButton"), "setImage:forState:", +[UIImage th_imageNamed:](UIImage, "th_imageNamed:", CFSTR("closebox-black_P")), 1);
    -[UIButton addTarget:action:forControlEvents:](-[TSWPopoverController closeButton](self, "closeButton"), "addTarget:action:forControlEvents:", self, "handleClose:", 64);
    -[UIButton setFrame:](-[TSWPopoverController closeButton](self, "closeButton"), "setFrame:", 0.0, 0.0, 35.0, 35.0);
    objc_msgSend(a4, "addSubview:", -[TSWPopoverController closeButton](self, "closeButton"));
    objc_msgSend(-[TSWPopoverController view](self, "view"), "frame");
    v103 = v102 + 5.0;
    objc_msgSend(-[TSWPopoverController view](self, "view"), "frame");
    -[UIButton setCenter:](-[TSWPopoverController closeButton](self, "closeButton"), "setCenter:", v103, v104 + 5.0);
  }
  -[TSWPopoverController pFadeInIncludeScrim:](self, "pFadeInIncludeScrim:", 1);
}

- (void)handleClose:(id)a3
{
  -[TSWPopoverController dismissPopoverAnimated:](self, "dismissPopoverAnimated:", 1);
}

- (void)dismissPopoverAnimated:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  _QWORD v6[5];
  _QWORD v7[5];

  v3 = a3;
  if (-[TSWPopoverController isDismissing](self, "isDismissing"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWPopoverController dismissPopoverAnimated:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/TSWPopoverController.m"), 357, CFSTR("Dismissed the TSWPopoverController more than once."));
  -[TSWPopoverController setIsDismissing:](self, "setIsDismissing:", 1);
  -[TSWPopoverController p_willFade](self, "p_willFade");
  -[TSWPopoverControllerDelegate popoverControllerWillDismiss:](self->_delegate, "popoverControllerWillDismiss:", self);
  -[UIView removeGestureRecognizer:](-[UIGestureRecognizer view](self->_dismissGR, "view"), "removeGestureRecognizer:", self->_dismissGR);

  self->_dismissGR = 0;
  v5 = 0.150000006;
  if (!v3)
    v5 = 0.0;
  v6[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_114E0C;
  v7[3] = &unk_426DD0;
  v7[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_114E54;
  v6[3] = &unk_427130;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v7, v6, v5);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  BOOL v7;

  v7 = -[TSWPopoverController doubleTapGR](self, "doubleTapGR") == a3
    || -[TSWPopoverController dismissGR](self, "dismissGR") == a3;
  if (-[NSArray containsObject:](self->_passThroughGestureRecognizers, "containsObject:", a4))
    return (objc_opt_respondsToSelector(self->_delegate, "popoverController:shouldIgnorePassThroughGestureRecognizer:") & 1) == 0
        || (-[TSWPopoverControllerDelegate popoverController:shouldIgnorePassThroughGestureRecognizer:](self->_delegate, "popoverController:shouldIgnorePassThroughGestureRecognizer:", self, a4) & 1) == 0;
  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGPoint v27;
  CGPoint v28;
  CGRect v29;
  CGRect v30;

  if (-[TSWPopoverController doubleTapGR](self, "doubleTapGR") == a3)
    return 1;
  objc_msgSend(-[TSWPopoverController view](self, "view"), "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(a4, "locationInView:", -[TSWPopoverController view](self, "view"));
  v27.x = v14;
  v27.y = v15;
  v29.origin.x = v7;
  v29.origin.y = v9;
  v29.size.width = v11;
  v29.size.height = v13;
  if (CGRectContainsPoint(v29, v27))
    return 0;
  if (!-[TSWPopoverController closeButton](self, "closeButton"))
    return 1;
  -[UIButton bounds](-[TSWPopoverController closeButton](self, "closeButton"), "bounds");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  objc_msgSend(a4, "locationInView:", -[TSWPopoverController closeButton](self, "closeButton"));
  v28.x = v24;
  v28.y = v25;
  v30.origin.x = v17;
  v30.origin.y = v19;
  v30.size.width = v21;
  v30.size.height = v23;
  return !CGRectContainsPoint(v30, v28);
}

- (CGRect)boundsIncludingStroke
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  TSDStroke *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  objc_msgSend(-[TSWPopoverController view](self, "view"), "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[TSDStroke shouldRender](-[TSWPopoverTheme popoverStroke](-[TSWPopoverController theme](self, "theme"), "popoverStroke"), "shouldRender"))
  {
    v11 = -[TSWPopoverTheme popoverStroke](-[TSWPopoverController theme](self, "theme"), "popoverStroke");
    objc_msgSend(-[TSWPopoverController view](self, "view"), "bounds");
    -[TSDStroke boundsForPath:](v11, "boundsForPath:", +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:"));
    v4 = v12;
    v6 = v13;
    v8 = v14;
    v10 = v15;
  }
  v16 = v4;
  v17 = v6;
  v18 = v8;
  v19 = v10;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (unint64_t)p_arrowDirectionForTargetRect:(CGRect)a3 targetBounds:(CGRect)a4 permittedDirections:(unint64_t)a5
{
  char v5;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  unint64_t result;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  double MinX;
  CGFloat v30;
  double v31;
  CGFloat v32;
  CGFloat rect;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v5 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.size.height;
  v11 = a3.size.width;
  v12 = a3.origin.y;
  v13 = a3.origin.x;
  if (-[TSWPopoverTheme presentationMode](-[TSWPopoverController theme](self, "theme"), "presentationMode") == 1)
    return -1;
  v32 = width;
  rect = height;
  -[TSWPopoverControllerContentProvider scale](-[TSWPopoverController contentProvider](self, "contentProvider"), "scale");
  v31 = v16;
  v17 = v16 * 13.0;
  -[TSWPopoverController boundsIncludingStroke](self, "boundsIncludingStroke");
  v18 = -CGRectGetWidth(v34);
  -[TSWPopoverController boundsIncludingStroke](self, "boundsIncludingStroke");
  v19 = -CGRectGetHeight(v35);
  v36.origin.x = v13;
  v36.origin.y = v12;
  v36.size.width = v11;
  v36.size.height = v10;
  v37 = CGRectInset(v36, v18, v19);
  v20 = v37.origin.x;
  v21 = v37.origin.y;
  v22 = v37.size.width;
  v23 = v37.size.height;
  if ((v5 & 2) != 0)
  {
    v24 = CGRectGetMinY(v37) - v17;
    v38.origin.x = x;
    v38.origin.y = y;
    v38.size.width = v32;
    v38.size.height = rect;
    if (v24 >= CGRectGetMinY(v38))
      return 2;
  }
  if ((v5 & 1) == 0)
    goto LABEL_23;
  v39.origin.x = v20;
  v39.origin.y = v21;
  v39.size.width = v22;
  v39.size.height = v23;
  v25 = v17 + CGRectGetMaxY(v39);
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = v32;
  v40.size.height = rect;
  if (v25 <= CGRectGetMaxY(v40))
    return 1;
  if ((v5 & 4) == 0)
    goto LABEL_9;
LABEL_23:
  v41.origin.x = v20;
  v41.origin.y = v21;
  v41.size.width = v22;
  v41.size.height = v23;
  v26 = v17 + CGRectGetMaxX(v41);
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = v32;
  v42.size.height = rect;
  if (v26 <= CGRectGetMaxX(v42))
    return 4;
LABEL_9:
  if ((v5 & 8) == 0)
  {
    if ((v5 & 2) == 0)
      return -1;
    v27 = v32;
LABEL_17:
    v45.origin.x = v20;
    v45.origin.y = v21;
    v45.size.width = v22;
    v45.size.height = v23;
    v30 = CGRectGetMinY(v45) + v31 * 12.0;
    v46.origin.x = x;
    v46.origin.y = y;
    v46.size.width = v27;
    v46.size.height = rect;
    if (v30 >= CGRectGetMinY(v46))
      return 2;
    return -1;
  }
  v43.origin.x = v20;
  v43.origin.y = v21;
  v43.size.width = v22;
  v43.size.height = v23;
  v28 = CGRectGetMinX(v43) - v17;
  v44.origin.x = x;
  v44.origin.y = y;
  v27 = v32;
  v44.size.height = rect;
  v44.size.width = v32;
  MinX = CGRectGetMinX(v44);
  if (v28 < MinX)
    result = -1;
  else
    result = 8;
  if ((v5 & 2) != 0 && v28 < MinX)
    goto LABEL_17;
  return result;
}

- (CGRect)p_arrowBoundsForArrowDirection:(unint64_t)a3 targetPoint:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  double MaxX;
  double MaxY;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double recta;
  CGFloat rect;
  double v35;
  double v36;
  CGFloat width;
  CGFloat height;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect result;

  y = a4.y;
  x = a4.x;
  MaxX = CGRectZero.origin.x;
  MaxY = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  if (-[TSWPopoverTheme presentationMode](-[TSWPopoverController theme](self, "theme"), "presentationMode") == 1)
  {
LABEL_2:
    v10 = width;
    v11 = height;
  }
  else
  {
    v36 = MaxY;
    objc_msgSend(-[TSWPopoverController view](self, "view"), "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v35 = y;
    v19 = v18;
    -[TSWPopoverControllerContentProvider scale](-[TSWPopoverController contentProvider](self, "contentProvider"), "scale");
    recta = x;
    v21 = v20;
    v32 = v20 * 30.0;
    v22 = v20 * 30.0 * 0.5;
    -[TSWPopoverTheme popoverCornerRadius](-[TSWPopoverController theme](self, "theme"), "popoverCornerRadius");
    v24 = v21 * (v23 + 14.0);
    v39.origin.x = v13;
    v39.origin.y = v15;
    v39.size.width = v17;
    v39.size.height = v19;
    v25 = CGRectGetWidth(v39);
    v31 = TSUClamp(recta, v22 + v24, v25 - v22 - v24);
    v40.origin.x = v13;
    v40.origin.y = v15;
    v40.size.width = v17;
    rect = v19;
    v40.size.height = v19;
    v26 = CGRectGetHeight(v40);
    v27 = TSUClamp(v35, v22 + v24, v26 - v22 - v24);
    v28 = v21 * 13.0;
    MaxY = v36;
    MaxX = CGRectZero.origin.x;
    v10 = width;
    v11 = height;
    switch(a3)
    {
      case 1uLL:
        MaxX = v31 - v22;
        v41.origin.x = v13;
        v41.origin.y = v15;
        v41.size.width = v17;
        v41.size.height = rect;
        MaxY = CGRectGetMinY(v41) - v28;
        goto LABEL_6;
      case 2uLL:
        MaxX = v31 - v22;
        v42.origin.x = v13;
        v42.origin.y = v15;
        v42.size.width = v17;
        v42.size.height = rect;
        MaxY = CGRectGetMaxY(v42);
LABEL_6:
        v11 = v28;
        v10 = v32;
        break;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        break;
      case 4uLL:
        v43.origin.x = v13;
        v43.origin.y = v15;
        v43.size.width = v17;
        v43.size.height = rect;
        MaxX = CGRectGetMinX(v43) - v28;
        goto LABEL_9;
      case 8uLL:
        v44.origin.x = v13;
        v44.origin.y = v15;
        v44.size.width = v17;
        v44.size.height = rect;
        MaxX = CGRectGetMaxX(v44);
LABEL_9:
        MaxY = v27 - v22;
        v11 = v32;
        v10 = v28;
        break;
      default:
        MaxY = v36;
        MaxX = CGRectZero.origin.x;
        goto LABEL_2;
    }
  }
  v29 = MaxX;
  v30 = MaxY;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (CGPoint)p_popoverCenterForArrowDirection:(unint64_t)a3 targetRect:(CGRect)a4 targetBounds:(CGRect)a5
{
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double MidX;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat MidY;
  double v20;
  double v21;
  double v22;
  double MinY;
  CGFloat v24;
  CGFloat v25;
  double v26;
  double MaxY;
  double v28;
  double MaxX;
  double MinX;
  CGFloat v31;
  CGFloat v32;
  double v33;
  float v34;
  double v35;
  float v36;
  double v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat y;
  CGFloat width;
  CGFloat x;
  CGFloat height;
  CGPoint result;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;

  x = a5.origin.x;
  height = a5.size.height;
  y = a5.origin.y;
  width = a5.size.width;
  v5 = a4.size.height;
  v6 = a4.size.width;
  v7 = a4.origin.y;
  v8 = a4.origin.x;
  if (-[TSWPopoverTheme presentationMode](-[TSWPopoverController theme](self, "theme"), "presentationMode") == 1)
  {
    v53.origin.x = x;
    v53.origin.y = y;
    v53.size.width = width;
    v53.size.height = height;
    MidX = CGRectGetMidX(v53);
    v54.origin.x = x;
    v54.origin.y = y;
    v54.size.width = width;
    v54.size.height = height;
    CGRectGetMidY(v54);
  }
  else
  {
    -[TSWPopoverController boundsIncludingStroke](self, "boundsIncludingStroke");
    v13 = v12;
    v15 = v14;
    v46 = v17;
    v47 = v16;
    v55.origin.x = v8;
    v55.origin.y = v7;
    v55.size.width = v6;
    v55.size.height = v5;
    v18 = CGRectGetMidX(v55);
    v56.origin.x = v8;
    v56.origin.y = v7;
    v56.size.width = v6;
    v56.size.height = v5;
    MidY = CGRectGetMidY(v56);
    -[TSWPopoverControllerContentProvider scale](-[TSWPopoverController contentProvider](self, "contentProvider"), "scale");
    v21 = v20 * 13.0;
    switch(a3)
    {
      case 0xFFFFFFFFFFFFFFFFLL:
        v22 = v18;
        v57.origin.x = v8;
        v57.origin.y = v7;
        v57.size.width = v6;
        v57.size.height = v5;
        MinY = CGRectGetMinY(v57);
        v58.origin.x = v13;
        v58.origin.y = v15;
        v24 = v46;
        v25 = v47;
        v58.size.width = v47;
        v58.size.height = v46;
        v26 = MinY + CGRectGetHeight(v58) * -0.5;
        break;
      case 1uLL:
        v22 = v18;
        v42 = v21;
        v59.origin.x = v8;
        v59.origin.y = v7;
        v59.size.width = v6;
        v59.size.height = v5;
        MaxY = CGRectGetMaxY(v59);
        v60.origin.x = v13;
        v60.origin.y = v15;
        v24 = v46;
        v25 = v47;
        v60.size.width = v47;
        v60.size.height = v46;
        v26 = v42 + MaxY + CGRectGetHeight(v60) * 0.5;
        break;
      case 2uLL:
        v22 = v18;
        v43 = v21;
        v61.origin.x = v8;
        v61.origin.y = v7;
        v61.size.width = v6;
        v61.size.height = v5;
        v28 = CGRectGetMinY(v61);
        v62.origin.x = v13;
        v62.origin.y = v15;
        v24 = v46;
        v25 = v47;
        v62.size.width = v47;
        v62.size.height = v46;
        v26 = v28 + CGRectGetHeight(v62) * -0.5 - v43;
        break;
      case 4uLL:
        v44 = v21;
        v63.origin.x = v8;
        v63.origin.y = v7;
        v63.size.width = v6;
        v63.size.height = v5;
        MaxX = CGRectGetMaxX(v63);
        v64.origin.x = v13;
        v64.origin.y = v15;
        v24 = v46;
        v25 = v47;
        v64.size.width = v47;
        v64.size.height = v46;
        v26 = MidY;
        v22 = v44 + MaxX + CGRectGetWidth(v64) * 0.5;
        break;
      case 8uLL:
        v45 = v21;
        v65.origin.x = v8;
        v65.origin.y = v7;
        v65.size.width = v6;
        v65.size.height = v5;
        MinX = CGRectGetMinX(v65);
        v66.origin.x = v13;
        v66.origin.y = v15;
        v24 = v46;
        v25 = v47;
        v66.size.width = v47;
        v66.size.height = v46;
        v26 = MidY;
        v22 = MinX + CGRectGetWidth(v66) * -0.5 - v45;
        break;
      default:
        v26 = MidY;
        v22 = v18;
        v24 = v46;
        v25 = v47;
        break;
    }
    v67.origin.x = v13;
    v67.origin.y = v15;
    v67.size.width = v25;
    v67.size.height = v24;
    v31 = CGRectGetWidth(v67);
    v68.size.height = v24;
    v68.origin.x = v22 - v31 * 0.5;
    v32 = v68.origin.x;
    v68.origin.y = v15;
    v68.size.width = v25;
    v39 = v26 - CGRectGetHeight(v68) * 0.5;
    v69.origin.x = x;
    v69.origin.y = y;
    v69.size.width = width;
    v69.size.height = height;
    v33 = CGRectGetMinX(v69);
    v70.origin.x = v32;
    v70.origin.y = v39;
    v70.size.width = v25;
    v70.size.height = v46;
    v34 = v33 - CGRectGetMinX(v70);
    v40 = CGPointZero.x + fmaxf(v34, 0.0);
    v71.origin.x = v32;
    v71.origin.y = v39;
    v71.size.width = v25;
    v71.size.height = v46;
    v35 = CGRectGetMaxX(v71);
    v72.origin.x = x;
    v72.origin.y = y;
    v72.size.width = width;
    v72.size.height = height;
    v36 = v35 - CGRectGetMaxX(v72);
    v41 = v40 - fmaxf(v36, 0.0);
    v73.origin.x = x;
    v73.origin.y = y;
    v73.size.width = width;
    v73.size.height = height;
    CGRectGetMinY(v73);
    v74.origin.x = v32;
    v74.origin.y = v39;
    v74.size.width = v47;
    v74.size.height = v46;
    CGRectGetMinY(v74);
    v75.origin.x = v32;
    v75.origin.y = v39;
    v75.size.width = v47;
    v75.size.height = v46;
    CGRectGetMaxY(v75);
    v76.origin.x = x;
    v76.size.height = height;
    v76.origin.y = y;
    v76.size.width = width;
    CGRectGetMaxY(v76);
    MidX = v22 + v41;
  }
  v37 = TSDRoundedPoint(MidX);
  result.y = v38;
  result.x = v37;
  return result;
}

- (void)p_handleDismissGR:(id)a3
{
  if (objc_msgSend(a3, "state") == (char *)&dword_0 + 3 || objc_msgSend(a3, "state") == (char *)&dword_0 + 2)
    -[TSWPopoverController dismissPopoverAnimated:](self, "dismissPopoverAnimated:", 1);
}

- (void)p_handleDoubleTapGR:(id)a3
{
  int displayMode;

  displayMode = self->_displayMode;
  if (displayMode)
  {
    if (displayMode == 1)
      -[TSWPopoverController setDisplayMode:](self, "setDisplayMode:", 0);
  }
  else
  {
    -[TSWPopoverController setDisplayMode:](self, "setDisplayMode:", 1);
  }
}

- (void)p_willFade
{
  TSWPopoverController *v3;
  id v4;
  uint64_t v5;

  v3 = self;
  v4 = objc_msgSend(objc_msgSend(-[TSWPopoverController view](self, "view"), "layer"), "setShouldRasterize:", 1);
  objc_msgSend(objc_msgSend(-[TSWPopoverController view](self, "view"), "layer"), "setRasterizationScale:", TSUScreenScale(v4, v5));
  -[UIApplication beginIgnoringInteractionEvents](+[UIApplication sharedApplication](UIApplication, "sharedApplication"), "beginIgnoringInteractionEvents");
}

- (void)p_didFade
{
  TSWPopoverController *v3;

  objc_msgSend(objc_msgSend(-[TSWPopoverController view](self, "view"), "layer"), "setShouldRasterize:", 0);
  -[UIApplication endIgnoringInteractionEvents](+[UIApplication sharedApplication](UIApplication, "sharedApplication"), "endIgnoringInteractionEvents");
  v3 = self;
}

- (void)p_customizeWithTheme:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  id v10;
  double v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v4 = objc_msgSend(a3, "copy");
  -[TSWPopoverControllerContentProvider scale](-[TSWPopoverController contentProvider](self, "contentProvider"), "scale");
  objc_msgSend(v4, "scaleWithFactor:");
  -[TSWPopoverController setTheme:](self, "setTheme:", v4);
  objc_msgSend(objc_msgSend(-[TSWPopoverController view](self, "view"), "layer"), "setShadowColor:", -[TSUColor CGColor](-[TSWPopoverTheme popoverShadowColor](-[TSWPopoverController theme](self, "theme"), "popoverShadowColor"), "CGColor"));
  -[TSWPopoverTheme popoverShadowOffset](-[TSWPopoverController theme](self, "theme"), "popoverShadowOffset");
  objc_msgSend(objc_msgSend(-[TSWPopoverController view](self, "view"), "layer"), "setShadowOffset:", v5, v6);
  -[TSWPopoverTheme popoverShadowRadius](-[TSWPopoverController theme](self, "theme"), "popoverShadowRadius");
  objc_msgSend(objc_msgSend(-[TSWPopoverController view](self, "view"), "layer"), "setShadowRadius:", v7);
  -[TSWPopoverTheme popoverShadowOpacity](-[TSWPopoverController theme](self, "theme"), "popoverShadowOpacity");
  v9 = v8;
  v10 = objc_msgSend(-[TSWPopoverController view](self, "view"), "layer");
  *(float *)&v11 = v9;
  objc_msgSend(v10, "setShadowOpacity:", v11);
  v12 = objc_msgSend(-[TSWPopoverControllerContentProvider popoverContentView](-[TSWPopoverController contentProvider](self, "contentProvider"), "popoverContentView"), "bounds");
  TSDCeilSize(v12, v13, v14);
  -[TSWPopoverTheme popoverContentInsets](-[TSWPopoverController theme](self, "theme"), "popoverContentInsets");
  -[TSWPopoverTheme popoverContentInsets](-[TSWPopoverController theme](self, "theme"), "popoverContentInsets");
  -[TSWPopoverTheme popoverContentInsets](-[TSWPopoverController theme](self, "theme"), "popoverContentInsets");
  v15 = TSDRectWithSize(-[TSWPopoverTheme popoverContentInsets](-[TSWPopoverController theme](self, "theme"), "popoverContentInsets"));
  objc_msgSend(-[TSWPopoverController view](self, "view"), "setFrame:", v15, v16, v17, v18);
}

- (CGPath)p_newMaskPathWithBounds:(CGRect)a3 cornerRadius:(double)a4 arrowDirection:(unint64_t)a5 arrowBounds:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGPath *Mutable;
  CGFloat MinX;
  CGFloat MidX;
  double v14;
  double MinY;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat cp1x;
  CGFloat v67;
  CGFloat MaxY;
  CGFloat v69;
  CGFloat MidY;
  CGFloat MaxX;
  CGFloat v72;
  CGFloat cp1ya;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  Mutable = CGPathCreateMutable();
  v75.origin.x = x;
  v75.origin.y = y;
  v75.size.width = width;
  v75.size.height = height;
  MinX = CGRectGetMinX(v75);
  v76.origin.x = x;
  v76.origin.y = y;
  v76.size.width = width;
  v76.size.height = height;
  MidX = CGRectGetMidX(v76);
  v77.origin.x = x;
  v77.origin.y = y;
  v77.size.width = width;
  v77.size.height = height;
  MaxX = CGRectGetMaxX(v77);
  v78.origin.x = x;
  v78.origin.y = y;
  v78.size.width = width;
  v78.size.height = height;
  MidY = CGRectGetMidY(v78);
  v79.origin.x = x;
  v79.origin.y = y;
  v79.size.width = width;
  v79.size.height = height;
  MaxY = CGRectGetMaxY(v79);
  v80.origin.x = x;
  v80.origin.y = y;
  v80.size.width = width;
  v14 = a4;
  v80.size.height = height;
  MinY = CGRectGetMinY(v80);
  CGPathMoveToPoint(Mutable, 0, MinX, MinY + a4);
  v69 = MinX;
  v67 = MidX;
  CGPathAddArcToPoint(Mutable, 0, MinX, MinY, MidX, MinY, a4);
  if (a5 == 1)
  {
    v16 = CGRectGetMinX(a6);
    CGPathAddLineToPoint(Mutable, 0, v16, MinY);
    cp1x = CGRectGetMinX(a6) + 7.0;
    v17 = CGRectGetMidX(a6) + -5.0;
    v18 = CGRectGetMinY(a6);
    v19 = CGRectGetMidX(a6);
    v20 = CGRectGetMinY(a6);
    CGPathAddCurveToPoint(Mutable, 0, cp1x, MinY, v17, v18, v19, v20);
    v21 = CGRectGetMidX(a6) + 5.0;
    v22 = CGRectGetMinY(a6);
    v23 = CGRectGetMaxX(a6) + -7.0;
    v24 = CGRectGetMaxX(a6);
    v25 = v21;
    v14 = a4;
    CGPathAddCurveToPoint(Mutable, 0, v25, v22, v23, MinY, v24, MinY);
    v26 = MaxX;
    CGPathAddArcToPoint(Mutable, 0, MaxX, MinY, MaxX, MidY, a4);
    v27 = a6.size.height;
    v28 = a6.size.width;
    v29 = MidY;
LABEL_5:
    v43 = v26;
    v44 = MaxY;
    CGPathAddArcToPoint(Mutable, 0, v43, MaxY, v67, MaxY, v14);
    v45 = v69;
    goto LABEL_6;
  }
  v28 = a6.size.width;
  v27 = a6.size.height;
  v29 = MidY;
  CGPathAddArcToPoint(Mutable, 0, MaxX, MinY, MaxX, MidY, a4);
  if (a5 == 8)
  {
    v30 = CGRectGetMinY(a6);
    CGPathAddLineToPoint(Mutable, 0, MaxX, v30);
    v31 = CGRectGetMinY(a6) + 7.0;
    v32 = CGRectGetMaxX(a6);
    v33 = CGRectGetMidY(a6) + -5.0;
    v34 = CGRectGetMaxX(a6);
    v35 = CGRectGetMidY(a6);
    CGPathAddCurveToPoint(Mutable, 0, MaxX, v31, v32, v33, v34, v35);
    v36 = CGRectGetMaxX(a6);
    v37 = CGRectGetMidY(a6) + 5.0;
    v38 = CGRectGetMaxY(a6) + -7.0;
    v39 = CGRectGetMaxY(a6);
    v40 = v36;
    v14 = a4;
    v41 = v37;
    v42 = v38;
    v29 = MidY;
    v26 = MaxX;
    CGPathAddCurveToPoint(Mutable, 0, v40, v41, MaxX, v42, MaxX, v39);
    goto LABEL_5;
  }
  v44 = MaxY;
  CGPathAddArcToPoint(Mutable, 0, MaxX, MaxY, v67, MaxY, a4);
  v45 = v69;
  if (a5 == 2)
  {
    v56 = CGRectGetMaxX(a6);
    CGPathAddLineToPoint(Mutable, 0, v56, MaxY);
    v72 = CGRectGetMaxX(a6) + -7.0;
    v57 = CGRectGetMidX(a6) + 5.0;
    v58 = CGRectGetMaxY(a6);
    v59 = CGRectGetMidX(a6);
    v60 = CGRectGetMaxY(a6);
    CGPathAddCurveToPoint(Mutable, 0, v72, MaxY, v57, v58, v59, v60);
    v61 = CGRectGetMidX(a6) + -7.0;
    v62 = CGRectGetMaxY(a6);
    v63 = CGRectGetMinX(a6) + 5.0;
    v64 = CGRectGetMinX(a6);
    CGPathAddCurveToPoint(Mutable, 0, v61, v62, v63, MaxY, v64, MaxY);
    CGPathAddArcToPoint(Mutable, 0, v69, MaxY, v69, MidY, a4);
    goto LABEL_10;
  }
LABEL_6:
  CGPathAddArcToPoint(Mutable, 0, v45, v44, v45, v29, v14);
  if (a5 == 4)
  {
    v81.origin.x = a6.origin.x;
    v81.origin.y = a6.origin.y;
    v81.size.width = v28;
    v81.size.height = v27;
    v46 = CGRectGetMaxY(v81);
    CGPathAddLineToPoint(Mutable, 0, v45, v46);
    v82.origin.x = a6.origin.x;
    v82.origin.y = a6.origin.y;
    v82.size.width = v28;
    v82.size.height = v27;
    cp1ya = CGRectGetMaxY(v82) + -7.0;
    v83.origin.x = a6.origin.x;
    v83.origin.y = a6.origin.y;
    v83.size.width = v28;
    v83.size.height = v27;
    v47 = CGRectGetMinX(v83);
    v84.origin.x = a6.origin.x;
    v84.origin.y = a6.origin.y;
    v84.size.width = v28;
    v84.size.height = v27;
    v48 = CGRectGetMidY(v84) + 5.0;
    v85.origin.x = a6.origin.x;
    v85.origin.y = a6.origin.y;
    v85.size.width = v28;
    v85.size.height = v27;
    v49 = v45;
    v50 = CGRectGetMinX(v85);
    v86.origin.x = a6.origin.x;
    v86.origin.y = a6.origin.y;
    v86.size.width = v28;
    v86.size.height = v27;
    v51 = CGRectGetMidY(v86);
    CGPathAddCurveToPoint(Mutable, 0, v49, cp1ya, v47, v48, v50, v51);
    v87.origin.x = a6.origin.x;
    v87.origin.y = a6.origin.y;
    v87.size.width = v28;
    v87.size.height = v27;
    v52 = CGRectGetMinX(v87);
    v88.origin.x = a6.origin.x;
    v88.origin.y = a6.origin.y;
    v88.size.width = v28;
    v88.size.height = v27;
    v53 = CGRectGetMidY(v88) + -5.0;
    v89.origin.x = a6.origin.x;
    v89.origin.y = a6.origin.y;
    v89.size.width = v28;
    v89.size.height = v27;
    v54 = CGRectGetMinY(v89) + 7.0;
    v90.origin.x = a6.origin.x;
    v90.origin.y = a6.origin.y;
    v90.size.width = v28;
    v90.size.height = v27;
    v55 = CGRectGetMinY(v90);
    CGPathAddCurveToPoint(Mutable, 0, v52, v53, v49, v54, v49, v55);
  }
LABEL_10:
  CGPathCloseSubpath(Mutable);
  return Mutable;
}

- (void)p_updateAppearanceForArrowDirection:(unint64_t)a3 arrowBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[TSWPopoverController p_updateClipViewWithArrowDirection:arrowBounds:](self, "p_updateClipViewWithArrowDirection:arrowBounds:");
  -[TSWPopoverController p_updateBackgroundViewWithArrowDirection:arrowBounds:](self, "p_updateBackgroundViewWithArrowDirection:arrowBounds:", a3, x, y, width, height);
  -[TSWPopoverController p_updateStrokeLayerWithArrowDirection:arrowBounds:](self, "p_updateStrokeLayerWithArrowDirection:arrowBounds:", a3, x, y, width, height);
}

- (void)p_updateClipViewWithArrowDirection:(unint64_t)a3 arrowBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGPath *v24;
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
  double v36;
  id v37;
  TSWClipView *clipView;
  CGRect v39;
  CGRect v40;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  objc_msgSend(-[TSWPopoverController view](self, "view"), "bounds");
  -[TSWClipView setFrame:](self->_clipView, "setFrame:");
  -[TSWPopoverTheme popoverContentInsets](-[TSWPopoverController theme](self, "theme"), "popoverContentInsets");
  v11 = v10;
  objc_msgSend(-[TSWPopoverControllerContentProvider popoverContentView](-[TSWPopoverController contentProvider](self, "contentProvider"), "popoverContentView"), "bounds");
  v12 = v11 + CGRectGetWidth(v39) * 0.5;
  -[TSWPopoverTheme popoverContentInsets](-[TSWPopoverController theme](self, "theme"), "popoverContentInsets");
  v14 = v13;
  objc_msgSend(-[TSWPopoverControllerContentProvider popoverContentView](-[TSWPopoverController contentProvider](self, "contentProvider"), "popoverContentView"), "bounds");
  objc_msgSend(-[TSWPopoverControllerContentProvider popoverContentView](-[TSWPopoverController contentProvider](self, "contentProvider"), "popoverContentView"), "setCenter:", v12, v14 + CGRectGetHeight(v40) * 0.5);
  objc_msgSend(-[TSWPopoverController view](self, "view"), "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[TSWPopoverTheme popoverCornerRadius](-[TSWPopoverController theme](self, "theme"), "popoverCornerRadius");
  v24 = -[TSWPopoverController p_newMaskPathWithBounds:cornerRadius:arrowDirection:arrowBounds:](self, "p_newMaskPathWithBounds:cornerRadius:arrowDirection:arrowBounds:", a3, v16, v18, v20, v22, v23, *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width, *(_QWORD *)&height);
  objc_msgSend(-[TSWPopoverController view](self, "view"), "bounds");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  -[TSWPopoverTheme popoverFadeInsets](-[TSWPopoverController theme](self, "theme"), "popoverFadeInsets");
  v37 = -[TSDBezierPath CGPath](+[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:", v26 + v36, v28 + v33, v30 - (v36 + v34), v32 - (v33 + v35)), "CGPath");
  clipView = self->_clipView;
  -[TSWPopoverTheme popoverFadeSizes](-[TSWPopoverController theme](self, "theme"), "popoverFadeSizes");
  -[TSWClipView updateClipWithOuterPath:innerPath:fadeSizes:](clipView, "updateClipWithOuterPath:innerPath:fadeSizes:", v24, v37);
  CGPathRelease(v24);
}

- (void)p_updateBackgroundViewWithArrowDirection:(unint64_t)a3 arrowBounds:(CGRect)a4
{
  double v5;
  double v6;
  id v7;
  UIView *v8;
  id v9;
  TSUColor *v10;
  TSUColor *v11;
  id v12;
  CGFloat v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;

  -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);

  self->_backgroundView = 0;
  -[TSWPopoverControllerContentProvider scale](-[TSWPopoverController contentProvider](self, "contentProvider"), "scale");
  *(float *)&v5 = v5 * 13.0;
  v6 = ceilf(*(float *)&v5);
  v7 = objc_alloc((Class)UIView);
  objc_msgSend(-[TSWPopoverController view](self, "view"), "bounds");
  v15 = CGRectInset(v14, -v6, -v6);
  v8 = (UIView *)objc_msgSend(v7, "initWithFrame:", v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
  -[UIView setBackgroundColor:](v8, "setBackgroundColor:", -[TSUColor platformColor](-[TSWPopoverTheme popoverBackgroundColor](-[TSWPopoverController theme](self, "theme"), "popoverBackgroundColor"), "platformColor"));
  if (-[TSWPopoverTheme popoverHasGradientBackground](-[TSWPopoverController theme](self, "theme"), "popoverHasGradientBackground"))
  {
    -[UIView setBackgroundColor:](v8, "setBackgroundColor:", 0);
    v9 = objc_alloc_init((Class)TSDNoDefaultImplicitActionGradientLayer);
    -[UIView bounds](v8, "bounds");
    objc_msgSend(v9, "setFrame:");
    v10 = +[TSUColor colorWithWhite:alpha:](TSUColor, "colorWithWhite:alpha:", 1.0, 0.200000003);
    v11 = -[TSWPopoverTheme popoverBackgroundColor](-[TSWPopoverController theme](self, "theme"), "popoverBackgroundColor");
    -[TSUColor alphaComponent](v10, "alphaComponent");
    v12 = -[TSUColor blendedColorWithFraction:ofColor:](v11, "blendedColorWithFraction:ofColor:", v10);
    -[TSUColor alphaComponent](-[TSWPopoverTheme popoverBackgroundColor](-[TSWPopoverController theme](self, "theme"), "popoverBackgroundColor"), "alphaComponent");
    objc_msgSend(v9, "setColors:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", objc_msgSend(objc_msgSend(v12, "colorWithAlphaComponent:"), "CGColor"), -[TSUColor CGColor](-[TSWPopoverTheme popoverBackgroundColor](-[TSWPopoverController theme](self, "theme"), "popoverBackgroundColor"), "CGColor"), 0));
    -[UIView bounds](v8, "bounds");
    objc_msgSend(v9, "setStartPoint:", 0.5, v6 / CGRectGetHeight(v16));
    -[UIView bounds](v8, "bounds");
    v13 = CGRectGetHeight(v17) - v6;
    -[UIView bounds](v8, "bounds");
    objc_msgSend(v9, "setEndPoint:", 0.5, v13 / CGRectGetHeight(v18));
    -[CALayer addSublayer:](-[UIView layer](v8, "layer"), "addSublayer:", v9);

  }
  self->_backgroundView = v8;
  -[TSWClipView addBackgroundView:](self->_clipView, "addBackgroundView:", v8);
}

- (void)p_updateStrokeLayerWithArrowDirection:(unint64_t)a3 arrowBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  unsigned int v10;
  CAShapeLayer *strokeLayer;
  CAShapeLayer *v12;
  TSDBezierPath *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGPath *v25;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = -[TSDStroke shouldRender](-[TSWPopoverTheme popoverStroke](-[TSWPopoverController theme](self, "theme"), "popoverStroke"), "shouldRender");
  strokeLayer = self->_strokeLayer;
  if (v10)
  {
    if (!strokeLayer)
    {
      v12 = (CAShapeLayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionShapeLayer);
      self->_strokeLayer = v12;
      -[CAShapeLayer setFillColor:](v12, "setFillColor:", 0);
      objc_msgSend(objc_msgSend(-[TSWPopoverController view](self, "view"), "layer"), "addSublayer:", self->_strokeLayer);
    }
    objc_msgSend(-[TSWPopoverController view](self, "view"), "bounds");
    v13 = +[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:");
    -[TSDStroke width](-[TSWPopoverTheme popoverStroke](-[TSWPopoverController theme](self, "theme"), "popoverStroke"), "width");
    v15 = 1.0;
    if (v14 > 1.0)
      v14 = 1.0;
    *(float *)&v15 = v14;
    LODWORD(v14) = 1.0;
    objc_msgSend(-[TSDBezierPath aliasedPathWithViewScale:effectiveStrokeWidth:](v13, "aliasedPathWithViewScale:effectiveStrokeWidth:", v14, v15), "bounds");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    -[TSWPopoverTheme popoverCornerRadius](-[TSWPopoverController theme](self, "theme"), "popoverCornerRadius");
    v25 = -[TSWPopoverController p_newMaskPathWithBounds:cornerRadius:arrowDirection:arrowBounds:](self, "p_newMaskPathWithBounds:cornerRadius:arrowDirection:arrowBounds:", a3, v17, v19, v21, v23, v24, *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width, *(_QWORD *)&height);
    -[CAShapeLayer setPath:](self->_strokeLayer, "setPath:", v25);
    CGPathRelease(v25);
    if ((-[TSDStroke canApplyToShapeRenderable](-[TSWPopoverTheme popoverStroke](-[TSWPopoverController theme](self, "theme"), "popoverStroke"), "canApplyToShapeRenderable") & 1) == 0)objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWPopoverController p_updateStrokeLayerWithArrowDirection:arrowBounds:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/TSWPopoverController.m"), 874, CFSTR("popover doesn't support strokes that can't apply to shape layers"));
    -[TSDStroke applyToRepRenderable:withScale:](-[TSWPopoverTheme popoverStroke](-[TSWPopoverController theme](self, "theme"), "popoverStroke"), "applyToRepRenderable:withScale:", +[TSDRenderable renderableFromLayer:](TSDRenderable, "renderableFromLayer:", self->_strokeLayer), 1.0);
  }
  else
  {
    -[CAShapeLayer removeFromSuperlayer](strokeLayer, "removeFromSuperlayer");

    self->_strokeLayer = 0;
  }
}

- (TSWPopoverControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TSWPopoverControllerDelegate *)a3;
}

- (NSArray)passThroughGestureRecognizers
{
  return self->_passThroughGestureRecognizers;
}

- (void)setPassThroughGestureRecognizers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (TSWPopUpInfo)popUpInfo
{
  return self->_popUpInfo;
}

- (UIGestureRecognizer)dismissGR
{
  return self->_dismissGR;
}

- (void)setDismissGR:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (UITapGestureRecognizer)doubleTapGR
{
  return self->_doubleTapGR;
}

- (void)setDoubleTapGR:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (UIEdgeInsets)fadeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_fadeInsets.top;
  left = self->_fadeInsets.left;
  bottom = self->_fadeInsets.bottom;
  right = self->_fadeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setFadeInsets:(UIEdgeInsets)a3
{
  self->_fadeInsets = a3;
}

- (UIEdgeInsets)fadeSizes
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_fadeSizes.top;
  left = self->_fadeSizes.left;
  bottom = self->_fadeSizes.bottom;
  right = self->_fadeSizes.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setFadeSizes:(UIEdgeInsets)a3
{
  self->_fadeSizes = a3;
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (int)displayMode
{
  return self->_displayMode;
}

- (void)setDisplayMode:(int)a3
{
  self->_displayMode = a3;
}

- (TSWPopoverControllerContentProvider)contentProvider
{
  return self->_contentProvider;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (UIView)scrimView
{
  return self->_scrimView;
}

- (void)setScrimView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CAShapeLayer)strokeLayer
{
  return self->_strokeLayer;
}

- (void)setStrokeLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (TSUColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  self->_backgroundColor = (TSUColor *)a3;
}

- (BOOL)hasGradientBackground
{
  return self->_hasGradientBackground;
}

- (void)setHasGradientBackground:(BOOL)a3
{
  self->_hasGradientBackground = a3;
}

- (TSDStroke)stroke
{
  return self->_stroke;
}

- (void)setStroke:(id)a3
{
  self->_stroke = (TSDStroke *)a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (BOOL)isDismissing
{
  return self->_isDismissing;
}

- (void)setIsDismissing:(BOOL)a3
{
  self->_isDismissing = a3;
}

- (TSWPopoverTheme)theme
{
  return self->_theme;
}

- (void)setTheme:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 120);
}

- (CGSize)originalViewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_originalViewSize.width;
  height = self->_originalViewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setOriginalViewSize:(CGSize)a3
{
  self->_originalViewSize = a3;
}

- (TSWClipView)clipView
{
  return self->_clipView;
}

- (void)setClipView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 128);
}

@end
