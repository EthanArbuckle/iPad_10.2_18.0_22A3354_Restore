@implementation RAPImageResponseStorage

+ (id)baseFilePathWithSubmissionIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFileManager baseSubmissionFilePath](RAPFileManager, "baseSubmissionFilePath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("rap_image_responses"), 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v3, 1));

  return v6;
}

- (BOOL)saveResponseData:(id)a3 forSubmissionIdentifier:(id)a4 imageIdentifier:(id)a5
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;

  v7 = a5;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[RAPImageResponseStorage baseFilePathWithSubmissionIdentifier:](RAPImageResponseStorage, "baseFilePathWithSubmissionIdentifier:", a4));
  v10 = +[RAPFileManager saveData:toDirectory:filename:](RAPFileManager, "saveData:toDirectory:filename:", v8, v9, v7);

  return v10;
}

- (id)fetchImageUploadObjectsForSubmissionIdentifier:(id)a3
{
  id v3;
  id v4;
  id v5;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  id v12;

  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_10067D488;
  v10 = &unk_1011BF7A0;
  v11 = a3;
  v12 = objc_alloc_init((Class)NSMutableArray);
  v3 = v12;
  v4 = v11;
  +[RAPImageResponseStorage enumerateOverResponseFilePathsForSubmissionIdentifier:usingBlock:](RAPImageResponseStorage, "enumerateOverResponseFilePathsForSubmissionIdentifier:usingBlock:", v4, &v7);
  v5 = objc_msgSend(v3, "copy", v7, v8, v9, v10);

  return v5;
}

- (BOOL)removeImageUploadObjectsForSubmissionIdentifier:(id)a3
{
  id v3;
  char v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10067D604;
  v6[3] = &unk_1011BF7C8;
  v6[4] = &v7;
  +[RAPImageResponseStorage enumerateOverResponseFilePathsForSubmissionIdentifier:usingBlock:](RAPImageResponseStorage, "enumerateOverResponseFilePathsForSubmissionIdentifier:usingBlock:", v3, v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

+ (void)enumerateOverResponseFilePathsForSubmissionIdentifier:(id)a3 usingBlock:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  _BYTE v26[128];

  v5 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[RAPImageResponseStorage baseFilePathWithSubmissionIdentifier:](RAPImageResponseStorage, "baseFilePathWithSubmissionIdentifier:", v5));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
  v25 = 0;
  v20 = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "contentsOfDirectoryAtPath:error:", v9, &v25));
  v19 = v25;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[RAPImageResponseStorage baseFilePathWithSubmissionIdentifier:](RAPImageResponseStorage, "baseFilePathWithSubmissionIdentifier:", v5, v19));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "URLByAppendingPathComponent:", v16));

        v6[2](v6, v16, v18);
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v13);
  }

}

@end
