@implementation BECFIUtilitiesJS

- (BECFIUtilitiesJS)initWithOptions:(id)a3 gapBetweenPages:(double)a4 paginatedTopToBottom:(BOOL)a5
{
  id v9;
  BECFIUtilitiesJS *v10;
  BECFIUtilitiesJS *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BECFIUtilitiesJS;
  v10 = -[BECFIUtilitiesJS init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_options, a3);
    v11->_gapBetweenPages = a4;
    v11->_paginatedTopToBottom = a5;
  }

  return v11;
}

- (id)mainFrameOnlyJavascript:(int64_t)a3
{
  return 0;
}

- (id)mainFrameJavascriptURL:(int64_t)a3
{
  return 0;
}

- (id)anyFrameJavascript:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[3];
  _QWORD v20[3];

  if (a3)
    return CFSTR("document.addEventListener('click', __ibooks_cfi_utilities.stashCFIForClickedElement, true);");
  v19[0] = CFSTR("bookInfo");
  v5 = objc_claimAutoreleasedReturnValue(-[BECFIUtilitiesJSOptions jsonRepresentation](self->_options, "jsonRepresentation"));
  v6 = (void *)v5;
  v7 = &stru_38FF08;
  if (v5)
    v7 = (const __CFString *)v5;
  v20[0] = v7;
  v19[1] = CFSTR("gapBetweenPages");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_gapBetweenPages));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringValue"));
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = CFSTR("0");
  v20[1] = v11;
  v19[2] = CFSTR("paginatedVertically");
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_paginatedTopToBottom));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringValue"));
  v14 = (void *)v13;
  if (v13)
    v15 = (const __CFString *)v13;
  else
    v15 = CFSTR("0");
  v20[2] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 3));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[cfi_utilities source](cfi_utilities, "source"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[BESimpleTemplate javascriptStringFromJavascriptSource:replacements:](BESimpleTemplate, "javascriptStringFromJavascriptSource:replacements:", v17, v16));

  return v18;
}

- (id)anyFrameJavascriptURL:(int64_t)a3
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[cfi_utilities sourceName](cfi_utilities, "sourceName", a3));
  v4 = BEJavascriptProviderUniqueURLForFilename((uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

+ (id)updateScriptWithOptions:(id)a3 gapBetweenPages:(double)a4 paginatedTopToBottom:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "jsonRepresentation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v5));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_cfi_utilities.updateDocumentInfo('%@', %@, %@)"), v7, v8, v9));

  return v10;
}

+ (id)upgradeAnnotationsScript:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;

  v7 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", a3, 4, &v7));
  v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v3, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_cfi_utilities.cfiLocationsForRanges('%@')"), v4));

  return v5;
}

+ (id)getClientRectsForLocationsScript:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  __CFString *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  void *v16;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v12 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v3, 0, &v12));
    v5 = v12;
    v6 = v5;
    if (v4)
      v7 = v5 == 0;
    else
      v7 = 0;
    if (v7)
    {
      v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v4, 4);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_cfi_utilities.getClientRects(%@);"),
                              v9));
    }
    else
    {
      v8 = _BookEPUBLog();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v14 = v3;
        v15 = 2112;
        v16 = v6;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "Error serialization locations: %@, error:%@", buf, 0x16u);
      }
      v10 = &stru_38FF08;
    }

  }
  else
  {
    v10 = &stru_38FF08;
  }

  return v10;
}

+ (id)textNodeCharacterCountsScriptForSpineIndex:(unint64_t)a3 documentOrdinal:(int64_t)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/%lu/%lu!"), 2 * a3 + 2, 2 * a4 + 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_cfi_utilities.textNodeCharacterCounts(document.documentElement, '%@')"), v4));

  return v5;
}

+ (id)cfisForHrefsScript:(id)a3
{
  id v3;
  id v4;
  char *v5;
  char *v6;
  char *i;
  void *v8;
  void *v9;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init((Class)NSMutableArray);
    objc_msgSend(v4, "addObject:", CFSTR("__ibooks_cfi_utilities.cfisForHrefs(["));
    v5 = (char *)objc_msgSend(v3, "count");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        if (i)
          objc_msgSend(v4, "addObject:", CFSTR(","));
        objc_msgSend(v4, "addObject:", CFSTR("\"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", i));
        objc_msgSend(v4, "addObject:", v8);

        objc_msgSend(v4, "addObject:", CFSTR("\"));
      }
    }
    objc_msgSend(v4, "addObject:", CFSTR("]);"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsJoinedByString:", &stru_38FF08));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)clientRectsForAnnotationCFIs:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;

  v7 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", a3, 4, &v7));
  v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v3, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_cfi_utilities.getClientRectsForAnnotationCFIS('%@')"), v4));

  return v5;
}

+ (id)getSelectedRangeScript:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  __CFString *v9;
  id v11;
  uint8_t buf[4];
  id v13;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v11 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v3, 4, &v11));
    v5 = v11;
    if (v5)
    {
      v6 = _BookEPUBLog();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v3;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "Unable to serialize physical page hrefs %@", buf, 0xCu);
      }

    }
    if (v4)
    {
      v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v4, 4);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_cfi_utilities.getSelectedRangeWithPhysicalPage(%@);"),
                             v8));

    }
    else
    {
      v9 = CFSTR("__ibooks_cfi_utilities.getSelectedRange();");
    }

  }
  else
  {
    v9 = CFSTR("__ibooks_cfi_utilities.getSelectedRange();");
  }

  return v9;
}

- (BECFIUtilitiesJSOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (BOOL)paginatedTopToBottom
{
  return self->_paginatedTopToBottom;
}

- (void)setPaginatedTopToBottom:(BOOL)a3
{
  self->_paginatedTopToBottom = a3;
}

- (double)gapBetweenPages
{
  return self->_gapBetweenPages;
}

- (void)setGapBetweenPages:(double)a3
{
  self->_gapBetweenPages = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
}

@end
