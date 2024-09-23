@implementation WFKeyboardToolbarAccessoryView

- (WFKeyboardToolbarAccessoryView)init
{
  double v3;
  double v4;
  WFKeyboardToolbarAccessoryView *v5;
  UIToolbar *v6;
  void *v7;
  void *v8;
  UIToolbar *toolbar;
  WFKeyboardToolbarAccessoryView *v10;

  -[WFKeyboardToolbarAccessoryView keyboardButtonHeight](self, "keyboardButtonHeight");
  v4 = v3 + 10.0;
  v5 = -[UIInputView initWithFrame:inputViewStyle:](self, "initWithFrame:inputViewStyle:", 0, 0.0, 0.0, 0.0, v3 + 10.0);
  if (v5)
  {
    v6 = (UIToolbar *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA90]), "initWithFrame:", 0.0, 0.0, 0.0, v4);
    -[UIToolbar setClipsToBounds:](v6, "setClipsToBounds:", 1);
    -[UIToolbar setAutoresizingMask:](v6, "setAutoresizingMask:", 6);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIToolbar setBackgroundColor:](v6, "setBackgroundColor:", v7);

    v8 = (void *)objc_opt_new();
    -[UIToolbar setBackgroundImage:forToolbarPosition:barMetrics:](v6, "setBackgroundImage:forToolbarPosition:barMetrics:", v8, 0, 0);

    -[WFKeyboardToolbarAccessoryView addSubview:](v5, "addSubview:", v6);
    toolbar = v5->_toolbar;
    v5->_toolbar = v6;

    -[WFKeyboardToolbarAccessoryView removeAllBarItems](v5, "removeAllBarItems");
    v10 = v5;
  }

  return v5;
}

- (NSArray)barItems
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;

  -[WFKeyboardToolbarAccessoryView toolbar](self, "toolbar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "removeObjectAtIndex:", 0);
  objc_msgSend(v4, "removeLastObject");
  if (v4)
    v5 = v4;
  else
    v5 = (void *)MEMORY[0x24BDBD1A8];
  v6 = v5;

  return v6;
}

- (void)setBarItems:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)objc_opt_new();
  v10 = v6;

  -[WFKeyboardToolbarAccessoryView inverseToolbarPadding](self, "inverseToolbarPadding");
  -[WFKeyboardToolbarAccessoryView fixedSpaceItemOfWidth:](self, "fixedSpaceItemOfWidth:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "insertObject:atIndex:", v7, 0);

  -[WFKeyboardToolbarAccessoryView inverseToolbarPadding](self, "inverseToolbarPadding");
  -[WFKeyboardToolbarAccessoryView fixedSpaceItemOfWidth:](self, "fixedSpaceItemOfWidth:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v8);

  -[WFKeyboardToolbarAccessoryView toolbar](self, "toolbar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setItems:", v10);

}

- (void)appendBarItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[WFKeyboardToolbarAccessoryView toolbar](self, "toolbar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(v6, "insertObject:atIndex:", v4, objc_msgSend(v8, "count") - 1);

  -[WFKeyboardToolbarAccessoryView toolbar](self, "toolbar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setItems:", v6);

}

- (void)prependBarItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[WFKeyboardToolbarAccessoryView toolbar](self, "toolbar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v8, "insertObject:atIndex:", v4, 1);
  -[WFKeyboardToolbarAccessoryView toolbar](self, "toolbar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setItems:", v8);

}

- (void)removeAllBarItems
{
  -[WFKeyboardToolbarAccessoryView setBarItems:](self, "setBarItems:", 0);
}

- (BOOL)isPhoneUI
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 0;

  return v3;
}

- (double)borderedButtonWidthForButtonTitle:(id)a3 font:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  _BOOL4 v12;
  double result;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v14 = *MEMORY[0x24BEBB360];
  v15[0] = a4;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sizeWithAttributes:", v9);
  v11 = v10;

  v12 = -[WFKeyboardToolbarAccessoryView isPhoneUI](self, "isPhoneUI");
  result = v11 + 17.0;
  if (!v12)
    return 118.0;
  return result;
}

- (double)keyboardButtonHeight
{
  _BOOL4 v2;
  double result;

  v2 = -[WFKeyboardToolbarAccessoryView isPhoneUI](self, "isPhoneUI");
  result = 34.0;
  if (v2)
    return 30.0;
  return result;
}

- (double)inverseToolbarPadding
{
  _BOOL4 v2;
  double result;

  v2 = -[WFKeyboardToolbarAccessoryView isPhoneUI](self, "isPhoneUI");
  result = -14.0;
  if (v2)
    return -13.0;
  return result;
}

- (id)plainButtonItemWithTitle:(id)a3 bolded:(BOOL)a4 target:(id)a5 action:(SEL)a6
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;

  v10 = (void *)MEMORY[0x24BEBB520];
  v11 = a5;
  v12 = a3;
  if (a4)
    objc_msgSend(v10, "boldSystemFontOfSize:", 16.0);
  else
    objc_msgSend(v10, "systemFontOfSize:", 16.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFKeyboardToolbarAccessoryView borderedButtonWidthForButtonTitle:font:](self, "borderedButtonWidthForButtonTitle:font:", v12, v13);
  v15 = v14;
  -[WFKeyboardToolbarAccessoryView keyboardButtonHeight](self, "keyboardButtonHeight");
  v17 = v16;
  objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFrame:", 0.0, 0.0, v15, v17);
  objc_msgSend(v18, "titleLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFont:", v13);

  objc_msgSend(v18, "setTitle:forState:", v12, 0);
  objc_msgSend(v18, "addTarget:action:forControlEvents:", v11, a6, 64);

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", v18);
  return v20;
}

- (id)borderedButtonItemWithTitle:(id)a3 target:(id)a4 action:(SEL)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v8 = (void *)MEMORY[0x24BEBB520];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "systemFontOfSize:", 14.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFKeyboardToolbarAccessoryView borderedButtonWidthForButtonTitle:font:](self, "borderedButtonWidthForButtonTitle:font:", v10, v11);
  v13 = v12;
  -[WFKeyboardToolbarAccessoryView keyboardButtonHeight](self, "keyboardButtonHeight");
  v15 = v14;
  -[WFKeyboardToolbarAccessoryView buttonImageWithSize:](self, "buttonImageWithSize:", v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", 0.0, 0.0, v13, v15);
  objc_msgSend(v17, "titleLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFont:", v11);

  objc_msgSend(v17, "setBackgroundImage:forState:", v16, 0);
  objc_msgSend(v17, "setTitle:forState:", v10, 0);

  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTitleColor:forState:", v19, 0);

  objc_msgSend(v17, "addTarget:action:forControlEvents:", v9, a5, 64);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithCustomView:", v17);

  return v20;
}

- (id)flexibleSpaceItem
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
}

- (id)fixedSpaceItemOfWidth:(double)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
  objc_msgSend(v4, "setWidth:", a3);
  return v4;
}

- (id)buttonImageWithSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  void *v7;
  void *v8;
  CGContext *CurrentContext;
  void *v10;
  CGSize v12;

  height = a3.height;
  width = a3.width;
  if (-[WFKeyboardToolbarAccessoryView isPhoneUI](self, "isPhoneUI"))
    v6 = 4.0;
  else
    v6 = 7.0;
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.533, 0.545, 0.561, 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12.width = width;
  v12.height = height;
  UIGraphicsBeginImageContextWithOptions(v12, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetBlendMode(CurrentContext, kCGBlendModeCopy);
  -[WFKeyboardToolbarAccessoryView drawRoundedRectangleInRect:withContext:color:radius:](self, "drawRoundedRectangleInRect:withContext:color:radius:", CurrentContext, v8, 0.0, 0.0, width, height, v6);
  -[WFKeyboardToolbarAccessoryView drawRoundedRectangleInRect:withContext:color:radius:](self, "drawRoundedRectangleInRect:withContext:color:radius:", CurrentContext, v7, 0.0, 0.0, width, height + -1.0, v6);
  UIGraphicsGetImageFromCurrentImageContext();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v10;
}

- (void)drawRoundedRectangleInRect:(CGRect)a3 withContext:(CGContext *)a4 color:(id)a5 radius:(double)a6
{
  double height;
  double v9;
  double x;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double width;
  CGFloat y;

  height = a3.size.height;
  width = a3.size.width;
  v9 = a3.origin.y;
  y = a3.origin.y;
  x = a3.origin.x;
  CGContextSetFillColorWithColor(a4, (CGColorRef)objc_msgSend(objc_retainAutorelease(a5), "CGColor"));
  CGContextMoveToPoint(a4, x, v9 + a6);
  v11 = v9 + height;
  CGContextAddLineToPoint(a4, x, v11 - a6);
  v12 = x + a6;
  CGContextAddArc(a4, x + a6, v11 - a6, a6, 3.14159265, 1.57079633, 1);
  v13 = x + width;
  CGContextAddLineToPoint(a4, v13 - a6, v11);
  CGContextAddArc(a4, v13 - a6, v11 - a6, a6, 1.57079633, 0.0, 1);
  CGContextAddLineToPoint(a4, v13, v9 + a6);
  CGContextAddArc(a4, v13 - a6, v9 + a6, a6, 0.0, -1.57079633, 1);
  CGContextAddLineToPoint(a4, v12, y);
  CGContextAddArc(a4, v12, v9 + a6, a6, -1.57079633, 3.14159265, 1);
  CGContextFillPath(a4);
}

- (BOOL)enableInputClicksWhenVisible
{
  return 1;
}

- (UIToolbar)toolbar
{
  return self->_toolbar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolbar, 0);
}

@end
