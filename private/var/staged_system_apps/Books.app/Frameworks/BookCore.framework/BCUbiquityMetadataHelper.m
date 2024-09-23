@implementation BCUbiquityMetadataHelper

+ (id)xattrAssetIDForURL:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  if (a3)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "ubiquityMetadataForURL:options:needsCoordination:", a3, 1, 1));
    if (objc_msgSend(v3, "count"))
    {
      v4 = objc_opt_class(NSString);
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.apple.iBooks.assetID")));
      v6 = BUDynamicCast(v4, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)ubiquityMetadataForURL:(id)a3 options:(unint64_t)a4 needsCoordination:(BOOL)a5
{
  void *v5;

  if (a5)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_ubiquityCoordinatedReadMetadataForURL:options:", a3, a4));
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_ubiquityMetadataForURL:options:", a3, a4));
  return v5;
}

+ (id)_ubiquityCoordinatedReadMetadataForURL:(id)a3 options:(unint64_t)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v10[7];
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_130410;
  v16 = sub_130420;
  v17 = 0;
  v11 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_130428;
  v10[3] = &unk_291E38;
  v10[4] = &v12;
  v10[5] = a1;
  v10[6] = a4;
  +[NSURL coordinateReadingItemAtURL:options:error:byAccessor:](NSURL, "coordinateReadingItemAtURL:options:error:byAccessor:", v6, 4, &v11, v10);
  v7 = v11;
  v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v8;
}

+ (id)_ubiquityMetadataForURL:(id)a3 options:(unint64_t)a4
{
  int v4;
  id v6;
  NSMutableDictionary *v7;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;

  v4 = a4;
  v6 = a3;
  v7 = objc_opt_new(NSMutableDictionary);
  v8 = objc_autoreleasePoolPush();
  if ((v4 & 1) != 0)
  {
    objc_msgSend(a1, "setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, CFSTR("com.apple.iBooks.assetID"), CFSTR("com.apple.iBooks.assetID"), v6);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0)
        goto LABEL_4;
      goto LABEL_29;
    }
  }
  else if ((v4 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(a1, "setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, CFSTR("com.apple.iBooks.title"), CFSTR("com.apple.iBooks.title"), v6);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0)
      goto LABEL_5;
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(a1, "setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, CFSTR("com.apple.iBooks.sortTitle"), CFSTR("com.apple.iBooks.sortTitle"), v6);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(a1, "setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, CFSTR("com.apple.iBooks.author"), CFSTR("com.apple.iBooks.author"), v6);
  if ((v4 & 0x10) == 0)
  {
LABEL_6:
    if ((v4 & 0x20) == 0)
      goto LABEL_7;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(a1, "setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, CFSTR("com.apple.iBooks.sortAuthor"), CFSTR("com.apple.iBooks.sortAuthor"), v6);
  if ((v4 & 0x20) == 0)
  {
LABEL_7:
    if ((v4 & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(a1, "setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, CFSTR("com.apple.iBooks.genre"), CFSTR("com.apple.iBooks.genre"), v6);
  if ((v4 & 0x40) == 0)
  {
LABEL_8:
    if ((v4 & 0x80) == 0)
      goto LABEL_9;
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(a1, "setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, CFSTR("com.apple.iBooks.comments"), CFSTR("com.apple.iBooks.comments"), v6);
  if ((v4 & 0x80) == 0)
  {
LABEL_9:
    if ((v4 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(a1, "setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, CFSTR("com.apple.iBooks.bookDescription"), CFSTR("com.apple.iBooks.bookDescription"), v6);
  if ((v4 & 0x100) == 0)
  {
LABEL_10:
    if ((v4 & 0x200) == 0)
      goto LABEL_11;
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(a1, "setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, CFSTR("com.apple.iBooks.year"), CFSTR("com.apple.iBooks.year"), v6);
  if ((v4 & 0x200) == 0)
  {
LABEL_11:
    if ((v4 & 0x400) == 0)
      goto LABEL_12;
    goto LABEL_37;
  }
LABEL_36:
  objc_msgSend(a1, "setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, CFSTR("com.apple.iBooks.explicit"), CFSTR("com.apple.iBooks.explicit"), v6);
  if ((v4 & 0x400) == 0)
  {
LABEL_12:
    if ((v4 & 0x800) == 0)
      goto LABEL_13;
    goto LABEL_38;
  }
LABEL_37:
  objc_msgSend(a1, "setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, CFSTR("com.apple.iBooks.lastOpened"), CFSTR("com.apple.iBooks.lastOpened"), v6);
  if ((v4 & 0x800) == 0)
  {
LABEL_13:
    if ((v4 & 0x2000) == 0)
      goto LABEL_14;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(a1, "setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, CFSTR("com.apple.iBooks.firstOpened"), CFSTR("com.apple.iBooks.firstOpened"), v6);
  if ((v4 & 0x2000) == 0)
  {
LABEL_14:
    if ((v4 & 0x4000) == 0)
      goto LABEL_15;
    goto LABEL_40;
  }
LABEL_39:
  objc_msgSend(a1, "setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, CFSTR("com.apple.iBooks.rating"), CFSTR("com.apple.iBooks.rating"), v6);
  if ((v4 & 0x4000) == 0)
  {
LABEL_15:
    if ((v4 & 0x8000) == 0)
      goto LABEL_16;
    goto LABEL_41;
  }
LABEL_40:
  objc_msgSend(a1, "setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, CFSTR("com.apple.iBooks.readingLocation"), CFSTR("com.apple.iBooks.readingLocation"), v6);
  if ((v4 & 0x8000) == 0)
  {
LABEL_16:
    if ((v4 & 0x10000) == 0)
      goto LABEL_17;
    goto LABEL_42;
  }
LABEL_41:
  objc_msgSend(a1, "setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, CFSTR("com.apple.iBooks.highWaterMark"), CFSTR("com.apple.iBooks.highWaterMark"), v6);
  if ((v4 & 0x10000) == 0)
  {
LABEL_17:
    if ((v4 & 0x20000) == 0)
      goto LABEL_18;
    goto LABEL_43;
  }
LABEL_42:
  objc_msgSend(a1, "setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, CFSTR("com.apple.iBooks.generation"), CFSTR("com.apple.iBooks.generation"), v6);
  if ((v4 & 0x20000) == 0)
  {
LABEL_18:
    if ((v4 & 0x40000) == 0)
      goto LABEL_19;
    goto LABEL_44;
  }
LABEL_43:
  objc_msgSend(a1, "setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, CFSTR("com.apple.iBooks.optionFlags"), CFSTR("com.apple.iBooks.optionFlags"), v6);
  if ((v4 & 0x40000) == 0)
  {
LABEL_19:
    if ((v4 & 0x80000) == 0)
      goto LABEL_20;
    goto LABEL_45;
  }
LABEL_44:
  objc_msgSend(a1, "_setThumbnailInMutableDictionary:forKey:fromUrl:", v7, CFSTR("com.apple.iBooks.thumbnail"), v6);
  if ((v4 & 0x80000) == 0)
  {
LABEL_20:
    if ((v4 & 0x100000) == 0)
      goto LABEL_21;
    goto LABEL_46;
  }
LABEL_45:
  objc_msgSend(a1, "setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, CFSTR("com.apple.iBooks.isSupplementalContent"), CFSTR("com.apple.iBooks.isSupplementalContent"), v6);
  if ((v4 & 0x100000) == 0)
  {
LABEL_21:
    if ((v4 & 0x200000) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_46:
  objc_msgSend(a1, "setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, CFSTR("com.apple.iBooks.storeID"), CFSTR("com.apple.iBooks.storeID"), v6);
  if ((v4 & 0x200000) != 0)
LABEL_22:
    objc_msgSend(a1, "setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, CFSTR("com.apple.iBooks.storePlaylistID"), CFSTR("com.apple.iBooks.storePlaylistID"), v6);
LABEL_23:
  objc_autoreleasePoolPop(v8);
  if (-[NSMutableDictionary count](v7, "count"))
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  return v10;
}

+ (void)setValueInMutableDictionary:(id)a3 forKey:(id)a4 withValueForExtendedAttributeNamed:(id)a5 fromUrl:(id)a6
{
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a6, "bu_extendedAttributeNamed:iCloudSyncable:", a5, 1));
  if (v10)
    objc_msgSend(v11, "setObject:forKey:", v10, v9);

}

+ (BOOL)setExtendedAttributeNamed:(id)a3 toValue:(id)a4 forUrl:(id)a5
{
  id v7;
  id v8;
  id v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  int v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "length"))
  {
    v10 = objc_msgSend(v9, "bu_setExtendedAttributeNamed:value:iCloudSyncable:", v7, v8, 1);
    v11 = BCUbiquityMetadataHelperLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = v12;
    if ((v10 & 1) != 0)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v15 = 138544386;
        v16 = v7;
        v17 = 2160;
        v18 = 1752392040;
        v19 = 2112;
        v20 = v8;
        v21 = 2160;
        v22 = 1752392040;
        v23 = 2112;
        v24 = v9;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Successfully set extended attribute: [%{public}@ | %{mask.hash}@] for URL %{mask.hash}@", (uint8_t *)&v15, 0x34u);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = 138544386;
      v16 = v7;
      v17 = 2160;
      v18 = 1752392040;
      v19 = 2112;
      v20 = v8;
      v21 = 2160;
      v22 = 1752392040;
      v23 = 2112;
      v24 = v9;
      _os_log_error_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "Failed to set extended attribute: [%{public}@ | %{mask.hash}@]  for URL %{mask.hash}@", (uint8_t *)&v15, 0x34u);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (void)_setThumbnailInMutableDictionary:(id)a3 forKey:(id)a4 fromUrl:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  dispatch_semaphore_t v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  dispatch_time_t v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  NSObject *v30;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(objc_alloc((Class)QLThumbnailGenerationRequest), "initWithFileAtURL:size:scale:representationTypes:", v9, 6, 1024.0, 1024.0, 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[QLThumbnailGenerator sharedGenerator](QLThumbnailGenerator, "sharedGenerator"));
  v12 = dispatch_semaphore_create(0);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_130C24;
  v26[3] = &unk_291E60;
  v13 = v9;
  v27 = v13;
  v28 = v7;
  v29 = v8;
  v14 = v12;
  v30 = v14;
  v15 = v8;
  v16 = v7;
  objc_msgSend(v11, "generateBestRepresentationForRequest:completionHandler:", v10, v26);
  v17 = dispatch_time(0, 500000000);
  if (dispatch_semaphore_wait(v14, v17))
  {
    v18 = BCUbiquityMetadataHelperLog();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_1B82A8((uint64_t)v13, v19, v20, v21, v22, v23, v24, v25);

  }
}

+ (unint64_t)_generationForURL:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_ubiquityCoordinatedReadMetadataForURL:options:", a3, 0x10000));
  v4 = objc_opt_class(NSString);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("com.apple.iBooks.generation")));
  v6 = BUDynamicCast(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(v7, "length"))
  {
    v9 = objc_msgSend(v7, "longLongValue");
    if (v9)
      v8 = (unint64_t)v9;
  }

  return v8;
}

+ (id)dateFormatter
{
  if (qword_311350 != -1)
    dispatch_once(&qword_311350, &stru_291E80);
  return (id)qword_311348;
}

+ (id)metadataDateFromString:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dateFormatter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dateFromString:", v4));

  return v6;
}

+ (BOOL)replaceFileAndUpdateMetadata:(id)a3 metadata:(id)a4 error:(id *)a5 fileWritingBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  NSMutableDictionary *v24;
  id v25;
  id v26;
  NSObject *v27;
  _QWORD v29[4];
  NSMutableDictionary *v30;
  id v31;
  id v32;
  uint64_t *v33;
  _QWORD *v34;
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  _QWORD v40[3];
  char v41;
  _QWORD v42[2];
  _QWORD v43[2];

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v41 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 1;
  if (v11)
    v13 = (NSMutableDictionary *)objc_msgSend(v11, "mutableCopy");
  else
    v13 = objc_opt_new(NSMutableDictionary);
  v14 = v13;
  v15 = objc_msgSend(a1, "_generationForURL:", v10);
  if (v15 == (id)0x7FFFFFFFFFFFFFFFLL)
    v16 = 1;
  else
    v16 = (uint64_t)v15 + 1;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringValue"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v18, CFSTR("com.apple.iBooks.generation"));

  v42[0] = CFSTR("BCUbiqityFileChangedKeyURL");
  v42[1] = CFSTR("BCUbiqityFileChangedKeyGeneration");
  v43[0] = v10;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v16));
  v43[1] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 2));

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v21, "postNotificationName:object:userInfo:", CFSTR("BCUbiqityFileGenerationDidChangeNotification"), a1, v20);

  v22 = objc_msgSend(objc_alloc((Class)NSFileCoordinator), "initWithFilePresenter:", 0);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_131224;
  v29[3] = &unk_291ED0;
  v33 = &v36;
  v23 = v12;
  v32 = v23;
  v34 = v40;
  v24 = v14;
  v30 = v24;
  v35 = a1;
  v25 = v10;
  v31 = v25;
  objc_msgSend(v22, "coordinateWritingItemAtURL:options:error:byAccessor:", v25, 0, a5, v29);
  if (*((_BYTE *)v37 + 24))
  {
    v26 = BCUbiquityMetadataHelperLog();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_1B8390();

  }
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(v40, 8);

  return a5 == 0;
}

@end
