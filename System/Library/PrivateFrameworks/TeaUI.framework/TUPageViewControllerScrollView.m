@implementation TUPageViewControllerScrollView

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v4;

  if (a3 == 2)
  {
    -[TUPageViewControllerScrollView accessibilityDelegate](self, "accessibilityDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityHandleRequestToGoForewardForPageViewControllerScrollView:", self);
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    -[TUPageViewControllerScrollView accessibilityDelegate](self, "accessibilityDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityHandleRequestToGoBackForPageViewControllerScrollView:", self);
LABEL_5:

    return 1;
  }
  return 0;
}

- (TUPageViewControllerScrollViewAccessibilityDelegate)accessibilityDelegate
{
  return (TUPageViewControllerScrollViewAccessibilityDelegate *)objc_loadWeakRetained((id *)&self->_accessibilityDelegate);
}

- (void)setAccessibilityDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_accessibilityDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessibilityDelegate);
}

@end
