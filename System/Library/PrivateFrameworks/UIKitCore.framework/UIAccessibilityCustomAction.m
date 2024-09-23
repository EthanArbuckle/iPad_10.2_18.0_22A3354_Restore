@implementation UIAccessibilityCustomAction

- (UIAccessibilityCustomAction)initWithName:(NSString *)name target:(id)target selector:(SEL)selector
{
  NSString *v8;
  id v9;
  UIAccessibilityCustomAction *v10;
  UIAccessibilityCustomAction *v11;
  objc_super v13;

  v8 = name;
  v9 = target;
  v13.receiver = self;
  v13.super_class = (Class)UIAccessibilityCustomAction;
  v10 = -[UIAccessibilityCustomAction init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[UIAccessibilityCustomAction setName:](v10, "setName:", v8);
    -[UIAccessibilityCustomAction setTarget:](v11, "setTarget:", v9);
    -[UIAccessibilityCustomAction setSelector:](v11, "setSelector:", selector);
  }

  return v11;
}

- (void)setTarget:(id)target
{
  objc_storeWeak(&self->_target, target);
}

- (void)setSelector:(SEL)selector
{
  self->_selector = selector;
}

- (void)setName:(NSString *)name
{
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;

  v4 = name;
  if (!v4)
  {
    v5 = objc_opt_class();
    _UIAccessibilityReportNilNameErroneouslyProvided(v5);
    v4 = &stru_1E16EDF20;
  }
  v7 = (__CFString *)v4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v4);
  -[UIAccessibilityCustomAction setAttributedName:](self, "setAttributedName:", v6);

}

- (void)setAttributedName:(NSAttributedString *)attributedName
{
  NSAttributedString *v4;
  uint64_t v5;
  NSAttributedString *v6;
  NSAttributedString *v7;
  NSAttributedString *v8;

  v4 = attributedName;
  if (!v4)
  {
    v5 = objc_opt_class();
    _UIAccessibilityReportNilNameErroneouslyProvided(v5);
    v4 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E16EDF20);
  }
  v8 = v4;
  v6 = (NSAttributedString *)-[NSAttributedString copy](v4, "copy");
  v7 = self->_attributedName;
  self->_attributedName = v6;

}

- (UIAccessibilityCustomAction)init
{
  objc_super v4;

  if (dyld_program_sdk_at_least())
  {

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Please use the designated initializer"));
    return 0;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)UIAccessibilityCustomAction;
    return -[UIAccessibilityCustomAction init](&v4, sel_init);
  }
}

- (UIAccessibilityCustomAction)initWithName:(NSString *)name image:(UIImage *)image target:(id)target selector:(SEL)selector
{
  NSString *v10;
  UIImage *v11;
  id v12;
  UIAccessibilityCustomAction *v13;
  UIAccessibilityCustomAction *v14;
  objc_super v16;

  v10 = name;
  v11 = image;
  v12 = target;
  v16.receiver = self;
  v16.super_class = (Class)UIAccessibilityCustomAction;
  v13 = -[UIAccessibilityCustomAction init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    -[UIAccessibilityCustomAction setName:](v13, "setName:", v10);
    -[UIAccessibilityCustomAction setImage:](v14, "setImage:", v11);
    -[UIAccessibilityCustomAction setTarget:](v14, "setTarget:", v12);
    -[UIAccessibilityCustomAction setSelector:](v14, "setSelector:", selector);
  }

  return v14;
}

- (UIAccessibilityCustomAction)initWithAttributedName:(NSAttributedString *)attributedName image:(UIImage *)image target:(id)target selector:(SEL)selector
{
  NSAttributedString *v10;
  UIImage *v11;
  id v12;
  UIAccessibilityCustomAction *v13;
  UIAccessibilityCustomAction *v14;
  objc_super v16;

  v10 = attributedName;
  v11 = image;
  v12 = target;
  v16.receiver = self;
  v16.super_class = (Class)UIAccessibilityCustomAction;
  v13 = -[UIAccessibilityCustomAction init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    -[UIAccessibilityCustomAction setAttributedName:](v13, "setAttributedName:", v10);
    -[UIAccessibilityCustomAction setImage:](v14, "setImage:", v11);
    -[UIAccessibilityCustomAction setTarget:](v14, "setTarget:", v12);
    -[UIAccessibilityCustomAction setSelector:](v14, "setSelector:", selector);
  }

  return v14;
}

- (UIAccessibilityCustomAction)initWithName:(NSString *)name image:(UIImage *)image actionHandler:(UIAccessibilityCustomActionHandler)actionHandler
{
  NSString *v8;
  UIImage *v9;
  UIAccessibilityCustomActionHandler v10;
  UIAccessibilityCustomAction *v11;
  UIAccessibilityCustomAction *v12;
  objc_super v14;

  v8 = name;
  v9 = image;
  v10 = actionHandler;
  v14.receiver = self;
  v14.super_class = (Class)UIAccessibilityCustomAction;
  v11 = -[UIAccessibilityCustomAction init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[UIAccessibilityCustomAction setName:](v11, "setName:", v8);
    -[UIAccessibilityCustomAction setImage:](v12, "setImage:", v9);
    -[UIAccessibilityCustomAction setActionHandler:](v12, "setActionHandler:", v10);
  }

  return v12;
}

- (UIAccessibilityCustomAction)initWithAttributedName:(NSAttributedString *)attributedName image:(UIImage *)image actionHandler:(UIAccessibilityCustomActionHandler)actionHandler
{
  NSAttributedString *v8;
  UIImage *v9;
  UIAccessibilityCustomActionHandler v10;
  UIAccessibilityCustomAction *v11;
  UIAccessibilityCustomAction *v12;
  objc_super v14;

  v8 = attributedName;
  v9 = image;
  v10 = actionHandler;
  v14.receiver = self;
  v14.super_class = (Class)UIAccessibilityCustomAction;
  v11 = -[UIAccessibilityCustomAction init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[UIAccessibilityCustomAction setAttributedName:](v11, "setAttributedName:", v8);
    -[UIAccessibilityCustomAction setImage:](v12, "setImage:", v9);
    -[UIAccessibilityCustomAction setActionHandler:](v12, "setActionHandler:", v10);
  }

  return v12;
}

- (UIAccessibilityCustomAction)initWithAttributedName:(NSAttributedString *)attributedName target:(id)target selector:(SEL)selector
{
  NSAttributedString *v8;
  id v9;
  UIAccessibilityCustomAction *v10;
  UIAccessibilityCustomAction *v11;
  objc_super v13;

  v8 = attributedName;
  v9 = target;
  v13.receiver = self;
  v13.super_class = (Class)UIAccessibilityCustomAction;
  v10 = -[UIAccessibilityCustomAction init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[UIAccessibilityCustomAction setAttributedName:](v10, "setAttributedName:", v8);
    -[UIAccessibilityCustomAction setTarget:](v11, "setTarget:", v9);
    -[UIAccessibilityCustomAction setSelector:](v11, "setSelector:", selector);
  }

  return v11;
}

- (UIAccessibilityCustomAction)initWithName:(NSString *)name actionHandler:(UIAccessibilityCustomActionHandler)actionHandler
{
  NSString *v6;
  UIAccessibilityCustomActionHandler v7;
  UIAccessibilityCustomAction *v8;
  UIAccessibilityCustomAction *v9;
  objc_super v11;

  v6 = name;
  v7 = actionHandler;
  v11.receiver = self;
  v11.super_class = (Class)UIAccessibilityCustomAction;
  v8 = -[UIAccessibilityCustomAction init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[UIAccessibilityCustomAction setName:](v8, "setName:", v6);
    -[UIAccessibilityCustomAction setActionHandler:](v9, "setActionHandler:", v7);
  }

  return v9;
}

- (UIAccessibilityCustomAction)initWithAttributedName:(NSAttributedString *)attributedName actionHandler:(UIAccessibilityCustomActionHandler)actionHandler
{
  NSAttributedString *v6;
  UIAccessibilityCustomActionHandler v7;
  UIAccessibilityCustomAction *v8;
  UIAccessibilityCustomAction *v9;
  objc_super v11;

  v6 = attributedName;
  v7 = actionHandler;
  v11.receiver = self;
  v11.super_class = (Class)UIAccessibilityCustomAction;
  v8 = -[UIAccessibilityCustomAction init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[UIAccessibilityCustomAction setAttributedName:](v8, "setAttributedName:", v6);
    -[UIAccessibilityCustomAction setActionHandler:](v9, "setActionHandler:", v7);
  }

  return v9;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[UIAccessibilityCustomAction attributedName](self, "attributedName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(UIImage *)image
{
  objc_storeStrong((id *)&self->_image, image);
}

- (NSAttributedString)attributedName
{
  return self->_attributedName;
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (SEL)selector
{
  return self->_selector;
}

- (UIAccessibilityCustomActionHandler)actionHandler
{
  return self->_actionHandler;
}

- (void)setActionHandler:(UIAccessibilityCustomActionHandler)actionHandler
{
  objc_setProperty_nonatomic_copy(self, a2, actionHandler, 40);
}

- (NSString)category
{
  return self->_category;
}

- (void)setCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_attributedName, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
