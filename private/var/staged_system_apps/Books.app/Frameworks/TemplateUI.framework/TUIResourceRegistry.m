@implementation TUIResourceRegistry

- (TUIResourceRegistry)init
{
  TUIResourceRegistry *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *imageProviders;
  NSMutableDictionary *v5;
  NSMutableDictionary *fileProviders;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TUIResourceRegistry;
  v2 = -[TUIResourceRegistry init](&v8, "init");
  if (v2)
  {
    v3 = objc_opt_new(NSMutableDictionary);
    imageProviders = v2->_imageProviders;
    v2->_imageProviders = v3;

    v5 = objc_opt_new(NSMutableDictionary);
    fileProviders = v2->_fileProviders;
    v2->_fileProviders = v5;

  }
  return v2;
}

- (void)registerImageProvider:(id)a3 forKind:(id)a4
{
  if (a4)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_imageProviders, "setObject:forKeyedSubscript:", a3);
}

- (id)imageProviderForKind:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_imageProviders, "objectForKeyedSubscript:"));
  else
    return 0;
}

- (void)registerFileProvider:(id)a3 forKind:(id)a4
{
  if (a4)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_fileProviders, "setObject:forKeyedSubscript:", a3);
}

- (id)fileProviderForKind:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_fileProviders, "objectForKeyedSubscript:"));
  else
    return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileProviders, 0);
  objc_storeStrong((id *)&self->_imageProviders, 0);
}

@end
