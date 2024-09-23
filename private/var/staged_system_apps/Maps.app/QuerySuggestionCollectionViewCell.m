@implementation QuerySuggestionCollectionViewCell

- (QuerySuggestionCollectionViewCell)initWithFrame:(CGRect)a3
{
  QuerySuggestionCollectionViewCell *v3;
  void *v4;
  id v5;
  QuerySuggestionView *v6;
  QuerySuggestionView *querySuggestionView;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;
  _QWORD v28[4];

  v27.receiver = self;
  v27.super_class = (Class)QuerySuggestionCollectionViewCell;
  v3 = -[QuerySuggestionCollectionViewCell initWithFrame:](&v27, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[QuerySuggestionCollectionViewCell setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_alloc_init((Class)UIView);
    -[QuerySuggestionCollectionViewCell setBackgroundView:](v3, "setBackgroundView:", v5);

    v6 = objc_alloc_init(QuerySuggestionView);
    querySuggestionView = v3->_querySuggestionView;
    v3->_querySuggestionView = v6;

    -[QuerySuggestionView setTranslatesAutoresizingMaskIntoConstraints:](v3->_querySuggestionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionCollectionViewCell contentView](v3, "contentView"));
    objc_msgSend(v8, "addSubview:", v3->_querySuggestionView);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView leadingAnchor](v3->_querySuggestionView, "leadingAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionCollectionViewCell contentView](v3, "contentView"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v24));
    v28[0] = v23;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView trailingAnchor](v3->_querySuggestionView, "trailingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionCollectionViewCell contentView](v3, "contentView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
    v28[1] = v19;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView topAnchor](v3->_querySuggestionView, "topAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionCollectionViewCell contentView](v3, "contentView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
    v28[2] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView bottomAnchor](v3->_querySuggestionView, "bottomAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionCollectionViewCell contentView](v3, "contentView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
    v28[3] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

  }
  return v3;
}

+ (double)estimatedCellHeight
{
  return 41.0;
}

+ (id)identifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1);
  return NSStringFromClass(v2);
}

- (void)setTitle:(id)a3 highlightTitleRanges:(id)a4 detailText:(id)a5 style:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[QuerySuggestionCollectionViewCell querySuggestionView](self, "querySuggestionView"));
  objc_msgSend(v13, "setTitle:highlightTitleRanges:detailText:style:", v12, v11, v10, a6);

}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)QuerySuggestionCollectionViewCell;
  -[QuerySuggestionCollectionViewCell prepareForReuse](&v4, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionCollectionViewCell querySuggestionView](self, "querySuggestionView"));
  objc_msgSend(v3, "clearContents");

}

- (QuerySuggestionView)querySuggestionView
{
  return self->_querySuggestionView;
}

- (void)setQuerySuggestionView:(id)a3
{
  objc_storeStrong((id *)&self->_querySuggestionView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_querySuggestionView, 0);
}

@end
