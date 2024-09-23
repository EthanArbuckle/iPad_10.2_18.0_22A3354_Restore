@implementation NSObject(WebCoreThreadAdditions)

- (void)releaseOnMainThread
{
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))

  else
    objc_msgSend(a1, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_release, 0, 0);
}

@end
