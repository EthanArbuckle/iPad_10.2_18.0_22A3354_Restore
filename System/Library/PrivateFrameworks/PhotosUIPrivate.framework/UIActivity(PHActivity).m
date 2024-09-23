@implementation UIActivity(PHActivity)

+ (id)ph_PhotosApplicationActivitiesTypePublish:()PHActivity
{
  void *v0;
  void *v1;
  uint64_t i;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t j;
  void *v9;
  void *v10;
  int v11;
  id obj;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  _QWORD v27[3];

  v27[1] = *MEMORY[0x1E0C80C00];
  +[PUActivityViewController photosApplicationActivities:](PUActivityViewController, "photosApplicationActivities:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = *MEMORY[0x1E0D7BC80];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v0;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v16)
  {
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(obj);
        v3 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v4 = v15;
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v5)
        {
          v6 = v5;
          v7 = *(_QWORD *)v18;
          do
          {
            for (j = 0; j != v6; ++j)
            {
              if (*(_QWORD *)v18 != v7)
                objc_enumerationMutation(v4);
              v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * j);
              objc_msgSend(v9, "activityType");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v10, "isEqualToString:", v3);

              if (v11)
                objc_msgSend(v1, "addObject:", v9);
            }
            v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v6);
        }

      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v16);
  }

  return v1;
}

+ (id)ph_PhotosApplicationActivityTypeOrder
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0C99DE8];
  +[PUActivityViewController defaultActivityTypeOrder](PUActivityViewController, "defaultActivityTypeOrder");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "arrayWithArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "insertObject:atIndex:", *MEMORY[0x1E0D7BE48], 2);
  return v2;
}

@end
