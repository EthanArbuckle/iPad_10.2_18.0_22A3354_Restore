@implementation UIActivityItemsConfiguration

+ (UIActivityItemsConfiguration)activityItemsConfigurationWithObjects:(NSArray *)objects
{
  NSArray *v4;
  void *v5;

  v4 = objects;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithObjects:", v4);

  return (UIActivityItemsConfiguration *)v5;
}

+ (UIActivityItemsConfiguration)activityItemsConfigurationWithItemProviders:(NSArray *)itemProviders
{
  NSArray *v4;
  void *v5;

  v4 = itemProviders;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithItemProviders:", v4);

  return (UIActivityItemsConfiguration *)v5;
}

- (void)_commonInit
{
  NSArray *v3;
  NSArray *supportedInteractions;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("share");
  v5[1] = CFSTR("copy");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  supportedInteractions = self->_supportedInteractions;
  self->_supportedInteractions = v3;

}

- (UIActivityItemsConfiguration)initWithObjects:(NSArray *)objects
{
  NSArray *v5;
  UIActivityItemsConfiguration *v6;
  UIActivityItemsConfiguration *v7;
  NSArray *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSArray *itemProviders;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = objects;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIActivityItemsConfiguration.m"), 59, CFSTR("%s: objects parameter cannot be nil."), "-[UIActivityItemsConfiguration initWithObjects:]");

  }
  v22.receiver = self;
  v22.super_class = (Class)UIActivityItemsConfiguration;
  v6 = -[UIActivityItemsConfiguration init](&v22, sel_init);
  v7 = v6;
  if (v6)
  {
    -[UIActivityItemsConfiguration _commonInit](v6, "_commonInit");
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v5, "count"));
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v5;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
          -[NSArray addObject:](v8, "addObject:", v14);

        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v11);
    }

    itemProviders = v7->_itemProviders;
    v7->_itemProviders = v8;

  }
  return v7;
}

- (UIActivityItemsConfiguration)initWithItemProviders:(NSArray *)itemProviders
{
  NSArray *v5;
  UIActivityItemsConfiguration *v6;
  UIActivityItemsConfiguration *v7;
  uint64_t v8;
  NSArray *v9;
  void *v11;
  objc_super v12;

  v5 = itemProviders;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIActivityItemsConfiguration.m"), 79, CFSTR("%s: itemProviders parameter cannot be nil."), "-[UIActivityItemsConfiguration initWithItemProviders:]");

  }
  v12.receiver = self;
  v12.super_class = (Class)UIActivityItemsConfiguration;
  v6 = -[UIActivityItemsConfiguration init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    -[UIActivityItemsConfiguration _commonInit](v6, "_commonInit");
    v8 = -[NSArray copy](v5, "copy");
    v9 = v7->_itemProviders;
    v7->_itemProviders = (NSArray *)v8;

  }
  return v7;
}

- (id)_initWithActivityItemSources:(id)a3
{
  id v5;
  UIActivityItemsConfiguration *v6;
  UIActivityItemsConfiguration *v7;
  uint64_t v8;
  NSArray *activityItems;
  uint64_t v10;
  UIActivityViewController *vc;
  void *v13;
  objc_super v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIActivityItemsConfiguration.m"), 102, CFSTR("%s: activityItemSources parameter cannot be nil."), "-[UIActivityItemsConfiguration _initWithActivityItemSources:]");

  }
  v14.receiver = self;
  v14.super_class = (Class)UIActivityItemsConfiguration;
  v6 = -[UIActivityItemsConfiguration init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    -[UIActivityItemsConfiguration _commonInit](v6, "_commonInit");
    v8 = objc_msgSend(v5, "copy");
    activityItems = v7->_activityItems;
    v7->_activityItems = (NSArray *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D96D28]), "initWithActivityItems:applicationActivities:", v5, 0);
    vc = v7->_vc;
    v7->_vc = (UIActivityViewController *)v10;

  }
  return v7;
}

- (id)_initWithActivityItems:(id)a3 applicationActivities:(id)a4
{
  id v6;
  id v7;
  UIActivityItemsConfiguration *v8;
  UIActivityItemsConfiguration *v9;
  uint64_t v10;
  NSArray *activityItems;
  uint64_t v12;
  UIActivityViewController *vc;
  void *v14;
  id applicationActivitiesProvider;
  _QWORD aBlock[4];
  id v18;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)UIActivityItemsConfiguration;
  v8 = -[UIActivityItemsConfiguration init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    -[UIActivityItemsConfiguration _commonInit](v8, "_commonInit");
    v10 = objc_msgSend(v6, "copy");
    activityItems = v9->_activityItems;
    v9->_activityItems = (NSArray *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D96D28]), "initWithActivityItems:applicationActivities:", v6, v7);
    vc = v9->_vc;
    v9->_vc = (UIActivityViewController *)v12;

    if (objc_msgSend(v7, "count"))
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __77__UIActivityItemsConfiguration__initWithActivityItems_applicationActivities___block_invoke;
      aBlock[3] = &unk_1E16B5150;
      v18 = v7;
      v14 = _Block_copy(aBlock);
      applicationActivitiesProvider = v9->_applicationActivitiesProvider;
      v9->_applicationActivitiesProvider = v14;

    }
  }

  return v9;
}

id __77__UIActivityItemsConfiguration__initWithActivityItems_applicationActivities___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)itemProviders
{
  return self->_itemProviders;
}

- (BOOL)activityItemsConfigurationSupportsInteraction:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[UIActivityItemsConfiguration supportedInteractions](self, "supportedInteractions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (id)activityItemsConfigurationMetadataForKey:(id)a3
{
  void (**metadataProvider)(_QWORD, _QWORD);

  metadataProvider = (void (**)(_QWORD, _QWORD))self->_metadataProvider;
  if (metadataProvider)
  {
    ((void (**)(_QWORD, id))metadataProvider)[2](metadataProvider, a3);
    metadataProvider = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  }
  return metadataProvider;
}

- (id)activityItemsConfigurationMetadataForItemAtIndex:(int64_t)a3 key:(id)a4
{
  void (**perItemMetadataProvider)(_QWORD, _QWORD, _QWORD);

  perItemMetadataProvider = (void (**)(_QWORD, _QWORD, _QWORD))self->_perItemMetadataProvider;
  if (perItemMetadataProvider)
  {
    ((void (**)(_QWORD, int64_t, id))perItemMetadataProvider)[2](perItemMetadataProvider, a3, a4);
    perItemMetadataProvider = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  }
  return perItemMetadataProvider;
}

- (id)activityItemsConfigurationPreviewForItemAtIndex:(int64_t)a3 intent:(id)a4 suggestedSize:(CGSize)a5
{
  void (**previewProvider)(_QWORD, _QWORD, _QWORD, __n128, __n128);

  previewProvider = (void (**)(_QWORD, _QWORD, _QWORD, __n128, __n128))self->_previewProvider;
  if (previewProvider)
  {
    ((void (**)(_QWORD, int64_t, id, __n128, __n128))previewProvider)[2](previewProvider, a3, a4, (__n128)a5, *(__n128 *)&a5.height);
    previewProvider = (void (**)(_QWORD, _QWORD, _QWORD, __n128, __n128))objc_claimAutoreleasedReturnValue();
  }
  return previewProvider;
}

- (NSArray)applicationActivitiesForActivityItemsConfiguration
{
  uint64_t v2;
  void *v3;
  void *v4;

  -[UIActivityItemsConfiguration applicationActivitiesProvider](self, "applicationActivitiesProvider");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    (*(void (**)(uint64_t))(v2 + 16))(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSArray *)v4;
}

- (NSArray)itemProvidersForActivityItemsConfiguration
{
  UIActivityItemsConfiguration *v2;
  NSArray *itemProviders;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char **v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  UIActivityItemsConfiguration *v15;
  void *v16;
  void *v17;
  id v18;
  UIActivityItemsConfiguration *v20;
  void *v21;
  NSArray *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v2 = self;
  v31 = *MEMORY[0x1E0C80C00];
  itemProviders = self->_itemProviders;
  if (!itemProviders)
  {
    if (!-[NSArray count](v2->_activityItems, "count"))
    {
      v4 = (void *)MEMORY[0x1E0C9AA60];
      return (NSArray *)v4;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v2->_activityItems, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v5 = v2->_activityItems;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (!v6)
      goto LABEL_25;
    v7 = v6;
    v8 = *(_QWORD *)v27;
    v23 = (void *)*MEMORY[0x1E0D96DC0];
    v9 = &selRef__longPressRecognized_;
    v20 = v2;
    v22 = v5;
    while (1)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v4, "addObject:", v11);
          goto LABEL_23;
        }
        if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EDEF1270))
        {
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithObject:", v11);
          objc_msgSend(v4, "addObject:", v12);

          goto LABEL_23;
        }
        if (objc_msgSend(v11, "conformsToProtocol:", v9[163]))
        {
          v13 = v11;
          v14 = v23;
          v15 = v2;
          objc_msgSend(v13, "activityViewController:itemForActivityType:", v2->_vc, v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v4, "addObject:", v16);
LABEL_22:

            v9 = &selRef__longPressRecognized_;
            v2 = v15;
            v5 = v22;
            goto LABEL_23;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v13, "activityViewController:dataTypeIdentifierForActivityType:", v15->_vc, v14);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v17, "length"))
            {
              v21 = v17;
              v18 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
              v24[0] = MEMORY[0x1E0C809B0];
              v24[1] = 3221225472;
              v24[2] = __74__UIActivityItemsConfiguration_itemProvidersForActivityItemsConfiguration__block_invoke;
              v24[3] = &unk_1E16B5178;
              v25 = v16;
              objc_msgSend(v18, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v21, 0, v24);
              objc_msgSend(v4, "addObject:", v18);

              v17 = v21;
            }
          }
          else
          {
            if (!objc_msgSend(v16, "conformsToProtocol:", &unk_1EDEF1270))
              goto LABEL_22;
            v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithObject:", v16);
            objc_msgSend(v4, "addObject:", v17);
          }

          v15 = v20;
          goto LABEL_22;
        }
LABEL_23:
        ++v10;
      }
      while (v7 != v10);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (!v7)
      {
LABEL_25:

        return (NSArray *)v4;
      }
    }
  }
  v4 = (void *)-[NSArray copy](itemProviders, "copy");
  return (NSArray *)v4;
}

uint64_t __74__UIActivityItemsConfiguration_itemProvidersForActivityItemsConfiguration__block_invoke(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0);
  return 0;
}

+ (id)_itemsForSystemSharingFromActivityItemsConfiguration:(id)a3 wrapperBlock:(id)a4
{
  id v5;
  void (**v6)(id, id, _QWORD);
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v16;

  v5 = a3;
  v6 = (void (**)(id, id, _QWORD))a4;
  v16 = objc_opt_respondsToSelector();
  v7 = objc_opt_respondsToSelector();
  objc_msgSend(v5, "itemProvidersForActivityItemsConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (2 * v9) | 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 >= 1)
  {
    for (i = 0; i != v9; ++i)
    {
      v6[2](v6, v5, i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v12);

      if ((v7 & 1) != 0)
      {
        objc_msgSend(v5, "activityItemsConfigurationMetadataForItemAtIndex:key:", i, CFSTR("messageBody"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            objc_msgSend(v10, "addObject:", v13);
        }
      }
      else
      {
        v13 = 0;
      }

    }
  }
  if ((v16 & 1) != 0)
  {
    objc_msgSend(v5, "activityItemsConfigurationMetadataForKey:", CFSTR("messageBody"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        objc_msgSend(v10, "addObject:", v14);
    }

  }
  return v10;
}

- (BOOL)_hasItemsForActivityItemsConfiguration
{
  BOOL v3;
  void *v4;

  if (-[NSArray count](self->_activityItems, "count"))
    return 1;
  -[UIActivityItemsConfiguration itemProvidersForActivityItemsConfiguration](self, "itemProvidersForActivityItemsConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "count") != 0;

  return v3;
}

- (NSArray)_activityItems
{
  return (NSArray *)(id)-[NSArray copy](self->_activityItems, "copy");
}

- (NSArray)_excludedActivityTypes
{
  return (NSArray *)(id)-[NSArray copy](self->_excludedActivityTypes, "copy");
}

- (void)_setExcludedActivityTypes:(id)a3
{
  NSArray *v4;
  NSArray *excludedActivityTypes;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  excludedActivityTypes = self->_excludedActivityTypes;
  self->_excludedActivityTypes = v4;

}

- (id)localObject
{
  return self->_localObject;
}

- (void)setLocalObject:(id)localObject
{
  objc_storeStrong(&self->_localObject, localObject);
}

- (NSArray)supportedInteractions
{
  return self->_supportedInteractions;
}

- (void)setSupportedInteractions:(NSArray *)supportedInteractions
{
  objc_setProperty_nonatomic_copy(self, a2, supportedInteractions, 48);
}

- (void)metadataProvider
{
  return self->_metadataProvider;
}

- (void)setMetadataProvider:(void *)metadataProvider
{
  objc_setProperty_nonatomic_copy(self, a2, metadataProvider, 56);
}

- (void)perItemMetadataProvider
{
  return self->_perItemMetadataProvider;
}

- (void)setPerItemMetadataProvider:(void *)perItemMetadataProvider
{
  objc_setProperty_nonatomic_copy(self, a2, perItemMetadataProvider, 64);
}

- (void)previewProvider
{
  return self->_previewProvider;
}

- (void)setPreviewProvider:(void *)previewProvider
{
  objc_setProperty_nonatomic_copy(self, a2, previewProvider, 72);
}

- (void)applicationActivitiesProvider
{
  return self->_applicationActivitiesProvider;
}

- (void)setApplicationActivitiesProvider:(void *)applicationActivitiesProvider
{
  objc_setProperty_nonatomic_copy(self, a2, applicationActivitiesProvider, 80);
}

- (NSArray)_excludedInteractions
{
  return self->__excludedInteractions;
}

- (void)_setExcludedInteractions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__excludedInteractions, 0);
  objc_storeStrong(&self->_applicationActivitiesProvider, 0);
  objc_storeStrong(&self->_previewProvider, 0);
  objc_storeStrong(&self->_perItemMetadataProvider, 0);
  objc_storeStrong(&self->_metadataProvider, 0);
  objc_storeStrong((id *)&self->_supportedInteractions, 0);
  objc_storeStrong(&self->_localObject, 0);
  objc_storeStrong((id *)&self->_excludedActivityTypes, 0);
  objc_storeStrong((id *)&self->_vc, 0);
  objc_storeStrong((id *)&self->_activityItems, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

@end
