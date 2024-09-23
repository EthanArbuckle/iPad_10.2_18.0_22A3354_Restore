@implementation PFServerPosterPath(PBFUtilities)

- (id)pbf_sha256Hash
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t k;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  CC_SHA256_CTX c;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  unsigned __int8 md[32];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17A3580]();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "instanceURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, 0, 8, &__block_literal_global_93);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if ((objc_msgSend(v11, "hasDirectoryPath") & 1) == 0 && (objc_msgSend(v11, "pbf_isPosterSnapshot") & 1) == 0)
        {
          objc_msgSend(v11, "path");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "containsString:", CFSTR(".com.apple.posterkit.provider.contents.configurableOptions.plist"));

          if ((v13 & 1) == 0)
            objc_msgSend(v3, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sortedArrayUsingComparator:", &__block_literal_global_97);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    memset(&c, 0, sizeof(c));
    CC_SHA256_Init(&c);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v29 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j), 8, 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "pbf_sha256Hash");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = objc_retainAutorelease(v22);
          CC_SHA256_Update(&c, (const void *)objc_msgSend(v23, "UTF8String"), objc_msgSend(v23, "length"));

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
      }
      while (v18);
    }

    CC_SHA256_Final(md, &c);
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 64);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    for (k = 0; k != 32; ++k)
      objc_msgSend(v24, "appendFormat:", CFSTR("%02x"), md[k]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v26 = 0;
  }

  objc_autoreleasePoolPop(v2);
  return v26;
}

- (uint64_t)pbf_ambientConfiguration
{
  return objc_msgSend(MEMORY[0x1E0D7FB50], "loadAmbientConfigurationForPath:error:", a1, 0);
}

@end
