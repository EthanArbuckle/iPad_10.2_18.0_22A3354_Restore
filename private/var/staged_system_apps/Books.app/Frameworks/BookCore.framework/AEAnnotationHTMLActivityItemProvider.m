@implementation AEAnnotationHTMLActivityItemProvider

- (id)supportedActivityTypes
{
  UIActivityType v3;

  v3 = UIActivityTypeMail;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  AESingleAnnotationHTMLGenerator *v8;
  void *v9;
  id v10;
  NSObject *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationHTMLActivityItemProvider supportedActivityTypes](self, "supportedActivityTypes"));
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if (v7)
  {
    v8 = objc_alloc_init(AESingleAnnotationHTMLGenerator);
    -[AEAnnotationHTMLActivityItemProvider populateHTMLGenerator:](self, "populateHTMLGenerator:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AESingleAnnotationHTMLGenerator documentString](v8, "documentString"));

  }
  else
  {
    v10 = AESharingLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class(self);
      v13 = NSStringFromClass(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v16 = 138412546;
      v17 = v14;
      v18 = 2112;
      v19 = v5;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "%@ returning nil for activity:%@", (uint8_t *)&v16, 0x16u);

    }
    v9 = 0;
  }

  return v9;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationHTMLActivityItemProvider supportedActivityTypes](self, "supportedActivityTypes"));
  v7 = objc_msgSend(v6, "containsObject:", v5);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "author"));
    v10 = objc_msgSend(v9, "length");
    v11 = IMCommonCoreBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = v12;
    if (v10)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Notes from \\U201C%@\\U201D by %@"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "title"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "author"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v16, v18));

    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Notes from \\U201C%@\\U201D"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "title"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v16));
    }

  }
  else
  {
    v19 = 0;
  }
  return v19;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v3);
}

- (unint64_t)annotationHTMLGeneratorNumberOfAnnotations
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationActivityItemProviderSource annotations](self, "annotations"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (id)annotationHTMLGeneratorAnnotationAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationActivityItemProviderSource annotations](self, "annotations"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", a3));

  return v5;
}

- (void)populateHTMLGenerator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AEAnnotationHTMLActivityItemProvider;
  v4 = a3;
  -[AEAssetActivityItemProviderSource populateHTMLGenerator:](&v8, "populateHTMLGenerator:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityItemProviderSource propertyProvider](self, "propertyProvider", v8.receiver, v8.super_class));
  objc_msgSend(v4, "setContentProtected:", objc_msgSend(v5, "contentProtected"));

  objc_msgSend(v4, "setCitationsAllowed:", -[AEAnnotationActivityItemProviderSource areCitationAllowed](self, "areCitationAllowed"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationActivityItemProviderSource paginationDataSource](self, "paginationDataSource"));
  objc_msgSend(v4, "setPaginationDataSource:", v6);

  objc_msgSend(v4, "setDataSource:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationActivityItemProviderSource annotations](self, "annotations"));
  objc_msgSend(v4, "setAnnotations:", v7);

}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
  objc_storeStrong((id *)&self->_activityType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityType, 0);
}

@end
