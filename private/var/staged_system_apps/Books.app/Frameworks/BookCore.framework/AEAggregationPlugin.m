@implementation AEAggregationPlugin

- (AEAggregationPlugin)initWithFileExtension:(id)a3
{
  id v4;
  AEAggregationPlugin *v5;
  NSString *v6;
  NSString *extension;

  v4 = a3;
  v5 = -[AEAggregationPlugin init](self, "init");
  if (v5)
  {
    v6 = (NSString *)objc_msgSend(v4, "copy");
    extension = v5->_extension;
    v5->_extension = v6;

  }
  return v5;
}

- (AEAggregationPlugin)initWithUrlScheme:(id)a3
{
  id v4;
  AEAggregationPlugin *v5;
  NSString *v6;
  NSString *scheme;

  v4 = a3;
  v5 = -[AEAggregationPlugin init](self, "init");
  if (v5)
  {
    v6 = (NSString *)objc_msgSend(v4, "copy");
    scheme = v5->_scheme;
    v5->_scheme = v6;

  }
  return v5;
}

- (void)dealloc
{
  NSMutableArray *plugins;
  objc_super v4;

  -[NSMutableArray removeAllObjects](self->_plugins, "removeAllObjects");
  plugins = self->_plugins;
  self->_plugins = 0;

  v4.receiver = self;
  v4.super_class = (Class)AEAggregationPlugin;
  -[AEAggregationPlugin dealloc](&v4, "dealloc");
}

- (void)addPlugin:(id)a3
{
  id v4;
  NSMutableArray *plugins;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  plugins = self->_plugins;
  v8 = v4;
  if (!plugins)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_plugins;
    self->_plugins = v6;

    v4 = v8;
    plugins = self->_plugins;
  }
  -[NSMutableArray addObject:](plugins, "addObject:", v4);

}

- (id)associatedAssetType
{
  return 0;
}

- (id)supportedFileExtensions
{
  void *v3;

  v3 = -[NSString length](self->_extension, "length");
  if (v3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", self->_extension));
  return v3;
}

- (id)supportedUrlSchemes
{
  void *v3;

  v3 = -[NSString length](self->_scheme, "length");
  if (v3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", self->_scheme));
  return v3;
}

- (id)helperForURL:(id)a3 withOptions:(id)a4
{
  id v6;
  id v7;
  AEAggregationhelper *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[AEAggregationhelper initWithPlugins:forUrl:withOptions:]([AEAggregationhelper alloc], "initWithPlugins:forUrl:withOptions:", self->_plugins, v7, v6);

  return v8;
}

- (AEAnnotationProvider)sharedAnnotationProvider
{
  return self->_sharedAnnotationProvider;
}

- (void)setSharedAnnotationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_sharedAnnotationProvider, a3);
}

- (NSString)extension
{
  return self->_extension;
}

- (NSString)scheme
{
  return self->_scheme;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedAnnotationProvider, 0);
  objc_storeStrong((id *)&self->_scheme, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_plugins, 0);
}

@end
