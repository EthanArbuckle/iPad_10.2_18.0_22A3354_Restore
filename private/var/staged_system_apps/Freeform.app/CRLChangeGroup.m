@implementation CRLChangeGroup

- (CRLChangeGroup)initWithChangesArray:(id)a3
{
  id v5;
  CRLChangeGroup *v6;
  CRLChangeGroup *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLChangeGroup;
  v6 = -[CRLChangeGroup init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_changesArray, a3);

  return v7;
}

- (CRLChangeGroup)init
{
  id v3;
  CRLChangeGroup *v4;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = -[CRLChangeGroup initWithChangesArray:](self, "initWithChangesArray:", v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  Class v4;
  id v5;
  id v6;
  id v7;

  objc_opt_class(self, a2);
  v5 = [v4 alloc];
  v6 = -[NSMutableArray mutableCopy](self->_changesArray, "mutableCopy");
  v7 = objc_msgSend(v5, "initWithChangesArray:", v6);

  return v7;
}

- (NSArray)changesArray
{
  return (NSArray *)-[NSMutableArray copy](self->_changesArray, "copy");
}

- (void)registerChange:(unsigned int)a3 details:(id)a4 forChangeSource:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  NSMutableArray *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *i;
  void *v16;
  id v17;
  id v18;
  _TtC8Freeform15CRLChangeRecord *v19;
  CRLChangeEntry *v20;
  void *v21;
  CRLChangeEntry *v22;
  CRLChangeGroup *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _TtC8Freeform15CRLChangeRecord *v28;
  _BYTE v29[128];

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v23 = self;
  v10 = self->_changesArray;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "changeSource"));

        if (v17 == v9)
        {
          v18 = v16;

          v13 = v18;
        }
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  v19 = -[CRLChangeRecord initWithKind:details:]([_TtC8Freeform15CRLChangeRecord alloc], "initWithKind:details:", v6, v8);
  if (v13)
  {
    objc_msgSend(v13, "i_addChange:", v19);
  }
  else
  {
    v20 = [CRLChangeEntry alloc];
    v28 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v28, 1));
    v22 = -[CRLChangeEntry initWithChangeSource:changes:](v20, "initWithChangeSource:changes:", v9, v21);

    -[NSMutableArray addObject:](v23->_changesArray, "addObject:", v22);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changesArray, 0);
}

@end
