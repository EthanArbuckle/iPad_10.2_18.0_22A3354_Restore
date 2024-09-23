@implementation TransitSchedulesLineOptionsProviderViewCell

- (TransitSchedulesLineOptionsProviderViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  TransitSchedulesLineOptionsProviderViewCell *v7;
  MUButtonCellRowView *v8;
  MUButtonCellRowView *mapsUIButtonCellView;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;
  _QWORD v32[4];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v31.receiver = self;
  v31.super_class = (Class)TransitSchedulesLineOptionsProviderViewCell;
  v7 = -[MapsThemeCollectionViewCell initWithFrame:](&v31, "initWithFrame:");
  if (v7)
  {
    v8 = (MUButtonCellRowView *)objc_msgSend(objc_alloc((Class)MUButtonCellRowView), "initWithFrame:", x, y, width, height);
    mapsUIButtonCellView = v7->_mapsUIButtonCellView;
    v7->_mapsUIButtonCellView = v8;

    -[MUButtonCellRowView setTranslatesAutoresizingMaskIntoConstraints:](v7->_mapsUIButtonCellView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MUButtonCellRowView setHandlesHighlighting:](v7->_mapsUIButtonCellView, "setHandlesHighlighting:", 1);
    -[MUButtonCellRowView setBottomHairlineHidden:](v7->_mapsUIButtonCellView, "setBottomHairlineHidden:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableCellGroupedBackgroundColor](UIColor, "tableCellGroupedBackgroundColor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesLineOptionsProviderViewCell contentView](v7, "contentView"));
    objc_msgSend(v11, "setBackgroundColor:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesLineOptionsProviderViewCell contentView](v7, "contentView"));
    objc_msgSend(v12, "addSubview:", v7->_mapsUIButtonCellView);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MUButtonCellRowView topAnchor](v7->_mapsUIButtonCellView, "topAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesLineOptionsProviderViewCell contentView](v7, "contentView"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v28));
    v32[0] = v27;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MUButtonCellRowView bottomAnchor](v7->_mapsUIButtonCellView, "bottomAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesLineOptionsProviderViewCell contentView](v7, "contentView"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bottomAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v24));
    v32[1] = v23;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MUButtonCellRowView leadingAnchor](v7->_mapsUIButtonCellView, "leadingAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesLineOptionsProviderViewCell contentView](v7, "contentView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
    v32[2] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MUButtonCellRowView trailingAnchor](v7->_mapsUIButtonCellView, "trailingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransitSchedulesLineOptionsProviderViewCell contentView](v7, "contentView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v19));
    v32[3] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v21);

    -[TransitSchedulesLineOptionsProviderViewCell setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", CFSTR("TransitSchedulesLineOptionsProviderViewCell"));
  }
  return v7;
}

- (void)setTitle:(id)a3 symbolName:(id)a4 action:(id)a5 axIdentifierForAction:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  TransitSchedulesLineOptionsProviderViewModel *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[TransitSchedulesLineOptionsProviderViewModel initWithTitle:symbolName:action:axIdentifierForAction:]([TransitSchedulesLineOptionsProviderViewModel alloc], "initWithTitle:symbolName:action:axIdentifierForAction:", v13, v12, v11, v10);

  -[MUButtonCellRowView setViewModel:](self->_mapsUIButtonCellView, "setViewModel:", v14);
}

- (void)setViewModel:(id)a3
{
  -[MUButtonCellRowView setViewModel:](self->_mapsUIButtonCellView, "setViewModel:", a3);
}

- (id)viewModel
{
  return -[MUButtonCellRowView viewModel](self->_mapsUIButtonCellView, "viewModel");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsUIButtonCellView, 0);
}

@end
