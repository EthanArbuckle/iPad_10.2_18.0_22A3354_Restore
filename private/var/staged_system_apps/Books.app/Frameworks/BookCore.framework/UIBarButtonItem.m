@implementation UIBarButtonItem

+ (id)bc_readingExperienceBarItem:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 4, 3, 17.0));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageWithConfiguration:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 4, 2, 17.0));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageWithConfiguration:", v12));

  v14 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithImage:landscapeImagePhone:style:target:action:", v11, v13, 0, v8, a5);
  return v14;
}

@end
