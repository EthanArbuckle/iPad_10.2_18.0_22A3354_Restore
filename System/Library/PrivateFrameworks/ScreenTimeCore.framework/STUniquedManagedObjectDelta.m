@implementation STUniquedManagedObjectDelta

- (STUniquedManagedObjectDelta)initWithUniqueIdentifier:(id)a3
{
  id v4;
  STUniquedManagedObjectDelta *v5;
  uint64_t v6;
  NSString *uniqueIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STUniquedManagedObjectDelta;
  v5 = -[STUniquedManagedObjectDelta init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v6;

  }
  return v5;
}

- (void)inserted
{
  NSMutableSet *updatedProperties;

  updatedProperties = self->_updatedProperties;
  self->_changeType = 1;
  self->_updatedProperties = 0;

}

- (void)deleted
{
  NSMutableSet *updatedProperties;

  updatedProperties = self->_updatedProperties;
  self->_changeType = 3;
  self->_updatedProperties = 0;

}

- (void)updatedWithProperties:(id)a3
{
  id v4;
  NSMutableSet *updatedProperties;
  void *v6;
  NSMutableSet *v7;
  NSMutableSet *v8;
  NSMutableSet *v9;
  id v10;

  v4 = a3;
  if (self->_changeType != 1)
  {
    self->_changeType = 2;
    updatedProperties = self->_updatedProperties;
    v10 = v4;
    if (updatedProperties)
    {
      -[NSMutableSet setByAddingObjectsFromSet:](updatedProperties, "setByAddingObjectsFromSet:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (NSMutableSet *)objc_msgSend(v6, "mutableCopy");
      v8 = self->_updatedProperties;
      self->_updatedProperties = v7;

    }
    else
    {
      v9 = (NSMutableSet *)objc_msgSend(v4, "mutableCopy");
      v6 = self->_updatedProperties;
      self->_updatedProperties = v9;
    }

    v4 = v10;
  }

}

- (void)removePropertyWithName:(id)a3
{
  id v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_updatedProperties;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "name", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          -[NSMutableSet removeObject:](self->_updatedProperties, "removeObject:", v10);
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (NSMutableSet)updatedProperties
{
  return self->_updatedProperties;
}

- (void)setUpdatedProperties:(id)a3
{
  objc_storeStrong((id *)&self->_updatedProperties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedProperties, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
