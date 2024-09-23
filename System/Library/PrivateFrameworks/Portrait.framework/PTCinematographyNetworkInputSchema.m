@implementation PTCinematographyNetworkInputSchema

- (PTCinematographyNetworkInputSchema)initWithModelDictionary:(id)a3
{
  id v4;
  PTCinematographyNetworkInputSchema *v5;
  uint64_t v6;
  NSString *name;
  void *v8;
  uint64_t v9;
  NSDictionary *params;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PTCinematographyNetworkInputSchema;
  v5 = -[PTCinematographyNetworkInputSchema init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_count = objc_msgSend(v8, "unsignedIntegerValue");

    v9 = objc_msgSend(v4, "copy");
    params = v5->_params;
    v5->_params = (NSDictionary *)v9;

  }
  return v5;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)count
{
  return self->_count;
}

- (NSDictionary)params
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_params, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
