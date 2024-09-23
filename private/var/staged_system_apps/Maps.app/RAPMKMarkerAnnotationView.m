@implementation RAPMKMarkerAnnotationView

- (BOOL)updateCalloutViewIfNeededAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _RAPAnnotationTitleLabel *v5;
  _RAPAnnotationTitleLabel *annotationTitleLabel;
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
  objc_super v18;

  v3 = a3;
  v5 = -[_RAPAnnotationTitleLabel initWithFrame:]([_RAPAnnotationTitleLabel alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  annotationTitleLabel = self->_annotationTitleLabel;
  self->_annotationTitleLabel = v5;

  -[_RAPAnnotationTitleLabel setTextAlignment:](self->_annotationTitleLabel, "setTextAlignment:", 1);
  -[_RAPAnnotationTitleLabel setAdjustsFontSizeToFitWidth:](self->_annotationTitleLabel, "setAdjustsFontSizeToFitWidth:", 1);
  -[_RAPAnnotationTitleLabel setBaselineAdjustment:](self->_annotationTitleLabel, "setBaselineAdjustment:", 1);
  -[_RAPAnnotationTitleLabel setNumberOfLines:](self->_annotationTitleLabel, "setNumberOfLines:", 0);
  -[_RAPAnnotationTitleLabel setTranslatesAutoresizingMaskIntoConstraints:](self->_annotationTitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 12.0));
  -[_RAPAnnotationTitleLabel setFont:](self->_annotationTitleLabel, "setFont:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[_RAPAnnotationTitleLabel setTextColor:](self->_annotationTitleLabel, "setTextColor:", v8);

  -[RAPMKMarkerAnnotationView addSubview:](self, "addSubview:", self->_annotationTitleLabel);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPAnnotationTitleLabel topAnchor](self->_annotationTitleLabel, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMKMarkerAnnotationView bottomAnchor](self, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v10));
  objc_msgSend(v11, "setActive:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPAnnotationTitleLabel widthAnchor](self->_annotationTitleLabel, "widthAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToConstant:", 100.0));
  objc_msgSend(v13, "setActive:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[_RAPAnnotationTitleLabel centerXAnchor](self->_annotationTitleLabel, "centerXAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMKMarkerAnnotationView centerXAnchor](self, "centerXAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));
  objc_msgSend(v16, "setActive:", 1);

  -[_RAPAnnotationTitleLabel setHidden:](self->_annotationTitleLabel, "setHidden:", 1);
  v18.receiver = self;
  v18.super_class = (Class)RAPMKMarkerAnnotationView;
  return -[RAPMKMarkerAnnotationView updateCalloutViewIfNeededAnimated:](&v18, "updateCalloutViewIfNeededAnimated:", v3);
}

- (void)setAnnotationTitle:(id)a3
{
  NSString *v4;
  NSString *annotationTitle;
  NSUInteger v6;
  const __CFString *v7;
  id *p_annotationTitleLabel;
  id v9;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  annotationTitle = self->_annotationTitle;
  self->_annotationTitle = v4;

  v6 = -[NSString length](self->_annotationTitle, "length");
  if (v6)
  {
    v7 = (const __CFString *)self->_annotationTitle;
    p_annotationTitleLabel = (id *)&self->_annotationTitleLabel;
    v9 = *p_annotationTitleLabel;
  }
  else
  {
    p_annotationTitleLabel = (id *)&self->_annotationTitleLabel;
    v9 = *p_annotationTitleLabel;
    v7 = &stru_1011EB268;
  }
  objc_msgSend(v9, "setText:", v7);
  objc_msgSend(*p_annotationTitleLabel, "setHidden:", v6 == 0);
}

- (NSString)annotationTitle
{
  return self->_annotationTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationTitle, 0);
  objc_storeStrong((id *)&self->_annotationTitleLabel, 0);
}

@end
