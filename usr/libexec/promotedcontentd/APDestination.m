@implementation APDestination

- (APProtectedDestination)protectedDestination
{
  APProtectedDestination *v3;
  void *v4;
  APProtectedDestination *v5;

  v3 = [APProtectedDestination alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APDestination value](self, "value"));
  v5 = -[APProtectedDestination initWithString:](v3, "initWithString:", v4);

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APDestination value](self, "value"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (NSString)value
{
  return self->_value;
}

- (APDestination)initWithString:(id)a3
{
  id v4;
  APDestination *v5;
  NSString *v6;
  NSString *value;
  APDestination *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)APDestination;
  v5 = -[APDestination init](&v10, "init");
  if (v5
    && (v6 = (NSString *)objc_msgSend(v4, "copy"), value = v5->_value, v5->_value = v6, value, !v5->_value))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (BOOL)isEqualToDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APDestination value](self, "value"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "value"));

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  APDestination *v4;
  APDestination *v5;
  uint64_t v6;
  BOOL v7;

  v4 = (APDestination *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (self == v4)
  {
    v7 = 1;
    goto LABEL_7;
  }
  v6 = objc_opt_class(APDestination);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = -[APDestination isEqualToDestination:](self, "isEqualToDestination:", v5);
  else
LABEL_5:
    v7 = 0;
LABEL_7:

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APDestination)initWithCoder:(id)a3
{
  id v4;
  APDestination *v5;
  id v6;
  uint64_t v7;
  NSString *value;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)APDestination;
  v5 = -[APDestination init](&v10, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("value"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    value = v5->_value;
    v5->_value = (NSString *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[APDestination value](self, "value"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("value"));

}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

+ (APDestination)ecRouter
{
  if (qword_100269B38[0] != -1)
    dispatch_once(qword_100269B38, &stru_100215ED0);
  return (APDestination *)(id)qword_100269B30;
}

@end
