@implementation RelatedSearchSuggestionOutlineCell

- (RelatedSearchSuggestionOutlineCell)initWithFrame:(CGRect)a3
{
  RelatedSearchSuggestionOutlineCell *v3;
  UIStackView *v4;
  UIStackView *suggestionStackView;
  objc_class *v6;
  NSString *v7;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;
  _QWORD v31[4];

  v30.receiver = self;
  v30.super_class = (Class)RelatedSearchSuggestionOutlineCell;
  v3 = -[SidebarOutlineCell initWithFrame:](&v30, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIStackView *)objc_msgSend(objc_alloc((Class)UIStackView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    suggestionStackView = v3->_suggestionStackView;
    v3->_suggestionStackView = v4;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3->_suggestionStackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setAxis:](v3->_suggestionStackView, "setAxis:", 1);
    -[UIStackView setDistribution:](v3->_suggestionStackView, "setDistribution:", 0);
    -[UIStackView setAlignment:](v3->_suggestionStackView, "setAlignment:", 1);
    -[UIStackView setSpacing:](v3->_suggestionStackView, "setSpacing:", 1.17549435e-38);
    -[UIStackView setBaselineRelativeArrangement:](v3->_suggestionStackView, "setBaselineRelativeArrangement:", 1);
    v6 = (objc_class *)objc_opt_class(v3);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[RelatedSearchSuggestionOutlineCell setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionOutlineCell contentView](v3, "contentView"));
    objc_msgSend(v9, "addSubview:", v3->_suggestionStackView);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView topAnchor](v3->_suggestionStackView, "topAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionOutlineCell contentView](v3, "contentView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "topAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v27));
    v31[0] = v26;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v3->_suggestionStackView, "leadingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionOutlineCell contentView](v3, "contentView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "layoutMarginsGuide"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v22));
    v31[1] = v21;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](v3->_suggestionStackView, "trailingAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionOutlineCell contentView](v3, "contentView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "layoutMarginsGuide"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trailingAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v12));
    v31[2] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](v3->_suggestionStackView, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionOutlineCell contentView](v3, "contentView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v16));
    v31[3] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);

  }
  return v3;
}

- (void)setCellModel:(id)a3
{
  RelatedSearchSuggestionOutlineCellModel *v5;
  RelatedSearchSuggestionOutlineCellModel *v6;
  unsigned __int8 v7;
  RelatedSearchSuggestionOutlineCellModel *v8;

  v5 = (RelatedSearchSuggestionOutlineCellModel *)a3;
  v6 = v5;
  if (self->_cellModel != v5)
  {
    v8 = v5;
    v7 = -[RelatedSearchSuggestionOutlineCellModel isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_cellModel, a3);
      -[RelatedSearchSuggestionOutlineCell _updateFromModel](self, "_updateFromModel");
      v6 = v8;
    }
  }

}

- (void)_updateFromModel
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView subviews](self->_suggestionStackView, "subviews"));
  objc_msgSend(v3, "makeObjectsPerformSelector:", "removeFromSuperview");

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionOutlineCellModel suggestion](self->_cellModel, "suggestion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "components"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = objc_msgSend(v11, "isRelatedSearchSuggestion");
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "displayText"));
        if (v12)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionOutlineCell _createMapsThemeButtonWithTitle:](self, "_createMapsThemeButtonWithTitle:", v13));

          objc_msgSend(v14, "setTag:", (char *)i + v8);
        }
        else
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionOutlineCell _createMapsThemeLabelWithTitle:](self, "_createMapsThemeLabelWithTitle:", v13));

        }
        -[UIStackView addArrangedSubview:](self->_suggestionStackView, "addArrangedSubview:", v14);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v8 += (uint64_t)i;
    }
    while (v7);
  }

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v15);
}

- (id)_createMapsThemeButtonWithTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsThemeButton buttonWithType:](MapsThemeButton, "buttonWithType:", 0));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "_setTouchInsets:", -7.0, -7.0, -7.0, -7.0);
  objc_msgSend(v5, "setTitleColorProvider:", &stru_1011BE7C0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionOutlineCell _labelFont](self, "_labelFont"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "titleLabel"));
  objc_msgSend(v7, "setFont:", v6);

  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, "_componentButtonTapped:", 64);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "titleLabel"));
  objc_msgSend(v8, "setLineBreakMode:", 4);

  if (MKApplicationLayoutDirectionIsRightToLeft(v9))
    v10 = 2;
  else
    v10 = 1;
  objc_msgSend(v5, "setContentHorizontalAlignment:", v10);
  objc_msgSend(v5, "setTitle:forState:", v4, 0);

  return v5;
}

- (id)_createMapsThemeLabelWithTitle:(id)a3
{
  id v4;
  MapsThemeLabel *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v4 = a3;
  v5 = -[MapsThemeLabel initWithFrame:]([MapsThemeLabel alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[MapsThemeLabel setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[MapsThemeLabel setTextColor:](v5, "setTextColor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionOutlineCell _labelFont](self, "_labelFont"));
  -[MapsThemeLabel setFont:](v5, "setFont:", v7);

  LODWORD(v8) = 1148846080;
  -[MapsThemeLabel setContentHuggingPriority:forAxis:](v5, "setContentHuggingPriority:forAxis:", 0, v8);
  LODWORD(v9) = 1148846080;
  -[MapsThemeLabel setContentCompressionResistancePriority:forAxis:](v5, "setContentCompressionResistancePriority:forAxis:", 0, v9);
  -[MapsThemeLabel setText:](v5, "setText:", v4);

  return v5;
}

- (void)_componentButtonTapped:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = objc_msgSend(a3, "tag");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionOutlineCellModel suggestion](self->_cellModel, "suggestion"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "components"));

  v6 = v4 >= objc_msgSend(v11, "count");
  v7 = v11;
  if (!v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v4));
    if (objc_msgSend(v8, "isRelatedSearchSuggestion"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RelatedSearchSuggestionOutlineCellModel delegate](self->_cellModel, "delegate"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "suggestion"));
      objc_msgSend(v9, "relatedSearchSuggestionOutlineCellDidTapActionButtonWithSuggestion:", v10);

    }
    v7 = v11;
  }

}

- (id)_labelFont
{
  return +[UIFont system15](UIFont, "system15");
}

- (RelatedSearchSuggestionOutlineCellModel)cellModel
{
  return self->_cellModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellModel, 0);
  objc_storeStrong((id *)&self->_suggestionStackView, 0);
}

@end
