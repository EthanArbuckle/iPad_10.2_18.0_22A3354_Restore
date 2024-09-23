@implementation SBHApplicationWidgetCollection

- (SBHApplicationWidgetCollection)initWithCustomImage:(id)a3 iconBackgroundColor:(id)a4 displayName:(id)a5 galleryItems:(id)a6 vendorName:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  SBHApplicationWidgetCollection *v20;

  v12 = (void *)MEMORY[0x1E0CB3A28];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v12, "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "UUIDString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[SBHApplicationWidgetCollection initWithCustomImage:iconBackgroundColor:displayName:galleryItems:vendorName:uniqueIdentifier:](self, "initWithCustomImage:iconBackgroundColor:displayName:galleryItems:vendorName:uniqueIdentifier:", v17, v16, v15, v14, v13, v19);

  return v20;
}

- (SBHApplicationWidgetCollection)initWithCustomImage:(id)a3 iconBackgroundColor:(id)a4 displayName:(id)a5 galleryItems:(id)a6 vendorName:(id)a7 uniqueIdentifier:(id)a8
{
  id v15;
  id v16;
  id v17;
  SBHApplicationWidgetCollection *v18;
  SBHApplicationWidgetCollection *v19;
  uint64_t v20;
  NSString *uniqueIdentifier;
  id v23;

  v23 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v18 = -[SBHApplicationWidgetCollection initWithIcon:galleryItems:vendorName:](self, "initWithIcon:galleryItems:vendorName:", 0, a6, a7);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_customImage, a3);
    objc_storeStrong((id *)&v19->_customImageBackgroundColor, a4);
    objc_storeStrong((id *)&v19->_containerName, a5);
    v20 = objc_msgSend(v17, "copy");
    uniqueIdentifier = v19->_uniqueIdentifier;
    v19->_uniqueIdentifier = (NSString *)v20;

  }
  return v19;
}

- (SBHApplicationWidgetCollection)initWithIcon:(id)a3 galleryItems:(id)a4 vendorName:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  SBHApplicationWidgetCollection *v14;

  v8 = (void *)MEMORY[0x1E0CB3A28];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SBHApplicationWidgetCollection initWithIcon:galleryItems:vendorName:uniqueIdentifier:](self, "initWithIcon:galleryItems:vendorName:uniqueIdentifier:", v11, v10, v9, v13);

  return v14;
}

- (SBHApplicationWidgetCollection)initWithIcon:(id)a3 galleryItems:(id)a4 vendorName:(id)a5 uniqueIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SBHApplicationWidgetCollection *v15;
  SBHApplicationWidgetCollection *v16;
  uint64_t v17;
  NSArray *widgetDescriptors;
  uint64_t v19;
  NSString *vendorName;
  uint64_t v21;
  NSString *uniqueIdentifier;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SBHApplicationWidgetCollection;
  v15 = -[SBHApplicationWidgetCollection init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_icon, a3);
    v17 = objc_msgSend(v12, "copy");
    widgetDescriptors = v16->_widgetDescriptors;
    v16->_widgetDescriptors = (NSArray *)v17;

    v19 = objc_msgSend(v13, "copy");
    vendorName = v16->_vendorName;
    v16->_vendorName = (NSString *)v19;

    v21 = objc_msgSend(v14, "copy");
    uniqueIdentifier = v16->_uniqueIdentifier;
    v16->_uniqueIdentifier = (NSString *)v21;

  }
  return v16;
}

- (NSString)description
{
  return (NSString *)-[SBHApplicationWidgetCollection descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (NSString)displayName
{
  id v3;
  SBLeafIcon *icon;
  void *v5;
  void *v6;
  void *v7;

  if (self->_containerName)
  {
    -[SBHApplicationWidgetCollection containerName](self, "containerName");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    icon = self->_icon;
    if (icon)
    {
      -[SBIcon displayName](icon, "displayName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        v3 = v5;
      }
      else
      {
        -[NSArray firstObject](self->_widgetDescriptors, "firstObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "sbh_appName");
        v3 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v3 = 0;
    }
  }
  return (NSString *)v3;
}

- (NSString)collectionIdentifier
{
  void *v2;
  NSString *collectionIdentifier;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v13;
  NSString *v14;
  NSString *v15;

  collectionIdentifier = self->_collectionIdentifier;
  if (!collectionIdentifier)
  {
    v5 = -[SBHApplicationWidgetCollection isDisfavored](self, "isDisfavored");
    -[SBHApplicationWidgetCollection containerName](self, "containerName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {

    }
    else
    {
      -[SBHApplicationWidgetCollection iconImageApplicationBundleIdentifier](self, "iconImageApplicationBundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        v13 = (void *)MEMORY[0x1E0CB3940];
        -[SBLeafIcon leafIdentifier](self->_icon, "leafIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v9;
        if (!v9)
        {
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "UUIDString");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v13, "stringWithFormat:", CFSTR("APP_COLLECTION:'%@'-isDisfavored:%d"), v11, v5);
        v14 = (NSString *)objc_claimAutoreleasedReturnValue();
        v15 = self->_collectionIdentifier;
        self->_collectionIdentifier = v14;

        if (v9)
          goto LABEL_7;
        goto LABEL_6;
      }
    }
    v8 = (void *)MEMORY[0x1E0CB3940];
    -[SBHApplicationWidgetCollection containerName](self, "containerName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHApplicationWidgetCollection iconImageApplicationBundleIdentifier](self, "iconImageApplicationBundleIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("FRAMEWORK_COLLECTION:'%@'-'%@'-isDisfavored:%d"), v9, v2, v5);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    v11 = self->_collectionIdentifier;
    self->_collectionIdentifier = v10;
LABEL_6:

LABEL_7:
    collectionIdentifier = self->_collectionIdentifier;
  }
  return collectionIdentifier;
}

- (unint64_t)indexOfWidgetDescriptorMatchingDescriptor:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(a3, "sbh_galleryItemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHApplicationWidgetCollection widgetDescriptors](self, "widgetDescriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__SBHApplicationWidgetCollection_indexOfWidgetDescriptorMatchingDescriptor___block_invoke;
  v9[3] = &unk_1E8D88700;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v9);

  return v7;
}

uint64_t __76__SBHApplicationWidgetCollection_indexOfWidgetDescriptorMatchingDescriptor___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "sbh_galleryItemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)containsWidgetDescriptorMatchingDescriptor:(id)a3
{
  return -[SBHApplicationWidgetCollection indexOfWidgetDescriptorMatchingDescriptor:](self, "indexOfWidgetDescriptorMatchingDescriptor:", a3) != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHApplicationWidgetCollection succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBHApplicationWidgetCollection descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBHApplicationWidgetCollection *v11;

  v4 = a3;
  -[SBHApplicationWidgetCollection succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__SBHApplicationWidgetCollection_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8D84EF0;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __72__SBHApplicationWidgetCollection_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("icon"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), CFSTR("decriptors"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  if (self->_customImage && self->_customImageBackgroundColor)
    v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithCustomImage:iconBackgroundColor:displayName:galleryItems:vendorName:uniqueIdentifier:", self->_customImage, self->_customImageBackgroundColor, self->_containerName, self->_widgetDescriptors, self->_vendorName, self->_uniqueIdentifier);
  else
    v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIcon:galleryItems:vendorName:uniqueIdentifier:", self->_icon, self->_widgetDescriptors, self->_vendorName, self->_uniqueIdentifier);
  v5 = v4;
  objc_msgSend(v4, "setContainerName:", self->_containerName);
  objc_msgSend(v5, "setIconImageApplicationBundleIdentifier:", self->_iconImageApplicationBundleIdentifier);
  objc_msgSend(v5, "setDisfavored:", self->_disfavored);
  return v5;
}

- (SBLeafIcon)icon
{
  return self->_icon;
}

- (UIImage)customImage
{
  return self->_customImage;
}

- (UIColor)customImageBackgroundColor
{
  return self->_customImageBackgroundColor;
}

- (NSArray)widgetDescriptors
{
  return self->_widgetDescriptors;
}

- (void)setWidgetDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)filteredWidgetDescriptors
{
  return self->_filteredWidgetDescriptors;
}

- (void)setFilteredWidgetDescriptors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)vendorName
{
  return self->_vendorName;
}

- (BOOL)isDisfavored
{
  return self->_disfavored;
}

- (void)setDisfavored:(BOOL)a3
{
  self->_disfavored = a3;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)containerName
{
  return self->_containerName;
}

- (void)setContainerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)iconImageApplicationBundleIdentifier
{
  return self->_iconImageApplicationBundleIdentifier;
}

- (void)setIconImageApplicationBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconImageApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_containerName, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_filteredWidgetDescriptors, 0);
  objc_storeStrong((id *)&self->_widgetDescriptors, 0);
  objc_storeStrong((id *)&self->_customImageBackgroundColor, 0);
  objc_storeStrong((id *)&self->_customImage, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_collectionIdentifier, 0);
}

@end
