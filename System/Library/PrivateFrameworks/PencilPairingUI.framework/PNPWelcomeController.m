@implementation PNPWelcomeController

+ (id)controllerWithType:(int64_t)a3 buttonType:(int64_t)a4 deviceType:(int64_t)a5 delegate:(id)a6
{
  id v9;
  void *v10;
  void *v11;

  v9 = a6;
  v10 = 0;
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 6:
    case 8:
    case 9:
      goto LABEL_3;
    case 7:
      objc_opt_class();
LABEL_3:
      v10 = (void *)objc_opt_class();
      break;
    default:
      break;
  }
  objc_msgSend(v10, "_controllerWithType:buttonType:deviceType:delegate:", a3, a4, a5, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (UIEdgeInsets)additionalSafeAreaInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 22.0;
  v4 = 0.0;
  v5 = 22.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)addButtonWithType:(int64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("CONTINUE_BUTTON");
  }
  else
  {
    if (a3 != 2)
      return;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("DONE_BUTTON");
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24F4E5CD0, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:forState:", v10, 0);
    objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel_buttonPressed_, 64);
    -[PNPWelcomeController buttonTray](self, "buttonTray");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addButton:", v7);

    -[PNPWelcomeController buttonTray](self, "buttonTray");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 0);

    -[PNPWelcomeController setTrayButton:](self, "setTrayButton:", v7);
  }
}

- (void)buttonPressed:(id)a3
{
  id v4;

  -[PNPWelcomeController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "welcomeControllerButtonDidPress:", self);

}

- (void)setControllerType:(int64_t)a3 buttonType:(int64_t)a4 deviceType:(int64_t)a5 delegate:(id)a6
{
  id v10;

  v10 = a6;
  -[PNPWelcomeController setControllerType:](self, "setControllerType:", a3);
  -[PNPWelcomeController setButtonType:](self, "setButtonType:", a4);
  -[PNPWelcomeController setDelegate:](self, "setDelegate:", v10);

  -[PNPWelcomeController setDeviceType:](self, "setDeviceType:", a5);
  -[PNPWelcomeController addButtonWithType:](self, "addButtonWithType:", a4);
}

- (id)bundleImageNamed:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "bundleImageNamed:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)bundleImageNamed:(id)a3 renderingMode:(int64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "bundleImageNamed:renderingMode:", v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)bundleImageNamed:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDF6AC8];
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:inBundle:compatibleWithTraitCollection:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "imageWithRenderingMode:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)bundleImageNamed:(id)a3 renderingMode:(int64_t)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x24BDF6AC8];
  v6 = (void *)MEMORY[0x24BDD1488];
  v7 = a3;
  objc_msgSend(v6, "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamed:inBundle:compatibleWithTraitCollection:", v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "imageWithRenderingMode:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)isRTL
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceLayoutDirection") == 1;

  return v3;
}

- (PNPWelcomeControllerDelegate)delegate
{
  return (PNPWelcomeControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)controllerType
{
  return self->_controllerType;
}

- (void)setControllerType:(int64_t)a3
{
  self->_controllerType = a3;
}

- (int64_t)buttonType
{
  return self->_buttonType;
}

- (void)setButtonType:(int64_t)a3
{
  self->_buttonType = a3;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (OBTrayButton)trayButton
{
  return self->_trayButton;
}

- (void)setTrayButton:(id)a3
{
  objc_storeStrong((id *)&self->_trayButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trayButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
