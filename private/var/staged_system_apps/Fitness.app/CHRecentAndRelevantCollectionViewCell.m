@implementation CHRecentAndRelevantCollectionViewCell

- (void)setCollectionView:(id)a3
{
  UICollectionView *v5;
  UICollectionView **p_collectionView;
  UICollectionView *collectionView;
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
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];

  v5 = (UICollectionView *)a3;
  p_collectionView = &self->_collectionView;
  collectionView = self->_collectionView;
  if (collectionView != v5)
  {
    -[UICollectionView removeFromSuperview](collectionView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_collectionView, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecentAndRelevantCollectionViewCell contentView](self, "contentView"));
    objc_msgSend(v8, "addSubview:", *p_collectionView);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView leadingAnchor](*p_collectionView, "leadingAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecentAndRelevantCollectionViewCell contentView](self, "contentView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "leadingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView trailingAnchor](*p_collectionView, "trailingAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecentAndRelevantCollectionViewCell contentView](self, "contentView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView topAnchor](*p_collectionView, "topAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecentAndRelevantCollectionViewCell contentView](self, "contentView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v19));

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView bottomAnchor](*p_collectionView, "bottomAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CHRecentAndRelevantCollectionViewCell contentView](self, "contentView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));

    v26[0] = v12;
    v26[1] = v16;
    v26[2] = v20;
    v26[3] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v25);

  }
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
