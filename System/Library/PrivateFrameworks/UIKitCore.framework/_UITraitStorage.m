@implementation _UITraitStorage

- (id)object
{
  return objc_loadWeakRetained(&self->_object);
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (id)records
{
  return self->_records;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_object);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_records, 0);
}

- (_UITraitStorage)initWithCoder:(id)a3
{
  id v4;
  _UITraitStorage *v5;
  void *v6;
  uint64_t v7;
  NSString *keyPath;
  uint64_t v9;
  NSMutableArray *records;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UITraitStorage;
  v5 = -[_UITraitStorage init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIObject"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&v5->_object, v6);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIKeyPath"));
    v7 = objc_claimAutoreleasedReturnValue();
    keyPath = v5->_keyPath;
    v5->_keyPath = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIRecords"));
    v9 = objc_claimAutoreleasedReturnValue();
    records = v5->_records;
    v5->_records = (NSMutableArray *)v9;

  }
  return v5;
}

- (_UITraitStorage)initWithObject:(id)a3 keyPath:(id)a4
{
  id v6;
  id v7;
  _UITraitStorage *v8;
  _UITraitStorage *v9;
  uint64_t v10;
  NSString *keyPath;
  NSMutableArray *v12;
  NSMutableArray *records;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_UITraitStorage;
  v8 = -[_UITraitStorage init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->_object, v6);
    v10 = objc_msgSend(v7, "copy");
    keyPath = v9->_keyPath;
    v9->_keyPath = (NSString *)v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    records = v9->_records;
    v9->_records = v12;

  }
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id *p_object;
  id WeakRetained;
  id v6;

  p_object = &self->_object;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(p_object);
  objc_msgSend(v6, "encodeConditionalObject:forKey:", WeakRetained, CFSTR("UIObject"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_keyPath, CFSTR("UIKeyPath"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_records, CFSTR("UIRecords"));

}

- (void)addRecord:(id)a3
{
  -[NSMutableArray addObject:](self->_records, "addObject:", a3);
}

- (void)applyRecordsMatchingTraitCollection:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITraitStorage.m"), 287, CFSTR("Abstract"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITraitStorage _propertyDescriptionString](self, "_propertyDescriptionString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_propertyDescriptionString
{
  void *v3;
  id WeakRetained;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  WeakRetained = objc_loadWeakRetained(&self->_object);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("object=%@, keyPath=%@, records=%@"), WeakRetained, self->_keyPath, self->_records);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
