@implementation SDAirDropHandlerPhotos

- (SDAirDropHandlerPhotos)initWithTransfer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SDAirDropHandlerPhotos;
  return -[SDAirDropHandler initWithTransfer:bundleIdentifier:](&v4, "initWithTransfer:bundleIdentifier:", a3, CFSTR("com.apple.mobileslideshow"));
}

- (BOOL)canHandleTransfer
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  char v15;
  BOOL v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  if (!-[SDAirDropHandler isJustFiles](self, "isJustFiles"))
    return 0;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metaData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "items"));

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "type"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "type"));
        v13 = SFIsPhotosAssetBundle();

        if (v13)
        {
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subtype"));

          v11 = (void *)v14;
        }
        if (!self->_hasPhotos)
          self->_hasPhotos = SFIsImage(v11);
        if (!self->_hasVideos)
          self->_hasVideos = SFIsVideo(v11);
        if ((SFIsImage(v11) & 1) != 0)
        {

        }
        else
        {
          v15 = SFIsVideo(v11) | v13;

          if ((v15 & 1) == 0)
          {
            v16 = 0;
            goto LABEL_21;
          }
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v7)
        continue;
      break;
    }
  }
  v16 = 1;
LABEL_21:

  return v16;
}

- (int64_t)transferTypes
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SDAirDropHandlerPhotos;
  return (unint64_t)-[SDAirDropHandler transferTypes](&v3, "transferTypes") | 0x200;
}

- (id)suitableContentsDescription
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _BOOL8 hasPhotos;
  BOOL hasVideos;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler senderName](self, "senderName"));
  v17 = -[SDAirDropHandler totalSharedItemsCount](self, "totalSharedItemsCount");
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "metaData"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "items"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metaData"));
  v5 = objc_msgSend(v4, "senderIsMe");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metaData"));
  v8 = objc_msgSend(v7, "isVerifiableIdentity");
  hasPhotos = self->_hasPhotos;
  hasVideos = self->_hasVideos;
  v11 = -[SDAirDropHandler isModernProgress](self, "isModernProgress");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  BYTE1(v15) = v11;
  LOBYTE(v15) = hasVideos;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDAirDropHandlerPhotos suitableContentsDescriptionWithSenderName:itemsCount:items:senderIsMe:isVerifiableIdentity:hasPhotos:hasVideos:isModernProgress:transferState:](SDAirDropHandlerPhotos, "suitableContentsDescriptionWithSenderName:itemsCount:items:senderIsMe:isVerifiableIdentity:hasPhotos:hasVideos:isModernProgress:transferState:", v18, v17, v16, v5, v8, hasPhotos, v15, objc_msgSend(v12, "transferState")));

  return v13;
}

+ (id)suitableContentsDescriptionWithSenderName:(id)a3 itemsCount:(int64_t)a4 items:(id)a5 senderIsMe:(BOOL)a6 isVerifiableIdentity:(BOOL)a7 hasPhotos:(BOOL)a8 hasVideos:(BOOL)a9 isModernProgress:(BOOL)a10 transferState:(unint64_t)a11
{
  _BOOL4 v11;
  _BOOL8 v12;
  _BOOL4 v13;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *i;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void **v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  NSString *v45;
  uint64_t v46;
  void *v47;
  id v49;
  int64_t v50;
  int64_t v51;
  id v52;
  _BOOL4 v53;
  id v54;
  _BOOL4 v55;
  _BOOL4 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  const __CFString *v61;
  void *v62;
  void *v63;
  const __CFString *v64;
  void *v65;
  void *v66;
  const __CFString *v67;
  void *v68;
  const __CFString *v69;
  void *v70;
  _QWORD v71[2];
  _BYTE v72[128];

  v11 = a8;
  v12 = a7;
  v13 = a6;
  v17 = a3;
  v18 = a5;
  v20 = v18;
  if (!v11 || !a9)
  {
    if (v11)
    {
      v31 = a1;
      v56 = v13;
      v64 = CFSTR("PHOTO");
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
      v65 = v32;
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1));
      v66 = v33;
      v34 = &v66;
    }
    else
    {
      if (!a9)
      {
        v36 = 0;
LABEL_31:
        v46 = SFLocalizedStringForKey(v36, v19);
        v44 = (void *)objc_claimAutoreleasedReturnValue(v46);
        if (!a10)
          goto LABEL_35;
        goto LABEL_32;
      }
      v31 = a1;
      v56 = v13;
      v61 = CFSTR("VIDEO");
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
      v62 = v32;
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1));
      v63 = v33;
      v34 = &v63;
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 1));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "alertMessageLocalizedKeyForTypeDicts:senderIsMe:isVerifiableIdentity:isModernProgress:transferState:", v35, v56, v12, a10, a11));

    goto LABEL_31;
  }
  v52 = a1;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
  v54 = v17;
  v53 = v12;
  v55 = v13;
  if (v21)
  {
    v22 = v21;
    v23 = 0;
    a4 = 0;
    v24 = *(_QWORD *)v58;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(_QWORD *)v58 != v24)
          objc_enumerationMutation(v20);
        v26 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)i);
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "type"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "type"));
        v29 = SFIsPhotosAssetBundle();

        if (v29)
        {
          v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "subtype"));

          v27 = (void *)v30;
        }
        if (SFIsImage(v27))
        {
          v23 += (uint64_t)objc_msgSend(v26, "count");
        }
        else if (SFIsVideo(v27))
        {
          a4 += (int64_t)objc_msgSend(v26, "count");
        }

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
    }
    while (v22);
  }
  else
  {
    v23 = 0;
    a4 = 0;
  }
  v69 = CFSTR("PHOTO");
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v23));
  v70 = v37;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1));
  v71[0] = v38;
  v67 = CFSTR("VIDEO");
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v68 = v39;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1));
  v71[1] = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v71, 2));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "alertMessageLocalizedKeyForTypeDicts:senderIsMe:isVerifiableIdentity:isModernProgress:transferState:", v41, v55, v53, a10, a11));

  v43 = SFLocalizedStringForKey(v36, v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
  if (v23 < 2 || a4 < 2)
  {
    v17 = v54;
    if (v23 >= 2)
    {
      if (a10)
        goto LABEL_29;
      goto LABEL_37;
    }
    if (a4 < 2)
    {
      if (a10)
        goto LABEL_39;
      goto LABEL_38;
    }
    if (!a10)
    {
LABEL_35:
      v50 = a4;
LABEL_38:
      v49 = v17;
LABEL_39:
      v45 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v44, v49, v50, v51);
      goto LABEL_40;
    }
LABEL_32:
    v45 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v44, a4, v50, v51);
    goto LABEL_40;
  }
  v17 = v54;
  if (!a10)
  {
    v51 = a4;
LABEL_37:
    v50 = v23;
    goto LABEL_38;
  }
  v50 = a4;
LABEL_29:
  v45 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v44, v23, v50, v51);
LABEL_40:
  v47 = (void *)objc_claimAutoreleasedReturnValue(v45);

  return v47;
}

- (BOOL)supportsAutoOpen
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingBundleIdentifier:](RBSProcessPredicate, "predicateMatchingBundleIdentifier:", CFSTR("com.apple.mobileslideshow")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessHandle handleForPredicate:error:](RBSProcessHandle, "handleForPredicate:error:", v2, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endowmentNamespaces"));
  v6 = objc_msgSend(v5, "containsObject:", CFSTR("com.apple.frontboard.visibility"));

  return v6 ^ 1;
}

- (BOOL)shouldEndAfterOpen
{
  return 0;
}

- (id)transformPhotosAssetBundlesToFoldersIfNeededInCompletedURLs:(id)a3
{
  id v3;
  void *v4;
  id v5;
  __int128 v6;
  id v7;
  uint64_t v8;
  UTType *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  unsigned __int8 v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  __int128 v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id obj;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  NSObject *v41;
  _BYTE v42[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v37;
    v9 = UTTypePackage;
    *(_QWORD *)&v6 = 138412290;
    v28 = v6;
    v29 = v4;
    v31 = *(_QWORD *)v37;
    do
    {
      v10 = 0;
      v32 = v7;
      do
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(obj);
        v11 = *(NSObject **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject pathExtension](v11, "pathExtension", v28));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[UTType typeWithFilenameExtension:conformingToType:](UTType, "typeWithFilenameExtension:conformingToType:", v12, v9));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));

        if (SFIsPhotosAssetBundle(v14))
        {
          v15 = objc_msgSend(objc_alloc((Class)PFAssetBundle), "initWithAssetBundleAtURL:", v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject URLByDeletingLastPathComponent](v11, "URLByDeletingLastPathComponent"));
          v35 = 0;
          v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "writeFolderRepresentationToDirectory:error:", v16, &v35));
          v18 = v35;
          v19 = airdrop_log(v18);
          v20 = objc_claimAutoreleasedReturnValue(v19);
          v21 = v20;
          if (v17)
          {
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v28;
              v41 = v17;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Wrote folder representation of asset bundle to: %@", buf, 0xCu);
            }

            v34 = 0;
            v22 = objc_msgSend(v30, "removeItemAtURL:error:", v11, &v34);
            v23 = v34;
            v21 = v23;
            if ((v22 & 1) == 0)
            {
              v24 = airdrop_log(v23);
              v25 = objc_claimAutoreleasedReturnValue(v24);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v28;
                v41 = v21;
                _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Unable to delete asset bundle after transforming to folder. Error: %@", buf, 0xCu);
              }

            }
            v4 = v29;
          }
          else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v28;
            v41 = v18;
            _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Unable to create folder representation from asset bundle. Error: %@", buf, 0xCu);
          }

          v9 = UTTypePackage;
          v8 = v31;
          v7 = v32;
        }
        else
        {
          v17 = 0;
        }
        if (v17)
          v26 = v17;
        else
          v26 = v11;
        objc_msgSend(v4, "addObject:", v26);

        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)updatePossibleActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;
  objc_super v13;
  void *v14;

  v13.receiver = self;
  v13.super_class = (Class)SDAirDropHandlerPhotos;
  -[SDAirDropHandler updatePossibleActions](&v13, "updatePossibleActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler defaultActionForBundleProxy:](self, "defaultActionForBundleProxy:", v3));

  objc_msgSend(v4, "setRequiresUnlockedUI:", 0);
  location = 0;
  objc_initWeak(&location, self);
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_10020F048;
  v10 = &unk_100714348;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v4, "setActionHandler:", &v7);
  v14 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1, v7, v8, v9, v10));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  objc_msgSend(v6, "setPossibleActions:", v5);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (BOOL)transferContainsAssetBundles:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  char v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "metaData"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "items"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "type", (_QWORD)v11));
        v9 = SFIsPhotosAssetBundle(v8);

        if ((v9 & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v5;
}

- (void)prepareForAcceptWithCompletion:(id)a3
{
  void (**v3)(id, uint64_t);
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = (void (**)(id, uint64_t))a3;
  v4 = airdrop_log(v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Preparing AirDrop for accept", v6, 2u);
  }

  v3[2](v3, 1);
}

- (void)triggerImport
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "completedURLs"));
  v5 = objc_msgSend(v4, "copy");
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10020F2BC;
  v6[3] = &unk_10071C030;
  v6[4] = self;
  -[SDAirDropHandlerPhotos triggerImportWithCompletedURLs:completion:](self, "triggerImportWithCompletedURLs:completion:", v5, v6);

}

- (void)performViewActionWithImportedURLs:(id)a3 completion:(id)a4
{
  void (**v6)(id, BOOL, _QWORD);

  v6 = (void (**)(id, BOOL, _QWORD))a4;
  v6[2](v6, -[SDAirDropHandler openURLs:](self, "openURLs:", a3), 0);

}

- (void)triggerImportWithCompletedURLs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  unsigned int v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  SDAirDropHandlerPhotos *v24;
  id v25;
  _QWORD *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  SDAirDropHandlerPhotos *v31;
  _QWORD *v32;
  unsigned __int8 v33;
  _QWORD v34[5];
  id v35;
  uint8_t buf[4];
  unsigned int v37;

  v6 = a3;
  v7 = a4;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = sub_10020F7F8;
  v34[4] = sub_10020F808;
  v35 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary sharedPhotoLibrary](PHPhotoLibrary, "sharedPhotoLibrary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDAirDropHandler transferURLForTransfer:](SDAirDropHandler, "transferURLForTransfer:", v11));

  v13 = +[SFAirDropUserDefaults_objc moveToAppEnabled](SFAirDropUserDefaults_objc, "moveToAppEnabled");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v15 = airdrop_log(v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_msgSend(v6, "count");
    *(_DWORD *)buf = 67109120;
    v37 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "PHPhotoLibrary preparing import of %d items", buf, 8u);
  }

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10020F810;
  v27[3] = &unk_10071C058;
  v28 = v6;
  v33 = v13;
  v18 = v12;
  v29 = v18;
  v19 = v10;
  v31 = self;
  v32 = v34;
  v30 = v19;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10020FDDC;
  v22[3] = &unk_10071C080;
  v20 = v28;
  v23 = v20;
  v24 = self;
  v26 = v34;
  v21 = v7;
  v25 = v21;
  objc_msgSend(v8, "performChanges:completionHandler:", v27, v22);

  _Block_object_dispose(v34, 8);
}

- (id)defaultOpenActionBundleID
{
  return CFSTR("com.apple.mobileslideshow");
}

- (void)handleMoveToAppShareSheetSucceeded
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  unsigned int v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerPhotos assetIdentifiers](self, "assetIdentifiers"));
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandlerPhotos assetIdentifiers](self, "assetIdentifiers"));
    v7 = objc_msgSend(v6, "copy");

    v9 = airdrop_log(v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v18 = objc_msgSend(v7, "count");
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PHPhotoLibrary preparing expunge for %d items", buf, 8u);
    }

    v11 = objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary sharedPhotoLibrary](PHPhotoLibrary, "sharedPhotoLibrary"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset fetchAssetsWithLocalIdentifiers:options:](PHAsset, "fetchAssetsWithLocalIdentifiers:options:", v7, 0));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10021017C;
    v15[3] = &unk_1007148C8;
    v16 = v7;
    v13 = v7;
    +[PHAssetChangeRequest performBatchExpungeWithAssets:deleteOptions:photoLibrary:completionHandler:](PHAssetChangeRequest, "performBatchExpungeWithAssets:deleteOptions:photoLibrary:completionHandler:", v12, 0, v11, v15);

  }
  else
  {
    v14 = airdrop_log(v5);
    v11 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1002108B4(v11);
  }

}

- (id)actionsForModernReadyForOpen
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  location = 0;
  objc_initWeak(&location, self);
  v5 = SFLocalizedStringForKey(CFSTR("VIEW_BUTTON_TITLE"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v8));

  v10 = objc_alloc((Class)SFAirDropAction);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler bundleProxy](self, "bundleProxy"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bundleIdentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler singleItemActionTitle](self, "singleItemActionTitle"));
  v16 = objc_msgSend(v10, "initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:", v12, v14, v9, v15, 3);

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10021056C;
  v28[3] = &unk_100714348;
  objc_copyWeak(&v29, &location);
  objc_msgSend(v16, "setActionHandler:", v28);
  objc_msgSend(v16, "setMaxTransferState:", 8);
  objc_msgSend(v3, "addObject:", v16);
  v18 = SFLocalizedStringForKey(CFSTR("MOVE_TO_APP_BUTTON_TITLE"), v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = objc_alloc((Class)SFAirDropAction);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler transfer](self, "transfer"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SDAirDropHandler singleItemActionTitle](self, "singleItemActionTitle"));
  v24 = objc_msgSend(v20, "initWithTransferIdentifier:actionIdentifier:title:singleItemTitle:type:", v22, CFSTR("SDMoveToAppActionIdentifier"), v19, v23, 3);

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10021065C;
  v26[3] = &unk_100714348;
  objc_copyWeak(&v27, &location);
  objc_msgSend(v24, "setActionHandler:", v26);
  objc_msgSend(v24, "setMaxTransferState:", 8);
  objc_msgSend(v3, "addObject:", v24);
  objc_destroyWeak(&v27);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
  return v3;
}

- (id)createDestination
{
  NSString *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v13;

  v3 = NSHomeDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v4, 1));
  v13 = 0;
  v6 = sub_10019B6D4(v5, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v13;

  if (!v7)
  {
    v10 = airdrop_log(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1000BDA20(self, (uint64_t)v8, v11);

  }
  return v7;
}

- (BOOL)shouldExtractMediaFromPhotosBundles
{
  return self->_shouldExtractMediaFromPhotosBundles;
}

- (BOOL)hasPhotos
{
  return self->_hasPhotos;
}

- (void)setHasPhotos:(BOOL)a3
{
  self->_hasPhotos = a3;
}

- (BOOL)hasVideos
{
  return self->_hasVideos;
}

- (void)setHasVideos:(BOOL)a3
{
  self->_hasVideos = a3;
}

- (NSArray)unprivatizedURLs
{
  return self->_unprivatizedURLs;
}

- (void)setUnprivatizedURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)assetIdentifiers
{
  return self->_assetIdentifiers;
}

- (void)setAssetIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetIdentifiers, 0);
  objc_storeStrong((id *)&self->_unprivatizedURLs, 0);
}

@end
