@implementation AEAnnotationGroupPrintActivityItemProvider

- (id)supportedActivityTypes
{
  UIActivityType v3;

  v3 = UIActivityTypePrint;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v3, 1));
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationGroupPrintActivityItemProvider supportedActivityTypes](self, "supportedActivityTypes"));
  v9 = objc_msgSend(v8, "containsObject:", v7);

  if (v9)
  {
    v18.receiver = self;
    v18.super_class = (Class)AEAnnotationGroupPrintActivityItemProvider;
    v10 = -[AEAnnotationGroupHTMLActivityItemProvider activityViewController:itemForActivityType:](&v18, "activityViewController:itemForActivityType:", v6, v7);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_msgSend(objc_alloc((Class)UIMarkupTextPrintFormatter), "initWithMarkupText:", v11);
  }
  else
  {
    v13 = AESharingLog();
    v11 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v14 = (objc_class *)objc_opt_class(self);
      v15 = NSStringFromClass(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      *(_DWORD *)buf = 138412546;
      v20 = v16;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "%@ returning nil for activity:%@", buf, 0x16u);

    }
    v12 = 0;
  }

  return v12;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return objc_msgSend(objc_alloc((Class)UIMarkupTextPrintFormatter), "initWithMarkupText:", &stru_296430);
}

- (void)populateHTMLGenerator:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AEAnnotationGroupPrintActivityItemProvider;
  v3 = a3;
  -[AEAnnotationHTMLActivityItemProvider populateHTMLGenerator:](&v4, "populateHTMLGenerator:", v3);
  objc_msgSend(v3, "setCitationsAllowed:", 0, v4.receiver, v4.super_class);
  objc_msgSend(v3, "setForPrint:", 1);

}

@end
