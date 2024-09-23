@implementation CHPillLabelView

+ (id)pillImages
{
  if (qword_10083E0A8 != -1)
    dispatch_once(&qword_10083E0A8, &stru_10077A120);
  return (id)qword_10083E0A0;
}

+ (id)cacheKeyForColor:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v14;
  double v15;
  double v16;
  double v17;

  height = a4.height;
  width = a4.width;
  v16 = 0.0;
  v17 = 0.0;
  v14 = 0.0;
  v15 = 0.0;
  objc_msgSend(a3, "getRed:green:blue:alpha:", &v17, &v16, &v15, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v17));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v16));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v15));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v14));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", width));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", height));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@_%@_%@_%@_%@"), v6, v7, v8, v9, v10, v11));

  return v12;
}

+ (id)imageForCacheKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "pillImages"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  return v6;
}

+ (void)setImage:(id)a3 forCacheKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "pillImages"));
  objc_msgSend(v8, "setObject:forKey:", v7, v6);

}

+ (id)pillImageForColor:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  CGContext *CurrentContext;
  UIImage *ImageFromCurrentImageContext;
  void *v12;
  id v13;
  CGSize v15;
  CGRect v16;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cacheKeyForColor:size:", v7, width, height));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "imageForCacheKey:", v8));
  if (!v9)
  {
    v15.width = width;
    v15.height = height;
    UIGraphicsBeginImageContextWithOptions(v15, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(objc_retainAutorelease(v7), "CGColor"));
    v16.origin.x = 0.0;
    v16.origin.y = 0.0;
    v16.size.width = width;
    v16.size.height = height;
    CGContextFillEllipseInRect(CurrentContext, v16);
    ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
    v12 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
    UIGraphicsEndImageContext();
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "resizableImageWithCapInsets:resizingMode:", 1, 0.0, width * 0.5, 0.0, width * 0.5));

    if (v9)
      objc_msgSend(a1, "setImage:forCacheKey:", v9, v8);
  }
  v13 = v9;

  return v13;
}

- (CHPillLabelView)initWithFrame:(CGRect)a3
{
  CHPillLabelView *v3;
  void *v4;
  double v5;
  double v6;
  UILabel *v7;
  UILabel *label;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  UIImageView *v15;
  UIImageView *imageView;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)CHPillLabelView;
  v3 = -[CHPillLabelView initWithFrame:](&v18, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[CHPillLabelView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[CHPillLabelView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v5) = 1148846080;
    -[CHPillLabelView setContentCompressionResistancePriority:forAxis:](v3, "setContentCompressionResistancePriority:forAxis:", 1, v5);
    LODWORD(v6) = 1148846080;
    -[CHPillLabelView setContentHuggingPriority:forAxis:](v3, "setContentHuggingPriority:forAxis:", 1, v6);
    v7 = (UILabel *)objc_alloc_init((Class)UILabel);
    label = v3->_label;
    v3->_label = v7;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 9.0, UIFontWeightSemibold));
    -[UILabel setFont:](v3->_label, "setFont:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
    -[UILabel setTextColor:](v3->_label, "setTextColor:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    objc_opt_class(v3, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pillImageForColor:size:", v11, 14.0, 14.0));
    v15 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v14);
    imageView = v3->_imageView;
    v3->_imageView = v15;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CHPillLabelView addSubview:](v3, "addSubview:", v3->_imageView);
    -[CHPillLabelView addSubview:](v3, "addSubview:", v3->_label);
    -[CHPillLabelView applyConstraints](v3, "applyConstraints");

  }
  return v3;
}

- (void)setPillBackgroundColor:(id)a3
{
  UIColor **p_pillBackgroundColor;
  id v6;
  uint64_t v7;
  id v8;
  id v9;

  p_pillBackgroundColor = &self->_pillBackgroundColor;
  objc_storeStrong((id *)&self->_pillBackgroundColor, a3);
  v6 = a3;
  objc_opt_class(self, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pillImageForColor:size:", *p_pillBackgroundColor, 14.0, 14.0));
  -[UIImageView setImage:](self->_imageView, "setImage:", v9);

}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CHPillLabelView label](self, "label"));
  objc_msgSend(v2, "intrinsicContentSize");
  v4 = v3 + 6.0;

  v5 = 14.0;
  if (v4 >= 14.0)
    v5 = v4;
  v6 = 14.0;
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)applyConstraints
{
  void *v3;
  double v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
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
  double v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  _QWORD v42[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CHPillLabelView label](self, "label"));
  LODWORD(v4) = 1148846080;
  objc_msgSend(v3, "setContentCompressionResistancePriority:forAxis:", 0, v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHPillLabelView label](self, "label"));
  LODWORD(v6) = 1148846080;
  objc_msgSend(v5, "setContentCompressionResistancePriority:forAxis:", 1, v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CHPillLabelView label](self, "label"));
  LODWORD(v8) = 1148846080;
  objc_msgSend(v7, "setContentHuggingPriority:forAxis:", 0, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CHPillLabelView label](self, "label"));
  LODWORD(v10) = 1148846080;
  objc_msgSend(v9, "setContentHuggingPriority:forAxis:", 1, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CHPillLabelView label](self, "label"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "centerXAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CHPillLabelView centerXAnchor](self, "centerXAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v13));
  objc_msgSend(v14, "setActive:", 1);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CHPillLabelView label](self, "label"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "centerYAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CHPillLabelView centerYAnchor](self, "centerYAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
  objc_msgSend(v18, "setActive:", 1);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CHPillLabelView imageView](self, "imageView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "centerXAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CHPillLabelView centerXAnchor](self, "centerXAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, 0.0));
  objc_msgSend(v22, "setActive:", 1);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CHPillLabelView imageView](self, "imageView"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "centerYAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CHPillLabelView label](self, "label"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "centerYAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:constant:", v26, 0.0));
  objc_msgSend(v27, "setActive:", 1);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CHPillLabelView imageView](self, "imageView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "heightAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToConstant:", 14.0));
  objc_msgSend(v30, "setActive:", 1);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CHPillLabelView imageView](self, "imageView"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "widthAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CHPillLabelView label](self, "label"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "widthAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:multiplier:constant:", v34, 1.0, 6.0));

  LODWORD(v36) = 1144750080;
  objc_msgSend(v35, "setPriority:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CHPillLabelView imageView](self, "imageView"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "widthAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintGreaterThanOrEqualToConstant:", 14.0));

  LODWORD(v40) = 1148846080;
  objc_msgSend(v39, "setPriority:", v40);
  v42[0] = v35;
  v42[1] = v39;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v42, 2));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v41);

}

- (void)setIntegerValue:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v4, 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CHPillLabelView label](self, "label"));
  objc_msgSend(v5, "setText:", v6);

}

- (id)firstBaselineAnchor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CHPillLabelView label](self, "label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstBaselineAnchor"));

  return v3;
}

- (id)lastBaselineAnchor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CHPillLabelView label](self, "label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastBaselineAnchor"));

  return v3;
}

- (UIColor)pillBackgroundColor
{
  return self->_pillBackgroundColor;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_pillBackgroundColor, 0);
}

@end
