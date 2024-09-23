@implementation IMDebugViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
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
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  _QWORD v62[4];
  id v63;
  id location;
  objc_super v65;
  _QWORD v66[9];

  v65.receiver = self;
  v65.super_class = (Class)IMDebugViewController;
  -[IMDebugViewController viewDidLoad](&v65, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v3, "setTitle:", CFSTR("Debug"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController view](self, "view"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  v56 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "dismiss");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v6, "setLeftBarButtonItem:", v56);

  v61 = objc_alloc_init((Class)UIStackView);
  objc_msgSend(v61, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v61, "setAxis:", 1);
  objc_msgSend(v61, "setSpacing:", 8.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v61, "setBackgroundColor:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController view](self, "view"));
  objc_msgSend(v8, "addSubview:", v61);

  -[IMDebugViewController setStackView:](self, "setStackView:", v61);
  v9 = objc_alloc((Class)UIImageView);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController screenShotPreviewImage](self, "screenShotPreviewImage"));
  v57 = objc_msgSend(v9, "initWithImage:", v10);

  objc_msgSend(v57, "setContentMode:", 1);
  LODWORD(v11) = 1132068864;
  objc_msgSend(v57, "setContentCompressionResistancePriority:forAxis:", 1, v11);
  objc_msgSend(v57, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController stackView](self, "stackView"));
  objc_msgSend(v12, "addArrangedSubview:", v57);

  -[IMDebugViewController setScreenShotImageView:](self, "setScreenShotImageView:", v57);
  v60 = objc_alloc_init((Class)UIView);
  LODWORD(v13) = 1148846080;
  objc_msgSend(v60, "setContentCompressionResistancePriority:forAxis:", 1, v13);
  objc_msgSend(v60, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v60, "setHidden:", 1);
  v58 = objc_msgSend(objc_alloc((Class)UIProgressView), "initWithProgressViewStyle:", 0);
  LODWORD(v14) = 1148846080;
  objc_msgSend(v58, "setContentCompressionResistancePriority:forAxis:", 1, v14);
  objc_msgSend(v58, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v60, "addSubview:", v58);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController stackView](self, "stackView"));
  objc_msgSend(v15, "addArrangedSubview:", v60);

  -[IMDebugViewController setProgressView:](self, "setProgressView:", v58);
  -[IMDebugViewController setProgressViewContainer:](self, "setProgressViewContainer:", v60);
  objc_initWeak(&location, self);
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = __36__IMDebugViewController_viewDidLoad__block_invoke;
  v62[3] = &unk_104B8;
  objc_copyWeak(&v63, &location);
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v62));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration filledButtonConfiguration](UIButtonConfiguration, "filledButtonConfiguration"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v16, v55));

  objc_msgSend(v59, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v17) = 1148846080;
  objc_msgSend(v59, "setContentCompressionResistancePriority:forAxis:", 1, v17);
  LODWORD(v18) = 1148846080;
  objc_msgSend(v59, "setContentHuggingPriority:forAxis:", 1, v18);
  objc_msgSend(v59, "setTitle:forState:", CFSTR("Share Debug Data"), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController stackView](self, "stackView"));
  objc_msgSend(v19, "addArrangedSubview:", v59);

  -[IMDebugViewController setActionButton:](self, "setActionButton:", v59);
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "topAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController view](self, "view"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "safeAreaLayoutGuide"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "topAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v51, 1.0));
  v66[0] = v50;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController view](self, "view"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "safeAreaLayoutGuide"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "bottomAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "bottomAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v46, 1.0));
  v66[1] = v45;
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "leadingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController view](self, "view"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "safeAreaLayoutGuide"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:", v41, 16.0));
  v66[2] = v40;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "trailingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController view](self, "view"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "safeAreaLayoutGuide"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "trailingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:constant:", v36, -16.0));
  v66[3] = v35;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "heightAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintGreaterThanOrEqualToConstant:", 44.0));
  v66[4] = v33;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "heightAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "heightAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v31));
  v66[5] = v30;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
  v66[6] = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
  v66[7] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "centerYAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "centerYAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v27));
  v66[8] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v66, 9));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v29);

  objc_destroyWeak(&v63);
  objc_destroyWeak(&location);

}

void __36__IMDebugViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "gatherData");

}

- (void)gatherData
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController progressViewContainer](self, "progressViewContainer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController progressView](self, "progressView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController actionButton](self, "actionButton"));
  LODWORD(v6) = 0;
  objc_msgSend(v4, "setProgress:", v6);
  objc_msgSend(v3, "setHidden:", 0);
  objc_msgSend(v5, "setHidden:", 1);
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __35__IMDebugViewController_gatherData__block_invoke;
  v14[3] = &unk_104E0;
  v7 = v4;
  v15 = v7;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __35__IMDebugViewController_gatherData__block_invoke_2;
  v10[3] = &unk_10508;
  objc_copyWeak(&v13, &location);
  v8 = v3;
  v11 = v8;
  v9 = v5;
  v12 = v9;
  +[IMDebugDataManager writeDebugData:completion:](IMDebugDataManager, "writeDebugData:completion:", v14, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

id __35__IMDebugViewController_gatherData__block_invoke(uint64_t a1, double a2)
{
  *(float *)&a2 = a2;
  return objc_msgSend(*(id *)(a1 + 32), "setProgress:", a2);
}

void __35__IMDebugViewController_gatherData__block_invoke_2(id *a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  id v6;

  v3 = a1 + 6;
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setDataUrl:", v4);

  objc_msgSend(a1[4], "setHidden:", 1);
  objc_msgSend(a1[5], "setHidden:", 0);
  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "shareData");

}

- (void)shareData
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController dataUrl](self, "dataUrl"));

  if (v3)
  {
    v4 = objc_alloc((Class)UIActivityViewController);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController dataUrl](self, "dataUrl"));
    v10 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
    v7 = objc_msgSend(v4, "initWithActivityItems:applicationActivities:", v6, 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController actionButton](self, "actionButton"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "popoverPresentationController"));
    objc_msgSend(v9, "setSourceView:", v8);

    -[IMDebugViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  }
}

- (void)dismiss
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[IMDebugViewController presentingViewController](self, "presentingViewController"));
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)setScreenShotImage:(id)a3
{
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
  double v11;
  CGFloat v12;
  UIImage *ImageFromCurrentImageContext;
  UIImage *v14;
  UIImage *screenShotPreviewImage;
  void *v16;
  id v17;
  CGSize v18;

  objc_storeStrong((id *)&self->_screenShotImage, a3);
  v5 = a3;
  objc_msgSend(v5, "size");
  v7 = v6 * 0.5;
  objc_msgSend(v5, "size");
  v9 = v8 * 0.5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v10, "scale");
  v12 = v11;
  v18.width = v7;
  v18.height = v9;
  UIGraphicsBeginImageContextWithOptions(v18, 0, v12);

  objc_msgSend(v5, "drawInRect:", 0.0, 0.0, v7, v9);
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v14 = (UIImage *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();
  screenShotPreviewImage = self->_screenShotPreviewImage;
  self->_screenShotPreviewImage = v14;

  v17 = (id)objc_claimAutoreleasedReturnValue(-[IMDebugViewController screenShotImageView](self, "screenShotImageView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[IMDebugViewController screenShotPreviewImage](self, "screenShotPreviewImage"));
  objc_msgSend(v17, "setImage:", v16);

}

- (UIImage)screenShotImage
{
  return self->_screenShotImage;
}

- (UIImage)screenShotPreviewImage
{
  return self->_screenShotPreviewImage;
}

- (void)setScreenShotPreviewImage:(id)a3
{
  objc_storeStrong((id *)&self->_screenShotPreviewImage, a3);
}

- (NSURL)dataUrl
{
  return self->_dataUrl;
}

- (void)setDataUrl:(id)a3
{
  objc_storeStrong((id *)&self->_dataUrl, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UIImageView)screenShotImageView
{
  return self->_screenShotImageView;
}

- (void)setScreenShotImageView:(id)a3
{
  objc_storeStrong((id *)&self->_screenShotImageView, a3);
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
  objc_storeStrong((id *)&self->_actionButton, a3);
}

- (UIView)progressViewContainer
{
  return self->_progressViewContainer;
}

- (void)setProgressViewContainer:(id)a3
{
  objc_storeStrong((id *)&self->_progressViewContainer, a3);
}

- (UIProgressView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_progressViewContainer, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_screenShotImageView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_dataUrl, 0);
  objc_storeStrong((id *)&self->_screenShotPreviewImage, 0);
  objc_storeStrong((id *)&self->_screenShotImage, 0);
}

@end
