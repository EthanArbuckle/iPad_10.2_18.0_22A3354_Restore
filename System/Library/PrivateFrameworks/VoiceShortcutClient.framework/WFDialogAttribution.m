@implementation WFDialogAttribution

- (WFDialogAttribution)initWithTitle:(id)a3 icon:(id)a4
{
  return -[WFDialogAttribution initWithTitle:icon:workflowIcon:appBundleIdentifier:](self, "initWithTitle:icon:workflowIcon:appBundleIdentifier:", a3, a4, 0, 0);
}

- (WFDialogAttribution)initWithTitle:(id)a3 icon:(id)a4 workflowIcon:(id)a5
{
  return -[WFDialogAttribution initWithTitle:icon:workflowIcon:appBundleIdentifier:](self, "initWithTitle:icon:workflowIcon:appBundleIdentifier:", a3, a4, a5, 0);
}

- (WFDialogAttribution)initWithTitle:(id)a3 icon:(id)a4 workflowIcon:(id)a5 appBundleIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  WFDialogAttribution *v14;
  uint64_t v15;
  NSString *title;
  WFAppIcon *v17;
  WFIcon *icon;
  WFDialogAttribution *v19;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)WFDialogAttribution;
  v14 = -[WFDialogAttribution init](&v21, sel_init);
  if (v14)
  {
    if (objc_msgSend(v10, "length"))
    {
      v15 = objc_msgSend(v10, "copy");
    }
    else
    {
      WFLocalizedString(CFSTR("Shortcuts"));
      v15 = objc_claimAutoreleasedReturnValue();
    }
    title = v14->_title;
    v14->_title = (NSString *)v15;

    if (v11)
      v17 = (WFAppIcon *)v11;
    else
      v17 = -[WFAppIcon initWithBundleIdentifier:]([WFAppIcon alloc], "initWithBundleIdentifier:", CFSTR("com.apple.shortcuts"));
    icon = v14->_icon;
    v14->_icon = &v17->super;

    objc_storeStrong((id *)&v14->_workflowIcon, a5);
    objc_storeStrong((id *)&v14->_appBundleIdentifier, a6);
    v19 = v14;
  }

  return v14;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDialogAttribution title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDialogAttribution icon](self, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, title: %@, icon: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[WFDialogAttribution title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDialogAttribution icon](self, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDialogAttribution workflowIcon](self, "workflowIcon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithTitle:icon:workflowIcon:", v5, v6, v7);

  return v8;
}

- (WFDialogAttribution)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  WFDialogAttribution *v10;
  int v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("icon"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("workflowIcon"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appBundleIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = INIsHomepod();
  v10 = 0;
  if (v6)
    v11 = 1;
  else
    v11 = v9;
  if (v5 && v11)
  {
    self = -[WFDialogAttribution initWithTitle:icon:workflowIcon:appBundleIdentifier:](self, "initWithTitle:icon:workflowIcon:appBundleIdentifier:", v5, v6, v7, v8);
    v10 = self;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[WFDialogAttribution title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("title"));

  -[WFDialogAttribution icon](self, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("icon"));

  -[WFDialogAttribution workflowIcon](self, "workflowIcon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("workflowIcon"));

  -[WFDialogAttribution appBundleIdentifier](self, "appBundleIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("appBundleIdentifier"));

}

- (NSString)title
{
  return self->_title;
}

- (WFIcon)icon
{
  return self->_icon;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (WFWorkflowIcon)workflowIcon
{
  return self->_workflowIcon;
}

- (void)setWorkflowIcon:(id)a3
{
  objc_storeStrong((id *)&self->_workflowIcon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workflowIcon, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (WFDialogAttribution)attributionWithTitle:(id)a3 icon:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTitle:icon:", v7, v6);

  return (WFDialogAttribution *)v8;
}

+ (WFDialogAttribution)attributionWithAppBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  WFAppIcon *v8;
  void *v9;
  uint64_t v11;

  v4 = a3;
  v11 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v4, 1, &v11);
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "localizedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[WFAppIcon initWithBundleIdentifier:]([WFAppIcon alloc], "initWithBundleIdentifier:", v4);
    objc_msgSend(a1, "attributionWithTitle:icon:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return (WFDialogAttribution *)v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
