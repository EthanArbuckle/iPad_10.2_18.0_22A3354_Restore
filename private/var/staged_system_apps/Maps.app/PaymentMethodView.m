@implementation PaymentMethodView

- (PaymentMethodView)init
{
  PaymentMethodView *v2;
  void *v3;
  void *v4;
  UIImageView *v5;
  UIImageView *paymentMethodImageView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  UIStackView *v16;
  UIStackView *paymentLabelView;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  UILabel *v29;
  UILabel *paymentTitleLabel;
  void *v31;
  UILabel *v32;
  UILabel *paymentSubtitleLabel;
  void *v34;
  id v35;
  double v36;
  id v37;
  void *i;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  id obj;
  uint64_t v52;
  PaymentMethodView *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  objc_super v58;
  _QWORD v59[2];
  _BYTE v60[128];

  v58.receiver = self;
  v58.super_class = (Class)PaymentMethodView;
  v53 = -[PaymentMethodView init](&v58, "init");
  if (v53)
  {
    v2 = v53;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PaymentMethodView layoutMarginsGuide](v53, "layoutMarginsGuide"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v5 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    paymentMethodImageView = v53->_paymentMethodImageView;
    v53->_paymentMethodImageView = v5;

    -[UIImageView setContentMode:](v53->_paymentMethodImageView, "setContentMode:", 1);
    -[UIImageView setClipsToBounds:](v53->_paymentMethodImageView, "setClipsToBounds:", 1);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v53->_paymentMethodImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PaymentMethodView addSubview:](v2, "addSubview:", v2->_paymentMethodImageView);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v53->_paymentMethodImageView, "widthAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToConstant:", 40.0));
    objc_msgSend(v4, "addObject:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v53->_paymentMethodImageView, "leadingAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
    objc_msgSend(v4, "addObject:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v53->_paymentMethodImageView, "centerYAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PaymentMethodView centerYAnchor](v53, "centerYAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
    objc_msgSend(v4, "addObject:", v14);

    LODWORD(v15) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v53->_paymentMethodImageView, "setContentCompressionResistancePriority:forAxis:", 0, v15);
    v16 = (UIStackView *)objc_alloc_init((Class)UIStackView);
    paymentLabelView = v53->_paymentLabelView;
    v53->_paymentLabelView = v16;

    -[UIStackView setAxis:](v53->_paymentLabelView, "setAxis:", 1);
    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v53->_paymentLabelView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PaymentMethodView addSubview:](v2, "addSubview:", v2->_paymentLabelView);
    LODWORD(v18) = 1148846080;
    -[UIStackView setContentHuggingPriority:forAxis:](v53->_paymentLabelView, "setContentHuggingPriority:forAxis:", 1, v18);
    LODWORD(v19) = 1148846080;
    -[UIStackView setContentHuggingPriority:forAxis:](v53->_paymentLabelView, "setContentHuggingPriority:forAxis:", 0, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView leadingAnchor](v53->_paymentLabelView, "leadingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v53->_paymentMethodImageView, "trailingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, 7.0));
    objc_msgSend(v4, "addObject:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView trailingAnchor](v53->_paymentLabelView, "trailingAnchor"));
    v50 = v3;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "trailingAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
    objc_msgSend(v4, "addObject:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView centerYAnchor](v53->_paymentLabelView, "centerYAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PaymentMethodView centerYAnchor](v53, "centerYAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v27));
    objc_msgSend(v4, "addObject:", v28);

    v29 = (UILabel *)objc_alloc_init((Class)UILabel);
    paymentTitleLabel = v53->_paymentTitleLabel;
    v53->_paymentTitleLabel = v29;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v53->_paymentTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v53->_paymentTitleLabel, "setTextColor:", v31);

    +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v53->_paymentTitleLabel, &stru_1011E7A38);
    -[UIStackView addArrangedSubview:](v2->_paymentLabelView, "addArrangedSubview:", v2->_paymentTitleLabel);
    v32 = (UILabel *)objc_alloc_init((Class)UILabel);
    paymentSubtitleLabel = v53->_paymentSubtitleLabel;
    v53->_paymentSubtitleLabel = v32;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v53->_paymentSubtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v53->_paymentSubtitleLabel, &stru_1011E7AF8);
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v53->_paymentSubtitleLabel, "setTextColor:", v34);

    -[UIStackView addArrangedSubview:](v2->_paymentLabelView, "addArrangedSubview:", v2->_paymentSubtitleLabel);
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v59[0] = v53->_paymentTitleLabel;
    v59[1] = v53->_paymentSubtitleLabel;
    obj = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v59, 2));
    v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    if (v35)
    {
      v37 = v35;
      v52 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v37; i = (char *)i + 1)
        {
          if (*(_QWORD *)v55 != v52)
            objc_enumerationMutation(obj);
          v39 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
          LODWORD(v36) = 1148846080;
          objc_msgSend(v39, "setContentCompressionResistancePriority:forAxis:", 1, v36);
          LODWORD(v40) = 1148846080;
          objc_msgSend(v39, "setContentHuggingPriority:forAxis:", 1, v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "trailingAnchor"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView layoutMarginsGuide](v53->_paymentLabelView, "layoutMarginsGuide"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "trailingAnchor"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v43));
          objc_msgSend(v4, "addObject:", v44);

          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "leadingAnchor"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView layoutMarginsGuide](v53->_paymentLabelView, "layoutMarginsGuide"));
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "leadingAnchor"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:", v47));
          objc_msgSend(v4, "addObject:", v48);

        }
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
      }
      while (v37);
    }

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v4);
  }
  return v53;
}

- (UIStackView)paymentLabelView
{
  return self->_paymentLabelView;
}

- (void)setPaymentLabelView:(id)a3
{
  objc_storeStrong((id *)&self->_paymentLabelView, a3);
}

- (UILabel)paymentTitleLabel
{
  return self->_paymentTitleLabel;
}

- (void)setPaymentTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_paymentTitleLabel, a3);
}

- (UILabel)paymentSubtitleLabel
{
  return self->_paymentSubtitleLabel;
}

- (void)setPaymentSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_paymentSubtitleLabel, a3);
}

- (UIImageView)paymentMethodImageView
{
  return self->_paymentMethodImageView;
}

- (void)setPaymentMethodImageView:(id)a3
{
  objc_storeStrong((id *)&self->_paymentMethodImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentMethodImageView, 0);
  objc_storeStrong((id *)&self->_paymentSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_paymentTitleLabel, 0);
  objc_storeStrong((id *)&self->_paymentLabelView, 0);
}

@end
