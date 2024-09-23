@implementation SKUIShareTemplateActivityViewController

- (SKUIShareTemplateActivityViewController)initWithTemplateElement:(id)a3 clientContext:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  SKUIShareTemplateActivityViewController *v11;
  SKUIShareTemplateActivityViewController *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  objc_super v18;
  _QWORD v19[7];

  v19[6] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIShareTemplateActivityViewController initWithTemplateElement:clientContext:].cold.1();
  }
  -[SKUIShareTemplateActivityViewController _activityItemsWithTemplateElement:clientContext:](self, "_activityItemsWithTemplateElement:clientContext:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIShareTemplateActivityViewController _applicationActivitiesWithTemplateElement:clientContext:](self, "_applicationActivitiesWithTemplateElement:clientContext:", v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)SKUIShareTemplateActivityViewController;
  v11 = -[SKUIShareTemplateActivityViewController initWithActivityItems:applicationActivities:](&v18, sel_initWithActivityItems_applicationActivities_, v9, v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_clientContext, a4);
    objc_storeStrong((id *)&v12->_templateElement, a3);
    v13 = *MEMORY[0x1E0CEB1B8];
    v19[0] = *MEMORY[0x1E0CEB1A8];
    v19[1] = v13;
    v14 = *MEMORY[0x1E0CEB210];
    v19[2] = *MEMORY[0x1E0CEB1F8];
    v19[3] = v14;
    v15 = *MEMORY[0x1E0CEB228];
    v19[4] = *MEMORY[0x1E0CEB220];
    v19[5] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIShareTemplateActivityViewController setExcludedActivityTypes:](v12, "setExcludedActivityTypes:", v16);

  }
  return v12;
}

- (id)_titleForActivity:(id)a3
{
  id v4;
  void *v5;
  SKUIClientContext *clientContext;

  v4 = a3;
  if ((id)*MEMORY[0x1E0CEB1C0] == v4)
  {
    clientContext = self->_clientContext;
    if (clientContext)
      -[SKUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("ACTIVITY_COPY_LINK"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("ACTIVITY_COPY_LINK"), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_activityItemsWithTemplateElement:(id)a3 clientContext:(id)a4
{
  id v5;
  id v6;
  SKUIShareTemplateImageItemProvider *v7;
  SKUIShareTemplateTextItemProvider *v8;
  SKUIShareTemplateURLItemProvider *v9;
  void *v10;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  v7 = -[SKUIShareTemplateImageItemProvider initWithTemplateElement:]([SKUIShareTemplateImageItemProvider alloc], "initWithTemplateElement:", v6);
  v8 = -[SKUIShareTemplateTextItemProvider initWithTemplateElement:clientContext:]([SKUIShareTemplateTextItemProvider alloc], "initWithTemplateElement:clientContext:", v6, v5);

  v9 = -[SKUIShareTemplateURLItemProvider initWithTemplateElement:]([SKUIShareTemplateURLItemProvider alloc], "initWithTemplateElement:", v6);
  v12[0] = v8;
  v12[1] = v9;
  v12[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_applicationActivitiesWithTemplateElement:(id)a3 clientContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  char v10;
  char v11;
  void *v12;
  SKUIShareTemplateActivity *v13;
  uint64_t i;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = CFSTR("wishlist");
  v8 = CFSTR("gift");
  v9 = 0;
  v16[1] = v8;
  v10 = 1;
  do
  {
    v11 = v10;
    objc_msgSend(v5, "activityForShareSheetActivityType:", v16[v9]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = -[SKUIShareTemplateActivity initWithActivityViewElement:clientContext:]([SKUIShareTemplateActivity alloc], "initWithActivityViewElement:clientContext:", v12, v6);
      objc_msgSend(v7, "addObject:", v13);

    }
    v10 = 0;
    v9 = 1;
  }
  while ((v11 & 1) != 0);
  for (i = 1; i != -1; --i)

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithTemplateElement:clientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIShareTemplateActivityViewController initWithTemplateElement:clientContext:]";
}

@end
