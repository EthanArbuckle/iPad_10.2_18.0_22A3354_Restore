@implementation BooksSpotlightIndexRequestHandler

- (void)searchableIndex:(id)a3 reindexAllSearchableItemsWithAcknowledgementHandler:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  id v7;
  NSObject *v8;
  uint64_t v9;

  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  v7 = sub_100002BA0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_100002F24((uint64_t)v5, v8, v9);

  v6[2](v6);
}

- (void)searchableIndex:(id)a3 reindexSearchableItemsWithIdentifiers:(id)a4 acknowledgementHandler:(id)a5
{
  id v7;
  id v8;
  void (**v9)(_QWORD);
  id v10;
  NSObject *v11;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  v10 = sub_100002BA0();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_100002F8C();

  v9[2](v9);
}

- (id)searchableIndexProvideDataForIndex:(id)a3 identifier:(id)a4 type:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  id v26;
  dispatch_time_t v27;
  id v28;
  void *v29;
  unsigned int v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __CFString *v39;
  id v40;
  id v41;
  unsigned __int8 v43;
  void *v44;
  unsigned int v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[4];
  NSObject *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100002BA0();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    sub_10000302C();

  v13 = objc_autoreleasePoolPush();
  v14 = sub_1000027EC(v8, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeURL, "identifier"));
  v17 = objc_msgSend(v10, "isEqualToString:", v16);

  if (!v17)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeUTF8PlainText, "identifier"));
    v30 = objc_msgSend(v10, "isEqualToString:", v29);

    if (!v30)
    {
      v41 = 0;
      goto LABEL_29;
    }
    v51 = v15;
    v53 = v13;
    v31 = v15;
    v32 = objc_alloc_init((Class)NSMutableArray);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "title"));
    if (objc_msgSend(v33, "length"))
      objc_msgSend(v32, "addObject:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "contentType"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeEPUB, "identifier"));
    if ((objc_msgSend(v34, "isEqualToString:", v35) & 1) != 0
      || (objc_msgSend(v34, "isEqualToString:", CFSTR("com.apple.ibooks-container")) & 1) != 0
      || (objc_msgSend(v34, "isEqualToString:", CFSTR("com.apple.ibooks")) & 1) != 0
      || (objc_msgSend(v34, "isEqualToString:", CFSTR("com.apple.ibooks-folder")) & 1) != 0)
    {

    }
    else
    {
      v43 = objc_msgSend(v34, "isEqualToString:", CFSTR("com.apple.m4a-audio"));

      if ((v43 & 1) == 0)
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePDF, "identifier"));
        v45 = objc_msgSend(v34, "isEqualToString:", v44);

        if (!v45)
          goto LABEL_20;
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "contributors"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "componentsJoinedByString:", CFSTR(", ")));

        if (objc_msgSend(v37, "length"))
          objc_msgSend(v32, "addObject:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePDF, "preferredFilenameExtension"));
        if (objc_msgSend(v38, "length"))
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "uppercaseString"));
          objc_msgSend(v32, "addObject:", v47);

        }
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "fileSize"));
        v50 = (uint64_t)objc_msgSend(v48, "longLongValue");

        if (v50 >= 1)
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:"));
          objc_msgSend(v32, "addObject:", v49);

        }
LABEL_19:

LABEL_20:
        if (objc_msgSend(v32, "count"))
          v39 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n")));
        else
          v39 = &stru_1000044B0;
        v13 = v53;

        v41 = (id)objc_claimAutoreleasedReturnValue(-[__CFString dataUsingEncoding:](v39, "dataUsingEncoding:", 4));
        v15 = v51;
        goto LABEL_29;
      }
    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "contributors"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "componentsJoinedByString:", CFSTR(", ")));

    if (objc_msgSend(v37, "length"))
      objc_msgSend(v32, "addObject:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "si_stringAttributeForKey:", CFSTR("com_apple_iBooks_storeURL")));
    if (objc_msgSend(v38, "length"))
      objc_msgSend(v32, "addObject:", v38);
    goto LABEL_19;
  }
  v52 = v13;
  v18 = v15;
  v19 = v15;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "si_stringAttributeForKey:", CFSTR("com_apple_iBooks_storeURL")));
  if (objc_msgSend(v20, "length")
    && (v21 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v20))) != 0)
  {
    v22 = (void *)v21;
    v23 = dispatch_group_create();
    dispatch_group_enter(v23);
    v57 = 0;
    v58 = &v57;
    v59 = 0x3032000000;
    v60 = sub_100002C10;
    v61 = sub_100002C20;
    v62 = 0;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeURL, "identifier"));
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_100002E98;
    v54[3] = &unk_1000042B0;
    v56 = &v57;
    v25 = v23;
    v55 = v25;
    v26 = objc_msgSend(v22, "loadDataWithTypeIdentifier:forItemProviderCompletionHandler:", v24, v54);

    v27 = dispatch_time(0, 20000000000);
    dispatch_group_wait(v25, v27);
    v28 = (id)v58[5];

    _Block_object_dispose(&v57, 8);
  }
  else
  {
    v40 = sub_100002BA0();
    v25 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_100002FEC(v25);
    v22 = 0;
    v28 = 0;
  }

  v41 = v28;
  v13 = v52;
  v15 = v18;
LABEL_29:

  objc_autoreleasePoolPop(v13);
  return v41;
}

- (id)searchableIndexProvideFileURLForIndex:(id)a3 identifier:(id)a4 type:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = sub_100002BA0();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    sub_10000308C();

  v13 = objc_autoreleasePoolPush();
  v14 = sub_1000027EC(v8, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "si_stringAttributeForKey:", CFSTR("com_apple_iBooks_localFileURL")));
  if (objc_msgSend(v16, "length"))
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v16));
  else
    v17 = 0;

  objc_autoreleasePoolPop(v13);
  return v17;
}

@end
