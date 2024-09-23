@implementation KNAnimParameterSavedGroup

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KNAnimParameterSavedGroup name](self, "name"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("nm"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[KNAnimParameterSavedGroup version](self, "version"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("vers"));

  v7 = (id)objc_claimAutoreleasedReturnValue(-[KNAnimParameterSavedGroup parameters](self, "parameters"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("params"));

}

- (KNAnimParameterSavedGroup)initWithCoder:(id)a3
{
  id v4;
  KNAnimParameterSavedGroup *v5;
  id v6;
  void *v7;
  NSString *v8;
  NSString *name;
  id v10;
  void *v11;
  NSString *v12;
  NSString *version;
  uint64_t v14;
  uint64_t v15;
  NSSet *v16;
  void *v17;
  uint64_t v18;
  NSMutableDictionary *parameters;
  NSMutableDictionary *v20;
  NSMutableDictionary *v21;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)KNAnimParameterSavedGroup;
  v5 = -[KNAnimParameterSavedGroup init](&v23, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("nm"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (NSString *)objc_msgSend(v7, "copy");
    name = v5->_name;
    v5->_name = v8;

    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("vers"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (NSString *)objc_msgSend(v11, "copy");
    version = v5->_version;
    v5->_version = v12;

    v14 = objc_opt_class(NSMutableDictionary);
    v15 = objc_opt_class(KNAnimParameterSavedParameter);
    v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v14, v15, objc_opt_class(NSString), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("params")));
    parameters = v5->_parameters;
    v5->_parameters = (NSMutableDictionary *)v18;

    if (!v5->_parameters)
    {
      v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v21 = v5->_parameters;
      v5->_parameters = v20;

    }
  }

  return v5;
}

- (KNAnimParameterSavedGroup)init
{
  KNAnimParameterSavedGroup *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *parameters;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)KNAnimParameterSavedGroup;
  v2 = -[KNAnimParameterSavedGroup init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    parameters = v2->_parameters;
    v2->_parameters = v3;

  }
  return v2;
}

- (id)parameterForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KNAnimParameterSavedGroup parameters](self, "parameters"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
