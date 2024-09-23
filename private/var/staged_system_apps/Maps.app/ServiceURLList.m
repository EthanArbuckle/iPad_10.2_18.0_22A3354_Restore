@implementation ServiceURLList

- (ServiceURLList)initWithName:(id)a3 defaultsKey:(id)a4
{
  void *var1;
  uint64_t v5;
  id v7;
  ServiceURLList *v8;
  NSString *v9;
  NSString *serviceName;
  NSMutableArray *v11;
  NSMutableArray *names;
  NSMutableArray *v13;
  NSMutableArray *urls;
  NSMutableArray *v15;
  NSMutableArray *infos;
  ServiceURLList *v17;
  objc_super v19;

  var1 = a4.var0.var1;
  v5 = *(_QWORD *)&a4.var0.var0;
  v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ServiceURLList;
  v8 = -[ServiceURLList init](&v19, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v7, "copy");
    serviceName = v8->_serviceName;
    v8->_serviceName = v9;

    *(_QWORD *)&v8->_defaultsKey.key.identifier = v5;
    v8->_defaultsKey.key.metadata = var1;
    v11 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    names = v8->_names;
    v8->_names = v11;

    v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    urls = v8->_urls;
    v8->_urls = v13;

    v15 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    infos = v8->_infos;
    v8->_infos = v15;

    v17 = v8;
  }

  return v8;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- ($6E15C01CA1BE37A4936191A84F7075E2)defaultsKey
{
  void *metadata;
  uint64_t v3;
  $6E15C01CA1BE37A4936191A84F7075E2 result;

  metadata = self->_defaultsKey.key.metadata;
  v3 = *(_QWORD *)&self->_defaultsKey.key.identifier;
  result.var0.var1 = metadata;
  *(_QWORD *)&result.var0.var0 = v3;
  return result;
}

- (unint64_t)count
{
  return (unint64_t)-[NSMutableArray count](self->_names, "count");
}

- (void)addURL:(id)a3 withName:(id)a4 info:(id)a5
{
  NSMutableArray *names;
  id v9;
  NSMutableArray *infos;
  void *v11;
  id v12;

  v12 = a5;
  names = self->_names;
  v9 = a3;
  -[NSMutableArray addObject:](names, "addObject:", a4);
  -[NSMutableArray addObject:](self->_urls, "addObject:", v9);

  infos = self->_infos;
  if (v12)
  {
    -[NSMutableArray addObject:](self->_infos, "addObject:", v12);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    -[NSMutableArray addObject:](infos, "addObject:", v11);

  }
}

- (id)URLAtIndex:(unint64_t)a3
{
  void *v5;

  if ((unint64_t)-[NSMutableArray count](self->_urls, "count") >= a3)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_urls, "objectAtIndexedSubscript:", a3));
  else
    v5 = 0;
  return v5;
}

- (id)nameAtIndex:(unint64_t)a3
{
  void *v5;

  if ((unint64_t)-[NSMutableArray count](self->_names, "count") >= a3)
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_names, "objectAtIndexedSubscript:", a3));
  else
    v5 = 0;
  return v5;
}

- (id)infoAtIndex:(unint64_t)a3
{
  id v5;
  void *v6;
  uint64_t v7;

  if ((unint64_t)-[NSMutableArray count](self->_infos, "count") >= a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_infos, "objectAtIndexedSubscript:", a3));
    v7 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
      v5 = v6;
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)defaultServiceURLLists
{
  id v2;
  uint64_t i;
  unint64_t v4;
  ServiceURLList *v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  ServiceURLList *v9;
  uint64_t v10;
  void *v11;
  ServiceURLList *v12;
  ServiceURLList *v13;

  v2 = objc_alloc_init((Class)NSMutableArray);
  for (i = 0; i != 65; ++i)
  {
    v4 = i + 1;
    if ((unint64_t)(i - 22) < 0x2B || v4 <= 0x15 && ((1 << v4) & 0x3DDE26) != 0)
    {
      v5 = [ServiceURLList alloc];
      if (v4 > 0x41)
        v6 = 0;
      else
        v6 = off_1011E8668[i];
      v7 = GEOURLConfigKey(i + 1);
      v9 = -[ServiceURLList initWithName:defaultsKey:](v5, "initWithName:defaultsKey:", v6, v7, v8);
      v10 = GEOURLWorldDefaultURLString(i + 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      -[ServiceURLList setDefaultCustomURLString:](v9, "setDefaultCustomURLString:", v11);

      objc_msgSend(v2, "addObject:", v9);
    }
  }
  v12 = [ServiceURLList alloc];
  v13 = -[ServiceURLList initWithName:defaultsKey:](v12, "initWithName:defaultsKey:", CFSTR("Environment Manifest Format"), GeoServicesConfig_CustomEnvironmentURLFormat[0], GeoServicesConfig_CustomEnvironmentURLFormat[1]);
  objc_msgSend(v2, "addObject:", v13);

  return v2;
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)defaultCustomURLString
{
  return self->_defaultCustomURLString;
}

- (void)setDefaultCustomURLString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_defaultCustomURLString, 0);
  objc_storeStrong((id *)&self->_infos, 0);
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_names, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
