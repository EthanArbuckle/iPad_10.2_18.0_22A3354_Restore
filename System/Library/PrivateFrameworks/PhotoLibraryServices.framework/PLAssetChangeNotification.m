@implementation PLAssetChangeNotification

- (id)_initWithChangedObjects:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = -[PLAssetChangeNotification _init](self, "_init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    v7 = (void *)v5[1];
    v5[1] = v6;

  }
  return v5;
}

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("PLAssetsDidChangeNotification");
  return CFSTR("PLAssetsDidChangeNotification");
}

- (id)object
{
  return 0;
}

- (id)userInfo
{
  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLAssetChangeNotification;
  -[PLAssetChangeNotification description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAssetChangeNotification updatedAssets](self, "updatedAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("objectID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" updatedAssets %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSSet)updatedAssets
{
  return self->_updatedAssets;
}

- (void)setUpdatedAssets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedAssets, 0);
}

+ (id)notificationWithChangedAssets:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithChangedObjects:", v4);

  return v5;
}

@end
