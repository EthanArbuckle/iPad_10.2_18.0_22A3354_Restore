@implementation MacTrafficIncidentsDetailsCell

- (MacTrafficIncidentsDetailsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MacTrafficIncidentsDetailsCell *v4;
  MacTrafficIncidentsDetailsCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MacTrafficIncidentsDetailsCell;
  v4 = -[MacTrafficIncidentsDetailsCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[MacTrafficIncidentsDetailsCell _createSubviews](v4, "_createSubviews");
    -[MacTrafficIncidentsDetailsCell _createConstraints](v5, "_createConstraints");
  }
  return v5;
}

- (void)_createSubviews
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[MacTrafficIncidentsDetailsCell setBackgroundColor:](self, "setBackgroundColor:", v3);

  v4 = objc_alloc_init((Class)UILabel);
  -[MacTrafficIncidentsDetailsCell setDateLabel:](self, "setDateLabel:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MacTrafficIncidentsDetailsCell dateLabel](self, "dateLabel"));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MacTrafficIncidentsDetailsCell dateLabel](self, "dateLabel"));
  objc_msgSend(v6, "setNumberOfLines:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system13Tall](UIFont, "system13Tall"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MacTrafficIncidentsDetailsCell dateLabel](self, "dateLabel"));
  objc_msgSend(v8, "setFont:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MacTrafficIncidentsDetailsCell dateLabel](self, "dateLabel"));
  objc_msgSend(v10, "setTextColor:", v9);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[MacTrafficIncidentsDetailsCell contentView](self, "contentView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MacTrafficIncidentsDetailsCell dateLabel](self, "dateLabel"));
  objc_msgSend(v12, "addSubview:", v11);

}

- (void)_createConstraints
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MacTrafficIncidentsDetailsCell dateLabel](self, "dateLabel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MacTrafficIncidentsDetailsCell contentView](self, "contentView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v20, 17.0));
  v24[0] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MacTrafficIncidentsDetailsCell dateLabel](self, "dateLabel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MacTrafficIncidentsDetailsCell contentView](self, "contentView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:constant:", v15, -17.0));
  v24[1] = v14;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MacTrafficIncidentsDetailsCell dateLabel](self, "dateLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MacTrafficIncidentsDetailsCell contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:constant:", v5, 14.0));
  v24[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MacTrafficIncidentsDetailsCell dateLabel](self, "dateLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MacTrafficIncidentsDetailsCell contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v24[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)configureWithCellModel:(id)a3
{
  MacTrafficIncidentsDetailsCellModel *v5;
  MacTrafficIncidentsDetailsCellModel *v6;

  v5 = (MacTrafficIncidentsDetailsCellModel *)a3;
  if (self->_cellModel != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_cellModel, a3);
    -[MacTrafficIncidentsDetailsCell _updateLabels](self, "_updateLabels");
    v5 = v6;
  }

}

- (void)_updateLabels
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MacTrafficIncidentsDetailsCell cellModel](self, "cellModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateText"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MacTrafficIncidentsDetailsCell dateLabel](self, "dateLabel"));
  objc_msgSend(v4, "setText:", v3);

}

- (UILabel)dateLabel
{
  return self->_dateLabel;
}

- (void)setDateLabel:(id)a3
{
  objc_storeStrong((id *)&self->_dateLabel, a3);
}

- (MacTrafficIncidentsDetailsCellModel)cellModel
{
  return self->_cellModel;
}

- (void)setCellModel:(id)a3
{
  objc_storeStrong((id *)&self->_cellModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellModel, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
}

@end
