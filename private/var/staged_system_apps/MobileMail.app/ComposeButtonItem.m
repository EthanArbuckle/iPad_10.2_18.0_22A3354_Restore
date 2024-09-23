@implementation ComposeButtonItem

+ (id)composeButtonItemWithTarget:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSBundle *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", MFImageGlyphCompose));
  v6 = objc_msgSend(objc_alloc((Class)a1), "initWithImage:style:target:action:", v5, 0, v4, "composeButtonPressed:");
  objc_msgSend(v6, "setLongPressTarget:action:", v4, "composeButtonLongPressed:");
  objc_msgSend(v6, "setSpringLoaded:", 1);
  v7 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(a1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("COMPOSE_NEW_MESSAGE"), &stru_100531B00, CFSTR("Main")));
  objc_msgSend(v6, "setTitle:", v9);

  return v6;
}

@end
