@implementation _UIAttributeTraitStorageRecord

- (_UIAttributeTraitStorageRecord)initWithTraitCollection:(id)a3 value:(id)a4
{
  id v7;
  id v8;
  _UIAttributeTraitStorageRecord *v9;
  _UIAttributeTraitStorageRecord *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_UIAttributeTraitStorageRecord;
  v9 = -[_UIAttributeTraitStorageRecord init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_traitCollection, a3);
    objc_storeStrong(&v10->_value, a4);
  }

  return v10;
}

- (_UIAttributeTraitStorageRecord)initWithCoder:(id)a3
{
  id v4;
  _UIAttributeTraitStorageRecord *v5;
  uint64_t v6;
  UITraitCollection *traitCollection;
  uint64_t v8;
  id value;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UIAttributeTraitStorageRecord;
  v5 = -[_UIAttributeTraitStorageRecord init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UITraitCollection"));
    v6 = objc_claimAutoreleasedReturnValue();
    traitCollection = v5->_traitCollection;
    v5->_traitCollection = (UITraitCollection *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIValue"));
    v8 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (id)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  UITraitCollection *traitCollection;
  id v5;

  traitCollection = self->_traitCollection;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", traitCollection, CFSTR("UITraitCollection"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("UIValue"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; traitCollection=%@, value=%@>"),
    v5,
    self,
    self->_traitCollection,
    self->_value);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

@end
