@implementation QuerySuggestionTableViewCell

+ (double)estimatedCellHeight
{
  return 41.0;
}

- (QuerySuggestionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  QuerySuggestionTableViewCell *v4;
  void *v5;
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
  v27.super_class = (Class)QuerySuggestionTableViewCell;
  v4 = -[QuerySuggestionTableViewCell initWithStyle:reuseIdentifier:](&v27, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[QuerySuggestionTableViewCell setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = objc_alloc_init(QuerySuggestionView);
    querySuggestionView = v4->_querySuggestionView;
    v4->_querySuggestionView = v6;

    -[QuerySuggestionView setTranslatesAutoresizingMaskIntoConstraints:](v4->_querySuggestionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionTableViewCell contentView](v4, "contentView"));
    objc_msgSend(v8, "addSubview:", v4->_querySuggestionView);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView leadingAnchor](v4->_querySuggestionView, "leadingAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionTableViewCell contentView](v4, "contentView"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v24));
    v28[0] = v23;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView trailingAnchor](v4->_querySuggestionView, "trailingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionTableViewCell contentView](v4, "contentView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
    v28[1] = v19;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView topAnchor](v4->_querySuggestionView, "topAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionTableViewCell contentView](v4, "contentView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
    v28[2] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionView bottomAnchor](v4->_querySuggestionView, "bottomAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionTableViewCell contentView](v4, "contentView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
    v28[3] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

  }
  return v4;
}

+ (id)identifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1);
  return NSStringFromClass(v2);
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)QuerySuggestionTableViewCell;
  -[QuerySuggestionTableViewCell prepareForReuse](&v4, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionTableViewCell querySuggestionView](self, "querySuggestionView"));
  objc_msgSend(v3, "clearContents");

  -[QuerySuggestionTableViewCell setAccessoryViewType:](self, "setAccessoryViewType:", 0);
  -[QuerySuggestionTableViewCell setAccessoryViewObject:](self, "setAccessoryViewObject:", 0);
  -[QuerySuggestionTableViewCell setAccessoryViewDelegate:](self, "setAccessoryViewDelegate:", 0);
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
  v13 = (id)objc_claimAutoreleasedReturnValue(-[QuerySuggestionTableViewCell querySuggestionView](self, "querySuggestionView"));
  objc_msgSend(v13, "setTitle:highlightTitleRanges:detailText:style:", v12, v11, v10, a6);

}

- (void)setAccessoryViewType:(int64_t)a3
{
  void *v4;
  id v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  self->_accessoryViewType = a3;
  switch(a3)
  {
    case 1:
      v27 = (id)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
      objc_msgSend(v27, "setBounds:", 0.0, 0.0, 30.0, 30.0);
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
      v5 = objc_msgSend(v4, "userInterfaceIdiom");
      v6 = CFSTR("plus");
      if (v5 == (id)5)
        v6 = CFSTR("plus.circle");
      v7 = v6;

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v7));
      objc_msgSend(v27, "setImage:forState:", v8, 0);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 20.0));
      objc_msgSend(v27, "setPreferredSymbolConfiguration:forImageInState:", v9, 0);

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "theme"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "keyColor"));
      objc_msgSend(v27, "setTintColor:", v11);

      v12 = CFSTR("AccessoryAddButton");
      goto LABEL_10;
    case 2:
      v27 = (id)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
      objc_msgSend(v27, "setBounds:", 0.0, 0.0, 30.0, 30.0);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("arrow.up.backward.circle")));
      objc_msgSend(v27, "setImage:forState:", v13, 0);

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 20.0));
      objc_msgSend(v27, "setPreferredSymbolConfiguration:forImageInState:", v14, 0);

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      objc_msgSend(v27, "setTintColor:", v15);

      v12 = CFSTR("AccessoryQueryAcceleratorButton");
      goto LABEL_10;
    case 3:
      v27 = (id)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
      objc_msgSend(v27, "setBounds:", 0.0, 0.0, 30.0, 30.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("checkmark")));
      objc_msgSend(v27, "setImage:forState:", v16, 0);

      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 20.0));
      objc_msgSend(v27, "setPreferredSymbolConfiguration:forImageInState:", v17, 0);

      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      objc_msgSend(v27, "setTintColor:", v18);

      v12 = CFSTR("AccessoryCheckmarkButton");
      goto LABEL_10;
    case 4:
      v27 = (id)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
      objc_msgSend(v27, "setBounds:", 0.0, 0.0, 30.0, 30.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
      v20 = objc_msgSend(v19, "userInterfaceIdiom");
      v21 = CFSTR("pin");
      if (v20 == (id)5)
        v21 = CFSTR("pin.circle");
      v22 = v21;

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v22));
      objc_msgSend(v27, "setImage:forState:", v23, 0);

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 20.0));
      objc_msgSend(v27, "setPreferredSymbolConfiguration:forImageInState:", v24, 0);

      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "theme"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "keyColor"));
      objc_msgSend(v27, "setTintColor:", v26);

      v12 = CFSTR("AccessoryPinButton");
LABEL_10:
      objc_msgSend(v27, "setAccessibilityIdentifier:", v12);
      if (!v27)
        goto LABEL_12;
      objc_msgSend(v27, "addTarget:action:forControlEvents:", self, "didTapAccessoryViewButton:", 64);
      break;
    default:
LABEL_12:
      v27 = 0;
      break;
  }
  -[QuerySuggestionTableViewCell setAccessoryView:](self, "setAccessoryView:", v27);

}

- (void)didTapAccessoryViewButton:(id)a3
{
  int64_t v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[QuerySuggestionTableViewCell accessoryViewDelegate](self, "accessoryViewDelegate", a3));
  v4 = -[QuerySuggestionTableViewCell accessoryViewType](self, "accessoryViewType");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[QuerySuggestionTableViewCell accessoryViewObject](self, "accessoryViewObject"));
  objc_msgSend(v6, "didTapOnAccessoryView:withType:object:", self, v4, v5);

}

- (AutocompleteCellAccessoryDelegate)accessoryViewDelegate
{
  return (AutocompleteCellAccessoryDelegate *)objc_loadWeakRetained((id *)&self->_accessoryViewDelegate);
}

- (void)setAccessoryViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_accessoryViewDelegate, a3);
}

- (id)accessoryViewObject
{
  return self->_accessoryViewObject;
}

- (void)setAccessoryViewObject:(id)a3
{
  objc_storeStrong(&self->_accessoryViewObject, a3);
}

- (int64_t)accessoryViewType
{
  return self->_accessoryViewType;
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
  objc_storeStrong(&self->_accessoryViewObject, 0);
  objc_destroyWeak((id *)&self->_accessoryViewDelegate);
}

@end
