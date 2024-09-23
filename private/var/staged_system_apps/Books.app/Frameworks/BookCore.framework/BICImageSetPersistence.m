@implementation BICImageSetPersistence

+ (id)addedEntryWithDescribedImage:(id)a3 imageEntry:(id)a4
{
  id v5;
  id v6;
  BICImageSetPersistingAddedEntry *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[BICImageSetPersistingAddedEntry initWithDescribedImage:imageEntry:]([BICImageSetPersistingAddedEntry alloc], "initWithDescribedImage:imageEntry:", v6, v5);

  return v7;
}

- (BICImageSetPersistence)initWithPersistentStore:(id)a3 comparator:(id)a4
{
  id v7;
  id v8;
  BICImageSetPersistence *v9;
  BICImageSetPersistence *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BICImageSetPersistence;
  v9 = -[BICImageSetPersistence init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_imageComparator, a4);
    objc_storeStrong((id *)&v10->_persistentStore, a3);
  }

  return v10;
}

- (id)_imageSetForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetPersistence persistentStore](self, "persistentStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageSetForIdentifier:", v4));

  return v6;
}

- (void)_withPrimaryEntryForImageSetID:(id)a3 performBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetPersistence persistentStore](self, "persistentStore"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10C90C;
  v11[3] = &unk_28B750;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlock:", v11);

}

- (void)incrementVersionForIdentifiers:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  BICImageSetPersistence *v10;
  uint8_t buf[4];
  id v12;

  v4 = a3;
  v5 = BCImageCacheLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "BICImageSetPersistence: Increment version for: %@", buf, 0xCu);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10CA78;
  v8[3] = &unk_28BDF8;
  v9 = v4;
  v10 = self;
  v7 = v4;
  -[BICImageSetPersistence _markAsOldAllNonPrimaryImagesForImageSetIDs:completion:](self, "_markAsOldAllNonPrimaryImagesForImageSetIDs:completion:", v7, v8);

}

- (void)incrementVersionForIdentifier:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", a3));
  -[BICImageSetPersistence incrementVersionForIdentifiers:](self, "incrementVersionForIdentifiers:", v4);

}

- (void)_markAsOldAllNonPrimaryImagesForImageSetIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  BICImageSetPersistence *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetPersistence persistentStore](self, "persistentStore"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10CC70;
  v11[3] = &unk_28B750;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlock:", v11);

}

- (void)withExistingImageEntryForDescribedImage:(id)a3 inLevelID:(signed __int16)a4 performBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  BICImageSetPersistence *v15;
  id v16;
  signed __int16 v17;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetPersistence persistentStore](self, "persistentStore"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10CFD0;
  v13[3] = &unk_291540;
  v17 = a4;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "performBlock:", v13);

}

- (void)withExistingImageSetForDescribedImage:(id)a3 performBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetPersistence persistentStore](self, "persistentStore"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10D218;
  v11[3] = &unk_28EDE8;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "performBlock:", v11);

}

- (void)_addImageEntriesForDescribedImages:(id)a3 inLevelID:(signed __int16)a4 toSet:(id)a5 addedEntries:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *m;
  void *v24;
  void *v25;
  unsigned int v26;
  id v27;
  NSObject *v28;
  void *v29;
  unsigned int v30;
  unsigned int v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  void *j;
  void *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  unsigned int v43;
  id v44;
  id v45;
  uint64_t v46;
  void *i;
  id v48;
  id v49;
  uint64_t v50;
  void *k;
  void *v52;
  id v53;
  id v54;
  uint64_t v55;
  void *n;
  void *v57;
  void *v58;
  BOOL v59;
  void *v60;
  void *v61;
  BICImageSetPersistingAddedEntry *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  int *v67;
  id v68;
  void *v69;
  uint64_t v70;
  void *v71;
  id v72;
  id v73;
  char v74;
  id obj;
  id obja;
  unsigned int v77;
  void *v79;
  id v80;
  void *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  uint8_t v110[4];
  int v111;
  _BYTE v112[128];
  _BYTE v113[128];

  v8 = a4;
  v9 = a3;
  v10 = a5;
  v72 = a6;
  v79 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageEntries"));
  v68 = objc_msgSend(v11, "count");

  v80 = objc_msgSend(v9, "mutableCopy");
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v102, v113, 16);
  v71 = v12;
  v77 = v8;
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v103;
    v67 = &v111;
    v70 = *(_QWORD *)v103;
    do
    {
      v16 = 0;
      v73 = v14;
      do
      {
        if (*(_QWORD *)v103 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * (_QWORD)v16);
        switch((_DWORD)v8)
        {
          case 3:
            v88 = 0u;
            v89 = 0u;
            v86 = 0u;
            v87 = 0u;
            v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "imageEntries"));
            v44 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v86, v107, 16);
            if (v44)
            {
              v45 = v44;
              v46 = *(_QWORD *)v87;
              while (2)
              {
                for (i = 0; i != v45; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v87 != v46)
                    objc_enumerationMutation(v18);
                  if (objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * (_QWORD)i), "level", v67) == 3)
                  {
                    objc_msgSend(v80, "removeObjectIdenticalTo:", v17);
                    goto LABEL_65;
                  }
                }
                v45 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v86, v107, 16);
                if (v45)
                  continue;
                break;
              }
            }
            break;
          case 2:
            v69 = v16;
            obj = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "entryLocationForLevelID:", 2));
            v94 = 0u;
            v95 = 0u;
            v96 = 0u;
            v97 = 0u;
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "imageEntries"));
            v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v94, v109, 16);
            if (v34)
            {
              v35 = v34;
              v36 = *(_QWORD *)v95;
              while (2)
              {
                for (j = 0; j != v35; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v95 != v36)
                    objc_enumerationMutation(v33);
                  v38 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)j);
                  if (objc_msgSend(v38, "state", v67) == 1)
                  {
                    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "entryLocation"));
                    v40 = objc_msgSend(v32, "isEqualToString:", v39);

                    if (v40)
                      objc_msgSend(v80, "removeObjectIdenticalTo:", v17);
                  }
                  else if (objc_msgSend(v38, "level") == 2)
                  {
                    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "dataStoreInformation"));
                    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "urlString"));
                    v43 = objc_msgSend(v41, "isEqualToString:", v42);

                    if (v43)
                    {
                      if ((objc_msgSend(v38, "isExpired") & 1) != 0
                        || objc_msgSend(v38, "quality") == 3)
                      {
                        objc_msgSend(obj, "addObject:", v38);
                      }
                      else
                      {
                        objc_msgSend(v80, "removeObjectIdenticalTo:", v17);
                      }
                      goto LABEL_57;
                    }
                  }
                }
                v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v94, v109, 16);
                if (v35)
                  continue;
                break;
              }
            }
LABEL_57:

            v92 = 0u;
            v93 = 0u;
            v90 = 0u;
            v91 = 0u;
            v18 = obj;
            v48 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v90, v108, 16);
            v15 = v70;
            v12 = v71;
            if (v48)
            {
              v49 = v48;
              v50 = *(_QWORD *)v91;
              do
              {
                for (k = 0; k != v49; k = (char *)k + 1)
                {
                  if (*(_QWORD *)v91 != v50)
                    objc_enumerationMutation(v18);
                  objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * (_QWORD)k), "deleteEntry", v67);
                }
                v49 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v90, v108, 16);
              }
              while (v49);
            }

            v8 = v77;
            v14 = v73;
            v16 = v69;
            break;
          case 1:
            v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v102 + 1) + 8 * (_QWORD)v16), "entryLocationForLevelID:", 1));
            v98 = 0u;
            v99 = 0u;
            v100 = 0u;
            v101 = 0u;
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "imageEntries"));
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v98, v112, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v99;
              while (2)
              {
                for (m = 0; m != v21; m = (char *)m + 1)
                {
                  if (*(_QWORD *)v99 != v22)
                    objc_enumerationMutation(v19);
                  v24 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * (_QWORD)m);
                  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "entryLocation", v67));
                  v26 = objc_msgSend(v25, "isEqualToString:", v18);

                  if (v26)
                  {
                    if (objc_msgSend(v24, "state") == 3)
                    {
                      v27 = BCImageCacheLog();
                      v28 = objc_claimAutoreleasedReturnValue(v27);
                      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                        sub_1B758C(v110, v24, v67, v28);

                    }
                    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "image"));
                    if (!objc_msgSend(v29, "CGImage")
                      || (v30 = objc_msgSend(v17, "quality"),
                          v30 <= objc_msgSend(v24, "quality"))
                      && objc_msgSend(v24, "quality") != 3)
                    {

LABEL_54:
                      objc_msgSend(v80, "removeObjectIdenticalTo:", v17);
                      goto LABEL_55;
                    }
                    v31 = objc_msgSend(v24, "state");

                    if (v31 != 2)
                      goto LABEL_54;
                    objc_msgSend(v24, "deleteEntry");
                  }
                }
                v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v98, v112, 16);
                if (v21)
                  continue;
                break;
              }
            }
LABEL_55:

            v8 = v77;
            v15 = v70;
            v12 = v71;
            v14 = v73;
            break;
          default:
            goto LABEL_66;
        }
LABEL_65:

LABEL_66:
        v16 = (char *)v16 + 1;
      }
      while (v16 != v14);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v102, v113, 16);
    }
    while (v14);
  }

  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  obja = v80;
  v53 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v82, v106, 16);
  if (v53)
  {
    v54 = v53;
    v74 = 0;
    v81 = 0;
    v55 = *(_QWORD *)v83;
    do
    {
      for (n = 0; n != v54; n = (char *)n + 1)
      {
        if (*(_QWORD *)v83 != v55)
          objc_enumerationMutation(obja);
        v57 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)n);
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "entryLocationForLevelID:", v8, v67));
        if ((objc_msgSend(v52, "containsObject:", v58) & 1) == 0)
        {
          objc_msgSend(v52, "addObject:", v58);
          if (-[BICImageSetPersistence _isImagePotentialPrimary:](self, "_isImagePotentialPrimary:", v57))
            v59 = v81 == 0;
          else
            v59 = 0;
          if (v59)
          {
            if (v74 & 1 | (v68 == 0))
            {
              v81 = 0;
            }
            else
            {
              v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "primaryEntry"));
              v74 = 1;
            }
          }
          v60 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetPersistence persistentStore](self, "persistentStore"));
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "addNewImageEntryToSet:", v79));

          objc_msgSend(v61, "setLevel:", v77);
          objc_msgSend(v61, "setState:", 1);
          -[BICImageSetPersistence _populateEntry:fromImage:](self, "_populateEntry:fromImage:", v61, v57);
          v8 = v77;
          objc_msgSend(v79, "errorCheck");
          v62 = -[BICImageSetPersistingAddedEntry initWithDescribedImage:imageEntry:]([BICImageSetPersistingAddedEntry alloc], "initWithDescribedImage:imageEntry:", v57, v61);
          objc_msgSend(v72, "addObject:", v62);

        }
      }
      v54 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v82, v106, 16);
    }
    while (v54);
  }
  else
  {
    v74 = 0;
    v81 = 0;
  }

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetPersistence persistentStore](self, "persistentStore"));
  objc_msgSend(v63, "processPendingChanges");

  if ((v74 & 1) != 0)
  {
    v64 = objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "primaryEntry"));
    v65 = (void *)v64;
    if (v64 && (void *)v64 != v81 && (uint64_t)v68 >= 1)
    {
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "identifier"));
      -[BICImageSetPersistence incrementVersionForIdentifier:](self, "incrementVersionForIdentifier:", v66);

    }
  }

}

- (void)_removeImageEntriesForDescribedImages:(id)a3 inLevelID:(signed __int16)a4 fromSet:(id)a5 removedEntries:(id)a6
{
  int v8;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  uint64_t v21;
  void *v22;
  unsigned int v23;
  id v24;
  NSObject *v25;
  void *v26;
  BICImageSetPersistingAddedEntry *v27;
  uint64_t v28;
  int v29;
  id v30;
  id v31;
  id obj;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  _BYTE v45[128];
  _BYTE v46[128];

  v8 = a4;
  v30 = a3;
  v34 = a6;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "imageEntries"));
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v40;
    v29 = v8;
    v28 = *(_QWORD *)v40;
    do
    {
      v13 = 0;
      v31 = v11;
      do
      {
        if (*(_QWORD *)v40 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v13);
        if (objc_msgSend(v14, "level", v28) == v8)
        {
          v33 = v13;
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[BICDescribedImage describedImageFromImageEntry:](BICDescribedImage, "describedImageFromImageEntry:", v14));
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v16 = v30;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v36;
            do
            {
              for (i = 0; i != v18; i = (char *)i + 1)
              {
                if (*(_QWORD *)v36 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
                v22 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetPersistence imageComparator](self, "imageComparator"));
                v23 = objc_msgSend(v22, "isMatching:withCandidateImage:includeQuality:", v21, v15, 1);

                if (v23)
                {
                  objc_msgSend(v14, "setState:", 3);
                  v24 = BCImageCacheLog();
                  v25 = objc_claimAutoreleasedReturnValue(v24);
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                  {
                    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "entryLocation"));
                    *(_DWORD *)buf = 138412290;
                    v44 = v26;
                    _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "BICImageSetPersistence: Marking for deletion: %@", buf, 0xCu);

                  }
                  v27 = -[BICImageSetPersistingAddedEntry initWithDescribedImage:imageEntry:]([BICImageSetPersistingAddedEntry alloc], "initWithDescribedImage:imageEntry:", v21, v14);
                  objc_msgSend(v34, "addObject:", v27);

                }
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
            }
            while (v18);
          }

          v8 = v29;
          v12 = v28;
          v11 = v31;
          v13 = v33;
        }
        v13 = (char *)v13 + 1;
      }
      while (v13 != v11);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    }
    while (v11);
  }

}

- (BOOL)_isImagePotentialPrimary:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  BOOL v7;
  BOOL v8;
  void *v9;
  BOOL v10;
  void *v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "adamID"));
  v8 = v4
    && ((objc_msgSend(v3, "imageSize"), v6 == CGSizeZero.width) ? (v7 = v5 == CGSizeZero.height) : (v7 = 0), v7)
    && objc_msgSend(v3, "quality") == 203;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filePath"));
  if (v9)
  {
    v10 = objc_msgSend(v3, "quality") > 0xC9;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "urlString"));
    if (v11)
      v10 = objc_msgSend(v3, "quality") > 0xC9;
    else
      v10 = 0;

  }
  return v8 || v10;
}

- (void)_updateAspectRatioForImageSet:(id)a3 size:(CGSize)a4 force:(BOOL)a5
{
  double height;
  double width;
  double v8;
  float v9;
  float v10;
  float v11;
  double v12;
  id v13;

  height = a4.height;
  width = a4.width;
  v13 = a3;
  if (a5
    || (objc_msgSend(v13, "widthForAspectRatio"),
        v10 = v9,
        objc_msgSend(v13, "heightForAspectRatio"),
        v8 = (float)(v10 * v11),
        width * height > v8))
  {
    *(float *)&v8 = width;
    objc_msgSend(v13, "setWidthForAspectRatio:", v8);
    *(float *)&v12 = height;
    objc_msgSend(v13, "setHeightForAspectRatio:", v12);
  }

}

- (void)_populateEntry:(id)a3 fromImage:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double Height;
  void *v22;
  void *v23;
  CGImage *v24;
  double v25;
  unsigned int v26;
  double Width;
  id v28;

  v28 = a3;
  v6 = a4;
  objc_msgSend(v6, "nonShadowArea");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v28, "setProcessingOptions:", objc_msgSend(v6, "processingOptions"));
  objc_msgSend(v6, "imageSize");
  objc_msgSend(v28, "setImageSize:");
  objc_msgSend(v28, "setQuality:", objc_msgSend(v6, "quality"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "entryLocationFromParameters"));
  objc_msgSend(v28, "setEntryLocation:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "expiry"));
  objc_msgSend(v28, "setExpiry:", v16);

  objc_msgSend(v28, "setShadowLeft:", (int)v8);
  objc_msgSend(v28, "setShadowTop:", (int)v10);
  objc_msgSend(v28, "setShadowWidth:", (int)v12);
  objc_msgSend(v28, "setShadowHeight:", (int)v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v28, "setLastUsed:", v17);

  objc_msgSend(v6, "imageSize");
  v19 = v18;
  Height = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "imageSet"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "image"));
  v24 = (CGImage *)objc_msgSend(v23, "CGImage");

  if (v24 && !objc_msgSend(v6, "processingOptions"))
  {
    Width = (double)CGImageGetWidth(v24);
    -[BICImageSetPersistence _updateAspectRatioForImageSet:size:force:](self, "_updateAspectRatioForImageSet:size:force:", v22, objc_msgSend(v22, "actualAspectRatio") ^ 1, Width, (double)CGImageGetHeight(v24));
    objc_msgSend(v22, "setActualAspectRatio:", 1);
  }
  else if ((objc_msgSend(v22, "actualAspectRatio") & 1) == 0)
  {
    v25 = CGSizeZero.width;
    if (CGSizeZero.width != v19 || (v25 = CGSizeZero.height, v25 != Height))
    {
      v26 = objc_msgSend(v6, "unknownAspectRatio", v25);
      if (v24 && v26)
      {
        v19 = (double)CGImageGetWidth(v24);
        Height = (double)CGImageGetHeight(v24);
      }
      -[BICImageSetPersistence _updateAspectRatioForImageSet:size:force:](self, "_updateAspectRatioForImageSet:size:force:", v22, 0, v19, Height);
    }
  }
  objc_msgSend(v28, "setPotentialPrimary:", -[BICImageSetPersistence _isImagePotentialPrimary:](self, "_isImagePotentialPrimary:", v6));

}

- (void)_saveIfNeeded
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[BICImageSetPersistence persistentStore](self, "persistentStore"));
  objc_msgSend(v2, "saveIfNeeded");

}

- (void)addImageEntriesForDescribedImages:(id)a3 inLevelID:(signed __int16)a4 addedEntries:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  BICImageSetPersistence *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  signed __int16 v24;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[BICDescribedImage describedImagesToDictionaryOfSets:](BICDescribedImage, "describedImagesToDictionaryOfSets:", v8));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allKeys"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetPersistence persistentStore](self, "persistentStore"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10E2F4;
    v17[3] = &unk_291568;
    v18 = v8;
    v19 = self;
    v20 = v12;
    v21 = v11;
    v24 = a4;
    v22 = v10;
    v23 = v9;
    v14 = v10;
    v15 = v11;
    v16 = v12;
    objc_msgSend(v13, "performBlock:", v17);

  }
  else
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

- (void)removeImageEntriesForDescribedImages:(id)a3 inLevelID:(signed __int16)a4 removedEntries:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  BICImageSetPersistence *v15;
  id v16;
  signed __int16 v17;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetPersistence persistentStore](self, "persistentStore"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10E770;
  v13[3] = &unk_291540;
  v14 = v8;
  v15 = self;
  v17 = a4;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "performBlock:", v13);

}

- (void)removeImageSets:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BICImageSetPersistence persistentStore](self, "persistentStore"));
  objc_msgSend(v5, "removeImageSets:", v4);

}

- (void)markEntriesAsStored:(id)a3 notStored:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count") || objc_msgSend(v9, "count"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetPersistence persistentStore](self, "persistentStore"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10EA84;
    v14[3] = &unk_28C190;
    v14[4] = self;
    v15 = v8;
    v16 = v9;
    v17 = v10;
    objc_msgSend(v11, "performBlock:", v14);

  }
  else
  {
    v12 = objc_retainBlock(v10);
    v13 = v12;
    if (v12)
      (*((void (**)(id))v12 + 2))(v12);

  }
}

- (void)deleteEntriesMarkedToBeDeleted:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetPersistence persistentStore](self, "persistentStore"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10EDF8;
  v11[3] = &unk_28B750;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlock:", v11);

}

- (void)gatherPrunableItemsForLevel:(signed __int16)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  signed __int16 v11;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetPersistence persistentStore](self, "persistentStore"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10F0BC;
  v9[3] = &unk_291590;
  v11 = a3;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "performBlock:", v9);

}

- (void)gatherPrunableItemsWithIdentifier:(id)a3 forLevel:(signed __int16)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  signed __int16 v16;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetPersistence persistentStore](self, "persistentStore"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10F554;
  v13[3] = &unk_291540;
  v13[4] = self;
  v14 = v8;
  v16 = a4;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "performBlock:", v13);

}

- (void)pruneItems:(id)a3 forMedium:(signed __int16)a4 prunedEntry:(id)a5 withCompletion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  BICImageSetPersistence *v18;
  id v19;
  id v20;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetPersistence persistentStore](self, "persistentStore"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10F980;
  v16[3] = &unk_2915B8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v20 = v11;
  v13 = v11;
  v14 = v10;
  v15 = v9;
  objc_msgSend(v12, "performBlock:", v16);

}

- (void)_inventoryLevel:(signed __int16)a3 addLevelID:(BOOL)a4 completion:(id)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  signed __int16 v13;
  BOOL v14;

  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetPersistence persistentStore](self, "persistentStore"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10FCA4;
  v11[3] = &unk_2915E0;
  v13 = a3;
  v14 = a4;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "performBlock:", v11);

}

- (void)_clean:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BICImageSetPersistence persistentStore](self, "persistentStore"));
  objc_msgSend(v5, "clean:", v4);

}

- (id)metadataForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_11013C;
  v16 = sub_11014C;
  v17 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetPersistence persistentStore](self, "persistentStore"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_110154;
  v9[3] = &unk_28C430;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "performBlockAndWait:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)fetchMetadataForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetPersistence persistentStore](self, "persistentStore"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_11031C;
  v11[3] = &unk_28B750;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlockAndWait:", v11);

}

- (void)imageColorForIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetPersistence persistentStore](self, "persistentStore"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_110520;
  v11[3] = &unk_28B750;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performBlock:", v11);

}

- (void)setImageColor:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetPersistence persistentStore](self, "persistentStore"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_110660;
  v11[3] = &unk_28C5F0;
  v11[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "performBlock:", v11);

}

- (BICImageSetPersistingDelegate)delegate
{
  return self->delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->delegate, a3);
}

- (NSString)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BICDescribedImageComparing)imageComparator
{
  return self->_imageComparator;
}

- (void)setImageComparator:(id)a3
{
  objc_storeStrong((id *)&self->_imageComparator, a3);
}

- (BICPersistentStoring)persistentStore
{
  return self->_persistentStore;
}

- (void)setPersistentStore:(id)a3
{
  objc_storeStrong((id *)&self->_persistentStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentStore, 0);
  objc_storeStrong((id *)&self->_imageComparator, 0);
  objc_storeStrong((id *)&self->identifier, 0);
  objc_storeStrong((id *)&self->delegate, 0);
}

@end
