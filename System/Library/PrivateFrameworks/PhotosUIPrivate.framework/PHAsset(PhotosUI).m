@implementation PHAsset(PhotosUI)

+ (id)pu_typeStringForAssets:()PhotosUI
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a1, "pu_typeStringForMediaType:", objc_msgSend(a1, "_pu_mediaTypeForAssets:", v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "count");

  if (v6 != 1)
  {
    objc_msgSend(v5, "stringByAppendingString:", CFSTR("S"));
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  return v5;
}

+ (uint64_t)pu_commonMediaTypeForPhotoCount:()PhotosUI videoCount:otherCount:
{
  BOOL v8;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL || a4 == 0x7FFFFFFFFFFFFFFFLL || a5 != 0)
    return 0;
  if (a3 && !a4)
    return 1;
  if (a4)
    v8 = a3 == 0;
  else
    v8 = 0;
  if (v8)
    return 2;
  else
    return 0;
}

+ (uint64_t)_pu_mediaTypeForAssets:()PhotosUI
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v14;
    v8 = 1;
LABEL_3:
    v9 = 0;
    v10 = v6;
    while (1)
    {
      if (*(_QWORD *)v14 != v7)
        objc_enumerationMutation(v3);
      v11 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "mediaType", (_QWORD)v13);
      v6 = v11;
      if ((v8 & 1) == 0)
      {
        v6 = v10;
        if (v11 != v10)
          break;
      }
      v8 = 0;
      ++v9;
      v10 = v6;
      if (v5 == v9)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        v8 = 0;
        if (v5)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
  }
  v6 = 0;
LABEL_12:

  return v6;
}

+ (__CFString)pu_typeStringForMediaType:()PhotosUI
{
  if (a3 > 3)
    return 0;
  else
    return off_1E589AB78[a3];
}

@end
