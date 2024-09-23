@implementation MPMediaItem

void __59__MPMediaItem_VideosUI___vui_imageIdentifierWithImageType___block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x1E0C99E60]);
  v1 = objc_msgSend(v0, "initWithObjects:", *MEMORY[0x1E0CC1E90], *MEMORY[0x1E0CC1ED0], 0);
  v2 = (void *)_vui_imageIdentifierWithImageType____propertiesToFetch;
  _vui_imageIdentifierWithImageType____propertiesToFetch = v1;

}

id __36__MPMediaItem_VideosUI__vui_credits__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "vui_stringForKey:", CFSTR("name"), (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

uint64_t __60__MPMediaItem_VideosUI__vui_isLocalCheckingSidebandLibrary___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "downloadState");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result == 2;
  return result;
}

uint64_t __54__MPMediaItem_VideosUI__vui_isDownloadedOrDownloading__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "downloadState");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (unint64_t)(result - 1) < 2;
  return result;
}

@end
