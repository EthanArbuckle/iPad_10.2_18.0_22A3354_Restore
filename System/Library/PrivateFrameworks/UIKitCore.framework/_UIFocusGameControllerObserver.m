@implementation _UIFocusGameControllerObserver

- (_UIFocusGameControllerObserver)init
{
  _UIFocusGameControllerObserver *v2;
  _UIFocusGameControllerObserver *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIFocusGameControllerObserver;
  v2 = -[_UIFocusStateObserver init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[_UIFocusGameControllerObserver _registerObserver](v2, "_registerObserver");
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[_UIFocusGameControllerObserver _unregisterObserver](self, "_unregisterObserver");
  v3.receiver = self;
  v3.super_class = (Class)_UIFocusGameControllerObserver;
  -[_UIFocusGameControllerObserver dealloc](&v3, sel_dealloc);
}

- (void)_registerObserver
{
  __IOHIDManager *v3;
  void *v4;
  const __CFArray *v5;
  __CFRunLoop *Main;
  IOReturn v7;
  IOReturn v8;
  unint64_t v9;
  NSObject *v10;
  _DWORD v11[4];
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v3 = IOHIDManagerCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  v13[0] = CFSTR("DeviceUsagePage");
  v13[1] = CFSTR("DeviceUsage");
  v14[0] = &unk_1E1A97380;
  v14[1] = &unk_1E1A97398;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
  v5 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
  IOHIDManagerSetDeviceMatchingMultiple(v3, v5);
  IOHIDManagerRegisterDeviceMatchingCallback(v3, (IOHIDDeviceCallback)deviceAddedCallback, self);
  IOHIDManagerRegisterDeviceRemovalCallback(v3, (IOHIDDeviceCallback)deviceRemovedCallback, self);
  Main = CFRunLoopGetMain();
  IOHIDManagerScheduleWithRunLoop(v3, Main, (CFStringRef)*MEMORY[0x1E0C9B280]);
  v7 = IOHIDManagerOpen(v3, 0);
  if (v7)
  {
    v8 = v7;
    v9 = _registerObserver___s_category;
    if (!_registerObserver___s_category)
    {
      v9 = __UILogCategoryGetNode("FocusSystem", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v9, (unint64_t *)&_registerObserver___s_category);
    }
    v10 = *(NSObject **)(v9 + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67240192;
      v11[1] = v8;
      _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_DEFAULT, "Unable to open HID manager to monitor for game controllers. Failed with error code (%{public}d).", (uint8_t *)v11, 8u);
    }
  }
  else
  {
    self->_hidManager = v3;
  }

}

- (void)_unregisterObserver
{
  __IOHIDManager *hidManager;

  hidManager = self->_hidManager;
  if (hidManager)
  {
    IOHIDManagerClose(hidManager, 0);
    CFRelease(self->_hidManager);
    self->_hidManager = 0;
  }
}

- (BOOL)isActive
{
  __IOHIDManager *hidManager;
  const __CFSet *v3;
  const __CFSet *v4;
  BOOL v5;

  hidManager = self->_hidManager;
  if (!hidManager)
    return 0;
  v3 = IOHIDManagerCopyDevices(hidManager);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = CFSetGetCount(v3) > 0;
  CFRelease(v4);
  return v5;
}

@end
