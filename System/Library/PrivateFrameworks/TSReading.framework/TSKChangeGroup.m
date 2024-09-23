@implementation TSKChangeGroup

- (TSKChangeGroup)init
{
  TSKChangeGroup *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSKChangeGroup;
  v2 = -[TSKChangeGroup init](&v4, sel_init);
  if (v2)
    v2->mChangesArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKChangeGroup;
  -[TSKChangeGroup dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());

  v4[1] = (id)-[NSMutableArray mutableCopy](self->mChangesArray, "mutableCopy");
  return v4;
}

- (void)registerChange:(int)a3 details:(id)a4 forChangeSource:(id)a5
{
  uint64_t v7;
  NSMutableArray *mChangesArray;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  TSKChangeEntry *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v7 = *(_QWORD *)&a3;
  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  mChangesArray = self->mChangesArray;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChangesArray, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v10)
    goto LABEL_11;
  v11 = v10;
  v12 = 0;
  v13 = *(_QWORD *)v18;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v18 != v13)
        objc_enumerationMutation(mChangesArray);
      v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
      if ((id)objc_msgSend(v15, "changeSource") == a5)
        v12 = (void *)objc_msgSend(v15, "changes");
    }
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChangesArray, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  }
  while (v11);
  if (!v12)
  {
LABEL_11:
    v12 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v16 = -[TSKChangeEntry initWithChangeSource:changes:]([TSKChangeEntry alloc], "initWithChangeSource:changes:", a5, v12);
    -[NSMutableArray addObject:](self->mChangesArray, "addObject:", v16);

  }
  objc_msgSend(v12, "addObject:", +[TSKChangeRecord changeRecordWithKind:details:](TSKChangeRecord, "changeRecordWithKind:details:", v7, a4));
  if ((unint64_t)objc_msgSend(v12, "count") >= 2 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a5, "coalesceChanges:", v12);
}

- (NSMutableArray)changesArray
{
  return self->mChangesArray;
}

@end
