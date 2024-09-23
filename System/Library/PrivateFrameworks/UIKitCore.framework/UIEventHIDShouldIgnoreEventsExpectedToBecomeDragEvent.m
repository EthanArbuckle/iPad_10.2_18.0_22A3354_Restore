@implementation UIEventHIDShouldIgnoreEventsExpectedToBecomeDragEvent

void ___UIEventHIDShouldIgnoreEventsExpectedToBecomeDragEvent_block_invoke()
{
  void *v0;
  void *v1;
  char v2;

  if (objc_msgSend((id)objc_opt_class(), "_isUIKitSystemProcess"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "bundleIdentifier");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(CFSTR("com.apple.DragUI.druid"), "isEqualToString:", v1) ^ 1;

  }
  else
  {
    v2 = 1;
  }
  byte_1ECD800E1 = v2;
}

@end
