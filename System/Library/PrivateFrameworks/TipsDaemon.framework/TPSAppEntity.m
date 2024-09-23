@implementation TPSAppEntity

- (TPSAppEntity)initWithDictionary:(id)a3
{
  id v4;
  TPSAppEntity *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  id value;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TPSAppEntity;
  v5 = -[TPSAppEntity init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "TPSSafeStringForKey:", CFSTR("name"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = &stru_1EA1E3770;
    objc_storeStrong((id *)&v5->_name, v8);

    objc_msgSend(v4, "TPSSafeStringForKey:", CFSTR("bundleId"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (__CFString *)v9;
    else
      v11 = &stru_1EA1E3770;
    objc_storeStrong((id *)&v5->_bundleId, v11);

    objc_msgSend(v4, "TPSSafeObjectForKey:", CFSTR("value"));
    v12 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (id)v12;

  }
  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
