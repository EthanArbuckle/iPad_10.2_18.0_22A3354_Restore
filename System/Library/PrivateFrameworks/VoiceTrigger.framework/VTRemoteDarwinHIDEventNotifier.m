@implementation VTRemoteDarwinHIDEventNotifier

- (VTRemoteDarwinHIDEventNotifier)init
{
  VTRemoteDarwinHIDEventNotifier *v3;
  objc_super v5;

  if (+[VTUtilities supportRemoteDarwinVoiceTrigger](VTUtilities, "supportRemoteDarwinVoiceTrigger"))
  {
    v5.receiver = self;
    v5.super_class = (Class)VTRemoteDarwinHIDEventNotifier;
    self = -[VTRemoteDarwinHIDEventNotifier init](&v5, sel_init);
    v3 = self;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_registerHIDEventNotification
{
  const __CFAllocator *v3;
  __CFDictionary *Mutable;
  CFNumberRef v5;
  CFNumberRef v6;
  __IOHIDManager *hidManager;
  __CFRunLoop *Main;
  uint64_t valuePtr;

  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  self->_hidManager = IOHIDManagerCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  Mutable = CFDictionaryCreateMutable(v3, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  valuePtr = 65280;
  v5 = CFNumberCreate(v3, kCFNumberLongType, &valuePtr);
  if (v5)
    CFDictionarySetValue(Mutable, CFSTR("DeviceUsagePage"), v5);
  valuePtr = 83;
  v6 = CFNumberCreate(v3, kCFNumberLongType, &valuePtr);

  if (v6)
    CFDictionarySetValue(Mutable, CFSTR("DeviceUsage"), v6);
  CFDictionarySetValue(Mutable, CFSTR("HIDRelayUSBInterface"), CFSTR("SiriHIDDevice"));
  IOHIDManagerRegisterDeviceMatchingCallback(self->_hidManager, (IOHIDDeviceCallback)__deviceCallback, (void *)1);
  IOHIDManagerRegisterDeviceRemovalCallback(self->_hidManager, (IOHIDDeviceCallback)__deviceCallback, 0);
  IOHIDManagerRegisterInputReportCallback(self->_hidManager, (IOHIDReportCallback)__deviceReportCallback, 0);
  hidManager = self->_hidManager;
  Main = CFRunLoopGetMain();
  IOHIDManagerScheduleWithRunLoop(hidManager, Main, (CFStringRef)*MEMORY[0x24BDBD5A0]);
  IOHIDManagerSetDeviceMatching(self->_hidManager, Mutable);
  IOHIDManagerOpen(self->_hidManager, 0);

}

- (__IOHIDManager)hidManager
{
  return self->_hidManager;
}

- (void)setHidManager:(__IOHIDManager *)a3
{
  self->_hidManager = a3;
}

@end
