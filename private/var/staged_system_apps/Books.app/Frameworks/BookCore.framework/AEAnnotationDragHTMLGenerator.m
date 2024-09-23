@implementation AEAnnotationDragHTMLGenerator

+ (id)truncatedAnnotationSelectedText:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "annotationSelectedText"));
  v10 = 0;
  objc_msgSend(v3, "tokenCountWithEnumerationOptions:maxTokenCount:outLimitLength:", 3, 200, &v10);
  v4 = v10;
  v5 = IMCommonCoreBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("[\\U2026]"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByTruncatingToLength:options:truncationString:", v4, 3, v7));

  return v8;
}

- (AEAnnotationDragHTMLGenerator)initWithAnnotation:(id)a3 propertyProvider:(id)a4
{
  id v7;
  id v8;
  AEAnnotationDragHTMLGenerator *v9;
  AEAnnotationDragHTMLGenerator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AEAnnotationDragHTMLGenerator;
  v9 = -[AEAssetHTMLGenerator init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_annotation, a3);
    objc_storeWeak((id *)&v10->_propertyProvider, v8);
  }

  return v10;
}

- (id)documentString
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
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationDragHTMLGenerator annotation](self, "annotation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator templateStringForName:](self, "templateStringForName:", CFSTR("AEAnnotationShareDnD")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator styleSection](self, "styleSection"));
  objc_msgSend(v4, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%STYLESECTION%% -->"), v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator readingDirection](self, "readingDirection"));
  objc_msgSend(v4, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%READINGDIRECTION%% -->"), v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationDragHTMLGenerator _metadataString](self, "_metadataString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "annotationNote"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationDragHTMLGenerator _excerptString:](self, "_excerptString:", 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationDragHTMLGenerator _representativeText:](self, "_representativeText:", 1));
  if (objc_msgSend(v10, "length") && objc_msgSend(v3, "annotationIsUnderline"))
  {
    v11 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<span class=\"underline\"><span style=\"color:black;\">%@</span></span>"),
              v10));

    v10 = (void *)v11;
  }
  if (objc_msgSend(v7, "length"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingString:", CFSTR("\n")));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "im_stringByReplacingNewLinesWithHTMLBreaks"));

    v7 = (void *)v13;
  }
  if (objc_msgSend(v8, "length"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingString:", CFSTR("\n")));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "im_stringByReplacingNewLinesWithHTMLBreaks"));

    v8 = (void *)v15;
  }
  if (objc_msgSend(v10, "length"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingString:", CFSTR("\n")));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "im_stringByReplacingNewLinesWithHTMLBreaks"));

    v10 = (void *)v17;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetHTMLGenerator CSSClassForStyle:](self, "CSSClassForStyle:", objc_msgSend(v3, "annotationStyle")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByAppendingString:", CFSTR("Border")));

  objc_msgSend(v4, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%ANNOTATIONMETADATA%% -->"), v7);
  objc_msgSend(v4, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%ANNOTATIONMARKETCOLOR%% -->"), v19);
  objc_msgSend(v4, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%ANNOTATIONREPRESENTATIVETEXT%% -->"), v10);
  objc_msgSend(v4, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%ANNOTATIONNOTE%% -->"), v8);
  objc_msgSend(v4, "AEReplaceTemplatePlaceholder:withString:", CFSTR("<!-- %%ANNOTATIONEXCERPTTEXT%% -->"), v9);

  return v4;
}

- (id)plainTextString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationDragHTMLGenerator annotation](self, "annotation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationDragHTMLGenerator _representativeText:](self, "_representativeText:", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "annotationNote"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationDragHTMLGenerator _excerptString:](self, "_excerptString:", 0));
  if (objc_msgSend(v5, "length"))
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("\n\n%@"), v5));

    v4 = (void *)v7;
  }
  if (objc_msgSend(v6, "length"))
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("\n\n%@"), v6));

    v4 = (void *)v8;
  }

  return v4;
}

- (id)_metadataString
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSString *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v21;

  v3 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v3, "setDateStyle:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationDragHTMLGenerator annotation](self, "annotation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "annotationCreationDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringFromDate:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationDragHTMLGenerator propertyProvider](self, "propertyProvider"));
  v8 = objc_claimAutoreleasedReturnValue(-[AEAnnotationDragHTMLGenerator annotation](self, "annotation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pageNumberStringForAnnotation:", v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationDragHTMLGenerator annotation](self, "annotation"));
  LOBYTE(v8) = objc_opt_respondsToSelector(v10, "chapterTitle");

  if ((v8 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationDragHTMLGenerator annotation](self, "annotation"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "chapterTitle"));

  }
  else
  {
    v12 = 0;
  }
  if (objc_msgSend(v12, "length") && objc_msgSend(v9, "length"))
  {
    v13 = IMCommonCoreBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("%@, p. %@"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
    v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v12, v9);
LABEL_9:
    v18 = (id)objc_claimAutoreleasedReturnValue(v16);

    goto LABEL_10;
  }
  if (objc_msgSend(v9, "length"))
  {
    v17 = IMCommonCoreBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("p. %@"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
    v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v9, v21);
    goto LABEL_9;
  }
  if (objc_msgSend(v12, "length"))
    v18 = v12;
  else
    v18 = 0;
LABEL_10:
  if (objc_msgSend(v18, "length"))
  {
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingFormat:", CFSTR("\n%@"), v18));

    v6 = (void *)v19;
  }

  return v6;
}

- (id)_representativeText:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationDragHTMLGenerator annotation](self, "annotation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationDragHTMLGenerator truncatedAnnotationSelectedText:](AEAnnotationDragHTMLGenerator, "truncatedAnnotationSelectedText:", v4));

  if (objc_msgSend(v5, "length"))
  {
    if (a3)
      v6 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("&ldquo;%@&rdquo;"), v5));
    else
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByEnclosingInQuotes"));
    v7 = (void *)v6;

    v5 = v7;
  }
  return v5;
}

- (id)_excerptString:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationDragHTMLGenerator propertyProvider](self, "propertyProvider"));
  v5 = IMCommonCoreBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Excerpt from:"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bookTitle"));
  if (objc_msgSend(v8, "length"))
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("\n%@"), v8));

    v7 = (void *)v9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "author"));
  if (objc_msgSend(v10, "length"))
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("\n%@"), v10));

    v7 = (void *)v11;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storeURL"));
  v13 = v12;
  if (v12)
  {
    if (v3)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "absoluteString"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "absoluteString"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<a href='%@'>%@</a>"), v14, v15));

    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "absoluteString"));
    }
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("\n%@"), v16));

    v7 = (void *)v17;
  }
  v18 = IMCommonCoreBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("This material may be protected by copyright."), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("\n%@"), v20));

  if (v3)
  {
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "im_stringByReplacingNewLinesWithHTMLBreaks"));

    v21 = (void *)v22;
  }

  return v21;
}

- (AEAnnotation)annotation
{
  return self->_annotation;
}

- (AEAnnotationDragPropertyProvider)propertyProvider
{
  return (AEAnnotationDragPropertyProvider *)objc_loadWeakRetained((id *)&self->_propertyProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_propertyProvider);
  objc_storeStrong((id *)&self->_annotation, 0);
}

@end
