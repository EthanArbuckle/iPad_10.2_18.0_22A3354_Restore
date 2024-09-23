@implementation MapsRadioButton

+ (id)buttonWithGroupIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  objc_msgSend(v5, "setGroupIdentifier:", v4);

  return v5;
}

- (MapsRadioButton)initWithFrame:(CGRect)a3
{
  MapsRadioButton *v3;
  uint64_t v4;
  UIButton *button;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  void *v19;

  v18.receiver = self;
  v18.super_class = (Class)MapsRadioButton;
  v3 = -[MapsRadioButton initWithFrame:](&v18, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    button = v3->_button;
    v3->_button = (UIButton *)v4;

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("RadioButton-Unselected")));
    -[UIButton setImage:forState:](v3->_button, "setImage:forState:", v6, 0);
    -[MapsRadioButton sizingLength](v3, "sizingLength");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("smallcircle.fill.circle.fill"), v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageWithRenderingMode:", 2));

    -[UIButton setImage:forState:](v3->_button, "setImage:forState:", v9, 4);
    -[UIButton addTarget:action:forControlEvents:](v3->_button, "addTarget:action:forControlEvents:", v3, "_buttonTapped:", 64);
    -[MapsRadioButton addSubview:](v3, "addSubview:", v3->_button);
    LODWORD(v10) = 1148846080;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton _maps_constraintsEqualToEdgesOfView:priority:](v3->_button, "_maps_constraintsEqualToEdgesOfView:priority:", v3, v10));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allConstraints"));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadioButton heightAnchor](v3, "heightAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadioButton widthAnchor](v3, "widthAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
    v19 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

  }
  return v3;
}

- (void)setControlSize:(int)a3
{
  if (self->_controlSize != a3)
  {
    self->_controlSize = a3;
    -[MapsRadioButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  MapsRadioButton *v9;

  v3 = a3;
  if (-[UIButton isSelected](self->_button, "isSelected") != a3)
  {
    -[UIButton setSelected:](self->_button, "setSelected:", v3);
    if (v3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRadioButton groupIdentifier](self, "groupIdentifier"));
      v8 = CFSTR("button");
      v9 = self;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
      objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("MapsRadioButtonDidChangeNotification"), v6, v7);

    }
  }
}

- (BOOL)isSelected
{
  return -[UIButton isSelected](self->_button, "isSelected");
}

- (void)setGroupIdentifier:(id)a3
{
  id v4;
  NSObject *groupIdentifier;
  id v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  unint64_t v13;

  v4 = a3;
  groupIdentifier = self->_groupIdentifier;
  v13 = (unint64_t)v4;
  v6 = groupIdentifier;
  v7 = (void *)v13;
  if (v13 | (unint64_t)v6)
  {
    v8 = objc_msgSend((id)v13, "isEqual:", v6);

    v7 = (void *)v13;
    if ((v8 & 1) == 0)
    {
      if (self->_groupIdentifier)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v9, "removeObserver:name:object:", self, CFSTR("MapsRadioButtonDidChangeNotification"), self->_groupIdentifier);

      }
      v10 = objc_msgSend((id)v13, "copyWithZone:", 0);
      v11 = self->_groupIdentifier;
      self->_groupIdentifier = v10;

      v7 = (void *)v13;
      if (self->_groupIdentifier)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        objc_msgSend(v12, "addObserver:selector:name:object:", self, "_otherButtonDidChange:", CFSTR("MapsRadioButtonDidChangeNotification"), self->_groupIdentifier);

        v7 = (void *)v13;
      }
    }
  }

}

- (void)_otherButtonDidChange:(id)a3
{
  MapsRadioButton *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (MapsRadioButton *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "object"));
  if (!v4 || !-[MapsRadioButton isSelected](self, "isSelected"))
    goto LABEL_7;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "object"));
  v6 = objc_msgSend(v5, "isEqual:", self->_groupIdentifier);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
    v4 = (MapsRadioButton *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("button")));

    if (v4 == self)
      v4 = self;
    else
      -[MapsRadioButton setSelected:](self, "setSelected:", 0);
LABEL_7:

  }
}

- (void)_buttonTapped:(id)a3
{
  -[MapsRadioButton _fireAction](self, "_fireAction", a3);
}

- (void)_fireAction
{
  -[MapsRadioButton setSelected:](self, "setSelected:", 1);
  -[MapsRadioButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (void)setAssociatedLabel:(id)a3
{
  id WeakRetained;
  id v5;
  id v6;
  id v7;
  UITapGestureRecognizer *v8;
  UITapGestureRecognizer *labelTapGesture;
  id v10;
  id v11;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_associatedLabel);

  if (WeakRetained != obj)
  {
    if (self->_labelTapGesture)
    {
      v5 = objc_loadWeakRetained((id *)&self->_associatedLabel);

      if (v5)
      {
        v6 = objc_loadWeakRetained((id *)&self->_associatedLabel);
        objc_msgSend(v6, "removeGestureRecognizer:", self->_labelTapGesture);

      }
    }
    v7 = objc_storeWeak((id *)&self->_associatedLabel, obj);

    if (obj)
    {
      if (!self->_labelTapGesture)
      {
        v8 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "_labelTapped");
        labelTapGesture = self->_labelTapGesture;
        self->_labelTapGesture = v8;

      }
      v10 = objc_loadWeakRetained((id *)&self->_associatedLabel);
      objc_msgSend(v10, "setUserInteractionEnabled:", 1);

      v11 = objc_loadWeakRetained((id *)&self->_associatedLabel);
      objc_msgSend(v11, "addGestureRecognizer:", self->_labelTapGesture);

    }
  }

}

- (void)_labelTapped
{
  -[MapsRadioButton _fireAction](self, "_fireAction");
}

- (double)sizingLength
{
  if (-[MapsRadioButton controlSize](self, "controlSize"))
    return (double)14;
  else
    return (double)16;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[MapsRadioButton sizingLength](self, "sizingLength");
  v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSObject)groupIdentifier
{
  return self->_groupIdentifier;
}

- (int)controlSize
{
  return self->_controlSize;
}

- (UILabel)associatedLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_associatedLabel);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_associatedLabel);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_labelTapGesture, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
