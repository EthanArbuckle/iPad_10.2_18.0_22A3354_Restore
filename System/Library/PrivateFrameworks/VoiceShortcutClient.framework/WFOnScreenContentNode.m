@implementation WFOnScreenContentNode

- (WFOnScreenContentNode)init
{
  WFOnScreenContentNode *v2;
  uint64_t v3;
  NSArray *children;
  WFOnScreenContentNode *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFOnScreenContentNode;
  v2 = -[WFOnScreenContentNode init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    children = v2->_children;
    v2->_children = (NSArray *)v3;

    v5 = v2;
  }

  return v2;
}

- (WFOnScreenContentNode)initWithContentItem:(id)a3 file:(id)a4 applicationBundleIdentifier:(id)a5 source:(id)a6
{
  return -[WFOnScreenContentNode initWithContentItem:file:applicationBundleIdentifier:applicationFrame:applicationLevel:source:linkPresentationMetadata:](self, "initWithContentItem:file:applicationBundleIdentifier:applicationFrame:applicationLevel:source:linkPresentationMetadata:", a3, a4, a5, 0, a6, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (WFOnScreenContentNode)initWithContentItem:(id)a3 file:(id)a4 applicationBundleIdentifier:(id)a5 applicationFrame:(CGRect)a6 applicationLevel:(id)a7 source:(id)a8 linkPresentationMetadata:(id)a9
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v20;
  NSNumber *v21;
  id v22;
  id v23;
  WFOnScreenContentNode *v24;
  WFOnScreenContentNode *v25;
  WFOnScreenContentNode *v26;
  id v28;
  id v29;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v20 = a3;
  v29 = a4;
  v28 = a5;
  v21 = (NSNumber *)a7;
  v22 = a8;
  v23 = a9;
  v24 = -[WFOnScreenContentNode init](self, "init");
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_contentItem, a3);
    objc_storeStrong((id *)&v25->_file, a4);
    objc_storeStrong((id *)&v25->_applicationBundleIdentifier, a5);
    v25->_applicationFrame.origin.x = x;
    v25->_applicationFrame.origin.y = y;
    v25->_applicationFrame.size.width = width;
    v25->_applicationFrame.size.height = height;
    v25->_applicationLevel = v21;
    objc_storeStrong((id *)&v25->_source, a8);
    objc_storeStrong((id *)&v25->_linkPresentationMetadata, a9);
    -[WFOnScreenContentNode populateObjectsFromContentItem:](v25, "populateObjectsFromContentItem:", v20, v28, v29);
    v26 = v25;
  }

  return v25;
}

- (WFOnScreenContentNode)initWithFile:(id)a3 applicationBundleIdentifier:(id)a4 source:(id)a5
{
  id v9;
  id v10;
  id v11;
  WFOnScreenContentNode *v12;
  WFOnScreenContentNode *v13;
  WFOnScreenContentNode *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)WFOnScreenContentNode;
  v12 = -[WFOnScreenContentNode init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_file, a3);
    objc_storeStrong((id *)&v13->_applicationBundleIdentifier, a4);
    objc_storeStrong((id *)&v13->_source, a5);
    v14 = v13;
  }

  return v13;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  INFile *file;
  void *v8;
  void *v9;
  objc_super v10;

  -[WFOnScreenContentNode file](self, "file");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFOnScreenContentNode file](self, "file");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startAccessingSecurityScopedResource");

    file = self->_file;
    self->_file = 0;

    -[WFOnScreenContentNode file](self, "file");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stopAccessingSecurityScopedResource");

  }
  v10.receiver = self;
  v10.super_class = (Class)WFOnScreenContentNode;
  -[WFOnScreenContentNode dealloc](&v10, sel_dealloc);
}

- (NSString)fileTypeIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[WFOnScreenContentNode file](self, "file");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFOnScreenContentNode file](self, "file");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFFileType typeFromFileExtension:](WFFileType, "typeFromFileExtension:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return (NSString *)v9;
}

- (NSDate)fileCreationDate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v8;

  -[WFOnScreenContentNode file](self, "file");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return (NSDate *)0;
  -[WFOnScreenContentNode file](self, "file");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v5, "getResourceValue:forKey:error:", &v8, *MEMORY[0x1E0C998E8], 0);
  v6 = v8;

  return (NSDate *)v6;
}

- (void)addChild:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *children;

  if (a3)
  {
    v4 = a3;
    -[WFOnScreenContentNode children](self, "children");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSArray *)objc_msgSend(v5, "mutableCopy");

    -[NSArray addObject:](v6, "addObject:", v4);
    children = self->_children;
    self->_children = v6;

  }
}

- (void)removeChild:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *children;

  if (a3)
  {
    v4 = a3;
    -[WFOnScreenContentNode children](self, "children");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (NSArray *)objc_msgSend(v5, "mutableCopy");

    -[NSArray removeObject:](v6, "removeObject:", v4);
    children = self->_children;
    self->_children = v6;

  }
}

- (void)addChildren:(id)a3
{
  void *v4;
  NSArray *v5;
  NSArray *children;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    -[WFOnScreenContentNode children](self, "children");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSArray *)objc_msgSend(v4, "mutableCopy");

    -[NSArray addObjectsFromArray:](v5, "addObjectsFromArray:", v7);
    children = self->_children;
    self->_children = v5;

  }
}

- (void)populateObjectsFromContentItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSString *v7;
  id string;
  void *v9;
  id v10;
  NSURL *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  NSString *v17;
  NSString *contactIdentifier;
  void *v19;
  id v20;
  void *v21;
  NSString *v22;
  NSString *photoAssetIdentifier;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v4 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v5 = (void *)getWFStringContentItemClass_softClass;
  v32 = getWFStringContentItemClass_softClass;
  if (!getWFStringContentItemClass_softClass)
  {
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __getWFStringContentItemClass_block_invoke;
    v27 = &unk_1E5FC8858;
    v28 = &v29;
    __getWFStringContentItemClass_block_invoke((uint64_t)&v24);
    v5 = (void *)v30[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v29, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "string");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    string = self->_string;
    self->_string = v7;
LABEL_17:

    goto LABEL_18;
  }
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v9 = (void *)getWFURLContentItemClass_softClass;
  v32 = getWFURLContentItemClass_softClass;
  if (!getWFURLContentItemClass_softClass)
  {
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __getWFURLContentItemClass_block_invoke;
    v27 = &unk_1E5FC8858;
    v28 = &v29;
    __getWFURLContentItemClass_block_invoke((uint64_t)&v24);
    v9 = (void *)v30[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v29, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "URL");
    v11 = (NSURL *)objc_claimAutoreleasedReturnValue();
    string = self->_URL;
    self->_URL = v11;
    goto LABEL_17;
  }
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v12 = (void *)getWFContactContentItemClass_softClass;
  v32 = getWFContactContentItemClass_softClass;
  if (!getWFContactContentItemClass_softClass)
  {
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __getWFContactContentItemClass_block_invoke;
    v27 = &unk_1E5FC8858;
    v28 = &v29;
    __getWFContactContentItemClass_block_invoke((uint64_t)&v24);
    v12 = (void *)v30[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v29, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    string = v4;
    objc_msgSend(string, "contact");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v30 = &v29;
    v31 = 0x2050000000;
    v15 = (void *)getWFCNContactClass_softClass;
    v32 = getWFCNContactClass_softClass;
    if (!getWFCNContactClass_softClass)
    {
      v24 = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = __getWFCNContactClass_block_invoke;
      v27 = &unk_1E5FC8858;
      v28 = &v29;
      __getWFCNContactClass_block_invoke((uint64_t)&v24);
      v15 = (void *)v30[3];
    }
    v16 = objc_retainAutorelease(v15);
    _Block_object_dispose(&v29, 8);
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v14, "contactIdentifier");
      v17 = (NSString *)objc_claimAutoreleasedReturnValue();
      contactIdentifier = self->_contactIdentifier;
      self->_contactIdentifier = v17;

    }
    goto LABEL_17;
  }
LABEL_18:
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v19 = (void *)getWFPhotoMediaContentItemClass_softClass;
  v32 = getWFPhotoMediaContentItemClass_softClass;
  if (!getWFPhotoMediaContentItemClass_softClass)
  {
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __getWFPhotoMediaContentItemClass_block_invoke;
    v27 = &unk_1E5FC8858;
    v28 = &v29;
    __getWFPhotoMediaContentItemClass_block_invoke((uint64_t)&v24);
    v19 = (void *)v30[3];
  }
  v20 = objc_retainAutorelease(v19);
  _Block_object_dispose(&v29, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "asset");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localIdentifier");
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    photoAssetIdentifier = self->_photoAssetIdentifier;
    self->_photoAssetIdentifier = v22;

  }
}

- (WFOnScreenContentNode)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  char *v40;
  objc_super v42;
  __int128 v43;
  __int128 v44;
  NSUInteger *v45;
  NSUInteger sizep;
  NSUInteger *p_sizep;
  uint64_t v48;
  uint64_t v49;

  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)WFOnScreenContentNode;
  v5 = -[WFOnScreenContentNode init](&v42, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("string"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("file"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    sizep = 0;
    p_sizep = &sizep;
    v48 = 0x2050000000;
    v13 = (void *)getWFContentItemClass_softClass_11536;
    v49 = getWFContentItemClass_softClass_11536;
    if (!getWFContentItemClass_softClass_11536)
    {
      *(_QWORD *)&v43 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v43 + 1) = 3221225472;
      *(_QWORD *)&v44 = __getWFContentItemClass_block_invoke_11537;
      *((_QWORD *)&v44 + 1) = &unk_1E5FC8858;
      v45 = &sizep;
      __getWFContentItemClass_block_invoke_11537((uint64_t)&v43);
      v13 = (void *)p_sizep[3];
    }
    v14 = objc_retainAutorelease(v13);
    _Block_object_dispose(&sizep, 8);
    objc_msgSend(v12, "setWithObjects:", v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("contentItem"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)*((_QWORD *)v5 + 11);
    *((_QWORD *)v5 + 11) = v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationBundleIdentifier"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)*((_QWORD *)v5 + 8);
    *((_QWORD *)v5 + 8) = v18;

    *((_QWORD *)v5 + 9) = (id)objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationLevel"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("source"));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)*((_QWORD *)v5 + 12);
    *((_QWORD *)v5 + 12) = v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("chatRegistryContinuityKey"));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contactIdentifier"));
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)*((_QWORD *)v5 + 6);
    *((_QWORD *)v5 + 6) = v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("photoAssetIdentifier"));
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = v26;

    sizep = 0;
    p_sizep = &sizep;
    v48 = 0x2050000000;
    v28 = (void *)getLPLinkMetadataClass_softClass_11539;
    v49 = getLPLinkMetadataClass_softClass_11539;
    if (!getLPLinkMetadataClass_softClass_11539)
    {
      *(_QWORD *)&v43 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v43 + 1) = 3221225472;
      *(_QWORD *)&v44 = __getLPLinkMetadataClass_block_invoke_11540;
      *((_QWORD *)&v44 + 1) = &unk_1E5FC8858;
      v45 = &sizep;
      __getLPLinkMetadataClass_block_invoke_11540((uint64_t)&v43);
      v28 = (void *)p_sizep[3];
    }
    v29 = objc_retainAutorelease(v28);
    _Block_object_dispose(&sizep, 8);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("linkPresentationMetadata"));
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)*((_QWORD *)v5 + 10);
    *((_QWORD *)v5 + 10) = v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("applicationFrame"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    v43 = *MEMORY[0x1E0C9D628];
    v44 = v33;
    sizep = 0;
    NSGetSizeAndAlignment("{CGRect={CGPoint=dd}{CGSize=dd}}", &sizep, 0);
    if (sizep == 32)
    {
      objc_msgSend(v32, "getValue:", &v43);
      v34 = v44;
      *(_OWORD *)(v5 + 104) = v43;
      *(_OWORD *)(v5 + 120) = v34;
    }
    v35 = (void *)MEMORY[0x1E0C99E60];
    v36 = objc_opt_class();
    objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("children"));
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = v38;

    v40 = v5;
  }

  return (WFOnScreenContentNode *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v22[4];

  v4 = a3;
  -[WFOnScreenContentNode string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("string"));

  -[WFOnScreenContentNode URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("URL"));

  -[WFOnScreenContentNode file](self, "file");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("file"));

  -[WFOnScreenContentNode contentItem](self, "contentItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("contentItem"));

  -[WFOnScreenContentNode applicationBundleIdentifier](self, "applicationBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("applicationBundleIdentifier"));

  -[WFOnScreenContentNode applicationLevel](self, "applicationLevel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("applicationLevel"));

  -[WFOnScreenContentNode source](self, "source");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("source"));

  -[WFOnScreenContentNode chatRegistryContinuityKey](self, "chatRegistryContinuityKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("chatRegistryContinuityKey"));

  -[WFOnScreenContentNode contactIdentifier](self, "contactIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("contactIdentifier"));

  -[WFOnScreenContentNode photoAssetIdentifier](self, "photoAssetIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("photoAssetIdentifier"));

  -[WFOnScreenContentNode linkPresentationMetadata](self, "linkPresentationMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("linkPresentationMetadata"));

  -[WFOnScreenContentNode applicationFrame](self, "applicationFrame");
  v22[0] = v16;
  v22[1] = v17;
  v22[2] = v18;
  v22[3] = v19;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v22, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v20, CFSTR("applicationFrame"));

  -[WFOnScreenContentNode children](self, "children");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v21, CFSTR("children"));

}

- (NSURL)URL
{
  return self->_URL;
}

- (NSString)string
{
  return self->_string;
}

- (INFile)file
{
  return self->_file;
}

- (NSArray)children
{
  return self->_children;
}

- (NSString)chatRegistryContinuityKey
{
  return self->_chatRegistryContinuityKey;
}

- (void)setChatRegistryContinuityKey:(id)a3
{
  objc_storeStrong((id *)&self->_chatRegistryContinuityKey, a3);
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSString)photoAssetIdentifier
{
  return self->_photoAssetIdentifier;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (CGRect)applicationFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_applicationFrame.origin.x;
  y = self->_applicationFrame.origin.y;
  width = self->_applicationFrame.size.width;
  height = self->_applicationFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSNumber)applicationLevel
{
  return self->_applicationLevel;
}

- (LPLinkMetadata)linkPresentationMetadata
{
  return self->_linkPresentationMetadata;
}

- (WFContentItem)contentItem
{
  return self->_contentItem;
}

- (NSString)source
{
  return self->_source;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_contentItem, 0);
  objc_storeStrong((id *)&self->_linkPresentationMetadata, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_photoAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_chatRegistryContinuityKey, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
