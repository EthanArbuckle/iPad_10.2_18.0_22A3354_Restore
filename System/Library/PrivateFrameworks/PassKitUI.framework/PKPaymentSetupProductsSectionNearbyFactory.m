@implementation PKPaymentSetupProductsSectionNearbyFactory

+ (id)generateSectionWithDefaultSortingForItems:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  PKPaymentSetupProductsSectionListSection *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "location");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8 && (v9 = (void *)v8, v10 = objc_msgSend(a1, "_itemsContainRegionData:", v6), v9, v10))
  {
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v19 = 138412290;
      v20 = (uint64_t)v7;
      _os_log_debug_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEBUG, "Nearby: Calculating nearby products for %@", (uint8_t *)&v19, 0xCu);
    }

    PKLocalizedString(CFSTR("NEARBY"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PKPaymentSetupProductsSectionListSection initWithIdentifier:]([PKPaymentSetupProductsSectionListSection alloc], "initWithIdentifier:", v12);
    objc_msgSend(a1, "_regionalListItemsUsingContext:listItems:", v7, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v17 = objc_msgSend(v14, "count");
      v19 = 134217984;
      v20 = v17;
      _os_log_debug_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEBUG, "Nearby: Found %lu products in user's current region", (uint8_t *)&v19, 0xCu);
    }

    objc_msgSend(a1, "_sortedItemsBasedUponProximityUsingContext:listItems:", v7, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v18 = objc_msgSend(v15, "count");
      v19 = 134217984;
      v20 = v18;
      _os_log_debug_impl(&dword_19D178000, v11, OS_LOG_TYPE_DEBUG, "Nearby: Found %lu nearby products", (uint8_t *)&v19, 0xCu);
    }

    -[PKPaymentSetupProductsSectionListSection setSectionListItems:](v13, "setSectionListItems:", v15);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)_sortedItemsBasedUponProximityUsingContext:(id)a3 listItems:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  double v57;
  double v58;
  char v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[4];
  void *v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a4, "pk_objectsPassingTest:", &__block_literal_global_235);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pk_objectsPassingTest:", &__block_literal_global_10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(a1, "_sortContainedProducts:", v9);
  if ((unint64_t)objc_msgSend(v9, "count") >= 3)
  {
    objc_msgSend(a1, "_createNearbySectionFromCandidates:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_32;
  }
  v47 = v8;
  v49 = v6;
  objc_msgSend(v6, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "coordinate");
  v13 = v12;
  v15 = v14;

  v48 = v7;
  objc_msgSend(v7, "pk_arrayByRemovingObjectsInArray:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v18 = v16;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v65 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        objc_msgSend(v23, "identifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_polygonFromListItem:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "safelySetObject:forKey:", v25, v24);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v64, v71, 16);
    }
    while (v20);
  }
  v46 = v9;

  v53 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v27 = v18;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v61;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v61 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
        objc_msgSend(v32, "identifier", v46);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v59 = 0;
        if (!v34)
        {
LABEL_24:
          v36 = v26;
LABEL_25:
          objc_msgSend(v36, "addObject:", v32);
          goto LABEL_26;
        }
        if (objc_msgSend(v34, "containsPoint:inExclusionaryRegion:", &v59, v15, v13))
        {
          PKLogFacilityTypeGetObject();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v32, "product");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "productIdentifier");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v69 = v50;
            _os_log_debug_impl(&dword_19D178000, v35, OS_LOG_TYPE_DEBUG, "Nearby: Product inside inside region - %@", buf, 0xCu);

          }
          v36 = v53;
          goto LABEL_25;
        }
        if (!v59)
          goto LABEL_24;
        PKLogFacilityTypeGetObject();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v32, "product");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "productIdentifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v69 = v38;
          _os_log_debug_impl(&dword_19D178000, v37, OS_LOG_TYPE_DEBUG, "Nearby: Product inside exclusionary region - %@", buf, 0xCu);

        }
LABEL_26:

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
    }
    while (v29);
  }

  v39 = (void *)objc_msgSend(v53, "mutableCopy");
  objc_msgSend(a1, "_sortContainedProducts:", v39);
  v9 = v46;
  objc_msgSend(v46, "addObjectsFromArray:", v39);
  if ((unint64_t)objc_msgSend(v46, "count") < 3)
  {
    v41 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __99__PKPaymentSetupProductsSectionNearbyFactory__sortedItemsBasedUponProximityUsingContext_listItems___block_invoke_13;
    v54[3] = &unk_1E3E7A6D8;
    v57 = v15;
    v58 = v13;
    v55 = v17;
    v56 = v41;
    v42 = v41;
    v40 = v26;
    objc_msgSend(v26, "pk_objectsPassingTest:", v54);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)objc_msgSend(v43, "mutableCopy");
    objc_msgSend(a1, "_sortExternalProducts:withMapping:", v44, v42);
    objc_msgSend(v46, "addObjectsFromArray:", v44);
    objc_msgSend(a1, "_createNearbySectionFromCandidates:", v46);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "_createNearbySectionFromCandidates:", v46);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v26;
  }

  v7 = v48;
  v6 = v49;
  v8 = v47;
LABEL_32:

  return v10;
}

BOOL __99__PKPaymentSetupProductsSectionNearbyFactory__sortedItemsBasedUponProximityUsingContext_listItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "product");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "regionData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

uint64_t __99__PKPaymentSetupProductsSectionNearbyFactory__sortedItemsBasedUponProximityUsingContext_listItems___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "product");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "regionData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "isPersistent");
  return v4;
}

BOOL __99__PKPaymentSetupProductsSectionNearbyFactory__sortedItemsBasedUponProximityUsingContext_listItems___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  _BOOL4 v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "closestDistanceToPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
    v8 = v7;
    objc_msgSend(v3, "product");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "regionData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "maximumMatchingDistance");
    v12 = v11;

    PKLogFacilityTypeGetObject();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
    v15 = v8 < v12;
    if (v8 >= v12)
    {
      if (!v14)
        goto LABEL_9;
      objc_msgSend(v3, "product");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "productIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412802;
      v23 = v17;
      v24 = 2048;
      v25 = v8;
      v26 = 2048;
      v27 = v12;
      _os_log_debug_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEBUG, "Nearby: Product %@ discarded because it is %.1fkm away with a max distance of %.1fkm", (uint8_t *)&v22, 0x20u);

    }
    else
    {
      if (v14)
      {
        objc_msgSend(v3, "product");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "productIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412546;
        v23 = v20;
        v24 = 2048;
        v25 = v8;
        _os_log_debug_impl(&dword_19D178000, v13, OS_LOG_TYPE_DEBUG, "Nearby: Product %@ is %.1fkm away", (uint8_t *)&v22, 0x16u);

      }
      v16 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "safelySetObject:forKey:", v13, v17);
    }

LABEL_9:
    goto LABEL_10;
  }
  v15 = 0;
LABEL_10:

  return v15;
}

+ (void)_sortContainedProducts:(id)a3
{
  objc_msgSend(a3, "sortUsingComparator:", &__block_literal_global_16);
}

uint64_t __69__PKPaymentSetupProductsSectionNearbyFactory__sortContainedProducts___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "product");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "regionData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "priority");

  objc_msgSend(v5, "product");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "regionData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "priority");

  v10 = PKComparePaymentSetupProductRegionPriority();
  if (!v10)
  {
    objc_msgSend(v4, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "localizedCaseInsensitiveCompare:", v12);

  }
  return v10;
}

+ (void)_sortExternalProducts:(id)a3 withMapping:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__PKPaymentSetupProductsSectionNearbyFactory__sortExternalProducts_withMapping___block_invoke;
  v7[3] = &unk_1E3E64520;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a3, "sortUsingComparator:", v7);

}

uint64_t __80__PKPaymentSetupProductsSectionNearbyFactory__sortExternalProducts_withMapping___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  v12 = *(void **)(a1 + 32);
  objc_msgSend(v6, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  objc_msgSend(v5, "product");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "regionData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "priority");

  objc_msgSend(v6, "product");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "regionData");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "priority");

  if (v11 >= v16)
  {
    if (v16 >= v11)
    {
      v21 = PKComparePaymentSetupProductRegionPriority();
      if (!v21)
      {
        objc_msgSend(v5, "title");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "title");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v22, "localizedCaseInsensitiveCompare:", v23);

      }
    }
    else
    {
      v21 = 1;
    }
  }
  else
  {
    v21 = -1;
  }

  return v21;
}

+ (BOOL)_itemsContainRegionData:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "product", (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "regionData");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (id)_polygonFromListItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PKPaymentSetupProductRegionDataComplexPolygon *v10;

  objc_msgSend(a3, "product");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "regionData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "isPersistent") & 1) != 0
    || (objc_msgSend(v4, "inclusionaryZones"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, !v5))
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(v4, "inclusionaryZones");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pk_arrayByApplyingBlock:", &__block_literal_global_18_0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "exclusionaryZones");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "exclusionaryZones");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pk_arrayByApplyingBlock:", &__block_literal_global_22);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v10 = -[PKPaymentSetupProductRegionDataComplexPolygon initWithInclusionaryZones:exclusionaryZones:]([PKPaymentSetupProductRegionDataComplexPolygon alloc], "initWithInclusionaryZones:exclusionaryZones:", v7, v8);

  }
  return v10;
}

uint64_t __67__PKPaymentSetupProductsSectionNearbyFactory__polygonFromListItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pk_arrayByApplyingBlock:", &__block_literal_global_20_0);
}

uint64_t __67__PKPaymentSetupProductsSectionNearbyFactory__polygonFromListItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;

  v2 = a2;
  objc_msgSend(v2, "longitude");
  v4 = v3;
  objc_msgSend(v2, "latitude");
  v6 = v5;

  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v4, v6);
}

uint64_t __67__PKPaymentSetupProductsSectionNearbyFactory__polygonFromListItem___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pk_arrayByApplyingBlock:", &__block_literal_global_23_1);
}

uint64_t __67__PKPaymentSetupProductsSectionNearbyFactory__polygonFromListItem___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;

  v2 = a2;
  objc_msgSend(v2, "longitude");
  v4 = v3;
  objc_msgSend(v2, "latitude");
  v6 = v5;

  return objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v4, v6);
}

+ (id)_createNearbySectionFromCandidates:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") <= 3)
    v4 = objc_msgSend(v3, "count");
  else
    v4 = 3;
  objc_msgSend(v3, "subarrayWithRange:", 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  return v6;
}

+ (id)_regionalListItemsUsingContext:(id)a3 listItems:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "primaryRegion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "secondaryRegion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __87__PKPaymentSetupProductsSectionNearbyFactory__regionalListItemsUsingContext_listItems___block_invoke;
  v13[3] = &unk_1E3E7A7E0;
  v14 = v7;
  v15 = v8;
  v9 = v8;
  v10 = v7;
  objc_msgSend(v5, "pk_objectsPassingTest:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __87__PKPaymentSetupProductsSectionNearbyFactory__regionalListItemsUsingContext_listItems___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  char v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(a2, "product", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "regions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v10 = *(void **)(a1 + 32);
        if (v10)
        {
          v11 = v9;
          v12 = v10;
          if (v11 == v12)
            goto LABEL_21;
          v13 = v12;
          if (v11)
          {
            v14 = objc_msgSend(v11, "isEqualToString:", v12);

            if ((v14 & 1) != 0)
              goto LABEL_22;
          }
          else
          {

          }
        }
        v15 = *(void **)(a1 + 40);
        if (v15)
        {
          v16 = v9;
          v17 = v15;
          if (v16 == v17)
          {
LABEL_21:

LABEL_22:
            v20 = 1;
            goto LABEL_24;
          }
          v18 = v17;
          if (v16)
          {
            v19 = objc_msgSend(v16, "isEqualToString:", v17);

            if ((v19 & 1) != 0)
              goto LABEL_22;
          }
          else
          {

          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v20 = 0;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v20 = 0;
  }
LABEL_24:

  return v20;
}

@end
