@implementation WebThreadInitRunQueue

void __WebThreadInitRunQueue_block_invoke()
{
  _QWORD *v0;
  CFRunLoopSourceRef v1;
  const void *v2;
  __CFRunLoop *Current;
  __CFRunLoopSource *v4;
  CFRunLoopSourceContext v5;

  v0 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v0 = 0;
  v0[1] = 0;
  runQueue = (uint64_t)v0;
  *(_OWORD *)&v5.cancel = xmmword_1E34172D8;
  memset(&v5, 0, 64);
  v1 = CFRunLoopSourceCreate(0, -1, &v5);
  {
    v2 = (const void *)runSource(void)::runSource;
    runSource(void)::runSource = (uint64_t)v1;
    if (v2)
      CFRelease(v2);
  }
  else
  {
    runSource(void)::runSource = (uint64_t)v1;
  }
  if (webThreadStarted == 1)
    Current = (__CFRunLoop *)webThreadRunLoop;
  else
    Current = CFRunLoopGetCurrent();
  {
    v4 = (__CFRunLoopSource *)runSource(void)::runSource;
  }
  else
  {
    v4 = 0;
    runSource(void)::runSource = 0;
  }
  CFRunLoopAddSource(Current, v4, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
}

@end
