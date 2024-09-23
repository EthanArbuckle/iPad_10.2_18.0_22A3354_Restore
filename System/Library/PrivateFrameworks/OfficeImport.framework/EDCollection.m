@implementation EDCollection

- (EDCollection)init
{
  EDCollection *v2;
  NSMutableArray *v3;
  NSMutableArray *mObjects;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EDCollection;
  v2 = -[EDCollection init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mObjects = v2->mObjects;
    v2->mObjects = v3;

  }
  return v2;
}

- (unint64_t)addObject:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = a3;
  if (v4)
  {
    -[NSMutableArray addObject:](self->mObjects, "addObject:", v4);
    if (objc_msgSend(v4, "conformsToProtocol:", &unk_255B380F0))
      objc_msgSend(v4, "setDoNotModify:", 1);
    v5 = -[NSMutableArray count](self->mObjects, "count") - 1;
  }
  else
  {
    v5 = -1;
  }

  return v5;
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->mObjects, "count");
}

- (unint64_t)addOrEquivalentObject:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = a3;
  v5 = -[EDCollection indexOfObject:](self, "indexOfObject:", v4);
  if (v5 == -1)
    v5 = -[EDCollection addObject:](self, "addObject:", v4);

  return v5;
}

- (unint64_t)indexOfObject:(id)a3
{
  unint64_t result;

  result = -[NSMutableArray indexOfObject:](self->mObjects, "indexOfObject:", a3);
  if (result == 0x7FFFFFFFFFFFFFFFLL)
    return -1;
  return result;
}

- (id)objectAtIndex:(unint64_t)a3
{
  void *v5;

  if (-[NSMutableArray count](self->mObjects, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->mObjects, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  id v6;

  v6 = a3;
  if (-[NSMutableArray count](self->mObjects, "count") >= a4)
    -[NSMutableArray insertObject:atIndex:](self->mObjects, "insertObject:atIndex:", v6, a4);

}

+ (id)collection
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (BOOL)isEqual:(id)a3
{
  EDCollection *v4;
  EDCollection *v5;
  BOOL v6;

  v4 = (EDCollection *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[EDCollection isEqualToCollection:](self, "isEqualToCollection:", v5);

  return v6;
}

- (BOOL)isEqualToCollection:(id)a3
{
  return -[NSMutableArray isEqualToArray:](self->mObjects, "isEqualToArray:", *((_QWORD *)a3 + 1));
}

- (unint64_t)hash
{
  return -[NSMutableArray count](self->mObjects, "count");
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;

  v5 = objc_alloc_init((Class)objc_opt_class());
  if (v5
    && (v6 = -[NSMutableArray mutableCopyWithZone:](self->mObjects, "mutableCopyWithZone:", a3),
        v7 = (void *)v5[1],
        v5[1] = v6,
        v7,
        v5[1]))
  {
    v8 = v5;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (EDCollection)initWithObject:(id)a3
{
  id v4;
  EDCollection *v5;
  EDCollection *v6;

  v4 = a3;
  v5 = -[EDCollection init](self, "init");
  v6 = v5;
  if (v5)
    -[NSMutableArray addObject:](v5->mObjects, "addObject:", v4);

  return v6;
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  if (-[NSMutableArray count](self->mObjects, "count") > a3)
    -[NSMutableArray removeObjectAtIndex:](self->mObjects, "removeObjectAtIndex:", a3);
}

+ (EDCollection)collectionWithObject:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithObject:", v3);

  return (EDCollection *)v4;
}

- (void)removeAllObjects
{
  -[NSMutableArray removeAllObjects](self->mObjects, "removeAllObjects");
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v6;

  v6 = a4;
  if (-[NSMutableArray count](self->mObjects, "count") >= a3)
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->mObjects, "replaceObjectAtIndex:withObject:", a3, v6);

}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDCollection;
  -[EDCollection description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mObjects, 0);
}

@end
