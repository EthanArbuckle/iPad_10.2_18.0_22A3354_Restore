@implementation NSDiffableDataSourceSectionSnapshot

- (NSString)_maps_recursiveDescription
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDiffableDataSourceSectionSnapshot description](self, "description"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", v3));

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[NSDiffableDataSourceSectionSnapshot rootItems](self, "rootItems"));
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(obj);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSDiffableDataSourceSectionSnapshot _maps_internal_recursiveDescriptionOfItem:](self, "_maps_internal_recursiveDescriptionOfItem:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v8)));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n |  ")));
        objc_msgSend(v4, "appendFormat:", CFSTR("\n +-- %@"), v10);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return (NSString *)v4;
}

- (id)_maps_recursiveDescriptionOfItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDiffableDataSourceSectionSnapshot snapshotOfParentItem:includingParentItem:](self, "snapshotOfParentItem:includingParentItem:", v4, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_maps_internal_recursiveDescriptionOfItem:", v4));

  return v6;
}

- (id)_maps_internal_recursiveDescriptionOfItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", v5));

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDiffableDataSourceSectionSnapshot snapshotOfParentItem:includingParentItem:](self, "snapshotOfParentItem:includingParentItem:", v4, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rootItems"));

  obj = v8;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(obj);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDiffableDataSourceSectionSnapshot _maps_internal_recursiveDescriptionOfItem:](self, "_maps_internal_recursiveDescriptionOfItem:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v12)));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR("\n |  ")));
        objc_msgSend(v6, "appendFormat:", CFSTR("\n +-- %@"), v14);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  return v6;
}

- (id)_maps_applyChangesWithNewRootSnapshot:(id)a3 oldRootSnapshot:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MapsUIDiffableDataSourceSectionSnapshotUpdateDifference *v14;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  -[NSDiffableDataSourceSectionSnapshot _maps_updateWithNodeSnapshot:previousNodeSnapshot:reloadedItems:insertedItems:deletedItems:movedItems:expandedItems:collapsedItems:](self, "_maps_updateWithNodeSnapshot:previousNodeSnapshot:reloadedItems:insertedItems:deletedItems:movedItems:expandedItems:collapsedItems:", v7, v6, v8, v9, v10, v11, v12, v13);

  v14 = -[MapsUIDiffableDataSourceSectionSnapshotUpdateDifference initWithReloadedItems:insertedItems:deletedItems:movedItems:expandedItems:collapsedItems:]([MapsUIDiffableDataSourceSectionSnapshotUpdateDifference alloc], "initWithReloadedItems:insertedItems:deletedItems:movedItems:expandedItems:collapsedItems:", v8, v9, v10, v11, v12, v13);
  return v14;
}

- (void)_maps_updateWithNodeSnapshot:(id)a3 previousNodeSnapshot:(id)a4 reloadedItems:(id)a5 insertedItems:(id)a6 deletedItems:(id)a7 movedItems:(id)a8 expandedItems:(id)a9 collapsedItems:(id)a10
{
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  _UNKNOWN **v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  unsigned int v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  void *i;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  unsigned __int8 v68;
  void *v69;
  void *v70;
  void *v71;
  unsigned int v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  void *v81;
  id v82;
  id v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _QWORD v93[5];
  void *v94;
  _BYTE v95[128];
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  _BYTE v101[128];

  v16 = a3;
  v17 = a4;
  v80 = a5;
  v84 = a6;
  v82 = a7;
  v83 = a8;
  v79 = a9;
  v78 = a10;
  v81 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "childSnapshots"));
  v93[0] = _NSConcreteStackBlock;
  v93[1] = 3221225472;
  v93[2] = sub_1004701FC;
  v93[3] = &unk_1011B7938;
  v93[4] = self;
  v19 = sub_10039DCD4(v18, v93);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "childSnapshots"));
  v22 = sub_10039DCD4(v21, &stru_1011B7978);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

  v24 = sub_10039DCD4(v20, &stru_1011B7998);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  v73 = (void *)v25;
  v74 = v23;
  v77 = v16;
  v75 = v20;
  if (v23 != (void *)v25)
  {
    v26 = v25;
    if ((objc_msgSend(v23, "isEqual:", v25) & 1) == 0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "differenceFromArray:withOptions:", v26, 4));
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v20));
      v89 = 0u;
      v90 = 0u;
      v91 = 0u;
      v92 = 0u;
      v29 = v27;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
      if (!v30)
        goto LABEL_28;
      v31 = v30;
      v32 = *(_QWORD *)v90;
      v33 = MKPlaceCollectionsLogicController_ptr;
      while (1)
      {
        v34 = 0;
        v76 = v31;
        do
        {
          if (*(_QWORD *)v90 != v32)
            objc_enumerationMutation(v29);
          v35 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)v34);
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "object"));
          v37 = objc_msgSend(v35, "changeType");
          if (v37 == (id)1)
          {
            v97 = v36;
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33[304], "arrayWithObjects:count:", &v97, 1));
            -[NSDiffableDataSourceSectionSnapshot deleteItems:](self, "deleteItems:", v43);

            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndexedSubscript:", objc_msgSend(v35, "index")));
            objc_msgSend(v28, "removeObjectAtIndex:", objc_msgSend(v35, "index"));
            if (objc_msgSend(v35, "associatedIndex") == (id)0x7FFFFFFFFFFFFFFFLL)
              objc_msgSend(v82, "addObject:", v44);
            goto LABEL_23;
          }
          if (v37)
            goto LABEL_24;
          v38 = objc_msgSend(v35, "index");
          if (v38 >= objc_msgSend(v28, "count"))
          {
            v41 = v28;
            v100 = v36;
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33[304], "arrayWithObjects:count:", &v100, 1));
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "identifierPath"));
            if (!objc_msgSend(v40, "length"))
            {
              -[NSDiffableDataSourceSectionSnapshot appendItems:intoParentItem:](self, "appendItems:intoParentItem:", v39, 0);
              goto LABEL_19;
            }
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "identifierPath"));
            -[NSDiffableDataSourceSectionSnapshot appendItems:intoParentItem:](self, "appendItems:intoParentItem:", v39, v42);
          }
          else if (objc_msgSend(v35, "index"))
          {
            v98 = v36;
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33[304], "arrayWithObjects:count:", &v98, 1));
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndexedSubscript:", (char *)objc_msgSend(v35, "index") - 1));
            v41 = v28;
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "identifierPath"));
            -[NSDiffableDataSourceSectionSnapshot insertItems:afterItem:](self, "insertItems:afterItem:", v39, v42);
          }
          else
          {
            v99 = v36;
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33[304], "arrayWithObjects:count:", &v99, 1));
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndexedSubscript:", 0));
            v41 = v28;
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "identifierPath"));
            -[NSDiffableDataSourceSectionSnapshot insertItems:beforeItem:](self, "insertItems:beforeItem:", v39, v42);
          }

LABEL_19:
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "identifiers"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "lastObject"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "childSnapshotWithIdentifier:", v46));

          objc_msgSend(v41, "insertObject:atIndex:", v44, objc_msgSend(v35, "index"));
          if (objc_msgSend(v35, "associatedIndex") == (id)0x7FFFFFFFFFFFFFFFLL)
            v47 = v84;
          else
            v47 = v83;
          objc_msgSend(v47, "addObject:", v44);
          v28 = v41;
          v33 = MKPlaceCollectionsLogicController_ptr;
          v31 = v76;
LABEL_23:

LABEL_24:
          v34 = (char *)v34 + 1;
        }
        while (v31 != v34);
        v48 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v89, v101, 16);
        v31 = v48;
        if (!v48)
        {
LABEL_28:

          v16 = v77;
          break;
        }
      }
    }
  }
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifierPath"));
  v50 = objc_msgSend(v49, "length");

  if (v50)
  {
    if ((objc_msgSend(v16, "expanded") & 1) == 0)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifierPath"));
      v52 = -[NSDiffableDataSourceSectionSnapshot isExpanded:](self, "isExpanded:", v51);

      if (v52)
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifierPath"));
        v96 = v53;
        v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v96, 1));
        -[NSDiffableDataSourceSectionSnapshot collapseItems:](self, "collapseItems:", v54);

        objc_msgSend(v78, "addObject:", v16);
      }
    }
  }
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "childSnapshots"));
  v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v86;
    do
    {
      for (i = 0; i != v57; i = (char *)i + 1)
      {
        if (*(_QWORD *)v86 != v58)
          objc_enumerationMutation(v55);
        v60 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)i);
        v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "identifierPath"));
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "identifiers"));
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "lastObject"));
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "childSnapshotWithIdentifier:", v63));

        -[NSDiffableDataSourceSectionSnapshot _maps_updateWithNodeSnapshot:previousNodeSnapshot:reloadedItems:insertedItems:deletedItems:movedItems:expandedItems:collapsedItems:](self, "_maps_updateWithNodeSnapshot:previousNodeSnapshot:reloadedItems:insertedItems:deletedItems:movedItems:expandedItems:collapsedItems:", v60, v64, v80, v84, v82, v83, v79, v78, v73, v74);
      }
      v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v85, v95, 16);
    }
    while (v57);
  }

  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "identifierPath"));
  v66 = objc_msgSend(v65, "length");

  if (v66)
  {
    if (objc_msgSend(v77, "expanded"))
    {
      v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "identifierPath"));
      v68 = -[NSDiffableDataSourceSectionSnapshot isExpanded:](self, "isExpanded:", v67);

      if ((v68 & 1) == 0)
      {
        v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "identifierPath"));
        v94 = v69;
        v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v94, 1));
        -[NSDiffableDataSourceSectionSnapshot expandItems:](self, "expandItems:", v70);

        objc_msgSend(v79, "addObject:", v77);
      }
    }
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "identifierPath"));
    v72 = -[NSDiffableDataSourceSectionSnapshot isVisible:](self, "isVisible:", v71);

    if (v81 && v72 && objc_msgSend(v77, "needsReloadFromPreviousItemSnapshot:", v81))
      objc_msgSend(v80, "addObject:", v77);
  }

}

@end
