@implementation CNContact(PhotoLibraryServices)

+ (id)pl_findBestMatchingContactFromMatchingContacts:()PhotoLibraryServices firstName:lastName:contactFormatter:
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v9, "count") == 1)
  {
    objc_msgSend(v9, "firstObject");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v24 = v9;
  v14 = v9;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v18);
        if (!v12)
        {
          v13 = v19;
          if (v13)
            goto LABEL_25;
          goto LABEL_22;
        }
        objc_msgSend(v12, "stringFromContact:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v18));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v10)
        {
          if (!objc_msgSend(v20, "containsString:", v10))
            goto LABEL_21;
          v13 = v19;
          if (v11)
          {
LABEL_16:
            if (!objc_msgSend(v21, "containsString:", v11))
            {

LABEL_21:
              goto LABEL_22;
            }
            v22 = v19;

            v13 = v22;
          }
        }
        else
        {
          v13 = 0;
          if (v11)
            goto LABEL_16;
        }

        if (v13)
          goto LABEL_25;
LABEL_22:
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v16);
  }
  v13 = 0;
LABEL_25:

  v9 = v24;
LABEL_26:

  return v13;
}

@end
