@implementation SKUIIndexBarDynamicElementEntryListController

- (SKUIIndexBarDynamicElementEntryListController)initWithEntryListViewElement:(id)a3
{
  id v5;
  SKUIIndexBarDynamicElementEntryListController *v6;
  SKUIIndexBarDynamicElementEntryListController *v7;
  objc_super v9;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIIndexBarDynamicElementEntryListController initWithEntryListViewElement:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIIndexBarDynamicElementEntryListController;
  v6 = -[SKUIIndexBarDynamicElementEntryListController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_entryListViewElement, a3);

  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_entityProvider)
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D3A540]);

  v5.receiver = self;
  v5.super_class = (Class)SKUIIndexBarDynamicElementEntryListController;
  -[SKUIIndexBarDynamicElementEntryListController dealloc](&v5, sel_dealloc);
}

- (id)entryDescriptorAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[SKUIEntityProviding indexBarEntryEntityValueProviderAtIndex:](self->_entityProvider, "indexBarEntryEntityValueProviderAtIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIViewElement setEntityValueProvider:](self->_templateElement, "setEntityValueProvider:", v4);
  SKUIIndexBarEntryDescriptorForIndexBarEntryViewElement(self->_indexBarEntryViewElement, self->_templateElement);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVisibilityPriority:", objc_msgSend(v4, "visibilityPriority"));

  return v5;
}

- (BOOL)hidesIndexBar
{
  _BOOL4 v3;
  int64_t v4;

  v3 = -[SKUIIndexBarEntryListViewElement isIndexBarHiddenWhenEmpty](self->_entryListViewElement, "isIndexBarHiddenWhenEmpty");
  if (v3)
  {
    v4 = -[SKUIDynamicPageSectionIndexMapper totalNumberOfEntities](self->_dynamicIndexMapper, "totalNumberOfEntities");
    LOBYTE(v3) = v4 < -[SKUIIndexBarEntryListViewElement minimumEntityCount](self->_entryListViewElement, "minimumEntityCount");
  }
  return v3;
}

- (BOOL)needsRootTargetViewElement
{
  return 1;
}

- (int64_t)numberOfEntryDescriptors
{
  int64_t v3;

  if (self->_templateElement
    && (v3 = -[SKUIDynamicPageSectionIndexMapper totalNumberOfEntities](self->_dynamicIndexMapper, "totalNumberOfEntities"), v3 >= -[SKUIIndexBarEntryListViewElement minimumEntityCount](self->_entryListViewElement, "minimumEntityCount"))&& (objc_opt_respondsToSelector() & 1) != 0)
  {
    return -[SKUIEntityProviding numberOfIndexBarEntries](self->_entityProvider, "numberOfIndexBarEntries");
  }
  else
  {
    return 0;
  }
}

- (void)reloadViewElementData
{
  void *v3;
  SKUIIndexBarEntryViewElement *v4;
  SKUIIndexBarEntryViewElement *indexBarEntryViewElement;
  int v6;
  SKUIViewElement *v7;
  SKUIViewElement *templateElement;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SKUIIndexBarDynamicElementEntryListController;
  -[SKUIIndexBarEntryListController reloadViewElementData](&v9, sel_reloadViewElementData);
  -[SKUIIndexBarEntryListViewElement childIndexBarEntryElements](self->_entryListViewElement, "childIndexBarEntryElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (SKUIIndexBarEntryViewElement *)objc_claimAutoreleasedReturnValue();

  indexBarEntryViewElement = self->_indexBarEntryViewElement;
  if (indexBarEntryViewElement == v4
    || (-[SKUIIndexBarEntryViewElement isEqual:](indexBarEntryViewElement, "isEqual:", v4) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_indexBarEntryViewElement, v4);
    v6 = 1;
  }
  -[SKUIIndexBarEntryViewElement childElement](v4, "childElement");
  v7 = (SKUIViewElement *)objc_claimAutoreleasedReturnValue();
  templateElement = self->_templateElement;
  if (templateElement == v7 || (-[SKUIViewElement isEqual:](templateElement, "isEqual:", v7) & 1) != 0)
  {
    if (!v6)
      goto LABEL_11;
  }
  else
  {
    objc_storeStrong((id *)&self->_templateElement, v7);
  }
  -[SKUIIndexBarEntryListController _didInvalidate](self, "_didInvalidate");
LABEL_11:

}

- (id)rootTargetIndexBarEntryID
{
  return -[SKUIIndexBarEntryListViewElement targetIndexBarEntryID](self->_entryListViewElement, "targetIndexBarEntryID");
}

- (void)setRootTargetViewElement:(id)a3
{
  void *v4;
  SKUIEntityProviding *v5;
  SKUIEntityProviding **p_entityProvider;
  SKUIEntityProviding *entityProvider;
  void *v8;
  void *v9;
  _QWORD *v10;
  SKUIDynamicPageSectionIndexMapper *dynamicIndexMapper;
  SKUIDynamicPageSectionIndexMapper *v12;
  SKUIDynamicPageSectionIndexMapper *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SKUIIndexBarDynamicElementEntryListController;
  -[SKUIIndexBarEntryListController setRootTargetViewElement:](&v14, sel_setRootTargetViewElement_, a3);
  -[SKUIIndexBarEntryListController rootTargetViewElement](self, "rootTargetViewElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "entityProvider");
    v5 = (SKUIEntityProviding *)objc_claimAutoreleasedReturnValue();
    p_entityProvider = &self->_entityProvider;
    entityProvider = self->_entityProvider;
    if (entityProvider != v5 && (-[SKUIEntityProviding isEqual:](entityProvider, "isEqual:", v5) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = (_QWORD *)MEMORY[0x1E0D3A540];
      if (*p_entityProvider)
        objc_msgSend(v8, "removeObserver:name:object:", self, *MEMORY[0x1E0D3A540]);
      objc_storeStrong((id *)&self->_entityProvider, v5);
      dynamicIndexMapper = self->_dynamicIndexMapper;
      if (*p_entityProvider)
      {
        if (!dynamicIndexMapper)
        {
          v12 = objc_alloc_init(SKUIDynamicPageSectionIndexMapper);
          v13 = self->_dynamicIndexMapper;
          self->_dynamicIndexMapper = v12;

          dynamicIndexMapper = self->_dynamicIndexMapper;
        }
        -[SKUIDynamicPageSectionIndexMapper setEntityProvider:](dynamicIndexMapper, "setEntityProvider:");
        objc_msgSend(v9, "addObserver:selector:name:object:", self, sel__entityProviderDidInvalidateNotification_, *v10, *p_entityProvider);
      }
      else
      {
        self->_dynamicIndexMapper = 0;

      }
      -[SKUIIndexBarEntryListController _didInvalidate](self, "_didInvalidate");

    }
  }

}

- (id)targetIndexBarEntryIDForEntryDescriptorAtIndex:(int64_t)a3 returningRelativeSectionIndex:(int64_t *)a4
{
  uint64_t v6;

  if (a4)
  {
    v6 = a3;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = -[SKUIEntityProviding sectionForSectionIndexBarEntryAtIndex:](self->_entityProvider, "sectionForSectionIndexBarEntryAtIndex:", v6);
    *a4 = v6;
  }
  return -[SKUIIndexBarEntryListViewElement targetIndexBarEntryID](self->_entryListViewElement, "targetIndexBarEntryID", a3);
}

- (void)_entityProviderDidInvalidateNotification:(id)a3
{
  uint64_t v3;
  void (**v4)(_QWORD);
  _QWORD v5[4];
  void (**v6)(_QWORD);
  _QWORD aBlock[5];

  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__SKUIIndexBarDynamicElementEntryListController__entityProviderDidInvalidateNotification___block_invoke;
  aBlock[3] = &unk_1E739FD38;
  aBlock[4] = self;
  v4 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v4[2](v4);
  }
  else
  {
    v5[0] = v3;
    v5[1] = 3221225472;
    v5[2] = __90__SKUIIndexBarDynamicElementEntryListController__entityProviderDidInvalidateNotification___block_invoke_2;
    v5[3] = &unk_1E73A1618;
    v6 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

uint64_t __90__SKUIIndexBarDynamicElementEntryListController__entityProviderDidInvalidateNotification___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "reloadData");
  return objc_msgSend(*(id *)(a1 + 32), "_didInvalidate");
}

uint64_t __90__SKUIIndexBarDynamicElementEntryListController__entityProviderDidInvalidateNotification___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (SKUIIndexBarEntryListViewElement)entryListViewElement
{
  return self->_entryListViewElement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryListViewElement, 0);
  objc_storeStrong((id *)&self->_templateElement, 0);
  objc_storeStrong((id *)&self->_indexBarEntryViewElement, 0);
  objc_storeStrong((id *)&self->_entityProvider, 0);
  objc_storeStrong((id *)&self->_dynamicIndexMapper, 0);
}

- (void)initWithEntryListViewElement:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIIndexBarDynamicElementEntryListController initWithEntryListViewElement:]";
}

@end
