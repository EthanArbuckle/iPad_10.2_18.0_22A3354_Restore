@implementation PLAllowedForCameraPreviewSortDescriptors

void ___PLAllowedForCameraPreviewSortDescriptors_block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[PLFetchingAlbum sortDescriptorsForAlbumKind:](PLFetchingAlbum, "sortDescriptorsForAlbumKind:", 1613);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = v0;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v7, "key", (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          v9 = (void *)MEMORY[0x1E0CB3928];
          objc_msgSend(v7, "key");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "sortDescriptorWithKey:ascending:", v10, objc_msgSend(v7, "ascending") ^ 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v1, "addObject:", v11);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

  v12 = (void *)_PLAllowedForCameraPreviewSortDescriptors_s_descriptors;
  _PLAllowedForCameraPreviewSortDescriptors_s_descriptors = (uint64_t)v1;

}

@end
