@implementation TUConversationActivityMetadata

- (TUConversationActivityMetadata)initWithContext:(id)a3 linkMetadata:(id)a4 fallbackURL:(id)a5 invitationURL:(id)a6 supportsContinuationOnTV:(BOOL)a7 title:(id)a8 subTitle:(id)a9 imageData:(id)a10 preferredBroadcastingAttributes:(int64_t)a11 sceneAssociationBehavior:(id)a12 supportsActivityPreviews:(BOOL)a13 lifetimePolicy:(int64_t)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  TUConversationActivityMetadata *v26;
  uint64_t v27;
  TUConversationActivityContext *context;
  uint64_t v29;
  NSData *linkMetadatablob;
  uint64_t v31;
  NSURL *fallbackURL;
  uint64_t v33;
  NSURL *invitationURL;
  uint64_t v35;
  NSString *title;
  uint64_t v37;
  NSString *subTitle;
  id v41;
  objc_super v42;

  v41 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a12;
  v42.receiver = self;
  v42.super_class = (Class)TUConversationActivityMetadata;
  v26 = -[TUConversationActivityMetadata init](&v42, sel_init);
  if (v26)
  {
    v27 = objc_msgSend(v41, "copy");
    context = v26->_context;
    v26->_context = (TUConversationActivityContext *)v27;

    v29 = objc_msgSend(v19, "copy");
    linkMetadatablob = v26->_linkMetadatablob;
    v26->_linkMetadatablob = (NSData *)v29;

    v31 = objc_msgSend(v20, "copy");
    fallbackURL = v26->_fallbackURL;
    v26->_fallbackURL = (NSURL *)v31;

    v33 = objc_msgSend(v21, "copy");
    invitationURL = v26->_invitationURL;
    v26->_invitationURL = (NSURL *)v33;

    v26->_supportsContinuationOnTV = a7;
    v35 = objc_msgSend(v22, "copy");
    title = v26->_title;
    v26->_title = (NSString *)v35;

    v37 = objc_msgSend(v23, "copy");
    subTitle = v26->_subTitle;
    v26->_subTitle = (NSString *)v37;

    objc_storeStrong((id *)&v26->_imageData, a10);
    v26->_preferredBroadcastingAttributes = a11;
    objc_storeStrong((id *)&v26->_sceneAssociationBehavior, a12);
    v26->_supportsActivityPreviews = a13;
    v26->_lifetimePolicy = a14;
  }

  return v26;
}

- (TUConversationActivityMetadata)initWithContext:(id)a3 linkMetadata:(id)a4 fallbackURL:(id)a5 invitationURL:(id)a6 supportsContinuationOnTV:(BOOL)a7 title:(id)a8 subTitle:(id)a9 imageData:(id)a10 preferredBroadcastingAttributes:(int64_t)a11 sceneAssociationBehavior:(id)a12 supportsActivityPreviews:(BOOL)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  TUConversationActivityMetadata *v25;
  uint64_t v26;
  TUConversationActivityContext *context;
  uint64_t v28;
  NSData *linkMetadatablob;
  uint64_t v30;
  NSURL *fallbackURL;
  uint64_t v32;
  NSURL *invitationURL;
  uint64_t v34;
  NSString *title;
  uint64_t v36;
  NSString *subTitle;
  id v40;
  objc_super v41;

  v40 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a12;
  v41.receiver = self;
  v41.super_class = (Class)TUConversationActivityMetadata;
  v25 = -[TUConversationActivityMetadata init](&v41, sel_init);
  if (v25)
  {
    v26 = objc_msgSend(v40, "copy");
    context = v25->_context;
    v25->_context = (TUConversationActivityContext *)v26;

    v28 = objc_msgSend(v18, "copy");
    linkMetadatablob = v25->_linkMetadatablob;
    v25->_linkMetadatablob = (NSData *)v28;

    v30 = objc_msgSend(v19, "copy");
    fallbackURL = v25->_fallbackURL;
    v25->_fallbackURL = (NSURL *)v30;

    v32 = objc_msgSend(v20, "copy");
    invitationURL = v25->_invitationURL;
    v25->_invitationURL = (NSURL *)v32;

    v25->_supportsContinuationOnTV = a7;
    v34 = objc_msgSend(v21, "copy");
    title = v25->_title;
    v25->_title = (NSString *)v34;

    v36 = objc_msgSend(v22, "copy");
    subTitle = v25->_subTitle;
    v25->_subTitle = (NSString *)v36;

    objc_storeStrong((id *)&v25->_imageData, a10);
    v25->_preferredBroadcastingAttributes = a11;
    objc_storeStrong((id *)&v25->_sceneAssociationBehavior, a12);
    v25->_supportsActivityPreviews = a13;
    v25->_lifetimePolicy = 2;
  }

  return v25;
}

- (TUConversationActivityMetadata)initWithContext:(id)a3 linkMetadata:(id)a4 fallbackURL:(id)a5 invitationURL:(id)a6 supportsContinuationOnTV:(BOOL)a7 title:(id)a8 subTitle:(id)a9 imageData:(id)a10
{
  _BOOL8 v11;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  TUConversationActivityMetadata *v25;
  uint64_t v27;

  v11 = a7;
  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  +[TUConversationActivitySceneAssociationBehavior defaultBehavior](TUConversationActivitySceneAssociationBehavior, "defaultBehavior");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v27) = 0;
  v25 = -[TUConversationActivityMetadata initWithContext:linkMetadata:fallbackURL:invitationURL:supportsContinuationOnTV:title:subTitle:imageData:preferredBroadcastingAttributes:sceneAssociationBehavior:supportsActivityPreviews:lifetimePolicy:](self, "initWithContext:linkMetadata:fallbackURL:invitationURL:supportsContinuationOnTV:title:subTitle:imageData:preferredBroadcastingAttributes:sceneAssociationBehavior:supportsActivityPreviews:lifetimePolicy:", v23, v22, v21, v20, v11, v19, v18, v17, 0, v24, v27, 2);

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  int64_t v25;
  void *v26;
  void *v27;
  void *v28;
  const char *v29;
  void *v30;
  id v31;

  v31 = a3;
  v4 = (void *)MEMORY[0x19AEC924C]();
  -[TUConversationActivityMetadata context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_context);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "encodeObject:forKey:", v5, v6);

  -[TUConversationActivityMetadata linkMetadatablob](self, "linkMetadatablob");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_linkMetadatablob);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "encodeObject:forKey:", v7, v8);

  -[TUConversationActivityMetadata fallbackURL](self, "fallbackURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_fallbackURL);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "encodeObject:forKey:", v9, v10);

  -[TUConversationActivityMetadata invitationURL](self, "invitationURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_invitationURL);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "encodeObject:forKey:", v11, v12);

  v13 = -[TUConversationActivityMetadata supportsContinuationOnTV](self, "supportsContinuationOnTV");
  NSStringFromSelector(sel_supportsContinuationOnTV);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "encodeBool:forKey:", v13, v14);

  -[TUConversationActivityMetadata title](self, "title");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_title);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "encodeObject:forKey:", v15, v16);

  -[TUConversationActivityMetadata subTitle](self, "subTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_subTitle);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "encodeObject:forKey:", v17, v18);

  v19 = -[TUConversationActivityMetadata preferredBroadcastingAttributes](self, "preferredBroadcastingAttributes");
  NSStringFromSelector(sel_preferredBroadcastingAttributes);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "encodeInteger:forKey:", v19, v20);

  -[TUConversationActivityMetadata sceneAssociationBehavior](self, "sceneAssociationBehavior");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sceneAssociationBehavior);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "encodeObject:forKey:", v21, v22);

  v23 = -[TUConversationActivityMetadata supportsActivityPreviews](self, "supportsActivityPreviews");
  NSStringFromSelector(sel_supportsActivityPreviews);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "encodeBool:forKey:", v23, v24);

  v25 = -[TUConversationActivityMetadata lifetimePolicy](self, "lifetimePolicy");
  NSStringFromSelector(sel_lifetimePolicy);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "encodeInteger:forKey:", v25, v26);

  -[TUConversationActivityMetadata imageFileURL](self, "imageFileURL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[TUConversationActivityMetadata imageFileURL](self, "imageFileURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = sel_imageFileURL;
  }
  else
  {
    -[TUConversationActivityMetadata imageData](self, "imageData");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = sel_imageData;
  }
  NSStringFromSelector(v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "encodeObject:forKey:", v28, v30);

  objc_autoreleasePoolPop(v4);
}

- (TUConversationActivityMetadata)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  TUConversationActivityMetadata *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  void *v46;
  void *v47;
  void *context;
  uint64_t v50;
  uint64_t v51;

  v3 = a3;
  context = (void *)MEMORY[0x19AEC924C]();
  v4 = objc_opt_class();
  NSStringFromSelector(sel_context);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v4, v5);
  v51 = objc_claimAutoreleasedReturnValue();

  v6 = objc_opt_class();
  NSStringFromSelector(sel_linkMetadatablob);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v6, v7);
  v50 = objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_fallbackURL);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  NSStringFromSelector(sel_invitationURL);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v11, v12);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_supportsContinuationOnTV);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v3, "decodeBoolForKey:", v13);

  v14 = objc_opt_class();
  NSStringFromSelector(sel_title);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v14, v15);
  v16 = objc_claimAutoreleasedReturnValue();

  v17 = objc_opt_class();
  NSStringFromSelector(sel_subTitle);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v17, v18);
  v19 = objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_preferredBroadcastingAttributes);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v3, "decodeIntegerForKey:", v20);

  v22 = objc_opt_class();
  NSStringFromSelector(sel_imageData);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_opt_class();
  NSStringFromSelector(sel_sceneAssociationBehavior);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_supportsActivityPreviews);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v26) = objc_msgSend(v3, "decodeBoolForKey:", v28);

  NSStringFromSelector(sel_lifetimePolicy);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v3, "decodeIntegerForKey:", v29);

  v44 = v30;
  v31 = (void *)v50;
  LOBYTE(v43) = (_BYTE)v26;
  v32 = (void *)v51;
  v42 = v19;
  v47 = (void *)v19;
  v33 = (void *)v16;
  v34 = -[TUConversationActivityMetadata initWithContext:linkMetadata:fallbackURL:invitationURL:supportsContinuationOnTV:title:subTitle:imageData:preferredBroadcastingAttributes:sceneAssociationBehavior:supportsActivityPreviews:lifetimePolicy:](self, "initWithContext:linkMetadata:fallbackURL:invitationURL:supportsContinuationOnTV:title:subTitle:imageData:preferredBroadcastingAttributes:sceneAssociationBehavior:supportsActivityPreviews:lifetimePolicy:", v51, v50, v10, v46, v45, v16, v42, v24, v21, v27, v43, v44);
  v35 = objc_opt_class();
  NSStringFromSelector(sel_imageFileURL);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "connection");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "URL");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v38, "tu_clientSandboxCanAccessFileURL:", v39);

      if (v40)
        -[TUConversationActivityMetadata setImageFileURL:](v34, "setImageFileURL:", v37);

      v32 = (void *)v51;
      v31 = (void *)v50;
    }
    else
    {
      -[TUConversationActivityMetadata setImageFileURL:](v34, "setImageFileURL:", v37);
    }
  }

  objc_autoreleasePoolPop(context);
  return v34;
}

- (id)_imagePreviewDirectoryPath
{
  void *v2;
  void *v3;

  NSTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("groupactivityimgpreview"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_filePathForImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  TUSandboxExtendedURL *v8;
  void *v9;
  TUSandboxExtendedURL *v10;
  void *v11;
  void *v12;

  -[TUConversationActivityMetadata imageFileURL](self, "imageFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TUConversationActivityMetadata imageFileURL](self, "imageFileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TUConversationActivityMetadata _imagePreviewDirectoryPath](self, "_imagePreviewDirectoryPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = [TUSandboxExtendedURL alloc];
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[TUSandboxExtendedURL initWithURL:](v8, "initWithURL:", v9);
    -[TUConversationActivityMetadata setImageFileURL:](self, "setImageFileURL:", v10);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *MEMORY[0x1E0C80000]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUConversationActivityMetadata imageFileURL](self, "imageFileURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSandboxExtensionClass:", v11);

    -[TUConversationActivityMetadata imageFileURL](self, "imageFileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (BOOL)_createImageFolderIfNeeded
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[TUConversationActivityMetadata _imagePreviewDirectoryPath](self, "_imagePreviewDirectoryPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v2, 0);

  v5 = 0;
  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0CB2AD8];
    v12[0] = *MEMORY[0x1E0CB2AC0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v2, 1, v7, &v10);
    v5 = v10;

    if (v5)
    {
      TUDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[TUConversationActivityMetadata _createImageFolderIfNeeded].cold.1();

    }
  }

  return v5 == 0;
}

- (void)saveImageToDisk
{
  OUTLINED_FUNCTION_0(&dword_19A50D000, a2, a3, "TUConversationActivityMetadata %@ failed to create image folder, can't write to disk.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)removeImageDiskFile
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_19A50D000, v0, v1, "TUConversationActivityMetadata %@ Wasn't able to delete image file error %@");
  OUTLINED_FUNCTION_1();
}

- (NSData)imageData
{
  NSData *imageData;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;

  imageData = self->_imageData;
  if (imageData)
    return imageData;
  -[TUConversationActivityMetadata imageFileURL](self, "imageFileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99D50];
    -[TUConversationActivityMetadata imageFileURL](self, "imageFileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v6, "dataWithContentsOfURL:options:error:", v8, 8, &v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v11;

    if (v9)
    {
      TUDefaultLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[TUConversationActivityMetadata imageData].cold.1();

    }
  }
  return (NSData *)v5;
}

- (int64_t)contentAssociation
{
  return self->_lifetimePolicy;
}

- (BOOL)isEqual:(id)a3
{
  TUConversationActivityMetadata *v4;
  BOOL v5;

  v4 = (TUConversationActivityMetadata *)a3;
  if (-[TUConversationActivityMetadata isMemberOfClass:](v4, "isMemberOfClass:", objc_opt_class()))
    v5 = v4 == self
      || -[TUConversationActivityMetadata _isEqualToActivityMetadata:](self, "_isEqualToActivityMetadata:", v4);
  else
    v5 = 0;

  return v5;
}

- (BOOL)isEquivalentToActivityMetadata:(id)a3
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
  int v13;
  BOOL v14;
  unint64_t v15;
  int64_t v16;
  void *v17;
  int v18;
  int64_t v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = a3;
  -[TUConversationActivityMetadata context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", v6))
  {
    -[TUConversationActivityMetadata linkMetadatablob](self, "linkMetadatablob");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkMetadatablob");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (TUObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      -[TUConversationActivityMetadata fallbackURL](self, "fallbackURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "fallbackURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (TUObjectsAreEqualOrNil((unint64_t)v9, (uint64_t)v10))
      {
        -[TUConversationActivityMetadata invitationURL](self, "invitationURL");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "invitationURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (TUObjectsAreEqualOrNil((unint64_t)v11, (uint64_t)v12))
        {
          v27 = v11;
          v13 = -[TUConversationActivityMetadata supportsContinuationOnTV](self, "supportsContinuationOnTV");
          if (v13 == objc_msgSend(v4, "supportsContinuationOnTV"))
          {
            -[TUConversationActivityMetadata title](self, "title");
            v15 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "title");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = (void *)v15;
            if (TUObjectsAreEqualOrNil(v15, (uint64_t)v25))
            {
              -[TUConversationActivityMetadata subTitle](self, "subTitle");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "subTitle");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              if (TUObjectsAreEqualOrNil((unint64_t)v24, (uint64_t)v23)
                && (v16 = -[TUConversationActivityMetadata preferredBroadcastingAttributes](self, "preferredBroadcastingAttributes"), v16 == objc_msgSend(v4, "preferredBroadcastingAttributes")))
              {
                -[TUConversationActivityMetadata sceneAssociationBehavior](self, "sceneAssociationBehavior");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "sceneAssociationBehavior");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = v17;
                if (objc_msgSend(v17, "isEqual:")
                  && (v18 = -[TUConversationActivityMetadata supportsActivityPreviews](self, "supportsActivityPreviews"),
                      v18 == objc_msgSend(v4, "supportsActivityPreviews")))
                {
                  v19 = -[TUConversationActivityMetadata lifetimePolicy](self, "lifetimePolicy");
                  v14 = v19 == objc_msgSend(v4, "lifetimePolicy");
                }
                else
                {
                  v14 = 0;
                }
                v11 = v27;

              }
              else
              {
                v14 = 0;
                v11 = v27;
              }

            }
            else
            {
              v14 = 0;
              v11 = v27;
            }

          }
          else
          {
            v14 = 0;
            v11 = v27;
          }
        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)_isEqualToActivityMetadata:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;
  void *v11;

  v4 = a3;
  if (-[TUConversationActivityMetadata isEquivalentToActivityMetadata:](self, "isEquivalentToActivityMetadata:", v4))
  {
    -[TUConversationActivityMetadata imageFileURL](self, "imageFileURL");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5
      && (v6 = (void *)v5,
          objc_msgSend(v4, "imageFileURL"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v6,
          v7))
    {
      -[TUConversationActivityMetadata imageFileURL](self, "imageFileURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "imageFileURL");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[TUConversationActivityMetadata imageData](self, "imageData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "imageData");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v9;
    v10 = TUObjectsAreEqualOrNil((unint64_t)v8, v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;

  -[TUConversationActivityMetadata imageFileURL](self, "imageFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[TUConversationActivityMetadata imageFileURL](self, "imageFileURL");
  else
    -[TUConversationActivityMetadata imageData](self, "imageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v4, "hash");

  -[TUConversationActivityMetadata context](self, "context");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v26, "hash");
  -[TUConversationActivityMetadata linkMetadatablob](self, "linkMetadatablob");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v25, "hash");
  -[TUConversationActivityMetadata fallbackURL](self, "fallbackURL");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v23, "hash");
  -[TUConversationActivityMetadata invitationURL](self, "invitationURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v5, "hash");
  v6 = -[TUConversationActivityMetadata supportsContinuationOnTV](self, "supportsContinuationOnTV");
  v7 = 1237;
  v8 = 1231;
  if (!v6)
    v8 = 1237;
  v18 = v8;
  -[TUConversationActivityMetadata title](self, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  -[TUConversationActivityMetadata subTitle](self, "subTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  v13 = -[TUConversationActivityMetadata preferredBroadcastingAttributes](self, "preferredBroadcastingAttributes");
  -[TUConversationActivityMetadata sceneAssociationBehavior](self, "sceneAssociationBehavior");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  if (-[TUConversationActivityMetadata supportsActivityPreviews](self, "supportsActivityPreviews"))
    v7 = 1231;
  v16 = v22 ^ v24 ^ v21 ^ v20 ^ v19 ^ v18 ^ v10 ^ v12 ^ v13 ^ v15 ^ v7 ^ -[TUConversationActivityMetadata lifetimePolicy](self, "lifetimePolicy");

  return v16;
}

- (unint64_t)length
{
  void *v2;
  unint64_t v3;

  -[TUConversationActivityMetadata serializedData](self, "serializedData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (id)serializedData
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
}

+ (TUConversationActivityMetadata)activityMetadataWithDataBlob:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v15;
    if (v5 || !v4)
    {
      TUDefaultLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[TUConversationActivityMetadata activityMetadataWithDataBlob:].cold.1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

      v6 = 0;
    }
    else
    {
      v6 = v4;
    }

  }
  else
  {
    v6 = 0;
  }

  return (TUConversationActivityMetadata *)v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
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
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivityMetadata context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" context=%@"), v4);

  -[TUConversationActivityMetadata fallbackURL](self, "fallbackURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TUConversationActivityMetadata fallbackURL](self, "fallbackURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" fallbackURL=%@"), v6);

  }
  -[TUConversationActivityMetadata invitationURL](self, "invitationURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TUConversationActivityMetadata invitationURL](self, "invitationURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" invitationURL=%@"), v8);

  }
  if (-[TUConversationActivityMetadata supportsContinuationOnTV](self, "supportsContinuationOnTV"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" supportsContinuationOnTV=%d"), -[TUConversationActivityMetadata supportsContinuationOnTV](self, "supportsContinuationOnTV"));
  -[TUConversationActivityMetadata title](self, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[TUConversationActivityMetadata title](self, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" title=%@"), v10);

  }
  -[TUConversationActivityMetadata subTitle](self, "subTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[TUConversationActivityMetadata subTitle](self, "subTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" subTitle=%@"), v12);

  }
  if (-[TUConversationActivityMetadata preferredBroadcastingAttributes](self, "preferredBroadcastingAttributes"))
    objc_msgSend(v3, "appendFormat:", CFSTR(" preferredBroadcastingAttributes=%ld"), -[TUConversationActivityMetadata preferredBroadcastingAttributes](self, "preferredBroadcastingAttributes"));
  -[TUConversationActivityMetadata imageFileURL](self, "imageFileURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[TUConversationActivityMetadata imageFileURL](self, "imageFileURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_19;
    -[TUConversationActivityMetadata imageFileURL](self, "imageFileURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" imageFileURL=%@"), v15);
  }
  else
  {
    -[TUConversationActivityMetadata imageData](self, "imageData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      goto LABEL_19;
    -[TUConversationActivityMetadata imageData](self, "imageData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" imageData=%@"), v15);
  }

LABEL_19:
  -[TUConversationActivityMetadata sceneAssociationBehavior](self, "sceneAssociationBehavior");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" sceneAssociationBehavior=%@"), v17);

  objc_opt_self();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "supportsActivityPreviews");

  if (v19)
  {
    objc_opt_self();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" self.supportsActivityPreviews=%d"), objc_msgSend(v20, "supportsActivityPreviews"));

  }
  objc_opt_self();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "lifetimePolicy");

  if (v22)
  {
    objc_opt_self();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" self.lifetimePolicy=%ld"), objc_msgSend(v23, "lifetimePolicy"));

  }
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return (NSString *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;

  v19 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[TUConversationActivityMetadata context](self, "context");
  v4 = objc_claimAutoreleasedReturnValue();
  -[TUConversationActivityMetadata linkMetadatablob](self, "linkMetadatablob");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivityMetadata fallbackURL](self, "fallbackURL");
  v5 = objc_claimAutoreleasedReturnValue();
  -[TUConversationActivityMetadata invitationURL](self, "invitationURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[TUConversationActivityMetadata supportsContinuationOnTV](self, "supportsContinuationOnTV");
  -[TUConversationActivityMetadata title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivityMetadata subTitle](self, "subTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivityMetadata imageFileURL](self, "imageFileURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)v5;
  v11 = (void *)v4;
  if (v9)
  {
    v21 = 0;
  }
  else
  {
    -[TUConversationActivityMetadata imageData](self, "imageData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = -[TUConversationActivityMetadata preferredBroadcastingAttributes](self, "preferredBroadcastingAttributes");
  -[TUConversationActivityMetadata sceneAssociationBehavior](self, "sceneAssociationBehavior");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v17) = -[TUConversationActivityMetadata supportsActivityPreviews](self, "supportsActivityPreviews");
  v14 = (void *)objc_msgSend(v19, "initWithContext:linkMetadata:fallbackURL:invitationURL:supportsContinuationOnTV:title:subTitle:imageData:preferredBroadcastingAttributes:sceneAssociationBehavior:supportsActivityPreviews:lifetimePolicy:", v11, v20, v10, v6, v18, v7, v8, v21, v12, v13, v17, -[TUConversationActivityMetadata lifetimePolicy](self, "lifetimePolicy"));

  if (!v9)
  -[TUConversationActivityMetadata imageFileURL](self, "imageFileURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setImageFileURL:", v15);

  return v14;
}

- (id)sanitizedCopy
{
  return -[TUConversationActivityMetadata sanitizedCopyWithZone:](self, "sanitizedCopyWithZone:", 0);
}

- (id)sanitizedCopyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v18 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[TUConversationActivityMetadata context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivityMetadata linkMetadatablob](self, "linkMetadatablob");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivityMetadata fallbackURL](self, "fallbackURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sanitizedCopy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivityMetadata invitationURL](self, "invitationURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sanitizedCopy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[TUConversationActivityMetadata supportsContinuationOnTV](self, "supportsContinuationOnTV");
  -[TUConversationActivityMetadata title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivityMetadata subTitle](self, "subTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUConversationActivityMetadata imageFileURL](self, "imageFileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    -[TUConversationActivityMetadata imageData](self, "imageData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = -[TUConversationActivityMetadata preferredBroadcastingAttributes](self, "preferredBroadcastingAttributes");
  -[TUConversationActivityMetadata sceneAssociationBehavior](self, "sceneAssociationBehavior");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v15) = -[TUConversationActivityMetadata supportsActivityPreviews](self, "supportsActivityPreviews");
  v12 = (void *)objc_msgSend(v18, "initWithContext:linkMetadata:fallbackURL:invitationURL:supportsContinuationOnTV:title:subTitle:imageData:preferredBroadcastingAttributes:sceneAssociationBehavior:supportsActivityPreviews:lifetimePolicy:", v4, v21, v5, v6, v16, v7, v17, v9, v10, v11, v15, -[TUConversationActivityMetadata lifetimePolicy](self, "lifetimePolicy"));

  if (!v8)
  -[TUConversationActivityMetadata imageFileURL](self, "imageFileURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setImageFileURL:", v13);

  return v12;
}

- (TUConversationActivityContext)context
{
  return self->_context;
}

- (NSData)linkMetadatablob
{
  return self->_linkMetadatablob;
}

- (void)setLinkMetadatablob:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)fallbackURL
{
  return self->_fallbackURL;
}

- (NSURL)invitationURL
{
  return self->_invitationURL;
}

- (BOOL)supportsContinuationOnTV
{
  return self->_supportsContinuationOnTV;
}

- (void)setSupportsContinuationOnTV:(BOOL)a3
{
  self->_supportsContinuationOnTV = a3;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subTitle
{
  return self->_subTitle;
}

- (void)setImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (int64_t)preferredBroadcastingAttributes
{
  return self->_preferredBroadcastingAttributes;
}

- (void)setPreferredBroadcastingAttributes:(int64_t)a3
{
  self->_preferredBroadcastingAttributes = a3;
}

- (TUConversationActivitySceneAssociationBehavior)sceneAssociationBehavior
{
  return self->_sceneAssociationBehavior;
}

- (BOOL)supportsActivityPreviews
{
  return self->_supportsActivityPreviews;
}

- (int64_t)lifetimePolicy
{
  return self->_lifetimePolicy;
}

- (TUSandboxExtendedURL)imageFileURL
{
  return self->_imageFileURL;
}

- (void)setImageFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_imageFileURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageFileURL, 0);
  objc_storeStrong((id *)&self->_sceneAssociationBehavior, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_invitationURL, 0);
  objc_storeStrong((id *)&self->_fallbackURL, 0);
  objc_storeStrong((id *)&self->_linkMetadatablob, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)_createImageFolderIfNeeded
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_19A50D000, v0, v1, "TUConversationActivityMetadata Error creating folder at %@ error %@");
  OUTLINED_FUNCTION_1();
}

- (void)imageData
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_19A50D000, v0, v1, "Failed to read image data for %@, error: %@");
  OUTLINED_FUNCTION_1();
}

+ (void)activityMetadataWithDataBlob:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19A50D000, a2, a3, "Error deserializing activity metadata %@,", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
