@implementation OfflineMapDetailsSectionController

- (OfflineMapDetailsSectionController)initWithSubscriptionInfo:(id)a3
{
  OfflineMapDetailsSectionController *v3;
  OfflineMapDetailsSectionController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OfflineMapDetailsSectionController;
  v3 = -[OfflineMapSectionController initWithSubscriptionInfo:](&v6, "initWithSubscriptionInfo:", a3);
  v4 = v3;
  if (v3)
    -[OfflineMapDetailsSectionController _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  UIStackView *v3;
  UIStackView *sectionView;
  double v5;
  OfflineMapSnapshotRowView *v6;
  OfflineMapSnapshotRowView *snapshotRowView;
  double v8;
  UILabel *v9;
  UILabel *nameRowView;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  UILabel *v15;
  UILabel *sizeRowView;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  UIButton *v23;
  UIButton *renameButton;
  UIButton *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id location;
  _QWORD v39[2];

  v3 = (UIStackView *)objc_alloc_init((Class)UIStackView);
  sectionView = self->_sectionView;
  self->_sectionView = v3;

  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_sectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIStackView setAxis:](self->_sectionView, "setAxis:", 1);
  -[UIStackView setAlignment:](self->_sectionView, "setAlignment:", 3);
  -[UIStackView setDistribution:](self->_sectionView, "setDistribution:", 2);
  -[UIStackView setSpacing:](self->_sectionView, "setSpacing:", 4.0);
  -[UIStackView setLayoutMargins:](self->_sectionView, "setLayoutMargins:", 0.0, 16.0, 0.0, 16.0);
  -[UIStackView setLayoutMarginsRelativeArrangement:](self->_sectionView, "setLayoutMarginsRelativeArrangement:", 1);
  LODWORD(v5) = 1148846080;
  -[UIStackView setContentHuggingPriority:forAxis:](self->_sectionView, "setContentHuggingPriority:forAxis:", 1, v5);
  v6 = objc_alloc_init(OfflineMapSnapshotRowView);
  snapshotRowView = self->_snapshotRowView;
  self->_snapshotRowView = v6;

  -[OfflineMapSnapshotRowView setTopHairlineHidden:](self->_snapshotRowView, "setTopHairlineHidden:", 1);
  -[OfflineMapSnapshotRowView setBottomHairlineHidden:](self->_snapshotRowView, "setBottomHairlineHidden:", 1);
  LODWORD(v8) = 1148846080;
  -[OfflineMapSnapshotRowView setContentCompressionResistancePriority:forAxis:](self->_snapshotRowView, "setContentCompressionResistancePriority:forAxis:", 1, v8);
  -[OfflineMapDetailsSectionController _updateSnapshotRowView](self, "_updateSnapshotRowView");
  v9 = (UILabel *)objc_alloc_init((Class)UILabel);
  nameRowView = self->_nameRowView;
  self->_nameRowView = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel traitCollection](self->_nameRowView, "traitCollection"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", UIFontTextStyleTitle2, v11, UIFontWeightSemibold));
  -[UILabel setFont:](self->_nameRowView, "setFont:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UILabel setTextColor:](self->_nameRowView, "setTextColor:", v13);

  LODWORD(v14) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_nameRowView, "setContentCompressionResistancePriority:forAxis:", 1, v14);
  -[OfflineMapDetailsSectionController _updateNameRowView](self, "_updateNameRowView");
  v15 = (UILabel *)objc_alloc_init((Class)UILabel);
  sizeRowView = self->_sizeRowView;
  self->_sizeRowView = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel traitCollection](self->_sizeRowView, "traitCollection"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_fontWithTextStyle:weight:compatibleWithTraitCollection:](UIFont, "_maps_fontWithTextStyle:weight:compatibleWithTraitCollection:", UIFontTextStyleBody, v17, UIFontWeightRegular));
  -[UILabel setFont:](self->_sizeRowView, "setFont:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  -[UILabel setTextColor:](self->_sizeRowView, "setTextColor:", v19);

  LODWORD(v20) = 1148846080;
  -[UILabel setContentCompressionResistancePriority:forAxis:](self->_sizeRowView, "setContentCompressionResistancePriority:forAxis:", 1, v20);
  -[OfflineMapDetailsSectionController _updateSizeRowView](self, "_updateSizeRowView");
  objc_initWeak(&location, self);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration _maps_pillButtonConfigurationWithImage:](UIButtonConfiguration, "_maps_pillButtonConfigurationWithImage:", 0));
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1005C7A90;
  v36[3] = &unk_1011AF8A0;
  objc_copyWeak(&v37, &location);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v36));
  v23 = (UIButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v21, v22));
  renameButton = self->_renameButton;
  self->_renameButton = v23;

  v25 = self->_renameButton;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("OFFLINE_DETAILS_RENAME"), CFSTR("localized string not found"), CFSTR("Offline")));
  -[UIButton setTitle:forState:](v25, "setTitle:forState:", v27, 0);

  -[UIButton setAccessibilityIdentifier:](self->_renameButton, "setAccessibilityIdentifier:", CFSTR("RenameOfflineRegion"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton currentTitle](self->_renameButton, "currentTitle"));
  -[UIButton setAccessibilityLabel:](self->_renameButton, "setAccessibilityLabel:", v28);

  LODWORD(v29) = 1148846080;
  -[UIButton setContentCompressionResistancePriority:forAxis:](self->_renameButton, "setContentCompressionResistancePriority:forAxis:", 1, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_renameButton, "heightAnchor"));
  LODWORD(v31) = 1144766464;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToConstant:priority:", 32.0, v31));
  v39[0] = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_renameButton, "heightAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintGreaterThanOrEqualToConstant:", 32.0));
  v39[1] = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v39, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v35);

  -[OfflineMapDetailsSectionController _updateRowViews](self, "_updateRowViews");
  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
}

- (void)_updateRowViews
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  UILabel *nameRowView;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _QWORD v30[2];
  _BYTE v31[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_sectionView, "arrangedSubviews"));
  v4 = objc_msgSend(v3, "copy");

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v9), "removeFromSuperview");
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v7);
  }

  nameRowView = self->_nameRowView;
  v30[0] = self->_snapshotRowView;
  v30[1] = nameRowView;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 2));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSectionController subscriptionInfo](self, "subscriptionInfo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "state"));
  v15 = objc_msgSend(v14, "downloadedDataCount");

  if (v15)
    objc_msgSend(v12, "addObject:", self->_sizeRowView);
  objc_msgSend(v12, "addObject:", self->_renameButton);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = v12;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        -[UIStackView addArrangedSubview:](self->_sectionView, "addArrangedSubview:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v20), (_QWORD)v21);
        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v18);
  }

  -[UIStackView setCustomSpacing:afterView:](self->_sectionView, "setCustomSpacing:afterView:", self->_snapshotRowView, 16.0);
}

- (id)sectionView
{
  return self->_sectionView;
}

- (void)setSubscriptionInfo:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)OfflineMapDetailsSectionController;
  -[OfflineMapSectionController setSubscriptionInfo:](&v4, "setSubscriptionInfo:", a3);
  -[OfflineMapDetailsSectionController _updateSnapshotRowView](self, "_updateSnapshotRowView");
  -[OfflineMapDetailsSectionController _updateNameRowView](self, "_updateNameRowView");
  -[OfflineMapDetailsSectionController _updateSizeRowView](self, "_updateSizeRowView");
  -[OfflineMapDetailsSectionController _updateRowViews](self, "_updateRowViews");
}

- (double)regionNameBottomOffsetFromTop
{
  CGRect v3;

  -[UILabel frame](self->_nameRowView, "frame");
  return CGRectGetMaxY(v3);
}

- (void)_updateSnapshotRowView
{
  void *v3;
  void **v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSectionController subscriptionInfo](self, "subscriptionInfo"));
  -[OfflineMapSnapshotRowView setSubscriptionInfo:](self->_snapshotRowView, "setSubscriptionInfo:", v3);

  v4 = _NSConcreteStackBlock;
  v5 = 3221225472;
  v6 = sub_1005C7F24;
  v7 = &unk_1011BAB10;
  objc_copyWeak(&v8, &location);
  -[OfflineMapSnapshotRowView setActionBlock:](self->_snapshotRowView, "setActionBlock:", &v4);
  -[OfflineMapSnapshotRowView setAccessibilityIdentifier:](self->_snapshotRowView, "setAccessibilityIdentifier:", CFSTR("SnapshotRowView"), v4, v5, v6, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_updateNameRowView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UILabel **p_nameRowView;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSectionController subscriptionInfo](self, "subscriptionInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subscription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayName"));
  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSectionController subscriptionInfo](self, "subscriptionInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subscription"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "displayName"));
    p_nameRowView = &self->_nameRowView;
    -[UILabel setText:](*p_nameRowView, "setText:", v8);

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Offline Map"), CFSTR("localized string not found"), CFSTR("Offline")));
    p_nameRowView = &self->_nameRowView;
    -[UILabel setText:](*p_nameRowView, "setText:", v7);
  }

  -[UILabel setAccessibilityIdentifier:](*p_nameRowView, "setAccessibilityIdentifier:", CFSTR("NameRowView"));
  v10 = (id)objc_claimAutoreleasedReturnValue(-[UILabel text](*p_nameRowView, "text"));
  -[UILabel setAccessibilityLabel:](*p_nameRowView, "setAccessibilityLabel:", v10);

}

- (void)_updateSizeRowView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (qword_1014D2A20 != -1)
    dispatch_once(&qword_1014D2A20, &stru_1011BCC40);
  v3 = (void *)qword_1014D2A18;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OfflineMapSectionController subscriptionInfo](self, "subscriptionInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringFromByteCount:", objc_msgSend(v5, "downloadedDataSize")));
  -[UILabel setText:](self->_sizeRowView, "setText:", v6);

  -[UILabel setAccessibilityIdentifier:](self->_sizeRowView, "setAccessibilityIdentifier:", CFSTR("SizeRowView"));
  v7 = (id)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_sizeRowView, "text"));
  -[UILabel setAccessibilityLabel:](self->_sizeRowView, "setAccessibilityLabel:", v7);

}

- (OfflineMapDetailsActionSectionControllerDelegate)actionDelegate
{
  return (OfflineMapDetailsActionSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (void)setActionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_renameButton, 0);
  objc_storeStrong((id *)&self->_sizeRowView, 0);
  objc_storeStrong((id *)&self->_nameRowView, 0);
  objc_storeStrong((id *)&self->_snapshotRowView, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
}

@end
