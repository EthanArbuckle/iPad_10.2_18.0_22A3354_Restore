@implementation _UIFocusHardwareKeyboardObserver

- (_UIFocusHardwareKeyboardObserver)init
{
  _UIFocusHardwareKeyboardObserver *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIFocusHardwareKeyboardObserver;
  v2 = -[_UIFocusStateObserver init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__hardwareKeyboardAvailabilityChanged_, CFSTR("_UIDeviceHardwareKeyboardAvailabilityDidChangeNotification"), 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("_UIDeviceHardwareKeyboardAvailabilityDidChangeNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)_UIFocusHardwareKeyboardObserver;
  -[_UIFocusHardwareKeyboardObserver dealloc](&v4, sel_dealloc);
}

- (BOOL)isActive
{
  void *v2;
  char v3;

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isHardwareKeyboardAvailable");

  return v3;
}

@end
