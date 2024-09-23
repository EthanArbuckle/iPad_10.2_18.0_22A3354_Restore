@implementation AEPictureBookRenderingCache

- (AEPictureBookRenderingCache)initWithIdentifier:(id)a3 configuration:(id)a4 webViewBuilder:(id)a5
{
  id v9;
  id v10;
  AEPictureBookRenderingCache *v11;
  AEPictureBookRenderingCache *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)AEPictureBookRenderingCache;
  v11 = -[AEHTMLBookRenderingCache initWithIdentifier:](&v14, "initWithIdentifier:", a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_configuration, a4);
    objc_storeWeak((id *)&v12->_webViewBuilder, v10);
    v12->_upsellPageNumber = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v12;
}

- (id)persistentCacheFileName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache identifier](self, "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), v2, CFSTR("v20210729")));

  return v3;
}

- (id)upsellThumbnailForAsset:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  unsigned int v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  double v21;
  double v22;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sampleContent"));
  v9 = objc_msgSend(v8, "BOOLValue");

  v10 = &stru_1C3088;
  if (v9)
    v10 = CFSTR("sample");
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetID"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache keyForAssetID:prefix:size:](self, "keyForAssetID:prefix:size:", v12, v11, width, height));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache fetchImageForKey:](self, "fetchImageForKey:", v13));
  if (!v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIGraphicsImageRendererFormat preferredFormat](UIGraphicsImageRendererFormat, "preferredFormat"));
    v16 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithSize:format:", v15, width, height);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_CA3E4;
    v19[3] = &unk_1C1300;
    v21 = width;
    v22 = height;
    v20 = v15;
    v17 = v15;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "imageWithActions:", v19));
    -[AEPictureBookRenderingCache storeImage:forKey:size:format:](self, "storeImage:forKey:size:format:", v14, v13, -[AEPictureBookRenderingCache serializeFormat](self, "serializeFormat"), width, height);

  }
  return v14;
}

+ (Class)operationClass
{
  return (Class)objc_opt_class(AEPictureBookRenderingCacheOperation2);
}

- (void)generateSnapshotWithAsset:(id)a3 size:(CGSize)a4 pageNumber:(int64_t)a5
{
  double height;
  double width;
  id v9;
  float v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  if ((unint64_t)(a5 - 0x7FFFFFFFFFFFFFFFLL) >= 0x8000000000000002)
  {
    v10 = height;
    v11 = floorf(v10);
    v20 = v9;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache keyPrefixForPage:](self, "keyPrefixForPage:", a5));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "assetID"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache keyForAssetID:prefix:size:](self, "keyForAssetID:prefix:size:", v13, v12, width, v11));

    if ((-[AEPictureBookRenderingCache hasImageForKey:](self, "hasImageForKey:", v14) & 1) == 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "documentWithOrdinal:", a5 - 1));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "urlForDocument:", v15));
      if (v16)
      {
        if (objc_msgSend(v20, "shouldDisableOptimizeSpeed"))
          v17 = 0x10000;
        else
          v17 = 0;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[AEBookInfoSnapshot aeBookInfoSnapshotFromBookInfo:ordinal:](AEBookInfoSnapshot, "aeBookInfoSnapshotFromBookInfo:ordinal:", v20, a5 - 1));
        v19 = -[AEPictureBookRenderingCache _scheduleRenderWithKey:options:size:bookInfoSnapshot:documentUrl:pageNumber:priority:target:context:](self, "_scheduleRenderWithKey:options:size:bookInfoSnapshot:documentUrl:pageNumber:priority:target:context:", v14, v17, v18, v16, a5, 4, width, v11, 0, 0);

      }
    }

    v9 = v20;
  }

}

- (id)_scheduleRenderWithKey:(id)a3 options:(unint64_t)a4 size:(CGSize)a5 bookInfoSnapshot:(id)a6 documentUrl:(id)a7 pageNumber:(int64_t)a8 priority:(int64_t)a9 target:(id)a10 context:(id)a11
{
  double height;
  double width;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id WeakRetained;
  int64_t v33;

  height = a5.height;
  width = a5.width;
  v19 = a3;
  v20 = a6;
  v21 = a7;
  v22 = a10;
  v23 = a11;
  if ((-[AEPictureBookRenderingCache hasImageForKey:](self, "hasImageForKey:", v19) & 1) != 0)
  {
    v24 = 0;
  }
  else
  {
    v33 = a9;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache findRenderingCacheOperationWithStorageKey:target:selector:context:](self, "findRenderingCacheOperationWithStorageKey:target:selector:context:", v19, 0, 0, 0));
    objc_opt_class(BCRenderingCacheBlockCallback);
    v27 = BUDynamicCast(v26, v22);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    if (v25 && !objc_msgSend(v25, "isCancelled"))
    {
      if (v28)
        objc_msgSend(v25, "addExtraCompletion:", v28);
      v24 = v25;
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[AEPictureBookRenderingCacheOperation2 renderCacheWithOptions:](AEPictureBookRenderingCacheOperation2, "renderCacheWithOptions:", a4));

      objc_msgSend(v24, "setSelector:", 0);
      objc_msgSend(v24, "setContext:", v23);
      objc_msgSend(v24, "setPageNumber:", a8);
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache renderingPiggyBack](self, "renderingPiggyBack"));
      objc_msgSend(v24, "setPiggyBack:", v29);

      objc_msgSend(v24, "setUrl:", v21);
      objc_msgSend(v24, "setBookInfoSnapshot:", v20);
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "assetID"));
      objc_msgSend(v24, "setAssetID:", v30);

      WeakRetained = objc_loadWeakRetained((id *)&self->_webViewBuilder);
      objc_msgSend(v24, "setWebViewBuilder:", WeakRetained);

      objc_msgSend(v24, "setSnapshotSize:", width, height);
      objc_msgSend(v24, "setTarget:", v22);
      if (v28)
        objc_msgSend(v24, "addExtraCompletion:", v28);
      objc_msgSend(v24, "setImageCache:", self);
      objc_msgSend(v24, "setDesiredSize:", width, height);
      objc_msgSend(v24, "setStorageKey:", v19);
      objc_msgSend(v24, "setMasterImageKey:", 0);
      objc_msgSend(v24, "setSerializeFormat:", -[AEPictureBookRenderingCache serializeFormat](self, "serializeFormat"));
      objc_msgSend(v24, "setQueuePriority:", v33);
      -[AEPictureBookRenderingCache enqueueRenderingCacheOperation:](self, "enqueueRenderingCacheOperation:", v24);
    }

  }
  return v24;
}

- (id)thumbnailForPage:(int64_t)a3 asset:(id)a4 size:(CGSize)a5 renderingCacheCallbackTarget:(id)a6 renderingCacheCallbackContext:(id)a7 priority:(int64_t)a8 containerBounds:(CGRect)a9
{
  double height;
  double width;
  double y;
  double x;
  double v16;
  double v17;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned int v26;
  uint64_t v27;
  float v28;
  float v29;
  float v30;
  float v31;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  int64_t v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  char v55;
  uint64_t v56;
  void *i;
  void *v58;
  void *v59;
  double v60;
  double v61;
  id v62;
  uint64_t v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  id WeakRetained;
  void *v69;
  void *v70;
  void *v72;
  void *v73;
  id v74;
  id v75;
  id v76;
  id v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  int64_t v86;
  id v87;
  char *v88;
  void *v89;
  void *v90;
  id obj;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];

  height = a9.size.height;
  width = a9.size.width;
  y = a9.origin.y;
  x = a9.origin.x;
  v16 = a5.height;
  v17 = a5.width;
  v20 = a4;
  v21 = a6;
  v22 = a7;
  if ((unint64_t)(a3 - 0x7FFFFFFFFFFFFFFFLL) >= 0x8000000000000002)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "assetID"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "url"));
    if (v20)
    {
      v23 = 0;
      if (objc_msgSend(v24, "length") && v25)
      {
        v26 = objc_msgSend(v20, "shouldDisableOptimizeSpeed");
        v23 = 0;
        v27 = 0x10000;
        if (!v26)
          v27 = 0;
        v28 = v16;
        v29 = floorf(v28);
        v30 = v17;
        v31 = floorf(v30);
        if (v29 > 1.0 && v31 > 1.0)
        {
          v84 = v27;
          v86 = a8;
          v33 = v31;
          v34 = v29;
          -[AEPictureBookRenderingCache scaleAdjustedImageSize:](self, "scaleAdjustedImageSize:", v31, v29);
          v36 = v35;
          v38 = v37;
          v39 = a3;
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache keyPrefixForPage:](self, "keyPrefixForPage:", a3));
          v41 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache keyForAssetID:prefix:size:](self, "keyForAssetID:prefix:size:", v24, v40, v36, v38));
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[AEHTMLBookRenderingCache _fetchImageForKey:size:](self, "_fetchImageForKey:size:", v41, v33, v34));
          v42 = v20;
          if (!v23)
          {
            v80 = v38;
            v81 = v36;
            v88 = (char *)v39;
            v73 = v25;
            v74 = v22;
            v75 = v21;
            v76 = v20;
            v43 = v42;
            -[AEPictureBookRenderingCache primaryImageSize](self, "primaryImageSize");
            v45 = v44;
            *(float *)&v44 = v46;
            v47 = floorf(*(float *)&v44);
            v48 = (void *)objc_claimAutoreleasedReturnValue(+[IMPersistentCacheManager sharedInstance](IMPersistentCacheManager, "sharedInstance"));
            v49 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache persistentCachePath](self, "persistentCachePath"));
            v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "cacheForPath:maxSize:", v49, 0));

            v50 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache configuration](self, "configuration"));
            v87 = v43;
            v51 = (void *)objc_claimAutoreleasedReturnValue(+[BKPictureBookViewGeometry geometryWithContentSize:configuration:drawsSpine:containerBounds:](BKPictureBookViewGeometry, "geometryWithContentSize:configuration:drawsSpine:containerBounds:", v50, objc_msgSend(v43, "hidesSpine") ^ 1, v45, v47, x, y, width, height));

            v79 = v51;
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "sizes"));
            v90 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache keyForAssetID:prefix:size:](self, "keyForAssetID:prefix:size:", v24, v40, v45, v47));
            v92 = 0u;
            v93 = 0u;
            v94 = 0u;
            v95 = 0u;
            obj = v52;
            v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v96, 16);
            if (v53)
            {
              v54 = v53;
              v55 = 0;
              v56 = *(_QWORD *)v93;
              do
              {
                for (i = 0; i != v54; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v93 != v56)
                    objc_enumerationMutation(obj);
                  v58 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * (_QWORD)i);
                  objc_msgSend(v58, "CGSizeValue");
                  v59 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache keyForAssetID:prefix:size:](self, "keyForAssetID:prefix:size:", v24, v40));
                  if ((unint64_t)objc_msgSend(v41, "compare:", v59) + 1 <= 1
                    && objc_msgSend(v89, "hasItemForKey:", v59))
                  {
                    objc_msgSend(v58, "CGSizeValue");
                    v45 = v60;
                    v47 = v61;
                    v62 = v59;

                    v55 = 1;
                    v90 = v62;
                  }

                }
                v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v96, 16);
              }
              while (v54);
            }
            else
            {
              v55 = 0;
            }

            v63 = objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "documentWithOrdinal:", v88 - 1));
            v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "urlForDocument:", v63));
            v78 = (void *)v63;
            if ((v55 & 1) == 0 && objc_msgSend(v41, "compare:", v90) == (id)-1)
            {
              v72 = (void *)objc_claimAutoreleasedReturnValue(+[AEBookInfoSnapshot aeBookInfoSnapshotFromBookInfo:ordinal:](AEBookInfoSnapshot, "aeBookInfoSnapshotFromBookInfo:ordinal:", v87, v88 - 1));
              v22 = v74;
              v21 = v75;
              v82 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache _scheduleRenderWithKey:options:size:bookInfoSnapshot:documentUrl:pageNumber:priority:target:context:](self, "_scheduleRenderWithKey:options:size:bookInfoSnapshot:documentUrl:pageNumber:priority:target:context:", v90, v84, v72, v83, v88, v86, v45, v47, v75, v74));
              objc_msgSend(v82, "setPageNumber:", v88);

              v20 = v76;
            }
            else
            {
              v82 = 0;
              v21 = v75;
              v20 = v76;
              v22 = v74;
            }
            v25 = v73;
            v64 = -[AEPictureBookRenderingCache selectorForTarget:](self, "selectorForTarget:", v21);
            v65 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache findRenderingCacheOperationWithStorageKey:target:selector:context:](self, "findRenderingCacheOperationWithStorageKey:target:selector:context:", v41, v21, v64, v22));
            v66 = v65;
            if (v65 && !objc_msgSend(v65, "isCancelled"))
            {
              v67 = v66;
            }
            else
            {
              v77 = v64;
              v67 = (void *)objc_claimAutoreleasedReturnValue(+[AEPictureBookRenderingCacheOperation2 renderCacheWithOptions:](AEPictureBookRenderingCacheOperation2, "renderCacheWithOptions:", v84));

              v85 = (void *)objc_claimAutoreleasedReturnValue(+[AEBookInfoSnapshot aeBookInfoSnapshotFromBookInfo:ordinal:](AEBookInfoSnapshot, "aeBookInfoSnapshotFromBookInfo:ordinal:", v87, v88 - 1));
              objc_msgSend(v67, "setBookInfoSnapshot:");
              WeakRetained = objc_loadWeakRetained((id *)&self->_webViewBuilder);
              objc_msgSend(v67, "setWebViewBuilder:", WeakRetained);

              objc_msgSend(v67, "setSnapshotSize:", v33, v34);
              objc_msgSend(v67, "setPageNumber:", v88);
              objc_msgSend(v67, "setUrl:", v83);
              objc_msgSend(v67, "setTarget:", v21);
              objc_msgSend(v67, "setSelector:", v77);
              objc_msgSend(v67, "setContext:", v22);
              objc_msgSend(v67, "setImageCache:", self);
              objc_msgSend(v67, "setDesiredSize:", v81, v80);
              objc_msgSend(v67, "setAssetID:", v24);
              objc_msgSend(v67, "setStorageKey:", v41);
              objc_msgSend(v67, "setMasterImageKey:", v90);
              objc_msgSend(v67, "setSerializeFormat:", -[AEPictureBookRenderingCache serializeFormat](self, "serializeFormat"));
              objc_msgSend(v67, "setQueuePriority:", v86);
              if (v82)
                objc_msgSend(v67, "addDependency:");
              -[AEPictureBookRenderingCache enqueueRenderingCacheOperation:](self, "enqueueRenderingCacheOperation:", v67);

            }
            v69 = (void *)objc_claimAutoreleasedReturnValue(+[IMPersistentCacheManager sharedInstance](IMPersistentCacheManager, "sharedInstance"));
            v70 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache persistentCachePath](self, "persistentCachePath"));
            objc_msgSend(v69, "purgeFromCache:", v70);

            if ((char *)-[AEPictureBookRenderingCache upsellPageNumber](self, "upsellPageNumber") == v88)
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache upsellThumbnailForAsset:size:](self, "upsellThumbnailForAsset:size:", v87, v33, v34));
            else
              v23 = 0;
            v42 = v87;
          }

        }
      }
    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (id)anySnapshotForBookInfo:(id)a3 pageNumber:(int64_t)a4 containerBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3;
  v12 = v11;
  if ((unint64_t)(a4 - 1) > 0x7FFFFFFFFFFFFFFDLL)
  {
    v18 = 0;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "assetID"));
    objc_msgSend(v12, "fixedLayoutSizeForDocumentWithOrdinal:", a4 - 1);
    v15 = v14;
    v17 = v16;
    v18 = 0;
    if (objc_msgSend(v13, "length") && v15 > 0.0 && v17 > 0.0)
    {
      -[AEPictureBookRenderingCache primaryImageSize](self, "primaryImageSize");
      v20 = v19;
      v22 = v21;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache keyPrefixForPage:](self, "keyPrefixForPage:", a4));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache keyForAssetID:prefix:size:](self, "keyForAssetID:prefix:size:", v13, v23, v20, v22));
      v25 = objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache fetchImageForKey:](self, "fetchImageForKey:", v24));
      if (v25)
      {
        v18 = (void *)v25;
      }
      else
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache configuration](self, "configuration"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[BKPictureBookViewGeometry geometryWithContentSize:configuration:drawsSpine:containerBounds:](BKPictureBookViewGeometry, "geometryWithContentSize:configuration:drawsSpine:containerBounds:", v26, objc_msgSend(v12, "hidesSpine") ^ 1, v15, v17, x, y, width, height));

        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "sizes"));
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        if (v29)
        {
          v30 = v29;
          v36 = v27;
          v31 = *(_QWORD *)v38;
          while (2)
          {
            v32 = 0;
            v33 = v24;
            do
            {
              if (*(_QWORD *)v38 != v31)
                objc_enumerationMutation(v28);
              objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)v32), "CGSizeValue");
              v24 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache keyForAssetID:prefix:size:](self, "keyForAssetID:prefix:size:", v13, v23));

              v34 = objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache fetchImageForKey:](self, "fetchImageForKey:", v24));
              if (v34)
              {
                v18 = (void *)v34;
                goto LABEL_18;
              }
              v32 = (char *)v32 + 1;
              v33 = v24;
            }
            while (v30 != v32);
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
            if (v30)
              continue;
            break;
          }
          v18 = 0;
LABEL_18:
          v27 = v36;
        }
        else
        {
          v18 = 0;
        }

      }
    }

  }
  return v18;
}

- (void)snapshotForBookInfo:(id)a3 pageNumber:(int64_t)a4 size:(CGSize)a5 maxSize:(CGSize)a6 isRight:(BOOL)a7 zoomScale:(double)a8 applyMaskAndGutter:(BOOL)a9 containerBounds:(CGRect)a10 completion:(id)a11
{
  _BOOL8 v12;
  _BOOL8 v13;
  double height;
  double width;
  id v18;
  void (**v19)(id, void *);
  double v20;
  double v21;
  double v22;
  double v23;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  uint8_t buf[4];
  int64_t v33;
  __int16 v34;
  void *v35;

  v12 = a9;
  v13 = a7;
  height = a5.height;
  width = a5.width;
  v18 = a3;
  v19 = (void (**)(id, void *))a11;
  objc_msgSend(v18, "fixedLayoutSizeForDocumentWithOrdinal:", a4 - 1);
  v21 = v20;
  v23 = v22;
  if (width == CGSizeZero.width && height == CGSizeZero.height)
  {
    v27 = _AELog();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v28, OS_LOG_TYPE_ERROR, "Requesting zero size snapshot", buf, 2u);
    }

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache whitePageForSize:right:scale:contentSize:applyMaskAndGutter:containerBounds:](self, "whitePageForSize:right:scale:contentSize:applyMaskAndGutter:containerBounds:", v13, v12, width, height, a8, v21, v23, *(_QWORD *)&a10.origin.x, *(_QWORD *)&a10.origin.y, *(_QWORD *)&a10.size.width, *(_QWORD *)&a10.size.height));
    v19[2](v19, v26);
  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "assetID"));
    v26 = v25;
    if ((unint64_t)a4 <= 0x7FFFFFFFFFFFFFFELL && objc_msgSend(v25, "length"))
    {
      -[AEPictureBookRenderingCache _uncheckedSnapshotWithMask:assetID:bookInfo:containerBounds:contentSize:isRight:pageNumber:scale:size:completion:](self, "_uncheckedSnapshotWithMask:assetID:bookInfo:containerBounds:contentSize:isRight:pageNumber:scale:size:completion:", v12, v26, v18, v13, a4, v19, a10.origin.x, a10.origin.y, a10.size.width, a10.size.height, v21, v23, a8, *(_QWORD *)&width, *(_QWORD *)&height);
    }
    else
    {
      v29 = _AELog();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v33 = a4;
        v34 = 2112;
        v35 = v26;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_ERROR, "snapshot needs pageNumber and assetID. pageNumber: %ld. assetID: %@", buf, 0x16u);
      }

      v19[2](v19, 0);
    }
  }

}

- (void)_uncheckedSnapshotWithMask:(BOOL)a3 assetID:(id)a4 bookInfo:(id)a5 containerBounds:(CGRect)a6 contentSize:(CGSize)a7 isRight:(BOOL)a8 pageNumber:(int64_t)a9 scale:(double)a10 size:(CGSize)a11 completion:(id)a12
{
  _BOOL8 v14;
  double height;
  double width;
  double v18;
  double v19;
  double y;
  double x;
  _BOOL8 v22;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  void *context;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  id v48[9];
  CGSize v49;
  BOOL v50;
  BOOL v51;
  id location[2];

  v14 = a8;
  height = a7.height;
  width = a7.width;
  v18 = a6.size.height;
  v19 = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v22 = a3;
  v24 = a4;
  v25 = a5;
  v26 = a12;
  context = objc_autoreleasePoolPush();
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache keyPrefixForPage:](self, "keyPrefixForPage:", a9));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache keyForAssetID:prefix:size:](self, "keyForAssetID:prefix:size:", v24, v27, a11.width, a11.height));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[AEHTMLBookRenderingCache _fetchImageForKey:size:](self, "_fetchImageForKey:size:", v28, a11.width, a11.height));
  if (v29)
  {
    -[AEPictureBookRenderingCache _gotSnapshotWithMask:bookInfo:containerBounds:contentSize:isRight:key:pageNumber:snapshot:scale:size:completion:](self, "_gotSnapshotWithMask:bookInfo:containerBounds:contentSize:isRight:key:pageNumber:snapshot:scale:size:completion:", v22, v25, v14, v28, a9, v29, x, y, v19, v18, width, height, a10, *(_QWORD *)&a11.width, *(_QWORD *)&a11.height, v26);
  }
  else
  {
    v40 = v24;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "documentWithOrdinal:", a9 - 1));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "urlForDocument:"));
    v30 = objc_msgSend(v25, "shouldDisableOptimizeSpeed");
    v31 = 0x10000;
    if (!v30)
      v31 = 0;
    v38 = v31;
    v32 = objc_claimAutoreleasedReturnValue(+[AEBookInfoSnapshot aeBookInfoSnapshotFromBookInfo:ordinal:](AEBookInfoSnapshot, "aeBookInfoSnapshotFromBookInfo:ordinal:", v25, a9 - 1));
    objc_initWeak(location, self);
    v41 = objc_alloc((Class)BCRenderingCacheBlockCallback);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_CB8C0;
    v44[3] = &unk_1C1328;
    objc_copyWeak(v48, location);
    v50 = v22;
    v45 = v25;
    v48[1] = *(id *)&x;
    v48[2] = *(id *)&y;
    v48[3] = *(id *)&v19;
    v48[4] = *(id *)&v18;
    v48[5] = *(id *)&width;
    v48[6] = *(id *)&height;
    v51 = v14;
    v33 = v28;
    v46 = v33;
    v48[7] = (id)a9;
    v48[8] = *(id *)&a10;
    v49 = a11;
    v47 = v26;
    v34 = objc_msgSend(v41, "initWithCompletion:", v44);
    v35 = -[AEPictureBookRenderingCache _scheduleRenderWithKey:options:size:bookInfoSnapshot:documentUrl:pageNumber:priority:target:context:](self, "_scheduleRenderWithKey:options:size:bookInfoSnapshot:documentUrl:pageNumber:priority:target:context:", v33, v38, v32, v39, a9, 4, a11.width, a11.height, v34, v34);
    v36 = (void *)v32;
    v24 = v40;

    objc_destroyWeak(v48);
    objc_destroyWeak(location);

  }
  objc_autoreleasePoolPop(context);

}

- (void)_gotSnapshotWithMask:(BOOL)a3 bookInfo:(id)a4 containerBounds:(CGRect)a5 contentSize:(CGSize)a6 isRight:(BOOL)a7 key:(id)a8 pageNumber:(int64_t)a9 snapshot:(id)a10 scale:(double)a11 size:(CGSize)a12 completion:(id)a13
{
  _BOOL8 v16;
  double height;
  double width;
  double v19;
  double v20;
  double y;
  double x;
  _BOOL8 v23;
  id v25;
  id v26;
  void (**v27)(id, id);
  id v28;
  id v30;

  v16 = a7;
  height = a6.height;
  width = a6.width;
  v19 = a5.size.height;
  v20 = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v23 = a3;
  v30 = a4;
  v25 = a8;
  v26 = a10;
  v27 = (void (**)(id, id))a13;
  if (!v26)
    v26 = (id)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache anySnapshotForBookInfo:pageNumber:containerBounds:](self, "anySnapshotForBookInfo:pageNumber:containerBounds:", v30, a9, x, y, v20, v19));
  if (v23 && v26)
  {
    v28 = objc_retainAutorelease(v26);
    v26 = (id)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache _applyMaskAndGutter:isRight:contentSize:containerBounds:](self, "_applyMaskAndGutter:isRight:contentSize:containerBounds:", objc_msgSend(v28, "CGImage"), v16, width, height, x, y, v20, v19));

  }
  if (!v26)
    v26 = (id)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache whitePageForSize:right:scale:contentSize:applyMaskAndGutter:containerBounds:](self, "whitePageForSize:right:scale:contentSize:applyMaskAndGutter:containerBounds:", v16, v23, a12.width, a12.height, a11, width, height, *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&v20, *(_QWORD *)&v19));
  v27[2](v27, v26);

}

- (id)generateMasterImageForPageNumber:(int64_t)a3 asset:(id)a4 priority:(int64_t)a5 callbackBlock:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  AEBookRenderingCallbackTarget *v21;
  uint64_t v22;
  id WeakRetained;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;

  v10 = a4;
  v11 = a6;
  v12 = (void (**)(_QWORD, _QWORD))v11;
  v13 = 0;
  if (a3 >= 1 && v10 && v11)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "assetID"));
    if (!objc_msgSend(v14, "length"))
    {
      v13 = 0;
LABEL_15:

      goto LABEL_16;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "url"));

    if (v15)
    {
      -[AEPictureBookRenderingCache primaryImageSize](self, "primaryImageSize");
      v17 = v16;
      v19 = v18;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[AEHTMLBookRenderingCache _keyForAsset:size:pageNumber:](self, "_keyForAsset:size:pageNumber:", v10, a3));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache fetchImageForKey:](self, "fetchImageForKey:", v14));
      if (v20)
      {
        ((void (**)(_QWORD, void *))v12)[2](v12, v20);
        v13 = 0;
      }
      else
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "documentWithOrdinal:", a3 - 1));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "urlForDocument:", v29));
        v21 = -[AEBookRenderingCallbackTarget initWithCallbackBlock:]([AEBookRenderingCallbackTarget alloc], "initWithCallbackBlock:", v12);
        if (objc_msgSend(v10, "shouldDisableOptimizeSpeed"))
          v22 = 0x10000;
        else
          v22 = 0;
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[AEPictureBookRenderingCacheOperation2 renderCacheWithOptions:](AEPictureBookRenderingCacheOperation2, "renderCacheWithOptions:", v22));
        objc_msgSend(v13, "setTarget:", v21);
        objc_msgSend(v13, "setSelector:", -[AEPictureBookRenderingCache selectorForTarget:](self, "selectorForTarget:", v21));
        objc_msgSend(v13, "setContext:", v21);
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[AEBookInfoSnapshot aeBookInfoSnapshotFromBookInfo:ordinal:](AEBookInfoSnapshot, "aeBookInfoSnapshotFromBookInfo:ordinal:", v10, a3 - 1));
        objc_msgSend(v13, "setBookInfoSnapshot:", v27);
        WeakRetained = objc_loadWeakRetained((id *)&self->_webViewBuilder);
        objc_msgSend(v13, "setWebViewBuilder:", WeakRetained);

        objc_msgSend(v13, "setSnapshotSize:", v17, v19);
        objc_msgSend(v13, "setPageNumber:", a3);
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache renderingPiggyBack](self, "renderingPiggyBack"));
        objc_msgSend(v13, "setPiggyBack:", v24);

        objc_msgSend(v13, "setUrl:", v28);
        objc_msgSend(v13, "setImageCache:", self);
        objc_msgSend(v13, "setDesiredSize:", v17, v19);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "assetID"));
        objc_msgSend(v13, "setAssetID:", v25);

        objc_msgSend(v13, "setStorageKey:", v14);
        objc_msgSend(v13, "setSerializeFormat:", -[AEPictureBookRenderingCache serializeFormat](self, "serializeFormat"));
        objc_msgSend(v13, "setQueuePriority:", a5);
        -[AEPictureBookRenderingCache enqueueRenderingCacheOperation:](self, "enqueueRenderingCacheOperation:", v13);

      }
      goto LABEL_15;
    }
    v13 = 0;
  }
LABEL_16:

  return v13;
}

- (void)renderingPiggyBackForPageNumber:(int64_t)a3 asset:(id)a4 priority:(int64_t)a5
{
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache renderingPiggyBack](self, "renderingPiggyBack"));
  v9 = objc_msgSend(v8, "needPiggyBackOperationForOrdinal:", a3 - 1);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "documentWithOrdinal:", a3 - 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "urlForDocument:", v10));
    if (objc_msgSend(v17, "shouldDisableOptimizeSpeed"))
      v12 = 0x10000;
    else
      v12 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[AEPictureBookRenderingCacheOperation2 renderCacheWithOptions:](AEPictureBookRenderingCacheOperation2, "renderCacheWithOptions:", v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[AEBookInfoSnapshot aeBookInfoSnapshotFromBookInfo:ordinal:](AEBookInfoSnapshot, "aeBookInfoSnapshotFromBookInfo:ordinal:", v17, a3 - 1));
    objc_msgSend(v13, "setBookInfoSnapshot:", v14);

    objc_msgSend(v13, "setPageNumber:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache renderingPiggyBack](self, "renderingPiggyBack"));
    objc_msgSend(v13, "setPiggyBack:", v15);

    objc_msgSend(v13, "setUrl:", v11);
    objc_msgSend(v13, "setImageCache:", self);
    objc_msgSend(v13, "setDesiredSize:", 100.0, 100.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "assetID"));
    objc_msgSend(v13, "setAssetID:", v16);

    objc_msgSend(v13, "setStorageKey:", 0);
    objc_msgSend(v13, "setSerializeFormat:", -[AEPictureBookRenderingCache serializeFormat](self, "serializeFormat"));
    objc_msgSend(v13, "setQueuePriority:", a5);
    -[AEPictureBookRenderingCache enqueueRenderingCacheOperation:](self, "enqueueRenderingCacheOperation:", v13);

  }
}

- (id)whitePageForSize:(CGSize)a3 right:(BOOL)a4 scale:(double)a5 contentSize:(CGSize)a6 applyMaskAndGutter:(BOOL)a7 containerBounds:(CGRect)a8
{
  _BOOL4 v8;
  double width;
  _BOOL8 v11;
  CGFloat v12;
  CGFloat v13;
  NSString *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  UIImage *v21;
  void *v22;
  double v23;
  CGFloat v24;
  CGContext *CurrentContext;
  void *v26;
  UIImage *ImageFromCurrentImageContext;
  void *v28;
  UIImage *v29;
  NSData *v30;
  void *v31;
  double height;
  CGSize v34;
  CGRect v35;

  v8 = a7;
  height = a6.height;
  width = a6.width;
  v11 = a4;
  v12 = a3.height;
  v13 = a3.width;
  v15 = NSStringFromCGSize(a3);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)v16;
  v18 = CFSTR("left");
  if (v11)
    v18 = CFSTR("right");
  v19 = &stru_1C3088;
  if (v8)
    v19 = CFSTR("-m");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("white-%@-%@-%0.5f%@"), v16, v18, *(_QWORD *)&a5, v19));

  v21 = (UIImage *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache fetchImageForKey:](self, "fetchImageForKey:", v20));
  if (!v21)
  {
    v22 = objc_autoreleasePoolPush();
    -[AEPictureBookRenderingCache scale](self, "scale");
    v24 = v23;
    v34.width = v13;
    v34.height = v12;
    UIGraphicsBeginImageContextWithOptions(v34, 0, v24);
    CurrentContext = UIGraphicsGetCurrentContext();
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    objc_msgSend(v26, "set");

    v35.origin.x = 0.0;
    v35.origin.y = 0.0;
    v35.size.width = v13;
    v35.size.height = v12;
    CGContextFillRect(CurrentContext, v35);
    ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
    v28 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
    UIGraphicsEndImageContext();
    if (v8)
      v29 = (UIImage *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache _applyMaskAndGutter:isRight:contentSize:containerBounds:](self, "_applyMaskAndGutter:isRight:contentSize:containerBounds:", objc_msgSend(objc_retainAutorelease(v28), "CGImage"), v11, width, height, a8.origin.x, a8.origin.y, a8.size.width, a8.size.height));
    else
      v29 = v28;
    v21 = v29;
    v30 = UIImagePNGRepresentation(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    if (objc_msgSend(v31, "length"))
      -[AEPictureBookRenderingCache storeImage:forKey:size:format:](self, "storeImage:forKey:size:format:", v21, v20, 0, width, height);

    objc_autoreleasePoolPop(v22);
  }

  return v21;
}

- (id)_applyMaskAndGutter:(CGImage *)a3 isRight:(BOOL)a4 contentSize:(CGSize)a5 containerBounds:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  _BOOL4 v12;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  id v21;
  CGImage *v22;
  void *v23;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v10 = a5.height;
  v11 = a5.width;
  v12 = a4;
  v15 = (double)CGImageGetWidth(a3);
  v16 = (double)CGImageGetHeight(a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AEPictureBookRenderingCache configuration](self, "configuration"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[BKPictureBookViewGeometry geometryWithContentSize:configuration:drawsSpine:containerBounds:](BKPictureBookViewGeometry, "geometryWithContentSize:configuration:drawsSpine:containerBounds:", v17, 1, v11, v10, x, y, width, height));

  objc_msgSend(v18, "scaleForSize:", v15, v16);
  v20 = v19;
  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("PictureBookSpine.png"))));
  v22 = CGImageAddAlphaAndAddBookMask(a3, (CGImage *)objc_msgSend(v21, "CGImage"), v12, v20);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", v22));
  CGImageRelease(v22);

  return v23;
}

- (void)renderQueuesEmptied
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_webViewBuilder);
  objc_msgSend(WeakRetained, "finishedSnapshottingForCache:", self);

}

- (int64_t)upsellPageNumber
{
  return self->_upsellPageNumber;
}

- (void)setUpsellPageNumber:(int64_t)a3
{
  self->_upsellPageNumber = a3;
}

- (BKPictureBookViewGeometry)layoutGeometry
{
  return self->_layoutGeometry;
}

- (void)setLayoutGeometry:(id)a3
{
  objc_storeStrong((id *)&self->_layoutGeometry, a3);
}

- (AEPictureBookRenderingPiggyBack)renderingPiggyBack
{
  return self->_renderingPiggyBack;
}

- (void)setRenderingPiggyBack:(id)a3
{
  objc_storeStrong((id *)&self->_renderingPiggyBack, a3);
}

- (BKThumbnailBookViewConfiguring)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (AEPaginatedBookSnapshotWebViewBuilder)webViewBuilder
{
  return (AEPaginatedBookSnapshotWebViewBuilder *)objc_loadWeakRetained((id *)&self->_webViewBuilder);
}

- (void)setWebViewBuilder:(id)a3
{
  objc_storeWeak((id *)&self->_webViewBuilder, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_webViewBuilder);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_renderingPiggyBack, 0);
  objc_storeStrong((id *)&self->_layoutGeometry, 0);
}

@end
