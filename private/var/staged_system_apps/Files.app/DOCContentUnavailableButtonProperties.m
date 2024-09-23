@implementation DOCContentUnavailableButtonProperties

+ (Class)implClass
{
  return (Class)objc_opt_class(UIContentUnavailableButtonProperties);
}

- (id)asUIKit
{
  return self->super._impl;
}

- (void)configurePlain
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DOCContentUnavailableButtonProperties asUIKit](self, "asUIKit"));
  objc_msgSend(v3, "setConfiguration:", v4);

}

- (UIAction)primaryAction
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DOCContentUnavailableButtonProperties asUIKit](self, "asUIKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "primaryAction"));

  return (UIAction *)v3;
}

- (void)setPrimaryAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DOCContentUnavailableButtonProperties asUIKit](self, "asUIKit"));
  objc_msgSend(v5, "setPrimaryAction:", v4);

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
  if (objc_msgSend(v8, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DOCContentUnavailableButtonProperties asUIKit](self, "asUIKit"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "configuration"));
    objc_msgSend(v7, "setTitle:", v8);

  }
}

@end
