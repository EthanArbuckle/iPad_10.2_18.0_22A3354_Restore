@implementation AEBookInfo

- (BOOL)hasUpsellPage
{
  void *v3;
  unsigned int v4;

  if (+[BCAugmentedExperienceManager endOfBookExperienceFeatureEnabled](BCAugmentedExperienceManager, "endOfBookExperienceFeatureEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo sampleContent](self, "sampleContent"));
    if ((objc_msgSend(v3, "BOOLValue") & 1) != 0)
      LOBYTE(v4) = 1;
    else
      v4 = !-[AEBookInfo isStoreBook](self, "isStoreBook");

  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

+ (id)excludeDeletedBooksPredicate
{
  id v2;
  void *v3;

  v2 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithBool:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("deletedFlag != %@"), v2));

  return v3;
}

+ (id)linearDocumentPredicateForDatabaseKey:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("bookDatabaseKey == %@ AND documentOrdinal >= 0 AND nonlinearElement == FALSE"), a3);
}

+ (id)bookFromDatabaseKey:(id)a3 withMOC:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("databaseKey ==[n] %@"), v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entity:withPredicate:sortBy:ascending:fetchLimit:", CFSTR("AEBookInfo"), v7, 0, 0, 1));
    if (objc_msgSend(v8, "count"))
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", 0));
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)booksWithPredicate:(id)a3 sortBy:(id)a4 ascending:(BOOL)a5 fetchLimit:(int)a6 inMoc:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v8 = a5;
  v12 = a7;
  v13 = a4;
  v14 = a3;
  *(_QWORD *)&v15 = objc_opt_class(a1).n128_u64[0];
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "excludeDeletedBooksPredicate", v15));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSManagedObjectContext mergePredicate:andPredicate:](NSManagedObjectContext, "mergePredicate:andPredicate:", v14, v17));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "entity:withPredicate:sortBy:ascending:fetchLimit:", CFSTR("AEBookInfo"), v18, v13, v8, a6));
  return v19;
}

+ (id)booksWithPredicate:(id)a3 sortDescriptors:(id)a4 inMoc:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  *(_QWORD *)&v11 = objc_opt_class(a1).n128_u64[0];
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "excludeDeletedBooksPredicate", v11));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSManagedObjectContext mergePredicate:andPredicate:](NSManagedObjectContext, "mergePredicate:andPredicate:", v10, v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "entity:withPredicate:sortDescriptors:fetchLimit:prefetchRelationships:", CFSTR("AEBookInfo"), v14, v9, 0, 0));
  return v15;
}

+ (id)booksWithPredicate:(id)a3 inMoc:(id)a4
{
  id v6;
  id v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  *(_QWORD *)&v8 = objc_opt_class(a1).n128_u64[0];
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "excludeDeletedBooksPredicate", v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSManagedObjectContext mergePredicate:andPredicate:](NSManagedObjectContext, "mergePredicate:andPredicate:", v7, v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entity:withPredicate:sortBy:ascending:fetchLimit:", CFSTR("AEBookInfo"), v11, 0, 0, 0));
  return v12;
}

+ (id)bookObjectIDsWithPredicate:(id)a3 inMoc:(id)a4
{
  id v6;
  id v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  *(_QWORD *)&v8 = objc_opt_class(a1).n128_u64[0];
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "excludeDeletedBooksPredicate", v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSManagedObjectContext mergePredicate:andPredicate:](NSManagedObjectContext, "mergePredicate:andPredicate:", v7, v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectIDsWithPredicate:forEntity:", v11, CFSTR("AEBookInfo")));
  return v12;
}

+ (id)newBlankBook:(id)a3
{
  id v3;
  double v4;
  uint64_t v5;
  id v6;

  v3 = a3;
  *(_QWORD *)&v4 = objc_opt_class(AEBookInfo).n128_u64[0];
  v6 = objc_msgSend(v3, "newByClass:", v5, v4);

  return v6;
}

- (BOOL)exists
{
  void *v2;
  id v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo bookBundlePath](self, "bookBundlePath"));
  v3 = objc_alloc_init((Class)NSFileManager);
  v4 = 0;
  if (objc_msgSend(v2, "length") && v2)
    v4 = objc_msgSend(v3, "fileExistsAtPath:", v2);

  return v4;
}

- (id)basePlusContentPath
{
  NSString *basePlusContentPath;
  void *v4;
  id v5;
  NSString *v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  unsigned int v12;
  NSString *v13;
  NSString *v14;

  basePlusContentPath = self->_basePlusContentPath;
  if (!basePlusContentPath)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo bookContentSubpath](self, "bookContentSubpath"));
    v5 = objc_msgSend(v4, "length");

    v6 = (NSString *)objc_claimAutoreleasedReturnValue(-[AEBookInfo bookBundlePath](self, "bookBundlePath"));
    v7 = v6;
    if (v5)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo bookContentSubpath](self, "bookContentSubpath"));
      v9 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingPathComponent:](v7, "stringByAppendingPathComponent:", v8));
      v10 = self->_basePlusContentPath;
      self->_basePlusContentPath = v9;

    }
    else
    {
      v11 = self->_basePlusContentPath;
      self->_basePlusContentPath = v6;
      v7 = v11;
    }

    v12 = -[NSString characterAtIndex:](self->_basePlusContentPath, "characterAtIndex:", (char *)-[NSString length](self->_basePlusContentPath, "length") - 1);
    basePlusContentPath = self->_basePlusContentPath;
    if (v12 != 47)
    {
      v13 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingString:](basePlusContentPath, "stringByAppendingString:", CFSTR("/")));
      v14 = self->_basePlusContentPath;
      self->_basePlusContentPath = v13;

      basePlusContentPath = self->_basePlusContentPath;
    }
  }
  return basePlusContentPath;
}

- (void)setupFileSizeContentType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo bookBundlePath](self, "bookBundlePath"));
  -[AEBookInfo setContentType:](self, "setContentType:", +[AEBookInfo bookFormatByFilePath:](AEBookInfo, "bookFormatByFilePath:", v3));

  if (-[AEBookInfo contentType](self, "contentType") == 2)
  {
    v9 = objc_alloc_init((Class)NSFileManager);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo bookBundlePath](self, "bookBundlePath"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "attributesOfItemAtPath:error:", v4, 0));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", NSFileSize));
    -[AEBookInfo setFileSize:](self, "setFileSize:", v6);

LABEL_7:
    return;
  }
  if (!-[AEBookInfo contentType](self, "contentType"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo fileSize](self, "fileSize"));
    v8 = objc_msgSend(v7, "intValue");

    if (v8)
    {
      v9 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", 0);
      -[AEBookInfo setFileSize:](self, "setFileSize:");
      goto LABEL_7;
    }
  }
}

- (AEAnnotationProvider)annotationProvider
{
  AEAnnotationProvider *annotationProvider;

  annotationProvider = self->_annotationProvider;
  if (!annotationProvider)
  {
    -[AEBookInfo initializeAnnotationProviderWithAssetID:](self, "initializeAnnotationProviderWithAssetID:", 0);
    annotationProvider = self->_annotationProvider;
  }
  return annotationProvider;
}

- (void)initializeAnnotationProviderWithAssetID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  AEAnnotationProvider *v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BOOL8 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BOOL8 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  AEAnnotationProvider *annotationProvider;
  _BOOL8 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v4 = a3;
  if (!self->_annotationProvider)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo url](self, "url"));
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[AEPluginRegistry sharedInstance](AEPluginRegistry, "sharedInstance"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pluginForURL:", v5));

      if (!v7)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_11D1A8();
        v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v8)
          sub_11D174(v8, v9, v10, v11, v12, v13, v14, v15);
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "helperForURL:withOptions:", v5, 0));
      if (!v16)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_11D0F0();
        v17 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v17)
          sub_11D0BC(v17, v18, v19, v20, v21, v22, v23, v24);
      }
      v25 = (AEAnnotationProvider *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "annotationProviderWithCoordination:forAssetID:", 0, v4));
      if (!v25)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_11D038();
        v26 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v26)
          sub_11D004(v26, v27, v28, v29, v30, v31, v32, v33);
      }

    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_11CF80();
      v34 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v34)
        sub_11CF4C(v34, v35, v36, v37, v38, v39, v40, v41);
      v25 = (AEAnnotationProvider *)objc_claimAutoreleasedReturnValue(+[AEAnnotationProvider sharedInstance](AEAnnotationProvider, "sharedInstance"));
      if (!v25)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_11CEC8();
        v42 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v42)
          sub_11CE94(v42, v43, v44, v45, v46, v47, v48, v49);
        v25 = 0;
      }
    }
    annotationProvider = self->_annotationProvider;
    self->_annotationProvider = v25;

    if (!self->_annotationProvider)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_11CE10();
      v51 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v51)
        sub_11CDDC(v51, v52, v53, v54, v55, v56, v57, v58);
    }
  }

}

- (void)setupBaseURL
{
  uint64_t v3;
  void *v4;
  NSURL *v5;
  NSURL *baseUrl;
  id v7;

  if (!self->_baseUrl)
  {
    v3 = BEURLSchemeiBooks;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo databaseKey](self, "databaseKey"));
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@://%@"), v3, v4));

    if (v7)
    {
      v5 = (NSURL *)objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v7);
      baseUrl = self->_baseUrl;
      self->_baseUrl = v5;

    }
  }
}

- (void)setBookAuthor:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[AEBookInfo willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("bookAuthor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByConvertingControlCharactersToSpace"));

  -[AEBookInfo setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("bookAuthor"));
  -[AEBookInfo didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("bookAuthor"));
}

- (void)setSortAuthor:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v6, v4) & 1) != 0)
  {
    -[AEBookInfo willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("sortAuthor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByConvertingControlCharactersToSpace"));
    -[AEBookInfo setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("sortAuthor"));

    -[AEBookInfo didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("sortAuthor"));
  }

}

- (void)setBookTitle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[AEBookInfo willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("bookTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByConvertingControlCharactersToSpace"));

  -[AEBookInfo setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("bookTitle"));
  -[AEBookInfo didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("bookTitle"));
}

- (void)setSortTitle:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v6, v4) & 1) != 0)
  {
    -[AEBookInfo willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("sortTitle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByConvertingControlCharactersToSpace"));
    -[AEBookInfo setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("sortTitle"));

    -[AEBookInfo didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("sortTitle"));
  }

}

- (void)setTemporaryItemIdentifier:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v6, v4) & 1) != 0)
  {
    -[AEBookInfo willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("temporaryItemIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByConvertingControlCharactersToSpace"));
    -[AEBookInfo setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("temporaryItemIdentifier"));

    -[AEBookInfo didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("temporaryItemIdentifier"));
  }

}

- (void)setPublisherName:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v6, v4) & 1) != 0)
  {
    -[AEBookInfo willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("publisherName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByConvertingControlCharactersToSpace"));
    -[AEBookInfo setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("publisherName"));

    -[AEBookInfo didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("publisherName"));
  }

}

- (void)setPublisherLocation:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v6, v4) & 1) != 0)
  {
    -[AEBookInfo willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("publisherLocation"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByConvertingControlCharactersToSpace"));
    -[AEBookInfo setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("publisherLocation"));

    -[AEBookInfo didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("publisherLocation"));
  }

}

- (void)setPublisherYear:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v6, v4) & 1) != 0)
  {
    -[AEBookInfo willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("publisherYear"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByConvertingControlCharactersToSpace"));
    -[AEBookInfo setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("publisherYear"));

    -[AEBookInfo didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("publisherYear"));
  }

}

- (void)setStoreId:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v6, v4) & 1) != 0)
  {
    -[AEBookInfo willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("storeId"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByConvertingControlCharactersToSpace"));
    -[AEBookInfo setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("storeId"));

    -[AEBookInfo didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("storeId"));
  }

}

- (void)setGenre:(id)a3
{
  const __CFString *v4;
  void *v5;
  __CFString *v6;

  v4 = (const __CFString *)a3;
  if (!v4)
    v4 = &stru_1C3088;
  v6 = (__CFString *)v4;
  -[AEBookInfo willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("genre"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByConvertingControlCharactersToSpace](v6, "stringByConvertingControlCharactersToSpace"));
  -[AEBookInfo setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("genre"));

  -[AEBookInfo didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("genre"));
}

- (BOOL)needsGenericCoverArt
{
  unsigned int v3;
  void *v4;
  BOOL v5;
  void *v6;

  v3 = -[AEBookInfo contentType](self, "contentType");
  if (v3 == 2)
    return 0;
  if (v3)
    return 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo iTunesArtHref](self, "iTunesArtHref"));
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo embeddedArtHref](self, "embeddedArtHref"));
    v5 = v6 == 0;

  }
  return v5;
}

- (void)_clearTransient
{
  NSURL *url;
  NSURL *baseUrl;
  NSString *basePlusContentPath;
  NSString *password;
  AEBookInfo *v7;
  NSArray *sortedDocuments;
  NSArray *linearDocuments;
  NSDictionary *linearOrdinalMap;
  NSNumber *shouldDisableOptimizeSpeed;

  url = self->_url;
  self->_url = 0;

  baseUrl = self->_baseUrl;
  self->_baseUrl = 0;

  basePlusContentPath = self->_basePlusContentPath;
  self->_basePlusContentPath = 0;

  password = self->_password;
  self->_password = 0;

  v7 = self;
  objc_sync_enter(v7);
  sortedDocuments = v7->_sortedDocuments;
  v7->_sortedDocuments = 0;

  objc_sync_exit(v7);
  linearDocuments = v7->_linearDocuments;
  v7->_linearDocuments = 0;

  v7->_readingDocumentCount = 0;
  v7->_linearDocumentCount = 0;
  linearOrdinalMap = v7->_linearOrdinalMap;
  v7->_linearOrdinalMap = 0;

  shouldDisableOptimizeSpeed = v7->_shouldDisableOptimizeSpeed;
  v7->_shouldDisableOptimizeSpeed = 0;

  v7->_mediaOverlayElementCountValid = 0;
  v7->_mediaOverlayElementCount = 0;
}

- (void)dealloc
{
  void *v3;
  AEAnnotationProvider *annotationProvider;
  objc_super v5;

  -[AEBookInfo _clearTransient](self, "_clearTransient");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  annotationProvider = self->_annotationProvider;
  self->_annotationProvider = 0;

  v5.receiver = self;
  v5.super_class = (Class)AEBookInfo;
  -[AEBookInfo dealloc](&v5, "dealloc");
}

- (id)baseURL
{
  NSURL *baseUrl;

  baseUrl = self->_baseUrl;
  if (!baseUrl)
  {
    -[AEBookInfo setupBaseURL](self, "setupBaseURL");
    baseUrl = self->_baseUrl;
  }
  return baseUrl;
}

- (id)_makeFileUrlIfPossible:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isFileURL") & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
    if (objc_msgSend(v6, "rangeOfString:options:", CFSTR(".jpg"), 1) != (id)0x7FFFFFFFFFFFFFFFLL
      || objc_msgSend(v6, "rangeOfString:options:", CFSTR(".png"), 1) != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo basePlusContentPath](self, "basePlusContentPath"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", v6));

      v9 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v8, 0));
      v5 = (void *)v9;
    }

  }
  return v5;
}

- (NSString)embeddedArtHref
{
  void *v3;
  unsigned __int8 v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo embeddedArtHrefRejected](self, "embeddedArtHrefRejected"));
  v4 = objc_msgSend(v3, "BOOLValue");

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[AEBookInfo willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("embeddedArtHref"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("embeddedArtHref")));
    -[AEBookInfo didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("embeddedArtHref"));
  }
  return (NSString *)v5;
}

- (id)embeddedArtURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo embeddedArtHref](self, "embeddedArtHref"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo bookBundlePath](self, "bookBundlePath"));
    v5 = v4;
    if (v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", v3));

      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v6, 0));
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)embeddedArtHrefMinusSubpath
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo embeddedArtHref](self, "embeddedArtHref"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo bookContentSubpath](self, "bookContentSubpath"));
    if (v4)
    {
      if (objc_msgSend(v3, "hasPrefix:", CFSTR("/")))
      {
        v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", 1));

        v3 = (void *)v5;
      }
      if (objc_msgSend(v4, "hasPrefix:", CFSTR("/")))
      {
        v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringFromIndex:", 1));

        v4 = (void *)v6;
      }
      if (!objc_msgSend(v3, "rangeOfString:", v4))
      {
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", v7));

        v3 = (void *)v8;
      }
    }

  }
  return v3;
}

+ (BOOL)isUndesirableImageData:(id)a3
{
  const __CFData *v3;
  char IsLegacyGenericBookCoverImageSource;
  CGImageSource *v6;
  CGImageSource *v7;
  const __CFDictionary *v8;
  const __CFDictionary *v9;
  const void *Value;
  void *v11;
  const void *v12;
  void *v13;

  v3 = (const __CFData *)a3;
  if (-[__CFData hash](v3, "hash") != (id)153495661 && (unint64_t)-[__CFData length](v3, "length") <= 0x4000000)
  {
    v6 = CGImageSourceCreateWithData(v3, 0);
    if (!v6)
    {
      IsLegacyGenericBookCoverImageSource = 0;
      goto LABEL_4;
    }
    v7 = v6;
    v8 = CGImageSourceCopyPropertiesAtIndex(v6, 0, 0);
    if (v8)
    {
      v9 = v8;
      Value = CFDictionaryGetValue(v8, CFSTR("PixelWidth"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(Value);
      v12 = CFDictionaryGetValue(v9, CFSTR("PixelHeight"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      CFRelease(v9);
      if ((uint64_t)objc_msgSend(v11, "integerValue") > 0x4000 || (uint64_t)objc_msgSend(v13, "integerValue") > 0x4000)
      {

        IsLegacyGenericBookCoverImageSource = 1;
LABEL_13:
        CFRelease(v7);
        goto LABEL_4;
      }

    }
    IsLegacyGenericBookCoverImageSource = BKGenericBookCoverIsLegacyGenericBookCoverImageSource(v7);
    goto LABEL_13;
  }
  IsLegacyGenericBookCoverImageSource = 1;
LABEL_4:

  return IsLegacyGenericBookCoverImageSource;
}

- (id)embeddedArtSinf
{
  void *v3;
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo sinfInfo](self, "sinfInfo"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo embeddedArtHrefMinusSubpath](self, "embeddedArtHrefMinusSubpath"));
    if (objc_msgSend(v5, "length"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo documentAtPath:](self, "documentAtPath:", v5));
      v7 = v6;
      if (v6)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sinfNumber"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("sinfNumber ==[n] %@"), v8));

        v10 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo sinfInfo](self, "sinfInfo"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "filteredSetUsingPredicate:", v9));

        if (objc_msgSend(v11, "count") == (char *)&dword_0 + 1)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "anyObject"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sinfBlob"));

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (id)confirmBagContents
{
  AEBookInfo *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *i;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  unsigned int v20;
  id v21;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  _BOOL8 v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id obj;
  AEBookInfo *v41;
  uint64_t v42;
  id v43;
  void *v44;
  id v45;
  char v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;
  void *v56;
  _BYTE v57[128];
  _BYTE v58[128];

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo sinfInfo](self, "sinfInfo"));
  v4 = objc_msgSend(v3, "count");

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo embeddedArtURL](v2, "embeddedArtURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo embeddedArtSinf](v2, "embeddedArtSinf"));
  if (!v6 || (objc_msgSend(v5, "isFileURL") & 1) == 0)
  {
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[AEBookInfo sortedDocuments](v2, "sortedDocuments"));
    v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    if (v43)
    {
      v38 = v5;
      v39 = v6;
      v41 = v2;
      v42 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v43; i = (char *)i + 1)
        {
          if (*(_QWORD *)v52 != v42)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sinfNumber"));
          v10 = objc_msgSend(v9, "intValue");

          if (v10 >= 1)
          {
            v44 = i;
            v49 = 0u;
            v50 = 0u;
            v47 = 0u;
            v48 = 0u;
            v11 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo sinfInfo](v2, "sinfInfo"));
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
            if (v12)
            {
              v13 = v12;
              v14 = *(_QWORD *)v48;
LABEL_12:
              v15 = 0;
              while (1)
              {
                if (*(_QWORD *)v48 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v15);
                v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "sinfNumber"));
                v18 = objc_msgSend(v17, "intValue");
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sinfNumber"));
                v20 = objc_msgSend(v19, "intValue");

                if (v18 == v20)
                  break;
                if (v13 == (id)++v15)
                {
                  v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
                  if (v13)
                    goto LABEL_12;
                  goto LABEL_18;
                }
              }
              v21 = v16;

              if (!v8)
                goto LABEL_22;
              v2 = v41;
              i = v44;
              if (v21)
              {
                v23 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo basePlusContentPath](v41, "basePlusContentPath"));
                v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "href"));
                v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stringByAppendingPathComponent:", v24));

                v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v25, 0));
                v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "sinfBlob"));

                v6 = (void *)v26;
                goto LABEL_28;
              }
            }
            else
            {
LABEL_18:

              v21 = 0;
LABEL_22:
              v2 = v41;
              i = v44;
            }

          }
        }
        v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
      }
      while (v43);
      v5 = v38;
      v6 = v39;
    }
LABEL_28:

  }
  if (objc_msgSend(v5, "isFileURL"))
  {
    v46 = 0;
    v27 = objc_autoreleasePoolPush();
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
    v45 = 0;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[ft9cupR7u6OrU4m1pyhB pK0gFZ9QOdm17E9p9cpP:sinfData:refetch:error:](ft9cupR7u6OrU4m1pyhB, "pK0gFZ9QOdm17E9p9cpP:sinfData:refetch:error:", v28, v6, &v46, &v45));
    v30 = v45;

    if (!v29 && v46)
    {
      v31 = v5;
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "domain"));
      if (objc_msgSend(v32, "isEqualToString:", fd45c988dd8cc08fce2e58d17f4ed2))
        v33 = objc_msgSend(v30, "code") == (id)-996;
      else
        v33 = 0;

      v34 = AssetEngineErrorDomain;
      v55 = AssetEngineErrorIsFamilyRemovalKey;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v33));
      v56 = v35;
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1));
      v37 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v34, 2002, v36));

      v30 = (id)v37;
      v5 = v31;
    }

    objc_autoreleasePoolPop(v27);
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (id)urlForHref:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringWithPercentEscape"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo baseURL](self, "baseURL"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", v6, v7));

  }
  else
  {
    v6 = 0;
    v8 = 0;
  }

  return v8;
}

- (NSString)shortBookTitle
{
  void *v2;
  id v3;
  id v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo bookTitle](self, "bookTitle"));
  v3 = objc_msgSend(v2, "rangeOfString:", CFSTR(": "));
  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL
    && (v3 = objc_msgSend(v2, "rangeOfString:", CFSTR("; ")), v3 == (id)0x7FFFFFFFFFFFFFFFLL)
    && (v3 = objc_msgSend(v2, "rangeOfString:", CFSTR(" / ")), v3 == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    v4 = v2;
  }
  else
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "substringToIndex:", v3));
  }
  v5 = v4;

  return (NSString *)v5;
}

- (int)contentType
{
  void *v3;
  int v4;

  -[AEBookInfo willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("contentType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("contentType")));
  v4 = objc_msgSend(v3, "intValue");

  -[AEBookInfo didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("contentType"));
  return v4;
}

- (void)setContentType:(int)a3
{
  uint64_t v3;
  id v5;

  v3 = *(_QWORD *)&a3;
  if (-[AEBookInfo contentType](self, "contentType") != a3)
  {
    v5 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInt:", v3);
    -[AEBookInfo willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("contentType"));
    -[AEBookInfo setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("contentType"));
    -[AEBookInfo didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("contentType"));

  }
}

+ (int)bookFormatByFilePath:(id)a3
{
  return BookFormatByFilePath(a3, a2);
}

- (NSNumber)storeFrontId
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v12;

  -[AEBookInfo willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("storeFrontId"));
  v3 = (id)objc_claimAutoreleasedReturnValue(-[AEBookInfo primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("storeFrontId")));
  -[AEBookInfo didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("storeFrontId"));
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo bookBundlePath](self, "bookBundlePath"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("iTunesMetadata.plist")));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v5));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("s")));
      objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
      {
        v9 = objc_msgSend(objc_alloc((Class)NSScanner), "initWithString:", v7);
        v12 = 0;
        v3 = 0;
        if (objc_msgSend(v9, "scanLongLong:", &v12))
          v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v12));

        goto LABEL_9;
      }
      objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v7, v10) & 1) != 0)
      {
        v3 = v7;
LABEL_9:

        if (v3)
          -[AEBookInfo setStoreFrontId:](self, "setStoreFrontId:", v3);
        goto LABEL_13;
      }

    }
    v3 = 0;
LABEL_13:

  }
  return (NSNumber *)v3;
}

- (void)deleteSelfMaintainedRelationships
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[AEBookInfo managedObjectContext](self, "managedObjectContext"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo databaseKey](self, "databaseKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("bookDatabaseKey ==[n] %@"), v3));

  objc_msgSend(v5, "batchDeleteEntity:matching:prefetchRelationships:", CFSTR("BKMediaOverlayElement"), v4, 0);
  objc_msgSend(v5, "batchDeleteEntity:matching:prefetchRelationships:", CFSTR("BKDocument"), v4, 0);
  objc_msgSend(v5, "batchDeleteEntity:matching:prefetchRelationships:", CFSTR("BKDocumentPageCount"), v4, 0);
  objc_msgSend(v5, "batchDeleteEntity:matching:prefetchRelationships:", CFSTR("BKChapterPageCount"), v4, 0);

}

- (void)deleteParsedRelationships
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  AEBookInfo *v13;
  NSArray *sortedDocuments;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];

  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo managedObjectContext](self, "managedObjectContext"));
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo chapters](self, "chapters"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v52;
    do
    {
      v10 = 0;
      v11 = v8;
      do
      {
        if (*(_QWORD *)v52 != v9)
          objc_enumerationMutation(v5);
        v8 = *(id *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)v10);

        objc_msgSend(v4, "deleteObject:", v8);
        v10 = (char *)v10 + 1;
        v11 = v8;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    }
    while (v7);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo chapters](self, "chapters"));
  -[AEBookInfo removeChapters:](self, "removeChapters:", v12);

  v13 = self;
  objc_sync_enter(v13);
  sortedDocuments = v13->_sortedDocuments;
  v13->_sortedDocuments = 0;

  objc_sync_exit(v13);
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo landmarks](v13, "landmarks"));
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = *(_QWORD *)v48;
    do
    {
      v20 = 0;
      v21 = v18;
      do
      {
        if (*(_QWORD *)v48 != v19)
          objc_enumerationMutation(v15);
        v18 = *(id *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)v20);

        objc_msgSend(v4, "deleteObject:", v18);
        v20 = (char *)v20 + 1;
        v21 = v18;
      }
      while (v17 != v20);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
    }
    while (v17);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo landmarks](v13, "landmarks"));
  -[AEBookInfo removeLandmarks:](v13, "removeLandmarks:", v22);

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo physicalPages](v13, "physicalPages"));
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
  if (v24)
  {
    v25 = v24;
    v26 = 0;
    v27 = *(_QWORD *)v44;
    do
    {
      v28 = 0;
      v29 = v26;
      do
      {
        if (*(_QWORD *)v44 != v27)
          objc_enumerationMutation(v23);
        v26 = *(id *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v28);

        objc_msgSend(v4, "deleteObject:", v26);
        v28 = (char *)v28 + 1;
        v29 = v26;
      }
      while (v25 != v28);
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
    }
    while (v25);

  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo physicalPages](v13, "physicalPages"));
  -[AEBookInfo removePhysicalPages:](v13, "removePhysicalPages:", v30);

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo sinfInfo](v13, "sinfInfo", 0));
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
  if (v32)
  {
    v33 = v32;
    v34 = 0;
    v35 = *(_QWORD *)v40;
    do
    {
      v36 = 0;
      v37 = v34;
      do
      {
        if (*(_QWORD *)v40 != v35)
          objc_enumerationMutation(v31);
        v34 = *(id *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v36);

        objc_msgSend(v4, "deleteObject:", v34);
        v36 = (char *)v36 + 1;
        v37 = v34;
      }
      while (v33 != v36);
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
    }
    while (v33);

  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo sinfInfo](v13, "sinfInfo"));
  -[AEBookInfo removeSinfInfo:](v13, "removeSinfInfo:", v38);

  -[AEBookInfo setParserVersion:](v13, "setParserVersion:", 0);
  -[AEBookInfo setParserOPFPath:](v13, "setParserOPFPath:", 0);
  -[AEBookInfo setParserNCXPath:](v13, "setParserNCXPath:", 0);
  -[AEBookInfo setEmbeddedArtHref:](v13, "setEmbeddedArtHref:", 0);
  -[AEBookInfo setEmbeddedArtHrefRejected:](v13, "setEmbeddedArtHrefRejected:", 0);
  -[AEBookInfo setHasComputedFixedLayoutSize:](v13, "setHasComputedFixedLayoutSize:", 0);

  objc_autoreleasePoolPop(v3);
}

- (void)resetPersistentCache
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo persistentCachePath](self, "persistentCachePath"));
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[IMPersistentCacheManager sharedInstance](IMPersistentCacheManager, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo persistentCachePath](self, "persistentCachePath"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cacheForPath:maxSize:", v6, 0));

    objc_msgSend(v7, "clear");
  }
}

- (void)resetAsNewlyDownloaded
{
  -[AEBookInfo _clearTransient](self, "_clearTransient");
  -[AEBookInfo deleteSelfMaintainedRelationships](self, "deleteSelfMaintainedRelationships");
  -[AEBookInfo deleteParsedRelationships](self, "deleteParsedRelationships");
  -[AEBookInfo resetPersistentCache](self, "resetPersistentCache");
  -[AEBookInfo setFixedLayout:](self, "setFixedLayout:", 0);
  -[AEBookInfo setInteractive:](self, "setInteractive:", 0);
}

- (BOOL)wasParsed
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo parserVersion](self, "parserVersion"));
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (BOOL)isReadyToOpen
{
  void *v3;
  unsigned __int8 v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo isDownloading](self, "isDownloading"));
  v4 = objc_msgSend(v3, "BOOLValue");

  if ((v4 & 1) != 0)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo bookBundlePath](self, "bookBundlePath"));

  if (!v5)
    return 0;
  else
    return -[AEBookInfo isEncryptionLegal](self, "isEncryptionLegal");
}

- (BOOL)isBookVersioned
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo versionNumberHumanReadable](self, "versionNumberHumanReadable"));
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (id)versionNumberHumanReadable
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AEAssetEngine libraryMgr](AEAssetEngine, "libraryMgr"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo url](self, "url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metadataForAssetAtURL:needsCoordination:", v4, 1));

  if (v5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist humanReadablePublicationVersionFromPlistEntry:](IMLibraryPlist, "humanReadablePublicationVersionFromPlistEntry:", v5));
  else
    v6 = 0;

  return v6;
}

- (BOOL)isProtected
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo sinfInfo](self, "sinfInfo"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)isStoreBook
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo storeId](self, "storeId"));
  v3 = objc_msgSend(v2, "longLongValue") != 0;

  return v3;
}

- (BOOL)isManagedBook
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo url](self, "url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[IMLibraryPlist isManagedBookFromURL:](IMLibraryPlist, "isManagedBookFromURL:", v2));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)shouldAllowRemoteInspection
{
  return !-[AEBookInfo isProtected](self, "isProtected");
}

- (void)calculatePasswordRequired
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (-[AEBookInfo contentType](self, "contentType") == 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo isPasswordRequired](self, "isPasswordRequired"));

    if (!v3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[AEPdfCache sharedInstance](AEPdfCache, "sharedInstance"));
      v8 = objc_msgSend(v4, "copyCacheObjectForBook:", self);

      v5 = v8;
      if (v8)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "document"));
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v6, "isLocked")));
        -[AEBookInfo setIsPasswordRequired:](self, "setIsPasswordRequired:", v7);

        v5 = v8;
      }

    }
  }
}

- (BOOL)isPasswordDialogNeeded
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;
  void *v7;
  unsigned __int8 v8;

  if (-[AEBookInfo contentType](self, "contentType") != 2)
    return 0;
  -[AEBookInfo calculatePasswordRequired](self, "calculatePasswordRequired");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo isPasswordRequired](self, "isPasswordRequired"));
  v4 = objc_msgSend(v3, "BOOLValue");

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AEPdfCache sharedInstance](AEPdfCache, "sharedInstance"));
  v6 = objc_msgSend(v5, "copyCacheObjectForBook:", self);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "document"));
    v8 = objc_msgSend(v7, "isLocked");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isCorrectPassword:(id)a3 forDocument:(id)a4
{
  id v6;
  id v7;
  id v8;
  unsigned __int8 v9;

  v6 = a3;
  v7 = a4;
  if (-[AEBookInfo contentType](self, "contentType") == 2)
  {
    v8 = objc_msgSend(v6, "length");
    v9 = 0;
    if (v7 && v8)
      v9 = objc_msgSend(v7, "unlockWithPassword:", v6);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setPassword:(id)a3
{
  NSString *v4;
  NSString *password;
  id v6;

  if (self->_password != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    password = self->_password;
    self->_password = v4;

    v6 = (id)objc_claimAutoreleasedReturnValue(+[AEPdfCache sharedInstance](AEPdfCache, "sharedInstance"));
  }
}

- (BOOL)isEncryptionLegal
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  if (!-[AEBookInfo isProtected](self, "isProtected"))
    return 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo sinfInfo](self, "sinfInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "anyObject"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sinfNumber"));
  v6 = (int)objc_msgSend(v5, "intValue") > 0;

  return v6;
}

- (BOOL)currentlyDownloading
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo isDownloading](self, "isDownloading"));
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setCurrentlyDownloading:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unsigned int v6;
  id v7;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo isDownloading](self, "isDownloading"));
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6 != v3)
  {
    v7 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithBool:", v3);
    -[AEBookInfo setIsDownloading:](self, "setIsDownloading:", v7);

  }
}

- (void)didTurnIntoFault
{
  objc_super v3;

  -[AEBookInfo _clearTransient](self, "_clearTransient");
  v3.receiver = self;
  v3.super_class = (Class)AEBookInfo;
  -[AEBookInfo didTurnIntoFault](&v3, "didTurnIntoFault");
}

- (void)didSave
{
  objc_super v3;

  -[AEBookInfo _clearTransient](self, "_clearTransient");
  -[AEBookInfo saveAnnotationsManagedObjectContext](self, "saveAnnotationsManagedObjectContext");
  v3.receiver = self;
  v3.super_class = (Class)AEBookInfo;
  -[AEBookInfo didSave](&v3, "didSave");
}

+ (id)databaseKeyFromStoreId:(id)a3 andUniqueId:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0 && (v8 = objc_msgSend(v5, "length"), v9 = v5, (unint64_t)v8 > 1)
    || (objc_opt_class(NSString), (objc_opt_isKindOfClass(v6, v10) & 1) != 0)
    && (v11 = objc_msgSend(v6, "length"), v9 = v6, (unint64_t)v11 >= 2))
  {
    v12 = v9;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)mimeFromHref:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v17;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo databaseKey](self, "databaseKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("bookDatabaseKey == %@ AND href == %@"), v5, v4));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo managedObjectContext](self, "managedObjectContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", CFSTR("BKDocument"), v7));

    v9 = objc_alloc_init((Class)NSFetchRequest);
    objc_msgSend(v9, "setEntity:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("mime"), 0));
    objc_msgSend(v9, "setPropertiesToFetch:", v10);

    objc_msgSend(v9, "setResultType:", 2);
    objc_msgSend(v9, "setPredicate:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo managedObjectContext](self, "managedObjectContext"));
    v17 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "executeFetchRequest:error:", v9, &v17));
    v13 = v17;

    if (v13)
      objc_msgSend(v13, "logRecursively");
    if (objc_msgSend(v12, "count") == (char *)&dword_0 + 1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndex:", 0));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("mime")));

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)newestAnnotationWithPredicate:(id)a3 rangeCheck:(BOOL)a4 moc:(id)a5
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;

  v5 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "entity:withPredicate:sortBy:ascending:fetchLimit:", CFSTR("AEAnnotation"), a3, CFSTR("annotationCreationDate"), 0, 1));
  v8 = v7;
  if (v7 && objc_msgSend(v7, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndex:", 0));
    if (v9 && v5)
    {
      v10 = -[AEBookInfo readingDocumentCount](self, "readingDocumentCount");
      if (v10 < (unint64_t)objc_msgSend(v9, "ordinal"))
      {

        v9 = 0;
      }
      if (objc_msgSend(v9, "annotationType") == 3)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo documentWithOrdinal:](self, "documentWithOrdinal:", objc_msgSend(v9, "ordinal")));
        v12 = v11;
        if (v11)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nonlinearElement"));
          v14 = objc_msgSend(v13, "BOOLValue");

          if (v14)
          {

            v9 = 0;
          }
        }

      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)readingLocationAnnotation:(BOOL)a3 moc:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo assetID](self, "assetID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation predicateForGlobalAnnotationWithAssetID:](AEAnnotation, "predicateForGlobalAnnotationWithAssetID:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo newestAnnotationWithPredicate:rangeCheck:moc:](self, "newestAnnotationWithPredicate:rangeCheck:moc:", v8, v4, v6));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "annotationCreatorIdentifier"));

    if (!v10)
      objc_msgSend(v9, "setAnnotationCreatorIdentifier:", kAEAnnotationCreatorIdentifier_iBooks);
  }

  return v9;
}

- (BKLocation)firstDocumentLocation
{
  void *v3;
  int64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  BKLocation *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo firstDocumentHref](self, "firstDocumentHref"));
  v4 = -[AEBookInfo _documentOrdinalForHref:](self, "_documentOrdinalForHref:", v3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL
    && ((v5 = objc_msgSend(v3, "rangeOfString:", CFSTR("#")), v6 = 0x7FFFFFFFFFFFFFFFLL, v5 == (id)0x7FFFFFFFFFFFFFFFLL)
     || (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringToIndex:", v5)),
         v4 = -[AEBookInfo _documentOrdinalForHref:](self, "_documentOrdinalForHref:", v7),
         v7,
         v6 = 0x7FFFFFFFFFFFFFFFLL,
         v4 == 0x7FFFFFFFFFFFFFFFLL))
    || (v6 = v4, -[AEBookInfo linearIndexForOrdinal:](self, "linearIndexForOrdinal:", v4) == 0x7FFFFFFFFFFFFFFFLL))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo linearDocuments](self, "linearDocuments"));
    if (objc_msgSend(v8, "count"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0));
      v6 = (uint64_t)objc_msgSend(v9, "unboxedDocumentOrdinal");

    }
    v4 = v6;
  }
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    v10 = 0;
  else
    v10 = v4;
  v11 = -[BKLocation initWithOrdinal:]([BKLocation alloc], "initWithOrdinal:", v10);

  return v11;
}

- (int64_t)_documentOrdinalForHref:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int64_t v10;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo managedObjectContext](self, "managedObjectContext"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo databaseKey](self, "databaseKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("href ==[n] %@ AND bookDatabaseKey == %@"), v4, v6));

    v8 = objc_msgSend(v5, "copyEntityProperty:fromEntityName:withPredicate:", CFSTR("documentOrdinal"), CFSTR("BKDocument"), v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("documentOrdinal")));

    if (v9)
      v10 = (int64_t)objc_msgSend(v9, "integerValue");
    else
      v10 = 0x7FFFFFFFFFFFFFFFLL;

  }
  else
  {
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (void)_adjustAnnotation:(id)a3 withLocation:(id)a4 selectedText:(id)a5 representativeText:(id)a6 updateStyle:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;

  v7 = a7;
  v26 = a3;
  v12 = a4;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation optimizedSelectedTextForSerialization:](AEAnnotation, "optimizedSelectedTextForSerialization:", a5));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation optimizedRepresentativeTextForSerialization:selectedText:](AEAnnotation, "optimizedRepresentativeTextForSerialization:selectedText:", v13, v14));

  objc_msgSend(v26, "setOrdinal:", objc_msgSend(v12, "ordinal"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v26, "setAnnotationCreationDate:", v16);

  objc_msgSend(v26, "setAnnotationSelectedText:", v14);
  objc_msgSend(v26, "setAnnotationRepresentativeText:", v15);
  objc_msgSend(v26, "setLocation:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo assetID](self, "assetID"));
  objc_msgSend(v26, "setAnnotationAssetID:", v17);

  objc_msgSend(v26, "setSpineIndexUpdated:", 1);
  if (v7)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", BKDefaultHighlightColor[0]));
    objc_msgSend(v26, "setAnnotationStyle:", objc_msgSend(v19, "intValue"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v26, "setAnnotationIsUnderline:", objc_msgSend(v20, "BOOLForKey:", BKDefaultUnderlineState));

  }
  if (-[AEBookInfo isBookVersioned](self, "isBookVersioned"))
    -[AEBookInfo bumpReadingLocationAnnotationVersionToMinimumVersion:](self, "bumpReadingLocationAnnotationVersionToMinimumVersion:", kAEAnnotationVersion_4);
  if (-[AEBookInfo hasDuplicatedDocument](self, "hasDuplicatedDocument"))
  {
    v21 = objc_msgSend(v12, "ordinal");
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo sortedDocuments](self, "sortedDocuments"));
    if (v21)
    {
      v23 = 0;
      while (1)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", v23));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "isDuplicateSpineEntry"));

        if (v25)
          break;

        if (v21 == (id)++v23)
          goto LABEL_12;
      }
      objc_msgSend(v26, "bumpAnnotationVersionToMinimumVersion:", kAEAnnotationVersion_5);

    }
LABEL_12:

  }
}

+ (id)defaultAnnotationCreatorIdentifier
{
  return kAEAnnotationCreatorIdentifier_iBooks;
}

- (void)setSingletonAnnotationType:(int)a3 location:(id)a4 modificationHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  int v14;

  v8 = a4;
  v9 = a5;
  if (((unint64_t)objc_msgSend(v8, "ordinal") & 0x8000000000000000) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo annotationProvider](self, "annotationProvider"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_C48E8;
    v11[3] = &unk_1C11E8;
    v14 = a3;
    v11[4] = self;
    v12 = v8;
    v13 = v9;
    objc_msgSend(v10, "performBlockOnUserSideQueueAndWait:", v11);

  }
}

- (void)setReadingLocation:(id)a3
{
  -[AEBookInfo setSingletonAnnotationType:location:modificationHandler:](self, "setSingletonAnnotationType:location:modificationHandler:", 3, a3, 0);
}

- (BKLocation)readingLocation
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_C4B04;
  v11 = sub_C4B14;
  v12 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo annotationProvider](self, "annotationProvider"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_C4B1C;
  v6[3] = &unk_1C1210;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "performBlockOnUserSideQueueAndWait:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (BKLocation *)v4;
}

- (unint64_t)readingDocumentCount
{
  unint64_t result;
  void *v4;
  void *v5;
  void *v6;

  result = self->_readingDocumentCount;
  if (!result)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo managedObjectContext](self, "managedObjectContext"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo databaseKey](self, "databaseKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("bookDatabaseKey == %@ AND documentOrdinal >= 0"), v5));

    self->_readingDocumentCount = (unint64_t)objc_msgSend(v4, "countEntity:withPredicate:", CFSTR("BKDocument"), v6);
    return self->_readingDocumentCount;
  }
  return result;
}

- (id)sortedDocuments
{
  AEBookInfo *v2;
  NSArray *sortedDocuments;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *v9;
  id v10;

  v2 = self;
  objc_sync_enter(v2);
  sortedDocuments = v2->_sortedDocuments;
  if (!sortedDocuments)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo databaseKey](v2, "databaseKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("bookDatabaseKey == %@ AND documentOrdinal >= 0"), v4));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo managedObjectContext](v2, "managedObjectContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entity:withPredicate:sortBy:ascending:fetchLimit:", CFSTR("BKDocument"), v5, CFSTR("documentOrdinal"), 1, 0));

    v8 = (NSArray *)objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:", v7);
    v9 = v2->_sortedDocuments;
    v2->_sortedDocuments = v8;

    sortedDocuments = v2->_sortedDocuments;
  }
  v10 = -[NSArray copy](sortedDocuments, "copy");
  objc_sync_exit(v2);

  return v10;
}

- (BOOL)hasDuplicatedDocument
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  unsigned __int8 v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo sortedDocuments](self, "sortedDocuments", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "isDuplicateSpineEntry"));
        v7 = objc_msgSend(v6, "BOOLValue");

        if ((v7 & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (unint64_t)linearDocumentCount
{
  unint64_t result;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  result = self->_linearDocumentCount;
  if (!result)
  {
    *(_QWORD *)&v4 = objc_opt_class(self).n128_u64[0];
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo databaseKey](self, "databaseKey", v4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "linearDocumentPredicateForDatabaseKey:", v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo managedObjectContext](self, "managedObjectContext"));
    self->_linearDocumentCount = (int64_t)objc_msgSend(v9, "countEntity:withPredicate:", CFSTR("BKDocument"), v8);

    return self->_linearDocumentCount;
  }
  return result;
}

- (id)linearDocuments
{
  NSArray *linearDocuments;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *v12;
  NSArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  linearDocuments = self->_linearDocuments;
  if (!linearDocuments)
  {
    *(_QWORD *)&v4 = objc_opt_class(self).n128_u64[0];
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo databaseKey](self, "databaseKey", v4));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "linearDocumentPredicateForDatabaseKey:", v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo managedObjectContext](self, "managedObjectContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "entity:withPredicate:sortBy:ascending:fetchLimit:", CFSTR("BKDocument"), v8, CFSTR("documentOrdinal"), 1, 0));

    v11 = (NSArray *)objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:", v10);
    v12 = self->_linearDocuments;
    self->_linearDocuments = v11;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v13 = self->_linearDocuments;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      v17 = *(_QWORD *)v21;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v18), "setLinearDocumentIndex:", (char *)v18 + v16, (_QWORD)v20);
          v18 = (char *)v18 + 1;
        }
        while (v15 != v18);
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        v16 += (uint64_t)v18;
      }
      while (v15);
    }

    linearDocuments = self->_linearDocuments;
  }
  return linearDocuments;
}

- (id)allDocuments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo databaseKey](self, "databaseKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("bookDatabaseKey == %@"), v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo managedObjectContext](self, "managedObjectContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "entity:withPredicate:sortBy:ascending:fetchLimit:", CFSTR("BKDocument"), v4, CFSTR("documentOrdinal"), 1, 0));

  v7 = objc_msgSend(objc_alloc((Class)NSArray), "initWithArray:", v6);
  return v7;
}

- (int64_t)linearOrdinal:(int64_t)a3 offsetByDistance:(int64_t)a4
{
  unint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v6 = -[AEBookInfo linearIndexForOrdinal:](self, "linearIndexForOrdinal:", a3);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    return 0x7FFFFFFFFFFFFFFFLL;
  v7 = v6 + a4;
  if (v7 >= -[AEBookInfo linearDocumentCount](self, "linearDocumentCount"))
    return 0x7FFFFFFFFFFFFFFFLL;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo linearDocuments](self, "linearDocuments"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v7));
  v10 = objc_msgSend(v9, "unboxedDocumentOrdinal");

  return (int64_t)v10;
}

- (unint64_t)linearIndexForOrdinal:(unint64_t)a3
{
  NSDictionary *linearOrdinalMap;
  void *v6;
  NSDictionary *v7;
  NSDictionary *v8;
  NSDictionary *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  _QWORD v14[4];
  NSDictionary *v15;

  linearOrdinalMap = self->_linearOrdinalMap;
  if (!linearOrdinalMap)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo linearDocuments](self, "linearDocuments"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_C5344;
    v14[3] = &unk_1C1238;
    v7 = (NSDictionary *)(id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v6, "count")));
    v15 = v7;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v14);
    v8 = self->_linearOrdinalMap;
    self->_linearOrdinalMap = v7;
    v9 = v7;

    linearOrdinalMap = self->_linearOrdinalMap;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](linearOrdinalMap, "objectForKey:", v10));

  if (v11)
    v12 = (unint64_t)objc_msgSend(v11, "unsignedIntegerValue");
  else
    v12 = 0x7FFFFFFFFFFFFFFFLL;

  return v12;
}

- (CGSize)fixedLayoutSizeForDocumentWithOrdinal:(unint64_t)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo documentWithOrdinal:](self, "documentWithOrdinal:", a3));
  if (!v4)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo lastDocument](self, "lastDocument"));
  objc_msgSend(v4, "fixedLayoutSize");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)firstDocument
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo sortedDocuments](self, "sortedDocuments"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  return v3;
}

- (id)lastDocument
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo sortedDocuments](self, "sortedDocuments"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastObject"));

  return v3;
}

- (id)documentWithOrdinal:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo sortedDocuments](self, "sortedDocuments"));
  if ((unint64_t)objc_msgSend(v4, "count") <= a3)
    v5 = 0;
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", a3));

  return v5;
}

- (id)urlForDocument:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "href"));
  if (objc_msgSend(v4, "length"))
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringWithPercentEscape"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo baseURL](self, "baseURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", v5, v6));

    v4 = (void *)v5;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)documentsWithPath:(id)a3 sortBy:(id)a4 limit:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "length"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo databaseKey](self, "databaseKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("bookDatabaseKey == %@ AND href ==[n] %@"), v10, v8));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo managedObjectContext](self, "managedObjectContext"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "entity:withPredicate:sortBy:ascending:fetchLimit:", CFSTR("BKDocument"), v11, v9, 0, a5));

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  }

  return v13;
}

- (id)documentAtPath:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo documentsWithPath:sortBy:limit:](self, "documentsWithPath:sortBy:limit:", a3, CFSTR("documentOrdinal"), 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));

  return v4;
}

- (id)documentContainingLocation:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(-[AEBookInfo documentWithOrdinal:](self, "documentWithOrdinal:", objc_msgSend(a3, "ordinal")));
  else
    return 0;
}

- (void)checkAnnotationsForDuplicatedDocuments
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  BOOL v11;
  int v12;
  void *v13;
  char *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v26[5];
  id v27;
  _QWORD v28[8];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  char *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[5];
  id v44;
  _QWORD *v45;
  uint64_t *v46;
  _QWORD v47[5];
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  _BYTE v55[128];

  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = sub_C4B04;
  v53 = sub_C4B14;
  v54 = 0;
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = sub_C4B04;
  v47[4] = sub_C4B14;
  v48 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo annotationProvider](self, "annotationProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "uiManagedObjectContext"));

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_C5B5C;
  v43[3] = &unk_1C1260;
  v45 = v47;
  v43[4] = self;
  v44 = v3;
  v46 = &v49;
  v24 = v44;
  objc_msgSend(v44, "performBlockAndWait:", v43);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo sortedDocuments](self, "sortedDocuments"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
  if (v5)
  {
    v6 = 0;
    v7 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v40 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "isDeleted") & 1) == 0)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "isDuplicateSpineEntry"));
          if (v10)
            v11 = 1;
          else
            v11 = v6 <= 0;
          v12 = !v11;

          if (v12)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "documentOrdinal"));
            v14 = (char *)objc_msgSend(v13, "integerValue");

            v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", &v14[-v6]));
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo assetID](self, "assetID"));
            v33[0] = _NSConcreteStackBlock;
            v33[1] = 3221225472;
            v33[2] = sub_C5BC4;
            v33[3] = &unk_1C1288;
            v17 = v15;
            v34 = v17;
            v18 = v16;
            v35 = v18;
            v19 = v24;
            v36 = v19;
            v37 = v6;
            v38 = v14;
            objc_msgSend(v19, "performBlockAndWait:", v33);
            v20 = (void *)v50[5];
            if (v20)
            {
              v21 = objc_msgSend(v20, "ordinal");
              if (v21 == objc_msgSend(v17, "integerValue"))
              {
                v29 = 0;
                v30 = &v29;
                v31 = 0x2020000000;
                v32 = 0;
                v28[0] = _NSConcreteStackBlock;
                v28[1] = 3221225472;
                v28[2] = sub_C5DE0;
                v28[3] = &unk_1C12B0;
                v28[4] = v47;
                v28[5] = &v49;
                v28[6] = &v29;
                v28[7] = v6;
                objc_msgSend(v19, "performBlockAndWait:", v28);
                if (*((_BYTE *)v30 + 24))
                {
                  -[AEBookInfo setReadingLocation:](self, "setReadingLocation:", v50[5]);
                  v22 = (void *)v50[5];
                  v50[5] = 0;

                }
                _Block_object_dispose(&v29, 8);
              }
            }

          }
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "isDuplicateSpineEntry"));

          if (v23)
            ++v6;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
    }
    while (v5);

    if (v6 >= 1)
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_C5E58;
      v26[3] = &unk_1BFDB8;
      v26[4] = self;
      v27 = v24;
      objc_msgSend(v27, "performBlockAndWait:", v26);

    }
  }
  else
  {

  }
  _Block_object_dispose(v47, 8);

  _Block_object_dispose(&v49, 8);
}

- (id)annotationsOnMainQueue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo assetID](self, "assetID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation annotationsPredicate:](AEAnnotation, "annotationsPredicate:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo annotationProvider](self, "annotationProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uiManagedObjectContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "entity:withPredicate:sortBy:ascending:fetchLimit:", CFSTR("AEAnnotation"), v5, CFSTR("annotationCreationDate"), 1, 0));

  objc_autoreleasePoolPop(v3);
  return v8;
}

+ (id)_nonUpdatedAnnotationsForDocumentOrdinal:(id)a3 assetID:(id)a4 moc:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[2];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v10 = objc_autoreleasePoolPush();
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation predicateForAnnotationsWithAssetID:ordinal:](AEAnnotation, "predicateForAnnotationsWithAssetID:ordinal:", v8, objc_msgSend(v7, "intValue")));
    v19[0] = v11;
    v12 = kAEAnnotationSpineIndexUpdated;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == NO OR %K == %@"), v12, v12, v13));
    v19[1] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 2));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v15));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "entity:withPredicate:sortBy:ascending:fetchLimit:", CFSTR("AEAnnotation"), v16, CFSTR("annotationCreationDate"), 1, 0));
    objc_autoreleasePoolPop(v10);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)deleteAnnotation:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  void *v26;

  v4 = a3;
  v5 = BKMobileCloudSyncAnnotationsLog(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotationAssetID"));
    v8 = objc_msgSend(v4, "annotationType");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotationUuid"));
    v21 = 138412802;
    v22 = v7;
    v23 = 1024;
    v24 = v8;
    v25 = 2112;
    v26 = v9;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "deleteAnnotation: assetID: %@, type: %d, uuid: %@", (uint8_t *)&v21, 0x1Cu);

  }
  v11 = BKMobileCloudSyncAnnotationsLog(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    sub_11D22C((uint64_t)v4, v12, v13, v14, v15, v16, v17, v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo annotationProvider](self, "annotationProvider"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
  objc_msgSend(v19, "deleteAnnotation:", v4);
  objc_msgSend(v19, "saveManagedObjectContext:", v20);

}

- (void)expandAnnotation:(id)a3 location:(id)a4 selectedText:(id)a5 representativeText:(id)a6
{
  if (a4)
    -[AEBookInfo _adjustAnnotation:withLocation:selectedText:representativeText:updateStyle:](self, "_adjustAnnotation:withLocation:selectedText:representativeText:updateStyle:", a3, a4, a5, a6, 0);
}

- (id)addAnnotation:(int)a3 location:(id)a4 selectedText:(id)a5 representativeText:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v33;
  void *v34;
  __int16 v35;
  unsigned int v36;
  __int16 v37;
  void *v38;

  v8 = *(_QWORD *)&a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!v10 || ((unint64_t)objc_msgSend(v10, "ordinal") & 0x8000000000000000) != 0)
  {
    v17 = 0;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[AEBookInfo defaultAnnotationCreatorIdentifier](AEBookInfo, "defaultAnnotationCreatorIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo assetID](self, "assetID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo annotationProvider](self, "annotationProvider"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uiManagedObjectContext"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation insertAnnotationWithAssetID:creatorIdentifier:annotationUuid:intoManagedObjectContext:](AEAnnotation, "insertAnnotationWithAssetID:creatorIdentifier:annotationUuid:intoManagedObjectContext:", v14, v13, 0, v16));

    objc_msgSend(v17, "setAnnotationType:", v8);
    v18 = BKMobileCloudSyncAnnotationsLog(-[AEBookInfo _adjustAnnotation:withLocation:selectedText:representativeText:updateStyle:](self, "_adjustAnnotation:withLocation:selectedText:representativeText:updateStyle:", v17, v10, v11, v12, 1));
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "annotationAssetID"));
      v21 = objc_msgSend(v17, "annotationType");
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "annotationUuid"));
      v33 = 138412802;
      v34 = v20;
      v35 = 1024;
      v36 = v21;
      v37 = 2112;
      v38 = v22;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "addAnnotation: assetID: %@, type: %d, uuid: %@", (uint8_t *)&v33, 0x1Cu);

    }
    v24 = BKMobileCloudSyncAnnotationsLog(v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      sub_11D294((uint64_t)v17, v25, v26, v27, v28, v29, v30, v31);

  }
  return v17;
}

- (BOOL)bumpReadingLocationAnnotationVersionToMinimumVersion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo annotationProvider](self, "annotationProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uiManagedObjectContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo readingLocationAnnotation:moc:](self, "readingLocationAnnotation:moc:", 0, v6));

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "annotationVersion"));
  v9 = v8;
  if (v8 && (v8 == v4 || objc_msgSend(v8, "compare:options:", v4, 64) != (id)-1))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v7, "setAnnotationVersion:", v4);
    v10 = 1;
  }

  return v10;
}

- (void)addChapters:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[AEBookInfo willChangeValueForKey:withSetMutation:usingObjects:](self, "willChangeValueForKey:withSetMutation:usingObjects:", CFSTR("chapters"), 1, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("chapters")));
  objc_msgSend(v4, "unionSet:", v5);

  -[AEBookInfo didChangeValueForKey:withSetMutation:usingObjects:](self, "didChangeValueForKey:withSetMutation:usingObjects:", CFSTR("chapters"), 1, v5);
}

- (void)addChaptersObject:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v4, 0);
  -[AEBookInfo willChangeValueForKey:withSetMutation:usingObjects:](self, "willChangeValueForKey:withSetMutation:usingObjects:", CFSTR("chapters"), 1, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("chapters")));
  objc_msgSend(v5, "addObject:", v4);

  -[AEBookInfo didChangeValueForKey:withSetMutation:usingObjects:](self, "didChangeValueForKey:withSetMutation:usingObjects:", CFSTR("chapters"), 1, v6);
}

- (void)removeChapters:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[AEBookInfo willChangeValueForKey:withSetMutation:usingObjects:](self, "willChangeValueForKey:withSetMutation:usingObjects:", CFSTR("chapters"), 2, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("chapters")));
  objc_msgSend(v4, "minusSet:", v5);

  -[AEBookInfo didChangeValueForKey:withSetMutation:usingObjects:](self, "didChangeValueForKey:withSetMutation:usingObjects:", CFSTR("chapters"), 2, v5);
}

- (void)addLandmarks:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[AEBookInfo willChangeValueForKey:withSetMutation:usingObjects:](self, "willChangeValueForKey:withSetMutation:usingObjects:", CFSTR("landmarks"), 1, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("landmarks")));
  objc_msgSend(v4, "unionSet:", v5);

  -[AEBookInfo didChangeValueForKey:withSetMutation:usingObjects:](self, "didChangeValueForKey:withSetMutation:usingObjects:", CFSTR("landmarks"), 1, v5);
}

- (void)addLandmarksObject:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v4, 0);
  -[AEBookInfo willChangeValueForKey:withSetMutation:usingObjects:](self, "willChangeValueForKey:withSetMutation:usingObjects:", CFSTR("landmarks"), 1, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("landmarks")));
  objc_msgSend(v5, "addObject:", v4);

  -[AEBookInfo didChangeValueForKey:withSetMutation:usingObjects:](self, "didChangeValueForKey:withSetMutation:usingObjects:", CFSTR("landmarks"), 1, v6);
}

- (void)removeLandmarks:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[AEBookInfo willChangeValueForKey:withSetMutation:usingObjects:](self, "willChangeValueForKey:withSetMutation:usingObjects:", CFSTR("landmarks"), 2, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("landmarks")));
  objc_msgSend(v4, "minusSet:", v5);

  -[AEBookInfo didChangeValueForKey:withSetMutation:usingObjects:](self, "didChangeValueForKey:withSetMutation:usingObjects:", CFSTR("landmarks"), 2, v5);
}

- (void)addPhysicalPages:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[AEBookInfo willChangeValueForKey:withSetMutation:usingObjects:](self, "willChangeValueForKey:withSetMutation:usingObjects:", CFSTR("physicalPages"), 1, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("physicalPages")));
  objc_msgSend(v4, "unionSet:", v5);

  -[AEBookInfo didChangeValueForKey:withSetMutation:usingObjects:](self, "didChangeValueForKey:withSetMutation:usingObjects:", CFSTR("physicalPages"), 1, v5);
}

- (void)addPhysicalPagesObject:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v4, 0);
  -[AEBookInfo willChangeValueForKey:withSetMutation:usingObjects:](self, "willChangeValueForKey:withSetMutation:usingObjects:", CFSTR("physicalPages"), 1, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("physicalPages")));
  objc_msgSend(v5, "addObject:", v4);

  -[AEBookInfo didChangeValueForKey:withSetMutation:usingObjects:](self, "didChangeValueForKey:withSetMutation:usingObjects:", CFSTR("physicalPages"), 1, v6);
}

- (void)removePhysicalPages:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[AEBookInfo willChangeValueForKey:withSetMutation:usingObjects:](self, "willChangeValueForKey:withSetMutation:usingObjects:", CFSTR("physicalPages"), 2, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("physicalPages")));
  objc_msgSend(v4, "minusSet:", v5);

  -[AEBookInfo didChangeValueForKey:withSetMutation:usingObjects:](self, "didChangeValueForKey:withSetMutation:usingObjects:", CFSTR("physicalPages"), 2, v5);
}

- (BOOL)hasPhysicalPages
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo physicalPages](self, "physicalPages"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)physicalPageMap
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (-[AEBookInfo hasPhysicalPages](self, "hasPhysicalPages"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("bookInfo == %@"), self));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo managedObjectContext](self, "managedObjectContext"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("name"), CFSTR("href"), 0));
    v6 = objc_msgSend(v4, "copyEntityPropertiesArray:fromEntityName:withPredicate:sortBy:ascending:", v5, CFSTR("BKPhysicalPage"), v3, CFSTR("absoluteOrder"), 1);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)physicalPageMapForDocument:(id)a3
{
  id v4;
  unsigned int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = -[AEBookInfo hasPhysicalPages](self, "hasPhysicalPages");
  v6 = 0;
  if (v4 && v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "href"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("baseHref == %@ && bookInfo == %@"), v7, self));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo managedObjectContext](self, "managedObjectContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("name"), CFSTR("href"), 0));
    v6 = objc_msgSend(v9, "copyEntityPropertiesArray:fromEntityName:withPredicate:sortBy:ascending:", v10, CFSTR("BKPhysicalPage"), v8, CFSTR("absoluteOrder"), 1);

  }
  return v6;
}

- (id)navigationInfosForDocument:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "href"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("baseHref == %@ && bookInfo == %@"), v4, self));

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo managedObjectContext](self, "managedObjectContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("name"), CFSTR("href"), 0));
    v8 = objc_msgSend(v6, "copyEntityPropertiesArray:fromEntityName:withPredicate:sortBy:ascending:", v7, CFSTR("BKNavigationInfo"), v5, CFSTR("absoluteOrder"), 1);

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)addSinfInfoObject:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v4, 0);
  -[AEBookInfo willChangeValueForKey:withSetMutation:usingObjects:](self, "willChangeValueForKey:withSetMutation:usingObjects:", CFSTR("sinfInfo"), 1, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("sinfInfo")));
  objc_msgSend(v5, "addObject:", v4);

  -[AEBookInfo didChangeValueForKey:withSetMutation:usingObjects:](self, "didChangeValueForKey:withSetMutation:usingObjects:", CFSTR("sinfInfo"), 1, v6);
}

- (void)removeSinfInfo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[AEBookInfo willChangeValueForKey:withSetMutation:usingObjects:](self, "willChangeValueForKey:withSetMutation:usingObjects:", CFSTR("sinfInfo"), 2, v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("sinfInfo")));
  objc_msgSend(v4, "minusSet:", v5);

  -[AEBookInfo didChangeValueForKey:withSetMutation:usingObjects:](self, "didChangeValueForKey:withSetMutation:usingObjects:", CFSTR("sinfInfo"), 2, v5);
}

- (BOOL)suppressTOC
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo chapters](self, "chapters"));
  v3 = (unint64_t)objc_msgSend(v2, "count") < 2;

  return v3;
}

- (BOOL)needsReparsing
{
  void *v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo parseDate](self, "parseDate"));
  v4 = v3 == 0;

  if (!v3)
  {
    v5 = _ITEpubParsingLog();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo assetLogID](self, "assetLogID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo assetID](self, "assetID"));
      v22 = 138543618;
      v23 = v7;
      v24 = 2112;
      v25 = v8;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "\"We've never parsed %{public}@ - %@\", (uint8_t *)&v22, 0x16u);

    }
  }
  v9 = objc_claimAutoreleasedReturnValue(-[AEBookInfo updateDate](self, "updateDate"));
  if (v9)
  {
    v10 = (void *)v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo parseDate](self, "parseDate"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo updateDate](self, "updateDate"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo parseDate](self, "parseDate"));
      v14 = (char *)objc_msgSend(v12, "compare:", v13);

      if (v14 == (_BYTE *)&dword_0 + 1)
      {
        v15 = _ITEpubParsingLog();
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo updateDate](self, "updateDate"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo parseDate](self, "parseDate"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo assetLogID](self, "assetLogID"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo assetID](self, "assetID"));
          v22 = 138544130;
          v23 = v17;
          v24 = 2114;
          v25 = v18;
          v26 = 2114;
          v27 = v19;
          v28 = 2112;
          v29 = v20;
          _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "\"UpdateDate: %{public}@ parseDate: %{public}@ -- %{public}@ - %@\", (uint8_t *)&v22, 0x2Au);

        }
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return v4;
}

- (BOOL)wantsJumpBackHistory
{
  if (-[AEBookInfo contentType](self, "contentType"))
    return 0;
  else
    return !-[AEBookInfo isFixedLayout](self, "isFixedLayout");
}

- (void)_setBitMask:(unint64_t)a3 enabled:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  id v10;

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo appleDisplayOptions](self, "appleDisplayOptions"));
  v8 = (unint64_t)objc_msgSend(v7, "longLongValue");

  if (v4)
    v9 = v8 | a3;
  else
    v9 = v8 & ~a3;
  v10 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithLongLong:", v9);
  -[AEBookInfo setAppleDisplayOptions:](self, "setAppleDisplayOptions:", v10);

}

- (BOOL)isPageProgressionRTL
{
  return -[AEBookInfo bkPageProgressionDirection](self, "bkPageProgressionDirection") == 1;
}

- (int64_t)writingDirection
{
  void *v3;
  void *v4;
  NSWritingDirection v5;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo bookLanguage](self, "bookLanguage"));
  if (v3)
  {

LABEL_3:
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo bookLanguage](self, "bookLanguage"));
    v5 = +[NSParagraphStyle defaultWritingDirectionForLanguage:](NSParagraphStyle, "defaultWritingDirectionForLanguage:", v4);

    return v5;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo pageProgressionDirection](self, "pageProgressionDirection"));

  if (!v7)
    goto LABEL_3;
  return -[AEBookInfo isPageProgressionRTL](self, "isPageProgressionRTL");
}

- (BOOL)isScrollModeDisabled
{
  return 0;
}

- (int64_t)scrollModeOrientation
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  int64_t v7;

  v3 = objc_claimAutoreleasedReturnValue(-[AEBookInfo scrollDirection](self, "scrollDirection"));
  v4 = (void *)v3;
  if (v3)
    v5 = (__CFString *)v3;
  else
    v5 = CFSTR("default");
  v6 = v5;

  if (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("default")))
  {
    if (-[AEBookInfo languageDefaultsToHorizontalTextFlow](self, "languageDefaultsToHorizontalTextFlow")
      || !-[AEBookInfo isPageProgressionRTL](self, "isPageProgressionRTL"))
    {
      goto LABEL_7;
    }
LABEL_9:
    v7 = 0;
    goto LABEL_10;
  }
  if (-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("horizontal")))
    goto LABEL_9;
LABEL_7:
  v7 = 1;
LABEL_10:

  return v7;
}

- (BOOL)hasBuiltInFonts
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo appleDisplayOptions](self, "appleDisplayOptions"));
  v3 = ((unint64_t)objc_msgSend(v2, "longLongValue") >> 6) & 1;

  return v3;
}

- (void)setHasBuiltInFonts:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[AEBookInfo hasBuiltInFonts](self, "hasBuiltInFonts") != a3)
  {
    -[AEBookInfo _setBitMask:enabled:](self, "_setBitMask:enabled:", 64, v3);
    -[AEBookInfo setUseGlobalContentStyle:](self, "setUseGlobalContentStyle:", &__kCFBooleanFalse);
  }
}

- (BOOL)isFixedLayout
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo appleDisplayOptions](self, "appleDisplayOptions"));
  v3 = objc_msgSend(v2, "longLongValue") & 1;

  return v3;
}

- (void)setFixedLayout:(BOOL)a3
{
  -[AEBookInfo _setBitMask:enabled:](self, "_setBitMask:enabled:", 1, a3);
}

- (BOOL)isInteractive
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo appleDisplayOptions](self, "appleDisplayOptions"));
  v3 = ((unint64_t)objc_msgSend(v2, "longLongValue") >> 8) & 1;

  return v3;
}

- (void)setInteractive:(BOOL)a3
{
  -[AEBookInfo _setBitMask:enabled:](self, "_setBitMask:enabled:", 256, a3);
}

- (int)openToSpread
{
  void *v3;
  unsigned __int8 v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo appleDisplayOptions](self, "appleDisplayOptions"));
  v4 = objc_msgSend(v3, "longLongValue");

  if ((v4 & 0x20) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo appleDisplayOptions](self, "appleDisplayOptions"));
    v7 = (unint64_t)objc_msgSend(v6, "longLongValue");

    return (v7 >> 4) & 1;
  }
  else
  {
    LODWORD(v5) = -1;
  }
  return v5;
}

- (void)setOpenToSpread:(int)a3
{
  _BOOL8 v4;
  uint64_t v5;

  if (*(_QWORD *)&a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[AEBookInfo _setBitMask:enabled:](self, "_setBitMask:enabled:", 32, 0);
    v4 = 0;
  }
  else
  {
    v5 = *(_QWORD *)&a3;
    -[AEBookInfo _setBitMask:enabled:](self, "_setBitMask:enabled:", 32, 1);
    v4 = v5 == 1;
  }
  -[AEBookInfo _setBitMask:enabled:](self, "_setBitMask:enabled:", 16, v4);
}

- (BOOL)obeyPageBreaks
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo appleDisplayOptions](self, "appleDisplayOptions"));
  if ((objc_msgSend(v3, "longLongValue") & 2) != 0)
    LOBYTE(v4) = 1;
  else
    v4 = !-[AEBookInfo isStoreBook](self, "isStoreBook");

  return v4;
}

- (void)setObeyPageBreaks:(BOOL)a3
{
  -[AEBookInfo _setBitMask:enabled:](self, "_setBitMask:enabled:", 2, a3);
}

- (int)orientationLock
{
  unsigned int v3;
  unsigned int v4;
  int v5;

  v3 = -[AEBookInfo isPortraitProhibited](self, "isPortraitProhibited");
  v4 = v3 ^ -[AEBookInfo isLandscapeProhibited](self, "isLandscapeProhibited");
  if (v3)
    v5 = 2;
  else
    v5 = 1;
  if (v4)
    return v5;
  else
    return 0;
}

- (BOOL)isPortraitProhibited
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo appleDisplayOptions](self, "appleDisplayOptions"));
  v3 = ((unint64_t)objc_msgSend(v2, "longLongValue") >> 2) & 1;

  return v3;
}

- (void)setPortraitProhibited:(BOOL)a3
{
  -[AEBookInfo _setBitMask:enabled:](self, "_setBitMask:enabled:", 4, a3);
}

- (BOOL)isLandscapeProhibited
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo appleDisplayOptions](self, "appleDisplayOptions"));
  v3 = ((unint64_t)objc_msgSend(v2, "longLongValue") >> 3) & 1;

  return v3;
}

- (void)setLandscapeProhibited:(BOOL)a3
{
  -[AEBookInfo _setBitMask:enabled:](self, "_setBitMask:enabled:", 8, a3);
}

- (BOOL)hidesSpine
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo appleDisplayOptions](self, "appleDisplayOptions"));
  v3 = ((unint64_t)objc_msgSend(v2, "longLongValue") >> 7) & 1;

  return v3;
}

- (void)setHidesSpine:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[AEBookInfo hidesSpine](self, "hidesSpine") != a3)
    -[AEBookInfo _setBitMask:enabled:](self, "_setBitMask:enabled:", 128, v3);
}

- (BOOL)visibleSpine
{
  return 0;
}

- (id)assetType
{
  unsigned int v3;
  __CFString *v4;

  v3 = -[AEBookInfo contentType](self, "contentType");
  if (v3 == 3)
  {
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[AEBookInfo aeAssetType](self, "aeAssetType"));
  }
  else if (v3 == 2)
  {
    v4 = CFSTR("application/pdf");
  }
  else if (v3)
  {
    v4 = &stru_1C3088;
  }
  else if (-[AEBookInfo isFixedLayout](self, "isFixedLayout"))
  {
    v4 = CFSTR("application/ePubPictureBook");
  }
  else
  {
    v4 = CFSTR("application/ePub");
  }
  return v4;
}

- (id)url
{
  -[AEBookInfo _cacheURL](self, "_cacheURL");
  return self->_url;
}

- (void)_cacheURL
{
  void *v3;
  id v4;
  void *v5;
  NSURL *v6;
  NSURL *url;
  AEBookInfo *obj;

  if (!self->_url)
  {
    obj = self;
    objc_sync_enter(obj);
    if (!self->_url)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo bookBundlePath](obj, "bookBundlePath"));

      if (v3)
      {
        v4 = objc_alloc((Class)NSURL);
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo bookBundlePath](obj, "bookBundlePath"));
        v6 = (NSURL *)objc_msgSend(v4, "initFileURLWithPath:", v5);
        url = self->_url;
        self->_url = v6;

      }
    }
    objc_sync_exit(obj);

  }
}

- (void)setBookBundlePath:(id)a3
{
  id v4;
  NSURL *url;

  v4 = a3;
  -[AEBookInfo willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("bookBundlePath"));
  url = self->_url;
  self->_url = 0;

  -[AEBookInfo setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("bookBundlePath"));
  -[AEBookInfo didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("bookBundlePath"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo entity](self, "entity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attributesByName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo dictionaryWithValuesForKeys:](self, "dictionaryWithValuesForKeys:", v5));
  return v6;
}

- (void)_setValidMediaOverlayElementCount:(int64_t)a3
{
  self->_mediaOverlayElementCount = a3;
  self->_mediaOverlayElementCountValid = 1;
}

- (BOOL)hasMediaOverlayElements
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (!self->_mediaOverlayElementCountValid)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo databaseKey](self, "databaseKey"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("bookDatabaseKey == %@ AND mediaOverlayHref != NULL"), v3));

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo managedObjectContext](self, "managedObjectContext"));
    v6 = objc_msgSend(v5, "countEntity:withPredicate:", CFSTR("BKDocument"), v4);

    -[AEBookInfo _setValidMediaOverlayElementCount:](self, "_setValidMediaOverlayElementCount:", v6);
  }
  return self->_mediaOverlayElementCount > 0;
}

- (void)saveAnnotationsManagedObjectContext
{
  _QWORD block[5];

  -[AEBookInfo _cacheURL](self, "_cacheURL");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_C7A60;
  block[3] = &unk_1BEA38;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)shouldDisableOptimizeSpeed
{
  NSNumber **p_shouldDisableOptimizeSpeed;
  NSNumber *shouldDisableOptimizeSpeed;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  uint64_t v11;
  NSNumber *v12;

  p_shouldDisableOptimizeSpeed = &self->_shouldDisableOptimizeSpeed;
  shouldDisableOptimizeSpeed = self->_shouldDisableOptimizeSpeed;
  if (!shouldDisableOptimizeSpeed)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo bookBundlePath](self, "bookBundlePath"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("iTunesMetadata.plist")));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfFile:](NSDictionary, "dictionaryWithContentsOfFile:", v5));
      v7 = v6;
      if (v6)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("shouldDisableOptimizeSpeed")));
        objc_opt_class(NSNumber);
        isKindOfClass = objc_opt_isKindOfClass(v8, v9);
        if ((isKindOfClass & 1) != 0)
          objc_storeStrong((id *)p_shouldDisableOptimizeSpeed, v8);

      }
      else
      {
        isKindOfClass = 1;
      }

    }
    else
    {
      isKindOfClass = 1;
    }
    v11 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", isKindOfClass & 1));
    v12 = *p_shouldDisableOptimizeSpeed;
    *p_shouldDisableOptimizeSpeed = (NSNumber *)v11;

    shouldDisableOptimizeSpeed = *p_shouldDisableOptimizeSpeed;
  }
  return -[NSNumber BOOLValue](shouldDisableOptimizeSpeed, "BOOLValue");
}

- (NSString)assetLogID
{
  return self->assetLogID;
}

- (void)setAssetLogID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)isPreorder
{
  return self->isPreorder;
}

- (void)setIsPreorder:(id)a3
{
  objc_storeStrong((id *)&self->isPreorder, a3);
}

- (void)setAnnotationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_annotationProvider, a3);
}

- (NSString)password
{
  return self->_password;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotationProvider, 0);
  objc_storeStrong((id *)&self->isPreorder, 0);
  objc_storeStrong((id *)&self->assetLogID, 0);
  objc_storeStrong((id *)&self->_shouldDisableOptimizeSpeed, 0);
  objc_storeStrong((id *)&self->_linearOrdinalMap, 0);
  objc_storeStrong((id *)&self->_linearDocuments, 0);
  objc_storeStrong((id *)&self->_sortedDocuments, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_basePlusContentPath, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_baseUrl, 0);
}

- (BEProtocolCacheItem)cacheItem
{
  AEBookInfo *v2;
  void *v3;
  id AssociatedObject;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo assetID](v2, "assetID"));
  AssociatedObject = objc_getAssociatedObject(v2, "cacheItem");
  v5 = (id)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v5)
  {
    v5 = objc_alloc_init((Class)BEProtocolCacheItem);
    objc_msgSend(v5, "setBookID:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo basePlusContentPath](v2, "basePlusContentPath"));
    objc_msgSend(v5, "setRootPath:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo bookEpubId](v2, "bookEpubId"));
    objc_msgSend(v5, "setBookEpubId:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo bookEpubIdWithUUIDScheme](v2, "bookEpubIdWithUUIDScheme"));
    objc_msgSend(v5, "setBookEpubIdWithUUIDScheme:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo sinfInfo](v2, "sinfInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));

    if (objc_msgSend(v10, "count"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForKey:", CFSTR("sinfNumber")));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForKey:", CFSTR("sinfBlob")));
      v13 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjects:forKeys:", v12, v11);
      objc_msgSend(v5, "setSinfInfo:", v13);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo databaseKey](v2, "databaseKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("bookDatabaseKey ==[n] %@"), v14));

    v16 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", CFSTR("mime"), CFSTR("fileSize"), CFSTR("sinfNumber"), CFSTR("compressionAlgorithm"), CFSTR("encryptionAlgorithm"), CFSTR("href"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo managedObjectContext](v2, "managedObjectContext"));
    v18 = objc_msgSend(v17, "copyEntityPropertiesArray:fromEntityName:withPredicate:sortBy:ascending:", v16, CFSTR("BKDocument"), v15, 0, 1);

    if (objc_msgSend(v18, "count"))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "valueForKey:", CFSTR("href")));
      v20 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjects:forKeys:", v18, v19);
      objc_msgSend(v5, "setDocuments:", v20);

    }
    objc_setAssociatedObject(v2, "cacheItem", v5, (char *)&dword_0 + 1);

  }
  return (BEProtocolCacheItem *)v5;
}

- (BKStyleManager)styleManager
{
  id AssociatedObject;
  void *v4;
  void *v5;

  AssociatedObject = objc_getAssociatedObject(self, "styleManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo bookLanguage](self, "bookLanguage"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKStyleManager styleManagerWithLanguage:](BKStyleManager, "styleManagerWithLanguage:", v5));

    objc_setAssociatedObject(self, "styleManager", v4, (char *)&dword_0 + 1);
  }
  return (BKStyleManager *)v4;
}

+ (id)storeURLForBookStoreId:(id)a3 isAudiobook:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  const __CFString *v10;
  void *v11;

  v4 = a4;
  v5 = a3;
  if (objc_msgSend(v5, "longLongValue"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[AEUserPublishing sharedInstance](AEUserPublishing, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storeURLForStoreId:dataSource:", v5, 0));
    v8 = v7;
    if (v7)
    {
      v9 = v7;
    }
    else
    {
      v10 = CFSTR("book");
      if (v4)
        v10 = CFSTR("audiobook");
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("https://books.apple.com/%@/id%@"), v10, v5));
      v9 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v11);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (int)bkPageProgressionDirection
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo pageProgressionDirection](self, "pageProgressionDirection"));
  v3 = objc_msgSend(v2, "isEqualToString:", AEHelperStringMetadataPageProgressionRightToLeftValue);

  return v3;
}

- (BOOL)languageDefaultsToHorizontalTextFlow
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo bookLanguage](self, "bookLanguage"));
  v3 = +[IMLanguageUtilities languageDefaultsToHorizontalOrientation:](IMLanguageUtilities, "languageDefaultsToHorizontalOrientation:", v2);

  return v3;
}

- (int)languageDefaultPageProgressDirection
{
  void *v2;
  unsigned int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEBookInfo bookLanguage](self, "bookLanguage"));
  v3 = +[IMLanguageUtilities languageDefaultsToPageProgressLeftToRight:](IMLanguageUtilities, "languageDefaultsToPageProgressLeftToRight:", v2) ^ 1;

  return v3;
}

- (BEBookViewModel)epub
{
  AEBookInfo *v2;
  id v3;

  v2 = self;
  v3 = AEBookInfo.epub.getter();

  return (BEBookViewModel *)v3;
}

@end
