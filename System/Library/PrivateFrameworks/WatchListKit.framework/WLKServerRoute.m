@implementation WLKServerRoute

- (WLKServerRoute)initWithDictionary:(id)a3 routeName:(id)a4
{
  id v6;
  id v7;
  WLKServerRoute *v8;
  uint64_t v9;
  NSString *routeName;
  void *v11;
  uint64_t v12;
  NSString *host;
  void *v14;
  uint64_t v15;
  NSString *path;
  void *v17;
  uint64_t v18;
  NSString *requiredKVPType;
  NSString *v20;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)WLKServerRoute;
  v8 = -[WLKServerRoute init](&v22, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    routeName = v8->_routeName;
    v8->_routeName = (NSString *)v9;

    objc_msgSend(v6, "wlk_stringForKey:", CFSTR("host"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    host = v8->_host;
    v8->_host = (NSString *)v12;

    objc_msgSend(v6, "wlk_stringForKey:", CFSTR("path"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    path = v8->_path;
    v8->_path = (NSString *)v15;

    objc_msgSend(v6, "wlk_stringForKey:", CFSTR("requiredParamsType"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    requiredKVPType = v8->_requiredKVPType;
    v8->_requiredKVPType = (NSString *)v18;

    if (!-[NSString length](v8->_requiredKVPType, "length"))
    {
      v20 = v8->_requiredKVPType;
      v8->_requiredKVPType = (NSString *)CFSTR("Default");

    }
    v8->_requiresLocation = objc_msgSend(v6, "wlk_BOOLForKey:defaultValue:", CFSTR("needsLocation"), 1);
  }

  return v8;
}

- (NSURL)URL
{
  NSString *host;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  host = self->_host;
  if (host)
  {
    if (self->_path)
    {
      v7[0] = self->_path;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString wlk_stringByAppendingPathComponents:](host, "wlk_stringByAppendingPathComponents:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      return (NSURL *)v5;
    }
    host = 0;
  }
  return (NSURL *)host;
}

- (NSString)routeName
{
  return self->_routeName;
}

- (NSString)host
{
  return self->_host;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)requiredKVPType
{
  return self->_requiredKVPType;
}

- (BOOL)requiresLocation
{
  return self->_requiresLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredKVPType, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_routeName, 0);
}

@end
