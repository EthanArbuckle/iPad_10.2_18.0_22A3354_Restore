@implementation UIPresentationController

- (void)setBc_realSourceBarButtonItem:(id)a3
{
  objc_setAssociatedObject(self, "bc_realSourceBarButtonItem", a3, (char *)&dword_0 + 1);
}

- (UIBarButtonItem)bc_realSourceBarButtonItem
{
  return (UIBarButtonItem *)objc_getAssociatedObject(self, "bc_realSourceBarButtonItem");
}

- (void)setBc_fakeSourceView:(id)a3
{
  objc_setAssociatedObject(self, "bc_fakeSourceView", a3, (char *)&dword_0 + 1);
}

- (UIView)bc_fakeSourceView
{
  return (UIView *)objc_getAssociatedObject(self, "bc_fakeSourceView");
}

- (BOOL)im_isFullScreen
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIPresentationController presentingViewController](self, "presentingViewController"));

  if (!v3)
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/ViewControllers/UIPresentationController+IMAdditions.m", 41, (uint64_t)"-[UIPresentationController(IMAdditions) im_isFullScreen]", (uint64_t)"self.presentingViewController", CFSTR("View Controller is not presented yet so this question doesn't make sense"), v4, v5, v6, v8);
  if ((char *)-[UIPresentationController presentationStyle](self, "presentationStyle") == (char *)&dword_4 + 3)
    return -[UIPresentationController _isAdapted](self, "_isAdapted");
  else
    return 1;
}

- (void)bc_applyTraitOverridesWithOverrideUserInterfaceStyleFromViewController:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = objc_msgSend(a3, "overrideUserInterfaceStyle");
  if (v4)
  {
    v5 = v4;
    v6 = (id)objc_claimAutoreleasedReturnValue(-[UIPresentationController traitOverrides](self, "traitOverrides"));
    objc_msgSend(v6, "setUserInterfaceStyle:", v5);

  }
}

@end
