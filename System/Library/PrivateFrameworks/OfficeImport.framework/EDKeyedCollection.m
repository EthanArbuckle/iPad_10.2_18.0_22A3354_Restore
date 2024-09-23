@implementation EDKeyedCollection

- (unint64_t)addObject:(id)a3
{
  id v4;
  id v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)EDKeyedCollection;
  v5 = -[EDCollection addObject:](&v7, sel_addObject_, v4);
  if (v5 != (id)-1)
    -[EDKeyedCollection insertIntoMap:](self, "insertIntoMap:", v4);

  return (unint64_t)v5;
}

- (void)insertIntoMap:(id)a3
{
  id v4;
  OITSUIntegerKeyDictionary *v5;
  OITSUIntegerKeyDictionary *mMap;
  id v7;

  v4 = a3;
  v7 = v4;
  if (!self->mMap)
  {
    v5 = objc_alloc_init(OITSUIntegerKeyDictionary);
    mMap = self->mMap;
    self->mMap = v5;

    v4 = v7;
  }
  -[OITSUIntegerKeyDictionary setObject:forKey:](self->mMap, "setObject:forKey:", v7, objc_msgSend(v4, "key"));

}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  objc_super v7;

  v6 = a3;
  if (-[EDCollection count](self, "count") >= a4)
  {
    v7.receiver = self;
    v7.super_class = (Class)EDKeyedCollection;
    -[EDCollection insertObject:atIndex:](&v7, sel_insertObject_atIndex_, v6, a4);
    -[EDKeyedCollection insertIntoMap:](self, "insertIntoMap:", v6);
  }

}

- (id)objectWithKey:(int64_t)a3
{
  return -[OITSUIntegerKeyDictionary objectForKey:](self->mMap, "objectForKey:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EDKeyedCollection;
  v4 = -[EDCollection copyWithZone:](&v9, sel_copyWithZone_, a3);
  if (v4)
  {
    v5 = -[OITSUIntegerKeyDictionary mutableCopy](self->mMap, "mutableCopy");
    v6 = (void *)v4[2];
    v4[2] = v5;

    v7 = v4;
  }

  return v4;
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  void *v5;
  objc_super v6;

  if (-[EDCollection count](self, "count") > a3)
  {
    -[EDCollection objectAtIndex:](self, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDKeyedCollection removeFromMap:](self, "removeFromMap:", v5);

    v6.receiver = self;
    v6.super_class = (Class)EDKeyedCollection;
    -[EDCollection removeObjectAtIndex:](&v6, sel_removeObjectAtIndex_, a3);
  }
}

- (void)removeFromMap:(id)a3
{
  id v4;

  v4 = a3;
  -[OITSUIntegerKeyDictionary removeObjectForKey:](self->mMap, "removeObjectForKey:", objc_msgSend(v4, "key"));

}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v6;
  objc_super v7;

  v6 = a4;
  if (-[EDCollection count](self, "count") >= a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)EDKeyedCollection;
    -[EDCollection replaceObjectAtIndex:withObject:](&v7, sel_replaceObjectAtIndex_withObject_, a3, v6);
    -[EDKeyedCollection insertIntoMap:](self, "insertIntoMap:", v6);
  }

}

- (void)removeAllObjects
{
  OITSUIntegerKeyDictionary *mMap;
  objc_super v4;

  mMap = self->mMap;
  self->mMap = 0;

  v4.receiver = self;
  v4.super_class = (Class)EDKeyedCollection;
  -[EDCollection removeAllObjects](&v4, sel_removeAllObjects);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mMap, 0);
}

- (BOOL)isObjectInMap:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[EDKeyedCollection objectWithKey:](self, "objectWithKey:", objc_msgSend(v4, "key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v5 != 0;

  return (char)self;
}

- (BOOL)isOverwritingKeyOK
{
  return 0;
}

@end
