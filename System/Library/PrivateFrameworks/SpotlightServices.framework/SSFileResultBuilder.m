@implementation SSFileResultBuilder

+ (id)bundleId
{
  return CFSTR("com.apple.DocumentsApp");
}

+ (BOOL)supportsResult:(id)a3
{
  id v4;
  void *v5;
  char v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "resultBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___SSFileResultBuilder;
  LOBYTE(a1) = objc_msgSendSuper2(&v8, sel_supportsResult_, v4);

  if ((a1 & 1) != 0 || (objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple.CloudDocs")) & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.FileProvider.LocalStorage"));

  return v6;
}

+ (BOOL)isCoreSpotlightResult
{
  return 1;
}

+ (id)stringWithModificationDate:(id)a3 creationDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    +[SSDateFormatManager dateModifiedStringFormat](SSDateFormatManager, "dateModifiedStringFormat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v5;
  }
  else
  {
    if (!v6)
    {
      v8 = 0;
      v10 = 0;
      goto LABEL_8;
    }
    +[SSDateFormatManager dateCreatedStringFormat](SSDateFormatManager, "dateCreatedStringFormat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
  }
  v10 = v9;
  if (!v8)
  {
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  +[SSDateFormatManager shortDateTimeFormatter](SSDateFormatManager, "shortDateTimeFormatter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringFromDate:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v8, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v13;
}

+ (id)stringWithPageCount:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PAGES_FORMAT"), &stru_1E6E549F0, CFSTR("SpotlightServices"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (SSFileResultBuilder)initWithResult:(id)a3
{
  id v4;
  SSFileResultBuilder *v5;
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
  int v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SSFileResultBuilder;
  v5 = -[SSResultBuilder initWithResult:](&v26, sel_initWithResult_, v4);
  if (v5)
  {
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA60D0], objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSFileResultBuilder setCreationDate:](v5, "setCreationDate:", v6);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA60E0], objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSFileResultBuilder setModificationDate:](v5, "setModificationDate:", v7);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA62F0], objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[SSResultBuilder setCoreSpotlightId:](v5, "setCoreSpotlightId:", v8);
    }
    else
    {
      objc_msgSend(v4, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSResultBuilder setCoreSpotlightId:](v5, "setCoreSpotlightId:", v9);

    }
    objc_msgSend(v4, "fileProviderIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[SSFileResultBuilder setFileProviderId:](v5, "setFileProviderId:", v10);
    }
    else
    {
      objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6310], objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSFileResultBuilder setFileProviderId:](v5, "setFileProviderId:", v11);

    }
    objc_msgSend(v4, "fileProviderDomainIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[SSFileResultBuilder setFileProviderDomainId:](v5, "setFileProviderDomainId:", v12);
    }
    else
    {
      objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6198], objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSFileResultBuilder setFileProviderDomainId:](v5, "setFileProviderDomainId:", v13);

    }
    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6430], objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSFileResultBuilder setKind:](v5, "setKind:", v14);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6960], objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSFileResultBuilder setThumbnailURL:](v5, "setThumbnailURL:", v15);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6158], objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSFileResultBuilder setName:](v5, "setName:", v16);

    v17 = isMacOS();
    v18 = (_QWORD *)MEMORY[0x1E0CA6468];
    if (!v17)
      v18 = (_QWORD *)MEMORY[0x1E0CA6318];
    objc_msgSend(v4, "valueForAttribute:withType:", *v18, objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSFileResultBuilder setSizeInBytes:](v5, "setSizeInBytes:", v19);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA64C8], objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSFileResultBuilder setPageCount:](v5, "setPageCount:", v20);

    objc_msgSend(v4, "contentType");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSFileResultBuilder setContentType:](v5, "setContentType:", v21);

    -[SSFileResultBuilder contentType](v5, "contentType");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x1E0CEC4F0], "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSFileResultBuilder setIsFolder:](v5, "setIsFolder:", objc_msgSend(v22, "isEqualToString:", v23));

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6108], objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSResultBuilder setFilePath:](v5, "setFilePath:", v24);

  }
  return v5;
}

- (id)buildInlineCardSection
{
  void *v3;
  void *v4;
  uint64_t v5;
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
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SSFileResultBuilder;
  -[SSResultBuilder buildInlineCardSection](&v19, sel_buildInlineCardSection);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((SSSnippetModernizationEnabled() & 1) == 0)
  {
    -[SSFileResultBuilder pageCount](self, "pageCount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedIntegerValue");

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0D8C660];
      v7 = (void *)objc_opt_class();
      -[SSFileResultBuilder pageCount](self, "pageCount");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithPageCount:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "textWithString:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "descriptions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "arrayByAddingObject:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setDescriptions:", v12);

    }
    v13 = (void *)objc_opt_class();
    -[SSFileResultBuilder modificationDate](self, "modificationDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSFileResultBuilder creationDate](self, "creationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithModificationDate:creationDate:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setFootnote:", v17);

    }
    else
    {
      objc_msgSend(v3, "setFootnote:", 0);
    }

  }
  return v3;
}

- (id)buildButtonItems
{
  void *v3;
  void *v4;
  void *v6;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (SSSnippetModernizationEnabled())
  {
    -[SSFileResultBuilder openFileProviderItemCommand](self, "openFileProviderItemCommand");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 && !-[SSFileResultBuilder isFolder](self, "isFolder"))
    {
      objc_msgSend(v3, "setShouldRevealFile:", 1);
      v6 = (void *)objc_opt_new();
      objc_msgSend(v6, "setCommand:", v3);
      v8[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      return v4;
    }

  }
  v7.receiver = self;
  v7.super_class = (Class)SSFileResultBuilder;
  -[SSResultBuilder buildButtonItems](&v7, sel_buildButtonItems);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (BOOL)buildButtonItemsAreTrailing
{
  return 1;
}

- (id)buildCompactCardSection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SSFileResultBuilder;
  -[SSResultBuilder buildCompactCardSection](&v12, sel_buildCompactCardSection);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_class();
  -[SSFileResultBuilder modificationDate](self, "modificationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSFileResultBuilder creationDate](self, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithModificationDate:creationDate:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "descriptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByAddingObject:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDescriptions:", v10);

  }
  return v3;
}

- (id)buildThumbnail
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  objc_super v16;

  -[SSResultBuilder filePath](self, "filePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {

    goto LABEL_3;
  }
  -[SSResultBuilder coreSpotlightId](self, "coreSpotlightId");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[SSFileResultBuilder fileProviderId](self, "fileProviderId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
LABEL_3:
      v4 = (void *)objc_opt_new();
      -[SSResultBuilder coreSpotlightId](self, "coreSpotlightId");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setCoreSpotlightIdentifier:", v5);

      -[SSFileResultBuilder fileProviderId](self, "fileProviderId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setFileProviderIdentifier:", v6);

      -[SSResultBuilder filePath](self, "filePath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v8 = (void *)MEMORY[0x1E0C99E98];
        -[SSResultBuilder filePath](self, "filePath");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "fileURLWithPath:isDirectory:", v9, -[SSFileResultBuilder isFolder](self, "isFolder"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setFilePath:", v10);

      }
      return v4;
    }
  }
  else
  {

  }
  SSGeneralLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[SSFileResultBuilder buildThumbnail].cold.1(self, v14);

  v16.receiver = self;
  v16.super_class = (Class)SSFileResultBuilder;
  -[SSResultBuilder buildThumbnail](&v16, sel_buildThumbnail);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (id)buildBadgingImageWithThumbnail:(id)a3
{
  id v4;
  void *v5;
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

  v4 = a3;
  if (-[SSFileResultBuilder isFolder](self, "isFolder") || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
LABEL_3:
    v5 = 0;
    goto LABEL_4;
  }
  -[SSResultBuilder filePath](self, "filePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else
  {
    -[SSResultBuilder coreSpotlightId](self, "coreSpotlightId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_4;
    -[SSFileResultBuilder fileProviderId](self, "fileProviderId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      goto LABEL_3;
  }
  v5 = (void *)objc_opt_new();
  -[SSResultBuilder coreSpotlightId](self, "coreSpotlightId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCoreSpotlightIdentifier:", v8);

  -[SSFileResultBuilder fileProviderId](self, "fileProviderId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFileProviderIdentifier:", v9);

  -[SSResultBuilder filePath](self, "filePath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0D8C5E0];
    v12 = (void *)MEMORY[0x1E0C99E98];
    -[SSResultBuilder filePath](self, "filePath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fileURLWithPath:isDirectory:", v13, -[SSFileResultBuilder isFolder](self, "isFolder"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "punchoutWithURL:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPunchout:", v15);

  }
LABEL_4:

  return v5;
}

+ (CGSize)defaultThumbnailSizeIsCompact:(BOOL)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 0.0;
  v4 = 0.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)buildDescriptions
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[SSFileResultBuilder sizeInBytes](self, "sizeInBytes");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[SSFileResultBuilder isFolder](self, "isFolder");

    if (!v6)
    {
      -[SSFileResultBuilder sizeInBytes](self, "sizeInBytes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[SSNumberFormatManager stringFromByteCount:](SSNumberFormatManager, "stringFromByteCount:", objc_msgSend(v7, "longLongValue"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v8);

    }
  }
  -[SSResultBuilder uniformType](self, "uniformType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

  }
  else
  {
    -[SSFileResultBuilder kind](self, "kind");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_11;
  }
  -[SSResultBuilder uniformType](self, "uniformType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedDescription");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;

LABEL_10:
    objc_msgSend(v3, "addObject:", v13);

    goto LABEL_11;
  }
  -[SSFileResultBuilder kind](self, "kind");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    goto LABEL_10;
LABEL_11:
  -[SSFileResultBuilder modificationDate](self, "modificationDate");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    v16 = SSSnippetModernizationEnabled();

    if (v16)
    {
      if ((isMacOS() & 1) != 0)
      {
        v17 = (void *)objc_opt_class();
        -[SSFileResultBuilder modificationDate](self, "modificationDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithModificationDate:creationDate:", v18, 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[SSDateFormatManager shortDateTimeFormatter](SSDateFormatManager, "shortDateTimeFormatter");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SSFileResultBuilder modificationDate](self, "modificationDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringFromDate:", v20);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v3, "addObject:", v19);

    }
  }
  if (SSSnippetModernizationEnabled())
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" · "));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "richTextsFromStrings:", v3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

- (id)buildPunchouts
{
  return 0;
}

- (id)buildCommand
{
  void *v3;

  -[SSFileResultBuilder openFileProviderItemCommand](self, "openFileProviderItemCommand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[SSFileResultBuilder buildPunchoutCommandForFile](self, "buildPunchoutCommandForFile");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)openFileProviderItemCommand
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SSFileResultBuilder fileProviderId](self, "fileProviderId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SSResultBuilder coreSpotlightId](self, "coreSpotlightId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v3 = (void *)objc_opt_new();
      -[SSResultBuilder coreSpotlightId](self, "coreSpotlightId");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setCoreSpotlightIdentifier:", v5);

      -[SSFileResultBuilder fileProviderId](self, "fileProviderId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setFileProviderIdentifier:", v6);

    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (id)buildPunchoutCommandForFile
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SSResultBuilder result](self, "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D8C5E0], "punchoutWithURL:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPunchout:", v5);

  return v4;
}

- (id)buildAppTopHitEntityCardSection
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSFileResultBuilder;
  -[SSResultBuilder buildAppTopHitEntityCardSection](&v5, sel_buildAppTopHitEntityCardSection);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thumbnail");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCornerRoundingStyle:", 1);

  return v2;
}

- (BOOL)isFolder
{
  return self->_isFolder;
}

- (void)setIsFolder:(BOOL)a3
{
  self->_isFolder = a3;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
  objc_storeStrong((id *)&self->_modificationDate, a3);
}

- (NSNumber)sizeInBytes
{
  return self->_sizeInBytes;
}

- (void)setSizeInBytes:(id)a3
{
  objc_storeStrong((id *)&self->_sizeInBytes, a3);
}

- (NSNumber)pageCount
{
  return self->_pageCount;
}

- (void)setPageCount:(id)a3
{
  objc_storeStrong((id *)&self->_pageCount, a3);
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
  objc_storeStrong((id *)&self->_contentType, a3);
}

- (NSString)fileProviderId
{
  return self->_fileProviderId;
}

- (void)setFileProviderId:(id)a3
{
  objc_storeStrong((id *)&self->_fileProviderId, a3);
}

- (NSString)fileProviderDomainId
{
  return self->_fileProviderDomainId;
}

- (void)setFileProviderDomainId:(id)a3
{
  objc_storeStrong((id *)&self->_fileProviderDomainId, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
  objc_storeStrong((id *)&self->_kind, a3);
}

- (NSString)thumbnailURL
{
  return self->_thumbnailURL;
}

- (void)setThumbnailURL:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailURL, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_fileProviderDomainId, 0);
  objc_storeStrong((id *)&self->_fileProviderId, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_pageCount, 0);
  objc_storeStrong((id *)&self->_sizeInBytes, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

- (void)buildThumbnail
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "result");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileProviderDomainIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "result");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileProviderIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138413058;
  v11 = v4;
  v12 = 2112;
  v13 = v6;
  v14 = 2112;
  v15 = v8;
  v16 = 2112;
  v17 = v9;
  _os_log_error_impl(&dword_1B86C5000, a2, OS_LOG_TYPE_ERROR, "SSFileResultBuilder: missing info for SFQuickLookThumbnailImage: %@\nresult.fileProviderDomainIdentifier: %@\nresult.fileProviderIdentifier: %@\nfilePath: %@", (uint8_t *)&v10, 0x2Au);

}

@end
