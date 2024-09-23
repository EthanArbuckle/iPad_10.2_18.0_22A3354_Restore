@implementation OfflineEmptyStateCollectionViewCell

- (OfflineEmptyStateCollectionViewCell)initWithFrame:(CGRect)a3
{
  OfflineEmptyStateCollectionViewCell *v3;
  OfflineEmptyStateCollectionViewCell *v4;
  double left;
  double bottom;
  double right;
  void *v8;
  _TtC4Maps14EmptyStateView *v9;
  _TtC4Maps14EmptyStateView *emptyStateView;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  OfflineEmptyStateCollectionViewCell *v20;
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
  objc_super v43;
  _QWORD v44[6];

  v43.receiver = self;
  v43.super_class = (Class)OfflineEmptyStateCollectionViewCell;
  v3 = -[OfflineEmptyStateCollectionViewCell initWithFrame:](&v43, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineEmptyStateCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v8, "setLayoutMargins:", UIEdgeInsetsZero.top, left, bottom, right);

    v9 = objc_alloc_init(_TtC4Maps14EmptyStateView);
    emptyStateView = v4->_emptyStateView;
    v4->_emptyStateView = v9;

    -[EmptyStateView setTranslatesAutoresizingMaskIntoConstraints:](v4->_emptyStateView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineEmptyStateCollectionViewCell contentView](v4, "contentView"));
    objc_msgSend(v11, "addSubview:", v4->_emptyStateView);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[EmptyStateView topAnchor](v4->_emptyStateView, "topAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineEmptyStateCollectionViewCell contentView](v4, "contentView"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "layoutMarginsGuide"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "topAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintGreaterThanOrEqualToAnchor:", v39));
    v44[0] = v38;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[EmptyStateView leadingAnchor](v4->_emptyStateView, "leadingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineEmptyStateCollectionViewCell contentView](v4, "contentView"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "layoutMarginsGuide"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "leadingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintGreaterThanOrEqualToAnchor:", v34));
    v44[1] = v33;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[EmptyStateView trailingAnchor](v4->_emptyStateView, "trailingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineEmptyStateCollectionViewCell contentView](v4, "contentView"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "layoutMarginsGuide"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "trailingAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintLessThanOrEqualToAnchor:", v29));
    v44[2] = v28;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[EmptyStateView bottomAnchor](v4->_emptyStateView, "bottomAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineEmptyStateCollectionViewCell contentView](v4, "contentView"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "layoutMarginsGuide"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bottomAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintLessThanOrEqualToAnchor:", v24));
    v44[3] = v23;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[EmptyStateView centerXAnchor](v4->_emptyStateView, "centerXAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineEmptyStateCollectionViewCell contentView](v4, "contentView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "centerXAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v13));
    v44[4] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[EmptyStateView centerYAnchor](v4->_emptyStateView, "centerYAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineEmptyStateCollectionViewCell contentView](v4, "contentView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "centerYAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v17));
    v44[5] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 6));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

    -[EmptyStateView setAccessibilityIdentifier:](v4->_emptyStateView, "setAccessibilityIdentifier:", CFSTR("EmptyStateView"));
    v20 = v4;
  }

  return v4;
}

- (_TtC4Maps14EmptyStateView)emptyStateView
{
  return self->_emptyStateView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emptyStateView, 0);
}

@end
