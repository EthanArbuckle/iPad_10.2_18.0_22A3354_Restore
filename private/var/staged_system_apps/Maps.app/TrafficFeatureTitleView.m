@implementation TrafficFeatureTitleView

- (TrafficFeatureTitleView)initWithFrame:(CGRect)a3
{
  TrafficFeatureTitleView *v3;
  void *v4;
  id v5;
  double y;
  double width;
  double height;
  UIImageView *v9;
  UIImageView *imageView;
  double v11;
  double v12;
  UILabel *v13;
  UILabel *titleLabel;
  void *v15;
  void *v16;
  void *v17;
  MapsThemeLabel *v18;
  UILabel *subtitleLabel;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
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
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  objc_super v87;
  _QWORD v88[2];
  _QWORD v89[13];

  v87.receiver = self;
  v87.super_class = (Class)TrafficFeatureTitleView;
  v3 = -[TrafficFeatureTitleView initWithFrame:](&v87, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[TrafficFeatureTitleView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_alloc((Class)UIImageView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v9 = (UIImageView *)objc_msgSend(v5, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    imageView = v3->_imageView;
    v3->_imageView = v9;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 1);
    LODWORD(v11) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v3->_imageView, "setContentHuggingPriority:forAxis:", 1, v11);
    LODWORD(v12) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v3->_imageView, "setContentHuggingPriority:forAxis:", 0, v12);
    -[TrafficFeatureTitleView addSubview:](v3, "addSubview:", v3->_imageView);
    v13 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v13;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (sub_1002A8AA0(v3) == 5)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system20Bold](UIFont, "system20Bold"));
      -[UILabel setFont:](v3->_titleLabel, "setFont:", v15);

      -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 0);
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system22AdaptiveSemibold](UIFont, "system22AdaptiveSemibold"));
      -[UILabel setFont:](v3->_titleLabel, "setFont:", v16);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v17);

    -[TrafficFeatureTitleView addSubview:](v3, "addSubview:", v3->_titleLabel);
    v18 = -[MapsThemeLabel initWithFrame:]([MapsThemeLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    subtitleLabel = v3->_subtitleLabel;
    v3->_subtitleLabel = &v18->super;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system15](UIFont, "system15"));
    -[UILabel setFont:](v3->_subtitleLabel, "setFont:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v3->_subtitleLabel, "setTextColor:", v21);

    -[TrafficFeatureTitleView addSubview:](v3, "addSubview:", v3->_subtitleLabel);
    v22 = objc_alloc_init((Class)UILayoutGuide);
    -[TrafficFeatureTitleView addLayoutGuide:](v3, "addLayoutGuide:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficFeatureTitleView traitCollection](v3, "traitCollection"));
    if (objc_msgSend(v23, "userInterfaceIdiom") == (id)5)
      v24 = 20.0;
    else
      v24 = 40.0;

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficFeatureTitleView traitCollection](v3, "traitCollection"));
    if (objc_msgSend(v25, "userInterfaceIdiom") == (id)5)
      v26 = 5.0;
    else
      v26 = 10.0;

    v86 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficFeatureTitleView imageView](v3, "imageView"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "leadingAnchor"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficFeatureTitleView leadingAnchor](v3, "leadingAnchor"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:constant:", v84, 15.0));
    v89[0] = v83;
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficFeatureTitleView imageView](v3, "imageView"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "centerYAnchor"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficFeatureTitleView centerYAnchor](v3, "centerYAnchor"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToAnchor:", v80));
    v89[1] = v79;
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficFeatureTitleView imageView](v3, "imageView"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "widthAnchor"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToConstant:", v24));
    v89[2] = v76;
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficFeatureTitleView titleLabel](v3, "titleLabel"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "leadingAnchor"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v73));
    v89[3] = v72;
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficFeatureTitleView titleLabel](v3, "titleLabel"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "trailingAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:", v69));
    v89[4] = v68;
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficFeatureTitleView titleLabel](v3, "titleLabel"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "topAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:", v65));
    v89[5] = v64;
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficFeatureTitleView subtitleLabel](v3, "subtitleLabel"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "leadingAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v61));
    v89[6] = v60;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficFeatureTitleView subtitleLabel](v3, "subtitleLabel"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "trailingAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToAnchor:", v57));
    v89[7] = v56;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficFeatureTitleView subtitleLabel](v3, "subtitleLabel"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "topAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficFeatureTitleView titleLabel](v3, "titleLabel"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "bottomAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v52));
    v89[8] = v51;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficFeatureTitleView subtitleLabel](v3, "subtitleLabel"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "bottomAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v48));
    v89[9] = v47;
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficFeatureTitleView imageView](v3, "imageView"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "trailingAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:constant:", v44, v26));
    v89[10] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficFeatureTitleView trailingAnchor](v3, "trailingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v29, -15.0));
    v89[11] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "centerYAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficFeatureTitleView centerYAnchor](v3, "centerYAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v32));
    v89[12] = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v89, 13));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v34);

    v35 = v22;
    if (sub_1002A8AA0(v3) == 5)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficFeatureTitleView topAnchor](v3, "topAnchor"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v37));
      v88[0] = v38;
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "bottomAnchor"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficFeatureTitleView bottomAnchor](v3, "bottomAnchor"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v40));
      v88[1] = v41;
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v88, 2));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v42);

    }
  }
  return v3;
}

- (UIImage)image
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficFeatureTitleView imageView](self, "imageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "image"));

  return (UIImage *)v3;
}

- (void)setImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TrafficFeatureTitleView imageView](self, "imageView"));
  objc_msgSend(v5, "setImage:", v4);

}

- (NSString)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficFeatureTitleView titleLabel](self, "titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TrafficFeatureTitleView titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setText:", v4);

}

- (NSString)subtitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TrafficFeatureTitleView subtitleLabel](self, "subtitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (void)setSubtitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TrafficFeatureTitleView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v5, "setText:", v4);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = UIViewNoIntrinsicMetric;
  v3 = UIViewNoIntrinsicMetric;
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
