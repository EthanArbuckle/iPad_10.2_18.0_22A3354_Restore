@implementation HomeActionFooterContentView

- (HomeActionFooterContentView)initWithFrame:(CGRect)a3
{
  HomeActionFooterContentView *v3;
  HomeActionFooterContentView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HomeActionFooterContentView;
  v3 = -[HomeActionFooterContentView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[HomeActionFooterContentView _mapsui_resetLayoutMargins](v3, "_mapsui_resetLayoutMargins");
    -[HomeActionFooterContentView _rebuildContent](v4, "_rebuildContent");
  }
  return v4;
}

- (void)_rebuildContent
{
  UIButton *shareMyLocationButton;
  UIButton *markMyLocationButton;
  UIButton *rapButton;
  UIButton *termsAndConditionsButton;
  MUCompositionalStackLayout *stackLayout;
  void *v8;
  void *v9;
  void *v10;
  UIButton *v11;
  UIButton *v12;
  void *v13;
  void *v14;
  UIButton *v15;
  UIButton *v16;
  void *v17;
  void *v18;
  UIButton *v19;
  UIButton *v20;
  void *v21;
  void *v22;
  UIButton *v23;
  UIButton *v24;
  id v25;
  id v26;
  UIButton *v27;
  void *v28;
  double v29;
  id v30;
  void *v31;
  MUCompositionalStackLayout *v32;
  MUCompositionalStackLayout *v33;
  _QWORD v34[2];

  -[UIButton removeFromSuperview](self->_shareMyLocationButton, "removeFromSuperview");
  shareMyLocationButton = self->_shareMyLocationButton;
  self->_shareMyLocationButton = 0;

  -[UIButton removeFromSuperview](self->_markMyLocationButton, "removeFromSuperview");
  markMyLocationButton = self->_markMyLocationButton;
  self->_markMyLocationButton = 0;

  -[UIButton removeFromSuperview](self->_rapButton, "removeFromSuperview");
  rapButton = self->_rapButton;
  self->_rapButton = 0;

  -[UIButton removeFromSuperview](self->_termsAndConditionsButton, "removeFromSuperview");
  termsAndConditionsButton = self->_termsAndConditionsButton;
  self->_termsAndConditionsButton = 0;

  -[MUCompositionalStackLayout deactivate](self->_stackLayout, "deactivate");
  stackLayout = self->_stackLayout;
  self->_stackLayout = 0;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (-[HomeActionFooterContentView _shouldShowShareMylocation](self, "_shouldShowShareMylocation"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("[Maps Home] Share My Location"), CFSTR("localized string not found"), 0));
    v11 = (UIButton *)objc_claimAutoreleasedReturnValue(-[HomeActionFooterContentView _footerButtonWithTitle:](self, "_footerButtonWithTitle:", v10));
    v12 = self->_shareMyLocationButton;
    self->_shareMyLocationButton = v11;

    -[UIButton addTarget:action:forControlEvents:](self->_shareMyLocationButton, "addTarget:action:forControlEvents:", self, "_shareMyLocation:", 0x2000);
    -[HomeActionFooterContentView addSubview:](self, "addSubview:", self->_shareMyLocationButton);
    objc_msgSend(v8, "addObject:", self->_shareMyLocationButton);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("[Maps Home] Mark My Location"), CFSTR("localized string not found"), 0));
  v15 = (UIButton *)objc_claimAutoreleasedReturnValue(-[HomeActionFooterContentView _footerButtonWithTitle:](self, "_footerButtonWithTitle:", v14));
  v16 = self->_markMyLocationButton;
  self->_markMyLocationButton = v15;

  -[UIButton addTarget:action:forControlEvents:](self->_markMyLocationButton, "addTarget:action:forControlEvents:", self, "_markMyLocation:", 0x2000);
  -[HomeActionFooterContentView addSubview:](self, "addSubview:", self->_markMyLocationButton);
  if (_MKRAPIsAvailable(objc_msgSend(v8, "addObject:", self->_markMyLocationButton))
    && (sub_1003DDB84() & 1) == 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("[Maps Home] Report an Issue"), CFSTR("localized string not found"), 0));
    v19 = (UIButton *)objc_claimAutoreleasedReturnValue(-[HomeActionFooterContentView _footerButtonWithTitle:](self, "_footerButtonWithTitle:", v18));
    v20 = self->_rapButton;
    self->_rapButton = v19;

    -[HomeActionFooterContentView addSubview:](self, "addSubview:", self->_rapButton);
    objc_msgSend(v8, "addObject:", self->_rapButton);
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("[Maps Home] Terms & Conditions"), CFSTR("localized string not found"), 0));
  v23 = (UIButton *)objc_claimAutoreleasedReturnValue(-[HomeActionFooterContentView _linkButtonWithTitle:](self, "_linkButtonWithTitle:", v22));
  v24 = self->_termsAndConditionsButton;
  self->_termsAndConditionsButton = v23;

  -[UIButton addTarget:action:forControlEvents:](self->_termsAndConditionsButton, "addTarget:action:forControlEvents:", self, "_openTermsAndConditions:", 0x2000);
  -[HomeActionFooterContentView addSubview:](self, "addSubview:", self->_termsAndConditionsButton);
  v25 = objc_msgSend(objc_alloc((Class)MUCompositionalStackLayoutGroup), "initWithAxis:", 1);
  objc_msgSend(v25, "setArrangedLayoutItems:", v8);
  objc_msgSend(v25, "setSpacing:", 10.0);
  v26 = objc_msgSend(objc_alloc((Class)MUCompositionalStackLayoutGroup), "initWithAxis:", 1);
  v27 = self->_termsAndConditionsButton;
  v34[0] = v25;
  v34[1] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 2));
  objc_msgSend(v26, "setArrangedLayoutItems:", v28);

  objc_msgSend(v26, "setDistribution:", 2);
  LODWORD(v29) = 1112276992;
  objc_msgSend(v26, "setDistributionFittingSizePriority:", v29);
  objc_msgSend(v26, "setSpacing:", 16.0);
  objc_msgSend(v26, "setAlignment:forArrangedLayoutItem:", 1, self->_termsAndConditionsButton);
  objc_msgSend(v26, "setAlignmentBoundsContent:forArrangedLayoutItem:", 1, self->_termsAndConditionsButton);
  v30 = objc_alloc((Class)MUCompositionalStackLayout);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[HomeActionFooterContentView layoutMarginsGuide](self, "layoutMarginsGuide"));
  v32 = (MUCompositionalStackLayout *)objc_msgSend(v30, "initWithContainer:group:", v31, v26);
  v33 = self->_stackLayout;
  self->_stackLayout = v32;

  -[MUCompositionalStackLayout activate](self->_stackLayout, "activate");
  -[HomeActionFooterContentView _updateRapMenu](self, "_updateRapMenu");
  -[HomeActionFooterContentView _updateLayoutMargins](self, "_updateLayoutMargins");

}

- (void)_updateRapMenu
{
  void *v3;
  void *v4;
  UIButton *rapButton;
  uint64_t v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HomeActionFooterContentView viewModel](self, "viewModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "homeActionFooterViewUIMenuForRAP:", self));

  rapButton = self->_rapButton;
  if (v7)
  {
    -[UIButton setMenu:](rapButton, "setMenu:", v7);
    v6 = 0x4000;
  }
  else
  {
    -[UIButton setMenu:](rapButton, "setMenu:", 0);
    v6 = 0x2000;
  }
  -[UIButton setShowsMenuAsPrimaryAction:](self->_rapButton, "setShowsMenuAsPrimaryAction:", v7 != 0);
  -[UIButton addTarget:action:forControlEvents:](self->_rapButton, "addTarget:action:forControlEvents:", self, "_reportAProblem:", v6);

}

- (id)_footerButtonWithTitle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration _mapsui_grayButtonConfiguration](UIButtonConfiguration, "_mapsui_grayButtonConfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "background"));
  objc_msgSend(v5, "setCornerRadius:", 8.0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor quaternarySystemFillColor](UIColor, "quaternarySystemFillColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "background"));
  objc_msgSend(v7, "setBackgroundColor:", v6);

  objc_msgSend(v4, "setCornerStyle:", -1);
  objc_msgSend(v4, "setTitle:", v3);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  objc_msgSend(v8, "setConfiguration:", v4);

  return v8;
}

- (id)_linkButtonWithTitle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _mapkit_preferredFontForTextStyleInTableViewCell:](UIFont, "_mapkit_preferredFontForTextStyleInTableViewCell:", UIFontTextStyleCaption2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100460268;
  v12[3] = &unk_1011AFCC0;
  v13 = v4;
  v6 = v4;
  objc_msgSend(v5, "setTitleTextAttributesTransformer:", v12);
  objc_msgSend(v5, "setTitle:", v3);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("chevron.forward")));
  objc_msgSend(v5, "setImage:", v7);

  objc_msgSend(v5, "setImagePlacement:", 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v6, 1));
  objc_msgSend(v5, "setPreferredSymbolConfigurationForImage:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  objc_msgSend(v5, "setBaseForegroundColor:", v9);

  objc_msgSend(v5, "setContentInsets:", NSDirectionalEdgeInsetsZero.top, NSDirectionalEdgeInsetsZero.leading, NSDirectionalEdgeInsetsZero.bottom, NSDirectionalEdgeInsetsZero.trailing);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  objc_msgSend(v10, "setConfiguration:", v5);

  return v10;
}

- (void)setViewModel:(id)a3
{
  HomeActionFooterViewModel *v5;
  HomeActionFooterViewModel *v6;
  unsigned __int8 v7;
  HomeActionFooterViewModel *v8;

  v5 = (HomeActionFooterViewModel *)a3;
  v6 = v5;
  if (self->_viewModel != v5)
  {
    v8 = v5;
    v7 = -[HomeActionFooterViewModel isEqual:](v5, "isEqual:");
    v6 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_viewModel, a3);
      -[HomeActionFooterContentView _updateLayoutMargins](self, "_updateLayoutMargins");
      -[HomeActionFooterContentView _updateRapMenu](self, "_updateRapMenu");
      v6 = v8;
    }
  }

}

- (void)rebuildContentIfNeeded
{
  if ((_MKRAPIsAvailable(self) & 1) != 0)
  {
    if (((sub_1003DDB84() ^ (self->_rapButton != 0)) & 1) != 0)
      return;
LABEL_5:
    -[HomeActionFooterContentView _rebuildContent](self, "_rebuildContent");
    return;
  }
  if (self->_rapButton)
    goto LABEL_5;
}

- (void)_updateLayoutMargins
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MUCompositionalStackLayout group](self->_stackLayout, "group"));
  v4 = objc_msgSend(v3, "copy");

  -[HomeActionFooterViewModel topMargin](self->_viewModel, "topMargin");
  objc_msgSend(v4, "setInsets:");
  -[MUCompositionalStackLayout setGroup:](self->_stackLayout, "setGroup:", v4);

}

- (BOOL)_shouldShowShareMylocation
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "countryCode"));

  LOBYTE(v2) = objc_msgSend(v3, "isEqualToString:", CFSTR("KR")) ^ 1;
  return (char)v2;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HomeActionFooterContentView;
  v4 = a3;
  -[HomeActionFooterContentView traitCollectionDidChange:](&v9, "traitCollectionDidChange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeActionFooterContentView traitCollection](self, "traitCollection", v9.receiver, v9.super_class));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "preferredContentSizeCategory"));

  v8 = sub_1002A8950(v6, v7);
  if (v8)
    -[HomeActionFooterContentView _rebuildContent](self, "_rebuildContent");
}

- (void)_shareMyLocation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeActionFooterViewModel delegate](self->_viewModel, "delegate"));
  v9 = v4;
  v6 = objc_opt_class(UIView);
  if ((objc_opt_isKindOfClass(v9, v6) & 1) != 0)
    v7 = v9;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v5, "homeActionFooterViewDidTapShareMyLocation:", v8);
}

- (void)_markMyLocation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeActionFooterViewModel delegate](self->_viewModel, "delegate"));
  v9 = v4;
  v6 = objc_opt_class(UIView);
  if ((objc_opt_isKindOfClass(v9, v6) & 1) != 0)
    v7 = v9;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v5, "homeActionFooterViewDidTapMarkMyLocation:", v8);
}

- (void)_reportAProblem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeActionFooterViewModel delegate](self->_viewModel, "delegate"));
  v9 = v4;
  v6 = objc_opt_class(UIView);
  if ((objc_opt_isKindOfClass(v9, v6) & 1) != 0)
    v7 = v9;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v5, "homeActionFooterViewDidTapReportAProblem:", v8);
}

- (void)_openTermsAndConditions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HomeActionFooterViewModel delegate](self->_viewModel, "delegate"));
  v9 = v4;
  v6 = objc_opt_class(UIView);
  if ((objc_opt_isKindOfClass(v9, v6) & 1) != 0)
    v7 = v9;
  else
    v7 = 0;
  v8 = v7;

  objc_msgSend(v5, "homeActionFooterViewDidTapTermsAndConditions:", v8);
}

- (HomeActionFooterViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_stackLayout, 0);
  objc_storeStrong((id *)&self->_termsAndConditionsButton, 0);
  objc_storeStrong((id *)&self->_rapButton, 0);
  objc_storeStrong((id *)&self->_markMyLocationButton, 0);
  objc_storeStrong((id *)&self->_shareMyLocationButton, 0);
}

@end
