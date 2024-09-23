@implementation MOSignificantContactManager

- (MOSignificantContactManager)initWithUniverse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  CNContactStore *v8;
  uint64_t v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  void *v18;
  MOSignificantContactManager *v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[_CDInteractionStore defaultDatabaseDirectory](_CDInteractionStore, "defaultDatabaseDirectory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_CDInteractionStore storeWithDirectory:readOnly:](_CDInteractionStore, "storeWithDirectory:readOnly:", v5, 1));
  v7 = objc_alloc_init((Class)PPContactStore);
  v8 = objc_opt_new(CNContactStore);
  v10 = (objc_class *)objc_opt_class(MOEventStore, v9);
  v11 = NSStringFromClass(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v12));
  v15 = (objc_class *)objc_opt_class(MOConfigurationManager, v14);
  v16 = NSStringFromClass(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v17));

  v19 = -[MOSignificantContactManager initWithDuetStore:ppContactStore:cnContactStore:momentStore:configurationManager:](self, "initWithDuetStore:ppContactStore:cnContactStore:momentStore:configurationManager:", v6, v7, v8, v13, v18);
  return v19;
}

- (MOSignificantContactManager)initWithDuetStore:(id)a3 ppContactStore:(id)a4 cnContactStore:(id)a5 momentStore:(id)a6 configurationManager:(id)a7
{
  id v14;
  id v15;
  id v16;
  id v17;
  MOSignificantContactManager *v18;
  MOSignificantContactManager *v19;
  dispatch_queue_attr_t v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *queue;
  uint64_t v24;
  GDVisualIdentifierView *visualIdentifierView;
  uint64_t v26;
  GDEntityTaggingService *entityTaggingSerice;
  NSSet *v28;
  NSSet *tollFreeNumberPrefixes;
  NSSet *v30;
  NSSet *callLikeMechanismsSet;
  CNContactStore *cnContactStore;
  void *v33;
  void *v34;
  id v35;
  id os_log;
  NSObject *v37;
  NSString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSMutableSet *v44;
  NSMutableSet *meIdentifiers;
  void *v46;
  NSMutableSet *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  NSObject *v59;
  NSString *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  NSMutableSet *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  NSObject *v76;
  void *v77;
  id v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  id v88;
  id v89;
  const char *v90;
  void *v91;
  id v92;
  id v93;
  id v94;
  objc_super v95;
  uint8_t buf[4];
  void *v97;
  __int16 v98;
  id v99;
  __int16 v100;
  void *v101;
  __int16 v102;
  id v103;
  __int16 v104;
  id v105;
  void *v106;
  _QWORD v107[3];
  NSString *v108;

  v14 = a3;
  v15 = a4;
  v92 = a5;
  v16 = a6;
  v17 = a7;
  if (v16)
  {
    v90 = a2;
    v18 = 0;
    if (v14 && v15 && v92)
    {
      v89 = v17;
      v95.receiver = self;
      v95.super_class = (Class)MOSignificantContactManager;
      v19 = -[MOSignificantContactManager init](&v95, "init");
      if (v19)
      {
        v87 = v15;
        v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        v22 = dispatch_queue_create("MOSignificantContactManager", v21);
        queue = v19->_queue;
        v19->_queue = (OS_dispatch_queue *)v22;

        objc_storeStrong((id *)&v19->_interactionStore, a3);
        objc_storeStrong((id *)&v19->_ppContactStore, a4);
        objc_storeStrong((id *)&v19->_cnContactStore, a5);
        objc_storeStrong((id *)&v19->_momentStore, a6);
        objc_storeStrong((id *)&v19->_configurationManager, a7);
        v24 = objc_claimAutoreleasedReturnValue(-[MOSignificantContactManager initializeVisualIdentifierView](v19, "initializeVisualIdentifierView"));
        visualIdentifierView = v19->_visualIdentifierView;
        v19->_visualIdentifierView = (GDVisualIdentifierView *)v24;

        v26 = objc_claimAutoreleasedReturnValue(-[MOSignificantContactManager intializeEntityTaggingService](v19, "intializeEntityTaggingService"));
        entityTaggingSerice = v19->_entityTaggingSerice;
        v19->_entityTaggingSerice = (GDEntityTaggingService *)v26;

        v28 = (NSSet *)objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", CFSTR("+1800"), CFSTR("+1833"), CFSTR("+1844"), CFSTR("+1855"), CFSTR("+1866"), CFSTR("+1877"), CFSTR("+1888"), CFSTR("+1822"), CFSTR("+1880"), CFSTR("+1881"), CFSTR("+1882"), CFSTR("+1883"), CFSTR("+1884"), CFSTR("+1885"), CFSTR("+1886"), CFSTR("+1887"), CFSTR("+1889"),
                         CFSTR("+1900"),
                         CFSTR("+1976"),
                         CFSTR("800"),
                         CFSTR("833"),
                         CFSTR("844"),
                         CFSTR("855"),
                         CFSTR("866"),
                         CFSTR("877"),
                         CFSTR("888"),
                         CFSTR("822"),
                         CFSTR("880"),
                         CFSTR("881"),
                         CFSTR("882"),
                         CFSTR("883"),
                         CFSTR("884"),
                         CFSTR("885"),
                         CFSTR("886"),
                         CFSTR("887"),
                         CFSTR("889"),
                         CFSTR("900"),
                         CFSTR("976"),
                         0);
        tollFreeNumberPrefixes = v19->_tollFreeNumberPrefixes;
        v19->_tollFreeNumberPrefixes = v28;

        v30 = (NSSet *)objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", &off_1002D81F8, &off_1002D8210, &off_1002D8228, &off_1002D8240, &off_1002D8258, &off_1002D8270, &off_1002D8288, &off_1002D82A0, 0);
        callLikeMechanismsSet = v19->_callLikeMechanismsSet;
        v19->_callLikeMechanismsSet = v30;

        cnContactStore = v19->_cnContactStore;
        v108 = CNContactGivenNameKey;
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v108, 1));
        v94 = 0;
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactStore _crossPlatformUnifiedMeContactWithKeysToFetch:error:](cnContactStore, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v33, &v94));
        v35 = v94;

        os_log = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
        v37 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          v38 = NSStringFromSelector(v90);
          v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "identifier"));
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "givenName"));
          v42 = v34;
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "mask"));
          *(_DWORD *)buf = 138413058;
          v97 = v39;
          v98 = 2112;
          v99 = v40;
          v100 = 2112;
          v101 = v43;
          v102 = 2112;
          v103 = v35;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%@, meCard info, identifier, %@, name, %@, error, %@", buf, 0x2Au);

          v34 = v42;
        }

        v44 = objc_opt_new(NSMutableSet);
        meIdentifiers = v19->_meIdentifiers;
        v19->_meIdentifiers = v44;

        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "identifier"));
        if (v46)
        {
          v47 = v19->_meIdentifiers;
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "identifier"));
          -[NSMutableSet addObject:](v47, "addObject:", v48);

        }
        v49 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), CFSTR("mechanism"), 4));
        v50 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), CFSTR("direction"), 1));
        v51 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K.%K != nil"), CFSTR("sender"), CFSTR("personId")));
        v85 = (void *)v50;
        v86 = (void *)v49;
        v107[0] = v49;
        v107[1] = v50;
        v84 = (void *)v51;
        v107[2] = v51;
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v107, 3));
        v53 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v52));

        v54 = (void *)objc_claimAutoreleasedReturnValue(-[MOSignificantContactManager interactionStore](v19, "interactionStore"));
        v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0));
        v106 = v55;
        v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v106, 1));
        v93 = v35;
        v83 = (void *)v53;
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v53, v56, 1, &v93));
        v88 = v93;

        v58 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
        v59 = objc_claimAutoreleasedReturnValue(v58);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          v60 = NSStringFromSelector(v90);
          v82 = v14;
          v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
          v79 = objc_msgSend(v57, "count");
          v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "firstObject"));
          v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "sender"));
          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "personId"));
          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "firstObject"));
          v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "sender"));
          v91 = v34;
          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "displayName"));
          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "mask"));
          *(_DWORD *)buf = 138413314;
          v97 = v61;
          v98 = 2048;
          v99 = v79;
          v100 = 2112;
          v101 = v62;
          v102 = 2112;
          v103 = v66;
          v104 = 2112;
          v105 = v88;
          _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "%@, fetched result count, %lu, sender info, identifier, %@, name, %@, error, %@", buf, 0x34u);

          v34 = v91;
          v14 = v82;
        }

        v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "firstObject"));
        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "sender"));
        v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "personId"));

        if (v69)
        {
          v70 = v19->_meIdentifiers;
          v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "firstObject"));
          v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "sender"));
          v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "personId"));
          -[NSMutableSet addObject:](v70, "addObject:", v73);

        }
        v15 = v87;
      }
      self = v19;
      v18 = self;
      v17 = v89;
    }
  }
  else
  {
    v74 = v17;
    v75 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v76 = objc_claimAutoreleasedReturnValue(v75);
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
      -[MOSignificantContactManager initWithDuetStore:ppContactStore:cnContactStore:momentStore:configurationManager:].cold.1();

    v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v77, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOSignificantContactManager.m"), 93, CFSTR("Invalid parameter not satisfying: momentStore"));

    v18 = 0;
    v17 = v74;
  }

  return v18;
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
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
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
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    v7 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MOSignificantContactManager intializeEntityTaggingService].cold.1(&v10, v7);

    v8 = 0;
  }
  else
  {
    v8 = v3;
  }

  return v8;
}

- (BOOL)_eligibleInteraction:(id)a3
{
  id v5;
  NSSet *callLikeMechanismsSet;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
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
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  BOOL v37;
  uint64_t v38;
  id os_log;
  NSObject *v40;
  const char *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];

  v5 = a3;
  callLikeMechanismsSet = self->_callLikeMechanismsSet;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v5, "mechanism")));
  LODWORD(callLikeMechanismsSet) = -[NSSet containsObject:](callLikeMechanismsSet, "containsObject:", v7);

  if ((_DWORD)callLikeMechanismsSet)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sender"));
    if (v8)
    {
      v9 = (void *)v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sender"));
      v11 = objc_msgSend(v10, "type");

      if (v11 == (id)1)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sender"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
        if ((unint64_t)objc_msgSend(v13, "length") < 5)
        {
          v16 = 0;
        }
        else
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sender"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "substringToIndex:", 5));

        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sender"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
        if ((unint64_t)objc_msgSend(v18, "length") < 3)
        {
          v21 = 0;
        }
        else
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sender"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "substringToIndex:", 3));

        }
        if (v16 && -[NSSet containsObject:](self->_tollFreeNumberPrefixes, "containsObject:", v16)
          || v21 && -[NSSet containsObject:](self->_tollFreeNumberPrefixes, "containsObject:", v21))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sender"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));

LABEL_39:
          os_log = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
          v40 = objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            -[MOSignificantContactManager _eligibleInteraction:].cold.1(a2, v23, v40);

          v37 = 0;
LABEL_43:

          goto LABEL_44;
        }

      }
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recipients"));
    v25 = objc_msgSend(v24, "count");

    if (v25)
    {
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recipients"));
      v26 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v26)
      {
        v27 = v26;
        v42 = a2;
        v43 = v5;
        v28 = *(_QWORD *)v45;
        while (2)
        {
          for (i = 0; i != v27; i = (char *)i + 1)
          {
            if (*(_QWORD *)v45 != v28)
              objc_enumerationMutation(v23);
            v30 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v30, "type", v42) == (id)1)
            {
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "identifier"));
              if ((unint64_t)objc_msgSend(v31, "length") < 5)
              {
                v33 = 0;
              }
              else
              {
                v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "identifier"));
                v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "substringToIndex:", 5));

              }
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "identifier"));
              if ((unint64_t)objc_msgSend(v34, "length") < 3)
              {
                v36 = 0;
              }
              else
              {
                v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "identifier"));
                v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "substringToIndex:", 3));

              }
              if (v33 && -[NSSet containsObject:](self->_tollFreeNumberPrefixes, "containsObject:", v33)
                || v36 && -[NSSet containsObject:](self->_tollFreeNumberPrefixes, "containsObject:", v36))
              {
                v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "identifier"));

                v23 = (void *)v38;
                a2 = v42;
                v5 = v43;
                goto LABEL_39;
              }

            }
          }
          v27 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
          if (v27)
            continue;
          break;
        }
        v37 = 1;
        v5 = v43;
      }
      else
      {
        v37 = 1;
      }
      goto LABEL_43;
    }
  }
  v37 = 1;
LABEL_44:

  return v37;
}

- (void)_fetchInteractionsBetweenStartDate:(id)a3 EndDate:(id)a4 CompletionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  MOSignificantContactManager *v18;
  id v19;
  SEL v20;
  NSErrorUserInfoKey v21;
  const __CFString *v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9 && v10 && !objc_msgSend(v10, "isBeforeDate:", v9))
  {
    if (_fetchInteractionsBetweenStartDate_EndDate_CompletionHandler__onceToken != -1)
      dispatch_once(&_fetchInteractionsBetweenStartDate_EndDate_CompletionHandler__onceToken, &__block_literal_global_7);
    v14 = objc_claimAutoreleasedReturnValue(-[MOSignificantContactManager queue](self, "queue"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __92__MOSignificantContactManager__fetchInteractionsBetweenStartDate_EndDate_CompletionHandler___block_invoke_2;
    v15[3] = &unk_1002AEA58;
    v16 = v9;
    v17 = v10;
    v18 = self;
    v20 = a2;
    v19 = v11;
    dispatch_async(v14, v15);

    v13 = v16;
  }
  else
  {
    v21 = NSLocalizedDescriptionKey;
    v22 = CFSTR("invalid start date or end date");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MOErrorDomain"), 7, v12));

    (*((void (**)(id, void *, void *))v11 + 2))(v11, &__NSArray0__struct, v13);
  }

}

void __92__MOSignificantContactManager__fetchInteractionsBetweenStartDate_EndDate_CompletionHandler___block_invoke(id a1)
{
  void *v1;
  NSMutableArray *v2;
  uint64_t i;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[2];

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), CFSTR("mechanism")));
  v2 = objc_opt_new(NSMutableArray);
  for (i = 0; i != 11; ++i)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %i"), v1, kPPContactUNKPrefix_block_invoke_mechanismAllowList[i]));
    -[NSMutableArray addObject:](v2, "addObject:", v4);

  }
  v5 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v2));
  v6 = (void *)_fetchInteractionsBetweenStartDate_EndDate_CompletionHandler__predicateMechanism;
  _fetchInteractionsBetweenStartDate_EndDate_CompletionHandler__predicateMechanism = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K.%K != nil"), CFSTR("sender"), CFSTR("personId")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(ANY %K.%K != nil)"), CFSTR("recipients"), CFSTR("personId")));
  v14[0] = v7;
  v14[1] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 2));
  v10 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate orPredicateWithSubpredicates:](NSCompoundPredicate, "orPredicateWithSubpredicates:", v9));
  v11 = (void *)_fetchInteractionsBetweenStartDate_EndDate_CompletionHandler__predicatePersonIdNotNil;
  _fetchInteractionsBetweenStartDate_EndDate_CompletionHandler__predicatePersonIdNotNil = v10;

  v12 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != %@"), CFSTR("bundleId"), CFSTR("com.apple.Contacts.Autocomplete")));
  v13 = (void *)_fetchInteractionsBetweenStartDate_EndDate_CompletionHandler__predicateBundleId;
  _fetchInteractionsBetweenStartDate_EndDate_CompletionHandler__predicateBundleId = v12;

}

void __92__MOSignificantContactManager__fetchInteractionsBetweenStartDate_EndDate_CompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  _UNKNOWN **v3;
  NSMutableArray *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  id v11;
  unsigned __int8 v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  _UNKNOWN **v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id os_log;
  NSObject *v35;
  NSString *v36;
  void *v37;
  void *v38;
  _UNKNOWN **v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  NSObject *v45;
  void *v46;
  NSMutableArray *v47;
  id v48;
  void *v49;
  NSMutableArray *v50;
  uint64_t v51;
  NSMutableArray *obj;
  id v53;
  uint64_t v54;
  id v55;
  void *v56;
  void *v57;
  void *context;
  _QWORD v59[5];
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  id v67;
  __int16 v68;
  id v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  id v75;
  _QWORD v76[4];
  void *v77;
  _BYTE v78[128];

  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "startOfDayForDate:", *(_QWORD *)(a1 + 32)));
  v3 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
  v4 = objc_opt_new(NSMutableArray);
  if (*(_QWORD *)(a1 + 32))
  {
    v5 = *(void **)(a1 + 40);
    if (v5)
    {
      if (objc_msgSend(v5, "isAfterDate:")
        && objc_msgSend(v2, "isBeforeDate:", *(_QWORD *)(a1 + 40)))
      {
        v6 = 0;
        do
        {
          v7 = v2;
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dateByAddingTimeInterval:", 86400.0));

          v9 = objc_msgSend(v7, "isAfterDate:", *(_QWORD *)(a1 + 32));
          v10 = v7;
          if ((v9 & 1) == 0)
            v10 = *(void **)(a1 + 32);
          v11 = v10;
          v12 = objc_msgSend(v8, "isBeforeDate:", *(_QWORD *)(a1 + 40));
          v13 = v8;
          if ((v12 & 1) == 0)
            v13 = *(void **)(a1 + 40);
          v14 = v13;
          v15 = v14;
          if (v11 && v14 && objc_msgSend(v11, "isBeforeDate:", v14))
          {
            v16 = objc_msgSend(objc_alloc((Class)NSDateInterval), "initWithStartDate:endDate:", v11, v15);
            -[NSMutableArray addObject:](v4, "addObject:", v16);

          }
          v2 = v8;

          v6 = v2;
        }
        while ((objc_msgSend(v2, "isBeforeDate:", *(_QWORD *)(a1 + 40)) & 1) != 0);

        v3 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
      }
    }
  }
  v50 = objc_opt_new(NSMutableArray);
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v4;
  v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
  if (v55)
  {
    v54 = *(_QWORD *)v63;
    v48 = v2;
    v51 = a1;
    while (2)
    {
      v17 = 0;
      do
      {
        v18 = v3;
        if (*(_QWORD *)v63 != v54)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)v17);
        context = objc_autoreleasePoolPush();
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0));
        v77 = v20;
        v21 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v77, 1));

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "startDate"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "endDate"));
        v24 = objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("startDate >= %@ && startDate <= %@"), v22, v23));

        v57 = (void *)v24;
        v76[0] = v24;
        v76[1] = _fetchInteractionsBetweenStartDate_EndDate_CompletionHandler__predicateMechanism;
        v76[2] = _fetchInteractionsBetweenStartDate_EndDate_CompletionHandler__predicatePersonIdNotNil;
        v76[3] = _fetchInteractionsBetweenStartDate_EndDate_CompletionHandler__predicateBundleId;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v76, 4));
        v26 = objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v25));

        v27 = (void *)v26;
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "interactionStore"));
        v61 = 0;
        v56 = (void *)v21;
        v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "queryInteractionsUsingPredicate:sortDescriptors:limit:error:", v26, v21, 1000, &v61));
        v30 = v61;

        v31 = (void *)v29;
        v3 = v18;
        v32 = (void *)objc_opt_new(v18[310]);
        v59[0] = _NSConcreteStackBlock;
        v59[1] = 3221225472;
        v59[2] = __92__MOSignificantContactManager__fetchInteractionsBetweenStartDate_EndDate_CompletionHandler___block_invoke_3;
        v59[3] = &unk_1002AEA30;
        v59[4] = *(_QWORD *)(a1 + 48);
        v33 = v32;
        v60 = v33;
        objc_msgSend(v31, "enumerateObjectsWithOptions:usingBlock:", 2, v59);
        os_log = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
        v35 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v36 = NSStringFromSelector(*(SEL *)(a1 + 64));
          v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
          v53 = v30;
          v38 = v27;
          v39 = v3;
          v40 = objc_msgSend(v31, "count");
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "startDate"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "endDate"));
          v43 = objc_msgSend(v33, "count");
          *(_DWORD *)buf = 138413314;
          v67 = v37;
          v68 = 2048;
          v69 = v40;
          v3 = v39;
          v27 = v38;
          v30 = v53;
          v70 = 2112;
          v71 = v41;
          v72 = 2112;
          v73 = v42;
          v74 = 2048;
          v75 = v43;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "%@, fetched interaction count, %lu, startDate, %@, endDate, %@, filtered interaction count, %lu", buf, 0x34u);

          a1 = v51;
        }

        if (v30)
        {
          v44 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
          v45 = objc_claimAutoreleasedReturnValue(v44);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v67 = v30;
            _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Interactions query error: %@", buf, 0xCu);
          }

          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        }
        else
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "_conversationsFromInteractions:", v33));
          if (objc_msgSend(v46, "count"))
            -[NSMutableArray addObjectsFromArray:](v50, "addObjectsFromArray:", v46);

        }
        objc_autoreleasePoolPop(context);
        if (v30)
        {

          v2 = v48;
          v47 = v50;
          goto LABEL_35;
        }
        v17 = (char *)v17 + 1;
      }
      while (v55 != v17);
      v2 = v48;
      v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
      if (v55)
        continue;
      break;
    }
  }

  v47 = v50;
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_35:

}

void __92__MOSignificantContactManager__fetchInteractionsBetweenStartDate_EndDate_CompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  MOInteraction *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_eligibleInteraction:"))
  {
    v3 = -[MOInteraction initWithCDInteraction:meIdentifier:]([MOInteraction alloc], "initWithCDInteraction:meIdentifier:", v4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    if (v3)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

  }
}

- (id)_collectSignificantContactsFromInteractions:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id os_log;
  NSObject *v17;
  NSString *v18;
  void *v19;
  NSMutableDictionary *v20;
  void *v21;
  void *v22;
  PPContactStore *ppContactStore;
  NSMutableDictionary *v24;
  id v25;
  id v26;
  NSObject *v27;
  NSMutableDictionary *v28;
  NSMutableDictionary *v29;
  _QWORD v32[5];
  NSMutableDictionary *v33;
  SEL v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  NSMutableSet *v43;
  _BYTE v44[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableSet);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v37 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
        v12 = objc_autoreleasePoolPush();
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "participants"));
        v14 = objc_msgSend(v13, "count");

        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "participants"));
          -[NSMutableSet addObjectsFromArray:](v5, "addObjectsFromArray:", v15);

        }
        objc_autoreleasePoolPop(v12);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v8);
  }

  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
  v17 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    *(_DWORD *)buf = 138412546;
    v41 = v19;
    v42 = 2112;
    v43 = v5;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%@, identifiers: %@", buf, 0x16u);

  }
  v20 = objc_opt_new(NSMutableDictionary);
  v21 = (void *)objc_opt_new(PPContactQuery);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v5, "allObjects"));
  objc_msgSend(v21, "setMatchingIdentifiers:", v22);

  ppContactStore = self->_ppContactStore;
  v35 = 0;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = __75__MOSignificantContactManager__collectSignificantContactsFromInteractions___block_invoke;
  v32[3] = &unk_1002AEA80;
  v34 = a2;
  v32[4] = self;
  v24 = v20;
  v33 = v24;
  LOBYTE(v20) = -[PPContactStore iterRankedContactsWithQuery:error:block:](ppContactStore, "iterRankedContactsWithQuery:error:block:", v21, &v35, v32);
  v25 = v35;
  if ((v20 & 1) == 0)
  {
    v26 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[MOSignificantContactManager _collectSignificantContactsFromInteractions:].cold.1();

  }
  v28 = v33;
  v29 = v24;

  return v29;
}

void __75__MOSignificantContactManager__collectSignificantContactsFromInteractions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id os_log;
  NSObject *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  unsigned int v14;
  void *v15;

  v3 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __75__MOSignificantContactManager__collectSignificantContactsFromInteractions___block_invoke_cold_1(a1, v3, v5);

  objc_msgSend(v3, "score");
  if (v6 >= 0.49999)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contact"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));

    if (objc_msgSend(v8, "hasPrefix:", CFSTR("CN:")))
    {
      v9 = objc_autoreleasePoolPush();
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringFromIndex:", objc_msgSend(CFSTR("CN:"), "length")));
      objc_autoreleasePoolPop(v9);
      if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsObject:", v10) & 1) == 0)
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v3, v10);

      goto LABEL_14;
    }
    if (objc_msgSend(v8, "hasPrefix:", CFSTR("FIA:")))
    {
      v11 = *(void **)(a1 + 40);
      v12 = objc_autoreleasePoolPush();
      v13 = CFSTR("FIA:");
    }
    else
    {
      v14 = objc_msgSend(v8, "hasPrefix:", CFSTR("UNK:"));
      v11 = *(void **)(a1 + 40);
      if (!v14)
      {
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v3, v8);
        goto LABEL_14;
      }
      v12 = objc_autoreleasePoolPush();
      v13 = CFSTR("UNK:");
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "substringFromIndex:", -[__CFString length](v13, "length")));
    objc_autoreleasePoolPop(v12);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v3, v15);

LABEL_14:
  }

}

- (id)_conversationsFromInteractions:(id)a3
{
  id v4;
  id os_log;
  NSObject *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableSet *v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  _UNKNOWN **v25;
  void *i;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  id v32;
  uint64_t v33;
  MOGroupedInteraction *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  MOConversation *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  NSObject *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  NSString *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  unsigned int v67;
  const __CFString *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  NSMutableArray *v76;
  NSMutableArray *v77;
  id v78;
  NSObject *v79;
  NSMutableArray *v80;
  id v81;
  NSObject *v82;
  id v83;
  NSObject *v84;
  NSMutableArray *v85;
  id v87;
  const __CFString *v88;
  void *v89;
  NSMutableArray *v90;
  uint64_t v91;
  NSMutableSet *v92;
  void *v93;
  void *v94;
  id v96;
  void *v97;
  void *v98;
  id obj;
  void *v100;
  uint64_t v101;
  void *v102;
  id v103;
  id v104;
  NSMutableSet *v105;
  _QWORD v106[5];
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
  __int128 v118;
  uint8_t buf[4];
  void *v120;
  __int16 v121;
  id v122;
  __int16 v123;
  uint64_t v124;
  __int16 v125;
  const __CFString *v126;
  __int16 v127;
  void *v128;
  __int16 v129;
  id v130;
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];

  v4 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    *(_DWORD *)buf = 138412546;
    v120 = v8;
    v121 = 2048;
    v122 = objc_msgSend(v4, "count");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@, interaction count, %lu", buf, 0x16u);

  }
  v90 = objc_opt_new(NSMutableArray);
  if (v4 && objc_msgSend(v4, "count"))
  {
    v87 = v4;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOSignificantContactManager _collectSignificantContactsFromInteractions:](self, "_collectSignificantContactsFromInteractions:", v4));
    v10 = v9;
    if (v9 && objc_msgSend(v9, "count"))
    {
      v11 = objc_opt_new(NSMutableSet);
      v115 = 0u;
      v116 = 0u;
      v117 = 0u;
      v118 = 0u;
      obj = v4;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v133, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v116;
        v91 = *(_QWORD *)v116;
        v92 = v11;
        do
        {
          v15 = 0;
          v96 = v13;
          do
          {
            if (*(_QWORD *)v116 != v14)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * (_QWORD)v15);
            v17 = objc_autoreleasePoolPush();
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet member:](v11, "member:", v16));
            v19 = v18;
            if (v18)
            {
              objc_msgSend(v18, "addInteraction:", v16);
            }
            else
            {
              v102 = v17;
              v104 = v15;
              v113 = 0u;
              v114 = 0u;
              v111 = 0u;
              v112 = 0u;
              v100 = v16;
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "participants"));
              v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v111, v132, 16);
              if (v21)
              {
                v22 = v21;
                v23 = 0;
                v24 = *(_QWORD *)v112;
                v25 = &off_1002DCF38;
                do
                {
                  for (i = 0; i != v22; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v112 != v24)
                      objc_enumerationMutation(v20);
                    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v111 + 1) + 8 * (_QWORD)i)));
                    v28 = v27;
                    if (v27)
                    {
                      objc_msgSend(v27, "score");
                      v30 = v29;
                      objc_msgSend(v25, "doubleValue");
                      if (v30 > v31)
                      {
                        v32 = v28;

                        objc_msgSend(v32, "score");
                        v33 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));

                        v23 = v32;
                        v25 = (_UNKNOWN **)v33;
                      }
                    }

                  }
                  v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v111, v132, 16);
                }
                while (v22);
              }
              else
              {
                v23 = 0;
                v25 = &off_1002DCF38;
              }

              v34 = -[MOGroupedInteraction initWithScoredContact:interactionScore:interaction:]([MOGroupedInteraction alloc], "initWithScoredContact:interactionScore:interaction:", v23, v25, v100);
              v11 = v92;
              -[NSMutableSet addObject:](v92, "addObject:", v34);

              v14 = v91;
              v13 = v96;
              v17 = v102;
              v15 = v104;
              v19 = 0;
            }

            objc_autoreleasePoolPop(v17);
            v15 = (char *)v15 + 1;
          }
          while (v15 != v13);
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v133, 16);
        }
        while (v13);
      }

      v109 = 0u;
      v110 = 0u;
      v107 = 0u;
      v108 = 0u;
      v105 = v11;
      v35 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v105, "countByEnumeratingWithState:objects:count:", &v107, v131, 16);
      if (v35)
      {
        v36 = v35;
        v37 = 0;
        v38 = *(_QWORD *)v108;
        v101 = *(_QWORD *)v108;
        do
        {
          v39 = 0;
          v103 = v36;
          do
          {
            if (*(_QWORD *)v108 != v38)
              objc_enumerationMutation(v105);
            v40 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * (_QWORD)v39);
            v41 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
            v42 = objc_claimAutoreleasedReturnValue(v41);
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              v63 = NSStringFromSelector(a2);
              v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
              v65 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "interactionKey"));
              v89 = (void *)v65;
              v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "scoredContact"));
              v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "contact"));
              v66 = objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "identifier"));
              v67 = objc_msgSend(v40, "isScoredContactUsable");
              v68 = CFSTR("NO");
              if (v67)
                v68 = CFSTR("YES");
              v88 = v68;
              v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "interactionScore"));
              v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "interactions"));
              v71 = objc_msgSend(v70, "count");
              *(_DWORD *)buf = 138413570;
              v120 = v64;
              v121 = 2112;
              v122 = (id)v65;
              v123 = 2112;
              v124 = v66;
              v72 = (void *)v66;
              v125 = 2112;
              v126 = v88;
              v36 = v103;
              v127 = 2112;
              v128 = v69;
              v129 = 2048;
              v130 = v71;
              _os_log_debug_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "%@, grouped interactions for compound key: %@, main scored contact id: %@, usable %@, score %@, num interactions: %lu", buf, 0x3Eu);

              v38 = v101;
            }

            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "interactions"));
            v44 = objc_msgSend(v43, "count");

            if (objc_msgSend(v40, "isScoredContactUsable")
              && (v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "interactions")),
                  v46 = objc_msgSend(v45, "count"),
                  v45,
                  v46))
            {
              v47 = [MOConversation alloc];
              v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "interactionKey"));
              v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "scoredContact"));
              v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "interactions"));
              v51 = -[MOConversation initWithContactIdentifier:scoredContact:interactions:](v47, "initWithContactIdentifier:scoredContact:interactions:", v48, v49, v50);

              v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
              v53 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject endDate](v51, "endDate"));
              v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "startOfDayForDate:", v53));

              v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", v54, 4, 3));
              v56 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
              v57 = objc_claimAutoreleasedReturnValue(v56);
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
              {
                v98 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject contactIdentifier](v51, "contactIdentifier"));
                v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "mask"));
                v94 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject interactions](v51, "interactions"));
                v74 = objc_msgSend(v94, "count");
                *(_DWORD *)buf = 138412802;
                v120 = v73;
                v121 = 2112;
                v122 = v55;
                v123 = 2048;
                v124 = (uint64_t)v74;
                _os_log_debug_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "new conversation created for compound key: %@, for date %@, interaction count, %lu", buf, 0x20u);

              }
              v58 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject interactions](v51, "interactions"));
              v106[0] = _NSConcreteStackBlock;
              v106[1] = 3221225472;
              v106[2] = 0x10004A000;
              v106[3] = &__block_descriptor_40_e30_v32__0__MOInteraction_8Q16_B24l;
              v106[4] = a2;
              objc_msgSend(v58, "enumerateObjectsUsingBlock:", v106);

              -[NSMutableArray addObject:](v90, "addObject:", v51);
              v38 = v101;
              v36 = v103;
            }
            else
            {
              v59 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
              v51 = objc_claimAutoreleasedReturnValue(v59);
              if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
              {
                v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "interactionKey"));
                v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "interactions"));
                v62 = objc_msgSend(v61, "count");
                *(_DWORD *)buf = 138412546;
                v120 = v60;
                v121 = 2048;
                v122 = v62;
                _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "daily grouped interactions not used to make any conversation, compound key: %@, interaction count, %lu", buf, 0x16u);

              }
            }
            v37 += (uint64_t)v44;

            v39 = (char *)v39 + 1;
          }
          while (v36 != v39);
          v75 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v105, "countByEnumeratingWithState:objects:count:", &v107, v131, 16);
          v36 = v75;
        }
        while (v75);
      }

      v81 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
      v82 = objc_claimAutoreleasedReturnValue(v81);
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
        -[MOSignificantContactManager _conversationsFromInteractions:].cold.2(obj, v82);

      v83 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
      v84 = objc_claimAutoreleasedReturnValue(v83);
      if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
        -[MOSignificantContactManager _conversationsFromInteractions:].cold.1();

      v76 = v90;
      v85 = v90;

    }
    else
    {
      v78 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
      v79 = objc_claimAutoreleasedReturnValue(v78);
      if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_INFO, "significantContacts is empty, returning.", buf, 2u);
      }

      v76 = v90;
      v80 = v90;
    }

    v4 = v87;
  }
  else
  {
    v76 = v90;
    v77 = v90;
  }

  return v76;
}

void __62__MOSignificantContactManager__conversationsFromInteractions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id os_log;
  NSObject *v7;
  NSString *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;

  v5 = a2;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
  v7 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = NSStringFromSelector(*(SEL *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = 138412802;
    v11 = v9;
    v12 = 2048;
    v13 = a3;
    v14 = 2112;
    v15 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@, idx, %lu, interaction, %@", (uint8_t *)&v10, 0x20u);

  }
}

- (id)_createEventFromConversation:(id)a3
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
  double v13;
  float v14;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = [MOEvent alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v10 = -[MOEvent initWithEventIdentifier:startDate:endDate:creationDate:provider:category:](v5, "initWithEventIdentifier:startDate:endDate:creationDate:provider:category:", v6, v7, v8, v9, 3, 10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOSignificantContactManager configurationManager](self, "configurationManager"));
  LODWORD(v13) = 1242802176;
  objc_msgSend(v12, "getFloatSettingForKey:withFallback:", CFSTR("EventManagerOverrideMaximumEventAge"), v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "dateByAddingTimeInterval:", v14));
  -[MOEvent setExpirationDate:](v10, "setExpirationDate:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "providerId"));
  -[MOEvent setIdentifierFromProvider:](v10, "setIdentifierFromProvider:", v16);

  return v10;
}

- (void)_saveConversations:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  id os_log;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  void (**v33)(id, _QWORD, void *);
  _QWORD v34[6];
  _QWORD v35[6];
  _QWORD v36[5];
  id v37;
  uint64_t v38;
  _QWORD v39[4];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startDate"));
        v15 = objc_msgSend(v8, "isAfterDate:", v14);

        if (v15)
        {
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "startDate"));

          v8 = (void *)v16;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v10);
  }

  v38 = 0;
  v39[0] = &v38;
  v39[1] = 0x3032000000;
  v39[2] = __Block_byref_object_copy__5;
  v39[3] = __Block_byref_object_dispose__5;
  v40 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__5;
  v36[4] = __Block_byref_object_dispose__5;
  v37 = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOSignificantContactManager momentStore](self, "momentStore"));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = __58__MOSignificantContactManager__saveConversations_handler___block_invoke;
  v35[3] = &unk_1002AEB08;
  v35[4] = &v38;
  v35[5] = v36;
  objc_msgSend(v17, "fetchEventsWithStartDateAfter:Category:CompletionHandler:", v8, 10, v35);

  if (*(_QWORD *)(v39[0] + 40))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    v19 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[MOSignificantContactManager _saveConversations:handler:].cold.2((uint64_t)v39, v19, v20, v21, v22, v23, v24, v25);

    v26 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[MOSignificantContactManager _saveConversations:handler:].cold.1();

    if (v7)
      v7[2](v7, *(_QWORD *)(v39[0] + 40), &__NSDictionary0__struct);
  }
  else
  {
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = __58__MOSignificantContactManager__saveConversations_handler___block_invoke_309;
    v34[3] = &unk_1002AEB30;
    v34[4] = self;
    v34[5] = v36;
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_pas_mappedArrayWithTransform:", v34));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MOSignificantContactManager momentStore](self, "momentStore"));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = __58__MOSignificantContactManager__saveConversations_handler___block_invoke_2_311;
    v31[3] = &unk_1002AEB58;
    v30 = v28;
    v32 = v30;
    v33 = v7;
    objc_msgSend(v29, "storeEvents:CompletionHandler:", v30, v31);

  }
  _Block_object_dispose(v36, 8);

  _Block_object_dispose(&v38, 8);
}

void __58__MOSignificantContactManager__saveConversations_handler___block_invoke(uint64_t a1, void *a2, id obj)
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  v7 = a2;
  v8 = objc_alloc((Class)NSSet);
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_307));

  v9 = objc_msgSend(v8, "initWithArray:", v12);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

id __58__MOSignificantContactManager__saveConversations_handler___block_invoke_2(id a1, MOEvent *a2)
{
  return -[MOEvent identifierFromProvider](a2, "identifierFromProvider");
}

id __58__MOSignificantContactManager__saveConversations_handler___block_invoke_309(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "providerId"));
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((v4 & 1) != 0)
    v6 = 0;
  else
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_createEventFromConversation:", v3));

  return v6;
}

void __58__MOSignificantContactManager__saveConversations_handler___block_invoke_2_311(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  int v12;
  id v13;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __58__MOSignificantContactManager__saveConversations_handler___block_invoke_2_311_cold_1();
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "count");
    v12 = 134217984;
    v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "saved conversations, %lu", (uint8_t *)&v12, 0xCu);
  }

  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v5, v6);

}

- (id)_rehydrateStoredEvents:(id)a3 fromConversations:(id)a4
{
  id v5;
  id v6;
  NSMutableDictionary *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  MORehydrationThresholdMetrics *v29;
  id v30;
  id v31;
  NSObject *v32;
  id v33;
  MORehydrationMetrics *v34;
  void *v35;
  id v36;
  void *v37;
  MORehydrationMetrics *v38;
  id os_log;
  id v40;
  NSObject *v41;
  MORehydrationMetrics *v42;
  void *v43;
  id v44;
  void *v45;
  id v47;
  void *v48;
  NSMutableArray *v49;
  NSMutableArray *v50;
  id obj;
  NSMutableArray *v53;
  uint64_t v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  uint8_t buf[4];
  id v66;
  _BYTE v67[128];
  _BYTE v68[128];

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v5, "count"))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    v7 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, &v7->super.super, OS_LOG_TYPE_INFO, "no input events for rehydrating contact events", buf, 2u);
    }
    goto LABEL_33;
  }
  if (!objc_msgSend(v6, "count"))
  {
    v40 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    v41 = objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "no interactions fetched for rehydrating contact events", buf, 2u);
    }

    v42 = [MORehydrationMetrics alloc];
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    v44 = objc_msgSend(v43, "category");
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    v7 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v42, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v44, objc_msgSend(v45, "provider"), 1, 0, objc_msgSend(v5, "count"), 3, (double)(int)objc_msgSend(v5, "count"), 0.0);

    v64 = 0;
    -[NSMutableDictionary submitMetricsWithError:](v7, "submitMetricsWithError:", &v64);
LABEL_33:
    v53 = 0;
    goto LABEL_34;
  }
  v48 = v5;
  v7 = objc_opt_new(NSMutableDictionary);
  v49 = objc_opt_new(NSMutableArray);
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v47 = v6;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v61 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)i);
        v14 = objc_autoreleasePoolPush();
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "providerId"));
        v16 = v15;
        if (v15)
        {
          if (objc_msgSend(v15, "length"))
          {
            -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v13, v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "interactions"));
            v18 = objc_msgSend(v17, "count");

            if (v18)
            {
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "interactions"));
              v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));
              -[NSMutableArray addObject:](v49, "addObject:", v20);

            }
          }
        }

        objc_autoreleasePoolPop(v14);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    }
    while (v10);
  }

  v50 = objc_opt_new(NSMutableArray);
  v53 = objc_opt_new(NSMutableArray);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v48;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v57;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(_QWORD *)v57 != v23)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)j);
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "identifierFromProvider"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v26));

        if (v27)
        {
          v28 = objc_msgSend(v25, "copy");
          if (objc_msgSend(v25, "rehydrationFailCount"))
          {
            v29 = -[MORehydrationThresholdMetrics initWithCategory:provider:failureCount:]([MORehydrationThresholdMetrics alloc], "initWithCategory:provider:failureCount:", objc_msgSend(v25, "category"), objc_msgSend(v25, "provider"), objc_msgSend(v25, "rehydrationFailCount"));
            v55 = 0;
            -[MORehydrationThresholdMetrics submitMetricsWithError:](v29, "submitMetricsWithError:", &v55);
            v30 = v55;
            objc_msgSend(v28, "setRehydrationFailCount:", 0);
            -[NSMutableArray addObject:](v50, "addObject:", v25);

          }
          -[MOSignificantContactManager _setDynamicPropertiesForEvent:fromCoversation:](self, "_setDynamicPropertiesForEvent:fromCoversation:", v28, v27);
          -[NSMutableArray addObject:](v53, "addObject:", v28);

        }
      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
    }
    while (v22);
  }

  v31 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
  v32 = objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    v33 = -[NSMutableArray count](v53, "count");
    *(_DWORD *)buf = 134217984;
    v66 = v33;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "rehydrated contact events count, %lu", buf, 0xCu);
  }

  v34 = [MORehydrationMetrics alloc];
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "firstObject"));
  v36 = objc_msgSend(v35, "category");
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "firstObject"));
  v38 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v34, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v36, objc_msgSend(v37, "provider"), 1, 0, objc_msgSend(obj, "count"), 3, (double)(int)(objc_msgSend(obj, "count") - -[NSMutableArray count](v53, "count")), (double)(int)-[NSMutableArray count](v50, "count"));

  v54 = 0;
  -[MORehydrationMetrics submitMetricsWithError:](v38, "submitMetricsWithError:", &v54);

  v6 = v47;
  v5 = v48;
LABEL_34:

  return v53;
}

- (id)_fetchClassificationForSignificantContacts:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *v22;
  void *v23;
  id v24;
  id v25;
  GDEntityTaggingService *entityTaggingSerice;
  void *v27;
  void *v28;
  id v29;
  char *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *k;
  void *v39;
  id v40;
  NSObject *v41;
  id v42;
  uint64_t v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  id os_log;
  NSObject *v50;
  id v51;
  id v52;
  id v53;
  NSObject *v54;
  id v55;
  id v56;
  NSObject *v57;
  id v58;
  id v59;
  uint64_t v60;
  void *j;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id v67;
  id v68;
  void *v69;
  uint64_t v70;
  char *v71;
  id v72;
  void *v73;
  uint64_t v74;
  void *v75;
  id obj;
  char *obja;
  NSMutableDictionary *v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  id v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  _BYTE v98[128];
  uint8_t v99[128];
  uint8_t buf[4];
  _BYTE v101[18];
  _BYTE v102[128];

  v79 = a3;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = v4;
  if (!self->_visualIdentifierView)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    v50 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "#megadome,visualIdentifierView is nil", buf, 2u);
    }
    goto LABEL_55;
  }
  if (!self->_entityTaggingSerice)
  {
    v51 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    v50 = objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      -[MOSignificantContactManager _fetchClassificationForSignificantContacts:].cold.1();
LABEL_55:

    v52 = v5;
    goto LABEL_71;
  }
  v73 = v4;
  v78 = objc_opt_new(NSMutableDictionary);
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "allKeys"));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v102, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v94;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v94 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)i);
        v11 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v101 = v10;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "#megadome,fetchClassificationInfo,contactIdentifier,%@", buf, 0xCu);
        }

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[GDVisualIdentifierView personForIdentifier:](self->_visualIdentifierView, "personForIdentifier:", v10));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "entityIdentifier"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringValue"));

        v16 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v101 = v10;
          *(_WORD *)&v101[8] = 2112;
          *(_QWORD *)&v101[10] = v15;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "#megadome,CNContactID,%@,contactIdentifierMD,%@", buf, 0x16u);
        }

        if (v15)
        {
          -[NSMutableDictionary setObject:forKey:](v78, "setObject:forKey:", v10, v15);
        }
        else
        {
          v18 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v101 = v10;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "#megadome,could not get MD identifier for contactIdentifier %@", buf, 0xCu);
          }

          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "objectForKey:", v10));
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0xFFFFFFFFLL));
          objc_msgSend(v73, "setObject:forKey:", v21, v20);

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v102, 16);
    }
    while (v7);
  }

  v22 = v78;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v78, "allKeys"));
  v24 = objc_msgSend(v23, "count");

  if (v24)
  {
    v25 = objc_msgSend(objc_alloc((Class)GDPersonTaggingOptions), "initWithTagThresholds:", &off_1002DD208);
    entityTaggingSerice = self->_entityTaggingSerice;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v78, "allKeys"));
    v92 = 0;
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[GDEntityTaggingService entityTagsForIdentifiers:options:error:](entityTaggingSerice, "entityTagsForIdentifiers:options:error:", v27, v25, &v92));
    v29 = v92;

    v5 = v73;
    if (v29 || !v28)
    {
      v56 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
      v57 = objc_claimAutoreleasedReturnValue(v56);
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        -[MOSignificantContactManager _fetchClassificationForSignificantContacts:].cold.3();

      v90 = 0u;
      v91 = 0u;
      v88 = 0u;
      v89 = 0u;
      v72 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v78, "allKeys"));
      v58 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v88, v99, 16);
      if (v58)
      {
        v59 = v58;
        v68 = v29;
        v60 = *(_QWORD *)v89;
        do
        {
          for (j = 0; j != v59; j = (char *)j + 1)
          {
            if (*(_QWORD *)v89 != v60)
              objc_enumerationMutation(v72);
            v62 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v78, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * (_QWORD)j)));
            v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "objectForKey:", v62));
            v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0xFFFFFFFFLL));
            objc_msgSend(v73, "setObject:forKey:", v64, v63);

          }
          v59 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v88, v99, 16);
        }
        while (v59);
        v29 = v68;
      }
    }
    else
    {
      v86 = 0u;
      v87 = 0u;
      v84 = 0u;
      v85 = 0u;
      v72 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v78, "allKeys"));
      v71 = (char *)objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v84, v98, 16);
      if (v71)
      {
        v67 = v25;
        v70 = *(_QWORD *)v85;
        v69 = v28;
        do
        {
          v30 = 0;
          do
          {
            if (*(_QWORD *)v85 != v70)
              objc_enumerationMutation(v72);
            v74 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * (_QWORD)v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKey:", v67));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "scoredPersonEntityTags"));

            obja = v30;
            v75 = v32;
            if (objc_msgSend(v32, "count"))
            {
              v82 = 0u;
              v83 = 0u;
              v80 = 0u;
              v81 = 0u;
              v33 = v32;
              v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v80, v97, 16);
              if (v34)
              {
                v35 = v34;
                LODWORD(v36) = 0;
                v37 = *(_QWORD *)v81;
                do
                {
                  for (k = 0; k != v35; k = (char *)k + 1)
                  {
                    if (*(_QWORD *)v81 != v37)
                      objc_enumerationMutation(v33);
                    v39 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)k);
                    v40 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
                    v41 = objc_claimAutoreleasedReturnValue(v40);
                    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
                    {
                      v42 = objc_msgSend(v39, "tag");
                      objc_msgSend(v39, "score");
                      *(_DWORD *)buf = 134218240;
                      *(_QWORD *)v101 = v42;
                      *(_WORD *)&v101[8] = 2048;
                      *(_QWORD *)&v101[10] = v43;
                      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "#megadome,personTag,%ld,score,%f", buf, 0x16u);
                    }

                    if (objc_msgSend(v39, "tag") == (id)26)
                    {
                      v36 = v36 | 0x100008;
                    }
                    else if (objc_msgSend(v39, "tag") == (id)22)
                    {
                      v36 = v36 | 0x200000;
                    }
                    else
                    {
                      v36 = v36;
                    }
                  }
                  v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v80, v97, 16);
                }
                while (v35);
              }
              else
              {
                v36 = 0;
              }

              v5 = v73;
              v22 = v78;
              v28 = v69;
            }
            else
            {
              v36 = 0;
            }
            v44 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
            v45 = objc_claimAutoreleasedReturnValue(v44);
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v101 = v36;
              *(_WORD *)&v101[4] = 2112;
              *(_QWORD *)&v101[6] = v74;
              _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "#megadome,classification,%u, for contact id,%@", buf, 0x12u);
            }

            v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v22, "objectForKey:", v74));
            v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "objectForKey:", v46));
            v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v36));
            objc_msgSend(v5, "setObject:forKey:", v48, v47);

            v30 = obja + 1;
          }
          while (obja + 1 != v71);
          v71 = (char *)objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v84, v98, 16);
        }
        while (v71);
        v25 = v67;
        v29 = 0;
      }
    }

    v65 = v5;
  }
  else
  {
    v53 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    v54 = objc_claimAutoreleasedReturnValue(v53);
    v5 = v73;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      -[MOSignificantContactManager _fetchClassificationForSignificantContacts:].cold.2();

    v55 = v73;
  }

LABEL_71:
  return v5;
}

- (void)_setDynamicPropertiesForEvent:(id)a3 fromCoversation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableSet *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scoredContact"));
  objc_msgSend(v7, "score");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_msgSend(v5, "setInteractionContactScore:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scoredContact"));
  objc_msgSend(v5, "setInteractionScoredContact:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "interactions"));
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "interactions"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "groupName"));
    objc_msgSend(v5, "setInteractionGroupName:", v14);

  }
  v15 = objc_opt_new(NSMutableSet);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "interactions", 0));
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v20), "mechanism")));
        -[NSMutableSet addObject:](v15, "addObject:", v21);

        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v18);
  }

  objc_msgSend(v5, "setInteractionMechanisms:", v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "interactions"));
  objc_msgSend(v5, "setInteractions:", v22);

}

- (void)fetchAndSaveConversationsBetweenStartDate:(id)a3 EndDate:(id)a4 handler:(id)a5
{
  id v7;
  _QWORD v8[4];
  MOSignificantContactManager *v9;
  id v10;

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __89__MOSignificantContactManager_fetchAndSaveConversationsBetweenStartDate_EndDate_handler___block_invoke;
  v8[3] = &unk_1002AEB80;
  v9 = self;
  v10 = a5;
  v7 = v10;
  -[MOSignificantContactManager _fetchInteractionsBetweenStartDate:EndDate:CompletionHandler:](v9, "_fetchInteractionsBetweenStartDate:EndDate:CompletionHandler:", a3, a4, v8);

}

void __89__MOSignificantContactManager_fetchAndSaveConversationsBetweenStartDate_EndDate_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, id, _QWORD))(v7 + 16))(v7, v6, 0);
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = __89__MOSignificantContactManager_fetchAndSaveConversationsBetweenStartDate_EndDate_handler___block_invoke_2;
    v9[3] = &unk_1002ADA40;
    v8 = *(void **)(a1 + 32);
    v10 = *(id *)(a1 + 40);
    objc_msgSend(v8, "_saveConversations:handler:", v5, v9);

  }
}

uint64_t __89__MOSignificantContactManager_fetchAndSaveConversationsBetweenStartDate_EndDate_handler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)rehydrateConversations:(id)a3 handler:(id)a4
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
  v8 = objc_claimAutoreleasedReturnValue(-[MOSignificantContactManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __62__MOSignificantContactManager_rehydrateConversations_handler___block_invoke;
  block[3] = &unk_1002AEBA8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

id __62__MOSignificantContactManager_rehydrateConversations_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rehydrateConversations:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_rehydrateConversations:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getDurationOfMOEventArray"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "endDate"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = __63__MOSignificantContactManager__rehydrateConversations_handler___block_invoke;
  v13[3] = &unk_1002AEBD0;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  -[MOSignificantContactManager _fetchInteractionsBetweenStartDate:EndDate:CompletionHandler:](self, "_fetchInteractionsBetweenStartDate:EndDate:CompletionHandler:", v9, v10, v13);

}

void __63__MOSignificantContactManager__rehydrateConversations_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_rehydrateStoredEvents:fromConversations:", v6, a2));
  objc_msgSend(*(id *)(a1 + 32), "_updateClassificationForEvents:", v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)updateConversationsDeletedAtSource:(id)a3 handler:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __74__MOSignificantContactManager_updateConversationsDeletedAtSource_handler___block_invoke;
  v7[3] = &unk_1002ADA40;
  v8 = a4;
  v6 = v8;
  -[MOSignificantContactManager _updateConversationsDeletedAtSource:handler:](self, "_updateConversationsDeletedAtSource:handler:", a3, v7);
  -[MOSignificantContactManager waitForQueueEmpty](self, "waitForQueueEmpty");

}

uint64_t __74__MOSignificantContactManager_updateConversationsDeletedAtSource_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_updateConversationsDeletedAtSource:(id)a3 handler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MORehydrationThresholdMetrics *v16;
  id v17;
  id os_log;
  NSObject *v19;
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  MORehydrationMetrics *v24;
  void *v25;
  id v26;
  void *v27;
  MORehydrationMetrics *v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  MORehydrationMetrics *v33;
  id v34;
  NSObject *v35;
  MORehydrationMetrics *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v44;
  void *v45;
  MORehydrationMetrics *v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  _QWORD v58[6];
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  uint8_t buf[4];
  id v72;
  _BYTE v73[128];

  v5 = a3;
  v42 = a4;
  v45 = v5;
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getDurationOfMOEventArray"));
  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__5;
  v69 = __Block_byref_object_dispose__5;
  v70 = 0;
  v59 = 0;
  v60 = &v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__5;
  v63 = __Block_byref_object_dispose__5;
  v64 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "startDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "endDate"));
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = __75__MOSignificantContactManager__updateConversationsDeletedAtSource_handler___block_invoke;
  v58[3] = &unk_1002AEB08;
  v58[4] = &v65;
  v58[5] = &v59;
  -[MOSignificantContactManager _fetchInteractionsBetweenStartDate:EndDate:CompletionHandler:](self, "_fetchInteractionsBetweenStartDate:EndDate:CompletionHandler:", v6, v7, v58);

  -[MOSignificantContactManager waitForQueueEmpty](self, "waitForQueueEmpty");
  if (v66[5])
  {
    v46 = (MORehydrationMetrics *)objc_alloc_init((Class)NSMutableArray);
    v47 = objc_alloc_init((Class)NSMutableArray);
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v8 = v45;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v73, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v54 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i);
          v13 = (void *)v66[5];
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifierFromProvider"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v14));

          if (v15)
          {
            if (objc_msgSend(v12, "rehydrationFailCount"))
            {
              v16 = -[MORehydrationThresholdMetrics initWithCategory:provider:failureCount:]([MORehydrationThresholdMetrics alloc], "initWithCategory:provider:failureCount:", objc_msgSend(v12, "category"), objc_msgSend(v12, "provider"), objc_msgSend(v12, "rehydrationFailCount"));
              v52 = 0;
              -[MORehydrationThresholdMetrics submitMetricsWithError:](v16, "submitMetricsWithError:", &v52);
              v17 = v52;
              objc_msgSend(v12, "setRehydrationFailCount:", 0);
              objc_msgSend(v47, "addObject:", v12);

            }
          }
          else
          {
            objc_msgSend(v12, "setRehydrationFailCount:", (char *)objc_msgSend(v12, "rehydrationFailCount") + 1);
            -[MORehydrationMetrics addObject:](v46, "addObject:", v12);
          }

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v53, v73, 16);
      }
      while (v9);
    }

    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    v19 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = -[MORehydrationMetrics count](v46, "count");
      *(_DWORD *)buf = 134217984;
      v72 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%ld previously saved conversation(s) not found, therefore deleting them.", buf, 0xCu);
    }

    v21 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = objc_msgSend(v47, "count");
      *(_DWORD *)buf = 134217984;
      v72 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%ld previously rehydration failed conversation(s) now are found, therefore change rehydration failure count.", buf, 0xCu);
    }

    v24 = [MORehydrationMetrics alloc];
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v26 = objc_msgSend(v25, "category");
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v28 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v24, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v26, objc_msgSend(v27, "provider"), 1, 0, objc_msgSend(v8, "count"), 1, (double)(int)-[MORehydrationMetrics count](v46, "count"), (double)(int)objc_msgSend(v47, "count"));

    v51 = 0;
    -[MORehydrationMetrics submitMetricsWithError:](v28, "submitMetricsWithError:", &v51);
    v29 = v51;
    v30 = -[MORehydrationMetrics copy](v46, "copy");
    objc_msgSend(v47, "addObjectsFromArray:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MOSignificantContactManager momentStore](self, "momentStore"));
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = __75__MOSignificantContactManager__updateConversationsDeletedAtSource_handler___block_invoke_323;
    v48[3] = &unk_1002AEB58;
    v32 = v47;
    v49 = v32;
    v50 = v42;
    objc_msgSend(v31, "storeEvents:CompletionHandler:", v32, v48);

    v33 = v46;
  }
  else
  {
    v34 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[MOSignificantContactManager _updateConversationsDeletedAtSource:handler:].cold.1();

    if (v42)
      (*((void (**)(id, uint64_t, void *))v42 + 2))(v42, v60[5], &__NSDictionary0__struct);
    v36 = [MORehydrationMetrics alloc];
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "firstObject"));
    v38 = objc_msgSend(v37, "category");
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "firstObject"));
    v40 = objc_msgSend(v39, "provider");
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v60[5], "description"));
    v33 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v36, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", v38, v40, 0, v41, objc_msgSend(v45, "count"), 1, (double)(int)objc_msgSend(v45, "count"), 0.0);

    v57 = 0;
    -[MORehydrationMetrics submitMetricsWithError:](v33, "submitMetricsWithError:", &v57);
  }

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v65, 8);

}

void __75__MOSignificantContactManager__updateConversationsDeletedAtSource_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v5, "count"));
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "providerId", (_QWORD)v20));
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v6;

}

void __75__MOSignificantContactManager__updateConversationsDeletedAtSource_handler___block_invoke_323(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id os_log;
  NSObject *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  int v12;
  id v13;

  v5 = a2;
  v6 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
  v8 = objc_claimAutoreleasedReturnValue(os_log);
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __75__MOSignificantContactManager__updateConversationsDeletedAtSource_handler___block_invoke_323_cold_1(a1, (uint64_t)v5, v9);
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(*(id *)(a1 + 32), "count");
    v12 = 134217984;
    v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "update %ld significant contact event(s) in database succeeded!", (uint8_t *)&v12, 0xCu);
  }

  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v5, v6);

}

- (void)waitForQueueEmpty
{
  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_324);
}

- (void)fetchConversationEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
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
  v14 = objc_claimAutoreleasedReturnValue(-[MOSignificantContactManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __104__MOSignificantContactManager_fetchConversationEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
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

id __104__MOSignificantContactManager_fetchConversationEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fetchConversationEventsBetweenStartDate:endDate:withStoredEvents:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_fetchConversationEventsBetweenStartDate:(id)a3 endDate:(id)a4 withStoredEvents:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  MOSignificantContactManager *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[2];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("category"), 10));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("provider"), 3));
  v30[0] = v14;
  v30[1] = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 2));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v16));

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __105__MOSignificantContactManager__fetchConversationEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke;
  v23[3] = &unk_1002AEC18;
  v24 = v12;
  v25 = self;
  v26 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "filteredArrayUsingPredicate:", v17));
  v27 = v10;
  v28 = v11;
  v29 = v13;
  v18 = v11;
  v19 = v10;
  v20 = v26;
  v21 = v12;
  v22 = v13;
  -[MOSignificantContactManager _fetchInteractionsBetweenStartDate:EndDate:CompletionHandler:](self, "_fetchInteractionsBetweenStartDate:EndDate:CompletionHandler:", v19, v18, v23);

}

void __105__MOSignificantContactManager__fetchConversationEventsBetweenStartDate_endDate_withStoredEvents_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSMutableDictionary *v7;
  NSMutableArray *v8;
  id os_log;
  NSObject *v10;
  MORehydrationMetrics *v11;
  void *v12;
  MORehydrationMetrics *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;

  v5 = a2;
  v6 = a3;
  v7 = objc_opt_new(NSMutableDictionary);
  v8 = objc_opt_new(NSMutableArray);
  if (v6)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    v10 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "fetching interactions from source hit error", buf, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    v11 = [MORehydrationMetrics alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
    v13 = -[MORehydrationMetrics initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:](v11, "initWithCategory:provider:spiSuccess:spiError:failCount:successAfterPreFailCount:totalCount:rehydrationTrigger:", 10, 3, 0, v12, objc_msgSend(*(id *)(a1 + 32), "count"), 3, (double)(int)objc_msgSend(*(id *)(a1 + 32), "count"), 0.0);

    v24 = 0;
    -[MORehydrationMetrics submitMetricsWithError:](v13, "submitMetricsWithError:", &v24);
  }
  else
  {
    v13 = (MORehydrationMetrics *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_rehydrateStoredEvents:fromConversations:", *(_QWORD *)(a1 + 48), v5));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_createNewEventsFromConversations:storedEvents:", v5, *(_QWORD *)(a1 + 48)));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "_findUnrehydratedEventsWithStoredEvents:conversations:", *(_QWORD *)(a1 + 48), v5));
    v16 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v22 = *(_QWORD *)(a1 + 56);
      v23 = *(_QWORD *)(a1 + 64);
      v21 = -[MORehydrationMetrics count](v13, "count");
      v20 = objc_msgSend(v14, "count");
      v18 = objc_msgSend(v15, "count");
      v19 = objc_msgSend(*(id *)(a1 + 48), "count");
      *(_DWORD *)buf = 138413570;
      v26 = v22;
      v27 = 2112;
      v28 = v23;
      v29 = 2048;
      v30 = v21;
      v31 = 2048;
      v32 = v20;
      v33 = 2048;
      v34 = v18;
      v35 = 2048;
      v36 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "start date, %@, end date, %@, rehydrated contact events count, %lu, new contact events counts, %lu, unrehydrated contact events count, %lu, stored contact events count, %lu", buf, 0x3Eu);
    }

    if (v15)
      -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v15, CFSTR("unrehydratedEvents"));
    if (v14)
    {
      -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v14, CFSTR("newEvents"));
      -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", v14);
    }
    if (v13)
    {
      -[NSMutableDictionary setObject:forKey:](v7, "setObject:forKey:", v13, CFSTR("rehydratedEvents"));
      -[NSMutableArray addObjectsFromArray:](v8, "addObjectsFromArray:", v13);
    }
    objc_msgSend(*(id *)(a1 + 40), "_updateClassificationForEvents:", v8);
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

  }
}

- (void)_updateClassificationForEvents:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id os_log;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *j;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  id v39;
  _BYTE v40[128];

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "significantContactEvent"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "interactions"));
        v14 = objc_msgSend(v13, "count");

        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "significantContactEvent"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "interactions"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "firstObject"));
          -[NSMutableArray addObject:](v5, "addObject:", v17);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    }
    while (v8);
  }

  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
  v19 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = -[NSMutableArray count](v5, "count");
    *(_DWORD *)buf = 134217984;
    v39 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "interactions count, %lu", buf, 0xCu);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MOSignificantContactManager _collectSignificantContactsFromInteractions:](self, "_collectSignificantContactsFromInteractions:", v5));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MOSignificantContactManager _fetchClassificationForSignificantContacts:](self, "_fetchClassificationForSignificantContacts:", v21));
  if (objc_msgSend(v6, "count"))
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v23 = v6;
    v24 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          if (*(_QWORD *)v30 != v26)
            objc_enumerationMutation(v23);
          -[MOSignificantContactManager _updateClassificationForEvent:withClassificationDict:contactDict:](self, "_updateClassificationForEvent:withClassificationDict:contactDict:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)j), v22, v21, (_QWORD)v29);
        }
        v25 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v25);
    }
  }
  else
  {
    v28 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    v23 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "No MOEvents to be updated for classification", buf, 2u);
    }
  }

}

- (void)_updateClassificationForEvent:(id)a3 withClassificationDict:(id)a4 contactDict:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
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
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *i;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  id v49;
  id v50;
  uint64_t v51;
  void *j;
  void *v53;
  void *v54;
  id os_log;
  NSObject *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  NSMutableArray *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint8_t buf[4];
  void *v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  _BYTE v90[128];
  _BYTE v91[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v75 = objc_opt_new(NSMutableArray);
  v10 = objc_alloc_init((Class)NSMutableDictionary);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "significantContactEvent"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "interactions"));
  v68 = v10;
  if (objc_msgSend(v12, "count"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "significantContactEvent"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "interactions"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", 0));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sender"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "personId"));
    if (v17)
    {
      v18 = (void *)v17;
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "significantContactEvent"));
      v73 = v11;
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "interactions"));
      v71 = v14;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "objectAtIndexedSubscript:", 0));
      v69 = v13;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sender"));
      v63 = v15;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "personId"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v21));

      v10 = v68;
      if (!v22)
        goto LABEL_7;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "significantContactEvent"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "interactions"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", 0));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "sender"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "personId"));

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v11));
      -[NSMutableArray addObject:](v75, "addObject:", v12);
    }
    else
    {

      v10 = v68;
    }
  }

LABEL_7:
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "significantContactEvent"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "interactions"));
  v29 = objc_msgSend(v28, "count");

  if (v29)
  {
    v66 = v8;
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v30 = v7;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "significantContactEvent"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "interactions"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectAtIndexedSubscript:", 0));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "recipients"));

    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v80, v91, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v81;
      do
      {
        for (i = 0; i != v36; i = (char *)i + 1)
        {
          if (*(_QWORD *)v81 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)i);
          v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "personId"));
          if (v40)
          {
            v41 = (void *)v40;
            v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "personId"));
            v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v42));

            if (v43)
            {
              v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "personId"));
              v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v44));
              -[NSMutableArray addObject:](v75, "addObject:", v45);

            }
          }
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v80, v91, 16);
      }
      while (v36);
    }

    v7 = v30;
    v8 = v66;
    v10 = v68;
  }
  if (-[NSMutableArray count](v75, "count")
    && (v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allKeys")),
        v47 = objc_msgSend(v46, "count"),
        v46,
        v47))
  {
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v48 = v75;
    v49 = -[NSObject countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v76, v90, 16);
    if (v49)
    {
      v50 = v49;
      v64 = v7;
      v51 = *(_QWORD *)v77;
      v67 = v8;
      do
      {
        for (j = 0; j != v50; j = (char *)j + 1)
        {
          if (*(_QWORD *)v77 != v51)
            objc_enumerationMutation(v48);
          v53 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)j);
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v53));
          if (v54)
          {
            objc_msgSend(v10, "setObject:forKey:", v54, v53);
            os_log = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
            v56 = objc_claimAutoreleasedReturnValue(os_log);
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
            {
              v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "contact"));
              v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "identifier"));
              v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "contact"));
              v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "givenName"));
              v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "mask"));
              *(_DWORD *)buf = 138412802;
              v85 = v54;
              v86 = 2112;
              v87 = v70;
              v88 = 2112;
              v89 = v58;
              _os_log_debug_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEBUG, "_updateClassificationForEvent, classification, %@, contactID, %@, name, %@", buf, 0x20u);

              v10 = v68;
              v8 = v67;

            }
          }

        }
        v50 = -[NSObject countByEnumeratingWithState:objects:count:](v48, "countByEnumeratingWithState:objects:count:", &v76, v90, 16);
      }
      while (v50);
      v7 = v64;
    }
  }
  else
  {
    v59 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    v48 = objc_claimAutoreleasedReturnValue(v59);
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "No contacts or no classification dictionary", buf, 2u);
    }
  }

  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "significantContactEvent"));
  objc_msgSend(v60, "setContactClassificationMap:", v10);

  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "significantContactEvent"));
  objc_msgSend(v61, "setInteractionContacts:", v75);

}

- (id)_createEventsFromConversations:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSObject *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  id os_log;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[8];
  _BYTE v20[128];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_opt_new(NSMutableArray);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v4;
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOSignificantContactManager _createEventFromConversation:](self, "_createEventFromConversation:", v11, (_QWORD)v15));
          -[MOSignificantContactManager _setDynamicPropertiesForEvent:fromCoversation:](self, "_setDynamicPropertiesForEvent:fromCoversation:", v12, v11);
          -[NSMutableArray addObject:](v5, "addObject:", v12);

        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v8);
    }
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "no conversation for creating events", buf, 2u);
    }
    v5 = 0;
  }

  return v5;
}

- (id)_createNewEventsFromConversations:(id)a3 storedEvents:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  NSMutableArray *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  void *v22;
  unsigned __int8 v23;
  void *v24;
  id v25;
  NSObject *v26;
  id os_log;
  NSObject *v28;
  MOSignificantContactManager *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[16];
  _BYTE v41[128];
  _BYTE v42[128];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    if (objc_msgSend(v7, "count"))
    {
      v30 = self;
      v8 = objc_opt_new(NSMutableSet);
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v31 = v7;
      v9 = v7;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v37 != v12)
              objc_enumerationMutation(v9);
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i), "identifierFromProvider", v30));
            -[NSMutableSet addObject:](v8, "addObject:", v14);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
        }
        while (v11);
      }

      v15 = objc_opt_new(NSMutableArray);
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v16 = v6;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v33;
        do
        {
          for (j = 0; j != v18; j = (char *)j + 1)
          {
            if (*(_QWORD *)v33 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)j);
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "providerId", v30));
            v23 = -[NSMutableSet containsObject:](v8, "containsObject:", v22);

            if ((v23 & 1) == 0)
              -[NSMutableArray addObject:](v15, "addObject:", v21);
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
        }
        while (v18);
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MOSignificantContactManager _createEventsFromConversations:](v30, "_createEventsFromConversations:", v15));
      v7 = v31;
    }
    else
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
      v28 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "no stored events to check for creating new contact events", buf, 2u);
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MOSignificantContactManager _createEventsFromConversations:](self, "_createEventsFromConversations:", v6));
    }
  }
  else
  {
    v25 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "no workouts for creating new contact events", buf, 2u);
    }

    v24 = 0;
  }

  return v24;
}

- (id)_findUnrehydratedEventsWithStoredEvents:(id)a3 conversations:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  void *k;
  id os_log;
  NSObject *v32;
  id v33;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint8_t v49[128];
  uint8_t buf[4];
  id v51;
  _BYTE v52[128];

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    if (objc_msgSend(v6, "count"))
    {
      v7 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v6, "count"));
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v35 = v6;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v41 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "providerId"));
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v14);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
        }
        while (v10);
      }

      v15 = objc_alloc_init((Class)NSMutableArray);
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v16 = v5;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v37;
        do
        {
          for (j = 0; j != v18; j = (char *)j + 1)
          {
            if (*(_QWORD *)v37 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)j);
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifierFromProvider"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v22));

            if (!v23)
            {
              objc_msgSend(v21, "setRehydrationFailCount:", (char *)objc_msgSend(v21, "rehydrationFailCount") + 1);
              objc_msgSend(v15, "addObject:", v21);
            }

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
        }
        while (v18);
      }

      v6 = v35;
    }
    else
    {
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v26 = v5;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v45;
        do
        {
          for (k = 0; k != v28; k = (char *)k + 1)
          {
            if (*(_QWORD *)v45 != v29)
              objc_enumerationMutation(v26);
            objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)k), "setRehydrationFailCount:", (char *)objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)k), "rehydrationFailCount") + 1);
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        }
        while (v28);
      }

      os_log = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
      v32 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        v33 = objc_msgSend(v26, "count");
        *(_DWORD *)buf = 134217984;
        v51 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "no conversation fetched ,so all stored contact events are unrehydrated, count, %lu", buf, 0xCu);
      }

      v15 = v26;
    }
  }
  else
  {
    v24 = _mo_log_facility_get_os_log(&MOLogFacilitySignificantContact);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "no stored contact events for finding unrehydrated events", buf, 2u);
    }

    v15 = 0;
  }

  return v15;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (_CDInteractionStore)interactionStore
{
  return self->_interactionStore;
}

- (PPContactStore)ppContactStore
{
  return self->_ppContactStore;
}

- (CNContactStore)cnContactStore
{
  return self->_cnContactStore;
}

- (MOEventStore)momentStore
{
  return self->_momentStore;
}

- (GDVisualIdentifierView)visualIdentifierView
{
  return self->_visualIdentifierView;
}

- (GDEntityTaggingService)entityTaggingSerice
{
  return self->_entityTaggingSerice;
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void)setConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_configurationManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_entityTaggingSerice, 0);
  objc_storeStrong((id *)&self->_visualIdentifierView, 0);
  objc_storeStrong((id *)&self->_momentStore, 0);
  objc_storeStrong((id *)&self->_cnContactStore, 0);
  objc_storeStrong((id *)&self->_ppContactStore, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_meIdentifiers, 0);
  objc_storeStrong((id *)&self->_callLikeMechanismsSet, 0);
  objc_storeStrong((id *)&self->_tollFreeNumberPrefixes, 0);
}

- (void)initWithDuetStore:ppContactStore:cnContactStore:momentStore:configurationManager:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: momentStore", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)intializeEntityTaggingService
{
  void *v3;
  uint8_t v4[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "localizedDescription"));
  OUTLINED_FUNCTION_2();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#megadome,GDEntityTaggingService init failed,error,%@", v4, 0xCu);

  OUTLINED_FUNCTION_5();
}

- (void)_eligibleInteraction:(NSObject *)a3 .cold.1(const char *a1, void *a2, NSObject *a3)
{
  NSString *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;

  v5 = NSStringFromSelector(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "mask"));
  v8 = 138412546;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%@, filter out ineligible interaction with phone number, %@", (uint8_t *)&v8, 0x16u);

}

- (void)_collectSignificantContactsFromInteractions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Ranked contact query error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __75__MOSignificantContactManager__collectSignificantContactsFromInteractions___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;

  v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "contact"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedFullName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mask"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "contact"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
  objc_msgSend(a2, "score");
  v13 = 138413058;
  v14 = v6;
  v15 = 2112;
  v16 = v9;
  v17 = 2112;
  v18 = v11;
  v19 = 2048;
  v20 = v12;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%@, name: %@, identifier: %@, score: %f", (uint8_t *)&v13, 0x2Au);

}

- (void)_conversationsFromInteractions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, " ---  Grouped Interactions Count  :%3lu", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_conversationsFromInteractions:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, a2, v3, " ---  Received Interactions Count :%3lu", v4);
  OUTLINED_FUNCTION_5();
}

- (void)_saveConversations:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "No conversations will be saved this round", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_saveConversations:(uint64_t)a3 handler:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, a2, a3, "Fetching previous saved conversation for deduplication failed: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __58__MOSignificantContactManager__saveConversations_handler___block_invoke_2_311_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "saving conversations into database failed with error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_fetchClassificationForSignificantContacts:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "#megadome,GDEntityTaggingService init failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_fetchClassificationForSignificantContacts:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "#megadome,no mega person ID is found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_fetchClassificationForSignificantContacts:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "#megadome,GDRankedPersonEntityTags fetch hit error, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_updateConversationsDeletedAtSource:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "nil query result from interactions fetching, no events removed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

void __75__MOSignificantContactManager__updateConversationsDeletedAtSource_handler___block_invoke_323_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint8_t v5[12];
  __int16 v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "count");
  OUTLINED_FUNCTION_2();
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "update %ld significant contact event(s) in database failed, error %@", v5, 0x16u);
  OUTLINED_FUNCTION_5();
}

@end
