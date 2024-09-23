@implementation UIShortcutActivity

- (UIShortcutActivity)initWithPartial:(id)a3
{
  id v4;
  void *v5;
  UIShortcutActivity *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  objc_msgSend(v4, "applicationExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)UIShortcutActivity;
  v6 = -[UIApplicationExtensionActivity initWithApplicationExtension:](&v12, sel_initWithApplicationExtension_, v5);

  if (v6)
  {
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIShortcutActivity setName:](v6, "setName:", v7);

    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIShortcutActivity setIdentifier:](v6, "setIdentifier:", v8);

    objc_msgSend(v4, "iconImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIShortcutActivity setIconImage:](v6, "setIconImage:", v9);

    objc_msgSend(v4, "sortValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIShortcutActivity setSortValue:](v6, "setSortValue:", v10);

  }
  return v6;
}

- (UIShortcutActivity)initWithApplicationExtension:(id)a3 partialShortcutWithName:(id)a4 identifier:(id)a5 image:(id)a6 sortValue:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  UIShortcutActivity *v16;
  UIShortcutActivity *v17;
  objc_super v19;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)UIShortcutActivity;
  v16 = -[UIApplicationExtensionActivity initWithApplicationExtension:](&v19, sel_initWithApplicationExtension_, a3);
  v17 = v16;
  if (v16)
  {
    -[UIShortcutActivity setName:](v16, "setName:", v12);
    -[UIShortcutActivity setIdentifier:](v17, "setIdentifier:", v13);
    -[UIShortcutActivity setIconImage:](v17, "setIconImage:", v14);
    -[UIShortcutActivity setSortValue:](v17, "setSortValue:", v15);
  }

  return v17;
}

- (UIShortcutActivity)initWithApplicationExtension:(id)a3 singleUseToken:(id)a4 photosAssetIdentifiers:(id)a5
{
  id v8;
  id v9;
  UIShortcutActivity *v10;
  UIShortcutActivity *v11;
  UIShortcutActivity *v12;

  v8 = a4;
  v9 = a5;
  v10 = -[UIApplicationExtensionActivity initWithApplicationExtension:](self, "initWithApplicationExtension:", a3);
  v11 = v10;
  if (v10)
  {
    -[UIShortcutActivity setSingleUseToken:](v10, "setSingleUseToken:", v8);
    -[UIShortcutActivity setPhotosAssetIdentifiers:](v11, "setPhotosAssetIdentifiers:", v9);
    v12 = v11;
  }

  return v11;
}

- (int64_t)_defaultSortGroup
{
  return 6;
}

- (id)_actionImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class();
  -[UIShortcutActivity iconImage](self, "iconImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIActivity contentSizeCategory](self, "contentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_actionImageForActionRepresentationImage:contentSizeCategory:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)activityType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[UIApplicationExtensionActivity applicationExtension](self, "applicationExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIShortcutActivity identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_isServiceExtension
{
  return 1;
}

- (void)prepareWithActivityExtensionItemData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "extensionItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  -[UIShortcutActivity singleUseToken](self, "singleUseToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("ActionExtensionWorkflowToken"));

  -[UIShortcutActivity photosAssetIdentifiers](self, "photosAssetIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[UIShortcutActivity photosAssetIdentifiers](self, "photosAssetIdentifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("WFPhotosAssetIdentifiers"));

  }
  objc_msgSend(v5, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUserInfo:", v8);

  objc_msgSend(v4, "setExtensionItems:", v5);
  v13.receiver = self;
  v13.super_class = (Class)UIShortcutActivity;
  -[UIApplicationExtensionActivity prepareWithActivityExtensionItemData:](&v13, sel_prepareWithActivityExtensionItemData_, v4);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSNumber)sortValue
{
  return self->_sortValue;
}

- (void)setSortValue:(id)a3
{
  objc_storeStrong((id *)&self->_sortValue, a3);
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (void)setIconImage:(id)a3
{
  objc_storeStrong((id *)&self->_iconImage, a3);
}

- (NSString)singleUseToken
{
  return self->_singleUseToken;
}

- (void)setSingleUseToken:(id)a3
{
  objc_storeStrong((id *)&self->_singleUseToken, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSArray)photosAssetIdentifiers
{
  return self->_photosAssetIdentifiers;
}

- (void)setPhotosAssetIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_photosAssetIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photosAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_singleUseToken, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_sortValue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
