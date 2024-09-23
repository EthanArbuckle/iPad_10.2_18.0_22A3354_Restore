@implementation PRXScannerViewController

- (PRXScannerViewController)initWithScannerEngine:(id)a3
{
  id v5;
  PRXScannerViewController *v6;
  PRXScannerViewController *v7;
  PRXScannerIndicatorView *v8;
  PRXScannerIndicatorView *indicatorView;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PRXScannerViewController;
  v6 = -[PRXCardContentViewController initWithContentView:](&v11, sel_initWithContentView_, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_scannerEngine, a3);
    v8 = objc_alloc_init(PRXScannerIndicatorView);
    indicatorView = v7->_indicatorView;
    v7->_indicatorView = v8;

  }
  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
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
  double v38;
  double v39;
  double v40;
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
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  objc_super v89;
  _QWORD v90[15];

  v90[13] = *MEMORY[0x24BDAC8D0];
  v89.receiver = self;
  v89.super_class = (Class)PRXScannerViewController;
  -[PRXCardContentViewController viewDidLoad](&v89, sel_viewDidLoad);
  -[PRXCardContentViewController setDismissalType:](self, "setDismissalType:", 1);
  -[PRXScannerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClipsToBounds:", 1);

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXCardContentViewController contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[PRXCardContentViewController contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOpaque:", 0);

  -[PRXCardContentViewController contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "titleView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setOpaque:", 0);

  -[PRXScannerViewController indicatorView](self, "indicatorView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PRXScannerViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXScannerViewController indicatorView](self, "indicatorView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v11);

  -[PRXScannerViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXScannerViewController indicatorView](self, "indicatorView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendSubviewToBack:", v13);

  -[PRXScannerViewController scannerEngine](self, "scannerEngine");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXScannerViewController addChildViewController:](self, "addChildViewController:", v14);

  -[PRXScannerViewController scannerEngine](self, "scannerEngine");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[PRXScannerViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXScannerViewController scannerEngine](self, "scannerEngine");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", v19);

  -[PRXScannerViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXScannerViewController scannerEngine](self, "scannerEngine");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sendSubviewToBack:", v22);

  v23 = objc_alloc_init(MEMORY[0x24BDF6B78]);
  objc_msgSend(v23, "setIdentifier:", CFSTR("PRXScannerIndicator"));
  -[PRXCardContentViewController contentView](self, "contentView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addLayoutGuide:", v23);

  -[PRXCardContentViewController contentView](self, "contentView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "mainContentGuide");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[PRXScannerViewController scannerEngine](self, "scannerEngine");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v65 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v28, "leftAnchor");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXScannerViewController view](self, "view");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "leftAnchor");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "constraintEqualToAnchor:", v86);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v90[0] = v85;
  objc_msgSend(v28, "rightAnchor");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXScannerViewController view](self, "view");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "rightAnchor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "constraintEqualToAnchor:", v82);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v28;
  v90[1] = v80;
  objc_msgSend(v28, "heightAnchor");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXScannerViewController view](self, "view");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "heightAnchor");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "constraintEqualToAnchor:multiplier:", v77, 2.0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v90[2] = v76;
  objc_msgSend(v28, "centerYAnchor");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXScannerViewController view](self, "view");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "centerYAnchor");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "constraintEqualToAnchor:", v73);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v90[3] = v72;
  -[PRXScannerViewController indicatorView](self, "indicatorView");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "leftAnchor");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXScannerViewController view](self, "view");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "leftAnchor");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "constraintEqualToAnchor:", v68);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v90[4] = v67;
  -[PRXScannerViewController indicatorView](self, "indicatorView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "rightAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXScannerViewController view](self, "view");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "rightAnchor");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:", v62);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v90[5] = v61;
  -[PRXScannerViewController indicatorView](self, "indicatorView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "heightAnchor");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXScannerViewController view](self, "view");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "heightAnchor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "constraintEqualToAnchor:multiplier:", v55, 3.0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v90[6] = v54;
  -[PRXScannerViewController indicatorView](self, "indicatorView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "centerYAnchor");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "centerYAnchor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "constraintEqualToAnchor:", v51);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v90[7] = v50;
  objc_msgSend(v23, "topAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "topAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToAnchor:", v48);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v90[8] = v47;
  objc_msgSend(v23, "bottomAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bottomAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "constraintEqualToAnchor:", v45);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v90[9] = v44;
  objc_msgSend(v23, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v26;
  v60 = v26;
  objc_msgSend(v26, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "constraintEqualToAnchor:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v90[10] = v31;
  v59 = v23;
  objc_msgSend(v23, "trailingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "trailingAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v90[11] = v34;
  objc_msgSend(v23, "heightAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRXScannerViewController view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "widthAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[PRXScannerIndicatorView innerHoleRatio](PRXScannerIndicatorView, "innerHoleRatio");
  v39 = v38;
  +[PRXScannerIndicatorView strokeWidth](PRXScannerIndicatorView, "strokeWidth");
  objc_msgSend(v35, "constraintEqualToAnchor:multiplier:constant:", v37, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v90[12] = v41;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v90, 13);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "activateConstraints:", v42);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PRXScannerViewController;
  -[PRXScannerViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[PRXScannerViewController indicatorView](self, "indicatorView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reset");

}

- (void)showConfirmationRing
{
  id v2;

  -[PRXScannerViewController indicatorView](self, "indicatorView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "complete");

}

- (void)resetConfirmationRing
{
  id v2;

  -[PRXScannerViewController indicatorView](self, "indicatorView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reset");

}

- (UIViewController)scannerEngine
{
  return self->_scannerEngine;
}

- (PRXScannerIndicatorView)indicatorView
{
  return self->_indicatorView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicatorView, 0);
  objc_storeStrong((id *)&self->_scannerEngine, 0);
}

@end
