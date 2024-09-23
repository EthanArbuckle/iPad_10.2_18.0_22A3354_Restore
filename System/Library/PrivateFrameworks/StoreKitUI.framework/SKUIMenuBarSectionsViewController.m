@implementation SKUIMenuBarSectionsViewController

- (SKUIMenuBarSectionsViewController)initWithLayoutStyle:(int64_t)a3
{
  SKUIMenuBarSectionsViewController *result;
  objc_super v6;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMenuBarSectionsViewController initWithLayoutStyle:].cold.1();
  }
  v6.receiver = self;
  v6.super_class = (Class)SKUIMenuBarSectionsViewController;
  result = -[SKUIStorePageSectionsViewController initWithLayoutStyle:](&v6, sel_initWithLayoutStyle_, a3);
  if (result)
    result->_numberOfIterationsForShelfPageSections = 1;
  return result;
}

- (id)defaultSectionForComponent:(id)a3
{
  id v4;
  SKUIMenuBarTemplateShelfPageSectionConfiguration *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "componentType") == 22)
  {
    v5 = -[SKUIMenuBarTemplateShelfPageSectionConfiguration initWithNumberOfIterations:]([SKUIMenuBarTemplateShelfPageSectionConfiguration alloc], "initWithNumberOfIterations:", -[SKUIMenuBarSectionsViewController numberOfIterationsForShelfPageSections](self, "numberOfIterationsForShelfPageSections"));
    v6 = (objc_class *)objc_opt_class();
    objc_msgSend(v4, "viewElement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isDynamicContainer");

    if (v8)
      v6 = (objc_class *)objc_opt_class();
    v9 = (void *)objc_msgSend([v6 alloc], "initWithPageComponent:configuration:", v4, v5);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)numberOfIterationsForShelfPageSections
{
  return self->_numberOfIterationsForShelfPageSections;
}

- (void)setNumberOfIterationsForShelfPageSections:(unint64_t)a3
{
  self->_numberOfIterationsForShelfPageSections = a3;
}

- (void)initWithLayoutStyle:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIMenuBarSectionsViewController initWithLayoutStyle:]";
}

@end
