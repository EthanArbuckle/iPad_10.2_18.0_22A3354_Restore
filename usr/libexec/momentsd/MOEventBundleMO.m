@implementation MOEventBundleMO

+ (id)managedObjectWithEventBundle:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  MOEventBundleMO *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[MOEventBundleMO initWithContext:]([MOEventBundleMO alloc], "initWithContext:", v5);
  +[MOEventBundleMO updateManagedObject:eventBundle:inManagedObjectContext:](MOEventBundleMO, "updateManagedObject:eventBundle:inManagedObjectContext:", v7, v6, v5);

  return v7;
}

+ (void)updateManagedObject:(id)a3 eventBundle:(id)a4 inManagedObjectContext:(id)a5
{
  id v7;
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
  id v34;
  id v35;
  uint64_t v36;
  void *i;
  void *v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  void *j;
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
  id v56;
  id v57;
  uint64_t v58;
  void *k;
  void *v60;
  void *v61;
  id v62;
  id v63;
  uint64_t v64;
  void *m;
  void *v66;
  void *v67;
  id v68;
  id v69;
  uint64_t v70;
  void *n;
  void *v72;
  void *v73;
  id v74;
  id v75;
  uint64_t v76;
  void *ii;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id obj;
  uint64_t v93;
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
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _BYTE v118[128];
  _BYTE v119[128];
  _BYTE v120[128];
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
  objc_msgSend(v7, "setBundleIdentifier:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "suggestionID"));
  objc_msgSend(v7, "setSuggestionID:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "creationDate"));
  objc_msgSend(v7, "setCreationDate:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstCreationDate"));
  objc_msgSend(v7, "setFirstCreationDate:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endDate"));
  objc_msgSend(v7, "setEndDate:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
  objc_msgSend(v7, "setStartDate:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "expirationDate"));
  objc_msgSend(v7, "setExpirationDate:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "source")));
  objc_msgSend(v7, "setSource:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "interfaceType")));
  objc_msgSend(v7, "setInterfaceType:", v18);

  objc_msgSend(v7, "setFiltered:", objc_msgSend(v8, "filtered"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "promptLanguage"));
  objc_msgSend(v7, "setPromptLanguage:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "photoSource")));
  objc_msgSend(v7, "setPhotoSource:", v20);

  objc_msgSend(v7, "setIsAggregatedAndSuppressed:", objc_msgSend(v8, "isAggregatedAndSuppressed"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "summarizationGranularity")));
  objc_msgSend(v7, "setSummarizationGranularity:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subBundleIDs"));
  objc_msgSend(v7, "setSubBundleIDs:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subSuggestionIDs"));
  objc_msgSend(v7, "setSubSuggestionIDs:", v23);

  objc_msgSend(v7, "setIncludedInSummaryBundleOnly:", objc_msgSend(v8, "includedInSummaryBundleOnly"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "visitEventsRejectedByWatchLocation"));
  objc_msgSend(v7, "setVisitEventsRejectedByWatchLocation:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "bundleSubType")));
  objc_msgSend(v7, "setBundleSubType:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "bundleSuperType")));
  objc_msgSend(v7, "setBundleSuperType:", v26);

  objc_msgSend(v7, "setAction:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "action"));

  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "action"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[MOActionMO managedObjectWithObject:inManagedObjectContext:](MOActionMO, "managedObjectWithObject:inManagedObjectContext:", v28, v9));
    objc_msgSend(v7, "setAction:", v29);

  }
  objc_msgSend(v7, "setConcurrentMediaAction:", 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "concurrentMediaAction"));

  if (v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "concurrentMediaAction"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[MOActionMO managedObjectWithObject:inManagedObjectContext:](MOActionMO, "managedObjectWithObject:inManagedObjectContext:", v31, v9));
    objc_msgSend(v7, "setConcurrentMediaAction:", v32);

  }
  objc_msgSend(v7, "setActions:", 0);
  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "actions"));
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v114, v123, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v115;
    do
    {
      for (i = 0; i != v35; i = (char *)i + 1)
      {
        if (*(_QWORD *)v115 != v36)
          objc_enumerationMutation(v33);
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[MOActionMO managedObjectWithObject:inManagedObjectContext:](MOActionMO, "managedObjectWithObject:inManagedObjectContext:", *(_QWORD *)(*((_QWORD *)&v114 + 1) + 8 * (_QWORD)i), v9));
        objc_msgSend(v7, "addActionsObject:", v38);

      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v114, v123, 16);
    }
    while (v35);
  }

  objc_msgSend(v7, "setPersons:", 0);
  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "persons"));
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v110, v122, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v111;
    do
    {
      for (j = 0; j != v41; j = (char *)j + 1)
      {
        if (*(_QWORD *)v111 != v42)
          objc_enumerationMutation(v39);
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[MOPersonMO managedObjectWithObject:inManagedObjectContext:](MOPersonMO, "managedObjectWithObject:inManagedObjectContext:", *(_QWORD *)(*((_QWORD *)&v110 + 1) + 8 * (_QWORD)j), v9));
        objc_msgSend(v7, "addPersonsObject:", v44);

      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v110, v122, 16);
    }
    while (v41);
  }

  objc_msgSend(v7, "setPlace:", 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "place"));

  if (v45)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "place"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[MOPlaceMO managedObjectWithObject:inManagedObjectContext:](MOPlaceMO, "managedObjectWithObject:inManagedObjectContext:", v46, v9));
    objc_msgSend(v7, "setPlace:", v47);

  }
  objc_msgSend(v7, "setPredominantWeather:", 0);
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "predominantWeather"));

  if (v48)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "predominantWeather"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[MOWeatherMO managedObjectWithObject:inManagedObjectContext:](MOWeatherMO, "managedObjectWithObject:inManagedObjectContext:", v49, v9));
    objc_msgSend(v7, "setPredominantWeather:", v50);

  }
  objc_msgSend(v7, "setTime:", 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "time"));

  if (v51)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "time"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[MOTimeMO managedObjectWithObject:inManagedObjectContext:](MOTimeMO, "managedObjectWithObject:inManagedObjectContext:", v52, v9));
    objc_msgSend(v7, "setTime:", v53);

  }
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "timeAtHomeSubType")));
  objc_msgSend(v7, "setTimeAtHomeSubType:", v54);

  objc_msgSend(v7, "setResources:", 0);
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v91 = v8;
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "resources"));
  v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v106, v121, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v107;
    do
    {
      for (k = 0; k != v57; k = (char *)k + 1)
      {
        if (*(_QWORD *)v107 != v58)
          objc_enumerationMutation(v55);
        v60 = (void *)objc_claimAutoreleasedReturnValue(+[MOResourceMO managedObjectWithObject:inManagedObjectContext:](MOResourceMO, "managedObjectWithObject:inManagedObjectContext:", *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * (_QWORD)k), v9));
        objc_msgSend(v7, "addResourcesObject:", v60);

      }
      v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v106, v121, 16);
    }
    while (v57);
  }

  objc_msgSend(v7, "setPlaces:", 0);
  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "places"));
  v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v102, v120, 16);
  if (v62)
  {
    v63 = v62;
    v64 = *(_QWORD *)v103;
    do
    {
      for (m = 0; m != v63; m = (char *)m + 1)
      {
        if (*(_QWORD *)v103 != v64)
          objc_enumerationMutation(v61);
        v66 = (void *)objc_claimAutoreleasedReturnValue(+[MOPlaceMO managedObjectWithObject:inManagedObjectContext:](MOPlaceMO, "managedObjectWithObject:inManagedObjectContext:", *(_QWORD *)(*((_QWORD *)&v102 + 1) + 8 * (_QWORD)m), v9));
        objc_msgSend(v7, "addPlacesObject:", v66);

      }
      v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v102, v120, 16);
    }
    while (v63);
  }

  objc_msgSend(v7, "setPhotoTraits:", 0);
  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "photoTraits"));
  v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v98, v119, 16);
  if (v68)
  {
    v69 = v68;
    v70 = *(_QWORD *)v99;
    do
    {
      for (n = 0; n != v69; n = (char *)n + 1)
      {
        if (*(_QWORD *)v99 != v70)
          objc_enumerationMutation(v67);
        v72 = (void *)objc_claimAutoreleasedReturnValue(+[MOPhotoTraitMO managedObjectWithObject:inManagedObjectContext:](MOPhotoTraitMO, "managedObjectWithObject:inManagedObjectContext:", *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * (_QWORD)n), v9));
        objc_msgSend(v7, "addPhotoTraitsObject:", v72);

      }
      v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v98, v119, 16);
    }
    while (v69);
  }

  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "metaDataForRank"));
  objc_msgSend(v7, "setMetaDataForRank:", v73);

  objc_msgSend(v7, "setEvents:", 0);
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "events"));
  v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v118, 16);
  if (v74)
  {
    v75 = v74;
    v76 = *(_QWORD *)v95;
    do
    {
      for (ii = 0; ii != v75; ii = (char *)ii + 1)
      {
        if (*(_QWORD *)v95 != v76)
          objc_enumerationMutation(obj);
        v78 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)ii);
        v79 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventMO fetchRequest](MOEventMO, "fetchRequest"));
        objc_msgSend(v79, "setFetchLimit:", 1);
        objc_msgSend(v79, "setReturnsObjectsAsFaults:", 0);
        v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "eventIdentifier"));
        v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("eventIdentifier = %@"), v80));
        objc_msgSend(v79, "setPredicate:", v81);

        v93 = 0;
        v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "execute:", &v93));
        v83 = v93;
        v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "firstObject"));

        if (!v83 && v84)
          objc_msgSend(v7, "addEventsObject:", v84);

      }
      v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v118, 16);
    }
    while (v75);
  }

  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "events"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v85, "count")));
  objc_msgSend(v7, "setEventCount:", v86);

  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "clusterMetadata"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(+[MOClusterMetadataMO managedObjectWithObject:inManagedObjectContext:](MOClusterMetadataMO, "managedObjectWithObject:inManagedObjectContext:", v87, v9));
  objc_msgSend(v7, "setClusterMetadata:", v88);

  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "outlierMetadata"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(+[MOOutlierMetadataMO managedObjectWithObject:inManagedObjectContext:](MOOutlierMetadataMO, "managedObjectWithObject:inManagedObjectContext:", v89, v9));
  objc_msgSend(v7, "setOutlierMetadata:", v90);

}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("MOEventBundleMO"));
}

@end
