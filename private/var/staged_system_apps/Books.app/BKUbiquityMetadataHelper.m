@implementation BKUbiquityMetadataHelper

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001664C0;
  block[3] = &unk_1008E7458;
  block[4] = a1;
  if (qword_1009F5130 != -1)
    dispatch_once(&qword_1009F5130, block);
  return (id)qword_1009F5128;
}

- (id)ubiquityMetadataForURL:(id)a3 options:(unint64_t)a4
{
  int v4;
  id v6;
  NSMutableDictionary *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;

  v4 = a4;
  v6 = a3;
  v7 = objc_opt_new(NSMutableDictionary);
  v8 = objc_autoreleasePoolPush();
  v9 = _CFURLPromiseCopyPhysicalURL(v6);
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = v6;
  v12 = v11;

  if ((v4 & 1) != 0)
  {
    -[BKUbiquityMetadataHelper _setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:](self, "_setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, BCMetadataXattrAssetID, BCMetadataXattrAssetID, v12);
    if ((v4 & 2) == 0)
    {
LABEL_6:
      if ((v4 & 4) == 0)
        goto LABEL_7;
      goto LABEL_29;
    }
  }
  else if ((v4 & 2) == 0)
  {
    goto LABEL_6;
  }
  -[BKUbiquityMetadataHelper _setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:](self, "_setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, BCMetadataXattrTitle, BCMetadataXattrTitle, v12);
  if ((v4 & 4) == 0)
  {
LABEL_7:
    if ((v4 & 8) == 0)
      goto LABEL_8;
    goto LABEL_30;
  }
LABEL_29:
  -[BKUbiquityMetadataHelper _setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:](self, "_setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, BCMetadataXattrSortTitle, BCMetadataXattrSortTitle, v12);
  if ((v4 & 8) == 0)
  {
LABEL_8:
    if ((v4 & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  -[BKUbiquityMetadataHelper _setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:](self, "_setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, BCMetadataXattrAuthor, BCMetadataXattrAuthor, v12);
  if ((v4 & 0x10) == 0)
  {
LABEL_9:
    if ((v4 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  -[BKUbiquityMetadataHelper _setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:](self, "_setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, BCMetadataXattrSortAuthor, BCMetadataXattrSortAuthor, v12);
  if ((v4 & 0x20) == 0)
  {
LABEL_10:
    if ((v4 & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  -[BKUbiquityMetadataHelper _setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:](self, "_setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, BCMetadataXattrGenre, BCMetadataXattrGenre, v12);
  if ((v4 & 0x40) == 0)
  {
LABEL_11:
    if ((v4 & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  -[BKUbiquityMetadataHelper _setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:](self, "_setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, BCMetadataXattrComments, BCMetadataXattrComments, v12);
  if ((v4 & 0x80) == 0)
  {
LABEL_12:
    if ((v4 & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  -[BKUbiquityMetadataHelper _setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:](self, "_setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, BCMetadataXattrBookDescription, BCMetadataXattrBookDescription, v12);
  if ((v4 & 0x100) == 0)
  {
LABEL_13:
    if ((v4 & 0x200) == 0)
      goto LABEL_14;
    goto LABEL_36;
  }
LABEL_35:
  -[BKUbiquityMetadataHelper _setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:](self, "_setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, BCMetadataXattrYear, BCMetadataXattrYear, v12);
  if ((v4 & 0x200) == 0)
  {
LABEL_14:
    if ((v4 & 0x400) == 0)
      goto LABEL_15;
    goto LABEL_37;
  }
LABEL_36:
  -[BKUbiquityMetadataHelper _setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:](self, "_setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, BCMetadataXattrExplicit, BCMetadataXattrExplicit, v12);
  if ((v4 & 0x400) == 0)
  {
LABEL_15:
    if ((v4 & 0x800) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_37:
  -[BKUbiquityMetadataHelper _setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:](self, "_setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, BCMetadataXattrLastOpened, BCMetadataXattrLastOpened, v12);
  if ((v4 & 0x800) == 0)
  {
LABEL_16:
    if ((v4 & 0x2000) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_38:
  -[BKUbiquityMetadataHelper _setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:](self, "_setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, BCMetadataXattrFirstOpened, BCMetadataXattrFirstOpened, v12);
  if ((v4 & 0x2000) == 0)
  {
LABEL_17:
    if ((v4 & 0x10000) == 0)
      goto LABEL_18;
    goto LABEL_40;
  }
LABEL_39:
  -[BKUbiquityMetadataHelper _setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:](self, "_setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, BCMetadataXattrRating, BCMetadataXattrRating, v12);
  if ((v4 & 0x10000) == 0)
  {
LABEL_18:
    if ((v4 & 0x40000) == 0)
      goto LABEL_19;
    goto LABEL_41;
  }
LABEL_40:
  -[BKUbiquityMetadataHelper _setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:](self, "_setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, BCMetadataXattrGeneration, BCMetadataXattrGeneration, v12);
  if ((v4 & 0x40000) == 0)
  {
LABEL_19:
    if ((v4 & 0x80000) == 0)
      goto LABEL_20;
    goto LABEL_42;
  }
LABEL_41:
  -[BKUbiquityMetadataHelper _setThumbnailInMutableDictionary:forKey:fromUrl:](self, "_setThumbnailInMutableDictionary:forKey:fromUrl:", v7, BCMetadataXattrThumbnail, v12);
  if ((v4 & 0x80000) == 0)
  {
LABEL_20:
    if ((v4 & 0x100000) == 0)
      goto LABEL_21;
    goto LABEL_43;
  }
LABEL_42:
  -[BKUbiquityMetadataHelper _setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:](self, "_setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, BCMetadataXattrIsSupplementalContent, BCMetadataXattrIsSupplementalContent, v12);
  if ((v4 & 0x100000) == 0)
  {
LABEL_21:
    if ((v4 & 0x200000) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_43:
  -[BKUbiquityMetadataHelper _setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:](self, "_setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, BCMetadataXattrStoreID, BCMetadataXattrStoreID, v12);
  if ((v4 & 0x200000) != 0)
LABEL_22:
    -[BKUbiquityMetadataHelper _setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:](self, "_setValueInMutableDictionary:forKey:withValueForExtendedAttributeNamed:fromUrl:", v7, BCMetadataXattrStorePlaylistID, BCMetadataXattrStorePlaylistID, v12);
LABEL_23:

  objc_autoreleasePoolPop(v8);
  if (-[NSMutableDictionary count](v7, "count"))
    v13 = v7;
  else
    v13 = 0;
  v14 = v13;

  return v14;
}

- (void)_setValueInMutableDictionary:(id)a3 forKey:(id)a4 withValueForExtendedAttributeNamed:(id)a5 fromUrl:(id)a6
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

- (void)_setThumbnailInMutableDictionary:(id)a3 forKey:(id)a4 fromUrl:(id)a5
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
  intptr_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  NSObject *v32;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(objc_alloc((Class)QLThumbnailGenerationRequest), "initWithFileAtURL:size:scale:representationTypes:", v9, 6, 1024.0, 1024.0, 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[QLThumbnailGenerator sharedGenerator](QLThumbnailGenerator, "sharedGenerator"));
  v12 = dispatch_semaphore_create(0);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100166A68;
  v28[3] = &unk_1008ECA00;
  v13 = v9;
  v29 = v13;
  v30 = v7;
  v31 = v8;
  v14 = v12;
  v32 = v14;
  v15 = v8;
  v16 = v7;
  objc_msgSend(v11, "generateBestRepresentationForRequest:completionHandler:", v10, v28);
  v17 = dispatch_time(0, 500000000);
  v18 = dispatch_semaphore_wait(v14, v17);
  if (v18)
  {
    v26 = BCUbiquityMetadataHelperLog(v18, v19, v20, v21, v22, v23, v24, v25);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_1006A2828((uint64_t)v13, v27);

  }
}

- (BOOL)setUbiquityMetadataForURL:(id)a3 withLibraryAsset:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  BOOL v49;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  uint64_t *v55;
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  char v60;
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  void *v64;

  v5 = a3;
  v6 = a4;
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = 0;
  v7 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "assetID"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  v17 = (void *)v9;
  v18 = v7;
  if (!v7)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
    v20 = objc_msgSend(v19, "length");
    if (v20)
    {
      v20 = objc_msgSend(objc_alloc((Class)NSURL), "initFileURLWithPath:", v19);
      v18 = v20;
    }
    else
    {
      v18 = 0;
    }
    v28 = BCUbiquityMetadataHelperLog(v20, v21, v22, v23, v24, v25, v26, v27);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 141558274;
      v62 = 1752392040;
      v63 = 2112;
      v64 = v18;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "[iCloudSync] Warning: setUbiquityMetadataForURL:withLibraryAsset: came without a URL.  Using the libraryAsset url: %{mask.hash}@", buf, 0x16u);
    }

  }
  if (v18 && v8 && v17)
  {
    v56 = 0;
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_100166E84;
    v51[3] = &unk_1008ECA50;
    v55 = &v57;
    v52 = v8;
    v53 = v17;
    v54 = v6;
    +[NSURL coordinateWritingItemAtURL:options:error:byAccessor:](NSURL, "coordinateWritingItemAtURL:options:error:byAccessor:", v18, 16, &v56, v51);
    v30 = v56;
    v38 = v30;
    if (v30)
    {
      v39 = BCUbiquityMetadataHelperLog(v30, v31, v32, v33, v34, v35, v36, v37);
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        sub_1006A2924();

    }
  }
  else
  {
    v41 = BCUbiquityMetadataHelperLog(v9, v10, v11, v12, v13, v14, v15, v16);
    v38 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      sub_1006A2984(v38, v42, v43, v44, v45, v46, v47, v48);
  }

  v49 = *((_BYTE *)v58 + 24) != 0;
  _Block_object_dispose(&v57, 8);

  return v49;
}

- (void)setUbiquityMetadataTitle:(id)a3 forURL:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  id v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  id v49;

  v5 = a3;
  v6 = a4;
  v14 = BCUbiquityMetadataHelperLog(v6, v7, v8, v9, v10, v11, v12, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v47 = v5;
    v48 = 2112;
    v49 = v6;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[iCloudSync] setUbiquityMetadataTitle title:%@ url:%@", buf, 0x16u);
  }

  if (v6)
  {
    v45 = 0;
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1001673E8;
    v43[3] = &unk_1008ECA78;
    v44 = v5;
    +[NSURL coordinateWritingItemAtURL:options:error:byAccessor:](NSURL, "coordinateWritingItemAtURL:options:error:byAccessor:", v6, 16, &v45, v43);
    v24 = v45;
    v32 = v24;
    if (v24)
    {
      v33 = BCUbiquityMetadataHelperLog(v24, v25, v26, v27, v28, v29, v30, v31);
      v34 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        sub_1006A2924();

    }
  }
  else
  {
    v35 = BCUbiquityMetadataHelperLog(v16, v17, v18, v19, v20, v21, v22, v23);
    v32 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      sub_1006A2984(v32, v36, v37, v38, v39, v40, v41, v42);
  }

}

- (void)setUbiquityMetadataIsSupplemental:(BOOL)a3 playlistID:(id)a4 storeID:(id)a5 forURL:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  id v33;
  BOOL v34;
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  id v39;
  __int16 v40;
  NSObject *v41;

  v9 = a4;
  v10 = a5;
  v18 = a6;
  if (v18)
  {
    v35 = 0;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100167698;
    v31[3] = &unk_1008ECAA0;
    v34 = a3;
    v32 = v9;
    v33 = v10;
    +[NSURL coordinateWritingItemAtURL:options:error:byAccessor:](NSURL, "coordinateWritingItemAtURL:options:error:byAccessor:", v18, 16, &v35, v31);
    v19 = v35;
    v27 = v19;
    if (v19)
    {
      v28 = BCUbiquityMetadataHelperLog(v19, v20, v21, v22, v23, v24, v25, v26);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 141558530;
        v37 = 1752392040;
        v38 = 2112;
        v39 = v18;
        v40 = 2112;
        v41 = v27;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "[iCloudSync] Error coordinateWritingItemAtURL:, URL: %{mask.hash}@, Error: %@", buf, 0x20u);
      }

    }
  }
  else
  {
    v30 = BCUbiquityMetadataHelperLog(0, v11, v12, v13, v14, v15, v16, v17);
    v27 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "[iCloudSync] Unable to write metadata because asset had no url was provided", buf, 2u);
    }
  }

}

- (void)_removeExtendedAttributeNamed:(id)a3 forUrl:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "bu_removeExtendedAttributeNamed:iCloudSyncable:", v5, 1);
  if ((v7 & 1) == 0)
  {
    v15 = BCUbiquityMetadataHelperLog(v7, v8, v9, v10, v11, v12, v13, v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1006A29B8((uint64_t)v5, (uint64_t)v6, v16);

  }
}

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end
