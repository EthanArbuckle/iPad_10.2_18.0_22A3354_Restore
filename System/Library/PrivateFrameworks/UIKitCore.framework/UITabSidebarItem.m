@implementation UITabSidebarItem

- (id)_initWithRequest:(id)a3
{
  id v4;
  UITabSidebarItem *v5;
  UITab *v6;
  UIAction *v7;
  void *v8;
  UIListContentConfiguration *v9;
  UIBackgroundConfiguration *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  UITab *tab;
  UITab *v20;
  UIAction *action;
  UIAction *v22;
  UIListContentConfiguration *defaultContentConfiguration;
  UIListContentConfiguration *v24;
  UIBackgroundConfiguration *defaultBackgroundConfiguration;
  UIBackgroundConfiguration *v26;
  uint64_t v27;
  UICellConfigurationState *configurationState;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)UITabSidebarItem;
  v5 = -[UITabSidebarItem init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "tab");
    v6 = (UITab *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "action");
    v7 = (UIAction *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_cell");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultContentConfiguration");
    v9 = (UIListContentConfiguration *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultBackgroundConfiguration");
    v10 = (UIBackgroundConfiguration *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[UITab title](v6, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIListContentConfiguration setText:](v9, "setText:", v11);

      -[UITab subtitle](v6, "subtitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIListContentConfiguration setSecondaryText:](v9, "setSecondaryText:", v12);

      if ((objc_msgSend(v4, "_isHeader") & 1) == 0)
      {
        -[UITab image](v6, "image");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIListContentConfiguration setImage:](v9, "setImage:", v13);

      }
      if (!-[UITab _isAction](v6, "_isAction"))
        goto LABEL_10;
    }
    else
    {
      if (!v7)
      {
LABEL_10:
        tab = v5->_tab;
        v5->_tab = v6;
        v20 = v6;

        action = v5->_action;
        v5->_action = v7;
        v22 = v7;

        objc_storeStrong((id *)&v5->_contentConfiguration, v9);
        objc_storeStrong((id *)&v5->_backgroundConfiguration, v10);
        defaultContentConfiguration = v5->_defaultContentConfiguration;
        v5->_defaultContentConfiguration = v9;
        v24 = v9;

        defaultBackgroundConfiguration = v5->_defaultBackgroundConfiguration;
        v5->_defaultBackgroundConfiguration = v10;
        v26 = v10;

        objc_msgSend(v8, "configurationState");
        v27 = objc_claimAutoreleasedReturnValue();
        configurationState = v5->_configurationState;
        v5->_configurationState = (UICellConfigurationState *)v27;

        goto LABEL_11;
      }
      -[UIMenuElement title](v7, "title");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIListContentConfiguration setText:](v9, "setText:", v14);

      -[UIMenuElement subtitle](v7, "subtitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIListContentConfiguration setSecondaryText:](v9, "setSecondaryText:", v15);

      -[UIMenuElement image](v7, "image");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIListContentConfiguration setImage:](v9, "setImage:", v16);

    }
    +[UIColor tintColor](UIColor, "tintColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIListContentConfiguration textProperties](v9, "textProperties");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setColor:", v17);

    goto LABEL_10;
  }
LABEL_11:

  return v5;
}

- (id)_initWithItem:(id)a3
{
  id *v4;
  UITabSidebarItem *v5;
  uint64_t v6;
  UITab *tab;
  uint64_t v8;
  UIAction *action;
  uint64_t v10;
  UICellConfigurationState *configurationState;
  uint64_t v12;
  UIContentConfiguration *contentConfiguration;
  uint64_t v14;
  UIBackgroundConfiguration *backgroundConfiguration;
  uint64_t v16;
  NSArray *accessories;
  objc_super v19;

  v4 = (id *)a3;
  v19.receiver = self;
  v19.super_class = (Class)UITabSidebarItem;
  v5 = -[UITabSidebarItem init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "tab");
    v6 = objc_claimAutoreleasedReturnValue();
    tab = v5->_tab;
    v5->_tab = (UITab *)v6;

    objc_msgSend(v4, "action");
    v8 = objc_claimAutoreleasedReturnValue();
    action = v5->_action;
    v5->_action = (UIAction *)v8;

    objc_msgSend(v4, "configurationState");
    v10 = objc_claimAutoreleasedReturnValue();
    configurationState = v5->_configurationState;
    v5->_configurationState = (UICellConfigurationState *)v10;

    objc_msgSend(v4, "contentConfiguration");
    v12 = objc_claimAutoreleasedReturnValue();
    contentConfiguration = v5->_contentConfiguration;
    v5->_contentConfiguration = (UIContentConfiguration *)v12;

    objc_msgSend(v4, "backgroundConfiguration");
    v14 = objc_claimAutoreleasedReturnValue();
    backgroundConfiguration = v5->_backgroundConfiguration;
    v5->_backgroundConfiguration = (UIBackgroundConfiguration *)v14;

    objc_msgSend(v4, "accessories");
    v16 = objc_claimAutoreleasedReturnValue();
    accessories = v5->_accessories;
    v5->_accessories = (NSArray *)v16;

    objc_storeStrong((id *)&v5->_defaultContentConfiguration, v4[1]);
    objc_storeStrong((id *)&v5->_defaultBackgroundConfiguration, v4[2]);
  }

  return v5;
}

+ (id)itemFromRequest:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithRequest:", v4);

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initWithItem:", self);
}

- (UIContentConfiguration)contentConfiguration
{
  return (UIContentConfiguration *)(id)-[UIContentConfiguration copyWithZone:](self->_contentConfiguration, "copyWithZone:", 0);
}

- (UIBackgroundConfiguration)backgroundConfiguration
{
  return (UIBackgroundConfiguration *)(id)-[UIBackgroundConfiguration copy](self->_backgroundConfiguration, "copy");
}

- (NSArray)accessories
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", self->_accessories, 1);
}

- (id)defaultContentConfiguration
{
  UIListContentConfiguration *defaultContentConfiguration;
  void *v3;
  void *v4;

  defaultContentConfiguration = self->_defaultContentConfiguration;
  -[UITabSidebarItem configurationState](self, "configurationState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIListContentConfiguration updatedConfigurationForState:](defaultContentConfiguration, "updatedConfigurationForState:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)defaultBackgroundConfiguration
{
  UIBackgroundConfiguration *defaultBackgroundConfiguration;
  void *v3;
  void *v4;

  defaultBackgroundConfiguration = self->_defaultBackgroundConfiguration;
  -[UITabSidebarItem configurationState](self, "configurationState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBackgroundConfiguration updatedConfigurationForState:](defaultBackgroundConfiguration, "updatedConfigurationForState:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  UITabSidebarItem *v5;
  UITabSidebarItem *v6;
  UITab *tab;
  UITab *v8;
  UITab *v9;
  UITab *v10;
  _BOOL4 v11;
  BOOL v12;
  UIAction *action;
  UITab *v14;
  _BOOL4 v15;
  UIContentConfiguration *contentConfiguration;
  UITab *v17;
  _BOOL4 v18;
  UIBackgroundConfiguration *backgroundConfiguration;
  UITab *v20;
  _BOOL4 v21;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = (UITabSidebarItem *)v4;
      v6 = v5;
      if (v5 == self)
      {
LABEL_32:
        v12 = 1;
        goto LABEL_33;
      }
      tab = v5->_tab;
      v8 = self->_tab;
      v9 = tab;
      if (v8 == v9)
      {

      }
      else
      {
        v10 = v9;
        if (!v8 || !v9)
          goto LABEL_28;
        v11 = -[UITab isEqual:](v8, "isEqual:", v9);

        if (!v11)
          goto LABEL_29;
      }
      action = v6->_action;
      v8 = self->_action;
      v14 = action;
      if (v8 == v14)
      {

      }
      else
      {
        v10 = v14;
        if (!v8 || !v14)
          goto LABEL_28;
        v15 = -[UITab isEqual:](v8, "isEqual:", v14);

        if (!v15)
          goto LABEL_29;
      }
      contentConfiguration = v6->_contentConfiguration;
      v8 = self->_contentConfiguration;
      v17 = contentConfiguration;
      if (v8 == v17)
      {

      }
      else
      {
        v10 = v17;
        if (!v8 || !v17)
          goto LABEL_28;
        v18 = -[UITab isEqual:](v8, "isEqual:", v17);

        if (!v18)
          goto LABEL_29;
      }
      backgroundConfiguration = v6->_backgroundConfiguration;
      v8 = self->_backgroundConfiguration;
      v20 = backgroundConfiguration;
      if (v8 == v20)
      {

LABEL_31:
        if ((UIEqual(self->_accessories, v6->_accessories) & 1) != 0)
          goto LABEL_32;
LABEL_29:
        v12 = 0;
LABEL_33:

        goto LABEL_34;
      }
      v10 = v20;
      if (v8 && v20)
      {
        v21 = -[UITab isEqual:](v8, "isEqual:", v20);

        if (!v21)
          goto LABEL_29;
        goto LABEL_31;
      }
LABEL_28:

      goto LABEL_29;
    }
  }
  v12 = 0;
LABEL_34:

  return v12;
}

- (id)_resolvedAccessories
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  char v11;
  UICellAccessoryOutlineDisclosure *v12;
  void *v13;
  int v14;
  UICellAccessoryReorder *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  UICellAccessoryLabel *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[UITabSidebarItem accessories](self, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v22 = objc_opt_class();
  v23 = objc_opt_class();
  v24 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "count", v22, v23);
  if (v6 - 1 < 0)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    v7 = v6;
    v8 = 0;
    do
    {
      objc_msgSend(v4, "objectAtIndex:", --v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "containsObject:", objc_opt_class()))
      {
        objc_msgSend(v4, "removeObjectAtIndex:", v7);
      }
      else
      {
        objc_opt_class();
        v8 |= objc_opt_isKindOfClass();
      }

    }
    while (v7 > 0);
  }
  -[UITabSidebarItem tab](self, "tab");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "_isGroup");

  if ((v11 & 1) != 0)
  {
    v12 = objc_alloc_init(UICellAccessoryOutlineDisclosure);
    -[UICellAccessoryOutlineDisclosure setStyle:](v12, "setStyle:", 1);
LABEL_15:
    objc_msgSend(v4, "addObject:", v12);

    goto LABEL_16;
  }
  -[UITabSidebarItem tab](self, "tab");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "_canBeReordered");

  if (v14)
  {
    v15 = objc_alloc_init(UICellAccessoryReorder);
    -[UICellAccessory setDisplayedState:](v15, "setDisplayedState:", 1);
    -[UICellAccessoryReorder setShowsVerticalSeparator:](v15, "setShowsVerticalSeparator:", 0);
    objc_msgSend(v4, "addObject:", v15);

  }
  -[UITabSidebarItem tab](self, "tab");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "allowsHiding");

  if (v17)
  {
    v12 = objc_alloc_init(UICellAccessoryMultiselect);
    -[UICellAccessory setDisplayedState:](v12, "setDisplayedState:", 1);
    goto LABEL_15;
  }
LABEL_16:
  -[UITabSidebarItem tab](self, "tab");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "badgeValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!((objc_msgSend(v19, "length") == 0) | v8 & 1))
  {
    v20 = -[UICellAccessoryLabel initWithText:]([UICellAccessoryLabel alloc], "initWithText:", v19);
    objc_msgSend(v4, "addObject:", v20);

  }
  return v4;
}

- (void)setContentConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setBackgroundConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setAccessories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (UITab)tab
{
  return self->_tab;
}

- (UIAction)action
{
  return self->_action;
}

- (UICellConfigurationState)configurationState
{
  return self->_configurationState;
}

- (void)setConfigurationState:(id)a3
{
  objc_storeStrong((id *)&self->_configurationState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationState, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_tab, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_backgroundConfiguration, 0);
  objc_storeStrong((id *)&self->_contentConfiguration, 0);
  objc_storeStrong((id *)&self->_defaultBackgroundConfiguration, 0);
  objc_storeStrong((id *)&self->_defaultContentConfiguration, 0);
}

@end
