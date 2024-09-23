@implementation UITraitCollection

- (BOOL)isUserInterfaceStyleDark
{
  return (id)-[UITraitCollection userInterfaceStyle](self, "userInterfaceStyle") == (id)2;
}

- (BOOL)isInAndromeda
{
  return -[UITraitCollection _backlightLuminance](self, "_backlightLuminance") == (id)1;
}

@end
