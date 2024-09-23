@implementation AEAnnotationDragItemProvider

- (AEAnnotationDragItemProvider)initWithPlainTextString:(id)a3 htmlString:(id)a4
{
  id v6;
  id v7;
  AEAnnotationDragItemProvider *v8;
  NSString *v9;
  NSString *plainTextString;
  NSString *v11;
  NSString *htmlString;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AEAnnotationDragItemProvider;
  v8 = -[AEAnnotationDragItemProvider init](&v14, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    plainTextString = v8->_plainTextString;
    v8->_plainTextString = v9;

    v11 = (NSString *)objc_msgSend(v7, "copy");
    htmlString = v8->_htmlString;
    v8->_htmlString = v11;

  }
  return v8;
}

+ (id)itemProviderWithAnnotation:(id)a3 propertyProvider:(id)a4
{
  id v6;
  id v7;
  AEAnnotationDragHTMLGenerator *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  v8 = -[AEAnnotationDragHTMLGenerator initWithAnnotation:propertyProvider:]([AEAnnotationDragHTMLGenerator alloc], "initWithAnnotation:propertyProvider:", v7, v6);

  v9 = objc_alloc((Class)objc_opt_class(a1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationDragHTMLGenerator plainTextString](v8, "plainTextString"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationDragHTMLGenerator documentString](v8, "documentString"));
  v12 = objc_msgSend(v9, "initWithPlainTextString:htmlString:", v10, v11);

  return v12;
}

- (void)_loadPlainTextData:(id)a3
{
  NSString *plainTextString;
  id v5;
  id v6;

  plainTextString = self->_plainTextString;
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[NSString dataUsingEncoding:](plainTextString, "dataUsingEncoding:", 4));
  (*((void (**)(id, id, _QWORD))a3 + 2))(v5, v6, 0);

}

- (void)_loadHtmlData:(id)a3
{
  NSString *htmlString;
  id v5;
  id v6;

  htmlString = self->_htmlString;
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[NSString dataUsingEncoding:](htmlString, "dataUsingEncoding:", 4));
  (*((void (**)(id, id, _QWORD))a3 + 2))(v5, v6, 0);

}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeHTML, "identifier"));
  v6[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeUTF8PlainText, "identifier"));
  v6[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 2));

  return (NSArray *)v4;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  unsigned int v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  id v16;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeUTF8PlainText, "identifier"));
  v9 = objc_msgSend(v8, "isEqualToString:", v6);

  if (v9)
  {
    -[AEAnnotationDragItemProvider _loadPlainTextData:](self, "_loadPlainTextData:", v7);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeHTML, "identifier"));
    v11 = objc_msgSend(v10, "isEqualToString:", v6);

    if (v11)
    {
      -[AEAnnotationDragItemProvider _loadHtmlData:](self, "_loadHtmlData:", v7);
    }
    else
    {
      if (v6)
      {
        v15 = CFSTR("typeIdentifier");
        v16 = v6;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
      }
      else
      {
        v12 = 0;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 3328, v12));
      v7[2](v7, 0, v13);

    }
  }

  return 0;
}

- (NSString)plainTextString
{
  return self->_plainTextString;
}

- (void)setPlainTextString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)htmlString
{
  return self->_htmlString;
}

- (void)setHtmlString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_htmlString, 0);
  objc_storeStrong((id *)&self->_plainTextString, 0);
}

@end
