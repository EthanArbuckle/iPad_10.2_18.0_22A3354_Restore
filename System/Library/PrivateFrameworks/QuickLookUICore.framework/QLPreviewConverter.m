@implementation QLPreviewConverter

+ (id)convertibleMIMETypes
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

  v3 = (void *)objc_opt_new();
  objc_msgSend(a1, "_officeMIMETypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  objc_msgSend(a1, "_iWorkMIMETypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  objc_msgSend(a1, "_rtfMIMETypes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v9);

  objc_msgSend(a1, "_csvMIMETypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v11);

  objc_msgSend(a1, "_spreadSheetMIMETypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v13);

  v14 = (void *)objc_msgSend(v3, "copy");
  return v14;
}

+ (id)_officeMIMETypes
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  if (!_officeMIMETypes_result)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("application/vnd.ms-powerpoint"), CFSTR("application/vnd.openxmlformats-officedocument.presentationml.presentation"), CFSTR("application/vnd.openxmlformats-officedocument.presentationml.template"), CFSTR("application/vnd.openxmlformats-officedocument.presentationml.slideshow"), CFSTR("application/vnd.ms-powerpoint.presentation.macroenabled.12"), CFSTR("application/vnd.ms-powerpoint.slideshow.macroenabled.12"), CFSTR("application/vnd.ms-powerpoint.template.macroenabled.12"), CFSTR("application/vnd.ms-excel"), CFSTR("application/vnd.openxmlformats-officedocument.spreadsheetml.template"), CFSTR("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"), CFSTR("application/vnd.ms-excel.template.macroenabled.12"), CFSTR("application/vnd.ms-excel.sheet.macroenabled.12"), CFSTR("application/msword"), CFSTR("application/vnd.openxmlformats-officedocument.wordprocessingml.document"), CFSTR("application/vnd.openxmlformats-officedocument.wordprocessingml.template"), CFSTR("application/vnd.ms-word.document.macroenabled.12"), 0);
    v4 = (void *)_officeMIMETypes_result;
    _officeMIMETypes_result = v3;

  }
  objc_sync_exit(v2);

  return (id)_officeMIMETypes_result;
}

+ (id)_iWorkMIMETypes
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  if (!_iWorkMIMETypes_result)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("application/vnd.iwork.numbers.archive"), CFSTR("application/vnd.iwork.pages.archive"), CFSTR("application/x-iwork-keynote-sffkey"), CFSTR("application/x-iwork-numbers-sffnumbers"), CFSTR("application/x-iwork-pages-sffpages"), CFSTR("application/vnd.iwork.numbers.archive"), CFSTR("application/vnd.iwork.pages.archive"), CFSTR("application/vnd.iwork.keynote.archive"), 0);
    v4 = (void *)_iWorkMIMETypes_result;
    _iWorkMIMETypes_result = v3;

  }
  objc_sync_exit(v2);

  return (id)_iWorkMIMETypes_result;
}

+ (id)_rtfMIMETypes
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  if (!_rtfMIMETypes_result)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("application/rtf"), CFSTR("application/rtfd"), 0);
    v4 = (void *)_rtfMIMETypes_result;
    _rtfMIMETypes_result = v3;

  }
  objc_sync_exit(v2);

  return (id)_rtfMIMETypes_result;
}

+ (id)_csvMIMETypes
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  if (!_csvMIMETypes_result)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("text/comma-separated-values"), CFSTR("text/csv"), 0);
    v4 = (void *)_csvMIMETypes_result;
    _csvMIMETypes_result = v3;

  }
  objc_sync_exit(v2);

  return (id)_csvMIMETypes_result;
}

+ (id)_spreadSheetMIMETypes
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  if (!_spreadSheetMIMETypes_result)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("application/vnd.ms-excel"), CFSTR("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"), CFSTR("application/vnd.ms-excel.sheet.macroenabled.12"), CFSTR("application/vnd.openxmlformats-officedocument.spreadsheetml.template"), CFSTR("application/vnd.ms-excel.template.macroenabled.12"), CFSTR("application/vnd.iwork.numbers.archive"), CFSTR("application/x-iwork-numbers-sffnumbers"), 0);
    v4 = (void *)_spreadSheetMIMETypes_result;
    _spreadSheetMIMETypes_result = v3;

  }
  objc_sync_exit(v2);

  return (id)_spreadSheetMIMETypes_result;
}

+ (id)convertibleUTIs
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__QLPreviewConverter_convertibleUTIs__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (convertibleUTIs_once != -1)
    dispatch_once(&convertibleUTIs_once, block);
  return (id)objc_msgSend((id)convertibleUTIs_allUTIs, "copy");
}

void __37__QLPreviewConverter_convertibleUTIs__block_invoke(uint64_t a1)
{
  uint64_t v2;
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
  void *v19;
  void *v20;
  id v21;

  v2 = objc_opt_new();
  v3 = (void *)convertibleUTIs_allUTIs;
  convertibleUTIs_allUTIs = v2;

  v4 = (void *)convertibleUTIs_allUTIs;
  objc_msgSend(*(id *)(a1 + 32), "_officeUTIs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  v7 = (void *)convertibleUTIs_allUTIs;
  objc_msgSend(*(id *)(a1 + 32), "_iWorkUTIs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v9);

  v10 = (void *)convertibleUTIs_allUTIs;
  objc_msgSend(*(id *)(a1 + 32), "_rtfUTIs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObjectsFromArray:", v12);

  v13 = (void *)convertibleUTIs_allUTIs;
  objc_msgSend(*(id *)(a1 + 32), "_lpdfUTIs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObjectsFromArray:", v15);

  v16 = (void *)convertibleUTIs_allUTIs;
  objc_msgSend(*(id *)(a1 + 32), "_csvUTIs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObjectsFromArray:", v18);

  v19 = (void *)convertibleUTIs_allUTIs;
  objc_msgSend(*(id *)(a1 + 32), "_spreadSheetUTIs");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObjectsFromArray:", v20);

}

+ (id)convertibleTypes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__QLPreviewConverter_convertibleTypes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (convertibleTypes_once != -1)
    dispatch_once(&convertibleTypes_once, block);
  return (id)objc_msgSend((id)convertibleTypes_allTypes, "copy");
}

void __38__QLPreviewConverter_convertibleTypes__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend(*(id *)(a1 + 32), "convertibleUTIs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "initWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)convertibleTypes_allTypes;
  convertibleTypes_allTypes = v4;

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "convertibleUTIs", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend((id)convertibleTypes_allTypes, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

+ (id)_officeUTIs
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  if (!_officeUTIs_result)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("com.microsoft.powerpoint.ppt"), CFSTR("com.microsoft.powerpoint.pot"), CFSTR("com.microsoft.powerpoint.pps"), CFSTR("org.openxmlformats.presentationml.presentation"), CFSTR("org.openxmlformats.presentationml.presentation.macroenabled"), CFSTR("org.openxmlformats.presentationml.template"), CFSTR("org.openxmlformats.presentationml.template.macroenabled"), CFSTR("org.openxmlformats.presentationml.slideshow"), CFSTR("org.openxmlformats.presentationml.slideshow.macroenabled"), CFSTR("com.microsoft.excel.xls"), CFSTR("com.microsoft.excel.xlt"), CFSTR("com.microsoft.excel.xla"), CFSTR("org.openxmlformats.spreadsheetml.sheet"), CFSTR("org.openxmlformats.spreadsheetml.sheet.macroenabled"), CFSTR("org.openxmlformats.spreadsheetml.template"), CFSTR("org.openxmlformats.spreadsheetml.template.macroenabled"), CFSTR("com.microsoft.word.doc"),
           CFSTR("com.microsoft.word.dot"),
           CFSTR("org.openxmlformats.wordprocessingml.document"),
           CFSTR("org.openxmlformats.wordprocessingml.document.macroenabled"),
           CFSTR("org.openxmlformats.wordprocessingml.template"),
           CFSTR("org.openxmlformats.wordprocessingml.template.macroenabled"),
           0);
    v4 = (void *)_officeUTIs_result;
    _officeUTIs_result = v3;

  }
  objc_sync_exit(v2);

  return (id)_officeUTIs_result;
}

+ (id)_iWorkUTIs
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  if (!_iWorkUTIs_result)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("com.apple.iwork.keynote.key"), CFSTR("com.apple.iwork.numbers.numbers"), CFSTR("com.apple.iwork.pages.pages"), CFSTR("com.apple.iwork.keynote.sffkey"), CFSTR("com.apple.iwork.numbers.sffnumbers"), CFSTR("com.apple.iwork.pages.sffpages"), CFSTR("com.apple.iwork.numbers.template"), CFSTR("com.apple.iwork.numbers.sfftemplate"), CFSTR("com.apple.iwork.pages.template"), CFSTR("com.apple.iwork.pages.sfftemplate"), CFSTR("com.apple.iwork.keynote.kth"), CFSTR("com.apple.iwork.keynote.sffkth"), 0);
    v4 = (void *)_iWorkUTIs_result;
    _iWorkUTIs_result = v3;

  }
  objc_sync_exit(v2);

  return (id)_iWorkUTIs_result;
}

+ (id)_rtfUTIs
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  if (!_rtfUTIs_result)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("public.rtf"), CFSTR("com.apple.rtfd"), 0);
    v4 = (void *)_rtfUTIs_result;
    _rtfUTIs_result = v3;

  }
  objc_sync_exit(v2);

  return (id)_rtfUTIs_result;
}

+ (id)_lpdfUTIs
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  if (!_lpdfUTIs_result)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("com.apple.localized-pdf-bundle"), 0);
    v4 = (void *)_lpdfUTIs_result;
    _lpdfUTIs_result = v3;

  }
  objc_sync_exit(v2);

  return (id)_lpdfUTIs_result;
}

+ (id)_csvUTIs
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  if (!_csvUTIs_result)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("public.comma-separated-values-text"), 0);
    v4 = (void *)_csvUTIs_result;
    _csvUTIs_result = v3;

  }
  objc_sync_exit(v2);

  return (id)_csvUTIs_result;
}

+ (id)_spreadSheetUTIs
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_opt_class();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v2);
  if (!_spreadSheetUTIs_result)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("com.microsoft.excel.xls"), CFSTR("com.microsoft.excel.xlt"), CFSTR("com.microsoft.excel.xla"), CFSTR("org.openxmlformats.spreadsheetml.sheet"), CFSTR("org.openxmlformats.spreadsheetml.sheet.macroenabled"), CFSTR("org.openxmlformats.spreadsheetml.template"), CFSTR("org.openxmlformats.spreadsheetml.template.macroenabled"), CFSTR("com.apple.iwork.numbers.template"), CFSTR("com.apple.iwork.numbers.sfftemplate"), CFSTR("com.apple.iwork.numbers.numbers"), CFSTR("com.apple.iwork.numbers.sffnumbers"), 0);
    v4 = (void *)_spreadSheetUTIs_result;
    _spreadSheetUTIs_result = v3;

  }
  objc_sync_exit(v2);

  return (id)_spreadSheetUTIs_result;
}

+ (BOOL)isOfficeDocumentType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_officeUTIs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

+ (BOOL)isIWorkDocumentType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_iWorkUTIs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

+ (BOOL)isCSVDocumentType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_csvUTIs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

+ (BOOL)isLPDFDocumentType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_lpdfUTIs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

+ (BOOL)isRTFDocumentType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_rtfUTIs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

+ (BOOL)isSpreadSheetDocumentType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_spreadSheetUTIs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

+ (BOOL)canConvertDocumentType:(id)a3
{
  return +[QLBasePreviewParts canConvertDocumentType:](QLBasePreviewParts, "canConvertDocumentType:", a3);
}

- (QLPreviewConverter)initWithURL:(id)a3 uti:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  QLPreviewConverter *v11;
  QLBasePreviewParts *v12;
  QLPreviewConverterParts *previewParts;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)QLPreviewConverter;
  v11 = -[QLPreviewConverter init](&v18, sel_init);
  if (v11)
  {
    v12 = objc_alloc_init(QLBasePreviewParts);
    previewParts = v11->_previewParts;
    v11->_previewParts = &v12->super;

    -[QLPreviewConverterParts setUrl:](v11->_previewParts, "setUrl:", v8);
    objc_msgSend(v8, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastPathComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewConverterParts setFileName:](v11->_previewParts, "setFileName:", v15);

    -[QLPreviewConverterParts setUti:](v11->_previewParts, "setUti:", v9);
    objc_msgSend(v10, "objectForKey:", CFSTR("Password"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewConverterParts setPassword:](v11->_previewParts, "setPassword:", v16);

    +[QLPreviewConverterParts registerPreview:](QLPreviewConverterParts, "registerPreview:", v11->_previewParts);
  }

  return v11;
}

- (QLPreviewConverter)initWithData:(id)a3 name:(id)a4 uti:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  QLPreviewConverter *v14;
  QLBasePreviewParts *v15;
  QLPreviewConverterParts *previewParts;
  void *v17;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)QLPreviewConverter;
  v14 = -[QLPreviewConverter init](&v19, sel_init);
  if (v14)
  {
    v15 = objc_alloc_init(QLBasePreviewParts);
    previewParts = v14->_previewParts;
    v14->_previewParts = &v15->super;

    -[QLPreviewConverterParts setData:](v14->_previewParts, "setData:", v10);
    -[QLPreviewConverterParts setFileName:](v14->_previewParts, "setFileName:", v11);
    -[QLPreviewConverterParts setUti:](v14->_previewParts, "setUti:", v12);
    objc_msgSend(v13, "objectForKey:", CFSTR("Password"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewConverterParts setPassword:](v14->_previewParts, "setPassword:", v17);

    +[QLPreviewConverterParts registerPreview:](QLPreviewConverterParts, "registerPreview:", v14->_previewParts);
  }

  return v14;
}

- (QLPreviewConverter)initWithConnection:(id)a3 delegate:(id)a4 response:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  QLPreviewConverter *v14;
  QLBasePreviewParts *v15;
  QLPreviewConverterParts *previewParts;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSDictionary *options;
  objc_super v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)QLPreviewConverter;
  v14 = -[QLPreviewConverter init](&v27, sel_init);
  if (v14)
  {
    v15 = objc_alloc_init(QLBasePreviewParts);
    previewParts = v14->_previewParts;
    v14->_previewParts = &v15->super;

    -[QLPreviewConverterParts setConnection:](v14->_previewParts, "setConnection:", v10);
    -[QLPreviewConverterParts setDelegate:](v14->_previewParts, "setDelegate:", v11);
    objc_msgSend(v13, "objectForKey:", CFSTR("Password"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewConverterParts setPassword:](v14->_previewParts, "setPassword:", v17);

    v18 = objc_msgSend(v12, "expectedContentLength");
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", v18 & ~(v18 >> 63));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewConverterParts setData:](v14->_previewParts, "setData:", v19);

    objc_msgSend(v12, "suggestedFilename");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "MIMEType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)_QLTypeCopyUTIForFileNameAndMimeType(v20, v21);

    objc_msgSend(v12, "suggestedFilename");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLPreviewConverterParts setFileName:](v14->_previewParts, "setFileName:", v23);

    -[QLPreviewConverterParts setUti:](v14->_previewParts, "setUti:", v22);
    +[QLPreviewConverterParts registerPreview:](QLPreviewConverterParts, "registerPreview:", v14->_previewParts);
    v24 = objc_msgSend(v13, "copy");
    options = v14->_options;
    v14->_options = (NSDictionary *)v24;

  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_previewParts)
    +[QLPreviewConverterParts unregisterPreview:](QLPreviewConverterParts, "unregisterPreview:");
  if (self->_io_write)
  {
    self->_dataGatheringSucceeded = 0;
    -[QLPreviewConverter _closeIOCahnnel](self, "_closeIOCahnnel");
  }
  v3.receiver = self;
  v3.super_class = (Class)QLPreviewConverter;
  -[QLPreviewConverter dealloc](&v3, sel_dealloc);
}

- (void)_register
{
  +[QLPreviewConverterParts registerPreview:](QLPreviewConverterParts, "registerPreview:", self->_previewParts);
}

- (void)finishConverting
{
  QLPreviewConverterParts *previewParts;

  if (self->_previewParts)
  {
    +[QLPreviewConverterParts unregisterPreview:](QLPreviewConverterParts, "unregisterPreview:");
    previewParts = self->_previewParts;
    self->_previewParts = 0;

  }
}

- (void)cancel
{
  -[QLPreviewConverterParts cancel](self->_previewParts, "cancel");
}

- (BOOL)isCancelled
{
  return -[QLPreviewConverterParts isCancelled](self->_previewParts, "isCancelled");
}

- (BOOL)isComputed
{
  return -[QLPreviewConverterParts isComputed](self->_previewParts, "isComputed");
}

- (NSString)previewFileName
{
  void *v2;
  void *v3;

  -[QLPreviewConverterParts fileName](self->_previewParts, "fileName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (NSString)previewUTI
{
  void *v2;
  void *v3;

  -[QLPreviewConverterParts uti](self->_previewParts, "uti");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (QLPreviewConverterParts)previewParts
{
  return self->_previewParts;
}

- (NSURLRequest)previewRequest
{
  return (NSURLRequest *)-[QLPreviewConverterParts previewRequest](self->_previewParts, "previewRequest");
}

- (NSURLResponse)previewResponse
{
  return -[QLPreviewConverterParts previewResponse](self->_previewParts, "previewResponse");
}

- (id)safeRequestForRequest:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[QLPreviewConverterParts safeRequestForRequest:](self->_previewParts, "safeRequestForRequest:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E0CB39E0];
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("about:"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requestWithURL:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (BOOL)isSafeURL:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = objc_msgSend(CFSTR("x-apple-ql-id"), "caseInsensitiveCompare:", v3) == 0;
  else
    v4 = 0;

  return v4;
}

+ (BOOL)isSafeRequest:(id)a3
{
  void *v4;

  objc_msgSend(a3, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a1) = objc_msgSend(a1, "isSafeURL:", v4);

  return (char)a1;
}

- (void)appendData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[QLPreviewConverter appendDataArray:](self, "appendDataArray:", v6, v7, v8);
}

- (void)appendDataArray:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject **v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  void *v35;
  uint8_t buf[4];
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!self->_dataPhaseFinished)
  {
    if (self->_io_write)
    {
      -[QLPreviewConverter _writeDataArrayIntoStream:](self, "_writeDataArrayIntoStream:", v4);
    }
    else
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      if (v6)
      {
        v7 = v6;
        v8 = 0;
        v9 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v31 != v9)
              objc_enumerationMutation(v5);
            v8 += objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "length");
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        }
        while (v7);
      }
      else
      {
        v8 = 0;
      }
      -[QLPreviewConverterParts data](self->_previewParts, "data");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "length");
      v13 = v12 + v8;
      if ((unint64_t)(v12 + v8) < 0x3200001)
      {
        v18 = v12;
        objc_msgSend(v11, "increaseLengthBy:", v8);
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v19 = v5;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v27;
          do
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v27 != v22)
                objc_enumerationMutation(v19);
              v24 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
              v25 = objc_msgSend(v24, "length", (_QWORD)v26);
              objc_msgSend(v11, "replaceBytesInRange:withBytes:", v18, v25, objc_msgSend(objc_retainAutorelease(v24), "bytes"));
              v18 += v25;
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          }
          while (v21);
        }

      }
      else
      {
        v14 = (NSObject **)MEMORY[0x1E0D83678];
        v15 = *MEMORY[0x1E0D83678];
        if (!*MEMORY[0x1E0D83678])
        {
          QLSInitLogging();
          v15 = *v14;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v37 = v13;
          _os_log_impl(&dword_1D936E000, v15, OS_LOG_TYPE_DEFAULT, "Receiving data size bigger than what we can keep in memory (%lu) #Conversion", buf, 0xCu);
        }
        -[QLPreviewConverter _createDispatchIOChannel](self, "_createDispatchIOChannel");
        -[QLPreviewConverterParts data](self->_previewParts, "data");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[QLPreviewConverter _writeDataArrayIntoStream:](self, "_writeDataArrayIntoStream:", v17);

        -[QLPreviewConverterParts setData:](self->_previewParts, "setData:", 0);
        -[QLPreviewConverter _writeDataArrayIntoStream:](self, "_writeDataArrayIntoStream:", v5);
      }

    }
  }

}

- (void)_createDispatchIOChannel
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
  NSURL *v13;
  NSURL *tmpFileURL;
  id v15;
  const char *v16;
  OS_dispatch_io *v17;
  OS_dispatch_io *io_write;
  NSObject **v19;
  NSObject *v20;
  NSURL *v21;
  _QWORD cleanup_handler[5];
  uint8_t buf[4];
  NSURL *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!self->_io_write && !self->_tmpFileURL)
  {
    -[QLPreviewConverterParts uti](self->_previewParts, "uti");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = (void *)MEMORY[0x1E0CEC3F8];
      -[QLPreviewConverterParts uti](self->_previewParts, "uti");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "typeWithIdentifier:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "preferredFilenameExtension");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v7 = (void *)MEMORY[0x1E0C99E98];
    v8 = (void *)MEMORY[0x1E0CB3940];
    NSTemporaryDirectory();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_opt_new();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@%@.%@"), v9, v11, v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileURLWithPath:", v12);
    v13 = (NSURL *)objc_claimAutoreleasedReturnValue();
    tmpFileURL = self->_tmpFileURL;
    self->_tmpFileURL = v13;

    self->_totalWrittenBytes = 0;
    self->_dataGatheringSucceeded = 1;
    -[NSURL path](self->_tmpFileURL, "path");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = (const char *)objc_msgSend(v15, "UTF8String");
    cleanup_handler[0] = MEMORY[0x1E0C809B0];
    cleanup_handler[1] = 3221225472;
    cleanup_handler[2] = __46__QLPreviewConverter__createDispatchIOChannel__block_invoke;
    cleanup_handler[3] = &unk_1E9EFC550;
    cleanup_handler[4] = self;
    v17 = (OS_dispatch_io *)dispatch_io_create_with_path(0, v16, 513, 0x180u, MEMORY[0x1E0C80D38], cleanup_handler);
    io_write = self->_io_write;
    self->_io_write = v17;

    v19 = (NSObject **)MEMORY[0x1E0D83678];
    v20 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v20 = *v19;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = self->_tmpFileURL;
      *(_DWORD *)buf = 138412290;
      v24 = v21;
      _os_log_impl(&dword_1D936E000, v20, OS_LOG_TYPE_DEFAULT, "Creating tmp file to write the preview converter data (%@) #Conversion", buf, 0xCu);
    }

  }
}

uint64_t __46__QLPreviewConverter__createDispatchIOChannel__block_invoke(uint64_t a1, int a2)
{
  NSObject **v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  char v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a2 || (v13 = *(_QWORD *)(a1 + 32), !*(_BYTE *)(v13 + 49)))
  {
    v4 = (NSObject **)MEMORY[0x1E0D83678];
    v5 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v17) = a2;
      _os_log_impl(&dword_1D936E000, v5, OS_LOG_TYPE_DEFAULT, "Cannot write data into disk. error:%d. #Conversion", buf, 8u);
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *v4;
    if (!*v4)
    {
      QLSInitLogging();
      v7 = *v4;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_impl(&dword_1D936E000, v7, OS_LOG_TYPE_DEFAULT, "Deleting temporary file created for the conversion %@ due to an error while writing the incoming data into disk. #Conversion", buf, 0xCu);
    }
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
    v15 = 0;
    v10 = objc_msgSend(v6, "removeItemAtURL:error:", v9, &v15);
    v11 = v15;
    if ((v10 & 1) == 0)
    {
      v12 = *v4;
      if (!*v4)
      {
        QLSInitLogging();
        v12 = *v4;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v11;
        _os_log_impl(&dword_1D936E000, v12, OS_LOG_TYPE_DEFAULT, "Problem deleting the temporary file for the preview converter (%@) #Conversion", buf, 0xCu);
      }
    }

  }
  else
  {
    objc_msgSend(*(id *)(v13 + 8), "setUrl:", *(_QWORD *)(v13 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setShouldRemoveURLAfterGeneration:", 1);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "startComputingPreview");
}

- (void)_closeIOCahnnel
{
  NSObject *io_write;
  OS_dispatch_io *v4;

  io_write = self->_io_write;
  if (io_write)
  {
    dispatch_io_close(io_write, 0);
    v4 = self->_io_write;
    self->_io_write = 0;

  }
}

- (void)_writeDataArrayIntoStream:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t i;
  void *v10;
  id v11;
  const void *v12;
  size_t v13;
  NSObject *v14;
  NSObject *io_write;
  off_t totalWrittenBytes;
  id obj;
  _QWORD io_handler[5];
  _QWORD destructor[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v21;
    v7 = MEMORY[0x1E0C809B0];
    v8 = MEMORY[0x1E0C80D38];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        self->_totalWrittenBytes += objc_msgSend(v10, "length");
        v11 = objc_retainAutorelease(v10);
        v12 = (const void *)objc_msgSend(v11, "bytes");
        v13 = objc_msgSend(v11, "length");
        destructor[0] = v7;
        destructor[1] = 3221225472;
        destructor[2] = __48__QLPreviewConverter__writeDataArrayIntoStream___block_invoke;
        destructor[3] = &unk_1E9EFC370;
        destructor[4] = v11;
        v14 = dispatch_data_create(v12, v13, v8, destructor);
        io_write = self->_io_write;
        totalWrittenBytes = self->_totalWrittenBytes;
        io_handler[0] = v7;
        io_handler[1] = 3221225472;
        io_handler[2] = __48__QLPreviewConverter__writeDataArrayIntoStream___block_invoke_2;
        io_handler[3] = &unk_1E9EFC578;
        io_handler[4] = self;
        dispatch_io_write(io_write, totalWrittenBytes, v14, v8, io_handler);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v5);
  }

}

void __48__QLPreviewConverter__writeDataArrayIntoStream___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  id v6;
  NSObject **v7;
  NSObject *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4)
  {
    v7 = (NSObject **)MEMORY[0x1E0D83678];
    v8 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = a4;
      _os_log_impl(&dword_1D936E000, v8, OS_LOG_TYPE_DEFAULT, "Cannot write data into disk. error:%d. #Conversion", (uint8_t *)v9, 8u);
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) = 0;
    objc_msgSend(*(id *)(a1 + 32), "finishedAppendingData");
  }

}

- (void)finishedAppendingData
{
  if (!self->_dataPhaseFinished)
  {
    self->_dataPhaseFinished = 1;
    if (self->_io_write)
      -[QLPreviewConverter _closeIOCahnnel](self, "_closeIOCahnnel");
    else
      -[QLPreviewConverterParts startComputingPreview](self->_previewParts, "startComputingPreview");
  }
}

- (void)setHtmlErrorDisabled:(BOOL)a3
{
  -[QLPreviewConverterParts setHtmlErrorDisabled:](self->_previewParts, "setHtmlErrorDisabled:", a3);
}

- (BOOL)htmlErrorDisabled
{
  return -[QLPreviewConverterParts htmlErrorDisabled](self->_previewParts, "htmlErrorDisabled");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tmpFileURL, 0);
  objc_storeStrong((id *)&self->_io_write, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_previewParts, 0);
}

@end
