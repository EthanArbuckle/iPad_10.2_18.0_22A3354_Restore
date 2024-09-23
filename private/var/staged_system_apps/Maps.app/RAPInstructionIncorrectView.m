@implementation RAPInstructionIncorrectView

- (RAPInstructionIncorrectView)initWithFrame:(CGRect)a3
{
  RAPInstructionIncorrectView *v3;
  id v4;
  void *v5;
  UIImageView *v6;
  UIImageView *flagView;
  void *v8;
  UIImageView *v9;
  UIImageView *chevronView;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSDictionary *v15;
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
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)RAPInstructionIncorrectView;
  v3 = -[RAPInstructionIncorrectView initWithFrame:](&v31, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc((Class)UIImageView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("flag.fill")));
    v6 = (UIImageView *)objc_msgSend(v4, "initWithImage:", v5);
    flagView = v3->_flagView;
    v3->_flagView = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    -[UIImageView setTintColor:](v3->_flagView, "setTintColor:", v8);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_flagView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[RAPInstructionIncorrectView addSubview:](v3, "addSubview:", v3->_flagView);
    v9 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    chevronView = v3->_chevronView;
    v3->_chevronView = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("chevron.forward")));
    -[UIImageView setImage:](v3->_chevronView, "setImage:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
    -[UIImageView setTintColor:](v3->_chevronView, "setTintColor:", v12);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_chevronView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[RAPInstructionIncorrectView addSubview:](v3, "addSubview:", v3->_chevronView);
    v13 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", v3, "viewTapped");
    -[RAPInstructionIncorrectView addGestureRecognizer:](v3, "addGestureRecognizer:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v15 = _NSDictionaryOfVariableBindings(CFSTR("_flagView, _chevronView"), v3->_flagView, v3->_chevronView, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v3->_flagView, "centerYAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v3->_chevronView, "centerYAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
    objc_msgSend(v14, "addObject:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v3->_chevronView, "centerYAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RAPInstructionIncorrectView centerYAnchor](v3, "centerYAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));
    objc_msgSend(v14, "addObject:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RAPInstructionIncorrectView widthAnchor](v3, "widthAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToConstant:", 44.0));
    objc_msgSend(v14, "addObject:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[RAPInstructionIncorrectView heightAnchor](v3, "heightAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToConstant:", 44.0));
    objc_msgSend(v14, "addObject:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|->=0-[_flagView]-4-[_chevronView]-0-|"), 0, 0, v16));
    objc_msgSend(v14, "addObjectsFromArray:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|->=0-[_flagView]->=0-|"), 0, 0, v16));
    objc_msgSend(v14, "addObjectsFromArray:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|->=0-[_chevronView]->=0-|"), 0, 0, v16));
    objc_msgSend(v14, "addObjectsFromArray:", v29);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v14);
  }
  return v3;
}

- (void)viewTapped
{
  uint64_t v3;
  uint64_t v4;

  if (self->_tapblock)
  {
    if (self->_displayMode == 1)
      v3 = 10107;
    else
      v3 = 10106;
    if (self->_displayMode == 1)
      v4 = 2;
    else
      v4 = 1;
    -[RAPInstructionIncorrectView setDisplayMode:](self, "setDisplayMode:", v4);
    +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", v3, 1101, 0);
    (*((void (**)(void))self->_tapblock + 2))();
  }
}

- (void)showFlag:(BOOL)a3
{
  -[UIImageView setHidden:](self->_flagView, "setHidden:", !a3);
}

- (void)setDisplayMode:(int)a3
{
  void *v4;
  UIImageView *chevronView;
  CGAffineTransform *v6;
  void *v7;
  void *v8;
  CGAffineTransform v9;
  CGAffineTransform v10;
  CGAffineTransform v11;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;

  if (self->_displayMode != a3)
  {
    self->_displayMode = a3;
    switch(a3)
    {
      case 0:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("chevron.forward")));
        -[UIImageView setImage:](self->_chevronView, "setImage:", v4);

        -[RAPInstructionIncorrectView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
        -[UIImageView setAccessibilityIdentifier:](self->_chevronView, "setAccessibilityIdentifier:", 0);
        CGAffineTransformMakeRotation(&v14, 0.0);
        chevronView = self->_chevronView;
        v13 = v14;
        v6 = &v13;
        goto LABEL_6;
      case 1:
        -[RAPInstructionIncorrectView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
        -[UIImageView setAccessibilityIdentifier:](self->_chevronView, "setAccessibilityIdentifier:", CFSTR("Expand instructions"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("chevron.forward.2")));
        -[UIImageView setImage:](self->_chevronView, "setImage:", v7);

        CGAffineTransformMakeRotation(&v12, 0.0);
        chevronView = self->_chevronView;
        v11 = v12;
        v6 = &v11;
        goto LABEL_6;
      case 2:
        -[RAPInstructionIncorrectView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1);
        -[UIImageView setAccessibilityIdentifier:](self->_chevronView, "setAccessibilityIdentifier:", CFSTR("Collapse instructions"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("chevron.forward.2")));
        -[UIImageView setImage:](self->_chevronView, "setImage:", v8);

        CGAffineTransformMakeRotation(&v10, 1.57079633);
        chevronView = self->_chevronView;
        v9 = v10;
        v6 = &v9;
LABEL_6:
        -[UIImageView setTransform:](chevronView, "setTransform:", v6, *(_OWORD *)&v9.a, *(_OWORD *)&v9.c, *(_OWORD *)&v9.tx);
        break;
      case 3:
        -[UIImageView setHidden:](self->_chevronView, "setHidden:", 1);
        -[RAPInstructionIncorrectView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
        break;
      default:
        return;
    }
  }
}

- (int)displayMode
{
  return self->_displayMode;
}

- (id)tapblock
{
  return self->_tapblock;
}

- (void)setTapblock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIImageView)flagView
{
  return self->_flagView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flagView, 0);
  objc_storeStrong(&self->_tapblock, 0);
  objc_storeStrong((id *)&self->_chevronView, 0);
}

@end
