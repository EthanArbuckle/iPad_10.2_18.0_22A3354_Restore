@implementation AEAnnotationGroupHTMLActivityItemProvider

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  AEAnnotationGroupHTMLGenerator *v8;
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
    v8 = objc_alloc_init(AEAnnotationGroupHTMLGenerator);
    -[AEAnnotationHTMLActivityItemProvider populateHTMLGenerator:](self, "populateHTMLGenerator:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationGroupHTMLGenerator documentString](v8, "documentString"));

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

@end
