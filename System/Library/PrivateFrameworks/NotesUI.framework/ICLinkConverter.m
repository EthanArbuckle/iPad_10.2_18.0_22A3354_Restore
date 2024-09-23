@implementation ICLinkConverter

- (ICLinkConverter)initWithInsertionController:(id)a3
{
  id v4;
  ICLinkConverter *v5;
  ICLinkConverter *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ICLinkConverter;
  v5 = -[ICLinkConverter init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_insertionController, v4);

  return v6;
}

- (ICTTTextStorage)textStorage
{
  void *v2;
  void *v3;
  void *v4;

  -[ICLinkConverter insertionController](self, "insertionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "note");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICTTTextStorage *)v4;
}

+ (NSString)convertAttachmentToLinkActionTitle
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Convert to Plain Link"), CFSTR("Convert to Plain Link"), 0, 1);
}

+ (NSString)convertAttachmentToLinkSystemImageName
{
  return (NSString *)CFSTR("link");
}

- (BOOL)canConvertAttachmentToLink:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (ICInternalSettingsIsLinkConversionEnabled())
  {
    -[ICLinkConverter insertionController](self, "insertionController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "note");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_msgSend(v4, "needsInitialFetchFromCloud") & 1) == 0)
    {
      objc_msgSend(v4, "parentAttachment");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8 && objc_msgSend(v4, "isUsed") && objc_msgSend(v4, "isURL"))
      {
        objc_msgSend(v4, "URL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v9 != 0;

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)convertAttachmentToLink:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[ICLinkConverter canConvertAttachmentToLink:](self, "canConvertAttachmentToLink:", v4))
  {
    objc_msgSend(v4, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(v4, "urlString");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v9 = v7;

    v10 = objc_alloc(MEMORY[0x1E0CB3498]);
    v22 = *MEMORY[0x1E0DC1160];
    objc_msgSend(v4, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "initWithString:attributes:", v9, v12);

    -[ICLinkConverter textStorage](self, "textStorage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v4, "rangeInNote");
    objc_msgSend(v13, "replaceCharactersInRange:withAttributedString:", v14, v15, v8);

    -[ICLinkConverter textStorage](self, "textStorage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fixupAfterEditing");

    objc_msgSend(MEMORY[0x1E0D639F0], "deleteAttachment:", v4);
    -[ICLinkConverter insertionController](self, "insertionController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "note");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "updateModificationDateAndChangeCountAndSaveImmediately");

    -[ICLinkConverter textStorage](self, "textStorage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "undoManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "convertAttachmentToLinkActionTitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setActionName:", v21);

  }
  else
  {
    v8 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ICLinkConverter convertAttachmentToLink:].cold.1(self, v4, v8);
    v9 = v8;
  }

}

+ (NSString)convertLinkToAttachmentActionTitle
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Show Link Preview"), CFSTR("Show Link Preview"), 0, 1);
}

+ (NSString)convertLinkToAttachmentSystemImageName
{
  return (NSString *)CFSTR("photo");
}

- (BOOL)canConvertLinkAtLocationToAttachment:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;

  objc_opt_class();
  -[ICLinkConverter textStorage](self, "textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1160], a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (ICInternalSettingsIsLinkConversionEnabled())
  {
    objc_msgSend(v7, "scheme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqual:", CFSTR("http")) & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(v7, "scheme");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "isEqual:", CFSTR("https"));

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)convertLinkAtLocationToAttachment:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;

  if (-[ICLinkConverter canConvertLinkAtLocationToAttachment:](self, "canConvertLinkAtLocationToAttachment:"))
  {
    v21 = 0;
    v22 = 0;
    objc_opt_class();
    -[ICLinkConverter textStorage](self, "textStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC1160], a3, &v21);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v7 = objc_claimAutoreleasedReturnValue();

    -[ICLinkConverter insertionController](self, "insertionController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "note");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addURLAttachmentWithURL:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICLinkConverter textStorage](self, "textStorage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "attributedSubstringFromRange:", v21, v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "string");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:", v13);

    -[ICLinkConverter insertionController](self, "insertionController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v14, "addAttachment:atTextRange:", v10, v21, v22);

    -[ICLinkConverter insertionController](self, "insertionController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "note");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateModificationDateAndChangeCountAndSaveImmediately");

    -[ICLinkConverter textStorage](self, "textStorage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "undoManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "convertLinkToAttachmentActionTitle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActionName:", v20);

  }
  else
  {
    v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ICLinkConverter convertLinkAtLocationToAttachment:].cold.1(self, v7);

  }
}

- (ICAttachmentInsertionController)insertionController
{
  return (ICAttachmentInsertionController *)objc_loadWeakRetained((id *)&self->_insertionController);
}

- (void)setInsertionController:(id)a3
{
  objc_storeWeak((id *)&self->_insertionController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_insertionController);
}

- (void)convertAttachmentToLink:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "insertionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "note");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shortLoggingDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "shortLoggingDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412546;
  v10 = v7;
  v11 = 2112;
  v12 = v8;
  _os_log_error_impl(&dword_1AC7A1000, a3, OS_LOG_TYPE_ERROR, "Cannot convert attachment to link {note: %@, attachment: %@}", (uint8_t *)&v9, 0x16u);

}

- (void)convertLinkAtLocationToAttachment:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "insertionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shortLoggingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v5;
  _os_log_error_impl(&dword_1AC7A1000, a2, OS_LOG_TYPE_ERROR, "Cannot convert link to attachment {note: %@}", (uint8_t *)&v6, 0xCu);

}

@end
