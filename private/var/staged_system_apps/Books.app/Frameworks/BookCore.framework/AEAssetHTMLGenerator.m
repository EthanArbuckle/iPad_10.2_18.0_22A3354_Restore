@implementation AEAssetHTMLGenerator

- (AEAssetHTMLGenerator)init
{
  AEAssetHTMLGenerator *v2;
  AEAssetHTMLGenerator *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AEAssetHTMLGenerator;
  v2 = -[AEAssetHTMLGenerator init](&v5, "init");
  v3 = v2;
  if (v2)
    -[AEAssetHTMLGenerator setWordLimit:](v2, "setWordLimit:", 200);
  return v3;
}

- (id)documentString
{
  void *v3;
  void *v4;
  void *v5;

  if (-[AEAssetHTMLGenerator isSeries](self, "isSeries")
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(+[AEUserPublishing sharedInstance](AEUserPublishing, "sharedInstance")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator storeId](self, "storeId")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "wholeHTMLForStoreId:dataSource:", v4, self)),
        v4,
        v3,
        !v5))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator templateBasedDocumentString](self, "templateBasedDocumentString"));
  }
  return v5;
}

- (id)templateBasedDocumentString
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator templateStringForName:](self, "templateStringForName:", CFSTR("AEAssetShare")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator dataSource](self, "dataSource"));
  if ((objc_opt_respondsToSelector(v4, "checkoutBookStringForHTMLGenerator:") & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator dataSource](self, "dataSource"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "checkoutBookStringForHTMLGenerator:", self));

  }
  else
  {
    v6 = &stru_296430;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator bookInfoSection](self, "bookInfoSection"));
  if (v7)
  {
    v8 = 0;
    v9 = 0;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator citationIncludingStoreURL:](self, "citationIncludingStoreURL:", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator storeLink](self, "storeLink"));
  }
  objc_msgSend(v3, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%CHECKOUTBOOK%% -->"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator insertionHeaderSection](self, "insertionHeaderSection"));
  objc_msgSend(v3, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%INSERTIONHEADER%% -->"), v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator styleSection](self, "styleSection"));
  objc_msgSend(v3, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%STYLESECTION%% -->"), v11);

  objc_msgSend(v3, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%BOOKINFO%% -->"), v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator disclaimerSection](self, "disclaimerSection"));
  objc_msgSend(v3, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%DISCLAIMERSECTION%% -->"), v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator readingDirection](self, "readingDirection"));
  objc_msgSend(v3, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%READINGDIRECTION%% -->"), v13);

  objc_msgSend(v3, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%CITATION%% -->"), v9);
  objc_msgSend(v3, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%STORELINK%% -->"), v8);

  return v3;
}

- (unint64_t)characterCountLimitforAnnotation:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v16;

  v4 = a3;
  v5 = -[AEAssetHTMLGenerator wordLimit](self, "wordLimit");
  v16 = 0;
  v6 = 0;
  if (-[AEAssetHTMLGenerator areCitationsAllowed](self, "areCitationsAllowed"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotationSelectedText"));
    v8 = objc_msgSend(v7, "length");

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotationRepresentativeText"));
    v10 = objc_msgSend(v9, "length");

    v6 = (unint64_t)(v8 <= v10 ? v10 : v8);
    if (v6 >= 4 * v5)
    {
      v11 = objc_opt_class(AEAnnotation);
      if ((objc_opt_isKindOfClass(v4, v11) & 1) != 0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotatedAttributedString"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "string"));

      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotationSelectedText"));
      }
      v14 = objc_msgSend(v13, "tokenCountWithEnumerationOptions:maxTokenCount:outLimitLength:", 3, -1, 0);
      if (v14 >= (id)-[AEAssetHTMLGenerator wordLimit](self, "wordLimit"))
        objc_msgSend(v13, "tokenCountWithEnumerationOptions:maxTokenCount:outLimitLength:", 3, -[AEAssetHTMLGenerator wordLimit](self, "wordLimit"), &v16);
      else
        v16 = objc_msgSend(v13, "length");

      v6 = (unint64_t)v16;
    }
  }

  return v6;
}

- (id)CSSClassForStyle:(int)a3
{
  if ((a3 - 1) > 4)
    return CFSTR("defaultColor");
  else
    return *(&off_290030 + a3 - 1);
}

- (id)userPublishing:(id)a3 storeURLForStoreId:(id)a4
{
  void *v5;
  void *v6;

  if (objc_msgSend(a4, "longLongValue", a3))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator dataSource](self, "dataSource"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storeURLForHTMLGenerator:", self));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)userPublishing:(id)a3 tellAFriendEmailBaseURLForStoreId:(id)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator dataSource](self, "dataSource", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tellAFriendBaseURLForHTMLGenerator:", self));

  return v6;
}

- (id)styleSection
{
  NSBundle *v2;
  void *v3;
  char *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(AEAssetHTMLGenerator));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathForResource:ofType:", CFSTR("AEAssetShare"), CFSTR("css")));

  v13 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithContentsOfFile:encoding:error:](NSString, "stringWithContentsOfFile:encoding:error:", v4, 4, &v13));
  v6 = v13;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<style type=\"text/css\">%@</style>"), v5));
  }
  else
  {
    v8 = BCIMLog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v15 = "-[AEAssetHTMLGenerator styleSection]";
      v16 = 2080;
      v17 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Sharing/Annotations/Private/AEAssetHTMLGenerator.m";
      v18 = 1024;
      v19 = 212;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
    }

    v10 = BCIMLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "@\"Failed to load CSS at Path {%@}\", buf, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (id)insertionHeaderSection
{
  return CFSTR("<p id=\"insertionheader\"><br/></p>");
}

- (id)bookInfoSection
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AEUserPublishing sharedInstance](AEUserPublishing, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator storeId](self, "storeId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bookInfoHTMLForStoreId:dataSource:", v4, self));

  return v5;
}

- (id)disclaimerSection
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("<div class=\"disclaimer\"><!-- %%NOTADDEDTOMAILLIST%% --></div>")));
  v3 = IMCommonCoreBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Please note that you have not been added to any email lists."), &stru_296430, CFSTR("BCCommonCoreLocalizable")));

  objc_msgSend(v2, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%NOTADDEDTOMAILLIST%% -->"), v5);
  return v2;
}

- (id)storeURL
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator dataSource](self, "dataSource"));
  v4 = objc_opt_respondsToSelector(v3, "storeURLForHTMLGenerator:");

  if ((v4 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator dataSource](self, "dataSource"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storeURLForHTMLGenerator:", self));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "absoluteString"));
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)bookURL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator epubId](self, "epubId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ibooks://bookid/%@"), v2));

  return v3;
}

- (id)citationIncludingStoreURL:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator dataSource](self, "dataSource"));
  v6 = objc_opt_respondsToSelector(v5, "HTMLGenerator:citationForStoreURL:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator dataSource](self, "dataSource"));
    if (v3)
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator storeURL](self, "storeURL"));
    else
      v8 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "HTMLGenerator:citationForStoreURL:", self, v8));
    if (v3)

  }
  else
  {
    v9 = 0;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "im_stringByReplacingNewLinesWithHTMLBreaks"));

  return v10;
}

- (id)storeLink
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator storeURL](self, "storeURL"));
  if (v2)
  {
    v3 = IMCommonCoreBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Available in Apple Books"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<a href=\"%@\">%@</a>"), v2, v5));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)templateStringForName:(id)a3
{
  id v3;
  NSBundle *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  char *v10;
  char *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;

  v3 = a3;
  v4 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(AEAssetHTMLGenerator));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(".%@"), CFSTR("html")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathForResource:ofType:", v6, CFSTR("tmpl")));
  v8 = objc_msgSend(v7, "length");
  if (v8)
  {
    v18 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithContentsOfFile:encoding:error:](NSString, "stringWithContentsOfFile:encoding:error:", v7, 4, &v18));
    v10 = (char *)v18;
    v11 = v10;
    if (v9)
    {

      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", v9));
    }
    else
    {
      v12 = BCIMLog();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v20 = "-[AEAssetHTMLGenerator templateStringForName:]";
        v21 = 2080;
        v22 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/Sharing/Annotations/Private/AEAss"
              "etHTMLGenerator.m";
        v23 = 1024;
        v24 = 291;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "%s %s:%d", buf, 0x1Cu);
      }

      v14 = BCIMLog();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v20 = (const char *)v7;
        v21 = 2112;
        v22 = v11;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "@\"Failed to load e-mail template {%@} -- %@\", buf, 0x16u);
      }

      v9 = 0;
      v8 = 0;
    }
  }
  else
  {
    v9 = 0;
  }
  v16 = v8;

  return v16;
}

- (NSString)storeId
{
  return self->_storeId;
}

- (void)setStoreId:(id)a3
{
  objc_storeStrong((id *)&self->_storeId, a3);
}

- (NSString)epubId
{
  return self->_epubId;
}

- (void)setEpubId:(id)a3
{
  objc_storeStrong((id *)&self->_epubId, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)author
{
  return self->_author;
}

- (void)setAuthor:(id)a3
{
  objc_storeStrong((id *)&self->_author, a3);
}

- (NSString)sortAuthor
{
  return self->_sortAuthor;
}

- (void)setSortAuthor:(id)a3
{
  objc_storeStrong((id *)&self->_sortAuthor, a3);
}

- (NSString)publisherLocation
{
  return self->_publisherLocation;
}

- (void)setPublisherLocation:(id)a3
{
  objc_storeStrong((id *)&self->_publisherLocation, a3);
}

- (NSString)publisherName
{
  return self->_publisherName;
}

- (void)setPublisherName:(id)a3
{
  objc_storeStrong((id *)&self->_publisherName, a3);
}

- (NSString)publisherYear
{
  return self->_publisherYear;
}

- (void)setPublisherYear:(id)a3
{
  objc_storeStrong((id *)&self->_publisherYear, a3);
}

- (NSString)readingDirection
{
  return self->_readingDirection;
}

- (void)setReadingDirection:(id)a3
{
  objc_storeStrong((id *)&self->_readingDirection, a3);
}

- (NSString)genre
{
  return self->_genre;
}

- (void)setGenre:(id)a3
{
  objc_storeStrong((id *)&self->_genre, a3);
}

- (AEAssetHTMLGeneratorDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  self->_dataSource = (AEAssetHTMLGeneratorDataSource *)a3;
}

- (BOOL)isContentProtected
{
  return self->_contentProtected;
}

- (void)setContentProtected:(BOOL)a3
{
  self->_contentProtected = a3;
}

- (BOOL)isForPrint
{
  return self->_forPrint;
}

- (void)setForPrint:(BOOL)a3
{
  self->_forPrint = a3;
}

- (BOOL)isSeries
{
  return self->_series;
}

- (void)setSeries:(BOOL)a3
{
  self->_series = a3;
}

- (BOOL)areCitationsAllowed
{
  return self->_citationsAllowed;
}

- (void)setCitationsAllowed:(BOOL)a3
{
  self->_citationsAllowed = a3;
}

- (unint64_t)wordLimit
{
  return self->_wordLimit;
}

- (void)setWordLimit:(unint64_t)a3
{
  self->_wordLimit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_genre, 0);
  objc_storeStrong((id *)&self->_readingDirection, 0);
  objc_storeStrong((id *)&self->_publisherYear, 0);
  objc_storeStrong((id *)&self->_publisherName, 0);
  objc_storeStrong((id *)&self->_publisherLocation, 0);
  objc_storeStrong((id *)&self->_sortAuthor, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_epubId, 0);
  objc_storeStrong((id *)&self->_storeId, 0);
}

@end
