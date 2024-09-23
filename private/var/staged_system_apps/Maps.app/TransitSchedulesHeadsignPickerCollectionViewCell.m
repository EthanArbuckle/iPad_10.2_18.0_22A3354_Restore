@implementation TransitSchedulesHeadsignPickerCollectionViewCell

- (TransitSchedulesHeadsignPickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  TransitSchedulesHeadsignPickerCollectionViewCell *v3;
  TransitSchedulesHeadsignPickerCollectionViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TransitSchedulesHeadsignPickerCollectionViewCell;
  v3 = -[TransitSchedulesHeadsignPickerCollectionViewCell initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[TransitSchedulesHeadsignPickerCollectionViewCell configureViews](v3, "configureViews");
  return v4;
}

- (void)configureViews
{
  void *v3;
  UIButton *v4;
  UIButton *picker;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesHeadsignPickerCollectionViewCell contentView](self, "contentView"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("TransitSchedulesHeadsignPickerCollectionViewCell"));
  v4 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 124));
  picker = self->_picker;
  self->_picker = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](self->_picker, "titleLabel"));
  objc_msgSend(v6, "setTextAlignment:", 0);

  -[UIButton setContentHorizontalAlignment:](self->_picker, "setContentHorizontalAlignment:", 1);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_picker, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setShowsMenuAsPrimaryAction:](self->_picker, "setShowsMenuAsPrimaryAction:", 1);
  -[UIButton setContextMenuInteractionEnabled:](self->_picker, "setContextMenuInteractionEnabled:", 1);
  -[UIButton setAccessibilityIdentifier:](self->_picker, "setAccessibilityIdentifier:", CFSTR("TransitSchedulesHeadsignPickerCollectionViewCellPicker"));
  objc_msgSend(v3, "addSubview:", self->_picker);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_picker, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v18));
  v20[0] = v17;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_picker, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v7));
  v20[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](self->_picker, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  v20[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_picker, "bottomAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
  v20[3] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);

}

+ (NSString)cellIdentifier
{
  return (NSString *)CFSTR("TransitSchedulesHeadsignPickerCellIdentifier");
}

- (void)setDepartureSequences:(id)a3 withSelectedDepartureSequence:(id)a4
{
  NSArray *v6;
  NSArray *departureSequences;
  id v8;

  v8 = a4;
  v6 = (NSArray *)objc_msgSend(a3, "copy");
  departureSequences = self->_departureSequences;
  self->_departureSequences = v6;

  -[TransitSchedulesHeadsignPickerCollectionViewCell _updateDeparturePickerWithSelectedDepartureSequence:](self, "_updateDeparturePickerWithSelectedDepartureSequence:", v8);
}

- (void)_updateDeparturePickerWithSelectedDepartureSequence:(id)a3
{
  id v4;
  void *v5;
  NSArray *departureSequences;
  id v7;
  id v8;
  void *v9;
  void **v10;
  uint64_t v11;
  void (*v12)(id *, void *, void *);
  void *v13;
  id v14;
  id v15;
  id v16;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_initWeak(&location, self);
  departureSequences = self->_departureSequences;
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_10090B1F0;
  v13 = &unk_1011DBC20;
  objc_copyWeak(&v16, &location);
  v7 = v4;
  v14 = v7;
  v8 = v5;
  v15 = v8;
  -[NSArray enumerateObjectsUsingBlock:](departureSequences, "enumerateObjectsUsingBlock:", &v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:children:](UIMenu, "menuWithTitle:children:", &stru_1011EB268, v8, v10, v11, v12, v13));
  -[UIButton setMenu:](self->_picker, "setMenu:", v9);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (TransitSchedulesHeadsignPickerCollectionViewCellDelegate)delegate
{
  return (TransitSchedulesHeadsignPickerCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_departureSequences, 0);
  objc_storeStrong((id *)&self->_picker, 0);
}

@end
