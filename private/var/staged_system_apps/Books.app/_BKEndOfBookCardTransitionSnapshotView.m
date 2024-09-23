@implementation _BKEndOfBookCardTransitionSnapshotView

- (_BKEndOfBookCardTransitionSnapshotView)initWithCompactViewController:(id)a3
{
  id v4;
  _BKEndOfBookCardTransitionSnapshotView *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  UIView *snapshot;
  void *v13;
  double x;
  double y;
  double width;
  double height;
  double v18;
  double v19;
  UIView *v20;
  UIView *backgroundView;
  uint64_t v22;
  UIView *closeButtonView;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSLayoutConstraint *snapshotTopConstraint;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
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
  id v68;
  objc_super v69;
  _QWORD v70[10];
  CGRect v71;
  CGRect v72;

  v4 = a3;
  v69.receiver = self;
  v69.super_class = (Class)_BKEndOfBookCardTransitionSnapshotView;
  v5 = -[_BKEndOfBookToastBlurEffectView init](&v69, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "feedViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "backgroundColor"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    objc_msgSend(v9, "setBackgroundColor:", 0);

    v67 = v6;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "snapshotViewAfterScreenUpdates:", 0));
    snapshot = v5->_snapshot;
    v5->_snapshot = (UIView *)v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    v66 = (void *)v8;
    objc_msgSend(v13, "setBackgroundColor:", v8);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5->_snapshot, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView bounds](v5->_snapshot, "bounds");
    x = v71.origin.x;
    y = v71.origin.y;
    width = v71.size.width;
    height = v71.size.height;
    v18 = CGRectGetHeight(v71);
    v72.origin.x = x;
    v72.origin.y = y;
    v72.size.width = width;
    v72.size.height = height;
    v19 = v18 / CGRectGetWidth(v72);
    -[_BKEndOfBookCardTransitionSnapshotView setFrame:](v5, "setFrame:", x, y, width, height);
    v20 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", x, y, width, height);
    backgroundView = v5->_backgroundView;
    v5->_backgroundView = v20;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setBackgroundColor:](v5->_backgroundView, "setBackgroundColor:", v8);
    v22 = objc_claimAutoreleasedReturnValue(+[BCCardGripperView cardGripperViewWithStyle:](BCCardGripperView, "cardGripperViewWithStyle:", 1));
    closeButtonView = v5->_closeButtonView;
    v5->_closeButtonView = (UIView *)v22;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5->_closeButtonView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_BKEndOfBookCardTransitionSnapshotView addSubview:](v5, "addSubview:", v5->_backgroundView);
    -[_BKEndOfBookCardTransitionSnapshotView addSubview:](v5, "addSubview:", v5->_snapshot);
    -[_BKEndOfBookCardTransitionSnapshotView addSubview:](v5, "addSubview:", v5->_closeButtonView);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v5->_snapshot, "topAnchor"));
    v68 = v4;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](v5->_snapshot, "superview"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v26, 0.0));
    snapshotTopConstraint = v5->_snapshotTopConstraint;
    v5->_snapshotTopConstraint = (NSLayoutConstraint *)v27;

    v70[0] = v5->_snapshotTopConstraint;
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leftAnchor](v5->_snapshot, "leftAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](v5->_snapshot, "superview"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "leftAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:", v63));
    v70[1] = v62;
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[UIView rightAnchor](v5->_snapshot, "rightAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](v5->_snapshot, "superview"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "rightAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v59));
    v70[2] = v58;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v5->_snapshot, "heightAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v5->_snapshot, "widthAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:multiplier:", v56, v19));
    v70[3] = v55;
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v5->_backgroundView, "topAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](v5->_backgroundView, "superview"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "topAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v52));
    v70[4] = v51;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leftAnchor](v5->_backgroundView, "leftAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](v5->_backgroundView, "superview"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "leftAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v48));
    v70[5] = v47;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UIView rightAnchor](v5->_backgroundView, "rightAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](v5->_backgroundView, "superview"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "rightAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v44));
    v70[6] = v43;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v5->_backgroundView, "bottomAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](v5->_backgroundView, "superview"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "bottomAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
    v70[7] = v39;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v5->_closeButtonView, "topAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](v5->_closeButtonView, "superview"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v31, 15.0));
    v70[8] = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v5->_closeButtonView, "trailingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](v5->_closeButtonView, "superview"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "trailingAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:", v35, -14.5));
    v70[9] = v36;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v70, 10));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v37);

    v4 = v68;
  }

  return v5;
}

- (double)snapshotTopOffset
{
  double result;

  -[NSLayoutConstraint constant](self->_snapshotTopConstraint, "constant");
  return result;
}

- (void)setSnapshotTopOffset:(double)a3
{
  -[NSLayoutConstraint setConstant:](self->_snapshotTopConstraint, "setConstant:", a3);
}

- (void)setupConstraintsToSuperview
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
  _QWORD v20[4];

  -[_BKEndOfBookCardTransitionSnapshotView setTranslatesAutoresizingMaskIntoConstraints:](self, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[_BKEndOfBookCardTransitionSnapshotView topAnchor](self, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[_BKEndOfBookCardTransitionSnapshotView superview](self, "superview"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v17));
  v20[0] = v16;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_BKEndOfBookCardTransitionSnapshotView bottomAnchor](self, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_BKEndOfBookCardTransitionSnapshotView superview](self, "superview"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v13));
  v20[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_BKEndOfBookCardTransitionSnapshotView leftAnchor](self, "leftAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_BKEndOfBookCardTransitionSnapshotView superview](self, "superview"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leftAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));
  v20[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_BKEndOfBookCardTransitionSnapshotView rightAnchor](self, "rightAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_BKEndOfBookCardTransitionSnapshotView superview](self, "superview"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rightAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v20[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (UIView)snapshot
{
  return self->_snapshot;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (UIView)closeButtonView
{
  return self->_closeButtonView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closeButtonView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_snapshotTopConstraint, 0);
}

@end
