@implementation _UITabElement

+ (id)_searchElement
{
  _UITabElement *v2;
  void *v3;
  void *v4;
  _UITabElement *v5;

  v2 = [_UITabElement alloc];
  _UINSLocalizedStringWithDefaultValue(CFSTR("Search"), CFSTR("Search"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("magnifyingglass"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UITabElement initWithIdentifier:title:image:](v2, "initWithIdentifier:title:image:", CFSTR("com.apple.UIKit.Search"), v3, v4);

  -[_UITab _setTabBarPlacement:](v5, "_setTabBarPlacement:", 1);
  return v5;
}

- (void)_setViewController:(id)a3
{
  id WeakRetained;
  void *v5;
  BOOL v6;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->__viewController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->__viewController, obj);
    v6 = -[UITab _isBridgedItem](self, "_isBridgedItem");
    v5 = obj;
    if (!v6)
    {
      -[UITab _updateLinkedTabBarItem](self, "_updateLinkedTabBarItem");
      v5 = obj;
    }
  }

}

- (BOOL)_isElement
{
  return 1;
}

- (_UITabElement)initWithIdentifier:(id)a3 title:(id)a4 image:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UITabElement;
  return -[UITab initWithTitle:image:identifier:viewControllerProvider:](&v6, sel_initWithTitle_image_identifier_viewControllerProvider_, a4, a5, a3, 0);
}

- (UIViewController)_viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->__viewController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__viewController);
}

@end
