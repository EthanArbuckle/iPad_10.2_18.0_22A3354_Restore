@implementation IPCMessageObject

- (IPCMessageObject)init
{
  return -[IPCMessageObject initWithDictionary:](self, "initWithDictionary:", &__NSDictionary0__struct);
}

- (IPCMessageObject)initWithDictionary:(id)a3
{
  IPCMessageObject *v3;
  objc_super v5;

  if (a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)IPCMessageObject;
    self = -[IPCMessageObject init](&v5, "init");
    v3 = self;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)dictionaryValue
{
  return &__NSDictionary0__struct;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IPCMessageObject dictionaryValue](self, "dictionaryValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dictionaryValue"));
    v8 = objc_msgSend(v6, "isEqualToDictionary:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IPCMessageObject dictionaryValue](self, "dictionaryValue"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;

  v4 = objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IPCMessageObject dictionaryValue](self, "dictionaryValue"));
  v6 = objc_msgSend(v5, "copy");
  v7 = objc_msgSend(v4, "initWithDictionary:", v6);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_dataValue
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IPCMessageObject dictionaryValue](self, "dictionaryValue"));
  v6 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v2, 1, &v6));

  v4 = objc_msgSend(v3, "copy");
  return v4;
}

+ (id)_dictionaryValueFromData:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSSet *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v17;
  id v18;

  v3 = a3;
  v18 = 0;
  v4 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v3, &v18);

  v5 = v18;
  if (v5)
  {
    v6 = v5;
    v7 = 0;
  }
  else
  {
    v8 = objc_opt_class(NSArray);
    v9 = objc_opt_class(NSData);
    v10 = objc_opt_class(NSDictionary);
    v11 = objc_opt_class(NSNumber);
    v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(NSString), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v17 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeTopLevelObjectOfClasses:forKey:error:", v13, NSKeyedArchiveRootObjectKey, &v17));
    v6 = v17;

    v7 = 0;
    if (!v6)
    {
      v15 = objc_opt_class(NSDictionary);
      if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
        v7 = v14;
      else
        v7 = 0;
    }

  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[IPCMessageObject _dataValue](self, "_dataValue"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dataValue"));

}

- (IPCMessageObject)initWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  IPCMessageObject *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("dataValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = objc_msgSend((id)objc_opt_class(self), "_dictionaryValueFromData:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (v8)
  {
    self = -[IPCMessageObject initWithDictionary:](self, "initWithDictionary:", v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
