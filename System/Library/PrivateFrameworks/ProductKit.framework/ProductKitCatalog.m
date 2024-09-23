@implementation ProductKitCatalog

- (ProductKitCatalog)init
{
  ProductKitCatalog *v2;
  ProductKitCatalogInternal *v3;
  ProductKitCatalogInternal *underlyingObject;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ProductKitCatalog;
  v2 = -[ProductKitCatalog init](&v6, sel_init);
  v3 = objc_alloc_init(ProductKitCatalogInternal);
  underlyingObject = v2->_underlyingObject;
  v2->_underlyingObject = v3;

  return v2;
}

+ (BOOL)isProductKitURL:(id)a3
{
  return +[ProductKitCatalogInternal isProductKitURL:](ProductKitCatalogInternal, "isProductKitURL:", a3);
}

- (void)updateCatalogWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ProductKitCatalog underlyingObject](self, "underlyingObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateCatalogWithCompletionHandler:", v4);

}

- (void)watchBandFilesForFeatureWithURL:(id)a3 featureString:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[ProductKitCatalog underlyingObject](self, "underlyingObject");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "watchBandFilesForFeatureWithURL:featureString:variant:completionHandler:", v10, v9, 0, v8);

}

- (void)watchBandImageForFeatureWithURL:(id)a3 featureString:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[ProductKitCatalog underlyingObject](self, "underlyingObject");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "watchBandImageForFeatureWithURL:featureString:variant:completionHandler:", v10, v9, 0, v8);

}

- (void)watchBandFilesForFeatureWithURL:(id)a3 featureString:(id)a4 variant:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[ProductKitCatalog underlyingObject](self, "underlyingObject");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "watchBandFilesForFeatureWithURL:featureString:variant:completionHandler:", v13, v12, v11, v10);

}

- (void)watchBandImageForFeatureWithURL:(id)a3 featureString:(id)a4 variant:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[ProductKitCatalog underlyingObject](self, "underlyingObject");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "watchBandImageForFeatureWithURL:featureString:variant:completionHandler:", v13, v12, v11, v10);

}

- (ProductKitCatalogInternal)underlyingObject
{
  return self->_underlyingObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
