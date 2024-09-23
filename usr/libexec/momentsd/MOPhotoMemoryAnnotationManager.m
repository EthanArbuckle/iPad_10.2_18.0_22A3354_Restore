@implementation MOPhotoMemoryAnnotationManager

- (MOPhotoMemoryAnnotationManager)initWithUniverse:(id)a3
{
  id v5;
  MOPhotoMemoryAnnotationManager *v6;
  uint64_t v7;
  MOPhotoMemoryAnnotationManager *v8;
  objc_class *v9;
  NSString *v10;
  id v11;
  const char *v12;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  objc_super v18;

  v5 = a3;
  objc_storeStrong((id *)&self->fUniverse, a3);
  v18.receiver = self;
  v18.super_class = (Class)MOPhotoMemoryAnnotationManager;
  v6 = -[MOPhotoMemoryAnnotationManager init](&v18, "init");
  v8 = v6;
  if (v6)
  {
    v9 = (objc_class *)objc_opt_class(v6, v7);
    v10 = NSStringFromClass(v9);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v10));
    v12 = (const char *)objc_msgSend(v11, "UTF8String");
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = dispatch_queue_create(v12, v14);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v15;

  }
  return v8;
}

- (void)performAnnotationWithEvents:(id)a3 handler:(id)a4
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

  v6 = a3;
  v7 = a4;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[MOPhotoMemoryAnnotationManager performAnnotationWithEvents:handler:].cold.1();

  v10 = objc_claimAutoreleasedReturnValue(-[MOPhotoMemoryAnnotationManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __70__MOPhotoMemoryAnnotationManager_performAnnotationWithEvents_handler___block_invoke;
  block[3] = &unk_1002AEBA8;
  block[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  dispatch_async(v10, block);

}

void __70__MOPhotoMemoryAnnotationManager_performAnnotationWithEvents_handler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = __70__MOPhotoMemoryAnnotationManager_performAnnotationWithEvents_handler___block_invoke_2;
  v3[3] = &unk_1002ADFD8;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "_performAnnotationWithEvents:handler:", v2, v3);

}

uint64_t __70__MOPhotoMemoryAnnotationManager_performAnnotationWithEvents_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_performAnnotationWithEvents:(id)a3 handler:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  id v7;
  id os_log;
  NSObject *v9;
  void *v10;
  id v11;
  char *v12;
  void *v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;

  v6 = (void (**)(id, void *, _QWORD))a4;
  v7 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v9 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[MOPhotoMemoryAnnotationManager _performAnnotationWithEvents:handler:].cold.4();

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoMemoryAnnotationManager getBaseEvents:](self, "getBaseEvents:", v7));
  v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v12 = (char *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEBUG))
    -[MOPhotoMemoryAnnotationManager _performAnnotationWithEvents:handler:].cold.3(v10, v12);

  if (objc_msgSend(v10, "count"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOPhotoMemoryAnnotationManager annotateBaseEvents:](self, "annotateBaseEvents:", v10));
    v14 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
    if (v13)
    {
      if (v16)
        -[MOPhotoMemoryAnnotationManager _performAnnotationWithEvents:handler:].cold.2(v13, (const char *)v15);
    }
    else if (v16)
    {
      -[MOPhotoMemoryAnnotationManager _performAnnotationWithEvents:handler:].cold.1();
    }

    v6[2](v6, v13, 0);
  }
  else
  {
    v6[2](v6, &__NSArray0__struct, 0);
  }

}

- (id)getBaseEvents:(id)a3
{
  id v3;
  id os_log;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  char *v9;

  v3 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[MOPhotoMemoryAnnotationManager getBaseEvents:].cold.2();

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 17));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "filteredArrayUsingPredicate:", v6));

  v8 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v9 = (char *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG))
    -[MOPhotoMemoryAnnotationManager getBaseEvents:].cold.1(v7, v9);

  return v7;
}

- (id)annotateBaseEvents:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  MOEventBundle *v6;
  void *v7;
  void *v8;
  MOEventBundle *v9;
  NSMutableArray *v10;
  MOAction *v11;
  void *v12;
  MOAction *v13;
  NSMutableArray *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  MOResource *v24;
  id os_log;
  NSObject *v26;
  NSMutableDictionary *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  MOResource *v37;
  id v38;
  NSObject *v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v47;
  id obj;
  uint64_t v49;
  NSMutableArray *v50;
  id v51;
  void *v52;
  NSMutableArray *v53;
  MOEventBundle *v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  _QWORD v70[2];
  _QWORD v71[2];
  _BYTE v72[128];
  _BYTE v73[128];

  v3 = a3;
  if (v3)
  {
    v50 = objc_opt_new(NSMutableArray);
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v47 = v3;
    obj = v3;
    v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
    if (v51)
    {
      v49 = *(_QWORD *)v61;
LABEL_4:
      v4 = 0;
      while (2)
      {
        if (*(_QWORD *)v61 != v49)
          objc_enumerationMutation(obj);
        v55 = v4;
        v5 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v4);
        v6 = [MOEventBundle alloc];
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        v9 = -[MOEventBundle initWithBundleIdentifier:creationDate:](v6, "initWithBundleIdentifier:creationDate:", v7, v8);

        -[MOEventBundle setInterfaceType:](v9, "setInterfaceType:", 10);
        v10 = objc_opt_new(NSMutableArray);
        -[NSMutableArray addObject:](v10, "addObject:", v5);
        v53 = v10;
        -[MOEventBundle setEvents:](v9, "setEvents:", v10);
        -[MOEventBundle setPropertiesBasedOnEvents](v9, "setPropertiesBasedOnEvents");
        v11 = [MOAction alloc];
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "photoMemoryTitle"));
        v13 = -[MOAction initWithActionName:actionType:actionSubtype:](v11, "initWithActionName:actionType:actionSubtype:", v12, 1, 7);
        v54 = v9;
        -[MOEventBundle setAction:](v9, "setAction:", v13);

        v14 = objc_opt_new(NSMutableArray);
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v52 = v5;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "photoMemoryAssets"));
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v57;
          do
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(_QWORD *)v57 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i);
              v70[0] = CFSTR("MOPhotoResourceTypeKey");
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "resourceType"));
              v70[1] = CFSTR("MOPhotoResourceLocalIdentifier");
              v71[0] = v21;
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localIdentifier"));
              v71[1] = v22;
              v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v71, v70, 2));

              v24 = -[MOResource initWithName:type:dict:value:]([MOResource alloc], "initWithName:type:dict:value:", CFSTR("Photo"), 2, v23, 0.0);
              os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
              v26 = objc_claimAutoreleasedReturnValue(os_log);
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v65 = v20;
                _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "PhotoMemory:creating new MOResource with identifier,%@", buf, 0xCu);
              }

              -[NSMutableArray addObject:](v14, "addObject:", v24);
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
          }
          while (v17);
        }

        v27 = objc_opt_new(NSMutableDictionary);
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "identifierFromProvider"));
        -[NSMutableDictionary setObject:forKey:](v27, "setObject:forKey:", v28, CFSTR("MOPHMemoryMetaDataKeyMemoryIdentifier"));

        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "photoMemoryTitle"));
        -[NSMutableDictionary setObject:forKey:](v27, "setObject:forKey:", v29, CFSTR("MOPHMemoryMetaDataKeyMemoryTitle"));

        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "photoEvent"));
        objc_msgSend(v30, "photoMemoryRelevanceScore");
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
        -[NSMutableDictionary setObject:forKey:](v27, "setObject:forKey:", v31, CFSTR("MOPHMemoryMetaDataKeyMemoryRelevanceScore"));

        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "photoEvent"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v32, "photoMemoryIsFavorite")));
        -[NSMutableDictionary setObject:forKey:](v27, "setObject:forKey:", v33, CFSTR("MOPHMemoryMetaDataKeyMemoryIsFavorite"));

        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "photoEvent"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v34, "photoMemorySubCategory")));
        -[NSMutableDictionary setObject:forKey:](v27, "setObject:forKey:", v35, CFSTR("MOPHMemoryMetaDataKeyMemorySubCategory"));

        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v52, "photoMemoryCategory")));
        -[NSMutableDictionary setObject:forKey:](v27, "setObject:forKey:", v36, CFSTR("MOPHMemoryMetaDataKeyMemoryCategory"));

        v37 = -[MOResource initWithName:type:dict:value:]([MOResource alloc], "initWithName:type:dict:value:", CFSTR("PhotoMemory"), 15, v27, 0.0);
        -[NSMutableArray addObject:](v14, "addObject:", v37);
        v38 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v39 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "eventIdentifier"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "identifierFromProvider"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "photoMemoryTitle"));
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "mask"));
          *(_DWORD *)buf = 138412802;
          v65 = v42;
          v66 = 2112;
          v67 = v43;
          v68 = 2112;
          v69 = v45;
          _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "PhotoMemory: created bundle for memory,eventIdentifier,%@,identifierFromProvider,%@, title,%@", buf, 0x20u);

        }
        -[MOEventBundle setResources:](v54, "setResources:", v14);
        -[MOEventBundle setPhotoSource:](v54, "setPhotoSource:", 3);
        -[MOEventBundle setBundleSuperType:](v54, "setBundleSuperType:", 6);
        v40 = objc_msgSend(v52, "photoMemoryCategory");
        v41 = 601;
        switch((unint64_t)v40)
        {
          case 0uLL:
            goto LABEL_36;
          case 1uLL:
            goto LABEL_35;
          case 3uLL:
          case 4uLL:
            v41 = 602;
            goto LABEL_35;
          case 5uLL:
          case 6uLL:
            v41 = 603;
            goto LABEL_35;
          case 7uLL:
            v41 = 604;
            goto LABEL_35;
          case 8uLL:
          case 0x17uLL:
            v41 = 605;
            goto LABEL_35;
          case 9uLL:
            v41 = 606;
            goto LABEL_35;
          case 0xAuLL:
          case 0x1CuLL:
            v41 = 607;
            goto LABEL_35;
          case 0xCuLL:
          case 0xDuLL:
          case 0xEuLL:
            v41 = 608;
            goto LABEL_35;
          case 0x10uLL:
          case 0x11uLL:
            v41 = 609;
            goto LABEL_35;
          case 0x12uLL:
          case 0x13uLL:
            v41 = 610;
            goto LABEL_35;
          case 0x14uLL:
            v41 = 611;
            goto LABEL_35;
          case 0x15uLL:
            v41 = 612;
            goto LABEL_35;
          case 0x18uLL:
            v41 = 613;
            goto LABEL_35;
          case 0x19uLL:
          case 0x1DuLL:
          case 0x1EuLL:
            v41 = 614;
            goto LABEL_35;
          case 0x1AuLL:
            v41 = 615;
            goto LABEL_35;
          case 0x1BuLL:
            v41 = 616;
            goto LABEL_35;
          default:
            v41 = 617;
LABEL_35:
            -[MOEventBundle setBundleSubType:](v54, "setBundleSubType:", v41);
LABEL_36:
            -[NSMutableArray addObject:](v50, "addObject:", v54);

            v4 = v55 + 1;
            if ((id)(v55 + 1) != v51)
              continue;
            v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
            if (!v51)
              goto LABEL_38;
            goto LABEL_4;
        }
      }
    }
LABEL_38:

    v3 = v47;
  }
  else
  {
    v50 = 0;
  }

  return v50;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MODefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->fUniverse, 0);
}

- (void)performAnnotationWithEvents:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, v0, v1, "PhotoMemory: performAnnotationWithEvents", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_performAnnotationWithEvents:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, v0, v1, "PhotoMemory: no bundle is created", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_performAnnotationWithEvents:(void *)a1 handler:(const char *)a2 .cold.2(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_4_3(a1, a2);
  OUTLINED_FUNCTION_1_8((void *)&_mh_execute_header, v2, v3, "PhotoMemory: Bundles count, %lu", v4, v5, v6, v7, 0);
  OUTLINED_FUNCTION_5();
}

- (void)_performAnnotationWithEvents:(void *)a1 handler:(const char *)a2 .cold.3(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_4_3(a1, a2);
  OUTLINED_FUNCTION_1_8((void *)&_mh_execute_header, v2, v3, "PhotoMemory: Base Events, %lu", v4, v5, v6, v7, 0);
  OUTLINED_FUNCTION_5();
}

- (void)_performAnnotationWithEvents:handler:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, v0, v1, "PhotoMemory: _performAnnotationWithEvents", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)getBaseEvents:(void *)a1 .cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_4_3(a1, a2);
  OUTLINED_FUNCTION_1_8((void *)&_mh_execute_header, v2, v3, "PhotoMemory: Found %lu base events", v4, v5, v6, v7, 0);
  OUTLINED_FUNCTION_5();
}

- (void)getBaseEvents:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, v0, v1, "PhotoMemory: getBaseEvents", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

@end
