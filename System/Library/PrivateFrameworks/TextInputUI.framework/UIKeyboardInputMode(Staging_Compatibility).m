@implementation UIKeyboardInputMode(Staging_Compatibility)

- (id)safe__extendedDisplayName
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a1, "extendedDisplayName");
  else
    objc_msgSend(a1, "displayName");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
