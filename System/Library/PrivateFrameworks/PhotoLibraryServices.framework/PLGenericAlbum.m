@implementation PLGenericAlbum

+ (id)defaultAlbumKindsForFetchingWithCPLEnabled:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a3)
  {
    v5 = &unk_1E3763548;
  }
  else
  {
    objc_msgSend(&unk_1E3763548, "arrayByAddingObject:", &unk_1E375E238, v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)isEligibleForSearchIndexing
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  if ((-[PLGenericAlbum isDeleted](self, "isDeleted") & 1) != 0)
    return 0;
  v4 = (void *)objc_opt_class();
  -[PLGenericAlbum photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", +[PLSpotlightDonationUtilities wellKnownPhotoLibraryIdentifierFromPLPhotoLibrary:](PLSpotlightDonationUtilities, "wellKnownPhotoLibraryIdentifierFromPLPhotoLibrary:", v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "evaluateWithObject:", self);

  return v7;
}

- (BOOL)isCandidateForSearchIndexing
{
  void *v3;

  objc_msgSend((id)objc_opt_class(), "_baseIndexingPredicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "evaluateWithObject:", self);

  return (char)self;
}

+ (id)_baseIndexingPredicate
{
  pl_dispatch_once();
  return (id)_baseIndexingPredicate_predicate;
}

+ (id)isEligibleForSearchIndexingPredicateForLibraryIdentifier:(int64_t)a3
{
  pl_dispatch_once();
  return (id)isEligibleForSearchIndexingPredicateForLibraryIdentifier__predicate;
}

+ (id)propertiesToFetch
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("uuid");
  v3[1] = CFSTR("title");
  v3[2] = CFSTR("startDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)relationshipKeyPathsToPrefetch
{
  return 0;
}

+ (id)fetchAlbumsWithUUIDs:(id)a3 managedObjectContext:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v17;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C97B48];
  v8 = a4;
  +[PLGenericAlbum entityName](PLGenericAlbum, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "propertiesToFetch");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPropertiesToFetch:", v11);

  objc_msgSend(v10, "setIncludesPendingChanges:", 0);
  if ((unint64_t)objc_msgSend(v6, "count") >= 0x65)
    objc_msgSend(v10, "setFetchBatchSize:", 100);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid IN %@"), v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v12);

  objc_msgSend(v10, "setFetchLimit:", objc_msgSend(v6, "count"));
  v17 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v10, &v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v17;
  if (v13)
    objc_msgSend(MEMORY[0x1E0D732B8], "successWithResult:", v13);
  else
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)fetchAlbumsForAssetObjectID:(id)a3 libraryIdentifier:(int64_t)a4 managedObjectContext:(id)a5
{
  id v8;
  id v9;
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
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  _BYTE v38[128];
  _QWORD v39[4];
  _QWORD v40[4];

  v40[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAlbum entityName](PLManagedAlbum, "entityName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchRequestWithEntityName:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ IN %K"), v8, CFSTR("assets"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v14;
  objc_msgSend(a1, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "andPredicateWithSubpredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPredicate:", v17);

  v32 = v8;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ IN %K"), v8, CFSTR("assets"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPredicate:", v18);

  v39[0] = CFSTR("uuid");
  v39[1] = CFSTR("cachedCount");
  v39[2] = CFSTR("trashedState");
  v39[3] = CFSTR("kind");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPropertiesToFetch:", v19);

  v37 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v12, &v37);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v37;
  if (v20)
  {
    v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v23 = v20;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v34 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if (objc_msgSend(v28, "isEligibleForSearchIndexing"))
            objc_msgSend(v22, "addObject:", v28);
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v25);
    }

    v29 = (void *)objc_msgSend(v22, "copy");
    objc_msgSend(MEMORY[0x1E0D732B8], "successWithResult:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", v21);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v30;
}

void __91__PLGenericAlbum_SearchIndexing__isEligibleForSearchIndexingPredicateForLibraryIdentifier___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(*(id *)(a1 + 32), "_baseIndexingPredicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("trashedState == %d"), 0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "andPredicateWithSubpredicates:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)isEligibleForSearchIndexingPredicateForLibraryIdentifier__predicate;
  isEligibleForSearchIndexingPredicateForLibraryIdentifier__predicate = v5;

}

void __56__PLGenericAlbum_SearchIndexing___baseIndexingPredicate__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(kind == %d OR kind == %d)"), 2, 1550);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_baseIndexingPredicate_predicate;
  _baseIndexingPredicate_predicate = v0;

}

+ (id)entityName
{
  return CFSTR("GenericAlbum");
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___PLGenericAlbum;
  v3 = a3;
  objc_msgSendSuper2(&v9, sel_keyPathsForValuesAffectingValueForKey_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("kindValue"), v9.receiver, v9.super_class);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("kind"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setByAddingObjectsFromSet:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  return v4;
}

+ (id)childKeyForOrdering
{
  return 0;
}

+ (id)localizedRecoveredTitle
{
  return (id)PLServicesLocalizedFrameworkStringForAssetsd();
}

+ (id)keyPathsForValuesAffectingName
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("kind"), CFSTR("title"), 0);
}

+ (id)localizedTitleForAlbumKind:(int)a3 cplEnabled:(BOOL)a4
{
  __CFString *v4;

  if (a3 > 1509)
  {
    v4 = CFSTR("Action Camera");
    switch(a3)
    {
      case 1552:
      case 1600:
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
      case 1630:
      case 1631:
      case 1632:
      case 1634:
      case 1639:
      case 1640:
      case 1641:
        goto LABEL_12;
      case 1553:
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
      case 1601:
      case 1629:
      case 1633:
      case 1635:
      case 1638:
        return 0;
      case 1636:
        PLServicesSharedLibraryLocalizedFrameworkString();
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v4;
      case 1637:
        return v4;
      default:
        switch(a3)
        {
          case 3998:
          case 3999:
          case 4003:
          case 4006:
            goto LABEL_12;
          case 4000:
            return 0;
          case 4001:
          case 4002:
          case 4004:
          case 4005:
            DCIM_IS_PAD();
            goto LABEL_12;
          default:
            if (a3 != 1510)
              return 0;
            goto LABEL_12;
        }
    }
  }
  if (a3 > 1505)
  {
    if (a3 == 1506 || a3 == 1509)
      goto LABEL_12;
    return 0;
  }
  if (a3 == 1000)
  {
    MGGetBoolAnswer();
    goto LABEL_12;
  }
  if (a3 != 1500)
    return 0;
LABEL_12:
  PLServicesLocalizedFrameworkString();
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return v4;
}

+ (id)predicateForAlbumsSupportingCustomKeyAsset
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("kind"), &unk_1E3763560);
}

+ (id)predicateForAlbumsSupportingCachedKeyAssets
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("kind"), &unk_1E3763578);
}

+ (BOOL)supportsCustomKeyAssetWithAlbumKind:(int)a3
{
  return a3 == 2 || a3 == 1508;
}

+ (BOOL)supportsCachedKeyAssetsWithAlbumKind:(int)a3
{
  BOOL v3;

  v3 = a3 == 1508;
  if (a3 == 1505)
    v3 = 1;
  return a3 == 2 || v3;
}

+ (void)updateKeyAssetsInAlbums:(id)a3 photoLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  _QWORD v38[2];
  _QWORD v39[4];

  v39[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAlbum entityName](PLManagedAlbum, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchRequestWithEntityName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLGenericAlbum predicateForAlbumsSupportingCachedKeyAssets](PLGenericAlbum, "predicateForAlbumsSupportingCachedKeyAssets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF in %@"), v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB3528];
    v39[0] = v12;
    v39[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "andPredicateWithSubpredicates:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v15;
  }
  objc_msgSend(v10, "setPredicate:", v11);
  v38[0] = CFSTR("keyAssets");
  v38[1] = CFSTR("customKeyAsset");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRelationshipKeyPathsForPrefetching:", v16);

  objc_msgSend(v7, "managedObjectContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v17, "executeFetchRequest:error:", v10, &v30);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v30;

  if (v18)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v20 = v18;
    v21 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v27 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "updateKeyAssetsIfNeeded");
        }
        v22 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
      }
      while (v22);
    }
  }
  else
  {
    PLBackendGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v25;
      v33 = 2114;
      v34 = v10;
      v35 = 2112;
      v36 = v19;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "%{public}@ failed to fetch albums with %{public}@: %@", buf, 0x20u);

    }
  }

}

+ (id)sortDescriptorsForAssetsInAlbumWithSortKey:(unsigned int)a3 ascending:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _DWORD v16[2];
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0u:
      goto LABEL_5;
    case 1u:
      v6 = (void *)MEMORY[0x1E0CB3928];
      v7 = CFSTR("dateCreated");
      goto LABEL_10;
    case 2u:
      v6 = (void *)MEMORY[0x1E0CB3928];
      v7 = CFSTR("modificationDate");
      goto LABEL_10;
    case 3u:
      v6 = (void *)MEMORY[0x1E0CB3928];
      v7 = CFSTR("addedDate");
      goto LABEL_10;
    case 4u:
      v6 = (void *)MEMORY[0x1E0CB3928];
      v7 = CFSTR("trashedDate");
      goto LABEL_10;
    case 5u:
      goto LABEL_6;
    default:
      if (a3 == 101)
      {
LABEL_6:
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", CFSTR("additionalAttributes.title"), a4, sel_localizedCaseInsensitiveCompare_);
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a3 != 100)
          goto LABEL_16;
LABEL_5:
        v6 = (void *)MEMORY[0x1E0CB3928];
        v7 = CFSTR("albums");
LABEL_10:
        objc_msgSend(v6, "sortDescriptorWithKey:ascending:", v7, a4);
        v8 = objc_claimAutoreleasedReturnValue();
      }
      v9 = (void *)v8;
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (a3 == 1
          || (objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), v4),
              v11 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v10, "addObject:", v11),
              v11,
              a3 != 3))
        {
          objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v12);

        }
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v13);

        goto LABEL_19;
      }
LABEL_16:
      PLBackendGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v16[0] = 67109120;
        v16[1] = a3;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_INFO, "Unexpected album sort key value: %d", (uint8_t *)v16, 8u);
      }

      v9 = 0;
      v10 = 0;
LABEL_19:

      return v10;
  }
}

+ (BOOL)_validateCurrentKeyAssetIDs:(id)a3 fetchedKeyAssetIDs:(id)a4 customKeyAssetID:(id)a5 maxCount:(int64_t)a6
{
  id v9;
  id v10;
  id v11;
  char v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    if (!objc_msgSend(v9, "count") && !objc_msgSend(v10, "count"))
    {
      v12 = 1;
      goto LABEL_14;
    }
    v13 = v10;
    v14 = v9;
    goto LABEL_13;
  }
  if (!objc_msgSend(v9, "indexOfObject:", v11))
  {
    v15 = objc_msgSend(v10, "indexOfObject:", v11);
    v16 = v10;
    v13 = v16;
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v16, "count") != a6)
      {
LABEL_12:
        v18 = v9;
        objc_msgSend(v18, "subarrayWithRange:", 1, objc_msgSend(v18, "count") - 1);
        v14 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
        v12 = objc_msgSend(v14, "isEqualToArray:", v13);

        goto LABEL_14;
      }
      objc_msgSend(v13, "subarrayWithRange:", 0, objc_msgSend(v13, "count") - 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeObjectAtIndex:", v15);
    }

    v13 = v17;
    goto LABEL_12;
  }
  v12 = 0;
LABEL_14:

  return v12;
}

+ (id)keyPathsForValuesAffectingKindValue
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("kind"));
}

+ (BOOL)isSmartAlbumForKind:(int)a3
{
  return (a3 - 1605) < 0x1C
      || (a3 - 1600) <= 0x29 && ((1 << (a3 - 64)) & 0x3BC00000005) != 0
      || a3 == 1552
      || a3 == 1507;
}

+ (BOOL)isUserCreatedForKind:(int)a3
{
  return (a3 - 1507) < 2 || a3 == 2 || a3 == 4000;
}

+ (BOOL)isFolder:(int)a3
{
  return (a3 - 3998) < 3 || a3 == 1553;
}

+ (id)uuidFromGroupURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  id v19;
  void *v20;
  void *v22;
  id v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(v3, "scheme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("assets-library")) & 1) == 0)
  {

    goto LABEL_19;
  }
  objc_msgSend(v3, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("group"));

  if (!v7)
  {
LABEL_19:
    v20 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v3, "query");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "length") >= 0x65)
  {
LABEL_18:

    goto LABEL_19;
  }
  objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("&"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v10)
  {

    goto LABEL_18;
  }
  v11 = v10;
  v22 = v8;
  v23 = v3;
  v24 = 0;
  v12 = *(_QWORD *)v26;
  v13 = CFSTR("id");
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v26 != v12)
        objc_enumerationMutation(v9);
      objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR("="), v22);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v15, "count") >= 2)
      {
        objc_msgSend(v15, "objectAtIndex:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectAtIndex:", 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "isEqualToString:", v13))
        {
          v18 = v13;
          v19 = v17;

          v24 = v19;
          v13 = v18;
        }

      }
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  }
  while (v11);

  v3 = v23;
  v20 = v24;
LABEL_20:
  objc_autoreleasePoolPop(v4);

  return v20;
}

+ (id)_singletonFetchingAlbumWithKind:(int)a3 library:(id)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  void *v9;
  void *v11;

  v4 = *(_QWORD *)&a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLGenericAlbum.m"), 1288, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("aLibrary"));

  }
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v7, "repairSingletonObjects");
    +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", v4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)_singletonManagedAlbumWithKind:(int)a3 library:(id)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  void *v9;
  void *v11;

  v4 = *(_QWORD *)&a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLGenericAlbum.m"), 1300, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("aLibrary"));

  }
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLManagedAlbum, "albumWithKind:inManagedObjectContext:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v7, "repairSingletonObjects");
    +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLManagedAlbum, "albumWithKind:inManagedObjectContext:", v4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

+ (id)rootFolderInLibrary:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLGenericAlbum.m"), 1312, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("aLibrary"));

  }
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLManagedFolder, "albumWithKind:inManagedObjectContext:", 3999, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v5, "repairSingletonObjects");
    +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLManagedFolder, "albumWithKind:inManagedObjectContext:", 3999, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)projectAlbumRootFolderInLibrary:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLGenericAlbum.m"), 1324, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("aLibrary"));

  }
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLManagedFolder, "albumWithKind:inManagedObjectContext:", 3998, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v5, "repairSingletonObjects");
    +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLManagedFolder, "albumWithKind:inManagedObjectContext:", 3998, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)userLibraryAlbumInLibrary:(id)a3
{
  return (id)objc_msgSend(a1, "_singletonFetchingAlbumWithKind:library:", 1613, a3);
}

+ (id)allAssetsAlbumInLibrary:(id)a3
{
  return (id)objc_msgSend(a1, "_singletonFetchingAlbumWithKind:library:", 1600, a3);
}

+ (id)allPanoramasAlbumInLibrary:(id)a3
{
  return (id)objc_msgSend(a1, "_singletonFetchingAlbumWithKind:library:", 1605, a3);
}

+ (id)allVerticalPanoramasAlbumInLibrary:(id)a3
{
  return (id)objc_msgSend(a1, "_singletonFetchingAlbumWithKind:library:", 1607, a3);
}

+ (id)allHorizontalPanoramasAlbumInLibrary:(id)a3
{
  return (id)objc_msgSend(a1, "_singletonFetchingAlbumWithKind:library:", 1608, a3);
}

+ (id)allVideosAlbumInLibrary:(id)a3
{
  return (id)objc_msgSend(a1, "_singletonFetchingAlbumWithKind:library:", 1606, a3);
}

+ (id)allFavoritesAlbumInLibrary:(id)a3
{
  return (id)objc_msgSend(a1, "_singletonFetchingAlbumWithKind:library:", 1609, a3);
}

+ (id)allPhotoStreamAssetsAlbumInLibrary:(id)a3
{
  return (id)objc_msgSend(a1, "_singletonFetchingAlbumWithKind:library:", 1602, a3);
}

+ (id)iTunesLibraryAlbumInLibrary:(id)a3
{
  return (id)objc_msgSend(a1, "_singletonFetchingAlbumWithKind:library:", 1552, a3);
}

+ (id)trashBinAlbumInLibrary:(id)a3
{
  return (id)objc_msgSend(a1, "_singletonFetchingAlbumWithKind:library:", 1612, a3);
}

+ (id)unableToUploadAlbumInLibrary:(id)a3
{
  return (id)objc_msgSend(a1, "_singletonFetchingAlbumWithKind:library:", 1624, a3);
}

+ (id)syncProgressAlbumInLibrary:(id)a3
{
  return (id)objc_msgSend(a1, "_singletonManagedAlbumWithKind:library:", 3571, a3);
}

+ (id)otaRestoreProgressAlbumInLibrary:(id)a3
{
  return (id)objc_msgSend(a1, "_singletonManagedAlbumWithKind:library:", 3572, a3);
}

+ (id)filesystemImportProgressAlbumInLibrary:(id)a3
{
  return (id)objc_msgSend(a1, "_singletonManagedAlbumWithKind:library:", 3573, a3);
}

+ (id)allAlbumsInLibrary:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "allAlbumsInManagedObjectContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (PLGenericAlbum)albumWithUUID:(id)a3 inLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("uuid == %@"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_albumsMatchingPredicate:expectedResultCount:inManagedObjectContext:", v9, &unk_1E375E250, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v8);
  return (PLGenericAlbum *)v12;
}

+ (PLGenericAlbum)albumWithObjectID:(id)a3 inLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v14;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = (void *)MEMORY[0x19AEC1554]();
    objc_msgSend(v6, "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v8, "existingObjectWithID:error:", v5, &v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v14;
    if (v10)
    {
      v11 = v10;
      NSLog(CFSTR("Failed to fetch album: %@"), v10);

      objc_autoreleasePoolPop(v7);
      v12 = 0;
    }
    else
    {

      objc_autoreleasePoolPop(v7);
      v12 = v9;
    }

  }
  else
  {
    v12 = 0;
  }

  return (PLGenericAlbum *)v12;
}

+ (PLGenericAlbum)albumWithName:(id)a3 inLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = (void *)MEMORY[0x19AEC1554]();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("title = %@"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLGenericAlbum _albumsMatchingPredicate:expectedResultCount:inManagedObjectContext:](PLGenericAlbum, "_albumsMatchingPredicate:expectedResultCount:inManagedObjectContext:", v8, &unk_1E375E250, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "count"))
    {
      objc_msgSend(v10, "objectAtIndex:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    v11 = 0;
  }

  return (PLGenericAlbum *)v11;
}

+ (id)albumsForStreamID:(id)a3 inLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x19AEC1554]();
  v8 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1500);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("kind == %@ AND title == %@"), v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGenericAlbum _albumsMatchingPredicate:expectedResultCount:inManagedObjectContext:](PLGenericAlbum, "_albumsMatchingPredicate:expectedResultCount:inManagedObjectContext:", v10, 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v7);
  return v12;
}

+ (id)_unpushedParentsOfAlbums:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "parentFolder", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11
          && objc_msgSend(v11, "cloudLocalState") != 1
          && (objc_msgSend(v12, "isRegularRootFolder") & 1) == 0
          && (objc_msgSend(v12, "isProjectAlbumRootFolder") & 1) == 0)
        {
          objc_msgSend(v10, "parentFolder");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v13);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)includeUnpushedParentsForAlbums:(id)a3 limit:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_unpushedParentsOfAlbums:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v8, "count"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "insertObjects:atIndexes:", v8, v9);

      objc_msgSend(a1, "_unpushedParentsOfAlbums:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v10;
    }
    while (objc_msgSend(v10, "count"));
  }
  else
  {
    v10 = v8;
  }
  v11 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  objc_msgSend(v11, "addObjectsFromArray:", v7);
  objc_msgSend(v11, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB36B8];
  v14 = objc_msgSend(v12, "count");
  if (v14 >= a4)
    v15 = a4;
  else
    v15 = v14;
  objc_msgSend(v13, "indexSetWithIndexesInRange:", 0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectsAtIndexes:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)albumsToUploadInitiallyInLibrary:(id)a3 limit:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v6 = a3;
  v7 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(v6, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0C97B48]);
  objc_msgSend(v9, "setRelationshipKeyPathsForPrefetching:", &unk_1E3763590);
  objc_msgSend(a1, "entityInManagedObjectContext:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEntity:", v10);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(kind == %d OR kind == %d OR kind == %d OR kind == %d OR kind == %d OR (kind == %d AND projectDocumentType != %@ AND projectDocumentType != %@)) AND cloudLocalState == %d"), 2, 4000, 1507, 3999, 3998, 1508, CFSTR("com.apple.photos.projects.legacy"), CFSTR("com.apple.photos.projects.slideshow"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v11);
  objc_msgSend(v9, "setFetchLimit:", a4);
  v15 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v9, &v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "includeUnpushedParentsForAlbums:limit:", v12, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v7);
  return v13;
}

+ (void)resetAlbumStateForCloudInLibrary:(id)a3
{
  id v3;
  void *v4;
  _BYTE *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x19AEC1554]();
  v5 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Resetting cloudLocalState of albums", buf, 2u);
    }

  }
  v7 = objc_alloc(MEMORY[0x1E0C97AB0]);
  +[PLGenericAlbum entityName](PLGenericAlbum, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithEntityName:", v8);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(kind == %d OR kind == %d OR kind == %d OR kind == %d OR kind == %d OR kind == %d) AND cloudLocalState != %d"), 2, 4000, 1507, 3999, 1508, 3998, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);
  objc_msgSend(v9, "setResultType:", 2);
  objc_msgSend(v9, "setPropertiesToUpdate:", &unk_1E37644E0);
  objc_msgSend(v3, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v11, "executeRequest:error:", v9, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v16;

  if (v13)
  {
    if (!*v5)
    {
      __CPLAssetsdOSLogDomain();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v13;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Failed to batch update album state: %@", buf, 0xCu);
      }
LABEL_12:

    }
  }
  else if (!*v5)
  {
    __CPLAssetsdOSLogDomain();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "result");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v15;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Batch updated cloudLocalState for %@ albums", buf, 0xCu);

    }
    goto LABEL_12;
  }

  objc_autoreleasePoolPop(v4);
}

+ (void)_removeAlbumsAndFolders:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x19AEC1554]();
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__PLGenericAlbum__removeAlbumsAndFolders_inManagedObjectContext___block_invoke;
  v16[3] = &unk_1E3664828;
  v16[4] = &v21;
  v16[5] = &v17;
  objc_msgSend(v6, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v5, v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (!*MEMORY[0x1E0D115D0])
    {
      __CPLAssetsdOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = objc_msgSend(v5, "count");
        *(_DWORD *)buf = 134218242;
        v26 = v10;
        v27 = 2112;
        v28 = v8;
        v11 = "Failed to remove %ld albums and folder: %@";
        v12 = v9;
        v13 = OS_LOG_TYPE_ERROR;
LABEL_8:
        _os_log_impl(&dword_199541000, v12, v13, v11, buf, 0x16u);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v22[3];
      v15 = (void *)v18[3];
      *(_DWORD *)buf = 134218240;
      v26 = v14;
      v27 = 2048;
      v28 = v15;
      v11 = "Deleted %lu folders, %lu albums.";
      v12 = v9;
      v13 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_8;
    }
LABEL_9:

  }
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  objc_autoreleasePoolPop(v7);

}

+ (void)removeAllUserAlbumsAndFoldersInLibrary:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)MEMORY[0x19AEC1554]();
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Removing all user albums and folders for cloud reset", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(kind == %d OR kind == %d OR kind == %d OR kind == %d)"), 2, 4000, 1507, 1508);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_albumsMatchingPredicate:expectedResultCount:inManagedObjectContext:", v7, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_removeAlbumsAndFolders:inManagedObjectContext:", v9, v10);

  objc_autoreleasePoolPop(v5);
}

+ (void)removeEmptyAlbumsAndFoldersForCloudResetInManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  _BYTE *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x19AEC1554]();
  v6 = (_BYTE *)MEMORY[0x1E0D115D0];
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Removing empty albums for cloud reset", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Album"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind == %d AND cloudLocalState == %d AND assets.@count == 0"), 2, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v9);
  objc_msgSend(v8, "setFetchBatchSize:", 100);
  v22 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v8, &v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v22;
  if (v10)
  {
    objc_msgSend(a1, "_removeAlbumsAndFolders:inManagedObjectContext:", v10, v4);
  }
  else
  {
    v12 = a1;
    PLBackendGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v8;
      v25 = 2112;
      v26 = v11;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_ERROR, "Failed to fetch empty albums %@: %@", buf, 0x16u);
    }

    a1 = v12;
    v6 = (_BYTE *)MEMORY[0x1E0D115D0];
  }

  objc_autoreleasePoolPop(v5);
  v14 = (void *)MEMORY[0x19AEC1554]();
  if (!*v6)
  {
    __CPLAssetsdOSLogDomain();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "Removing empty folders for cloud reset", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("Folder"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind == %d AND cloudLocalState == %d AND childCollections.@count == 0"), 4000, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setPredicate:", v17);
  objc_msgSend(v16, "setFetchBatchSize:", 100);
  v21 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v16, &v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v21;
  if (v18)
  {
    objc_msgSend(a1, "_removeAlbumsAndFolders:inManagedObjectContext:", v18, v4);
  }
  else
  {
    PLBackendGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v16;
      v25 = 2112;
      v26 = v19;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "Failed to fetch empty folders %@: %@", buf, 0x16u);
    }

  }
  objc_autoreleasePoolPop(v14);

}

+ (void)removeTrashedAlbumsAndFoldersForCloudResetInManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)MEMORY[0x19AEC1554]();
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Removing trashed/expunged albums and folders for cloud reset", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(kind == %d OR kind == %d OR kind == %d OR kind == %d) AND trashedState != %d"), 2, 4000, 1507, 1508, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_albumsMatchingPredicate:expectedResultCount:inManagedObjectContext:", v7, 0, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_removeAlbumsAndFolders:inManagedObjectContext:", v8, v4);

  objc_autoreleasePoolPop(v5);
}

+ (void)removeInvalidAlbumsAndFoldersInManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)MEMORY[0x19AEC1554]();
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Removing invalid albums and folders with nil UUID", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(kind == %d OR kind == %d OR kind == %d OR kind == %d) AND uuid = nil"), 2, 4000, 1507, 1508);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_albumsMatchingPredicate:expectedResultCount:inManagedObjectContext:", v7, 0, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_removeAlbumsAndFolders:inManagedObjectContext:", v8, v4);

  objc_autoreleasePoolPop(v5);
}

+ (id)albumsMatchingPredicate:(id)a3 expectedResultCount:(id)a4 inLibrary:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a4;
  v8 = a3;
  objc_msgSend(a5, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGenericAlbum _albumsMatchingPredicate:expectedResultCount:inManagedObjectContext:](PLGenericAlbum, "_albumsMatchingPredicate:expectedResultCount:inManagedObjectContext:", v8, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_insertNewAlbumWithKind:(int)a3 title:(id)a4 lastInterestingDate:(id)a5 intoLibrary:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  __objc2_class *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint8_t v45[128];
  uint8_t buf[4];
  int v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v8 = *(_QWORD *)&a3;
  v52 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = v11;
  if ((int)v8 > 1504)
  {
    if ((_DWORD)v8 == 1505)
    {
      objc_msgSend(v11, "managedObjectContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLManagedObject insertInManagedObjectContext:](PLCloudSharedAlbum, "insertInManagedObjectContext:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "updateCloudLastInterestingChangeDateWithDate:", v10);
      if (v15)
        goto LABEL_14;
      goto LABEL_10;
    }
    if ((_DWORD)v8 == 1508)
    {
      v13 = PLProjectAlbum;
      goto LABEL_13;
    }
  }
  else
  {
    if ((_DWORD)v8 == 15)
    {
      v13 = PLManagedLegacyFaceAlbum;
      goto LABEL_13;
    }
    if ((_DWORD)v8 == 1500)
    {
      v13 = PLPhotoStreamAlbum;
      goto LABEL_13;
    }
  }
  v13 = PLManagedAlbum;
LABEL_13:
  objc_msgSend(v11, "managedObjectContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[__objc2_class insertInManagedObjectContext:](v13, "insertInManagedObjectContext:", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
LABEL_14:
    objc_msgSend(v15, "setKindValue:", v8);
    objc_msgSend(v15, "setTitle:", v9);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((int)v8 > 1506)
    {
      if ((int)v8 > 1550)
      {
        if ((_DWORD)v8 != 1551)
        {
          if ((_DWORD)v8 != 1603 && (_DWORD)v8 != 1604)
            goto LABEL_36;
          goto LABEL_24;
        }
        +[PLManagedAlbumList eventListInPhotoLibrary:](PLManagedAlbumList, "eventListInPhotoLibrary:", v12);
        v24 = objc_claimAutoreleasedReturnValue();
LABEL_34:
        v22 = (void *)v24;
        v23 = v19;
        goto LABEL_35;
      }
      if ((_DWORD)v8 != 1507 && (_DWORD)v8 != 1550)
        goto LABEL_36;
    }
    else
    {
      if ((int)v8 > 14)
      {
        if ((_DWORD)v8 != 15)
        {
          if ((_DWORD)v8 != 1500)
          {
            if ((_DWORD)v8 == 1505)
            {
              +[PLManagedAlbumList allStreamedAlbumsListInPhotoLibrary:](PLManagedAlbumList, "allStreamedAlbumsListInPhotoLibrary:", v12);
              v21 = objc_claimAutoreleasedReturnValue();
LABEL_25:
              v22 = (void *)v21;
              v23 = v20;
LABEL_35:
              objc_msgSend(v23, "addObject:", v22);

            }
LABEL_36:
            v42 = 0u;
            v43 = 0u;
            v40 = 0u;
            v41 = 0u;
            v16 = v19;
            v25 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
            if (v25)
            {
              v26 = v25;
              v27 = *(_QWORD *)v41;
              do
              {
                v28 = 0;
                do
                {
                  if (*(_QWORD *)v41 != v27)
                    objc_enumerationMutation(v16);
                  objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v28), "albums");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "addObject:", v15);

                  ++v28;
                }
                while (v26 != v28);
                v26 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
              }
              while (v26);
            }

            v38 = 0u;
            v39 = 0u;
            v36 = 0u;
            v37 = 0u;
            v17 = v20;
            v30 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            if (v30)
            {
              v31 = v30;
              v32 = *(_QWORD *)v37;
              do
              {
                v33 = 0;
                do
                {
                  if (*(_QWORD *)v37 != v32)
                    objc_enumerationMutation(v17);
                  objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v33++), "insertIntoOrderedAlbumsAtIndexByPriorityForAlbum:", v15, (_QWORD)v36);
                }
                while (v31 != v33);
                v31 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
              }
              while (v31);
            }

            v34 = v15;
            goto LABEL_51;
          }
LABEL_24:
          +[PLManagedAlbumList albumListInPhotoLibrary:](PLManagedAlbumList, "albumListInPhotoLibrary:", v12);
          v21 = objc_claimAutoreleasedReturnValue();
          goto LABEL_25;
        }
        +[PLManagedAlbumList facesAlbumListInPhotoLibrary:](PLManagedAlbumList, "facesAlbumListInPhotoLibrary:", v12);
        v24 = objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      }
      if ((_DWORD)v8 != 2)
      {
        if ((_DWORD)v8 != 12)
          goto LABEL_36;
        +[PLManagedAlbumList importListInPhotoLibrary:](PLManagedAlbumList, "importListInPhotoLibrary:", v12);
        v24 = objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      }
    }
    +[PLManagedAlbumList albumListInPhotoLibrary:](PLManagedAlbumList, "albumListInPhotoLibrary:", v12);
    v24 = objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
LABEL_10:
  PLBackendGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v12, "managedObjectContext");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109634;
    v47 = v8;
    v48 = 2112;
    v49 = v12;
    v50 = 2112;
    v51 = v17;
    _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Unable to insert new album with kind %d. Library shutting down? library %@ moc %@", buf, 0x1Cu);
LABEL_51:

  }
  return v15;
}

+ (id)insertNewAlbumWithKind:(int)a3 title:(id)a4 intoLibrary:(id)a5
{
  return (id)objc_msgSend(a1, "_insertNewAlbumWithKind:title:lastInterestingDate:intoLibrary:", *(_QWORD *)&a3, a4, 0, a5);
}

+ (id)insertNewAlbumWithTitle:(id)a3 intoLibrary:(id)a4
{
  return (id)objc_msgSend(a1, "_insertNewAlbumWithKind:title:lastInterestingDate:intoLibrary:", 2, a3, 0, a4);
}

+ (id)insertNewSmartAlbumIntoLibrary:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLManagedObject insertInManagedObjectContext:](PLFetchingAlbum, "insertInManagedObjectContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setKindValue:", 1507);
  return v4;
}

+ (id)insertNewProjectAlbumWithTitle:(id)a3 documentType:(id)a4 intoLibrary:(id)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  objc_msgSend(a1, "_insertNewAlbumWithKind:title:lastInterestingDate:intoLibrary:", 1508, a3, 0, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    objc_msgSend(v9, "setProjectDocumentType:", v8);

  return v10;
}

+ (id)insertNewAlbumIntoLibrary:(id)a3
{
  return (id)objc_msgSend(a1, "_insertNewAlbumWithKind:title:lastInterestingDate:intoLibrary:", 2, 0, 0, a3);
}

+ (id)insertNewSyncedEventWithTitle:(id)a3 intoLibrary:(id)a4
{
  return (id)objc_msgSend(a1, "_insertNewAlbumWithKind:title:lastInterestingDate:intoLibrary:", 1551, a3, 0, a4);
}

+ (id)insertNewSyncedEventIntoLibrary:(id)a3
{
  return (id)objc_msgSend(a1, "insertNewSyncedEventWithTitle:intoLibrary:", 0, a3);
}

+ (id)insertNewCloudSharedAlbumWithTitle:(id)a3 lastInterestingDate:(id)a4 intoLibrary:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v22;
  uint8_t buf[4];
  NSObject *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)MEMORY[0x1E0D73280];
  objc_msgSend(v11, "pathManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "libraryURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isSystemPhotoLibraryURL:", v14) & 1) != 0)
  {

    goto LABEL_4;
  }
  v15 = objc_msgSend(v11, "isUnitTesting");

  if ((v15 & 1) != 0)
  {
LABEL_4:
    objc_msgSend(a1, "_insertNewAlbumWithKind:title:lastInterestingDate:intoLibrary:", 1505, v9, v10, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 && v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLGenericAlbum.m"), 1819, CFSTR("Cloud shared album is of unexpected class: %@"), v16);

    }
    +[PLPhotoSharingHelper sharingPersonID](PLPhotoSharingHelper, "sharingPersonID");
    v17 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject length](v17, "length"))
    {
      PLPhotoSharingGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v17;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEFAULT, "setting cloudPersonID of newly created album to %@", buf, 0xCu);
      }

      objc_msgSend(v16, "setCloudPersonID:", v17);
    }
    goto LABEL_14;
  }
  PLPhotoSharingGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
  {
    objc_msgSend(v11, "pathManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "libraryURL");
    v20 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v20;
    _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_FAULT, "Unable to insert new cloud shared album because library is not the SPL: %@", buf, 0xCu);

  }
  v16 = 0;
LABEL_14:

  return v16;
}

+ (id)insertNewLegacyFaceAlbumIntoLibrary:(id)a3
{
  return (id)objc_msgSend(a1, "_insertNewAlbumWithKind:title:lastInterestingDate:intoLibrary:", 15, 0, 0, a3);
}

+ (id)albumFromGroupURL:(id)a3 photoLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(a1, "uuidFromGroupURL:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "length")
    || (objc_msgSend(a1, "albumWithUUID:inLibrary:", v9, v7), (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    NSLog(CFSTR("Could not find group with UUID %@"), v9);
    v10 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v10, "isInTrash"))
  {

    v10 = 0;
  }

  objc_autoreleasePoolPop(v8);
  return v10;
}

+ (id)allAlbumsInManagedObjectContext:(id)a3
{
  return (id)objc_msgSend(a1, "_albumsMatchingPredicate:expectedResultCount:inManagedObjectContext:", 0, 0, a3);
}

+ (id)allSyncedAlbumsInManagedObjectContext:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3880];
  v5 = a3;
  objc_msgSend(v4, "predicateWithFormat:", CFSTR("kind in {%d, %d, %d, %d}"), 15, 1550, 1551, 1552);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_albumsMatchingPredicate:expectedResultCount:inManagedObjectContext:", v6, 0, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)allAlbumsRegisteredWithManagedObjectContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "entityInManagedObjectContext:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subentities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  v32 = v7;
  if (v9)
  {
    v31 = v5;
    objc_msgSend(v7, "subentities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayByAddingObject:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v4, "registeredObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v38 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v17, "entity");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v11, "indexOfObjectIdenticalTo:", v18);

          if (v19 != 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v6, "addObject:", v17);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v14);
    }

    v5 = v31;
    v7 = v32;
  }
  else
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v4, "registeredObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v20)
    {
      v21 = v20;
      v22 = v5;
      v23 = v4;
      v24 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v34 != v24)
            objc_enumerationMutation(v11);
          v26 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
          objc_msgSend(v26, "entity");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = v27 == v32;
          v7 = v32;
          if (v28)
            objc_msgSend(v6, "addObject:", v26);
        }
        v21 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v21);
      v4 = v23;
      v5 = v22;
    }
  }

  v29 = (void *)objc_msgSend(v6, "copy");
  objc_autoreleasePoolPop(v5);

  return v29;
}

+ (id)albumsWithKind:(int)a3 inManagedObjectContext:(id)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = *(_QWORD *)&a3;
  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a4;
  objc_msgSend(v7, "numberWithInt:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("kind == %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_albumsMatchingPredicate:expectedResultCount:inManagedObjectContext:", v10, 0, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)eventsWithName:(id)a3 andImportSessionIdentifier:(id)a4 inManagedObjectContext:(id)a5
{
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = (void *)MEMORY[0x1E0CB3880];
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "numberWithInt:", 12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("kind == %@ AND title == %@ AND importSessionID == %@"), v13, v12, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_albumsMatchingPredicate:expectedResultCount:inManagedObjectContext:", v14, 0, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)insertAlbumWithKind:(int)a3 title:(id)a4 uuid:(id)a5 inManagedObjectContext:(id)a6
{
  uint64_t v8;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  SEL v18;
  id v19;
  uint64_t v20;
  void *v21;

  v8 = *(_QWORD *)&a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x19AEC1554]();
  if ((_DWORD)v8 == 1505)
  {
    if ((id)objc_opt_class() == a1)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("kPhotoLibraryAlbumKind_CloudSharedAlbum can only be PLCloudSharedAlbum.");
    v18 = a2;
    v19 = a1;
    v20 = 1950;
    goto LABEL_10;
  }
  if ((_DWORD)v8 == 1500 && (id)objc_opt_class() != a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("kPhotoLibraryAlbumKind_PhotoStream can only be PLPhotoStreamAlbum.");
    v18 = a2;
    v19 = a1;
    v20 = 1947;
LABEL_10:
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", v18, v19, CFSTR("PLGenericAlbum.m"), v20, v17);

  }
LABEL_6:
  objc_msgSend(a1, "insertInManagedObjectContext:", v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setKindValue:", v8);
  objc_msgSend(v21, "setTitle:", v11);
  if (v12)
    objc_msgSend(v21, "setUuid:", v12);
  objc_autoreleasePoolPop(v14);

  return v21;
}

+ (PLGenericAlbum)albumWithKind:(int)a3 inManagedObjectContext:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(a1, "albumsWithKind:inManagedObjectContext:", v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v7);
  return (PLGenericAlbum *)v9;
}

+ (id)_albumsMatchingPredicate:(id)a3 expectedResultCount:(id)a4 inManagedObjectContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9 && !objc_msgSend(v9, "integerValue"))
  {
    v19 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v11 = (void *)MEMORY[0x19AEC1554]();
    v12 = objc_alloc_init(MEMORY[0x1E0C97B48]);
    objc_msgSend(a1, "entityInManagedObjectContext:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setEntity:", v13);

    objc_msgSend(v12, "setPredicate:", v8);
    if (!v9 || (unint64_t)objc_msgSend(v9, "integerValue") >= 0x65)
      objc_msgSend(v12, "setFetchBatchSize:", 100);
    v21 = 0;
    objc_msgSend(v10, "executeFetchRequest:error:", v12, &v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v21;
    v16 = v15;
    if (v14)
    {

      objc_autoreleasePoolPop(v11);
      v17 = v14;
    }
    else
    {
      PLBackendGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v12;
        v24 = 2112;
        v25 = v16;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Failed to fetch %@: %@", buf, 0x16u);
      }

      objc_autoreleasePoolPop(v11);
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = v17;

  }
  return v19;
}

+ (void)addSingletonObjectsToContext:(id)a3
{
  id v5;
  void *v6;
  void *v7;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
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
  void *v79;
  void *v80;
  id v81;
  void (**v82)(_QWORD, _QWORD);
  void *v83;
  void *v84;
  _QWORD v85[4];
  id v86;

  v5 = a3;
  if ((PLIsAssetsd() & 1) == 0 && (MEMORY[0x19AEC0720]() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLGenericAlbum.m"), 2265, CFSTR("%@ can only be called from assetsd"), v84);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLGenericAlbum, "albumWithKind:inManagedObjectContext:", 3999, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLManagedFolder, "insertInManagedObjectContext:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setKindValue:", 3999);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLGenericAlbum, "albumWithKind:inManagedObjectContext:", 3998, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLManagedFolder, "insertInManagedObjectContext:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setKindValue:", 3998);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLGenericAlbum, "albumWithKind:inManagedObjectContext:", 1600, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLFetchingAlbum, "insertInManagedObjectContext:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setKindValue:", 1600);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1605, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLFetchingAlbum, "insertInManagedObjectContext:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setKindValue:", 1605);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1607, v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLFetchingAlbum, "insertInManagedObjectContext:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setKindValue:", 1607);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1608, v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLFetchingAlbum, "insertInManagedObjectContext:", v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setKindValue:", 1608);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1606, v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLFetchingAlbum, "insertInManagedObjectContext:", v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setKindValue:", 1606);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1609, v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLFetchingAlbum, "insertInManagedObjectContext:", v5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setKindValue:", 1609);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1615, v5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLFetchingAlbum, "insertInManagedObjectContext:", v5);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setKindValue:", 1615);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1610, v5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLFetchingAlbum, "insertInManagedObjectContext:", v5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setKindValue:", 1610);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1617, v5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLFetchingAlbum, "insertInManagedObjectContext:", v5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setKindValue:", 1617);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1618, v5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLFetchingAlbum, "insertInManagedObjectContext:", v5);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setKindValue:", 1618);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1616, v5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLFetchingAlbum, "insertInManagedObjectContext:", v5);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setKindValue:", 1616);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1613, v5);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLFetchingAlbum, "insertInManagedObjectContext:", v5);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setKindValue:", 1613);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLManagedFolder, "albumWithKind:inManagedObjectContext:", 4004, v5);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v34)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLManagedFolder, "insertInManagedObjectContext:", v5);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setKindValue:", 4004);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLManagedFolder, "albumWithKind:inManagedObjectContext:", 4005, v5);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v36)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLManagedFolder, "insertInManagedObjectContext:", v5);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setKindValue:", 4005);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLManagedFolder, "albumWithKind:inManagedObjectContext:", 4006, v5);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v38)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLManagedFolder, "insertInManagedObjectContext:", v5);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setKindValue:", 4006);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1620, v5);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v40)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLFetchingAlbum, "insertInManagedObjectContext:", v5);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setKindValue:", 1620);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1621, v5);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v42)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLFetchingAlbum, "insertInManagedObjectContext:", v5);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setKindValue:", 1621);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1614, v5);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v44)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLFetchingAlbum, "insertInManagedObjectContext:", v5);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setKindValue:", 1614);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1611, v5);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v46)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLFetchingAlbum, "insertInManagedObjectContext:", v5);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setKindValue:", 1611);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLManagedAlbum, "albumWithKind:inManagedObjectContext:", 4001, v5);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v48)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLManagedAlbum, "insertInManagedObjectContext:", v5);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setKindValue:", 4001);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLManagedAlbum, "albumWithKind:inManagedObjectContext:", 4003, v5);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v50)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLManagedAlbum, "insertInManagedObjectContext:", v5);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setKindValue:", 4003);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLManagedAlbum, "albumWithKind:inManagedObjectContext:", 4002, v5);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v52)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLManagedAlbum, "insertInManagedObjectContext:", v5);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setKindValue:", 4002);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLGenericAlbum, "albumWithKind:inManagedObjectContext:", 1602, v5);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v54)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLFetchingAlbum, "insertInManagedObjectContext:", v5);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setKindValue:", 1602);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLGenericAlbum, "albumWithKind:inManagedObjectContext:", 1552, v5);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v56)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLFetchingAlbum, "insertInManagedObjectContext:", v5);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setKindValue:", 1552);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLGenericAlbum, "albumWithKind:inManagedObjectContext:", 1612, v5);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v58)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLFetchingAlbum, "insertInManagedObjectContext:", v5);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "setKindValue:", 1612);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLGenericAlbum, "albumWithKind:inManagedObjectContext:", 3571, v5);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v60)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLManagedAlbum, "insertInManagedObjectContext:", v5);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setKindValue:", 3571);
    objc_msgSend(v61, "_kindDescription");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setTitle:", v62);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLGenericAlbum, "albumWithKind:inManagedObjectContext:", 3572, v5);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v63)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLManagedAlbum, "insertInManagedObjectContext:", v5);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setKindValue:", 3572);
    objc_msgSend(v64, "_kindDescription");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setTitle:", v65);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLGenericAlbum, "albumWithKind:inManagedObjectContext:", 3573, v5);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v66)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLManagedAlbum, "insertInManagedObjectContext:", v5);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setKindValue:", 3573);
    objc_msgSend(v67, "_kindDescription");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setTitle:", v68);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1619, v5);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v69)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLFetchingAlbum, "insertInManagedObjectContext:", v5);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "setKindValue:", 1619);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1622, v5);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v71)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLFetchingAlbum, "insertInManagedObjectContext:", v5);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setKindValue:", 1622);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1623, v5);
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v73)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLFetchingAlbum, "insertInManagedObjectContext:", v5);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setKindValue:", 1623);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1634, v5);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v75)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLFetchingAlbum, "insertInManagedObjectContext:", v5);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setKindValue:", 1634);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1624, v5);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v77)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLFetchingAlbum, "insertInManagedObjectContext:", v5);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setKindValue:", 1624);

  }
  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", 1636, v5);
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v79)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLFetchingAlbum, "insertInManagedObjectContext:", v5);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "setKindValue:", 1636);

  }
  v85[0] = MEMORY[0x1E0C809B0];
  v85[1] = 3221225472;
  v85[2] = __47__PLGenericAlbum_addSingletonObjectsToContext___block_invoke;
  v85[3] = &unk_1E36683C0;
  v81 = v5;
  v86 = v81;
  v82 = (void (**)(_QWORD, _QWORD))MEMORY[0x19AEC174C](v85);
  v82[2](v82, 1625);
  v82[2](v82, 1626);
  v82[2](v82, 1627);
  v82[2](v82, 1630);
  v82[2](v82, 1631);
  v82[2](v82, 1639);
  v82[2](v82, 1637);
  v82[2](v82, 1632);
  v82[2](v82, 1640);
  v82[2](v82, 1628);
  v82[2](v82, 1641);

}

+ (BOOL)is1WaySyncKind:(int)a3
{
  return (a3 - 1550) < 4;
}

void __47__PLGenericAlbum_addSingletonObjectsToContext___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  +[PLGenericAlbum albumWithKind:inManagedObjectContext:](PLFetchingAlbum, "albumWithKind:inManagedObjectContext:", a2, *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[PLManagedObject insertInManagedObjectContext:](PLFetchingAlbum, "insertInManagedObjectContext:", *(_QWORD *)(a1 + 32));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setKindValue:", a2);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[PLGenericAlbum unregisterForChanges](self, "unregisterForChanges");
  -[PLGenericAlbum unregisterAllDerivedAlbums](self, "unregisterAllDerivedAlbums");
  v3.receiver = self;
  v3.super_class = (Class)PLGenericAlbum;
  -[PLGenericAlbum dealloc](&v3, sel_dealloc);
}

- (id)childKeyForOrdering
{
  return 0;
}

- (void)delete
{
  id v3;

  -[PLGenericAlbum managedObjectContext](self, "managedObjectContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteObject:", self);

}

- (BOOL)canMoveToTrash
{
  int v3;

  v3 = -[PLGenericAlbum kindValue](self, "kindValue");
  return ((v3 - 1507) < 2 || v3 == 4000 || v3 == 2)
      && -[PLGenericAlbum canPerformEditOperation:](self, "canPerformEditOperation:", 32);
}

- (BOOL)isInTrash
{
  return -[PLGenericAlbum trashedState](self, "trashedState") != 0;
}

- (void)_applyTrashedState:(signed __int16)a3 date:(BOOL)a4 :(id)a5 cascade:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  uint64_t v8;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v6 = a6;
  v7 = a4;
  v8 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  if (!-[PLGenericAlbum canMoveToTrash](self, "canMoveToTrash"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLGenericAlbum.m"), 206, CFSTR("expect trashable album"));

  }
  if (((v8 & 0xFFFFFFFD) == 0) == -[PLGenericAlbum trashedState](self, "trashedState"))
  {
    -[PLGenericAlbum setTrashedState:](self, "setTrashedState:", v8);
    if (v7)
      -[PLGenericAlbum setTrashedDate:](self, "setTrashedDate:", v11);
    if ((_DWORD)v8 == 2)
      -[PLGenericAlbum delete](self, "delete");
  }
  if (-[PLGenericAlbum isFolder](self, "isFolder") && v6)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[PLGenericAlbum childCollections](self, "childCollections", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v16++), "_applyTrashedState:date::cascade:", v8, v7, v11, 1);
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v14);
    }

  }
}

- (void)applyTrashedState:(signed __int16)a3 cascade:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v7;
  id v8;

  v4 = a4;
  v5 = a3;
  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v8 = (id)v7;
  -[PLGenericAlbum _applyTrashedState:date::cascade:](self, "_applyTrashedState:date::cascade:", v5, v5 < 2, v7, v4);

}

- (BOOL)supportsCloudUpload
{
  if ((-[PLGenericAlbum isPrototype](self, "isPrototype") & 1) != 0)
    return 0;
  if (-[PLGenericAlbum kindValue](self, "kindValue") == 4000
    || -[PLGenericAlbum kindValue](self, "kindValue") == 2
    || -[PLGenericAlbum kindValue](self, "kindValue") == 3999
    || -[PLGenericAlbum isProjectAlbumSupportingCloudUpload](self, "isProjectAlbumSupportingCloudUpload"))
  {
    return 1;
  }
  return -[PLGenericAlbum kindValue](self, "kindValue") == 3998;
}

- (BOOL)isSyncableChange
{
  return 1;
}

- (PLPhotoLibrary)photoLibrary
{
  void *v2;
  void *v3;

  -[PLGenericAlbum managedObjectContext](self, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PLPhotoLibrary *)v3;
}

- (void)awakeFromInsert
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLGenericAlbum;
  -[PLGenericAlbum awakeFromInsert](&v5, sel_awakeFromInsert);
  objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLGenericAlbum setUuid:](self, "setUuid:", v3);

  -[PLGenericAlbum setKindValue:](self, "setKindValue:", 2);
  -[PLGenericAlbum setPendingItemsCount:](self, "setPendingItemsCount:", 0);
  -[PLGenericAlbum setPendingItemsType:](self, "setPendingItemsType:", 1);
  -[PLGenericAlbum registerForChanges](self, "registerForChanges");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLGenericAlbum setCreationDate:](self, "setCreationDate:", v4);

}

- (void)awakeFromFetch
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLGenericAlbum;
  -[PLGenericAlbum awakeFromFetch](&v3, sel_awakeFromFetch);
  -[PLGenericAlbum registerForChanges](self, "registerForChanges");
}

- (void)willTurnIntoFault
{
  objc_super v3;

  -[PLGenericAlbum unregisterForChanges](self, "unregisterForChanges");
  v3.receiver = self;
  v3.super_class = (Class)PLGenericAlbum;
  -[PLGenericAlbum willTurnIntoFault](&v3, sel_willTurnIntoFault);
}

- (void)willSave
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)PLGenericAlbum;
  -[PLManagedObject willSave](&v18, sel_willSave);
  if ((-[PLGenericAlbum isDeleted](self, "isDeleted") & 1) == 0)
  {
    -[PLGenericAlbum uuid](self, "uuid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      -[PLGenericAlbum repairUuidAndTitleWithRecoveryReason:](self, "repairUuidAndTitleWithRecoveryReason:", "-[PLGenericAlbum willSave]");
      PLSimulateCrash();
    }
  }
  -[PLGenericAlbum managedObjectContext](self, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v4, "isInitializingSingletons") & 1) == 0
    && (-[PLGenericAlbum isDeleted](self, "isDeleted") & 1) == 0)
  {
    if (-[PLGenericAlbum isUserCreated](self, "isUserCreated"))
    {
      -[PLGenericAlbum parentFolder](self, "parentFolder");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
        if (self->_didAutomaticallyAssignParentFolder)
        {
          PLBackendGetLog();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            -[PLGenericAlbum uuid](self, "uuid");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLGenericAlbum objectID](self, "objectID");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v20 = v7;
            v21 = 2114;
            v22 = v8;
            _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Skipping automatic assignment of nil parent folder to avoid willSave looping for album: %{public}@ %{public}@", buf, 0x16u);

          }
          goto LABEL_24;
        }
        if (-[PLGenericAlbum isProjectAlbum](self, "isProjectAlbum"))
        {
          PLBackendGetLog();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            -[PLGenericAlbum uuid](self, "uuid");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLGenericAlbum objectID](self, "objectID");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v20 = v10;
            v21 = 2114;
            v22 = v11;
            _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "Setting default (rootProjectFolder) for nil parent folder: %{public}@ %{public}@", buf, 0x16u);

          }
          objc_msgSend(v4, "photoLibrary");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLGenericAlbum projectAlbumRootFolderInLibrary:](PLGenericAlbum, "projectAlbumRootFolderInLibrary:", v12);
          v13 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (-[PLGenericAlbum isInserted](self, "isInserted")
            && -[PLGenericAlbum kindValue](self, "kindValue") != 1507)
          {
            goto LABEL_23;
          }
          PLBackendGetLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            -[PLGenericAlbum uuid](self, "uuid");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[PLGenericAlbum objectID](self, "objectID");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v20 = v15;
            v21 = 2114;
            v22 = v16;
            _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_DEFAULT, "Setting default (rootFolder) for nil parent folder: %{public}@ %{public}@", buf, 0x16u);

          }
          objc_msgSend(v4, "photoLibrary");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLGenericAlbum rootFolderInLibrary:](PLGenericAlbum, "rootFolderInLibrary:", v12);
          v13 = objc_claimAutoreleasedReturnValue();
        }
        v17 = (void *)v13;

        objc_msgSend(v17, "addChildCollectionsObject:", self);
LABEL_23:
        self->_didAutomaticallyAssignParentFolder = 1;
      }
    }
  }
LABEL_24:

}

- (void)didSave
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLGenericAlbum;
  -[PLGenericAlbum didSave](&v3, sel_didSave);
  self->_didAutomaticallyAssignParentFolder = 0;
}

- (void)repairUuidAndTitleWithRecoveryReason:(const char *)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLGenericAlbum setUuid:](self, "setUuid:", v5);
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[PLGenericAlbum objectID](self, "objectID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 136315650;
      v9 = a3;
      v10 = 2112;
      v11 = v7;
      v12 = 2112;
      v13 = v5;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Repaired an album without a UUID in %s: %@ %@", (uint8_t *)&v8, 0x20u);

    }
  }
  -[PLGenericAlbum _repairTitleIfEmpty](self, "_repairTitleIfEmpty");

}

- (void)_repairTitleIfEmpty
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[PLGenericAlbum localizedTitle](self, "localizedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  if (!v3 || (v4 = objc_msgSend(v3, "length"), v5 = v7, !v4))
  {
    objc_msgSend((id)objc_opt_class(), "localizedRecoveredTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLGenericAlbum setTitle:](self, "setTitle:", v6);

    v5 = v7;
  }

}

- (unint64_t)approximateCount
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)MEMORY[0x19AEC1554](self, a2);
  -[PLGenericAlbum assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (unint64_t)assetsCount
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)MEMORY[0x19AEC1554](self, a2);
  -[PLGenericAlbum assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (BOOL)isEmpty
{
  return -[PLGenericAlbum assetsCount](self, "assetsCount") == 0;
}

- (unint64_t)photosCount
{
  return -[PLGenericAlbum countForAssetsOfKind:](self, "countForAssetsOfKind:", 0);
}

- (unint64_t)videosCount
{
  return -[PLGenericAlbum countForAssetsOfKind:](self, "countForAssetsOfKind:", 1);
}

- (BOOL)hasUnseenContentBoolValue
{
  return 0;
}

- (NSString)localizedTitle
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = -[PLGenericAlbum kindValue](self, "kindValue");
  -[PLGenericAlbum photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGenericAlbum localizedTitleForAlbumKind:cplEnabled:](PLGenericAlbum, "localizedTitleForAlbumKind:cplEnabled:", v3, objc_msgSend(v4, "isCloudPhotoLibraryEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[PLGenericAlbum title](self, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v5;
}

- (NSString)name
{
  NSLog(CFSTR("Warning: The -name property of albums is going away soon. Please use -localizedTitle instead. Album: %@"), a2, self);
  PLPrintSymbolicStackTrace();
  return -[PLGenericAlbum localizedTitle](self, "localizedTitle");
}

- (NSObject)posterImage
{
  return 0;
}

- (void)updateKeyAssetsIfNeeded
{
  void *v3;

  v3 = (void *)MEMORY[0x19AEC1554](self, a2);
  if (objc_msgSend((id)objc_opt_class(), "supportsCachedKeyAssetsWithAlbumKind:", -[PLGenericAlbum kindValue](self, "kindValue")))-[PLGenericAlbum _validateAndUpdateKeyAssetsIfNeeded](self, "_validateAndUpdateKeyAssetsIfNeeded");
  objc_autoreleasePoolPop(v3);
}

- (id)predicateForKeyAssetsCandidates
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3880];
  -[PLGenericAlbum objectID](self, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("%K CONTAINS %@"), CFSTR("albums"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("trashedState"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("hidden"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3528];
  v11[0] = v4;
  v11[1] = v5;
  v11[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)keyAssetsMaxCount
{
  return 5;
}

- (id)sortDescriptorsForKeyAssetsCandidates
{
  return (id)objc_msgSend((id)objc_opt_class(), "sortDescriptorsForAssetsInAlbumWithSortKey:ascending:", -[PLGenericAlbum customSortKey](self, "customSortKey"), -[PLGenericAlbum customSortAscending](self, "customSortAscending"));
}

- (id)fetchKeyAssetCandidates:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setIncludesPendingChanges:", 0);
  objc_msgSend(v7, "setFetchLimit:", -[PLGenericAlbum keyAssetsMaxCount](self, "keyAssetsMaxCount"));
  -[PLGenericAlbum predicateForKeyAssetsCandidates](self, "predicateForKeyAssetsCandidates");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  -[PLGenericAlbum sortDescriptorsForKeyAssetsCandidates](self, "sortDescriptorsForKeyAssetsCandidates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v9);

  objc_msgSend(v7, "setResultType:", 1);
  -[PLGenericAlbum managedObjectContext](self, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "executeFetchRequest:error:", v7, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_validateAndUpdateKeyAssetsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  _BOOL4 v11;
  NSObject *v12;
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
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  char v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  unint64_t v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  id v57;
  uint8_t v58[128];
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  NSObject *v64;
  _QWORD v65[5];

  v65[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x19AEC1554](self, a2);
  -[PLGenericAlbum objectIDsForRelationshipNamed:](self, "objectIDsForRelationshipNamed:", CFSTR("customKeyAsset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLGenericAlbum objectIDsForRelationshipNamed:](self, "objectIDsForRelationshipNamed:", CFSTR("keyAssets"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0;
  -[PLGenericAlbum fetchKeyAssetCandidates:](self, "fetchKeyAssetCandidates:", &v57);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v57;
  v9 = v8;
  if (!v7)
  {
    PLBackendGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v9;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "failed to perform key assets fetch: %@", buf, 0xCu);
    }
LABEL_33:

    goto LABEL_34;
  }
  v49 = v8;
  v10 = objc_msgSend((id)objc_opt_class(), "_validateCurrentKeyAssetIDs:fetchedKeyAssetIDs:customKeyAssetID:maxCount:", v6, v7, v5, -[PLGenericAlbum keyAssetsMaxCount](self, "keyAssetsMaxCount"));
  if (v5 && (objc_msgSend(v7, "containsObject:", v5) & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0C97B48];
    +[PLManagedAsset entityName](PLManagedAsset, "entityName");
    v44 = v7;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fetchRequestWithEntityName:", v14);
    v46 = v6;
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setIncludesPendingChanges:", 0);
    v16 = (void *)MEMORY[0x1E0CB3528];
    -[PLGenericAlbum predicateForKeyAssetsCandidates](self, "predicateForKeyAssetsCandidates");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v17;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF = %@"), v5);
    v50 = v5;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v65[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "andPredicateWithSubpredicates:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setPredicate:", v20);
    objc_msgSend(v15, "setResultType:", 1);
    -[PLGenericAlbum managedObjectContext](self, "managedObjectContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v49;
    objc_msgSend(v21, "executeFetchRequest:error:", v15, &v56);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v56;

    v11 = objc_msgSend(v22, "count") != 1;
    v7 = v44;

    v6 = v46;
    v49 = v23;
    v5 = v50;
    if (!v10)
      goto LABEL_11;
  }
  else
  {
    v11 = 0;
    if (!v10)
    {
LABEL_11:
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v48 = objc_claimAutoreleasedReturnValue();
      if ((v10 & 1) == 0)
        -[NSObject addObject:](v48, "addObject:", CFSTR("needs update"));
      if (v11)
        -[NSObject addObject:](v48, "addObject:", CFSTR("reset custom key"));
      PLBackendGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        -[PLGenericAlbum uuid](self, "uuid");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLGenericAlbum objectID](self, "objectID");
        v26 = v7;
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v60 = v25;
        v61 = 2114;
        v62 = v27;
        v63 = 2114;
        v64 = v48;
        _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_INFO, "Updating key assets for album %{public}@ %{public}@ with reason %{public}@", buf, 0x20u);

        v7 = v26;
      }

      v42 = v4;
      v43 = v3;
      v47 = v6;
      if (v11)
      {
        -[PLGenericAlbum setCustomKeyAsset:](self, "setCustomKeyAsset:", 0);

        v28 = objc_alloc_init(MEMORY[0x1E0C99E10]);
      }
      else
      {
        v28 = objc_alloc_init(MEMORY[0x1E0C99E10]);
        if (v5)
        {
          -[PLGenericAlbum managedObjectContext](self, "managedObjectContext");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v5;
          objc_msgSend(v29, "objectWithID:", v5);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v28, "addObject:", v30);
          v31 = 0;
LABEL_22:
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          v45 = v7;
          v32 = v7;
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
          if (v33)
          {
            v34 = v33;
            v35 = *(_QWORD *)v53;
LABEL_24:
            v36 = 0;
            while (1)
            {
              if (*(_QWORD *)v53 != v35)
                objc_enumerationMutation(v32);
              v37 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v36);
              if ((v31 & 1) != 0 || (objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * v36), "isEqual:", v51) & 1) == 0)
              {
                -[PLGenericAlbum managedObjectContext](self, "managedObjectContext");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "objectWithID:", v37);
                v39 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v28, "addObject:", v39);
                v40 = objc_msgSend(v28, "count");
                v41 = -[PLGenericAlbum keyAssetsMaxCount](self, "keyAssetsMaxCount");

                if (v40 >= v41)
                  break;
              }
              if (v34 == ++v36)
              {
                v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
                if (v34)
                  goto LABEL_24;
                break;
              }
            }
          }

          -[PLGenericAlbum setKeyAssets:](self, "setKeyAssets:", v28);
          v4 = v42;
          v3 = v43;
          v9 = v49;
          v5 = v51;
          v7 = v45;
          v6 = v47;
          v12 = v48;
          goto LABEL_33;
        }
      }
      v51 = 0;
      v31 = 1;
      goto LABEL_22;
    }
  }
  if (v11)
    goto LABEL_11;
  v9 = v49;
LABEL_34:

  objc_autoreleasePoolPop(v3);
}

- (int)kindValue
{
  void *v2;
  int v3;

  -[PLGenericAlbum kind](self, "kind");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shortValue");

  return v3;
}

- (void)setKindValue:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (__int16)a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PLGenericAlbum setKind:](self, "setKind:", v4);

}

- (void)setUserQueryData:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35__PLGenericAlbum_setUserQueryData___block_invoke;
  v6[3] = &unk_1E36647D8;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[PLManagedObject pl_safeSetValue:forKey:valueDidChangeHandler:](self, "pl_safeSetValue:forKey:valueDidChangeHandler:", v5, CFSTR("userQueryData"), v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (BOOL)isLibrary
{
  return -[PLGenericAlbum kindValue](self, "kindValue") == 1552;
}

- (BOOL)isCameraAlbum
{
  return -[PLGenericAlbum kindValue](self, "kindValue") == 1000;
}

- (BOOL)isPanoramasAlbum
{
  return -[PLGenericAlbum kindValue](self, "kindValue") == 1605;
}

- (BOOL)isSmartAlbum
{
  return objc_msgSend((id)objc_opt_class(), "isSmartAlbumForKind:", -[PLGenericAlbum kindValue](self, "kindValue"));
}

- (BOOL)isUserCreated
{
  return objc_msgSend((id)objc_opt_class(), "isUserCreatedForKind:", -[PLGenericAlbum kindValue](self, "kindValue"));
}

- (BOOL)isOwnPhotoStreamAlbum
{
  return -[PLGenericAlbum kindValue](self, "kindValue") == 1500;
}

- (BOOL)isPhotoStreamAlbum
{
  return -[PLGenericAlbum kindValue](self, "kindValue") == 1602
      || -[PLGenericAlbum kindValue](self, "kindValue") == 1500;
}

- (BOOL)isCloudSharedAlbum
{
  return -[PLGenericAlbum kindValue](self, "kindValue") == 1505;
}

- (BOOL)isRecentlyAddedAlbum
{
  return -[PLGenericAlbum kindValue](self, "kindValue") == 1616;
}

- (BOOL)isUserLibraryAlbum
{
  return -[PLGenericAlbum kindValue](self, "kindValue") == 1613;
}

- (BOOL)isProjectAlbum
{
  return -[PLGenericAlbum kindValue](self, "kindValue") == 1508;
}

- (BOOL)isDuplicateAlbum
{
  return -[PLGenericAlbum kindValue](self, "kindValue") == 1510;
}

- (BOOL)isPendingPhotoStreamAlbum
{
  void *v3;
  uint64_t v4;

  if (-[PLGenericAlbum kindValue](self, "kindValue") != 1505)
    return 0;
  -[PLGenericAlbum cloudRelationshipState](self, "cloudRelationshipState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4 == 1;
}

- (BOOL)isStandInAlbum
{
  int v2;

  v2 = -[PLGenericAlbum kindValue](self, "kindValue");
  return v2 == 4001 || (v2 & 0xFFFFFFFE) == 4002;
}

- (BOOL)isFolder
{
  return +[PLGenericAlbum isFolder:](PLGenericAlbum, "isFolder:", -[PLGenericAlbum kindValue](self, "kindValue"));
}

- (BOOL)isProjectAlbumRootFolder
{
  return -[PLGenericAlbum kindValue](self, "kindValue") == 3998;
}

- (BOOL)isRegularRootFolder
{
  return -[PLGenericAlbum kindValue](self, "kindValue") == 3999;
}

- (BOOL)isOwnedCloudSharedAlbum
{
  return 0;
}

- (BOOL)isFamilyCloudSharedAlbum
{
  return 0;
}

- (BOOL)isMultipleContributorCloudSharedAlbum
{
  return 0;
}

- (BOOL)canContributeToCloudSharedAlbum
{
  return 0;
}

- (BOOL)canShowComments
{
  return -[PLGenericAlbum kindValue](self, "kindValue") == 1505;
}

- (NSArray)localizedLocationNames
{
  return 0;
}

- (BOOL)canPerformEditOperation:(unint64_t)a3
{
  return 0;
}

- (BOOL)shouldDeleteWhenEmpty
{
  int v2;

  v2 = -[PLGenericAlbum kindValue](self, "kindValue");
  return (v2 - 1603) < 2 || v2 == 12;
}

- (NSURL)groupURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99E98];
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLGenericAlbum uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@://%@/?%@=%@"), CFSTR("assets-library"), CFSTR("group"), CFSTR("id"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v6;
}

- (id)sortingComparator
{
  return 0;
}

- (id)assetsByObjectIDAtIndexes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v4 = a3;
  -[PLGenericAlbum assets](self, "assets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLGenericAlbum managedObjectContext](self, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __44__PLGenericAlbum_assetsByObjectIDAtIndexes___block_invoke;
    v13[3] = &unk_1E3664800;
    v14 = v5;
    v15 = v7;
    v8 = v6;
    v16 = v8;
    v9 = v7;
    objc_msgSend(v4, "enumerateIndexesUsingBlock:", v13);
    v10 = v16;
    v11 = v8;

  }
  else
  {
    objc_msgSend(v5, "objectsAtIndexes:", v4);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (void)batchFetchAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLGenericAlbum managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v12, "isFault"))
        {
          objc_msgSend(v12, "objectID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v5, "addObject:", v13);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v5, "count"))
  {
    v14 = (void *)MEMORY[0x1E0C97B48];
    +[PLManagedAsset entityName](PLManagedAsset, "entityName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fetchRequestWithEntityName:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPredicate:", v17);

    objc_msgSend(v16, "setReturnsObjectsAsFaults:", 0);
    v21 = 0;
    objc_msgSend(v6, "executeFetchRequest:error:", v16, &v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v21;
    v20 = v19;
    if (!v18)
      NSLog(CFSTR("Failed to prefetch image objects: %@"), v19);

  }
}

- (void)reducePendingItemsCountBy:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;

  v5 = (int)-[PLGenericAlbum pendingItemsCount](self, "pendingItemsCount");
  if (v5 <= a3)
    -[PLGenericAlbum setPendingItemsType:](self, "setPendingItemsType:", 1);
  if (v5 >= a3)
    v6 = v5 - a3;
  else
    v6 = 0;
  -[PLGenericAlbum setPendingItemsCount:](self, "setPendingItemsCount:", v6);
}

- (void)registerForChanges
{
  -[PLGenericAlbum setIsRegisteredForChanges:](self, "setIsRegisteredForChanges:", 1);
}

- (void)unregisterForChanges
{
  if (-[PLGenericAlbum isRegisteredForChanges](self, "isRegisteredForChanges"))
    -[PLGenericAlbum setIsRegisteredForChanges:](self, "setIsRegisteredForChanges:", 0);
}

- (unint64_t)countForAssetsOfKind:(signed __int16)a3
{
  int v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  -[PLGenericAlbum managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3880];
  -[PLGenericAlbum objectID](self, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithFormat:", CFSTR("kind = %d AND albums CONTAINS %@"), v3, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v11);

  v16 = 0;
  v12 = objc_msgSend(v5, "countForFetchRequest:error:", v8, &v16);
  v13 = v16;
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLBackendGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      v18 = v3;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "_countForAssetsOfKind:%d fetch request failed: %@", buf, 0x12u);
    }

    v12 = 0;
  }

  return v12;
}

- (void)updateAlbumFolderRelation:(id)a3 inLibrary:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  void *v51;
  void *v52;
  const char *v53;
  int v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  uint64_t v73;
  void *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  NSObject *v83;
  void *v84;
  unint64_t v85;
  void *v86;
  uint64_t v87;
  NSObject *v88;
  void *v89;
  void *v90;
  void *v91;
  NSObject *log;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  NSObject *v97;
  uint64_t v98;
  unint64_t v99;
  id v100;
  void *v101;
  int v102;
  void *v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  id v107;
  uint8_t buf[4];
  uint64_t v109;
  __int16 v110;
  uint64_t v111;
  __int16 v112;
  uint64_t v113;
  __int16 v114;
  unint64_t v115;
  __int16 v116;
  uint64_t v117;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((PLIsAssetsd() & 1) == 0 && (MEMORY[0x19AEC0720]() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLGenericAlbum.m"), 2026, CFSTR("Only called from assetsd / unit test"));

  }
  objc_msgSend(v8, "libraryServicesManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "relationshipOrderKeyManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "parentIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PLGenericAlbum isProjectAlbum](self, "isProjectAlbum");
  if (v11)
  {
    +[PLGenericAlbum albumWithCloudGUID:inLibrary:](PLGenericAlbum, "albumWithCloudGUID:inLibrary:", v11, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v12)
      +[PLGenericAlbum projectAlbumRootFolderInLibrary:](PLManagedFolder, "projectAlbumRootFolderInLibrary:", v8);
    else
      +[PLGenericAlbum rootFolderInLibrary:](PLManagedFolder, "rootFolderInLibrary:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  if (v13 && (objc_msgSend(v13, "isDeleted") & 1) == 0)
  {
    v104 = v10;
    objc_msgSend(v14, "entity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0C97B20];
    +[PLManagedFolder entityName](PLManagedFolder, "entityName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "managedObjectContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "entityForName:inManagedObjectContext:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v15, "isKindOfEntity:", v19);

    if ((v20 & 1) == 0)
    {
      v54 = MEMORY[0x19AEC04BC]();
      PLBackendGetLog();
      v55 = objc_claimAutoreleasedReturnValue();
      v39 = v55;
      if (v54)
      {
        if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
        {
          -[PLGenericAlbum _compactDebugDescription](self, "_compactDebugDescription");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLGenericAlbum cloudGUID](self, "cloudGUID");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "description");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v109 = (uint64_t)v11;
          v110 = 2112;
          v111 = (uint64_t)v56;
          v112 = 2114;
          v113 = (uint64_t)v57;
          v114 = 2112;
          v115 = (unint64_t)v58;
          _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_FAULT, "<rdar://problem/28377493> Unexpected non-folder parentIdentifier %{public}@ found in album %@ [%{public}@] change %@", buf, 0x2Au);

        }
        v10 = v104;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "_compactDebugDescription");
        else
          objc_msgSend(v14, "description");
        v39 = objc_claimAutoreleasedReturnValue();
        v68 = (void *)MEMORY[0x1E0CB3940];
        -[PLGenericAlbum _compactDebugDescription](self, "_compactDebugDescription");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "description");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "stringWithFormat:", CFSTR("Unexpected non-folder parent %@ referenced for album %@ with change record %@. See rdar://28377493."), v39, v69, v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();

        +[PLDiagnostics fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:](PLDiagnostics, "fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:", CFSTR("Photos Data Syncing Issue Detected!"), CFSTR("Please file a Radar for non-folder parent album."), CFSTR("TTR Photos Framework: non-folder parent album"), v71);
      }
      else
      {
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          -[PLGenericAlbum cloudGUID](self, "cloudGUID");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLGenericAlbum _compactDebugDescription](self, "_compactDebugDescription");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "description");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v109 = (uint64_t)v11;
          v110 = 2112;
          v111 = (uint64_t)v59;
          v112 = 2114;
          v113 = (uint64_t)v60;
          v114 = 2112;
          v115 = (unint64_t)v61;
          _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_ERROR, "Unexpected non-folder parentIdentifier %{public}@ found in album %@ [%{public}@] change %@", buf, 0x2Au);

        }
        v10 = v104;
      }
      goto LABEL_75;
    }
    -[PLGenericAlbum parentFolder](self, "parentFolder");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = objc_msgSend(v21, "isEqual:", v14);

    -[PLGenericAlbum objectID](self, "objectID");
    v22 = v7;
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectID");
    v24 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "childCollections");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "indexOfObject:", self);
    v101 = v22;
    v27 = objc_msgSend(v22, "position");
    if (!v27)
    {
      v97 = v23;
      v62 = (void *)v24;
      v10 = v104;
      if (!*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          -[PLGenericAlbum uuid](self, "uuid");
          v95 = v26;
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "uuid");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v109 = (uint64_t)v64;
          v110 = 2112;
          v111 = (uint64_t)v65;
          _os_log_impl(&dword_199541000, v63, OS_LOG_TYPE_ERROR, "Ignoring unsupported order value (0), appending %@ to the end of %@", buf, 0x16u);

          v10 = v104;
          v26 = v95;
        }

      }
      v66 = objc_msgSend(v25, "count");
      if ((v102 & 1) != 0)
      {
        v103 = (void *)v24;
        v67 = 0;
        v39 = v97;
LABEL_70:
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v26);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "moveChildCollectionsAtIndexes:toIndex:", v82, v66);

LABEL_73:
        v62 = v103;
        goto LABEL_74;
      }
      objc_msgSend(v14, "insertObject:inChildCollectionsAtIndex:", self, v66);
      v67 = 0;
      v39 = v97;
LABEL_74:

      v7 = v101;
LABEL_75:

      goto LABEL_76;
    }
    v28 = v27;
    v94 = v26;
    v107 = 0;
    objc_msgSend(v8, "managedObjectContext");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v104;
    v98 = v28;
    v103 = (void *)v24;
    v30 = objc_msgSend(v104, "findIndexForAlbumWithID:newOrderValue:inFolderWithID:hasOrderValueConflictWithAlbumID:inContext:", v23, v28, v24, &v107, v29);
    v100 = v107;

    v31 = objc_msgSend(v25, "count");
    v32 = v30;
    v99 = v30;
    if (v30 > v31)
    {
      if (!*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v98);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v25, "count");
          *(_DWORD *)buf = 138413314;
          v109 = (uint64_t)v34;
          v110 = 2112;
          v111 = v23;
          v112 = 2112;
          v113 = v24;
          v114 = 2048;
          v115 = v99;
          v116 = 2048;
          v117 = v35;
          _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_DEFAULT, "Child collection index based on order value is too large for childCollections: order value %@ for %@ on %@ target index = %ld, count = %ld", buf, 0x34u);

        }
      }
      v32 = objc_msgSend(v25, "count");
    }
    v36 = v25;
    if (v100)
    {
      v93 = v32;
      -[PLGenericAlbum managedObjectContext](self, "managedObjectContext");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "existingObjectWithID:error:", v100, 0);
      v38 = objc_claimAutoreleasedReturnValue();

      v96 = (void *)v38;
      if (v38)
      {
        v25 = v36;
        v39 = v23;
        if (!*MEMORY[0x1E0D115D0])
        {
          __CPLAssetsdOSLogDomain();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v98);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413058;
            v109 = (uint64_t)v41;
            v110 = 2112;
            v111 = v23;
            v112 = 2112;
            v113 = (uint64_t)v103;
            v114 = 2112;
            v115 = (unint64_t)v100;
            _os_log_impl(&dword_199541000, v40, OS_LOG_TYPE_DEFAULT, "Folder album order value %@ for %@ on %@ conflicts with %@, adjusting", buf, 0x2Au);

          }
        }
        objc_msgSend(v96, "title");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLGenericAlbum title](self, "title");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v42, "compare:", v43);

        if (!v44)
        {
          objc_msgSend(v96, "cloudGUID");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLGenericAlbum cloudGUID](self, "cloudGUID");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v45, "compare:", v46);

        }
        v105 = 0;
        v106 = 0;
        +[PLManagedFolder childKeyForOrdering](PLManagedFolder, "childKeyForOrdering");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "managedObjectContext");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "getConflictResolutionOrderValuesForRelationship:onObjectWithID:atIndex:intoLower:higher:inContext:", v47, v103, v99, &v106, &v105, v48);

        if (v44 == -1)
        {
          v73 = v106;
          if (v106)
          {
            objc_msgSend(v96, "objectID");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = v104;
            objc_msgSend(v104, "stashFolderAlbumsLocationValue:forAlbumWithID:inFolderWithID:atIndex:", v73, v74, v103, v99);

            v49 = v98;
            if (*MEMORY[0x1E0D115D0])
              goto LABEL_65;
            __CPLAssetsdOSLogDomain();
            v75 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v98);
              log = v75;
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v106);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v96, "objectID");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v109 = (uint64_t)v76;
              v110 = 2112;
              v111 = (uint64_t)v77;
              v112 = 2112;
              v113 = (uint64_t)v78;
              v79 = "Conflicting existing album folder order value (ascending) updated from %@ to %@ for %@";
LABEL_63:
              _os_log_impl(&dword_199541000, log, OS_LOG_TYPE_DEFAULT, v79, buf, 0x20u);

              v49 = v98;
              v75 = log;

              v10 = v104;
            }
LABEL_64:

            goto LABEL_65;
          }
          v10 = v104;
          v49 = v105;
          if (v105)
          {
            if (*MEMORY[0x1E0D115D0])
              goto LABEL_65;
            __CPLAssetsdOSLogDomain();
            v50 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
              goto LABEL_34;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v98);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v105);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v109 = (uint64_t)v51;
            v110 = 2112;
            v111 = (uint64_t)v52;
            v112 = 2112;
            v113 = v23;
            v53 = "Conflicting incoming album folder order value (ascending) updated from %@ to %@ for %@";
            goto LABEL_33;
          }
          v49 = v98;
          if (v102)
          {
            v87 = v94;
            if (!*MEMORY[0x1E0D115D0])
            {
              __CPLAssetsdOSLogDomain();
              v88 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v99);
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v109 = v23;
                v110 = 2112;
                v111 = (uint64_t)v89;
                v112 = 2112;
                v113 = (uint64_t)v103;
                _os_log_impl(&dword_199541000, v88, OS_LOG_TYPE_DEFAULT, "Conflicting album folder order value (ascending) could not be stashed, moving %@ to %@ for %@", buf, 0x20u);

                v87 = v94;
              }

            }
            objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v87);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "moveChildCollectionsAtIndexes:toIndex:", v90, v93);

            goto LABEL_96;
          }
        }
        else
        {
          v49 = v105;
          if (v105)
          {
            v10 = v104;
            if (*MEMORY[0x1E0D115D0])
            {
LABEL_65:
              ++v99;
              v72 = 1;
LABEL_66:

              v32 = v93;
              goto LABEL_67;
            }
            __CPLAssetsdOSLogDomain();
            v50 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
LABEL_34:

              v49 = v105;
              goto LABEL_65;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v98);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v105);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v109 = (uint64_t)v51;
            v110 = 2112;
            v111 = (uint64_t)v52;
            v112 = 2112;
            v113 = v23;
            v53 = "Conflicting incoming album folder order value (descending) updated from %@ to %@ for %@";
LABEL_33:
            _os_log_impl(&dword_199541000, v50, OS_LOG_TYPE_DEFAULT, v53, buf, 0x20u);

            v10 = v104;
            goto LABEL_34;
          }
          v80 = v106;
          v10 = v104;
          if (v106)
          {
            objc_msgSend(v96, "objectID");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "stashFolderAlbumsLocationValue:forAlbumWithID:inFolderWithID:atIndex:", v80, v81, v103, v99);

            v49 = v98;
            if (*MEMORY[0x1E0D115D0])
              goto LABEL_65;
            __CPLAssetsdOSLogDomain();
            v75 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v98);
              log = v75;
              v76 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v106);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v96, "objectID");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v109 = (uint64_t)v76;
              v110 = 2112;
              v111 = (uint64_t)v77;
              v112 = 2112;
              v113 = (uint64_t)v78;
              v79 = "Conflicting existing album folder order value (descending) updated from %@ to %@ for %@";
              goto LABEL_63;
            }
            goto LABEL_64;
          }
          v49 = v98;
          if (v102)
          {
            if (!*MEMORY[0x1E0D115D0])
            {
              __CPLAssetsdOSLogDomain();
              v83 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v99 + 1);
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v109 = v23;
                v110 = 2112;
                v111 = (uint64_t)v84;
                v112 = 2112;
                v113 = (uint64_t)v103;
                _os_log_impl(&dword_199541000, v83, OS_LOG_TYPE_DEFAULT, "Conflicting album folder order value (descending) could not be stashed, moving %@ to %@ for %@", buf, 0x20u);

              }
            }
            if (v93 >= objc_msgSend(v25, "count"))
              v85 = v93;
            else
              v85 = v93 + 1;
            objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v94);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "moveChildCollectionsAtIndexes:toIndex:", v86, v85);

LABEL_96:
            v72 = 0;
            v49 = v98;
            goto LABEL_66;
          }
        }
        v72 = 0;
        goto LABEL_66;
      }
      v72 = 1;
      v25 = v36;
      v39 = v23;
      v32 = v93;
    }
    else
    {
      v72 = 1;
      v39 = v23;
    }
    v49 = v98;
LABEL_67:
    if ((v102 & 1) != 0)
    {
      v67 = v100;
      if ((v72 & 1) == 0)
      {
        v66 = v32;
        v26 = v94;
        goto LABEL_70;
      }
    }
    else
    {
      objc_msgSend(v14, "insertObject:inChildCollectionsAtIndex:", self, v32);
      v67 = v100;
      if (!v72)
        goto LABEL_73;
    }
    v62 = v103;
    objc_msgSend(v10, "stashFolderAlbumsLocationValue:forAlbumWithID:inFolderWithID:atIndex:", v49, v39, v103, v99);
    goto LABEL_74;
  }
LABEL_76:

}

- (id)_kindDescription
{
  int v3;
  id result;
  __CFString *v5;

  v3 = -[PLGenericAlbum kindValue](self, "kindValue");
  if (v3 > 1549)
  {
    if (v3 <= 1601)
    {
      if (v3 <= 1551)
      {
        if (v3 == 1550)
          return CFSTR("1WaySyncAlbum");
        else
          return CFSTR("1WaySyncEvent");
      }
      if (v3 == 1552)
        return CFSTR("1WaySyncLibraryAlbum");
      if (v3 == 1600)
        return CFSTR("AllAssetsAlbum");
    }
    else if (v3 <= 3570)
    {
      if (v3 == 1602)
        return CFSTR("AllPhotoStream");
      if (v3 == 1612)
        return CFSTR("Trash Bin");
    }
    else
    {
      switch(v3)
      {
        case 3571:
          return CFSTR("progress-sync");
        case 3572:
          return CFSTR("progress-ota-restore");
        case 3573:
          return CFSTR("progress-fs-import");
      }
    }
    goto LABEL_29;
  }
  if (v3 <= 15)
  {
    switch(v3)
    {
      case 2:
        return CFSTR("Regular");
      case 12:
        return CFSTR("Event");
      case 15:
        return CFSTR("Faces");
    }
LABEL_29:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Unknown %d>"), -[PLGenericAlbum kindValue](self, "kindValue"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v5;
  }
  switch(v3)
  {
    case 1500:
      return CFSTR("PhotoStream");
    case 1501:
    case 1503:
    case 1504:
    case 1506:
      goto LABEL_29;
    case 1502:
      return CFSTR("PictureFrame");
    case 1505:
      return CFSTR("Cloud Shared Album");
    case 1507:
      return CFSTR("UserSmartAlbum");
    case 1508:
      return CFSTR("Project");
    default:
      if (v3 == 16)
      {
        v5 = CFSTR("Places");
        return v5;
      }
      if (v3 != 1000)
        goto LABEL_29;
      result = CFSTR("Saved");
      break;
  }
  return result;
}

- (id)_compactDebugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x19AEC1554](self, a2);
  -[PLGenericAlbum objectID](self, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URIRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    objc_msgSend(v7, "subarrayWithRange:", objc_msgSend(v7, "count") - 2, 2);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3940];
  -[PLGenericAlbum uuid](self, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLGenericAlbum _kindDescription](self, "_kindDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLGenericAlbum title](self, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ [%@] (%@ %@)"), v11, v9, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  return v14;
}

- (id)_prettyDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x19AEC1554](self, a2);
  -[PLGenericAlbum objectID](self, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URIRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    objc_msgSend(v7, "subarrayWithRange:", objc_msgSend(v7, "count") - 2, 2);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLGenericAlbum isFault](self, "isFault"))
  {
    v10 = v9;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    -[PLGenericAlbum _kindDescription](self, "_kindDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ (%@)"), v9, v12);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_autoreleasePoolPop(v3);
  return v10;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLGenericAlbum;
  -[PLGenericAlbum description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLGenericAlbum kind](self, "kind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLGenericAlbum title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("; kind = %@; title = \"%@\"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)registerDerivedAlbum:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  PLIndexMappingCache **derivedAlbums;
  id WeakRetained;
  NSObject *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x19AEC1554]();
  v6 = 0;
  derivedAlbums = self->_derivedAlbums;
  do
  {
    WeakRetained = objc_loadWeakRetained((id *)&derivedAlbums[v6]);

    if (!WeakRetained)
    {
      objc_storeWeak((id *)&derivedAlbums[v6], v4);
      goto LABEL_8;
    }
    ++v6;
  }
  while (v6 != 5);
  PLBackendGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = 134217984;
    v11 = 5;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "More than maximum %ld filtered albums trying to register. This will fail.", (uint8_t *)&v10, 0xCu);
  }

LABEL_8:
  objc_autoreleasePoolPop(v5);

}

- (void)unregisterAllDerivedAlbums
{
  uint64_t v2;
  PLIndexMappingCache **derivedAlbums;

  v2 = 0;
  derivedAlbums = self->_derivedAlbums;
  do
    objc_storeWeak((id *)&derivedAlbums[v2++], 0);
  while (v2 != 5);
}

- (void)enumerateDerivedAlbums:(id)a3
{
  uint64_t v4;
  PLIndexMappingCache **derivedAlbums;
  id WeakRetained;
  void (**v7)(id, id);

  v7 = (void (**)(id, id))a3;
  v4 = 0;
  derivedAlbums = self->_derivedAlbums;
  do
  {
    WeakRetained = objc_loadWeakRetained((id *)&derivedAlbums[v4]);
    if (WeakRetained)
      v7[2](v7, WeakRetained);

    ++v4;
  }
  while (v4 != 5);

}

- (BOOL)hasDerivedIndexMappers
{
  id WeakRetained;
  id *v5;
  unint64_t v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)self->_derivedAlbums);

  if (WeakRetained)
    return 1;
  v5 = (id *)&self->_derivedAlbums[1];
  v6 = -1;
  while (v6 != 3)
  {
    v7 = objc_loadWeakRetained(v5);

    ++v6;
    ++v5;
    if (v7)
      return v6 < 4;
  }
  v6 = 4;
  return v6 < 4;
}

- (BOOL)isRegisteredForChanges
{
  return self->isRegisteredForChanges;
}

- (void)setIsRegisteredForChanges:(BOOL)a3
{
  self->isRegisteredForChanges = a3;
}

- (BOOL)didRegisteredWithUserInterfaceContext
{
  return self->didRegisteredWithUserInterfaceContext;
}

- (void)setDidRegisteredWithUserInterfaceContext:(BOOL)a3
{
  self->didRegisteredWithUserInterfaceContext = a3;
}

- (void).cxx_destruct
{
  PLIndexMappingCache **derivedAlbums;
  uint64_t i;

  derivedAlbums = self->_derivedAlbums;
  for (i = 4; i != -1; --i)
    objc_destroyWeak((id *)&derivedAlbums[i]);
}

void __44__PLGenericAlbum_assetsByObjectIDAtIndexes___block_invoke(id *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1[4], "managedObjectIDAtIndex:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    objc_msgSend(a1[5], "objectWithID:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "addObject:", v4);

    v3 = v5;
  }

}

void __35__PLGenericAlbum_setUserQueryData___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    +[PLQueryHandler constructQueryFromData:](PLQueryHandler, "constructQueryFromData:", *(_QWORD *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setPrivacyState:", +[PLQueryHandler includesHiddenAssetsInQuery:](PLQueryHandler, "includesHiddenAssetsInQuery:", v2));

  }
}

void __65__PLGenericAlbum__removeAlbumsAndFolders_inManagedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char isKindOfClass;
  NSObject *v5;
  const __CFString *v6;
  uint64_t v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (!*MEMORY[0x1E0D115D0])
  {
    __CPLAssetsdOSLogDomain();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("album");
      if ((isKindOfClass & 1) != 0)
        v6 = CFSTR("folder");
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "Deleting %@: %@", (uint8_t *)&v8, 0x16u);
    }

  }
  objc_msgSend(v3, "delete");
  v7 = 40;
  if ((isKindOfClass & 1) != 0)
    v7 = 32;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + v7) + 8) + 24);

}

- (id)payloadID
{
  void *v2;
  void *v3;

  -[PLGenericAlbum uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)payloadForChangedKeys:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("PLGenericAlbum subclasses must implement payloadForChangedKeys"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (id)payloadIDForTombstone:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("uuid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLJournalEntryPayloadIDFactory payloadIDWithUUIDString:](PLJournalEntryPayloadIDFactory, "payloadIDWithUUIDString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)validForPersistenceChangedForChangedKeys:(id)a3
{
  return objc_msgSend(a3, "containsObject:", CFSTR("kind"));
}

- (id)scopeIdentifier
{
  void *v2;
  void *v3;

  -[PLGenericAlbum photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mainScopeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)scopedIdentifier
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  -[PLGenericAlbum cloudGUID](self, "cloudGUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PLGenericAlbum uuid](self, "uuid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[PLGenericAlbum repairUuidAndTitleWithRecoveryReason:](self, "repairUuidAndTitleWithRecoveryReason:", "-[PLGenericAlbum(CPL) scopedIdentifier]");
      -[PLGenericAlbum uuid](self, "uuid");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[PLGenericAlbum setCloudGUID:](self, "setCloudGUID:", v3);
  }
  v4 = objc_alloc(MEMORY[0x1E0D11468]);
  -[PLGenericAlbum scopeIdentifier](self, "scopeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithScopeIdentifier:identifier:", v5, v3);

  return v6;
}

- (id)cplAlbumChangeInPhotoLibrary:(id)a3
{
  id v4;
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  PLRelationshipOrderKeyManager *v20;
  PLRelationshipOrderKeyManager *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  PLGenericAlbum *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  _BOOL8 v30;
  void *v31;
  _QWORD v33[4];
  id v34;
  uint8_t buf[4];
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0D11340]);
  if (!-[PLGenericAlbum isProjectAlbumRootFolder](self, "isProjectAlbumRootFolder")
    && !-[PLGenericAlbum isRegularRootFolder](self, "isRegularRootFolder"))
  {
    -[PLGenericAlbum scopedIdentifier](self, "scopedIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setScopedIdentifier:", v10);

    -[PLGenericAlbum title](self, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setName:", v11);

    -[PLGenericAlbum importedByBundleIdentifier](self, "importedByBundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImportedByBundleIdentifier:", v12);

    -[PLGenericAlbum parentFolder](self, "parentFolder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isRegularRootFolder") & 1) != 0)
    {
      v14 = 0;
    }
    else
    {
      -[PLGenericAlbum parentFolder](self, "parentFolder");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isProjectAlbumRootFolder");

      if ((v16 & 1) != 0)
      {
        v14 = 0;
        goto LABEL_19;
      }
      -[PLGenericAlbum parentFolder](self, "parentFolder");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "cloudGUID");
      v14 = objc_claimAutoreleasedReturnValue();

      if (v14)
        goto LABEL_19;
      -[PLGenericAlbum parentFolder](self, "parentFolder");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "uuid");
      v14 = objc_claimAutoreleasedReturnValue();
    }

LABEL_19:
    objc_msgSend(v5, "setParentIdentifier:", v14);
    objc_msgSend(v4, "managedObjectContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "libraryServicesManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "relationshipOrderKeyManager");
    v20 = (PLRelationshipOrderKeyManager *)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      v21 = [PLRelationshipOrderKeyManager alloc];
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __52__PLGenericAlbum_CPL__cplAlbumChangeInPhotoLibrary___block_invoke;
      v33[3] = &unk_1E3670BD0;
      v34 = v19;
      v20 = -[PLRelationshipOrderKeyManager initWithGenerateContextBlock:](v21, "initWithGenerateContextBlock:", v33);

    }
    -[PLRelationshipOrderKeyManager parentFolderOrderValueForAlbum:inManagedObjectContext:](v20, "parentFolderOrderValueForAlbum:inManagedObjectContext:", self, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPosition:", objc_msgSend(v22, "integerValue"));

    goto LABEL_22;
  }
  if (!-[PLGenericAlbum isProjectAlbumRootFolder](self, "isProjectAlbumRootFolder"))
  {
    if (-[PLGenericAlbum isRegularRootFolder](self, "isRegularRootFolder"))
    {
      v6 = CFSTR("----Root-Folder----");
      goto LABEL_7;
    }
    if (*MEMORY[0x1E0D115D0])
      goto LABEL_23;
    __CPLAssetsdOSLogDomain();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v36 = -[PLGenericAlbum kindValue](self, "kindValue");
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Cannot create CPLAlbumChange for unexpected root type: %u", buf, 8u);
    }
LABEL_22:

    goto LABEL_23;
  }
  v6 = CFSTR("----Project-Root-Folder----");
LABEL_7:
  -[PLGenericAlbum scopeIdentifier](self, "scopeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D11468]), "initWithScopeIdentifier:identifier:", v7, v6);
  objc_msgSend(v5, "setScopedIdentifier:", v8);
  -[PLGenericAlbum cloudGUID](self, "cloudGUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    -[PLGenericAlbum setCloudGUID:](self, "setCloudGUID:", v6);

LABEL_23:
  if (-[PLGenericAlbum isFolder](self, "isFolder"))
  {
    v23 = v5;
    v24 = 3;
  }
  else
  {
    if (-[PLGenericAlbum isProjectAlbum](self, "isProjectAlbum"))
    {
      objc_msgSend(v5, "setAlbumType:", 7);
      v25 = self;
      -[PLGenericAlbum projectDocumentType](v25, "projectDocumentType");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setProjectDocumentType:", v26);

      -[PLGenericAlbum projectData](v25, "projectData");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setProjectData:", v27);

      -[PLGenericAlbum projectPreviewImageData](v25, "projectPreviewImageData");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "setProjectPreviewImageData:", v28);
      goto LABEL_29;
    }
    v23 = v5;
    v24 = 0;
  }
  objc_msgSend(v23, "setAlbumType:", v24);
LABEL_29:
  objc_msgSend(v5, "setChangeType:", 0);
  objc_msgSend(v5, "setAlbumSortType:", -[PLGenericAlbum customSortKey](self, "customSortKey"));
  objc_msgSend(v5, "setAlbumSortAscending:", -[PLGenericAlbum customSortAscending](self, "customSortAscending"));
  v29 = -[PLGenericAlbum trashedState](self, "trashedState");
  v30 = v29 == 2 || -[PLGenericAlbum trashedState](self, "trashedState") == 1;
  objc_msgSend(v5, "setInTrash:", v30);
  objc_msgSend(v5, "setInExpunged:", v29 == 2);
  -[PLGenericAlbum trashedDate](self, "trashedDate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDateDeleted:", v31);

  return v5;
}

- (void)applyPropertiesFromAlbumChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  char IsEqual;
  void *v26;
  id v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scopedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PLGenericAlbum title](self, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", v5);

    if ((v9 & 1) == 0)
      -[PLGenericAlbum setTitle:](self, "setTitle:", v5);
  }
  if (v7)
  {
    -[PLGenericAlbum cloudGUID](self, "cloudGUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 != v7)
      -[PLGenericAlbum setCloudGUID:](self, "setCloudGUID:", v7);
  }
  if ((objc_msgSend(v4, "inExpunged") & 1) != 0)
    v11 = 2;
  else
    v11 = objc_msgSend(v4, "inTrash");
  if (-[PLGenericAlbum trashedState](self, "trashedState") != (_DWORD)v11)
    -[PLGenericAlbum applyTrashedState:cascade:](self, "applyTrashedState:cascade:", v11, 0);
  -[PLGenericAlbum trashedDate](self, "trashedDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateDeleted");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqualToDate:", v13);

  if ((v14 & 1) == 0)
  {
    objc_msgSend(v4, "dateDeleted");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLGenericAlbum setTrashedDate:](self, "setTrashedDate:", v15);

  }
  v16 = -[PLGenericAlbum customSortAscending](self, "customSortAscending");
  if (v16 != objc_msgSend(v4, "albumSortAscending"))
    -[PLGenericAlbum setCustomSortAscending:](self, "setCustomSortAscending:", objc_msgSend(v4, "albumSortAscending"));
  v17 = -[PLGenericAlbum customSortKey](self, "customSortKey");
  if (v17 != objc_msgSend(v4, "albumSortType"))
    -[PLGenericAlbum setCustomSortKey:](self, "setCustomSortKey:", objc_msgSend(v4, "albumSortType"));
  if (objc_msgSend(v4, "albumType") == 7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "projectData");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLGenericAlbum setProjectData:](self, "setProjectData:", v18);

      objc_msgSend(v4, "projectPreviewImageData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      v20 = -[PLGenericAlbum setProjectPreviewImageData:error:](self, "setProjectPreviewImageData:error:", v19, &v27);
      v21 = v27;

      if ((v20 & 1) == 0 && !*MEMORY[0x1E0D115D0])
      {
        __CPLAssetsdOSLogDomain();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v29 = v21;
          _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Cannot creating projectPreviewImage resource, Error: %@", buf, 0xCu);
        }

      }
    }
  }
  if (-[PLGenericAlbum cloudLocalState](self, "cloudLocalState") != 1)
    -[PLGenericAlbum setCloudLocalState:](self, "setCloudLocalState:", 1);
  -[PLGenericAlbum importedByBundleIdentifier](self, "importedByBundleIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "importedByBundleIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  IsEqual = PLObjectIsEqual();

  if ((IsEqual & 1) == 0)
  {
    objc_msgSend(v4, "importedByBundleIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLGenericAlbum setImportedByBundleIdentifier:](self, "setImportedByBundleIdentifier:", v26);

  }
}

- (BOOL)isProjectAlbumSupportingCloudUpload
{
  void *v3;
  void *v4;
  int v5;

  if (-[PLGenericAlbum kindValue](self, "kindValue") == 1508)
  {
    -[PLGenericAlbum projectDocumentType](self, "projectDocumentType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3 && (objc_msgSend(v3, "containsString:", CFSTR("com.apple.photos.projects.legacy")) & 1) == 0)
      v5 = objc_msgSend(v4, "containsString:", CFSTR("com.apple.photos.projects.slideshow")) ^ 1;
    else
      LOBYTE(v5) = 0;

  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)cplFullRecord
{
  void *v3;
  void *v4;

  -[PLGenericAlbum photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLGenericAlbum cplAlbumChangeInPhotoLibrary:](self, "cplAlbumChangeInPhotoLibrary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __52__PLGenericAlbum_CPL__cplAlbumChangeInPhotoLibrary___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "databaseContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "newShortLivedLibraryWithName:", a2);

  return objc_msgSend(v4, "managedObjectContext");
}

+ (id)_predicateForSupportedAlbumTypes
{
  pl_dispatch_once();
  return (id)_predicateForSupportedAlbumTypes_predicate;
}

+ (PLGenericAlbum)albumWithCloudGUID:(id)a3 inLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = 0;
  if (objc_msgSend(v6, "length") && v6)
  {
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "albumsWithCloudGUIDs:inLibrary:", v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (PLGenericAlbum *)v8;
}

+ (id)albumsWithCloudGUIDs:(id)a3 inLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6 && !objc_msgSend(v6, "count"))
  {
    v14 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("cloudGUID IN %@"), v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_predicateForSupportedAlbumTypes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3528];
    v16[0] = v8;
    v16[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "andPredicateWithSubpredicates:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "albumsMatchingPredicate:expectedResultCount:inLibrary:", v12, v13, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

void __55__PLGenericAlbum_CPL___predicateForSupportedAlbumTypes__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(kind) == %d || noindex:(kind) == %d || noindex:(kind) == %d || noindex:(kind) == %d || noindex:(kind) == %d || noindex:(kind) == %d"), 2, 4000, 1507, 3999, 1508, 3998);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_predicateForSupportedAlbumTypes_predicate;
  _predicateForSupportedAlbumTypes_predicate = v0;

}

@end
