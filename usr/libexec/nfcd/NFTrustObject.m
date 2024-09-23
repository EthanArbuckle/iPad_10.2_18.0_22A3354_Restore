@implementation NFTrustObject

+ (id)allowedXPCClasses
{
  if (qword_10032A9E8 != -1)
    dispatch_once(&qword_10032A9E8, &stru_1002E8A68);
  return (id)qword_10032A9F0;
}

- (id)allowedXPCClasses
{
  return +[NFTrustObject allowedXPCClasses](NFTrustObject, "allowedXPCClasses");
}

- (id)dictionaryRepresentation
{
  NSMutableDictionary *v3;
  objc_class *Superclass;
  NSString *v5;
  void *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  unsigned __int8 v10;
  objc_property_t *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSString *v18;
  void *v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  unsigned __int8 v23;
  objc_class *cls;
  unsigned int outCount;

  v3 = objc_opt_new(NSMutableDictionary);
  Superclass = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(Superclass);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (objc_class *)objc_opt_class(NFTrustObject);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_msgSend(v6, "isEqualToString:", v9);

  if ((v10 & 1) == 0)
  {
    while (1)
    {
      outCount = 0;
      cls = Superclass;
      v11 = class_copyPropertyList(Superclass, &outCount);
      if (outCount)
        break;
LABEL_13:
      free(v11);
      Superclass = class_getSuperclass(cls);
      v18 = NSStringFromClass(Superclass);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v20 = (objc_class *)objc_opt_class(NFTrustObject);
      v21 = NSStringFromClass(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v23 = objc_msgSend(v19, "isEqualToString:", v22);

      if ((v23 & 1) != 0)
        return v3;
    }
    v12 = 0;
    while (1)
    {
      v13 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s"), property_getName(v11[v12]));
      if ((objc_msgSend(v13, "hasPrefix:", CFSTR("trustObjectInternal")) & 1) == 0)
        break;
LABEL_12:

      if (++v12 >= (unint64_t)outCount)
        goto LABEL_13;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NFTrustObject valueForKey:](self, "valueForKey:", v13));
    if (v14)
    {
      v15 = objc_opt_class(NFTrustObject);
      if ((objc_opt_isKindOfClass(v14, v15) & 1) == 0)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v14, v13);
        goto LABEL_11;
      }
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dictionaryRepresentation"));
    }
    else
    {
      v16 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    }
    v17 = (void *)v16;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v16, v13);

LABEL_11:
    goto LABEL_12;
  }
  return v3;
}

- (id)description
{
  id v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = objc_alloc((Class)NSString);
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NFTrustObject dictionaryRepresentation](self, "dictionaryRepresentation"));
  v8 = objc_msgSend(v3, "initWithFormat:", CFSTR("%@ : %@"), v6, v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFTrustObject)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NFTrustObject;
  return -[NFTrustObject init](&v4, "init", a3);
}

@end
