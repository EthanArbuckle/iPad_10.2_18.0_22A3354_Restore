@implementation FRArticleNotificationServiceArticleSource

- (FRArticleNotificationServiceArticleSource)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FRArticleNotificationServiceArticleSource;
  return -[FRArticleNotificationServiceArticleSource init](&v3, "init");
}

- (void)fetchAssetsWithCachesDirectory:(id)a3 thumbnailURLString:(id)a4 publisherLogoURLString:(id)a5 publisherLogoMaskURLString:(id)a6 publisherLogoCompactURLString:(id)a7 flintDocumentURLString:(id)a8 completion:(id)a9
{
  id v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  _QWORD *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD *v43;
  _BYTE *v44;
  _QWORD block[5];
  id v46;
  NSObject *v47;
  _QWORD v48[4];
  NSObject *v49;
  _QWORD *v50;
  _BYTE *v51;
  _QWORD v52[5];
  id v53;
  _QWORD v54[4];
  NSObject *v55;
  _QWORD *v56;
  _BYTE *v57;
  _QWORD v58[5];
  id v59;
  _QWORD v60[7];
  _QWORD v61[7];
  _QWORD v62[5];
  id v63;
  _QWORD v64[5];
  id v65;
  _QWORD v66[4];
  NSObject *v67;
  _QWORD *v68;
  _BYTE *v69;
  _QWORD v70[5];
  id v71;
  _BYTE buf[24];
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;

  v15 = a3;
  v36 = a4;
  v35 = a5;
  v33 = a6;
  v16 = (uint64_t (*)(uint64_t, uint64_t))a7;
  v34 = a8;
  v17 = a9;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v36;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v35;
    *(_WORD *)&buf[22] = 2112;
    v73 = v16;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "ArticleSource: Source URLs to download - %@, %@, %@", buf, 0x20u);
  }
  if (v15)
  {
    if (v17)
    {
LABEL_13:
      v18 = dispatch_group_create();
      dispatch_group_enter(v18);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v73 = sub_100006C2C;
      v74 = sub_100006C3C;
      v75 = 0;
      v70[0] = 0;
      v70[1] = v70;
      v70[2] = 0x3032000000;
      v70[3] = sub_100006C2C;
      v70[4] = sub_100006C3C;
      v71 = 0;
      v19 = v17;
      if (v36)
        v20 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:"));
      else
        v20 = 0;
      dispatch_group_enter(v18);
      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472;
      v66[2] = sub_100006C44;
      v66[3] = &unk_100024CF8;
      v68 = v70;
      v69 = buf;
      v21 = v18;
      v67 = v21;
      v32 = (void *)v20;
      -[FRArticleNotificationServiceArticleSource _downloadFileURL:toDirectory:withCompletion:](self, "_downloadFileURL:toDirectory:withCompletion:", v20, v15, v66);
      v64[0] = 0;
      v64[1] = v64;
      v64[2] = 0x3032000000;
      v64[3] = sub_100006C2C;
      v64[4] = sub_100006C3C;
      v65 = 0;
      v62[0] = 0;
      v62[1] = v62;
      v62[2] = 0x3032000000;
      v62[3] = sub_100006C2C;
      v62[4] = sub_100006C3C;
      v63 = 0;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      v17 = v19;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "traitCollection"));
      v24 = objc_msgSend(v23, "userInterfaceStyle");

      if (v24 == (id)2)
      {
        if (v33)
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:"));
        else
          v25 = 0;
        dispatch_group_enter(v21);
        v61[0] = _NSConcreteStackBlock;
        v61[1] = 3221225472;
        v61[2] = sub_100006D4C;
        v61[3] = &unk_100024CF8;
        v61[5] = v62;
        v61[6] = buf;
        v26 = v61;
        v61[4] = v21;
        -[FRArticleNotificationServiceArticleSource _downloadFileURL:toDirectory:withCompletion:](self, "_downloadFileURL:toDirectory:withCompletion:", v25, v15, v61);
      }
      else
      {
        if (v35)
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:"));
        else
          v25 = 0;
        dispatch_group_enter(v21);
        v60[0] = _NSConcreteStackBlock;
        v60[1] = 3221225472;
        v60[2] = sub_100006E54;
        v60[3] = &unk_100024CF8;
        v60[5] = v64;
        v60[6] = buf;
        v26 = v60;
        v60[4] = v21;
        -[FRArticleNotificationServiceArticleSource _downloadFileURL:toDirectory:withCompletion:](self, "_downloadFileURL:toDirectory:withCompletion:", v25, v15, v60);
      }

      v58[0] = 0;
      v58[1] = v58;
      v58[2] = 0x3032000000;
      v58[3] = sub_100006C2C;
      v58[4] = sub_100006C3C;
      v59 = 0;
      if (v16)
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:"));
      else
        v27 = 0;
      dispatch_group_enter(v21);
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_100006F5C;
      v54[3] = &unk_100024CF8;
      v56 = v58;
      v57 = buf;
      v28 = v21;
      v55 = v28;
      -[FRArticleNotificationServiceArticleSource _downloadFileURL:toDirectory:withCompletion:](self, "_downloadFileURL:toDirectory:withCompletion:", v27, v15, v54);
      v52[0] = 0;
      v52[1] = v52;
      v52[2] = 0x3032000000;
      v52[3] = sub_100006C2C;
      v52[4] = sub_100006C3C;
      v53 = 0;
      if (v34)
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:"));
      else
        v29 = 0;
      dispatch_group_enter(v28);
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_100007064;
      v48[3] = &unk_100024CF8;
      v50 = v52;
      v51 = buf;
      v30 = v28;
      v49 = v30;
      -[FRArticleNotificationServiceArticleSource _downloadFileURL:toDirectory:withCompletion:](self, "_downloadFileURL:toDirectory:withCompletion:", v29, v15, v48);
      dispatch_group_enter(v30);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000716C;
      block[3] = &unk_100024D20;
      block[4] = self;
      v46 = v15;
      v47 = v30;
      v31 = v30;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_100007198;
      v37[3] = &unk_100024D48;
      v39 = v70;
      v40 = v64;
      v41 = v62;
      v42 = v58;
      v43 = v52;
      v44 = buf;
      v38 = v19;
      dispatch_group_notify(v31, (dispatch_queue_t)&_dispatch_main_q, v37);

      dispatch_group_leave(v31);
      _Block_object_dispose(v52, 8);

      _Block_object_dispose(v58, 8);
      _Block_object_dispose(v62, 8);

      _Block_object_dispose(v64, 8);
      _Block_object_dispose(v70, 8);

      _Block_object_dispose(buf, 8);
      goto LABEL_32;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10001B300();
    if (v17)
    {
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v17 + 2))(v17, 0, 0, 0, 0, 0, 0);
      goto LABEL_32;
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10001B234();
  if (v15)
    goto LABEL_13;
LABEL_32:

}

- (void)_cleanupFilesInDirectory:(id)a3
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  __int128 v22;
  id v23;
  char *v24;
  uint64_t v25;
  void *j;
  void *v27;
  void *v28;
  unsigned int v29;
  id v30;
  __int128 v31;
  void *v32;
  void *v33;
  id obj;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  id v47;
  _BYTE v48[128];
  _BYTE v49[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "path"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if (v5)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", -86400.0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v32 = v3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "enumeratorAtPath:", v3));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = v7;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v41;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v41 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "fileAttributes"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", NSFileCreationDate));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "earlierDate:", v15));

          if (v16 == v15)
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "stringByAppendingPathComponent:", v13));
            objc_msgSend(v8, "addObject:", v17);
            v18 = objc_msgSend(v8, "count");

            if ((unint64_t)v18 > 9)
            {

              goto LABEL_13;
            }
          }

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_13:

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      v19 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 134217984;
      v45 = v19;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Trying to remove %lu files…", buf, 0xCu);
    }
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v20 = v8;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    if (v21)
    {
      v23 = v21;
      v24 = 0;
      v25 = *(_QWORD *)v37;
      *(_QWORD *)&v22 = 138412546;
      v31 = v22;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(_QWORD *)v37 != v25)
            objc_enumerationMutation(v20);
          v27 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)j);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v45 = v27;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Trying to remove %@…", buf, 0xCu);
          }
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager", v31));
          v35 = 0;
          v29 = objc_msgSend(v28, "removeItemAtPath:error:", v27, &v35);
          v30 = v35;

          if (v29)
          {
            ++v24;
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v31;
            v45 = v27;
            v46 = 2112;
            v47 = v30;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't remove file at path %@ - %@", buf, 0x16u);
          }

        }
        v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
      }
      while (v23);
    }
    else
    {
      v24 = 0;
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v45 = v24;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Removed %lu files", buf, 0xCu);
    }

    v3 = v32;
  }

}

- (void)_downloadFileURL:(id)a3 toDirectory:(id)a4 withCompletion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v7)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100007904;
    v16[3] = &unk_100024D98;
    v11 = v7;
    v17 = v11;
    v12 = v8;
    v18 = v12;
    v19 = v10;
    v13 = objc_retainBlock(v16);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v11;
      v22 = 2112;
      v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "ArticleSource: Starting download of %@ to %@", buf, 0x16u);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sharedSession](NSURLSession, "sharedSession"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "downloadTaskWithURL:completionHandler:", v11, v13));
    objc_msgSend(v15, "resume");

  }
  else if (v9)
  {
    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
  }

}

@end
