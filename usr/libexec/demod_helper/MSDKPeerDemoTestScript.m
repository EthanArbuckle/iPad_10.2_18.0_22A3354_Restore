@implementation MSDKPeerDemoTestScript

- (MSDKPeerDemoTestScript)initWithName:(id)a3 andMethods:(id)a4
{
  id v6;
  id v7;
  MSDKPeerDemoTestScript *v8;
  MSDKPeerDemoTestScript *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MSDKPeerDemoTestScript;
  v8 = -[MSDKPeerDemoTestScript init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[MSDKPeerDemoTestScript setName:](v8, "setName:", v6);
    -[MSDKPeerDemoTestScript setMethods:](v9, "setMethods:", v7);
  }

  return v9;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDKPeerDemoTestScript name](self, "name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDKPeerDemoTestScript methods](self, "methods"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@[%p]: Name=%@ Methods=%@>"), v5, self, v6, v7));

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSDKPeerDemoTestScript)initWithCoder:(id)a3
{
  id v4;
  MSDKPeerDemoTestScript *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSSet *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MSDKPeerDemoTestScript;
  v5 = -[MSDKPeerDemoTestScript init](&v13, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[MSDKPeerDemoTestScript setName:](v5, "setName:", v7);

    v8 = objc_opt_class(NSArray);
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, objc_opt_class(NSString), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("testMethods")));
    -[MSDKPeerDemoTestScript setMethods:](v5, "setMethods:", v11);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDKPeerDemoTestScript name](self, "name"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("name"));

  v6 = (id)objc_claimAutoreleasedReturnValue(-[MSDKPeerDemoTestScript methods](self, "methods"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("testMethods"));

}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSArray)methods
{
  return self->_methods;
}

- (void)setMethods:(id)a3
{
  objc_storeStrong((id *)&self->_methods, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_methods, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
