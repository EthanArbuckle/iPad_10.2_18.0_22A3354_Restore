@implementation TransitLineDisambiguationCell

- (TransitLineDisambiguationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  TransitLineDisambiguationCell *v4;
  id v5;
  void *v6;
  void *v7;
  MapsThemeLabel *v8;
  double y;
  double width;
  double height;
  MapsThemeLabel *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)TransitLineDisambiguationCell;
  v4 = -[MapsThemeTableViewCell initWithStyle:reuseIdentifier:](&v41, "initWithStyle:reuseIdentifier:", a3, a4);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
    -[TransitLineDisambiguationCell setSpinner:](v4, "setSpinner:", v5);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell spinner](v4, "spinner"));
    objc_msgSend(v6, "setHidesWhenStopped:", 1);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell spinner](v4, "spinner"));
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v8 = [MapsThemeLabel alloc];
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v12 = -[MapsThemeLabel initWithFrame:](v8, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[TransitLineDisambiguationCell setMessageLabel:](v4, "setMessageLabel:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell messageLabel](v4, "messageLabel"));
    objc_msgSend(v13, "setLineBreakMode:", 4);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell messageLabel](v4, "messageLabel"));
    objc_msgSend(v14, "setNumberOfLines:", 0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell messageLabel](v4, "messageLabel"));
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell messageLabel](v4, "messageLabel"));
    objc_msgSend(v17, "setTextColor:", v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell messageLabel](v4, "messageLabel"));
    LODWORD(v19) = 1144750080;
    objc_msgSend(v18, "setContentCompressionResistancePriority:forAxis:", 0, v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell messageLabel](v4, "messageLabel"));
    LODWORD(v21) = 1148829696;
    objc_msgSend(v20, "setContentCompressionResistancePriority:forAxis:", 1, v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell contentView](v4, "contentView"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell messageLabel](v4, "messageLabel"));
    objc_msgSend(v22, "addSubview:", v23);

    v24 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[TransitLineDisambiguationCell setShieldImageView:](v4, "setShieldImageView:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell shieldImageView](v4, "shieldImageView"));
    objc_msgSend(v25, "setContentMode:", 4);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell shieldImageView](v4, "shieldImageView"));
    objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell shieldImageView](v4, "shieldImageView"));
    LODWORD(v28) = 1148846080;
    objc_msgSend(v27, "setContentHuggingPriority:forAxis:", 0, v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell shieldImageView](v4, "shieldImageView"));
    LODWORD(v30) = 1148846080;
    objc_msgSend(v29, "setContentHuggingPriority:forAxis:", 1, v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell shieldImageView](v4, "shieldImageView"));
    LODWORD(v32) = 1148846080;
    objc_msgSend(v31, "setContentCompressionResistancePriority:forAxis:", 0, v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell shieldImageView](v4, "shieldImageView"));
    LODWORD(v34) = 1148846080;
    objc_msgSend(v33, "setContentCompressionResistancePriority:forAxis:", 1, v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell contentView](v4, "contentView"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell shieldImageView](v4, "shieldImageView"));
    objc_msgSend(v35, "addSubview:", v36);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell messageLabel](v4, "messageLabel"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell _fontProviderForMessageLabel](v4, "_fontProviderForMessageLabel"));
    +[DynamicTypeWizard autorefreshLabel:withFontProvider:](DynamicTypeWizard, "autorefreshLabel:withFontProvider:", v37, v38);

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[TransitLineDisambiguationCell setBackgroundColor:](v4, "setBackgroundColor:", v39);

    -[TransitLineDisambiguationCell addConstraints](v4, "addConstraints");
  }
  return v4;
}

- (void)showSpinner
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
  _QWORD v19[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell messageLabel](self, "messageLabel"));
  objc_msgSend(v3, "setText:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell shieldImageView](self, "shieldImageView"));
  objc_msgSend(v4, "setImage:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell spinner](self, "spinner"));
  objc_msgSend(v5, "addSubview:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell spinner](self, "spinner"));
  objc_msgSend(v7, "startAnimating");

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell spinner](self, "spinner"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "centerXAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell contentView](self, "contentView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "centerXAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v19[0] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell spinner](self, "spinner"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "centerYAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell contentView](self, "contentView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "centerYAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
  v19[1] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

}

- (void)hideSpinner
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell spinner](self, "spinner"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "superview"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell spinner](self, "spinner"));
    objc_msgSend(v5, "stopAnimating");

    v6 = (id)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell spinner](self, "spinner"));
    objc_msgSend(v6, "removeFromSuperview");

  }
}

- (void)setShieldImage:(id)a3
{
  id *p_shieldImage;
  id v6;
  void *v7;
  id v8;

  p_shieldImage = (id *)&self->_shieldImage;
  v8 = a3;
  if ((objc_msgSend(*p_shieldImage, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_shieldImage, a3);
    v6 = *p_shieldImage;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell shieldImageView](self, "shieldImageView"));
    objc_msgSend(v7, "setImage:", v6);

  }
}

- (void)setLabelText:(id)a3
{
  id *p_labelText;
  id v6;
  void *v7;
  id v8;

  p_labelText = (id *)&self->_labelText;
  v8 = a3;
  if ((objc_msgSend(*p_labelText, "isEqualToString:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_labelText, a3);
    v6 = *p_labelText;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell messageLabel](self, "messageLabel"));
    objc_msgSend(v7, "setText:", v6);

  }
}

- (void)setMaxWidth:(double)a3
{
  if (self->_maxWidth != a3)
  {
    self->_maxWidth = a3;
    -[TransitLineDisambiguationCell _updateMessageLabelLeadingMargin](self, "_updateMessageLabelLeadingMargin");
  }
}

- (void)addConstraints
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
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
  _QWORD v45[7];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell contentView](self, "contentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "heightAnchor"));
  -[TransitLineDisambiguationCell _targetCellHeight](self, "_targetCellHeight");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToConstant:"));

  LODWORD(v6) = 1148813312;
  v7 = v5;
  v44 = v5;
  objc_msgSend(v5, "setPriority:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell messageLabel](self, "messageLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstBaselineAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell contentView](self, "contentView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topAnchor"));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintGreaterThanOrEqualToAnchor:", v11));
  v37 = (void *)v12;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell messageLabel](self, "messageLabel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell contentView](self, "contentView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v16));
  -[TransitLineDisambiguationCell setMessageLabelLeadingConstraint:](self, "setMessageLabelLeadingConstraint:", v17);

  if (sub_1002A8AA0(self) == 5)
    v18 = 8.0;
  else
    v18 = 34.0;
  v45[0] = v7;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell shieldImageView](self, "shieldImageView"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "centerYAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell contentView](self, "contentView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "centerYAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v40));
  v45[1] = v39;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell shieldImageView](self, "shieldImageView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "leadingAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell contentView](self, "contentView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "leadingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:constant:", v34, 16.0));
  v45[2] = v33;
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell _fontProviderForMessageLabel](self, "_fontProviderForMessageLabel"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[DynamicTypeWizard autoscaledConstraint:constant:withFontProvider:](DynamicTypeWizard, "autoscaledConstraint:constant:withFontProvider:", v12, v32, v18));
  v45[3] = v31;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell messageLabelLeadingConstraint](self, "messageLabelLeadingConstraint"));
  v45[4] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell messageLabel](self, "messageLabel"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "centerYAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell contentView](self, "contentView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "centerYAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v20));
  v45[5] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell messageLabel](self, "messageLabel"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell contentView](self, "contentView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v25, -16.0));
  v45[6] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 7));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v27);

  -[TransitLineDisambiguationCell _updateMessageLabelLeadingMargin](self, "_updateMessageLabelLeadingMargin");
}

- (void)_updateMessageLabelLeadingMargin
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  -[TransitLineDisambiguationCell maxWidth](self, "maxWidth");
  v4 = v3 + 16.0;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell shieldImage](self, "shieldImage"));
  v5 = 0.0;
  if (v8)
    v5 = 16.0;
  v6 = v4 + v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitLineDisambiguationCell messageLabelLeadingConstraint](self, "messageLabelLeadingConstraint"));
  objc_msgSend(v7, "setConstant:", v6);

}

- (id)_fontProviderForMessageLabel
{
  Block_layout *v2;

  if (sub_1002A8AA0(self) == 5)
    v2 = &stru_1011E7C18;
  else
    v2 = &stru_1011E7BB8;
  return objc_retainBlock(v2);
}

- (double)_targetCellHeight
{
  uint64_t v2;
  double result;

  v2 = sub_1002A8AA0(self);
  result = 79.0;
  if (v2 == 5)
    return 36.0;
  return result;
}

- (NSString)labelText
{
  return self->_labelText;
}

- (UIImage)shieldImage
{
  return self->_shieldImage;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (MapsThemeLabel)messageLabel
{
  return self->_messageLabel;
}

- (void)setMessageLabel:(id)a3
{
  objc_storeStrong((id *)&self->_messageLabel, a3);
}

- (UIImageView)shieldImageView
{
  return self->_shieldImageView;
}

- (void)setShieldImageView:(id)a3
{
  objc_storeStrong((id *)&self->_shieldImageView, a3);
}

- (NSLayoutConstraint)messageLabelLeadingConstraint
{
  return self->_messageLabelLeadingConstraint;
}

- (void)setMessageLabelLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_messageLabelLeadingConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_shieldImageView, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_shieldImage, 0);
  objc_storeStrong((id *)&self->_labelText, 0);
}

@end
