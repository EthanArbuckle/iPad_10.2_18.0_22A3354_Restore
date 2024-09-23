@implementation UIView

- (void)setTui_hostedSubviewsMap:(id)a3
{
  objc_setAssociatedObject(self, off_2CACD8, a3, (char *)&dword_0 + 3);
}

- (NSDictionary)tui_hostedSubviewsMap
{
  return (NSDictionary *)objc_getAssociatedObject(self, off_2CACD8);
}

- (id)tui_querySectionUUID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIView tui_renderViewHost](self, "tui_renderViewHost"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "tui_querySectionUUID"));

  return v3;
}

- (id)tui_querySectionUID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIView tui_renderViewHost](self, "tui_renderViewHost"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "tui_querySectionUID"));

  return v3;
}

@end
