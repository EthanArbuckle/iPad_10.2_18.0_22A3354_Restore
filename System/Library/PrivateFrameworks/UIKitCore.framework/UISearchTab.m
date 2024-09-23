@implementation UISearchTab

- (UISearchTab)initWithViewControllerProvider:(id)a3
{
  id v4;
  UISearchTab *v5;
  UISearchTab *v6;
  objc_super v8;

  v4 = a3;
  if (qword_1ECD801B8 != -1)
    dispatch_once(&qword_1ECD801B8, &__block_literal_global_469);
  v8.receiver = self;
  v8.super_class = (Class)UISearchTab;
  v5 = -[UITab initWithTitle:image:identifier:viewControllerProvider:](&v8, sel_initWithTitle_image_identifier_viewControllerProvider_, _MergedGlobals_1206, qword_1ECD801B0, CFSTR("com.apple.UIKit.Search"), v4);
  v6 = v5;
  if (v5)
    -[UITab setPreferredPlacement:](v5, "setPreferredPlacement:", 4);

  return v6;
}

void __46__UISearchTab_initWithViewControllerProvider___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  _UINSLocalizedStringWithDefaultValue(CFSTR("Search"), CFSTR("Search"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1206;
  _MergedGlobals_1206 = v0;

  +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("magnifyingglass"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECD801B0;
  qword_1ECD801B0 = v2;

}

@end
