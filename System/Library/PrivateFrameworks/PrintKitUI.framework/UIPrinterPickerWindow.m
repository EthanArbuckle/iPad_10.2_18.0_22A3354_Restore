@implementation UIPrinterPickerWindow

- (BOOL)_canAffectStatusBarAppearance
{
  return 1;
}

- (id)_roleHint
{
  return (id)*MEMORY[0x1E0DC5B00];
}

@end
