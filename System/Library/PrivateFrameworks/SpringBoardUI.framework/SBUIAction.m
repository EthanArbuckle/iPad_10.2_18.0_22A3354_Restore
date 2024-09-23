@implementation SBUIAction

- (SBUIAction)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 badgeView:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SBUIAction *v17;
  uint64_t v18;
  NSString *title;
  uint64_t v20;
  NSString *subtitle;
  uint64_t v22;
  UIImage *image;
  uint64_t v24;
  id handler;
  objc_super v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)SBUIAction;
  v17 = -[SBUIAction init](&v27, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    title = v17->_title;
    v17->_title = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    subtitle = v17->_subtitle;
    v17->_subtitle = (NSString *)v20;

    objc_msgSend(v14, "_imageThatSuppressesAccessibilityHairlineThickening");
    v22 = objc_claimAutoreleasedReturnValue();
    image = v17->_image;
    v17->_image = (UIImage *)v22;

    objc_storeStrong((id *)&v17->_badgeView, a6);
    v24 = objc_msgSend(v16, "copy");
    handler = v17->_handler;
    v17->_handler = (id)v24;

  }
  return v17;
}

- (SBUIAction)initWithTitle:(id)a3 subtitle:(id)a4 systemImageName:(id)a5 badgeView:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SBUIAction *v17;
  uint64_t v18;
  NSString *title;
  uint64_t v20;
  NSString *subtitle;
  uint64_t v22;
  NSString *systemImageName;
  uint64_t v24;
  id handler;
  objc_super v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)SBUIAction;
  v17 = -[SBUIAction init](&v27, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    title = v17->_title;
    v17->_title = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    subtitle = v17->_subtitle;
    v17->_subtitle = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    systemImageName = v17->_systemImageName;
    v17->_systemImageName = (NSString *)v22;

    objc_storeStrong((id *)&v17->_badgeView, a6);
    v24 = objc_msgSend(v16, "copy");
    handler = v17->_handler;
    v17->_handler = (id)v24;

  }
  return v17;
}

- (SBUIAction)init
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCA98];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("%s is not a valid initializer. You must call -[%@ initWithTitle:subtitle:image:badgeView:handler:]."), "-[SBUIAction init]", v6);

  return -[SBUIAction initWithTitle:subtitle:image:badgeView:handler:](self, "initWithTitle:subtitle:image:badgeView:handler:", 0, 0, 0, 0, 0);
}

- (SBUIAction)initWithTitle:(id)a3 subtitle:(id)a4 image:(id)a5 handler:(id)a6
{
  return -[SBUIAction initWithTitle:subtitle:image:badgeView:handler:](self, "initWithTitle:subtitle:image:badgeView:handler:", a3, a4, a5, 0, a6);
}

- (SBUIAction)initWithTitle:(id)a3 subtitle:(id)a4 handler:(id)a5
{
  return -[SBUIAction initWithTitle:subtitle:image:badgeView:handler:](self, "initWithTitle:subtitle:image:badgeView:handler:", a3, a4, 0, 0, a5);
}

- (SBUIAction)initWithTitle:(id)a3 handler:(id)a4
{
  return -[SBUIAction initWithTitle:subtitle:image:badgeView:handler:](self, "initWithTitle:subtitle:image:badgeView:handler:", a3, 0, 0, 0, a4);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (UIImage)image
{
  return self->_image;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (UIView)badgeView
{
  return self->_badgeView;
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
