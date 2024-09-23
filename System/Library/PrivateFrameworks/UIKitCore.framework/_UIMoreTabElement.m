@implementation _UIMoreTabElement

- (_UIMoreTabElement)init
{
  UITabBarItem *v3;
  void *v4;
  void *v5;
  _UIMoreTabElement *v6;
  objc_super v8;

  v3 = -[UITabBarItem initWithTabBarSystemItem:tag:]([UITabBarItem alloc], "initWithTabBarSystemItem:tag:", 0, 0);
  -[UITabBarItem title](v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITabBarItem image](v3, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)_UIMoreTabElement;
  v6 = -[_UITabElement initWithIdentifier:title:image:](&v8, sel_initWithIdentifier_title_image_, CFSTR("More"), v4, v5);

  return v6;
}

- (BOOL)_isMoreTab
{
  return 1;
}

- (BOOL)_isBridgedItem
{
  return 1;
}

@end
