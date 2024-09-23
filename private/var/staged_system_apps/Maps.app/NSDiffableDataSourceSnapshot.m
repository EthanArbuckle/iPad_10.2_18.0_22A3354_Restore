@implementation NSDiffableDataSourceSnapshot

+ (id)_maps_singleSectionSnapshotWithIdentifiersForItems:(id)a3
{
  return objc_msgSend(a1, "_maps_singleSectionSnapshotWithIdentifiersForItems:reloadingChangesFromPreviousItems:", a3, 0);
}

+ (id)_maps_singleSectionSnapshotWithIdentifiersForItems:(id)a3 reloadingChangesFromPreviousItems:(id)a4
{
  id v6;
  id v7;
  id v8;
  _MapsUIDiffableDataSourceDefaultSection *v9;
  id v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init((Class)a1);
  v9 = objc_opt_new(_MapsUIDiffableDataSourceDefaultSection);
  v10 = objc_msgSend(v8, "_maps_appendIdentifiersForSection:items:reloadingChangesFromPreviousItems:", v9, v6, v7);

  return v8;
}

- (id)_maps_appendIdentifiersForSection:(id)a3 items:(id)a4
{
  return -[NSDiffableDataSourceSnapshot _maps_appendIdentifiersForSection:items:reloadingChangesFromPreviousItems:](self, "_maps_appendIdentifiersForSection:items:reloadingChangesFromPreviousItems:", a3, a4, 0);
}

- (id)_maps_appendIdentifiersForSection:(id)a3 items:(id)a4 reloadingChangesFromPreviousItems:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  void *v27;
  id v28;
  NSObject *v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  void *j;
  void *v37;
  id v38;
  void *v39;
  id v40;
  NSObject *v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  void *k;
  uint64_t v48;
  id v49;
  id v50;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  uint64_t v60;
  void *m;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  uint64_t v67;
  void *n;
  void *v69;
  MapsUIDiffableDataSourceSnapshotDifference *v70;
  MapsUIDiffableDataSourceSnapshotDifference *v71;
  void *v72;
  void *v74;
  void *v75;
  id v76;
  id v77;
  NSDiffableDataSourceSnapshot *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
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
  uint8_t v109[128];
  uint8_t buf[4];
  uint64_t v111;
  __int16 v112;
  void *v113;
  _BYTE v114[128];
  void *v115;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v9, "count"))
  {
    v71 = [MapsUIDiffableDataSourceSnapshotDifference alloc];
    if (v10)
      v72 = v10;
    else
      v72 = &__NSArray0__struct;
    v70 = -[MapsUIDiffableDataSourceSnapshotDifference initWithReloadedItems:insertedItems:deletedItems:](v71, "initWithReloadedItems:insertedItems:deletedItems:", &__NSArray0__struct, &__NSArray0__struct, v72);
    goto LABEL_71;
  }
  v80 = v10;
  v77 = v8;
  v11 = sub_10046DCCC(v8);
  v83 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v115 = v83;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v115, 1));
  -[NSDiffableDataSourceSnapshot appendSectionsWithIdentifiers:](self, "appendSectionsWithIdentifiers:", v12);

  v78 = self;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDiffableDataSourceSnapshot itemIdentifiers](self, "itemIdentifiers"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v13));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableOrderedSet orderedSet](NSMutableOrderedSet, "orderedSet"));
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v76 = v9;
  v15 = v9;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v102, v114, 16);
  if (!v16)
    goto LABEL_22;
  v17 = v16;
  v18 = *(_QWORD *)v103;
  do
  {
    for (i = 0; i != v17; i = (char *)i + 1)
    {
      if (*(_QWORD *)v103 != v18)
        objc_enumerationMutation(v15);
      v20 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * (_QWORD)i);
      v21 = sub_10046DCCC(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      if (v22)
      {
        if (objc_msgSend(v14, "containsObject:", v22))
        {
          v23 = sub_100432EDC();
          v24 = objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v111 = (uint64_t)v83;
            v112 = 2112;
            v113 = v22;
            v25 = v24;
            v26 = "Diffable identifier is not unique within section '%@': %@";
LABEL_17:
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, v26, buf, 0x16u);
            goto LABEL_18;
          }
          goto LABEL_18;
        }
        if (objc_msgSend(v84, "containsObject:", v22))
        {
          v30 = sub_100432EDC();
          v24 = objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v111 = (uint64_t)v83;
            v112 = 2112;
            v113 = v22;
            v25 = v24;
            v26 = "Diffable identifier is not unique outside of section '%@': %@";
            goto LABEL_17;
          }
LABEL_18:

          goto LABEL_20;
        }
        objc_msgSend(v14, "addObject:", v22);
      }
      else
      {
        v27 = v14;
        v28 = sub_100432EDC();
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v111 = (uint64_t)v20;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Diffable identifier missing for object: %@", buf, 0xCu);
        }

        v14 = v27;
      }
LABEL_20:

    }
    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v102, v114, 16);
  }
  while (v17);
LABEL_22:

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "array"));
  -[NSDiffableDataSourceSnapshot appendItemsWithIdentifiers:intoSectionWithIdentifier:](v78, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v31, v83);
  v10 = v80;
  if (v80)
  {
    v74 = v14;
    v75 = v31;
    v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v98 = 0u;
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v32 = v80;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v98, v109, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v99;
      do
      {
        for (j = 0; j != v34; j = (char *)j + 1)
        {
          if (*(_QWORD *)v99 != v35)
            objc_enumerationMutation(v32);
          v37 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * (_QWORD)j);
          v38 = sub_10046DCCC(v37);
          v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
          if (v39)
          {
            objc_msgSend(v85, "addObject:", v39);
          }
          else
          {
            v40 = sub_100432EDC();
            v41 = objc_claimAutoreleasedReturnValue(v40);
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              v42 = objc_opt_class(v37);
              *(_DWORD *)buf = 138412290;
              v111 = v42;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "Diffable identifier from a previous item is nil. item class: %@", buf, 0xCu);
            }

          }
        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v98, v109, 16);
      }
      while (v34);
    }

    v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v43 = v75;
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v94, v108, 16);
    if (v44)
    {
      v45 = v44;
      v46 = *(_QWORD *)v95;
      do
      {
        for (k = 0; k != v45; k = (char *)k + 1)
        {
          if (*(_QWORD *)v95 != v46)
            objc_enumerationMutation(v43);
          v48 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)k);
          v49 = objc_msgSend(v85, "indexOfObject:", v48);
          v50 = objc_msgSend(v43, "indexOfObject:", v48);
          if (v49 != (id)0x7FFFFFFFFFFFFFFFLL && v50 != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            v52 = v50;
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectAtIndexedSubscript:", v49));
            v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", v52));
            if (v53 != v54 && (objc_msgSend(v53, "isEqual:", v54) & 1) == 0)
            {
              objc_msgSend(v81, "addObject:", v54);
              objc_msgSend(v82, "addObject:", v48);
            }

          }
        }
        v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v94, v108, 16);
      }
      while (v45);
    }

    -[NSDiffableDataSourceSnapshot reconfigureItemsWithIdentifiers:](v78, "reconfigureItemsWithIdentifiers:", v82);
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "differenceFromArray:", v85));
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "insertions"));
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v90, v107, 16);
    v14 = v74;
    if (v58)
    {
      v59 = v58;
      v60 = *(_QWORD *)v91;
      do
      {
        for (m = 0; m != v59; m = (char *)m + 1)
        {
          if (*(_QWORD *)v91 != v60)
            objc_enumerationMutation(v57);
          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * (_QWORD)m), "index")));
          objc_msgSend(v56, "addObject:", v62);

        }
        v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v90, v107, 16);
      }
      while (v59);
    }

    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v79 = v55;
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "removals"));
    v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v86, v106, 16);
    v31 = v75;
    if (v65)
    {
      v66 = v65;
      v67 = *(_QWORD *)v87;
      do
      {
        for (n = 0; n != v66; n = (char *)n + 1)
        {
          if (*(_QWORD *)v87 != v67)
            objc_enumerationMutation(v64);
          v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(*((_QWORD *)&v86 + 1) + 8 * (_QWORD)n), "index")));
          objc_msgSend(v63, "addObject:", v69);

        }
        v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v86, v106, 16);
      }
      while (v66);
    }

    v70 = -[MapsUIDiffableDataSourceSnapshotDifference initWithReloadedItems:insertedItems:deletedItems:]([MapsUIDiffableDataSourceSnapshotDifference alloc], "initWithReloadedItems:insertedItems:deletedItems:", v81, v56, v63);
    v10 = v80;
  }
  else
  {
    v70 = -[MapsUIDiffableDataSourceSnapshotDifference initWithReloadedItems:insertedItems:deletedItems:]([MapsUIDiffableDataSourceSnapshotDifference alloc], "initWithReloadedItems:insertedItems:deletedItems:", &__NSArray0__struct, v15, &__NSArray0__struct);
  }

  v9 = v76;
  v8 = v77;
LABEL_71:

  return v70;
}

@end
