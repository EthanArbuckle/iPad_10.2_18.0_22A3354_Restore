@implementation QLPreviewContext

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  int v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  int v30;
  int64_t v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  int v37;
  unint64_t v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  int v44;
  int64_t v45;
  BOOL v46;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[QLPreviewContext thumbnailGenerator](self, "thumbnailGenerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "thumbnailGenerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = __18__QLItem_isEqual___block_invoke((uint64_t)v7, v6, v7);

    if (!v8)
      goto LABEL_21;
    -[QLPreviewContext previewTitle](self, "previewTitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "previewTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = __18__QLItem_isEqual___block_invoke((uint64_t)v10, v9, v10);

    if (!v11)
      goto LABEL_21;
    -[QLPreviewContext contentType](self, "contentType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = __18__QLItem_isEqual___block_invoke((uint64_t)v13, v12, v13);

    if (!v14)
      goto LABEL_21;
    -[QLPreviewContext originalContentType](self, "originalContentType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "originalContentType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = __18__QLItem_isEqual___block_invoke((uint64_t)v16, v15, v16);

    if (!v17)
      goto LABEL_21;
    v18 = -[QLPreviewContext canBeEdited](self, "canBeEdited");
    if (v18 != objc_msgSend(v5, "canBeEdited"))
      goto LABEL_21;
    v19 = -[QLPreviewContext canBeShared](self, "canBeShared");
    if (v19 != objc_msgSend(v5, "canBeShared"))
      goto LABEL_21;
    v20 = -[QLPreviewContext editedFileBehavior](self, "editedFileBehavior");
    if (v20 != objc_msgSend(v5, "editedFileBehavior"))
      goto LABEL_21;
    v21 = -[QLPreviewContext previewItemType](self, "previewItemType");
    if (v21 != objc_msgSend(v5, "previewItemType"))
      goto LABEL_21;
    -[QLPreviewContext backgroundColor](self, "backgroundColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backgroundColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = __18__QLItem_isEqual___block_invoke((uint64_t)v23, v22, v23);

    if (!v24)
      goto LABEL_21;
    -[QLPreviewContext password](self, "password");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "password");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = __18__QLItem_isEqual___block_invoke((uint64_t)v26, v25, v26);

    if (!v27)
      goto LABEL_21;
    -[QLPreviewContext itemSize](self, "itemSize");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemSize");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = __18__QLItem_isEqual___block_invoke((uint64_t)v29, v28, v29);

    if (!v30)
      goto LABEL_21;
    v31 = -[QLPreviewContext processIdentifier](self, "processIdentifier");
    if (v31 != objc_msgSend(v5, "processIdentifier"))
      goto LABEL_21;
    -[QLPreviewContext clientPreviewOptions](self, "clientPreviewOptions");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientPreviewOptions");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = __18__QLItem_isEqual___block_invoke((uint64_t)v33, v32, v33);

    if (!v34)
      goto LABEL_21;
    -[QLPreviewContext clientPreviewItemDisplayState](self, "clientPreviewItemDisplayState");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clientPreviewItemDisplayState");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = __18__QLItem_isEqual___block_invoke((uint64_t)v36, v35, v36);

    if (!v37)
      goto LABEL_21;
    v38 = -[QLPreviewContext stringEncoding](self, "stringEncoding");
    if (v38 != objc_msgSend(v5, "stringEncoding"))
      goto LABEL_21;
    -[QLPreviewContext attachments](self, "attachments");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attachments");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = __18__QLItem_isEqual___block_invoke((uint64_t)v40, v39, v40);

    if (!v41)
      goto LABEL_21;
    -[QLPreviewContext bitmapFormat](self, "bitmapFormat");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bitmapFormat");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = __18__QLItem_isEqual___block_invoke((uint64_t)v43, v42, v43);

    if (v44)
    {
      v45 = -[QLPreviewContext viewDynamicRange](self, "viewDynamicRange");
      v46 = v45 == objc_msgSend(v5, "viewDynamicRange");
    }
    else
    {
LABEL_21:
      v46 = 0;
    }

  }
  else
  {
    v46 = 0;
  }

  return v46;
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  -[QLPreviewContext thumbnailGenerator](self, "thumbnailGenerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[QLPreviewContext thumbnailGenerator](self, "thumbnailGenerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v5, CFSTR("thumbnailGenerator"));

  }
  -[QLPreviewContext previewTitle](self, "previewTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[QLPreviewContext previewTitle](self, "previewTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v7, CFSTR("previewTitle"));

  }
  -[QLPreviewContext contentType](self, "contentType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[QLPreviewContext contentType](self, "contentType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v9, CFSTR("contentType"));

  }
  -[QLPreviewContext originalContentType](self, "originalContentType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[QLPreviewContext originalContentType](self, "originalContentType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v11, CFSTR("originalContentType"));

  }
  -[QLPreviewContext itemSize](self, "itemSize");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[QLPreviewContext itemSize](self, "itemSize");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v13, CFSTR("itemSize"));

  }
  -[QLPreviewContext backgroundColor](self, "backgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[QLPreviewContext backgroundColor](self, "backgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v15, CFSTR("backgroundColor"));

  }
  -[QLPreviewContext password](self, "password");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[QLPreviewContext password](self, "password");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v17, CFSTR("password"));

  }
  -[QLPreviewContext clientPreviewOptions](self, "clientPreviewOptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[QLPreviewContext clientPreviewOptions](self, "clientPreviewOptions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v19, CFSTR("clientPreviewOptions"));

  }
  -[QLPreviewContext clientPreviewItemDisplayState](self, "clientPreviewItemDisplayState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[QLPreviewContext clientPreviewItemDisplayState](self, "clientPreviewItemDisplayState");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v21, CFSTR("clientPreviewItemDisplayState"));

  }
  objc_msgSend(v27, "encodeInteger:forKey:", -[QLPreviewContext previewItemType](self, "previewItemType"), CFSTR("previewItemType"));
  objc_msgSend(v27, "encodeBool:forKey:", -[QLPreviewContext canBeEdited](self, "canBeEdited"), CFSTR("canBeEdited"));
  objc_msgSend(v27, "encodeBool:forKey:", -[QLPreviewContext canBeShared](self, "canBeShared"), CFSTR("canBeShared"));
  objc_msgSend(v27, "encodeInteger:forKey:", -[QLPreviewContext editedFileBehavior](self, "editedFileBehavior"), CFSTR("editedFileBehavior"));
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "encodeInteger:forKey:", (int)objc_msgSend(v22, "processIdentifier"), CFSTR("processIdentifier"));

  objc_msgSend(v27, "encodeInteger:forKey:", -[QLPreviewContext stringEncoding](self, "stringEncoding"), CFSTR("stringEncoding"));
  -[QLPreviewContext attachments](self, "attachments");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[QLPreviewContext attachments](self, "attachments");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v24, CFSTR("attachments"));

  }
  -[QLPreviewContext bitmapFormat](self, "bitmapFormat");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[QLPreviewContext bitmapFormat](self, "bitmapFormat");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "encodeObject:forKey:", v26, CFSTR("bitmapFormat"));

  }
  objc_msgSend(v27, "encodeInteger:forKey:", -[QLPreviewContext viewDynamicRange](self, "viewDynamicRange"), CFSTR("viewDynamicRange"));

}

- (QLPreviewContext)initWithCoder:(id)a3
{
  id v4;
  QLPreviewContext *v5;
  uint64_t v6;
  QLItemThumbnailGeneratorProtocolInternal *thumbnailGenerator;
  uint64_t v8;
  NSString *previewTitle;
  uint64_t v10;
  NSString *contentType;
  uint64_t v12;
  NSString *originalContentType;
  uint64_t v14;
  NSNumber *itemSize;
  uint64_t v16;
  UIColor *backgroundColor;
  uint64_t v18;
  NSString *password;
  void *v20;
  uint64_t v21;
  NSDictionary *clientPreviewOptions;
  void *v23;
  uint64_t v24;
  NSDictionary *clientPreviewItemDisplayState;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSDictionary *attachments;
  uint64_t v31;
  QLTBitmapFormat *bitmapFormat;
  QLPreviewContext *v33;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)QLPreviewContext;
  v5 = -[QLPreviewContext init](&v35, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("thumbnailGenerator"));
    v6 = objc_claimAutoreleasedReturnValue();
    thumbnailGenerator = v5->_thumbnailGenerator;
    v5->_thumbnailGenerator = (QLItemThumbnailGeneratorProtocolInternal *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previewTitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    previewTitle = v5->_previewTitle;
    v5->_previewTitle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentType"));
    v10 = objc_claimAutoreleasedReturnValue();
    contentType = v5->_contentType;
    v5->_contentType = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("originalContentType"));
    v12 = objc_claimAutoreleasedReturnValue();
    originalContentType = v5->_originalContentType;
    v5->_originalContentType = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemSize"));
    v14 = objc_claimAutoreleasedReturnValue();
    itemSize = v5->_itemSize;
    v5->_itemSize = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundColor"));
    v16 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (UIColor *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("password"));
    v18 = objc_claimAutoreleasedReturnValue();
    password = v5->_password;
    v5->_password = (NSString *)v18;

    v5->_previewItemType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("previewItemType"));
    v5->_canBeEdited = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canBeEdited"));
    v5->_canBeShared = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canBeShared"));
    v5->_editedFileBehavior = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("editedFileBehavior"));
    v5->_processIdentifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("processIdentifier"));
    +[QLItem customExtensionCommunicationEncodedClasses](QLItem, "customExtensionCommunicationEncodedClasses");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("clientPreviewOptions"));
    v21 = objc_claimAutoreleasedReturnValue();
    clientPreviewOptions = v5->_clientPreviewOptions;
    v5->_clientPreviewOptions = (NSDictionary *)v21;

    +[QLItem customExtensionCommunicationEncodedClasses](QLItem, "customExtensionCommunicationEncodedClasses");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("clientPreviewItemDisplayState"));
    v24 = objc_claimAutoreleasedReturnValue();
    clientPreviewItemDisplayState = v5->_clientPreviewItemDisplayState;
    v5->_clientPreviewItemDisplayState = (NSDictionary *)v24;

    v5->_stringEncoding = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("stringEncoding"));
    v26 = (void *)MEMORY[0x1E0C99E60];
    v27 = objc_opt_class();
    objc_msgSend(v26, "setWithObjects:", v27, objc_opt_class(), 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v28, CFSTR("attachments"));
    v29 = objc_claimAutoreleasedReturnValue();
    attachments = v5->_attachments;
    v5->_attachments = (NSDictionary *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bitmapFormat"));
    v31 = objc_claimAutoreleasedReturnValue();
    bitmapFormat = v5->_bitmapFormat;
    v5->_bitmapFormat = (QLTBitmapFormat *)v31;

    v5->_viewDynamicRange = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("viewDynamicRange"));
    v33 = v5;
  }

  return v5;
}

- (NSString)previewTitle
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPreviewTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)originalContentType
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOriginalContentType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)contentType
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setContentType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)canBeEdited
{
  return self->_canBeEdited;
}

- (void)setCanBeEdited:(BOOL)a3
{
  self->_canBeEdited = a3;
}

- (BOOL)canBeShared
{
  return self->_canBeShared;
}

- (void)setCanBeShared:(BOOL)a3
{
  self->_canBeShared = a3;
}

- (BOOL)shouldPreventMachineReadableCodeDetection
{
  return self->_shouldPreventMachineReadableCodeDetection;
}

- (void)setShouldPreventMachineReadableCodeDetection:(BOOL)a3
{
  self->_shouldPreventMachineReadableCodeDetection = a3;
}

- (unint64_t)editedFileBehavior
{
  return self->_editedFileBehavior;
}

- (void)setEditedFileBehavior:(unint64_t)a3
{
  self->_editedFileBehavior = a3;
}

- (NSString)password
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPassword:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (unint64_t)previewItemType
{
  return self->_previewItemType;
}

- (void)setPreviewItemType:(unint64_t)a3
{
  self->_previewItemType = a3;
}

- (UIColor)backgroundColor
{
  return (UIColor *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSNumber)itemSize
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (void)setItemSize:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (int64_t)processIdentifier
{
  return self->_processIdentifier;
}

- (void)setProcessIdentifier:(int64_t)a3
{
  self->_processIdentifier = a3;
}

- (QLItem)item
{
  return (QLItem *)objc_getProperty(self, a2, 88, 1);
}

- (void)setItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSDictionary)clientPreviewOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setClientPreviewOptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSDictionary)clientPreviewItemDisplayState
{
  return (NSDictionary *)objc_getProperty(self, a2, 104, 1);
}

- (void)setClientPreviewItemDisplayState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (unint64_t)stringEncoding
{
  return self->_stringEncoding;
}

- (void)setStringEncoding:(unint64_t)a3
{
  self->_stringEncoding = a3;
}

- (NSDictionary)attachments
{
  return (NSDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setAttachments:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (QLTBitmapFormat)bitmapFormat
{
  return (QLTBitmapFormat *)objc_getProperty(self, a2, 128, 1);
}

- (void)setBitmapFormat:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (int64_t)viewDynamicRange
{
  return self->_viewDynamicRange;
}

- (void)setViewDynamicRange:(int64_t)a3
{
  self->_viewDynamicRange = a3;
}

- (QLItemThumbnailGeneratorProtocolInternal)thumbnailGenerator
{
  return (QLItemThumbnailGeneratorProtocolInternal *)objc_getProperty(self, a2, 144, 1);
}

- (void)setThumbnailGenerator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailGenerator, 0);
  objc_storeStrong((id *)&self->_bitmapFormat, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_clientPreviewItemDisplayState, 0);
  objc_storeStrong((id *)&self->_clientPreviewOptions, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_itemSize, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_originalContentType, 0);
  objc_storeStrong((id *)&self->_previewTitle, 0);
}

@end
