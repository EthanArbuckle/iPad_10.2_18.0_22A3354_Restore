@implementation PFXStylesheet

+ (BOOL)readStylesheetFromString:(const char *)a3 sourceURL:(id)a4 toDictionary:(id)a5 toFontDictionary:(id)a6 pageCache:(id)a7
{
  if (a3 && *a3)
    +[PFSStyleParser parseCSSFrom:intoDict:fontDict:sourceUrl:pageCache:](PFSStyleParser, "parseCSSFrom:intoDict:fontDict:sourceUrl:pageCache:");
  return 1;
}

+ (BOOL)readStylesheetFromStyleAttributeContents:(const char *)a3 sourceURL:(id)a4 toDictionary:(id)a5 toFontDictionary:(id)a6 readerState:(id)a7
{
  unsigned __int8 v12;
  size_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  unsigned __int8 v17;

  if (a3 && *a3)
  {
    v12 = atomic_load((unsigned __int8 *)&qword_5433A8);
    if ((v12 & 1) == 0 && __cxa_guard_acquire(&qword_5433A8))
    {
      byte_5433A0 = 1;
      __cxa_guard_release(&qword_5433A8);
    }
    v13 = strlen(a3);
    v14 = 6;
    if (!byte_5433A0)
      v14 = 0;
    if (v13 <= (v14 ^ 0xFFFFFFFFFFFFFFFELL))
    {
      v15 = (char *)malloc_type_malloc(v13 + v14 + 1, 0x80D8C3C2uLL);
      if (v15)
      {
        v16 = v15;
        sprintf(v15, "* {%s}", a3);
        v17 = objc_msgSend(a1, "readStylesheetFromString:sourceURL:toDictionary:toFontDictionary:pageCache:", v16, a4, a5, a6, 0);
        free(v16);
        LOBYTE(v15) = v17;
      }
    }
    else
    {
      LOBYTE(v15) = 0;
    }
  }
  else
  {
    LOBYTE(v15) = 1;
  }
  return (char)v15;
}

+ (BOOL)readStylesheetFromEntry:(id)a3 readerState:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _UNKNOWN **v12;
  id v13;
  id v14;
  id v15;
  _UNKNOWN **v16;
  uint64_t v17;
  void *i;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  _UNKNOWN **v24;
  id v25;
  NSString *v26;
  NSString *v27;
  void *v28;
  id v29;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  char v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];

  v7 = objc_msgSend(a4, "currentHtmlDocMediaState");
  if ((objc_msgSend(v7, "loadedDocumentSelectorsForEntry:", a3) & 1) == 0)
  {
    v9 = objc_msgSend(a4, "absoluteEntryForRelativeUri:", a3);
    v10 = objc_msgSend(a4, "propertiesForStylesheetEntry:", v9);
    if (v10)
    {
      v11 = v10;
      v35 = v9;
      v36 = v7;
      v12 = &AEAnnotationPopoverShouldHideNotification_ptr;
      v13 = objc_alloc_init((Class)NSMutableDictionary);
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (v14)
      {
        v15 = v14;
        v16 = &AEAnnotationPopoverShouldHideNotification_ptr;
        v17 = *(_QWORD *)v40;
        v37 = v13;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(_QWORD *)v40 != v17)
              objc_enumerationMutation(v11);
            v19 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
            v20 = objc_opt_class(v16[410]);
            *(_QWORD *)&v21 = TSUDynamicCast(v20, objc_msgSend(v11, "objectForKey:", v19)).n128_u64[0];
            v23 = v22;
            if (!v22)
            {
              v24 = v12;
              v25 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", v21);
              v26 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[PFXStylesheet readStylesheetFromEntry:readerState:]");
              v27 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/Common/XML/PFXStylesheet.mm");
              v28 = v25;
              v12 = v24;
              v13 = v37;
              v16 = &AEAnnotationPopoverShouldHideNotification_ptr;
              objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v26, v27, 128, CFSTR("invalid nil value for '%s'"), "properties");
            }
            v29 = objc_msgSend(objc_alloc((Class)v12[436]), "initWithDictionary:", v23);
            objc_msgSend(v13, "setObject:forKey:", v29, v19);

          }
          v15 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        }
        while (v15);
      }
      objc_msgSend(v36, "addStylesheetProperties:forEntry:", v13, v35);
    }
    else
    {
      v8 = objc_msgSend(objc_msgSend(a4, "archive"), "decryptEntryWithName:error:", v9, 0);
      if (!v8)
        return (char)v8;
      v13 = objc_alloc_init((Class)NSMutableData);
      if (objc_msgSend(v8, "readIntoData:", v13))
      {
        v38 = 0;
        LOBYTE(v8) = 1;
        objc_msgSend(v13, "appendBytes:length:", &v38, 1);
        v31 = objc_msgSend(v13, "bytes");
        if (v31)
        {
          v32 = v31;
          v33 = objc_alloc_init((Class)NSMutableDictionary);
          v34 = objc_alloc_init((Class)NSMutableDictionary);
          LOBYTE(v8) = objc_msgSend(a1, "readStylesheetFromString:sourceURL:toDictionary:toFontDictionary:pageCache:", v32, +[NSURL URLWithString:relativeToURL:](NSURL, "URLWithString:relativeToURL:", v9, +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", CFSTR("/"), 1)), v33, v34, objc_msgSend(v7, "pageCache"));
          objc_msgSend(a4, "setStylesheetProperties:forEntry:", v33, v9);
          objc_msgSend(v7, "addStylesheetProperties:forEntry:", v33, v9);
          objc_msgSend(a1, "registerFontsFromDictionary:readerState:", v34, a4);

        }
        goto LABEL_15;
      }
    }
    LOBYTE(v8) = 1;
LABEL_15:

    return (char)v8;
  }
  LOBYTE(v8) = 1;
  return (char)v8;
}

+ (BOOL)readStylesheetFromStyleNodeContents:(id)a3 sourceURL:(id)a4 readerState:(id)a5
{
  id v9;
  id v10;
  unsigned int v11;

  v9 = objc_alloc_init((Class)NSMutableDictionary);
  v10 = objc_alloc_init((Class)NSMutableDictionary);
  v11 = objc_msgSend(a1, "readStylesheetFromString:sourceURL:toDictionary:toFontDictionary:pageCache:", objc_msgSend(a3, "UTF8String"), a4, v9, v10, 0);
  if (v11)
  {
    objc_msgSend(objc_msgSend(a5, "currentHtmlDocMediaState"), "addStylesheetProperties:", v9);
    objc_msgSend(a1, "registerFontsFromDictionary:readerState:", v10, a5);
  }

  return v11;
}

+ (BOOL)isMediaTypeSupportedInAll:(id)a3
{
  return objc_msgSend(objc_msgSend(a1, "basicMediaTypes"), "containsObject:", a3);
}

+ (BOOL)isMediaTypeSupportedInFlow:(id)a3
{
  return objc_msgSend(objc_msgSend(a1, "flowMediaTypes"), "containsObject:", a3);
}

+ (BOOL)isMediaTypeSupportedInPaginated:(id)a3
{
  return objc_msgSend(objc_msgSend(a1, "paginatedMediaTypes"), "containsObject:", a3);
}

+ (id)basicMediaTypes
{
  return &off_469B38;
}

+ (id)flowMediaTypes
{
  return &off_469B50;
}

+ (id)paginatedMediaTypes
{
  return &off_469B68;
}

+ (void)registerFontsFromDictionary:(id)a3 readerState:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  void *v17;
  uint64_t v18;
  double v19;
  void *v20;
  void *v21;
  char *v22;
  char *v23;
  id v24;
  uint64_t v25;
  double v26;
  id v27;
  id v28;
  id v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v28 = objc_msgSend(objc_msgSend(a4, "archive"), "fontObfuscationInfo");
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v5 = objc_msgSend(a3, "allValues");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v9);
        v11 = objc_opt_class(NSArray);
        TSUDynamicCast(v11, objc_msgSend(v10, "objectForKey:", CFSTR("src")));
        v13 = v12;
        v14 = objc_opt_class(PFSPair);
        *(_QWORD *)&v16 = TSUDynamicCast(v14, objc_msgSend(v13, "lastObject")).n128_u64[0];
        if (v15)
        {
          v17 = v15;
          if (objc_msgSend(v15, "type", v16) == (char *)&stru_108.addr + 1)
          {
            v18 = objc_opt_class(NSString);
            *(_QWORD *)&v19 = TSUDynamicCast(v18, objc_msgSend(v17, "value")).n128_u64[0];
            v21 = v20;
            v22 = (char *)objc_msgSend(v20, "length", v19);
            if ((unint64_t)v22 >= 6)
            {
              v23 = v22;
              if (objc_msgSend(v21, "hasPrefix:", CFSTR("url(")))
              {
                if (objc_msgSend(v21, "characterAtIndex:", v23 - 1) == 41)
                {
                  v24 = objc_msgSend(v21, "substringWithRange:", 4, v23 - 5);
                  if ((objc_msgSend(CFSTR("otf"), "isEqualToString:", objc_msgSend(v24, "pathExtension")) & 1) != 0
                    || objc_msgSend(CFSTR("ttf"), "isEqualToString:", objc_msgSend(v24, "pathExtension")))
                  {
                    v29 = objc_msgSend(objc_msgSend(objc_msgSend(a4, "archive"), "rootFolder"), "stringByAppendingPathComponent:", v24);
                    v25 = objc_opt_class(PFSPair);
                    *(_QWORD *)&v26 = TSUDynamicCast(v25, objc_msgSend(objc_msgSend(v10, "objectForKey:", CFSTR("font-family")), "lastObject")).n128_u64[0];
                    -[TSWPLoadableFonts registerFontName:forPath:forGroup:isObfuscated:backgroundLoad:](+[TSWPLoadableFonts sharedInstance](TSWPLoadableFonts, "sharedInstance"), "registerFontName:forPath:forGroup:isObfuscated:backgroundLoad:", objc_msgSend(v27, "stringValue", v26), v29, objc_msgSend(objc_msgSend(objc_msgSend(a4, "thDocumentRoot"), "bookDescription"), "uniquifier"), objc_msgSend(v28, "containsObject:", v24), 1);
                  }
                }
              }
            }
          }
        }
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v35, 16, v16);
    }
    while (v7);
  }
}

@end
