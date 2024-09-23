@implementation BKActivityCopyToIBooks

+ (int64_t)activityCategory
{
  return 0;
}

- (id)activityType
{
  return CFSTR("com.apple.iBooks.CopyInPlace");
}

- (id)activityTitle
{
  id v2;
  void *v3;
  void *v4;

  v2 = AEBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Copy to Books"), &stru_1C3088, 0));

  return v4;
}

- (id)activityImage
{
  return +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("CopyToiBooksLibrary"));
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_opt_class(NSURL);
        v9 = BUDynamicCast(v8, v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

        if (v10)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (void)prepareWithActivityItems:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_opt_class(NSURL);
        v11 = BUDynamicCast(v10, v9);
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (v12)
        {
          v13 = (void *)v12;
          -[BKActivityCopyToIBooks setUrl:](self, "setUrl:", v12, (_QWORD)v14);

          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)performActivity
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[2];
  _QWORD v20[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKActivityCopyToIBooks url](self, "url"));
  v18 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v4, 1, &v18));
  v6 = v18;

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKActivityCopyToIBooks url](self, "url"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v8, 0));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKActivityCopyToIBooks url](self, "url"));
    v17 = 0;
    v12 = objc_msgSend(v10, "copyItemAtURL:toURL:error:", v11, v9, &v17);

    if (v12)
    {
      v19[0] = UIApplicationOpenURLOptionsAnnotationKey;
      v19[1] = CFSTR("BKApplicationImportInPlaceKey");
      v20[0] = &__NSDictionary0__struct;
      v20[1] = &__kCFBooleanTrue;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "delegate"));

      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      objc_msgSend(v15, "application:openURL:options:", v16, v9, v13);

    }
  }
  -[BKActivityCopyToIBooks activityDidFinish:](self, "activityDidFinish:", 0);

}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
