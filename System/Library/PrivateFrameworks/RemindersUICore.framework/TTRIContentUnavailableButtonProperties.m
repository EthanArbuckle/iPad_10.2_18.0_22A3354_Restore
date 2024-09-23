@implementation TTRIContentUnavailableButtonProperties

+ (Class)implClass
{
  return (Class)objc_opt_class();
}

- (id)asUIKit
{
  return self->super._impl;
}

- (UIAction)primaryAction
{
  void *v2;
  void *v3;

  -[TTRIContentUnavailableButtonProperties asUIKit](self, "asUIKit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIAction *)v3;
}

- (void)setPrimaryAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TTRIContentUnavailableButtonProperties asUIKit](self, "asUIKit");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrimaryAction:", v4);

}

@end
