@implementation _UIRelationshipTraitStorageRecord

- (_UIRelationshipTraitStorageRecord)initWithCoder:(id)a3
{
  id v4;
  _UIRelationshipTraitStorageRecord *v5;
  uint64_t v6;
  UITraitCollection *traitCollection;
  uint64_t v8;
  NSSet *addedObjects;
  uint64_t v10;
  NSSet *removedObjects;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_UIRelationshipTraitStorageRecord;
  v5 = -[_UIRelationshipTraitStorageRecord init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UITraitCollection"));
    v6 = objc_claimAutoreleasedReturnValue();
    traitCollection = v5->_traitCollection;
    v5->_traitCollection = (UITraitCollection *)v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIAddedObjects"));
    v8 = objc_claimAutoreleasedReturnValue();
    addedObjects = v5->_addedObjects;
    v5->_addedObjects = (NSSet *)v8;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UIRemovedObjects"));
    v10 = objc_claimAutoreleasedReturnValue();
    removedObjects = v5->_removedObjects;
    v5->_removedObjects = (NSSet *)v10;

  }
  return v5;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (NSSet)removedObjects
{
  return self->_removedObjects;
}

- (NSSet)addedObjects
{
  return self->_addedObjects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedObjects, 0);
  objc_storeStrong((id *)&self->_addedObjects, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
}

- (_UIRelationshipTraitStorageRecord)initWithTraitCollection:(id)a3 addedObjects:(id)a4 removedObjects:(id)a5
{
  id v9;
  id v10;
  id v11;
  _UIRelationshipTraitStorageRecord *v12;
  _UIRelationshipTraitStorageRecord *v13;
  uint64_t v14;
  NSSet *addedObjects;
  uint64_t v16;
  NSSet *removedObjects;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_UIRelationshipTraitStorageRecord;
  v12 = -[_UIRelationshipTraitStorageRecord init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_traitCollection, a3);
    v14 = objc_msgSend(v10, "copy");
    addedObjects = v13->_addedObjects;
    v13->_addedObjects = (NSSet *)v14;

    v16 = objc_msgSend(v11, "copy");
    removedObjects = v13->_removedObjects;
    v13->_removedObjects = (NSSet *)v16;

  }
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  UITraitCollection *traitCollection;
  id v5;

  traitCollection = self->_traitCollection;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", traitCollection, CFSTR("UITraitCollection"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_addedObjects, CFSTR("UIAddedObjects"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_removedObjects, CFSTR("UIRemovedObjects"));

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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; traitCollection=%@, addedObjects=%@, removedObjects=%@>"),
    v5,
    self,
    self->_traitCollection,
    self->_addedObjects,
    self->_removedObjects);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
