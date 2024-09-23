@implementation _UITraitStorageList

- (id)topLevelObject
{
  return objc_loadWeakRetained(&self->_topLevelObject);
}

- (NSArray)traitStorages
{
  return self->_traitStorages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descendants, 0);
  objc_storeStrong((id *)&self->_traitStorages, 0);
  objc_destroyWeak(&self->_topLevelObject);
}

- (_UITraitStorageList)initWithCoder:(id)a3
{
  id v4;
  _UITraitStorageList *v5;
  void *v6;
  uint64_t v7;
  NSArray *traitStorages;
  uint64_t v9;
  NSSet *descendants;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UITraitStorageList;
  v5 = -[_UITraitStorageList init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UITopLevelObject"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&v5->_topLevelObject, v6);

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UITraitStorages"));
    v7 = objc_claimAutoreleasedReturnValue();
    traitStorages = v5->_traitStorages;
    v5->_traitStorages = (NSArray *)v7;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIDescendants"));
    v9 = objc_claimAutoreleasedReturnValue();
    descendants = v5->_descendants;
    v5->_descendants = (NSSet *)v9;

  }
  return v5;
}

- (_UITraitStorageList)initWithTopLevelObject:(id)a3 traitStorages:(id)a4 descendants:(id)a5
{
  id v9;
  id v10;
  id v11;
  _UITraitStorageList *v12;
  _UITraitStorageList *v13;
  uint64_t v14;
  NSArray *traitStorages;
  uint64_t v16;
  NSSet *descendants;
  void *v19;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v11, "containsObject:", v9))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITraitStorage.m"), 205, CFSTR("retained descendants should not include the top level object."));

  }
  v20.receiver = self;
  v20.super_class = (Class)_UITraitStorageList;
  v12 = -[_UITraitStorageList init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeWeak(&v12->_topLevelObject, v9);
    v14 = objc_msgSend(v10, "copy");
    traitStorages = v13->_traitStorages;
    v13->_traitStorages = (NSArray *)v14;

    v16 = objc_msgSend(v11, "copy");
    descendants = v13->_descendants;
    v13->_descendants = (NSSet *)v16;

  }
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id *p_topLevelObject;
  id WeakRetained;
  id v6;

  p_topLevelObject = &self->_topLevelObject;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(p_topLevelObject);
  objc_msgSend(v6, "encodeConditionalObject:forKey:", WeakRetained, CFSTR("UITopLevelObject"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_traitStorages, CFSTR("UITraitStorages"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_descendants, CFSTR("UIDescendants"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  id WeakRetained;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained(&self->_topLevelObject);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; topLevelObject=%@, traitStorages=%@, descendants=%@>"),
    v5,
    self,
    WeakRetained,
    self->_traitStorages,
    self->_descendants);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSSet)descendants
{
  return self->_descendants;
}

@end
