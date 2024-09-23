@implementation PTCinematographyNetworkSignal

+ (id)networkSignalWithModelDictionary:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithModelDictionary:", v4);

  return v5;
}

+ (Class)subclassForName:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("__rect")) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", CFSTR("__uncertainty")) & 1) == 0)
  {
    objc_msgSend(v3, "isEqualToString:", CFSTR("__label_onehot"));
  }
  objc_opt_class();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v4;
}

- (PTCinematographyNetworkSignal)initWithModelDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  PTCinematographyNetworkSignal *v7;
  PTCinematographyNetworkSignal *v8;
  void *v9;
  PTCinematographyNetworkSignal *v10;
  PTCinematographyNetworkSignal *v11;
  objc_super v13;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  if (v6 == objc_opt_class())
  {
    v10 = (PTCinematographyNetworkSignal *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "subclassForName:", v5)), "initWithModelDictionary:", v4);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PTCinematographyNetworkSignal;
    v7 = -[PTCinematographyNetworkSignal init](&v13, sel_init);
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_name, v5);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("count"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8->_count = objc_msgSend(v9, "unsignedIntegerValue");

    }
    v10 = v8;
    self = v10;
  }
  v11 = v10;

  return v11;
}

- (BOOL)checkSignalForStream:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = -[PTCinematographyNetworkSignal count](self, "count");
  v6 = objc_msgSend(v4, "count");
  v7 = objc_msgSend(v4, "index");

  return v5 <= v6 - v7;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
