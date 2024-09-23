@implementation ACTSelectPopupVariant

- (ACTSelectPopupVariant)initWithIntendedKey:(id)a3 timestamp:(double)a4
{
  id v6;
  ACTSelectPopupVariant *v7;
  uint64_t v8;
  NSString *intendedKey;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACTSelectPopupVariant;
  v7 = -[ACTSelectPopupVariant init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    intendedKey = v7->_intendedKey;
    v7->_intendedKey = (NSString *)v8;

    v7->_timestamp = a4;
  }

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTSelectPopupVariant intendedKey](self, "intendedKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTSelectPopupVariant timestamp](self, "timestamp");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: intended=%@, t=%.2f>"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)applyWithTyper:(id)a3 log:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[ACTSelectPopupVariant intendedKey](self, "intendedKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTSelectPopupVariant timestamp](self, "timestamp");
  v8 = (id)objc_msgSend(v9, "_performVariantKey:timestamp:typingLog:", v7, v6);

}

- (id)shortDescription
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("select popup: %@ "), self->_intendedKey);
}

- (NSString)intendedKey
{
  return self->_intendedKey;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intendedKey, 0);
}

@end
