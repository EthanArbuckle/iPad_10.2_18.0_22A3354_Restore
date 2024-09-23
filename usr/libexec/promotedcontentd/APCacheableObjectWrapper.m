@implementation APCacheableObjectWrapper

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)APCacheableObjectWrapper;
  v4 = a3;
  -[APCacheableBaseObject encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableObjectWrapper object](self, "object", v6.receiver, v6.super_class));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("object"));

}

- (id)object
{
  return self->_object;
}

- (APCacheableObjectWrapper)initWithObject:(id)a3 identifier:(id)a4
{
  id v7;
  APCacheableObjectWrapper *v8;
  APCacheableObjectWrapper *v9;

  v7 = a3;
  v8 = -[APCacheableBaseObject initWithIdentifier:](self, "initWithIdentifier:", a4);
  v9 = v8;
  if (v8)
    objc_storeStrong(&v8->_object, a3);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_object, 0);
}

- (APCacheableObjectWrapper)initWithCoder:(id)a3
{
  id v4;
  APCacheableObjectWrapper *v5;
  APCacheableObjectWrapper *v6;
  id v7;
  uint64_t v8;
  id object;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)APCacheableObjectWrapper;
  v5 = -[APCacheableBaseObject initWithCoder:](&v11, "initWithCoder:", v4);
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_msgSend((id)objc_opt_class(v5), "objectClass"), CFSTR("object"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    object = v6->_object;
    v6->_object = (id)v8;

  }
  return v6;
}

- (BOOL)canBeGarbageCollected
{
  return 1;
}

- (int64_t)garbageCollect
{
  uint64_t v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;

  if (!-[APCacheableObjectWrapper canBeGarbageCollected](self, "canBeGarbageCollected"))
    return 0;
  if ((sub_10016B9C8(self) & 1) != 0)
    return 1;
  v4 = APLogForCategory(33);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = objc_msgSend((id)objc_opt_class(self), "objectClass");
    v7 = objc_opt_class(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
    v9 = 138478083;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Unable to remove '%{private}@' '%{public}@'.", (uint8_t *)&v9, 0x16u);

  }
  return -1;
}

@end
