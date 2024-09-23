@implementation FlyoverStatusToastView

- (FlyoverStatusToastView)initWithTrackingStateReason:(unint64_t)a3
{
  FlyoverStatusToastView *v4;
  FlyoverStatusToastView *v5;
  void *v6;
  id v7;
  void *v8;
  UIVisualEffectView *v9;
  UIVisualEffectView *backgroundView;
  void *v11;
  void *v12;
  uint64_t v13;
  NSLayoutConstraint *backgroundTopConstraint;
  void *v15;
  void *v16;
  uint64_t v17;
  NSLayoutConstraint *backgroundLeftConstraint;
  void *v19;
  void *v20;
  uint64_t v21;
  NSLayoutConstraint *backgroundBottomConstraint;
  void *v23;
  void *v24;
  uint64_t v25;
  NSLayoutConstraint *backgroundRightConstraint;
  FlyoverGlyphView *v27;
  double y;
  double width;
  double height;
  FlyoverGlyphView *v31;
  FlyoverGlyphView *glyphView;
  UILabel *v33;
  UILabel *label;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  const __CFString *v41;
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
  FlyoverStatusToastView *v52;
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
  objc_super v68;
  _QWORD v69[12];

  v68.receiver = self;
  v68.super_class = (Class)FlyoverStatusToastView;
  v4 = -[FlyoverStatusToastView initWithFrame:](&v68, "initWithFrame:", 0.0, 0.0, 235.0, 60.0);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverStatusToastView layer](v4, "layer"));
    objc_msgSend(v6, "setAllowsGroupBlending:", 0);

    -[FlyoverStatusToastView setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", CFSTR("FlyoverStatusToastView"));
    v7 = objc_alloc((Class)UIVisualEffectView);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 1));
    v9 = (UIVisualEffectView *)objc_msgSend(v7, "initWithEffect:", v8);
    backgroundView = v5->_backgroundView;
    v5->_backgroundView = v9;

    -[UIVisualEffectView setAlpha:](v5->_backgroundView, "setAlpha:", 0.0);
    -[UIVisualEffectView _setContinuousCornerRadius:](v5->_backgroundView, "_setContinuousCornerRadius:", 7.5);
    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](v5->_backgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView topAnchor](v5->_backgroundView, "topAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverStatusToastView topAnchor](v5, "topAnchor"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 5.0));
    backgroundTopConstraint = v5->_backgroundTopConstraint;
    v5->_backgroundTopConstraint = (NSLayoutConstraint *)v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView leftAnchor](v5->_backgroundView, "leftAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverStatusToastView leftAnchor](v5, "leftAnchor"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:constant:", v16, 5.0));
    backgroundLeftConstraint = v5->_backgroundLeftConstraint;
    v5->_backgroundLeftConstraint = (NSLayoutConstraint *)v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView bottomAnchor](v5->_backgroundView, "bottomAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverStatusToastView bottomAnchor](v5, "bottomAnchor"));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v20, -5.0));
    backgroundBottomConstraint = v5->_backgroundBottomConstraint;
    v5->_backgroundBottomConstraint = (NSLayoutConstraint *)v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView rightAnchor](v5->_backgroundView, "rightAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverStatusToastView rightAnchor](v5, "rightAnchor"));
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, -5.0));
    backgroundRightConstraint = v5->_backgroundRightConstraint;
    v5->_backgroundRightConstraint = (NSLayoutConstraint *)v25;

    -[UIVisualEffectView setAccessibilityIdentifier:](v5->_backgroundView, "setAccessibilityIdentifier:", CFSTR("FlyoverStatusToastBackground"));
    -[FlyoverStatusToastView addSubview:](v5, "addSubview:", v5->_backgroundView);
    v27 = [FlyoverGlyphView alloc];
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v31 = -[FlyoverGlyphView initWithFrame:](v27, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    glyphView = v5->_glyphView;
    v5->_glyphView = v31;

    -[FlyoverGlyphView setTranslatesAutoresizingMaskIntoConstraints:](v5->_glyphView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[FlyoverStatusToastView addSubview:](v5, "addSubview:", v5->_glyphView);
    v33 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    label = v5->_label;
    v5->_label = v33;

    -[UILabel setAlpha:](v5->_label, "setAlpha:", 0.0);
    -[UILabel setTextAlignment:](v5->_label, "setTextAlignment:", 1);
    -[UILabel setNumberOfLines:](v5->_label, "setNumberOfLines:", 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.5));
    -[UILabel setTextColor:](v5->_label, "setTextColor:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 13.0, UIFontWeightMedium));
    -[UILabel setFont:](v5->_label, "setFont:", v36);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v37 = kCAFilterPlusD;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel layer](v5->_label, "layer"));
    objc_msgSend(v38, "setCompositingFilter:", v37);

    -[UILabel setAccessibilityIdentifier:](v5->_label, "setAccessibilityIdentifier:", CFSTR("FlyoverStatusToastLabel"));
    -[FlyoverStatusToastView addSubview:](v5, "addSubview:", v5->_label);
    switch(a3)
    {
      case 4uLL:
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v40 = v39;
        v41 = CFSTR("FULL SCREEN REQUIRED [Flyover]");
        break;
      case 3uLL:
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v40 = v39;
        v41 = CFSTR("LOW DETAIL [Flyover]");
        break;
      case 2uLL:
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v40 = v39;
        v41 = CFSTR("EXCESSIVE MOTION [Flyover]");
        break;
      default:
LABEL_9:
        v69[0] = v5->_backgroundTopConstraint;
        v69[1] = v5->_backgroundLeftConstraint;
        v69[2] = v5->_backgroundBottomConstraint;
        v69[3] = v5->_backgroundRightConstraint;
        v67 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverGlyphView widthAnchor](v5->_glyphView, "widthAnchor"));
        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToConstant:", 50.0));
        v69[4] = v66;
        v65 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverGlyphView heightAnchor](v5->_glyphView, "heightAnchor"));
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToConstant:", 50.0));
        v69[5] = v64;
        v63 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverGlyphView leadingAnchor](v5->_glyphView, "leadingAnchor"));
        v62 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverStatusToastView leadingAnchor](v5, "leadingAnchor"));
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:constant:", v62, 6.0));
        v69[6] = v61;
        v60 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverGlyphView centerYAnchor](v5->_glyphView, "centerYAnchor"));
        v59 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverStatusToastView centerYAnchor](v5, "centerYAnchor"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v59));
        v69[7] = v58;
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v5->_label, "topAnchor"));
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverStatusToastView topAnchor](v5, "topAnchor"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:constant:", v56, 5.0));
        v69[8] = v55;
        v54 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leftAnchor](v5->_label, "leftAnchor"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverStatusToastView leftAnchor](v5, "leftAnchor"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:constant:", v43, 55.0));
        v69[9] = v44;
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v5->_label, "bottomAnchor"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverStatusToastView bottomAnchor](v5, "bottomAnchor"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:constant:", v46, -5.0));
        v69[10] = v47;
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel rightAnchor](v5->_label, "rightAnchor"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverStatusToastView rightAnchor](v5, "rightAnchor"));
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:constant:", v49, -15.0));
        v69[11] = v50;
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v69, 12));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v51);

        -[FlyoverStatusToastView layoutIfNeeded](v5, "layoutIfNeeded");
        v52 = v5;
        goto LABEL_10;
    }
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localizedStringForKey:value:table:", v41, CFSTR("localized string not found"), 0));
    -[UILabel setText:](v5->_label, "setText:", v42);

    goto LABEL_9;
  }
LABEL_10:

  return v5;
}

- (void)present
{
  _QWORD v3[5];

  self->_didPresent = 1;
  -[NSLayoutConstraint setConstant:](self->_backgroundTopConstraint, "setConstant:", 0.0);
  -[NSLayoutConstraint setConstant:](self->_backgroundLeftConstraint, "setConstant:", 0.0);
  -[NSLayoutConstraint setConstant:](self->_backgroundBottomConstraint, "setConstant:", 0.0);
  -[NSLayoutConstraint setConstant:](self->_backgroundRightConstraint, "setConstant:", 0.0);
  -[FlyoverGlyphView startAnimating](self->_glyphView, "startAnimating");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100983360;
  v3[3] = &unk_1011AC860;
  v3[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v3, 0, 0.23, 0.0);
}

- (void)dismissWithCompletionHandler:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];

  v4 = a3;
  self->_didDismiss = 1;
  -[NSLayoutConstraint setConstant:](self->_backgroundTopConstraint, "setConstant:", 5.0);
  -[NSLayoutConstraint setConstant:](self->_backgroundLeftConstraint, "setConstant:", 5.0);
  -[NSLayoutConstraint setConstant:](self->_backgroundBottomConstraint, "setConstant:", -5.0);
  -[NSLayoutConstraint setConstant:](self->_backgroundRightConstraint, "setConstant:", -5.0);
  v5 = CACurrentMediaTime();
  -[FlyoverGlyphView stopAnimating](self->_glyphView, "stopAnimating");
  v7 = v6 - v5 + -0.516666667 + 0.25;
  v10 = v4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1009834F4;
  v11[3] = &unk_1011AC860;
  v11[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100983544;
  v9[3] = &unk_1011B1B90;
  v8 = v4;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v11, v9, 0.23, v7);

}

+ (CGSize)preferredSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 235.0;
  v3 = 60.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)didPresent
{
  return self->_didPresent;
}

- (BOOL)didDismiss
{
  return self->_didDismiss;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundRightConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundBottomConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundLeftConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundTopConstraint, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_glyphView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
