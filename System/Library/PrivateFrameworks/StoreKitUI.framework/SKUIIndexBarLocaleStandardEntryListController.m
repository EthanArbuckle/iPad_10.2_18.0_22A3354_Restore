@implementation SKUIIndexBarLocaleStandardEntryListController

- (SKUIIndexBarLocaleStandardEntryListController)initWithSKUIIndexBarEntryListViewElement:(id)a3
{
  id v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SKUIIndexBarLocaleStandardEntryListController *v14;
  SKUIIndexBarLocaleStandardEntryListController *v15;
  uint64_t v16;
  NSSet *requiredVisibilitySet;
  objc_super v19;

  v5 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUIIndexBarLocaleStandardEntryListController initWithSKUIIndexBarEntryListViewElement:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUIIndexBarLocaleStandardEntryListController;
  v14 = -[SKUIIndexBarLocaleStandardEntryListController init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_entryListViewElement, a3);
    SKUIRequiredVisibilitySetForLocalizedIndexedCollation();
    v16 = objc_claimAutoreleasedReturnValue();
    requiredVisibilitySet = v15->_requiredVisibilitySet;
    v15->_requiredVisibilitySet = (NSSet *)v16;

  }
  return v15;
}

- (int64_t)numberOfEntryDescriptors
{
  void *v2;
  void *v3;
  int64_t v4;

  objc_msgSend(MEMORY[0x1E0DC39C0], "currentCollation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionIndexTitles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)entryDescriptorAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0DC39C0], "currentCollation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionIndexTitles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v7);
  v9 = objc_msgSend(v8, "length");
  SKUIViewElementFontWithStyle(self->_style);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v10, 0, v9);
  SKUIViewElementPlainColorWithStyle(self->_style, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v11, 0, v9);
  +[SKUIIndexBarEntryDescriptor entryDescriptorWithAttributedString:](SKUIIndexBarEntryDescriptor, "entryDescriptorWithAttributedString:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSSet containsObject:](self->_requiredVisibilitySet, "containsObject:", v7))
    objc_msgSend(v12, "setVisibilityPriority:", 1000);

  return v12;
}

- (id)targetIndexBarEntryIDForEntryDescriptorAtIndex:(int64_t)a3 returningRelativeSectionIndex:(int64_t *)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a4)
    *a4 = 0;
  objc_msgSend(MEMORY[0x1E0DC39C0], "currentCollation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sectionForSectionIndexTitleAtIndex:", a3);

  objc_msgSend(MEMORY[0x1E0DC39C0], "currentCollation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionTitles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  SKUIIndexBarIDForLocaleStandardIndexBarEntrySectionTitle(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)reloadViewElementData
{
  IKViewElementStyle *v3;
  IKViewElementStyle *style;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUIIndexBarLocaleStandardEntryListController;
  -[SKUIIndexBarEntryListController reloadViewElementData](&v5, sel_reloadViewElementData);
  -[SKUIIndexBarEntryListViewElement style](self->_entryListViewElement, "style");
  v3 = (IKViewElementStyle *)objc_claimAutoreleasedReturnValue();
  style = self->_style;
  if (style != v3 && (-[IKViewElementStyle isEqual:](style, "isEqual:", v3) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_style, v3);
    -[SKUIIndexBarEntryListController _didInvalidate](self, "_didInvalidate");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_requiredVisibilitySet, 0);
  objc_storeStrong((id *)&self->_entryListViewElement, 0);
}

- (void)initWithSKUIIndexBarEntryListViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
