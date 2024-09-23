@implementation PLPhotoStreamAlbum

- (void)awakeFromInsert
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLPhotoStreamAlbum;
  -[PLGenericAlbum awakeFromInsert](&v3, sel_awakeFromInsert);
  -[PLGenericAlbum setKindValue:](self, "setKindValue:", 1500);
}

- (BOOL)shouldDeleteWhenEmpty
{
  return 0;
}

- (void)addAssetOrderedByDataTaken:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;

  v22 = a3;
  -[PLManagedAlbum mutableAssets](self, "mutableAssets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dateCreated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "count");
  if (v6 && v5)
  {
    v7 = v6;
    v8 = v6 - 1;
    objc_msgSend(v4, "objectAtIndex:", v6 - 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateCreated");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "compare:", v5);

    if (v11 == -1)
    {
      v20 = v4;
      v21 = v22;
    }
    else
    {
      if ((v8 & 0x8000000000000000) != 0)
      {
        v17 = -(uint64_t)((unint64_t)(1 - v7) >> 1);
      }
      else
      {
        v12 = 0;
        v13 = 0;
        v14 = v8;
        do
        {
          v15 = v13;
          v16 = v14 - v12;
          if (v14 < v12)
            ++v16;
          v17 = v12 + (v16 >> 1);
          objc_msgSend(v4, "objectAtIndex:", v17);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "dateCreated");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "compare:", v5);

          if (v19 == 1)
          {
            v14 = v17 - 1;
          }
          else
          {
            if (v19 != -1)
              break;
            v12 = ++v17;
          }
        }
        while (v12 <= v14);

      }
      v21 = v22;
      v20 = v4;
      if ((v17 & (unint64_t)~(v17 >> 63)) <= v8)
      {
        objc_msgSend(v4, "insertObject:atIndex:", v22);
        goto LABEL_20;
      }
    }
    objc_msgSend(v20, "addObject:", v21);
LABEL_20:

    goto LABEL_21;
  }
  objc_msgSend(v4, "addObject:", v22);
LABEL_21:

}

+ (id)photoStreamAlbumWithStreamID:(id)a3 inPhotoLibrary:(id)a4 createIfNeeded:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  id v31;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v5 = a5;
  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(v9, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(a1, "entityInManagedObjectContext:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEntity:", v13);

  v42 = 0;
  objc_msgSend(v11, "executeFetchRequest:error:", v12, &v42);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v42;
  if (!v14)
    goto LABEL_30;
  if ((unint64_t)objc_msgSend(v14, "count") < 2)
  {
    if (objc_msgSend(v14, "count") == 1)
    {
      objc_msgSend(v14, "lastObject");
      v25 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    if (v5)
    {
      if (PLIsAssetsd())
      {
        objc_msgSend(v9, "createPhotoStreamAlbumWithStreamID:", v8);
      }
      else
      {
        objc_msgSend(v9, "assetsdClient");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "cloudInternalClient");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "createPhotostreamAlbumWithStreamID:", v8);

      }
      +[PLPhotoStreamAlbum photoStreamAlbumWithStreamID:inPhotoLibrary:createIfNeeded:](PLPhotoStreamAlbum, "photoStreamAlbumWithStreamID:inPhotoLibrary:createIfNeeded:", v8, v9, 0);
      v25 = objc_claimAutoreleasedReturnValue();
LABEL_26:
      v19 = (void *)v25;
      if (!v8)
        goto LABEL_31;
      goto LABEL_27;
    }
LABEL_30:
    v19 = 0;
    goto LABEL_31;
  }
  v33 = v15;
  v35 = v12;
  v36 = v10;
  v37 = v9;
  NSLog(CFSTR("WARNING: The Photo Library found more than one Photo Stream album while looking for %@"), v8);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v34 = v14;
  v16 = v14;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v39 != v20)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v22, "personID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v23 = 0;
        }
        NSLog(CFSTR("Found Album with Person ID %@"), v23);
        if (objc_msgSend(v23, "isEqualToString:", v8))
        {
          v24 = v22;

          v19 = v24;
        }

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v18);
  }
  else
  {
    v19 = 0;
  }

  v10 = v36;
  v9 = v37;
  v12 = v35;
  v15 = v33;
  v14 = v34;
  if (v8)
  {
LABEL_27:
    if (!v19)
      goto LABEL_31;
    objc_msgSend(v19, "personID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isEqualToString:", v8);

    if ((v29 & 1) != 0)
      goto LABEL_31;
    objc_msgSend(v19, "personID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("WARNING: Photo Stream album streamID %@ different than streamID requested %@"), v30, v8);

    goto LABEL_30;
  }
LABEL_31:

  objc_autoreleasePoolPop(v10);
  if (v14)
    v31 = v19;
  else
    v31 = 0;

  return v31;
}

+ (id)entityName
{
  return CFSTR("PhotoStreamAlbum");
}

+ (id)keyPathsForValuesAffectingPersonID
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("title"));
}

@end
