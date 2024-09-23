@implementation MOEventBundleLabelFormatter

- (MOEventBundleLabelFormatter)init
{
  MOEventBundleLabelFormatter *v2;
  MOEventBundleLabelFormatter *v3;
  NSString *templatePath;
  NSDictionary *templates;
  NSDictionary *context;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MOEventBundleLabelFormatter;
  v2 = -[MOEventBundleLabelFormatter init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    templatePath = v2->_templatePath;
    v2->_templatePath = 0;

    templates = v3->_templates;
    v3->_templates = 0;

    context = v3->_context;
    v3->_context = 0;

  }
  return v3;
}

- (MOEventBundleLabelFormatter)initWithTemplatePath:(id)a3
{
  id v5;
  MOEventBundleLabelFormatter *v6;
  MOEventBundleLabelFormatter *v7;
  NSDictionary *templates;
  NSDictionary *context;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MOEventBundleLabelFormatter;
  v6 = -[MOEventBundleLabelFormatter init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_templatePath, a3);
    templates = v7->_templates;
    v7->_templates = 0;

    context = v7->_context;
    v7->_context = 0;

  }
  return v7;
}

- (void)loadLabelTemplates
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "loadLabelTemplates from dir, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (MOEventBundleLabelFormatter)initWithUniverse:(id)a3
{
  return -[MOEventBundleLabelFormatter initWithTemplatePath:](self, "initWithTemplatePath:", CFSTR("/System/Library/PrivateFrameworks/Moments.framework/LabelTemplates"));
}

- (id)getTemplateDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id os_log;
  NSObject *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _MomentsBundle](MOEventBundleLabelLocalizer, "_MomentsBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bundlePath"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v3, 1));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("LabelTemplates")));

  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v7 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MOEventBundleLabelFormatter getTemplateDirectoryURL].cold.1();

    v5 = 0;
  }

  return v5;
}

- (NSDictionary)templates
{
  NSDictionary *templates;
  NSString *templatePath;
  void *v5;
  NSString *v6;
  NSString *v7;

  templates = self->_templates;
  if (!templates)
  {
    templatePath = self->_templatePath;
    if (!templatePath)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleLabelFormatter getTemplateDirectoryURL](self, "getTemplateDirectoryURL"));
      v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
      v7 = self->_templatePath;
      self->_templatePath = v6;

      templatePath = self->_templatePath;
    }
    -[MOEventBundleLabelFormatter loadLabelTemplatesFromDirectory:](self, "loadLabelTemplatesFromDirectory:", templatePath);
    templates = self->_templates;
  }
  return templates;
}

- (NSDictionary)context
{
  NSDictionary *context;
  NSString *templatePath;
  void *v5;
  NSString *v6;
  NSString *v7;

  context = self->_context;
  if (!context)
  {
    templatePath = self->_templatePath;
    if (!templatePath)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleLabelFormatter getTemplateDirectoryURL](self, "getTemplateDirectoryURL"));
      v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
      v7 = self->_templatePath;
      self->_templatePath = v6;

      templatePath = self->_templatePath;
    }
    -[MOEventBundleLabelFormatter loadLabelTemplatesFromDirectory:](self, "loadLabelTemplatesFromDirectory:", templatePath);
    context = self->_context;
  }
  return context;
}

- (void)loadLabelTemplatesFromDirectory:(id)a3
{
  id v3;
  id os_log;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *i;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  NSObject *v50;
  MOEventBundleLabelTemplate *v51;
  id v52;
  NSObject *v53;
  MOEventBundleLabelTemplate *v54;
  void *v55;
  void *v56;
  id v57;
  NSObject *v58;
  id v59;
  NSObject *v60;
  NSMutableArray *v61;
  id v62;
  id v63;
  uint64_t v64;
  void *j;
  void *v66;
  id v67;
  NSObject *v68;
  id v69;
  id v70;
  id v71;
  NSObject *v72;
  NSDictionary *templates;
  NSObject *v74;
  NSDictionary *v75;
  id v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  id obj;
  uint64_t v83;
  id v84;
  void *v85;
  uint64_t v86;
  void *v87;
  id v88;
  NSMutableDictionary *v89;
  uint64_t v90;
  id v92;
  NSMutableDictionary *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  NSMutableArray *v100;
  NSMutableArray *v101;
  id v102;
  char *v103;
  char *v104;
  void *v105;
  uint64_t v106;
  id v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *context;
  void *v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  id v131;
  uint8_t v132[128];
  uint8_t buf[4];
  uint64_t v134;
  __int16 v135;
  void *v136;
  __int16 v137;
  id v138;
  _BYTE v139[128];
  _BYTE v140[128];
  _BYTE v141[128];

  v3 = a3;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[MOEventBundleLabelFormatter loadLabelTemplatesFromDirectory:].cold.2();

  v131 = 0;
  v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "contentsOfDirectoryAtPath:error:", v3, &v131));
  v7 = v131;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("self ENDSWITH '.json'")));
  v79 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "filteredArrayUsingPredicate:", v8));

  v78 = v9;
  if (v9 && objc_msgSend(v9, "count"))
  {
    v77 = v7;
    v89 = objc_opt_new(NSMutableDictionary);
    v93 = objc_opt_new(NSMutableDictionary);
    v127 = 0u;
    v128 = 0u;
    v129 = 0u;
    v130 = 0u;
    obj = v9;
    v81 = v3;
    v84 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v141, 16);
    if (v84)
    {
      v83 = *(_QWORD *)v128;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v128 != v83)
            objc_enumerationMutation(obj);
          v86 = v10;
          v11 = *(_QWORD *)(*((_QWORD *)&v127 + 1) + 8 * v10);
          v85 = objc_autoreleasePoolPush();
          v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", v11));
          v13 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v14 = objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v134 = v12;
            _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Template file, %@", buf, 0xCu);
          }

          v15 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleLabelFormatter loadDictionaryFromPath:](self, "loadDictionaryFromPath:", v12));
          v98 = (void *)v12;
          v87 = v15;
          if (v15 && objc_msgSend(v15, "count"))
          {
            v16 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
            v17 = objc_claimAutoreleasedReturnValue(v16);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v134 = v12;
              v135 = 2112;
              v136 = v87;
              _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Template file, %@, dict, %@", buf, 0x16u);
            }

            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "objectForKeyedSubscript:", CFSTR("cases")));
            v123 = 0u;
            v124 = 0u;
            v125 = 0u;
            v126 = 0u;
            v88 = v18;
            v92 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v123, v140, 16);
            if (v92)
            {
              v103 = 0;
              v104 = 0;
              v90 = *(_QWORD *)v124;
              do
              {
                v19 = 0;
                do
                {
                  if (*(_QWORD *)v124 != v90)
                    objc_enumerationMutation(v88);
                  v96 = v19;
                  v20 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * v19);
                  v95 = objc_autoreleasePoolPush();
                  v21 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                  v22 = objc_claimAutoreleasedReturnValue(v21);
                  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412546;
                    v134 = (uint64_t)v98;
                    v135 = 2112;
                    v136 = v20;
                    _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Template file, %@, subdict, %@", buf, 0x16u);
                  }

                  v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("bundleType")));
                  v97 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleLabelFormatter keywordForTemplateType:bundleType:](self, "keywordForTemplateType:bundleType:", CFSTR("labels"), v23));
                  v99 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleLabelFormatter keywordForTemplateType:bundleType:](self, "keywordForTemplateType:bundleType:", CFSTR("prompts"), v23));
                  v101 = objc_opt_new(NSMutableArray);
                  v100 = objc_opt_new(NSMutableArray);
                  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("context")));
                  if (v24)
                  {
                    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v93, "objectForKey:", v23));
                    if (v25)
                    {
                      v26 = objc_msgSend(v24, "mutableCopy");
                      objc_msgSend(v26, "addEntriesFromDictionary:", v25);

                      v24 = v26;
                    }
                    -[NSMutableDictionary setObject:forKey:](v93, "setObject:forKey:", v24, v23, v77, v78);

                  }
                  v105 = v24;
                  v94 = (void *)v23;
                  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("templates"), v77));
                  v119 = 0u;
                  v120 = 0u;
                  v121 = 0u;
                  v122 = 0u;
                  v102 = v27;
                  v107 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v119, v139, 16);
                  if (v107)
                  {
                    v106 = *(_QWORD *)v120;
                    do
                    {
                      for (i = 0; i != v107; i = (char *)i + 1)
                      {
                        if (*(_QWORD *)v120 != v106)
                          objc_enumerationMutation(v102);
                        v29 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * (_QWORD)i);
                        v30 = objc_autoreleasePoolPush();
                        v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("conditions")));
                        v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("extends")));
                        v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("capitalizations")));
                        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("labels")));
                        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("prompts")));
                        v36 = v35;
                        context = v30;
                        if (v34)
                          v37 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "arrayByAddingObjectsFromArray:", v35));
                        else
                          v37 = v35;
                        v110 = v37;
                        v38 = objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelTemplate conditionsFromLabels:](MOEventBundleLabelTemplate, "conditionsFromLabels:", v37));
                        v39 = objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelTemplate conditionsFromConditionStrings:](MOEventBundleLabelTemplate, "conditionsFromConditionStrings:", v31));
                        v112 = (void *)v32;
                        v40 = objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelTemplate conditionsFromExtendStrings:](MOEventBundleLabelTemplate, "conditionsFromExtendStrings:", v32));
                        v111 = (void *)v33;
                        v41 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelTemplate conditionsFromCapitalizations:](MOEventBundleLabelTemplate, "conditionsFromCapitalizations:", v33));
                        v108 = (void *)v39;
                        v109 = (void *)v38;
                        v42 = (void *)v39;
                        v43 = (void *)v40;
                        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "setByAddingObjectsFromSet:", v38));
                        if (objc_msgSend(v43, "count"))
                        {
                          v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "setByAddingObjectsFromSet:", v43));

                          v44 = (void *)v45;
                        }
                        v114 = (void *)v31;
                        if (objc_msgSend(v41, "count"))
                        {
                          v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "setByAddingObjectsFromSet:", v41));

                          v44 = (void *)v46;
                        }
                        v47 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelTemplate formatsFromLabels:](MOEventBundleLabelTemplate, "formatsFromLabels:", v34));
                        v48 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelTemplate formatsFromLabels:](MOEventBundleLabelTemplate, "formatsFromLabels:", v36));
                        if (v34 && objc_msgSend(v34, "count"))
                        {
                          v49 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                          v50 = objc_claimAutoreleasedReturnValue(v49);
                          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 138412802;
                            v134 = (uint64_t)v34;
                            v135 = 2112;
                            v136 = v114;
                            v137 = 2112;
                            v138 = v44;
                            _os_log_debug_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEBUG, "template parsing, labels, %@, conditionStrings, %@, conditions, %@", buf, 0x20u);
                          }

                          v51 = -[MOEventBundleLabelTemplate initWithConditions:formats:context:]([MOEventBundleLabelTemplate alloc], "initWithConditions:formats:context:", v44, v47, v105);
                          -[NSMutableArray addObject:](v101, "addObject:", v51);
                          ++v103;

                        }
                        if (v36 && objc_msgSend(v36, "count"))
                        {
                          v52 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                          v53 = objc_claimAutoreleasedReturnValue(v52);
                          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
                          {
                            *(_DWORD *)buf = 138412802;
                            v134 = (uint64_t)v34;
                            v135 = 2112;
                            v136 = v114;
                            v137 = 2112;
                            v138 = v44;
                            _os_log_debug_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "template parsing, prompts, %@, conditionStrings, %@, conditions, %@", buf, 0x20u);
                          }

                          v54 = -[MOEventBundleLabelTemplate initWithConditions:formats:context:]([MOEventBundleLabelTemplate alloc], "initWithConditions:formats:context:", v44, v48, v105);
                          -[NSMutableArray addObject:](v100, "addObject:", v54);
                          ++v104;

                        }
                        objc_autoreleasePoolPop(context);
                      }
                      v107 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v119, v139, 16);
                    }
                    while (v107);
                  }

                  v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v89, "objectForKey:", v97));
                  -[NSMutableArray addObjectsFromArray:](v101, "addObjectsFromArray:", v55);
                  -[NSMutableDictionary setObject:forKey:](v89, "setObject:forKey:", v101, v97);
                  v56 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v89, "objectForKey:", v99));
                  -[NSMutableArray addObjectsFromArray:](v100, "addObjectsFromArray:", v56);
                  -[NSMutableDictionary setObject:forKey:](v89, "setObject:forKey:", v100, v99);
                  v57 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                  v58 = objc_claimAutoreleasedReturnValue(v57);
                  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
                  {
                    v69 = -[NSMutableArray count](v101, "count");
                    *(_DWORD *)buf = 138412802;
                    v134 = (uint64_t)v98;
                    v135 = 2112;
                    v136 = v97;
                    v137 = 2048;
                    v138 = v69;
                    _os_log_debug_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "Template file, %@, key, %@, templates.count, %lu", buf, 0x20u);
                  }

                  v59 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                  v60 = objc_claimAutoreleasedReturnValue(v59);
                  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
                  {
                    v70 = -[NSMutableArray count](v100, "count");
                    *(_DWORD *)buf = 138412802;
                    v134 = (uint64_t)v98;
                    v135 = 2112;
                    v136 = v99;
                    v137 = 2048;
                    v138 = v70;
                    _os_log_debug_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEBUG, "Template file, %@, key, %@, templates.count, %lu", buf, 0x20u);
                  }

                  v117 = 0u;
                  v118 = 0u;
                  v115 = 0u;
                  v116 = 0u;
                  v61 = v100;
                  v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v115, v132, 16);
                  if (v62)
                  {
                    v63 = v62;
                    v64 = *(_QWORD *)v116;
                    do
                    {
                      for (j = 0; j != v63; j = (char *)j + 1)
                      {
                        if (*(_QWORD *)v116 != v64)
                          objc_enumerationMutation(v61);
                        v66 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * (_QWORD)j);
                        v67 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
                        v68 = objc_claimAutoreleasedReturnValue(v67);
                        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 138412802;
                          v134 = (uint64_t)v98;
                          v135 = 2112;
                          v136 = v99;
                          v137 = 2112;
                          v138 = v66;
                          _os_log_debug_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEBUG, "Template file, %@, key, %@, flattened template, %@", buf, 0x20u);
                        }

                      }
                      v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v115, v132, 16);
                    }
                    while (v63);
                  }

                  objc_autoreleasePoolPop(v95);
                  v19 = v96 + 1;
                }
                while ((id)(v96 + 1) != v92);
                v92 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v123, v140, 16);
              }
              while (v92);
            }
            else
            {
              v103 = 0;
              v104 = 0;
            }

            v3 = v81;
          }
          else
          {
            v103 = 0;
            v104 = 0;
          }
          v71 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
          v72 = objc_claimAutoreleasedReturnValue(v71);
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            v134 = (uint64_t)v98;
            v135 = 2048;
            v136 = v103;
            v137 = 2048;
            v138 = v104;
            _os_log_debug_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEBUG, "Template file, %@, label.count, %lu, prompts.count, %lu", buf, 0x20u);
          }

          objc_autoreleasePoolPop(v85);
          v10 = v86 + 1;
        }
        while ((id)(v86 + 1) != v84);
        v84 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v141, 16);
      }
      while (v84);
    }

    templates = self->_templates;
    self->_templates = &v89->super;
    v74 = v89;

    v3 = v81;
    v75 = self->_context;
    self->_context = &v93->super;

    v7 = v77;
  }
  else
  {
    v76 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v74 = objc_claimAutoreleasedReturnValue(v76);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
      -[MOEventBundleLabelFormatter loadLabelTemplatesFromDirectory:].cold.1();
  }

}

- (id)loadDictionaryFromPath:(id)a3
{
  id v3;
  void *v4;
  id v5;
  BOOL v6;
  id os_log;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  uint8_t v14[16];
  id v15;
  id v16;

  v3 = a3;
  v16 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v3, 0, &v16));
  v5 = v16;
  if (v5)
    v6 = 1;
  else
    v6 = v4 == 0;
  if (v6)
  {
    v10 = v5;
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MOEventBundleLabelFormatter loadDictionaryFromPath:].cold.1();
    goto LABEL_13;
  }
  v15 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v4, 0, &v15));
  v10 = v15;
  v11 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v8 = v12;
  if (!v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[MOEventBundleLabelFormatter loadDictionaryFromPath:].cold.2();
LABEL_13:
    v9 = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "The json file was successfully read.", v14, 2u);
  }
LABEL_14:

  return v9;
}

- (id)getContextForBundleType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleLabelFormatter context](self, "context"));

  v6 = 0;
  if (v4 && v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleLabelFormatter context](self, "context"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v4));

  }
  return v6;
}

- (id)formattedStringsForMetaData:(id)a3 templates:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *i;
  void *v13;
  void *v14;
  id os_log;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  MOEventBundleLabelFormatter *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];

  v6 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v8)
  {
    v9 = v8;
    v21 = self;
    v10 = *(_QWORD *)v23;
    v11 = &__NSArray0__struct;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v14 = objc_autoreleasePoolPush();
        os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v16 = objc_claimAutoreleasedReturnValue(os_log);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v27 = v13;
          _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "template, %@", buf, 0xCu);
        }

        if (objc_msgSend(v13, "checkConditionForMetaData:", v6))
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "formattedStringsForMetaData:", v6));
          if (objc_msgSend(v17, "count"))
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("shuffle_mode")));
            v19 = (int)objc_msgSend(v18, "intValue");

            v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleLabelFormatter shuffleStrings:shuffleMode:](v21, "shuffleStrings:shuffleMode:", v17, v19));
            objc_autoreleasePoolPop(v14);
            goto LABEL_16;
          }

        }
        objc_autoreleasePoolPop(v14);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    v11 = &__NSArray0__struct;
  }
LABEL_16:

  return v11;
}

- (id)shuffleStrings:(id)a3 shuffleMode:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  id os_log;
  NSObject *v12;
  NSMutableArray *v13;
  void *v14;
  void *v15;
  int v17;
  id v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  void *v24;

  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    if (a4 == 1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      objc_msgSend(v7, "timeIntervalSinceReferenceDate");
      v9 = (unint64_t)(v8 / 86400.0);
      v10 = v9 % (unint64_t)objc_msgSend(v6, "count");
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v12 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v17 = 134218754;
        v18 = objc_msgSend(v6, "count");
        v19 = 2048;
        v20 = v9;
        v21 = 2048;
        v22 = v10;
        v23 = 2112;
        v24 = v7;
        _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Shuffle Labels: count, %lu, seed, %lu, start_index, %lu, nowDate, %@", (uint8_t *)&v17, 0x2Au);
      }

      if (v10)
      {
        v13 = objc_opt_new(NSMutableArray);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subarrayWithRange:", v10, (char *)objc_msgSend(v6, "count") - v10));
        -[NSMutableArray addObjectsFromArray:](v13, "addObjectsFromArray:", v14);

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subarrayWithRange:", 0, v10));
        -[NSMutableArray addObjectsFromArray:](v13, "addObjectsFromArray:", v15);

      }
      else
      {
        v13 = v6;
      }

    }
    else
    {
      v13 = v6;
    }
  }
  else
  {
    v13 = (NSMutableArray *)&__NSArray0__struct;
  }

  return v13;
}

- (id)formattedBundleLabelsForMetaData:(id)a3 bundleType:(id)a4
{
  return -[MOEventBundleLabelFormatter formattedStringsForMetaData:templateType:bundleType:](self, "formattedStringsForMetaData:templateType:bundleType:", a3, CFSTR("labels"), a4);
}

- (id)formattedBundlePromptsForMetaData:(id)a3 bundleType:(id)a4
{
  return -[MOEventBundleLabelFormatter formattedStringsForMetaData:templateType:bundleType:](self, "formattedStringsForMetaData:templateType:bundleType:", a3, CFSTR("prompts"), a4);
}

- (id)formattedStringsForMetaData:(id)a3 templateType:(id)a4 bundleType:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id os_log;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleLabelFormatter keywordForTemplateType:bundleType:](self, "keywordForTemplateType:bundleType:", v9, a5));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[MOEventBundleLabelFormatter formattedStringsForMetaData:templateType:bundleType:].cold.1();

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleLabelFormatter templates](self, "templates"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v10));

  if (v14 && objc_msgSend(v14, "count"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleLabelFormatter formattedStringsForMetaData:templates:](self, "formattedStringsForMetaData:templates:", v8, v14));
  }
  else
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("prompts")))
      v16 = CFSTR("default_prompt");
    else
      v16 = CFSTR("default_label");
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v16));
    v18 = (void *)v17;
    if (v17)
    {
      v31 = v17;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
    }
    else
    {
      v19 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allKeys"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundleLabelFormatter templates](self, "templates"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "allKeys"));
        v25 = 138412802;
        v26 = v10;
        v27 = 2112;
        v28 = v22;
        v29 = 2112;
        v30 = v24;
        _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "The label template is not found for the keyword, %@, meta, %@, all keywords, %@", (uint8_t *)&v25, 0x20u);

      }
      v15 = 0;
    }

  }
  return v15;
}

- (id)keywordForTemplateType:(id)a3 bundleType:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lowercaseString"));

  return v5;
}

- (void)logDiagnoticsInformation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint8_t v11[14];
  void *v12;
  __int16 v13;
  uint64_t v14;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](NSLocale, "preferredLanguages"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localeIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "preferredLocalizations"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  OUTLINED_FUNCTION_9_0();
  v12 = v5;
  v13 = v9;
  v14 = v10;
  _os_log_debug_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_DEBUG, "preferredLanguage, %@, locale, %@, mainBundlePreferredLocalization, %@", v11, 0x20u);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_templates, 0);
  objc_storeStrong((id *)&self->_templatePath, 0);
}

- (void)getTemplateDirectoryURL
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "failed to get cache directory to store collection date plist file, nil cache directory.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)loadLabelTemplatesFromDirectory:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "The template directory is empty.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)loadLabelTemplatesFromDirectory:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "load templates from %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)loadDictionaryFromPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, v0, v1, "Could not read to the JSON file, error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)loadDictionaryFromPath:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  uint64_t v3;

  OUTLINED_FUNCTION_10();
  v3 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Couldn't parse JSON to dictionary. %@, error, %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)formattedStringsForMetaData:templateType:bundleType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, v0, v1, "keyword, %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
