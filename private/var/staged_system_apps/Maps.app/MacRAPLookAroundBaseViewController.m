@implementation MacRAPLookAroundBaseViewController

- (void)setupHeaderViewWithLocationInfo:(id)a3 tableView:(id)a4
{
  TwoLinesContentView *v5;
  id v6;
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
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  _QWORD v35[4];

  v32 = a4;
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[TwoLinesContentViewModelComposer cellModelForLocationInfo:](TwoLinesContentViewModelComposer, "cellModelForLocationInfo:", a3));
  v5 = objc_alloc_init(TwoLinesContentView);
  -[TwoLinesContentView setViewModel:](v5, "setViewModel:", v33);
  -[TwoLinesContentView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = objc_alloc_init((Class)UIView);
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "addSubview:", v5);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView leadingAnchor](v5, "leadingAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, 30.0));
  v35[0] = v29;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView trailingAnchor](v5, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v27, -30.0));
  v35[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView topAnchor](v5, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, 5.0));
  v35[2] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView bottomAnchor](v5, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, -10.0));
  v35[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);

  objc_msgSend(v32, "setTableHeaderView:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "tableHeaderView"));
  objc_msgSend(v15, "setNeedsLayout");

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "tableHeaderView"));
  objc_msgSend(v16, "layoutIfNeeded");

  objc_msgSend(v6, "frame");
  v18 = v17;
  v20 = v19;
  objc_msgSend(v6, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  objc_msgSend(v6, "setFrame:", v18, v20, v21, v22);
  objc_msgSend(v32, "setTableHeaderView:", v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "widthAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "widthAnchor"));

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
  v34 = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v34, 1));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v26);

}

@end
