@implementation NoteAttachmentPresentation

+ (id)attachmentPresentationsForAttachments:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        v12 = objc_alloc((Class)a1);
        v13 = (void *)objc_msgSend(v12, "initWithNoteAttachmentObject:", v11, (_QWORD)v16);
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

- (NoteAttachmentPresentation)initWithNoteAttachmentObject:(id)a3
{
  id v4;
  NoteAttachmentPresentation *v5;
  void *v6;
  uint64_t v7;
  NSString *contentID;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  NSURL *dataFileURL;
  NSURL *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  NSString *mimeType;
  uint64_t v20;
  NSString *filename;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  id v27;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)NoteAttachmentPresentation;
  v5 = -[NoteAttachmentPresentation init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "contentID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    contentID = v5->_contentID;
    v5->_contentID = (NSString *)v7;

    -[NoteAttachmentPresentation updateContentIDURL](v5, "updateContentIDURL");
    v27 = 0;
    objc_msgSend(v4, "attachmentDataFileURLWithError:", &v27);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v27;
    v11 = v27;
    v12 = objc_msgSend(v9, "copy");
    dataFileURL = v5->_dataFileURL;
    v5->_dataFileURL = (NSURL *)v12;

    v14 = v5->_dataFileURL;
    if (v14)
    {
      v26 = v11;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v14, 0, &v26);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v26;

      if (v15)
      {
        objc_msgSend(MEMORY[0x1E0DC3870], "ic_imageWithData:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v5->_image = v17 != 0;
      }
      else
      {
        -[NSURL path](v5->_dataFileURL, "path");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("Unable to read data at path: %@, error: %@"), v17, v16);
      }

    }
    else
    {
      objc_storeStrong((id *)&v5->_dataFileURLError, v10);
      NSLog(CFSTR("Can't find data for attachment: %@, error: %@"), v4, v11);
      v16 = v11;
    }
    objc_msgSend(v4, "mimeType");
    v18 = objc_claimAutoreleasedReturnValue();
    mimeType = v5->_mimeType;
    v5->_mimeType = (NSString *)v18;

    objc_msgSend(v4, "filename");
    v20 = objc_claimAutoreleasedReturnValue();
    filename = v5->_filename;
    v5->_filename = (NSString *)v20;

    objc_msgSend(v4, "note");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "store");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "account");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sourceIsManaged = objc_msgSend(v24, "isManaged");

  }
  return v5;
}

- (NoteAttachmentPresentation)initWithData:(id)a3 contentID:(id)a4 mimeType:(id)a5 filename:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NoteAttachmentPresentation *v15;
  uint64_t v16;
  NSString *contentID;
  uint64_t v18;
  NSString *mimeType;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSString *filename;
  objc_super v30;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v30.receiver = self;
  v30.super_class = (Class)NoteAttachmentPresentation;
  v15 = -[NoteAttachmentPresentation init](&v30, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    contentID = v15->_contentID;
    v15->_contentID = (NSString *)v16;

    -[NoteAttachmentPresentation updateContentIDURL](v15, "updateContentIDURL");
    v18 = objc_msgSend(v13, "copy");
    mimeType = v15->_mimeType;
    v15->_mimeType = (NSString *)v18;

    objc_storeStrong((id *)&v15->_data, a3);
    objc_msgSend(MEMORY[0x1E0DC3870], "ic_imageWithData:", v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v15->_image = v20 != 0;
    objc_msgSend(v14, "pathExtension");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "length");

    if (!v22)
    {
      objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithMIMEType:", v13);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "preferredFilenameExtension");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        objc_msgSend(v23, "preferredFilenameExtension");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringByAppendingPathExtension:", v25);
        v26 = objc_claimAutoreleasedReturnValue();

        v14 = (id)v26;
      }

    }
    v27 = objc_msgSend(v14, "copy");
    filename = v15->_filename;
    v15->_filename = (NSString *)v27;

  }
  return v15;
}

- (NSNumber)dataSizeNumber
{
  void *v3;
  void *v4;
  id v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[NoteAttachmentPresentation dataFileURL](self, "dataFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NoteAttachmentPresentation dataFileURL](self, "dataFileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v4, "getResourceValue:forKey:error:", &v11, *MEMORY[0x1E0C99998], 0);
    v5 = v11;

    return (NSNumber *)v5;
  }
  else
  {
    -[NoteAttachmentPresentation data](self, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0CB37E8];
      -[NoteAttachmentPresentation data](self, "data");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "length"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      return (NSNumber *)v10;
    }
    else
    {
      return (NSNumber *)0;
    }
  }
}

- (BOOL)getPresentationData:(id *)a3 mimeType:(id *)a4 error:(id *)a5
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v18;

  -[NoteAttachmentPresentation dataFileURL](self, "dataFileURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0C99D50];
    -[NoteAttachmentPresentation dataFileURL](self, "dataFileURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataWithContentsOfFile:options:error:", v12, 0, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v13 != 0;
    if (v13)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v13);
      if (a4)
      {
        -[NoteAttachmentPresentation mimeType](self, "mimeType");
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }

  }
  else
  {
    -[NoteAttachmentPresentation dataFileURL](self, "dataFileURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {

    }
    else
    {
      -[NoteAttachmentPresentation dataFileURLError](self, "dataFileURLError");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        if (!a5)
          return 0;
        -[NoteAttachmentPresentation dataFileURLError](self, "dataFileURLError");
        v14 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        return v14;
      }
    }
    -[NoteAttachmentPresentation mimeType](self, "mimeType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      -[NoteAttachmentPresentation data](self, "data");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (a4)
      *a4 = objc_retainAutorelease(v16);

    return 1;
  }
  return v14;
}

- (void)setContentID:(id)a3
{
  objc_storeStrong((id *)&self->_contentID, a3);
  -[NoteAttachmentPresentation updateContentIDURL](self, "updateContentIDURL");
}

- (void)updateContentIDURL
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "ic_newURLForContentID:percentEscaped:", self->_contentID, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NoteAttachmentPresentation setContentIDURL:](self, "setContentIDURL:", v3);

}

- (void)setContentIDURL:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_contentIDURL, a3);
  v5 = a3;
  objc_msgSend(v5, "absoluteString");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[NoteAttachmentPresentation setContentIDURLAbsoluteString:](self, "setContentIDURLAbsoluteString:", v6);
}

- (void)clearCache
{
  -[NoteAttachmentPresentation setData:](self, "setData:", 0);
}

+ (id)presentationSelector
{
  return CFSTR("img, object");
}

+ (void)prepareDocumentForPresentationWithAttachmentContentIDs:(id)a3 withAttachmentPresentations:(id)a4 occurences:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NoteAttachmentPresentationOccurence *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(a4, "ic_dictionaryByHashingContentWithFunction:", &__block_literal_global_59);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        if (*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14))
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            v16 = -[NoteAttachmentPresentationOccurence initWithPresentation:element:]([NoteAttachmentPresentationOccurence alloc], "initWithPresentation:element:", v15, 0);
            objc_msgSend(v9, "addObject:", v16);

          }
        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  if (a5)
    *a5 = (id)objc_msgSend(v9, "copy");

}

uint64_t __124__NoteAttachmentPresentation_prepareDocumentForPresentationWithAttachmentContentIDs_withAttachmentPresentations_occurences___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contentID");
}

+ (void)prepareDocumentForSerializationWithAttachmentContentIDs:(id)a3 withAttachmentPresentations:(id)a4 newPresentationProvider:(id)a5 leftoverPresentations:(id *)a6
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v9;
  objc_msgSend(v9, "ic_dictionaryByHashingContentWithFunction:", &__block_literal_global_19_0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = v8;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (v19)
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
          v20 = objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            v21 = (void *)v20;
            objc_msgSend(v11, "removeObject:", v20);
          }
          else
          {
            if (!v10)
              continue;
            objc_msgSend(MEMORY[0x1E0CB3940], "ic_newURLForContentID:percentEscaped:", v19, 0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v10[2](v10, v22);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (v21)
              objc_msgSend(v13, "setObject:forKey:", v21, v19);

          }
        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v16);
  }

  if (a6)
  {
    objc_msgSend(v11, "array");
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

}

uint64_t __160__NoteAttachmentPresentation_prepareDocumentForSerializationWithAttachmentContentIDs_withAttachmentPresentations_newPresentationProvider_leftoverPresentations___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contentID");
}

- (NSString)contentID
{
  return self->_contentID;
}

- (NSURL)contentIDURL
{
  return self->_contentIDURL;
}

- (NSURL)dataFileURL
{
  return self->_dataFileURL;
}

- (void)setDataFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (void)setMimeType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)filename
{
  return self->_filename;
}

- (BOOL)sourceIsManaged
{
  return self->_sourceIsManaged;
}

- (NSError)dataFileURLError
{
  return self->_dataFileURLError;
}

- (void)setDataFileURLError:(id)a3
{
  objc_storeStrong((id *)&self->_dataFileURLError, a3);
}

- (NSString)contentIDURLAbsoluteString
{
  return self->_contentIDURLAbsoluteString;
}

- (void)setContentIDURLAbsoluteString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)isImage
{
  return self->_image;
}

- (void)setImage:(BOOL)a3
{
  self->_image = a3;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (CGSize)iconSize
{
  double width;
  double height;
  CGSize result;

  width = self->_iconSize.width;
  height = self->_iconSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setIconSize:(CGSize)a3
{
  self->_iconSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_contentIDURLAbsoluteString, 0);
  objc_storeStrong((id *)&self->_dataFileURLError, 0);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_dataFileURL, 0);
  objc_storeStrong((id *)&self->_contentIDURL, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
}

@end
