@implementation UISwitch

- (void)setOn:(BOOL)a3 animated:(BOOL)a4 notifyingVisualElement:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;

  if (self->_on != a3)
  {
    v5 = a3;
    self->_on = a3;
    if (a5)
    {
      v6 = a4;
      -[UISwitch visualElement](self, "visualElement");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setOn:animated:", v5, v6);

    }
  }
}

- (void)setOnTintColor:(UIColor *)onTintColor
{
  UIColor *v5;
  id v6;

  objc_storeStrong((id *)&self->_onTintColor, onTintColor);
  v5 = onTintColor;
  -[UISwitch visualElement](self, "visualElement");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOnTintColor:", v5);

}

- (void)setTintColor:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_tintColor, a3);
  v5 = a3;
  -[UISwitch visualElement](self, "visualElement");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v5);

}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UISwitch;
  -[UIView tintColorDidChange](&v4, sel_tintColorDidChange);
  -[UISwitch visualElement](self, "visualElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tintColorDidChange");

}

- (UIEdgeInsets)alignmentRectInsets
{
  void *v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  UIEdgeInsets result;

  -[UISwitch visualElement](self, "visualElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v6 = (void *)objc_opt_class();
    if (-[UISwitch _isFixedSize](self, "_isFixedSize"))
      objc_msgSend(v6, "preferredAlignmentRectInsets");
    else
      objc_msgSend(v3, "alignmentRectInsets");
    v12 = v7;
    v13 = v8;
    v14 = v9;
    v11 = v10;
  }
  else
  {
    v11 = 2.0;
    v12 = 0.0;
    v13 = 0.0;
    v14 = 0.0;
  }

  v15 = v12;
  v16 = v13;
  v17 = v14;
  v18 = v11;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (UISwitch)initWithFrame:(CGRect)frame
{
  UISwitch *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UISwitch;
  v3 = -[UIControl initWithFrame:](&v5, sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
  _UISwitchCommonInit(v3);
  return v3;
}

- (UISwitchStyle)preferredStyle
{
  return self->_preferredStyle;
}

- (void)_refreshVisualElementForTraitCollection:(id)a3 populatingAPIProperties:(BOOL)a4
{
  _BOOL4 v4;
  UISwitch *v8;
  id v9;
  void *v10;
  UISwitchStyle v11;
  UISwitch *v12;
  void *v13;
  void *v14;
  void *v15;
  UISwitch *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UISwitch *v24;

  v4 = a4;
  v8 = (UISwitch *)__visualElementProvider;
  if (!__visualElementProvider)
    v8 = self;
  v24 = v8;
  v9 = a3;
  v10 = (void *)objc_opt_class();
  v11 = -[UISwitch style](self, "style");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "visualElementForTraitCollection:style:", v9, v11);
  else
    objc_msgSend(v10, "visualElementForTraitCollection:", v9);
  v12 = (UISwitch *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView description](v24, "description");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISwitch.m"), 254, CFSTR("Nil UISwitch visual element provided by %@"), v23);

  }
  -[UISwitch visualElement](self, "visualElement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeFromSuperview");

  -[UISwitch visualElement](self, "visualElement");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSwitchControl:", 0);

  -[UISwitch setVisualElement:](self, "setVisualElement:", 0);
  -[UISwitch setVisualElement:](self, "setVisualElement:", v12);
  -[UISwitch visualElement](self, "visualElement");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSwitchControl:", self);

  if (-[UISwitch _isFixedSize](self, "_isFixedSize"))
  {
    -[UIView frame](self, "frame");
    v16 = self;
  }
  else
  {
    -[UIView setAutoresizingMask:](v12, "setAutoresizingMask:", 18);
    -[UIView bounds](self, "bounds");
    v16 = v12;
  }
  -[UISwitch setFrame:](v16, "setFrame:");
  -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[UIView addSubview:](self, "addSubview:", v12);
  -[UISwitch setOn:animated:](v12, "setOn:animated:", -[UISwitch isOn](self, "isOn"), 0);
  -[UISwitch setShowsOnOffLabel:](v12, "setShowsOnOffLabel:", -[UISwitch _shouldShowOnOffLabels](self, "_shouldShowOnOffLabels"));
  -[UISwitch setEnabled:](v12, "setEnabled:", -[UIControl isEnabled](self, "isEnabled"));
  -[UISwitch setSemanticContentAttribute:](v12, "setSemanticContentAttribute:", -[UIView semanticContentAttribute](self, "semanticContentAttribute"));
  if (v4)
  {
    -[UISwitch onImage](self, "onImage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISwitch setOnImage:](v12, "setOnImage:", v17);

    -[UISwitch offImage](self, "offImage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISwitch setOffImage:](v12, "setOffImage:", v18);

    -[UISwitch tintColor](self, "tintColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISwitch setTintColor:](v12, "setTintColor:", v19);

    -[UISwitch onTintColor](self, "onTintColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISwitch setOnTintColor:](v12, "setOnTintColor:", v20);

    -[UISwitch thumbTintColor](self, "thumbTintColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISwitch setThumbTintColor:](v12, "setThumbTintColor:", v21);

  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[UISwitch _isFixedSize](self, "_isFixedSize"))
  {
    -[UISwitch sizeThatFits:](self, "sizeThatFits:", width, height);
    width = v8;
    height = v9;
  }
  v10.receiver = self;
  v10.super_class = (Class)UISwitch;
  -[UIView setFrame:](&v10, sel_setFrame_, x, y, width, height);
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UISwitch visualElement](self, "visualElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_class();
  if (-[UISwitch _isFixedSize](self, "_isFixedSize"))
    objc_msgSend(v7, "preferredContentSize");
  else
    objc_msgSend(v6, "_intrinsicSizeWithinSize:", width, height);
  v10 = v8;
  v11 = v9;

  v12 = v10;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (BOOL)_isFixedSize
{
  void *v2;
  void *v3;
  char isKindOfClass;
  char v5;

  -[UISwitch visualElement](self, "visualElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    v5 = objc_msgSend((id)objc_opt_class(), "isFixedSize");
  else
    v5 = 1;

  return v5;
}

- (UISwitchVisualElement)visualElement
{
  return self->_visualElement;
}

- (void)setVisualElement:(id)a3
{
  objc_storeStrong((id *)&self->_visualElement, a3);
}

- (UISwitchStyle)style
{
  return self->_style;
}

- (BOOL)isOn
{
  return self->_on;
}

- (BOOL)_shouldShowOnOffLabels
{
  return -[UISwitch _alwaysShowOnOffLabel](self, "_alwaysShowOnOffLabel")
      || _AXSIncreaseButtonLegibility() != 0;
}

- (BOOL)_alwaysShowOnOffLabel
{
  return self->_alwaysShowOnOffLabel;
}

+ (id)visualElementForTraitCollection:(id)a3
{
  uint64_t v5;
  id v6;
  __objc2_class *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  SEL v11;
  id v12;
  uint64_t v13;

  v5 = objc_msgSend(a3, "userInterfaceIdiom");
  v6 = 0;
  switch(v5)
  {
    case -1:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("UISwitch attempted to be initialized or updated with a trait collection containing UIUserInterfaceIdiomUnspecified.");
      v11 = a2;
      v12 = a1;
      v13 = 229;
      goto LABEL_5;
    case 0:
    case 1:
    case 5:
      v7 = UISwitchModernVisualElement;
      goto LABEL_7;
    case 2:
    case 8:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("UISwitch cannot be used on tvOS.");
      v11 = a2;
      v12 = a1;
      v13 = 226;
LABEL_5:
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v11, v12, CFSTR("UISwitch.m"), v13, v10);

      v6 = 0;
      return v6;
    case 3:
      v7 = UISwitchCarPlayVisualElement;
LABEL_7:
      v6 = objc_alloc_init(v7);
      break;
    default:
      return v6;
  }
  return v6;
}

- (void)setOn:(BOOL)on animated:(BOOL)animated
{
  -[UISwitch setOn:animated:notifyingVisualElement:](self, "setOn:animated:notifyingVisualElement:", on, animated, 1);
}

- (void)setOn:(BOOL)on
{
  -[UISwitch setOn:animated:](self, "setOn:animated:", on, 0);
}

- (UISwitch)init
{
  return -[UISwitch initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("UIAccessibilityOnOffSwitchLabelsDidChangeNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)UISwitch;
  -[UIView dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualElement, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_offImage, 0);
  objc_storeStrong((id *)&self->_onImage, 0);
  objc_storeStrong((id *)&self->_thumbTintColor, 0);
  objc_storeStrong((id *)&self->_onTintColor, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (BOOL)isAccessibilityElementByDefault
{
  return 1;
}

- (unint64_t)defaultAccessibilityTraits
{
  return 1;
}

- (BOOL)isElementAccessibilityExposedToInterfaceBuilder
{
  return 1;
}

- (UISwitch)initWithCoder:(NSCoder *)coder
{
  NSCoder *v4;
  UISwitch *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = coder;
  v12.receiver = self;
  v12.super_class = (Class)UISwitch;
  v5 = -[UIControl initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_preferredStyle = -[NSCoder decodeIntegerForKey:](v4, "decodeIntegerForKey:", CFSTR("UISwitchStyle"));
    _UISwitchCommonInit(v5);
    -[UISwitch setEnabled:](v5, "setEnabled:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UISwitchEnabled")));
    -[UISwitch setOn:](v5, "setOn:", -[NSCoder decodeBoolForKey:](v4, "decodeBoolForKey:", CFSTR("UISwitchOn")));
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UISwitchOnTintColor")))
    {
      -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UISwitchOnTintColor"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISwitch setOnTintColor:](v5, "setOnTintColor:", v6);

    }
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UISwitchTintColor")))
    {
      -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UISwitchTintColor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISwitch setTintColor:](v5, "setTintColor:", v7);

    }
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UISwitchThumbTintColor")))
    {
      -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UISwitchThumbTintColor"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISwitch setThumbTintColor:](v5, "setThumbTintColor:", v8);

    }
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UISwitchOnImage")))
    {
      -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UISwitchOnImage"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISwitch setOnImage:](v5, "setOnImage:", v9);

    }
    if (-[NSCoder containsValueForKey:](v4, "containsValueForKey:", CFSTR("UISwitchOffImage")))
    {
      -[NSCoder decodeObjectForKey:](v4, "decodeObjectForKey:", CFSTR("UISwitchOffImage"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISwitch setOffImage:](v5, "setOffImage:", v10);

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
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
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UISwitch;
  -[UIControl encodeWithCoder:](&v15, sel_encodeWithCoder_, v4);
  if (-[UIControl isEnabled](self, "isEnabled"))
    objc_msgSend(v4, "encodeBool:forKey:", -[UIControl isEnabled](self, "isEnabled"), CFSTR("UISwitchEnabled"));
  if (-[UISwitch isOn](self, "isOn"))
    objc_msgSend(v4, "encodeBool:forKey:", -[UISwitch isOn](self, "isOn"), CFSTR("UISwitchOn"));
  -[UISwitch onTintColor](self, "onTintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UISwitch onTintColor](self, "onTintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("UISwitchOnTintColor"));

  }
  -[UISwitch tintColor](self, "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[UISwitch tintColor](self, "tintColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("UISwitchTintColor"));

  }
  -[UISwitch thumbTintColor](self, "thumbTintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[UISwitch thumbTintColor](self, "thumbTintColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("UISwitchThumbTintColor"));

  }
  -[UISwitch onImage](self, "onImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[UISwitch onImage](self, "onImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("UISwitchOnImage"));

  }
  -[UISwitch offImage](self, "offImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[UISwitch offImage](self, "offImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("UISwitchOffImage"));

  }
  if (-[UISwitch preferredStyle](self, "preferredStyle"))
    objc_msgSend(v4, "encodeInteger:forKey:", self->_style, CFSTR("UISwitchStyle"));

}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UISwitch;
  v4 = a3;
  -[UIView _populateArchivedSubviews:](&v6, sel__populateArchivedSubviews_, v4);
  -[UISwitch visualElement](self, "visualElement", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v5);

}

+ (void)setVisualElementProvider:(id)a3
{
  objc_storeStrong((id *)&__visualElementProvider, a3);
}

- (void)_refreshVisualElement
{
  id v3;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UISwitch _refreshVisualElementForTraitCollection:populatingAPIProperties:](self, "_refreshVisualElementForTraitCollection:populatingAPIProperties:", v3, 1);

}

- (void)visualElement:(id)a3 transitionedToOn:(BOOL)a4
{
  -[UISwitch setOn:animated:notifyingVisualElement:](self, "setOn:animated:notifyingVisualElement:", a4, 0, 0);
  -[UIControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (void)visualElementHadTouchUpInside:(id)a3
{
  -[UIControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);
}

- (BOOL)pointMostlyInside:(CGPoint)a3
{
  return -[UIControl pointMostlyInside:withEvent:](self, "pointMostlyInside:withEvent:", 0, a3.x, a3.y);
}

- (void)_setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[UISwitch _refreshVisualElement](self, "_refreshVisualElement");
  }
}

- (void)_intrinsicContentSizeInvalidatedForChildView:(id)a3
{
  if (!-[UISwitch _isFixedSize](self, "_isFixedSize", a3))
    -[UIView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[UISwitch visualElement](self, "visualElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EDDF7040))
  {
    -[UISwitch visualElement](self, "visualElement");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) == 0)
    {
      v14 = 0;
      goto LABEL_7;
    }
    -[UISwitch visualElement](self, "visualElement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pointerInteraction:regionForRequest:defaultRegion:", v8, v9, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

LABEL_7:
  return v14;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[UISwitch visualElement](self, "visualElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EDDF7040))
  {
    -[UISwitch visualElement](self, "visualElement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0)
    {
      v11 = 0;
      goto LABEL_7;
    }
    -[UISwitch visualElement](self, "visualElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pointerInteraction:styleForRegion:", v6, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

LABEL_7:
  return v11;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  -[UISwitch visualElement](self, "visualElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "conformsToProtocol:", &unk_1EDDF7040))
    goto LABEL_4;
  -[UISwitch visualElement](self, "visualElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[UISwitch visualElement](self, "visualElement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pointerInteraction:willEnterRegion:animator:", v13, v8, v9);
LABEL_4:

  }
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  -[UISwitch visualElement](self, "visualElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "conformsToProtocol:", &unk_1EDDF7040))
    goto LABEL_4;
  -[UISwitch visualElement](self, "visualElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[UISwitch visualElement](self, "visualElement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pointerInteraction:willExitRegion:animator:", v13, v8, v9);
LABEL_4:

  }
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UISwitch;
  -[UIView setSemanticContentAttribute:](&v6, sel_setSemanticContentAttribute_);
  -[UISwitch visualElement](self, "visualElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSemanticContentAttribute:", a3);

}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UISwitch;
  -[UIControl setEnabled:](&v6, sel_setEnabled_);
  -[UISwitch visualElement](self, "visualElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", v3);

}

- (unint64_t)_controlEventsForActionTriggered
{
  return 4096;
}

- (void)setThumbTintColor:(UIColor *)thumbTintColor
{
  UIColor *v5;
  id v6;

  objc_storeStrong((id *)&self->_thumbTintColor, thumbTintColor);
  v5 = thumbTintColor;
  -[UISwitch visualElement](self, "visualElement");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setThumbTintColor:", v5);

}

- (void)setOffImage:(UIImage *)offImage
{
  UIImage *v5;
  id v6;

  objc_storeStrong((id *)&self->_offImage, offImage);
  v5 = offImage;
  -[UISwitch visualElement](self, "visualElement");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOffImage:", v5);

}

- (void)setOnImage:(UIImage *)onImage
{
  UIImage *v5;
  id v6;

  objc_storeStrong((id *)&self->_onImage, onImage);
  v5 = onImage;
  -[UISwitch visualElement](self, "visualElement");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setOnImage:", v5);

}

- (void)_setAlwaysShowsOnOffLabel:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[UISwitch visualElement](self, "visualElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShowsOnOffLabel:", v3);

  self->_alwaysShowOnOffLabel = v3;
}

- (void)_showingOnOffLabelChanged
{
  id v3;

  -[UISwitch visualElement](self, "visualElement");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowsOnOffLabel:", -[UISwitch _shouldShowOnOffLabels](self, "_shouldShowOnOffLabels"));

}

- (void)setTitle:(NSString *)title
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithValidatedFormat:validFormatSpecifiers:error:", 0x1E17809E0, CFSTR("%@ %@"), 0, v8, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView _throwForUnsupportedNonMacIdiomBehaviorWithReason:](self, "_throwForUnsupportedNonMacIdiomBehaviorWithReason:", v7);

}

- (void)setPreferredStyle:(UISwitchStyle)preferredStyle
{
  void *v4;

  if (self->_preferredStyle != preferredStyle)
  {
    self->_preferredStyle = preferredStyle;
    -[UIView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userInterfaceIdiom");

    -[UISwitch _setStyle:](self, "_setStyle:", 2);
  }
}

- (void)_setImpactFeedbackGenerator:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v5 = a3;
  -[UISwitch visualElement](self, "visualElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "impactFeedbackGenerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isActive");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISwitch.m"), 543, CFSTR("Impact feedback behavior should not be changed while active."));

  }
  -[UISwitch visualElement](self, "visualElement");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImpactFeedbackGenerator:", v5);

}

- (UIImpactFeedbackGenerator)_impactFeedbackGenerator
{
  void *v2;
  void *v3;

  -[UISwitch visualElement](self, "visualElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "impactFeedbackGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImpactFeedbackGenerator *)v3;
}

- (CGPoint)accessibilityActivationPoint
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGPoint result;

  -[UIView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 5
    && (-[UISwitch visualElement](self, "visualElement"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[UISwitch visualElement](self, "visualElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityActivationPoint");
    v8 = v7;
    v10 = v9;

    v11 = v8;
    v12 = v10;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)UISwitch;
    -[NSObject accessibilityActivationPoint](&v13, sel_accessibilityActivationPoint);
  }
  result.y = v12;
  result.x = v11;
  return result;
}

- (NSString)title
{
  return self->_title;
}

- (UIColor)onTintColor
{
  return self->_onTintColor;
}

- (UIColor)thumbTintColor
{
  return self->_thumbTintColor;
}

- (UIImage)onImage
{
  return self->_onImage;
}

- (UIImage)offImage
{
  return self->_offImage;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (int64_t)switchStyle
{
  return self->_switchStyle;
}

+ (void)_setAllowsUnsupportedMacIdiomBehavior:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  _UnsupportedFlags_0 = _UnsupportedFlags_0 & 0xEF | v3;
}

+ (BOOL)_allowsUnsupportedMacIdiomBehavior
{
  return (_UnsupportedFlags_0 >> 4) & 1;
}

@end
