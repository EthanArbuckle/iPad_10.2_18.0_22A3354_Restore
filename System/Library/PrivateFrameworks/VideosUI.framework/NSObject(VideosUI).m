@implementation NSObject(VideosUI)

- (void)vui_debounce:()VideosUI object:delay:
{
  void *v8;
  id v9;

  v8 = (void *)MEMORY[0x1E0DE7910];
  v9 = a5;
  objc_msgSend(v8, "cancelPreviousPerformRequestsWithTarget:selector:object:", a1, a4, v9);
  objc_msgSend(a1, "performSelector:withObject:afterDelay:", a4, v9, a2);

}

@end
