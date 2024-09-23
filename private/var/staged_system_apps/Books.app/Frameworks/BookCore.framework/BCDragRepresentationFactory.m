@implementation BCDragRepresentationFactory

+ (void)registerSceneRepresentationFromAssetDragInfo:(id)a3 withProvider:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char *v8;
  id v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[2];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "assetID"));
  v8 = (char *)objc_msgSend(v5, "contentType");
  if (objc_msgSend(v7, "length") && v8 != (_BYTE *)&dword_4 + 2 && v8 != (_BYTE *)&dword_4 + 1 && v8)
  {
    v9 = objc_msgSend(objc_alloc((Class)NSUserActivity), "initWithActivityType:", CFSTR("com.apple.iBooks.assetReading"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
    v11 = (void *)v10;
    v12 = &stru_296430;
    if (v10)
      v12 = (__CFString *)v10;
    v13 = v12;

    objc_msgSend(v9, "setTitle:", v13);
    v15[0] = CFSTR("assetID");
    v15[1] = BCBookDisplayTitle;
    v16[0] = v7;
    v16[1] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 2));

    objc_msgSend(v9, "setUserInfo:", v14);
    objc_msgSend(v6, "registerObject:visibility:", v9, 0);

  }
}

+ (BOOL)registerFileRepresentationFromAssetDragInfo:(id)a3 withProvider:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  char *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v27[4];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[2];
  _QWORD v33[2];

  v5 = a3;
  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localFileURL"));

  if (v7)
  {
    v7 = v5;
    v8 = sub_CCF40(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByDeletingPathExtension"));

    v11 = (char *)objc_msgSend(v7, "contentType");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localFileURL"));

    if (v11 == (_BYTE *)&dword_4 + 2)
    {
      v13 = sub_CC674(v12);
      v14 = objc_claimAutoreleasedReturnValue(v13);

      v12 = (void *)v14;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bu_utType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "preferredFilenameExtension"));

    if (v16)
    {
      v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathExtension:", v16));

      v10 = (void *)v17;
    }

    objc_msgSend(v6, "setSuggestedName:", v10);
    objc_msgSend(v6, "setPreferredPresentationStyle:", 2);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_CC448;
    v30[3] = &unk_28EE38;
    v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetID"));
    v31 = v18;
    objc_msgSend(v6, "registerItemForTypeIdentifier:loadHandler:", CFSTR("com.apple.iBooksX.BKLibraryAssetPasteboardType"), v30);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localFileURL"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bu_utType"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));

    if (!v21)
    {
      v32[0] = CFSTR("epub");
      v32[1] = CFSTR("ibooks");
      v33[0] = CFSTR("org.idpf.epub-folder");
      v33[1] = CFSTR("com.apple.ibooks-folder");
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 2));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "pathExtension"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lowercaseString"));

      v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", v24));
      if (v25)
      {
        v21 = (void *)v25;

      }
      else
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[BKAssetUtilities utiTypeForContentType:](BKAssetUtilities, "utiTypeForContentType:", +[BKAssetUtilities contentTypeForExtension:](BKAssetUtilities, "contentTypeForExtension:", v24)));

        if (!v21)
        {
          LOBYTE(v7) = 0;
          goto LABEL_11;
        }
      }
    }
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_CC52C;
    v27[3] = &unk_290A98;
    v28 = v19;
    v29 = v7;
    objc_msgSend(v6, "registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:", v21, 0, 0, v27);

    LOBYTE(v7) = 1;
LABEL_11:

  }
  return (char)v7;
}

+ (void)registerURLRepresentationFromAssetDragInfo:(id)a3 withProvider:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "storeID"));

  if (v7)
  {
    v8 = objc_opt_class(NSURL);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_CC924;
    v9[3] = &unk_290AC0;
    v10 = v5;
    objc_msgSend(v6, "registerObjectOfClass:visibility:loadHandler:", v8, 0, v9);

  }
}

+ (void)registerPlainTextRepresentationFromAssetDragInfo:(id)a3 withProvider:(id)a4
{
  id v5;
  NSMutableString *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = sub_CCB18(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeUTF8PlainText, "identifier"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_CCE20;
    v9[3] = &unk_290AE8;
    v10 = v7;
    objc_msgSend(v5, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v8, 0, v9);

  }
}

+ (void)registerRepresentationsFromAssetDragInfo:(id)a3 withProvider:(id)a4 canDragToNewCanvas:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = a5;
  v10 = a3;
  v7 = a4;
  v8 = sub_CCF40(v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v7, "setSuggestedName:", v9);

  objc_msgSend(v7, "setPreferredPresentationStyle:", 1);
  if (v5)
    +[BCDragRepresentationFactory registerSceneRepresentationFromAssetDragInfo:withProvider:](BCDragRepresentationFactory, "registerSceneRepresentationFromAssetDragInfo:withProvider:", v10, v7);
  if (!+[BCDragRepresentationFactory registerFileRepresentationFromAssetDragInfo:withProvider:](BCDragRepresentationFactory, "registerFileRepresentationFromAssetDragInfo:withProvider:", v10, v7))
  {
    +[BCDragRepresentationFactory registerURLRepresentationFromAssetDragInfo:withProvider:](BCDragRepresentationFactory, "registerURLRepresentationFromAssetDragInfo:withProvider:", v10, v7);
    +[BCDragRepresentationFactory registerPlainTextRepresentationFromAssetDragInfo:withProvider:](BCDragRepresentationFactory, "registerPlainTextRepresentationFromAssetDragInfo:withProvider:", v10, v7);
  }

}

+ (id)providerDataTypesForDragInfo:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localFileURL"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeUTF8PlainText, "identifier"));
    objc_msgSend(v4, "addObject:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "storeURL"));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeURL, "identifier"));
      objc_msgSend(v4, "addObject:", v8);

    }
  }
  v9 = objc_msgSend(v4, "copy");

  return v9;
}

+ (id)providerFileTypesForDragInfo:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localFileURL"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localFileURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bu_utType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));

    if (v8)
      objc_msgSend(v4, "addObject:", v8);

  }
  v9 = objc_msgSend(v4, "copy");

  return v9;
}

+ (id)dataForTypeIdentifier:(id)a3 dragInfo:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unsigned int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  unsigned int v16;
  NSMutableString *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v28[4];
  NSObject *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeURL, "identifier"));
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
  {
    v9 = dispatch_group_create();
    dispatch_group_enter(v9);
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = sub_CD3B8;
    v35 = sub_CD3C8;
    v36 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storeURL"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storeURL"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeURL, "identifier"));
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_CD3D0;
      v28[3] = &unk_290B10;
      v30 = &v31;
      v29 = v9;
      v13 = objc_msgSend(v11, "loadDataWithTypeIdentifier:forItemProviderCompletionHandler:", v12, v28);

      v14 = v29;
    }
    else
    {
      v19 = BCDragAndDropLog();
      v14 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_1B7058(v14, v20, v21, v22, v23, v24, v25, v26);
    }

    dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
    v18 = (id)v32[5];
    _Block_object_dispose(&v31, 8);

    goto LABEL_10;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeUTF8PlainText, "identifier"));
  v16 = objc_msgSend(v5, "isEqualToString:", v15);

  if (v16)
  {
    v17 = sub_CCB18(v6);
    v9 = objc_claimAutoreleasedReturnValue(v17);
    v18 = (id)objc_claimAutoreleasedReturnValue(-[NSObject dataUsingEncoding:](v9, "dataUsingEncoding:", 4));
LABEL_10:

    goto LABEL_11;
  }
  v18 = 0;
LABEL_11:

  return v18;
}

+ (id)fileURLForTypeIdentifier:(id)a3 dragInfo:(id)a4
{
  return objc_msgSend(a4, "localFileURL", a3);
}

@end
