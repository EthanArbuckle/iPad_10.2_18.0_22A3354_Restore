@implementation UITab(UITab_VideosUI)

- (uint64_t)vui_hasVisiblePlacement
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(a1, "hasVisiblePlacement");
  else
    return 0;
}

@end
