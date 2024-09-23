@implementation NSObject(SBSwitcherModifierDebugTimelineDescription)

- (id)sb_switcherModifierDebugTimelineDescription
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a1, "succinctDescription");
  else
    objc_msgSend(a1, "description");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
