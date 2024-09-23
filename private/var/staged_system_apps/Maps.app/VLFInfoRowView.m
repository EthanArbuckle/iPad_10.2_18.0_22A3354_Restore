@implementation VLFInfoRowView

+ (id)infoRowWithImage:(id)a3 text:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(objc_alloc((Class)a1), "initWithImage:text:", v7, v6);

  return v8;
}

- (VLFInfoRowView)initWithImage:(id)a3 text:(id)a4
{
  id v6;
  id v7;
  double y;
  double width;
  double height;
  VLFInfoRowView *v11;
  VLFInfoRowView *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  UIImageView *v19;
  UIImageView *iconImageView;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  UILabel *v32;
  UILabel *infoLabel;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
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
  id v64;
  id v65;
  objc_super v66;
  _QWORD v67[5];
  _QWORD v68[6];
  void *v69;

  v6 = a3;
  v7 = a4;
  v66.receiver = self;
  v66.super_class = (Class)VLFInfoRowView;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v11 = -[VLFInfoRowView initWithFrame:](&v66, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v12 = v11;
  if (v11)
  {
    -[VLFInfoRowView setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v13) = 1148846080;
    -[VLFInfoRowView setContentCompressionResistancePriority:forAxis:](v12, "setContentCompressionResistancePriority:forAxis:", 1, v13);
    LODWORD(v14) = 1148846080;
    -[VLFInfoRowView setContentHuggingPriority:forAxis:](v12, "setContentHuggingPriority:forAxis:", 1, v14);
    v65 = v7;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[VLFInfoRowView heightAnchor](v12, "heightAnchor"));
    LODWORD(v16) = 1132068864;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToConstant:priority:", 0.0, v16));
    v69 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v69, 1));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v18);

    v19 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v6);
    iconImageView = v12->_iconImageView;
    v12->_iconImageView = v19;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v12->_iconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v21) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v12->_iconImageView, "setContentCompressionResistancePriority:forAxis:", 1, v21);
    LODWORD(v22) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v12->_iconImageView, "setContentHuggingPriority:forAxis:", 1, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UIImageView setTintColor:](v12->_iconImageView, "setTintColor:", v23);

    -[UIImageView setContentMode:](v12->_iconImageView, "setContentMode:", 1);
    -[VLFInfoRowView addSubview:](v12, "addSubview:", v12->_iconImageView);
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v12->_iconImageView, "leadingAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[VLFInfoRowView leadingAnchor](v12, "leadingAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToAnchor:", v60));
    v68[0] = v58;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](v12->_iconImageView, "topAnchor"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[VLFInfoRowView topAnchor](v12, "topAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintGreaterThanOrEqualToAnchor:", v54));
    v68[1] = v52;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView bottomAnchor](v12->_iconImageView, "bottomAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[VLFInfoRowView bottomAnchor](v12, "bottomAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintLessThanOrEqualToAnchor:", v48));
    v68[2] = v47;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v12->_iconImageView, "heightAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToConstant:", 40.0));
    v68[3] = v24;
    v64 = v6;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v12->_iconImageView, "widthAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v12->_iconImageView, "heightAnchor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
    v68[4] = v27;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v12->_iconImageView, "centerYAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[VLFInfoRowView centerYAnchor](v12, "centerYAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v29));
    v68[5] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v68, 6));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v31);

    v32 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    infoLabel = v12->_infoLabel;
    v12->_infoLabel = v32;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v12->_infoLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v34) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v12->_infoLabel, "setContentCompressionResistancePriority:forAxis:", 1, v34);
    LODWORD(v35) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v12->_infoLabel, "setContentHuggingPriority:forAxis:", 1, v35);
    -[UILabel setNumberOfLines:](v12->_infoLabel, "setNumberOfLines:", 0);
    -[UILabel setText:](v12->_infoLabel, "setText:", v65);
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UILabel setTextColor:](v12->_infoLabel, "setTextColor:", v36);

    -[VLFInfoRowView addSubview:](v12, "addSubview:", v12->_infoLabel);
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v12->_infoLabel, "leadingAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v12->_iconImageView, "trailingAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:constant:", v61, 14.0));
    v67[0] = v59;
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v12->_infoLabel, "trailingAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[VLFInfoRowView trailingAnchor](v12, "trailingAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:", v55));
    v67[1] = v53;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v12->_infoLabel, "topAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[VLFInfoRowView topAnchor](v12, "topAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintGreaterThanOrEqualToAnchor:", v49));
    v67[2] = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v12->_infoLabel, "bottomAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[VLFInfoRowView bottomAnchor](v12, "bottomAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintLessThanOrEqualToAnchor:", v39));
    v67[3] = v40;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel heightAnchor](v12->_infoLabel, "heightAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v12->_iconImageView, "heightAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintGreaterThanOrEqualToAnchor:", v42));
    v67[4] = v43;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v67, 5));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v44);

    v7 = v65;
    v6 = v64;

  }
  return v12;
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (UILabel)infoLabel
{
  return self->_infoLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end
