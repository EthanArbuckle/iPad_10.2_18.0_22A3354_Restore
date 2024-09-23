@implementation PRXPasscodeEntryViewController

- (PRXPasscodeEntryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PRXCardContentView *v5;
  PRXPasscodeEntryViewController *v6;

  v5 = -[PRXCardContentView initWithCardStyle:]([PRXCardContentView alloc], "initWithCardStyle:", 0);
  v6 = -[PRXCardContentViewController initWithContentView:](self, "initWithContentView:", v5);

  return v6;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRXPasscodeEntryViewController;
  -[PRXCardContentViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PRXPasscodeEntryViewController _updatePasscodeEntryView](self, "_updatePasscodeEntryView");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PRXPasscodeEntryViewController;
  -[PRXPasscodeEntryViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PRXPasscodeEntryView becomeFirstResponder](self->_passcodeEntryView, "becomeFirstResponder");
}

- (void)setNumberOfDigits:(int64_t)a3
{
  if (self->_numberOfDigits != a3)
  {
    self->_numberOfDigits = a3;
    -[PRXPasscodeEntryViewController _updatePasscodeEntryView](self, "_updatePasscodeEntryView");
  }
}

- (void)setUseMonospacedFont:(BOOL)a3
{
  if (self->_useMonospacedFont != a3)
  {
    self->_useMonospacedFont = a3;
    -[PRXPasscodeEntryViewController _updatePasscodeEntryView](self, "_updatePasscodeEntryView");
  }
}

- (void)setImage:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIImage isEqual:](self->_image, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_image, a3);
    -[PRXPasscodeEntryViewController _updatePasscodeEntryView](self, "_updatePasscodeEntryView");
  }

}

- (void)_updatePasscodeEntryView
{
  void *v3;
  void *v4;
  unint64_t v5;
  PRXImageView *v6;
  PRXImageView *imageView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PRXPasscodeEntryView *v18;
  int64_t numberOfDigits;
  PRXPasscodeEntryView *v20;
  PRXPasscodeEntryView *passcodeEntryView;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  PRXImageView *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void **v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[3];
  _QWORD v48[4];

  v48[3] = *MEMORY[0x24BDAC8D0];
  if (-[PRXPasscodeEntryViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PRXCardContentViewController contentView](self, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mainContentGuide");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[PRXImageView removeFromSuperview](self->_imageView, "removeFromSuperview");
    v5 = 0x24BDBC000;
    if (self->_image)
    {
      +[PRXImageView imageViewWithStyle:](PRXImageView, "imageViewWithStyle:", 0);
      v6 = (PRXImageView *)objc_claimAutoreleasedReturnValue();
      imageView = self->_imageView;
      self->_imageView = v6;

      -[PRXImageView setImage:](self->_imageView, "setImage:", self->_image);
      -[PRXImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[PRXCardContentViewController contentView](self, "contentView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", self->_imageView);

      v40 = (void *)MEMORY[0x24BDD1628];
      -[PRXImageView centerXAnchor](self->_imageView, "centerXAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "centerXAnchor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "constraintEqualToAnchor:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v10;
      -[PRXImageView topAnchor](self->_imageView, "topAnchor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "topAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "constraintGreaterThanOrEqualToAnchor:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v48[1] = v13;
      -[PRXImageView heightAnchor](self->_imageView, "heightAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "constraintEqualToConstant:", 50.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v48[2] = v15;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 3);
      v16 = v4;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "activateConstraints:", v17);

      v4 = v16;
      v5 = 0x24BDBC000uLL;

    }
    v44 = v4;
    -[PRXPasscodeEntryView removeFromSuperview](self->_passcodeEntryView, "removeFromSuperview");
    v18 = [PRXPasscodeEntryView alloc];
    if (self->_numberOfDigits)
      numberOfDigits = self->_numberOfDigits;
    else
      numberOfDigits = 4;
    v20 = -[PRXPasscodeEntryView initWithNumberOfDigits:useMonospacedFont:delegate:](v18, "initWithNumberOfDigits:useMonospacedFont:delegate:", numberOfDigits, self->_useMonospacedFont, self);
    passcodeEntryView = self->_passcodeEntryView;
    self->_passcodeEntryView = v20;

    -[PRXPasscodeEntryView setSemanticContentAttribute:](self->_passcodeEntryView, "setSemanticContentAttribute:", 3);
    -[PRXPasscodeEntryView setTranslatesAutoresizingMaskIntoConstraints:](self->_passcodeEntryView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PRXPasscodeEntryView addTarget:action:forControlEvents:](self->_passcodeEntryView, "addTarget:action:forControlEvents:", self, sel__textDidChange_, 4096);
    -[PRXCardContentViewController contentView](self, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", self->_passcodeEntryView);

    v39 = (void *)MEMORY[0x24BDD1628];
    -[PRXPasscodeEntryView leadingAnchor](self->_passcodeEntryView, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leadingAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintGreaterThanOrEqualToAnchor:", v41);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v23;
    -[PRXPasscodeEntryView centerXAnchor](self->_passcodeEntryView, "centerXAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerXAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v26;
    -[PRXPasscodeEntryView bottomAnchor](self->_passcodeEntryView, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bottomAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintLessThanOrEqualToAnchor:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v47[2] = v29;
    objc_msgSend(*(id *)(v5 + 3632), "arrayWithObjects:count:", v47, 3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "activateConstraints:", v30);

    v31 = self->_imageView;
    v32 = (void *)MEMORY[0x24BDD1628];
    -[PRXPasscodeEntryView topAnchor](self->_passcodeEntryView, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      -[PRXImageView bottomAnchor](self->_imageView, "bottomAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, 20.0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v35;
      v36 = &v46;
      v37 = v44;
    }
    else
    {
      v37 = v44;
      objc_msgSend(v44, "topAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintEqualToAnchor:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v35;
      v36 = &v45;
    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "activateConstraints:", v38);

  }
}

- (void)_textDidChange:(id)a3
{
  void (**textChangeHandler)(id, void *);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (**textEntryCompletionHandler)(id, void *);
  void *v10;
  id v11;

  v11 = a3;
  -[PRXPasscodeEntryViewController textDidChange:](self, "textDidChange:");
  textChangeHandler = (void (**)(id, void *))self->_textChangeHandler;
  if (textChangeHandler)
  {
    objc_msgSend(v11, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    textChangeHandler[2](textChangeHandler, v5);

  }
  objc_msgSend(v11, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  v8 = objc_msgSend(v11, "numberOfDigits");

  if (v7 == v8)
  {
    -[PRXPasscodeEntryViewController didCompleteTextEntry:](self, "didCompleteTextEntry:", v11);
    textEntryCompletionHandler = (void (**)(id, void *))self->_textEntryCompletionHandler;
    if (textEntryCompletionHandler)
    {
      objc_msgSend(v11, "text");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      textEntryCompletionHandler[2](textEntryCompletionHandler, v10);

    }
  }

}

- (void)_scrollToWells
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  if (-[PRXPasscodeEntryView isFirstResponder](self->_passcodeEntryView, "isFirstResponder"))
  {
    -[PRXCardContentViewController contentView](self, "contentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v6 = v5;
    -[PRXCardContentViewController contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v9 = v6 - v8;
    -[PRXPasscodeEntryView frame](self->_passcodeEntryView, "frame");
    v11 = v10;

    -[PRXPasscodeEntryView frame](self->_passcodeEntryView, "frame");
    if (v11 - v9 + v12 + 4.0 > 0.0)
      -[PRXCardContentViewController setContentOffset:animated:](self, "setContentOffset:animated:", 1, 0.0);
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)PRXPasscodeEntryViewController;
  v7 = a4;
  -[PRXCardContentViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __85__PRXPasscodeEntryViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_24CC31EC0;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v8);

}

uint64_t __85__PRXPasscodeEntryViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scrollToWells");
}

- (void)passcodeEntryViewDidBecomeFirstResponder:(id)a3
{
  if (self->_passcodeEntryView == a3)
    -[PRXPasscodeEntryViewController _scrollToWells](self, "_scrollToWells");
}

- (PRXPasscodeEntryView)passcodeEntryView
{
  return self->_passcodeEntryView;
}

- (int64_t)numberOfDigits
{
  return self->_numberOfDigits;
}

- (BOOL)useMonospacedFont
{
  return self->_useMonospacedFont;
}

- (PRXImageView)imageView
{
  return self->_imageView;
}

- (id)textChangeHandler
{
  return self->_textChangeHandler;
}

- (void)setTextChangeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1096);
}

- (id)textEntryCompletionHandler
{
  return self->_textEntryCompletionHandler;
}

- (void)setTextEntryCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1104);
}

- (UIImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong(&self->_textEntryCompletionHandler, 0);
  objc_storeStrong(&self->_textChangeHandler, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_passcodeEntryView, 0);
}

@end
