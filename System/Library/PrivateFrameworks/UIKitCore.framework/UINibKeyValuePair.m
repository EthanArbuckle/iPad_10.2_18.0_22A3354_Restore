@implementation UINibKeyValuePair

- (UINibKeyValuePair)initWithObject:(id)a3 keyPath:(id)a4 value:(id)a5
{
  id v9;
  id v10;
  id v11;
  UINibKeyValuePair *v12;
  UINibKeyValuePair *v13;
  uint64_t v14;
  NSString *keyPath;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)UINibKeyValuePair;
  v12 = -[UINibKeyValuePair init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong(&v12->object, a3);
    v14 = objc_msgSend(v10, "copy");
    keyPath = v13->keyPath;
    v13->keyPath = (NSString *)v14;

    objc_storeStrong(&v13->value, a5);
  }

  return v13;
}

- (void)apply
{
  objc_msgSend(self->object, "setValue:forKeyPath:", self->value, self->keyPath);
}

- (void)applyForSimulator
{
  objc_msgSend(self->object, "setValue:forKeyPath:", self->value, self->keyPath);
}

- (UINibKeyValuePair)initWithCoder:(id)a3
{
  id v4;
  UINibKeyValuePair *v5;
  uint64_t v6;
  id object;
  uint64_t v8;
  id value;
  void *v10;
  uint64_t v11;
  NSString *keyPath;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UINibKeyValuePair;
  v5 = -[UINibKeyValuePair init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIObject"));
    v6 = objc_claimAutoreleasedReturnValue();
    object = v5->object;
    v5->object = (id)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIValue"));
    v8 = objc_claimAutoreleasedReturnValue();
    value = v5->value;
    v5->value = (id)v8;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIKeyPath"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    keyPath = v5->keyPath;
    v5->keyPath = (NSString *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id object;
  id v5;

  object = self->object;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", object, CFSTR("UIObject"));
  objc_msgSend(v5, "encodeObject:forKey:", self->value, CFSTR("UIValue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->keyPath, CFSTR("UIKeyPath"));

}

- (id)object
{
  return self->object;
}

- (NSString)keyPath
{
  return self->keyPath;
}

- (id)value
{
  return self->value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->value, 0);
  objc_storeStrong((id *)&self->keyPath, 0);
  objc_storeStrong(&self->object, 0);
}

@end
