@implementation RCPlaybackSettingSwitchCell

- (RCPlaybackSettingSwitchCell)initWithFrame:(CGRect)a3
{
  RCPlaybackSettingSwitchCell *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RCPlaybackSettingSwitchCell;
  v3 = -[RCPlaybackSettingSwitchCell initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIListContentConfiguration cellConfiguration](UIListContentConfiguration, "cellConfiguration"));
    -[RCPlaybackSettingSwitchCell setContentConfiguration:](v3, "setContentConfiguration:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingSwitchCell _cellAccessoriesWithSwitchState:](v3, "_cellAccessoriesWithSwitchState:", 0));
    -[RCPlaybackSettingSwitchCell setAccessories:](v3, "setAccessories:", v5);

  }
  return v3;
}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingSwitchCell contentConfiguration](self, "contentConfiguration"));
  objc_msgSend(v5, "setText:", v4);

  -[RCPlaybackSettingSwitchCell setContentConfiguration:](self, "setContentConfiguration:", v5);
}

- (NSString)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingSwitchCell contentConfiguration](self, "contentConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (void)setImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingSwitchCell contentConfiguration](self, "contentConfiguration"));
  objc_msgSend(v5, "setImage:", v4);

  -[RCPlaybackSettingSwitchCell setContentConfiguration:](self, "setContentConfiguration:", v5);
}

- (UIImage)image
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingSwitchCell contentConfiguration](self, "contentConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "image"));

  return (UIImage *)v3;
}

- (void)setImageTint:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingSwitchCell contentConfiguration](self, "contentConfiguration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageProperties"));
  objc_msgSend(v5, "setTintColor:", v4);

  -[RCPlaybackSettingSwitchCell setContentConfiguration:](self, "setContentConfiguration:", v6);
}

- (UIColor)imageTint
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingSwitchCell contentConfiguration](self, "contentConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "imageProperties"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tintColor"));

  return (UIColor *)v4;
}

- (BOOL)isSwitchON
{
  return -[UISwitch isOn](self->_switch, "isOn");
}

- (void)setSwitchState:(BOOL)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingSwitchCell _cellAccessoriesWithSwitchState:](self, "_cellAccessoriesWithSwitchState:", a3));
  -[RCPlaybackSettingSwitchCell setAccessories:](self, "setAccessories:", v4);

}

- (id)_cellAccessoriesWithSwitchState:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  UISwitch *v6;
  UISwitch *v7;
  id v8;
  id v9;

  v3 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = (UISwitch *)objc_alloc_init((Class)UISwitch);
  v7 = self->_switch;
  self->_switch = v6;

  -[UISwitch setOn:](self->_switch, "setOn:", v3);
  -[UISwitch addTarget:action:forControlEvents:](self->_switch, "addTarget:action:forControlEvents:", self, "_didToggleSwitch", 64);
  -[UISwitch setIsAccessibilityElement:](self->_switch, "setIsAccessibilityElement:", 0);
  v8 = objc_msgSend(objc_alloc((Class)UICellAccessoryCustomView), "initWithCustomView:placement:", self->_switch, 1);
  objc_msgSend(v8, "setDisplayedState:", 0);
  objc_msgSend(v5, "addObject:", v8);
  v9 = objc_msgSend(v5, "copy");

  return v9;
}

- (void)_didToggleSwitch
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RCPlaybackSettingCell cellActionsDelegate](self, "cellActionsDelegate"));
  objc_msgSend(v3, "didToggleSwitch:toState:", self, -[UISwitch isOn](self->_switch, "isOn"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityValue
{
  return -[UISwitch accessibilityValue](self->_switch, "accessibilityValue");
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RCPlaybackSettingSwitchCell;
  v3 = -[RCPlaybackSettingSwitchCell accessibilityTraits](&v5, "accessibilityTraits");
  return (unint64_t)-[UISwitch accessibilityTraits](self->_switch, "accessibilityTraits") | v3;
}

- (BOOL)accessibilityActivate
{
  -[RCPlaybackSettingSwitchCell setSwitchState:](self, "setSwitchState:", -[RCPlaybackSettingSwitchCell isSwitchON](self, "isSwitchON") ^ 1);
  -[RCPlaybackSettingSwitchCell _didToggleSwitch](self, "_didToggleSwitch");
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_switch, 0);
}

@end
