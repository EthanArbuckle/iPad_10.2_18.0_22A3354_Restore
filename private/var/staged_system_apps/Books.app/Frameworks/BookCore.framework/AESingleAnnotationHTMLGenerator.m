@implementation AESingleAnnotationHTMLGenerator

- (id)documentString
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator styleSection](self, "styleSection"));
  v4 = IMCommonCoreBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("All Excerpts From"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AESingleAnnotationHTMLGenerator excerpt](self, "excerpt"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator bookInfoSection](self, "bookInfoSection"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator disclaimerSection](self, "disclaimerSection"));
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
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AESingleAnnotationHTMLGenerator chapterTitle](self, "chapterTitle"));
  v10 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v10, "setDateStyle:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringFromDate:", v11));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator templateStringForName:](self, "templateStringForName:", CFSTR("AEAnnotationShare")));
  objc_msgSend(v12, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%STYLESECTION%% -->"), v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator insertionHeaderSection](self, "insertionHeaderSection"));
  objc_msgSend(v12, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%INSERTIONHEADER%% -->"), v13);

  objc_msgSend(v12, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%EXCERPT%% -->"), v6);
  objc_msgSend(v12, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%EXERPTFROM%% -->"), v19);
  objc_msgSend(v12, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%CITATION%% -->"), v9);
  objc_msgSend(v12, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%STORELINK%% -->"), v8);
  objc_msgSend(v12, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%BOOKINFO%% -->"), v7);
  objc_msgSend(v12, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%DISCLAIMERSECTION%% -->"), v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator readingDirection](self, "readingDirection"));
  objc_msgSend(v12, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%READINGDIRECTION%% -->"), v14);

  objc_msgSend(v12, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%ANNOTATIONDATE%% -->"), v16);
  objc_msgSend(v12, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%ANNOTATIONCHAPTER%% -->"), v17);

  return v12;
}

- (id)annotation
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AESingleAnnotationHTMLGenerator annotations](self, "annotations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastObject"));

  return v3;
}

- (id)chapterTitle
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AESingleAnnotationHTMLGenerator annotation](self, "annotation"));
  v4 = objc_opt_respondsToSelector(v3, "chapterTitle");

  if ((v4 & 1) == 0
    || (v5 = (void *)objc_claimAutoreleasedReturnValue(-[AESingleAnnotationHTMLGenerator annotation](self, "annotation")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chapterTitle")),
        v5,
        !v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AESingleAnnotationHTMLGenerator paginationDataSource](self, "paginationDataSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AESingleAnnotationHTMLGenerator annotation](self, "annotation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chapterTitleForAnnotation:", v8));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AESingleAnnotationHTMLGenerator annotation](self, "annotation"));
  if ((objc_opt_respondsToSelector(v9, "physicalPageNumber") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AESingleAnnotationHTMLGenerator annotation](self, "annotation"));
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "physicalPageNumber"));

  }
  else
  {
    v11 = &stru_296430;
  }

  if (-[__CFString length](v11, "length"))
  {
    v12 = IMCommonCoreBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("p. %@"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
    v15 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v11));

    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(", %@"), v15));
    v6 = (void *)v16;
    v11 = (__CFString *)v15;
  }

  return v6;
}

- (id)excerpt
{
  void *v3;
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AESingleAnnotationHTMLGenerator annotation](self, "annotation"));
  v4 = -[AEAssetHTMLGenerator characterCountLimitforAnnotation:](self, "characterCountLimitforAnnotation:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation contextAwareSelectedTextFromAnnotation:](AEAnnotation, "contextAwareSelectedTextFromAnnotation:", v3));
  if (v4 < (unint64_t)objc_msgSend(v5, "length"))
  {
    v6 = IMCommonCoreBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[\\U2026]"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByTruncatingToLength:options:truncationString:", v4, 3, v8));

    v5 = (void *)v9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "im_stringByReplacingNewLinesWithHTMLBreaks"));

  return v10;
}

- (BOOL)userPublishing:(id)a3 isLocalGenerationEnabledForStoreId:(id)a4
{
  return 0;
}

- (NSArray)annotations
{
  return self->_annotations;
}

- (void)setAnnotations:(id)a3
{
  objc_storeStrong((id *)&self->_annotations, a3);
}

- (BOOL)areCitationsAllowed
{
  return self->_citationsAllowed;
}

- (void)setCitationsAllowed:(BOOL)a3
{
  self->_citationsAllowed = a3;
}

- (AEAnnotationPaginationDataSource)paginationDataSource
{
  return (AEAnnotationPaginationDataSource *)objc_loadWeakRetained((id *)&self->_paginationDataSource);
}

- (void)setPaginationDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_paginationDataSource, a3);
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
  objc_destroyWeak((id *)&self->_paginationDataSource);
  objc_storeStrong((id *)&self->_annotations, 0);
}

@end
