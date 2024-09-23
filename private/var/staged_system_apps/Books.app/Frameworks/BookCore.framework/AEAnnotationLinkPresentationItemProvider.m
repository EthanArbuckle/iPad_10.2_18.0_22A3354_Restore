@implementation AEAnnotationLinkPresentationItemProvider

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;

  v5 = a4;
  v6 = AESharingLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class(self);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v14 = 138412546;
    v15 = v10;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "%@ returning LPMetadat.URL for activity:%@", (uint8_t *)&v14, 0x16u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationActivityItemProviderSource _generateLinkMetadata](self, "_generateLinkMetadata"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URL"));

  return v12;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v3);
}

@end
