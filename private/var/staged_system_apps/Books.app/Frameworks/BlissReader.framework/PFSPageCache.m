@implementation PFSPageCache

- (PFSPageCache)init
{
  PFSPageCache *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PFSPageCache;
  v2 = -[PFSPageCache init](&v4, "init");
  if (v2)
  {
    v2->mMasterPages = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->mPages = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PFSPageCache;
  -[PFSPageCache dealloc](&v3, "dealloc");
}

- (id)addMasterPageWithName:(id)a3
{
  PFSPage *v5;

  v5 = objc_alloc_init(PFSPage);
  -[NSMutableDictionary setObject:forKey:](self->mMasterPages, "setObject:forKey:", v5, a3);

  return v5;
}

- (id)masterPageWithName:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->mMasterPages, "objectForKey:", a3);
}

- (id)findMasterSlotWithId:(id)a3
{
  NSMutableDictionary *mMasterPages;
  id result;
  id v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  mMasterPages = self->mMasterPages;
  result = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](mMasterPages, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (result)
  {
    v7 = result;
    v8 = *(_QWORD *)v11;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v8)
        objc_enumerationMutation(mMasterPages);
      result = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mMasterPages, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9)), "slotWithId:", a3);
      if (result)
        break;
      if (v7 == (id)++v9)
      {
        result = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](mMasterPages, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        v7 = result;
        if (result)
          goto LABEL_3;
        return result;
      }
    }
  }
  return result;
}

- (id)addPage
{
  PFSPage *v3;

  v3 = objc_alloc_init(PFSPage);
  -[NSMutableArray addObject:](self->mPages, "addObject:", v3);

  return v3;
}

- (id)pageWithIndex:(unint64_t)a3
{
  if ((unint64_t)-[NSMutableArray count](self->mPages, "count") <= a3)
    return 0;
  else
    return -[NSMutableArray objectAtIndex:](self->mPages, "objectAtIndex:", a3);
}

- (unint64_t)pageCount
{
  return (unint64_t)-[NSMutableArray count](self->mPages, "count");
}

- (id)latestPage
{
  return -[NSMutableArray lastObject](self->mPages, "lastObject");
}

- (id)findSlotWithId:(id)a3 pageIndex:(unint64_t *)a4
{
  PFSPageCache *v6;
  unint64_t v7;
  id result;

  v6 = self;
  v7 = *a4;
  while (v7 < -[PFSPageCache pageCount](self, "pageCount"))
  {
    result = objc_msgSend(-[PFSPageCache pageWithIndex:](v6, "pageWithIndex:", *a4), "slotWithId:", a3);
    if (result)
      return result;
    v7 = *a4 + 1;
    *a4 = v7;
    self = v6;
  }
  return 0;
}

@end
