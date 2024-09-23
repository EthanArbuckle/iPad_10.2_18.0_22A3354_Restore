@implementation DBSArrangementLayoutViewController

- (DBSArrangementLayoutViewController)initWithNativeDisplaySize:(CGSize)a3 nativeDisplayName:(id)a4 externalDisplaySize:(CGSize)a5 externalDisplayName:(id)a6 currentNativeDisplayLocation:(unint64_t)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat v12;
  CGFloat v13;
  id v15;
  id v16;
  DBSArrangementLayoutViewController *v17;
  DBSArrangementLayoutViewController *v18;
  objc_super v20;

  height = a5.height;
  width = a5.width;
  v12 = a3.height;
  v13 = a3.width;
  v15 = a4;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)DBSArrangementLayoutViewController;
  v17 = -[DBSArrangementLayoutViewController init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_nativeDisplaySize.width = v13;
    v17->_nativeDisplaySize.height = v12;
    objc_storeStrong((id *)&v17->_nativeDisplayName, a4);
    v18->_externalDisplaySize.width = width;
    v18->_externalDisplaySize.height = height;
    objc_storeStrong((id *)&v18->_externalDisplayName, a6);
    v18->_nativeDisplayLocation = a7;
  }

  return v18;
}

- (void)updateCurrentDisplayLocation:(unint64_t)a3
{
  id v4;

  if (self->_nativeDisplayLocation != a3)
  {
    self->_nativeDisplayLocation = a3;
    -[DBSArrangementLayoutViewController view](self, "view");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "placeCurrentDisplayAtLocation:", a3);

  }
}

- (id)nativeDisplayImageWithWidth:(double)a3
{
  void *v4;
  void *v5;

  -[DBSArrangementLayoutViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nativeDisplayImageWithWidth:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  DBSNativeDisplayIconView *v8;
  void *v9;
  DBSNativeDisplayIconView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  DBSArrangementLayoutView *v18;

  v18 = -[DBSArrangementLayoutView initWithDataSource:]([DBSArrangementLayoutView alloc], "initWithDataSource:", self);
  -[DBSArrangementLayoutViewController setView:](self, "setView:", v18);
  -[DBSArrangementLayoutView setDataSource:](v18, "setDataSource:", self);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7E0]), "initWithTarget:action:", self, sel_didDrag_);
  -[DBSArrangementLayoutViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addGestureRecognizer:", v3);

  objc_msgSend(v3, "setDelegate:", self);
  -[DBSArrangementLayoutViewController setDragGestureRecognizer:](self, "setDragGestureRecognizer:", v3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel_didTap_);
  -[DBSArrangementLayoutViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addGestureRecognizer:", v5);

  objc_msgSend(v5, "setDelegate:", self);
  -[DBSArrangementLayoutViewController setTapGestureRecogniser:](self, "setTapGestureRecogniser:", v5);
  -[DBSArrangementLayoutViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "placeCurrentDisplayAtLocation:", -[DBSArrangementLayoutViewController nativeDisplayLocation](self, "nativeDisplayLocation"));

  v8 = [DBSNativeDisplayIconView alloc];
  -[DBSArrangementLayoutViewController nativeDisplayName](self, "nativeDisplayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[DBSNativeDisplayIconView initWithFrame:displayName:](v8, "initWithFrame:displayName:", v9, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[DBSArrangementLayoutViewController setDragView:](self, "setDragView:", v10);

  -[DBSArrangementLayoutViewController dragView](self, "dragView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 1);

  -[DBSArrangementLayoutViewController dragView](self, "dragView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setIsCurrentDisplayLocation:", 1);

  -[DBSArrangementLayoutView northDisplay](v18, "northDisplay");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "imageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "image");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[DBSArrangementLayoutViewController dragView](self, "dragView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "imageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setImage:", v15);

}

- (void)didDrag:(id)a3
{
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double Width;
  void *v49;
  void *v50;
  double MidX;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;

  v58 = a3;
  -[DBSArrangementLayoutViewController currentDisplayIconView](self, "currentDisplayIconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v58, "state") == 1)
  {
    objc_msgSend(v4, "frame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[DBSArrangementLayoutViewController dragView](self, "dragView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "superview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      -[DBSArrangementLayoutViewController arrangementView](self, "arrangementView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "northDisplay");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "imageView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "image");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[DBSArrangementLayoutViewController dragView](self, "dragView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "imageView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setImage:", v18);

      -[DBSArrangementLayoutViewController view](self, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[DBSArrangementLayoutViewController dragView](self, "dragView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addSubview:", v22);

    }
    objc_msgSend(v58, "locationInView:", v4);
    v24 = v23;
    v26 = v25;
    v59.origin.x = v6;
    v59.origin.y = v8;
    v59.size.width = v10;
    v59.size.height = v12;
    v27 = v24 / CGRectGetWidth(v59);
    v60.origin.x = v6;
    v60.origin.y = v8;
    v60.size.width = v10;
    v60.size.height = v12;
    -[DBSArrangementLayoutViewController setUnitDragPoint:](self, "setUnitDragPoint:", v27, v26 / CGRectGetHeight(v60));
    objc_msgSend(v4, "frame");
    -[DBSNativeDisplayIconView setFrame:](self->_dragView, "setFrame:");
    -[DBSArrangementLayoutViewController currentDisplayIconView](self, "currentDisplayIconView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setIsCurrentDisplayLocation:", 0);
    goto LABEL_9;
  }
  if (objc_msgSend(v58, "state") == 2)
  {
    -[DBSNativeDisplayIconView frame](self->_dragView, "frame");
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    -[DBSArrangementLayoutViewController view](self, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "locationInView:", v37);
    v39 = v38;
    v41 = v40;

    -[DBSArrangementLayoutViewController unitDragPoint](self, "unitDragPoint");
    v43 = v42;
    v61.origin.x = v30;
    v61.origin.y = v32;
    v61.size.width = v34;
    v61.size.height = v36;
    v44 = v39 - v43 * CGRectGetWidth(v61);
    -[DBSArrangementLayoutViewController unitDragPoint](self, "unitDragPoint");
    v46 = v45;
    v62.origin.x = v30;
    v62.origin.y = v32;
    v62.size.width = v34;
    v62.size.height = v36;
    v47 = v41 - v46 * CGRectGetHeight(v62);
    v63.origin.x = v30;
    v63.origin.y = v32;
    v63.size.width = v34;
    v63.size.height = v36;
    Width = CGRectGetWidth(v63);
    v64.origin.x = v30;
    v64.origin.y = v32;
    v64.size.width = v34;
    v64.size.height = v36;
    -[DBSNativeDisplayIconView setFrame:](self->_dragView, "setFrame:", v44, v47, Width, CGRectGetHeight(v64));
  }
  else
  {
    if (objc_msgSend(v58, "state") == 3)
    {
      -[DBSArrangementLayoutViewController setUnitDragPoint:](self, "setUnitDragPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
      -[DBSArrangementLayoutViewController arrangementView](self, "arrangementView");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[DBSArrangementLayoutViewController dragView](self, "dragView");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "frame");
      MidX = CGRectGetMidX(v65);
      -[DBSArrangementLayoutViewController dragView](self, "dragView");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "frame");
      v53 = objc_msgSend(v49, "displayLocationForPointInView:", MidX, CGRectGetMidY(v66));

      -[DBSArrangementLayoutViewController dragView](self, "dragView");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "removeFromSuperview");

      -[DBSArrangementLayoutViewController setNativeDisplayLocation:](self, "setNativeDisplayLocation:", v53);
      -[DBSArrangementLayoutViewController arrangementView](self, "arrangementView");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "placeCurrentDisplayAtLocation:", v53);

      -[DBSArrangementLayoutViewController delegate](self, "delegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "nativeDisplayLocationDidChange:", v53);
LABEL_9:

      goto LABEL_10;
    }
    if (objc_msgSend(v58, "state") == 4)
    {
      -[DBSArrangementLayoutViewController setUnitDragPoint:](self, "setUnitDragPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
      -[DBSArrangementLayoutViewController dragView](self, "dragView");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "removeFromSuperview");

      -[DBSArrangementLayoutViewController arrangementView](self, "arrangementView");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "placeCurrentDisplayAtLocation:", -[DBSArrangementLayoutViewController nativeDisplayLocation](self, "nativeDisplayLocation"));

    }
  }
LABEL_10:

}

- (void)didTap:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  unint64_t v35;
  void *v36;
  void *v37;
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
  id v48;
  CGPoint v49;
  CGPoint v50;
  CGPoint v51;
  CGPoint v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  v4 = a3;
  -[DBSArrangementLayoutViewController arrangementView](self, "arrangementView");
  v48 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v48);
  v6 = v5;
  v8 = v7;

  objc_msgSend(v48, "northDisplay");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  objc_msgSend(v9, "convertRect:toView:", v48);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v48, "eastDisplay");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  objc_msgSend(v18, "convertRect:toView:", v48);
  v20 = v19;
  v22 = v21;
  v46 = v24;
  v47 = v23;
  objc_msgSend(v48, "southDisplay");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bounds");
  objc_msgSend(v25, "convertRect:toView:", v48);
  v44 = v27;
  v45 = v26;
  v42 = v29;
  v43 = v28;
  objc_msgSend(v48, "westDisplay");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "bounds");
  objc_msgSend(v30, "convertRect:toView:", v48);
  v40 = v32;
  v41 = v31;
  v38 = v34;
  v39 = v33;
  v35 = -[DBSArrangementLayoutViewController nativeDisplayLocation](self, "nativeDisplayLocation");
  v53.origin.x = v11;
  v53.origin.y = v13;
  v53.size.width = v15;
  v53.size.height = v17;
  v49.x = v6;
  v49.y = v8;
  if (CGRectContainsPoint(v53, v49))
  {
    v35 = 0;
  }
  else
  {
    v54.origin.x = v20;
    v54.origin.y = v22;
    v54.size.height = v46;
    v54.size.width = v47;
    v50.x = v6;
    v50.y = v8;
    if (CGRectContainsPoint(v54, v50))
    {
      v35 = 1;
    }
    else
    {
      v55.origin.y = v44;
      v55.origin.x = v45;
      v55.size.height = v42;
      v55.size.width = v43;
      v51.x = v6;
      v51.y = v8;
      if (CGRectContainsPoint(v55, v51))
      {
        v35 = 2;
      }
      else
      {
        v56.origin.y = v40;
        v56.origin.x = v41;
        v56.size.height = v38;
        v56.size.width = v39;
        v52.x = v6;
        v52.y = v8;
        if (CGRectContainsPoint(v56, v52))
          v35 = 3;
      }
    }
  }
  -[DBSArrangementLayoutViewController setNativeDisplayLocation:](self, "setNativeDisplayLocation:", v35);
  -[DBSArrangementLayoutViewController arrangementView](self, "arrangementView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "placeCurrentDisplayAtLocation:", v35);

  -[DBSArrangementLayoutViewController delegate](self, "delegate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "nativeDisplayLocationDidChange:", v35);

}

- (id)currentDisplayIconView
{
  void *v3;
  uint64_t v4;
  void *v5;

  switch(-[DBSArrangementLayoutViewController nativeDisplayLocation](self, "nativeDisplayLocation"))
  {
    case 0uLL:
      -[DBSArrangementLayoutViewController arrangementView](self, "arrangementView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "northDisplay");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1uLL:
      -[DBSArrangementLayoutViewController arrangementView](self, "arrangementView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "eastDisplay");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2uLL:
      -[DBSArrangementLayoutViewController arrangementView](self, "arrangementView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "southDisplay");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3uLL:
      -[DBSArrangementLayoutViewController arrangementView](self, "arrangementView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "westDisplay");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v5 = (void *)v4;

      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  BOOL v16;
  BOOL v17;
  CGPoint v19;
  CGRect v20;

  v4 = a3;
  -[DBSArrangementLayoutViewController dragGestureRecognizer](self, "dragGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[DBSArrangementLayoutViewController currentDisplayIconView](self, "currentDisplayIconView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v13);
    v9 = v14;
    v11 = v15;
    v12 = v13;
  }
  else
  {
    -[DBSArrangementLayoutViewController tapGestureRecogniser](self, "tapGestureRecogniser");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 != v4)
    {
LABEL_7:
      v17 = 0;
      goto LABEL_8;
    }
    -[DBSArrangementLayoutViewController arrangementView](self, "arrangementView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v7);
    v9 = v8;
    v11 = v10;

    -[DBSArrangementLayoutViewController arrangementView](self, "arrangementView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
  }
  objc_msgSend(v12, "bounds");
  v19.x = v9;
  v19.y = v11;
  v16 = CGRectContainsPoint(v20, v19);

  if (!v16)
    goto LABEL_7;
  v17 = 1;
LABEL_8:

  return v17;
}

- (void)updateOrientationTo:(int64_t)a3 withNativeDisplaySize:(CGSize)a4
{
  id v6;

  -[DBSArrangementLayoutViewController setNativeDisplaySize:](self, "setNativeDisplaySize:", a4.width, a4.height);
  -[DBSArrangementLayoutViewController arrangementView](self, "arrangementView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateForOrientation:", a3);

}

- (DBSArrangementLayoutViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (unint64_t)nativeDisplayLocation
{
  return self->_nativeDisplayLocation;
}

- (void)setNativeDisplayLocation:(unint64_t)a3
{
  self->_nativeDisplayLocation = a3;
}

- (CGSize)nativeDisplaySize
{
  double width;
  double height;
  CGSize result;

  width = self->_nativeDisplaySize.width;
  height = self->_nativeDisplaySize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setNativeDisplaySize:(CGSize)a3
{
  self->_nativeDisplaySize = a3;
}

- (CGSize)externalDisplaySize
{
  double width;
  double height;
  CGSize result;

  width = self->_externalDisplaySize.width;
  height = self->_externalDisplaySize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setExternalDisplaySize:(CGSize)a3
{
  self->_externalDisplaySize = a3;
}

- (NSString)nativeDisplayName
{
  return self->_nativeDisplayName;
}

- (void)setNativeDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_nativeDisplayName, a3);
}

- (NSString)externalDisplayName
{
  return self->_externalDisplayName;
}

- (void)setExternalDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_externalDisplayName, a3);
}

- (UIPanGestureRecognizer)dragGestureRecognizer
{
  return self->_dragGestureRecognizer;
}

- (void)setDragGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_dragGestureRecognizer, a3);
}

- (UITapGestureRecognizer)tapGestureRecogniser
{
  return self->_tapGestureRecogniser;
}

- (void)setTapGestureRecogniser:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecogniser, a3);
}

- (DBSNativeDisplayIconView)dragView
{
  return self->_dragView;
}

- (void)setDragView:(id)a3
{
  objc_storeStrong((id *)&self->_dragView, a3);
}

- (CGPoint)unitDragPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_unitDragPoint.x;
  y = self->_unitDragPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setUnitDragPoint:(CGPoint)a3
{
  self->_unitDragPoint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragView, 0);
  objc_storeStrong((id *)&self->_tapGestureRecogniser, 0);
  objc_storeStrong((id *)&self->_dragGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_externalDisplayName, 0);
  objc_storeStrong((id *)&self->_nativeDisplayName, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

@end
