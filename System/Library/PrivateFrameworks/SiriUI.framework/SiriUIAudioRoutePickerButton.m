@implementation SiriUIAudioRoutePickerButton

- (SiriUIAudioRoutePickerButton)initWithFrame:(CGRect)a3
{
  SiriUIAudioRoutePickerButton *v3;
  SiriUIAudioRoutePickerButton *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SiriUIAudioRoutePickerButton;
  v3 = -[SiriUIContentButton initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SiriUIAudioRoutePickerButton _bluetoothImage](v3, "_bluetoothImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUIAudioRoutePickerButton setImage:forState:](v4, "setImage:forState:", v5, 0);

    -[SiriUIAudioRoutePickerButton _bluetoothImageOn](v4, "_bluetoothImageOn");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUIAudioRoutePickerButton setImage:forState:](v4, "setImage:forState:", v6, 4);

    -[SiriUIAudioRoutePickerButton _bluetoothImageHighlighted](v4, "_bluetoothImageHighlighted");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUIAudioRoutePickerButton setImage:forState:](v4, "setImage:forState:", v7, 1);

    -[SiriUIAudioRoutePickerButton _bluetoothImageHighlighted](v4, "_bluetoothImageHighlighted");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUIAudioRoutePickerButton setImage:forState:](v4, "setImage:forState:", v8, 5);

  }
  return v4;
}

- (id)_baseBluetoothImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:", CFSTR("bluetoothglyph"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_bluetoothImage
{
  void *v2;
  void *v3;
  void *v4;

  -[SiriUIAudioRoutePickerButton _baseBluetoothImage](self, "_baseBluetoothImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "siriui_lightMaskingColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_flatImageWithColor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_bluetoothImageOn
{
  void *v2;
  void *v3;
  void *v4;

  -[SiriUIAudioRoutePickerButton _baseBluetoothImage](self, "_baseBluetoothImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_flatImageWithColor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_bluetoothImageHighlighted
{
  void *v2;
  void *v3;
  void *v4;

  -[SiriUIAudioRoutePickerButton _baseBluetoothImage](self, "_baseBluetoothImage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "siriui_lightMaskingHighlightColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_flatImageWithColor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
