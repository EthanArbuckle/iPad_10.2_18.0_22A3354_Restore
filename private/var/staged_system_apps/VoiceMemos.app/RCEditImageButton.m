@implementation RCEditImageButton

+ (id)buttonWithType:(int64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___RCEditImageButton;
  v4 = objc_msgSendSuper2(&v8, "buttonWithType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_customButtonConfigurationUpdateHandler"));
  objc_msgSend(v5, "setConfigurationUpdateHandler:", v6);

  objc_msgSend(v5, "setShowsLargeContentViewer:", 1);
  return v5;
}

+ (id)_customButtonConfigurationUpdateHandler
{
  return &stru_1001AC538;
}

@end
