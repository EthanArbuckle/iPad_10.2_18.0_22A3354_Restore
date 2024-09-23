@implementation TransitDirectionsBoardingInfoStackView

- (TransitDirectionsBoardingInfoStackView)initWithFrame:(CGRect)a3
{
  TransitDirectionsBoardingInfoStackView *v3;
  TransitDirectionsBoardingInfoStackView *v4;
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
  uint64_t v16;
  NSArray *horizontalLayoutConstraints;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSArray *verticalLayoutConstraints;
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
  objc_super v56;
  _QWORD v57[7];
  _QWORD v58[7];

  v56.receiver = self;
  v56.super_class = (Class)TransitDirectionsBoardingInfoStackView;
  v3 = -[TransitDirectionsBoardingInfoStackView initWithFrame:](&v56, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoStackView topView](v3, "topView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoStackView bottomView](v4, "bottomView"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoStackView topAnchor](v4, "topAnchor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v50));
    v58[0] = v48;
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoStackView leadingAnchor](v4, "leadingAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:", v44));
    v58[1] = v42;
    v55 = v5;
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoStackView bottomAnchor](v4, "bottomAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintLessThanOrEqualToAnchor:", v38));
    v58[2] = v36;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoStackView topAnchor](v4, "topAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v32));
    v58[3] = v30;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, 6.0));
    v58[4] = v9;
    v54 = v6;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoStackView trailingAnchor](v4, "trailingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
    v58[5] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoStackView bottomAnchor](v4, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
    v58[6] = v15;
    v16 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v58, 7));
    horizontalLayoutConstraints = v4->_horizontalLayoutConstraints;
    v4->_horizontalLayoutConstraints = (NSArray *)v16;

    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "topAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoStackView topAnchor](v4, "topAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v51));
    v57[0] = v49;
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "leadingAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoStackView leadingAnchor](v4, "leadingAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v45));
    v57[1] = v43;
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "trailingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoStackView trailingAnchor](v4, "trailingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintLessThanOrEqualToAnchor:", v39));
    v57[2] = v37;
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "topAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "bottomAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v33));
    v57[3] = v31;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "leadingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoStackView leadingAnchor](v4, "leadingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
    v57[4] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "trailingAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoStackView trailingAnchor](v4, "trailingAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
    v57[5] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "bottomAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsBoardingInfoStackView bottomAnchor](v4, "bottomAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v25));
    v57[6] = v26;
    v27 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v57, 7));
    verticalLayoutConstraints = v4->_verticalLayoutConstraints;
    v4->_verticalLayoutConstraints = (NSArray *)v27;

    -[TransitDirectionsBoardingInfoStackView _axisDidChange](v4, "_axisDidChange");
  }
  return v4;
}

- (void)setAxis:(int64_t)a3
{
  if (self->_axis != a3)
  {
    self->_axis = a3;
    -[TransitDirectionsBoardingInfoStackView _axisDidChange](self, "_axisDidChange");
  }
}

- (void)_axisDidChange
{
  int64_t v3;
  _BOOL4 v4;

  v3 = -[TransitDirectionsBoardingInfoStackView axis](self, "axis");
  v4 = v3 != 0;
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", *(Class *)((char *)&self->super.super.super.isa+ OBJC_IVAR___TransitDirectionsBoardingInfoStackView__horizontalLayoutConstraints[v3 == 0]));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", *(Class *)((char *)&self->super.super.super.isa+ OBJC_IVAR___TransitDirectionsBoardingInfoStackView__horizontalLayoutConstraints[v4]));
}

- (id)topView
{
  -[TransitDirectionsBoardingInfoStackView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)bottomView
{
  -[TransitDirectionsBoardingInfoStackView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (int64_t)axis
{
  return self->_axis;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_verticalLayoutConstraints, 0);
}

@end
