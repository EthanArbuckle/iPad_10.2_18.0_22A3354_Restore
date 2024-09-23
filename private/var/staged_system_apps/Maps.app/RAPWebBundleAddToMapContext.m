@implementation RAPWebBundleAddToMapContext

- (id)context
{
  NSDictionary *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v14;
  void *v15;

  v14.receiver = self;
  v14.super_class = (Class)RAPWebBundleAddToMapContext;
  v3 = -[RAPWebBundleBaseContext context](&v14, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("place"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleAddToMapContext address](self, "address"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleAddToMapContext address](self, "address"));
    v15 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("formattedAddress"));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleAddToMapContext entityName](self, "entityName"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleAddToMapContext entityName](self, "entityName"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("entityName"));

  }
  v12 = objc_msgSend(v5, "copy");

  return v12;
}

- (NSString)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)entityName
{
  return self->_entityName;
}

- (void)setEntityName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end
