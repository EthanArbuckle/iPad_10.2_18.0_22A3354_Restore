@implementation BKLibraryUploadStatusNavigationController

- (int64_t)preferredStatusBarStyle
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  int64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryUploadStatusNavigationController childViewControllers](self, "childViewControllers", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v6), "preferredStatusBarStyle");
        if (v7)
        {
          v8 = (int64_t)v7;
          goto LABEL_11;
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

@end
