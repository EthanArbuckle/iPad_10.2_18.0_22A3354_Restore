@implementation SKUIIndexBarEntryListController

+ (id)entryListControllerForEntryViewElement:(id)a3
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  SKUIIndexBarSingleEntryListController *v12;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        +[SKUIIndexBarEntryListController entryListControllerForEntryViewElement:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = -[SKUIIndexBarSingleEntryListController initWithEntryViewElement:]([SKUIIndexBarSingleEntryListController alloc], "initWithEntryViewElement:", v3);

  return v12;
}

+ (id)entryListControllerForEntryListViewElement:(id)a3
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SKUIIndexBarLocaleStandardEntryListController *v13;
  SKUIIndexBarLocaleStandardEntryListController *v14;

  v3 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        +[SKUIIndexBarEntryListController entryListControllerForEntryListViewElement:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = objc_msgSend(v3, "entryListElementType");
  if (v12 == 2)
  {
    v13 = -[SKUIIndexBarLocaleStandardEntryListController initWithSKUIIndexBarEntryListViewElement:]([SKUIIndexBarLocaleStandardEntryListController alloc], "initWithSKUIIndexBarEntryListViewElement:", v3);
  }
  else
  {
    if (v12 != 1)
    {
      v14 = 0;
      goto LABEL_11;
    }
    v13 = -[SKUIIndexBarDynamicElementEntryListController initWithEntryListViewElement:]([SKUIIndexBarDynamicElementEntryListController alloc], "initWithEntryListViewElement:", v3);
  }
  v14 = v13;
LABEL_11:

  return v14;
}

- (id)entryDescriptorAtIndex:(int64_t)a3
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUIIndexBarEntryListController entryDescriptorAtIndex:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  return 0;
}

- (void)reloadViewElementData
{
  OUTLINED_FUNCTION_1();
}

- (id)targetIndexBarEntryIDForEntryDescriptorAtIndex:(int64_t)a3 returningRelativeSectionIndex:(int64_t *)a4
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        -[SKUIIndexBarEntryListController targetIndexBarEntryIDForEntryDescriptorAtIndex:returningRelativeSectionIndex:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  return 0;
}

- (void)_didInvalidate
{
  id v3;

  -[SKUIIndexBarEntryListController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "indexBarEntryListControllerDidInvalidate:", self);

}

- (SKUIIndexBarEntryListControllerDelegate)delegate
{
  return (SKUIIndexBarEntryListControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)needsRootTargetViewElement
{
  return self->_needsRootTargetViewElement;
}

- (BOOL)hidesIndexBar
{
  return self->_hidesIndexBar;
}

- (NSString)rootTargetIndexBarEntryID
{
  return self->_rootTargetIndexBarEntryID;
}

- (SKUIViewElement)rootTargetViewElement
{
  return self->_rootTargetViewElement;
}

- (void)setRootTargetViewElement:(id)a3
{
  objc_storeStrong((id *)&self->_rootTargetViewElement, a3);
}

- (int64_t)numberOfEntryDescriptors
{
  return self->_numberOfEntryDescriptors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootTargetViewElement, 0);
  objc_storeStrong((id *)&self->_rootTargetIndexBarEntryID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (void)entryListControllerForEntryViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)entryListControllerForEntryListViewElement:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)entryDescriptorAtIndex:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

- (void)targetIndexBarEntryIDForEntryDescriptorAtIndex:(uint64_t)a3 returningRelativeSectionIndex:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
