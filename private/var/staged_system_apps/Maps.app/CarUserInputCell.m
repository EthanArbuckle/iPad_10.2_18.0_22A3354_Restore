@implementation CarUserInputCell

- (CarUserInputCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CarUserInputCell *v4;
  CarUserInputCell *v5;
  void *v6;
  void *v7;
  void *v8;
  CarDictationButton *v9;
  CarDictationButton *dictationButton;
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
  uint64_t v23;
  CarFocusableButton *keyboardButton;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  CarFocusableButton *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSArray *keyboardDisabledConstraints;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  NSArray *keyboardEnabledConstraints;
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
  objc_super v77;
  _QWORD v78[7];
  _QWORD v79[2];
  void *v80;
  void *v81;
  _QWORD v82[2];

  v77.receiver = self;
  v77.super_class = (Class)CarUserInputCell;
  v4 = -[CarUserInputCell initWithStyle:reuseIdentifier:](&v77, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CarUserInputCell setFocusStyle:](v4, "setFocusStyle:", 1);
    -[CarUserInputCell setSelectionStyle:](v5, "setSelectionStyle:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[CarUserInputCell setBackgroundColor:](v5, "setBackgroundColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarUserInputCell contentView](v5, "contentView"));
    objc_msgSend(v8, "setBackgroundColor:", v7);

    v9 = -[CarDictationButton initWithFrame:]([CarDictationButton alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    dictationButton = v5->_dictationButton;
    v5->_dictationButton = v9;

    -[CarDictationButton setAccessibilityIdentifier:](v5->_dictationButton, "setAccessibilityIdentifier:", CFSTR("DictationButton"));
    -[CarDictationButton setTranslatesAutoresizingMaskIntoConstraints:](v5->_dictationButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarDictationButton layer](v5->_dictationButton, "layer"));
    objc_msgSend(v11, "setCornerCurve:", kCACornerCurveContinuous);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarDictationButton layer](v5->_dictationButton, "layer"));
    objc_msgSend(v12, "setCornerRadius:", 4.0);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusLabelColor](UIColor, "_carSystemFocusLabelColor"));
    -[CarFocusableControl setFocusedTintColor:](v5->_dictationButton, "setFocusedTintColor:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
    -[CarFocusableControl setUnfocusedTintColor:](v5->_dictationButton, "setUnfocusedTintColor:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemFocusColor](UIColor, "_carSystemFocusColor"));
    -[CarFocusableControl setFocusedBackgroundColor:](v5->_dictationButton, "setFocusedBackgroundColor:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemQuaternaryColor](UIColor, "_carSystemQuaternaryColor"));
    -[CarFocusableControl setUnfocusedBackgroundColor:](v5->_dictationButton, "setUnfocusedBackgroundColor:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("CarPlay_Dictation"), CFSTR("localized string not found"), 0));
    v82[0] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CarPlay_Siri"), CFSTR("localized string not found"), 0));
    v82[1] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v82, 2));
    -[CarDictationButton setAccessibilityUserInputLabels:](v5->_dictationButton, "setAccessibilityUserInputLabels:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarUserInputCell contentView](v5, "contentView"));
    objc_msgSend(v22, "addSubview:", v5->_dictationButton);

    v23 = objc_claimAutoreleasedReturnValue(+[CarFocusableButton button](CarFocusableButton, "button"));
    keyboardButton = v5->_keyboardButton;
    v5->_keyboardButton = (CarFocusableButton *)v23;

    -[CarFocusableButton setAccessibilityIdentifier:](v5->_keyboardButton, "setAccessibilityIdentifier:", CFSTR("KeyboardButton"));
    -[CarFocusableButton setTranslatesAutoresizingMaskIntoConstraints:](v5->_keyboardButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor _carSystemQuaternaryColor](UIColor, "_carSystemQuaternaryColor"));
    -[CarFocusableButton setNonFocusedBackgroundColor:](v5->_keyboardButton, "setNonFocusedBackgroundColor:", v25);

    -[CarFocusableButton setModifiesBackgroundColor:](v5->_keyboardButton, "setModifiesBackgroundColor:", 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton layer](v5->_keyboardButton, "layer"));
    objc_msgSend(v26, "setCornerCurve:", kCACornerCurveContinuous);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton layer](v5->_keyboardButton, "layer"));
    objc_msgSend(v27, "setCornerRadius:", 4.0);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton imageView](v5->_keyboardButton, "imageView"));
    objc_msgSend(v28, "setContentMode:", 1);

    v29 = v5->_keyboardButton;
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:textStyle:](UIImage, "_mapsCar_systemImageNamed:textStyle:", CFSTR("keyboard"), UIFontTextStyleTitle3));
    -[CarFocusableButton setImage:forState:](v29, "setImage:forState:", v30, 0);

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("CarPlay_Keyboard"), CFSTR("localized string not found"), 0));
    v81 = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v81, 1));
    -[CarFocusableButton setAccessibilityUserInputLabels:](v5->_keyboardButton, "setAccessibilityUserInputLabels:", v33);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[CarUserInputCell contentView](v5, "contentView"));
    objc_msgSend(v34, "addSubview:", v5->_keyboardButton);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[CarUserInputCell contentView](v5, "contentView"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "trailingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CarDictationButton trailingAnchor](v5->_dictationButton, "trailingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v37));
    v80 = v38;
    v39 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v80, 1));
    keyboardDisabledConstraints = v5->_keyboardDisabledConstraints;
    v5->_keyboardDisabledConstraints = (NSArray *)v39;

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton leadingAnchor](v5->_keyboardButton, "leadingAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[CarDictationButton trailingAnchor](v5->_dictationButton, "trailingAnchor"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:constant:", v42, 2.0));
    v79[0] = v43;
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[CarDictationButton widthAnchor](v5->_dictationButton, "widthAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton widthAnchor](v5->_keyboardButton, "widthAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v45));
    v79[1] = v46;
    v47 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v79, 2));
    keyboardEnabledConstraints = v5->_keyboardEnabledConstraints;
    v5->_keyboardEnabledConstraints = (NSArray *)v47;

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v5->_keyboardEnabledConstraints);
    v75 = (void *)objc_claimAutoreleasedReturnValue(-[CarDictationButton leadingAnchor](v5->_dictationButton, "leadingAnchor"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[CarUserInputCell contentView](v5, "contentView"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "leadingAnchor"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "constraintEqualToAnchor:", v74));
    v78[0] = v73;
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[CarUserInputCell contentView](v5, "contentView"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "trailingAnchor"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton trailingAnchor](v5->_keyboardButton, "trailingAnchor"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "constraintEqualToAnchor:", v70));
    v78[1] = v69;
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[CarDictationButton topAnchor](v5->_dictationButton, "topAnchor"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[CarUserInputCell contentView](v5, "contentView"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "topAnchor"));
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:", v66));
    v78[2] = v65;
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton topAnchor](v5->_keyboardButton, "topAnchor"));
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[CarDictationButton topAnchor](v5->_dictationButton, "topAnchor"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:", v63));
    v78[3] = v62;
    v61 = (void *)objc_claimAutoreleasedReturnValue(-[CarUserInputCell contentView](v5, "contentView"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "bottomAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[CarDictationButton bottomAnchor](v5->_dictationButton, "bottomAnchor"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v49, 1.0));
    v78[4] = v50;
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[CarDictationButton heightAnchor](v5->_dictationButton, "heightAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[CarFocusableButton heightAnchor](v5->_keyboardButton, "heightAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v52));
    v78[5] = v53;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[CarDictationButton heightAnchor](v5->_dictationButton, "heightAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToConstant:", 36.0));
    v78[6] = v55;
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v78, 7));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v56);

    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v57, "addObserver:selector:name:object:", v5, "_externalDeviceChanged:", CFSTR("MapsExternalDeviceUpdated"), 0);

    v58 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
    -[CarUserInputCell setKeyboardDisabled:](v5, "setKeyboardDisabled:", objc_msgSend(v58, "disableSoftwareKeyboard"));

    -[CarUserInputCell _installGestureRecognizers](v5, "_installGestureRecognizers");
  }
  return v5;
}

- (BOOL)_siriButtonShouldBeExpanded
{
  return self->_keyboardDisabled;
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CarUserInputCell;
  -[CarUserInputCell didMoveToWindow](&v3, "didMoveToWindow");
  -[CarUserInputCell _installGestureRecognizers](self, "_installGestureRecognizers");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarUserInputCell;
  -[CarUserInputCell traitCollectionDidChange:](&v4, "traitCollectionDidChange:", a3);
  -[CarUserInputCell _installGestureRecognizers](self, "_installGestureRecognizers");
}

- (void)_installGestureRecognizers
{
  id v3;
  id v4;
  id v5;
  id v6;

  -[CarFocusableButton removeAllGestureRecognizers](self->_keyboardButton, "removeAllGestureRecognizers");
  -[CarDictationButton removeAllGestureRecognizers](self->_dictationButton, "removeAllGestureRecognizers");
  v3 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_handleKeyboardSelectPressGesture:");
  objc_msgSend(v3, "setAllowedPressTypes:", &off_101272FA8);
  -[CarFocusableButton addGestureRecognizer:](self->_keyboardButton, "addGestureRecognizer:", v3);
  v4 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_handleKeyboardTouchGesture:");
  objc_msgSend(v4, "setAllowedTouchTypes:", &off_101272FC0);
  -[CarFocusableButton addGestureRecognizer:](self->_keyboardButton, "addGestureRecognizer:", v4);
  v6 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_handleDictationSelectPressGesture:");

  objc_msgSend(v6, "setAllowedPressTypes:", &off_101272FD8);
  -[CarDictationButton addGestureRecognizer:](self->_dictationButton, "addGestureRecognizer:", v6);
  v5 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_handleDictationTouchGesture:");

  objc_msgSend(v5, "setAllowedTouchTypes:", &off_101272FF0);
  -[CarDictationButton addGestureRecognizer:](self->_dictationButton, "addGestureRecognizer:", v5);

}

- (void)_externalDeviceChanged:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance", a3));
  -[CarUserInputCell setKeyboardDisabled:animated:](self, "setKeyboardDisabled:animated:", objc_msgSend(v4, "disableSoftwareKeyboard"), 1);

}

- (void)setKeyboardDisabled:(BOOL)a3
{
  -[CarUserInputCell setKeyboardDisabled:animated:](self, "setKeyboardDisabled:animated:", a3, 0);
}

- (void)setKeyboardDisabled:(BOOL)a3 animated:(BOOL)a4
{
  _QWORD v4[5];

  if (self->_keyboardDisabled != a3)
  {
    self->_keyboardDisabled = a3;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100245B70;
    v4[3] = &unk_1011AC860;
    v4[4] = self;
    -[CarUserInputCell _updateConstraintsAnimated:alongWithAnimation:completion:](self, "_updateConstraintsAnimated:alongWithAnimation:completion:", a4, v4, 0);
  }
}

- (void)_updateConstraintsAnimated:(BOOL)a3 alongWithAnimation:(id)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, uint64_t);
  unsigned int v10;
  NSArray *currentKeyboardConstraints;
  _QWORD *v12;
  _QWORD *v13;
  void *v14;
  id v15;
  _QWORD *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  char v25;
  _QWORD v26[5];
  char v27;

  v6 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  v10 = -[CarUserInputCell _siriButtonShouldBeExpanded](self, "_siriButtonShouldBeExpanded");
  currentKeyboardConstraints = self->_currentKeyboardConstraints;
  if (currentKeyboardConstraints
    && v10 == -[NSArray isEqualToArray:](currentKeyboardConstraints, "isEqualToArray:", self->_keyboardDisabledConstraints))
  {
    v12 = 0;
  }
  else
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100245D90;
    v26[3] = &unk_1011ACE58;
    v27 = v10;
    v12 = v26;
    v26[4] = self;
  }
  v13 = objc_retainBlock(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarUserInputCell contentView](self, "contentView"));
  objc_msgSend(v14, "bringSubviewToFront:", self->_dictationButton);

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100245E30;
  v22[3] = &unk_1011AD838;
  v15 = v8;
  v22[4] = self;
  v23 = v15;
  v25 = v10;
  v16 = v13;
  v24 = v16;
  v17 = objc_retainBlock(v22);
  v18 = v17;
  if (v6)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100245E9C;
    v20[3] = &unk_1011ACAD0;
    v20[4] = self;
    v21 = v17;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v20, v9, 0.2);

  }
  else
  {
    ((void (*)(_QWORD *))v17[2])(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarUserInputCell contentView](self, "contentView"));
    objc_msgSend(v19, "setNeedsLayout");

    if (v9)
      v9[2](v9, 1);
  }

}

- (void)_handleDictationSelectPressGesture:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarUserInputCell delegate](self, "delegate", a3));
  objc_msgSend(v4, "userInputCell:didSelectAction:usingInteractionModel:", self, 0, 2);

}

- (void)_handleDictationTouchGesture:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarUserInputCell delegate](self, "delegate", a3));
  objc_msgSend(v4, "userInputCell:didSelectAction:usingInteractionModel:", self, 0, 1);

}

- (void)_handleKeyboardSelectPressGesture:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarUserInputCell delegate](self, "delegate", a3));
  objc_msgSend(v4, "userInputCell:didSelectAction:usingInteractionModel:", self, 1, 2);

}

- (void)_handleKeyboardTouchGesture:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CarUserInputCell delegate](self, "delegate", a3));
  objc_msgSend(v4, "userInputCell:didSelectAction:usingInteractionModel:", self, 1, 1);

}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (NSArray)preferredFocusEnvironments
{
  CarDictationButton *dictationButton;

  dictationButton = self->_dictationButton;
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &dictationButton, 1));
}

- (NSArray)focusOrderSubItems
{
  CarDictationButton **p_dictationButton;
  uint64_t v4;
  CarFocusableButton *keyboardButton;
  CarDictationButton *v7;
  CarFocusableButton *v8;
  CarDictationButton *dictationButton;

  if (-[CarUserInputCell _siriButtonShouldBeExpanded](self, "_siriButtonShouldBeExpanded"))
  {
    dictationButton = self->_dictationButton;
    p_dictationButton = &dictationButton;
    v4 = 1;
  }
  else
  {
    keyboardButton = self->_keyboardButton;
    v7 = self->_dictationButton;
    v8 = keyboardButton;
    p_dictationButton = &v7;
    v4 = 2;
  }
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", p_dictationButton, v4, v7, v8, dictationButton));
}

- (CarUserInputCellDelegate)delegate
{
  return (CarUserInputCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isKeyboardDisabled
{
  return self->_keyboardDisabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentKeyboardConstraints, 0);
  objc_storeStrong((id *)&self->_keyboardEnabledConstraints, 0);
  objc_storeStrong((id *)&self->_keyboardDisabledConstraints, 0);
  objc_storeStrong((id *)&self->_keyboardButton, 0);
  objc_storeStrong((id *)&self->_dictationButton, 0);
}

@end
