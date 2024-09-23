@implementation MTATimerIntervalPickerCell

- (UILabel)textLabel
{
  UILabel *textLabel;
  id v4;
  double v5;
  double v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v18;
  _QWORD v19[3];

  textLabel = self->_textLabel;
  if (!textLabel)
  {
    v4 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    -[MTATimerIntervalPickerCell setTextLabel:](self, "setTextLabel:", v4);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_textLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v5) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](self->_textLabel, "setContentHuggingPriority:forAxis:", 0, v5);
    LODWORD(v6) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](self->_textLabel, "setContentCompressionResistancePriority:forAxis:", 0, v6);
    -[MTATimerIntervalPickerCell addSubview:](self, "addSubview:", self->_textLabel);
    v7 = -[MTATimerIntervalPickerCell mtui_isRTL](self, "mtui_isRTL");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](self->_textLabel, "centerYAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerCell centerYAnchor](self, "centerYAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v8));
    v19[0] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel heightAnchor](self->_textLabel, "heightAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToConstant:", 32.0));
    v19[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_textLabel, "trailingAnchor"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTATimerIntervalPickerCell leadingAnchor](self, "leadingAnchor"));
    v14 = 47.0;
    if (v7)
      v14 = 51.0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, v14));
    v19[2] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 3));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

    textLabel = self->_textLabel;
  }
  return textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_storeStrong((id *)&self->_textLabel, a3);
}

- (NSLayoutConstraint)textLabelLeadingConstraint
{
  return self->_textLabelLeadingConstraint;
}

- (void)setTextLabelLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textLabelLeadingConstraint, a3);
}

- (NSLayoutConstraint)textLabelTrailingConstraint
{
  return self->_textLabelTrailingConstraint;
}

- (void)setTextLabelTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textLabelTrailingConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabelTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_textLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
