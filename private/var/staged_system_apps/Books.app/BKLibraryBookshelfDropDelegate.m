@implementation BKLibraryBookshelfDropDelegate

- (id)collectionViewCollectionID:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataSource"));
  v4 = BUProtocolCast(&OBJC_PROTOCOL___BKLibraryBookshelfBooksDataSourceProtocol, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataSourceID"));
  return v6;
}

- (BOOL)collectionViewIsEditable:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dataSource"));
  v4 = BUProtocolCast(&OBJC_PROTOCOL___BKLibraryBookshelfBooksDataSourceProtocol, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  LOBYTE(v3) = objc_msgSend(v5, "isEditable");
  return (char)v3;
}

- (BOOL)collectionViewIsReorderable:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, 0));
  v6 = objc_msgSend(v4, "collectionView:canMoveItemAtIndexPath:", v3, v5);

  return v6;
}

- (void)collectionView:(id)a3 performDropWithCoordinator:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  unsigned int v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  id obj;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[4];
  id v71;
  id v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  _BYTE v80[128];

  v64 = a3;
  v74 = 0;
  v75 = &v74;
  v76 = 0x3032000000;
  v77 = sub_10004E468;
  v78 = sub_10004E2A8;
  v62 = a4;
  v79 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "destinationIndexPath"));
  if (!v75[5])
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, 0));
    v7 = (void *)v75[5];
    v75[5] = v6;

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "proposal"));
  v9 = objc_msgSend(v8, "operation") == (id)3;

  if (v9)
  {
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_10015BCA0;
    v70[3] = &unk_1008E7658;
    v71 = v64;
    v10 = v62;
    v72 = v10;
    v73 = &v74;
    objc_msgSend(v71, "performBatchUpdates:completion:", v70, &stru_1008EC568);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "items"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dragItem"));
    v14 = objc_msgSend(v10, "dropItem:toItemAtIndexPath:", v13, v75[5]);

    v15 = v71;
LABEL_27:

    goto LABEL_28;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "proposal"));
  v17 = objc_msgSend(v16, "operation") == (id)2;

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "session"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localDragSession"));

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "dataSource"));
      v21 = BUProtocolCast(&OBJC_PROTOCOL___BKLibraryBookshelfBooksDataSourceProtocol, v20);
      v63 = (void *)objc_claimAutoreleasedReturnValue(v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "items"));
      obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "reverseObjectEnumerator"));

      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v67;
        do
        {
          v26 = 0;
          do
          {
            if (*(_QWORD *)v67 != v25)
              objc_enumerationMutation(obj);
            v27 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)v26);
            v28 = objc_opt_class(BKLibraryAsset);
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "dragItem"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localObject"));
            v31 = BUDynamicCast(v28, v30);
            v32 = (void *)objc_claimAutoreleasedReturnValue(v31);

            v33 = objc_opt_class(BSUIItemDescription);
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "dragItem"));
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "localObject"));
            v36 = BUDynamicCast(v33, v35);
            v37 = (void *)objc_claimAutoreleasedReturnValue(v36);

            v38 = objc_opt_class(BCAssetDragInfo);
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "dragItem"));
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localObject"));
            v41 = BUDynamicCast(v38, v40);
            v42 = (void *)objc_claimAutoreleasedReturnValue(v41);

            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "assetID"));
            v44 = objc_msgSend(v43, "length");

            if (v44)
            {
              v45 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
              v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "assetID"));
              v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "libraryAssetOnMainQueueWithAssetID:", v46));

              v32 = (void *)v47;
            }
            if (v32)
            {
              objc_msgSend(v22, "addObject:", v32);
            }
            else if (v37)
            {
              v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "storeID"));
              objc_msgSend(v63, "collectionView:addBookStoreItem:", v64, v48);

            }
            v26 = (char *)v26 + 1;
          }
          while (v24 != v26);
          v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
        }
        while (v24);
      }

      objc_msgSend(v63, "collectionView:addAssets:", v64, v22);
      v15 = v63;
      goto LABEL_27;
    }
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "session"));
    v50 = sub_10012A4BC();
    v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
    if (sub_10012B6D8(v49, v51))
    {

LABEL_24:
      v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "window"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate sceneManager](BKAppDelegate, "sceneManager"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "sceneControllerForWindow:", v15));

      v56 = objc_msgSend(v55, "newShowURLTransaction");
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "session"));
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfDropDelegate collectionViewCollectionID:](self, "collectionViewCollectionID:", v64));
      sub_10012A7FC(v57, v58, v56);

      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "session"));
      v60 = sub_10012B530(v59);

      if (v60)
      {
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "session"));
        sub_10012A708(v61);

      }
      goto LABEL_27;
    }
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "session"));
    v53 = sub_10012B768(v52);

    if (v53)
      goto LABEL_24;
  }
LABEL_28:
  _Block_object_dispose(&v74, 8);

}

- (BOOL)collectionView:(id)a3 canHandleDropSession:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  int v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  unsigned int v51;
  uint64_t v53;
  id v54;
  id v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localDragSession"));

  if (v8)
  {
    v9 = objc_opt_class(NSString);
    v55 = v6;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localDragSession"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localContext"));
    v12 = BUDynamicCast(v9, v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);

    v6 = v55;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfDropDelegate collectionViewCollectionID:](self, "collectionViewCollectionID:", v55));
    if (!objc_msgSend((id)v13, "isEqualToString:")
      || (objc_msgSend(v56, "isEqualToString:", kBKCollectionDefaultIDFinished) & 1) == 0)
    {
      if (-[BKLibraryBookshelfDropDelegate collectionViewIsEditable:](self, "collectionViewIsEditable:", v55))
      {
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "items"));
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
        if (v15)
        {
          v16 = v15;
          v53 = v13;
          v54 = v7;
          v17 = *(_QWORD *)v62;
          while (2)
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(_QWORD *)v62 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i);
              v20 = objc_opt_class(BKLibraryAsset);
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localObject"));
              v22 = BUDynamicCast(v20, v21);
              v23 = objc_claimAutoreleasedReturnValue(v22);

              v24 = objc_opt_class(BSUIItemDescription);
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localObject"));
              v26 = BUDynamicCast(v24, v25);
              v27 = objc_claimAutoreleasedReturnValue(v26);

              v28 = objc_opt_class(BCAssetDragInfo);
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localObject"));
              v30 = BUDynamicCast(v28, v29);
              v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "assetID"));
              v33 = objc_msgSend(v32, "length");

              if (v33)
              {
                v34 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
                v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "assetID"));
                v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "libraryAssetOnMainQueueWithAssetID:", v35));

                v23 = v36;
              }

              if (v23 | v27)
              {
                v37 = 1;
                goto LABEL_29;
              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v61, v66, 16);
            if (v16)
              continue;
            break;
          }
LABEL_15:
          v37 = 0;
LABEL_29:
          v7 = v54;
          v6 = v55;
          v13 = v53;
          goto LABEL_32;
        }
        v37 = 0;
        goto LABEL_32;
      }
      if (-[BKLibraryBookshelfDropDelegate collectionViewIsReorderable:](self, "collectionViewIsReorderable:", v55))
      {
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "items"));
        v40 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
        if (v40)
        {
          v41 = v40;
          v53 = v13;
          v54 = v7;
          v42 = *(_QWORD *)v58;
LABEL_20:
          v43 = 0;
          while (1)
          {
            if (*(_QWORD *)v58 != v42)
              objc_enumerationMutation(v14);
            v44 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v43);
            v45 = objc_opt_class(BKLibraryAsset);
            v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "localObject"));
            v47 = BUDynamicCast(v45, v46);
            v48 = (void *)objc_claimAutoreleasedReturnValue(v47);

            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "collectionMembers"));
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "valueForKey:", CFSTR("collectionID")));
            v51 = objc_msgSend(v50, "containsObject:", v56);

            if (!v51)
              goto LABEL_15;
            if (v41 == (id)++v43)
            {
              v41 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v57, v65, 16);
              v37 = 1;
              if (v41)
                goto LABEL_20;
              goto LABEL_29;
            }
          }
        }
        v37 = 1;
LABEL_32:

        goto LABEL_33;
      }
    }
    v37 = 0;
LABEL_33:

    LOBYTE(v13) = v37 != 0;
    goto LABEL_34;
  }
  v38 = sub_10012A350();
  v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
  v13 = objc_msgSend(v7, "hasItemsConformingToTypeIdentifiers:", v39);

LABEL_34:
  return v13;
}

- (id)collectionView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *i;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  BKLibraryBookshelfDropDelegate *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  unsigned __int8 v39;
  id v40;
  id v41;
  uint64_t v42;
  void *j;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  unsigned int v60;
  uint64_t v61;
  id v62;
  id v64;
  id v65;
  uint64_t v66;
  id v67;
  id v68;
  BKLibraryBookshelfDropDelegate *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localDragSession"));

  if (!v9)
  {
    v37 = sub_10012A4BC();
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    if ((sub_10012B6D8(v8, v38) & 1) != 0)
    {

    }
    else
    {
      v39 = sub_10012B768(v8);

      if ((v39 & 1) == 0)
        goto LABEL_41;
    }
    v36 = 0;
    v35 = 0;
    v14 = 2;
    goto LABEL_52;
  }
  v69 = self;
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "items"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v79;
    v14 = 2;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v79 != v13)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)i);
        v17 = objc_opt_class(BSUIItemDescription);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localObject"));
        v19 = BUDynamicCast(v17, v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

        if (v20)
        {
          v36 = 0;
          v35 = 0;
          goto LABEL_51;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
    }
    while (v12);
  }

  v21 = v69;
  if (-[BKLibraryBookshelfDropDelegate collectionViewIsReorderable:](v69, "collectionViewIsReorderable:", v7))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfDropDelegate collectionViewCollectionID:](v69, "collectionViewCollectionID:", v7));
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "items"));
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
    if (!v23)
    {
      v36 = 1;
      v14 = 3;
      v35 = 1;
      goto LABEL_50;
    }
    v24 = v23;
    v64 = v8;
    v67 = v7;
    v25 = *(_QWORD *)v75;
LABEL_13:
    v26 = 0;
    while (1)
    {
      if (*(_QWORD *)v75 != v25)
        objc_enumerationMutation(v22);
      v27 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v26);
      v28 = objc_opt_class(BKLibraryAsset);
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localObject"));
      v30 = BUDynamicCast(v28, v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "collectionMembers"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "valueForKey:", CFSTR("collectionID")));
      v34 = objc_msgSend(v33, "containsObject:", v10);

      if (!v34)
        break;
      if (v24 == (id)++v26)
      {
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
        if (!v24)
        {
          v35 = 1;
          v36 = 1;
          v7 = v67;
          v8 = v64;
          v14 = 3;
LABEL_50:

          goto LABEL_51;
        }
        goto LABEL_13;
      }
    }

    v7 = v67;
    v21 = v69;
    v8 = v64;
  }
  if (!-[BKLibraryBookshelfDropDelegate collectionViewIsEditable:](v21, "collectionViewIsEditable:", v7, v64))
  {
LABEL_41:
    v36 = 0;
    v35 = 0;
    v14 = 1;
    goto LABEL_52;
  }
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "items"));
  v40 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
  if (!v40)
  {
    v36 = 0;
    v35 = 0;
    goto LABEL_44;
  }
  v41 = v40;
  v65 = v8;
  v68 = v7;
  v42 = *(_QWORD *)v71;
  v66 = kBKCollectionDefaultIDFinished;
  while (2)
  {
    for (j = 0; j != v41; j = (char *)j + 1)
    {
      if (*(_QWORD *)v71 != v42)
        objc_enumerationMutation(v10);
      v44 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)j);
      v45 = objc_opt_class(BKLibraryAsset);
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "localObject"));
      v47 = BUDynamicCast(v45, v46);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v47);

      v48 = objc_opt_class(BCAssetDragInfo);
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "localObject"));
      v50 = BUDynamicCast(v48, v49);
      v51 = (void *)objc_claimAutoreleasedReturnValue(v50);

      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "assetID"));
      v53 = objc_msgSend(v52, "length");

      if (v53)
      {
        v54 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "assetID"));
        v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "libraryAssetOnMainQueueWithAssetID:", v55));

        v22 = (void *)v56;
      }
      if (v22)
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookshelfDropDelegate collectionViewCollectionID:](v21, "collectionViewCollectionID:", v68));
        if (objc_msgSend(v57, "isEqualToString:", v66))
        {
          if (objc_msgSend(v22, "isFinished"))
            v61 = 1;
          else
            v61 = 2;
        }
        else
        {
          v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "collectionMembers"));
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "valueForKey:", CFSTR("collectionID")));
          v60 = objc_msgSend(v59, "containsObject:", v57);

          if (v60)
          {

            v21 = v69;
            goto LABEL_38;
          }
          v61 = 2;
        }

        v36 = 0;
        v35 = 0;
        v7 = v68;
        v8 = v65;
        v14 = v61;
        goto LABEL_50;
      }
LABEL_38:

    }
    v41 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
    if (v41)
      continue;
    break;
  }
  v36 = 0;
  v35 = 0;
  v7 = v68;
  v8 = v65;
LABEL_44:
  v14 = 1;
LABEL_51:

LABEL_52:
  v62 = objc_msgSend(objc_alloc((Class)UICollectionViewDropProposal), "initWithDropOperation:intent:", v14, v35);
  objc_msgSend(v62, "setPrefersFullSizePreview:", v36);

  return v62;
}

- (void)collectionView:(id)a3 dropSessionDidEnter:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v6 = a4;
  if (!-[BKLibraryBookshelfDropDelegate inDropSession](self, "inDropSession"))
  {
    -[BKLibraryBookshelfDropDelegate setInDropSession:](self, "setInDropSession:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "delegate"));
    v8 = BUProtocolCast(&OBJC_PROTOCOL___BKLibraryBookshelfDragObserving, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    objc_msgSend(v9, "dragAndDropSessionDidStart");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "items"));
  if (objc_msgSend(v10, "count") == (id)1)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "dataSource"));
    v12 = BUProtocolCast(&OBJC_PROTOCOL___BKLibraryBookshelfBooksDataSourceProtocol, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    v14 = objc_opt_class(BKLibraryAsset);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localObject"));
    v17 = BUDynamicCast(v14, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "indexPathForRepresentedObject:", v18));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "indexPathsForSelectedItems"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "firstObject"));

    if (v19 == v21)
    {
      objc_msgSend(v22, "setAllowsSelection:", 0);
      -[BKLibraryBookshelfDropDelegate setShouldRestoreSelectionForSingleItemReordering:](self, "setShouldRestoreSelectionForSingleItemReordering:", 1);
    }

  }
}

- (void)collectionView:(id)a3 dropSessionDidEnd:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "delegate"));
  v8 = BUProtocolCast(&OBJC_PROTOCOL___BKLibraryBookshelfDragObserving, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  objc_msgSend(v9, "dragAndDropSessionDidEnd");
  -[BKLibraryBookshelfDropDelegate setInDropSession:](self, "setInDropSession:", 0);
  if (-[BKLibraryBookshelfDropDelegate shouldRestoreSelectionForSingleItemReordering](self, "shouldRestoreSelectionForSingleItemReordering"))
  {
    objc_msgSend(v20, "setAllowsSelection:", 1);
    objc_msgSend(v20, "setAllowsMultipleSelection:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "dataSource"));
    v11 = BUProtocolCast(&OBJC_PROTOCOL___BKLibraryBookshelfBooksDataSourceProtocol, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    v13 = objc_opt_class(BKLibraryAsset);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "items"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "firstObject"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localObject"));
    v17 = BUDynamicCast(v13, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "indexPathForRepresentedObject:", v18));
    objc_msgSend(v20, "selectItemAtIndexPath:animated:scrollPosition:", v19, 0, 0);
    -[BKLibraryBookshelfDropDelegate setShouldRestoreSelectionForSingleItemReordering:](self, "setShouldRestoreSelectionForSingleItemReordering:", 0);

  }
}

- (id)collectionView:(id)a3 dropPreviewParametersForItemAtIndexPath:(id)a4
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cellForItemAtIndexPath:", a4));
  v5 = BUProtocolCast(&OBJC_PROTOCOL___BKLibraryBookshelfBookCell, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dragPreviewParametersForDrop:", 1));
  return v7;
}

- (BOOL)inDropSession
{
  return self->_inDropSession;
}

- (void)setInDropSession:(BOOL)a3
{
  self->_inDropSession = a3;
}

- (BOOL)shouldRestoreSelectionForSingleItemReordering
{
  return self->_shouldRestoreSelectionForSingleItemReordering;
}

- (void)setShouldRestoreSelectionForSingleItemReordering:(BOOL)a3
{
  self->_shouldRestoreSelectionForSingleItemReordering = a3;
}

@end
