@implementation EDLinksCollection

- (EDLinksCollection)init
{
  EDLinksCollection *v2;
  NSMutableArray *v3;
  NSMutableArray *mLinks;
  NSMutableArray *v5;
  NSMutableArray *mReferences;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)EDLinksCollection;
  v2 = -[EDLinksCollection init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mLinks = v2->mLinks;
    v2->mLinks = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mReferences = v2->mReferences;
    v2->mReferences = v5;

  }
  return v2;
}

- (unint64_t)addReference:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = a3;
  if (v4)
  {
    -[NSMutableArray addObject:](self->mReferences, "addObject:", v4);
    v5 = -[NSMutableArray count](self->mReferences, "count") - 1;
  }
  else
  {
    v5 = -1;
  }

  return v5;
}

- (unint64_t)addLink:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = a3;
  if (v4)
  {
    -[NSMutableArray addObject:](self->mLinks, "addObject:", v4);
    v5 = -[NSMutableArray count](self->mLinks, "count") - 1;
  }
  else
  {
    v5 = -1;
  }

  return v5;
}

- (id)referenceAtIndex:(unint64_t)a3
{
  void *v5;

  if (-[EDLinksCollection referencesCount](self, "referencesCount") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->mReferences, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (unint64_t)referencesCount
{
  return -[NSMutableArray count](self->mReferences, "count");
}

- (id)linkAtIndex:(unint64_t)a3
{
  void *v5;

  if (-[EDLinksCollection linksCount](self, "linksCount") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->mLinks, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (unint64_t)linksCount
{
  return -[NSMutableArray count](self->mLinks, "count");
}

- (BOOL)convertLinkReferenceIndex:(unint64_t)a3 firstSheetIndex:(unint64_t *)a4 lastSheetIndex:(unint64_t *)a5
{
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  *a4 = -1;
  *a5 = -1;
  -[EDLinksCollection referenceAtIndex:](self, "referenceAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDLinksCollection linkAtIndex:](self, "linkAtIndex:", objc_msgSend(v8, "linkIndex"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && objc_msgSend(v9, "type") == 1)
  {
    *a4 = objc_msgSend(v8, "firstSheetIndex");
    *a5 = objc_msgSend(v8, "lastSheetIndex");
    v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)addOrEquivalentLinkReferenceOfType:(int)a3 firstSheetIndex:(unint64_t)a4 lastSheetIndex:(unint64_t)a5
{
  void *v6;
  unint64_t v7;

  +[EDLinkReference linkReferenceWithLinkIndex:firstSheetIndex:lastSheetIndex:](EDLinkReference, "linkReferenceWithLinkIndex:firstSheetIndex:lastSheetIndex:", -[EDLinksCollection linkIndexCreateIfNeededWithType:](self, "linkIndexCreateIfNeededWithType:", *(_QWORD *)&a3), a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EDLinksCollection indexOfReference:](self, "indexOfReference:", v6);
  if (v7 == -1)
    v7 = -[EDLinksCollection addReference:](self, "addReference:", v6);

  return v7;
}

- (unint64_t)linkIndexCreateIfNeededWithType:(int)a3
{
  uint64_t v3;
  unint64_t v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  v5 = -[EDLinksCollection indexOfFirstLinkWithType:](self, "indexOfFirstLinkWithType:");
  if (v5 == -1)
  {
    +[EDLink linkWithType:](EDLink, "linkWithType:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[EDLinksCollection addLink:](self, "addLink:", v6);

  }
  return v5;
}

- (unint64_t)indexOfFirstLinkWithType:(int)a3
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  int v10;

  v5 = -[NSMutableArray count](self->mLinks, "count");
  if (!v5)
    return -1;
  v6 = v5;
  v7 = 0;
  while (1)
  {
    -[NSMutableArray objectAtIndex:](self->mLinks, "objectAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      v10 = objc_msgSend(v8, "type");

      if (v10 == a3)
        break;
    }
    if (v6 == ++v7)
      return -1;
  }
  return v7;
}

- (unint64_t)indexOfReference:(id)a3
{
  unint64_t result;

  result = -[NSMutableArray indexOfObject:](self->mReferences, "indexOfObject:", a3);
  if (result == 0x7FFFFFFFFFFFFFFFLL)
    return -1;
  return result;
}

- (unint64_t)addOrEquivalentInternalLinkReferenceWithFirstSheetIndex:(unint64_t)a3 lastSheetIndex:(unint64_t)a4
{
  return -[EDLinksCollection addOrEquivalentLinkReferenceOfType:firstSheetIndex:lastSheetIndex:](self, "addOrEquivalentLinkReferenceOfType:firstSheetIndex:lastSheetIndex:", 1, a3, a4);
}

- (void)addOrEquivalentExternalAddInName:(id)a3 linkReferenceIndex:(unint64_t *)a4 nameIndex:(unint64_t *)a5
{
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = -[EDLinksCollection addOrEquivalentLinkReferenceOfType:firstSheetIndex:lastSheetIndex:](self, "addOrEquivalentLinkReferenceOfType:firstSheetIndex:lastSheetIndex:", 3, 65534, 65534);
  *a4 = v8;
  if (v8 == -1)
  {
    *a5 = -1;
  }
  else
  {
    -[EDLinksCollection referenceAtIndex:](self, "referenceAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDLinksCollection linkAtIndex:](self, "linkAtIndex:", objc_msgSend(v9, "linkIndex"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "externalNames");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDString edStringWithString:](EDString, "edStringWithString:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *a5 = objc_msgSend(v11, "addOrEquivalentObject:", v12);

  }
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDLinksCollection;
  -[EDLinksCollection description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mReferences, 0);
  objc_storeStrong((id *)&self->mLinks, 0);
}

@end
