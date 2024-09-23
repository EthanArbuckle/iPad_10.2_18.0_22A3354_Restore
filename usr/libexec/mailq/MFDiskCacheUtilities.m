@implementation MFDiskCacheUtilities

+ (id)_pathsForContentWithType:(unint64_t)a3
{
  char v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = v4;
  if ((v3 & 2) != 0)
    objc_msgSend(v4, "addObject:", CFSTR("/Attachments"));
  if ((v3 & 1) != 0)
    objc_msgSend(v5, "addObject:", CFSTR("/Messages"));
  return v5;
}

+ (void)_enumerateContentsForAccounts:(id)a3 withType:(unint64_t)a4 handler:(id)a5
{
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  void *v15;
  BOOL v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *i;
  id v21;
  void *v22;
  id obj;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  _BYTE v41[128];
  _BYTE v42[128];

  v21 = a3;
  v24 = a5;
  if (!v24)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MFDiskCacheUtilities.m"), 102, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_pathsForContentWithType:", a4));
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v35 = 0u;
  v36 = 0u;
  v34 = 0u;
  v33 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "ef_flatMap:", &stru_1000189A8));
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v19)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v11 = v22;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v30;
          while (2)
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(_QWORD *)v30 != v13)
                objc_enumerationMutation(v11);
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)j)));
              v25[0] = _NSConcreteStackBlock;
              v25[1] = 3221225472;
              v25[2] = sub_10000AAE0;
              v25[3] = &unk_100018A10;
              v27 = v24;
              v26 = v9;
              v28 = &v37;
              objc_msgSend(v26, "mf_enumerateAtPath:withBlock:", v15, v25);
              v16 = *((_BYTE *)v38 + 24) == 0;

              if (!v16)
              {

                goto LABEL_20;
              }
            }
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
            if (v12)
              continue;
            break;
          }
        }

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v18);
  }
LABEL_20:

  _Block_object_dispose(&v37, 8);
}

+ (void)_enumeratePurgeableContentsWithType:(unint64_t)a3 handler:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MailAccount purgeableAccounts](MailAccount, "purgeableAccounts"));
  objc_msgSend(a1, "_enumerateContentsForAccounts:withType:handler:", v6, a3, v7);

}

+ (void)_enumerateContentPathsAndAttributes:(id)a3
{
  void (**v5)(id, void *, void *, void *, _BYTE *);
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v5 = (void (**)(id, void *, void *, void *, _BYTE *))a3;
  if (!v5)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MFDiskCacheUtilities.m"), 136, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileHandler"));

  }
  v6 = MFMailDirectory();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "enumeratorAtPath:", v7));
  v15 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nextObject"));
  if (v10)
  {
    do
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", v10));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "attributesOfItemAtPath:error:", v11, 0));
      v5[2](v5, v8, v11, v12, &v15);

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nextObject"));
      if (!v13)
        break;
      v10 = v13;
    }
    while (!v15);

  }
}

+ (id)systemSpaceWithError:(id *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = MFMailDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v13 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "attributesOfFileSystemForPath:error:", v6, &v13));
  v8 = v13;

  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", NSFileSystemSize));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", NSFileSystemFreeSize));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v9, CFSTR("MFFileSystemTotalSize"), v10, CFSTR("MFFileSystemFreeSize"), 0));

  }
  else
  {
    v11 = 0;
    if (a3 && v8)
    {
      v11 = 0;
      *a3 = objc_retainAutorelease(v8);
    }
  }

  return v11;
}

+ (id)mailSpaceWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000B110;
  v10[3] = &unk_100018A38;
  v10[4] = &v23;
  v10[5] = &v11;
  v10[6] = &v15;
  v10[7] = &v19;
  objc_msgSend(a1, "_enumerateContentPathsAndAttributes:", v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v24[3]));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v16[3]));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v12[3]));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v20[3]));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v4, CFSTR("MFMailTotalCacheSize"), v5, CFSTR("MFMailMessageCacheSize"), v6, CFSTR("MFMailAttachmentCacheSize"), v7, CFSTR("MFMailHeaderCacheSize"), 0));

  if (a3)
    *a3 = 0;
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  return v8;
}

+ (int64_t)sizeForPurgeableTemporaryDirectoryContent
{
  int64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000B2B0;
  v4[3] = &unk_100018A60;
  v4[4] = &v5;
  objc_msgSend(a1, "_enumeratePurgeableFileInTemporaryDirectoryWithHandler:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

+ (int64_t)deletePlaceholderAttachments
{
  return (int64_t)objc_msgSend(a1, "deletePlaceholderAttachmentsWithCreationDateOver:", 30);
}

+ (int64_t)deletePlaceholderAttachmentsWithCreationDateOver:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  int64_t v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MFAttachmentPlaceholder placeholderDirectory](MFAttachmentPlaceholder, "placeholderDirectory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 16, -a3, v7, 0));

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000B514;
  v13[3] = &unk_100018A88;
  v14 = v8;
  v16 = &v17;
  v9 = v5;
  v15 = v9;
  v10 = v8;
  objc_msgSend(v9, "mf_enumerateAtPath:withBlock:", v4, v13);
  v11 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

+ (int64_t)deleteTemporaryDirectoryContent
{
  int64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000B690;
  v4[3] = &unk_100018A60;
  v4[4] = &v5;
  objc_msgSend(a1, "_enumeratePurgeableFileInTemporaryDirectoryWithHandler:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

+ (void)_enumeratePurgeableFileInTemporaryDirectoryWithHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v5 = a3;
  if (!v5)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MFDiskCacheUtilities.m"), 256, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 64, -30, v7, 0));

  v9 = NSTemporaryDirectory();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000B968;
  v15[3] = &unk_100018AB0;
  v12 = v8;
  v16 = v12;
  v13 = v5;
  v17 = v13;
  objc_msgSend(v11, "mf_enumerateAtPath:withBlock:", v10, v15);

}

+ (void)deleteLocalAttachments
{
  objc_msgSend(a1, "_enumeratePurgeableContentsWithType:handler:", 2, &stru_100018AF0);
}

+ (void)deleteLocalMessages
{
  objc_msgSend(a1, "_enumerateContentPathsAndAttributes:", &stru_100018B10);
}

@end
