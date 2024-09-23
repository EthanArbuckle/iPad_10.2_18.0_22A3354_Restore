@implementation SBHWidget

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (int64_t)suggestionSource
{
  return self->_suggestionSource;
}

- (NSString)kind
{
  return self->_kind;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (NSString)containerBundleIdentifier
{
  NSString *containerBundleIdentifier;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  containerBundleIdentifier = self->_containerBundleIdentifier;
  if (!containerBundleIdentifier)
  {
    -[SBHWidget extensionBundleIdentifier](self, "extensionBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SBHContainingBundleIdentifierForWidgetWithBundleIdentifier(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSString *)objc_msgSend(v5, "copy");
    v7 = self->_containerBundleIdentifier;
    self->_containerBundleIdentifier = v6;

    containerBundleIdentifier = self->_containerBundleIdentifier;
  }
  return containerBundleIdentifier;
}

- (SBHWidget)initWithUniqueIdentifier:(id)a3 kind:(id)a4 extensionBundleIdentifier:(id)a5 containerBundleIdentifier:(id)a6 supportedGridSizeClasses:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SBHWidget *v17;
  uint64_t v18;
  NSString *uniqueIdentifier;
  uint64_t v20;
  NSString *kind;
  uint64_t v22;
  NSString *extensionBundleIdentifier;
  uint64_t v24;
  NSString *containerBundleIdentifier;
  uint64_t v26;
  SBHIconGridSizeClassSet *supportedGridSizeClasses;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)SBHWidget;
  v17 = -[SBHWidget init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    uniqueIdentifier = v17->_uniqueIdentifier;
    v17->_uniqueIdentifier = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    kind = v17->_kind;
    v17->_kind = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    extensionBundleIdentifier = v17->_extensionBundleIdentifier;
    v17->_extensionBundleIdentifier = (NSString *)v22;

    v24 = objc_msgSend(v15, "copy");
    containerBundleIdentifier = v17->_containerBundleIdentifier;
    v17->_containerBundleIdentifier = (NSString *)v24;

    v17->_suggestionSource = 0;
    v26 = objc_msgSend(v16, "copy");
    supportedGridSizeClasses = v17->_supportedGridSizeClasses;
    v17->_supportedGridSizeClasses = (SBHIconGridSizeClassSet *)v26;

  }
  return v17;
}

- (SBHWidget)initWithUniqueIdentifier:(id)a3 kind:(id)a4 extensionBundleIdentifier:(id)a5 containerBundleIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  SBHWidget *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  +[SBHIconGridSizeClassSet gridSizeClassSetForAllNonDefaultGridSizeClasses](SBHIconGridSizeClassSet, "gridSizeClassSetForAllNonDefaultGridSizeClasses");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SBHWidget initWithUniqueIdentifier:kind:extensionBundleIdentifier:containerBundleIdentifier:supportedGridSizeClasses:](self, "initWithUniqueIdentifier:kind:extensionBundleIdentifier:containerBundleIdentifier:supportedGridSizeClasses:", v13, v12, v11, v10, v14);

  return v15;
}

- (SBHWidget)initWithKind:(id)a3 extensionBundleIdentifier:(id)a4 containerBundleIdentifier:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  SBHWidget *v14;

  v8 = (void *)MEMORY[0x1E0CB3A28];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SBHWidget initWithUniqueIdentifier:kind:extensionBundleIdentifier:containerBundleIdentifier:](self, "initWithUniqueIdentifier:kind:extensionBundleIdentifier:containerBundleIdentifier:", v13, v11, v10, v9);

  return v14;
}

- (SBHWidget)initWithKind:(id)a3 extensionBundleIdentifier:(id)a4 containerBundleIdentifier:(id)a5 supportedGridSizeClasses:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  SBHWidget *v17;

  v10 = (void *)MEMORY[0x1E0CB3A28];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[SBHWidget initWithUniqueIdentifier:kind:extensionBundleIdentifier:containerBundleIdentifier:supportedGridSizeClasses:](self, "initWithUniqueIdentifier:kind:extensionBundleIdentifier:containerBundleIdentifier:supportedGridSizeClasses:", v16, v14, v13, v12, v11);

  return v17;
}

- (SBHWidget)initWithKind:(id)a3 extensionBundleIdentifier:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  SBHWidget *v11;

  v6 = (void *)MEMORY[0x1E0CB3A28];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SBHWidget initWithUniqueIdentifier:kind:extensionBundleIdentifier:containerBundleIdentifier:](self, "initWithUniqueIdentifier:kind:extensionBundleIdentifier:containerBundleIdentifier:", v10, v8, v7, 0);

  return v11;
}

- (SBHWidget)initWithKind:(id)a3 extensionBundleIdentifier:(id)a4 supportedGridSizeClasses:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  SBHWidget *v14;

  v8 = (void *)MEMORY[0x1E0CB3A28];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SBHWidget initWithUniqueIdentifier:kind:extensionBundleIdentifier:containerBundleIdentifier:supportedGridSizeClasses:](self, "initWithUniqueIdentifier:kind:extensionBundleIdentifier:containerBundleIdentifier:supportedGridSizeClasses:", v13, v11, v10, 0, v9);

  return v14;
}

- (NSString)displayName
{
  NSString *displayName;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  NSString *v10;
  void *v11;
  NSString *v12;
  NSString *v13;

  displayName = self->_displayName;
  if (displayName)
  {
LABEL_8:
    v10 = displayName;
    return v10;
  }
  -[SBHWidget extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBHContainingBundleRecordForWidgetWithBundleIdentifier(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "localizedName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(v5, "localizedShortName");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v8;

    v12 = (NSString *)objc_msgSend(v11, "copy");
    v13 = self->_displayName;
    self->_displayName = v12;

    displayName = self->_displayName;
    goto LABEL_8;
  }
  SBHBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("WAITING_ICON_LABEL"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)resetDisplayName
{
  NSString *displayName;

  displayName = self->_displayName;
  self->_displayName = 0;

}

- (CHSExtensionIdentity)extensionIdentity
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0D10038]);
  -[SBHWidget extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidget containerBundleIdentifier](self, "containerBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", v4, v5, 0);

  return (CHSExtensionIdentity *)v6;
}

- (BOOL)matches:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  -[SBHWidget extensionIdentity](self, "extensionIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extensionIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BSEqualObjects();

  if (v7)
  {
    -[SBHWidget kind](self, "kind");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "kind");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = BSEqualObjects();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)chsWidgetWithGridSizeClass:(id)a3 intent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  -[SBHWidget kind](self, "kind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidget extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidget containerBundleIdentifier](self, "containerBundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CHSWidgetFamilyForSBHIconGridSizeClass(v7);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10038]), "initWithExtensionBundleIdentifier:containerBundleIdentifier:deviceIdentifier:", v9, v10, 0);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D10148]), "initWithExtensionIdentity:kind:family:intent:activityIdentifier:", v12, v8, v11, v6, 0);

  return v13;
}

- (id)copyWithUniqueIdentifier
{
  id v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  v3 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (_QWORD *)objc_msgSend(v3, "initWithUniqueIdentifier:kind:extensionBundleIdentifier:containerBundleIdentifier:supportedGridSizeClasses:", v5, self->_kind, self->_extensionBundleIdentifier, self->_containerBundleIdentifier, self->_supportedGridSizeClasses);

  v6[6] = self->_suggestionSource;
  return v6;
}

- (id)copyWithSuggestionSource:(int64_t)a3
{
  id result;

  if (self->_suggestionSource == a3)
    return self;
  result = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUniqueIdentifier:kind:extensionBundleIdentifier:containerBundleIdentifier:supportedGridSizeClasses:", self->_uniqueIdentifier, self->_kind, self->_extensionBundleIdentifier, self->_containerBundleIdentifier, self->_supportedGridSizeClasses);
  *((_QWORD *)result + 6) = a3;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  SBHWidget *v4;
  void *v5;
  char isKindOfClass;
  SBHWidget *v7;
  char v8;

  v4 = (SBHWidget *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      if (BSEqualObjects()
        && BSEqualObjects()
        && BSEqualObjects()
        && self->_suggestionSource == v7->_suggestionSource)
      {
        v8 = BSEqualObjects();
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  SBHIconGridSizeClassSet *supportedGridSizeClasses;
  NSUInteger v7;

  v3 = -[NSString hash](self->_uniqueIdentifier, "hash");
  v4 = -[NSString hash](self->_kind, "hash") + v3;
  v5 = -[NSString hash](self->_extensionBundleIdentifier, "hash");
  supportedGridSizeClasses = self->_supportedGridSizeClasses;
  v7 = v4 + v5 + self->_suggestionSource;
  return v7 + -[SBHIconGridSizeClassSet hash](supportedGridSizeClasses, "hash");
}

- (NSString)description
{
  return (NSString *)-[SBHWidget descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHWidget succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBHWidget descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  -[SBHWidget succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_uniqueIdentifier, CFSTR("uniqueIdentifier"));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_kind, CFSTR("kind"));
  v7 = (id)objc_msgSend(v4, "appendObject:withName:", self->_extensionBundleIdentifier, CFSTR("extensionBundleIdentifier"));
  -[SBHWidget displayName](self, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v4, "appendObject:withName:", v8, CFSTR("displayName"));

  v10 = (id)objc_msgSend(v4, "appendInteger:withName:", self->_suggestionSource, CFSTR("suggestionSource"));
  -[SBHWidget supportedGridSizeClasses](self, "supportedGridSizeClasses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v4, "appendObject:withName:", v11, CFSTR("supportedGridSizeClasses"));

  return v4;
}

- (unint64_t)priorityForIcon:(id)a3
{
  return 1;
}

- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  -[SBHWidget containerBundleIdentifier](self, "containerBundleIdentifier", a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SBHGetApplicationIconImage(v10, 0, v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)iconSupportsConfiguration:(id)a3
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *uniqueIdentifier;
  id v5;

  uniqueIdentifier = self->_uniqueIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uniqueIdentifier, CFSTR("uniqueIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_kind, CFSTR("kind"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extensionBundleIdentifier, CFSTR("extensionBundleIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_suggestionSource, CFSTR("suggestionSource"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedGridSizeClasses, CFSTR("supportedGridSizeClasses"));

}

- (SBHWidget)initWithCoder:(id)a3
{
  id v4;
  SBHWidget *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *uniqueIdentifier;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *kind;
  void *v14;
  void *v15;
  uint64_t v16;
  NSString *extensionBundleIdentifier;
  void *v18;
  void *v19;
  uint64_t v20;
  SBHIconGridSizeClassSet *supportedGridSizeClasses;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SBHWidget;
  v5 = -[SBHWidget init](&v23, sel_init);
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("uniqueIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v8;

    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, CFSTR("kind"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    kind = v5->_kind;
    v5->_kind = (NSString *)v12;

    objc_opt_self();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, CFSTR("extensionBundleIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    extensionBundleIdentifier = v5->_extensionBundleIdentifier;
    v5->_extensionBundleIdentifier = (NSString *)v16;

    v5->_suggestionSource = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("suggestionSource"));
    objc_opt_self();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, CFSTR("supportedGridSizeClasses"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    supportedGridSizeClasses = v5->_supportedGridSizeClasses;
    v5->_supportedGridSizeClasses = (SBHIconGridSizeClassSet *)v20;

  }
  return v5;
}

- (SBHIconGridSizeClassSet)supportedGridSizeClasses
{
  return self->_supportedGridSizeClasses;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedGridSizeClasses, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
}

@end
