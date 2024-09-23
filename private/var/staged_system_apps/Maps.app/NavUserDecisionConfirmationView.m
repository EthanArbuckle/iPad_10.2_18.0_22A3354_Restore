@implementation NavUserDecisionConfirmationView

- (NavUserDecisionConfirmationView)initWithFrame:(CGRect)a3
{
  NavUserDecisionConfirmationView *v3;
  NavUserDecisionConfirmationView *v4;
  NavUserDecisionConfirmationView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NavUserDecisionConfirmationView;
  v3 = -[NavUserDecisionConfirmationView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[NavUserDecisionConfirmationView _customInit](v3, "_customInit");
    v5 = v4;
  }

  return v4;
}

- (NavUserDecisionConfirmationView)initWithCoder:(id)a3
{
  NavUserDecisionConfirmationView *v3;
  NavUserDecisionConfirmationView *v4;
  NavUserDecisionConfirmationView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NavUserDecisionConfirmationView;
  v3 = -[NavUserDecisionConfirmationView initWithCoder:](&v7, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
  {
    -[NavUserDecisionConfirmationView _customInit](v3, "_customInit");
    v5 = v4;
  }

  return v4;
}

- (void)_customInit
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  NavTrafficIncidentHeaderView *v6;
  NavTrafficIncidentHeaderView *headerView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BackgroundColorButton *v14;
  BackgroundColorButton *cancelButton;
  MapsProgressButton *v16;
  MapsProgressButton *confirmButton;
  id v18;
  MapsProgressButton *v19;
  void *v20;
  UIStackView *v21;
  UIStackView *buttonsStackView;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  _QWORD v32[2];

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[NavUserDecisionConfirmationView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v5);

  v6 = -[NavTrafficIncidentHeaderView initWithFrame:]([NavTrafficIncidentHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  headerView = self->_headerView;
  self->_headerView = v6;

  -[NavTrafficIncidentHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_headerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[NavTrafficIncidentHeaderView setPrimaryToSecondaryLabelBaselineSpacing:](self->_headerView, "setPrimaryToSecondaryLabelBaselineSpacing:", 28.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentHeaderView primaryLabel](self->_headerView, "primaryLabel"));
  objc_msgSend(v8, "setNumberOfLines:", 1);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_boldSystemFontWithFixedSize:](UIFont, "_maps_boldSystemFontWithFixedSize:", 27.0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentHeaderView primaryLabel](self->_headerView, "primaryLabel"));
  objc_msgSend(v10, "setFont:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentHeaderView secondaryLabel](self->_headerView, "secondaryLabel"));
  objc_msgSend(v11, "setNumberOfLines:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_systemFontWithFixedSize:](UIFont, "_maps_systemFontWithFixedSize:", 22.0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentHeaderView secondaryLabel](self->_headerView, "secondaryLabel"));
  objc_msgSend(v13, "setFont:", v12);

  -[NavUserDecisionConfirmationView addSubview:](self, "addSubview:", self->_headerView);
  v14 = (BackgroundColorButton *)objc_claimAutoreleasedReturnValue(+[NavUserDecisionButtonFactory cancelButton](NavUserDecisionButtonFactory, "cancelButton"));
  cancelButton = self->_cancelButton;
  self->_cancelButton = v14;

  -[BackgroundColorButton addTarget:action:forControlEvents:](self->_cancelButton, "addTarget:action:forControlEvents:", self, "_didTapCancelButton:", 64);
  v16 = (MapsProgressButton *)objc_claimAutoreleasedReturnValue(+[NavUserDecisionButtonFactory confirmButton](NavUserDecisionButtonFactory, "confirmButton"));
  confirmButton = self->_confirmButton;
  self->_confirmButton = v16;

  -[MapsProgressButton addTarget:action:forControlEvents:](self->_confirmButton, "addTarget:action:forControlEvents:", self, "_didTapActionButton:", 64);
  v18 = objc_alloc((Class)UIStackView);
  v19 = self->_confirmButton;
  v32[0] = self->_cancelButton;
  v32[1] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v32, 2));
  v21 = (UIStackView *)objc_msgSend(v18, "initWithArrangedSubviews:", v20);
  buttonsStackView = self->_buttonsStackView;
  self->_buttonsStackView = v21;

  -[UIStackView setAccessibilityIdentifier:](self->_buttonsStackView, "setAccessibilityIdentifier:", CFSTR("ButtonsStackView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView buttonsStackView](self, "buttonsStackView"));
  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView buttonsStackView](self, "buttonsStackView"));
  objc_msgSend(v24, "setAxis:", 0);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView buttonsStackView](self, "buttonsStackView"));
  objc_msgSend(v25, "setDistribution:", 1);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView buttonsStackView](self, "buttonsStackView"));
  objc_msgSend(v26, "setAlignment:", 0);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView buttonsStackView](self, "buttonsStackView"));
  objc_msgSend(v27, "setSpacing:", 16.0);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView buttonsStackView](self, "buttonsStackView"));
  -[NavUserDecisionConfirmationView addSubview:](self, "addSubview:", v28);

  v29 = objc_alloc_init((Class)UILayoutGuide);
  -[NavUserDecisionConfirmationView setPaddingGuide:](self, "setPaddingGuide:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView paddingGuide](self, "paddingGuide"));
  -[NavUserDecisionConfirmationView addLayoutGuide:](self, "addLayoutGuide:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView _initialConstraints](self, "_initialConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);

}

- (id)_initialConstraints
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
  id v14;
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
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[10];

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView paddingGuide](self, "paddingGuide"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "leadingAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView leadingAnchor](self, "leadingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:constant:", v42, 16.0));
  v45[0] = v41;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView paddingGuide](self, "paddingGuide"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "leadingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentHeaderView leadingAnchor](self->_headerView, "leadingAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:constant:", v38, -4.0));
  v45[1] = v37;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView paddingGuide](self, "paddingGuide"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "leadingAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView buttonsStackView](self, "buttonsStackView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "leadingAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v33));
  v45[2] = v32;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView paddingGuide](self, "paddingGuide"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "trailingAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView trailingAnchor](self, "trailingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, -16.0));
  v45[3] = v28;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView paddingGuide](self, "paddingGuide"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentHeaderView trailingAnchor](self->_headerView, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
  v45[4] = v24;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView paddingGuide](self, "paddingGuide"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView buttonsStackView](self, "buttonsStackView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
  v45[5] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentHeaderView firstBaselineAnchor](self->_headerView, "firstBaselineAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView topAnchor](self, "topAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v17, 42.0));
  v45[6] = v16;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView buttonsStackView](self, "buttonsStackView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "topAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavTrafficIncidentHeaderView lastBaselineAnchor](self->_headerView, "lastBaselineAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4, 21.0));
  v45[7] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView buttonsStackView](self, "buttonsStackView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "heightAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToConstant:", 65.0));
  v45[8] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView buttonsStackView](self, "buttonsStackView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView bottomAnchor](self, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, -15.0));
  v45[9] = v12;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 10));

  return v14;
}

- (UILabel)primaryLabel
{
  return -[NavTrafficIncidentHeaderView primaryLabel](self->_headerView, "primaryLabel");
}

- (UILabel)secondaryLabel
{
  return -[NavTrafficIncidentHeaderView secondaryLabel](self->_headerView, "secondaryLabel");
}

- (MKArtworkImageSource)imageSource
{
  return -[NavTrafficIncidentHeaderView imageSource](self->_headerView, "imageSource");
}

- (void)setImageSource:(id)a3
{
  -[NavTrafficIncidentHeaderView setImageSource:](self->_headerView, "setImageSource:", a3);
}

- (NSString)cancelButtonTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView cancelButton](self, "cancelButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "titleForState:", 0));

  return (NSString *)v3;
}

- (void)setCancelButtonTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView cancelButton](self, "cancelButton"));
  objc_msgSend(v5, "setTitle:forState:", v4, 0);

}

- (NSString)confirmButtonTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView confirmButton](self, "confirmButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "titleForState:", 0));

  return (NSString *)v3;
}

- (void)setConfirmButtonTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView confirmButton](self, "confirmButton"));
  objc_msgSend(v5, "setTitle:forState:", v4, 0);

}

- (void)confirmButtonTitlesetCompletionProgress:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView confirmButton](self, "confirmButton"));
  objc_msgSend(v4, "setProgress:", a3);

}

- (void)setCompletionProgress:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView confirmButton](self, "confirmButton"));
  objc_msgSend(v4, "setProgress:", a3);

}

- (double)completionProgress
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView confirmButton](self, "confirmButton"));
  objc_msgSend(v2, "progress");
  v4 = v3;

  return v4;
}

- (void)setProgressBarHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView confirmButton](self, "confirmButton"));
  objc_msgSend(v4, "setProgressBarHidden:", v3);

}

- (BOOL)progressBarHidden
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView confirmButton](self, "confirmButton"));
  v3 = objc_msgSend(v2, "progressBarHidden");

  return v3;
}

- (void)_didTapCancelButton:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView delegate](self, "delegate", a3));
  objc_msgSend(v4, "userDecisionConfirmationViewDidCancel:", self);

}

- (void)_didTapActionButton:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[NavUserDecisionConfirmationView delegate](self, "delegate", a3));
  objc_msgSend(v4, "userDecisionConfirmationViewDidConfirm:", self);

}

- (NavUserDecisionConfirmationViewDelegate)delegate
{
  return (NavUserDecisionConfirmationViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BackgroundColorButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (MapsProgressButton)confirmButton
{
  return self->_confirmButton;
}

- (void)setConfirmButton:(id)a3
{
  objc_storeStrong((id *)&self->_confirmButton, a3);
}

- (UIStackView)buttonsStackView
{
  return self->_buttonsStackView;
}

- (UILayoutGuide)paddingGuide
{
  return self->_paddingGuide;
}

- (void)setPaddingGuide:(id)a3
{
  objc_storeStrong((id *)&self->_paddingGuide, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paddingGuide, 0);
  objc_storeStrong((id *)&self->_buttonsStackView, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
