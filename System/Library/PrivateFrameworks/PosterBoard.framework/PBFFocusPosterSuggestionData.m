@implementation PBFFocusPosterSuggestionData

- (PBFFocusPosterSuggestionData)initWithPreviews:(id)a3 previewsToSnapshotsMapTable:(id)a4
{
  id v6;
  id v7;
  PBFFocusPosterSuggestionData *v8;
  uint64_t v9;
  NSArray *previews;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PBFFocusPosterSuggestionData;
  v8 = -[PBFFocusPosterSuggestionData init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    previews = v8->_previews;
    v8->_previews = (NSArray *)v9;

    objc_storeStrong((id *)&v8->_previewsToSnapshotsMapTable, a4);
  }

  return v8;
}

- (unint64_t)count
{
  return -[NSArray count](self->_previews, "count");
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_previews, "objectAtIndexedSubscript:", a3);
}

- (id)previewForUniqueIdentifier:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
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
  v5 = self->_previews;
  v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "previewUniqueIdentifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)snapshotForPoster:(id)a3
{
  return -[NSMapTable objectForKey:](self->_previewsToSnapshotsMapTable, "objectForKey:", a3);
}

- (NSArray)previews
{
  return self->_previews;
}

- (NSMapTable)previewsToSnapshotsMapTable
{
  return self->_previewsToSnapshotsMapTable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewsToSnapshotsMapTable, 0);
  objc_storeStrong((id *)&self->_previews, 0);
}

@end
