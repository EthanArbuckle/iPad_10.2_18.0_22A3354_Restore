@implementation APManagedContendDataEnumerator

- (APManagedContendDataEnumerator)initWithManagedContext:(id)a3 contentDataItemIds:(id)a4
{
  id v7;
  id v8;
  APManagedContendDataEnumerator *v9;
  APManagedContendDataEnumerator *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[APManagedContendDataEnumerator init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_managedContext, a3);
    objc_storeStrong((id *)&v10->_contentDataItemIds, a4);
    -[APManagedContendDataEnumerator setCurrentContentDataItemIdIndex:](v10, "setCurrentContentDataItemIdIndex:", 0);
  }

  return v10;
}

- (id)nextObject
{
  APManagedContendDataEnumerator *i;
  unint64_t v3;
  void *v4;
  id v5;
  void *v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;

  for (i = self; ; self = i)
  {
    v3 = -[APManagedContendDataEnumerator currentContentDataItemIdIndex](self, "currentContentDataItemIdIndex");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContendDataEnumerator contentDataItemIds](i, "contentDataItemIds"));
    v5 = objc_msgSend(v4, "count");

    if (v3 >= (unint64_t)v5)
    {
      v10 = 0;
      return v10;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContendDataEnumerator contentDataItemIds](i, "contentDataItemIds"));
    v7 = -[APManagedContendDataEnumerator currentContentDataItemIdIndex](i, "currentContentDataItemIdIndex");
    -[APManagedContendDataEnumerator setCurrentContentDataItemIdIndex:](i, "setCurrentContentDataItemIdIndex:", v7 + 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContendDataEnumerator managedContext](i, "managedContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "managedContentDataForId:", v8));

    if (v10)
    {
      if (objc_msgSend(v10, "isAvailable"))
        break;
    }

  }
  return v10;
}

- (APManagedContext)managedContext
{
  return self->_managedContext;
}

- (NSArray)contentDataItemIds
{
  return self->_contentDataItemIds;
}

- (unint64_t)currentContentDataItemIdIndex
{
  return self->_currentContentDataItemIdIndex;
}

- (void)setCurrentContentDataItemIdIndex:(unint64_t)a3
{
  self->_currentContentDataItemIdIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentDataItemIds, 0);
  objc_storeStrong((id *)&self->_managedContext, 0);
}

@end
