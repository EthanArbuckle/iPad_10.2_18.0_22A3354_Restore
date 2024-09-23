@implementation KTLoggableDataArray

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (KTLoggableDataArray)initWithLoggableDatas:(id)a3
{
  id v4;
  KTLoggableDataArray *v5;
  KTLoggableDataArray *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)KTLoggableDataArray;
  v5 = -[KTLoggableDataArray init](&v8, "init");
  v6 = v5;
  if (v5)
    -[KTLoggableDataArray setLoggableDatas:](v5, "setLoggableDatas:", v4);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[KTLoggableDataArray loggableDatas](self, "loggableDatas"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("loggableDatas"));

}

- (KTLoggableDataArray)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSSet *v8;
  void *v9;
  void *v10;
  KTLoggableDataArray *v11;

  v4 = a3;
  v6 = objc_opt_class(NSArray, v5);
  v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(KTLoggableData, v7), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("loggableDatas")));

  v11 = -[KTLoggableDataArray initWithLoggableDatas:]([KTLoggableDataArray alloc], "initWithLoggableDatas:", v10);
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  KTLoggableDataArray *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;

  v5 = (KTLoggableDataArray *)a3;
  if (self == v5)
  {
    v9 = 1;
  }
  else
  {
    v6 = objc_opt_class(KTLoggableDataArray, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableDataArray loggableDatas](v5, "loggableDatas"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableDataArray loggableDatas](self, "loggableDatas"));
      v9 = objc_msgSend(v7, "isEqualToArray:", v8);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTLoggableDataArray loggableDatas](self, "loggableDatas"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "description"));

  return v3;
}

- (NSArray)loggableDatas
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setLoggableDatas:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggableDatas, 0);
}

@end
