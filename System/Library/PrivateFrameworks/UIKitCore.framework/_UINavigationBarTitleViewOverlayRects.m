@implementation _UINavigationBarTitleViewOverlayRects

- (id)asArray
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_opt_new();
  if (!CGRectIsNull(self->_leadingStaticItemRect))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", self->_leadingStaticItemRect.origin.x, self->_leadingStaticItemRect.origin.y, self->_leadingStaticItemRect.size.width, self->_leadingStaticItemRect.size.height);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  if (!CGRectIsNull(self->_backButtonRect))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", self->_backButtonRect.origin.x, self->_backButtonRect.origin.y, self->_backButtonRect.size.width, self->_backButtonRect.size.height);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  if (!CGRectIsNull(self->_leadingItemsRect))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", self->_leadingItemsRect.origin.x, self->_leadingItemsRect.origin.y, self->_leadingItemsRect.size.width, self->_leadingItemsRect.size.height);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  if (!CGRectIsNull(self->_titleRect))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", self->_titleRect.origin.x, self->_titleRect.origin.y, self->_titleRect.size.width, self->_titleRect.size.height);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  if (!CGRectIsNull(self->_centerItemsRect))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", self->_centerItemsRect.origin.x, self->_centerItemsRect.origin.y, self->_centerItemsRect.size.width, self->_centerItemsRect.size.height);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v8);

  }
  if (!CGRectIsNull(self->_floatingTabBarRect))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", self->_floatingTabBarRect.origin.x, self->_floatingTabBarRect.origin.y, self->_floatingTabBarRect.size.width, self->_floatingTabBarRect.size.height);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  if (!CGRectIsNull(self->_trailingItemsRect))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", self->_trailingItemsRect.origin.x, self->_trailingItemsRect.origin.y, self->_trailingItemsRect.size.width, self->_trailingItemsRect.size.height);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v10);

  }
  if (!CGRectIsNull(self->_trailingStaticItemRect))
  {
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", self->_trailingStaticItemRect.origin.x, self->_trailingStaticItemRect.origin.y, self->_trailingStaticItemRect.size.width, self->_trailingStaticItemRect.size.height);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  return v3;
}

- (void)setTrailingStaticItemRect:(CGRect)a3
{
  self->_trailingStaticItemRect = a3;
}

- (void)setTrailingItemsRect:(CGRect)a3
{
  self->_trailingItemsRect = a3;
}

- (void)setTitleRect:(CGRect)a3
{
  self->_titleRect = a3;
}

- (void)setLeadingStaticItemRect:(CGRect)a3
{
  self->_leadingStaticItemRect = a3;
}

- (void)setLeadingItemsRect:(CGRect)a3
{
  self->_leadingItemsRect = a3;
}

- (void)setCenterItemsRect:(CGRect)a3
{
  self->_centerItemsRect = a3;
}

- (void)setBackButtonRect:(CGRect)a3
{
  self->_backButtonRect = a3;
}

- (_UINavigationBarTitleViewOverlayRects)init
{
  _UINavigationBarTitleViewOverlayRects *result;
  CGPoint v3;
  CGSize v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UINavigationBarTitleViewOverlayRects;
  result = -[_UINavigationBarTitleViewOverlayRects init](&v5, sel_init);
  if (result)
  {
    v3 = (CGPoint)*MEMORY[0x1E0C9D628];
    v4 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    result->_leadingStaticItemRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    result->_leadingStaticItemRect.size = v4;
    result->_backButtonRect.origin = v3;
    result->_backButtonRect.size = v4;
    result->_leadingItemsRect.origin = v3;
    result->_leadingItemsRect.size = v4;
    result->_titleRect.origin = v3;
    result->_titleRect.size = v4;
    result->_centerItemsRect.origin = v3;
    result->_centerItemsRect.size = v4;
    result->_trailingItemsRect.origin = v3;
    result->_trailingItemsRect.size = v4;
    result->_trailingStaticItemRect.origin = v3;
    result->_trailingStaticItemRect.size = v4;
    result->_floatingTabBarRect.origin = v3;
    result->_floatingTabBarRect.size = v4;
  }
  return result;
}

- (CGRect)leadingStaticItemRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_leadingStaticItemRect.origin.x;
  y = self->_leadingStaticItemRect.origin.y;
  width = self->_leadingStaticItemRect.size.width;
  height = self->_leadingStaticItemRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)leadingItemsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_leadingItemsRect.origin.x;
  y = self->_leadingItemsRect.origin.y;
  width = self->_leadingItemsRect.size.width;
  height = self->_leadingItemsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)backButtonRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_backButtonRect.origin.x;
  y = self->_backButtonRect.origin.y;
  width = self->_backButtonRect.size.width;
  height = self->_backButtonRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)reset
{
  CGPoint v2;
  CGSize v3;

  v2 = (CGPoint)*MEMORY[0x1E0C9D628];
  v3 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->_leadingStaticItemRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_leadingStaticItemRect.size = v3;
  self->_backButtonRect.origin = v2;
  self->_backButtonRect.size = v3;
  self->_leadingItemsRect.origin = v2;
  self->_leadingItemsRect.size = v3;
  self->_titleRect.origin = v2;
  self->_titleRect.size = v3;
  self->_titleLocation = 0;
  self->_centerItemsRect.origin = v2;
  self->_centerItemsRect.size = v3;
  self->_trailingItemsRect.origin = v2;
  self->_trailingItemsRect.size = v3;
  self->_trailingStaticItemRect.origin = v2;
  self->_trailingStaticItemRect.size = v3;
  self->_floatingTabBarRect.origin = v2;
  self->_floatingTabBarRect.size = v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)_UINavigationBarTitleViewOverlayRects;
  -[_UINavigationBarTitleViewOverlayRects description](&v16, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (!CGRectIsNull(self->_leadingStaticItemRect))
  {
    NSStringFromCGRect(self->_leadingStaticItemRect);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" %s=%@"), "leadingStaticItemRect", v5);

  }
  if (!CGRectIsNull(self->_backButtonRect))
  {
    NSStringFromCGRect(self->_backButtonRect);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" %s=%@"), "backButtonRect", v6);

  }
  if (!CGRectIsNull(self->_leadingItemsRect))
  {
    NSStringFromCGRect(self->_leadingItemsRect);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" %s=%@"), "leadingItemsRect", v7);

  }
  if (!CGRectIsNull(self->_titleRect))
  {
    NSStringFromCGRect(self->_titleRect);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" %s=%@"), "titleRect", v8);

  }
  if (!CGRectIsNull(self->_titleRect))
  {
    NSStringFromCGRect(self->_titleRect);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" titleRect=%@"), v9);

    switch(self->_titleLocation)
    {
      case 0:
        v10 = CFSTR(" location=unknown");
        goto LABEL_16;
      case 1:
        v10 = CFSTR(" location=centered");
        goto LABEL_16;
      case 2:
        v10 = CFSTR(" location=leading");
        goto LABEL_16;
      case 3:
        v10 = CFSTR(" location=2ndLine");
LABEL_16:
        objc_msgSend(v4, "appendString:", v10);
        break;
      default:
        objc_msgSend(v4, "appendFormat:", CFSTR(" location=%li"), self->_titleLocation);
        break;
    }
  }
  if (!CGRectIsNull(self->_centerItemsRect))
  {
    NSStringFromCGRect(self->_centerItemsRect);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" %s=%@"), "centerItemsRect", v11);

  }
  if (!CGRectIsNull(self->_floatingTabBarRect))
  {
    NSStringFromCGRect(self->_floatingTabBarRect);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" %s=%@"), "floatingTabBarRect", v12);

  }
  if (!CGRectIsNull(self->_trailingItemsRect))
  {
    NSStringFromCGRect(self->_trailingItemsRect);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" %s=%@"), "trailingItemsRect", v13);

  }
  if (!CGRectIsNull(self->_trailingStaticItemRect))
  {
    NSStringFromCGRect(self->_trailingStaticItemRect);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" %s=%@"), "trailingStaticItemRect", v14);

  }
  return v4;
}

- (CGRect)leadingRect
{
  CGRect v4;

  v4 = CGRectUnion(self->_backButtonRect, self->_leadingItemsRect);
  return CGRectUnion(self->_leadingStaticItemRect, v4);
}

- (CGRect)centerRect
{
  int64_t titleLocation;
  CGRect result;

  titleLocation = self->_titleLocation;
  switch(titleLocation)
  {
    case 1:
      result = self->_titleRect;
      break;
    case 3:
      result = self->_floatingTabBarRect;
      break;
    case 2:
      result = CGRectUnion(self->_floatingTabBarRect, self->_centerItemsRect);
      break;
    default:
      result = *(CGRect *)*(_QWORD *)&MEMORY[0x1E0C9D628];
      break;
  }
  return result;
}

- (CGRect)centerLine2Rect
{
  CGFloat *p_height;
  CGFloat *p_y;
  CGRect *p_titleRect;
  CGSize *p_size;
  double v6;
  double width;
  double x;
  double v9;
  CGRect result;

  p_height = (CGFloat *)(MEMORY[0x1E0C9D628] + 24);
  p_y = (CGFloat *)(MEMORY[0x1E0C9D628] + 8);
  p_titleRect = &self->_titleRect;
  if (self->_titleLocation == 3)
  {
    p_y = &self->_titleRect.origin.y;
    p_size = &self->_titleRect.size;
  }
  else
  {
    p_titleRect = (CGRect *)MEMORY[0x1E0C9D628];
    p_size = (CGSize *)(MEMORY[0x1E0C9D628] + 16);
  }
  if (self->_titleLocation == 3)
    p_height = &self->_titleRect.size.height;
  v6 = *p_height;
  width = p_size->width;
  x = p_titleRect->origin.x;
  v9 = *p_y;
  result.size.height = v6;
  result.size.width = width;
  result.origin.y = v9;
  result.origin.x = x;
  return result;
}

- (CGRect)trailingRect
{
  return CGRectUnion(self->_trailingItemsRect, self->_trailingStaticItemRect);
}

- (CGRect)titleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_titleRect.origin.x;
  y = self->_titleRect.origin.y;
  width = self->_titleRect.size.width;
  height = self->_titleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)titleLocation
{
  return self->_titleLocation;
}

- (void)setTitleLocation:(int64_t)a3
{
  self->_titleLocation = a3;
}

- (CGRect)centerItemsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_centerItemsRect.origin.x;
  y = self->_centerItemsRect.origin.y;
  width = self->_centerItemsRect.size.width;
  height = self->_centerItemsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)floatingTabBarRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_floatingTabBarRect.origin.x;
  y = self->_floatingTabBarRect.origin.y;
  width = self->_floatingTabBarRect.size.width;
  height = self->_floatingTabBarRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFloatingTabBarRect:(CGRect)a3
{
  self->_floatingTabBarRect = a3;
}

- (CGRect)trailingItemsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_trailingItemsRect.origin.x;
  y = self->_trailingItemsRect.origin.y;
  width = self->_trailingItemsRect.size.width;
  height = self->_trailingItemsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)trailingStaticItemRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_trailingStaticItemRect.origin.x;
  y = self->_trailingStaticItemRect.origin.y;
  width = self->_trailingStaticItemRect.size.width;
  height = self->_trailingStaticItemRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
