@implementation DevicePINKeypad

- (DevicePINKeypad)init
{
  DevicePINKeypad *v2;
  DevicePINKeypad *v3;
  void *v4;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DevicePINKeypad;
  v2 = -[DevicePINKeypad init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UIKeyboard defaultTextInputTraits](v2, "defaultTextInputTraits");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDevicePasscodeEntry:", 1);
    -[UIKeyboard setDefaultTextInputTraits:](v3, "setDefaultTextInputTraits:", v4);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A3819000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "set devicePasscodeEntry (DevicePINKeypad)", v6, 2u);
    }

  }
  return v3;
}

- (BOOL)isMinimized
{
  return 0;
}

@end
