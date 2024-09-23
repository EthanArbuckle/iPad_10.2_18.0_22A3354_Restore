@implementation _UIStaticScrollbarButton

- (BOOL)canBecomeFocused
{
  void *v2;
  BOOL v3;

  -[UIView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") != 3;

  return v3;
}

@end
