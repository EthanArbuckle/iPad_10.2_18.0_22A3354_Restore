@implementation EDSortedCollection

- (unint64_t)addObject:(id)a3
{
  return -[EDSortedCollection addObject:overrideDuplicate:](self, "addObject:overrideDuplicate:", a3, 0);
}

- (unint64_t)addObject:(id)a3 overrideDuplicate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_super v14;
  objc_super v15;
  objc_super v16;

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "key");
  v8 = -[EDCollection count](self, "count");
  if (v8)
  {
    while (1)
    {
      v9 = v8 - 1;
      -[EDCollection objectAtIndex:](self, "objectAtIndex:", v8 - 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        v12 = objc_msgSend(v10, "key");
        if (v7 >= v12)
          break;
      }

      --v8;
      if (!v9)
        goto LABEL_5;
    }
    v16.receiver = self;
    v16.super_class = (Class)EDSortedCollection;
    -[EDKeyedCollection insertObject:atIndex:](&v16, sel_insertObject_atIndex_, v6, v8);
    if (v4 && v7 == v12)
    {
      v15.receiver = self;
      v15.super_class = (Class)EDSortedCollection;
      -[EDKeyedCollection removeObjectAtIndex:](&v15, sel_removeObjectAtIndex_, v8 - 1);
    }

  }
  else
  {
LABEL_5:
    v14.receiver = self;
    v14.super_class = (Class)EDSortedCollection;
    -[EDKeyedCollection insertObject:atIndex:](&v14, sel_insertObject_atIndex_, v6, 0);
    v8 = 0;
  }

  return v8;
}

@end
