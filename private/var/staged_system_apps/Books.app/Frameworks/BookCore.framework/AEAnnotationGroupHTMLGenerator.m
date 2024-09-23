@implementation AEAnnotationGroupHTMLGenerator

- (id)documentString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationGroupHTMLGenerator headBody](self, "headBody"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationGroupHTMLGenerator annotationsBody](self, "annotationsBody"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationGroupHTMLGenerator tailBody](self, "tailBody"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n%@\n%@"), v3, v4, v5));

  return v6;
}

- (id)headBody
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator styleSection](self, "styleSection"));
  v4 = IMCommonCoreBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Notes From"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "im_uppercaseStringWithLocale:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator author](self, "author"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator templateStringForName:](self, "templateStringForName:", CFSTR("AEAnnotationGroupShare_head")));
  objc_msgSend(v10, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%STYLESECTION%% -->"), v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator insertionHeaderSection](self, "insertionHeaderSection"));
  objc_msgSend(v10, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%INSERTIONHEADER%% -->"), v11);

  objc_msgSend(v10, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%NOTESFROM%% -->"), v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationGroupHTMLGenerator bookTitleSection](self, "bookTitleSection"));
  objc_msgSend(v10, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%BOOKTITLE%% -->"), v12);

  objc_msgSend(v10, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%AUTHOR%% -->"), v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator readingDirection](self, "readingDirection"));
  objc_msgSend(v10, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%READINGDIRECTION%% -->"), v13);

  return v10;
}

- (id)annotationsBody
{
  AEAnnotationGroupHTMLGenerator *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v25;
  AEAnnotationGroupHTMLGenerator *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id obj;
  unsigned int v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AESingleAnnotationHTMLGenerator annotations](self, "annotations"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator templateStringForName:](v2, "templateStringForName:", CFSTR("AEAnnotationGroupShare_annotation")));
    v28 = objc_alloc_init((Class)NSDateFormatter);
    objc_msgSend(v28, "setDateStyle:", 3);
    v27 = objc_alloc_init((Class)NSMutableArray);
    v32 = -[AESingleAnnotationHTMLGenerator areCitationsAllowed](v2, "areCitationsAllowed");
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[AESingleAnnotationHTMLGenerator annotations](v2, "annotations"));
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (!v5)
      goto LABEL_21;
    v6 = v5;
    v7 = *(_QWORD *)v34;
    v25 = *(_QWORD *)v34;
    v26 = v2;
    while (1)
    {
      v8 = 0;
      v30 = v6;
      do
      {
        if (*(_QWORD *)v34 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v8);
        if (objc_msgSend(v9, "annotationType") != 3)
        {
          v10 = objc_autoreleasePoolPush();
          if ((v32 & 1) != 0
            || (v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "annotationNote")),
                v12 = objc_msgSend(v11, "length"),
                v11,
                v12))
          {
            v13 = objc_msgSend(v29, "mutableCopy");
            v14 = (__CFString *)objc_claimAutoreleasedReturnValue(-[AEAnnotationGroupHTMLGenerator chapterTitleForAnnotation:](v2, "chapterTitleForAnnotation:", v9));
            if (!-[__CFString length](v14, "length"))
            {

              v14 = &stru_296430;
            }
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "annotationCreationDate"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "stringFromDate:", v15));

            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "annotationNote"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "im_stringByReplacingNewLinesWithHTMLBreaks"));

            v19 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator CSSClassForStyle:](v2, "CSSClassForStyle:", objc_msgSend(v9, "annotationStyle")));
            if (v32)
            {
              v20 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationActivityItemProviderSource truncatedAnnotationSelectedText:](AEAnnotationActivityItemProviderSource, "truncatedAnnotationSelectedText:", v9));
              if (objc_msgSend(v9, "annotationIsUnderline"))
              {
                v21 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<span class=\"underline\"><span style=\"color:black;\">%@</span></span>"),
                          v20));
                goto LABEL_16;
              }
            }
            else
            {
              v22 = objc_claimAutoreleasedReturnValue(-[AEAnnotationGroupHTMLGenerator htmlHighlightForString:style:isUnderline:](v2, "htmlHighlightForString:style:isUnderline:", v16, objc_msgSend(v9, "annotationStyle"), objc_msgSend(v9, "annotationIsUnderline")));
              v21 = 0;
              v20 = v16;
              v16 = (void *)v22;
LABEL_16:

              v20 = (void *)v21;
            }
            objc_msgSend(v13, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%ANNOTATIONCHAPTER%% -->"), v14);
            objc_msgSend(v13, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%ANNOTATIONDATE%% -->"), v16);
            objc_msgSend(v13, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%ANNOTATIONNOTE%% -->"), v18);
            objc_msgSend(v13, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%ANNOTATIONREPRESENTATIVETEXT%% -->"), v20);
            objc_msgSend(v13, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%ANNOTATIONMARKETCOLOR%% -->"), v19);
            objc_msgSend(v27, "addObject:", v13);

            v7 = v25;
            v2 = v26;
            v6 = v30;
          }
          objc_autoreleasePoolPop(v10);
        }
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (!v6)
      {
LABEL_21:

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n")));
        return v23;
      }
    }
  }
  return 0;
}

- (id)tailBody
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AESingleAnnotationHTMLGenerator annotations](self, "annotations"));
  v4 = objc_msgSend(v3, "count");
  v5 = IMCommonCoreBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if ((unint64_t)v4 >= 2)
    v8 = CFSTR("All Excerpts From");
  else
    v8 = CFSTR("Excerpt From");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_296430, CFSTR("BCCommonCoreLocalizable")));

  if (-[AEAssetHTMLGenerator isForPrint](self, "isForPrint"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator citationIncludingStoreURL:](self, "citationIncludingStoreURL:", 0));
    v11 = 0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator bookInfoSection](self, "bookInfoSection"));
    if (!v11)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator citationIncludingStoreURL:](self, "citationIncludingStoreURL:", 0));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator storeLink](self, "storeLink"));
      goto LABEL_10;
    }
    v10 = 0;
  }
  v12 = 0;
LABEL_10:
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator templateStringForName:](self, "templateStringForName:", CFSTR("AEAnnotationGroupShare_tail")));
  objc_msgSend(v13, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%ALLEXCERPTSFROM%% -->"), v9);
  objc_msgSend(v13, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%BOOKINFO%% -->"), v11);
  objc_msgSend(v13, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%CITATION%% -->"), v10);
  objc_msgSend(v13, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%STORELINK%% -->"), v12);

  return v13;
}

- (id)bookTitleSection
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator title](self, "title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("<!-- %%BOOKTITLE%% -->")));
  objc_msgSend(v3, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%BOOKTITLE%% -->"), v2);

  return v3;
}

- (id)chapterTitleForAnnotation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  if ((objc_opt_respondsToSelector(v4, "chapterTitle") & 1) != 0
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "chapterTitle")),
        v7 = objc_msgSend(v6, "length"),
        v6,
        v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "chapterTitle"));
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AESingleAnnotationHTMLGenerator paginationDataSource](self, "paginationDataSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "chapterTitleForAnnotation:", v4));

  }
  if (objc_msgSend(v8, "length"))
    objc_msgSend(v5, "addObject:", v8);
  if ((objc_opt_respondsToSelector(v4, "physicalPageNumber") & 1) != 0)
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "physicalPageNumber"));
  else
    v10 = 0;
  if (objc_msgSend(v10, "length"))
  {
    v11 = IMCommonCoreBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("p. %@"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v10));
    objc_msgSend(v5, "addObject:", v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", ")));

  return v15;
}

- (id)htmlHighlightForString:(id)a3 style:(int)a4 isUnderline:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v6;
  id v8;
  void *v9;
  NSString *v10;
  void *v11;
  uint64_t v13;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator CSSClassForStyle:](self, "CSSClassForStyle:", v6));
  if (v5)
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<span class=\"underline\"><span style=\"color:black;\">%@</span></span>"),
            v8,
            v13);
  else
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<span class=\"%@\">%@</span>"), v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

- (id)htmlAnnotatedStringForAnnotation:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void **v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *, uint64_t, uint64_t, _BYTE *);
  void *v30;
  AEAnnotationGroupHTMLGenerator *v31;
  id v32;
  id v33;
  char v34;

  v4 = a3;
  v5 = -[AEAssetHTMLGenerator characterCountLimitforAnnotation:](self, "characterCountLimitforAnnotation:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation annotatedAttributedStringForAnnotation:withPossibleLength:](AEAnnotation, "annotatedAttributedStringForAnnotation:withPossibleLength:", v4, v5));
  if ((unint64_t)objc_msgSend(v6, "length") > v5)
  {
    v7 = objc_alloc((Class)NSMutableAttributedString);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "attributedSubstringFromRange:", 0, v5));
    v9 = objc_msgSend(v7, "initWithAttributedString:", v8);

    v10 = objc_alloc((Class)NSAttributedString);
    v11 = IMCommonCoreBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("[\\U2026]"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
    v14 = objc_msgSend(v10, "initWithString:", v13);

    objc_msgSend(v9, "appendAttributedString:", v14);
    v6 = v9;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "string"));
  v16 = objc_msgSend(v15, "mutableCopy");

  LOBYTE(v15) = objc_msgSend(v4, "annotationIsUnderline");
  v17 = objc_msgSend(v6, "length");
  v27 = _NSConcreteStackBlock;
  v28 = 3221225472;
  v29 = sub_10642C;
  v30 = &unk_291350;
  v31 = self;
  v18 = v6;
  v32 = v18;
  v34 = (char)v15;
  v19 = v16;
  v33 = v19;
  objc_msgSend(v18, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("kAEAnnotationStyleAttributeName"), 0, v17, 0, &v27);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator storeURL](self, "storeURL"));

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator storeURL](self, "storeURL"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotationLocation"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@#%@"), v21, v22, v27, v28, v29, v30, v31, v32));

    if (objc_msgSend(v23, "length"))
    {
      v24 = objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<a href=\"%@\" class=\"annotationrepresentativetext\">%@</a>"), v23, v19));

      v19 = (id)v24;
    }

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "im_stringByReplacingNewLinesWithHTMLBreaks"));

  return v25;
}

@end
