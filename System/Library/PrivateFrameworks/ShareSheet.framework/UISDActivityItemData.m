@implementation UISDActivityItemData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UISDActivityItemData)init
{
  UISDActivityItemData *v2;
  uint64_t v3;
  NSMutableDictionary *attachmentNamesByItem;
  uint64_t v5;
  NSMutableDictionary *subjectsByItem;
  uint64_t v7;
  NSMutableDictionary *previewImagesByItem;
  uint64_t v9;
  NSMutableDictionary *previewImageDataByItem;
  uint64_t v11;
  NSMutableDictionary *dataTypesByItem;
  uint64_t v13;
  NSDictionary *openURLAnnotationsByURL;
  uint64_t v15;
  NSArray *securityContexts;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)UISDActivityItemData;
  v2 = -[UISDActivityItemData init](&v18, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    attachmentNamesByItem = v2->_attachmentNamesByItem;
    v2->_attachmentNamesByItem = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    subjectsByItem = v2->_subjectsByItem;
    v2->_subjectsByItem = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    previewImagesByItem = v2->_previewImagesByItem;
    v2->_previewImagesByItem = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    previewImageDataByItem = v2->_previewImageDataByItem;
    v2->_previewImageDataByItem = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    dataTypesByItem = v2->_dataTypesByItem;
    v2->_dataTypesByItem = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    openURLAnnotationsByURL = v2->_openURLAnnotationsByURL;
    v2->_openURLAnnotationsByURL = (NSDictionary *)v13;

    v15 = objc_opt_new();
    securityContexts = v2->_securityContexts;
    v2->_securityContexts = (NSArray *)v15;

  }
  return v2;
}

- (UISDActivityItemData)initWithCoder:(id)a3
{
  id v4;
  UISDActivityItemData *v5;
  void *v6;
  uint64_t v7;
  NSMutableDictionary *attachmentNamesByItem;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *subjectsByItem;
  void *v12;
  uint64_t v13;
  NSMutableDictionary *previewImagesByItem;
  void *v15;
  uint64_t v16;
  NSMutableDictionary *previewImageDataByItem;
  void *v18;
  uint64_t v19;
  NSMutableDictionary *dataTypesByItem;
  void *v21;
  void *v22;
  uint64_t v23;
  NSDictionary *openURLAnnotationsByURL;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSArray *securityContexts;

  v4 = a3;
  v5 = -[UISDActivityItemData init](self, "init");
  if (v5)
  {
    NSStringFromSelector(sel_attachmentNamesByItem);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _UISecureDecodeExtensionItemsWithKey(v4, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    attachmentNamesByItem = v5->_attachmentNamesByItem;
    v5->_attachmentNamesByItem = (NSMutableDictionary *)v7;

    NSStringFromSelector(sel_subjectsByItem);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _UISecureDecodeExtensionItemsWithKey(v4, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    subjectsByItem = v5->_subjectsByItem;
    v5->_subjectsByItem = (NSMutableDictionary *)v10;

    NSStringFromSelector(sel_previewImagesByItem);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _UISecureDecodeExtensionItemsWithKey(v4, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    previewImagesByItem = v5->_previewImagesByItem;
    v5->_previewImagesByItem = (NSMutableDictionary *)v13;

    NSStringFromSelector(sel_previewImageDataByItem);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _UISecureDecodeExtensionItemsWithKey(v4, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    previewImageDataByItem = v5->_previewImageDataByItem;
    v5->_previewImageDataByItem = (NSMutableDictionary *)v16;

    NSStringFromSelector(sel_dataTypesByItem);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    _UISecureDecodeExtensionItemsWithKey(v4, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    dataTypesByItem = v5->_dataTypesByItem;
    v5->_dataTypesByItem = (NSMutableDictionary *)v19;

    _UISecureStandardPropertyListClasses();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_openURLAnnotationsByURL);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    openURLAnnotationsByURL = v5->_openURLAnnotationsByURL;
    v5->_openURLAnnotationsByURL = (NSDictionary *)v23;

    v25 = (void *)MEMORY[0x1E0C99E60];
    v26 = objc_opt_class();
    objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_securityContexts);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    securityContexts = v5->_securityContexts;
    v5->_securityContexts = (NSArray *)v29;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *attachmentNamesByItem;
  id v5;
  void *v6;
  NSMutableDictionary *subjectsByItem;
  void *v8;
  NSMutableDictionary *previewImagesByItem;
  void *v10;
  NSMutableDictionary *previewImageDataByItem;
  void *v12;
  NSMutableDictionary *dataTypesByItem;
  void *v14;
  NSDictionary *openURLAnnotationsByURL;
  void *v16;
  NSArray *securityContexts;
  id v18;

  attachmentNamesByItem = self->_attachmentNamesByItem;
  v5 = a3;
  NSStringFromSelector(sel_attachmentNamesByItem);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", attachmentNamesByItem, v6);

  subjectsByItem = self->_subjectsByItem;
  NSStringFromSelector(sel_subjectsByItem);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", subjectsByItem, v8);

  previewImagesByItem = self->_previewImagesByItem;
  NSStringFromSelector(sel_previewImagesByItem);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", previewImagesByItem, v10);

  previewImageDataByItem = self->_previewImageDataByItem;
  NSStringFromSelector(sel_previewImageDataByItem);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", previewImageDataByItem, v12);

  dataTypesByItem = self->_dataTypesByItem;
  NSStringFromSelector(sel_dataTypesByItem);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", dataTypesByItem, v14);

  openURLAnnotationsByURL = self->_openURLAnnotationsByURL;
  NSStringFromSelector(sel_openURLAnnotationsByURL);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", openURLAnnotationsByURL, v16);

  securityContexts = self->_securityContexts;
  NSStringFromSelector(sel_securityContexts);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", securityContexts, v18);

}

- (void)addAttachmentName:(id)a3 forItem:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_attachmentNamesByItem, "setObject:forKey:", a3, a4);
}

- (id)attachmentNameForItem:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_attachmentNamesByItem, "objectForKeyedSubscript:", a3);
}

- (void)addSubject:(id)a3 forItem:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_subjectsByItem, "setObject:forKey:", a3, a4);
}

- (id)subjectForItem:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_subjectsByItem, "objectForKeyedSubscript:", a3);
}

- (void)addPreviewImage:(id)a3 forItem:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_previewImagesByItem, "setObject:forKey:", a3, a4);
}

- (id)previewImageForItem:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_previewImagesByItem, "objectForKeyedSubscript:", a3);
}

- (void)addPreviewImageData:(id)a3 forItem:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_previewImageDataByItem, "setObject:forKey:", a3, a4);
}

- (id)previewImageDataForItem:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_previewImageDataByItem, "objectForKeyedSubscript:", a3);
}

- (void)addDataType:(id)a3 forItem:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_dataTypesByItem, "setObject:forKey:", a3, a4);
}

- (id)dataTypeForItem:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_dataTypesByItem, "objectForKeyedSubscript:", a3);
}

- (BOOL)canAccessFileURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[UISDActivityItemData securityContexts](self, "securityContexts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__UISDActivityItemData_canAccessFileURL___block_invoke;
  v8[3] = &unk_1E4002E58;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  LOBYTE(v5) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v5;
}

void __41__UISDActivityItemData_canAccessFileURL___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;

  objc_msgSend(a2, "accessibleURLs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (NSArray)securityContexts
{
  return self->_securityContexts;
}

- (void)setSecurityContexts:(id)a3
{
  objc_storeStrong((id *)&self->_securityContexts, a3);
}

- (NSDictionary)openURLAnnotationsByURL
{
  return self->_openURLAnnotationsByURL;
}

- (void)setOpenURLAnnotationsByURL:(id)a3
{
  objc_storeStrong((id *)&self->_openURLAnnotationsByURL, a3);
}

- (NSMutableDictionary)attachmentNamesByItem
{
  return self->_attachmentNamesByItem;
}

- (NSMutableDictionary)subjectsByItem
{
  return self->_subjectsByItem;
}

- (NSMutableDictionary)previewImagesByItem
{
  return self->_previewImagesByItem;
}

- (NSMutableDictionary)previewImageDataByItem
{
  return self->_previewImageDataByItem;
}

- (NSMutableDictionary)dataTypesByItem
{
  return self->_dataTypesByItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataTypesByItem, 0);
  objc_storeStrong((id *)&self->_previewImageDataByItem, 0);
  objc_storeStrong((id *)&self->_previewImagesByItem, 0);
  objc_storeStrong((id *)&self->_subjectsByItem, 0);
  objc_storeStrong((id *)&self->_attachmentNamesByItem, 0);
  objc_storeStrong((id *)&self->_openURLAnnotationsByURL, 0);
  objc_storeStrong((id *)&self->_securityContexts, 0);
}

@end
