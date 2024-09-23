@implementation PSBiometricPINController

- (BOOL)showSimplePINCancelButtonOnLeft
{
  return +[PSUIBiometricController shouldPresentInModalSheet](PSUIBiometricController, "shouldPresentInModalSheet");
}

- (void)setPane:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PSBiometricPINController;
  -[DevicePINController setPane:](&v6, sel_setPane_, a3);
  if (!-[DevicePINController mode](self, "mode"))
  {
    -[PSBiometricPINController navigationItem](self, "navigationItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PSLocalizableMesaStringForKey();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitle:", v5);

  }
}

- (id)stringsBundle
{
  return (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
}

- (BOOL)_asyncSetPinCompatible
{
  return 1;
}

@end
