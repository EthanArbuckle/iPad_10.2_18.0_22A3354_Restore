@implementation MessageCellWarningView

- (MessageCellWarningView)init
{
  MessageCellWarningView *v2;
  UIImageView *v3;
  UIImageView *imageView;
  double v5;
  double v6;
  double v7;
  double v8;
  UILabel *v9;
  UILabel *label;
  void *v11;
  double v12;
  double v13;
  double v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MessageCellWarningView;
  v2 = -[MessageCellWarningView init](&v16, "init");
  if (v2)
  {
    v3 = objc_opt_new(UIImageView);
    imageView = v2->_imageView;
    v2->_imageView = v3;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v2->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v5) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v2->_imageView, "setContentHuggingPriority:forAxis:", 0, v5);
    LODWORD(v6) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v2->_imageView, "setContentHuggingPriority:forAxis:", 1, v6);
    LODWORD(v7) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v2->_imageView, "setContentCompressionResistancePriority:forAxis:", 0, v7);
    LODWORD(v8) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v2->_imageView, "setContentCompressionResistancePriority:forAxis:", 1, v8);
    v9 = objc_opt_new(UILabel);
    label = v2->_label;
    v2->_label = v9;

    -[UILabel setOpaque:](v2->_label, "setOpaque:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](v2->_label, "setBackgroundColor:", v11);

    -[UILabel setLineBreakMode:](v2->_label, "setLineBreakMode:", 4);
    -[UILabel setNumberOfLines:](v2->_label, "setNumberOfLines:", 4);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v2->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v12) = 1144750080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v2->_label, "setContentCompressionResistancePriority:forAxis:", 0, v12);
    LODWORD(v13) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v2->_label, "setContentCompressionResistancePriority:forAxis:", 1, v13);
    LODWORD(v14) = 1144750080;
    -[UILabel setContentHuggingPriority:forAxis:](v2->_label, "setContentHuggingPriority:forAxis:", 1, v14);
    -[MessageCellWarningView addSubview:](v2, "addSubview:", v2->_imageView);
    -[MessageCellWarningView addSubview:](v2, "addSubview:", v2->_label);
  }
  return v2;
}

- (void)setImage:(id)a3 warningString:(id)a4 emphasizedRangeValue:(id)a5
{
  id v8;
  UIImageView *imageView;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  NSDictionary *v21;
  void *v22;
  id v23;
  void *v24;
  NSDictionary *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];

  v8 = a5;
  imageView = self->_imageView;
  v10 = a4;
  -[UIImageView setImage:](imageView, "setImage:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleFootnote, 0x8000, 0));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v11, 0.0));
  v31[0] = NSFontAttributeName;
  v31[1] = NSForegroundColorAttributeName;
  v32[0] = v28;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v32[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 2));

  v14 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:attributes:", v10, v13);
  if (v8)
  {
    v15 = objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", UIFontTextStyleFootnote, 32770, 0));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v15, 0.0));
    v29[1] = NSForegroundColorAttributeName;
    v30[0] = v16;
    v29[0] = NSFontAttributeName;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    v30[1] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 2));

    v19 = objc_msgSend(v8, "rangeValue");
    objc_msgSend(v14, "setAttributes:range:", v18, v19, v20);

    v11 = (void *)v15;
  }
  -[UILabel setAttributedText:](self->_label, "setAttributedText:", v14);
  if (!self->_didActivateConstraints)
  {
    v21 = _NSDictionaryOfVariableBindings(CFSTR("_imageView,_label"), self->_imageView, self->_label, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = v8;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_imageView]-(2)-[_label]|"), 4096, 0, v22));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v24);

    v8 = v23;
    v25 = _NSDictionaryOfVariableBindings(CFSTR("_imageView,_label"), self->_imageView, self->_label, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_label]|"), 0, 0, v26));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v27);

    self->_didActivateConstraints = 1;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
