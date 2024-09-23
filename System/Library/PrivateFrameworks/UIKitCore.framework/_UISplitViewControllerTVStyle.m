@implementation _UISplitViewControllerTVStyle

- (double)defaultMaximumWidthForColumn:(int64_t)a3 withSize:(CGSize)a4 splitBehavior:(int64_t)a5
{
  double width;
  void *v8;

  width = a4.width;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a5, a4.width, a4.height);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISplitViewControllerPanelImpl.m"), 10051, CFSTR("Only valid for tvOS"));

  return width;
}

- (id)primaryBackgroundColor
{
  return 0;
}

- (double)maximumRubberbandingDistance
{
  return 0.0;
}

@end
