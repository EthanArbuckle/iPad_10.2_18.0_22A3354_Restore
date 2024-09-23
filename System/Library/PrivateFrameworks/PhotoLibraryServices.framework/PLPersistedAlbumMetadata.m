@implementation PLPersistedAlbumMetadata

- (PLPersistedAlbumMetadata)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPersistedAlbumMetadata.m"), 71, CFSTR("Can't initialize a PLPersistedAlbumMetadata object using -init."));

  return 0;
}

- (PLPersistedAlbumMetadata)initWithPLGenericAlbum:(id)a3 pathManager:(id)a4
{
  id v6;
  PLPersistedAlbumMetadata *v7;
  PLPersistedAlbumMetadata *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PLPersistedAlbumMetadata;
  v7 = -[PLPersistedAlbumMetadata init](&v19, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_genericAlbum, a3);
    -[PLPersistedAlbumMetadata setAllowsOverwrite:](v8, "setAllowsOverwrite:", 1);
    -[PLPersistedAlbumMetadata setInTrash:](v8, "setInTrash:", 0);
    objc_msgSend(v6, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pathManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v10, "privateDirectoryWithSubType:createIfNeeded:error:", 4, 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fileURLWithPath:isDirectory:", v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0CB3940];
    -[PLGenericAlbum uuid](v8->_genericAlbum, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@.%@"), v15, PLPersistedAlbumExtension);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "URLByAppendingPathComponent:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPersistedAlbumMetadata setMetadataURL:](v8, "setMetadataURL:", v17);

  }
  return v8;
}

- (PLPersistedAlbumMetadata)initWithPersistedDataAtURL:(id)a3
{
  id v4;
  PLPersistedAlbumMetadata *v5;
  PLPersistedAlbumMetadata *v6;
  PLPersistedAlbumMetadata *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLPersistedAlbumMetadata;
  v5 = -[PLPersistedAlbumMetadata init](&v9, sel_init);
  v6 = v5;
  if (v5
    && (-[PLPersistedAlbumMetadata setAllowsOverwrite:](v5, "setAllowsOverwrite:", 1),
        -[PLPersistedAlbumMetadata setMetadataURL:](v6, "setMetadataURL:", v4),
        !-[PLPersistedAlbumMetadata _readMetadata](v6, "_readMetadata")))
  {
    v7 = 0;
  }
  else
  {
    v7 = v6;
  }

  return v7;
}

- (PLPersistedAlbumMetadata)initWithTitle:(id)a3 uuid:(id)a4 cloudGUID:(id)a5 kind:(id)a6 assetUUIDs:(id)a7 persistedAlbumDataDirectory:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  PLPersistedAlbumMetadata *v20;
  PLPersistedAlbumMetadata *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v26.receiver = self;
  v26.super_class = (Class)PLPersistedAlbumMetadata;
  v20 = -[PLPersistedAlbumMetadata init](&v26, sel_init);
  v21 = v20;
  if (v20)
  {
    -[PLPersistedAlbumMetadata setAllowsOverwrite:](v20, "setAllowsOverwrite:", 1);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v15, PLPersistedAlbumExtension);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "URLByAppendingPathComponent:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPersistedAlbumMetadata setMetadataURL:](v21, "setMetadataURL:", v23);

    -[PLPersistedAlbumMetadata setTitle:](v21, "setTitle:", v14);
    -[PLPersistedAlbumMetadata setUuid:](v21, "setUuid:", v15);
    if (v16)
      -[PLPersistedAlbumMetadata setCloudGUID:](v21, "setCloudGUID:", v16);
    -[PLPersistedAlbumMetadata setKind:](v21, "setKind:", v17);
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithArray:", v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPersistedAlbumMetadata setAssetUUIDs:](v21, "setAssetUUIDs:", v24);

  }
  return v21;
}

- (void)removePersistedAlbumData
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItemAtURL:error:", self->_metadataURL, 0);

}

- (id)insertAlbumFromDataInManagedObjectContext:(id)a3
{
  id v4;
  int v5;
  __CFString *v6;
  uint64_t v7;
  NSString *title;
  void *v9;
  NSString *customKeyAssetUUID;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSString *uuid;
  BOOL v17;
  NSString *importSessionID;
  void *v19;
  uint8_t buf[4];
  NSString *v21;
  __int16 v22;
  __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NSNumber intValue](self->_kind, "intValue");
  v6 = 0;
  if (v5 > 1549)
  {
    switch(v5)
    {
      case 1550:
      case 1551:
      case 1552:
      case 1553:
      case 1600:
      case 1601:
      case 1602:
      case 1603:
      case 1604:
      case 1605:
      case 1606:
      case 1607:
      case 1608:
      case 1609:
      case 1610:
      case 1611:
      case 1612:
      case 1613:
      case 1614:
      case 1615:
      case 1616:
      case 1617:
      case 1618:
      case 1619:
      case 1620:
      case 1621:
      case 1622:
      case 1623:
      case 1624:
      case 1625:
      case 1626:
      case 1627:
      case 1628:
      case 1629:
      case 1630:
      case 1631:
      case 1632:
      case 1634:
      case 1635:
      case 1636:
      case 1637:
      case 1639:
      case 1640:
      case 1641:
        goto LABEL_3;
      case 1554:
      case 1555:
      case 1556:
      case 1557:
      case 1558:
      case 1559:
      case 1560:
      case 1561:
      case 1562:
      case 1563:
      case 1564:
      case 1565:
      case 1566:
      case 1567:
      case 1568:
      case 1569:
      case 1570:
      case 1571:
      case 1572:
      case 1573:
      case 1574:
      case 1575:
      case 1576:
      case 1577:
      case 1578:
      case 1579:
      case 1580:
      case 1581:
      case 1582:
      case 1583:
      case 1584:
      case 1585:
      case 1586:
      case 1587:
      case 1588:
      case 1589:
      case 1590:
      case 1591:
      case 1592:
      case 1593:
      case 1594:
      case 1595:
      case 1596:
      case 1597:
      case 1598:
      case 1599:
      case 1633:
      case 1638:
        goto LABEL_25;
      default:
        if ((v5 - 3998) >= 9 && (v5 - 3571) >= 3)
          goto LABEL_25;
        goto LABEL_3;
    }
  }
  if (v5 <= 1499)
  {
    v17 = v5 > 0x10 || ((1 << v5) & 0x19004) == 0;
    if (!v17 || v5 == 1000 || v5 == 1100)
    {
LABEL_3:
      v7 = -[NSNumber intValue](self->_kind, "intValue");
      title = self->_title;
      objc_msgSend(v4, "photoLibrary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLGenericAlbum insertNewAlbumWithKind:title:intoLibrary:](PLGenericAlbum, "insertNewAlbumWithKind:title:intoLibrary:", v7, title, v9);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_4:
      if (v6)
      {
        -[__CFString setUuid:](v6, "setUuid:", self->_uuid);
        if (self->_cloudGUID)
          -[__CFString setCloudGUID:](v6, "setCloudGUID:");
        if (self->_inTrash && -[__CFString canMoveToTrash](v6, "canMoveToTrash"))
          -[__CFString applyTrashedState:cascade:](v6, "applyTrashedState:cascade:", 1, 1);
        if (self->_pinned)
          -[__CFString setIsPinned:](v6, "setIsPinned:", 1);
        if (self->_prototype)
          -[__CFString setIsPrototype:](v6, "setIsPrototype:", 1);
        -[__CFString setCustomSortAscending:](v6, "setCustomSortAscending:", self->_customSortAscending);
        -[__CFString setCustomSortKey:](v6, "setCustomSortKey:", self->_customSortKey);
        customKeyAssetUUID = self->_customKeyAssetUUID;
        if (customKeyAssetUUID)
        {
          +[PLManagedAsset assetWithUUID:inManagedObjectContext:](PLManagedAsset, "assetWithUUID:inManagedObjectContext:", customKeyAssetUUID, v4);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            -[__CFString setCustomKeyAsset:](v6, "setCustomKeyAsset:", v11);

        }
        if (self->_userQueryData)
          -[__CFString setUserQueryData:](v6, "setUserQueryData:");
        if (self->_importedByBundleIdentifier)
          -[__CFString setImportedByBundleIdentifier:](v6, "setImportedByBundleIdentifier:");
        goto LABEL_28;
      }
    }
  }
  else
  {
    switch(v5)
    {
      case 1500:
      case 1501:
      case 1502:
      case 1503:
      case 1505:
      case 1508:
        goto LABEL_3;
      case 1506:
        importSessionID = self->_importSessionID;
        if (importSessionID)
        {
          +[PLImportSession insertNewImportSessionAlbumWithImportSessionID:inManagedObjectContext:](PLImportSession, "insertNewImportSessionAlbumWithImportSessionID:inManagedObjectContext:", importSessionID, v4);
          v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_4;
        }
        v6 = CFSTR("ImportSession missing importSessionID");
        break;
      case 1507:
        if (self->_userQueryData)
        {
          objc_msgSend(v4, "photoLibrary");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLGenericAlbum insertNewSmartAlbumIntoLibrary:](PLGenericAlbum, "insertNewSmartAlbumIntoLibrary:", v19);
          v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

          -[__CFString setTitle:](v6, "setTitle:", self->_title);
          goto LABEL_4;
        }
        v6 = CFSTR("User Smart Album missing userQueryData");
        break;
      case 1509:
      case 1510:
        v12 = (void *)MEMORY[0x1E0CB3940];
        PLStringFromPLAlbumKind(v5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ Album is not supported for persistence"), v13);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

        break;
      default:
        break;
    }
  }
LABEL_25:
  PLMigrationGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    uuid = self->_uuid;
    *(_DWORD *)buf = 138412546;
    v21 = uuid;
    v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Failed to create album %@: %@", buf, 0x16u);
  }

  v6 = 0;
LABEL_28:

  return v6;
}

- (void)updateChildrenOrderingInAlbum:(id)a3 includePendingAssetChanges:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  _BYTE v25[18];
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PLPersistedAlbumMetadata assetUUIDs](self, "assetUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", CFSTR("uuid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v7, "isEqual:", v9);
  PLMigrationGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      v13 = objc_msgSend(v9, "count");
      objc_msgSend(v6, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v25 = v13;
      *(_WORD *)&v25[4] = 2112;
      *(_QWORD *)&v25[6] = v14;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Persisted asset UUIDs (%d total) match database ordering for album %@", buf, 0x12u);

    }
  }
  else
  {
    if (v12)
    {
      objc_msgSend(v6, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedAlbumMetadata metadataURL](self, "metadataURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v25 = v15;
      *(_WORD *)&v25[8] = 2112;
      *(_QWORD *)&v25[10] = v17;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Updating assets in album %@ to match persisted UUID ordering from %@", buf, 0x16u);

    }
    objc_msgSend(v7, "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "photoLibrary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLManagedAsset assetsWithUUIDs:options:inLibrary:](PLManagedAsset, "assetsWithUUIDs:options:inLibrary:", v18, v4, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __85__PLPersistedAlbumMetadata_updateChildrenOrderingInAlbum_includePendingAssetChanges___block_invoke;
    v22[3] = &unk_1E366C6C0;
    v23 = v7;
    objc_msgSend(v20, "sortedArrayUsingComparator:", v22);
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "mutableAssets");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObjectsFromArray:", v11);

  }
}

- (id)description
{
  PLPersistedAlbumMetadata *v2;
  uint64_t v3;
  void *genericAlbum;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  void *v15;
  PLGenericAlbum *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PLGenericAlbum *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  unsigned int v32;
  unsigned int v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v40;

  v2 = self;
  if (self->_genericAlbum)
    self = (PLPersistedAlbumMetadata *)self->_genericAlbum;
  -[PLPersistedAlbumMetadata title](self, "title");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v2->_genericAlbum)
    genericAlbum = v2->_genericAlbum;
  else
    genericAlbum = v2;
  objc_msgSend(genericAlbum, "kind");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2->_genericAlbum)
    v5 = v2->_genericAlbum;
  else
    v5 = v2;
  objc_msgSend(v5, "uuid");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2->_genericAlbum)
    v6 = v2->_genericAlbum;
  else
    v6 = v2;
  objc_msgSend(v6, "cloudGUID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2->_genericAlbum)
    v7 = v2->_genericAlbum;
  else
    v7 = v2;
  v8 = objc_msgSend(v7, "isPinned");
  if (v2->_genericAlbum)
    v9 = v2->_genericAlbum;
  else
    v9 = v2;
  v10 = objc_msgSend(v9, "isPrototype");
  if (v2->_genericAlbum)
    v11 = v2->_genericAlbum;
  else
    v11 = v2;
  v12 = objc_msgSend(v11, "isInTrash");
  if (v2->_genericAlbum)
    v13 = v2->_genericAlbum;
  else
    v13 = v2;
  v14 = objc_msgSend(v13, "customSortAscending");
  if (v2->_genericAlbum)
    v15 = v2->_genericAlbum;
  else
    v15 = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v15, "customSortKey"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v2->_genericAlbum;
  v38 = (void *)v3;
  v32 = v8;
  v33 = v14;
  if (v16)
  {
    -[PLGenericAlbum customKeyAsset](v16, "customKeyAsset");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "uuid");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PLPersistedAlbumMetadata customKeyAssetUUID](v2, "customKeyAssetUUID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v2->_genericAlbum)
    v18 = v2->_genericAlbum;
  else
    v18 = v2;
  objc_msgSend(v18, "importSessionID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2->_genericAlbum)
    v20 = v2->_genericAlbum;
  else
    v20 = v2;
  objc_msgSend(v20, "importedByBundleIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2->_genericAlbum)
    v22 = v2->_genericAlbum;
  else
    v22 = v2;
  objc_msgSend(v22, "userQueryData");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D732A0]), "initWithData:", v31);
  if (v23)
  {
    v24 = v2->_genericAlbum;
    if (v24)
      -[PLGenericAlbum assets](v24, "assets");
    else
      -[PLPersistedAlbumMetadata assetUUIDs](v2, "assetUUIDs");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v26, "count");

  }
  else
  {
    v25 = 0;
  }
  v40.receiver = v2;
  v40.super_class = (Class)PLPersistedAlbumMetadata;
  -[PLPersistedAlbumMetadata description](&v40, sel_description);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLGenericAlbum objectID](v2->_genericAlbum, "objectID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringByAppendingFormat:", CFSTR(" album %@ : title:%@, uuid:%@, cloudGUID:%@, importSessionID:%@, kind:%@, pin:%d, prototype:%d, trash:%d, sort:%d asc:%@, keyAsset:%@, childCount:%lu, userQuery:%@ importedByBundleIdentifier:%@"), v28, v38, v36, v35, v19, v37, v32, v10, v12, v33, v30, v39, v25, v23, v21);
  v34 = (id)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (BOOL)_readMetadata
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  void *v31;
  char out[40];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99D50];
  -[PLPersistedAlbumMetadata metadataURL](self, "metadataURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataWithContentsOfURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "pl_safeInitForReadingFromData:", v5);
    v7 = v6 != 0;
    if (v6)
    {
      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedAlbumMetadata setTitle:](self, "setTitle:", v8);

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kind"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedAlbumMetadata setKind:](self, "setKind:", v9);

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedAlbumMetadata setUuid:](self, "setUuid:", v10);

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cloudGUID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedAlbumMetadata setCloudGUID:](self, "setCloudGUID:", v11);

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isPinned"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedAlbumMetadata setPinned:](self, "setPinned:", objc_msgSend(v12, "BOOLValue"));

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isPrototype"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedAlbumMetadata setPrototype:](self, "setPrototype:", objc_msgSend(v13, "BOOLValue"));

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isInTrash"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedAlbumMetadata setInTrash:](self, "setInTrash:", objc_msgSend(v14, "BOOLValue"));

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customSortAscending"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedAlbumMetadata setCustomSortAscending:](self, "setCustomSortAscending:", objc_msgSend(v15, "BOOLValue"));

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customSortKey"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedAlbumMetadata setCustomSortKey:](self, "setCustomSortKey:", objc_msgSend(v16, "intValue"));

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customKeyAssetUUID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedAlbumMetadata setCustomKeyAssetUUID:](self, "setCustomKeyAssetUUID:", v17);

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("importSessionID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedAlbumMetadata setImportSessionID:](self, "setImportSessionID:", v18);

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("importedByBundleIdentifier"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedAlbumMetadata setImportedByBundleIdentifier:](self, "setImportedByBundleIdentifier:", v19);

      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userQueryData"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLPersistedAlbumMetadata setUserQueryData:](self, "setUserQueryData:", v20);
      -[PLPersistedAlbumMetadata userQueryData](self, "userQueryData");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
        objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetUUIDs"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "length");
        v24 = v23 >> 4;
        objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", v23 >> 4);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLPersistedAlbumMetadata setAssetUUIDs:](self, "setAssetUUIDs:", v25);

        v26 = objc_retainAutorelease(v22);
        v27 = objc_msgSend(v26, "bytes");
        if (v23 >= 0x10)
        {
          v28 = v27;
          v29 = 0;
          v30 = 1;
          do
          {
            memset(out, 0, 37);
            uuid_unparse((const unsigned __int8 *)(v28 + 16 * v29), out);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", out, 4);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableOrderedSet addObject:](self->_assetUUIDs, "addObject:", v31);

            v29 = v30;
          }
          while (v24 > v30++);
        }

        v7 = v6 != 0;
      }

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_fetchChildUUIDs
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  NSObject *v32;
  void *v33;
  id v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  const __CFString *v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  -[PLGenericAlbum managedObjectContext](self->_genericAlbum, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C97B20];
  +[PLManagedAlbum entityName](PLManagedAlbum, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "entityForName:inManagedObjectContext:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C97B20];
  +[PLImportSession entityName](PLImportSession, "entityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "entityForName:inManagedObjectContext:", v12, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLGenericAlbum entity](self->_genericAlbum, "entity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isKindOfEntity:", v10);

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0CB3880];
    -[PLGenericAlbum objectID](self->_genericAlbum, "objectID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "predicateWithFormat:", CFSTR("%K CONTAINS %@"), CFSTR("albums"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPredicate:", v18);

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("albums"), 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSortDescriptors:", v20);

  }
  else
  {
    -[PLGenericAlbum entity](self->_genericAlbum, "entity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isKindOfEntity:", v13);

    if (v22)
    {
      v23 = (void *)MEMORY[0x1E0CB3880];
      -[PLGenericAlbum objectID](self->_genericAlbum, "objectID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("importSession"), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPredicate:", v25);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLGenericAlbum entity](self->_genericAlbum, "entity");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPersistedAlbumMetadata.m"), 409, CFSTR("Unsupported entity type: %@"), v26);

    }
  }
  objc_msgSend(v7, "setResultType:", 2);
  v40 = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPropertiesToFetch:", v27);

  objc_msgSend(v7, "setAllocationType:", 2);
  -[PLGenericAlbum managedObjectContext](self->_genericAlbum, "managedObjectContext");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0;
  objc_msgSend(v28, "executeFetchRequest:error:", v7, &v35);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v35;

  if (v29)
  {
    objc_msgSend(v29, "_pl_map:", &__block_literal_global_48409);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLBackendGetLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      -[PLGenericAlbum objectID](self->_genericAlbum, "objectID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v33;
      v38 = 2112;
      v39 = v30;
      _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_ERROR, "Failed to fetch uuids in album ID: %{public}@, error: %@", buf, 0x16u);

    }
    v31 = 0;
  }

  return v31;
}

- (void)_saveMetadata
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *genericAlbum;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  PLGenericAlbum *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  PLGenericAlbum *v34;
  void *v35;
  PLGenericAlbum *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  void *v48;
  void *v49;
  char *v50;
  void *v51;
  uint64_t v52;
  char *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  char *v79;
  void *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  if (-[PLPersistedAlbumMetadata allowsOverwrite](self, "allowsOverwrite"))
    goto LABEL_3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPersistedAlbumMetadata metadataURL](self, "metadataURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "fileExistsAtPath:", v5);

  if ((v6 & 1) == 0)
  {
LABEL_3:
    v7 = (void *)MEMORY[0x19AEC1554]();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v8, "encodeInteger:forKey:", 1, CFSTR("version"));
    if (self->_genericAlbum)
      genericAlbum = self->_genericAlbum;
    else
      genericAlbum = self;
    objc_msgSend(genericAlbum, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v8, "encodeObject:forKey:", v10, CFSTR("title"));
    if (self->_genericAlbum)
      v11 = self->_genericAlbum;
    else
      v11 = self;
    objc_msgSend(v11, "kind");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v8, "encodeObject:forKey:", v12, CFSTR("kind"));
    if (self->_genericAlbum)
      v13 = self->_genericAlbum;
    else
      v13 = self;
    objc_msgSend(v13, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(v8, "encodeObject:forKey:", v14, CFSTR("uuid"));
    if (self->_genericAlbum)
      v15 = self->_genericAlbum;
    else
      v15 = self;
    objc_msgSend(v15, "cloudGUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(v8, "encodeObject:forKey:", v16, CFSTR("cloudGUID"));
    if (self->_genericAlbum)
      v17 = self->_genericAlbum;
    else
      v17 = self;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v17, "isPinned"));
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
      objc_msgSend(v8, "encodeObject:forKey:", v18, CFSTR("isPinned"));
    v78 = (void *)v18;
    if (self->_genericAlbum)
      v19 = self->_genericAlbum;
    else
      v19 = self;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v19, "isPrototype"));
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
      objc_msgSend(v8, "encodeObject:forKey:", v20, CFSTR("isPrototype"));
    v77 = (void *)v20;
    if (self->_genericAlbum)
      v21 = self->_genericAlbum;
    else
      v21 = self;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v21, "isInTrash"));
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
      objc_msgSend(v8, "encodeObject:forKey:", v22, CFSTR("isInTrash"));
    v76 = (void *)v22;
    if (self->_genericAlbum)
      v23 = self->_genericAlbum;
    else
      v23 = self;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v23, "customSortAscending"));
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
      objc_msgSend(v8, "encodeObject:forKey:", v24, CFSTR("customSortAscending"));
    v75 = (void *)v24;
    if (self->_genericAlbum)
      v25 = self->_genericAlbum;
    else
      v25 = self;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v25, "customSortKey"));
    v26 = objc_claimAutoreleasedReturnValue();
    if (v26)
      objc_msgSend(v8, "encodeObject:forKey:", v26, CFSTR("customSortKey"));
    v74 = (void *)v26;
    v27 = self->_genericAlbum;
    if (v27)
    {
      -[PLGenericAlbum customKeyAsset](v27, "customKeyAsset");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "uuid");
      v29 = objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
LABEL_51:
        if (self->_genericAlbum)
          v30 = self->_genericAlbum;
        else
          v30 = self;
        objc_msgSend(v30, "importSessionID");
        v31 = objc_claimAutoreleasedReturnValue();
        if (v31)
          objc_msgSend(v8, "encodeObject:forKey:", v31, CFSTR("importSessionID"));
        v72 = (void *)v31;
        if (self->_genericAlbum)
          v32 = self->_genericAlbum;
        else
          v32 = self;
        objc_msgSend(v32, "importedByBundleIdentifier");
        v33 = objc_claimAutoreleasedReturnValue();
        if (v33)
          objc_msgSend(v8, "encodeObject:forKey:", v33, CFSTR("importedByBundleIdentifier"));
        v71 = (void *)v33;
        v34 = self->_genericAlbum;
        v73 = (void *)v29;
        if (!v34)
          goto LABEL_76;
        -[PLGenericAlbum userQueryData](v34, "userQueryData");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        v36 = self->_genericAlbum;
        if (v35)
        {
          -[PLGenericAlbum userQueryData](v36, "userQueryData");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "encodeObject:forKey:", v37, CFSTR("userQueryData"));

LABEL_86:
          v58 = (void *)MEMORY[0x1E0D73200];
          objc_msgSend(v8, "encodedData");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLPersistedAlbumMetadata metadataURL](self, "metadataURL");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "persistMetadata:fileURL:", v59, v60);

          v61 = (void *)MEMORY[0x1E0D73208];
          -[PLPersistedAlbumMetadata metadataURL](self, "metadataURL");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "path");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "changeFileOwnerToMobileAtPath:error:", v63, 0);

          objc_autoreleasePoolPop(v7);
          return;
        }
        if (v36)
        {
          -[PLPersistedAlbumMetadata _fetchChildUUIDs](self, "_fetchChildUUIDs");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v38;
          v70 = v7;
          if (v38)
          {
            v66 = v16;
            v68 = v14;
            v65 = v10;
            v40 = objc_msgSend(v38, "count");
            v79 = (char *)malloc_type_malloc(16 * v40, 0xD36CB00uLL);
            v81 = 0u;
            v82 = 0u;
            v83 = 0u;
            v84 = 0u;
            v64 = v39;
            v41 = v39;
            v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
            if (v42)
            {
              v43 = v42;
              v44 = 0;
              v45 = *(_QWORD *)v82;
              do
              {
                v46 = 0;
                v47 = &v79[16 * v44];
                do
                {
                  if (*(_QWORD *)v82 != v45)
                    objc_enumerationMutation(v41);
                  objc_msgSend(MEMORY[0x1E0D73308], "parseUUIDString:uuidBuffer:", *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * v46++), v47);
                  v47 += 16;
                }
                while (v43 != v46);
                v44 += v46;
                v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v81, v85, 16);
              }
              while (v43);
            }

            v10 = v65;
            v16 = v66;
            v14 = v68;
            v48 = v79;
            v39 = v64;
          }
          else
          {
            v48 = 0;
            v40 = 0x7FFFFFFFFFFFFFFFLL;
          }

        }
        else
        {
LABEL_76:
          v70 = v7;
          -[PLPersistedAlbumMetadata assetUUIDs](self, "assetUUIDs");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v49, "count");

          v50 = (char *)malloc_type_malloc(16 * v40, 0x5267FEC8uLL);
          v48 = v50;
          if (!v40)
          {
LABEL_85:
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v48, 16 * v40, 1);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "encodeObject:forKey:", v57, CFSTR("assetUUIDs"));

            v7 = v70;
            goto LABEL_86;
          }
          v67 = v16;
          v69 = v14;
          v51 = v10;
          v52 = 0;
          v80 = v50;
          v53 = v50;
          do
          {
            v54 = (void *)MEMORY[0x1E0D73308];
            -[PLPersistedAlbumMetadata assetUUIDs](self, "assetUUIDs");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "objectAtIndex:", v52);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "parseUUIDString:uuidBuffer:", v56, v53);

            ++v52;
            v53 += 16;
          }
          while (v40 != v52);
          v10 = v51;
          v14 = v69;
          v16 = v67;
          v48 = v80;
        }
        if (v40 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v7 = v70;
          if (v48)
            free(v48);
          goto LABEL_86;
        }
        goto LABEL_85;
      }
    }
    else
    {
      -[PLPersistedAlbumMetadata customKeyAssetUUID](self, "customKeyAssetUUID");
      v29 = objc_claimAutoreleasedReturnValue();
      if (!v29)
        goto LABEL_51;
    }
    objc_msgSend(v8, "encodeObject:forKey:", v29, CFSTR("customKeyAssetUUID"));
    goto LABEL_51;
  }
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSString)cloudGUID
{
  return self->_cloudGUID;
}

- (void)setCloudGUID:(id)a3
{
  objc_storeStrong((id *)&self->_cloudGUID, a3);
}

- (NSNumber)kind
{
  return self->_kind;
}

- (void)setKind:(id)a3
{
  objc_storeStrong((id *)&self->_kind, a3);
}

- (BOOL)isFolder
{
  return self->_isFolder;
}

- (BOOL)isPinned
{
  return self->_pinned;
}

- (void)setPinned:(BOOL)a3
{
  self->_pinned = a3;
}

- (BOOL)isPrototype
{
  return self->_prototype;
}

- (void)setPrototype:(BOOL)a3
{
  self->_prototype = a3;
}

- (BOOL)isInTrash
{
  return self->_inTrash;
}

- (void)setInTrash:(BOOL)a3
{
  self->_inTrash = a3;
}

- (BOOL)customSortAscending
{
  return self->_customSortAscending;
}

- (void)setCustomSortAscending:(BOOL)a3
{
  self->_customSortAscending = a3;
}

- (int)customSortKey
{
  return self->_customSortKey;
}

- (void)setCustomSortKey:(int)a3
{
  self->_customSortKey = a3;
}

- (NSString)customKeyAssetUUID
{
  return self->_customKeyAssetUUID;
}

- (void)setCustomKeyAssetUUID:(id)a3
{
  objc_storeStrong((id *)&self->_customKeyAssetUUID, a3);
}

- (NSMutableOrderedSet)assetUUIDs
{
  return self->_assetUUIDs;
}

- (void)setAssetUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_assetUUIDs, a3);
}

- (NSString)importSessionID
{
  return self->_importSessionID;
}

- (void)setImportSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_importSessionID, a3);
}

- (NSData)userQueryData
{
  return self->_userQueryData;
}

- (void)setUserQueryData:(id)a3
{
  objc_storeStrong((id *)&self->_userQueryData, a3);
}

- (NSString)importedByBundleIdentifier
{
  return self->_importedByBundleIdentifier;
}

- (void)setImportedByBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_importedByBundleIdentifier, a3);
}

- (NSString)projectDocumentType
{
  return self->_projectDocumentType;
}

- (void)setProjectDocumentType:(id)a3
{
  objc_storeStrong((id *)&self->_projectDocumentType, a3);
}

- (BOOL)allowsOverwrite
{
  return self->_allowsOverwrite;
}

- (void)setAllowsOverwrite:(BOOL)a3
{
  self->_allowsOverwrite = a3;
}

- (PLGenericAlbum)genericAlbum
{
  return self->_genericAlbum;
}

- (void)setGenericAlbum:(id)a3
{
  objc_storeStrong((id *)&self->_genericAlbum, a3);
}

- (NSURL)metadataURL
{
  return self->_metadataURL;
}

- (void)setMetadataURL:(id)a3
{
  objc_storeStrong((id *)&self->_metadataURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataURL, 0);
  objc_storeStrong((id *)&self->_genericAlbum, 0);
  objc_storeStrong((id *)&self->_projectDocumentType, 0);
  objc_storeStrong((id *)&self->_importedByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_userQueryData, 0);
  objc_storeStrong((id *)&self->_importSessionID, 0);
  objc_storeStrong((id *)&self->_assetUUIDs, 0);
  objc_storeStrong((id *)&self->_customKeyAssetUUID, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_cloudGUID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

uint64_t __44__PLPersistedAlbumMetadata__fetchChildUUIDs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("uuid"));
}

uint64_t __85__PLPersistedAlbumMetadata_updateChildrenOrderingInAlbum_includePendingAssetChanges___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "indexOfObject:", v7);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(v6, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v9, "indexOfObject:", v10);
  if (v8 < v11)
    return -1;
  else
    return v8 > v11;
}

+ (BOOL)isValidPath:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", PLPersistedAlbumExtension);

  return v4;
}

@end
