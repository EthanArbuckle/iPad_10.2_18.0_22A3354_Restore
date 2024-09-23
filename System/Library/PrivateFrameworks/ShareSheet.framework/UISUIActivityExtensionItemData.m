@implementation UISUIActivityExtensionItemData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UISUIActivityExtensionItemData)init
{
  UISUIActivityExtensionItemData *v2;
  uint64_t v3;
  NSMutableDictionary *attachmentNamesByItemUUID;
  uint64_t v5;
  NSMutableDictionary *subjectsByItemUUID;
  uint64_t v7;
  NSMutableDictionary *previewImagesByItemUUID;
  uint64_t v9;
  NSMutableDictionary *previewImageDataByItemUUID;
  uint64_t v11;
  NSMutableDictionary *dataTypesByItemUUID;
  uint64_t v13;
  NSDictionary *openURLAnnotationsByURL;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)UISUIActivityExtensionItemData;
  v2 = -[UISUIActivityExtensionItemData init](&v16, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    attachmentNamesByItemUUID = v2->_attachmentNamesByItemUUID;
    v2->_attachmentNamesByItemUUID = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    subjectsByItemUUID = v2->_subjectsByItemUUID;
    v2->_subjectsByItemUUID = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    previewImagesByItemUUID = v2->_previewImagesByItemUUID;
    v2->_previewImagesByItemUUID = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    previewImageDataByItemUUID = v2->_previewImageDataByItemUUID;
    v2->_previewImageDataByItemUUID = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    dataTypesByItemUUID = v2->_dataTypesByItemUUID;
    v2->_dataTypesByItemUUID = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    openURLAnnotationsByURL = v2->_openURLAnnotationsByURL;
    v2->_openURLAnnotationsByURL = (NSDictionary *)v13;

    v2->_itemProviderOrExtensionItemWithMetadataToUUID = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
  }
  return v2;
}

- (UISUIActivityExtensionItemData)initWithCoder:(id)a3
{
  id v4;
  UISUIActivityExtensionItemData *v5;
  void *v6;
  uint64_t v7;
  NSArray *extensionItems;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *attachmentNamesByItemUUID;
  void *v12;
  uint64_t v13;
  NSMutableDictionary *subjectsByItemUUID;
  void *v15;
  uint64_t v16;
  NSMutableDictionary *previewImagesByItemUUID;
  void *v18;
  uint64_t v19;
  NSMutableDictionary *previewImageDataByItemUUID;
  void *v21;
  uint64_t v22;
  NSMutableDictionary *dataTypesByItemUUID;
  void *v24;
  void *v25;
  uint64_t v26;
  NSDictionary *openURLAnnotationsByURL;

  v4 = a3;
  v5 = -[UISUIActivityExtensionItemData init](self, "init");
  if (v5)
  {
    NSStringFromSelector(sel_extensionItems);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _UISecureDecodeExtensionItemsWithKey(v4, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    extensionItems = v5->_extensionItems;
    v5->_extensionItems = (NSArray *)v7;

    -[UISUIActivityExtensionItemData _loadItemProviderOrExtensionItemWithMetadataToUUIDFromTemporaryUUIDMappingAttachedToExtensionItems:](v5, "_loadItemProviderOrExtensionItemWithMetadataToUUIDFromTemporaryUUIDMappingAttachedToExtensionItems:", v5->_extensionItems);
    -[UISUIActivityExtensionItemData _removeTemporaryUUIDMappingAttachmentFromExtensionItems:](v5, "_removeTemporaryUUIDMappingAttachmentFromExtensionItems:", v5->_extensionItems);
    NSStringFromSelector(sel_attachmentNamesByItemUUID);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _UISecureDecodeExtensionItemsWithKey(v4, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    attachmentNamesByItemUUID = v5->_attachmentNamesByItemUUID;
    v5->_attachmentNamesByItemUUID = (NSMutableDictionary *)v10;

    NSStringFromSelector(sel_subjectsByItemUUID);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _UISecureDecodeExtensionItemsWithKey(v4, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    subjectsByItemUUID = v5->_subjectsByItemUUID;
    v5->_subjectsByItemUUID = (NSMutableDictionary *)v13;

    NSStringFromSelector(sel_previewImagesByItemUUID);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _UISecureDecodeExtensionItemsWithKey(v4, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    previewImagesByItemUUID = v5->_previewImagesByItemUUID;
    v5->_previewImagesByItemUUID = (NSMutableDictionary *)v16;

    NSStringFromSelector(sel_previewImageDataByItemUUID);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _UISecureDecodeExtensionItemsWithKey(v4, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    previewImageDataByItemUUID = v5->_previewImageDataByItemUUID;
    v5->_previewImageDataByItemUUID = (NSMutableDictionary *)v19;

    NSStringFromSelector(sel_dataTypesByItemUUID);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _UISecureDecodeExtensionItemsWithKey(v4, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    dataTypesByItemUUID = v5->_dataTypesByItemUUID;
    v5->_dataTypesByItemUUID = (NSMutableDictionary *)v22;

    _UISecureStandardPropertyListClasses();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_openURLAnnotationsByURL);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();
    openURLAnnotationsByURL = v5->_openURLAnnotationsByURL;
    v5->_openURLAnnotationsByURL = (NSDictionary *)v26;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *extensionItems;
  id v5;
  NSArray *v6;
  void *v7;
  NSMutableDictionary *attachmentNamesByItemUUID;
  void *v9;
  NSMutableDictionary *subjectsByItemUUID;
  void *v11;
  NSMutableDictionary *previewImagesByItemUUID;
  void *v13;
  NSMutableDictionary *previewImageDataByItemUUID;
  void *v15;
  NSMutableDictionary *dataTypesByItemUUID;
  void *v17;
  NSDictionary *openURLAnnotationsByURL;
  id v19;

  extensionItems = self->_extensionItems;
  v5 = a3;
  -[UISUIActivityExtensionItemData _appendTemporaryUUIDMappingAttachmentToExtensionItem:](self, "_appendTemporaryUUIDMappingAttachmentToExtensionItem:", extensionItems);
  v6 = self->_extensionItems;
  NSStringFromSelector(sel_extensionItems);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, v7);

  -[UISUIActivityExtensionItemData _removeTemporaryUUIDMappingAttachmentFromExtensionItems:](self, "_removeTemporaryUUIDMappingAttachmentFromExtensionItems:", self->_extensionItems);
  attachmentNamesByItemUUID = self->_attachmentNamesByItemUUID;
  NSStringFromSelector(sel_attachmentNamesByItemUUID);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", attachmentNamesByItemUUID, v9);

  subjectsByItemUUID = self->_subjectsByItemUUID;
  NSStringFromSelector(sel_subjectsByItemUUID);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", subjectsByItemUUID, v11);

  previewImagesByItemUUID = self->_previewImagesByItemUUID;
  NSStringFromSelector(sel_previewImagesByItemUUID);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", previewImagesByItemUUID, v13);

  previewImageDataByItemUUID = self->_previewImageDataByItemUUID;
  NSStringFromSelector(sel_previewImageDataByItemUUID);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", previewImageDataByItemUUID, v15);

  dataTypesByItemUUID = self->_dataTypesByItemUUID;
  NSStringFromSelector(sel_dataTypesByItemUUID);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", dataTypesByItemUUID, v17);

  openURLAnnotationsByURL = self->_openURLAnnotationsByURL;
  NSStringFromSelector(sel_openURLAnnotationsByURL);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", openURLAnnotationsByURL, v19);

}

- (void)dealloc
{
  __CFDictionary *itemProviderOrExtensionItemWithMetadataToUUID;
  objc_super v4;

  itemProviderOrExtensionItemWithMetadataToUUID = self->_itemProviderOrExtensionItemWithMetadataToUUID;
  if (itemProviderOrExtensionItemWithMetadataToUUID)
    CFRelease(itemProviderOrExtensionItemWithMetadataToUUID);
  v4.receiver = self;
  v4.super_class = (Class)UISUIActivityExtensionItemData;
  -[UISUIActivityExtensionItemData dealloc](&v4, sel_dealloc);
}

- (void)addAttachmentName:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[UISUIActivityExtensionItemData _getItemUUIDForItem:createIfNeeded:](self, "_getItemUUIDForItem:createIfNeeded:", a4, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](self->_attachmentNamesByItemUUID, "setObject:forKey:", v6, v7);

}

- (id)attachmentNameForItem:(id)a3
{
  void *v4;
  void *v5;

  -[UISUIActivityExtensionItemData _getItemUUIDForItem:createIfNeeded:](self, "_getItemUUIDForItem:createIfNeeded:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_attachmentNamesByItemUUID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)addSubject:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[UISUIActivityExtensionItemData _getItemUUIDForItem:createIfNeeded:](self, "_getItemUUIDForItem:createIfNeeded:", a4, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](self->_subjectsByItemUUID, "setObject:forKey:", v6, v7);

}

- (id)subjectForItem:(id)a3
{
  void *v4;
  void *v5;

  -[UISUIActivityExtensionItemData _getItemUUIDForItem:createIfNeeded:](self, "_getItemUUIDForItem:createIfNeeded:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_subjectsByItemUUID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)addPreviewImage:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[UISUIActivityExtensionItemData _getItemUUIDForItem:createIfNeeded:](self, "_getItemUUIDForItem:createIfNeeded:", a4, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](self->_previewImagesByItemUUID, "setObject:forKey:", v6, v7);

}

- (id)previewImageForItem:(id)a3
{
  void *v4;
  void *v5;

  -[UISUIActivityExtensionItemData _getItemUUIDForItem:createIfNeeded:](self, "_getItemUUIDForItem:createIfNeeded:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_previewImagesByItemUUID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)addPreviewImageData:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[UISUIActivityExtensionItemData _getItemUUIDForItem:createIfNeeded:](self, "_getItemUUIDForItem:createIfNeeded:", a4, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](self->_previewImageDataByItemUUID, "setObject:forKey:", v6, v7);

}

- (id)previewImageDataForItem:(id)a3
{
  void *v4;
  void *v5;

  -[UISUIActivityExtensionItemData _getItemUUIDForItem:createIfNeeded:](self, "_getItemUUIDForItem:createIfNeeded:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_previewImageDataByItemUUID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)addDataType:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[UISUIActivityExtensionItemData _getItemUUIDForItem:createIfNeeded:](self, "_getItemUUIDForItem:createIfNeeded:", a4, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](self->_dataTypesByItemUUID, "setObject:forKey:", v6, v7);

}

- (id)dataTypeForItem:(id)a3
{
  void *v4;
  void *v5;

  -[UISUIActivityExtensionItemData _getItemUUIDForItem:createIfNeeded:](self, "_getItemUUIDForItem:createIfNeeded:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_dataTypesByItemUUID, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)allDataTypes
{
  return (id)-[NSMutableDictionary allValues](self->_dataTypesByItemUUID, "allValues");
}

- (void)prepareForSendingToExtension:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[UISUIActivityExtensionItemData extensionItems](self, "extensionItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_extensionItemsByPreparingToSendExtensionItems:toDestinationExtension:", v6, v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[UISUIActivityExtensionItemData _changeUUIDMappingFromExtensionItems:toClonedExtensionItems:](self, "_changeUUIDMappingFromExtensionItems:toClonedExtensionItems:", self->_extensionItems, v7);
  -[UISUIActivityExtensionItemData setExtensionItems:](self, "setExtensionItems:", v7);

}

- (void)prepareForSendingAsCompletionToHostWithAuditToken:(id *)a3
{
  void *v4;
  __int128 v5;
  id v6;
  Class v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  objc_class *v16;
  objc_class *v17;
  id obj;
  uint64_t v19;
  uint64_t v20;
  _OWORD v21[2];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[UISUIActivityExtensionItemData extensionItems](self, "extensionItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)&a3->var0[4];
  v30 = *(_OWORD *)a3->var0;
  v31 = v5;
  v6 = v4;
  v7 = NSClassFromString(CFSTR("_NSItemProviderCopyingLoadOperator"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v6;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
  if (v20)
  {
    v19 = *(_QWORD *)v27;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v8);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v9, "attachments");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v23;
          do
          {
            v14 = 0;
            do
            {
              if (*(_QWORD *)v23 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v14);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v16 = -[objc_class alloc](v7, "alloc");
                v21[0] = v30;
                v21[1] = v31;
                v17 = -[objc_class initWithItemProvider:destinationProcessAuditToken:](v16, "initWithItemProvider:destinationProcessAuditToken:", v15, v21);
                objc_msgSend(v15, "setValue:forKey:", v17, CFSTR("_loadOperator"));

              }
              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v20);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
    }
    while (v20);
  }

}

+ (id)_onBackgroundQueue_extensionItemsByPreparingToSendExtensionItems:(id)a3 toDestinationExtension:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a3;
  v6 = a4;
  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__3;
  v20 = __Block_byref_object_dispose__3;
  v21 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __122__UISUIActivityExtensionItemData__onBackgroundQueue_extensionItemsByPreparingToSendExtensionItems_toDestinationExtension___block_invoke;
  v12[3] = &unk_1E4003078;
  v8 = v6;
  v13 = v8;
  v15 = &v16;
  v9 = v7;
  v14 = v9;
  objc_msgSend(v8, "beginExtensionRequestWithInputItems:completion:", v5, v12);
  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __122__UISUIActivityExtensionItemData__onBackgroundQueue_extensionItemsByPreparingToSendExtensionItems_toDestinationExtension___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_extensionContextForUUID:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "inputItems");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

+ (id)_extensionItemsByPreparingToSendExtensionItems:(id)a3 toDestinationExtension:(id)a4
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v13 = 0;
  objc_msgSend(v5, "beginExtensionRequestWithInputItems:error:", a3, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  if (v7)
  {
    share_sheet_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v9;
      v16 = 2114;
      v17 = v7;
      _os_log_impl(&dword_19E419000, v8, OS_LOG_TYPE_DEFAULT, "Error preparing extension items to send to destination extension (%{public}@). Error = %{public}@", buf, 0x16u);

    }
  }
  objc_msgSend(v5, "_extensionContextForUUID:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "inputItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_loadItemProviderOrExtensionItemWithMetadataToUUIDFromTemporaryUUIDMappingAttachedToExtensionItems:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  __CFDictionary *itemProviderOrExtensionItemWithMetadataToUUID;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id obj;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[5];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __133__UISUIActivityExtensionItemData__loadItemProviderOrExtensionItemWithMetadataToUUIDFromTemporaryUUIDMappingAttachedToExtensionItems___block_invoke;
  v33[3] = &unk_1E40030A0;
  v33[4] = self;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A1AE9514](v33);
  itemProviderOrExtensionItemWithMetadataToUUID = self->_itemProviderOrExtensionItemWithMetadataToUUID;
  if (itemProviderOrExtensionItemWithMetadataToUUID)
    CFRelease(itemProviderOrExtensionItemWithMetadataToUUID);
  self->_itemProviderOrExtensionItemWithMetadataToUUID = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    v28 = *MEMORY[0x1E0CB2CD0];
    v25 = *(_QWORD *)v30;
    do
    {
      v10 = 0;
      v26 = v8;
      do
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v10);
        objc_msgSend(v11, "attachments", v25);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lastObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "userInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("UUIDMappingData"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v15, 0);
          _UISecureStandardPropertyListClasses();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "decodeObjectOfClasses:forKey:", v17, v28);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("extensionItemUUID"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *, void *))v5)[2](v5, v11, v19);

            objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("attachmentUUIDs"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v20, "count"))
            {
              v21 = 0;
              do
              {
                objc_msgSend(v11, "attachments");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "objectAtIndexedSubscript:", v21);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "objectAtIndexedSubscript:", v21);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                ((void (**)(_QWORD, void *, void *))v5)[2](v5, v23, v24);

                ++v21;
              }
              while (v21 < objc_msgSend(v20, "count"));
            }

            v9 = v25;
            v8 = v26;
          }
        }

        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v8);
  }

}

void __133__UISUIActivityExtensionItemData__loadItemProviderOrExtensionItemWithMetadataToUUIDFromTemporaryUUIDMappingAttachedToExtensionItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  char v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v5);

  if ((v7 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_setItemUUID:forItem:", v5, v8);

}

- (void)_appendTemporaryUUIDMappingAttachmentToExtensionItem:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  const __CFString *v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v8, "attachments");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v9, "mutableCopy");
        v11 = v10;
        if (v10)
        {
          v12 = v10;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v12 = (id)objc_claimAutoreleasedReturnValue();
        }
        v13 = v12;

        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithItem:typeIdentifier:", &stru_1E4004990, CFSTR("com.apple.UISUIActivityExtensionItemData.uuidMapping"));
        v22 = CFSTR("UUIDMappingData");
        -[UISUIActivityExtensionItemData _uuidMappingDataForTemporaryAttachmentToExtensionItem:attachments:](self, "_uuidMappingDataForTemporaryAttachmentToExtensionItem:attachments:", v8, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v15;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setUserInfo:", v16);

        objc_msgSend(v13, "addObject:", v14);
        objc_msgSend(v8, "setAttachments:", v13);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v5);
  }

}

- (void)_removeTemporaryUUIDMappingAttachmentFromExtensionItems:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v8, "attachments");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "lastObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "userInfo");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", CFSTR("UUIDMappingData"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v8, "attachments");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v13, "mutableCopy");

          objc_msgSend(v14, "removeLastObject");
          objc_msgSend(v8, "setAttachments:", v14);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

}

- (id)_uuidMappingDataForTemporaryAttachmentToExtensionItem:(id)a3 attachments:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v6;
  -[UISUIActivityExtensionItemData _getItemUUIDForItem:createIfNeeded:](self, "_getItemUUIDForItem:createIfNeeded:", v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v24 = v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v13);
        -[UISUIActivityExtensionItemData _getItemUUIDForItem:createIfNeeded:](self, "_getItemUUIDForItem:createIfNeeded:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i), 0, v24);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          v20 = v18;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v20 = (id)objc_claimAutoreleasedReturnValue();
        }
        v21 = v20;

        objc_msgSend(v12, "addObject:", v21);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v15);
  }

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v24, CFSTR("extensionItemUUID"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("attachmentUUIDs"));
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (void)_changeUUIDMappingFromExtensionItems:(id)a3 toClonedExtensionItems:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  unint64_t v25;
  _QWORD v26[5];

  v6 = a3;
  v7 = a4;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __94__UISUIActivityExtensionItemData__changeUUIDMappingFromExtensionItems_toClonedExtensionItems___block_invoke;
  v26[3] = &unk_1E4001A60;
  v26[4] = self;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A1AE9514](v26);
  v9 = objc_msgSend(v6, "count");
  v10 = objc_msgSend(v7, "count");
  if (v9 >= v10)
    v11 = v10;
  else
    v11 = v9;
  v25 = v11;
  if (v11)
  {
    v12 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v12, v25);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *))v8)[2](v8, v13, v14);

      objc_msgSend(v6, "objectAtIndexedSubscript:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "attachments");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "objectAtIndexedSubscript:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "attachments");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = objc_msgSend(v16, "count");
      v20 = objc_msgSend(v18, "count");
      if (v19 >= v20)
        v21 = v20;
      else
        v21 = v19;
      if (v21)
      {
        for (i = 0; i != v21; ++i)
        {
          objc_msgSend(v16, "objectAtIndexedSubscript:", i);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectAtIndexedSubscript:", i);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, void *))v8)[2](v8, v23, v24);

        }
      }

      ++v12;
    }
    while (v12 != v25);
  }

}

void __94__UISUIActivityExtensionItemData__changeUUIDMappingFromExtensionItems_toClonedExtensionItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_getItemUUIDForItem:createIfNeeded:", v7, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setItemUUID:forItem:", v6, v5);
    objc_msgSend(*(id *)(a1 + 32), "_setItemUUID:forItem:", 0, v7);
  }

}

- (void)_setItemUUID:(id)a3 forItem:(id)a4
{
  id v6;
  id value;

  value = a3;
  v6 = a4;
  if (value || !v6)
  {
    if (value && v6)
      CFDictionarySetValue(self->_itemProviderOrExtensionItemWithMetadataToUUID, v6, value);
  }
  else
  {
    CFDictionaryRemoveValue(self->_itemProviderOrExtensionItemWithMetadataToUUID, v6);
  }

}

- (id)_getItemUUIDForItem:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  BOOL v8;

  v4 = a4;
  v6 = a3;
  CFDictionaryGetValue(self->_itemProviderOrExtensionItemWithMetadataToUUID, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = 1;
  else
    v8 = !v4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISUIActivityExtensionItemData _setItemUUID:forItem:](self, "_setItemUUID:forItem:", v7, v6);
  }

  return v7;
}

- (NSArray)extensionItems
{
  return self->_extensionItems;
}

- (void)setExtensionItems:(id)a3
{
  objc_storeStrong((id *)&self->_extensionItems, a3);
}

- (NSDictionary)openURLAnnotationsByURL
{
  return self->_openURLAnnotationsByURL;
}

- (void)setOpenURLAnnotationsByURL:(id)a3
{
  objc_storeStrong((id *)&self->_openURLAnnotationsByURL, a3);
}

- (__CFDictionary)itemProviderOrExtensionItemWithMetadataToUUID
{
  return self->_itemProviderOrExtensionItemWithMetadataToUUID;
}

- (NSMutableDictionary)attachmentNamesByItemUUID
{
  return self->_attachmentNamesByItemUUID;
}

- (NSMutableDictionary)subjectsByItemUUID
{
  return self->_subjectsByItemUUID;
}

- (NSMutableDictionary)previewImagesByItemUUID
{
  return self->_previewImagesByItemUUID;
}

- (NSMutableDictionary)previewImageDataByItemUUID
{
  return self->_previewImageDataByItemUUID;
}

- (NSMutableDictionary)dataTypesByItemUUID
{
  return self->_dataTypesByItemUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataTypesByItemUUID, 0);
  objc_storeStrong((id *)&self->_previewImageDataByItemUUID, 0);
  objc_storeStrong((id *)&self->_previewImagesByItemUUID, 0);
  objc_storeStrong((id *)&self->_subjectsByItemUUID, 0);
  objc_storeStrong((id *)&self->_attachmentNamesByItemUUID, 0);
  objc_storeStrong((id *)&self->_openURLAnnotationsByURL, 0);
  objc_storeStrong((id *)&self->_extensionItems, 0);
}

@end
