@implementation UIDebuggingSpecViewController

- (UIDebuggingSpecViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  UIDebuggingSpecViewController *v4;
  UIDebuggingSpecViewController *v5;
  void *v6;
  UIBarButtonItem *v7;
  uint64_t v8;
  NSMutableArray *specImages;
  UICollectionViewFlowLayout *v10;
  UICollectionViewFlowLayout *flowLayout;
  UICollectionView *v12;
  uint64_t v13;
  UICollectionView *collectionView;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)UIDebuggingSpecViewController;
  v4 = -[UIViewController initWithNibName:bundle:](&v17, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[UIViewController navigationItem](v4, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[UIBarButtonItem initWithTitle:style:target:action:]([UIBarButtonItem alloc], "initWithTitle:style:target:action:", CFSTR("Add"), 2, v5, sel_prepareForMediaBrowser);
    objc_msgSend(v6, "setRightBarButtonItem:", v7);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    specImages = v5->_specImages;
    v5->_specImages = (NSMutableArray *)v8;

    v10 = objc_alloc_init(UICollectionViewFlowLayout);
    flowLayout = v5->_flowLayout;
    v5->_flowLayout = v10;

    -[UICollectionViewFlowLayout setItemSize:](v5->_flowLayout, "setItemSize:", 50.0, 50.0);
    v12 = [UICollectionView alloc];
    v13 = -[UICollectionView initWithFrame:collectionViewLayout:](v12, "initWithFrame:collectionViewLayout:", v5->_flowLayout, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    collectionView = v5->_collectionView;
    v5->_collectionView = (UICollectionView *)v13;

    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v5->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("specCell"));
    +[UIColor whiteColor](UIColor, "whiteColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionView setBackgroundColor:](v5->_collectionView, "setBackgroundColor:", v15);

    -[UICollectionView setDataSource:](v5->_collectionView, "setDataSource:", v5);
    -[UICollectionView setDelegate:](v5->_collectionView, "setDelegate:", v5);

  }
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  UILongPressGestureRecognizer *v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)UIDebuggingSpecViewController;
  -[UIViewController viewDidLoad](&v23, sel_viewDidLoad);
  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  -[UICollectionViewFlowLayout minimumInteritemSpacing](self->_flowLayout, "minimumInteritemSpacing");
  v7 = (v5 + v6 * -4.0) / 3.0;

  -[UICollectionViewFlowLayout setItemSize:](self->_flowLayout, "setItemSize:", v7, v7);
  -[UIDebuggingSpecViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAutoresizingMask:", 18);

  -[UIViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[UIDebuggingSpecViewController collectionView](self, "collectionView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  -[UIViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDebuggingSpecViewController collectionView](self, "collectionView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", v20);

  v21 = -[UILongPressGestureRecognizer initWithTarget:action:]([UILongPressGestureRecognizer alloc], "initWithTarget:action:", self, sel_gotDeleteGesture_);
  -[UILongPressGestureRecognizer setMinimumPressDuration:](v21, "setMinimumPressDuration:", 0.5);
  -[UIDebuggingSpecViewController collectionView](self, "collectionView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addGestureRecognizer:", v21);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[UIDebuggingSpecViewController specImages](self, "specImages", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  UIImageView *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  UIImageView *v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("specCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [UIImageView alloc];
  -[UIDebuggingSpecViewController specImages](self, "specImages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "row");

  objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[UIImageView initWithImage:](v8, "initWithImage:", v11);

  objc_msgSend(v7, "bounds");
  -[UIImageView setFrame:](v12, "setFrame:");
  -[UIImageView setContentMode:](v12, "setContentMode:", 2);
  -[UIView setClipsToBounds:](v12, "setClipsToBounds:", 1);
  objc_msgSend(v7, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v12);

  -[UIView setAutoresizingMask:](v12, "setAutoresizingMask:", 18);
  return v7;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  UIImageView *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  UIView *v12;
  void *v13;
  void *v14;
  UIView *v15;
  UIPanGestureRecognizer *v16;
  UITapGestureRecognizer *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  UIImageView *v26;

  v5 = a4;
  v6 = [UIImageView alloc];
  -[UIViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v26 = -[UIImageView initWithFrame:](v6, "initWithFrame:");

  -[UIDebuggingSpecViewController specImages](self, "specImages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "row");

  objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](v26, "setImage:", v11);

  v12 = [UIView alloc];
  -[UIViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v15 = -[UIView initWithFrame:](v12, "initWithFrame:");

  -[UIView addSubview:](v15, "addSubview:", v26);
  v16 = -[UIPanGestureRecognizer initWithTarget:action:]([UIPanGestureRecognizer alloc], "initWithTarget:action:", self, sel_gotPanGesture_);
  -[UIView addGestureRecognizer:](v15, "addGestureRecognizer:", v16);
  v17 = -[UITapGestureRecognizer initWithTarget:action:]([UITapGestureRecognizer alloc], "initWithTarget:action:", self, sel_hideImage);
  -[UITapGestureRecognizer setNumberOfTouchesRequired:](v17, "setNumberOfTouchesRequired:", 1);
  -[UITapGestureRecognizer setNumberOfTapsRequired:](v17, "setNumberOfTapsRequired:", 2);
  -[UIView addGestureRecognizer:](v15, "addGestureRecognizer:", v17);
  -[UIDebuggingSpecViewController setSpec:](self, "setSpec:", v15);
  +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTouchCaptureEnabled:", 1);

  +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "rootViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDebuggingSpecViewController spec](self, "spec");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addSubview:", v22);

  +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "overlayViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "containerView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setHidden:", 1);

}

- (void)gotDeleteGesture:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  UIDebuggingSpecViewController *v18;
  id v19;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
  {
    -[UIDebuggingSpecViewController collectionView](self, "collectionView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationInView:", v5);
    v7 = v6;
    v9 = v8;

    -[UIDebuggingSpecViewController collectionView](self, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "indexPathForItemAtPoint:", v7, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __50__UIDebuggingSpecViewController_gotDeleteGesture___block_invoke;
      v17 = &unk_1E16DD450;
      v18 = self;
      v19 = v11;
      +[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Remove"), 2, &v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addAction:", v13, v14, v15, v16, v17, v18);
      -[UIViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);

    }
  }

}

void __50__UIDebuggingSpecViewController_gotDeleteGesture___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "specImages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectAtIndex:", objc_msgSend(*(id *)(a1 + 40), "row"));

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (void)gotPanGesture:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  float v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  float v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  id v27;

  v27 = a3;
  if (objc_msgSend(v27, "state") == 1)
  {
    -[UIDebuggingSpecViewController spec](self, "spec");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "subviews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "opacity");
    -[UIDebuggingSpecViewController setOriginalOpacity:](self, "setOriginalOpacity:", v8);

    objc_msgSend(v27, "locationInView:", 0);
    -[UIDebuggingSpecViewController setOrigin:](self, "setOrigin:");
    goto LABEL_13;
  }
  if (objc_msgSend(v27, "state") == 2)
  {
    objc_msgSend(v27, "locationInView:", 0);
    v10 = v9;
    -[UIDebuggingSpecViewController origin](self, "origin");
    v12 = v10 - v11;
    -[UIDebuggingSpecViewController originalOpacity](self, "originalOpacity");
    v14 = v13 + v12 / -200.0;
    if (v12 > 0.0)
    {
      v15 = v14;
      -[UIDebuggingSpecViewController spec](self, "spec");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "subviews");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "layer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v20 = v15;
      objc_msgSend(v19, "setOpacity:", v20);

      if (v12 <= 250.0)
        goto LABEL_13;
      goto LABEL_9;
    }
    if (v14 > 1.0)
      v14 = 1.0;
    v21 = v14;
    -[UIDebuggingSpecViewController spec](self, "spec");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "subviews");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v26 = v21;
    objc_msgSend(v25, "setOpacity:", v26);

  }
  else if (objc_msgSend(v27, "state") == 4 || objc_msgSend(v27, "state") == 5)
  {
LABEL_9:
    -[UIDebuggingSpecViewController hideImage](self, "hideImage");
  }
LABEL_13:

}

- (void)hideImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  id v10;
  _QWORD v11[4];
  id v12;

  -[UIDebuggingSpecViewController spec](self, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[UIDebuggingSpecViewController setSpec:](self, "setSpec:", 0);
  +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTouchCaptureEnabled:", 0);

  +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "overlayViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = 0;
  objc_msgSend(v8, "setOpacity:", v9);

  objc_msgSend(v7, "setHidden:", 0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__UIDebuggingSpecViewController_hideImage__block_invoke;
  v11[3] = &unk_1E16B1B28;
  v12 = v7;
  v10 = v7;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v11, 0.2);

}

void __42__UIDebuggingSpecViewController_hideImage__block_invoke(uint64_t a1)
{
  double v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v1) = 1.0;
  objc_msgSend(v2, "setOpacity:", v1);

}

- (void)prepareForMediaBrowser
{
  void *v3;

  +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTouchCaptureEnabled:", 1);

  -[UIDebuggingSpecViewController startMediaBrowserFromViewController:](self, "startMediaBrowserFromViewController:", self);
}

- (BOOL)startMediaBrowserFromViewController:(id)a3
{
  id v4;
  _BOOL4 v5;
  UIImagePickerController *v6;

  v4 = a3;
  v5 = +[UIImagePickerController isSourceTypeAvailable:](UIImagePickerController, "isSourceTypeAvailable:", 2);
  if (v5)
  {
    v6 = objc_alloc_init(UIImagePickerController);
    -[UIImagePickerController setSourceType:](v6, "setSourceType:", 2);
    -[UIImagePickerController setAllowsEditing:](v6, "setAllowsEditing:", 0);
    -[UINavigationController setDelegate:](v6, "setDelegate:", self);
    objc_msgSend(v4, "presentViewController:animated:completion:", v6, 1, 0);

  }
  return v5;
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  -[UIDebuggingSpecViewController specImages](self, "specImages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("UIImagePickerControllerOriginalImage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObject:", v7);
  -[UIDebuggingSpecViewController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadData");

  -[UIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTouchCaptureEnabled:", 0);

}

- (void)imagePickerControllerDidCancel:(id)a3
{
  id v3;

  -[UIViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  +[UIDebuggingInformationOverlay overlay](UIDebuggingInformationOverlay, "overlay");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTouchCaptureEnabled:", 0);

}

- (UIView)spec
{
  return self->_spec;
}

- (void)setSpec:(id)a3
{
  objc_storeStrong((id *)&self->_spec, a3);
}

- (NSMutableArray)specImages
{
  return self->_specImages;
}

- (void)setSpecImages:(id)a3
{
  objc_storeStrong((id *)&self->_specImages, a3);
}

- (CGPoint)origin
{
  double x;
  double y;
  CGPoint result;

  x = self->_origin.x;
  y = self->_origin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOrigin:(CGPoint)a3
{
  self->_origin = a3;
}

- (double)originalOpacity
{
  return self->_originalOpacity;
}

- (void)setOriginalOpacity:(double)a3
{
  self->_originalOpacity = a3;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UICollectionViewFlowLayout)flowLayout
{
  return self->_flowLayout;
}

- (void)setFlowLayout:(id)a3
{
  objc_storeStrong((id *)&self->_flowLayout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_specImages, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

@end
