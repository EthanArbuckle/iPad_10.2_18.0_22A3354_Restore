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
  NSArray *v15;
  NSArray *securityContexts;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)UISDActivityItemData;
  v2 = -[UISDActivityItemData init](&v18, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    attachmentNamesByItem = v2->_attachmentNamesByItem;
    v2->_attachmentNamesByItem = (NSMutableDictionary *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    subjectsByItem = v2->_subjectsByItem;
    v2->_subjectsByItem = (NSMutableDictionary *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    previewImagesByItem = v2->_previewImagesByItem;
    v2->_previewImagesByItem = (NSMutableDictionary *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    previewImageDataByItem = v2->_previewImageDataByItem;
    v2->_previewImageDataByItem = (NSMutableDictionary *)v9;

    v11 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    dataTypesByItem = v2->_dataTypesByItem;
    v2->_dataTypesByItem = (NSMutableDictionary *)v11;

    v13 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    openURLAnnotationsByURL = v2->_openURLAnnotationsByURL;
    v2->_openURLAnnotationsByURL = (NSDictionary *)v13;

    v15 = objc_opt_new(NSArray);
    securityContexts = v2->_securityContexts;
    v2->_securityContexts = v15;

  }
  return v2;
}

- (UISDActivityItemData)initWithCoder:(id)a3
{
  id v4;
  UISDActivityItemData *v5;
  NSString *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableDictionary *attachmentNamesByItem;
  NSString *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableDictionary *subjectsByItem;
  NSString *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSMutableDictionary *previewImagesByItem;
  NSString *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSMutableDictionary *previewImageDataByItem;
  NSString *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  NSMutableDictionary *dataTypesByItem;
  uint64_t v31;
  void *v32;
  NSString *v33;
  void *v34;
  uint64_t v35;
  NSDictionary *openURLAnnotationsByURL;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSSet *v40;
  void *v41;
  NSString *v42;
  void *v43;
  uint64_t v44;
  NSArray *securityContexts;

  v4 = a3;
  v5 = -[UISDActivityItemData init](self, "init");
  if (v5)
  {
    v6 = NSStringFromSelector("attachmentNamesByItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = _UISecureDecodeExtensionItemsWithKey(v4, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    attachmentNamesByItem = v5->_attachmentNamesByItem;
    v5->_attachmentNamesByItem = (NSMutableDictionary *)v9;

    v11 = NSStringFromSelector("subjectsByItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = _UISecureDecodeExtensionItemsWithKey(v4, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    subjectsByItem = v5->_subjectsByItem;
    v5->_subjectsByItem = (NSMutableDictionary *)v14;

    v16 = NSStringFromSelector("previewImagesByItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = _UISecureDecodeExtensionItemsWithKey(v4, v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    previewImagesByItem = v5->_previewImagesByItem;
    v5->_previewImagesByItem = (NSMutableDictionary *)v19;

    v21 = NSStringFromSelector("previewImageDataByItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = _UISecureDecodeExtensionItemsWithKey(v4, v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    previewImageDataByItem = v5->_previewImageDataByItem;
    v5->_previewImageDataByItem = (NSMutableDictionary *)v24;

    v26 = NSStringFromSelector("dataTypesByItem");
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = _UISecureDecodeExtensionItemsWithKey(v4, v27);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    dataTypesByItem = v5->_dataTypesByItem;
    v5->_dataTypesByItem = (NSMutableDictionary *)v29;

    v31 = _UISecureStandardPropertyListClasses();
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v33 = NSStringFromSelector("openURLAnnotationsByURL");
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, v34));
    openURLAnnotationsByURL = v5->_openURLAnnotationsByURL;
    v5->_openURLAnnotationsByURL = (NSDictionary *)v35;

    v38 = objc_opt_class(NSArray, v37);
    v40 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v38, objc_opt_class(UISUISecurityContext, v39), 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    v42 = NSStringFromSelector("securityContexts");
    v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
    v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v41, v43));
    securityContexts = v5->_securityContexts;
    v5->_securityContexts = (NSArray *)v44;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *attachmentNamesByItem;
  id v5;
  NSString *v6;
  void *v7;
  NSMutableDictionary *subjectsByItem;
  NSString *v9;
  void *v10;
  NSMutableDictionary *previewImagesByItem;
  NSString *v12;
  void *v13;
  NSMutableDictionary *previewImageDataByItem;
  NSString *v15;
  void *v16;
  NSMutableDictionary *dataTypesByItem;
  NSString *v18;
  void *v19;
  NSDictionary *openURLAnnotationsByURL;
  NSString *v21;
  void *v22;
  NSArray *securityContexts;
  NSString *v24;
  id v25;

  attachmentNamesByItem = self->_attachmentNamesByItem;
  v5 = a3;
  v6 = NSStringFromSelector("attachmentNamesByItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "encodeObject:forKey:", attachmentNamesByItem, v7);

  subjectsByItem = self->_subjectsByItem;
  v9 = NSStringFromSelector("subjectsByItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v5, "encodeObject:forKey:", subjectsByItem, v10);

  previewImagesByItem = self->_previewImagesByItem;
  v12 = NSStringFromSelector("previewImagesByItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v5, "encodeObject:forKey:", previewImagesByItem, v13);

  previewImageDataByItem = self->_previewImageDataByItem;
  v15 = NSStringFromSelector("previewImageDataByItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  objc_msgSend(v5, "encodeObject:forKey:", previewImageDataByItem, v16);

  dataTypesByItem = self->_dataTypesByItem;
  v18 = NSStringFromSelector("dataTypesByItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  objc_msgSend(v5, "encodeObject:forKey:", dataTypesByItem, v19);

  openURLAnnotationsByURL = self->_openURLAnnotationsByURL;
  v21 = NSStringFromSelector("openURLAnnotationsByURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  objc_msgSend(v5, "encodeObject:forKey:", openURLAnnotationsByURL, v22);

  securityContexts = self->_securityContexts;
  v24 = NSStringFromSelector("securityContexts");
  v25 = (id)objc_claimAutoreleasedReturnValue(v24);
  objc_msgSend(v5, "encodeObject:forKey:", securityContexts, v25);

}

- (void)addAttachmentName:(id)a3 forItem:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_attachmentNamesByItem, "setObject:forKey:", a3, a4);
}

- (id)attachmentNameForItem:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_attachmentNamesByItem, "objectForKeyedSubscript:", a3);
}

- (void)addSubject:(id)a3 forItem:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_subjectsByItem, "setObject:forKey:", a3, a4);
}

- (id)subjectForItem:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_subjectsByItem, "objectForKeyedSubscript:", a3);
}

- (void)addPreviewImage:(id)a3 forItem:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_previewImagesByItem, "setObject:forKey:", a3, a4);
}

- (id)previewImageForItem:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_previewImagesByItem, "objectForKeyedSubscript:", a3);
}

- (void)addPreviewImageData:(id)a3 forItem:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_previewImageDataByItem, "setObject:forKey:", a3, a4);
}

- (id)previewImageDataForItem:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_previewImageDataByItem, "objectForKeyedSubscript:", a3);
}

- (void)addDataType:(id)a3 forItem:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_dataTypesByItem, "setObject:forKey:", a3, a4);
}

- (id)dataTypeForItem:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_dataTypesByItem, "objectForKeyedSubscript:", a3);
}

- (BOOL)canAccessFileURL:(id)a3
{
  id v5;
  void *v6;
  id v7;
  char v8;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  SEL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v5 = a3;
  if ((objc_msgSend(v5, "isFileURL") & 1) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UISDActivityItemData.m"), 121, CFSTR("url provided is not a fileURL:%@"), v5);

  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UISDActivityItemData securityContexts](self, "securityContexts"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000E534C;
  v11[3] = &unk_1007173E0;
  v14 = a2;
  v11[4] = self;
  v7 = v5;
  v12 = v7;
  v13 = &v15;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);

  v8 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return v8;
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
