@implementation AVAsset

- (BOOL)bk_isAudible
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v3 = objc_opt_class(AVURLAsset);
  v4 = BUDynamicCast(v3, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URL"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pathExtension"));

  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("aa")) & 1) != 0)
    v8 = 1;
  else
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("aax"));

  return v8;
}

- (BOOL)bk_isAudibleContentAuthorized
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AVAsset tracksWithMediaType:](self, "tracksWithMediaType:", AVMediaTypeAudio, 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "hasAudibleBooksContent")
          && !objc_msgSend(v7, "isAudibleBooksContentAuthorized"))
        {
          v8 = 0;
          goto LABEL_12;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_12:

  return v8;
}

@end
