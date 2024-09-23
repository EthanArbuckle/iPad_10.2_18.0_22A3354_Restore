@implementation VUIMediaEntityFetchResponse

- (void)setSortIndexes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setMediaEntities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setGroupingSortIndexes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setGrouping:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)mediaEntities
{
  return self->_mediaEntities;
}

- (VUIMediaEntityFetchResponse)init
{
  VUIMediaEntityFetchResponse *v2;
  VUIMediaEntityFetchResponse *v3;
  NSArray *mediaEntities;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIMediaEntityFetchResponse;
  v2 = -[VUIMediaEntityFetchResponse init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    mediaEntities = v2->_mediaEntities;
    v2->_mediaEntities = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v3;
}

- (NSArray)grouping
{
  return self->_grouping;
}

- (BOOL)_updateWithResponse:(id)a3 changes:(id)a4 replaceContentsOnNilChanges:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[VUIMediaEntityFetchResponse mediaEntities](self, "mediaEntities");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v9, "mediaEntitiesChangeSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mediaEntities");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "vui_applyChangeSetIfAvailable:destinationObjects:replaceContentsOnNilChanges:", v12, v13, v5);

  if (v14)
  {
    -[VUIMediaEntityFetchResponse setMediaEntities:](self, "setMediaEntities:", v11);
    objc_msgSend(v8, "sortIndexes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIMediaEntityFetchResponse setSortIndexes:](self, "setSortIndexes:", v15);

  }
  -[VUIMediaEntityFetchResponse grouping](self, "grouping");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  objc_msgSend(v8, "grouping");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v17)
  {
    if (v18)
    {
      objc_msgSend(v9, "groupingChangeSet");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v17, "vui_applyChangeSetIfAvailable:destinationObjects:replaceContentsOnNilChanges:", v20, v19, v5);

      if (v21)
      {
        -[VUIMediaEntityFetchResponse setGrouping:](self, "setGrouping:", v17);
        objc_msgSend(v8, "groupingSortIndexes");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIMediaEntityFetchResponse setGroupingSortIndexes:](self, "setGroupingSortIndexes:", v22);

        LOBYTE(v14) = 1;
      }
    }
  }

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VUIMediaEntityFetchResponse *v4;
  uint64_t v5;
  NSArray *mediaEntities;
  uint64_t v7;
  NSArray *sortIndexes;
  uint64_t v9;
  NSArray *grouping;
  uint64_t v11;
  NSArray *groupingSortIndexes;

  v4 = objc_alloc_init(VUIMediaEntityFetchResponse);
  v5 = -[NSArray copy](self->_mediaEntities, "copy");
  mediaEntities = v4->_mediaEntities;
  v4->_mediaEntities = (NSArray *)v5;

  v7 = -[NSArray copy](self->_sortIndexes, "copy");
  sortIndexes = v4->_sortIndexes;
  v4->_sortIndexes = (NSArray *)v7;

  v9 = -[NSArray copy](self->_grouping, "copy");
  grouping = v4->_grouping;
  v4->_grouping = (NSArray *)v9;

  v11 = -[NSArray copy](self->_groupingSortIndexes, "copy");
  groupingSortIndexes = v4->_groupingSortIndexes;
  v4->_groupingSortIndexes = (NSArray *)v11;

  return v4;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[VUIMediaEntityFetchResponse mediaEntities](self, "mediaEntities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[VUIMediaEntityFetchResponse sortIndexes](self, "sortIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  -[VUIMediaEntityFetchResponse grouping](self, "grouping");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[VUIMediaEntityFetchResponse groupingSortIndexes](self, "groupingSortIndexes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  VUIMediaEntityFetchResponse *v4;
  VUIMediaEntityFetchResponse *v5;
  VUIMediaEntityFetchResponse *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  char v17;
  void *v18;
  void *v19;
  id v20;
  char v21;
  void *v22;
  void *v23;
  id v24;

  v4 = (VUIMediaEntityFetchResponse *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        -[VUIMediaEntityFetchResponse mediaEntities](self, "mediaEntities");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIMediaEntityFetchResponse mediaEntities](v6, "mediaEntities");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v7;
        v10 = v8;
        if (v9 == v10)
        {

        }
        else
        {
          v11 = v10;
          v12 = 0;
          if (!v9 || !v10)
            goto LABEL_29;
          v13 = objc_msgSend(v9, "isEqual:", v10);

          if ((v13 & 1) == 0)
            goto LABEL_22;
        }
        -[VUIMediaEntityFetchResponse sortIndexes](self, "sortIndexes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIMediaEntityFetchResponse sortIndexes](v6, "sortIndexes");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v14;
        v16 = v15;
        if (v9 == v16)
        {

        }
        else
        {
          v11 = v16;
          v12 = 0;
          if (!v9 || !v16)
            goto LABEL_29;
          v17 = objc_msgSend(v9, "isEqual:", v16);

          if ((v17 & 1) == 0)
            goto LABEL_22;
        }
        -[VUIMediaEntityFetchResponse grouping](self, "grouping");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIMediaEntityFetchResponse grouping](v6, "grouping");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v18;
        v20 = v19;
        if (v9 == v20)
        {

LABEL_24:
          -[VUIMediaEntityFetchResponse groupingSortIndexes](self, "groupingSortIndexes");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[VUIMediaEntityFetchResponse groupingSortIndexes](v6, "groupingSortIndexes");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v22;
          v24 = v23;
          v11 = v24;
          if (v9 == v24)
          {
            v12 = 1;
          }
          else
          {
            v12 = 0;
            if (v9 && v24)
              v12 = objc_msgSend(v9, "isEqual:", v24);
          }
          goto LABEL_29;
        }
        v11 = v20;
        v12 = 0;
        if (v9 && v20)
        {
          v21 = objc_msgSend(v9, "isEqual:", v20);

          if ((v21 & 1) == 0)
          {
LABEL_22:
            v12 = 0;
LABEL_30:

            goto LABEL_31;
          }
          goto LABEL_24;
        }
LABEL_29:

        goto LABEL_30;
      }
    }
    v12 = 0;
  }
LABEL_31:

  return v12;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v21;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21.receiver = self;
  v21.super_class = (Class)VUIMediaEntityFetchResponse;
  -[VUIMediaEntityFetchResponse description](&v21, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityFetchResponse mediaEntities](self, "mediaEntities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("mediaEntities"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityFetchResponse sortIndexes](self, "sortIndexes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("sortIndexes"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityFetchResponse grouping](self, "grouping");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("grouping"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v13);

  v14 = (void *)MEMORY[0x1E0CB3940];
  -[VUIMediaEntityFetchResponse groupingSortIndexes](self, "groupingSortIndexes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@=%@"), CFSTR("groupingSortIndexes"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v16);

  v17 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@>"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (NSArray)sortIndexes
{
  return self->_sortIndexes;
}

- (NSArray)groupingSortIndexes
{
  return self->_groupingSortIndexes;
}

- (BOOL)hasDataForCheckHasItemsOption
{
  return self->_hasDataForCheckHasItemsOption;
}

- (void)setHasDataForCheckHasItemsOption:(BOOL)a3
{
  self->_hasDataForCheckHasItemsOption = a3;
}

- (unint64_t)mediaEntitySubtype
{
  return self->_mediaEntitySubtype;
}

- (void)setMediaEntitySubtype:(unint64_t)a3
{
  self->_mediaEntitySubtype = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupingSortIndexes, 0);
  objc_storeStrong((id *)&self->_grouping, 0);
  objc_storeStrong((id *)&self->_sortIndexes, 0);
  objc_storeStrong((id *)&self->_mediaEntities, 0);
}

@end
