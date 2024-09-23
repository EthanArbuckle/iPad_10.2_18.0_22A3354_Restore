@implementation PCDLHandleForLibrary

void ___PCDLHandleForLibrary_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  _PCDLHandleForLibrary_handles = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, 0);
  v0 = dispatch_queue_create("PCDYLDLoaderQueue", 0);
  v1 = (void *)_PCDLHandleForLibrary_queue;
  _PCDLHandleForLibrary_queue = (uint64_t)v0;

}

void ___PCDLHandleForLibrary_block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  void *v16;
  const void *v17;
  id v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_msgSend(v2, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("framework")))
  {
    if (_PCFrameworkSearchPaths_onceToken != -1)
      dispatch_once(&_PCFrameworkSearchPaths_onceToken, &__block_literal_global_21);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v5 = (id)_PCFrameworkSearchPaths_paths;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "stringByAppendingPathComponent:", v2);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v4, "fileExistsAtPath:", v10) & 1) != 0)
          {
            objc_msgSend(v2, "stringByDeletingPathExtension");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "stringByAppendingPathComponent:", v16);
            v15 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_26;
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_24:

LABEL_29:
    v15 = 0;
    goto LABEL_30;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("dylib")))
  {
    if (_PCLibrarySearchPaths_onceToken != -1)
      dispatch_once(&_PCLibrarySearchPaths_onceToken, &__block_literal_global_27);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v5 = (id)_PCLibrarySearchPaths_paths;
    v11 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      while (2)
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "stringByAppendingPathComponent:", v2);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v4, "fileExistsAtPath:", v15) & 1) != 0)
          {
LABEL_26:

            goto LABEL_30;
          }

        }
        v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v12)
          continue;
        break;
      }
    }
    goto LABEL_24;
  }
  if (!objc_msgSend(v3, "isEqualToString:", &stru_1E8744B80))
    goto LABEL_29;
  v15 = v2;
LABEL_30:

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CFDictionaryGetValue((CFDictionaryRef)_PCDLHandleForLibrary_handles, *(const void **)(a1 + 32));
  v17 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (!v17)
  {
    v18 = objc_retainAutorelease(v15);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = dlopen((const char *)objc_msgSend(v18, "fileSystemRepresentation"), 5);
    v17 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *_PCDLHandleForLibrary(NSString *__strong)_block_invoke_2");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("PCUtilities.m"), 114, CFSTR("Unable to open framework '%@'"), v18);

      v17 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    }
  }
  CFDictionarySetValue((CFMutableDictionaryRef)_PCDLHandleForLibrary_handles, v15, v17);

}

@end
