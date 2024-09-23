@implementation UIBarButtonItem(IC)

+ (id)ic_itemWithFlexibleSpace
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
}

- (id)ic_view
{
  void *v2;

  if ((objc_opt_respondsToSelector() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[self respondsToSelector:@selector(view)]", "-[UIBarButtonItem(IC) ic_view]", 1, 0, CFSTR("UIBarButtonItem expected to respond to selector: view"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "performSelector:", sel_view);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)ic_setTitleTextAttributesForAllStates:()IC
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "setTitleTextAttributes:forState:", v4, 0);
  objc_msgSend(a1, "setTitleTextAttributes:forState:", v4, 2);
  objc_msgSend(a1, "setTitleTextAttributes:forState:", v4, 1);
  objc_msgSend(a1, "setTitleTextAttributes:forState:", v4, 8);

}

- (void)setIc_titleAndAccessibilityLabel:()IC
{
  id v2;

  objc_msgSend(a1, "setTitle:");
  objc_msgSend(a1, "accessibilityLabel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccessibilityLabel:", v2);

}

+ (id)ic_itemWithFixedWidth:()IC
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
  objc_msgSend(v2, "setWidth:", a1);
  return v2;
}

@end
