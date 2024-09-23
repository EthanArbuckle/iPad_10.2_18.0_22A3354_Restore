@implementation AEAnnotationPopoverViewController

- (AEAnnotationPopoverViewController)init
{
  AEAnnotationPopoverViewController *result;
  CGSize size;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AEAnnotationPopoverViewController;
  result = -[AEAnnotationPopoverViewController init](&v4, "init");
  if (result)
  {
    size = CGRectNull.size;
    result->_presentationRect.origin = CGRectNull.origin;
    result->_presentationRect.size = size;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[AEAnnotationPopoverViewController releaseOutlets](self, "releaseOutlets");
  v3.receiver = self;
  v3.super_class = (Class)AEAnnotationPopoverViewController;
  -[AEAnnotationPopoverViewController dealloc](&v3, "dealloc");
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AEAnnotationPopoverViewController;
  -[AEAnnotationPopoverViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController view](self, "view"));
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);

}

- (void)viewDidUnload
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AEAnnotationPopoverViewController;
  -[AEAnnotationPopoverViewController viewDidUnload](&v3, "viewDidUnload");
  -[AEAnnotationPopoverViewController releaseOutlets](self, "releaseOutlets");
}

- (BOOL)canPresentInPosition:(int)a3
{
  return a3 == 0;
}

- (CGRect)p_containerFrameForView:(id)a3
{
  id v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect result;

  v4 = a3;
  if (-[AEAnnotationPopoverViewController im_isCompactHeight](self, "im_isCompactHeight"))
    v5 = 12.0;
  else
    v5 = 44.0;
  objc_msgSend(v4, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v16.origin.x = v7;
  v16.origin.y = v9;
  v16.size.width = v11;
  v16.size.height = v13;
  result = CGRectInset(v16, 20.0, 20.0);
  v14 = v5 + result.origin.y;
  v15 = result.size.height - v5;
  result.size.height = v15;
  result.origin.y = v14;
  return result;
}

- (int)willPresentInPosition:(CGRect)a3 view:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double MinY;
  CGFloat v24;
  int v25;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController view](self, "view"));
  objc_msgSend(v10, "bounds");
  v29 = v12;
  v30 = v11;
  v27 = v14;
  v28 = v13;

  -[AEAnnotationPopoverViewController p_containerFrameForView:](self, "p_containerFrameForView:", v9);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v31.origin.x = v16;
  v31.origin.y = v18;
  v31.size.width = v20;
  v31.size.height = v22;
  MinY = CGRectGetMinY(v31);
  v32.origin.y = v29;
  v32.origin.x = v30;
  v32.size.height = v27;
  v32.size.width = v28;
  v24 = MinY + CGRectGetHeight(v32) + 2.0;
  v33.origin.x = x;
  v33.origin.y = y;
  v33.size.width = width;
  v33.size.height = height;
  CGRectGetMinX(v33);
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  CGRectGetWidth(v34);
  v35.origin.x = x;
  v35.origin.y = y;
  v35.size.width = width;
  v35.size.height = height;
  if (CGRectGetMinY(v35) >= v24)
    return 0;
  v25 = 1;
  if (!-[AEAnnotationPopoverViewController canPresentInPosition:](self, "canPresentInPosition:", 1))
    return 0;
  return v25;
}

- (void)presentFromRect:(CGRect)a3 view:(id)a4
{
  id v5;
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
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinY;
  double v21;
  double MaxY;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  unsigned int v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  double MaxX;
  double v50;
  double MinX;
  double v52;
  CGFloat rect;
  _QWORD v55[4];
  id v56;
  AEAnnotationPopoverViewController *v57;
  _QWORD v58[5];
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

  v5 = a4;
  -[AEAnnotationPopoverViewController setPresentationView:](self, "setPresentationView:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController view](self, "view"));
  objc_msgSend(v6, "setAlpha:", 0.0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController view](self, "view"));
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  -[AEAnnotationPopoverViewController p_containerFrameForView:](self, "p_containerFrameForView:", v5);
  x = v59.origin.x;
  y = v59.origin.y;
  width = v59.size.width;
  height = v59.size.height;
  MinX = CGRectGetMinX(v59);
  rect = v9;
  v60.origin.x = v9;
  v60.origin.y = v11;
  v60.size.width = v13;
  v60.size.height = v15;
  v52 = MinX + CGRectGetWidth(v60) * 0.5 + 2.0;
  v61.origin.x = x;
  v61.origin.y = y;
  v61.size.width = width;
  v61.size.height = height;
  MaxX = CGRectGetMaxX(v61);
  v62.origin.x = v9;
  v62.origin.y = v11;
  v62.size.width = v13;
  v62.size.height = v15;
  v50 = MaxX - (CGRectGetWidth(v62) * 0.5 + 2.0);
  v63.origin.x = x;
  v63.origin.y = y;
  v63.size.width = width;
  v63.size.height = height;
  MinY = CGRectGetMinY(v63);
  v64.origin.x = rect;
  v48 = v11;
  v64.origin.y = v11;
  v64.size.width = v13;
  v47 = v15;
  v64.size.height = v15;
  v21 = MinY + CGRectGetHeight(v64) + 2.0;
  v46 = x;
  v65.origin.x = x;
  v65.origin.y = y;
  v65.size.width = width;
  v65.size.height = height;
  MaxY = CGRectGetMaxY(v65);
  v23 = CGRectGetMinX(a3);
  v24 = v23 + CGRectGetWidth(a3) * 0.5;
  v25 = CGRectGetMinY(a3);
  if (v25 < v21 && -[AEAnnotationPopoverViewController canPresentInPosition:](self, "canPresentInPosition:", 1))
  {
    -[AEAnnotationPopoverViewController setPosition:](self, "setPosition:", 1);
    v25 = CGRectGetMaxY(a3);
    v66.origin.x = v46;
    v66.origin.y = y;
    v66.size.width = width;
    v66.size.height = height;
    v21 = CGRectGetMinY(v66) + 2.0;
    v67.origin.x = v46;
    v67.origin.y = y;
    v67.size.width = width;
    v67.size.height = height;
    v26 = CGRectGetMaxY(v67);
    v68.origin.x = rect;
    v68.size.width = v13;
    v68.origin.y = v48;
    v68.size.height = v47;
    MaxY = v26 - CGRectGetHeight(v68);
  }
  else
  {
    -[AEAnnotationPopoverViewController setPosition:](self, "setPosition:", 0);
  }
  v27 = MaxY + -2.0;
  v28 = v50;
  if (v24 <= v50)
    v28 = v24;
  if (v24 >= v52)
    v29 = v28;
  else
    v29 = v52;
  if (v25 <= v27)
    v27 = v25;
  if (v25 >= v21)
    v30 = v27;
  else
    v30 = v21;
  -[AEAnnotationPopoverViewController setPresentationRect:](self, "setPresentationRect:", v29 + -1.0, v30 + -1.0, 2.0, 2.0);
  v31 = -[AEAnnotationPopoverViewController position](self, "position");
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController view](self, "view"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "layer"));
  v34 = v33;
  v35 = 0.0;
  if (v31 != 1)
    v35 = 1.0;
  objc_msgSend(v33, "setAnchorPoint:", 0.5, v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController view](self, "view"));
  objc_msgSend(v36, "setCenter:", v29, v30);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController view](self, "view"));
  objc_msgSend(v37, "frame");
  v70 = CGRectIntegral(v69);
  v38 = v70.origin.x;
  v39 = v70.origin.y;
  v40 = v70.size.width;
  v41 = v70.size.height;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController view](self, "view"));
  objc_msgSend(v42, "setFrame:", v38, v39, v40, v41);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController view](self, "view"));
  objc_msgSend(v5, "addSubview:", v43);

  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  objc_msgSend(v44, "setUserInteractionEnabled:", 0);

  -[AEAnnotationPopoverViewController willShow](self, "willShow");
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_4B590;
  v58[3] = &unk_28B960;
  v58[4] = self;
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_4B5C4;
  v55[3] = &unk_28BDF8;
  v56 = v5;
  v57 = self;
  v45 = v5;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v58, v55, 0.15);

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGPoint v20;
  CGRect v21;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController view](self, "view"));
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController view](self, "view"));
  objc_msgSend(v4, "locationInView:", v14);
  v16 = v15;
  v18 = v17;

  v21.origin.x = v7;
  v21.origin.y = v9;
  v21.size.width = v11;
  v21.size.height = v13;
  v20.x = v16;
  v20.y = v18;
  LOBYTE(v4) = !CGRectContainsPoint(v21, v20);

  return (char)v4;
}

- (void)willShow
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v3, "willShowAnnotationEditor:") & 1) != 0)
    objc_msgSend(v3, "willShowAnnotationEditor:", self);

}

- (void)didShow
{
  AETouchOutsideViewGestureRecognizer *v3;
  void *v4;
  AETouchOutsideViewGestureRecognizer *v5;
  AETouchOutsideViewGestureRecognizer *mHideOnTouchGestureRecognizer;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  id mObserver;
  void *v14;
  _QWORD v15[5];

  v3 = [AETouchOutsideViewGestureRecognizer alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController view](self, "view"));
  v5 = -[AETouchOutsideViewGestureRecognizer initWithTarget:action:watchView:](v3, "initWithTarget:action:watchView:", self, "hide", v4);
  mHideOnTouchGestureRecognizer = self->mHideOnTouchGestureRecognizer;
  self->mHideOnTouchGestureRecognizer = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "superview"));
  objc_msgSend(v8, "addGestureRecognizer:", self->mHideOnTouchGestureRecognizer);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v10 = AEAnnotationPopoverShouldHideNotification;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_4B888;
  v15[3] = &unk_28D650;
  v15[4] = self;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "addObserverForName:object:queue:usingBlock:", v10, 0, v11, v15));
  mObserver = self->mObserver;
  self->mObserver = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v14, "didShowAnnotationEditor:") & 1) != 0)
    objc_msgSend(v14, "didShowAnnotationEditor:", self);

}

- (void)willHide
{
  void *v3;
  AETouchOutsideViewGestureRecognizer *mHideOnTouchGestureRecognizer;
  void *v5;
  id mObserver;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AETouchOutsideViewGestureRecognizer view](self->mHideOnTouchGestureRecognizer, "view"));
  objc_msgSend(v3, "removeGestureRecognizer:", self->mHideOnTouchGestureRecognizer);

  mHideOnTouchGestureRecognizer = self->mHideOnTouchGestureRecognizer;
  self->mHideOnTouchGestureRecognizer = 0;

  if (self->mObserver)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "removeObserver:name:object:", self->mObserver, AEAnnotationPopoverShouldHideNotification, 0);

    mObserver = self->mObserver;
    self->mObserver = 0;

  }
  v7 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v7, "willHideAnnotationEditor:") & 1) != 0)
    objc_msgSend(v7, "willHideAnnotationEditor:", self);

}

- (void)didHide
{
  AEAnnotationPopoverViewController *v2;
  id v3;
  id v4;

  v2 = objc_retainAutorelease(self);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController delegate](v2, "delegate"));
  if ((objc_opt_respondsToSelector(v4, "didHideAnnotationEditor:") & 1) != 0)
    objc_msgSend(v4, "didHideAnnotationEditor:", v2);
  -[AEAnnotationPopoverViewController setPresentationRect:](v2, "setPresentationRect:", CGRectNull.origin.x, CGRectNull.origin.y, CGRectNull.size.width, CGRectNull.size.height);
  -[AEAnnotationPopoverViewController setPresentationView:](v2, "setPresentationView:", 0);
  v3 = (id)objc_opt_self(v2);

}

- (void)hide
{
  void *v3;
  id v4;
  void **v5;
  uint64_t v6;
  id (*v7)(uint64_t);
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  if (self->mHideOnTouchGestureRecognizer)
  {
    -[AEAnnotationPopoverViewController willHide](self, "willHide");
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationPopoverViewController view](self, "view"));
    objc_msgSend(v3, "setUserInteractionEnabled:", 0);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_4BAE4;
    v10[3] = &unk_28B960;
    v11 = v3;
    v5 = _NSConcreteStackBlock;
    v6 = 3221225472;
    v7 = sub_4BAF0;
    v8 = &unk_28D678;
    v9 = v11;
    v4 = v11;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v10, &v5, 0.2);
    -[AEAnnotationPopoverViewController didHide](self, "didHide", v5, v6, v7, v8);

  }
}

- (AEAnnotation)annotation
{
  return self->mAnnotation;
}

- (void)setAnnotation:(id)a3
{
  objc_storeStrong((id *)&self->mAnnotation, a3);
}

- (AEAnnotationTheme)annotationTheme
{
  return self->mAnnotationTheme;
}

- (void)setAnnotationTheme:(id)a3
{
  objc_storeStrong((id *)&self->mAnnotationTheme, a3);
}

- (int)position
{
  return self->mPosition;
}

- (void)setPosition:(int)a3
{
  self->mPosition = a3;
}

- (CGRect)presentationRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_presentationRect.origin.x;
  y = self->_presentationRect.origin.y;
  width = self->_presentationRect.size.width;
  height = self->_presentationRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPresentationRect:(CGRect)a3
{
  self->_presentationRect = a3;
}

- (UIView)presentationView
{
  return self->_presentationView;
}

- (void)setPresentationView:(id)a3
{
  objc_storeStrong((id *)&self->_presentationView, a3);
}

- (BOOL)editsOnLaunch
{
  return self->_editsOnLaunch;
}

- (void)setEditsOnLaunch:(BOOL)a3
{
  self->_editsOnLaunch = a3;
}

- (AEAnnotationEditorDelegate)delegate
{
  return (AEAnnotationEditorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_presentationView, 0);
  objc_storeStrong(&self->mObserver, 0);
  objc_storeStrong((id *)&self->mAnnotationTheme, 0);
  objc_storeStrong((id *)&self->mAnnotation, 0);
  objc_storeStrong((id *)&self->mHideOnTouchGestureRecognizer, 0);
}

@end
