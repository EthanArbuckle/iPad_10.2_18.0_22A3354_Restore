@implementation PNPAirplaneModeView

- (void)layoutSubviews
{
  UIButton *turnOnBluetoothButton;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PNPAirplaneModeView;
  -[PNPAirplaneModeView layoutSubviews](&v5, sel_layoutSubviews);
  -[UILabel setText:](self->_deviceNameLabel, "setText:", self->_pencilStatusString);
  -[UILabel setTextAlignment:](self->_deviceNameLabel, "setTextAlignment:", 1);
  -[UIButton setTitle:forState:](self->_turnOnBluetoothButton, "setTitle:forState:", self->_currentString, 0);
  turnOnBluetoothButton = self->_turnOnBluetoothButton;
  objc_msgSend(MEMORY[0x24BDF6950], "defaultButtonColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitleColor:forState:](turnOnBluetoothButton, "setTitleColor:forState:", v4, 0);

}

- (CGSize)intrinsicContentSize
{
  UILabel *deviceNameLabel;
  double v4;
  double v5;
  double v6;
  UIButton *turnOnBluetoothButton;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  deviceNameLabel = self->_deviceNameLabel;
  -[UILabel frame](deviceNameLabel, "frame");
  -[UILabel sizeThatFits:](deviceNameLabel, "sizeThatFits:", v4, 1.79769313e308);
  v6 = v5;
  turnOnBluetoothButton = self->_turnOnBluetoothButton;
  -[UIButton frame](turnOnBluetoothButton, "frame");
  -[UIButton sizeThatFits:](turnOnBluetoothButton, "sizeThatFits:", v8, 1.79769313e308);
  v10 = fmax(fmax(v6, v9) + 60.0, 188.0);
  v11 = 56.0;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)setDeviceState:(id)a3
{
  objc_storeStrong((id *)&self->_deviceState, a3);
  -[PNPAirplaneModeView setNeedsLayout](self, "setNeedsLayout");
}

- (PNPDeviceState)deviceState
{
  return self->_deviceState;
}

- (PNPAirplaneModeView)initWithFrame:(CGRect)a3
{
  PNPAirplaneModeView *v3;
  UILabel *v4;
  UILabel *deviceNameLabel;
  uint64_t v6;
  UIButton *turnOnBluetoothButton;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *currentString;
  UIView *v13;
  UIView *contentAreaView;
  void *v15;
  uint64_t v16;
  NSString *pencilStatusString;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PNPAirplaneModeView;
  v3 = -[PNPAirplaneModeView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (UILabel *)objc_alloc_init(MEMORY[0x24BDF6B68]);
  deviceNameLabel = v3->_deviceNameLabel;
  v3->_deviceNameLabel = v4;

  objc_msgSend(MEMORY[0x24BDF6880], "buttonWithType:", 1);
  v6 = objc_claimAutoreleasedReturnValue();
  turnOnBluetoothButton = v3->_turnOnBluetoothButton;
  v3->_turnOnBluetoothButton = (UIButton *)v6;

  -[UIButton addTarget:action:forControlEvents:](v3->_turnOnBluetoothButton, "addTarget:action:forControlEvents:", v3, sel_turnOnBluetooth_, 64);
  v8 = *MEMORY[0x24BEBB5E8];
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 12.0, *MEMORY[0x24BEBB5E8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](v3->_turnOnBluetoothButton, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v9);

  -[PNPAirplaneModeView _turnOnString](v3, "_turnOnString");
  v11 = objc_claimAutoreleasedReturnValue();
  currentString = v3->_currentString;
  v3->_currentString = (NSString *)v11;

  v13 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
  contentAreaView = v3->_contentAreaView;
  v3->_contentAreaView = v13;

  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 13.0, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v3->_deviceNameLabel, "setFont:", v15);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_deviceNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_contentAreaView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v3->_turnOnBluetoothButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PNPAirplaneModeView addSubview:](v3, "addSubview:", v3->_contentAreaView);
  -[PNPAirplaneModeView addSubview:](v3, "addSubview:", v3->_deviceNameLabel);
  -[PNPAirplaneModeView addSubview:](v3, "addSubview:", v3->_turnOnBluetoothButton);
  -[PNPAirplaneModeView _applePencilOff](v3, "_applePencilOff");
  v16 = objc_claimAutoreleasedReturnValue();
  pencilStatusString = v3->_pencilStatusString;
  v3->_pencilStatusString = (NSString *)v16;

  -[PNPAirplaneModeView _configureConstraints](v3, "_configureConstraints");
  return v3;
}

- (void)_configureConstraints
{
  void *v3;
  void *v4;
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
  id v30;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_contentAreaView, "leadingAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPAirplaneModeView leadingAnchor](self, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4, 30.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v5);

  -[UIView trailingAnchor](self->_contentAreaView, "trailingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPAirplaneModeView trailingAnchor](self, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, -30.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v8);

  -[UIView centerYAnchor](self->_contentAreaView, "centerYAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PNPAirplaneModeView centerYAnchor](self, "centerYAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v11);

  -[UILabel leadingAnchor](self->_deviceNameLabel, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_contentAreaView, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v14);

  -[UILabel trailingAnchor](self->_deviceNameLabel, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_contentAreaView, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v17);

  -[UILabel topAnchor](self->_deviceNameLabel, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_contentAreaView, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, 10.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v20);

  -[UIButton lastBaselineAnchor](self->_turnOnBluetoothButton, "lastBaselineAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel lastBaselineAnchor](self->_deviceNameLabel, "lastBaselineAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, 16.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v23);

  -[UIButton bottomAnchor](self->_turnOnBluetoothButton, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_contentAreaView, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v26);

  -[UIButton centerXAnchor](self->_turnOnBluetoothButton, "centerXAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel centerXAnchor](self->_deviceNameLabel, "centerXAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObject:", v29);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v30);
}

- (void)turnOnBluetooth:(id)a3
{
  NSString *v4;
  NSString *currentString;
  NSString *v6;
  NSString *pencilStatusString;
  UIButton *turnOnBluetoothButton;
  void *v9;
  id WeakRetained;
  id v11;

  -[PNPAirplaneModeView _bluetoothOnString](self, "_bluetoothOnString", a3);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  currentString = self->_currentString;
  self->_currentString = v4;

  -[PNPAirplaneModeView _applePencilOn](self, "_applePencilOn");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  pencilStatusString = self->_pencilStatusString;
  self->_pencilStatusString = v6;

  turnOnBluetoothButton = self->_turnOnBluetoothButton;
  objc_msgSend(MEMORY[0x24BDF6950], "defaultButtonPressedColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton setTitleColor:forState:](turnOnBluetoothButton, "setTitleColor:forState:", v9, 0);

  -[UIButton setUserInteractionEnabled:](self->_turnOnBluetoothButton, "setUserInteractionEnabled:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_bluetoothDelegate);

  if (WeakRetained)
  {
    v11 = objc_loadWeakRetained((id *)&self->_bluetoothDelegate);
    objc_msgSend(v11, "didTapOnBluetoothButton");

  }
  -[PNPAirplaneModeView setNeedsLayout](self, "setNeedsLayout");
}

- (id)_applePencilOff
{
  void *v2;
  void *v3;

  PencilPairingUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("APPLE_PENCIL_OFF"), &stru_24F4E5CD0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_applePencilOn
{
  void *v2;
  void *v3;

  PencilPairingUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("APPLE_PENCIL_ON"), &stru_24F4E5CD0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_turnOnString
{
  void *v2;
  void *v3;

  PencilPairingUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("TURN_ON_BLUETOOTH"), &stru_24F4E5CD0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_bluetoothOnString
{
  void *v2;
  void *v3;

  PencilPairingUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("BLUETOOTH_TURNED_ON"), &stru_24F4E5CD0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PNPAirplaneModeBluetoothViewDelegate)bluetoothDelegate
{
  return (PNPAirplaneModeBluetoothViewDelegate *)objc_loadWeakRetained((id *)&self->_bluetoothDelegate);
}

- (void)setBluetoothDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_bluetoothDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_bluetoothDelegate);
  objc_storeStrong((id *)&self->_pencilStatusString, 0);
  objc_storeStrong((id *)&self->_currentString, 0);
  objc_storeStrong((id *)&self->_turnOnBluetoothButton, 0);
  objc_storeStrong((id *)&self->_deviceNameLabel, 0);
  objc_storeStrong((id *)&self->_contentAreaView, 0);
  objc_storeStrong((id *)&self->_deviceState, 0);
}

@end
