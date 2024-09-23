@implementation MOPhotoManager

- (MOPhotoManager)initWithUniverse:(id)a3
{
  id v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id os_log;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  MOPhotoManager *v35;
  dispatch_queue_attr_t v36;
  NSObject *v37;
  dispatch_queue_t v38;
  OS_dispatch_queue *queue;
  uint64_t v40;
  GDVisualIdentifierView *visualIdentifierView;
  uint64_t v42;
  GDEntityTaggingService *entityTaggingSerice;
  MOPhotoManager *v44;
  id v45;
  NSObject *v46;
  id v47;
  NSObject *v48;
  id v50;
  NSObject *v51;
  id v52;
  void *v53;
  objc_super v54;
  id v55;
  id v56;
  id v57;
  uint8_t buf[4];
  void *v59;

  v5 = a3;
  v7 = (objc_class *)objc_opt_class(MOConfigurationManager, v6);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v9));

  if (v10)
  {
    +[PHPhotoLibrary enableMultiLibraryMode](PHPhotoLibrary, "enableMultiLibraryMode");
    v57 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary openPhotoLibraryWithWellKnownIdentifier:error:](PHPhotoLibrary, "openPhotoLibraryWithWellKnownIdentifier:error:", 1, &v57));
    v12 = v57;
    if (v12)
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      v14 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[MOPhotoManager initWithUniverse:].cold.6();

    }
    v56 = v12;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[PHPhotoLibrary openPhotoLibraryWithWellKnownIdentifier:error:](PHPhotoLibrary, "openPhotoLibraryWithWellKnownIdentifier:error:", 3, &v56));
    v16 = v56;

    if (v16)
    {
      v18 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[MOPhotoManager initWithUniverse:].cold.5();

    }
    v20 = (objc_class *)objc_opt_class(MOEventStore, v17);
    v21 = NSStringFromClass(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v22));

    if (v23)
    {
      if (!v11 || !v15)
      {
        v50 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        v51 = objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          -[MOPhotoManager initWithUniverse:].cold.4();

        exit(1);
      }
      v55 = v16;
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "suggestedMePersonIdentifierWithError:", &v55));
      v25 = v55;

      if (v25)
      {
        v26 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          -[MOPhotoManager initWithUniverse:].cold.3();

      }
      v52 = v25;
      v28 = v15;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "librarySpecificFetchOptions", v52));
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[PHPerson fetchMePersonWithOptions:](PHPerson, "fetchMePersonWithOptions:", v29));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "firstObject"));

      v32 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v59 = v31;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Me person from Photos: %@", buf, 0xCu);
      }

      v34 = (void *)objc_claimAutoreleasedReturnValue(+[PXPeopleUtilities fetchMeContact](PXPeopleUtilities, "fetchMeContact"));
      v54.receiver = self;
      v54.super_class = (Class)MOPhotoManager;
      v35 = -[MOPhotoManager init](&v54, "init");
      v15 = v28;
      if (v35)
      {
        v36 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v37 = objc_claimAutoreleasedReturnValue(v36);
        v38 = dispatch_queue_create("MOPhotoManager", v37);
        queue = v35->_queue;
        v35->_queue = (OS_dispatch_queue *)v38;

        v15 = v28;
        objc_storeStrong((id *)&v35->_photoLibrary, v11);
        objc_storeStrong((id *)&v35->_syndicationPhotoLibrary, v28);
        objc_storeStrong((id *)&v35->_eventStore, v23);
        objc_storeStrong((id *)&v35->_configurationManager, v10);
        objc_storeStrong((id *)&v35->_suggestedMePersonIdentifier, v24);
        objc_storeStrong((id *)&v35->_meContact, v34);
        objc_storeStrong((id *)&v35->_mePerson, v31);
        v40 = objc_claimAutoreleasedReturnValue(-[MOPhotoManager initializeVisualIdentifierView](v35, "initializeVisualIdentifierView"));
        visualIdentifierView = v35->_visualIdentifierView;
        v35->_visualIdentifierView = (GDVisualIdentifierView *)v40;

        v42 = objc_claimAutoreleasedReturnValue(-[MOPhotoManager intializeEntityTaggingService](v35, "intializeEntityTaggingService"));
        entityTaggingSerice = v35->_entityTaggingSerice;
        v35->_entityTaggingSerice = (GDEntityTaggingService *)v42;

      }
      self = v35;

      v16 = v53;
      v44 = self;
    }
    else
    {
      v47 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        -[MORoutineServiceManager initWithUniverse:].cold.2();

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOPhotoManager.m"), 123, CFSTR("Invalid parameter not satisfying: eventStore"));
      v44 = 0;
    }

  }
  else
  {
    v45 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v46 = objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      -[MOPeopleDiscoveryManager initWithUniverse:].cold.1();

    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOPhotoManager.m"), 102, CFSTR("Invalid parameter not satisfying: configurationManager"));
    v44 = 0;
  }

  return v44;
}

- (id)_sceneLabelsForSceneClassifications:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  uint64_t v13;
  BOOL v14;
  double v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = a3;
  v4 = objc_alloc_init((Class)NSMutableSet);
  v5 = objc_alloc_init((Class)PFSceneTaxonomy);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v12 = objc_msgSend(v5, "nodeRefForSceneClassId:", objc_msgSend(v11, "sceneIdentifier", (_QWORD)v19));
        v13 = PFSceneTaxonomyNodeNetworkId();
        if (v12)
          v14 = v13 == 1;
        else
          v14 = 0;
        if (v14)
        {
          objc_msgSend(v11, "confidence");
          if (v15 >= PFSceneTaxonomyNodeSearchThreshold(v12))
          {
            v16 = PFSceneTaxonomyNodeName(v12);
            v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
            if (v17)
              objc_msgSend(v4, "addObject:", v17);

          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  return v4;
}

- (id)initializeVisualIdentifierView
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  BOOL v6;
  id os_log;
  NSObject *v8;
  id v9;
  id v11;
  uint8_t buf[4];
  void *v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GDViewService defaultService](GDViewService, "defaultService"));
  v11 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "visualIdentifierViewWithError:", &v11));
  v4 = v11;
  v5 = v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 0;
  if (v6)
  {
    v9 = v3;
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#megadome failed to get visualIdentifierView with error: %@", buf, 0xCu);
    }

    v9 = 0;
  }

  return v9;
}

- (id)intializeEntityTaggingService
{
  void *v2;
  id v3;
  void *v4;
  BOOL v5;
  id os_log;
  NSObject *v7;
  id v8;
  id v10;

  v10 = 0;
  v2 = (void *)objc_opt_new(GDConfiguration);
  v3 = objc_msgSend(objc_alloc((Class)GDEntityTaggingService), "initWithConfig:error:", v2, &v10);
  v4 = v3;
  if (v10)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (v5)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v7 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MOPhotoManager intializeEntityTaggingService].cold.1(&v10, v7);

    v8 = 0;
  }
  else
  {
    v8 = v3;
  }

  return v8;
}

- (void)fetchPhotosBetweenStartDate:(id)a3 EndDate:(id)a4 SuggestionID:(id)a5 BundleInterfaceType:(unint64_t)a6 Locations:(id)a7 IsLocationCheckMandatory:(BOOL)a8 handler:(id)a9
{
  _BOOL4 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id os_log;
  NSObject *v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD block[5];
  id v28;
  id v29;
  id v30;
  id v31;
  unint64_t v32;
  BOOL v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  unint64_t v41;
  __int16 v42;
  _BOOL4 v43;

  v9 = a8;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a9;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v21 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413314;
    v35 = v15;
    v36 = 2112;
    v37 = v16;
    v38 = 2112;
    v39 = v17;
    v40 = 2048;
    v41 = a6;
    v42 = 1024;
    v43 = v9;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "fetchPhotosBetweenStartDate, startDate, %@, endDate, %@, suggestionID, %@, interfaceType, %lu, isLocationCheckMandatory, %d", buf, 0x30u);
  }

  v22 = objc_claimAutoreleasedReturnValue(-[MOPhotoManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __130__MOPhotoManager_fetchPhotosBetweenStartDate_EndDate_SuggestionID_BundleInterfaceType_Locations_IsLocationCheckMandatory_handler___block_invoke;
  block[3] = &unk_1002B51F0;
  block[4] = self;
  v28 = v15;
  v29 = v16;
  v30 = v18;
  v33 = v9;
  v31 = v19;
  v32 = a6;
  v23 = v19;
  v24 = v18;
  v25 = v16;
  v26 = v15;
  dispatch_async(v22, block);

}

void __130__MOPhotoManager_fetchPhotosBetweenStartDate_EndDate_SuggestionID_BundleInterfaceType_Locations_IsLocationCheckMandatory_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id os_log;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  _BOOL4 v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  int v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int v38;
  unsigned int v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  unsigned int v57;
  unsigned int v58;
  unsigned int v59;
  unsigned int v60;
  unsigned int v61;
  id v62;
  void *v63;
  void *v64;
  _QWORD v65[5];
  id v66;
  id v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[4];
  id v74;
  _QWORD v75[4];
  id v76;
  uint8_t buf[4];
  _BYTE v78[34];
  __int16 v79;
  id v80;
  __int16 v81;
  unsigned int v82;
  __int16 v83;
  unsigned int v84;
  __int16 v85;
  unsigned int v86;
  __int16 v87;
  uint64_t v88;
  __int16 v89;
  unsigned int v90;
  __int16 v91;
  unsigned int v92;
  __int16 v93;
  unsigned int v94;
  __int16 v95;
  unsigned int v96;
  _BYTE v97[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "photoLibrary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "librarySpecificFetchOptions"));

  objc_msgSend(v3, "setShouldPrefetchCount:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K >= %@ && %K <= %@"), CFSTR("endDate"), *(_QWORD *)(a1 + 40), CFSTR("startDate"), *(_QWORD *)(a1 + 48)));
  objc_msgSend(v3, "setPredicate:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:](PHAssetCollection, "fetchAssetCollectionsWithType:subtype:options:", 6, 1000000301, v3));
  v6 = v5;
  if (!v5 || (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fetchError")), v7, v7))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v9 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(_QWORD *)(a1 + 48);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fetchError"));
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v78 = v10;
      *(_WORD *)&v78[8] = 2112;
      *(_QWORD *)&v78[10] = v11;
      *(_WORD *)&v78[18] = 2112;
      *(_QWORD *)&v78[20] = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "fetch highlight from photo library failed, start date, %@, end date, %@, error, %@", buf, 0x20u);

    }
    v13 = *(void **)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 48);
    v16 = *(_QWORD *)(a1 + 56);
    v17 = *(unsigned __int8 *)(a1 + 80);
    v75[0] = _NSConcreteStackBlock;
    v75[1] = 3221225472;
    v75[2] = __130__MOPhotoManager_fetchPhotosBetweenStartDate_EndDate_SuggestionID_BundleInterfaceType_Locations_IsLocationCheckMandatory_handler___block_invoke_204;
    v75[3] = &unk_1002B51A0;
    v76 = *(id *)(a1 + 64);
    objc_msgSend(v13, "_fetchUnprocessedPhotosBetweenStartDate:EndDate:Locations:IsLocationCheckMandatory:handler:", v14, v15, v16, v17, v75);
    v18 = v76;
LABEL_6:

    goto LABEL_7;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fetchedObjects"));
  v20 = objc_msgSend(v19, "count");

  v21 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
  if (!v20)
  {
    if (v23)
    {
      v46 = *(_QWORD *)(a1 + 40);
      v47 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v78 = v46;
      *(_WORD *)&v78[8] = 2112;
      *(_QWORD *)&v78[10] = v47;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "fetch highlight from photo library successful, but fetched object count is invalid, start date, %@, end date, %@", buf, 0x16u);
    }

    v48 = *(void **)(a1 + 32);
    v49 = *(_QWORD *)(a1 + 40);
    v50 = *(_QWORD *)(a1 + 48);
    v51 = *(_QWORD *)(a1 + 56);
    v52 = *(unsigned __int8 *)(a1 + 80);
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = __130__MOPhotoManager_fetchPhotosBetweenStartDate_EndDate_SuggestionID_BundleInterfaceType_Locations_IsLocationCheckMandatory_handler___block_invoke_206;
    v73[3] = &unk_1002B51A0;
    v74 = *(id *)(a1 + 64);
    objc_msgSend(v48, "_fetchUnprocessedPhotosBetweenStartDate:EndDate:Locations:IsLocationCheckMandatory:handler:", v49, v50, v51, v52, v73);
    v18 = v74;
    goto LABEL_6;
  }
  v53 = a1;
  if (v23)
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v78 = objc_msgSend(v6, "count");
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "fetch highlight from photo library successful, highlightcount, %lu", buf, 0xCu);
  }
  v55 = v3;

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v54 = v6;
  v24 = v6;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v69, v97, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v70;
    v28 = 1;
    v56 = v24;
    do
    {
      v29 = 0;
      do
      {
        if (*(_QWORD *)v70 != v27)
          objc_enumerationMutation(v24);
        v30 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)v29);
        v31 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        v32 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          v33 = v28 + (_DWORD)v29;
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localIdentifier"));
          v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localStartDate"));
          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localEndDate"));
          v62 = objc_msgSend(v30, "assetsCount");
          v61 = objc_msgSend(v30, "type");
          v60 = objc_msgSend(v30, "category");
          v59 = objc_msgSend(v30, "sharingComposition");
          objc_msgSend(v30, "promotionScore");
          v36 = v35;
          v58 = objc_msgSend(v30, "isEnriched");
          v57 = objc_msgSend(v30, "enrichmentState");
          v37 = v28;
          v38 = objc_msgSend(v30, "visibilityState");
          v39 = objc_msgSend(v30, "kind");
          *(_DWORD *)buf = 67112194;
          *(_DWORD *)v78 = v33;
          *(_WORD *)&v78[4] = 2112;
          *(_QWORD *)&v78[6] = v34;
          *(_WORD *)&v78[14] = 2112;
          *(_QWORD *)&v78[16] = v64;
          *(_WORD *)&v78[24] = 2112;
          *(_QWORD *)&v78[26] = v63;
          v79 = 2048;
          v80 = v62;
          v81 = 1024;
          v82 = v61;
          v83 = 1024;
          v84 = v60;
          v85 = 1024;
          v86 = v59;
          v87 = 2048;
          v88 = v36;
          v89 = 1024;
          v90 = v58;
          v91 = 1024;
          v92 = v57;
          v93 = 1024;
          v94 = v38;
          v28 = v37;
          v24 = v56;
          v95 = 1024;
          v96 = v39;
          _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "highlight[%d] info, id, %@, start date, %@, end date, %@, assetsCount, %lu, type, %hu, category, %hu, sharingComposition, %hu, promotionScore, %f, isEnriched, %d, enrichmentState, %hu, visibilityState, %hu, kind, %hu", buf, 0x64u);

        }
        v29 = (char *)v29 + 1;
      }
      while (v26 != v29);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v69, v97, 16);
      v28 = (v28 + (_DWORD)v29);
    }
    while (v26);
  }

  v41 = *(void **)(v53 + 32);
  v40 = *(void **)(v53 + 40);
  v42 = *(_QWORD *)(v53 + 72);
  v43 = *(_QWORD *)(v53 + 48);
  v44 = *(_QWORD *)(v53 + 56);
  v45 = *(unsigned __int8 *)(v53 + 80);
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = __130__MOPhotoManager_fetchPhotosBetweenStartDate_EndDate_SuggestionID_BundleInterfaceType_Locations_IsLocationCheckMandatory_handler___block_invoke_207;
  v65[3] = &unk_1002B51C8;
  v65[4] = v41;
  v66 = v40;
  v67 = *(id *)(v53 + 48);
  v68 = *(id *)(v53 + 64);
  objc_msgSend(v41, "_fetchCuratedPhotosFromHighlights:StartDate:EndDate:BundleInterfaceType:Locations:IsLocationCheckMandatory:handler:", v24, v66, v43, v42, v44, v45, v65);

  v6 = v54;
  v3 = v55;
LABEL_7:

}

uint64_t __130__MOPhotoManager_fetchPhotosBetweenStartDate_EndDate_SuggestionID_BundleInterfaceType_Locations_IsLocationCheckMandatory_handler___block_invoke_204(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __130__MOPhotoManager_fetchPhotosBetweenStartDate_EndDate_SuggestionID_BundleInterfaceType_Locations_IsLocationCheckMandatory_handler___block_invoke_206(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __130__MOPhotoManager_fetchPhotosBetweenStartDate_EndDate_SuggestionID_BundleInterfaceType_Locations_IsLocationCheckMandatory_handler___block_invoke_207(_QWORD *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id os_log;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;
  _BYTE v45[128];

  v33 = a2;
  v9 = a3;
  v32 = a4;
  v31 = a5;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v9;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        v15 = (void *)a1[4];
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sceneClassifications"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_sceneLabelsForSceneClassifications:", v16));

        os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        v19 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uuid"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localIdentifier"));
          *(_DWORD *)buf = 138412802;
          v40 = v20;
          v41 = 2112;
          v42 = v21;
          v43 = 2112;
          v44 = v17;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "fetchPhotosBetweenStartDate, #traits, shortlisted assets with uuid %@ and localIdentifier %@ and scenes %@", buf, 0x20u);

        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    }
    while (v11);
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[PHSceneClassification fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:](PHSceneClassification, "fetchSceneClassificationsGroupedByAssetLocalIdentifierForAssets:", obj));
  v23 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = (void *)a1[5];
    v26 = (void *)a1[6];
    *(_DWORD *)buf = 138412802;
    v40 = v25;
    v41 = 2112;
    v42 = v26;
    v43 = 2112;
    v44 = v22;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "fetchPhotosBetweenStartDate, #traits, #scenes, startDate, %@, endDate, %@, scenes, %@", buf, 0x20u);
  }

  v27 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    v29 = (void *)a1[5];
    v30 = (void *)a1[6];
    *(_DWORD *)buf = 138412802;
    v40 = v29;
    v41 = 2112;
    v42 = v30;
    v43 = 2112;
    v44 = v32;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "fetchPhotosBetweenStartDate, #traits, startDate, %@, endDate, %@, traits, %@", buf, 0x20u);
  }

  (*(void (**)(void))(a1[7] + 16))();
}

- (id)getClassificationInfo:(id)a3
{
  NSMutableArray *v4;
  id os_log;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSMutableArray *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  GDEntityTaggingService *entityTaggingSerice;
  void *v15;
  NSObject *v16;
  id v17;
  NSMutableArray *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  void *v27;
  id v28;
  NSObject *v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  MOPersonRelationship *v33;
  MOPersonRelationship *v34;
  MOPersonRelationship *v35;
  id v36;
  id v37;
  NSObject *v38;
  id v40;
  void *v41;
  NSObject *v42;
  NSMutableArray *v43;
  NSMutableArray *v44;
  NSObject *obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  uint8_t buf[4];
  NSMutableArray *v52;
  __int16 v53;
  uint64_t v54;
  _BYTE v55[128];

  v4 = (NSMutableArray *)a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v52 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "#megadome,getClassificationInfo,personLocalIdentifier, %@", buf, 0xCu);
  }

  if (!v4)
  {
    v19 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v8 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#megadome,personLocalIdentifier is nil", buf, 2u);
    }
    v18 = 0;
    goto LABEL_57;
  }
  v7 = objc_claimAutoreleasedReturnValue(-[GDVisualIdentifierView personForIdentifier:](self->_visualIdentifierView, "personForIdentifier:", v4));
  v8 = v7;
  if (!v7)
  {
    v20 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v16 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[MOPhotoManager getClassificationInfo:].cold.1();
    v18 = 0;
    goto LABEL_56;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject entityIdentifier](v7, "entityIdentifier"));
  v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringValue"));

  v11 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v52 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "#megadome,personLocalIdentifierMD, %@", buf, 0xCu);
  }

  if (!v10)
  {
    v21 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v13 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "#megadome,could not get MD identifier for personLocalIdentifier %@", buf, 0xCu);
    }
    v16 = 0;
    v18 = 0;
    goto LABEL_55;
  }
  v13 = objc_msgSend(objc_alloc((Class)GDPersonTaggingOptions), "initWithTagThresholds:", &off_1002DD280);
  entityTaggingSerice = self->_entityTaggingSerice;
  v50 = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[GDEntityTaggingService entityTagsForIdentifier:options:error:](entityTaggingSerice, "entityTagsForIdentifier:options:error:", v10, v13, &v50));
  v16 = v50;
  if (v16)
  {
    v17 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    obj = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      -[MOPhotoManager getClassificationInfo:].cold.3();
LABEL_11:
    v18 = 0;
    goto LABEL_54;
  }
  if (!v15)
  {
    v40 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    obj = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      -[MOPhotoManager getClassificationInfo:].cold.2();
    goto LABEL_11;
  }
  v42 = v13;
  v43 = v10;
  v44 = v4;
  v41 = v15;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "scoredPersonEntityTags"));
  v18 = objc_opt_new(NSMutableArray);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v22;
  v23 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
  if (!v23)
    goto LABEL_51;
  v24 = v23;
  v25 = *(_QWORD *)v47;
  do
  {
    for (i = 0; i != v24; i = (char *)i + 1)
    {
      if (*(_QWORD *)v47 != v25)
        objc_enumerationMutation(obj);
      v27 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
      v28 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = (NSMutableArray *)objc_msgSend(v27, "tag");
        objc_msgSend(v27, "score");
        *(_DWORD *)buf = 134218240;
        v52 = v30;
        v53 = 2048;
        v54 = v31;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "#megadome,personTag,%ld,score,%f", buf, 0x16u);
      }

      if (objc_msgSend(v27, "tag") == (id)4)
      {
        v32 = 4;
      }
      else if (objc_msgSend(v27, "tag") == (id)22)
      {
        v32 = 22;
      }
      else if (objc_msgSend(v27, "tag") == (id)21)
      {
        v32 = 21;
      }
      else if (objc_msgSend(v27, "tag") == (id)26)
      {
        v32 = 26;
      }
      else if (objc_msgSend(v27, "tag") == (id)15)
      {
        v32 = 15;
      }
      else if (objc_msgSend(v27, "tag") == (id)3)
      {
        v32 = 3;
      }
      else if (objc_msgSend(v27, "tag") == (id)27)
      {
        v32 = 27;
      }
      else if (objc_msgSend(v27, "tag") == (id)28)
      {
        v32 = 28;
      }
      else
      {
        if (objc_msgSend(v27, "tag") != (id)29)
          continue;
        v32 = 29;
      }
      v33 = [MOPersonRelationship alloc];
      objc_msgSend(v27, "score");
      v34 = -[MOPersonRelationship initWithRelationship:score:source:](v33, "initWithRelationship:score:source:", v32, &stru_1002B68D0);
      if (v34)
      {
        v35 = v34;
        v36 = -[MOPersonRelationship copy](v34, "copy");
        -[NSMutableArray addObject:](v18, "addObject:", v36);

      }
    }
    v24 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
  }
  while (v24);
LABEL_51:

  v37 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v38 = objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v52 = v18;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "#megadome,classification, %@", buf, 0xCu);
  }

  v4 = v44;
  v13 = v42;
  v10 = v43;
  v15 = v41;
  v16 = 0;
LABEL_54:

LABEL_55:
LABEL_56:

LABEL_57:
  return v18;
}

- (id)getPersonsInAsset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *i;
  void *v8;
  NSObject *v9;
  id os_log;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  unsigned int v18;
  void *v19;
  unsigned int v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  id v41;
  NSObject *v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  unsigned int v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  NSObject *v56;
  MOPerson *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  id v68;
  unsigned int v69;
  id v70;
  unsigned int v71;
  void *v72;
  MOPerson *v73;
  NSObject *v74;
  MOPerson *v75;
  void *v76;
  MOPerson *v77;
  id v78;
  id v79;
  NSObject *v80;
  _BOOL4 v81;
  void *v82;
  uint64_t v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  id obj;
  unsigned int v90;
  id v91;
  void *v92;
  unsigned int v93;
  void *v94;
  MOPhotoManager *v95;
  uint64_t v96;
  id v97;
  NSObject *v98;
  void *v99;
  void *v100;
  void *v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint8_t buf[4];
  void *v107;
  __int16 v108;
  id v109;
  __int16 v110;
  void *v111;
  __int16 v112;
  _BYTE v113[34];
  __int16 v114;
  id v115;
  __int16 v116;
  unsigned int v117;
  __int16 v118;
  id v119;
  __int16 v120;
  unsigned int v121;
  __int16 v122;
  void *v123;
  _BYTE v124[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PHFetchOptions fetchOptionsWithPhotoLibrary:orObject:](PHFetchOptions, "fetchOptionsWithPhotoLibrary:orObject:", 0, v4));
  objc_msgSend(v5, "setPersonContext:", 0);
  objc_msgSend(v5, "setIncludedDetectionTypes:", &off_1002DCC38);
  v88 = v4;
  v85 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PHPerson fetchPersonsInAsset:options:](PHPerson, "fetchPersonsInAsset:options:", v4, v5));
  v86 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  obj = v6;
  v97 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v124, 16);
  if (v97)
  {
    v96 = *(_QWORD *)v103;
    v95 = self;
    do
    {
      for (i = 0; i != v97; i = (char *)i + 1)
      {
        if (*(_QWORD *)v103 != v96)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "type") != (id)-1)
        {
          v100 = i;
          v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayName"));
          os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          v11 = objc_claimAutoreleasedReturnValue(os_log);
          v98 = v9;
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "localIdentifier"));
            v13 = objc_msgSend(v8, "type");
            v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contactMatchingDictionary"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "description"));
            v93 = objc_msgSend(v8, "isMe");
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayName"));
            v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "personUri"));
            v91 = objc_msgSend(v8, "faceCount");
            v90 = objc_msgSend(v8, "isVerified");
            v17 = objc_msgSend(v8, "verifiedType");
            v18 = objc_msgSend(v8, "detectionType");
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localIdentifier"));
            *(_DWORD *)buf = 138415106;
            v107 = v12;
            v108 = 2048;
            v109 = v13;
            v110 = 2112;
            v111 = v14;
            v112 = 1024;
            *(_DWORD *)v113 = v93;
            *(_WORD *)&v113[4] = 2112;
            *(_QWORD *)&v113[6] = v15;
            *(_WORD *)&v113[14] = 2112;
            *(_QWORD *)&v113[16] = v16;
            *(_WORD *)&v113[24] = 2112;
            *(_QWORD *)&v113[26] = v92;
            v114 = 2048;
            v115 = v91;
            v116 = 1024;
            v117 = v90;
            v118 = 2048;
            v119 = v17;
            v120 = 1024;
            v121 = v18;
            v122 = 2112;
            v123 = v19;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Asset : %@, type : %ld, contactMatchingDictionary : %@, isMe : %d, name : %@, displayName : %@, personURI : %@, faceCount : %ld, verified : %d, verifiedType : %ld, detectionType : %hd, localIdentifier : %@", buf, 0x6Eu);

            self = v95;
            v9 = v98;

          }
          v20 = objc_msgSend(v8, "isMe");
          if (v20)
          {
            v21 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
            v22 = objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localIdentifier"));
              *(_DWORD *)buf = 138412290;
              v107 = v23;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "got current person as me person from Photos, localIdentifier : %@", buf, 0xCu);

            }
          }
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoManager mePerson](self, "mePerson"));

          if (v24)
          {
            v25 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
            v26 = objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              v27 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoManager mePerson](self, "mePerson"));
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localIdentifier"));
              *(_DWORD *)buf = 138412290;
              v107 = v28;
              _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "got me person from Photo person localIdentifier :  %@", buf, 0xCu);

            }
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localIdentifier"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoManager mePerson](self, "mePerson"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localIdentifier"));

            if (v29 == v31)
            {
              v32 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
              v33 = objc_claimAutoreleasedReturnValue(v32);
              if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Current person matched with the me Person", buf, 2u);
              }

              v20 = 1;
            }
          }
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoManager suggestedMePersonIdentifier](self, "suggestedMePersonIdentifier"));

          if (v34)
          {
            v35 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
            v36 = objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              v37 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoManager suggestedMePersonIdentifier](self, "suggestedMePersonIdentifier"));
              *(_DWORD *)buf = 138412290;
              v107 = v37;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "got inferred me person from Photos, localIdentifier : %@", buf, 0xCu);

            }
            v38 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoManager suggestedMePersonIdentifier](self, "suggestedMePersonIdentifier"));
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localIdentifier"));
            v40 = objc_msgSend(v38, "isEqualToString:", v39);

            if (v40)
            {
              v41 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
              v42 = objc_claimAutoreleasedReturnValue(v41);
              if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Current PHPerson matched as the inferred Me Person, setting it as mePerson", buf, 2u);
              }

              v20 = 1;
            }
          }
          v43 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoManager meContact](self, "meContact"));

          if (v43)
          {
            v44 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
            v45 = objc_claimAutoreleasedReturnValue(v44);
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              v46 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoManager meContact](self, "meContact"));
              *(_DWORD *)buf = 138412290;
              v107 = v46;
              _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "me contact from me card: %@", buf, 0xCu);

            }
            v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "personUri"));
            if (-[NSObject length](v47, "length"))
            {
              v48 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoManager meContact](self, "meContact"));
              v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "identifier"));
              v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "personUri"));
              v51 = objc_msgSend(v49, "isEqualToString:", v50);

              self = v95;
              if (v51)
              {
                v52 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
                v47 = objc_claimAutoreleasedReturnValue(v52);
                v20 = 1;
                if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "Current PHPerson matched as the me person from Me Card, settng it as mePerson", buf, 2u);
                }
                goto LABEL_34;
              }
            }
            else
            {
LABEL_34:

            }
          }
          if (-[NSObject length](v9, "length"))
          {
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localIdentifier"));
            v54 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoManager getClassificationInfo:](self, "getClassificationInfo:", v53));

            v55 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
            v56 = objc_claimAutoreleasedReturnValue(v55);
            if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v107 = v54;
              _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "people relationships : %@", buf, 0xCu);
            }

            v57 = [MOPerson alloc];
            v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localIdentifier"));
            v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "personUri"));
            v60 = objc_msgSend(v59, "length");
            if (v60)
              v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "personUri"));
            objc_msgSend(v8, "type");
            v72 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoManager suggestedMePersonIdentifier](self, "suggestedMePersonIdentifier"));
            if (((v72 == 0) & ~v20) != 0)
            {
              v76 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoManager mePerson](self, "mePerson"));
              LOBYTE(v84) = v76 != 0;
              v77 = v57;
              v74 = v98;
              v75 = -[MOPerson initWithLocalIdentifier:name:contactIdentifier:family:isPHPersonTypeImportant:isMePerson:mePersonIdentified:personRelationships:priorityScore:significanceScore:](v77, "initWithLocalIdentifier:name:contactIdentifier:family:isPHPersonTypeImportant:isMePerson:mePersonIdentified:personRelationships:priorityScore:significanceScore:", v58, 0.0, 0.0, v84, v54);

              self = v95;
            }
            else
            {
              LOBYTE(v84) = 1;
              v73 = v57;
              v74 = v98;
              v75 = -[MOPerson initWithLocalIdentifier:name:contactIdentifier:family:isPHPersonTypeImportant:isMePerson:mePersonIdentified:personRelationships:priorityScore:significanceScore:](v73, "initWithLocalIdentifier:name:contactIdentifier:family:isPHPersonTypeImportant:isMePerson:mePersonIdentified:personRelationships:priorityScore:significanceScore:", v58, 0.0, 0.0, v84, v54);
            }

            if (v60)
            -[MOPerson setSourceEventAccessType:](v75, "setSourceEventAccessType:", 4);
            objc_msgSend(v86, "addObject:", v75);

            i = v100;
            v9 = v74;
          }
          else
          {
            i = v100;
          }
          goto LABEL_49;
        }
        v61 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        v9 = objc_claimAutoreleasedReturnValue(v61);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "localIdentifier"));
          v101 = i;
          v62 = objc_msgSend(v8, "type");
          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contactMatchingDictionary"));
          v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "description"));
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayName"));
          v66 = v9;
          v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "personUri"));
          v68 = objc_msgSend(v8, "faceCount");
          v69 = objc_msgSend(v8, "isVerified");
          v70 = objc_msgSend(v8, "verifiedType");
          v71 = objc_msgSend(v8, "detectionType");
          *(_DWORD *)buf = 138414338;
          v107 = v99;
          v108 = 2048;
          v109 = v62;
          v110 = 2112;
          v111 = v64;
          v112 = 2112;
          *(_QWORD *)v113 = v65;
          *(_WORD *)&v113[8] = 2112;
          *(_QWORD *)&v113[10] = v67;
          *(_WORD *)&v113[18] = 2048;
          *(_QWORD *)&v113[20] = v68;
          *(_WORD *)&v113[28] = 1024;
          *(_DWORD *)&v113[30] = v69;
          v114 = 2048;
          v115 = v70;
          self = v95;
          v116 = 1024;
          v117 = v71;
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "Asset : %@, skipping as type : %ld, contactMatchingDictionary : %@, displayName : %@, personURI : %@, faceCount : %ld, verified : %d, verifiedType : %ld, detectionType : %hd", buf, 0x54u);

          v9 = v66;
          i = v101;

        }
LABEL_49:

      }
      v97 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v124, 16);
    }
    while (v97);
  }

  v78 = objc_msgSend(v86, "count");
  v79 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v80 = objc_claimAutoreleasedReturnValue(v79);
  v81 = os_log_type_enabled(v80, OS_LOG_TYPE_INFO);
  if (v78)
  {
    if (v81)
    {
      v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "allObjects"));
      *(_DWORD *)buf = 138412290;
      v107 = v82;
      _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_INFO, "people names from current asset : %@ ", buf, 0xCu);

    }
  }
  else if (v81)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_INFO, "got no people from current asset", buf, 2u);
  }

  return v86;
}

- (void)_fetchCuratedPhotosFromHighlights:(id)a3 StartDate:(id)a4 EndDate:(id)a5 BundleInterfaceType:(unint64_t)a6 Locations:(id)a7 IsLocationCheckMandatory:(BOOL)a8 handler:(id)a9
{
  id v12;
  id v13;
  id v14;
  id os_log;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _BOOL4 v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  id v29;
  _BOOL4 v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *i;
  void *v36;
  void *v37;
  unsigned int v38;
  id v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  id v49;
  NSObject *v50;
  id v51;
  NSMutableArray *v52;
  id v53;
  id v54;
  uint64_t v55;
  void *j;
  void *v57;
  id v58;
  NSObject *v59;
  void *v60;
  id v61;
  NSObject *v62;
  id v63;
  id v64;
  NSObject *v65;
  id v66;
  id v67;
  id v68;
  void *v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  id v71;
  NSObject *v72;
  _BOOL4 v73;
  id v75;
  id v76;
  id obj;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  id v84;
  uint64_t v86;
  unint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  NSMutableArray *v91;
  NSMutableArray *v92;
  _QWORD v93[6];
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t (*v97)(uint64_t, uint64_t);
  void (*v98)(uint64_t);
  NSArray *v99;
  _QWORD v100[5];
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  id v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _BYTE v114[24];
  uint64_t (*v115)(uint64_t, uint64_t);
  void (*v116)(uint64_t);
  NSDictionary *v117;
  NSErrorUserInfoKey v118;
  const __CFString *v119;
  _BYTE buf[24];
  uint64_t (*v121)(uint64_t, uint64_t);
  void (*v122)(uint64_t);
  NSMutableArray *v123;
  _BYTE v124[128];
  NSErrorUserInfoKey v125;
  const __CFString *v126;
  _BYTE v127[128];
  _QWORD v128[5];
  _BYTE v129[128];

  v73 = a8;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v75 = a7;
  v76 = a9;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v16 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "#photoscuration, fetchCuratedPhotosFromHighlights, startDate, %@, endDate, %@", buf, 0x16u);
  }

  v92 = objc_opt_new(NSMutableArray);
  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  obj = v12;
  v84 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v129, 16);
  if (v84)
  {
    v83 = *(_QWORD *)v111;
    v82 = PHAssetPropertySetSceneAnalysis;
    v81 = PHAssetPropertySetMediaAnalysis;
    v80 = PHAssetPropertySetAesthetic;
    v79 = PHAssetPropertySetSceneprint;
    v78 = PHAssetPropertySetUserActivity;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v111 != v83)
        {
          v18 = v17;
          objc_enumerationMutation(obj);
          v17 = v18;
        }
        v86 = v17;
        v19 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoManager photoLibrary](self, "photoLibrary"));
        v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "librarySpecificFetchOptions"));

        objc_msgSend(v90, "setIncludeGuestAssets:", 1);
        v128[0] = v82;
        v128[1] = v81;
        v128[2] = v80;
        v128[3] = v79;
        v128[4] = v78;
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v128, 5));
        objc_msgSend(v90, "setFetchPropertySets:", v21);

        objc_msgSend(v90, "setShouldPrefetchCount:", 1);
        objc_msgSend(v90, "setHighlightCurationType:", 1);
        v109 = 0;
        v88 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset fetchSummaryCurationForHighlight:fetchOptions:allowsOnDemand:error:](PHAsset, "fetchSummaryCurationForHighlight:fetchOptions:allowsOnDemand:error:", v19, v90, 1, &v109));
        v87 = (unint64_t)v109;
        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "fetchError"));
        v23 = (v22 | v87) != 0;

        if (v23)
        {
          v24 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          v25 = objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localIdentifier"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "fetchError"));
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v26;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v27;
            _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "#photoscuration, fetching curated assets for highlight, %@, hit error, %@", buf, 0x16u);

          }
        }
        else
        {
          v28 = objc_msgSend(v88, "count") == 0;
          v29 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          v25 = objc_claimAutoreleasedReturnValue(v29);
          v30 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
          if (v28)
          {
            if (v30)
            {
              v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localIdentifier"));
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v43;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "#photoscuration, fetching curated assets for highlight, %@, asset count is 0", buf, 0xCu);

            }
          }
          else
          {
            if (v30)
            {
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localIdentifier"));
              v32 = objc_msgSend(v88, "count");
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v31;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = v32;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "#photoscuration, fetching curated assets successful for highlight, %@, asset count, %lu", buf, 0x16u);

            }
            v107 = 0u;
            v108 = 0u;
            v105 = 0u;
            v106 = 0u;
            v25 = v88;
            v33 = -[NSObject countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v105, v127, 16);
            if (v33)
            {
              v34 = *(_QWORD *)v106;
              do
              {
                for (i = 0; i != v33; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v106 != v34)
                    objc_enumerationMutation(v25);
                  v36 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * (_QWORD)i);
                  objc_msgSend(v36, "fetchPropertySetsIfNeeded");
                  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "creationDate"));
                  v38 = objc_msgSend(v37, "betweenDate:andDate:", v13, v14);

                  if (v38)
                  {
                    -[NSMutableArray addObject:](v92, "addObject:", v36);
                    v39 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
                    v40 = objc_claimAutoreleasedReturnValue(v39);
                    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
                    {
                      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "localIdentifier"));
                      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "creationDate"));
                      *(_DWORD *)buf = 138412546;
                      *(_QWORD *)&buf[4] = v41;
                      *(_WORD *)&buf[12] = 2112;
                      *(_QWORD *)&buf[14] = v42;
                      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "#photoscuration, fetched asset within timerange identifier, %@, creationDate, %@", buf, 0x16u);

                    }
                  }
                }
                v33 = -[NSObject countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v105, v127, 16);
              }
              while (v33);
            }
          }
        }

        v17 = v86 + 1;
      }
      while ((id)(v86 + 1) != v84);
      v84 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v129, 16);
    }
    while (v84);
  }

  if (-[NSMutableArray count](v92, "count"))
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoManager configurationManager](self, "configurationManager"));
    v45 = v44;
    if (a6 == 7)
      objc_msgSend(v44, "getDoubleSettingForKey:withFallback:", CFSTR("Photos_DistanceFromHomeThreshold"), 75.0);
    else
      objc_msgSend(v44, "getDoubleSettingForKey:withFallback:", CFSTR("Photos_DistanceFromDefaultThreshold"), 200.0);
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoManager _getPhotosByAssetProperties:UserLocations:IsLocationCheckMandatory:MinDistance:](self, "_getPhotosByAssetProperties:UserLocations:IsLocationCheckMandatory:MinDistance:", v92, v75, v73));

    v49 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v50 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      v51 = objc_msgSend(v89, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v51;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "#photoscuration, total filtered photos count, %lu", buf, 0xCu);
    }

    v52 = objc_opt_new(NSMutableArray);
    v91 = objc_opt_new(NSMutableArray);
    if (objc_msgSend(v89, "count"))
    {
      v103 = 0u;
      v104 = 0u;
      v101 = 0u;
      v102 = 0u;
      v53 = v89;
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v101, v124, 16);
      if (v54)
      {
        v55 = *(_QWORD *)v102;
        do
        {
          for (j = 0; j != v54; j = (char *)j + 1)
          {
            if (*(_QWORD *)v102 != v55)
              objc_enumerationMutation(v53);
            v57 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * (_QWORD)j);
            if (-[MOPhotoManager _doesAssetHaveSceneProcessing:](self, "_doesAssetHaveSceneProcessing:", v57)
              || -[MOPhotoManager _doesAssetHaveFaceProcessing:](self, "_doesAssetHaveFaceProcessing:", v57))
            {
              -[NSMutableArray addObject:](v52, "addObject:", v57);
            }
            else
            {
              -[NSMutableArray addObject:](v91, "addObject:", v57);
              v58 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
              v59 = objc_claimAutoreleasedReturnValue(v58);
              if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
              {
                v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "uuid"));
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v60;
                _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "#photoscuration, asset has not completed scene or face processing yet, %@", buf, 0xCu);

              }
            }
          }
          v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v101, v124, 16);
        }
        while (v54);
      }

    }
    v61 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v62 = objc_claimAutoreleasedReturnValue(v61);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
    {
      v63 = -[NSMutableArray count](v91, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v63;
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "#photoscuration, total photos which need to request MAD process count, %lu", buf, 0xCu);
    }

    v64 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v65 = objc_claimAutoreleasedReturnValue(v64);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      v66 = -[NSMutableArray count](v52, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v66;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "#photoscuration, total final assets for bundling count, %lu", buf, 0xCu);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v121 = __Block_byref_object_copy__34;
    v122 = __Block_byref_object_dispose__34;
    v123 = objc_opt_new(NSMutableArray);
    v100[0] = _NSConcreteStackBlock;
    v100[1] = 3221225472;
    v100[2] = __133__MOPhotoManager__fetchCuratedPhotosFromHighlights_StartDate_EndDate_BundleInterfaceType_Locations_IsLocationCheckMandatory_handler___block_invoke;
    v100[3] = &unk_1002AEFF0;
    v100[4] = buf;
    -[MOPhotoManager _fetchPhotosTraitsFromAssets:StartDate:EndDate:handler:](self, "_fetchPhotosTraitsFromAssets:StartDate:EndDate:handler:", v52, v13, v14, v100);
    -[MOPhotoManager _scheduleMediaAnalysisDeferredProcessing:](self, "_scheduleMediaAnalysisDeferredProcessing:", v91);
    if (-[NSMutableArray count](v52, "count"))
    {
      *(_QWORD *)v114 = 0;
      *(_QWORD *)&v114[8] = v114;
      *(_QWORD *)&v114[16] = 0x3032000000;
      v115 = __Block_byref_object_copy__34;
      v116 = __Block_byref_object_dispose__34;
      v117 = objc_opt_new(NSDictionary);
      v94 = 0;
      v95 = &v94;
      v96 = 0x3032000000;
      v97 = __Block_byref_object_copy__34;
      v98 = __Block_byref_object_dispose__34;
      v99 = objc_opt_new(NSArray);
      v93[0] = _NSConcreteStackBlock;
      v93[1] = 3221225472;
      v93[2] = __133__MOPhotoManager__fetchCuratedPhotosFromHighlights_StartDate_EndDate_BundleInterfaceType_Locations_IsLocationCheckMandatory_handler___block_invoke_249;
      v93[3] = &unk_1002B5218;
      v93[4] = v114;
      v93[5] = &v94;
      -[MOPhotoManager _buildCuratedAssetMap:handler:](self, "_buildCuratedAssetMap:handler:", v52, v93);
      v67 = objc_msgSend(*(id *)(*(_QWORD *)&v114[8] + 40), "copy");
      v68 = objc_msgSend((id)v95[5], "copy");
      (*((void (**)(id, id, id, _QWORD, _QWORD))v76 + 2))(v76, v67, v68, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), 0);

      _Block_object_dispose(&v94, 8);
      _Block_object_dispose(v114, 8);

    }
    else
    {
      v118 = NSLocalizedDescriptionKey;
      v119 = CFSTR("#photoscuration, no curated filtered assets available");
      v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v119, &v118, 1));
      v70 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 5, v69));

      v71 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      v72 = objc_claimAutoreleasedReturnValue(v71);
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v114 = 138412802;
        *(_QWORD *)&v114[4] = v13;
        *(_WORD *)&v114[12] = 2112;
        *(_QWORD *)&v114[14] = v14;
        *(_WORD *)&v114[22] = 2112;
        v115 = v70;
        _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, "#photoscuration, fetchCuratedPhotosFromHighlights, start date, %@, end date, %@, error, %@", v114, 0x20u);
      }

      (*((void (**)(id, _QWORD, _QWORD, _QWORD, uint64_t (*)(uint64_t, uint64_t)))v76 + 2))(v76, 0, 0, 0, v70);
    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    v125 = NSLocalizedDescriptionKey;
    v126 = CFSTR("#photoscuration, no curated highlights assets fetched from photos");
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v126, &v125, 1));
    v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 5, v46));

    v47 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v48 = objc_claimAutoreleasedReturnValue(v47);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v14;
      *(_WORD *)&buf[22] = 2112;
      v121 = (uint64_t (*)(uint64_t, uint64_t))v89;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "#photoscuration, fetchCuratedPhotosFromHighlights, start date, %@, end date, %@, error, %@", buf, 0x20u);
    }

    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v76 + 2))(v76, 0, 0, 0, v89);
  }

}

void __133__MOPhotoManager__fetchCuratedPhotosFromHighlights_StartDate_EndDate_BundleInterfaceType_Locations_IsLocationCheckMandatory_handler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __133__MOPhotoManager__fetchCuratedPhotosFromHighlights_StartDate_EndDate_BundleInterfaceType_Locations_IsLocationCheckMandatory_handler___block_invoke_249(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (void)_fetchPhotosTraitsFromAssets:(id)a3 StartDate:(id)a4 EndDate:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, id, _QWORD);
  id os_log;
  NSObject *v15;
  NSMutableArray *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  PHPhotoLibrary *photoLibrary;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  MOPhotoManager *v38;
  void (**v39)(id, id, _QWORD);
  id v40;
  id v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  NSErrorUserInfoKey v54;
  const __CFString *v55;
  _BYTE v56[128];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, id, _QWORD))a6;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v15 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v49 = v11;
    v50 = 2112;
    v51 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "#traits, fetchPhotosTraitsFromAssets, startDate, %@, endDate, %@", buf, 0x16u);
  }

  v16 = objc_opt_new(NSMutableArray);
  if (objc_msgSend(v10, "count"))
  {
    v38 = self;
    v39 = v13;
    v40 = v12;
    v41 = v11;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = v10;
    v17 = v10;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v45 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "uuid"));
          -[NSMutableArray addObject:](v16, "addObject:", v23);

          v24 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          v25 = objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "uuid"));
            *(_DWORD *)buf = 138412290;
            v49 = v26;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "#traits, fetchPhotosTraitsFromAssets, asset uuid, %@", buf, 0xCu);

          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
      }
      while (v19);
    }

    photoLibrary = v38->_photoLibrary;
    v43 = 0;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary requestPersonalTraitsForAssetsWithUUIDs:error:](photoLibrary, "requestPersonalTraitsForAssetsWithUUIDs:error:", v16, &v43));
    v29 = v43;
    if (v29)
    {
      v54 = NSLocalizedDescriptionKey;
      v55 = CFSTR("#traits, no traits");
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1));
      v31 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 5, v30));

      v32 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      v33 = objc_claimAutoreleasedReturnValue(v32);
      v12 = v40;
      v11 = v41;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v49 = v41;
        v50 = 2112;
        v51 = v40;
        v52 = 2112;
        v53 = v31;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "#traits, fetchPhotosTraitsFromAssets, start date, %@, end date, %@, error, %@", buf, 0x20u);
      }

      v13 = v39;
      ((void (**)(id, id, id))v39)[2](v39, 0, v29);
    }
    else
    {
      v36 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      v37 = objc_claimAutoreleasedReturnValue(v36);
      v12 = v40;
      v11 = v41;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v49 = v41;
        v50 = 2112;
        v51 = v40;
        v52 = 2112;
        v53 = v28;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "#traits, fetchPhotosTraitsFromAssets, startDate, %@, endDate, %@, traits, %@", buf, 0x20u);
      }

      v31 = objc_msgSend(v28, "copy");
      v13[2](v13, v31, 0);
    }
    v10 = v42;

  }
  else
  {
    v34 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "#traits, fetchPhotosTraitsFromAssets early exit because asset count is zero", buf, 2u);
    }

    v13[2](v13, 0, 0);
  }

}

- (void)_fetchUnprocessedPhotosBetweenStartDate:(id)a3 EndDate:(id)a4 Locations:(id)a5 IsLocationCheckMandatory:(BOOL)a6 handler:(id)a7
{
  id os_log;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  NSMutableArray *v31;
  void *v32;
  BOOL v33;
  void *v34;
  BOOL v35;
  void *v36;
  _BOOL4 v37;
  void *v38;
  id v39;
  id v40;
  NSObject *v41;
  id v42;
  id v43;
  NSObject *v44;
  id v45;
  id v46;
  NSObject *v47;
  id v48;
  id v49;
  NSObject *v50;
  id v51;
  id v52;
  NSObject *v53;
  id v54;
  NSMutableArray *v55;
  id v56;
  NSObject *v57;
  id v58;
  void *v59;
  id v60;
  NSObject *v61;
  id v62;
  NSMutableArray *v63;
  NSMutableArray *v64;
  id v65;
  id v66;
  uint64_t v67;
  void *i;
  uint64_t v69;
  unsigned __int8 v70;
  NSMutableArray *v71;
  id v72;
  NSObject *v73;
  id v74;
  id v75;
  NSObject *v76;
  id v77;
  id v78;
  id v79;
  void *v80;
  id v81;
  NSObject *v82;
  void *v83;
  uint64_t (*v84)(uint64_t, uint64_t);
  id v85;
  NSObject *v86;
  uint64_t (*v87)(uint64_t, uint64_t);
  _BOOL4 v88;
  NSMutableArray *v89;
  NSMutableArray *v90;
  id v91;
  BOOL v92;
  NSMutableArray *v93;
  id v94;
  id v95;
  id v96;
  void *v97;
  NSMutableArray *v98;
  void *v99;
  NSMutableArray *v100;
  _QWORD v101[6];
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t (*v105)(uint64_t, uint64_t);
  void (*v106)(uint64_t);
  NSMutableArray *v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _BYTE buf[24];
  uint64_t (*v117)(uint64_t, uint64_t);
  void (*v118)(uint64_t);
  NSMutableDictionary *v119;
  NSErrorUserInfoKey v120;
  const __CFString *v121;
  _BYTE v122[128];
  _BYTE v123[128];
  NSErrorUserInfoKey v124;
  const __CFString *v125;
  _QWORD v126[4];

  v88 = a6;
  v95 = a3;
  v96 = a4;
  v91 = a5;
  v94 = a7;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v95;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v96;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "#customcuration,fetchUnprocessedPhotosBetweenStartDate,startDate,%@, endDate,%@", buf, 0x16u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoManager photoLibrary](self, "photoLibrary"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "librarySpecificFetchOptions"));

  v126[0] = PHAssetPropertySetSceneAnalysis;
  v126[1] = PHAssetPropertySetMediaAnalysis;
  v126[2] = PHAssetPropertySetAesthetic;
  v126[3] = PHAssetPropertySetSceneprint;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v126, 4));
  objc_msgSend(v99, "setFetchPropertySets:", v14);

  objc_msgSend(v99, "setShouldPrefetchCount:", 1);
  objc_msgSend(v99, "setIncludeGuestAssets:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K >= %@ && %K <= %@"), CFSTR("creationDate"), v95, CFSTR("creationDate"), v96));
  objc_msgSend(v99, "setPredicate:", v15);

  v97 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset fetchAssetsWithOptions:](PHAsset, "fetchAssetsWithOptions:", v99));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "fetchError"));

  v17 = v16 == 0;
  v18 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  v20 = v19;
  if (!v17)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v87 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "fetchError"));
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v95;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v96;
      *(_WORD *)&buf[22] = 2112;
      v117 = v87;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "#customcuration,fetchUnprocessedPhotosBetweenStartDate, start date, %@, end date, %@, fetching assets hit error, %@", buf, 0x20u);

    }
    v100 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "fetchError"));
    (*((void (**)(id, _QWORD, _QWORD, NSMutableArray *))v94 + 2))(v94, 0, 0, v100);
    goto LABEL_77;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v21 = objc_msgSend(v97, "count");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "#customcuration,fetchUnprocessedPhotosBetweenStartDate,count %lu", buf, 0xCu);
  }

  if (objc_msgSend(v97, "count"))
  {
    v100 = objc_opt_new(NSMutableArray);
    v98 = objc_opt_new(NSMutableArray);
    v93 = objc_opt_new(NSMutableArray);
    v90 = objc_opt_new(NSMutableArray);
    v89 = objc_opt_new(NSMutableArray);
    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    v113 = 0u;
    v22 = v97;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v112, v123, 16);
    if (!v23)
      goto LABEL_37;
    v24 = *(_QWORD *)v113;
    while (1)
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v113 != v24)
          objc_enumerationMutation(v22);
        v26 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * (_QWORD)v25);
        objc_msgSend(v26, "fetchPropertySetsIfNeeded");
        if ((objc_msgSend(v26, "mediaSubtypes") & 4) == 0
          && (objc_msgSend(v26, "mediaSubtypes") & 0x80000) == 0
          && (objc_msgSend(v26, "mediaSubtypes") & 0x20000) == 0
          && objc_msgSend(v26, "mediaType") != (id)3)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "importProperties"));
          if (objc_msgSend(v27, "importedBy") == (id)2)
            goto LABEL_24;
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "importProperties"));
          if (objc_msgSend(v28, "importedBy") == (id)1)
            goto LABEL_23;
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "importProperties"));
          if (objc_msgSend(v29, "importedBy") == (id)8)
          {

LABEL_23:
LABEL_24:

          }
          else
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "importProperties"));
            v92 = objc_msgSend(v38, "importedBy") == (id)12;

            if (!v92)
              goto LABEL_32;
          }
          v30 = objc_msgSend(v26, "isFavorite");
          v31 = v100;
          if ((v30 & 1) == 0)
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "assetUserActivityProperties"));
            v33 = (uint64_t)objc_msgSend(v32, "shareCount") > 0;

            v31 = v98;
            if (!v33)
            {
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "assetUserActivityProperties"));
              v35 = (uint64_t)objc_msgSend(v34, "viewCount") > 2;

              v31 = v93;
              if (!v35)
              {
                v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "mediaAnalysisProperties"));
                v37 = objc_msgSend(v36, "faceCount") == 0;

                if (v37)
                  v31 = v89;
                else
                  v31 = v90;
              }
            }
          }
          -[NSMutableArray addObject:](v31, "addObject:", v26);
        }
LABEL_32:
        v25 = (char *)v25 + 1;
      }
      while (v23 != v25);
      v39 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v112, v123, 16);
      v23 = v39;
      if (!v39)
      {
LABEL_37:

        v40 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        v41 = objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          v42 = -[NSMutableArray count](v100, "count");
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v42;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "#customcuration,fetched %lu favorite photo", buf, 0xCu);
        }

        v43 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        v44 = objc_claimAutoreleasedReturnValue(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          v45 = -[NSMutableArray count](v98, "count");
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v45;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "#customcuration,fetched %lu shared photo", buf, 0xCu);
        }

        v46 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        v47 = objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          v48 = -[NSMutableArray count](v93, "count");
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v48;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "#customcuration,fetched %lu viewed photo", buf, 0xCu);
        }

        v49 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        v50 = objc_claimAutoreleasedReturnValue(v49);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          v51 = -[NSMutableArray count](v90, "count");
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v51;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "#customcuration,fetched %lu people photo", buf, 0xCu);
        }

        v52 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        v53 = objc_claimAutoreleasedReturnValue(v52);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          v54 = -[NSMutableArray count](v89, "count");
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v54;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "#customcuration,fetched %lu sortedRest photo", buf, 0xCu);
        }

        v55 = objc_opt_new(NSMutableArray);
        -[NSMutableArray addObjectsFromArray:](v55, "addObjectsFromArray:", v100);
        -[NSMutableArray addObjectsFromArray:](v55, "addObjectsFromArray:", v98);
        -[NSMutableArray addObjectsFromArray:](v55, "addObjectsFromArray:", v93);
        -[NSMutableArray addObjectsFromArray:](v55, "addObjectsFromArray:", v90);
        -[NSMutableArray addObjectsFromArray:](v55, "addObjectsFromArray:", v89);
        v56 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        v57 = objc_claimAutoreleasedReturnValue(v56);
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          v58 = -[NSMutableArray count](v55, "count");
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v58;
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "#customcuration,total asset count before location filtering,%lu", buf, 0xCu);
        }

        v59 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoManager _getPhotosByAssetProperties:UserLocations:IsLocationCheckMandatory:MinDistance:](self, "_getPhotosByAssetProperties:UserLocations:IsLocationCheckMandatory:MinDistance:", v55, v91, v88, 200.0));
        v60 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        v61 = objc_claimAutoreleasedReturnValue(v60);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          v62 = objc_msgSend(v59, "count");
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v62;
          _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, "#customcuration,total filtered photos count,%lu", buf, 0xCu);
        }

        v63 = objc_opt_new(NSMutableArray);
        v64 = objc_opt_new(NSMutableArray);
        if (objc_msgSend(v59, "count"))
        {
          v110 = 0u;
          v111 = 0u;
          v108 = 0u;
          v109 = 0u;
          v65 = v59;
          v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v108, v122, 16);
          if (v66)
          {
            v67 = *(_QWORD *)v109;
            do
            {
              for (i = 0; i != v66; i = (char *)i + 1)
              {
                if (*(_QWORD *)v109 != v67)
                  objc_enumerationMutation(v65);
                v69 = *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * (_QWORD)i);
                v70 = -[MOPhotoManager _doesAssetHaveSceneProcessing:](self, "_doesAssetHaveSceneProcessing:", v69);
                v71 = v63;
                if ((v70 & 1) == 0)
                {
                  if (-[MOPhotoManager _doesAssetHaveFaceProcessing:](self, "_doesAssetHaveFaceProcessing:", v69))
                    v71 = v63;
                  else
                    v71 = v64;
                }
                -[NSMutableArray addObject:](v71, "addObject:", v69);
              }
              v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v108, v122, 16);
            }
            while (v66);
          }

        }
        v72 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        v73 = objc_claimAutoreleasedReturnValue(v72);
        if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
        {
          v74 = -[NSMutableArray count](v64, "count");
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v74;
          _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_INFO, "#customcuration,total photos which need to request process count,%lu", buf, 0xCu);
        }

        v75 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        v76 = objc_claimAutoreleasedReturnValue(v75);
        if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
        {
          v77 = -[NSMutableArray count](v63, "count");
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v77;
          _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_INFO, "#customcuration,total final assets for bundling count,%lu", buf, 0xCu);
        }

        -[MOPhotoManager _scheduleMediaAnalysisDeferredProcessing:](self, "_scheduleMediaAnalysisDeferredProcessing:", v64);
        if (-[NSMutableArray count](v63, "count"))
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v117 = __Block_byref_object_copy__34;
          v118 = __Block_byref_object_dispose__34;
          v119 = objc_opt_new(NSMutableDictionary);
          v102 = 0;
          v103 = &v102;
          v104 = 0x3032000000;
          v105 = __Block_byref_object_copy__34;
          v106 = __Block_byref_object_dispose__34;
          v107 = objc_opt_new(NSMutableArray);
          v101[0] = _NSConcreteStackBlock;
          v101[1] = 3221225472;
          v101[2] = __109__MOPhotoManager__fetchUnprocessedPhotosBetweenStartDate_EndDate_Locations_IsLocationCheckMandatory_handler___block_invoke;
          v101[3] = &unk_1002B5218;
          v101[4] = buf;
          v101[5] = &v102;
          -[MOPhotoManager _buildCuratedAssetMap:handler:](self, "_buildCuratedAssetMap:handler:", v63, v101);
          v78 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "copy");
          v79 = objc_msgSend((id)v103[5], "copy");
          (*((void (**)(id, id, id, _QWORD))v94 + 2))(v94, v78, v79, 0);

          _Block_object_dispose(&v102, 8);
          _Block_object_dispose(buf, 8);

        }
        else
        {
          v120 = NSLocalizedDescriptionKey;
          v121 = CFSTR("#customcuration,no filtered curated photos inside the time range");
          v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v121, &v120, 1));
          v84 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 5, v83));

          v85 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          v86 = objc_claimAutoreleasedReturnValue(v85);
          if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v95;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v96;
            *(_WORD *)&buf[22] = 2112;
            v117 = v84;
            _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_INFO, "#customcuration,no photo assets to bundle after filtering, start date, %@, end date, %@, error, %@", buf, 0x20u);
          }

          (*((void (**)(id, _QWORD, _QWORD, uint64_t (*)(uint64_t, uint64_t)))v94 + 2))(v94, 0, 0, v84);
        }

        goto LABEL_77;
      }
    }
  }
  v124 = NSLocalizedDescriptionKey;
  v125 = CFSTR("#customcuration,no unprocessed photos inside the time range");
  v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v125, &v124, 1));
  v100 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 5, v80));

  v81 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v82 = objc_claimAutoreleasedReturnValue(v81);
  if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v95;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v96;
    *(_WORD *)&buf[22] = 2112;
    v117 = (uint64_t (*)(uint64_t, uint64_t))v100;
    _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_INFO, "#customcuration,fetchUnprocessedPhotosBetweenStartDate, start date, %@, end date, %@, error, %@", buf, 0x20u);
  }

  (*((void (**)(id, _QWORD, _QWORD, NSMutableArray *))v94 + 2))(v94, 0, 0, v100);
LABEL_77:

}

void __109__MOPhotoManager__fetchUnprocessedPhotosBetweenStartDate_EndDate_Locations_IsLocationCheckMandatory_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (void)_buildCuratedAssetMap:(id)a3 handler:(id)a4
{
  id v5;
  id os_log;
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *j;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  NSObject *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *k;
  void *v45;
  double v46;
  void *v47;
  id v48;
  NSObject *v49;
  void *v50;
  void *v51;
  double v52;
  void *v53;
  id v54;
  NSObject *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  float v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  id v65;
  id v66;
  id v67;
  uint64_t v68;
  void *m;
  void *v70;
  id v71;
  NSObject *v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  id v77;
  uint64_t v78;
  void *n;
  void *v80;
  id v81;
  NSObject *v82;
  void *v83;
  void *v84;
  id v85;
  id v86;
  id v87;
  void *v88;
  void (**v89)(id, id, id);
  void *v90;
  id v91;
  void *v92;
  id v94;
  id v95;
  id obj;
  id obja;
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
  id v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  _BYTE v119[128];
  uint8_t v120[128];
  uint8_t buf[4];
  id v122;
  __int16 v123;
  void *v124;
  __int16 v125;
  double v126;
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];

  v5 = a3;
  v89 = (void (**)(id, id, id))a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "#assetscore, buildCuratedAssetMap", buf, 2u);
  }

  v91 = objc_alloc_init((Class)NSMutableDictionary);
  v94 = objc_alloc_init((Class)NSMutableArray);
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v129, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v116;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v116 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * (_QWORD)i);
        v13 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid"));
          objc_msgSend(v12, "curationScore");
          *(_DWORD *)buf = 138412546;
          v122 = v15;
          v123 = 2048;
          v124 = v16;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "#assetscore, asset, %@, score, %f", buf, 0x16u);

        }
        objc_msgSend(v12, "curationScore");
        if (v17 <= 2.22044605e-16)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid"));
          objc_msgSend(v94, "addObject:", v18);

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v129, 16);
    }
    while (v9);
  }

  v19 = objc_alloc_init((Class)NSDictionary);
  v20 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = objc_msgSend(v94, "count");
    *(_DWORD *)buf = 134217984;
    v122 = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "#assetscore, assetUUID count, %lu", buf, 0xCu);
  }

  v23 = objc_msgSend(v94, "count");
  v24 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v25 = objc_claimAutoreleasedReturnValue(v24);
  v26 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
  v27 = v91;
  if (v23)
  {
    if (v26)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "#assetscore, assetUUIDs to request on demand score", buf, 2u);
    }

    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    v28 = v94;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v111, v128, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v112;
      do
      {
        for (j = 0; j != v30; j = (char *)j + 1)
        {
          if (*(_QWORD *)v112 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * (_QWORD)j);
          v34 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          v35 = objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v122 = v33;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "#assetscore, assetUUID, %@", buf, 0xCu);
          }

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v111, v128, 16);
      }
      while (v30);
    }

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary photoAnalysisClient](self->_photoLibrary, "photoAnalysisClient"));
    v110 = 0;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "requestCurationScoreByAssetUUIDForAssetUUIDs:error:", v28, &v110));
    v38 = v110;

    v39 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v40 = objc_claimAutoreleasedReturnValue(v39);
    v25 = v40;
    if (v38)
    {
      v27 = v91;
      v87 = v38;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        -[MOPhotoManager _buildCuratedAssetMap:handler:].cold.1();
    }
    else
    {
      v27 = v91;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "#assetscore, requestCurationScoreByAssetUUIDForAssetUUIDs, successful", buf, 2u);
      }
      v87 = 0;
    }
  }
  else
  {
    if (v26)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "#assetscore, no need to invoke requestCurationScoreByAssetUUIDForAssetUUIDs SPI", buf, 2u);
    }
    v87 = 0;
    v37 = v19;
  }

  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v95 = obj;
  v41 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v106, v127, 16);
  obja = v37;
  if (v41)
  {
    v42 = v41;
    v43 = *(_QWORD *)v107;
    do
    {
      for (k = 0; k != v42; k = (char *)k + 1)
      {
        if (*(_QWORD *)v107 != v43)
          objc_enumerationMutation(v95);
        v45 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * (_QWORD)k);
        objc_msgSend(v45, "curationScore", v87);
        if (v46 <= 2.22044605e-16)
        {
          if (v37)
          {
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "uuid"));
            v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", v53));

            v54 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
            v55 = objc_claimAutoreleasedReturnValue(v54);
            v56 = v55;
            if (v49)
            {
              if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
              {
                v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "uuid"));
                v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "localIdentifier"));
                -[NSObject floatValue](v49, "floatValue");
                *(_DWORD *)buf = 138412802;
                v122 = v57;
                v123 = 2112;
                v124 = v58;
                v125 = 2048;
                v126 = v59;
                _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "#assetscore, onDemandCurationScore for asset with uuid %@ and localIdentifier %@ is %f", buf, 0x20u);

                v27 = v91;
              }

              objc_msgSend(v27, "setObject:forKey:", v49, v45);
            }
            else
            {
              if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
              {
                v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "uuid"));
                v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "localIdentifier"));
                *(_DWORD *)buf = 138412546;
                v122 = v61;
                v123 = 2112;
                v124 = v62;
                _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "#assetscore, buildCuratedAssetMap, invalid score recieved for asset with uuid %@ and localIdentifier %@", buf, 0x16u);

              }
            }
            v37 = obja;
          }
          else
          {
            v60 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
            v49 = objc_claimAutoreleasedReturnValue(v60);
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "#assetscore, curationScoreByAssetUUID is nil", buf, 2u);
            }
          }
        }
        else
        {
          objc_msgSend(v45, "curationScore");
          v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          objc_msgSend(v27, "setObject:forKey:", v47, v45);

          v48 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          v49 = objc_claimAutoreleasedReturnValue(v48);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "uuid"));
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "localIdentifier"));
            objc_msgSend(v45, "curationScore");
            *(_DWORD *)buf = 138412802;
            v122 = v50;
            v123 = 2112;
            v124 = v51;
            v125 = 2048;
            v126 = v52;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "#assetscore, persistedCurationScore for asset with uuid %@ and localIdentifier %@ is %f", buf, 0x20u);

            v37 = obja;
          }
        }

      }
      v42 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v106, v127, 16);
    }
    while (v42);
  }

  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "keysSortedByValueUsingComparator:", &__block_literal_global_43));
  if ((unint64_t)objc_msgSend(v63, "count") <= 0xD)
    v64 = (uint64_t)objc_msgSend(v63, "count");
  else
    v64 = 13;
  v92 = v63;
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "subarrayWithRange:", 0, v64, v87));
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v65 = v27;
  v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v102, v120, 16);
  if (v66)
  {
    v67 = v66;
    v68 = *(_QWORD *)v103;
    do
    {
      for (m = 0; m != v67; m = (char *)m + 1)
      {
        if (*(_QWORD *)v103 != v68)
          objc_enumerationMutation(v65);
        v70 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * (_QWORD)m);
        v71 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        v72 = objc_claimAutoreleasedReturnValue(v71);
        if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
        {
          v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "localIdentifier"));
          v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "objectForKey:", v70));
          *(_DWORD *)buf = 138412546;
          v122 = v73;
          v123 = 2112;
          v124 = v74;
          _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, "#assetscore, buildCuratedAssetMap, assetsInfo, asset.localIdentifier=%@ score=%@", buf, 0x16u);

        }
      }
      v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v102, v120, 16);
    }
    while (v67);
  }

  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  v75 = v90;
  v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v98, v119, 16);
  if (v76)
  {
    v77 = v76;
    v78 = *(_QWORD *)v99;
    do
    {
      for (n = 0; n != v77; n = (char *)n + 1)
      {
        if (*(_QWORD *)v99 != v78)
          objc_enumerationMutation(v75);
        v80 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * (_QWORD)n);
        v81 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        v82 = objc_claimAutoreleasedReturnValue(v81);
        if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
        {
          v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "localIdentifier"));
          v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "uuid"));
          *(_DWORD *)buf = 138412546;
          v122 = v83;
          v123 = 2112;
          v124 = v84;
          _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_INFO, "#assetscore, buildCuratedAssetMap, sortedKeysSubArray, asset.localIdentifier=%@, asset.uuid=%@", buf, 0x16u);

        }
      }
      v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v98, v119, 16);
    }
    while (v77);
  }

  v85 = objc_msgSend(v65, "copy");
  v86 = objc_msgSend(v75, "copy");
  v89[2](v89, v85, v86);

}

int64_t __48__MOPhotoManager__buildCuratedAssetMap_handler___block_invoke(id a1, NSNumber *a2, NSNumber *a3)
{
  return -[NSNumber compare:](a3, "compare:", a2);
}

- (void)_scheduleMediaAnalysisDeferredProcessing:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  unsigned int v14;
  NSMutableArray *v15;
  unsigned int v16;
  unsigned __int8 v17;
  void *v18;
  void *v19;
  id v20;
  unsigned int v21;
  id v22;
  id os_log;
  NSObject *v24;
  id v25;
  NSMutableArray *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *j;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  id v37;
  id v38;
  NSObject *v39;
  id v40;
  NSMutableArray *v41;
  id v42;
  id v43;
  uint64_t v44;
  void *k;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  unsigned int v51;
  id v52;
  id v53;
  NSObject *v54;
  id v55;
  NSMutableArray *v56;
  id v57;
  id v58;
  uint64_t v59;
  void *m;
  void *v61;
  id v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSMutableArray *v71;
  void *v72;
  id v73;
  NSMutableArray *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint8_t v96[128];
  uint8_t buf[4];
  id v98;
  __int16 v99;
  unsigned int v100;
  __int16 v101;
  id v102;
  _BYTE v103[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  v6 = objc_opt_new(NSMutableArray);
  v7 = objc_opt_new(NSMutableArray);
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v90, v103, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v91;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v91 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * (_QWORD)i);
        if (-[MOPhotoManager _doesAssetHaveSceneProcessing:](self, "_doesAssetHaveSceneProcessing:", v13)
          || (v14 = -[MOPhotoManager _doesAssetHaveFaceProcessing:](self, "_doesAssetHaveFaceProcessing:", v13),
              v15 = v7,
              v14))
        {
          v16 = -[MOPhotoManager _doesAssetHaveSceneProcessing:](self, "_doesAssetHaveSceneProcessing:", v13);
          v15 = v5;
          if (v16)
          {
            v17 = -[MOPhotoManager _doesAssetHaveFaceProcessing:](self, "_doesAssetHaveFaceProcessing:", v13);
            v15 = v6;
            if ((v17 & 1) != 0)
              continue;
          }
        }
        -[NSMutableArray addObject:](v15, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v90, v103, 16);
    }
    while (v10);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMediaAnalysisService analysisService](VCPMediaAnalysisService, "analysisService"));
  v73 = v8;
  v74 = v6;
  v72 = v18;
  v71 = v5;
  if (-[NSMutableArray count](v7, "count"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[VCPMediaAnalysisService defaultDeferredProcessingTypes](VCPMediaAnalysisService, "defaultDeferredProcessingTypes"));
    v20 = objc_msgSend(v19, "mutableCopy");

    v89 = 0;
    v68 = v20;
    v21 = objc_msgSend(v18, "requestDeferredProcessingTypes:assets:error:", v20, v7, &v89);
    v22 = v89;
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v24 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = -[NSMutableArray count](v7, "count");
      *(_DWORD *)buf = 134218498;
      v98 = v25;
      v99 = 1024;
      v100 = v21;
      v101 = 2112;
      v102 = v22;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "#MADRequest, sceneAndFaceAnalysisPending count, %ld, result, %d, error, %@", buf, 0x1Cu);
    }
    v65 = v22;

    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v26 = v7;
    v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v86;
      do
      {
        for (j = 0; j != v28; j = (char *)j + 1)
        {
          if (*(_QWORD *)v86 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)j);
          v32 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          v33 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localIdentifier"));
            *(_DWORD *)buf = 138412290;
            v98 = v34;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "#MADRequest, sceneAndFaceAnalysisPending, asset, %@", buf, 0xCu);

          }
        }
        v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v85, v96, 16);
      }
      while (v28);
    }

    v8 = v73;
    v6 = v74;
    v18 = v72;
    v5 = v71;
  }
  if (-[NSMutableArray count](v5, "count"))
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
    objc_msgSend(v35, "addIndex:", MADDeferredProcessingTypeScene);
    v84 = 0;
    v69 = v35;
    v36 = objc_msgSend(v18, "requestDeferredProcessingTypes:assets:error:", v35, v5, &v84);
    v37 = v84;
    v38 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      v40 = -[NSMutableArray count](v5, "count");
      *(_DWORD *)buf = 134218498;
      v98 = v40;
      v99 = 1024;
      v100 = v36;
      v101 = 2112;
      v102 = v37;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "#MADRequest, sceneAnalysisPending count, %ld, result, %d, error, %@", buf, 0x1Cu);
    }
    v66 = v37;

    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v41 = v5;
    v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v81;
      do
      {
        for (k = 0; k != v43; k = (char *)k + 1)
        {
          if (*(_QWORD *)v81 != v44)
            objc_enumerationMutation(v41);
          v46 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)k);
          v47 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          v48 = objc_claimAutoreleasedReturnValue(v47);
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "localIdentifier"));
            *(_DWORD *)buf = 138412290;
            v98 = v49;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "#MADRequest, sceneAnalysisPending, asset, %@", buf, 0xCu);

          }
        }
        v43 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v80, v95, 16);
      }
      while (v43);
    }

    v8 = v73;
    v6 = v74;
    v18 = v72;
    v5 = v71;
  }
  if (-[NSMutableArray count](v6, "count"))
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
    objc_msgSend(v50, "addIndex:", MADDeferredProcessingTypeQuickFaceIdentification);
    v79 = 0;
    v70 = v50;
    v51 = objc_msgSend(v18, "requestDeferredProcessingTypes:assets:error:", v50, v6, &v79);
    v52 = v79;
    v53 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v54 = objc_claimAutoreleasedReturnValue(v53);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      v55 = -[NSMutableArray count](v6, "count");
      *(_DWORD *)buf = 134218498;
      v98 = v55;
      v99 = 1024;
      v100 = v51;
      v101 = 2112;
      v102 = v52;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_INFO, "#MADRequest, faceAnalysisPending count, %ld, result, %d, error, %@", buf, 0x1Cu);
    }
    v67 = v52;

    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v56 = v6;
    v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v75, v94, 16);
    if (v57)
    {
      v58 = v57;
      v59 = *(_QWORD *)v76;
      do
      {
        for (m = 0; m != v58; m = (char *)m + 1)
        {
          if (*(_QWORD *)v76 != v59)
            objc_enumerationMutation(v56);
          v61 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)m);
          v62 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          v63 = objc_claimAutoreleasedReturnValue(v62);
          if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
          {
            v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "localIdentifier"));
            *(_DWORD *)buf = 138412290;
            v98 = v64;
            _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "#MADRequest, faceAnalysisPending, asset, %@", buf, 0xCu);

          }
        }
        v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v75, v94, 16);
      }
      while (v58);
    }

    v8 = v73;
    v6 = v74;
    v18 = v72;
    v5 = v71;
  }

}

- (BOOL)_doesAssetHaveSceneProcessing:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "sceneAnalysisProperties"));
  v5 = objc_msgSend(v4, "sceneAnalysisVersion");
  if (VCPPhotosSceneProcessingVersion == v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sceneAnalysisTimestamp"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "adjustmentVersion"));
    v8 = objc_msgSend(v6, "isEqualToDate:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_doesAssetHaveFaceProcessing:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "faceAdjustmentVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset quickClassificationFaceAdjustmentVersion](PHAsset, "quickClassificationFaceAdjustmentVersion"));
  if ((objc_msgSend(v4, "isEqualToDate:", v5) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "faceAdjustmentVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "adjustmentVersion"));
    v6 = objc_msgSend(v7, "isEqualToDate:", v8);

  }
  return v6;
}

- (id)_calculateDistanceBetweenUserLocation:(id)a3 PhotoLocation:(id)a4
{
  void *v4;

  v4 = 0;
  if (a3 && a4)
  {
    objc_msgSend(a3, "distanceFromLocation:", a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  }
  return v4;
}

- (id)_getPhotosByAssetProperties:(id)a3 UserLocations:(id)a4 IsLocationCheckMandatory:(BOOL)a5 MinDistance:(double)a6
{
  _BOOL4 v7;
  id v9;
  id os_log;
  NSObject *v11;
  NSMutableArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  NSObject *v29;
  const char *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  _BOOL4 v39;
  NSObject *v40;
  NSMutableArray *v41;
  double v42;
  void *j;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  NSObject *v55;
  MOPhotoManager *v56;
  uint64_t v57;
  void *k;
  void *v59;
  id v60;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  const char *v64;
  uint32_t v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  void *v71;
  double v72;
  double v73;
  id v74;
  double v75;
  double v76;
  id v77;
  NSObject *v78;
  NSObject *v79;
  double v80;
  double v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  double v97;
  id v98;
  NSObject *v99;
  uint64_t v100;
  id v101;
  NSObject *v102;
  NSObject *v103;
  uint64_t v104;
  id v105;
  NSObject *v106;
  NSMutableArray *v107;
  id v108;
  id v109;
  uint64_t v110;
  void *m;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  id v116;
  id v117;
  NSObject *v118;
  NSObject *v119;
  NSMutableArray *v120;
  id v121;
  id v122;
  uint64_t v123;
  void *n;
  void *v125;
  id v126;
  NSObject *v127;
  NSObject *v128;
  NSMutableArray *v129;
  id v130;
  id v131;
  uint64_t v132;
  void *ii;
  void *v134;
  id v135;
  NSObject *v136;
  NSObject *v137;
  BOOL v139;
  NSMutableArray *v140;
  NSObject *log;
  id obj;
  NSMutableArray *v143;
  uint64_t v144;
  id v145;
  id v146;
  void *v147;
  NSMutableArray *v148;
  NSMutableArray *v149;
  NSMutableArray *v150;
  NSObject *v151;
  uint64_t v152;
  id v154;
  id v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  _BYTE v180[128];
  _BYTE v181[128];
  uint8_t v182[128];
  uint8_t buf[4];
  NSObject *v184;
  __int16 v185;
  _BYTE v186[18];
  __int16 v187;
  id v188;
  __int16 v189;
  id v190;
  __int16 v191;
  uint64_t v192;
  __int16 v193;
  uint64_t v194;
  __int16 v195;
  uint64_t v196;
  __int16 v197;
  double v198;
  _BYTE v199[128];
  _BYTE v200[128];
  _BYTE v201[128];

  v7 = a5;
  v9 = a3;
  v146 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218496;
    v184 = objc_msgSend(v146, "count");
    v185 = 1024;
    *(_DWORD *)v186 = v7;
    *(_WORD *)&v186[4] = 2048;
    *(double *)&v186[6] = a6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "#assetfilter, user location count, %lu, isLocationCheckMandatory, %d, minDistance, %f", buf, 0x1Cu);
  }
  v139 = v7;

  v140 = objc_opt_new(NSMutableArray);
  v12 = objc_opt_new(NSMutableArray);
  v149 = objc_opt_new(NSMutableArray);
  v143 = objc_opt_new(NSMutableArray);
  v148 = objc_opt_new(NSMutableArray);
  v176 = 0u;
  v177 = 0u;
  v178 = 0u;
  v179 = 0u;
  obj = v9;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v176, v201, 16);
  v150 = v12;
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v177;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v177 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v176 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v17, "mediaType") != (id)3
          && (objc_msgSend(v17, "mediaSubtypes") & 4) == 0
          && (objc_msgSend(v17, "mediaSubtypes") & 0x80000) == 0
          && (objc_msgSend(v17, "mediaSubtypes") & 0x20000) == 0)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "importProperties"));
          if (objc_msgSend(v18, "importedBy") == (id)2)
            goto LABEL_17;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "importProperties"));
          if (objc_msgSend(v19, "importedBy") == (id)1)
            goto LABEL_16;
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "importProperties"));
          if (objc_msgSend(v20, "importedBy") == (id)8)
          {

            v12 = v150;
LABEL_16:

LABEL_17:
LABEL_18:
            -[NSMutableArray addObject:](v140, "addObject:", v17);
            v21 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
            v22 = objc_claimAutoreleasedReturnValue(v21);
            if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              goto LABEL_24;
            v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localIdentifier"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "creationDate"));
            v25 = objc_msgSend(v17, "mediaType");
            v26 = objc_msgSend(v17, "mediaSubtypes");
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "importProperties"));
            v28 = objc_msgSend(v27, "importedBy");
            *(_DWORD *)buf = 138413314;
            v184 = v23;
            v185 = 2112;
            *(_QWORD *)v186 = v24;
            *(_WORD *)&v186[8] = 2048;
            *(_QWORD *)&v186[10] = v25;
            v12 = v150;
            v187 = 2048;
            v188 = v26;
            v189 = 2048;
            v190 = v28;
            v29 = v22;
            v30 = "#assetfilter, Accepted curated asset by properties, localIdentifier, %@, creationDate, %@, mediaType, "
                  "%lu, mediaSubtypes, %lu, importProperties.importedBy, %lu";
            goto LABEL_23;
          }
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "importProperties"));
          v32 = objc_msgSend(v31, "importedBy");

          v12 = v150;
          if (v32 == (id)12)
            goto LABEL_18;
        }
        v33 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        v22 = objc_claimAutoreleasedReturnValue(v33);
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          goto LABEL_24;
        v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localIdentifier"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "creationDate"));
        v34 = objc_msgSend(v17, "mediaType");
        v35 = objc_msgSend(v17, "mediaSubtypes");
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "importProperties"));
        v36 = objc_msgSend(v27, "importedBy");
        *(_DWORD *)buf = 138413314;
        v184 = v23;
        v185 = 2112;
        *(_QWORD *)v186 = v24;
        *(_WORD *)&v186[8] = 2048;
        *(_QWORD *)&v186[10] = v34;
        v12 = v150;
        v187 = 2048;
        v188 = v35;
        v189 = 2048;
        v190 = v36;
        v29 = v22;
        v30 = "#assetfilter, Denied curated asset by properties, localIdentifier, %@, creationDate, %@, mediaType, %lu, m"
              "ediaSubtypes, %lu, importProperties.importedBy, %lu";
LABEL_23:
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, v30, buf, 0x34u);

LABEL_24:
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v176, v201, 16);
    }
    while (v14);
  }

  v37 = objc_msgSend(v146, "count");
  v38 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  log = objc_claimAutoreleasedReturnValue(v38);
  v39 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
  if (v37)
  {
    if (v39)
    {
      v40 = objc_msgSend(v146, "count");
      *(_DWORD *)buf = 134217984;
      v184 = v40;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "#assetfilter, User location(s) available for checking, count, %lu", buf, 0xCu);
    }

    v174 = 0u;
    v175 = 0u;
    v172 = 0u;
    v173 = 0u;
    log = v140;
    v41 = v143;
    v145 = -[NSObject countByEnumeratingWithState:objects:count:](log, "countByEnumeratingWithState:objects:count:", &v172, v200, 16);
    if (v145)
    {
      v144 = *(_QWORD *)v173;
      v42 = 1000.0;
      do
      {
        for (j = 0; j != v145; j = (char *)j + 1)
        {
          if (*(_QWORD *)v173 != v144)
            objc_enumerationMutation(log);
          v44 = *(void **)(*((_QWORD *)&v172 + 1) + 8 * (_QWORD)j);
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "location"));

          if (v45)
          {
            v147 = j;
            v46 = objc_alloc((Class)RTLocation);
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "location"));
            objc_msgSend(v47, "coordinate");
            v49 = v48;
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "location"));
            objc_msgSend(v50, "coordinate");
            v52 = v51;
            v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "location"));
            objc_msgSend(v53, "horizontalAccuracy");
            v55 = objc_msgSend(v46, "initWithLatitude:longitude:horizontalUncertainty:date:", 0, v49, v52, v54);

            v170 = 0u;
            v171 = 0u;
            v168 = 0u;
            v169 = 0u;
            v154 = v146;
            v56 = self;
            v155 = objc_msgSend(v154, "countByEnumeratingWithState:objects:count:", &v168, v199, 16);
            if (!v155)
              goto LABEL_66;
            v57 = *(_QWORD *)v169;
            v152 = *(_QWORD *)v169;
            while (1)
            {
              for (k = 0; k != v155; k = (char *)k + 1)
              {
                if (*(_QWORD *)v169 != v57)
                  objc_enumerationMutation(v154);
                v59 = *(void **)(*((_QWORD *)&v168 + 1) + 8 * (_QWORD)k);
                if (-[NSMutableArray containsObject:](v12, "containsObject:", v44))
                {
                  v60 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
                  v61 = objc_claimAutoreleasedReturnValue(v60);
                  if (!os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
                    goto LABEL_64;
                  v62 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "localIdentifier"));
                  *(_DWORD *)buf = 138412290;
                  v184 = v62;
                  v63 = v61;
                  v64 = "#assetfilter, Photo asset, %@, has already passed location check";
                  v65 = 12;
LABEL_50:
                  _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, v64, buf, v65);
                  goto LABEL_51;
                }
                v61 = objc_claimAutoreleasedReturnValue(-[MOPhotoManager _calculateDistanceBetweenUserLocation:PhotoLocation:](v56, "_calculateDistanceBetweenUserLocation:PhotoLocation:", v59, v55));
                if (!v61)
                {
                  v74 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
                  v62 = objc_claimAutoreleasedReturnValue(v74);
                  if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    v63 = v62;
                    v64 = "#assetfilter, Photo asset, distanceInMeters is nil";
                    v65 = 2;
                    goto LABEL_50;
                  }
LABEL_51:

                  goto LABEL_64;
                }
                objc_msgSend(v59, "horizontalUncertainty");
                v67 = a6;
                if (v66 + v66 > a6)
                {
                  objc_msgSend(v59, "horizontalUncertainty");
                  v67 = v68 + v68;
                }
                v69 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoManager configurationManager](v56, "configurationManager"));
                objc_msgSend(v69, "getDoubleSettingForKey:withFallback:", CFSTR("Photos_DistanceFromDefaultMaxThreshold"), v42);
                if (v67 < v70)
                {
                  objc_msgSend(v59, "horizontalUncertainty");
                  v73 = a6;
                  if (v75 + v75 > a6)
                  {
                    objc_msgSend(v59, "horizontalUncertainty");
                    v73 = v76 + v76;
                  }
                }
                else
                {
                  v71 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoManager configurationManager](v56, "configurationManager"));
                  objc_msgSend(v71, "getDoubleSettingForKey:withFallback:", CFSTR("Photos_DistanceFromDefaultMaxThreshold"), v42);
                  v73 = v72;

                }
                v77 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
                v78 = objc_claimAutoreleasedReturnValue(v77);
                if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v59, "latitude");
                  v151 = v79;
                  objc_msgSend(v59, "longitude");
                  v80 = a6;
                  v81 = v42;
                  v83 = v82;
                  objc_msgSend(v59, "horizontalUncertainty");
                  v85 = v84;
                  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "localIdentifier"));
                  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "location"));
                  objc_msgSend(v87, "coordinate");
                  v89 = v88;
                  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "location"));
                  objc_msgSend(v90, "coordinate");
                  v92 = v91;
                  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "location"));
                  objc_msgSend(v93, "horizontalAccuracy");
                  v95 = v94;
                  -[NSObject doubleValue](v61, "doubleValue");
                  *(_DWORD *)buf = 134220034;
                  v184 = v151;
                  v185 = 2048;
                  *(_QWORD *)v186 = v83;
                  v42 = v81;
                  a6 = v80;
                  *(_WORD *)&v186[8] = 2048;
                  *(_QWORD *)&v186[10] = v85;
                  v187 = 2112;
                  v188 = v86;
                  v189 = 2048;
                  v190 = v89;
                  v191 = 2048;
                  v192 = v92;
                  v193 = 2048;
                  v194 = v95;
                  v195 = 2048;
                  v196 = v96;
                  v197 = 2048;
                  v198 = v73;
                  _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, "#assetfilter, userLocation, lat, %f, lon, %f, horizontalUncertainty, %f, Photo asset, %@, lat %f, lon, %f, horizontalAccuracy, %f, distanceInMeters, %f, distanceThreshold, %f", buf, 0x5Cu);

                  v56 = self;
                  v12 = v150;

                }
                -[NSObject doubleValue](v61, "doubleValue");
                v57 = v152;
                if (v97 < v73)
                {
                  if ((-[NSMutableArray containsObject:](v12, "containsObject:", v44) & 1) == 0)
                    -[NSMutableArray addObject:](v12, "addObject:", v44);
                  v98 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
                  v62 = objc_claimAutoreleasedReturnValue(v98);
                  if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
                  {
                    v99 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "localIdentifier"));
                    -[NSObject doubleValue](v61, "doubleValue");
                    *(_DWORD *)buf = 138412802;
                    v184 = v99;
                    v185 = 2048;
                    *(_QWORD *)v186 = v100;
                    *(_WORD *)&v186[8] = 2048;
                    *(double *)&v186[10] = v73;
                    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "#assetfilter, Adding photo asset, %@, since distanceInMeters, %f is cleared, distanceThreshold, %f", buf, 0x20u);

                    v56 = self;
                  }
                  goto LABEL_51;
                }
                v101 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
                v102 = objc_claimAutoreleasedReturnValue(v101);
                if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
                {
                  v103 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "localIdentifier"));
                  -[NSObject doubleValue](v61, "doubleValue");
                  *(_DWORD *)buf = 138412802;
                  v184 = v103;
                  v185 = 2048;
                  *(_QWORD *)v186 = v104;
                  *(_WORD *)&v186[8] = 2048;
                  *(double *)&v186[10] = v73;
                  _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_INFO, "#assetfilter, Photo asset, %@, not added since distanceInMeters, %f is out of range, distanceThreshold, %f", buf, 0x20u);

                  v56 = self;
                }

                -[NSMutableArray addObject:](v149, "addObject:", v44);
LABEL_64:

              }
              v155 = objc_msgSend(v154, "countByEnumeratingWithState:objects:count:", &v168, v199, 16);
              if (!v155)
              {
LABEL_66:

                v41 = v143;
                j = v147;
                goto LABEL_69;
              }
            }
          }
          v105 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          v55 = objc_claimAutoreleasedReturnValue(v105);
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            v106 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "localIdentifier"));
            *(_DWORD *)buf = 138412290;
            v184 = v106;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "#assetfilter, Filtering out, %@, location object is nil", buf, 0xCu);

          }
LABEL_69:

        }
        v145 = -[NSObject countByEnumeratingWithState:objects:count:](log, "countByEnumeratingWithState:objects:count:", &v172, v200, 16);
      }
      while (v145);
    }
  }
  else
  {
    if (v39)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "#assetfilter, No user location available for checking", buf, 2u);
    }
    v41 = v143;
  }

  if (v139)
    goto LABEL_93;
  v166 = 0u;
  v167 = 0u;
  v164 = 0u;
  v165 = 0u;
  v107 = v140;
  v108 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v107, "countByEnumeratingWithState:objects:count:", &v164, v182, 16);
  if (!v108)
    goto LABEL_92;
  v109 = v108;
  v110 = *(_QWORD *)v165;
  do
  {
    for (m = 0; m != v109; m = (char *)m + 1)
    {
      if (*(_QWORD *)v165 != v110)
        objc_enumerationMutation(v107);
      v112 = *(void **)(*((_QWORD *)&v164 + 1) + 8 * (_QWORD)m);
      v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "location"));
      if (v113 && objc_msgSend(v146, "count"))
      {

        continue;
      }
      v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "importProperties"));
      if (objc_msgSend(v114, "importedBy") == (id)2)
      {

      }
      else
      {
        v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "importProperties"));
        v116 = objc_msgSend(v115, "importedBy");

        v12 = v150;
        if (v116 != (id)1)
          continue;
      }
      v117 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      v118 = objc_claimAutoreleasedReturnValue(v117);
      if (os_log_type_enabled(v118, OS_LOG_TYPE_INFO))
      {
        v119 = objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "localIdentifier"));
        *(_DWORD *)buf = 138412290;
        v184 = v119;
        _os_log_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_INFO, "#assetfilter, Photo asset, %@, adding photo as fallback", buf, 0xCu);

      }
      -[NSMutableArray addObject:](v143, "addObject:", v112);
    }
    v109 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v107, "countByEnumeratingWithState:objects:count:", &v164, v182, 16);
  }
  while (v109);
LABEL_92:

  v41 = v143;
LABEL_93:
  if (-[NSMutableArray count](v12, "count"))
  {
    v162 = 0u;
    v163 = 0u;
    v160 = 0u;
    v161 = 0u;
    v120 = v12;
    v121 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v120, "countByEnumeratingWithState:objects:count:", &v160, v181, 16);
    if (v121)
    {
      v122 = v121;
      v123 = *(_QWORD *)v161;
      do
      {
        for (n = 0; n != v122; n = (char *)n + 1)
        {
          if (*(_QWORD *)v161 != v123)
            objc_enumerationMutation(v120);
          v125 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * (_QWORD)n);
          v126 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          v127 = objc_claimAutoreleasedReturnValue(v126);
          if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
          {
            v128 = objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "localIdentifier"));
            *(_DWORD *)buf = 138412290;
            v184 = v128;
            _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_INFO, "#assetfilter, filteredInAsset, %@", buf, 0xCu);

          }
          -[NSMutableArray addObject:](v148, "addObject:", v125);
        }
        v122 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v120, "countByEnumeratingWithState:objects:count:", &v160, v181, 16);
      }
      while (v122);
    }

    v12 = v150;
    v41 = v143;
  }
  if (-[NSMutableArray count](v41, "count"))
  {
    v158 = 0u;
    v159 = 0u;
    v156 = 0u;
    v157 = 0u;
    v129 = v41;
    v130 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v129, "countByEnumeratingWithState:objects:count:", &v156, v180, 16);
    if (v130)
    {
      v131 = v130;
      v132 = *(_QWORD *)v157;
      do
      {
        for (ii = 0; ii != v131; ii = (char *)ii + 1)
        {
          if (*(_QWORD *)v157 != v132)
            objc_enumerationMutation(v129);
          v134 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * (_QWORD)ii);
          if ((-[NSMutableArray containsObject:](v148, "containsObject:", v134) & 1) == 0)
          {
            v135 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
            v136 = objc_claimAutoreleasedReturnValue(v135);
            if (os_log_type_enabled(v136, OS_LOG_TYPE_INFO))
            {
              v137 = objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "localIdentifier"));
              *(_DWORD *)buf = 138412290;
              v184 = v137;
              _os_log_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_INFO, "#assetfilter, fallbackResult, %@", buf, 0xCu);

            }
            -[NSMutableArray addObject:](v148, "addObject:", v134);
          }
        }
        v131 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v129, "countByEnumeratingWithState:objects:count:", &v156, v180, 16);
      }
      while (v131);
    }

    v12 = v150;
    v41 = v143;
  }

  return v148;
}

- (void)_fetchSharedPhotosBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  NSMutableArray *v8;
  NSMutableArray *v9;
  void (**v10)(id, _QWORD, NSMutableArray *);
  PHFetchOptions *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id os_log;
  NSObject *v20;
  NSObject *v21;
  NSMutableArray *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *i;
  void *v31;
  id v32;
  NSObject *v33;
  NSMutableArray *v34;
  NSMutableArray *v35;
  void *v36;
  NSMutableArray *v37;
  void *v38;
  void (**v39)(id, _QWORD, NSMutableArray *);
  NSMutableArray *v40;
  NSMutableArray *v41;
  MOPhotoManager *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  NSMutableArray *v49;
  __int16 v50;
  NSMutableArray *v51;
  __int16 v52;
  NSMutableArray *v53;
  NSErrorUserInfoKey v54;
  const __CFString *v55;
  _QWORD v56[2];

  v8 = (NSMutableArray *)a3;
  v9 = (NSMutableArray *)a4;
  v10 = (void (**)(id, _QWORD, NSMutableArray *))a5;
  v11 = objc_opt_new(PHFetchOptions);
  v42 = self;
  -[PHFetchOptions setPhotoLibrary:](v11, "setPhotoLibrary:", self->_syndicationPhotoLibrary);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("dateCreated > %@"), v8));
  v56[0] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("additionalAttributes.importedByBundleIdentifier == %@"), CFSTR("com.apple.MobileSMS")));
  v56[1] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v56, 2));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v14));
  -[PHFetchOptions setInternalPredicate:](v11, "setInternalPredicate:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset fetchAssetsWithOptions:](PHAsset, "fetchAssetsWithOptions:", v11));
  v17 = v16;
  if (v16)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fetchError"));

    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v20 = objc_claimAutoreleasedReturnValue(os_log);
    v21 = v20;
    if (v18)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v37 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fetchError"));
        *(_DWORD *)buf = 138412802;
        v49 = v37;
        v50 = 2112;
        v51 = v8;
        v52 = 2112;
        v53 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "fetch shared photos from photo library hit error, %@, start date, %@, end date, %@", buf, 0x20u);

      }
      v22 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fetchError"));
      v10[2](v10, 0, v22);
    }
    else
    {
      v39 = v10;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218498;
        v49 = (NSMutableArray *)objc_msgSend(v17, "countOfAssetCollections");
        v50 = 2112;
        v51 = v8;
        v52 = 2112;
        v53 = v9;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "fetch %lu shared photos from photo library, start date, %@, end date, %@", buf, 0x20u);
      }
      v40 = v9;
      v41 = v8;

      v22 = objc_opt_new(NSMutableArray);
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v38 = v17;
      v26 = v17;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v28; i = (char *)i + 1)
          {
            if (*(_QWORD *)v44 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
            v32 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
            v33 = objc_claimAutoreleasedReturnValue(v32);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              v34 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localIdentifier"));
              v35 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "creationDate"));
              *(_DWORD *)buf = 138412546;
              v49 = v34;
              v50 = 2112;
              v51 = v35;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, ",shared photo assetid, %@, creation date, %@", buf, 0x16u);

            }
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoManager _createEventFromAsset:](v42, "_createEventFromAsset:", v31));
            -[NSMutableArray addObject:](v22, "addObject:", v36);

          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
        }
        while (v28);
      }

      v10 = v39;
      ((void (**)(id, NSMutableArray *, NSMutableArray *))v39)[2](v39, v22, 0);
      v9 = v40;
      v8 = v41;
      v17 = v38;
    }
  }
  else
  {
    v54 = NSLocalizedDescriptionKey;
    v55 = CFSTR("photo fetch result is nil");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1));
    v22 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 5, v23));

    v24 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v49 = v8;
      v50 = 2112;
      v51 = v9;
      v52 = 2112;
      v53 = v22;
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "fetch result is nil from photo library, start date, %@, end date, %@, error, %@", buf, 0x20u);
    }

    ((void (**)(id, void *, NSMutableArray *))v10)[2](v10, &__NSArray0__struct, v22);
  }

}

- (void)_fetchPhotoMemoriesBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, NSMutableArray *);
  void *v11;
  id os_log;
  NSObject *v13;
  PHFetchOptions *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  id v23;
  NSObject *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  void *v30;
  unsigned int v31;
  id v32;
  NSObject *v33;
  void *v34;
  unsigned int v35;
  id v36;
  uint64_t v37;
  void *v38;
  id v39;
  NSMutableArray *v40;
  void *v41;
  void *v42;
  PHFetchOptions *v43;
  void *v44;
  void (**v45)(id, _QWORD, NSMutableArray *);
  id v46;
  id v47;
  unsigned int v48;
  void *v49;
  NSMutableArray *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  _BYTE v58[10];
  _BYTE v59[10];
  __int16 v60;
  unsigned int v61;
  _BYTE v62[128];
  NSErrorUserInfoKey v63;
  const __CFString *v64;
  NSErrorUserInfoKey v65;
  const __CFString *v66;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, NSMutableArray *))a5;
  v11 = objc_autoreleasePoolPush();
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v13 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[MOPhotoManager _fetchPhotoMemoriesBetweenStartDate:EndDate:handler:].cold.3();

  v14 = objc_opt_new(PHFetchOptions);
  -[PHFetchOptions setPhotoLibrary:](v14, "setPhotoLibrary:", self->_photoLibrary);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("featuredState == %ul"), 1));
  -[PHFetchOptions setInternalPredicate:](v14, "setInternalPredicate:", v15);

  -[PHFetchOptions setIncludePendingMemories:](v14, "setIncludePendingMemories:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:](PHAssetCollection, "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v14));
  v17 = v16;
  if (!v16)
  {
    v65 = NSLocalizedDescriptionKey;
    v66 = CFSTR("photo memory fetch result is nil");
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1));
    v50 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 5, v22));

    v23 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v56 = v8;
      v57 = 2112;
      *(_QWORD *)v58 = v9;
      *(_WORD *)&v58[8] = 2112;
      *(_QWORD *)v59 = v50;
      _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "#PhotoMemory,memories fetch result is nil, start date, %@, end date, %@, error, %@", buf, 0x20u);
    }
    goto LABEL_10;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fetchError"));

  v19 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);
  if (v18)
  {
    if (v21)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fetchError"));
      *(_DWORD *)buf = 138412802;
      v56 = v41;
      v57 = 2112;
      *(_QWORD *)v58 = v8;
      *(_WORD *)&v58[8] = 2112;
      *(_QWORD *)v59 = v9;
      _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "#PhotoMemory,fetch memories hit error, %@, start date, %@, end date, %@", buf, 0x20u);

    }
    v50 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fetchError"));
    v10[2](v10, 0, v50);
    goto LABEL_11;
  }
  if (v21)
    -[MOPhotoManager _fetchPhotoMemoriesBetweenStartDate:EndDate:handler:].cold.2(v17, (char *)v20);

  if (!objc_msgSend(v17, "count"))
  {
    v63 = NSLocalizedDescriptionKey;
    v64 = CFSTR("photo memory fetch count is invalid");
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1));
    v50 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 5, v38));

    v39 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v24 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[MOPhotoManager _fetchPhotoMemoriesBetweenStartDate:EndDate:handler:].cold.1();
LABEL_10:

    ((void (**)(id, void *, NSMutableArray *))v10)[2](v10, &__NSArray0__struct, v50);
    goto LABEL_11;
  }
  v43 = v14;
  v44 = v11;
  v45 = v10;
  v46 = v9;
  v47 = v8;
  v50 = objc_opt_new(NSMutableArray);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v42 = v17;
  v25 = v17;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(_QWORD *)v52 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
        v31 = -[MOPhotoManager isCandidateForMemoryEvent:](self, "isCandidateForMemoryEvent:", v30);
        v32 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        v33 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localIdentifier"));
          v48 = objc_msgSend(v30, "pendingState");
          v35 = objc_msgSend(v30, "isFavorite");
          v36 = objc_msgSend(v30, "category");
          *(_DWORD *)buf = 138413314;
          v56 = v49;
          v57 = 1024;
          *(_DWORD *)v58 = v48;
          *(_WORD *)&v58[4] = 1024;
          *(_DWORD *)&v58[6] = v35;
          *(_WORD *)v59 = 2048;
          *(_QWORD *)&v59[2] = v36;
          v60 = 1024;
          v61 = v31;
          _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "#PhotoMemory,memoryInfo,id,%@,pendingState,%hu,isFavorite,%d,category,%lu,isCandidateForMemoryEvent,isSelected,%d", buf, 0x28u);

        }
        if (v31)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoManager _createEventFromPhotoMemory:](self, "_createEventFromPhotoMemory:", v30));
          if (v34)
            -[NSMutableArray addObject:](v50, "addObject:", v34);

        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
    }
    while (v27);
  }

  v8 = v47;
  if ((unint64_t)-[NSMutableArray count](v50, "count") < 4)
  {
    v40 = v50;
    v10 = v45;
    v9 = v46;
    v14 = v43;
    v11 = v44;
  }
  else
  {
    v10 = v45;
    v9 = v46;
    v14 = v43;
    v11 = v44;
    if ((unint64_t)-[NSMutableArray count](v50, "count") <= 3)
      v37 = (uint64_t)-[NSMutableArray count](v50, "count");
    else
      v37 = 3;
    v40 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableArray subarrayWithRange:](v50, "subarrayWithRange:", 0, v37));
  }
  v17 = v42;
  ((void (**)(id, NSMutableArray *, NSMutableArray *))v10)[2](v10, v40, 0);

LABEL_11:
  objc_autoreleasePoolPop(v11);

}

- (BOOL)isCandidateForMemoryEvent:(id)a3
{
  id v4;
  id v5;
  __int128 v6;
  id v7;
  uint64_t v8;
  _UNKNOWN **v9;
  _UNKNOWN **v10;
  void *i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id os_log;
  NSObject *v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  BOOL v26;
  __int128 v28;
  id obj;
  void *v30;
  id v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  _BYTE v47[128];

  v4 = a3;
  if (-[MOPhotoManager isDesirableCategoryOrTrigger:](self, "isDesirableCategoryOrTrigger:", v4))
  {
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(+[PHMemory fetchMomentsBackingMemory:options:](PHMemory, "fetchMomentsBackingMemory:options:", v4, 0));
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
    if (v5)
    {
      v7 = v5;
      v8 = *(_QWORD *)v34;
      v9 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
      v10 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
      *(_QWORD *)&v6 = 138413314;
      v28 = v6;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v8)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9[294], "now", v28));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10[289], "currentCalendar"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localStartDate"));
          v32 = (void *)v13;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "components:fromDate:toDate:options:", 120, v15, v13, 0));

          os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          v18 = objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localIdentifier"));
            v31 = objc_msgSend(v16, "minute");
            v19 = v7;
            v20 = v8;
            v21 = v4;
            v22 = objc_msgSend(v16, "hour");
            v23 = objc_msgSend(v16, "day");
            v24 = objc_msgSend(v16, "month");
            *(_DWORD *)buf = v28;
            v38 = v30;
            v39 = 2048;
            v40 = v31;
            v10 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
            v41 = 2048;
            v42 = v22;
            v4 = v21;
            v8 = v20;
            v7 = v19;
            v43 = 2048;
            v44 = v23;
            v45 = 2048;
            v46 = v24;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "#PhotoMemory,memory,id,%@,Break down: %li min : %li hours : %li days : %li months", buf, 0x34u);

            v9 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
          }

          v25 = objc_msgSend(v16, "day");
          if ((unint64_t)v25 < 0x1C)
          {
            v26 = 1;
            goto LABEL_15;
          }
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
        if (v7)
          continue;
        break;
      }
    }
    v26 = 0;
LABEL_15:

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (BOOL)isDesirableCategoryOrTrigger:(id)a3
{
  id v3;
  char v4;
  id v5;
  char v6;
  BOOL v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *i;
  id v16;
  NSObject *v17;
  id os_log;
  _QWORD v20[5];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  _QWORD v26[2];
  char v27;
  _BYTE v28[128];

  v3 = a3;
  if ((objc_msgSend(v3, "isRejected") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = objc_msgSend(v3, "category");
    v6 = (char)v5;
    v7 = (unint64_t)v5 > 0x18;
    v25 = 0;
    v26[0] = &v25;
    v26[1] = 0x2020000000;
    v27 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "triggerTypes"));
    v4 = v7 | (0xD3FF7Fu >> v6);
    if (!v8
      || (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "triggerTypes")),
          v10 = objc_msgSend(v9, "count") == 0,
          v9,
          v8,
          v10))
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      v11 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[MOPhotoManager isDesirableCategoryOrTrigger:].cold.1(v4 & 1, v11);
    }
    else
    {
      v11 = objc_alloc_init((Class)NSMutableIndexSet);
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "triggerTypes"));
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v22 != v14)
              objc_enumerationMutation(v12);
            -[NSObject addIndex:](v11, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), "unsignedIntegerValue"));
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
        }
        while (v13);
      }

      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = __47__MOPhotoManager_isDesirableCategoryOrTrigger___block_invoke;
      v20[3] = &unk_1002B5260;
      v20[4] = &v25;
      -[NSObject enumerateIndexesUsingBlock:](v11, "enumerateIndexesUsingBlock:", v20);
      v16 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[MOPhotoManager isDesirableCategoryOrTrigger:].cold.2(v4 & 1, (uint64_t)v26, v17);

      v4 = (v4 & 1) != 0 && *(_BYTE *)(v26[0] + 24) != 0;
    }

    _Block_object_dispose(&v25, 8);
  }

  return v4 & 1;
}

uint64_t __47__MOPhotoManager_isDesirableCategoryOrTrigger___block_invoke(uint64_t result, unint64_t a2, _BYTE *a3)
{
  if (a2 <= 0x19 && ((1 << a2) & 0x38288B4) != 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (id)_createEventFromAsset:(id)a3
{
  id v4;
  MOEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MOEvent *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  float v15;
  void *v16;

  v4 = a3;
  v5 = [MOEvent alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "creationDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "creationDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v10 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v5, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v6, v7, v8, v9, 2, 14);

  -[MOEvent setPhotoMomentSource:](v10, "setPhotoMomentSource:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localIdentifier"));
  -[MOEvent setIdentifierFromProvider:](v10, "setIdentifierFromProvider:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "creationDate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoManager configurationManager](self, "configurationManager"));
  LODWORD(v14) = 1242802176;
  objc_msgSend(v13, "getFloatSettingForKey:withFallback:", CFSTR("EventManagerOverrideMaximumEventAge"), v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dateByAddingTimeInterval:", v15));
  -[MOEvent setExpirationDate:](v10, "setExpirationDate:", v16);

  return v10;
}

- (id)_createEventFromPhotoMemory:(id)a3
{
  id v4;
  id os_log;
  NSObject *v6;
  void *v7;
  MOEvent *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MOEvent *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  float v18;
  void *v19;
  int v21;
  void *v22;

  v4 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localIdentifier"));
    v21 = 138412290;
    v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "#PhotoMemory,_createEventFromPhotoMemory,%@", (uint8_t *)&v21, 0xCu);

  }
  v8 = [MOEvent alloc];
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "creationDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "creationDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v13 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v8, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v9, v10, v11, v12, 2, 17);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localIdentifier"));
  -[MOEvent setIdentifierFromProvider:](v13, "setIdentifierFromProvider:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "creationDate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoManager configurationManager](self, "configurationManager"));
  LODWORD(v17) = 1242802176;
  objc_msgSend(v16, "getFloatSettingForKey:withFallback:", CFSTR("EventManagerOverrideMaximumEventAge"), v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dateByAddingTimeInterval:", v18));
  -[MOEvent setExpirationDate:](v13, "setExpirationDate:", v19);

  return v13;
}

- (void)fetchAndSaveSharedPhotosBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  id v7;
  _QWORD v8[4];
  MOPhotoManager *v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __75__MOPhotoManager_fetchAndSaveSharedPhotosBetweenStartDate_EndDate_handler___block_invoke;
  v8[3] = &unk_1002AEB80;
  v9 = self;
  v10 = a5;
  v7 = v10;
  -[MOPhotoManager _fetchSharedPhotosBetweenStartDate:EndDate:handler:](v9, "_fetchSharedPhotosBetweenStartDate:EndDate:handler:", a3, a4, v8);

}

void __75__MOPhotoManager_fetchAndSaveSharedPhotosBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void (*v8)(void);
  id os_log;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  id v17;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      v8 = *(void (**)(void))(v7 + 16);
LABEL_4:
      v8();
    }
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v10 = objc_claimAutoreleasedReturnValue(os_log);
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v5)
    {
      if (v11)
      {
        *(_DWORD *)buf = 134217984;
        v17 = objc_msgSend(v5, "count");
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "saving %lu shared photos", buf, 0xCu);
      }

      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = __75__MOPhotoManager_fetchAndSaveSharedPhotosBetweenStartDate_EndDate_handler___block_invoke_286;
      v14[3] = &unk_1002ADA40;
      v12 = *(void **)(a1 + 32);
      v15 = *(id *)(a1 + 40);
      objc_msgSend(v12, "_saveEvents:category:handler:", v5, 14, v14);

    }
    else
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "no shared photos are fetched", buf, 2u);
      }

      v13 = *(_QWORD *)(a1 + 40);
      if (v13)
      {
        v8 = *(void (**)(void))(v13 + 16);
        goto LABEL_4;
      }
    }
  }

}

uint64_t __75__MOPhotoManager_fetchAndSaveSharedPhotosBetweenStartDate_EndDate_handler___block_invoke_286(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)fetchAndSavePhotoMemoriesStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id os_log;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[MOPhotoManager fetchAndSavePhotoMemoriesStartDate:EndDate:handler:].cold.1();

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __69__MOPhotoManager_fetchAndSavePhotoMemoriesStartDate_EndDate_handler___block_invoke;
  v14[3] = &unk_1002AEB80;
  v14[4] = self;
  v15 = v10;
  v13 = v10;
  -[MOPhotoManager _fetchPhotoMemoriesBetweenStartDate:EndDate:handler:](self, "_fetchPhotoMemoriesBetweenStartDate:EndDate:handler:", v8, v9, v14);

}

void __69__MOPhotoManager_fetchAndSavePhotoMemoriesStartDate_EndDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void (*v8)(void);
  id os_log;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
    {
      v8 = *(void (**)(void))(v7 + 16);
LABEL_4:
      v8();
    }
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v10 = objc_claimAutoreleasedReturnValue(os_log);
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if (v5)
    {
      if (v11)
        __69__MOPhotoManager_fetchAndSavePhotoMemoriesStartDate_EndDate_handler___block_invoke_cold_2(v5, (char *)v10);

      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = __69__MOPhotoManager_fetchAndSavePhotoMemoriesStartDate_EndDate_handler___block_invoke_288;
      v14[3] = &unk_1002ADA40;
      v12 = *(void **)(a1 + 32);
      v15 = *(id *)(a1 + 40);
      objc_msgSend(v12, "_saveEvents:category:handler:", v5, 17, v14);

    }
    else
    {
      if (v11)
        __69__MOPhotoManager_fetchAndSavePhotoMemoriesStartDate_EndDate_handler___block_invoke_cold_1();

      v13 = *(_QWORD *)(a1 + 40);
      if (v13)
      {
        v8 = *(void (**)(void))(v13 + 16);
        goto LABEL_4;
      }
    }
  }

}

uint64_t __69__MOPhotoManager_fetchAndSavePhotoMemoriesStartDate_EndDate_handler___block_invoke_288(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_saveEvents:(id)a3 category:(unint64_t)a4 handler:(id)a5
{
  id v6;
  id os_log;
  NSObject *v8;
  MOEventStore *eventStore;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  id v19;
  NSObject *v20;
  void *v21;
  MOEventStore *v22;
  id v23;
  id v24;
  _QWORD v27[4];
  id v28;
  unint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  unint64_t v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];

  v6 = a3;
  v24 = a5;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[MOPhotoManager _saveEvents:category:handler:].cold.1();

  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__34;
  v39 = __Block_byref_object_dispose__34;
  v40 = 0;
  eventStore = self->_eventStore;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = __47__MOPhotoManager__saveEvents_category_handler___block_invoke;
  v34[3] = &unk_1002AEC68;
  v34[4] = &v35;
  -[MOEventStore fetchLastEventOfCategory:CompletionHandler:](eventStore, "fetchLastEventOfCategory:CompletionHandler:", a4, v34);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v45, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v31;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)v14);
        if (!v36[5]
          || (v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1)
                                                                                 + 8 * (_QWORD)v14), "startDate", v24)),
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v36[5], "startDate")),
              v18 = objc_msgSend(v16, "isAfterDate:", v17),
              v17,
              v16,
              v18))
        {
          v19 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "eventIdentifier"));
            *(_DWORD *)buf = 134218242;
            v42 = a4;
            v43 = 2112;
            v44 = v21;
            _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "saving category %lu photo,event,%@,", buf, 0x16u);

          }
          objc_msgSend(v10, "addObject:", v15);
        }
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v45, 16);
    }
    while (v12);
  }

  v22 = self->_eventStore;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = __47__MOPhotoManager__saveEvents_category_handler___block_invoke_290;
  v27[3] = &unk_1002B5288;
  v29 = a4;
  v23 = v24;
  v28 = v23;
  -[MOEventStore storeEvents:CompletionHandler:](v22, "storeEvents:CompletionHandler:", v10, v27);

  _Block_object_dispose(&v35, 8);
}

void __47__MOPhotoManager__saveEvents_category_handler___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __47__MOPhotoManager__saveEvents_category_handler___block_invoke_290(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __47__MOPhotoManager__saveEvents_category_handler___block_invoke_290_cold_1(a1, (uint64_t)v5, v8);

  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);

}

- (void)rehydrateSharedPhotos:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[MOPhotoManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __48__MOPhotoManager_rehydrateSharedPhotos_handler___block_invoke;
  block[3] = &unk_1002AEBA8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

id __48__MOPhotoManager_rehydrateSharedPhotos_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rehydrateSharedPhotos:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_rehydrateSharedPhotos:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  NSMutableArray *v8;
  NSMutableDictionary *v9;
  NSMutableArray *v10;
  id os_log;
  NSObject *v12;
  id v13;
  PHFetchOptions *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  NSMutableDictionary *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  dispatch_once_t *v29;
  uint64_t v30;
  void *i;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  NSObject *v37;
  id v38;
  dispatch_once_t *v39;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
  id v44;
  void *v45;
  PHFetchOptions *v46;
  NSMutableArray *v47;
  void (**v48)(id, _QWORD, id);
  id v49;
  NSMutableDictionary *v50;
  id obj;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  NSMutableArray *v57;
  NSMutableDictionary *v58;
  _BYTE v59[128];
  NSErrorUserInfoKey v60;
  const __CFString *v61;
  uint8_t buf[4];
  id v63;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  v8 = objc_opt_new(NSMutableArray);
  v9 = objc_opt_new(NSMutableDictionary);
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = __49__MOPhotoManager__rehydrateSharedPhotos_handler___block_invoke;
  v56[3] = &unk_1002B52B0;
  v10 = v8;
  v57 = v10;
  v50 = v9;
  v58 = v50;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v56);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = -[NSMutableArray count](v10, "count");
    *(_DWORD *)buf = 134217984;
    v63 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "start rehydrating shared photos with local identifiers, identifier count, %lu", buf, 0xCu);
  }

  if (-[NSMutableArray count](v10, "count"))
  {
    v14 = objc_opt_new(PHFetchOptions);
    -[PHFetchOptions setPhotoLibrary:](v14, "setPhotoLibrary:", self->_syndicationPhotoLibrary);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset fetchAssetsWithLocalIdentifiers:options:](PHAsset, "fetchAssetsWithLocalIdentifiers:options:", v10, v14));
    v16 = v15;
    if (v15)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "fetchError"));

      v18 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      v20 = v19;
      if (!v17)
      {
        v46 = v14;
        v47 = v10;
        v48 = v7;
        v49 = v6;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v26 = objc_msgSend(v16, "count");
          *(_DWORD *)buf = 134217984;
          v63 = v26;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "fetch %lu shared photos from syndication library for rehydration", buf, 0xCu);
        }

        v21 = objc_alloc_init((Class)NSMutableArray);
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        v45 = v16;
        obj = v16;
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
        v22 = v50;
        if (v27)
        {
          v28 = v27;
          v29 = &MOLogFacilityPhoto;
          v30 = *(_QWORD *)v53;
          do
          {
            for (i = 0; i != v28; i = (char *)i + 1)
            {
              if (*(_QWORD *)v53 != v30)
                objc_enumerationMutation(obj);
              v32 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localIdentifier"));
              v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", v33));

              if (v34)
              {
                v35 = objc_msgSend(v34, "copy");
                objc_msgSend(v35, "setPhotoAsset:", v32);
                v36 = _mo_log_facility_get_os_log(v29);
                v37 = objc_claimAutoreleasedReturnValue(v36);
                if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
                {
                  v38 = v21;
                  v39 = v29;
                  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "photoAsset"));
                  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "localIdentifier"));
                  *(_DWORD *)buf = 138412290;
                  v63 = v41;
                  _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "assigning photoassets %@", buf, 0xCu);

                  v22 = v50;
                  v29 = v39;
                  v21 = v38;
                }

                objc_msgSend(v21, "addObject:", v35);
              }

            }
            v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
          }
          while (v28);
        }

        v42 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        v43 = objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v63 = v21;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "shared photos rehydratedEvents %@", buf, 0xCu);
        }

        v44 = objc_msgSend(v21, "copy");
        v7 = v48;
        ((void (**)(id, id, id))v48)[2](v48, v44, 0);

        v6 = v49;
        v14 = v46;
        v10 = v47;
        v16 = v45;
        goto LABEL_31;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[MOPhotoManager _rehydrateSharedPhotos:handler:].cold.2(v16, v20);

      v21 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fetchError"));
      v7[2](v7, 0, v21);
    }
    else
    {
      v60 = NSLocalizedDescriptionKey;
      v61 = CFSTR("photo fetch result is nil");
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1));
      v21 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 5, v23));

      v24 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        -[MOPhotoManager _rehydrateSharedPhotos:handler:].cold.1();

      ((void (**)(id, void *, id))v7)[2](v7, &__NSArray0__struct, v21);
    }
    v22 = v50;
LABEL_31:

    goto LABEL_32;
  }
  v22 = v50;
  if (v7)
    ((void (**)(id, void *, id))v7)[2](v7, &__NSArray0__struct, 0);
LABEL_32:

}

void __49__MOPhotoManager__rehydrateSharedPhotos_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id os_log;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifierFromProvider"));

  if (v4)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifierFromProvider"));
      v12 = 138412290;
      v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "adding identifier to assetLocalIdentifiers: %@", (uint8_t *)&v12, 0xCu);

    }
    v8 = *(void **)(a1 + 32);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifierFromProvider"));
    objc_msgSend(v8, "addObject:", v9);

    v10 = *(void **)(a1 + 40);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifierFromProvider"));
    objc_msgSend(v10, "setObject:forKey:", v3, v11);

  }
}

- (void)rehydratePhotoMemories:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "#PhotoMemory,invoking rehydratePhotoMemories", buf, 2u);
  }

  v10 = objc_claimAutoreleasedReturnValue(-[MOPhotoManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __49__MOPhotoManager_rehydratePhotoMemories_handler___block_invoke;
  block[3] = &unk_1002AEBA8;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(v10, block);

}

id __49__MOPhotoManager_rehydratePhotoMemories_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rehydratePhotoMemories:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_rehydratePhotoMemories:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  NSMutableArray *v10;
  id v11;
  char *v12;
  PHFetchOptions *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  NSMutableArray *v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSMutableArray *v25;
  id v26;
  id v27;
  MOPhotoManager *v28;
  id v29;
  uint64_t v30;
  void *i;
  void *v32;
  unsigned int v33;
  id v34;
  NSObject *v35;
  void *v36;
  unsigned int v37;
  unsigned int v38;
  id v39;
  uint64_t v40;
  void *v41;
  id v42;
  NSMutableArray *v43;
  void *v44;
  PHFetchOptions *v45;
  NSMutableArray *v46;
  id v47;
  id v48;
  id v49;
  NSMutableArray *v50;
  MOPhotoManager *v51;
  _QWORD v52[4];
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[4];
  NSMutableArray *v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  unsigned int v63;
  __int16 v64;
  unsigned int v65;
  __int16 v66;
  id v67;
  __int16 v68;
  unsigned int v69;
  _BYTE v70[128];
  NSErrorUserInfoKey v71;
  const __CFString *v72;
  NSErrorUserInfoKey v73;
  const __CFString *v74;

  v6 = a3;
  v7 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[MOPhotoManager _rehydratePhotoMemories:handler:].cold.6();

  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = __50__MOPhotoManager__rehydratePhotoMemories_handler___block_invoke;
  v58[3] = &unk_1002AF940;
  v10 = objc_opt_new(NSMutableArray);
  v59 = v10;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v58);
  v11 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v12 = (char *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEBUG))
    -[MOPhotoManager _rehydratePhotoMemories:handler:].cold.5(v10, v12);

  if (-[NSMutableArray count](v10, "count"))
  {
    v13 = objc_opt_new(PHFetchOptions);
    v51 = self;
    -[PHFetchOptions setPhotoLibrary:](v13, "setPhotoLibrary:", self->_photoLibrary);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("featuredState == %ul"), 1));
    -[PHFetchOptions setInternalPredicate:](v13, "setInternalPredicate:", v14);

    -[PHFetchOptions setIncludePendingMemories:](v13, "setIncludePendingMemories:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:](PHAssetCollection, "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v13));
    v16 = v15;
    if (v15)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "fetchError"));

      v18 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      v20 = v19;
      if (v17)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[MOPhotoManager _rehydratePhotoMemories:handler:].cold.4(v16, v20);

        v21 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fetchError"));
        goto LABEL_16;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[MOPhotoManager _rehydratePhotoMemories:handler:].cold.3(v16, (char *)v20);

      if (objc_msgSend(v16, "count"))
      {
        v45 = v13;
        v46 = v10;
        v47 = v7;
        v48 = v6;
        v25 = objc_opt_new(NSMutableArray);
        v54 = 0u;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v44 = v16;
        v26 = v16;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
        v28 = v51;
        v49 = v26;
        v50 = v25;
        if (v27)
        {
          v29 = v27;
          v30 = *(_QWORD *)v55;
          do
          {
            for (i = 0; i != v29; i = (char *)i + 1)
            {
              if (*(_QWORD *)v55 != v30)
                objc_enumerationMutation(v26);
              v32 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
              v33 = -[MOPhotoManager isCandidateForMemoryEvent:](v28, "isCandidateForMemoryEvent:", v32);
              v34 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
              v35 = objc_claimAutoreleasedReturnValue(v34);
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
              {
                v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localIdentifier"));
                v37 = objc_msgSend(v32, "pendingState");
                v38 = objc_msgSend(v32, "isFavorite");
                v39 = objc_msgSend(v32, "category");
                *(_DWORD *)buf = 138413314;
                v61 = v36;
                v62 = 1024;
                v63 = v37;
                v64 = 1024;
                v65 = v38;
                v26 = v49;
                v28 = v51;
                v66 = 2048;
                v67 = v39;
                v68 = 1024;
                v69 = v33;
                _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "#PhotoMemory,memoryInfo,id,%@,pendingState,%hu,isFavorite,%d,category,%lu,isCandidateForMemoryEvent,isSelected,%d", buf, 0x28u);

                v25 = v50;
              }

              if (v33)
                -[NSMutableArray addObject:](v25, "addObject:", v32);
            }
            v29 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
          }
          while (v29);
        }

        if ((unint64_t)-[NSMutableArray count](v25, "count") < 4)
        {
          v43 = v25;
          v7 = v47;
          v6 = v48;
          v13 = v45;
          v10 = v46;
          v16 = v44;
        }
        else
        {
          v7 = v47;
          v6 = v48;
          v13 = v45;
          v10 = v46;
          if ((unint64_t)-[NSMutableArray count](v25, "count") <= 3)
            v40 = (uint64_t)-[NSMutableArray count](v25, "count");
          else
            v40 = 3;
          v43 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[NSMutableArray subarrayWithRange:](v25, "subarrayWithRange:", 0, v40));
          v16 = v44;
        }
        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472;
        v52[2] = __50__MOPhotoManager__rehydratePhotoMemories_handler___block_invoke_292;
        v52[3] = &unk_1002ADFD8;
        v53 = v7;
        -[MOPhotoManager _rehydrateStoredEvents:fromPhotoMemories:fetchResult:handler:](v51, "_rehydrateStoredEvents:fromPhotoMemories:fetchResult:handler:", v6, v43, v49, v52);

        v21 = v50;
        goto LABEL_17;
      }
      v71 = NSLocalizedDescriptionKey;
      v72 = CFSTR("photo memory fetch count is invalid");
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1));
      v21 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 5, v41));

      v42 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      v24 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        -[MOPhotoManager _rehydratePhotoMemories:handler:].cold.2();
    }
    else
    {
      v73 = NSLocalizedDescriptionKey;
      v74 = CFSTR("photo memory fetch result is nil");
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1));
      v21 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 5, v22));

      v23 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        -[MOPhotoManager _rehydratePhotoMemories:handler:].cold.1();
    }

LABEL_16:
    (*((void (**)(id, void *, NSMutableArray *))v7 + 2))(v7, &__NSArray0__struct, v21);
LABEL_17:

    goto LABEL_18;
  }
  if (v7)
    (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, &__NSArray0__struct, 0);
LABEL_18:

}

void __50__MOPhotoManager__rehydratePhotoMemories_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id os_log;
  NSObject *v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifierFromProvider"));

  if (v4)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __50__MOPhotoManager__rehydratePhotoMemories_handler___block_invoke_cold_1(v3, v6);

    v7 = *(void **)(a1 + 32);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifierFromProvider"));
    objc_msgSend(v7, "addObject:", v8);

  }
}

uint64_t __50__MOPhotoManager__rehydratePhotoMemories_handler___block_invoke_292(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateSharedPhotoEventsDeletedAtSource:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[MOPhotoManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __65__MOPhotoManager_updateSharedPhotoEventsDeletedAtSource_handler___block_invoke;
  block[3] = &unk_1002AEBA8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __65__MOPhotoManager_updateSharedPhotoEventsDeletedAtSource_handler___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = v1[3];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __65__MOPhotoManager_updateSharedPhotoEventsDeletedAtSource_handler___block_invoke_2;
  v4[3] = &unk_1002ADA40;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_updatePhotoEventsDeletedAtSource:library:handler:", v2, v3, v4);

}

uint64_t __65__MOPhotoManager_updateSharedPhotoEventsDeletedAtSource_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_updatePhotoEventsDeletedAtSource:(id)a3 library:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  id os_log;
  NSObject *v10;
  NSMutableArray *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  PHFetchOptions *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  NSMutableSet *v28;
  void *v29;
  id v30;
  NSObject *v31;
  MORehydrationMetrics *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  MORehydrationMetrics *v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  void *j;
  void *v44;
  id v45;
  id v46;
  uint64_t v47;
  void *k;
  void *v49;
  void *v50;
  unsigned __int8 v51;
  char *v52;
  MORehydrationThresholdMetrics *v53;
  id v54;
  id v55;
  NSObject *v56;
  id v57;
  id v58;
  NSObject *v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  MORehydrationMetrics *v64;
  id v65;
  id v66;
  void *v67;
  id v68;
  MORehydrationMetrics *v69;
  id v70;
  id v71;
  void *v73;
  PHFetchOptions *v74;
  id v75;
  id v76;
  NSMutableArray *v77;
  id obj;
  _QWORD v79[4];
  id v80;
  MOPhotoManager *v81;
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
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  uint8_t v99[128];
  uint8_t buf[4];
  id v101;
  NSErrorUserInfoKey v102;
  const __CFString *v103;
  _BYTE v104[128];

  v7 = a3;
  v8 = a4;
  v75 = a5;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v10 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "#PhotoMemory,invoking _updatePhotoEventsDeletedAtSource", buf, 2u);
  }

  v11 = objc_opt_new(NSMutableArray);
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v94, v104, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v95;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v95 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * (_QWORD)i), "identifierFromProvider"));
        -[NSMutableArray addObject:](v11, "addObject:", v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v94, v104, 16);
    }
    while (v14);
  }

  v18 = objc_opt_new(PHFetchOptions);
  -[PHFetchOptions setPhotoLibrary:](v18, "setPhotoLibrary:", v8);
  -[PHFetchOptions setIncludeGuestAssets:](v18, "setIncludeGuestAssets:", 1);
  v74 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:options:](PHAssetCollection, "fetchAssetCollectionsWithLocalIdentifiers:options:", v11, v18));
  v20 = v19;
  if (v19)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "fetchError"));

    v22 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
    if (v21)
    {
      v25 = v75;
      if (v24)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "fetchError"));
        *(_DWORD *)buf = 138412290;
        v101 = v26;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "fetch from photo library for purge hit error, %@", buf, 0xCu);

      }
      v27 = v20;
      v28 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "fetchError"));
      (*((void (**)(id, NSMutableSet *, void *))v75 + 2))(v75, v28, &__NSDictionary0__struct);
    }
    else
    {
      v73 = v20;
      if (v24)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "fetch from photo library for purge succeed", buf, 2u);
      }

      v28 = objc_opt_new(NSMutableSet);
      v77 = objc_opt_new(NSMutableArray);
      v76 = objc_alloc_init((Class)NSMutableArray);
      v89 = 0u;
      v90 = 0u;
      v91 = 0u;
      v92 = 0u;
      v39 = v73;
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v89, v99, 16);
      if (v40)
      {
        v41 = v40;
        v42 = *(_QWORD *)v90;
        do
        {
          for (j = 0; j != v41; j = (char *)j + 1)
          {
            if (*(_QWORD *)v90 != v42)
              objc_enumerationMutation(v39);
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)j), "localIdentifier"));
            -[NSMutableSet addObject:](v28, "addObject:", v44);

          }
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v89, v99, 16);
        }
        while (v41);
      }
      v71 = v8;

      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      obj = v12;
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
      if (v45)
      {
        v46 = v45;
        v47 = *(_QWORD *)v86;
        do
        {
          for (k = 0; k != v46; k = (char *)k + 1)
          {
            if (*(_QWORD *)v86 != v47)
              objc_enumerationMutation(obj);
            v49 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)k);
            v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "identifierFromProvider"));
            v51 = -[NSMutableSet containsObject:](v28, "containsObject:", v50);

            v52 = (char *)objc_msgSend(v49, "rehydrationFailCount");
            if ((v51 & 1) != 0)
            {
              if (v52)
              {
                v53 = -[MORehydrationThresholdMetrics initWithCategory:provider:failureCount:]([MORehydrationThresholdMetrics alloc], "initWithCategory:provider:failureCount:", objc_msgSend(v49, "category"), objc_msgSend(v49, "provider"), objc_msgSend(v49, "rehydrationFailCount"));
                v84 = 0;
                -[MORehydrationThresholdMetrics submitMetricsWithError:](v53, "submitMetricsWithError:", &v84);
                v54 = v84;
                objc_msgSend(v49, "setRehydrationFailCount:", 0);
                objc_msgSend(v76, "addObject:", v49);

              }
            }
            else
            {
              objc_msgSend(v49, "setRehydrationFailCount:", v52 + 1);
              -[NSMutableArray addObject:](v77, "addObject:", v49);
            }
          }
          v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
        }
        while (v46);
      }

      v55 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      v56 = objc_claimAutoreleasedReturnValue(v55);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        v57 = -[NSMutableArray count](v77, "count");
        *(_DWORD *)buf = 134217984;
        v101 = v57;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "invalid photo moments count, %lu", buf, 0xCu);
      }

      v58 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      v59 = objc_claimAutoreleasedReturnValue(v58);
      v25 = v75;
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        v60 = objc_msgSend(v76, "count");
        *(_DWORD *)buf = 134217984;
        v101 = v60;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "previously rehydration failed photo moments now are found count, %lu", buf, 0xCu);
      }

      v69 = [MORehydrationMetrics alloc];
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "firstObject"));
      v62 = objc_msgSend(v61, "category");
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "firstObject"));
      v64 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v69, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v62, objc_msgSend(v63, "provider"), 1, 0, objc_msgSend(obj, "count"), 1, (double)(int)-[NSMutableArray count](v77, "count"), (double)(int)objc_msgSend(v76, "count"));

      v83 = 0;
      -[MORehydrationMetrics submitMetricsWithError:](v64, "submitMetricsWithError:", &v83);
      v65 = v83;
      v66 = -[NSMutableArray copy](v77, "copy");
      objc_msgSend(v76, "addObjectsFromArray:", v66);

      v67 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoManager eventStore](self, "eventStore"));
      v79[0] = _NSConcreteStackBlock;
      v79[1] = 3221225472;
      v79[2] = __68__MOPhotoManager__updatePhotoEventsDeletedAtSource_library_handler___block_invoke;
      v79[3] = &unk_1002B2068;
      v80 = v76;
      v81 = self;
      v82 = v75;
      v68 = v76;
      objc_msgSend(v67, "storeEvents:CompletionHandler:", v68, v79);

      v27 = v73;
      v8 = v71;
    }
  }
  else
  {
    v70 = v8;
    v102 = NSLocalizedDescriptionKey;
    v103 = CFSTR("photo fetch result is nil");
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1));
    v28 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 5, v29));

    v30 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[MOPhotoManager _updatePhotoEventsDeletedAtSource:library:handler:].cold.1();

    v25 = v75;
    (*((void (**)(id, NSMutableSet *, void *))v75 + 2))(v75, v28, &__NSDictionary0__struct);
    v32 = [MORehydrationMetrics alloc];
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
    v34 = objc_msgSend(v33, "category");
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
    v36 = objc_msgSend(v35, "provider");
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet description](v28, "description"));
    v38 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v32, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v34, v36, 0, v37, objc_msgSend(v12, "count"), 1, (double)(int)objc_msgSend(v12, "count"), 0.0);

    v93 = 0;
    -[MORehydrationMetrics submitMetricsWithError:](v38, "submitMetricsWithError:", &v93);

    v8 = v70;
    v27 = 0;
  }

}

void __68__MOPhotoManager__updatePhotoEventsDeletedAtSource_library_handler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __68__MOPhotoManager__updatePhotoEventsDeletedAtSource_library_handler___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(a1[4], "count");
    *(_DWORD *)buf = 134217984;
    v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "update photo succeeded, count, %lu", buf, 0xCu);
  }

  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __68__MOPhotoManager__updatePhotoEventsDeletedAtSource_library_handler___block_invoke_295;
  block[3] = &unk_1002B52D8;
  v12 = a1[6];
  v17 = v6;
  v18 = v12;
  v16 = v5;
  v13 = v6;
  v14 = v5;
  dispatch_async(v11, block);

}

uint64_t __68__MOPhotoManager__updatePhotoEventsDeletedAtSource_library_handler___block_invoke_295(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)updatePhotoMemoriesEventsDeletedAtSource:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "#PhotoMemory,invoking updatePhotoMemoriesEventsDeletedAtSource", buf, 2u);
  }

  v10 = objc_claimAutoreleasedReturnValue(-[MOPhotoManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __67__MOPhotoManager_updatePhotoMemoriesEventsDeletedAtSource_handler___block_invoke;
  block[3] = &unk_1002AEBA8;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(v10, block);

}

void __67__MOPhotoManager_updatePhotoMemoriesEventsDeletedAtSource_handler___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(_QWORD **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = v1[2];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __67__MOPhotoManager_updatePhotoMemoriesEventsDeletedAtSource_handler___block_invoke_2;
  v4[3] = &unk_1002ADA40;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_updatePhotoMemoriesDeletedAtSource:library:handler:", v2, v3, v4);

}

uint64_t __67__MOPhotoManager_updatePhotoMemoriesEventsDeletedAtSource_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_updatePhotoMemoriesDeletedAtSource:(id)a3 library:(id)a4 handler:(id)a5
{
  id v7;
  void (**v8)(id, NSMutableSet *, void *);
  id os_log;
  NSObject *v10;
  NSMutableArray *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  PHFetchOptions *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  NSMutableSet *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void (**v32)(id, NSMutableSet *, void *);
  void *v33;
  NSMutableSet *v34;
  void *v35;
  id v36;
  NSObject *v37;
  MORehydrationMetrics *v38;
  void *v39;
  id v40;
  void *v41;
  void (**v42)(id, NSMutableSet *, void *);
  id v43;
  void *v44;
  double v45;
  id v46;
  id v47;
  MORehydrationMetrics *v48;
  NSMutableSet *v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  void *j;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  void *k;
  void *v60;
  void *v61;
  unsigned __int8 v62;
  char *v63;
  MORehydrationThresholdMetrics *v64;
  id v65;
  id v66;
  NSObject *v67;
  NSMutableSet *v68;
  id v69;
  NSObject *v70;
  NSMutableSet *v71;
  void *v72;
  id v73;
  void *v74;
  MORehydrationMetrics *v75;
  id v76;
  id v77;
  void *v78;
  id v79;
  MORehydrationMetrics *v80;
  MOPhotoManager *v81;
  void (**v82)(id, NSMutableSet *, void *);
  void *v83;
  PHFetchOptions *v84;
  id v85;
  NSMutableArray *v86;
  MORehydrationMetrics *obja;
  id obj;
  _QWORD v89[4];
  id v90;
  MOPhotoManager *v91;
  void (**v92)(id, NSMutableSet *, void *);
  id v93;
  id v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  uint64_t v103;
  uint64_t v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _BYTE v109[128];
  uint8_t v110[128];
  uint8_t buf[4];
  NSMutableSet *v112;
  NSErrorUserInfoKey v113;
  const __CFString *v114;
  _BYTE v115[128];

  v7 = a3;
  v8 = (void (**)(id, NSMutableSet *, void *))a5;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v10 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "#PhotoMemory,invoking _updatePhotoMemoriesDeletedAtSource", buf, 2u);
  }

  v11 = objc_opt_new(NSMutableArray);
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v105, v115, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v106;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v106 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * (_QWORD)i), "identifierFromProvider"));
        -[NSMutableArray addObject:](v11, "addObject:", v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v105, v115, 16);
    }
    while (v14);
  }

  v18 = objc_opt_new(PHFetchOptions);
  -[PHFetchOptions setPhotoLibrary:](v18, "setPhotoLibrary:", self->_photoLibrary);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("featuredState == %ul"), 1));
  -[PHFetchOptions setInternalPredicate:](v18, "setInternalPredicate:", v19);

  -[PHFetchOptions setIncludePendingMemories:](v18, "setIncludePendingMemories:", 1);
  v84 = v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:](PHAssetCollection, "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v18));
  v21 = v20;
  if (!v20)
  {
    v83 = 0;
    v113 = NSLocalizedDescriptionKey;
    v114 = CFSTR("photo memory fetch result is nil");
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1));
    v34 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 5, v35));

    v36 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v112 = v34;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "#PhotoMemory,memories fetch during purge is nil, error, %@", buf, 0xCu);
    }

    v8[2](v8, v34, &__NSDictionary0__struct);
    v38 = [MORehydrationMetrics alloc];
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
    v40 = objc_msgSend(v39, "category");
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
    v42 = v8;
    v43 = objc_msgSend(v41, "provider");
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet description](v34, "description"));
    v45 = (double)(int)objc_msgSend(v12, "count");
    v46 = objc_msgSend(v12, "count");
    v47 = v40;
    v32 = v42;
    v48 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v38, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v47, v43, 0, v44, v46, 1, v45, 0.0);

    v104 = 0;
    -[MORehydrationMetrics submitMetricsWithError:](v48, "submitMetricsWithError:", &v104);

    goto LABEL_43;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "fetchError"));

  v23 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  v25 = v24;
  if (!v22)
  {
    v81 = self;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v49 = (NSMutableSet *)objc_msgSend(v21, "count");
      *(_DWORD *)buf = 134217984;
      v112 = v49;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "#PhotoMemory,fetch memory result count for purge, %lu", buf, 0xCu);
    }
    v82 = v8;

    v34 = objc_opt_new(NSMutableSet);
    v86 = objc_opt_new(NSMutableArray);
    v85 = objc_alloc_init((Class)NSMutableArray);
    v99 = 0u;
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v83 = v21;
    v50 = v21;
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v99, v110, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v100;
      do
      {
        for (j = 0; j != v52; j = (char *)j + 1)
        {
          if (*(_QWORD *)v100 != v53)
            objc_enumerationMutation(v50);
          v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * (_QWORD)j), "localIdentifier"));
          -[NSMutableSet addObject:](v34, "addObject:", v55);

        }
        v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v99, v110, 16);
      }
      while (v52);
    }

    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    obj = v12;
    v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v109, 16);
    if (v56)
    {
      v57 = v56;
      v58 = *(_QWORD *)v96;
      do
      {
        for (k = 0; k != v57; k = (char *)k + 1)
        {
          if (*(_QWORD *)v96 != v58)
            objc_enumerationMutation(obj);
          v60 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * (_QWORD)k);
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "identifierFromProvider"));
          v62 = -[NSMutableSet containsObject:](v34, "containsObject:", v61);

          v63 = (char *)objc_msgSend(v60, "rehydrationFailCount");
          if ((v62 & 1) != 0)
          {
            if (v63)
            {
              v64 = -[MORehydrationThresholdMetrics initWithCategory:provider:failureCount:]([MORehydrationThresholdMetrics alloc], "initWithCategory:provider:failureCount:", objc_msgSend(v60, "category"), objc_msgSend(v60, "provider"), objc_msgSend(v60, "rehydrationFailCount"));
              v94 = 0;
              -[MORehydrationThresholdMetrics submitMetricsWithError:](v64, "submitMetricsWithError:", &v94);
              v65 = v94;
              objc_msgSend(v60, "setRehydrationFailCount:", 0);
              objc_msgSend(v85, "addObject:", v60);

            }
          }
          else
          {
            objc_msgSend(v60, "setRehydrationFailCount:", v63 + 1);
            -[NSMutableArray addObject:](v86, "addObject:", v60);
          }
        }
        v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v109, 16);
      }
      while (v57);
    }

    v66 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v67 = objc_claimAutoreleasedReturnValue(v66);
    if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
    {
      v68 = (NSMutableSet *)-[NSMutableArray count](v86, "count");
      *(_DWORD *)buf = 134217984;
      v112 = v68;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_INFO, "invalid photo memories count, %lu", buf, 0xCu);
    }

    v69 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v70 = objc_claimAutoreleasedReturnValue(v69);
    v32 = v82;
    if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
    {
      v71 = (NSMutableSet *)objc_msgSend(v85, "count");
      *(_DWORD *)buf = 134217984;
      v112 = v71;
      _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "previously rehdyration failed photo memories now are found,  count, %lu", buf, 0xCu);
    }

    v80 = [MORehydrationMetrics alloc];
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "firstObject"));
    v73 = objc_msgSend(v72, "category");
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "firstObject"));
    v75 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v80, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v73, objc_msgSend(v74, "provider"), 1, 0, objc_msgSend(obj, "count"), 1, (double)(int)-[NSMutableArray count](v86, "count"), (double)(int)objc_msgSend(v85, "count"));

    v93 = 0;
    -[MORehydrationMetrics submitMetricsWithError:](v75, "submitMetricsWithError:", &v93);
    v76 = v93;
    v77 = -[NSMutableArray copy](v86, "copy");
    objc_msgSend(v85, "addObjectsFromArray:", v77);

    v78 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoManager eventStore](v81, "eventStore"));
    v89[0] = _NSConcreteStackBlock;
    v89[1] = 3221225472;
    v89[2] = __70__MOPhotoManager__updatePhotoMemoriesDeletedAtSource_library_handler___block_invoke;
    v89[3] = &unk_1002B2068;
    v90 = v85;
    v91 = v81;
    v92 = v82;
    v79 = v85;
    objc_msgSend(v78, "storeEvents:CompletionHandler:", v79, v89);

LABEL_43:
    v21 = v83;
    goto LABEL_44;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    -[MOPhotoManager _updatePhotoMemoriesDeletedAtSource:library:handler:].cold.1(v21, v25);

  v26 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "fetchError"));
  v8[2](v8, v26, &__NSDictionary0__struct);

  obja = [MORehydrationMetrics alloc];
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
  v28 = objc_msgSend(v27, "category");
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
  v30 = objc_msgSend(v29, "provider");
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "fetchError"));
  v32 = v8;
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "description"));
  v34 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](obja, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v28, v30, 0, v33, objc_msgSend(v12, "count"), 1, (double)(int)objc_msgSend(v12, "count"), 0.0);

  v103 = 0;
  -[NSMutableSet submitMetricsWithError:](v34, "submitMetricsWithError:", &v103);
LABEL_44:

}

void __70__MOPhotoManager__updatePhotoMemoriesDeletedAtSource_library_handler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __70__MOPhotoManager__updatePhotoMemoriesDeletedAtSource_library_handler___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(a1[4], "count");
    *(_DWORD *)buf = 134217984;
    v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "update photo memories succeeded, count, %lu", buf, 0xCu);
  }

  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __70__MOPhotoManager__updatePhotoMemoriesDeletedAtSource_library_handler___block_invoke_296;
  block[3] = &unk_1002B52D8;
  v12 = a1[6];
  v17 = v6;
  v18 = v12;
  v16 = v5;
  v13 = v6;
  v14 = v5;
  dispatch_async(v11, block);

}

uint64_t __70__MOPhotoManager__updatePhotoMemoriesDeletedAtSource_library_handler___block_invoke_296(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)fetchAssetUsingID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id os_log;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD block[5];
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  NSErrorUserInfoKey v19;
  const __CFString *v20;

  v6 = a3;
  v7 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "fetchAssetUsingID,identifier,%@", buf, 0xCu);
    }

    v11 = objc_claimAutoreleasedReturnValue(-[MOPhotoManager queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __44__MOPhotoManager_fetchAssetUsingID_handler___block_invoke;
    block[3] = &unk_1002AEBA8;
    block[4] = self;
    v15 = v6;
    v16 = v7;
    dispatch_async(v11, block);

  }
  else
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "fetchAssetUsingID,identifier,is nil", buf, 2u);
    }

    v19 = NSLocalizedDescriptionKey;
    v20 = CFSTR("identifier is nil");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 5, v12));

    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v13);
  }

}

void __44__MOPhotoManager_fetchAssetUsingID_handler___block_invoke(_QWORD *a1)
{
  PHFetchOptions *v2;
  NSMutableArray *v3;
  void *v4;
  void *v5;
  void *v6;
  id os_log;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  int v18;
  void *v19;
  NSErrorUserInfoKey v20;
  const __CFString *v21;

  v2 = objc_opt_new(PHFetchOptions);
  -[PHFetchOptions setPhotoLibrary:](v2, "setPhotoLibrary:", *(_QWORD *)(a1[4] + 16));
  -[PHFetchOptions setIncludeGuestAssets:](v2, "setIncludeGuestAssets:", 1);
  v3 = objc_opt_new(NSMutableArray);
  -[NSMutableArray addObject:](v3, "addObject:", a1[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset fetchAssetsWithLocalIdentifiers:options:](PHAsset, "fetchAssetsWithLocalIdentifiers:options:", v3, v2));
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fetchError"));

    if (v6)
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      v8 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __44__MOPhotoManager_fetchAssetUsingID_handler___block_invoke_cold_2(v5, v8);

      v9 = a1[6];
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fetchError"));
      (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
      v14 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v18 = 138412290;
        v19 = v10;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "fetchAssetUsingID,photoAsset,%@", (uint8_t *)&v18, 0xCu);
      }

      v16 = a1[6];
      v17 = objc_msgSend(v10, "copy");
      (*(void (**)(uint64_t, id, _QWORD))(v16 + 16))(v16, v17, 0);

    }
  }
  else
  {
    v20 = NSLocalizedDescriptionKey;
    v21 = CFSTR("photo fetch result is nil");
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 5, v11));

    v12 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __44__MOPhotoManager_fetchAssetUsingID_handler___block_invoke_cold_1();

    (*(void (**)(_QWORD, _QWORD, void *))(a1[6] + 16))(a1[6], 0, v10);
  }

}

- (void)_rehydrateStoredEvents:(id)a3 fromPhotoMemories:(id)a4 fetchResult:(id)a5 handler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void (**v12)(id, void *, _QWORD);
  id os_log;
  NSObject *v14;
  NSMutableDictionary *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  NSMutableDictionary *v34;
  id v35;
  id v36;
  id v37;
  MORehydrationThresholdMetrics *v38;
  void *v39;
  void *v40;
  MORehydrationMetrics *v41;
  void *v42;
  id v43;
  void *v44;
  MORehydrationMetrics *v45;
  id v46;
  NSObject *v47;
  id v48;
  NSObject *v49;
  MORehydrationMetrics *v50;
  NSMutableDictionary *v51;
  void (**v52)(id, void *, _QWORD);
  id v53;
  id v54;
  void *v55;
  id v56;
  id obj;
  void *v58;
  id v59;
  MORehydrationThresholdMetrics *v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[4];
  NSMutableDictionary *v69;
  uint64_t v70;
  uint8_t buf[16];
  _BYTE v72[128];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, void *, _QWORD))a6;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v14 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "#PhotoMemory,invoking _rehydrateStoredEvents", buf, 2u);
  }

  if (objc_msgSend(v9, "count"))
  {
    if (objc_msgSend(v10, "count"))
    {
      v52 = v12;
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472;
      v68[2] = __79__MOPhotoManager__rehydrateStoredEvents_fromPhotoMemories_fetchResult_handler___block_invoke;
      v68[3] = &unk_1002AF940;
      v15 = objc_opt_new(NSMutableDictionary);
      v69 = v15;
      v55 = v9;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v68);
      v59 = objc_alloc_init((Class)NSMutableArray);
      v56 = objc_alloc_init((Class)NSMutableArray);
      v16 = objc_autoreleasePoolPush();
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions"));
      v53 = v11;
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset fetchKeyAssetByMemoryUUIDForMemories:options:](PHAsset, "fetchKeyAssetByMemoryUUIDForMemories:options:", v11, v17));

      objc_autoreleasePoolPop(v16);
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v54 = v10;
      obj = v10;
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v65;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v65 != v20)
              objc_enumerationMutation(obj);
            v22 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)v21);
            v23 = objc_autoreleasePoolPush();
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localIdentifier"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v24));

            if (v25)
            {
              v26 = objc_msgSend(v25, "copy");
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "uuid"));
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "objectForKeyedSubscript:", v27));

              -[MOPhotoManager _setDynamicPropertiesForMemoryEvent:fromMemory:keyAsset:](self, "_setDynamicPropertiesForMemoryEvent:fromMemory:keyAsset:", v26, v22, v28);
              if (objc_msgSend(v26, "rehydrationFailCount"))
              {
                v61 = [MORehydrationThresholdMetrics alloc];
                v29 = objc_msgSend(v26, "category");
                v30 = v28;
                v31 = v23;
                v32 = v19;
                v33 = v20;
                v34 = v15;
                v35 = objc_msgSend(v25, "provider");
                v36 = objc_msgSend(v26, "rehydrationFailCount");
                v37 = v35;
                v15 = v34;
                v20 = v33;
                v19 = v32;
                v23 = v31;
                v28 = v30;
                v38 = -[MORehydrationThresholdMetrics initWithCategory:provider:failureCount:](v61, "initWithCategory:provider:failureCount:", v29, v37, v36);
                v63 = 0;
                -[MORehydrationThresholdMetrics submitMetricsWithError:](v38, "submitMetricsWithError:", &v63);
                objc_msgSend(v26, "setRehydrationFailCount:", 0);
                objc_msgSend(v56, "addObject:", v26);

              }
              objc_msgSend(v59, "addObject:", v26);

            }
            objc_autoreleasePoolPop(v23);
            v21 = (char *)v21 + 1;
          }
          while (v19 != v21);
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
        }
        while (v19);
      }
      v51 = v15;

      v39 = objc_autoreleasePoolPush();
      v12 = v52;
      v52[2](v52, v59, 0);
      objc_autoreleasePoolPop(v39);
      v40 = objc_autoreleasePoolPush();
      v41 = [MORehydrationMetrics alloc];
      v9 = v55;
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "firstObject"));
      v43 = objc_msgSend(v42, "category");
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "firstObject"));
      v45 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v41, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v43, objc_msgSend(v44, "provider"), 1, 0, objc_msgSend(v55, "count"), 3, (double)(int)(objc_msgSend(v55, "count") - objc_msgSend(v59, "count")), (double)(unint64_t)objc_msgSend(v56, "count"));

      v62 = 0;
      -[MORehydrationMetrics submitMetricsWithError:](v45, "submitMetricsWithError:", &v62);

      objc_autoreleasePoolPop(v40);
      v11 = v53;
      v10 = v54;
    }
    else
    {
      v48 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      v49 = objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        -[MOPhotoManager _rehydrateStoredEvents:fromPhotoMemories:fetchResult:handler:].cold.2();

      v12[2](v12, &__NSArray0__struct, 0);
      v50 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:]([MORehydrationMetrics alloc], "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", 17, 2, 1, 0, objc_msgSend(v9, "count"), 3, (double)(int)objc_msgSend(v9, "count"), 0.0);
      v70 = 0;
      -[MORehydrationMetrics submitMetricsWithError:](v50, "submitMetricsWithError:", &v70);

    }
  }
  else
  {
    v46 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v47 = objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      -[MOPhotoManager _rehydrateStoredEvents:fromPhotoMemories:fetchResult:handler:].cold.1();

    v12[2](v12, &__NSArray0__struct, 0);
  }

}

void __79__MOPhotoManager__rehydrateStoredEvents_fromPhotoMemories_fetchResult_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id os_log;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifierFromProvider"));

  if (v4)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifierFromProvider"));
      v10 = 138412290;
      v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "rehydrateEvents:adding identifier to localIdentifierToEventMap: %@", (uint8_t *)&v10, 0xCu);

    }
    v8 = *(void **)(a1 + 32);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifierFromProvider"));
    objc_msgSend(v8, "setObject:forKey:", v3, v9);

  }
}

- (id)_fetchCuratedAssetsForPhotoMemory:(id)a3
{
  id v4;
  id os_log;
  NSObject *v6;
  PHFetchOptions *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v20;
  id v21;
  id v22;
  id v23;
  int v24;
  uint64_t v25;
  void *i;
  void *v27;
  id v28;
  NSObject *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  PHFetchOptions *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  id v46;
  uint8_t buf[4];
  _QWORD v48[3];
  _BYTE v49[128];
  NSErrorUserInfoKey v50;
  const __CFString *v51;

  v4 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "#PhotoMemory,invoking _fetchCuratedAssetsForPhotoMemory", buf, 2u);
  }

  v7 = objc_opt_new(PHFetchOptions);
  -[PHFetchOptions setPhotoLibrary:](v7, "setPhotoLibrary:", self->_photoLibrary);
  -[PHFetchOptions setIncludeGuestAssets:](v7, "setIncludeGuestAssets:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset fetchCustomUserAssetsInMemory:options:](PHAsset, "fetchCustomUserAssetsInMemory:options:", v4, v7));
  if (!objc_msgSend(v8, "count"))
  {
    v9 = objc_claimAutoreleasedReturnValue(+[PHAsset fetchUserCuratedAssetsInMemory:options:](PHAsset, "fetchUserCuratedAssetsInMemory:options:", v4, v7));

    v8 = (void *)v9;
  }
  if (objc_msgSend(v8, "count"))
  {
    if (!v8)
      goto LABEL_13;
  }
  else
  {
    v10 = objc_claimAutoreleasedReturnValue(+[PHAsset fetchCuratedAssetsInAssetCollection:options:](PHAsset, "fetchCuratedAssetsInAssetCollection:options:", v4, v7));

    v8 = (void *)v10;
    if (!v10)
    {
LABEL_13:
      v50 = NSLocalizedDescriptionKey;
      v51 = CFSTR("photo memory asset fetch result is nil");
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1));
      v14 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 5, v15));

      v16 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[MOPhotoManager _fetchCuratedAssetsForPhotoMemory:].cold.1(v4, (uint64_t)v14, v17);

LABEL_16:
      v18 = 0;
      goto LABEL_17;
    }
  }
  if (!objc_msgSend(v8, "count"))
    goto LABEL_13;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fetchError"));

  v12 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if (v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[MOPhotoManager _fetchCuratedAssetsForPhotoMemory:].cold.2(v4, v8, v14);
    goto LABEL_16;
  }
  v39 = v7;
  v40 = v4;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v20 = objc_msgSend(v8, "count");
    *(_DWORD *)buf = 134217984;
    v48[0] = v20;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "#PhotoMemory,fetch asset result count, %lu", buf, 0xCu);
  }

  v14 = objc_alloc_init((Class)NSMutableArray);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v38 = v8;
  v21 = v8;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v22)
  {
    v23 = v22;
    v24 = 0;
    v25 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v25)
          objc_enumerationMutation(v21);
        v27 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        v28 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          ++v24;
          *(_DWORD *)buf = 67109378;
          LODWORD(v48[0]) = v24;
          WORD2(v48[0]) = 2112;
          *(_QWORD *)((char *)v48 + 6) = v27;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "#PhotoMemory,asset,id,%d,asset,%@", buf, 0x12u);
        }

        v30 = objc_msgSend(v27, "copy");
        -[NSObject addObject:](v14, "addObject:", v30);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v23);
  }

  v31 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("curationScore"), 0);
  v46 = v31;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v46, 1));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject sortedArrayUsingDescriptors:](v14, "sortedArrayUsingDescriptors:", v32));

  if ((unint64_t)objc_msgSend(v33, "count") <= 0xD)
    v34 = (uint64_t)objc_msgSend(v33, "count");
  else
    v34 = 13;
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "subarrayWithRange:", 0, v34));
  v36 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("creationDate"), 1);
  v45 = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v45, 1));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "sortedArrayUsingDescriptors:", v37));

  v7 = v39;
  v4 = v40;
  v8 = v38;
LABEL_17:

  return v18;
}

- (void)_setDynamicPropertiesForMemoryEvent:(id)a3 fromMemory:(id)a4 keyAsset:(id)a5
{
  id v8;
  id v9;
  id v10;
  id os_log;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  NSString *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  int v46;
  uint64_t v47;
  void *j;
  uint64_t v49;
  id v50;
  NSObject *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint8_t v67[128];
  uint8_t buf[4];
  _BYTE v69[18];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "#PhotoMemory,invoking _setDynamicPropertiesForMemoryEvent", buf, 2u);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoManager _fetchCuratedAssetsForPhotoMemory:](self, "_fetchCuratedAssetsForPhotoMemory:", v9));
  v14 = objc_alloc_init((Class)NSMutableArray);
  v15 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  v55 = v10;
  if (v10)
  {
    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localIdentifier"));
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v69 = v18;
      *(_WORD *)&v69[8] = 2112;
      *(_QWORD *)&v69[10] = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "#PhotoMemory, Key asset for memory,%@,is,%@ ", buf, 0x16u);

    }
    objc_msgSend(v14, "addObject:", v10);
  }
  else
  {
    if (v17)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localIdentifier"));
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v69 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "#PhotoMemory, Key asset is nil for memory,%@", buf, 0xCu);

    }
  }
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v20 = v13;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(_QWORD *)v63 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v14, "containsObject:", v25) & 1) == 0)
          objc_msgSend(v14, "addObject:", v25);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    }
    while (v22);
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
  v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subtitle"));
  v28 = (void *)v27;
  if (v26)
  {
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" ")));

    if (v28)
    {
LABEL_21:
      v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" ")));

      goto LABEL_24;
    }
  }
  else
  {
    v29 = 0;
    if (v27)
      goto LABEL_21;
  }
  v30 = 0;
LABEL_24:
  v53 = (void *)v30;
  if (v29 | v30)
  {
    if (v29 && v30)
    {
      v31 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n%@"), v29, v30);
    }
    else
    {
      if (v29)
        v32 = v29;
      else
        v32 = v30;
      v31 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v32, v52);
    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(v31);
    objc_msgSend(v8, "setPhotoMemoryTitle:", v33);

  }
  else
  {
    objc_msgSend(v8, "setPhotoMemoryTitle:", &stru_1002B68D0);
  }
  objc_msgSend(v8, "setPhotoMemoryCategory:", objc_msgSend(v9, "category"));
  v34 = objc_msgSend(v9, "subcategory");
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "photoEvent"));
  objc_msgSend(v35, "setPhotoMemorySubCategory:", v34);

  v54 = (void *)v29;
  if ((unint64_t)objc_msgSend(v14, "count") <= 0xD)
    v36 = (uint64_t)objc_msgSend(v14, "count");
  else
    v36 = 13;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "subarrayWithRange:", 0, v36));
  objc_msgSend(v8, "setPhotoMemoryAssets:", v37);

  v38 = objc_msgSend(v9, "isFavorite");
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "photoEvent"));
  objc_msgSend(v39, "setPhotoMemoryIsFavorite:", v38);

  v56 = v9;
  objc_msgSend(v9, "currentRelevanceScore");
  v41 = v40;
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "photoEvent"));
  objc_msgSend(v42, "setPhotoMemoryRelevanceScore:", v41);

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v57 = v8;
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "photoMemoryAssets"));
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
  if (v44)
  {
    v45 = v44;
    v46 = 0;
    v47 = *(_QWORD *)v59;
    do
    {
      for (j = 0; j != v45; j = (char *)j + 1)
      {
        if (*(_QWORD *)v59 != v47)
          objc_enumerationMutation(v43);
        v49 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)j);
        v50 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        v51 = objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          ++v46;
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v69 = v46;
          *(_WORD *)&v69[4] = 2112;
          *(_QWORD *)&v69[6] = v49;
          _os_log_debug_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEBUG, "#PhotoMemory,sortedasset,id,%d,asset,%@", buf, 0x12u);
        }

      }
      v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    }
    while (v45);
  }

}

- (void)fetchPhotoMemoryEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_claimAutoreleasedReturnValue(-[MOPhotoManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __90__MOPhotoManager_fetchPhotoMemoryEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
  block[3] = &unk_1002AE198;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

id __90__MOPhotoManager_fetchPhotoMemoryEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchPhotoMemoryEventsBetweenStartDate:endDate:withStoredEvents:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_fetchPhotoMemoryEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  id os_log;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  MORehydrationMetrics *v19;
  void *v20;
  void *v21;
  MORehydrationMetrics *v22;
  NSMutableArray *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  unsigned int v28;
  id v29;
  NSObject *v30;
  void *v31;
  unsigned int v32;
  unsigned int v33;
  id v34;
  NSMutableArray *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  NSMutableArray *v40;
  void (**v41)(id, void *, void *);
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  id obj;
  PHFetchOptions *v51;
  _QWORD block[5];
  id v54;
  NSMutableArray *v55;
  id v56;
  id v57;
  void (**v58)(id, void *, void *);
  _BYTE *v59;
  _QWORD *v60;
  _QWORD v61[4];
  NSObject *v62;
  _QWORD *v63;
  _QWORD v64[5];
  id v65;
  _QWORD v66[4];
  NSObject *v67;
  _BYTE *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  _BYTE buf[24];
  __int128 v75;
  id v76;
  _BYTE v77[128];
  _QWORD v78[2];

  v46 = a3;
  v47 = a4;
  v43 = a5;
  v41 = (void (**)(id, void *, void *))a6;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v10 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v46;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v47;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "#PhotoMemory,fetchPhotoMemoriesBetweenStartDate,startDate,%@,endDate,%@", buf, 0x16u);
  }

  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 17));
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("provider"), 2));
  v78[0] = v45;
  v78[1] = v44;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v78, 2));
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v11));

  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "filteredArrayUsingPredicate:", v42));
  v51 = objc_opt_new(PHFetchOptions);
  -[PHFetchOptions setPhotoLibrary:](v51, "setPhotoLibrary:", self->_photoLibrary);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("featuredState == %ul"), 1));
  -[PHFetchOptions setInternalPredicate:](v51, "setInternalPredicate:", v12);

  -[PHFetchOptions setIncludePendingMemories:](v51, "setIncludePendingMemories:", 1);
  -[PHFetchOptions setFetchLimit:](v51, "setFetchLimit:", 3);
  v13 = objc_autoreleasePoolPush();
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:](PHAssetCollection, "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v51));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "fetchError"));

  if (v14)
  {
    v15 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "fetchError"));
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v46;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&v75 = v47;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "#PhotoMemory,fetch memories hit error, %@, start date, %@, end date, %@", buf, 0x20u);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "fetchError"));
    v41[2](v41, v18, &__NSDictionary0__struct);

    v19 = [MORehydrationMetrics alloc];
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "fetchError"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "description"));
    v22 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v19, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", 17, 2, 0, v21, objc_msgSend(v48, "count"), 3, (double)(int)objc_msgSend(v48, "count"), 0.0);

    v73 = 0;
    -[MORehydrationMetrics submitMetricsWithError:](v22, "submitMetricsWithError:", &v73);

    objc_autoreleasePoolPop(v13);
  }
  else
  {
    objc_autoreleasePoolPop(v13);
    v23 = objc_opt_new(NSMutableArray);
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    obj = v49;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v70;
LABEL_9:
      v26 = 0;
      while (1)
      {
        if (*(_QWORD *)v70 != v25)
          objc_enumerationMutation(obj);
        v27 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v26);
        v28 = -[MOPhotoManager isCandidateForMemoryEvent:](self, "isCandidateForMemoryEvent:", v27);
        v29 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localIdentifier"));
          v32 = objc_msgSend(v27, "pendingState");
          v33 = objc_msgSend(v27, "isFavorite");
          v34 = objc_msgSend(v27, "category");
          *(_DWORD *)buf = 138413314;
          *(_QWORD *)&buf[4] = v31;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v32;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v33;
          LOWORD(v75) = 2048;
          *(_QWORD *)((char *)&v75 + 2) = v34;
          WORD5(v75) = 1024;
          HIDWORD(v75) = v28;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "#PhotoMemory,memoryInfo,id,%@,pendingState,%hu,isFavorite,%d,category,%lu,isCandidateForMemoryEvent,isSelected,%d", buf, 0x28u);

        }
        if (v28)
          -[NSMutableArray addObject:](v23, "addObject:", v27);
        if ((unint64_t)-[NSMutableArray count](v23, "count") > 2)
          break;
        if (v24 == (id)++v26)
        {
          v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
          if (v24)
            goto LABEL_9;
          break;
        }
      }
    }

    v35 = v23;
    v36 = dispatch_group_create();
    dispatch_group_enter(v36);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&v75 = __Block_byref_object_copy__34;
    *((_QWORD *)&v75 + 1) = __Block_byref_object_dispose__34;
    v76 = 0;
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = __91__MOPhotoManager__fetchPhotoMemoryEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
    v66[3] = &unk_1002ADC00;
    v68 = buf;
    v37 = v36;
    v67 = v37;
    -[MOPhotoManager _rehydrateStoredEvents:fromPhotoMemories:fetchResult:handler:](self, "_rehydrateStoredEvents:fromPhotoMemories:fetchResult:handler:", v48, v35, obj, v66);
    dispatch_group_enter(v37);
    v64[0] = 0;
    v64[1] = v64;
    v64[2] = 0x3032000000;
    v64[3] = __Block_byref_object_copy__34;
    v64[4] = __Block_byref_object_dispose__34;
    v65 = 0;
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = __91__MOPhotoManager__fetchPhotoMemoryEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_2;
    v61[3] = &unk_1002ADC00;
    v63 = v64;
    v38 = v37;
    v62 = v38;
    -[MOPhotoManager _createNewEventsFromPhotoMemories:storedEvents:handler:](self, "_createNewEventsFromPhotoMemories:storedEvents:handler:", v35, v48, v61);
    v39 = objc_claimAutoreleasedReturnValue(-[MOPhotoManager queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __91__MOPhotoManager__fetchPhotoMemoryEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_3;
    block[3] = &unk_1002B5300;
    block[4] = self;
    v54 = v48;
    v55 = v35;
    v56 = v46;
    v57 = v47;
    v59 = buf;
    v60 = v64;
    v58 = v41;
    v40 = v35;
    dispatch_group_notify(v38, v39, block);

    _Block_object_dispose(v64, 8);
    _Block_object_dispose(buf, 8);

  }
}

void __91__MOPhotoManager__fetchPhotoMemoryEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __91__MOPhotoManager__fetchPhotoMemoryEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __91__MOPhotoManager__fetchPhotoMemoryEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke_3(uint64_t a1)
{
  NSMutableDictionary *v2;
  void *v3;
  id os_log;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *j;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *k;
  void *v39;
  id v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint8_t v60[128];
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  id v66;
  __int16 v67;
  id v68;
  __int16 v69;
  id v70;
  __int16 v71;
  id v72;

  v2 = objc_opt_new(NSMutableDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_findUnrehydratedEventsWithStoredEvents:photoMemories:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(void **)(a1 + 56);
    v7 = *(void **)(a1 + 64);
    v8 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "count");
    v9 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "count");
    v10 = objc_msgSend(v3, "count");
    v11 = objc_msgSend(*(id *)(a1 + 40), "count");
    *(_DWORD *)buf = 138413570;
    v62 = v6;
    v63 = 2112;
    v64 = v7;
    v65 = 2048;
    v66 = v8;
    v67 = 2048;
    v68 = v9;
    v69 = 2048;
    v70 = v10;
    v71 = 2048;
    v72 = v11;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "start date, %@, end date, %@, rehydrated memory events count, %lu, new memory event counts, %lu, unrehydrated memory events count, %lu, stored memory events.count, %lu", buf, 0x3Eu);
  }

  v45 = a1;
  v44 = v3;
  if (v3)
  {
    -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", v3, CFSTR("unrehydratedEvents"));
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v12 = v3;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v55 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
          v18 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "eventIdentifier"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifierFromProvider"));
            *(_DWORD *)buf = 138412546;
            v62 = v20;
            v63 = 2112;
            v64 = v21;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "#PhotoMemory,unrehydratedEvents,event id,%@,memory id,%@,", buf, 0x16u);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
      }
      while (v14);
    }

    a1 = v45;
    v3 = v44;
  }
  v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  if (v22)
  {
    -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", v22, CFSTR("newEvents"));
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v23 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v51;
      do
      {
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          if (*(_QWORD *)v51 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)j);
          v29 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          v30 = objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "eventIdentifier"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "identifierFromProvider"));
            *(_DWORD *)buf = 138412546;
            v62 = v31;
            v63 = 2112;
            v64 = v32;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "#PhotoMemory,newEvents,event id,%@,memory id,%@,", buf, 0x16u);

          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
      }
      while (v25);
    }

    a1 = v45;
    v3 = v44;
  }
  v33 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  if (v33)
  {
    -[NSMutableDictionary setObject:forKey:](v2, "setObject:forKey:", v33, CFSTR("rehydratedEvents"));
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v34 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v47;
      do
      {
        for (k = 0; k != v36; k = (char *)k + 1)
        {
          if (*(_QWORD *)v47 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)k);
          v40 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
          v41 = objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "eventIdentifier"));
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "identifierFromProvider"));
            *(_DWORD *)buf = 138412546;
            v62 = v42;
            v63 = 2112;
            v64 = v43;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "#PhotoMemory,rehydratedEvents,event id,%@,memory id,%@,", buf, 0x16u);

          }
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
      }
      while (v36);
    }

    a1 = v45;
    v3 = v44;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

}

- (void)_createNewEventsFromPhotoMemories:(id)a3 storedEvents:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id os_log;
  NSObject *v12;
  PHFetchOptions *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  _UNKNOWN **v21;
  NSMutableArray *v22;
  uint64_t v23;
  void *v24;
  NSMutableDictionary *v25;
  NSMutableSet *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  id v43;
  NSObject *v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  void *j;
  void *v50;
  void *v51;
  unsigned __int8 v52;
  NSMutableDictionary *v53;
  id v54;
  NSObject *v55;
  void *v56;
  NSMutableDictionary *v57;
  void *v58;
  char *v59;
  NSMutableArray *v60;
  unint64_t v61;
  void *v62;
  id v63;
  NSObject *v64;
  void *v65;
  unsigned int v66;
  unsigned int v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  NSMutableDictionary *v72;
  void *v73;
  NSNumber *v74;
  void *v75;
  void *v76;
  id v77;
  NSObject *v78;
  id v79;
  NSMutableDictionary *v80;
  void *v81;
  void *v82;
  PHFetchOptions *v83;
  id v84;
  id v85;
  id v86;
  void *v87;
  NSMutableArray *v88;
  NSMutableDictionary *v89;
  void *obj;
  void *v91;
  MOPhotoManager *v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint8_t buf[4];
  id v102;
  __int16 v103;
  _BYTE v104[10];
  __int16 v105;
  id v106;
  _BYTE v107[128];
  _BYTE v108[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "#PhotoMemory,invoking _createNewEventsFromPhotoMemories", buf, 2u);
  }

  v13 = objc_opt_new(PHFetchOptions);
  -[PHFetchOptions setPhotoLibrary:](v13, "setPhotoLibrary:", self->_photoLibrary);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("featuredState == %ul"), 1));
  -[PHFetchOptions setInternalPredicate:](v13, "setInternalPredicate:", v14);

  -[PHFetchOptions setIncludePendingMemories:](v13, "setIncludePendingMemories:", 1);
  v15 = objc_autoreleasePoolPush();
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:](PHAssetCollection, "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v13));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fetchError"));

  if (v17)
  {
    v18 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MOPhotoManager _createNewEventsFromPhotoMemories:storedEvents:handler:].cold.1(v16, v19);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions"));
  v87 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset fetchKeyAssetByMemoryUUIDForMemories:options:](PHAsset, "fetchKeyAssetByMemoryUUIDForMemories:options:", v16, v20));

  objc_autoreleasePoolPop(v15);
  if (objc_msgSend(v8, "count"))
  {
    v82 = v16;
    v83 = v13;
    v84 = v10;
    v85 = v9;
    v21 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
    v22 = objc_opt_new(NSMutableArray);
    v23 = objc_claimAutoreleasedReturnValue(-[MOPhotoManager _getPhotoMemoryPlistFileURL](self, "_getPhotoMemoryPlistFileURL"));
    v92 = self;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoManager _readPhotoMemoryPlistFile:](self, "_readPhotoMemoryPlistFile:", v23));
    v25 = objc_opt_new(NSMutableDictionary);
    v88 = v22;
    v86 = v8;
    v81 = (void *)v23;
    v91 = v24;
    if (v23 && v24)
    {
      v89 = (NSMutableDictionary *)objc_msgSend(v24, "mutableCopy");

      v26 = objc_opt_new(NSMutableSet);
      v97 = 0u;
      v98 = 0u;
      v99 = 0u;
      v100 = 0u;
      obj = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "allKeys"));
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v108, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v98;
        do
        {
          for (i = 0; i != v28; i = (char *)i + 1)
          {
            if (*(_QWORD *)v98 != v29)
              objc_enumerationMutation(obj);
            v31 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * (_QWORD)i);
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "objectForKeyedSubscript:", v31));
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("photoMemoryID")));
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("photoMemoryIDFirstPersistTime")));
            objc_msgSend(v34, "doubleValue");
            v36 = v35;

            v37 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoManager configurationManager](v92, "configurationManager"));
            objc_msgSend(v37, "getDoubleSettingForKey:withFallback:", CFSTR("PhotoMemoryIDPersistDuration"), 7257600.0);
            v39 = v38;

            v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
            objc_msgSend(v40, "timeIntervalSinceReferenceDate");
            v42 = v41 - v36;

            if (v42 >= v39)
            {
              -[NSMutableDictionary removeObjectForKey:](v89, "removeObjectForKey:", v31);
              v43 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
              v44 = objc_claimAutoreleasedReturnValue(v43);
              if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v102 = v31;
                v103 = 2048;
                *(double *)v104 = v39;
                _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Removing %@ entries in photo as it is stored more than %f seconds ago", buf, 0x16u);
              }

            }
            else
            {
              -[NSMutableSet addObject:](v26, "addObject:", v33);
            }

          }
          v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v108, 16);
        }
        while (v28);
      }

      v95 = 0u;
      v96 = 0u;
      v93 = 0u;
      v94 = 0u;
      v45 = v8;
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v93, v107, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v94;
        do
        {
          for (j = 0; j != v47; j = (char *)j + 1)
          {
            if (*(_QWORD *)v94 != v48)
              objc_enumerationMutation(v45);
            v50 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)j);
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "localIdentifier"));
            v52 = -[NSMutableSet containsObject:](v26, "containsObject:", v51);

            if ((v52 & 1) == 0)
              -[NSMutableArray addObject:](v22, "addObject:", v50);
          }
          v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v93, v107, 16);
        }
        while (v47);
      }

      v53 = v89;
      v21 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
    }
    else
    {
      -[NSMutableArray addObjectsFromArray:](v22, "addObjectsFromArray:", v8);
      v53 = v25;
    }
    v56 = (void *)objc_opt_new(v21[310]);
    v57 = v53;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v53, "allKeys"));
    v59 = (char *)objc_msgSend(v58, "count");

    if (-[NSMutableArray count](v22, "count"))
    {
      v60 = v22;
      v61 = 0;
      do
      {
        v62 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v60, "objectAtIndex:", v61));
        v63 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
        v64 = objc_claimAutoreleasedReturnValue(v63);
        if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
        {
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "localIdentifier"));
          v66 = objc_msgSend(v62, "pendingState");
          v67 = objc_msgSend(v62, "isFavorite");
          v68 = objc_msgSend(v62, "category");
          *(_DWORD *)buf = 138413058;
          v102 = v65;
          v103 = 1024;
          *(_DWORD *)v104 = v66;
          *(_WORD *)&v104[4] = 1024;
          *(_DWORD *)&v104[6] = v67;
          v105 = 2048;
          v106 = v68;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "#PhotoMemory,memoryInfo,id,%@,pendingState,%hu,isFavorite,%d,category,%lu", buf, 0x22u);

        }
        v69 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoManager _createEventFromPhotoMemory:](v92, "_createEventFromPhotoMemory:", v62));
        if (v69)
        {
          v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "uuid"));
          v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "objectForKeyedSubscript:", v70));

          -[MOPhotoManager _setDynamicPropertiesForMemoryEvent:fromMemory:keyAsset:](v92, "_setDynamicPropertiesForMemoryEvent:fromMemory:keyAsset:", v69, v62, v71);
          objc_msgSend(v56, "addObject:", v69);
          v72 = objc_opt_new(NSMutableDictionary);
          v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "localIdentifier"));
          -[NSMutableDictionary setObject:forKey:](v72, "setObject:forKey:", v73, CFSTR("photoMemoryID"));

          v74 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CFAbsoluteTimeGetCurrent());
          v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
          -[NSMutableDictionary setObject:forKey:](v72, "setObject:forKey:", v75, CFSTR("photoMemoryIDFirstPersistTime"));

          v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%d"), CFSTR("photoMemory"), &v59[v61]));
          -[NSMutableDictionary setObject:forKey:](v57, "setObject:forKey:", v72, v76);

        }
        ++v61;
        v60 = v88;
      }
      while ((unint64_t)-[NSMutableArray count](v88, "count") > v61);
    }
    v77 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v78 = objc_claimAutoreleasedReturnValue(v77);
    if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
    {
      v79 = objc_msgSend(v56, "count");
      *(_DWORD *)buf = 134217984;
      v102 = v79;
      _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, "#PhotoMemory, create %lu new memory events", buf, 0xCu);
    }

    v80 = v57;
    -[MOPhotoManager _persistPhotoMemoryPlistFile:withData:](v92, "_persistPhotoMemoryPlistFile:withData:", v81, v57);
    v10 = v84;
    (*((void (**)(id, void *, _QWORD))v84 + 2))(v84, v56, 0);

    v9 = v85;
    v8 = v86;
    v16 = v82;
    v13 = v83;
  }
  else
  {
    v54 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v55 = objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "#PhotoMemory,result of fetched memories contains no memory to create new events", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }

}

- (id)_findUnrehydratedEventsWithStoredEvents:(id)a3 photoMemories:(id)a4
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSMutableSet *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *j;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  id v25;
  NSObject *v26;
  id v27;
  id v28;
  NSObject *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *k;
  id v35;
  NSObject *v36;
  id v37;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint8_t v53[128];
  uint8_t buf[4];
  id v55;
  _BYTE v56[128];

  v5 = a3;
  v6 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#PhotoMemory,invoking _findUnrehydratedEventsWithStoredEvents", buf, 2u);
  }

  if (objc_msgSend(v5, "count"))
  {
    if (objc_msgSend(v6, "count"))
    {
      v9 = objc_opt_new(NSMutableSet);
      v10 = objc_alloc_init((Class)NSMutableArray);
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v39 = v6;
      v11 = v6;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v45 != v14)
              objc_enumerationMutation(v11);
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i), "localIdentifier"));
            -[NSMutableSet addObject:](v9, "addObject:", v16);

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
        }
        while (v13);
      }

      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v17 = v5;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v41;
        do
        {
          for (j = 0; j != v19; j = (char *)j + 1)
          {
            if (*(_QWORD *)v41 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)j);
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifierFromProvider"));
            v24 = -[NSMutableSet containsObject:](v9, "containsObject:", v23);

            if ((v24 & 1) == 0)
            {
              objc_msgSend(v22, "setRehydrationFailCount:", (char *)objc_msgSend(v22, "rehydrationFailCount") + 1);
              objc_msgSend(v10, "addObject:", v22);
            }
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
        }
        while (v19);
      }

      v25 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v27 = objc_msgSend(v10, "count");
        *(_DWORD *)buf = 134217984;
        v55 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "#PhotoMemory,unrehydrated photo memories count, %lu", buf, 0xCu);
      }

      v6 = v39;
    }
    else
    {
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v30 = v5;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v49;
        do
        {
          for (k = 0; k != v32; k = (char *)k + 1)
          {
            if (*(_QWORD *)v49 != v33)
              objc_enumerationMutation(v30);
            objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)k), "setRehydrationFailCount:", (char *)objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)k), "rehydrationFailCount") + 1);
          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
        }
        while (v32);
      }

      v35 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        v37 = objc_msgSend(v30, "count");
        *(_DWORD *)buf = 134217984;
        v55 = v37;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "#PhotoMemory,result of fetched memories contains no memory, so all stored events are unRehydrated, count, %lu", buf, 0xCu);
      }

      v10 = v30;
    }
  }
  else
  {
    v28 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "#PhotoMemory, no stored photo memeory events for finding unrehydrated events", buf, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (id)_getPhotoMemoryPlistFileURL
{
  void *v2;
  void *v3;
  void *v4;
  id os_log;
  NSObject *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MOPersistenceManager userCacheDirectoryPath](MOPersistenceManager, "userCacheDirectoryPath"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v2, 1));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("photoMemoryID.plist")));

  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MOPhotoManager _getPhotoMemoryPlistFileURL].cold.1();

    v4 = 0;
  }

  return v4;
}

- (id)_readPhotoMemoryPlistFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id os_log;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  NSObject *v17;
  uint8_t v19[8];
  id v20;

  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
    v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

    if (v6)
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityStreamingPatternDetection);
      v8 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[MOPhotoManager _readPhotoMemoryPlistFile:].cold.2(v8, v9, v10);

      v20 = 0;
      v11 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfURL:error:", v3, &v20);
      v12 = v20;
      if (v12)
      {
        v13 = _mo_log_facility_get_os_log(&MOLogFacilityStreamingPatternDetection);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[MOPhotoManager _readPhotoMemoryPlistFile:].cold.1();

        v15 = 0;
      }
      else
      {
        v15 = v11;
      }

    }
    else
    {
      v16 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "No photo memory idplist found at path.", v19, 2u);
      }

      v15 = objc_alloc_init((Class)NSDictionary);
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)_persistPhotoMemoryPlistFile:(id)a3 withData:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  BOOL v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  BOOL v13;
  unsigned __int8 v14;
  id os_log;
  NSObject *v16;
  __int16 v18[8];
  id v19;
  id v20;

  v5 = a3;
  if (v5)
  {
    v20 = 0;
    v6 = objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", a4, 100, 0, &v20));
    v7 = v20;
    if (v6)
      v8 = v7 == 0;
    else
      v8 = 0;
    if (v8)
    {
      v19 = 0;
      v14 = -[NSObject writeToURL:options:error:](v6, "writeToURL:options:error:", v5, 805306369, &v19);
      v9 = v19;
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      v16 = objc_claimAutoreleasedReturnValue(os_log);
      v11 = v16;
      if (!v9 && (v14 & 1) != 0)
      {
        v13 = 1;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v18[0] = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "photo memory id was successfully written to plist.", (uint8_t *)v18, 2u);
        }
        v9 = v11;
        goto LABEL_19;
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[MOPhotoManager _persistPhotoMemoryPlistFile:withData:].cold.3();
    }
    else
    {
      v9 = v7;
      v10 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[MOPhotoManager _persistPhotoMemoryPlistFile:withData:].cold.2();
    }

    v13 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v12 = _mo_log_facility_get_os_log(&MOLogFacilityPhoto);
  v6 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[MOPhotoManager _persistPhotoMemoryPlistFile:withData:].cold.1();
  v13 = 0;
LABEL_20:

  return v13;
}

- (BOOL)_deletePhotoMemoryPlistFile:(id)a3
{
  return -[MOPhotoManager _persistPhotoMemoryPlistFile:withData:](self, "_persistPhotoMemoryPlistFile:withData:", a3, &__NSDictionary0__struct);
}

- (void)deletePhotoMemoryPlistFile
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MOPhotoManager _getPhotoMemoryPlistFileURL](self, "_getPhotoMemoryPlistFileURL"));
  -[MOPhotoManager _deletePhotoMemoryPlistFile:](self, "_deletePhotoMemoryPlistFile:", v3);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibrary, a3);
}

- (PHPhotoLibrary)syndicationPhotoLibrary
{
  return self->_syndicationPhotoLibrary;
}

- (void)setSyndicationPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_syndicationPhotoLibrary, a3);
}

- (MOEventStore)eventStore
{
  return self->_eventStore;
}

- (void)setEventStore:(id)a3
{
  objc_storeStrong((id *)&self->_eventStore, a3);
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_configurationManager, a3);
}

- (NSString)suggestedMePersonIdentifier
{
  return self->_suggestedMePersonIdentifier;
}

- (void)setSuggestedMePersonIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedMePersonIdentifier, a3);
}

- (PHPerson)mePerson
{
  return self->_mePerson;
}

- (void)setMePerson:(id)a3
{
  objc_storeStrong((id *)&self->_mePerson, a3);
}

- (CNContact)meContact
{
  return self->_meContact;
}

- (void)setMeContact:(id)a3
{
  objc_storeStrong((id *)&self->_meContact, a3);
}

- (GDVisualIdentifierView)visualIdentifierView
{
  return self->_visualIdentifierView;
}

- (GDEntityTaggingService)entityTaggingSerice
{
  return self->_entityTaggingSerice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityTaggingSerice, 0);
  objc_storeStrong((id *)&self->_visualIdentifierView, 0);
  objc_storeStrong((id *)&self->_meContact, 0);
  objc_storeStrong((id *)&self->_mePerson, 0);
  objc_storeStrong((id *)&self->_suggestedMePersonIdentifier, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_eventStore, 0);
  objc_storeStrong((id *)&self->_syndicationPhotoLibrary, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithUniverse:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, v0, v1, "Error getting suggested me person from the photo library: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)initWithUniverse:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Photo library unavailable, killing momentsd.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)initWithUniverse:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, v0, v1, "Error opening syndication photo library: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)initWithUniverse:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, v0, v1, "Error opening user photo library: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)intializeEntityTaggingService
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "localizedDescription"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, a2, v4, "#megadome,GDEntityTaggingService init failed,error,%@", v5);

  OUTLINED_FUNCTION_5();
}

- (void)getClassificationInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Visual Identifier returned a nil mdPerson", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)getClassificationInfo:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "#megadome,GDRankedPersonEntityTags tags are nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)getClassificationInfo:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, v0, v1, "#megadome,GDRankedPersonEntityTags fetch hit error, %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_buildCuratedAssetMap:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, v0, v1, "#assetscore, requestCurationScoreByAssetUUIDForAssetUUIDs, photoQueryError, %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_fetchPhotoMemoriesBetweenStartDate:EndDate:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "#PhotoMemory,memories fetch count during collect is invalid,%@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_fetchPhotoMemoriesBetweenStartDate:(void *)a1 EndDate:(char *)a2 handler:.cold.2(void *a1, char *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_4_3(a1, a2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, a2, v3, "#PhotoMemory,fetch result count, %lu", v4);
  OUTLINED_FUNCTION_5();
}

- (void)_fetchPhotoMemoriesBetweenStartDate:EndDate:handler:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_4_8((void *)&_mh_execute_header, v0, v1, "#PhotoMemory,fetchPhotoMemoriesBetweenStartDate,startDate,%@,endDate,%@");
  OUTLINED_FUNCTION_1();
}

- (void)isDesirableCategoryOrTrigger:(char)a1 .cold.1(char a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "#PhotoMemory,isDesirableCategory,%d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_2_2();
}

- (void)isDesirableCategoryOrTrigger:(os_log_t)log .cold.2(char a1, uint64_t a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;

  v3 = *(unsigned __int8 *)(*(_QWORD *)a2 + 24);
  v4[0] = 67109376;
  v4[1] = a1 & 1;
  v5 = 1024;
  v6 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "#PhotoMemory,isDesirableCategory,%d,isDesirableTrigger,%d", (uint8_t *)v4, 0xEu);
  OUTLINED_FUNCTION_1();
}

- (void)fetchAndSavePhotoMemoriesStartDate:EndDate:handler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_4_8((void *)&_mh_execute_header, v0, v1, "#PhotoMemory,fetchAndSavePhotoMemoriesStartDate,startDate,%@,endDate,%@");
  OUTLINED_FUNCTION_1();
}

void __69__MOPhotoManager_fetchAndSavePhotoMemoriesStartDate_EndDate_handler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, v0, v1, "#PhotoMemory,no photo memories are fetched", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __69__MOPhotoManager_fetchAndSavePhotoMemoriesStartDate_EndDate_handler___block_invoke_cold_2(void *a1, char *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_4_3(a1, a2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, a2, v3, "#PhotoMemory,saving %lu photo memories", v4);
  OUTLINED_FUNCTION_5();
}

- (void)_saveEvents:category:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "saveEvents,category,%lu", v2);
  OUTLINED_FUNCTION_1();
}

void __47__MOPhotoManager__saveEvents_category_handler___block_invoke_290_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = 134218242;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_0_10((void *)&_mh_execute_header, a3, (uint64_t)a3, "saving category %lu photo events into database failed, error %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

- (void)_rehydrateSharedPhotos:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, v0, v1, "fetch result is nil from syndication library for rehydration,error, %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_rehydrateSharedPhotos:(void *)a1 handler:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetchError"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, a2, v4, "fetch shared photo for rehydration from syndication library hit error, %@", v5);

  OUTLINED_FUNCTION_5();
}

- (void)_rehydratePhotoMemories:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "#PhotoMemory,memories fetch during rehydration is nil, error, %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_rehydratePhotoMemories:handler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "#PhotoMemory,memories fetch count during rehydration is nil,%@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_rehydratePhotoMemories:(void *)a1 handler:(char *)a2 .cold.3(void *a1, char *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_4_3(a1, a2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, a2, v3, "#PhotoMemory,fetch memory result count, %lu", v4);
  OUTLINED_FUNCTION_5();
}

- (void)_rehydratePhotoMemories:(void *)a1 handler:(NSObject *)a2 .cold.4(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetchError"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, a2, v4, "#PhotoMemory,rehydrate memories hit error, %@,", v5);

  OUTLINED_FUNCTION_5();
}

- (void)_rehydratePhotoMemories:(void *)a1 handler:(char *)a2 .cold.5(void *a1, char *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_4_3(a1, a2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, a2, v3, "#PhotoMemory,start rehydrating photo memories with local identifiers, identifier count, %lu", v4);
  OUTLINED_FUNCTION_5();
}

- (void)_rehydratePhotoMemories:handler:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, v0, v1, "#PhotoMemory,_rehydratePhotoMemories", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __50__MOPhotoManager__rehydratePhotoMemories_handler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "identifierFromProvider"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, a2, v4, "#PhotoMemory,adding identifier to assetLocalIdentifiers: %@", v5);

  OUTLINED_FUNCTION_5();
}

- (void)_updatePhotoEventsDeletedAtSource:library:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, v0, v1, "fetch result is nil from photo library for purge, error, %@", v2);
  OUTLINED_FUNCTION_1();
}

void __68__MOPhotoManager__updatePhotoEventsDeletedAtSource_library_handler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, v0, v1, "failed to update photo, error, %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_updatePhotoMemoriesDeletedAtSource:(void *)a1 library:(NSObject *)a2 handler:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetchError"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, a2, v4, "#PhotoMemory,fetch memories hit error, %@,", v5);

  OUTLINED_FUNCTION_5();
}

void __70__MOPhotoManager__updatePhotoMemoriesDeletedAtSource_library_handler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, v0, v1, "failed to update photo memories, error, %@", v2);
  OUTLINED_FUNCTION_1();
}

void __44__MOPhotoManager_fetchAssetUsingID_handler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, v0, v1, "fetch result is nil from photo library for fetchAssetUsingID,error, %@", v2);
  OUTLINED_FUNCTION_1();
}

void __44__MOPhotoManager_fetchAssetUsingID_handler___block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetchError"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, a2, v4, "fetch error for fetchAssetUsingID, %@", v5);

  OUTLINED_FUNCTION_5();
}

- (void)_rehydrateStoredEvents:fromPhotoMemories:fetchResult:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "rehydrateEvents:no input events for rehydrating photo memory events", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_rehydrateStoredEvents:fromPhotoMemories:fetchResult:handler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "rehydrateEvents:no photo memory fecthed for rehydrating photo memory events", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_fetchCuratedAssetsForPhotoMemory:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localIdentifier"));
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = a2;
  OUTLINED_FUNCTION_0_10((void *)&_mh_execute_header, a3, v6, "#PhotoMemory,photo memory asset fetch result is nil for memory: %@, error, %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_2_0();
}

- (void)_fetchCuratedAssetsForPhotoMemory:(NSObject *)a3 .cold.2(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "localIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "fetchError"));
  v8 = 138412546;
  v9 = v5;
  v10 = 2112;
  v11 = v6;
  OUTLINED_FUNCTION_0_10((void *)&_mh_execute_header, a3, v7, "#PhotoMemory,photo memory asset fetch for memory: %@  hit error, %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)_createNewEventsFromPhotoMemories:(void *)a1 storedEvents:(NSObject *)a2 handler:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetchError"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, a2, v4, "#PhotoMemory,fetch memories hit error,keyasset not inferred, %@", v5);

  OUTLINED_FUNCTION_5();
}

- (void)_getPhotoMemoryPlistFileURL
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Failed to get cache directory to store photo memory id plist file, nil cache directory.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_readPhotoMemoryPlistFile:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, v0, v1, "Could not read the photo memory id plist file, error: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_readPhotoMemoryPlistFile:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const __CFString *v4;

  v3 = 138412290;
  v4 = CFSTR("photoMemoryID.plist");
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, a1, a3, "File %@ found.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)_persistPhotoMemoryPlistFile:withData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid path for photo memory id plist file.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_persistPhotoMemoryPlistFile:withData:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, v0, v1, "photo memory id serialization to NSData failed or returned nil, %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_persistPhotoMemoryPlistFile:withData:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_2((void *)&_mh_execute_header, v0, v1, "Couldn't write to the photo memory id plist file, %@", v2);
  OUTLINED_FUNCTION_1();
}

@end
