@implementation PCSTapToRadar

void __PCSTapToRadar_block_invoke(uint64_t a1)
{
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v2;
  __CFRunLoop *Current;

  RunLoopSource = CFUserNotificationCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(CFUserNotificationRef *)(a1 + 32), (CFUserNotificationCallBack)PCSTTRUserNotificationCallback, 0);
  if (RunLoopSource)
  {
    v2 = RunLoopSource;
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, v2, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    CFRelease(v2);
  }
}

@end
