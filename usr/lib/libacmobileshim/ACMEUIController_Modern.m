@implementation ACMEUIController_Modern

- (Class)standardSignInClass
{
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom");
  return (Class)objc_opt_class();
}

- (Class)customSignInClass
{
  return (Class)objc_opt_class();
}

- (Class)iTunesSignInClass
{
  return (Class)objc_opt_class();
}

- (Class)signInWidgetClass
{
  return (Class)objc_opt_class();
}

@end
