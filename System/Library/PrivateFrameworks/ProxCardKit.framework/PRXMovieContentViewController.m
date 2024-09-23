@implementation PRXMovieContentViewController

- (PRXMovieContentViewController)initWithMovieView:(id)a3 movieDimensions:(CGSize)a4 productHeight:(double)a5
{
  CGFloat height;
  CGFloat width;
  id v10;
  PRXMovieContentViewController *v11;
  PRXMovieContentViewController *v12;
  PRXMovieContentViewController *v13;
  objc_super v15;

  height = a4.height;
  width = a4.width;
  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PRXMovieContentViewController;
  v11 = -[PRXCardContentViewController initWithContentView:](&v15, sel_initWithContentView_, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_movieView, a3);
    v12->_movieDimensions.width = width;
    v12->_movieDimensions.height = height;
    v12->_productHeight = a5;
    v12->_fadeInDelay = 0.5;
    v12->_fadeInDuration = 1.5;
    v13 = v12;
  }

  return v12;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
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
  objc_super v47;
  _QWORD v48[12];

  v48[10] = *MEMORY[0x24BDAC8D0];
  v47.receiver = self;
  v47.super_class = (Class)PRXMovieContentViewController;
  -[PRXCardContentViewController viewDidLoad](&v47, sel_viewDidLoad);
  -[PRXMovieContentViewController movieView](self, "movieView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PRXMovieContentViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXMovieContentViewController movieView](self, "movieView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  -[PRXMovieContentViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXMovieContentViewController movieView](self, "movieView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendSubviewToBack:", v7);

  v8 = objc_alloc_init(MEMORY[0x24BDF6B78]);
  objc_msgSend(v8, "setIdentifier:", CFSTR("PRXMovieContentGuide"));
  -[PRXCardContentViewController contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addLayoutGuide:", v8);

  -[PRXCardContentViewController contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mainContentGuide");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (void *)MEMORY[0x24BDD1628];
  -[PRXMovieContentViewController movieView](self, "movieView");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "heightAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXMovieContentViewController movieDimensions](self, "movieDimensions");
  objc_msgSend(v44, "constraintEqualToConstant:", v12);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v43;
  -[PRXMovieContentViewController movieView](self, "movieView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "widthAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXMovieContentViewController movieDimensions](self, "movieDimensions");
  objc_msgSend(v41, "constraintEqualToConstant:");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v48[1] = v40;
  -[PRXMovieContentViewController movieView](self, "movieView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "centerXAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerXAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v36;
  -[PRXMovieContentViewController movieView](self, "movieView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "centerYAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerYAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:", v32);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v48[3] = v31;
  objc_msgSend(v8, "heightAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXMovieContentViewController productHeight](self, "productHeight");
  objc_msgSend(v30, "constraintEqualToConstant:");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v48[4] = v29;
  objc_msgSend(v8, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v48[5] = v26;
  objc_msgSend(v8, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v48[6] = v23;
  objc_msgSend(v8, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintGreaterThanOrEqualToAnchor:", v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v48[7] = v13;
  objc_msgSend(v8, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintLessThanOrEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v48[8] = v16;
  objc_msgSend(v8, "centerYAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v11;
  objc_msgSend(v11, "centerYAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v48[9] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "activateConstraints:", v20);

  if (-[PRXMovieContentViewController shouldFadeInElementsOnAppear](self, "shouldFadeInElementsOnAppear"))
    -[PRXMovieContentViewController hideAuxiliaryViews](self, "hideAuxiliaryViews");

}

- (void)viewWillAppear:(BOOL)a3
{
  double v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PRXMovieContentViewController;
  -[PRXMovieContentViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[PRXMovieContentViewController fadeInDuration](self, "fadeInDuration");
  v5 = v4;
  -[PRXMovieContentViewController fadeInDelay](self, "fadeInDelay");
  -[PRXMovieContentViewController fadeInAuxiliaryViewsOverDuration:delay:completion:](self, "fadeInAuxiliaryViewsOverDuration:delay:completion:", 0, v5, v6);
}

- (void)hideAuxiliaryViews
{
  -[PRXMovieContentViewController setAuxiliaryViewsAlpha:](self, "setAuxiliaryViewsAlpha:", 0.0);
}

- (void)fadeInAuxiliaryViewsOverDuration:(double)a3 delay:(double)a4 completion:(id)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];

  v8 = a5;
  v9 = (void *)MEMORY[0x24BDF6F90];
  v12 = v8;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __83__PRXMovieContentViewController_fadeInAuxiliaryViewsOverDuration_delay_completion___block_invoke;
  v13[3] = &unk_24CC31DB8;
  v13[4] = self;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __83__PRXMovieContentViewController_fadeInAuxiliaryViewsOverDuration_delay_completion___block_invoke_2;
  v11[3] = &unk_24CC32048;
  v10 = v8;
  objc_msgSend(v9, "animateWithDuration:delay:options:animations:completion:", 2, v13, v11, a3, a4);

}

uint64_t __83__PRXMovieContentViewController_fadeInAuxiliaryViewsOverDuration_delay_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAuxiliaryViewsAlpha:", 1.0);
}

uint64_t __83__PRXMovieContentViewController_fadeInAuxiliaryViewsOverDuration_delay_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setAuxiliaryViewsAlpha:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[PRXCardContentViewController contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleTextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", a3);

  -[PRXCardContentViewController contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subtitleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAlpha:", a3);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PRXCardContentViewController contentView](self, "contentView", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "auxiliaryViews");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "setAlpha:", a3);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (BOOL)shouldFadeInElementsOnAppear
{
  return self->_shouldFadeInElementsOnAppear;
}

- (void)setShouldFadeInElementsOnAppear:(BOOL)a3
{
  self->_shouldFadeInElementsOnAppear = a3;
}

- (double)fadeInDuration
{
  return self->_fadeInDuration;
}

- (void)setFadeInDuration:(double)a3
{
  self->_fadeInDuration = a3;
}

- (double)fadeInDelay
{
  return self->_fadeInDelay;
}

- (void)setFadeInDelay:(double)a3
{
  self->_fadeInDelay = a3;
}

- (UIView)movieView
{
  return self->_movieView;
}

- (CGSize)movieDimensions
{
  double width;
  double height;
  CGSize result;

  width = self->_movieDimensions.width;
  height = self->_movieDimensions.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)productHeight
{
  return self->_productHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movieView, 0);
}

@end
