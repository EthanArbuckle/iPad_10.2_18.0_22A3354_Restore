@implementation TwoLinesTableViewCell

+ (double)cellHeight
{
  return UITableViewAutomaticDimension;
}

+ (double)estimatedCellHeight
{
  double result;

  +[UIFont _maps_bodyScaledValueForValue:](UIFont, "_maps_bodyScaledValueForValue:", 72.0);
  return result;
}

+ (id)identifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1);
  return NSStringFromClass(v2);
}

- (TwoLinesTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return -[TwoLinesTableViewCell initWithStyle:reuseIdentifier:contentViewType:](self, "initWithStyle:reuseIdentifier:contentViewType:", a3, a4, 0);
}

- (TwoLinesTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 contentViewType:(int)a5
{
  TwoLinesTableViewCell *v6;
  TwoLinesTableViewCell *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TwoLinesTableViewCell;
  v6 = -[MapsThemeTableViewCell initWithStyle:reuseIdentifier:](&v9, "initWithStyle:reuseIdentifier:", a3, a4);
  v7 = v6;
  if (v6)
  {
    v6->_contentViewType = a5;
    -[TwoLinesTableViewCell prepareContentView](v6, "prepareContentView");
    if (sub_1002A8AA0(v7) == 5)
      -[TwoLinesTableViewCell _maps_setTableViewCellBackgroundConfiguration](v7, "_maps_setTableViewCellBackgroundConfiguration");
  }
  return v7;
}

- (BOOL)canBecomeFirstResponder
{
  return sub_1002A8AA0(self) == 5;
}

- (void)prepareContentView
{
  void *v3;
  id v4;
  void *v5;
  TwoLinesContentView *v6;
  TwoLinesContentView *twoLinesContentView;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesTableViewCell _tableView](self, "_tableView"));
  v4 = objc_msgSend(v3, "style");

  if (v4 != (id)2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[TwoLinesTableViewCell setBackgroundColor:](self, "setBackgroundColor:", v5);

  }
  v6 = -[TwoLinesContentView initWithFrame:contentViewType:]([TwoLinesContentView alloc], "initWithFrame:contentViewType:", self->_contentViewType, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  twoLinesContentView = self->_twoLinesContentView;
  self->_twoLinesContentView = v6;

  -[TwoLinesContentView setTranslatesAutoresizingMaskIntoConstraints:](self->_twoLinesContentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[TwoLinesContentView setPlaceContextViewModelDelegate:](self->_twoLinesContentView, "setPlaceContextViewModelDelegate:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesTableViewCell contentView](self, "contentView"));
  objc_msgSend(v8, "addSubview:", self->_twoLinesContentView);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView topAnchor](self->_twoLinesContentView, "topAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesTableViewCell contentView](self, "contentView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "topAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v24));
  v27[0] = v23;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView leadingAnchor](self->_twoLinesContentView, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesTableViewCell contentView](self, "contentView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  -[TwoLinesTableViewCell leadingSpacing](self, "leadingSpacing");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v20));
  v27[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView trailingAnchor](self->_twoLinesContentView, "trailingAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesTableViewCell contentView](self, "contentView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, -10.0));
  v27[2] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView bottomAnchor](self->_twoLinesContentView, "bottomAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesTableViewCell contentView](self, "contentView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
  LODWORD(v17) = 1112276992;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:priority:", v16, 0.0, v17));
  v27[3] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

}

- (double)leadingSpacing
{
  sub_1002A8AA0(self);
  return 16.0;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TwoLinesTableViewCell;
  -[TwoLinesTableViewCell prepareForReuse](&v3, "prepareForReuse");
  -[TwoLinesTableViewCell setAccessoryViewType:](self, "setAccessoryViewType:", 0);
  -[TwoLinesTableViewCell setAccessoryViewObject:](self, "setAccessoryViewObject:", 0);
  -[TwoLinesTableViewCell setAccessoryViewDelegate:](self, "setAccessoryViewDelegate:", 0);
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TwoLinesTableViewCell;
  -[TwoLinesTableViewCell setSelected:animated:](&v6, "setSelected:animated:", a3, a4);
  -[TwoLinesContentView setIsParentCellSelected:](self->_twoLinesContentView, "setIsParentCellSelected:", v4);
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  objc_super v19;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesTableViewCell contentView](self, "contentView"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v19.receiver = self;
  v19.super_class = (Class)TwoLinesTableViewCell;
  -[TwoLinesTableViewCell intrinsicContentSize](&v19, "intrinsicContentSize");
  v13 = v12;
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesTableViewCell contentView](self, "contentView"));
  objc_msgSend(v16, "setFrame:", v5, v7, v9, v11);

  v17 = v13;
  v18 = v15;
  result.height = v18;
  result.width = v17;
  return result;
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
  -[TwoLinesTableViewCell setAccessoryView:](self, "setAccessoryView:", v27);

}

- (void)didTapAccessoryViewButton:(id)a3
{
  int64_t v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[TwoLinesTableViewCell accessoryViewDelegate](self, "accessoryViewDelegate", a3));
  v4 = -[TwoLinesTableViewCell accessoryViewType](self, "accessoryViewType");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesTableViewCell accessoryViewObject](self, "accessoryViewObject"));
  objc_msgSend(v6, "didTapOnAccessoryView:withType:object:", self, v4, v5);

}

- (void)setViewModel:(id)a3
{
  TwoLinesContentViewModel *v5;
  TwoLinesContentViewModel **p_viewModel;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  TwoLinesContentViewModel *v14;

  v5 = (TwoLinesContentViewModel *)a3;
  p_viewModel = &self->_viewModel;
  if (self->_viewModel != v5)
  {
    v14 = v5;
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[TwoLinesContentView setViewModel:](self->_twoLinesContentView, "setViewModel:", v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView viewModel](self->_twoLinesContentView, "viewModel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "axIdentifier"));
    if (objc_msgSend(v8, "length"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentView viewModel](self->_twoLinesContentView, "viewModel"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "axIdentifier"));

    }
    else
    {
      v10 = CFSTR("TwoLinesTableViewCell");
    }

    -[TwoLinesTableViewCell setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentViewModel customAccessoryView](*p_viewModel, "customAccessoryView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesTableViewCell accessoryView](self, "accessoryView"));

    if (v11 != v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesContentViewModel customAccessoryView](*p_viewModel, "customAccessoryView"));
      -[TwoLinesTableViewCell setAccessoryView:](self, "setAccessoryView:", v13);

    }
    v5 = v14;
  }

}

- (PersonalizedItem)personalizedItemForQuickActionMenu
{
  void *v2;
  uint64_t (**v3)(_QWORD);
  uint64_t v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesTableViewCell viewModel](self, "viewModel"));
  v3 = (uint64_t (**)(_QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "personalizedItemForQuickActionMenuCreator"));

  if (v3)
  {
    v4 = v3[2](v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }
  else
  {
    v5 = 0;
  }

  return (PersonalizedItem *)v5;
}

- (void)didTapOnPlaceContextWithViewModel:(id)a3 parentView:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[TwoLinesTableViewCell placeContextViewModelDelegate](self, "placeContextViewModelDelegate"));
  objc_msgSend(v6, "didTapOnPlaceContextWithViewModel:parentView:", v5, self);

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

- (PlaceContextViewModelCellDelegate)placeContextViewModelDelegate
{
  return (PlaceContextViewModelCellDelegate *)objc_loadWeakRetained((id *)&self->_placeContextViewModelDelegate);
}

- (void)setPlaceContextViewModelDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_placeContextViewModelDelegate, a3);
}

- (TwoLinesContentViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->_placeContextViewModelDelegate);
  objc_storeStrong(&self->_accessoryViewObject, 0);
  objc_destroyWeak((id *)&self->_accessoryViewDelegate);
  objc_storeStrong((id *)&self->_twoLinesContentView, 0);
}

@end
