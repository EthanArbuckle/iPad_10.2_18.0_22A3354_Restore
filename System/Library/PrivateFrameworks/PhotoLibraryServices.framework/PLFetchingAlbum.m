@implementation PLFetchingAlbum

+ (id)sortDescriptorsForAlbumKind:(int)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  _QWORD *v9;
  void *v10;
  void **v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 1605:
    case 1606:
    case 1609:
    case 1610:
    case 1611:
    case 1614:
    case 1615:
    case 1617:
    case 1618:
    case 1620:
    case 1621:
    case 1622:
    case 1623:
    case 1624:
    case 1627:
    case 1628:
    case 1630:
    case 1631:
    case 1632:
    case 1634:
    case 1636:
    case 1637:
    case 1639:
    case 1641:
      goto LABEL_2;
    case 1607:
    case 1608:
    case 1629:
    case 1633:
    case 1635:
    case 1638:
      goto LABEL_7;
    case 1612:
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("trashedDate"), 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v3;
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("sortToken"), 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v17[1] = v4;
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = v17;
      goto LABEL_11;
    case 1613:
    case 1616:
    case 1625:
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v3;
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("sortToken"), 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v4;
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = v18;
      goto LABEL_11;
    case 1619:
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v3;
      v10 = (void *)MEMORY[0x1E0C99D20];
      v11 = &v14;
      goto LABEL_13;
    case 1626:
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("adjustmentTimestamp"), 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v3;
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("sortToken"), 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v15[1] = v4;
      v8 = (void *)MEMORY[0x1E0C99D20];
      v9 = v15;
LABEL_11:
      objc_msgSend(v8, "arrayWithObjects:count:", v9, 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    case 1640:
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v3;
      v10 = (void *)MEMORY[0x1E0C99D20];
      v11 = &v13;
      goto LABEL_13;
    default:
      if (a3 == 1507)
      {
LABEL_2:
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 1);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = v3;
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 1);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v16[1] = v4;
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v16[2] = v5;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_3:
      }
      else
      {
LABEL_7:
        objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("sortToken"), 1);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v3;
        v10 = (void *)MEMORY[0x1E0C99D20];
        v11 = &v12;
LABEL_13:
        objc_msgSend(v10, "arrayWithObjects:count:", v11, 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }

      return v6;
  }
}

+ (id)predicateForAlbumKind:(int)a3 includeGuest:(BOOL)a4
{
  void *v4;
  int v6;
  void *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD *v33;
  void *v34;
  uint64_t v35;
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
  _QWORD *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  _QWORD v63[2];
  _QWORD v64[3];
  _QWORD v65[3];
  _QWORD v66[4];
  _QWORD v67[2];
  _QWORD v68[3];
  _QWORD v69[3];
  _QWORD v70[3];
  _QWORD v71[3];
  _QWORD v72[3];
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[2];
  _QWORD v76[3];
  _QWORD v77[2];
  _QWORD v78[3];
  _QWORD v79[3];
  _QWORD v80[3];
  _QWORD v81[3];
  _QWORD v82[2];
  _QWORD v83[3];

  v4 = 0;
  v83[2] = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = 0;
  switch(a3)
  {
    case 1552:
      v14 = (void *)MEMORY[0x1E0D73310];
      v15 = objc_msgSend(MEMORY[0x1E0D73310], "maskForFinderSyncedAsset");
      goto LABEL_7;
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
    case 1603:
    case 1604:
    case 1629:
    case 1633:
    case 1635:
    case 1638:
      goto LABEL_62;
    case 1600:
      goto LABEL_53;
    case 1602:
      v14 = (void *)MEMORY[0x1E0D73310];
      v15 = objc_msgSend(MEMORY[0x1E0D73310], "maskForPhotoStreamAsset");
LABEL_7:
      objc_msgSend(v14, "predicateForIncludeMask:useIndex:", v15, 1);
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_42;
    case 1605:
      v17 = 1;
      goto LABEL_41;
    case 1606:
      v18 = (void *)MEMORY[0x1E0CB3528];
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K == %d) AND (noindex:(%K) != %d)"), a4, CFSTR("playbackStyle"), 4, CFSTR("kind"), 2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v81[0] = v19;
      objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForVideosAlbumExclusions"), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v81[1] = v20;
      objc_msgSend(a1, "_predicateForVisibleAsset");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v81[2] = v21;
      v22 = (void *)MEMORY[0x1E0C99D20];
      v23 = v81;
      goto LABEL_26;
    case 1607:
      objc_msgSend(a1, "_predicateForAssetSubtype:", 1, a4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("height > width"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1E0CB3528];
      v83[0] = v24;
      v83[1] = v25;
      v27 = (void *)MEMORY[0x1E0C99D20];
      v28 = v83;
      goto LABEL_50;
    case 1608:
      objc_msgSend(a1, "_predicateForAssetSubtype:", 1, a4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("width > height"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1E0CB3528];
      v82[0] = v24;
      v82[1] = v25;
      v27 = (void *)MEMORY[0x1E0C99D20];
      v28 = v82;
      goto LABEL_50;
    case 1609:
      v29 = (void *)MEMORY[0x1E0CB3528];
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == 1"), a4, CFSTR("favorite"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v80[0] = v19;
      objc_msgSend(a1, "_predicateForVisibleAsset");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v80[1] = v30;
      objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForFavoritesAlbumExclusions"), 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v80[2] = v31;
      v32 = (void *)MEMORY[0x1E0C99D20];
      v33 = v80;
      goto LABEL_44;
    case 1610:
      v17 = 102;
      goto LABEL_41;
    case 1611:
      v18 = (void *)MEMORY[0x1E0CB3528];
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == 1"), a4, CFSTR("hidden"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v78[0] = v19;
      objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForPLFetchingAlbumExclusions"), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v78[1] = v20;
      objc_msgSend(a1, "_predicateForVisibleAsset");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v78[2] = v21;
      v22 = (void *)MEMORY[0x1E0C99D20];
      v23 = v78;
      goto LABEL_26;
    case 1612:
      v18 = (void *)MEMORY[0x1E0CB3528];
      v34 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2592000.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "predicateWithFormat:", CFSTR("%K == %d AND %K > %@"), CFSTR("trashedState"), 1, CFSTR("trashedDate"), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v77[0] = v20;
      objc_msgSend(a1, "_predicateForVisibleAsset");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v77[1] = v21;
      v22 = (void *)MEMORY[0x1E0C99D20];
      v23 = v77;
      v35 = 2;
      goto LABEL_27;
    case 1613:
    case 1625:
      v8 = a4;
      v9 = objc_msgSend(MEMORY[0x1E0D73310], "maskForUserLibrary");
      if (v8)
        v9 = objc_msgSend(MEMORY[0x1E0D73310], "maskForGuestAsset") | v9;
      v10 = (void *)MEMORY[0x1E0CB3528];
      objc_msgSend(a1, "_predicateForVisibleAsset");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v73[0] = v11;
      objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", v9, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v73[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "andPredicateWithSubpredicates:", v13);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_34;
    case 1614:
      v29 = (void *)MEMORY[0x1E0CB3528];
      +[PLManagedAsset predicateForBurstStackAssets](PLManagedAsset, "predicateForBurstStackAssets");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v72[0] = v19;
      objc_msgSend(a1, "_predicateForVisibleAsset");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v72[1] = v30;
      objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForBurstsAlbumExclusions"), 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v72[2] = v31;
      v32 = (void *)MEMORY[0x1E0C99D20];
      v33 = v72;
      goto LABEL_44;
    case 1615:
      v17 = 101;
      goto LABEL_41;
    case 1616:
      v36 = (void *)MEMORY[0x1E0CB3528];
      v37 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2592000.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("addedDate"), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v76[0] = v20;
      objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForRecentlyAddedAlbumExclusions"), 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v76[1] = v38;
      objc_msgSend(a1, "_predicateForVisibleAsset");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v76[2] = v39;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 3);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "andPredicateWithSubpredicates:", v40);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_30;
    case 1617:
      v18 = (void *)MEMORY[0x1E0CB3528];
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), a4, CFSTR("derivedCameraCaptureDevice"), 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v79[0] = v19;
      objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForSelfiesAlbumExclusions"), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v79[1] = v20;
      objc_msgSend(a1, "_predicateForVisibleAsset");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v79[2] = v21;
      v22 = (void *)MEMORY[0x1E0C99D20];
      v23 = v79;
      goto LABEL_26;
    case 1618:
      v17 = 10;
      goto LABEL_41;
    case 1619:
      v41 = (void *)MEMORY[0x1E0CB3528];
      objc_msgSend(a1, "_predicateForVisibleAsset");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v70[0] = v24;
      objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForPlacesAlbum"), 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v70[1] = v25;
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != -180 AND %K != -180"), CFSTR("latitude"), CFSTR("longitude"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v70[2] = v42;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 3);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "andPredicateWithSubpredicates:", v43);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_51;
    case 1620:
      v29 = (void *)MEMORY[0x1E0CB3528];
      objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForPLFetchingAlbumExclusions"), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = v19;
      objc_msgSend(a1, "_predicateForVisibleAsset");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v71[1] = v30;
      +[PLManagedAsset predicateForDepthEffectPhotos](PLManagedAsset, "predicateForDepthEffectPhotos");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v71[2] = v31;
      v32 = (void *)MEMORY[0x1E0C99D20];
      v33 = v71;
      goto LABEL_44;
    case 1621:
      v17 = 2;
      goto LABEL_41;
    case 1622:
      v29 = (void *)MEMORY[0x1E0CB3528];
      objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForPLFetchingAlbumExclusions"), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v69[0] = v19;
      objc_msgSend(a1, "_predicateForVisibleAsset");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v69[1] = v30;
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("playbackStyle"), &unk_1E3763500);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v69[2] = v31;
      v32 = (void *)MEMORY[0x1E0C99D20];
      v33 = v69;
      goto LABEL_44;
    case 1623:
      v18 = (void *)MEMORY[0x1E0CB3528];
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), a4, CFSTR("playbackVariation"), 3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v68[0] = v19;
      objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForPLFetchingAlbumExclusions"), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v68[1] = v20;
      objc_msgSend(a1, "_predicateForVisibleAsset");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v68[2] = v21;
      v22 = (void *)MEMORY[0x1E0C99D20];
      v23 = v68;
LABEL_26:
      v35 = 3;
LABEL_27:
      objc_msgSend(v22, "arrayWithObjects:count:", v23, v35);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "andPredicateWithSubpredicates:", v44);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_31;
    case 1624:
      +[PLManagedAsset predicateForUploadableAssetsWithCloudLocalStates:](PLManagedAsset, "predicateForUploadableAssetsWithCloudLocalStates:", &unk_1E3763518, a4);
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_42;
    case 1626:
      v45 = (void *)MEMORY[0x1E0CB3528];
      v46 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -2592000.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("adjustmentTimestamp"), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v66[0] = v20;
      +[PLManagedAsset predicateToExcludeCameraAutoAdjustments](PLManagedAsset, "predicateToExcludeCameraAutoAdjustments");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v66[1] = v38;
      objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForRecentlyEditedAlbumExclusions"), 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v66[2] = v47;
      objc_msgSend(a1, "_predicateForVisibleAsset");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v66[3] = v48;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 4);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "andPredicateWithSubpredicates:", v49);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_30:
LABEL_31:

      goto LABEL_48;
    case 1627:
      v17 = 103;
      goto LABEL_41;
    case 1628:
      v50 = (void *)MEMORY[0x1E0CB3528];
      objc_msgSend(a1, "_predicateForVisibleAsset");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v74[0] = v11;
      objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForAllPhotosAlbum"), 0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v74[1] = v51;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 2);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "andPredicateWithSubpredicates:", v52);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_34:
      v6 = 1;
      goto LABEL_53;
    case 1630:
      +[PLManagedAsset predicateForRAWAndRPlusJAssets](PLManagedAsset, "predicateForRAWAndRPlusJAssets");
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_42;
    case 1631:
      v29 = (void *)MEMORY[0x1E0CB3528];
      objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForPLFetchingAlbumExclusions"), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = v19;
      objc_msgSend(a1, "_predicateForVisibleAsset");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v65[1] = v30;
      +[PLManagedAsset predicateForCinematicVideos](PLManagedAsset, "predicateForCinematicVideos");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v65[2] = v31;
      v32 = (void *)MEMORY[0x1E0C99D20];
      v33 = v65;
      goto LABEL_44;
    case 1632:
      +[PLManagedAsset predicateForProResAssets](PLManagedAsset, "predicateForProResAssets");
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_42;
    case 1634:
      v53 = (void *)MEMORY[0x1E0CB3528];
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), a4, CFSTR("duplicateAssetVisibilityState"), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v67[0] = v19;
      objc_msgSend(a1, "_predicateForVisibleAsset");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v67[1] = v30;
      v54 = (void *)MEMORY[0x1E0C99D20];
      v55 = v67;
      goto LABEL_46;
    case 1636:
      +[PLManagedAsset predicateToIncludeSharedLibrarySharingSuggestionsAssets](PLManagedAsset, "predicateToIncludeSharedLibrarySharingSuggestionsAssets");
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_42;
    case 1637:
      v17 = 104;
LABEL_41:
      objc_msgSend(a1, "_predicateForAssetSubtype:", v17, a4);
      v16 = objc_claimAutoreleasedReturnValue();
LABEL_42:
      v4 = (void *)v16;
      goto LABEL_52;
    case 1639:
      v29 = (void *)MEMORY[0x1E0CB3528];
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), a4, CFSTR("spatialType"), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v64[0] = v19;
      objc_msgSend(a1, "_predicateForVisibleAsset");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v64[1] = v30;
      objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForPLFetchingAlbumExclusions"), 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v64[2] = v31;
      v32 = (void *)MEMORY[0x1E0C99D20];
      v33 = v64;
LABEL_44:
      objc_msgSend(v32, "arrayWithObjects:count:", v33, 3);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "andPredicateWithSubpredicates:", v56);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_47;
    case 1640:
      v53 = (void *)MEMORY[0x1E0CB3528];
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == YES"), a4, CFSTR("isRecentlySaved"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v75[0] = v19;
      objc_msgSend(a1, "_predicateForVisibleAsset");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v75[1] = v30;
      v54 = (void *)MEMORY[0x1E0C99D20];
      v55 = v75;
LABEL_46:
      objc_msgSend(v54, "arrayWithObjects:count:", v55, 2);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "andPredicateWithSubpredicates:", v31);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_47:

LABEL_48:
      goto LABEL_52;
    case 1641:
      v26 = (void *)MEMORY[0x1E0CB3528];
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(%K) == %d"), a4, CFSTR("trashedState"), 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v63[0] = v24;
      objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForRecoveredAlbum"), 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v63[1] = v25;
      v27 = (void *)MEMORY[0x1E0C99D20];
      v28 = v63;
LABEL_50:
      objc_msgSend(v27, "arrayWithObjects:count:", v28, 2);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "andPredicateWithSubpredicates:", v42);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_51:

LABEL_52:
      v6 = 0;
LABEL_53:
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(complete) != 0"), a4);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v57;
      if (v4)
      {
        if (!v6)
        {
          v60 = (void *)MEMORY[0x1E0CB3528];
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v4, v57, 0);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "andPredicateWithSubpredicates:", v61);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_61;
        }
        v59 = v4;
      }
      else if ((v6 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
        v59 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v59 = v57;
      }
      v7 = v59;
LABEL_61:

LABEL_62:
      return v7;
    default:
      v7 = 0;
      goto LABEL_62;
  }
}

+ (id)_predicateForVisibleAsset
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("noindex:(%K) == %d"), CFSTR("visibilityState"), 0);
}

- (void)awakeFromFetch
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLFetchingAlbum;
  -[PLGenericAlbum awakeFromFetch](&v3, sel_awakeFromFetch);
  self->_countForDisplay = 0x7FFFFFFFFFFFFFFFLL;
  self->_photosCount = 0x7FFFFFFFFFFFFFFFLL;
  self->_videosCount = 0x7FFFFFFFFFFFFFFFLL;
  self->_emptyState = 0;
  self->_batchSize = 7;
}

- (void)awakeFromInsert
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLFetchingAlbum;
  -[PLGenericAlbum awakeFromInsert](&v3, sel_awakeFromInsert);
  self->_countForDisplay = 0x7FFFFFFFFFFFFFFFLL;
  self->_photosCount = 0x7FFFFFFFFFFFFFFFLL;
  self->_videosCount = 0x7FFFFFFFFFFFFFFFLL;
  self->_emptyState = 0;
  self->_batchSize = 7;
}

- (void)didTurnIntoFault
{
  objc_super v2;

  self->_countForDisplay = 0x7FFFFFFFFFFFFFFFLL;
  self->_photosCount = 0x7FFFFFFFFFFFFFFFLL;
  self->_videosCount = 0x7FFFFFFFFFFFFFFFLL;
  self->_emptyState = 0;
  v2.receiver = self;
  v2.super_class = (Class)PLFetchingAlbum;
  -[PLFetchingAlbum didTurnIntoFault](&v2, sel_didTurnIntoFault);
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setupFetchRequest
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  PLQueryChangeDetectionCriteria *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v3 = -[PLGenericAlbum kindValue](self, "kindValue");
  switch(v3)
  {
    case 1552:
    case 1600:
    case 1602:
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
    case 1636:
    case 1637:
    case 1639:
    case 1640:
    case 1641:
      goto LABEL_2;
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
    case 1603:
    case 1604:
    case 1629:
    case 1633:
    case 1635:
    case 1638:
      return;
    default:
      if (v3 != 1507)
        return;
LABEL_2:
      v4 = (void *)MEMORY[0x1E0C97B48];
      +[PLManagedAsset entityName](PLManagedAsset, "entityName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "fetchRequestWithEntityName:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        return;
      v7 = objc_alloc_init(PLQueryChangeDetectionCriteria);
      -[PLFetchingAlbum userQueryData](self, "userQueryData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = objc_alloc(MEMORY[0x1E0D732A0]);
        -[PLFetchingAlbum userQueryData](self, "userQueryData");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v9, "initWithData:", v10);
        -[PLGenericAlbum photoLibrary](self, "photoLibrary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLQueryHandler predicateForQuery:inLibrary:changeDetectionCriteria:](PLQueryHandler, "predicateForQuery:inLibrary:changeDetectionCriteria:", v11, v12, v7);
        v13 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend((id)objc_opt_class(), "predicateForAlbumKind:", -[PLGenericAlbum kindValue](self, "kindValue"));
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }

      -[PLFetchingAlbum extraFilterPredicate](self, "extraFilterPredicate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        if (v13)
        {
          v16 = (void *)MEMORY[0x1E0CB3528];
          v26[0] = v13;
          v26[1] = v14;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "andPredicateWithSubpredicates:", v17);
          v18 = objc_claimAutoreleasedReturnValue();

          v13 = (id)v18;
        }
        else
        {
          v13 = v14;
        }
      }
      objc_msgSend(v6, "setPredicate:", v13);
      objc_msgSend((id)objc_opt_class(), "sortDescriptorsForAlbumKind:", -[PLGenericAlbum kindValue](self, "kindValue"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v19, "mutableCopy");

      if (-[PLGenericAlbum kindValue](self, "kindValue") != 1507)
        goto LABEL_15;
      if (-[PLFetchingAlbum customSortKey](self, "customSortKey") == 5
        || -[PLFetchingAlbum customSortKey](self, "customSortKey") == 101)
      {
        v21 = (void *)MEMORY[0x1E0CB3928];
        v22 = CFSTR("additionalAttributes.title");
        v23 = 1;
LABEL_14:
        objc_msgSend(v21, "sortDescriptorWithKey:ascending:", v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "insertObject:atIndex:", v24, 0);

        goto LABEL_15;
      }
      if (-[PLFetchingAlbum customSortKey](self, "customSortKey") == 1)
      {
        v25 = (void *)MEMORY[0x1E0CB3928];
        v23 = -[PLFetchingAlbum customSortAscending](self, "customSortAscending");
        v22 = CFSTR("dateCreated");
        v21 = v25;
        goto LABEL_14;
      }
LABEL_15:
      objc_msgSend(v6, "setSortDescriptors:", v20);
      objc_msgSend(v6, "setFetchBatchSize:", -[PLFetchingAlbum batchSize](self, "batchSize"));
      -[PLFetchingAlbum setPrimitiveFetchRequest:](self, "setPrimitiveFetchRequest:", v6);

      return;
  }
}

- (NSFetchRequest)fetchRequest
{
  void *v3;

  -[PLFetchingAlbum willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("fetchRequest"));
  -[PLFetchingAlbum primitiveFetchRequest](self, "primitiveFetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PLFetchingAlbum setupFetchRequest](self, "setupFetchRequest");
    -[PLFetchingAlbum primitiveFetchRequest](self, "primitiveFetchRequest");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PLFetchingAlbum didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("fetchRequest"));
  return (NSFetchRequest *)v3;
}

- (void)setFetchRequest:(id)a3
{
  id v4;
  NSArray *cachedKeyAssets;

  v4 = a3;
  -[PLFetchingAlbum willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("fetchRequest"));
  -[PLFetchingAlbum willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("assets"));
  -[PLFetchingAlbum setPrimitiveFetchRequest:](self, "setPrimitiveFetchRequest:", v4);

  -[PLFetchingAlbum setFetchedAssets:](self, "setFetchedAssets:", 0);
  self->_countForDisplay = 0x7FFFFFFFFFFFFFFFLL;
  self->_photosCount = 0x7FFFFFFFFFFFFFFFLL;
  self->_videosCount = 0x7FFFFFFFFFFFFFFFLL;
  self->_emptyState = 0;
  cachedKeyAssets = self->_cachedKeyAssets;
  self->_cachedKeyAssets = 0;

  -[PLFetchingAlbum didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("assets"));
  -[PLFetchingAlbum didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("fetchRequest"));
}

- (void)setALAssetsGroupFilterPredicate:(id)a3
{
  NSPredicate *v5;
  NSPredicate *v6;

  v5 = (NSPredicate *)a3;
  if (self->_ALAssetsGroupFilterPredicate != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_ALAssetsGroupFilterPredicate, a3);
    -[PLFetchingAlbum setFetchRequest:](self, "setFetchRequest:", 0);
    v5 = v6;
  }

}

- (id)_performFetchWithRequest:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v4 = a3;
  -[PLFetchingAlbum managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hasChanges") & 1) != 0)
    v6 = 0;
  else
    v6 = -[PLFetchingAlbum batchSize](self, "batchSize");
  objc_msgSend(v4, "setFetchBatchSize:", v6);
  v11 = 0;
  objc_msgSend(v5, "executeFetchRequest:error:", v4, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v11;
  if (!v8)
  {
    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v9;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Error fetching: %@", buf, 0xCu);
    }

  }
  return v8;
}

- (id)assets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PLFetchingAlbum fetchedAssets](self, "fetchedAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)MEMORY[0x19AEC1554]();
    -[PLFetchingAlbum fetchRequest](self, "fetchRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLFetchingAlbum _performFetchWithRequest:](self, "_performFetchWithRequest:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[PLFetchingAlbum managedObjectContext](self, "managedObjectContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_orderedSetWithResultsFromFetchRequest:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        -[PLFetchingAlbum setFetchedAssets:](self, "setFetchedAssets:", v8);

    }
    objc_autoreleasePoolPop(v4);
  }
  return (id)-[PLFetchingAlbum fetchedAssets](self, "fetchedAssets");
}

- (void)setAssets:(id)a3
{
  id v3;

  v3 = a3;
  __break(1u);
}

- (id)mutableAssets
{
  return 0;
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[PLFetchingAlbum assets](self, "assets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)approximateCount
{
  unint64_t result;
  void *v4;
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
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  result = self->_countForDisplay;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = (void *)MEMORY[0x19AEC1554](0x7FFFFFFFFFFFFFFFLL, a2);
    v5 = (void *)MEMORY[0x1E0C97B48];
    -[PLFetchingAlbum fetchRequest](self, "fetchRequest");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entityName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fetchRequestWithEntityName:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLFetchingAlbum fetchRequest](self, "fetchRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPredicate:", v10);

    -[PLFetchingAlbum managedObjectContext](self, "managedObjectContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v12 = objc_msgSend(v11, "countForFetchRequest:error:", v8, &v16);
    v13 = v16;
    self->_countForDisplay = v12;
    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
    {
      PLBackendGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        -[NSManagedObject pl_shortDescription](self, "pl_shortDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v18 = v15;
        v19 = 2112;
        v20 = v13;
        _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Failed to get count for %@: %@", buf, 0x16u);

      }
      self->_countForDisplay = -[PLFetchingAlbum count](self, "count");
    }

    objc_autoreleasePoolPop(v4);
    return self->_countForDisplay;
  }
  return result;
}

- (BOOL)isEmpty
{
  int emptyState;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  void *v17;
  int v18;
  objc_super v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  emptyState = self->_emptyState;
  if (!emptyState)
  {
    if (-[PLFetchingAlbum isFault](self, "isFault"))
      v4 = -[PLFetchingAlbum fetchRequest](self, "fetchRequest");
    -[PLFetchingAlbum fetchedAssets](self, "fetchedAssets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = (void *)MEMORY[0x19AEC1554]();
      v7 = (void *)MEMORY[0x1E0C97B48];
      -[PLFetchingAlbum fetchRequest](self, "fetchRequest");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "entityName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fetchRequestWithEntityName:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLFetchingAlbum fetchRequest](self, "fetchRequest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "predicate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setPredicate:", v12);

      objc_msgSend(v10, "setFetchLimit:", 1);
      -[PLFetchingAlbum managedObjectContext](self, "managedObjectContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 0;
      v14 = objc_msgSend(v13, "countForFetchRequest:error:", v10, &v21);
      v15 = v21;
      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
        PLBackendGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          -[NSManagedObject pl_shortDescription](self, "pl_shortDescription");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v23 = v17;
          v24 = 2112;
          v25 = v15;
          _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Failed to get count for %@: %@", buf, 0x16u);

        }
      }
      else
      {
        if (v14)
          v18 = 2;
        else
          v18 = 1;
        self->_emptyState = v18;
      }

      objc_autoreleasePoolPop(v6);
    }
    emptyState = self->_emptyState;
    if (!emptyState)
    {
      v20.receiver = self;
      v20.super_class = (Class)PLFetchingAlbum;
      if (-[PLGenericAlbum isEmpty](&v20, sel_isEmpty))
        emptyState = 1;
      else
        emptyState = 2;
      self->_emptyState = emptyState;
    }
  }
  return emptyState == 1;
}

- (unint64_t)_fetchedCountForAssetsOfKind:(signed __int16)a3
{
  int v3;
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
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  id v19;
  NSObject *v20;
  id v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x19AEC1554](self, a2);
  -[PLFetchingAlbum managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C97B48];
  -[PLFetchingAlbum fetchRequest](self, "fetchRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLFetchingAlbum fetchRequest](self, "fetchRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB3528];
  v14 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("kind = %d"), v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayWithObjects:", v12, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "andPredicateWithSubpredicates:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setPredicate:", v17);
  v22 = 0;
  v18 = objc_msgSend(v6, "countForFetchRequest:error:", v10, &v22);
  v19 = v22;
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLBackendGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      v24 = v3;
      v25 = 2112;
      v26 = v19;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_ERROR, "countForAssetsOfKind:%d fetch request failed: %@", buf, 0x12u);
    }

    v18 = 0;
  }

  objc_autoreleasePoolPop(v5);
  return v18;
}

- (unint64_t)countForAssetsOfKind:(signed __int16)a3
{
  uint64_t v3;
  id v5;
  uint64_t v6;
  unint64_t result;
  PLFetchingAlbum *v8;
  uint64_t v9;

  v3 = a3;
  if (-[PLFetchingAlbum isFault](self, "isFault"))
    v5 = -[PLFetchingAlbum fetchRequest](self, "fetchRequest");
  if ((_DWORD)v3 == 1)
  {
    v6 = 128;
    result = self->_videosCount;
    if (result != 0x7FFFFFFFFFFFFFFFLL)
      return result;
    v8 = self;
    v9 = 1;
    goto LABEL_9;
  }
  if ((_DWORD)v3)
    return -[PLFetchingAlbum _fetchedCountForAssetsOfKind:](self, "_fetchedCountForAssetsOfKind:", v3);
  v6 = 120;
  result = self->_photosCount;
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = self;
    v9 = 0;
LABEL_9:
    result = -[PLFetchingAlbum _fetchedCountForAssetsOfKind:](v8, "_fetchedCountForAssetsOfKind:", v9);
    *(Class *)((char *)&self->super.super.super.super.isa + v6) = (Class)result;
  }
  return result;
}

- (BOOL)canPerformDeleteOperation
{
  return -[PLFetchingAlbum canPerformEditOperation:](self, "canPerformEditOperation:", 32);
}

- (BOOL)canPerformEditOperation:(unint64_t)a3
{
  int v4;
  BOOL v6;

  v4 = -[PLGenericAlbum kindValue](self, "kindValue");
  if ((v4 - 1600) <= 0x29 && ((1 << (v4 - 64)) & 0x3B5DFFFEFE1) != 0)
    return a3 < 2;
  v6 = (a3 & 0xFFFFFFFFFFFFFFBFLL) == 0;
  if ((a3 & 0xFFFFFFFFFFFFFFDFLL) == 0)
    v6 = 1;
  return v4 == 1507 && v6;
}

- (void)batchFetchAssets:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[PLFetchingAlbum fetchRequest](self, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "fetchBatchSize"))
  {
    v6.receiver = self;
    v6.super_class = (Class)PLFetchingAlbum;
    -[PLGenericAlbum batchFetchAssets:](&v6, sel_batchFetchAssets_, v4);
  }

}

- (id)filteredIndexesForPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLFetchingAlbum fetchRequest](self, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(v6, "predicate");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (id)v7;
  if (v4)
  {
    if (v7)
    {
      v9 = (void *)MEMORY[0x1E0CB3528];
      v16[0] = v7;
      v16[1] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "andPredicateWithSubpredicates:", v10);
      v11 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v11;
    }
    else
    {
      v8 = v4;
    }
  }
  objc_msgSend(v6, "setPredicate:", v8);
  objc_msgSend(v6, "setResultType:", 1);
  objc_msgSend(v6, "setIncludesPropertyValues:", 0);
  -[PLFetchingAlbum _performFetchWithRequest:](self, "_performFetchWithRequest:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLFetchingAlbum assets](self, "assets");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  indexSetForManagedObjectsMatchingIDs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_cachedKeyAssets
{
  NSArray *cachedKeyAssets;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSArray *v17;
  id v18;
  void *v19;
  NSArray *v20;
  NSArray *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  cachedKeyAssets = self->_cachedKeyAssets;
  if (!cachedKeyAssets)
  {
    -[PLFetchingAlbum fetchRequest](self, "fetchRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortDescriptors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C97B48];
    objc_msgSend(v4, "entityName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "predicate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPredicate:", v9);

    objc_msgSend(v8, "setFetchLimit:", 3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = v5;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v25;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v14), "reversedSortDescriptor");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v12);
    }

    objc_msgSend(v8, "setSortDescriptors:", v10);
    -[PLFetchingAlbum managedObjectContext](self, "managedObjectContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    objc_msgSend(v16, "executeFetchRequest:error:", v8, &v23);
    v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v18 = v23;
    v19 = v18;
    if (v17)
    {
      v20 = self->_cachedKeyAssets;
      self->_cachedKeyAssets = v17;
      v21 = v17;

    }
    else
    {
      NSLog(CFSTR("Error fetching: %@"), v18);
    }

    cachedKeyAssets = self->_cachedKeyAssets;
  }
  return cachedKeyAssets;
}

- (void)updateSnapshotAndClearCaches:(id)a3
{
  id v4;
  void *v5;
  NSArray *cachedKeyAssets;

  v4 = a3;
  -[PLFetchingAlbum fetchedAssets](self, "fetchedAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAssetsSnapshot:", v5);

  -[PLFetchingAlbum setFetchedAssets:](self, "setFetchedAssets:", 0);
  self->_countForDisplay = 0x7FFFFFFFFFFFFFFFLL;
  self->_photosCount = 0x7FFFFFFFFFFFFFFFLL;
  self->_videosCount = 0x7FFFFFFFFFFFFFFFLL;
  self->_emptyState = 0;
  cachedKeyAssets = self->_cachedKeyAssets;
  self->_cachedKeyAssets = 0;

}

- (BOOL)hasAssetsCache
{
  void *v3;
  BOOL v4;

  -[PLFetchingAlbum fetchedAssets](self, "fetchedAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 || self->_countForDisplay != 0x7FFFFFFFFFFFFFFFLL || self->_emptyState || self->_cachedKeyAssets != 0;

  return v4;
}

- (id)fastPointerAccessSetForAssets:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_10;
  -[PLFetchingAlbum fetchRequest](self, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fetchBatchSize");

  if (!v6 || objc_msgSend(v4, "count") <= (unint64_t)(2 * v6))
    goto LABEL_10;
  v7 = objc_msgSend(v4, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    for (i = 0; i != v7; ++i)
    {
      objc_msgSend(v4, "managedObjectIDAtIndex:", i);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v10);

    }
  }
  v11 = (void *)MEMORY[0x1E0C97B48];
  -[PLFetchingAlbum fetchRequest](self, "fetchRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "entityName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchRequestWithEntityName:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPredicate:", v15);

  objc_msgSend(v14, "setIncludesPropertyValues:", 0);
  objc_msgSend(v14, "setIncludesPendingChanges:", 0);
  -[PLFetchingAlbum managedObjectContext](self, "managedObjectContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "executeFetchRequest:error:", v14, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v17, "count"))
  {

LABEL_10:
    v19 = v4;
    goto LABEL_11;
  }
  -[PLFetchingAlbum managedObjectContext](self, "managedObjectContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_orderedSetWithResultsFromFetchRequest:", v17);
  v19 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v19;
}

- (BOOL)mayHaveAssetsInCommon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  char v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLFetchingAlbum fetchedAssets](self, "fetchedAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "count");
    if (v7)
    {
      v8 = v7;
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        for (i = 0; i != v8; ++i)
        {
          objc_msgSend(v6, "managedObjectIDAtIndex:", i);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v11);

        }
      }
      else
      {
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v13 = v6;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v30;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v30 != v16)
                objc_enumerationMutation(v13);
              objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "objectID");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "addObject:", v18);

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
          }
          while (v15);
        }

      }
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v19 = v4;
      v12 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v12)
      {
        v20 = *(_QWORD *)v26;
        while (2)
        {
          for (k = 0; k != v12; ++k)
          {
            if (*(_QWORD *)v26 != v20)
              objc_enumerationMutation(v19);
            objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * k), "objectID", (_QWORD)v25);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v9, "containsObject:", v22);

            if ((v23 & 1) != 0)
            {
              LOBYTE(v12) = 1;
              goto LABEL_27;
            }
          }
          v12 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v12)
            continue;
          break;
        }
      }
LABEL_27:

    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    LOBYTE(v12) = 1;
  }

  return v12;
}

- (void)willSave
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLFetchingAlbum;
  -[PLGenericAlbum willSave](&v8, sel_willSave);
  -[PLFetchingAlbum setNeedsPersistenceUpdate:](self, "setNeedsPersistenceUpdate:", 0);
  -[PLFetchingAlbum managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_12;
  -[PLFetchingAlbum changedValues](self, "changedValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[PLFetchingAlbum isInserted](self, "isInserted") & 1) == 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5
      || (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("trashedState")),
          (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userQueryData"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        goto LABEL_7;
    }
  }
  -[PLFetchingAlbum setNeedsPersistenceUpdate:](self, "setNeedsPersistenceUpdate:", 1);
LABEL_7:
  if (PLPlatformSearchSupported())
  {
    objc_msgSend(v3, "delayedSaveActions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "recordAlbumForSearchIndexUpdate:", self);

  }
  if ((-[PLFetchingAlbum isDeleted](self, "isDeleted") & 1) == 0)
    +[PLDelayedSearchIndexUpdates recordAlbumIfNeeded:](PLDelayedSearchIndexUpdates, "recordAlbumIfNeeded:", self);

LABEL_12:
}

- (void)didSave
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PLFetchingAlbum;
  -[PLGenericAlbum didSave](&v6, sel_didSave);
  if (-[PLFetchingAlbum needsPersistenceUpdate](self, "needsPersistenceUpdate"))
  {
    -[PLFetchingAlbum uuid](self, "uuid");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3 || (-[PLFetchingAlbum isDeleted](self, "isDeleted") & 1) != 0)
      goto LABEL_6;
    v4 = -[PLFetchingAlbum isValidForPersistence](self, "isValidForPersistence");

    if (v4)
    {
      -[PLGenericAlbum photoLibrary](self, "photoLibrary");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pathManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLFetchingAlbum persistMetadataToFileSystemWithPathManager:](self, "persistMetadataToFileSystemWithPathManager:", v5);

LABEL_6:
    }
  }
  -[PLFetchingAlbum setNeedsPersistenceUpdate:](self, "setNeedsPersistenceUpdate:", 0);
}

- (void)persistMetadataToFileSystemWithPathManager:(id)a3
{
  id v5;
  PLPersistedAlbumMetadata *v6;
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLFetchingAlbum.m"), 993, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

    v5 = 0;
  }
  if (objc_msgSend(v5, "isDCIM"))
  {
    v6 = -[PLPersistedAlbumMetadata initWithPLGenericAlbum:pathManager:]([PLPersistedAlbumMetadata alloc], "initWithPLGenericAlbum:pathManager:", self, v8);
    -[PLPersistedAlbumMetadata persistAlbumData](v6, "persistAlbumData");

  }
}

- (void)removePersistedFileSystemDataWithPathManager:(id)a3
{
  id v5;
  PLPersistedAlbumMetadata *v6;
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLFetchingAlbum.m"), 1001, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

    v5 = 0;
  }
  if (objc_msgSend(v5, "isDCIM"))
  {
    v6 = -[PLPersistedAlbumMetadata initWithPLGenericAlbum:pathManager:]([PLPersistedAlbumMetadata alloc], "initWithPLGenericAlbum:pathManager:", self, v8);
    -[PLPersistedAlbumMetadata removePersistedAlbumData](v6, "removePersistedAlbumData");

  }
}

- (BOOL)isValidForPersistence
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend((id)objc_opt_class(), "validKindsForPersistence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLFetchingAlbum kind](self, "kind");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  return v5;
}

- (int64_t)cloudDeletionType
{
  return 2;
}

- (void)prepareForDeletion
{
  void *v3;
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PLFetchingAlbum;
  -[PLManagedObject prepareForDeletion](&v9, sel_prepareForDeletion);
  -[PLFetchingAlbum managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[PLDelayedSearchIndexUpdates recordAlbumIfNeeded:](PLDelayedSearchIndexUpdates, "recordAlbumIfNeeded:", self);
    if ((objc_msgSend(v3, "mergingChanges") & 1) == 0)
    {
      if (-[PLGenericAlbum kindValue](self, "kindValue") == 1507)
      {
        -[PLFetchingAlbum setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", 0, CFSTR("customKeyAsset"));
        objc_msgSend(v3, "recordCloudDeletionForObject:", self);
      }
      -[PLFetchingAlbum uuid](self, "uuid");
      v4 = objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = (void *)v4;
        v6 = -[PLFetchingAlbum isValidForPersistence](self, "isValidForPersistence");

        if (v6)
        {
          -[PLGenericAlbum photoLibrary](self, "photoLibrary");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "pathManager");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLFetchingAlbum removePersistedFileSystemDataWithPathManager:](self, "removePersistedFileSystemDataWithPathManager:", v8);

        }
      }
    }
  }

}

- (NSPredicate)ALAssetsGroupFilterPredicate
{
  return self->_ALAssetsGroupFilterPredicate;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (BOOL)needsPersistenceUpdate
{
  return self->_needsPersistenceUpdate;
}

- (void)setNeedsPersistenceUpdate:(BOOL)a3
{
  self->_needsPersistenceUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ALAssetsGroupFilterPredicate, 0);
  objc_storeStrong((id *)&self->_cachedKeyAssets, 0);
}

+ (id)entityName
{
  return CFSTR("FetchingAlbum");
}

+ (BOOL)contextShouldIgnoreChangesForFetchedAssets
{
  return 1;
}

+ (BOOL)contextShouldIgnoreChangesForFetchRequest
{
  return 1;
}

+ (BOOL)contextShouldIgnoreChangesForALAssetsGroupFilterPredicate
{
  return 1;
}

+ (id)_predicateForAssetSubtype:(signed __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v13;
  _QWORD v14[4];

  v3 = a3;
  v14[3] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLFetchingAlbum.m"), 126, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subtype != PLAssetSubtypeNone"));

  }
  v5 = (void *)MEMORY[0x1E0CB3528];
  +[PLManagedAsset predicateForAssetSubtype:](PLManagedAsset, "predicateForAssetSubtype:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForPLFetchingAlbumExclusions"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  objc_msgSend(a1, "_predicateForVisibleAsset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)predicateForAlbumKind:(int)a3
{
  return (id)objc_msgSend(a1, "predicateForAlbumKind:includeGuest:", *(_QWORD *)&a3, 0);
}

+ (id)validKindsForPersistence
{
  pl_dispatch_once();
  return (id)validKindsForPersistence_pl_once_object_20;
}

+ (NSString)cloudUUIDKeyForDeletion
{
  return (NSString *)CFSTR("cloudGUID");
}

+ (int64_t)cloudDeletionTypeForTombstone:(id)a3
{
  return 2;
}

void __43__PLFetchingAlbum_validKindsForPersistence__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(&unk_1E3763530, "copy");
  v1 = (void *)validKindsForPersistence_pl_once_object_20;
  validKindsForPersistence_pl_once_object_20 = v0;

}

- (id)payloadForChangedKeys:(id)a3
{
  id v4;
  PLFetchingAlbumJournalEntryPayload *v5;

  v4 = a3;
  if (-[PLFetchingAlbum isValidForPersistence](self, "isValidForPersistence"))
    v5 = -[PLManagedObjectJournalEntryPayload initWithManagedObject:changedKeys:]([PLFetchingAlbumJournalEntryPayload alloc], "initWithManagedObject:changedKeys:", self, v4);
  else
    v5 = 0;

  return v5;
}

@end
