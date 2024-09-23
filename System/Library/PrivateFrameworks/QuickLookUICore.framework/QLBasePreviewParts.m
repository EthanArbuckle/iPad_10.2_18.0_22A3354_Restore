@implementation QLBasePreviewParts

+ (BOOL)canConvertDocumentType:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = +[QLPreviewConverter isOfficeDocumentType:](QLPreviewConverter, "isOfficeDocumentType:", v3)
    || +[QLPreviewConverter isIWorkDocumentType:](QLPreviewConverter, "isIWorkDocumentType:", v3)
    || +[QLPreviewConverter isLPDFDocumentType:](QLPreviewConverter, "isLPDFDocumentType:", v3)
    || +[QLPreviewConverter isCSVDocumentType:](QLPreviewConverter, "isCSVDocumentType:", v3)
    || +[QLPreviewConverter isRTFDocumentType:](QLPreviewConverter, "isRTFDocumentType:", v3);

  return v4;
}

+ (BOOL)isBundleURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  char v8;

  v3 = a3;
  if (objc_msgSend(v3, "isFileURL"))
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v5, &v8);

    v6 = v8 != 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)urlCallbackForUTI:(id)a3
{
  id v3;
  void *v4;
  NSObject *v6;
  NSObject **v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (+[QLPreviewConverter isOfficeDocumentType:](QLPreviewConverter, "isOfficeDocumentType:", v3))
    goto LABEL_5;
  if (+[QLPreviewConverter isIWorkDocumentType:](QLPreviewConverter, "isIWorkDocumentType:", v3))
  {
    v4 = IWGenerateProgressivePreviewForURL;
    goto LABEL_6;
  }
  if (+[QLPreviewConverter isCSVDocumentType:](QLPreviewConverter, "isCSVDocumentType:", v3))
  {
LABEL_5:
    v4 = OIGenerateProgressivePreviewForURL;
    goto LABEL_6;
  }
  if (+[QLPreviewConverter isRTFDocumentType:](QLPreviewConverter, "isRTFDocumentType:", v3))
  {
    v4 = RTFGeneratePreviewForURL;
  }
  else if (+[QLPreviewConverter isLPDFDocumentType:](QLPreviewConverter, "isLPDFDocumentType:", v3))
  {
    v4 = LPDFGeneratePreviewForURL;
  }
  else
  {
    v6 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      v7 = (NSObject **)MEMORY[0x1E0D83678];
      QLSInitLogging();
      v6 = *v7;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_1D936E000, v6, OS_LOG_TYPE_ERROR, "Cannot find url converter callback for uti %@ #Conversion", (uint8_t *)&v8, 0xCu);
    }
    v4 = 0;
  }
LABEL_6:

  return v4;
}

+ (void)dataCallbackForUTI:(id)a3 andSize:(unint64_t)a4
{
  id v4;
  void *v5;
  NSObject *v7;
  NSObject **v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[QLPreviewConverter isOfficeDocumentType:](QLPreviewConverter, "isOfficeDocumentType:", v4))
    goto LABEL_5;
  if (+[QLPreviewConverter isIWorkDocumentType:](QLPreviewConverter, "isIWorkDocumentType:", v4))
  {
    v5 = IWGenerateAtomicPreviewForData;
    goto LABEL_6;
  }
  if (+[QLPreviewConverter isCSVDocumentType:](QLPreviewConverter, "isCSVDocumentType:", v4))
  {
LABEL_5:
    v5 = OIGenerateProgressivePreviewForData;
    goto LABEL_6;
  }
  if (+[QLPreviewConverter isRTFDocumentType:](QLPreviewConverter, "isRTFDocumentType:", v4))
  {
    v5 = RTFGeneratePreviewForData;
  }
  else
  {
    v7 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      v8 = (NSObject **)MEMORY[0x1E0D83678];
      QLSInitLogging();
      v7 = *v8;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1D936E000, v7, OS_LOG_TYPE_ERROR, "Cannot find data converter callback for uti %@ #Conversion", (uint8_t *)&v9, 0xCu);
    }
    v5 = 0;
  }
LABEL_6:

  return v5;
}

- (void)computePreview
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSData *data;
  uint64_t (*v14)(uint64_t, __QLPreviewRequest *, const void *);
  uint64_t (*v15)(uint64_t, __QLPreviewRequest *, const void *);
  void *v16;
  NSString *uti;
  NSURL *url;
  void *v19;
  void (*v20)(_QWORD, QLBasePreviewParts *, void *, NSString *, void *);
  id v21;

  -[QLPreviewParts previewURL](self, "previewURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v21 = v3;
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom") == 0;

    v6 = (void *)MEMORY[0x1E0C99E08];
    objc_msgSend(v21, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewConverterParts fileName](self, "fileName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithObjectsAndKeys:", v7, CFSTR("URLBase"), v8, CFSTR("IsOnPhone"), v9, CFSTR("FileName"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[QLPreviewConverterParts password](self, "password");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[QLPreviewConverterParts password](self, "password");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("Password"));

    }
    data = self->super._data;
    if (data)
    {
      v14 = +[QLBasePreviewParts dataCallbackForUTI:andSize:](QLBasePreviewParts, "dataCallbackForUTI:andSize:", self->super._uti, -[NSData length](data, "length"));
      if (v14)
      {
        v15 = v14;
        v16 = self->super._data;
        uti = self->super._uti;
LABEL_7:
        ((void (*)(_QWORD, QLBasePreviewParts *, void *, NSString *, void *))v15)(0, self, v16, uti, v10);
      }
    }
    else
    {
      url = self->super._url;
      if (url)
      {
        if (!-[NSURL isFileURL](url, "isFileURL"))
        {
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:", self->super._url);
          v20 = +[QLBasePreviewParts dataCallbackForUTI:andSize:](QLBasePreviewParts, "dataCallbackForUTI:andSize:", self->super._uti, -[NSData length](self->super._data, "length"));
          if (v20)
            v20(0, self, v19, self->super._uti, v10);

          goto LABEL_19;
        }
        v15 = +[QLBasePreviewParts isBundleURL:](QLBasePreviewParts, "isBundleURL:", self->super._url)
           && PGPackageHasEmbeddedPreview(self->super._url)
            ? PGGeneratePreviewForURL
            : (uint64_t (*)(uint64_t, __QLPreviewRequest *, const void *))+[QLBasePreviewParts urlCallbackForUTI:](QLBasePreviewParts, "urlCallbackForUTI:", self->super._uti);
        if (v15)
        {
          v16 = self->super._url;
          uti = self->super._uti;
          goto LABEL_7;
        }
      }
    }
LABEL_19:

    v3 = v21;
  }

}

@end
