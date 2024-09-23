@implementation CardTestContainee

- (CardTestContainee)initWithContext:(id)a3
{
  id v4;
  CardTestContainee *v5;
  CardTestContainee *v6;
  void *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  id v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CardTestContainee;
  v5 = -[CardTestContainee init](&v17, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_context, v4);
    -[ContaineeViewController setContaineeDelegate:](v6, "setContaineeDelegate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v6, "cardPresentationController"));
    objc_msgSend(v7, "setAllowResizeInFloatingStyle:", 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v6, "cardPresentationController"));
    objc_msgSend(v8, "setDefaultContaineeLayout:", 2);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v6, "cardPresentationController"));
    objc_msgSend(v9, "setBlurInCardView:", 0);

    WeakRetained = objc_loadWeakRetained((id *)&v6->_context);
    if (WeakRetained)
    {
      v11 = objc_loadWeakRetained((id *)&v6->_context);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "containees"));
      v13 = (float)((float)((unint64_t)objc_msgSend(v12, "count") % 0xA) * 0.1);

    }
    else
    {
      v13 = 0.0;
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", v13, 0.699999988, 0.899999976, 1.0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v6, "cardPresentationController"));
    objc_msgSend(v15, "setCardColor:", v14);

  }
  return v6;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  const char *v11;
  id v12;
  void *v13;
  void *v15;
  id WeakRetained;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CardTestContainee;
  v3 = -[CardTestContainee description](&v17, "description");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "chromeViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contexts"));
  v6 = objc_loadWeakRetained((id *)&self->_context);
  v7 = objc_msgSend(v5, "indexOfObject:", v6);
  v8 = objc_loadWeakRetained((id *)&self->_context);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "containees"));
  v10 = objc_msgSend(v9, "indexOfObject:", self);
  if ((id)-[ContaineeViewController preferredPresentationStyle](self, "preferredPresentationStyle") == (id)3)
    v11 = "popover";
  else
    v11 = "card";
  v12 = objc_loadWeakRetained((id *)&self->_context);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %lu.%lu %s (context: %@)"), v15, v7, v10, v11, v12));

  return v13;
}

- (void)viewDidLoad
{
  UIColor *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CardTestContainee;
  -[ContaineeViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = +[UIColor colorWithHue:saturation:brightness:alpha:](UIColor, "colorWithHue:saturation:brightness:alpha:", (float)((float)(arc4random() % 0x64) / 100.0), 0.800000012, 0.800000012, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CardTestContainee view](self, "view"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[CardTestContainee _createSubviews](self, "_createSubviews");
}

- (void)_createSubviews
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  UILabel *v17;
  UILabel *containeeLabel;
  void *v19;
  uint64_t v20;
  UILabel *v21;
  UILabel *contextLabel;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
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
  id v77;
  void *v78;
  void *v79;
  id v80;
  _QWORD v81[4];
  id v82;
  _QWORD v83[4];
  id v84;
  _QWORD v85[5];
  _QWORD v86[5];
  _QWORD v87[5];
  _QWORD v88[5];
  _QWORD v89[5];
  _QWORD v90[5];
  _QWORD v91[13];
  _QWORD v92[2];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v90[0] = _NSConcreteStackBlock;
  v90[1] = 3221225472;
  v90[2] = sub_10047CD7C;
  v90[3] = &unk_1011B2810;
  v90[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", CFSTR("Pop"), 0, 0, v90));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:primaryAction:](UIButton, "buttonWithType:primaryAction:", 1, v4));
  objc_msgSend(v3, "addObject:", v5);

  v89[0] = _NSConcreteStackBlock;
  v89[1] = 3221225472;
  v89[2] = sub_10047CDB4;
  v89[3] = &unk_1011B2810;
  v89[4] = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", CFSTR("Push"), 0, 0, v89));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:primaryAction:](UIButton, "buttonWithType:primaryAction:", 1, v6));
  objc_msgSend(v3, "addObject:", v7);

  v8 = objc_alloc_init((Class)NSMutableArray);
  v88[0] = _NSConcreteStackBlock;
  v88[1] = 3221225472;
  v88[2] = sub_10047CDEC;
  v88[3] = &unk_1011B2810;
  v88[4] = self;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", CFSTR("Pop"), 0, 0, v88));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:primaryAction:](UIButton, "buttonWithType:primaryAction:", 1, v9));
  objc_msgSend(v8, "addObject:", v10);

  v87[0] = _NSConcreteStackBlock;
  v87[1] = 3221225472;
  v87[2] = sub_10047CE24;
  v87[3] = &unk_1011B2810;
  v87[4] = self;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", CFSTR("Push"), 0, 0, v87));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:primaryAction:](UIButton, "buttonWithType:primaryAction:", 1, v11));
  objc_msgSend(v8, "addObject:", v12);

  v86[0] = _NSConcreteStackBlock;
  v86[1] = 3221225472;
  v86[2] = sub_10047CE5C;
  v86[3] = &unk_1011B2810;
  v86[4] = self;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", CFSTR("Push (No Floating Controls)"), 0, 0, v86));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:primaryAction:](UIButton, "buttonWithType:primaryAction:", 1, v13));
  objc_msgSend(v8, "addObject:", v14);

  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &stru_1011B7D70);
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &stru_1011B7D70);
  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472;
  v85[2] = sub_10047CF1C;
  v85[3] = &unk_1011B7D98;
  v85[4] = self;
  v15 = objc_retainBlock(v85);
  v16 = ((uint64_t (*)(void))v15[2])();
  v17 = (UILabel *)objc_claimAutoreleasedReturnValue(v16);
  containeeLabel = self->_containeeLabel;
  self->_containeeLabel = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CardTestContainee view](self, "view"));
  objc_msgSend(v19, "addSubview:", self->_containeeLabel);

  v79 = v15;
  v20 = ((uint64_t (*)(_QWORD *))v15[2])(v15);
  v21 = (UILabel *)objc_claimAutoreleasedReturnValue(v20);
  contextLabel = self->_contextLabel;
  self->_contextLabel = v21;

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CardTestContainee view](self, "view"));
  objc_msgSend(v23, "addSubview:", self->_contextLabel);

  v75 = v3;
  v24 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithArrangedSubviews:", v3);
  objc_msgSend(v24, "setDistribution:", 2);
  objc_msgSend(v24, "setAxis:", 1);
  v78 = v24;
  objc_msgSend(v24, "setSpacing:", 20.0);
  v76 = v8;
  v77 = objc_msgSend(objc_alloc((Class)UIStackView), "initWithArrangedSubviews:", v8);
  objc_msgSend(v77, "setDistribution:", 2);
  objc_msgSend(v77, "setAxis:", 1);
  objc_msgSend(v77, "setSpacing:", 20.0);
  v25 = objc_alloc((Class)UIStackView);
  v92[0] = v77;
  v92[1] = v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v92, 2));
  v27 = objc_msgSend(v25, "initWithArrangedSubviews:", v26);

  objc_msgSend(v27, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v27, "setDistribution:", 1);
  objc_msgSend(v27, "setAlignment:", 1);
  objc_msgSend(v27, "setAxis:", 0);
  objc_msgSend(v27, "setSpacing:", 20.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CardTestContainee view](self, "view"));
  objc_msgSend(v28, "addSubview:", v27);

  v83[0] = _NSConcreteStackBlock;
  v83[1] = 3221225472;
  v83[2] = sub_10047D018;
  v83[3] = &unk_1011B2928;
  v29 = objc_alloc_init((Class)NSMutableArray);
  v84 = v29;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v83);
  v81[0] = _NSConcreteStackBlock;
  v81[1] = 3221225472;
  v81[2] = sub_10047D074;
  v81[3] = &unk_1011B2928;
  v82 = v29;
  v80 = v29;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v81);
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_contextLabel, "topAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[CardTestContainee view](self, "view"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "topAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:constant:", v72, 20.0));
  v91[0] = v71;
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_containeeLabel, "topAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_contextLabel, "topAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:", v69));
  v91[1] = v68;
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_containeeLabel, "bottomAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_contextLabel, "bottomAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:", v66));
  v91[2] = v65;
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_contextLabel, "leadingAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[CardTestContainee view](self, "view"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "leadingAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:constant:", v62, 20.0));
  v91[3] = v61;
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](self->_containeeLabel, "leadingAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_contextLabel, "trailingAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:constant:", v59, 10.0));
  v91[4] = v58;
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[CardTestContainee view](self, "view"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "trailingAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_containeeLabel, "trailingAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToAnchor:constant:", v55, 20.0));
  v91[5] = v54;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->_contextLabel, "widthAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](self->_containeeLabel, "widthAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v52));
  v91[6] = v51;
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "heightAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintGreaterThanOrEqualToConstant:", 100.0));
  v91[7] = v49;
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "heightAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintLessThanOrEqualToConstant:", 200.0));
  v91[8] = v47;
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "topAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_contextLabel, "bottomAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:constant:", v45, 20.0));
  v91[9] = v44;
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CardTestContainee view](self, "view"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:", v41, 20.0));
  v91[10] = v40;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CardTestContainee view](self, "view"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "trailingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "trailingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v32, 20.0));
  v91[11] = v33;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CardTestContainee view](self, "view"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "bottomAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bottomAnchor"));
  LODWORD(v37) = 1144733696;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:constant:priority:", v36, 60.0, v37));
  v91[12] = v38;
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v91, 13));
  objc_msgSend(v80, "addObjectsFromArray:", v39);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v80);
}

- (void)viewWillAppear:(BOOL)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CardTestContainee;
  -[ContaineeViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Containee %lu"), objc_msgSend(WeakRetained, "indexOfContainee:", self)));
  -[UILabel setText:](self->_containeeLabel, "setText:", v5);

  v6 = objc_loadWeakRetained((id *)&self->_context);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Context %lu"), objc_msgSend(v6, "indexOfContext")));
  -[UILabel setText:](self->_contextLabel, "setText:", v7);

}

- (double)heightForLayout:(unint64_t)a3
{
  double result;
  void *v4;
  double v5;
  double v6;

  if (a3 - 3 < 2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v4, "availableHeight");
    v6 = v5;

    return v6;
  }
  else if (a3 == 1)
  {
    return 88.0;
  }
  else if (a3 == 2)
  {
    sub_1005EC2E4();
  }
  else
  {
    return -1.0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containeeLabel, 0);
  objc_storeStrong((id *)&self->_contextLabel, 0);
  objc_destroyWeak((id *)&self->_context);
}

@end
