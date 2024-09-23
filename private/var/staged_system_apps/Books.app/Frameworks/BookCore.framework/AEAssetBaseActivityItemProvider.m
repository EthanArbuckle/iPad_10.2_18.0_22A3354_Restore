@implementation AEAssetBaseActivityItemProvider

- (AEAssetBaseActivityItemProvider)initWithDelegate:(id)a3 placeholderItem:(id)a4 propertySource:(id)a5
{
  id v8;
  id v9;
  AEAssetBaseActivityItemProvider *v10;
  AEAssetBaseActivityItemProvider *v11;
  AEAssetActivityPropertyProvider *v12;
  AEAssetActivityPropertyProvider *propertyProvider;
  objc_super v15;

  v8 = a3;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AEAssetBaseActivityItemProvider;
  v10 = -[AEAssetBaseActivityItemProvider initWithPlaceholderItem:](&v15, "initWithPlaceholderItem:", a4);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v8);
    v12 = -[AEAssetActivityPropertyProvider initWithPropertySource:]([AEAssetActivityPropertyProvider alloc], "initWithPropertySource:", v9);
    propertyProvider = v11->_propertyProvider;
    v11->_propertyProvider = v12;

  }
  return v11;
}

- (BOOL)supportsActivityType:(id)a3
{
  return 0;
}

- (BOOL)shouldShareActivityType:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  if (-[AEAssetBaseActivityItemProvider supportsActivityType:](self, "supportsActivityType:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetBaseActivityItemProvider delegate](self, "delegate"));
    v6 = objc_msgSend(v5, "itemProviderSource:shouldShareActivityType:", self, v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  __CFString *v15;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetBaseActivityItemProvider propertyProvider](self, "propertyProvider", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetBaseActivityItemProvider propertyProvider](self, "propertyProvider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "author"));

  if (objc_msgSend(v6, "length"))
  {
    v9 = objc_msgSend(v8, "length");
    v10 = IMCommonCoreBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = v11;
    if (v9)
      v13 = CFSTR("\\U201C%@\\U201D by %@");
    else
      v13 = CFSTR("\\U201C%@\\U201D");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_296430, CFSTR("BCCommonCoreLocalizable")));

    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v6, v8));
  }
  else
  {
    v15 = &stru_296430;
  }

  return v15;
}

- (AEAssetActivityItemProviderSourceDelegate)delegate
{
  return (AEAssetActivityItemProviderSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AEAssetActivityPropertyProvider)propertyProvider
{
  return self->_propertyProvider;
}

- (void)setPropertyProvider:(id)a3
{
  objc_storeStrong((id *)&self->_propertyProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
