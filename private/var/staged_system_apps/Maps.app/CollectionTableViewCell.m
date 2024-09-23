@implementation CollectionTableViewCell

+ (NSString)identifier
{
  return (NSString *)CFSTR("CollectionTableViewCell");
}

+ (double)cellHeight
{
  return UITableViewAutomaticDimension;
}

+ (double)estimatedCellHeight
{
  return 82.0;
}

- (CollectionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CollectionTableViewCell *v4;
  CollectionTableViewCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CollectionTableViewCell;
  v4 = -[CollectionTableViewCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", 0, a4);
  v5 = v4;
  if (v4)
  {
    v4->_collectionViewSize = 0;
    -[CollectionTableViewCell createContent](v4, "createContent");
  }
  return v5;
}

- (id)_cellBackgroundColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 0));
  v9[0] = v2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemBackgroundColor](UIColor, "secondarySystemBackgroundColor"));
  v9[1] = v3;
  v10[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
  v10[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _dynamicColorWithColorsByTraitCollection:](UIColor, "_dynamicColorWithColorsByTraitCollection:", v6));
  return v7;
}

- (void)createContent
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  CollectionView *v8;
  CollectionView *collectionView;
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
  void *v26;
  void *v27;
  _QWORD v28[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionTableViewCell _tableView](self, "_tableView"));
  v4 = objc_msgSend(v3, "style");

  if (v4 == (id)2)
    v5 = objc_claimAutoreleasedReturnValue(-[CollectionTableViewCell _cellBackgroundColor](self, "_cellBackgroundColor"));
  else
    v5 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v6 = (void *)v5;
  -[CollectionTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v5);

  -[CollectionTableViewCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("CollectionTableViewCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionTableViewCell contentView](self, "contentView"));
  objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("CollectionTableViewCellContent"));

  v8 = -[CollectionView initWithCollectionViewSize:]([CollectionView alloc], "initWithCollectionViewSize:", self->_collectionViewSize);
  collectionView = self->_collectionView;
  self->_collectionView = v8;

  -[CollectionView setTranslatesAutoresizingMaskIntoConstraints:](self->_collectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CollectionView setAccessibilityIdentifier:](self->_collectionView, "setAccessibilityIdentifier:", CFSTR("CollectionTableViewCellCollectionView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionTableViewCell contentView](self, "contentView"));
  objc_msgSend(v10, "addSubview:", self->_collectionView);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView topAnchor](self->_collectionView, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionTableViewCell contentView](self, "contentView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "topAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
  v28[0] = v24;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView leadingAnchor](self->_collectionView, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionTableViewCell contentView](self, "contentView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
  v28[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView trailingAnchor](self->_collectionView, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionTableViewCell contentView](self, "contentView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));
  v28[2] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionView bottomAnchor](self->_collectionView, "bottomAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CollectionTableViewCell contentView](self, "contentView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
  v28[3] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v20);

}

- (void)setCollectionViewSize:(unint64_t)a3
{
  if (self->_collectionViewSize != a3)
  {
    self->_collectionViewSize = a3;
    -[CollectionView setCollectionViewSize:](self->_collectionView, "setCollectionViewSize:");
  }
}

- (void)setCollectionInfo:(id)a3
{
  CollectionHandlerInfo *v5;
  CollectionHandlerInfo *v6;

  v5 = (CollectionHandlerInfo *)a3;
  if (self->_collectionInfo != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_collectionInfo, a3);
    -[CollectionView setCollectionInfo:](self->_collectionView, "setCollectionInfo:", self->_collectionInfo);
    v5 = v6;
  }

}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    -[CollectionView setDisabled:](self->_collectionView, "setDisabled:");
  }
}

- (void)setShowCheckmark:(BOOL)a3
{
  if (self->_showCheckmark != a3)
  {
    self->_showCheckmark = a3;
    -[CollectionView setShowCheckmark:](self->_collectionView, "setShowCheckmark:");
  }
}

- (CollectionHandlerInfo)collectionInfo
{
  return self->_collectionInfo;
}

- (unint64_t)collectionViewSize
{
  return self->_collectionViewSize;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (BOOL)showsCheckmark
{
  return self->_showCheckmark;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionInfo, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
