@implementation AEAnnotationAirDropTextActivityItemProvider

- (id)supportedActivityTypes
{
  UIActivityType v3;

  v3 = UIActivityTypeAirDrop;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return +[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("kAEAnnotationAirDropTextActivityItemProviderURLPlaceholder"));
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NSString *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  uint64_t v21;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;

  v5 = a4;
  if (-[AEAssetActivityItemProviderSource supportsActivityType:](self, "supportsActivityType:", v5))
  {
    v22.receiver = self;
    v22.super_class = (Class)AEAnnotationAirDropTextActivityItemProvider;
    v6 = -[AEAnnotationTextActivityItemProvider textForActivityType:](&v22, "textForActivityType:", v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = NSTemporaryDirectory();
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = IMCommonCoreBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("AirDrop"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingPathExtension:", CFSTR("txt")));

    v21 = 0;
    -[NSObject writeToFile:atomically:encoding:error:](v7, "writeToFile:atomically:encoding:error:", v14, 0, 4, &v21);
    v15 = 0;
    if (!v21)
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v14));

  }
  else
  {
    v16 = AESharingLog();
    v7 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v17 = (objc_class *)objc_opt_class(self);
      v18 = NSStringFromClass(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      *(_DWORD *)buf = 138412546;
      v24 = v19;
      v25 = 2112;
      v26 = v5;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "%@ returning nil for activity:%@", buf, 0x16u);

    }
    v15 = 0;
  }

  return v15;
}

@end
