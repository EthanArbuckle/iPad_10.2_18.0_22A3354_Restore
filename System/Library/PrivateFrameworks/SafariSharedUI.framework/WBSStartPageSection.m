@implementation WBSStartPageSection

- (int64_t)itemType
{
  return self->_itemType;
}

- (id)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)usesLargeTitle
{
  return self->_usesLargeTitle;
}

- (BOOL)showsTopSeparator
{
  return self->_showsTopSeparator;
}

- (BOOL)expandsModally
{
  return self->_expandsModally;
}

- (NSArray)actions
{
  return self->_actions;
}

- (UIMenu)titleMenu
{
  return self->_titleMenu;
}

- (UIImage)icon
{
  return self->_icon;
}

- (WBSStartPageBanner)contentBanner
{
  return self->_contentBanner;
}

- (WBSStartPageBanner)banner
{
  return self->_banner;
}

- (BOOL)isEqual:(id)a3
{
  WBSStartPageSection *v4;
  WBSStartPageSection *v5;
  char v6;

  v4 = (WBSStartPageSection *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (WBSIsEqual())
        v6 = WBSIsEqual();
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentBanner, 0);
  objc_storeStrong(&self->_dropHandler, 0);
  objc_storeStrong(&self->_dropOperationProvider, 0);
  objc_storeStrong(&self->_dragItemProvider, 0);
  objc_storeStrong(&self->_contextMenuDismissHandler, 0);
  objc_storeStrong(&self->_contextMenuCommitHandler, 0);
  objc_storeStrong(&self->_contextMenuProvider, 0);
  objc_storeStrong((id *)&self->_titleMenu, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_banner, 0);
  objc_storeStrong((id *)&self->_supplementaryAction, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_identifier, 0);
  objc_storeStrong(&self->_configurationProvider, 0);
}

+ (id)bannerSectionWithIdentifier:(id)a3 banner:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  WBSStartPageSectionIdentifierTitle(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bannerSectionWithIdentifier:title:banner:", v7, v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)bannerSectionWithIdentifier:(id)a3 title:(id)a4 banner:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc((Class)a1);
  v16[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (_QWORD *)objc_msgSend(v11, "initWithIdentifier:title:actions:banner:itemType:itemIdentifiers:configurationProvider:", v10, v9, MEMORY[0x1E0C9AA60], 0, 0, v12, 0);

  v14 = (void *)v13[21];
  v13[21] = v8;

  return v13;
}

+ (id)iconSectionWithIdentifier:(id)a3 title:(id)a4 actions:(id)a5 banner:(id)a6 supplementaryAction:(id)a7 identifiers:(id)a8 configurationProvider:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD *v22;
  void *v23;

  v15 = a7;
  v16 = a9;
  v17 = a8;
  v18 = a6;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  v22 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:title:actions:banner:itemType:itemIdentifiers:configurationProvider:", v21, v20, v19, v18, 2, v17, v16);

  v23 = (void *)v22[7];
  v22[7] = v15;

  return v22;
}

- (WBSStartPageSection)initWithIdentifier:(id)a3 title:(id)a4 actions:(id)a5 banner:(id)a6 itemType:(int64_t)a7 itemIdentifiers:(id)a8 configurationProvider:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  WBSStartPageSection *v21;
  uint64_t v22;
  NSArray *actions;
  uint64_t v24;
  id configurationProvider;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSArray *itemIdentifiers;
  uint64_t v31;
  NSString *title;
  id contextMenuProvider;
  id contextMenuCommitHandler;
  id contextMenuDismissHandler;
  id dragItemProvider;
  id dropOperationProvider;
  WBSStartPageSection *v38;
  id v40;
  objc_super v41;

  v40 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = a9;
  v41.receiver = self;
  v41.super_class = (Class)WBSStartPageSection;
  v21 = -[WBSStartPageSection init](&v41, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v17, "copy");
    actions = v21->_actions;
    v21->_actions = (NSArray *)v22;

    objc_storeStrong((id *)&v21->_banner, a6);
    v24 = MEMORY[0x1A85D45E4](v20);
    configurationProvider = v21->_configurationProvider;
    v21->_configurationProvider = (id)v24;

    objc_storeStrong(&v21->_identifier, a3);
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithArray:", v19);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count");
    if (v27 != objc_msgSend(v19, "count"))
    {
      v28 = WBS_LOG_CHANNEL_PREFIXStartPage();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[WBSStartPageSection initWithIdentifier:title:actions:banner:itemType:itemIdentifiers:configurationProvider:].cold.1((uint64_t)v40, v28);
    }
    objc_msgSend(v26, "array");
    v29 = objc_claimAutoreleasedReturnValue();
    itemIdentifiers = v21->_itemIdentifiers;
    v21->_itemIdentifiers = (NSArray *)v29;

    v21->_itemType = a7;
    *(_OWORD *)&v21->_numberOfRowsVisibleWhenCollapsed = xmmword_1A84E3740;
    v31 = objc_msgSend(v16, "copy");
    title = v21->_title;
    v21->_title = (NSString *)v31;

    contextMenuProvider = v21->_contextMenuProvider;
    v21->_contextMenuProvider = &__block_literal_global_41;

    contextMenuCommitHandler = v21->_contextMenuCommitHandler;
    v21->_contextMenuCommitHandler = &__block_literal_global_4_1;

    contextMenuDismissHandler = v21->_contextMenuDismissHandler;
    v21->_contextMenuDismissHandler = &__block_literal_global_6_1;

    dragItemProvider = v21->_dragItemProvider;
    v21->_dragItemProvider = &__block_literal_global_8_1;

    dropOperationProvider = v21->_dropOperationProvider;
    v21->_dropOperationProvider = &__block_literal_global_10_0;

    v38 = v21;
  }

  return v21;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = objc_msgSend(self->_identifier, "hash");
  return -[NSString hash](self->_title, "hash") ^ v3;
}

- (void)setDropOperationProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)setDropHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void)setDragItemProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setContextMenuProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)setContextMenuDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)setContextMenuCommitHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSArray)itemIdentifiers
{
  return self->_itemIdentifiers;
}

- (int64_t)numberOfRowsVisibleWhenCollapsedInCompactWidth
{
  int64_t result;

  result = self->_numberOfRowsVisibleWhenCollapsedInCompactWidth;
  if (!result)
    return self->_numberOfRowsVisibleWhenCollapsed;
  return result;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (id)siteIconConfigurationProvider
{
  return (id)MEMORY[0x1A85D45E4](self->_configurationProvider, a2);
}

- (id)effectiveItemIdentifiersWithMaximumCount:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[NSArray safari_prefixWithMaxLength:](self->_itemIdentifiers, "safari_prefixWithMaxLength:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_supplementaryAction && objc_msgSend(v5, "count") < a3)
  {
    +[WBSStartPageSectionSupplementaryItemIdentifier identifierForAction:](WBSStartPageSectionSupplementaryItemIdentifier, "identifierForAction:", self->_supplementaryAction);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayByAddingObject:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  return v6;
}

- (int64_t)effectiveItemIdentifiersCount
{
  int64_t result;

  result = -[NSArray count](self->_itemIdentifiers, "count");
  if (self->_supplementaryAction)
    ++result;
  return result;
}

+ (id)footerSectionWithIdentifier:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)a1);
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(v8, "initWithIdentifier:title:actions:banner:itemType:itemIdentifiers:configurationProvider:", v7, &stru_1E5449658, v9, 0, 1, v10, 0);
  return v11;
}

+ (id)headingSectionWithIdentifier:(id)a3 title:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)a1);
  v9 = (void *)objc_msgSend(v8, "initWithIdentifier:title:actions:banner:itemType:itemIdentifiers:configurationProvider:", v7, v6, MEMORY[0x1E0C9AA60], 0, 0, 0, 0);

  return v9;
}

+ (id)separatorSectionWithIdentifier:(id)a3
{
  id v4;
  id v5;
  _BYTE *v6;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v6 = (_BYTE *)objc_msgSend(v5, "initWithIdentifier:title:actions:banner:itemType:itemIdentifiers:configurationProvider:", v4, &stru_1E5449658, MEMORY[0x1E0C9AA60], 0, 0, 0, 0);

  v6[17] = 1;
  return v6;
}

+ (id)actionSectionWithIdentifier:(id)a3 actions:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:title:actions:banner:itemType:itemIdentifiers:configurationProvider:", v7, &stru_1E5449658, v6, 0, 0, 0, 0);

  return v8;
}

+ (id)iconSectionWithIdentifier:(id)a3 actions:(id)a4 banner:(id)a5 supplementaryAction:(id)a6 identifiers:(id)a7 configurationProvider:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  WBSStartPageSectionIdentifierTitle(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "iconSectionWithIdentifier:title:actions:banner:supplementaryAction:identifiers:configurationProvider:", v19, v20, v18, v17, v16, v15, v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)cardSectionWithIdentifier:(id)a3 title:(id)a4 actions:(id)a5 banner:(id)a6 identifiers:(id)a7 configurationProvider:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:title:actions:banner:itemType:itemIdentifiers:configurationProvider:", v19, v18, v17, v16, 3, v15, v14);

  objc_msgSend(v20, "setNumberOfRowsVisibleWhenCollapsed:", 3);
  return v20;
}

+ (id)cardSectionWithIdentifier:(id)a3 actions:(id)a4 banner:(id)a5 identifiers:(id)a6 configurationProvider:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  WBSStartPageSectionIdentifierTitle(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cardSectionWithIdentifier:title:actions:banner:identifiers:configurationProvider:", v16, v17, v15, v14, v13, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)attributedRichLinkSectionWithIdentifier:(id)a3 title:(id)a4 actions:(id)a5 banner:(id)a6 identifiers:(id)a7 configurationProvider:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:title:actions:banner:itemType:itemIdentifiers:configurationProvider:", v19, v18, v17, v16, 4, v15, v14);

  return v20;
}

+ (id)attributedRichLinkSectionWithIdentifier:(id)a3 actions:(id)a4 banner:(id)a5 identifiers:(id)a6 configurationProvider:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  WBSStartPageSectionIdentifierTitle(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "attributedRichLinkSectionWithIdentifier:title:actions:banner:identifiers:configurationProvider:", v16, v17, v15, v14, v13, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)squareRichLinkSectionWithIdentifier:(id)a3 title:(id)a4 actions:(id)a5 banner:(id)a6 identifiers:(id)a7 configurationProvider:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:title:actions:banner:itemType:itemIdentifiers:configurationProvider:", v19, v18, v17, v16, 6, v15, v14);

  return v20;
}

+ (id)listSectionWithIdentifier:(id)a3 title:(id)a4 actions:(id)a5 banner:(id)a6 identifiers:(id)a7 configurationProvider:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:title:actions:banner:itemType:itemIdentifiers:configurationProvider:", v19, v18, v17, v16, 5, v15, v14);

  return v20;
}

+ (id)listSectionWithIdentifier:(id)a3 actions:(id)a4 banner:(id)a5 identifiers:(id)a6 configurationProvider:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  WBSStartPageSectionIdentifierTitle(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "listSectionWithIdentifier:title:actions:banner:identifiers:configurationProvider:", v16, v17, v15, v14, v13, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

uint64_t __110__WBSStartPageSection_initWithIdentifier_title_actions_banner_itemType_itemIdentifiers_configurationProvider___block_invoke()
{
  return 0;
}

uint64_t __110__WBSStartPageSection_initWithIdentifier_title_actions_banner_itemType_itemIdentifiers_configurationProvider___block_invoke_4()
{
  return 0;
}

uint64_t __110__WBSStartPageSection_initWithIdentifier_title_actions_banner_itemType_itemIdentifiers_configurationProvider___block_invoke_5()
{
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; identifier = %@; title = %@"),
    objc_opt_class(),
    self,
    self->_identifier,
    self->_title);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_actions)
    objc_msgSend(v3, "appendFormat:", CFSTR("; actions = %@"), self->_actions);
  if (self->_banner)
    objc_msgSend(v4, "appendFormat:", CFSTR("; banner = %@"), self->_banner);
  objc_msgSend(v4, "appendFormat:", CFSTR("; numberOfRowsVisibleWhenCollapsed = %zd"),
    self->_numberOfRowsVisibleWhenCollapsed);
  objc_msgSend(v4, "appendFormat:", CFSTR("; numberOfRowsVisibleWhenCollapsedInCompactWidth = %zd"),
    -[WBSStartPageSection numberOfRowsVisibleWhenCollapsedInCompactWidth](self, "numberOfRowsVisibleWhenCollapsedInCompactWidth"));
  if (self->_titleMenu)
    objc_msgSend(v4, "appendString:", CFSTR("; has-title-menu"));
  if (self->_contextMenuProvider)
  {
    objc_msgSend(v4, "appendString:", CFSTR("; items-have-context-menu"));
    if (self->_contextMenuProvider)
      objc_msgSend(v4, "appendString:", CFSTR("; items-have-preview"));
  }
  objc_msgSend(v4, "appendString:", CFSTR(">"));
  if (self->_contentBanner)
    objc_msgSend(v4, "appendFormat:", CFSTR("\n\t%@"), self->_contentBanner);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_itemIdentifiers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "appendFormat:", CFSTR("\n\t%@"), *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)siteCardConfigurationProvider
{
  return (id)MEMORY[0x1A85D45E4](self->_configurationProvider, a2);
}

- (id)attributedRichLinkConfigurationProvider
{
  return (id)MEMORY[0x1A85D45E4](self->_configurationProvider, a2);
}

- (id)squareRichLinkConfigurationProvider
{
  return (id)MEMORY[0x1A85D45E4](self->_configurationProvider, a2);
}

- (id)siteRowConfigurationProvider
{
  return (id)MEMORY[0x1A85D45E4](self->_configurationProvider, a2);
}

- (WBSAction)supplementaryAction
{
  return self->_supplementaryAction;
}

- (int64_t)numberOfRowsVisibleWhenCollapsed
{
  return self->_numberOfRowsVisibleWhenCollapsed;
}

- (void)setNumberOfRowsVisibleWhenCollapsed:(int64_t)a3
{
  self->_numberOfRowsVisibleWhenCollapsed = a3;
}

- (void)setNumberOfRowsVisibleWhenCollapsedInCompactWidth:(int64_t)a3
{
  self->_numberOfRowsVisibleWhenCollapsedInCompactWidth = a3;
}

- (void)setUsesLargeTitle:(BOOL)a3
{
  self->_usesLargeTitle = a3;
}

- (void)setShowsTopSeparator:(BOOL)a3
{
  self->_showsTopSeparator = a3;
}

- (void)setExpandsModally:(BOOL)a3
{
  self->_expandsModally = a3;
}

- (int64_t)maximumNumberOfPages
{
  return self->_maximumNumberOfPages;
}

- (void)setMaximumNumberOfPages:(int64_t)a3
{
  self->_maximumNumberOfPages = a3;
}

- (void)setTitleMenu:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)contextMenuProvider
{
  return self->_contextMenuProvider;
}

- (id)contextMenuCommitHandler
{
  return self->_contextMenuCommitHandler;
}

- (id)contextMenuDismissHandler
{
  return self->_contextMenuDismissHandler;
}

- (id)dragItemProvider
{
  return self->_dragItemProvider;
}

- (id)dropOperationProvider
{
  return self->_dropOperationProvider;
}

- (id)dropHandler
{
  return self->_dropHandler;
}

- (void)initWithIdentifier:(uint64_t)a1 title:(NSObject *)a2 actions:banner:itemType:itemIdentifiers:configurationProvider:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1A840B000, a2, OS_LOG_TYPE_ERROR, "%@ section has duplicate item identifiers.", (uint8_t *)&v2, 0xCu);
}

@end
