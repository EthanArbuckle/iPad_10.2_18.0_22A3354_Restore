@implementation VideosExtrasActivityIndicatorElementViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  VideosExtrasActivityIndicator *v6;
  void *v7;
  VideosExtrasActivityIndicator *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  VideosExtrasActivityIndicator *activityView;
  VideosExtrasActivityIndicator *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  objc_super v32;
  _QWORD v33[4];

  v33[3] = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)VideosExtrasActivityIndicatorElementViewController;
  -[VideosExtrasViewElementViewController viewDidLoad](&v32, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4028]), "initWithPrivateStyle:", 2030);
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", 5.0);

  objc_msgSend(v3, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMasksToBounds:", 1);

  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "setGroupName:", CFSTR("VideosExtrasBlurGroupName"));
  v6 = [VideosExtrasActivityIndicator alloc];
  -[VideosExtrasViewElementViewController viewElement](self, "viewElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VideosExtrasActivityIndicator initWithElement:](v6, "initWithElement:", v7);

  LODWORD(v9) = 1144750080;
  -[VideosExtrasActivityIndicator setContentHuggingPriority:forAxis:](v8, "setContentHuggingPriority:forAxis:", 0, v9);
  LODWORD(v10) = 1144750080;
  -[VideosExtrasActivityIndicator setContentHuggingPriority:forAxis:](v8, "setContentHuggingPriority:forAxis:", 1, v10);
  -[VideosExtrasActivityIndicator setAlpha:](v8, "setAlpha:", 1.0);
  -[VideosExtrasActivityIndicatorElementViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v3);

  -[VideosExtrasActivityIndicator setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VideosExtrasActivityIndicatorElementViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v8);

  activityView = self->_activityView;
  self->_activityView = v8;
  v14 = v8;

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsByAttachingView:toView:alongEdges:insets:", v3, v14, 15, *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasActivityIndicatorElementViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addConstraints:", v15);

  v17 = (void *)MEMORY[0x1E0CB3718];
  -[VideosExtrasActivityIndicatorElementViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintsByCenteringView:withView:alongAxes:offset:", v14, v18, 3, *MEMORY[0x1E0DC51A8], *(double *)(MEMORY[0x1E0DC51A8] + 8));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[VideosExtrasActivityIndicatorElementViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addConstraints:", v19);

  v21 = (void *)MEMORY[0x1E0CB3718];
  -[VideosExtrasActivityIndicatorElementViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 7, 1, v22, 7, 0.1125, 0.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v24) = 1148829696;
  objc_msgSend(v23, "setPriority:", v24);
  v25 = (void *)MEMORY[0x1E0CB3718];
  -[VideosExtrasActivityIndicatorElementViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 8, 1, v26, 8, 0.1125, 0.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v28) = 1148829696;
  objc_msgSend(v27, "setPriority:", v28);
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 8, 0, v14, 7, 1.0, 0.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosExtrasActivityIndicatorElementViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v23;
  v33[1] = v27;
  v33[2] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "addConstraints:", v31);
}

- (BOOL)matchParentHeight
{
  return 1;
}

- (void)_prepareLayout
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VideosExtrasActivityIndicatorElementViewController;
  -[VideosExtrasElementViewController _prepareLayout](&v5, sel__prepareLayout);
  -[VideosExtrasElementViewController backgroundViewController](self, "backgroundViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVignetteType:", 3);

  -[VideosExtrasActivityIndicatorElementViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bringSubviewToFront:", self->_activityView);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityView, 0);
}

@end
