@implementation BEContentCleanupJS

- (BEContentCleanupJS)initWithOptions:(id)a3 pageLength:(double)a4 gapBetweenPages:(double)a5
{
  id v9;
  BEContentCleanupJS *v10;
  BEContentCleanupJS *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)BEContentCleanupJS;
  v10 = -[BEContentCleanupJS init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_options, a3);
    v11->_pageLength = a4;
    v11->_gapBetweenPages = a5;
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
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  _QWORD v26[5];

  if (a3)
    return 0;
  v25[0] = CFSTR("bookInfo");
  v5 = objc_claimAutoreleasedReturnValue(-[BEContentCleanupJSOptions jsonRepresentation](self->_options, "jsonRepresentation"));
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = &stru_38FF08;
  v26[0] = v7;
  v25[1] = CFSTR("pageLength");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_pageLength));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stringValue"));
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_38FF08;
  v26[1] = v10;
  v25[2] = CFSTR("gapBetweenPages");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_gapBetweenPages));
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringValue"));
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = &stru_38FF08;
  v26[2] = v14;
  v25[3] = CFSTR("readingMode");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BEContentCleanupJSOptions readingMode](self->_options, "readingMode")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringValue"));
  v26[3] = v16;
  v25[4] = CFSTR("altTextPlaceholder");
  v17 = BookEPUBBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Image"), &stru_38FF08, 0));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\"%@\"), v19));
  v26[4] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 5));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[content_cleanup source](content_cleanup, "source"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[BESimpleTemplate javascriptStringFromJavascriptSource:replacements:](BESimpleTemplate, "javascriptStringFromJavascriptSource:replacements:", v22, v21));

  return v23;
}

- (id)anyFrameJavascriptURL:(int64_t)a3
{
  void *v3;
  void *v4;
  id v5;

  if (a3)
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[content_cleanup sourceName](content_cleanup, "sourceName"));
    v5 = BEJavascriptProviderUniqueURLForFilename((uint64_t)v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue(v5);

  }
  return v3;
}

+ (id)updateScriptWithOptions:(id)a3 pageLength:(double)a4 gapBetweenPages:(double)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "jsonRepresentation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a5));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringValue"));
  v13 = objc_msgSend(v7, "readingMode");

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringValue"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__ibooks_content_cleanup.updateConfiguration('%@', %@, %@, %@)"), v8, v10, v12, v15));

  return v16;
}

- (BEContentCleanupJSOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (double)pageLength
{
  return self->_pageLength;
}

- (void)setPageLength:(double)a3
{
  self->_pageLength = a3;
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
