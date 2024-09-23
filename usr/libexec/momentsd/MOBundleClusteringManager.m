@implementation MOBundleClusteringManager

- (MOBundleClusteringManager)initWithUniverse:(id)a3
{
  id v4;
  uint64_t v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  MOBundleClusteringManager *v10;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  void *v43;
  double v44;
  void *v45;
  double v46;
  void *v47;
  double v48;
  void *v49;
  double v50;
  void *v51;
  double v52;
  void *v53;
  double v54;
  void *v55;
  double v56;
  void *v57;
  double v58;
  void *v59;
  double v60;
  void *v61;
  double v62;
  void *v63;
  double v64;
  void *v65;
  MOClusteringParams *v66;
  MOClusteringParams *clusteringParams;
  MOHDBSCANClustering *v68;
  MOHDBSCANClustering *hdbscanClustering;
  double v70;
  float v71;
  double v72;
  float v73;
  double v74;
  float v75;
  double v76;
  float v77;
  double v78;
  float v79;
  double v80;
  float v81;
  objc_super v83;

  v4 = a3;
  v6 = (objc_class *)objc_opt_class(MOConfigurationManager, v5);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "getService:", v8));

  v83.receiver = self;
  v83.super_class = (Class)MOBundleClusteringManager;
  v10 = -[MOBundleClusteringManager init](&v83, "init");
  if (v10)
  {
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_create("MOBundleClusteringManager", v12);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v10->_configurationManager, v9);
    v15 = objc_opt_new(NSMutableDictionary);
    LODWORD(v16) = 0.25;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v10->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("embeddingDistWeight_activityContext"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v17, CFSTR("embeddingDistWeight_activityContext"));

    LODWORD(v18) = 1045220557;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v10->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("embeddingDistWeight_timeContext"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v19, CFSTR("embeddingDistWeight_timeContext"));

    LODWORD(v20) = 1053609165;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v10->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("embeddingDistWeight_locationContext"), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v21, CFSTR("embeddingDistWeight_locationContext"));

    LODWORD(v22) = 1036831949;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v10->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("embeddingDistWeight_socialContext"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v23, CFSTR("embeddingDistWeight_socialContext"));

    LODWORD(v24) = 1028443341;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v10->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("embeddingDistWeight_extraContext"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v25, CFSTR("embeddingDistWeight_extraContext"));

    LODWORD(v26) = 1050253722;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v10->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("embeddingDistWeight_topLevelActivityType"), v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v27, CFSTR("embeddingDistWeight_topLevelActivityType"));

    LODWORD(v28) = 1058642330;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v10->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("embeddingDistWeight_secondLevelActivityType"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v29, CFSTR("embeddingDistWeight_secondLevelActivityType"));

    LODWORD(v30) = 1036831949;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v10->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("embeddingDistWeight_activityTypeFromPhotoTraits"), v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v31, CFSTR("embeddingDistWeight_activityTypeFromPhotoTraits"));

    LODWORD(v32) = 1036831949;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v10->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("embeddingDistWeight_normalizedDuration"), v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v33, CFSTR("embeddingDistWeight_normalizedDuration"));

    LODWORD(v34) = 0.25;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v10->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("embeddingDistWeight_timeOfDay"), v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v35, CFSTR("embeddingDistWeight_timeOfDay"));

    LODWORD(v36) = 1053609165;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v10->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("embeddingDistWeight_dayOfWeek"), v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v37, CFSTR("embeddingDistWeight_dayOfWeek"));

    LODWORD(v38) = 1045220557;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v10->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("embeddingDistWeight_isWeekend"), v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v39, CFSTR("embeddingDistWeight_isWeekend"));

    LODWORD(v40) = 1028443341;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v10->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("embeddingDistWeight_timeContextFromPhotoTrait"), v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v41, CFSTR("embeddingDistWeight_timeContextFromPhotoTrait"));

    LODWORD(v42) = 1050253722;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v10->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("embeddingDistWeight_placeName"), v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v43, CFSTR("embeddingDistWeight_placeName"));

    LODWORD(v44) = 1053609165;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v10->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("embeddingDistWeight_placeType"), v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v45, CFSTR("embeddingDistWeight_placeType"));

    LODWORD(v46) = 1045220557;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v10->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("embeddingDistWeight_geoProximity"), v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v47, CFSTR("embeddingDistWeight_geoProximity"));

    LODWORD(v48) = 1036831949;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v10->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("embeddingDistWeight_placeTypeFromPhotoTraits"), v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v49, CFSTR("embeddingDistWeight_placeTypeFromPhotoTraits"));

    LODWORD(v50) = 1036831949;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v10->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("embeddingDistWeight_contactNames"), v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v51, CFSTR("embeddingDistWeight_contactNames"));

    LODWORD(v52) = 0.25;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v10->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("embeddingDistWeight_IsWithContact"), v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v53, CFSTR("embeddingDistWeight_IsWithContact"));

    LODWORD(v54) = 1041865114;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v10->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("embeddingDistWeight_isWithFamily"), v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v55, CFSTR("embeddingDistWeight_isWithFamily"));

    LODWORD(v56) = 1028443341;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v10->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("embeddingDistWeight_isWithCoworker"), v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v57, CFSTR("embeddingDistWeight_isWithCoworker"));

    LODWORD(v58) = 1041865114;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v10->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("embeddingDistWeight_isWithFriend"), v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v59, CFSTR("embeddingDistWeight_isWithFriend"));

    LODWORD(v60) = 1036831949;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v10->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("embeddingDistWeight_isWithChild"), v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v61, CFSTR("embeddingDistWeight_isWithChild"));

    LODWORD(v62) = 1041865114;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v10->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("embeddingDistWeight_isWithMyPet"), v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v63, CFSTR("embeddingDistWeight_isWithMyPet"));

    LODWORD(v64) = 1028443341;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v10->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("embeddingDistWeight_SocialEventFromPhotoTraits "), v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v65, CFSTR("embeddingDistWeight_SocialEventFromPhotoTraits "));

    v66 = -[MOClusteringParams initWithembeddingDistanceWeights:minPoints:minClusterSize:]([MOClusteringParams alloc], "initWithembeddingDistanceWeights:minPoints:minClusterSize:", v15, -[MOConfigurationManagerBase getIntegerSettingForKey:withFallback:](v10->_configurationManager, "getIntegerSettingForKey:withFallback:", CFSTR("MOClusteringParams_minPoints"), 3), -[MOConfigurationManagerBase getIntegerSettingForKey:withFallback:](v10->_configurationManager, "getIntegerSettingForKey:withFallback:", CFSTR("MOClusteringParams_minClusterSize"), 3));
    clusteringParams = v10->_clusteringParams;
    v10->_clusteringParams = v66;

    v68 = -[MOHDBSCANClustering initWithParameters:]([MOHDBSCANClustering alloc], "initWithParameters:", v10->_clusteringParams);
    hdbscanClustering = v10->_hdbscanClustering;
    v10->_hdbscanClustering = v68;

    LODWORD(v70) = 0.5;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v10->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("MOClusteringParams_clusterPhenotypeContextRatioThreshold"), v70);
    v72 = v71;
    v10->_clusterPhenotypeMinimumRatioThreshold = v72;
    LODWORD(v72) = 0.75;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v10->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("MOClusteringParams_phenotypeArbirationCountThreshold"), v72);
    v74 = v73;
    v10->_clusterPhenotypeArbirationThreshold = v74;
    LODWORD(v74) = 3.0;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v10->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("MOClusteringParams_clusterPhenotypeContextCountThreshold"), v74);
    v10->_clusterPhenotypeMinimumCountThreshold = (unint64_t)v75;
    LODWORD(v76) = 1028443341;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v10->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("avgGoodnessScoreFilteringThreshold"), v76);
    v10->_avgGoodnessScoreFilteringThreshold = v77;
    v10->_phenotypeSpecificityThreshold = -[MOConfigurationManagerBase getIntegerSettingForKey:withFallback:](v10->_configurationManager, "getIntegerSettingForKey:withFallback:", CFSTR("phenoTypeCategoryCountFilteringThreshold"), 3);
    LODWORD(v78) = 1034147594;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v10->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("goodnessScoreAnomalySignificanceThreshold"), v78);
    v10->_goodnessScoreAnomalySignificanceThreshold = v79;
    LODWORD(v80) = 1051260355;
    -[MOConfigurationManagerBase getFloatSettingForKey:withFallback:](v10->_configurationManager, "getFloatSettingForKey:withFallback:", CFSTR("outlierScoreAnomalySignificanceThreshold"), v80);
    v10->_outlierScoreAnomalySignificanceThreshold = v81;

  }
  return v10;
}

- (id)getEmbeddingsFromBundles:(id)a3 forEmbeddingType:(unint64_t)a4
{
  id v5;
  NSMutableArray *v6;
  _QWORD v8[4];
  NSMutableArray *v9;
  unint64_t v10;

  v5 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __71__MOBundleClusteringManager_getEmbeddingsFromBundles_forEmbeddingType___block_invoke;
  v8[3] = &unk_1002B1238;
  v10 = a4;
  v6 = objc_opt_new(NSMutableArray);
  v9 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

void __71__MOBundleClusteringManager_getEmbeddingsFromBundles_forEmbeddingType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  MOEmbedding *v4;
  id os_log;
  NSObject *v6;
  id v7;
  NSObject *v8;

  v3 = a2;
  v4 = -[MOEmbedding initWithEventBundle:forEmbeddingType:]([MOEmbedding alloc], "initWithEventBundle:forEmbeddingType:", v3, *(_QWORD *)(a1 + 40));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
  v6 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __71__MOBundleClusteringManager_getEmbeddingsFromBundles_forEmbeddingType___block_invoke_cold_2(v4, v6);

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  }
  else
  {
    v7 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __71__MOBundleClusteringManager_getEmbeddingsFromBundles_forEmbeddingType___block_invoke_cold_1(v3, v8);

  }
}

- (void)runHDBSCANClusteringOn:(id)a3
{
  id v4;
  id v5;
  MOClusteringParams **p_clusteringParams;
  id os_log;
  NSObject *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  p_clusteringParams = &self->_clusteringParams;
  if (v5 <= (id)-[MOClusteringParams minClusterSize](self->_clusteringParams, "minClusterSize"))
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
    v8 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[MOBundleClusteringManager runHDBSCANClusteringOn:].cold.1(v4, (id *)p_clusteringParams, v8);

  }
  else
  {
    -[MOHDBSCANClustering runHDBSCANClusteringOn:](self->_hdbscanClustering, "runHDBSCANClusteringOn:", v4);
  }

}

- (BOOL)isClusteringResultValid
{
  void *v2;
  void *v3;
  BOOL v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MOHDBSCANClustering getClusterLabels](self->_hdbscanClustering, "getClusterLabels"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSCountedSet setWithArray:](NSCountedSet, "setWithArray:", v2));
  v4 = (unint64_t)objc_msgSend(v3, "count") > 1;

  return v4;
}

- (void)generateClusterBundles:(id)a3 withEmbeddings:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, NSArray *, id);
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSMutableSet *v21;
  NSMutableSet *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id os_log;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  NSArray *p_super;
  id v33;
  id v34;
  NSObject *v35;
  _BOOL4 v36;
  NSMutableArray *v37;
  id v38;
  id v39;
  const __CFString **v40;
  NSErrorUserInfoKey *v41;
  void *v42;
  void (**v43)(id, NSArray *, id);
  id v44;
  id v45;
  void *v46;
  unsigned int v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  NSMutableArray *v52;
  uint64_t v53;
  id v54;
  void *v55;
  void *v56;
  MOBundleClusteringManager *v57;
  id v58;
  void *v59;
  _QWORD v60[4];
  NSMutableSet *v61;
  _QWORD v62[5];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t buf[4];
  id v68;
  __int16 v69;
  id v70;
  __int16 v71;
  unsigned int v72;
  __int16 v73;
  void *v74;
  __int16 v75;
  void *v76;
  __int16 v77;
  void *v78;
  _BYTE v79[128];
  NSErrorUserInfoKey v80;
  const __CFString *v81;
  NSErrorUserInfoKey v82;
  const __CFString *v83;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, NSArray *, id))a5;
  v57 = self;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOHDBSCANClustering getClusterLabels](self->_hdbscanClustering, "getClusterLabels"));
  if (!objc_msgSend(v11, "count"))
  {
    v39 = objc_alloc((Class)NSError);
    v82 = NSLocalizedDescriptionKey;
    v83 = CFSTR("Cluster labels were not generated. Unable to create cluster bundles");
    v40 = &v83;
    v41 = &v82;
LABEL_25:
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, v41, 1));
    v14 = objc_msgSend(v39, "initWithDomain:code:userInfo:", CFSTR("MOBundleClusteringManager"), 0, v42);

    p_super = objc_opt_new(NSArray);
    v10[2](v10, p_super, v14);
    goto LABEL_31;
  }
  v12 = objc_msgSend(v11, "count");
  if (v12 != objc_msgSend(v9, "count"))
  {
    v39 = objc_alloc((Class)NSError);
    v80 = NSLocalizedDescriptionKey;
    v81 = CFSTR("Label count and embedding count do not match. Unable to create cluster bundles");
    v40 = &v81;
    v41 = &v80;
    goto LABEL_25;
  }
  v43 = v10;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCountedSet setWithArray:](NSCountedSet, "setWithArray:", v11));
  v52 = objc_opt_new(NSMutableArray);
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v64;
    v44 = v9;
    v45 = v8;
    v54 = v14;
    v55 = v11;
    v53 = *(_QWORD *)v64;
    do
    {
      v18 = 0;
      v58 = v16;
      do
      {
        if (*(_QWORD *)v64 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)v18);
        if ((objc_msgSend(v19, "isEqualToNumber:", &off_1002D8F18) & 1) == 0)
        {
          v62[0] = _NSConcreteStackBlock;
          v62[1] = 3221225472;
          v62[2] = __75__MOBundleClusteringManager_generateClusterBundles_withEmbeddings_handler___block_invoke;
          v62[3] = &unk_1002B1260;
          v62[4] = v19;
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "indexesOfObjectsPassingTest:", v62));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectsAtIndexes:"));
          v21 = objc_opt_new(NSMutableSet);
          v60[0] = _NSConcreteStackBlock;
          v60[1] = 3221225472;
          v60[2] = __75__MOBundleClusteringManager_generateClusterBundles_withEmbeddings_handler___block_invoke_2;
          v60[3] = &unk_1002B1288;
          v22 = v21;
          v61 = v22;
          objc_msgSend(v20, "enumerateObjectsUsingBlock:", v60);
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v22, "allObjects"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("bundleIdentifier in %@"), v23));

          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "filteredArrayUsingPredicate:", v24));
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[MOBundleClusteringManager _getClusterBundleFrom:withEmbeddings:andCreationDate:](v57, "_getClusterBundleFrom:withEmbeddings:andCreationDate:", v25, v20, v56));
          os_log = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
          v28 = objc_claimAutoreleasedReturnValue(os_log);
          v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
          if (v26)
          {
            if (v29)
            {
              v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "subBundleIDs"));
              v48 = objc_msgSend(v51, "count");
              v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "clusterMetadata"));
              v47 = objc_msgSend(v50, "isFiltered");
              v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "clusterMetadata"));
              v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "phenotype"));
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "startDate"));
              v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "endDate"));
              *(_DWORD *)buf = 138413570;
              v68 = v19;
              v69 = 2048;
              v70 = v48;
              v71 = 1024;
              v72 = v47;
              v73 = 2112;
              v74 = v46;
              v75 = 2112;
              v76 = v30;
              v77 = 2112;
              v78 = v31;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Created a cluster bundle: LabelNo=%@,bundleCount=%lu,isFiltered=%d,phenotype=%@, dateRange=%@-%@", buf, 0x3Au);

              v8 = v45;
              v9 = v44;

            }
            -[NSMutableArray addObject:](v52, "addObject:", v26);
          }
          else
          {
            if (v29)
            {
              *(_DWORD *)buf = 138412290;
              v68 = v19;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Cluster bundle for label %@ is nil. skip and proceed to the next clustering label", buf, 0xCu);
            }

          }
          v14 = v54;
          v11 = v55;
          v16 = v58;
          v17 = v53;
        }
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v63, v79, 16);
    }
    while (v16);
  }

  v10 = v43;
  p_super = &v52->super;
  if (v43)
  {
    v33 = -[NSMutableArray count](v52, "count");
    v34 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    v36 = os_log_type_enabled(v35, OS_LOG_TYPE_INFO);
    if (v33)
    {
      v37 = v52;
      if (v36)
      {
        v38 = -[NSMutableArray count](v52, "count");
        *(_DWORD *)buf = 134217984;
        v68 = v38;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Cluster bundle generation completed. cluster bundle count=%lu", buf, 0xCu);
        v37 = v52;
      }
    }
    else
    {
      if (v36)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "No cluster bundle is available", buf, 2u);
      }
      v37 = 0;
    }

    v43[2](v43, &v37->super, 0);
  }

LABEL_31:
}

id __75__MOBundleClusteringManager_generateClusterBundles_withEmbeddings_handler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToNumber:", *(_QWORD *)(a1 + 32));
}

void __75__MOBundleClusteringManager_generateClusterBundles_withEmbeddings_handler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (void)annotateAnomalyBundles:(id)a3 withEmbeddings:(id)a4 handler:(id)a5
{
  void (**v8)(id, id, _QWORD);
  MOHDBSCANClustering *hdbscanClustering;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  void *v15;
  NSMutableSet *v16;
  void *v17;
  void *v18;
  void *v19;
  NSMutableArray *v20;
  id v21;
  id v22;
  id os_log;
  NSObject *v24;
  _BOOL4 v25;
  id v26;
  const char *v27;
  NSObject *v28;
  uint32_t v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  MOBundleClusteringManager *v33;
  NSMutableArray *v34;
  _QWORD v35[4];
  NSMutableSet *v36;
  uint8_t buf[4];
  id v38;

  v8 = (void (**)(id, id, _QWORD))a5;
  hdbscanClustering = self->_hdbscanClustering;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOHDBSCANClustering getClusterLabels](hdbscanClustering, "getClusterLabels"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOHDBSCANClustering getOutlierScoreDict](self->_hdbscanClustering, "getOutlierScoreDict"));
  v14 = objc_opt_new(NSMutableArray);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "indexesOfObjectsPassingTest:", &__block_literal_global_18));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectsAtIndexes:"));

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = __75__MOBundleClusteringManager_annotateAnomalyBundles_withEmbeddings_handler___block_invoke_2;
  v35[3] = &unk_1002B1288;
  v16 = objc_opt_new(NSMutableSet);
  v36 = v16;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v35);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v16, "allObjects"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("bundleIdentifier in %@"), v17));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "filteredArrayUsingPredicate:", v18));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = __75__MOBundleClusteringManager_annotateAnomalyBundles_withEmbeddings_handler___block_invoke_3;
  v31[3] = &unk_1002B12F0;
  v32 = v13;
  v33 = self;
  v20 = v14;
  v34 = v20;
  v21 = v13;
  objc_msgSend(v19, "enumerateObjectsUsingBlock:", v31);
  if (v8)
  {
    v22 = -[NSMutableArray count](v20, "count");
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
    v24 = objc_claimAutoreleasedReturnValue(os_log);
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_INFO);
    if (v22)
    {
      if (v25)
      {
        v26 = -[NSMutableArray count](v20, "count");
        *(_DWORD *)buf = 134217984;
        v38 = v26;
        v27 = "Anomaly bundle annotation completed. Annotated anomaly bundle count=%lu";
        v28 = v24;
        v29 = 12;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, v27, buf, v29);
      }
    }
    else if (v25)
    {
      *(_WORD *)buf = 0;
      v27 = "No bundle was annotated with anomaly metadata.";
      v28 = v24;
      v29 = 2;
      goto LABEL_7;
    }

    v8[2](v8, v20, 0);
  }

}

BOOL __75__MOBundleClusteringManager_annotateAnomalyBundles_withEmbeddings_handler___block_invoke(id a1, NSNumber *a2, unint64_t a3, BOOL *a4)
{
  return -[NSNumber isEqualToNumber:](a2, "isEqualToNumber:", &off_1002D8F18, a4);
}

void __75__MOBundleClusteringManager_annotateAnomalyBundles_withEmbeddings_handler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
    objc_msgSend(v4, "addObject:", v5);

  }
}

void __75__MOBundleClusteringManager_annotateAnomalyBundles_withEmbeddings_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  double v14;
  uint64_t v15;
  float v16;
  _BOOL4 v17;
  _BOOL8 v18;
  id os_log;
  NSObject *v20;
  MOOutlierMetadata *v21;
  void *v22;
  void *v23;
  MOOutlierMetadata *v24;
  id v25;
  NSObject *v26;
  void *v27;
  int v28;
  void *v29;
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v6));
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rankingDictionary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("bundleGoodnessScore")));
  objc_msgSend(v11, "floatValue");
  v13 = v12;
  v14 = v12;

  v15 = *(_QWORD *)(a1 + 40);
  v16 = *(float *)(v15 + 16);
  v17 = v13 > *(float *)(v15 + 12);
  v18 = v9 > v16 && v17;
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
  v20 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
    v28 = 138413058;
    v29 = v27;
    v30 = 1024;
    v31 = v18;
    v32 = 2048;
    v33 = v14;
    v34 = 2048;
    v35 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Anomaly bundle %@ significance: isSignificant %d, bundleGoodnessScore %.3f, outlierScore %.3f", (uint8_t *)&v28, 0x26u);

  }
  v21 = [MOOutlierMetadata alloc];
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v24 = -[MOOutlierMetadata initWithIdentifier:updateDate:isSignificant:outlierScore:outlierScoreThreshold:bundleGoodnessScore:bundleGoodnessScoreThreshold:](v21, "initWithIdentifier:updateDate:isSignificant:outlierScore:outlierScoreThreshold:bundleGoodnessScore:bundleGoodnessScoreThreshold:", v22, v23, v18, v9, *(float *)(*(_QWORD *)(a1 + 40) + 16), v14, *(float *)(*(_QWORD *)(a1 + 40) + 12));

  objc_msgSend(v3, "setOutlierMetadata:", v24);
  v25 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    __75__MOBundleClusteringManager_annotateAnomalyBundles_withEmbeddings_handler___block_invoke_3_cold_1(v3);

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
}

- (id)_getClusterBundleFrom:(id)a3 withEmbeddings:(id)a4 andCreationDate:(id)a5
{
  id v7;
  id v8;
  id v9;
  MOEventBundle *v10;
  void *v11;
  MOEventBundle *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSMutableDictionary *v22;
  NSMutableDictionary *v23;
  double v24;
  uint64_t v25;
  NSMutableDictionary *v26;
  uint64_t v27;
  void *v28;
  unsigned int v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  void *k;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  NSMutableDictionary *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  char *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  NSMutableDictionary *v58;
  id v59;
  id v60;
  uint64_t v61;
  void *m;
  void *v63;
  void *v64;
  id v65;
  id v66;
  NSObject *v67;
  id v68;
  NSObject *v69;
  NSString *v70;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  void *v75;
  id v76;
  NSObject *v77;
  id v78;
  double v79;
  NSMutableDictionary *v80;
  void *v81;
  double v82;
  void *v83;
  id os_log;
  NSObject *v85;
  id v86;
  NSObject *v87;
  NSMutableDictionary *v88;
  id v89;
  id v90;
  id v91;
  uint64_t v92;
  void *i;
  uint64_t v94;
  void *v95;
  id v96;
  unint64_t clusterPhenotypeMinimumCountThreshold;
  void *v98;
  void *v99;
  id v100;
  NSObject *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  double clusterPhenotypeArbirationThreshold;
  double v106;
  double v107;
  id v108;
  NSObject *v109;
  const __CFString *v110;
  id v111;
  id v112;
  id v113;
  uint64_t v114;
  void *j;
  uint64_t v116;
  void *v117;
  id v118;
  unint64_t v119;
  void *v120;
  void *v121;
  id v122;
  NSObject *v123;
  void *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  double v128;
  double v129;
  double v130;
  id v131;
  NSObject *v132;
  NSMutableDictionary *v133;
  const __CFString *v134;
  unint64_t v135;
  uint64_t v136;
  void *v137;
  void *v138;
  double v139;
  double v140;
  double v141;
  id v142;
  void *v143;
  double v144;
  void *v145;
  id v146;
  NSObject *v147;
  NSObject *v148;
  const char *v149;
  void *v150;
  uint64_t v151;
  void *v152;
  void *v153;
  double v154;
  double v155;
  double v156;
  id v157;
  NSObject *v158;
  void *v159;
  id v160;
  NSObject *v161;
  NSMutableDictionary *v162;
  id v163;
  id v164;
  uint64_t v165;
  void *n;
  void *v167;
  void *v168;
  unsigned int v169;
  void *v170;
  id v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  id v176;
  void *v177;
  void *v178;
  void *v179;
  id v180;
  NSObject *v181;
  id v182;
  unint64_t v183;
  BOOL v184;
  void *v185;
  id v186;
  void *v187;
  id v188;
  id v189;
  double v190;
  void *v191;
  void *v192;
  id v193;
  void *v194;
  void *v195;
  id v196;
  void *v197;
  id v198;
  void *v199;
  void *v200;
  const __CFString *v201;
  void *v202;
  double v203;
  double v204;
  NSObject *v205;
  const char *v206;
  double v207;
  double v208;
  void *v209;
  double v210;
  double v211;
  void *v212;
  double v213;
  double v214;
  id v215;
  id v216;
  NSObject *v217;
  NSMutableDictionary *v218;
  id v219;
  id v220;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  uint64_t v224;
  double v225;
  NSMutableDictionary *v226;
  id v227;
  NSObject *v228;
  void *v229;
  uint64_t v230;
  void *v231;
  void *v232;
  NSMutableDictionary *v233;
  void *v234;
  void *v235;
  id v236;
  NSObject *v237;
  NSMutableDictionary *v238;
  id v239;
  NSObject *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  void *v248;
  MOEventBundle *v249;
  id v250;
  NSObject *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  void *v259;
  void *v260;
  void *v261;
  NSMutableArray *v262;
  NSMutableArray *v263;
  NSMutableArray *v264;
  NSMutableArray *v265;
  id v266;
  id v267;
  uint64_t v268;
  void *ii;
  void *v270;
  void *v271;
  uint64_t v272;
  void *v273;
  NSMutableDictionary *v274;
  id v275;
  id v276;
  id v277;
  uint64_t v278;
  void *jj;
  double v280;
  void *v281;
  id v282;
  void *v283;
  double v284;
  id v285;
  NSObject *v286;
  id v287;
  NSObject *v288;
  void *v289;
  id v290;
  NSObject *v291;
  NSMutableDictionary *v292;
  NSMutableDictionary *v293;
  id v294;
  id v295;
  uint64_t v296;
  void *kk;
  uint64_t v298;
  void *v299;
  id v300;
  void *v301;
  void *v302;
  void *v303;
  id v304;
  NSObject *v305;
  void *v306;
  NSMutableSet *v307;
  _BOOL4 v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  NSString *v313;
  void *v314;
  void *v315;
  uint64_t v316;
  uint64_t v317;
  NSMutableDictionary *v318;
  void *v319;
  uint64_t v320;
  MOAction *v321;
  void *v322;
  void *v323;
  unsigned int v324;
  void *v325;
  uint64_t v326;
  void *v327;
  void *v328;
  MOTime *v329;
  void *v330;
  double v331;
  double v332;
  void *v333;
  void *v334;
  MOTime *v335;
  void *v336;
  MOPlace *v337;
  void *v338;
  MOPlace *v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  unsigned int v344;
  MOPlace *v345;
  uint64_t v346;
  void *v347;
  void *v348;
  unsigned __int8 v349;
  void *v350;
  unsigned int v351;
  void *v352;
  unsigned int v353;
  void *v354;
  void *v355;
  void *v356;
  unsigned int v357;
  void *v358;
  unsigned __int8 v359;
  void *v360;
  unsigned int v361;
  NSMutableSet *v362;
  void *v363;
  void *v364;
  NSMutableArray *v365;
  id v366;
  id v367;
  id v368;
  uint64_t v369;
  void *mm;
  uint64_t v371;
  void *v372;
  MOPhotoTrait *v373;
  void *v374;
  MOPhotoTrait *v375;
  id v376;
  unint64_t phenotypeSpecificityThreshold;
  void *v378;
  _BOOL4 v379;
  void *v380;
  NSMutableArray *v381;
  void *v382;
  float v383;
  float v384;
  double v385;
  void *v386;
  void *v387;
  id v388;
  NSObject *v389;
  _BOOL4 v390;
  uint64_t v391;
  MOClusterMetadata *v392;
  void *v393;
  MOClusterMetadata *v394;
  void *v395;
  void *v396;
  void *v397;
  void *v398;
  void *v399;
  void *v400;
  void *v401;
  void *v402;
  void *v403;
  void *v404;
  void *v405;
  void *v406;
  void *v407;
  void *v408;
  void *v409;
  void *v410;
  void *v411;
  void *v412;
  void *v413;
  void *v414;
  void *v415;
  void *v416;
  void *v417;
  void *v418;
  void *v419;
  void *v420;
  void *v422;
  unsigned __int8 v423;
  void *v424;
  void *v425;
  unsigned __int8 v426;
  void *v427;
  unsigned __int8 v428;
  void *v429;
  unsigned __int8 v430;
  void *v431;
  unsigned int v432;
  id v433;
  void *v434;
  void *v435;
  void *v436;
  MOEventBundle *v437;
  id obj;
  NSMutableDictionary *v439;
  uint64_t v440;
  NSMutableArray *v441;
  NSMutableDictionary *v442;
  id v443;
  void *v444;
  uint64_t v445;
  NSMutableArray *v446;
  NSMutableDictionary *v447;
  NSMutableDictionary *v448;
  NSMutableDictionary *v449;
  NSMutableDictionary *v450;
  id v451;
  NSObject *p_super;
  NSMutableDictionary *v453;
  NSMutableSet *v454;
  NSMutableDictionary *v455;
  uint64_t v456;
  NSMutableDictionary *v457;
  NSMutableArray *v458;
  NSMutableSet *v459;
  id v460;
  id v461;
  id v462;
  id v463;
  NSMutableDictionary *v464;
  double v465;
  void *v467;
  uint64_t v468;
  NSMutableArray *v469;
  char *v470;
  id v471;
  NSMutableSet *v472;
  void *v473;
  NSString *v474;
  void *v475;
  NSMutableDictionary *v476;
  NSMutableSet *v477;
  double v478;
  NSMutableSet *v479;
  _QWORD v480[4];
  NSMutableArray *v481;
  __int128 v482;
  __int128 v483;
  __int128 v484;
  __int128 v485;
  _QWORD v486[4];
  NSMutableSet *v487;
  __int128 v488;
  __int128 v489;
  __int128 v490;
  __int128 v491;
  __int128 v492;
  __int128 v493;
  __int128 v494;
  __int128 v495;
  __int128 v496;
  __int128 v497;
  __int128 v498;
  __int128 v499;
  __int128 v500;
  __int128 v501;
  __int128 v502;
  __int128 v503;
  _QWORD v504[4];
  NSMutableArray *v505;
  NSMutableArray *v506;
  __int128 v507;
  __int128 v508;
  __int128 v509;
  __int128 v510;
  __int128 v511;
  __int128 v512;
  __int128 v513;
  __int128 v514;
  __int128 v515;
  __int128 v516;
  __int128 v517;
  __int128 v518;
  __int128 v519;
  __int128 v520;
  __int128 v521;
  __int128 v522;
  _QWORD v523[6];
  NSMutableDictionary *v524;
  __int128 v525;
  __int128 v526;
  __int128 v527;
  __int128 v528;
  __int128 v529;
  __int128 v530;
  __int128 v531;
  __int128 v532;
  __int128 v533;
  __int128 v534;
  __int128 v535;
  __int128 v536;
  __int128 v537;
  __int128 v538;
  __int128 v539;
  __int128 v540;
  _QWORD v541[4];
  NSMutableArray *v542;
  const __CFString *v543;
  void *v544;
  _BYTE v545[128];
  _BYTE v546[128];
  _BYTE v547[128];
  _BYTE v548[128];
  _BYTE v549[128];
  _BYTE v550[128];
  _BYTE v551[128];
  _BYTE v552[128];
  _BYTE v553[128];
  char v554[16];
  char v555[16];
  uint8_t buf[4];
  double v557;
  __int16 v558;
  double v559;
  __int16 v560;
  void *v561;
  _BYTE v562[128];
  void *v563;
  void *v564;
  _BYTE v565[128];
  _BYTE v566[128];
  _BYTE v567[128];
  _QWORD v568[5];
  _QWORD v569[5];
  _QWORD v570[9];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = [MOEventBundle alloc];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v433 = v9;
  v12 = -[MOEventBundle initWithBundleIdentifier:creationDate:](v10, "initWithBundleIdentifier:creationDate:", v11, v9);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle bundleIdentifier](v12, "bundleIdentifier"));
  -[MOEventBundle setSuggestionID:](v12, "setSuggestionID:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle creationDate](v12, "creationDate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dateByAddingTimeInterval:", 2419200.0));
  -[MOEventBundle setExpirationDate:](v12, "setExpirationDate:", v15);

  -[MOEventBundle setInterfaceType:](v12, "setInterfaceType:", 15);
  -[MOEventBundle setBundleSuperType:](v12, "setBundleSuperType:", 9);
  v437 = v12;
  -[MOEventBundle setBundleSubType:](v12, "setBundleSubType:", 910);
  v436 = v7;
  v16 = objc_msgSend(v7, "count");
  v541[0] = _NSConcreteStackBlock;
  v541[1] = 3221225472;
  v541[2] = __82__MOBundleClusteringManager__getClusterBundleFrom_withEmbeddings_andCreationDate___block_invoke;
  v541[3] = &unk_1002B1288;
  v441 = objc_opt_new(NSMutableArray);
  v542 = v441;
  v434 = v8;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v541);
  v570[0] = CFSTR("topLevelActivityType");
  v570[1] = CFSTR("secondLevelActivityType");
  v570[2] = CFSTR("isWeekend");
  v570[3] = CFSTR("timeTag");
  v570[4] = CFSTR("dayOfWeek");
  v570[5] = CFSTR("placeName");
  v570[6] = CFSTR("combinedPlaceType");
  v570[7] = CFSTR("enclosingAreaName");
  v570[8] = CFSTR("persons");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v570, 9));
  v569[0] = CFSTR("withFamily");
  v569[1] = CFSTR("withCoworker");
  v569[2] = CFSTR("withFriend");
  v569[3] = CFSTR("withChild");
  v569[4] = CFSTR("withMyPet");
  v18 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v569, 5));
  v568[0] = CFSTR("activityTypeFromPhotoTraits");
  v568[1] = CFSTR("timeContextFromPhotoTraits");
  v568[2] = CFSTR("placeTypeFromPhotoTraits");
  v568[3] = CFSTR("socialEventFromPhotoTraits");
  v568[4] = CFSTR("otherSubjectFromPhotoTraits");
  v19 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v568, 5));
  v444 = (void *)v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v18));

  v435 = (void *)v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "arrayByAddingObjectsFromArray:", v19));

  v442 = objc_opt_new(NSMutableDictionary);
  v22 = objc_opt_new(NSMutableDictionary);
  v439 = objc_opt_new(NSMutableDictionary);
  v455 = objc_opt_new(NSMutableDictionary);
  v454 = objc_opt_new(NSMutableSet);
  v537 = 0u;
  v538 = 0u;
  v539 = 0u;
  v540 = 0u;
  obj = v21;
  v457 = v22;
  v443 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v537, v567, 16);
  v23 = 0;
  if (v443)
  {
    v451 = v16;
    v440 = *(_QWORD *)v538;
    v24 = (double)(unint64_t)v16;
    do
    {
      v25 = 0;
      do
      {
        v26 = v23;
        if (*(_QWORD *)v538 != v440)
        {
          v27 = v25;
          objc_enumerationMutation(obj);
          v25 = v27;
        }
        v445 = v25;
        v28 = *(void **)(*((_QWORD *)&v537 + 1) + 8 * v25);
        v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("persons"));
        v23 = objc_opt_new(NSMutableDictionary);

        v447 = v23;
        v467 = v28;
        if (!v29)
        {
          v523[0] = _NSConcreteStackBlock;
          v523[1] = 3221225472;
          v523[2] = __82__MOBundleClusteringManager__getClusterBundleFrom_withEmbeddings_andCreationDate___block_invoke_99;
          v523[3] = &unk_1002B1318;
          v523[4] = self;
          v523[5] = v28;
          v80 = v23;
          v524 = v80;
          -[NSMutableArray enumerateObjectsUsingBlock:](v441, "enumerateObjectsUsingBlock:", v523);
          v81 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary keysSortedByValueUsingComparator:](v80, "keysSortedByValueUsingComparator:", &__block_literal_global_102));
          v82 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "firstObject")));
          v83 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v80, "objectForKeyedSubscript:", *(_QWORD *)&v82));
          v471 = objc_msgSend(v83, "count");

          os_log = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
          v85 = objc_claimAutoreleasedReturnValue(os_log);
          v475 = v81;
          if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
          {
            v189 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary description](v80, "description"));
            *(_DWORD *)buf = 138412802;
            v557 = *(double *)&v28;
            v558 = 2112;
            v559 = *(double *)&v189;
            v560 = 2112;
            v561 = v475;
            _os_log_debug_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEBUG, "Current featureKey:%@, subBundleIDsGroupedByFeatureValues:%@, sortedFeatureValuesByFrequency:%@", buf, 0x20u);

            v81 = v475;
          }

          v86 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
          v87 = objc_claimAutoreleasedReturnValue(v86);
          if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v557 = v82;
            v558 = 2048;
            v559 = *(double *)&v471;
            _os_log_debug_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEBUG, "mostFrequentFeatureValue:%@, count:%lu", buf, 0x16u);
          }

          if (objc_msgSend(v28, "isEqualToString:", CFSTR("topLevelActivityType")))
          {
            v478 = v82;
            *(double *)&v88 = COERCE_DOUBLE((uint64_t)objc_opt_new(NSMutableDictionary));
            v519 = 0u;
            v520 = 0u;
            v521 = 0u;
            v522 = 0u;
            v89 = v81;
            v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v519, v553, 16);
            if (v90)
            {
              v91 = v90;
              v92 = *(_QWORD *)v520;
              do
              {
                for (i = 0; i != v91; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v520 != v92)
                    objc_enumerationMutation(v89);
                  v94 = *(_QWORD *)(*((_QWORD *)&v519 + 1) + 8 * (_QWORD)i);
                  v95 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v80, "objectForKeyedSubscript:", v94));
                  v96 = objc_msgSend(v95, "count");
                  clusterPhenotypeMinimumCountThreshold = self->_clusterPhenotypeMinimumCountThreshold;

                  if ((unint64_t)v96 >= clusterPhenotypeMinimumCountThreshold)
                  {
                    v98 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v80, "objectForKeyedSubscript:", v94));
                    v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v98, "count")));
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v88, "setObject:forKeyedSubscript:", v99, v94);

                  }
                }
                v91 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v519, v553, 16);
              }
              while (v91);
            }

            v100 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
            v101 = objc_claimAutoreleasedReturnValue(v100);
            if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v557 = *(double *)&v88;
              _os_log_debug_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEBUG, "TopLevelActivityType phenotypeCandidatesWithValueCounts before filtering:%@", buf, 0xCu);
            }

            v23 = v447;
            v28 = v467;
            if ((unint64_t)-[NSMutableDictionary count](v88, "count") >= 2)
            {
              v102 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v88, "objectForKeyedSubscript:", CFSTR("outing")));
              if (v102)
              {
                v103 = (void *)v102;
                v104 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v88, "objectForKeyedSubscript:", CFSTR("outing")));
                objc_msgSend(v104, "doubleValue");
                clusterPhenotypeArbirationThreshold = self->_clusterPhenotypeArbirationThreshold;
                v107 = v106 / v24;

                if (v107 < clusterPhenotypeArbirationThreshold)
                {
                  v108 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
                  v109 = objc_claimAutoreleasedReturnValue(v108);
                  if (!os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
                  {
                    v110 = CFSTR("outing");
                    goto LABEL_107;
                  }
                  v201 = CFSTR("outing");
                  v202 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v88, "objectForKeyedSubscript:", CFSTR("outing")));
                  objc_msgSend(v202, "doubleValue");
                  v203 = self->_clusterPhenotypeArbirationThreshold;
                  *(_DWORD *)buf = 134218240;
                  v557 = v204 / v24;
                  v558 = 2048;
                  v559 = v203;
                  v205 = v109;
                  v206 = "Pruning outing from top level activity phenotype candidate since its proportion (%.3f) is lower"
                         " than threshold %.3f";
LABEL_179:
                  _os_log_debug_impl((void *)&_mh_execute_header, v205, OS_LOG_TYPE_DEBUG, v206, buf, 0x16u);

                  v110 = v201;
                  goto LABEL_107;
                }
              }
              v136 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v88, "objectForKeyedSubscript:", CFSTR("time_at_home")));
              if (v136)
              {
                v137 = (void *)v136;
                v138 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v88, "objectForKeyedSubscript:", CFSTR("time_at_home")));
                objc_msgSend(v138, "doubleValue");
                v139 = self->_clusterPhenotypeArbirationThreshold;
                v141 = v140 / v24;

                if (v141 < v139)
                {
                  v142 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
                  v109 = objc_claimAutoreleasedReturnValue(v142);
                  if (os_log_type_enabled(v109, OS_LOG_TYPE_DEBUG))
                  {
                    v201 = CFSTR("time_at_home");
                    v202 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v88, "objectForKeyedSubscript:", CFSTR("time_at_home")));
                    objc_msgSend(v202, "doubleValue");
                    v207 = self->_clusterPhenotypeArbirationThreshold;
                    *(_DWORD *)buf = 134218240;
                    v557 = v208 / v24;
                    v558 = 2048;
                    v559 = v207;
                    v205 = v109;
                    v206 = "Pruning timeAthome from top level activity phenotype candidate since its proportion (%.3f) is"
                           " less than threshold %.3f";
                    goto LABEL_179;
                  }
                  v110 = CFSTR("time_at_home");
LABEL_107:

                  -[NSMutableDictionary removeObjectForKey:](v88, "removeObjectForKey:", v110);
                }
              }
            }
            if (-[NSMutableDictionary count](v88, "count"))
            {
              v143 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary keysSortedByValueUsingComparator:](v88, "keysSortedByValueUsingComparator:", &__block_literal_global_109_0));
              v144 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "firstObject")));

              v145 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v88, "objectForKeyedSubscript:", *(_QWORD *)&v144));
              LODWORD(v135) = objc_msgSend(v145, "intValue");

              v146 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
              v147 = objc_claimAutoreleasedReturnValue(v146);
              v22 = v457;
              if (os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v557 = v144;
                v148 = v147;
                v149 = "TopLevelActivityType selected phenotype:%@";
                goto LABEL_174;
              }
              goto LABEL_123;
            }
            v135 = (unint64_t)v471;
            v22 = v457;
LABEL_124:

            v81 = v475;
            v82 = v478;
LABEL_125:
            v161 = objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
            if ((objc_msgSend(*(id *)&v82, "isEqual:", v161) & 1) != 0
              || (objc_msgSend(*(id *)&v82, "isEqualToString:", CFSTR("unavailable")) & 1) != 0)
            {
LABEL_127:

LABEL_128:
              goto LABEL_129;
            }
            v183 = self->_clusterPhenotypeMinimumCountThreshold;

            v184 = v135 >= v183;
            v81 = v475;
            if (!v184)
              goto LABEL_128;
            if (objc_msgSend(v444, "containsObject:", v28))
            {
              if (!objc_msgSend(*(id *)&v82, "BOOLValue"))
                goto LABEL_128;
              -[NSMutableDictionary setObject:forKeyedSubscript:](v439, "setObject:forKeyedSubscript:", *(_QWORD *)&v82, v28);
              v185 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v80, "objectForKeyedSubscript:", *(_QWORD *)&v82));
              -[NSMutableDictionary setObject:forKeyedSubscript:](v455, "setObject:forKeyedSubscript:", v185, v28);

              v186 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
              v161 = objc_claimAutoreleasedReturnValue(v186);
              if (!os_log_type_enabled(v161, OS_LOG_TYPE_DEBUG))
                goto LABEL_127;
            }
            else if (objc_msgSend(v28, "isEqualToString:", CFSTR("combinedPlaceType")))
            {
              if ((objc_msgSend(*(id *)&v82, "isEqualToString:", CFSTR("RTMapItemPOICategoryUndefined")) & 1) != 0)
                goto LABEL_128;
              -[NSMutableDictionary setObject:forKeyedSubscript:](v439, "setObject:forKeyedSubscript:", *(_QWORD *)&v82, v28);
              v187 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v80, "objectForKeyedSubscript:", *(_QWORD *)&v82));
              -[NSMutableDictionary setObject:forKeyedSubscript:](v455, "setObject:forKeyedSubscript:", v187, v28);

              v188 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
              v161 = objc_claimAutoreleasedReturnValue(v188);
              if (!os_log_type_enabled(v161, OS_LOG_TYPE_DEBUG))
                goto LABEL_127;
            }
            else
            {
              v190 = (double)(unint64_t)v471 / v24;
              if (objc_msgSend(v28, "isEqualToString:", CFSTR("dayOfWeek")))
              {
                if (v190 <= self->_clusterPhenotypeMinimumRatioThreshold)
                {
                  v191 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("isWeekend")));

                  if (v191)
                    goto LABEL_128;
                }
                -[NSMutableDictionary setObject:forKeyedSubscript:](v439, "setObject:forKeyedSubscript:", *(_QWORD *)&v82, v28);
                v192 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v80, "objectForKeyedSubscript:", *(_QWORD *)&v82));
                -[NSMutableDictionary setObject:forKeyedSubscript:](v455, "setObject:forKeyedSubscript:", v192, v28);

                v193 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
                v161 = objc_claimAutoreleasedReturnValue(v193);
                if (!os_log_type_enabled(v161, OS_LOG_TYPE_DEBUG))
                  goto LABEL_127;
              }
              else if (objc_msgSend(v28, "isEqualToString:", CFSTR("secondLevelActivityType")))
              {
                if (v190 <= self->_clusterPhenotypeMinimumRatioThreshold)
                {
                  v194 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("topLevelActivityType")));

                  if (v194)
                    goto LABEL_128;
                }
                -[NSMutableDictionary setObject:forKeyedSubscript:](v439, "setObject:forKeyedSubscript:", *(_QWORD *)&v82, v28);
                v195 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v80, "objectForKeyedSubscript:", *(_QWORD *)&v82));
                -[NSMutableDictionary setObject:forKeyedSubscript:](v455, "setObject:forKeyedSubscript:", v195, v28);

                v196 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
                v161 = objc_claimAutoreleasedReturnValue(v196);
                if (!os_log_type_enabled(v161, OS_LOG_TYPE_DEBUG))
                  goto LABEL_127;
              }
              else
              {
                -[NSMutableDictionary setObject:forKeyedSubscript:](v439, "setObject:forKeyedSubscript:", *(_QWORD *)&v82, v28);
                v197 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v80, "objectForKeyedSubscript:", *(_QWORD *)&v82));
                -[NSMutableDictionary setObject:forKeyedSubscript:](v455, "setObject:forKeyedSubscript:", v197, v28);

                v198 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
                v161 = objc_claimAutoreleasedReturnValue(v198);
                if (!os_log_type_enabled(v161, OS_LOG_TYPE_DEBUG))
                  goto LABEL_127;
              }
            }
            v199 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", v28));
            v200 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v455, "objectForKeyedSubscript:", v28));
            *(_DWORD *)buf = 138412802;
            v557 = *(double *)&v28;
            v558 = 2112;
            v559 = *(double *)&v199;
            v560 = 2112;
            v561 = v200;
            _os_log_debug_impl((void *)&_mh_execute_header, v161, OS_LOG_TYPE_DEBUG, " %@ Phenotype was found: %@. subbundles:%@", buf, 0x20u);

            v81 = v475;
            goto LABEL_127;
          }
          if (!objc_msgSend(v28, "isEqualToString:", CFSTR("secondLevelActivityType")))
          {
            v135 = (unint64_t)v471;
            goto LABEL_125;
          }
          v478 = v82;
          *(double *)&v88 = COERCE_DOUBLE((uint64_t)objc_opt_new(NSMutableDictionary));
          v515 = 0u;
          v516 = 0u;
          v517 = 0u;
          v518 = 0u;
          v111 = v81;
          v112 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v515, v552, 16);
          if (v112)
          {
            v113 = v112;
            v114 = *(_QWORD *)v516;
            do
            {
              for (j = 0; j != v113; j = (char *)j + 1)
              {
                if (*(_QWORD *)v516 != v114)
                  objc_enumerationMutation(v111);
                v116 = *(_QWORD *)(*((_QWORD *)&v515 + 1) + 8 * (_QWORD)j);
                v117 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v80, "objectForKeyedSubscript:", v116));
                v118 = objc_msgSend(v117, "count");
                v119 = self->_clusterPhenotypeMinimumCountThreshold;

                if ((unint64_t)v118 >= v119)
                {
                  v120 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v80, "objectForKeyedSubscript:", v116));
                  v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v120, "count")));
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v88, "setObject:forKeyedSubscript:", v121, v116);

                }
              }
              v113 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v515, v552, 16);
            }
            while (v113);
          }

          v122 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
          v123 = objc_claimAutoreleasedReturnValue(v122);
          if (os_log_type_enabled(v123, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v557 = *(double *)&v88;
            _os_log_debug_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_DEBUG, "SecondLevelActivityType phenotypeCandidatesWithValueCounts before filtering:%@", buf, 0xCu);
          }

          v23 = v447;
          if ((unint64_t)-[NSMutableDictionary count](v88, "count") >= 2)
          {
            v124 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("topLevelActivityType")));
            if ((objc_msgSend(v124, "isEqualToString:", CFSTR("outing")) & 1) != 0
              || (v125 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v88, "objectForKeyedSubscript:", CFSTR("visit")))) == 0)
            {

            }
            else
            {
              v126 = (void *)v125;
              v127 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v88, "objectForKeyedSubscript:", CFSTR("visit")));
              objc_msgSend(v127, "doubleValue");
              v128 = self->_clusterPhenotypeArbirationThreshold;
              v130 = v129 / v24;

              if (v130 < v128)
              {
                v131 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
                v132 = objc_claimAutoreleasedReturnValue(v131);
                if (os_log_type_enabled(v132, OS_LOG_TYPE_DEBUG))
                {
                  v209 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v88, "objectForKeyedSubscript:", CFSTR("visit")));
                  objc_msgSend(v209, "doubleValue");
                  v210 = self->_clusterPhenotypeArbirationThreshold;
                  *(_DWORD *)buf = 134218240;
                  v557 = v211 / v24;
                  v558 = 2048;
                  v559 = v210;
                  _os_log_debug_impl((void *)&_mh_execute_header, v132, OS_LOG_TYPE_DEBUG, "Pruning visit from top level activity phenotype candidate since its proportion (%.3f) is lower than threshold %.3f", buf, 0x16u);

                }
                v133 = v88;
                v134 = CFSTR("visit");
                goto LABEL_119;
              }
            }
            v150 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("topLevelActivityType")));
            if (objc_msgSend(v150, "isEqualToString:", CFSTR("time_at_home"))
              || (v151 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v88, "objectForKeyedSubscript:", CFSTR("Photos at Home")))) == 0)
            {

            }
            else
            {
              v152 = (void *)v151;
              v153 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v88, "objectForKeyedSubscript:", CFSTR("Photos at Home")));
              objc_msgSend(v153, "doubleValue");
              v154 = self->_clusterPhenotypeArbirationThreshold;
              v156 = v155 / v24;

              if (v156 < v154)
              {
                v157 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
                v158 = objc_claimAutoreleasedReturnValue(v157);
                if (os_log_type_enabled(v158, OS_LOG_TYPE_DEBUG))
                {
                  v212 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v88, "objectForKeyedSubscript:", CFSTR("Photos at Home")));
                  objc_msgSend(v212, "doubleValue");
                  v213 = self->_clusterPhenotypeArbirationThreshold;
                  *(_DWORD *)buf = 134218240;
                  v557 = v214 / v24;
                  v558 = 2048;
                  v559 = v213;
                  _os_log_debug_impl((void *)&_mh_execute_header, v158, OS_LOG_TYPE_DEBUG, "Pruning P@H from top level activity phenotype candidate since its proportion (%.3f) is lower than threshold %.3f", buf, 0x16u);

                }
                v133 = v88;
                v134 = CFSTR("Photos at Home");
LABEL_119:
                -[NSMutableDictionary removeObjectForKey:](v133, "removeObjectForKey:", v134);
              }
            }
          }
          v22 = v457;
          if (-[NSMutableDictionary count](v88, "count"))
          {
            v143 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary keysSortedByValueUsingComparator:](v88, "keysSortedByValueUsingComparator:", &__block_literal_global_115));
            v144 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "firstObject")));

            v159 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v88, "objectForKeyedSubscript:", *(_QWORD *)&v144));
            LODWORD(v135) = objc_msgSend(v159, "intValue");

            v160 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
            v147 = objc_claimAutoreleasedReturnValue(v160);
            if (os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v557 = v144;
              v148 = v147;
              v149 = "SecondLevelActivityType selected phenotype:%@";
LABEL_174:
              _os_log_debug_impl((void *)&_mh_execute_header, v148, OS_LOG_TYPE_DEBUG, v149, buf, 0xCu);
            }
LABEL_123:
            v28 = v467;
            v135 = (int)v135;

            v478 = v144;
            v23 = v447;
          }
          else
          {
            v28 = v467;
            v135 = (unint64_t)v471;
          }
          goto LABEL_124;
        }
        v477 = objc_opt_new(NSMutableSet);
        v533 = 0u;
        v534 = 0u;
        v535 = 0u;
        v536 = 0u;
        v458 = v441;
        v463 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v458, "countByEnumeratingWithState:objects:count:", &v533, v566, 16);
        if (!v463)
          goto LABEL_36;
        v461 = *(id *)v534;
        do
        {
          v30 = 0;
          do
          {
            if (*(id *)v534 != v461)
              objc_enumerationMutation(v458);
            v470 = (char *)v30;
            v31 = *(void **)(*((_QWORD *)&v533 + 1) + 8 * (_QWORD)v30);
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("persons")));
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("bundleID")));
            v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
            v473 = v32;
            if ((objc_msgSend(v32, "isEqual:", v34) & 1) != 0)
            {

LABEL_28:
              v54 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", CFSTR("unavailable")));
              v55 = objc_msgSend(v54, "count");

              if (v55)
              {
                v56 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", CFSTR("unavailable")));
                v37 = objc_msgSend(v56, "mutableCopy");

                objc_msgSend(v37, "addObject:", v33);
              }
              else
              {
                v563 = v33;
                v37 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v563, 1));
              }
              v53 = v470;
              v36 = v473;
              -[NSMutableDictionary setObject:forKeyedSubscript:](v23, "setObject:forKeyedSubscript:", v37, CFSTR("unavailable"));
              goto LABEL_32;
            }
            v35 = objc_msgSend(v32, "count");

            if (!v35)
              goto LABEL_28;
            v531 = 0u;
            v532 = 0u;
            v529 = 0u;
            v530 = 0u;
            v36 = v32;
            v37 = v32;
            v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v529, v565, 16);
            if (v38)
            {
              v39 = v38;
              v40 = *(_QWORD *)v530;
              do
              {
                for (k = 0; k != v39; k = (char *)k + 1)
                {
                  if (*(_QWORD *)v530 != v40)
                    objc_enumerationMutation(v37);
                  v42 = *(void **)(*((_QWORD *)&v529 + 1) + 8 * (_QWORD)k);
                  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "name"));
                  v44 = objc_msgSend(v43, "length");

                  if (v44)
                  {
                    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "name"));
                    v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", v45));
                    v47 = v23;
                    v48 = objc_msgSend(v46, "count");

                    if (v48)
                    {
                      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "name"));
                      v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v47, "objectForKeyedSubscript:", v49));
                      v51 = objc_msgSend(v50, "mutableCopy");

                      objc_msgSend(v51, "addObject:", v33);
                    }
                    else
                    {
                      v564 = v33;
                      v51 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v564, 1));
                    }
                    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "name"));
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v47, "setObject:forKeyedSubscript:", v51, v52);
                    v23 = v47;

                    -[NSMutableSet addObject:](v477, "addObject:", v42);
                  }
                }
                v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v529, v565, 16);
              }
              while (v39);
              v22 = v457;
              v28 = v467;
              v53 = v470;
              v36 = v473;
            }
            else
            {
              v53 = v470;
            }
LABEL_32:

            v30 = v53 + 1;
          }
          while (v30 != v463);
          v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v458, "countByEnumeratingWithState:objects:count:", &v533, v566, 16);
          v463 = v57;
        }
        while (v57);
LABEL_36:

        v474 = objc_opt_new(NSString);
        v525 = 0u;
        v526 = 0u;
        v527 = 0u;
        v528 = 0u;
        v58 = v23;
        v59 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v525, v562, 16);
        if (v59)
        {
          v60 = v59;
          v61 = *(_QWORD *)v526;
          do
          {
            for (m = 0; m != v60; m = (char *)m + 1)
            {
              if (*(_QWORD *)v526 != v61)
                objc_enumerationMutation(v58);
              v63 = *(void **)(*((_QWORD *)&v525 + 1) + 8 * (_QWORD)m);
              if ((objc_msgSend(v63, "isEqualToString:", CFSTR("unavailable")) & 1) == 0)
              {
                v64 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v58, "objectForKeyedSubscript:", v63));
                v65 = objc_msgSend(v64, "count");

                v66 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
                v67 = objc_claimAutoreleasedReturnValue(v66);
                if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
                {
                  v79 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "mask")));
                  *(_DWORD *)buf = 138412802;
                  v557 = v79;
                  v558 = 2048;
                  v559 = *(double *)&v65;
                  v560 = 2048;
                  v561 = v451;
                  _os_log_debug_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEBUG, "Current contactName:%@, count:%lu, totalSubBundleCount:%lu", buf, 0x20u);

                }
                if ((unint64_t)v65 >= self->_clusterPhenotypeMinimumCountThreshold)
                {
                  v68 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
                  v69 = objc_claimAutoreleasedReturnValue(v68);
                  if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
                    -[MOBundleClusteringManager _getClusterBundleFrom:withEmbeddings:andCreationDate:].cold.8((uint64_t)v555, (uint64_t)v63);

                  if (-[NSString length](v474, "length"))
                  {
                    v70 = (NSString *)(id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, %@"), v474, v63));

                    v474 = v70;
                  }
                  else
                  {
                    v70 = v474;
                    v474 = v63;
                  }

                  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v467, "stringByAppendingFormat:", CFSTR("_%@"), v63));
                  v72 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v58, "objectForKeyedSubscript:", v63));
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v455, "setObject:forKeyedSubscript:", v72, v71);

                  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("name==%@"), v63));
                  v74 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(-[NSMutableSet filteredSetUsingPredicate:](v477, "filteredSetUsingPredicate:", v73)));
                  if (objc_msgSend(*(id *)&v74, "count"))
                  {
                    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)&v74, "allObjects"));
                    -[NSMutableSet addObjectsFromArray:](v454, "addObjectsFromArray:", v75);

                    v76 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
                    v77 = objc_claimAutoreleasedReturnValue(v76);
                    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412546;
                      v557 = v74;
                      v558 = 2112;
                      v559 = *(double *)&v454;
                      _os_log_debug_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEBUG, "Added current persons %@ to allPersonPhenotype%@", buf, 0x16u);
                    }
                  }
                  else
                  {
                    v78 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
                    v77 = objc_claimAutoreleasedReturnValue(v78);
                    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
                      -[MOBundleClusteringManager _getClusterBundleFrom:withEmbeddings:andCreationDate:].cold.7((uint64_t)v554, (uint64_t)v63);
                  }
                  v22 = v457;

                }
                v28 = v467;
              }
            }
            v60 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v58, "countByEnumeratingWithState:objects:count:", &v525, v562, 16);
          }
          while (v60);
        }

        if (-[NSString length](v474, "length"))
          -[NSMutableDictionary setObject:forKeyedSubscript:](v439, "setObject:forKeyedSubscript:", v474, v28);
        -[NSMutableDictionary setObject:forKeyedSubscript:](v442, "setObject:forKeyedSubscript:", v58, v28);

        v23 = v447;
LABEL_129:
        if (objc_msgSend(v444, "containsObject:", v28))
        {
          v513 = 0u;
          v514 = 0u;
          v511 = 0u;
          v512 = 0u;
          v162 = v23;
          v163 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v162, "countByEnumeratingWithState:objects:count:", &v511, v551, 16);
          if (v163)
          {
            v164 = v163;
            v165 = *(_QWORD *)v512;
            do
            {
              for (n = 0; n != v164; n = (char *)n + 1)
              {
                if (*(_QWORD *)v512 != v165)
                  objc_enumerationMutation(v162);
                v167 = *(void **)(*((_QWORD *)&v511 + 1) + 8 * (_QWORD)n);
                v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1002D8F30, "stringValue"));
                v169 = objc_msgSend(v167, "isEqualToString:", v168);

                if (v169)
                {
                  v170 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", v28));
                  v171 = objc_msgSend(v170, "count");

                  if (v171)
                  {
                    v172 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", v28));
                    v173 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v162, "objectForKeyedSubscript:", v167));
                    v174 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v172, "arrayByAddingObjectsFromArray:", v173));
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v174, v28);

                  }
                  else
                  {
                    v172 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v162, "objectForKeyedSubscript:", v167));
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v172, v28);
                  }
                }
                else
                {
                  v172 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("not"), "stringByAppendingString:", v28));
                  v175 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", v172));
                  v176 = objc_msgSend(v175, "count");

                  if (v176)
                  {
                    v177 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", v172));
                    v178 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v162, "objectForKeyedSubscript:", v167));
                    v179 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v177, "arrayByAddingObjectsFromArray:", v178));
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v179, v172);

                  }
                  else
                  {
                    v177 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v162, "objectForKeyedSubscript:", v167));
                    -[NSMutableDictionary setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v177, v172);
                  }

                  v28 = v467;
                }

              }
              v164 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v162, "countByEnumeratingWithState:objects:count:", &v511, v551, 16);
            }
            while (v164);
          }

          v180 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
          v181 = objc_claimAutoreleasedReturnValue(v180);
          if (os_log_type_enabled(v181, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v557 = *(double *)&v28;
            v558 = 2112;
            v559 = *(double *)&v22;
            _os_log_debug_impl((void *)&_mh_execute_header, v181, OS_LOG_TYPE_DEBUG, "subBundleIDsGroupedByFeatureValues for %@: %@", buf, 0x16u);
          }
          v23 = v447;
        }
        else
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v442, "setObject:forKeyedSubscript:", v23, v28);
          v182 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
          v181 = objc_claimAutoreleasedReturnValue(v182);
          if (os_log_type_enabled(v181, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v557 = *(double *)&v28;
            v558 = 2112;
            v559 = *(double *)&v23;
            _os_log_debug_impl((void *)&_mh_execute_header, v181, OS_LOG_TYPE_DEBUG, "subBundleIDsGroupedByFeatureValues for %@: %@", buf, 0x16u);
          }
        }

        v25 = v445 + 1;
      }
      while ((id)(v445 + 1) != v443);
      v215 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v537, v567, 16);
      v443 = v215;
    }
    while (v215);
  }

  v216 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
  v217 = objc_claimAutoreleasedReturnValue(v216);
  if (os_log_type_enabled(v217, OS_LOG_TYPE_DEBUG))
    -[MOBundleClusteringManager _getClusterBundleFrom:withEmbeddings:andCreationDate:].cold.6();

  v479 = objc_opt_new(NSMutableSet);
  v507 = 0u;
  v508 = 0u;
  v509 = 0u;
  v510 = 0u;
  v218 = v455;
  v219 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v218, "countByEnumeratingWithState:objects:count:", &v507, v550, 16);
  v448 = v23;
  if (v219)
  {
    v220 = v219;
    v221 = 0;
    v222 = *(_QWORD *)v508;
    while (2)
    {
      v223 = 0;
      v224 = -v221;
      v221 += (uint64_t)v220;
      do
      {
        if (*(_QWORD *)v508 != v222)
          objc_enumerationMutation(v218);
        v225 = *(double *)(*((_QWORD *)&v507 + 1) + 8 * (_QWORD)v223);
        v226 = v218;
        v462 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v218, "objectForKeyedSubscript:", *(_QWORD *)&v225));
        v227 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
        v228 = objc_claimAutoreleasedReturnValue(v227);
        if (os_log_type_enabled(v228, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v557 = v225;
          v558 = 2112;
          v559 = *(double *)&v462;
          _os_log_debug_impl((void *)&_mh_execute_header, v228, OS_LOG_TYPE_DEBUG, "Current phenotype value: %@, subBundles: %@", buf, 0x16u);
        }

        if ((void *)v224 == v223)
        {
          v229 = v462;
          v230 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v462));

          v479 = (NSMutableSet *)v230;
          v23 = v448;
          v218 = v226;
        }
        else
        {
          v231 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v462));
          -[NSMutableSet intersectSet:](v479, "intersectSet:", v231);

          v23 = v448;
          if ((unint64_t)-[NSMutableSet count](v479, "count") < self->_clusterPhenotypeMinimumCountThreshold)
          {
            v250 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
            v251 = objc_claimAutoreleasedReturnValue(v250);
            v218 = v226;
            p_super = v251;
            if (os_log_type_enabled(v251, OS_LOG_TYPE_DEBUG))
              -[MOBundleClusteringManager _getClusterBundleFrom:withEmbeddings:andCreationDate:].cold.1(v251, v252, v253, v254, v255, v256, v257, v258);
            v249 = 0;
            v233 = v226;
            v234 = v436;
            v248 = v433;
            v238 = v457;
            goto LABEL_377;
          }
          v218 = v226;
          v229 = v462;
        }

        v223 = (char *)v223 + 1;
      }
      while (v220 != v223);
      v220 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v218, "countByEnumeratingWithState:objects:count:", &v507, v550, 16);
      if (v220)
        continue;
      break;
    }
  }

  v232 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v479, "allObjects"));
  v233 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("bundleIdentifier in %@"), v232));

  v234 = v436;
  v235 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v436, "filteredArrayUsingPredicate:", v233));
  v236 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
  v237 = objc_claimAutoreleasedReturnValue(v236);
  v238 = v457;
  if (os_log_type_enabled(v237, OS_LOG_TYPE_DEBUG))
    -[MOBundleClusteringManager _getClusterBundleFrom:withEmbeddings:andCreationDate:].cold.4(v436, v235);

  if ((unint64_t)objc_msgSend(v235, "count") < self->_clusterPhenotypeMinimumCountThreshold)
  {
    v462 = v235;
    v239 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
    v240 = objc_claimAutoreleasedReturnValue(v239);
    v248 = v433;
    p_super = v240;
    if (os_log_type_enabled(v240, OS_LOG_TYPE_DEBUG))
      -[MOBundleClusteringManager _getClusterBundleFrom:withEmbeddings:andCreationDate:].cold.1(v240, v241, v242, v243, v244, v245, v246, v247);
    v249 = 0;
    goto LABEL_377;
  }
  v449 = v233;
  v259 = v235;
  v260 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v235, "valueForKeyPath:", CFSTR("@min.startDate")));
  -[MOEventBundle setStartDate:](v437, "setStartDate:", v260);

  v261 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v235, "valueForKeyPath:", CFSTR("@max.endDate")));
  -[MOEventBundle setEndDate:](v437, "setEndDate:", v261);

  v262 = objc_opt_new(NSMutableArray);
  v263 = objc_opt_new(NSMutableArray);
  v504[0] = _NSConcreteStackBlock;
  v504[1] = 3221225472;
  v504[2] = __82__MOBundleClusteringManager__getClusterBundleFrom_withEmbeddings_andCreationDate___block_invoke_126;
  v504[3] = &unk_1002AD580;
  v264 = v262;
  v505 = v264;
  v265 = v263;
  v506 = v265;
  objc_msgSend(v259, "enumerateObjectsUsingBlock:", v504);
  p_super = &v264->super.super;
  -[MOEventBundle setSubBundleIDs:](v437, "setSubBundleIDs:", v264);
  v446 = v265;
  -[MOEventBundle setSubSuggestionIDs:](v437, "setSubSuggestionIDs:", v265);
  v459 = objc_opt_new(NSMutableSet);
  v500 = 0u;
  v501 = 0u;
  v502 = 0u;
  v503 = 0u;
  v462 = v259;
  v266 = objc_msgSend(v462, "countByEnumeratingWithState:objects:count:", &v500, v549, 16);
  if (v266)
  {
    v267 = v266;
    v268 = *(_QWORD *)v501;
    do
    {
      for (ii = 0; ii != v267; ii = (char *)ii + 1)
      {
        if (*(_QWORD *)v501 != v268)
          objc_enumerationMutation(v462);
        v270 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v500 + 1) + 8 * (_QWORD)ii), "events"));
        -[NSMutableSet addObjectsFromArray:](v459, "addObjectsFromArray:", v270);

      }
      v267 = objc_msgSend(v462, "countByEnumeratingWithState:objects:count:", &v500, v549, 16);
    }
    while (v267);
  }
  v450 = v218;

  v271 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v459, "allObjects"));
  -[MOEventBundle setEvents:](v437, "setEvents:", v271);

  v453 = objc_opt_new(NSMutableDictionary);
  v496 = 0u;
  v497 = 0u;
  v498 = 0u;
  v499 = 0u;
  v464 = v442;
  v460 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v464, "countByEnumeratingWithState:objects:count:", &v496, v548, 16);
  if (v460)
  {
    v456 = *(_QWORD *)v497;
    do
    {
      v272 = 0;
      do
      {
        if (*(_QWORD *)v497 != v456)
          objc_enumerationMutation(v464);
        v468 = v272;
        v465 = *(double *)(*((_QWORD *)&v496 + 1) + 8 * v272);
        v273 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v464, "objectForKeyedSubscript:"));
        v274 = objc_opt_new(NSMutableDictionary);
        v492 = 0u;
        v493 = 0u;
        v494 = 0u;
        v495 = 0u;
        v275 = v273;
        v276 = objc_msgSend(v275, "countByEnumeratingWithState:objects:count:", &v492, v547, 16);
        if (v276)
        {
          v277 = v276;
          v278 = *(_QWORD *)v493;
          do
          {
            for (jj = 0; jj != v277; jj = (char *)jj + 1)
            {
              if (*(_QWORD *)v493 != v278)
                objc_enumerationMutation(v275);
              v280 = *(double *)(*((_QWORD *)&v492 + 1) + 8 * (_QWORD)jj);
              v281 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v275, "objectForKeyedSubscript:", *(_QWORD *)&v280));
              v282 = objc_msgSend(v281, "count");

              if (v282)
              {
                v283 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v275, "objectForKeyedSubscript:", *(_QWORD *)&v280));
                v284 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v283)));

                v285 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
                v286 = objc_claimAutoreleasedReturnValue(v285);
                if (os_log_type_enabled(v286, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412546;
                  v557 = v280;
                  v558 = 2112;
                  v559 = v284;
                  _os_log_debug_impl((void *)&_mh_execute_header, v286, OS_LOG_TYPE_DEBUG, "Current featureValue %@, SubBundleIDs %@", buf, 0x16u);
                }

                objc_msgSend(*(id *)&v284, "intersectSet:", v479);
                v287 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
                v288 = objc_claimAutoreleasedReturnValue(v287);
                if (os_log_type_enabled(v288, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v557 = v284;
                  _os_log_debug_impl((void *)&_mh_execute_header, v288, OS_LOG_TYPE_DEBUG, "Intersection between feature value subbundles and phenotype subbundles %@", buf, 0xCu);
                }

                if (objc_msgSend(*(id *)&v284, "count"))
                {
                  v289 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)&v284, "count")));
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v274, "setObject:forKeyedSubscript:", v289, *(_QWORD *)&v280);

                }
              }
            }
            v277 = objc_msgSend(v275, "countByEnumeratingWithState:objects:count:", &v492, v547, 16);
          }
          while (v277);
        }

        v290 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
        v291 = objc_claimAutoreleasedReturnValue(v290);
        if (os_log_type_enabled(v291, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v557 = v465;
          v558 = 2112;
          v559 = *(double *)&v274;
          _os_log_debug_impl((void *)&_mh_execute_header, v291, OS_LOG_TYPE_DEBUG, "%@ Histogram: %@", buf, 0x16u);
        }

        v238 = v457;
        if (-[NSMutableDictionary count](v274, "count"))
          -[NSMutableDictionary setObject:forKeyedSubscript:](v453, "setObject:forKeyedSubscript:", v274, *(_QWORD *)&v465);

        v272 = v468 + 1;
      }
      while ((id)(v468 + 1) != v460);
      v460 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v464, "countByEnumeratingWithState:objects:count:", &v496, v548, 16);
    }
    while (v460);
  }

  v292 = objc_opt_new(NSMutableDictionary);
  v488 = 0u;
  v489 = 0u;
  v490 = 0u;
  v491 = 0u;
  v293 = v238;
  v294 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v293, "countByEnumeratingWithState:objects:count:", &v488, v546, 16);
  if (v294)
  {
    v295 = v294;
    v296 = *(_QWORD *)v489;
    do
    {
      for (kk = 0; kk != v295; kk = (char *)kk + 1)
      {
        if (*(_QWORD *)v489 != v296)
          objc_enumerationMutation(v293);
        v298 = *(_QWORD *)(*((_QWORD *)&v488 + 1) + 8 * (_QWORD)kk);
        v299 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v293, "objectForKeyedSubscript:", v298));
        v300 = objc_msgSend(v299, "count");

        if (v300)
        {
          v301 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v293, "objectForKeyedSubscript:", v298));
          v302 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v301));

          objc_msgSend(v302, "intersectSet:", v479);
          if (objc_msgSend(v302, "count"))
          {
            v303 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v302, "count")));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v292, "setObject:forKeyedSubscript:", v303, v298);

          }
        }
      }
      v295 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v293, "countByEnumeratingWithState:objects:count:", &v488, v546, 16);
    }
    while (v295);
  }

  v304 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
  v305 = objc_claimAutoreleasedReturnValue(v304);
  if (os_log_type_enabled(v305, OS_LOG_TYPE_DEBUG))
    -[MOBundleClusteringManager _getClusterBundleFrom:withEmbeddings:andCreationDate:].cold.3();

  v306 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("dayOfWeek")));
  v307 = v454;
  if (v306)
  {
    v308 = 1;
  }
  else
  {
    v309 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("timeTag")));
    if (v309)
    {
      v308 = 1;
    }
    else
    {
      v310 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("isWeekend")));
      v308 = v310 != 0;

    }
  }

  v311 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("topLevelActivityType")));
  if (v311)
  {

  }
  else
  {
    v312 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("secondLevelActivityType")));

    if (!v312)
      goto LABEL_287;
  }
  v313 = objc_opt_new(NSString);
  v314 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("topLevelActivityType")));

  if (v314)
  {
    v315 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("topLevelActivityType")));

    if (objc_msgSend(v315, "isEqualToString:", CFSTR("outing")))
    {
      if (v308)
        v316 = 901;
      else
        v316 = 905;
      v317 = 2;
    }
    else if (objc_msgSend(v315, "isEqualToString:", CFSTR("activity")))
    {
      if (v308)
        v316 = 902;
      else
        v316 = 906;
      v317 = 4;
    }
    else if (objc_msgSend(v315, "isEqualToString:", CFSTR("contact")))
    {
      if (v308)
        v316 = 903;
      else
        v316 = 907;
      v317 = 5;
    }
    else
    {
      if (!objc_msgSend(v315, "isEqualToString:", CFSTR("time_at_home")))
      {
        v317 = 0;
        goto LABEL_283;
      }
      if (v308)
        v316 = 904;
      else
        v316 = 909;
      v317 = 1;
    }
    -[MOEventBundle setBundleSubType:](v437, "setBundleSubType:", v316);
LABEL_283:
    v318 = v439;
    goto LABEL_284;
  }
  v317 = 0;
  v315 = v313;
  v318 = v439;
LABEL_284:
  v319 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v318, "objectForKeyedSubscript:", CFSTR("secondLevelActivityType")));

  if (v319)
  {
    v320 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v318, "objectForKeyedSubscript:", CFSTR("secondLevelActivityType")));

    v315 = (void *)v320;
  }
  v321 = -[MOAction initWithActionName:actionType:]([MOAction alloc], "initWithActionName:actionType:", v315, v317);
  -[MOEventBundle setAction:](v437, "setAction:", v321);

LABEL_287:
  v322 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("dayOfWeek")));
  if (v322
    || (v322 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("timeTag")))) != 0)
  {

  }
  else
  {
    v354 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("isWeekend")));

    if (!v354)
      goto LABEL_295;
  }
  v323 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("timeTag")));
  v324 = objc_msgSend(v323, "intValue");

  if (v324)
  {
    v325 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("timeTag")));
    v326 = (int)objc_msgSend(v325, "intValue");

  }
  else
  {
    v347 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("dayOfWeek")));

    if (v347)
    {
      v348 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("dayOfWeek")));
      v349 = objc_msgSend(v348, "isEqualToString:", CFSTR("sunday"));

      if ((v349 & 1) != 0)
      {
        v326 = 102;
      }
      else
      {
        v358 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("dayOfWeek")));
        v359 = objc_msgSend(v358, "isEqualToString:", CFSTR("monday"));

        if ((v359 & 1) != 0)
        {
          v326 = 103;
        }
        else
        {
          v422 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("dayOfWeek")));
          v423 = objc_msgSend(v422, "isEqualToString:", CFSTR("tuesday"));

          if ((v423 & 1) != 0)
          {
            v326 = 104;
          }
          else
          {
            v425 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("dayOfWeek")));
            v426 = objc_msgSend(v425, "isEqualToString:", CFSTR("wednesday"));

            if ((v426 & 1) != 0)
            {
              v326 = 105;
            }
            else
            {
              v427 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("dayOfWeek")));
              v428 = objc_msgSend(v427, "isEqualToString:", CFSTR("thursday"));

              if ((v428 & 1) != 0)
              {
                v326 = 106;
              }
              else
              {
                v429 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("dayOfWeek")));
                v430 = objc_msgSend(v429, "isEqualToString:", CFSTR("friday"));

                if ((v430 & 1) != 0)
                {
                  v326 = 107;
                }
                else
                {
                  v431 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("dayOfWeek")));
                  v432 = objc_msgSend(v431, "isEqualToString:", CFSTR("saturday"));

                  if (v432)
                    v326 = 108;
                  else
                    v326 = 0;
                }
              }
            }
          }
        }
      }
    }
    else
    {
      v326 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("isWeekend")));

      if (v326)
      {
        v356 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("isWeekend")));
        v357 = objc_msgSend(v356, "BOOLValue");

        if (v357)
          v326 = 10001;
        else
          v326 = 10000;
      }
    }
  }
  v327 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", v326));
  if (v327)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v439, "setObject:forKeyedSubscript:", v327, CFSTR("timeString"));
    v328 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v329 = [MOTime alloc];
    v330 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v330, "timeIntervalSinceReferenceDate");
    v332 = v331;
    v333 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v328, "timeZone"));
    v334 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v333, "name"));
    v335 = -[MOTime initWithTimestamp:timeString:timeZone:timeTag:](v329, "initWithTimestamp:timeString:timeZone:timeTag:", v327, v334, v326, v332);

    -[MOEventBundle setTime:](v437, "setTime:", v335);
  }

  v307 = v454;
LABEL_295:
  v336 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("placeName")));
  if (v336
    || (v336 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("combinedPlaceType")))) != 0)
  {

  }
  else
  {
    v355 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("enclosingAreaName")));

    if (!v355)
      goto LABEL_322;
  }
  v337 = [MOPlace alloc];
  v338 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v339 = -[MOPlace initWithIdentifier:](v337, "initWithIdentifier:", v338);

  v340 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("placeName")));
  -[MOPlace setPlaceName:](v339, "setPlaceName:", v340);

  v341 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("enclosingAreaName")));
  -[MOPlace setEnclosingArea:](v339, "setEnclosingArea:", v341);

  v342 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("combinedPlaceType")));
  if (v342)
  {
    v343 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("combinedPlaceType")));
    v344 = objc_msgSend(v343, "isEqualToString:", CFSTR("Home"));

    if (v344)
    {
      v345 = v339;
      v346 = 1;
    }
    else
    {
      v350 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("combinedPlaceType")));
      v351 = objc_msgSend(v350, "isEqualToString:", CFSTR("Work"));

      if (v351)
      {
        v345 = v339;
        v346 = 2;
      }
      else
      {
        v352 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("combinedPlaceType")));
        v353 = objc_msgSend(v352, "isEqualToString:", CFSTR("School"));

        if (v353)
        {
          v345 = v339;
          v346 = 3;
        }
        else
        {
          v360 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("combinedPlaceType")));
          v361 = objc_msgSend(v360, "isEqualToString:", CFSTR("Gym"));

          v345 = v339;
          if (!v361)
          {
            -[MOPlace setPlaceUserType:](v339, "setPlaceUserType:", 0);
            v424 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("combinedPlaceType")));
            -[MOPlace setPoiCategory:](v339, "setPoiCategory:", v424);

            goto LABEL_321;
          }
          v346 = 4;
        }
      }
    }
    -[MOPlace setPlaceUserType:](v345, "setPlaceUserType:", v346);
  }
LABEL_321:
  -[MOEventBundle setPlace:](v437, "setPlace:", v339);

LABEL_322:
  v486[0] = _NSConcreteStackBlock;
  v486[1] = 3221225472;
  v486[2] = __82__MOBundleClusteringManager__getClusterBundleFrom_withEmbeddings_andCreationDate___block_invoke_153;
  v486[3] = &unk_1002B13E0;
  v362 = objc_opt_new(NSMutableSet);
  v487 = v362;
  objc_msgSend(v462, "enumerateObjectsUsingBlock:", v486);
  if (-[NSMutableSet count](v362, "count"))
  {
    v363 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v362, "allObjects"));
    -[MOEventBundle setPlaces:](v437, "setPlaces:", v363);

  }
  v472 = v362;
  v476 = v292;
  if (-[NSMutableSet count](v307, "count"))
  {
    v364 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v307, "allObjects"));
    -[MOEventBundle setPersons:](v437, "setPersons:", v364);

  }
  v365 = objc_opt_new(NSMutableArray);
  v482 = 0u;
  v483 = 0u;
  v484 = 0u;
  v485 = 0u;
  v366 = v435;
  v367 = objc_msgSend(v366, "countByEnumeratingWithState:objects:count:", &v482, v545, 16);
  if (v367)
  {
    v368 = v367;
    v369 = *(_QWORD *)v483;
    do
    {
      for (mm = 0; mm != v368; mm = (char *)mm + 1)
      {
        if (*(_QWORD *)v483 != v369)
          objc_enumerationMutation(v366);
        v371 = *(_QWORD *)(*((_QWORD *)&v482 + 1) + 8 * (_QWORD)mm);
        v372 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", v371));

        if (v372)
        {
          v373 = [MOPhotoTrait alloc];
          v374 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", v371));
          v375 = -[MOPhotoTrait initWithIdentifier:name:relevantAssetUUIDs:](v373, "initWithIdentifier:name:relevantAssetUUIDs:", 0, v374, 0);

          -[NSMutableArray addObject:](v365, "addObject:", v375);
        }
      }
      v368 = objc_msgSend(v366, "countByEnumeratingWithState:objects:count:", &v482, v545, 16);
    }
    while (v368);
  }

  if (-[NSMutableArray count](v365, "count"))
    -[MOEventBundle setPhotoTraits:](v437, "setPhotoTraits:", v365);
  v376 = -[NSMutableDictionary count](v439, "count");
  phenotypeSpecificityThreshold = self->_phenotypeSpecificityThreshold;
  v378 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("topLevelActivityType")));
  if (v378)
  {
    v379 = 1;
  }
  else
  {
    v380 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v439, "objectForKeyedSubscript:", CFSTR("secondLevelActivityType")));
    v379 = v380 != 0;

  }
  v480[0] = _NSConcreteStackBlock;
  v480[1] = 3221225472;
  v480[2] = __82__MOBundleClusteringManager__getClusterBundleFrom_withEmbeddings_andCreationDate___block_invoke_2_155;
  v480[3] = &unk_1002B13E0;
  v381 = objc_opt_new(NSMutableArray);
  v481 = v381;
  objc_msgSend(v462, "enumerateObjectsUsingBlock:", v480);
  v469 = v381;
  if (-[NSMutableArray count](v381, "count"))
  {
    v382 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray valueForKeyPath:](v381, "valueForKeyPath:", CFSTR("@avg.self")));
    objc_msgSend(v382, "floatValue");
    v384 = v383;

    v543 = CFSTR("bundleGoodnessScore");
    *(float *)&v385 = v384;
    v386 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v385));
    v544 = v386;
    v387 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v544, &v543, 1));

    -[MOEventBundle setRankingDictionary:](v437, "setRankingDictionary:", v387);
    v388 = _mo_log_facility_get_os_log(&MOLogFacilityBundleClusteringManager);
    v389 = objc_claimAutoreleasedReturnValue(v388);
    if (os_log_type_enabled(v389, OS_LOG_TYPE_DEBUG))
      -[MOBundleClusteringManager _getClusterBundleFrom:withEmbeddings:andCreationDate:].cold.2((uint64_t)v381, v389, v384);

    v390 = v384 > self->_avgGoodnessScoreFilteringThreshold;
  }
  else
  {
    v390 = 0;
  }
  v391 = (unint64_t)v376 < phenotypeSpecificityThreshold || !v379 || !v390;
  v392 = [MOClusterMetadata alloc];
  v393 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v394 = -[MOClusterMetadata initWithIdentifier:phenoType:](v392, "initWithIdentifier:phenoType:", v393, v439);

  -[MOClusterMetadata setIsFiltered:](v394, "setIsFiltered:", v391);
  v395 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v453, "objectForKeyedSubscript:", CFSTR("topLevelActivityType")));

  if (v395)
  {
    v396 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v453, "objectForKeyedSubscript:", CFSTR("topLevelActivityType")));
    -[MOClusterMetadata setTopLevelActivityHistogram:](v394, "setTopLevelActivityHistogram:", v396);

  }
  v397 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v453, "objectForKeyedSubscript:", CFSTR("secondLevelActivityType")));

  v234 = v436;
  v238 = v457;
  v218 = v450;
  if (v397)
  {
    v398 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v453, "objectForKeyedSubscript:", CFSTR("secondLevelActivityType")));
    -[MOClusterMetadata setSecondLevelActivityHistogram:](v394, "setSecondLevelActivityHistogram:", v398);

  }
  v399 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v453, "objectForKeyedSubscript:", CFSTR("activityTypeFromPhotoTraits")));

  if (v399)
  {
    v400 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v453, "objectForKeyedSubscript:", CFSTR("activityTypeFromPhotoTraits")));
    -[MOClusterMetadata setActivityTypeFromPhotoTraitsHistogram:](v394, "setActivityTypeFromPhotoTraitsHistogram:", v400);

  }
  v401 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v453, "objectForKeyedSubscript:", CFSTR("timeTag")));

  if (v401)
  {
    v402 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v453, "objectForKeyedSubscript:", CFSTR("timeTag")));
    -[MOClusterMetadata setTimeTagHistogram:](v394, "setTimeTagHistogram:", v402);

  }
  v403 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v453, "objectForKeyedSubscript:", CFSTR("dayOfWeek")));

  if (v403)
  {
    v404 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v453, "objectForKeyedSubscript:", CFSTR("dayOfWeek")));
    -[MOClusterMetadata setDayOfWeekHistogram:](v394, "setDayOfWeekHistogram:", v404);

  }
  v405 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v453, "objectForKeyedSubscript:", CFSTR("timeContextFromPhotoTraits")));

  if (v405)
  {
    v406 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v453, "objectForKeyedSubscript:", CFSTR("timeContextFromPhotoTraits")));
    -[MOClusterMetadata setTimeContextFromPhotoTraitsHistogram:](v394, "setTimeContextFromPhotoTraitsHistogram:", v406);

  }
  v407 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v453, "objectForKeyedSubscript:", CFSTR("placeName")));

  if (v407)
  {
    v408 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v453, "objectForKeyedSubscript:", CFSTR("placeName")));
    -[MOClusterMetadata setPlaceNameHistogram:](v394, "setPlaceNameHistogram:", v408);

  }
  v409 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v453, "objectForKeyedSubscript:", CFSTR("combinedPlaceType")));

  if (v409)
  {
    v410 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v453, "objectForKeyedSubscript:", CFSTR("combinedPlaceType")));
    -[MOClusterMetadata setCombinedPlaceTypeHistogram:](v394, "setCombinedPlaceTypeHistogram:", v410);

  }
  v411 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v453, "objectForKeyedSubscript:", CFSTR("enclosingAreaName")));

  if (v411)
  {
    v412 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v453, "objectForKeyedSubscript:", CFSTR("enclosingAreaName")));
    -[MOClusterMetadata setEnclosingPlaceNameHistogram:](v394, "setEnclosingPlaceNameHistogram:", v412);

  }
  v413 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v453, "objectForKeyedSubscript:", CFSTR("placeTypeFromPhotoTraits")));

  if (v413)
  {
    v414 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v453, "objectForKeyedSubscript:", CFSTR("placeTypeFromPhotoTraits")));
    -[MOClusterMetadata setPlaceTypeFromPhotoTraitsHistogram:](v394, "setPlaceTypeFromPhotoTraitsHistogram:", v414);

  }
  v415 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v453, "objectForKeyedSubscript:", CFSTR("persons")));

  if (v415)
  {
    v416 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v453, "objectForKeyedSubscript:", CFSTR("persons")));
    -[MOClusterMetadata setContactNamesHistogram:](v394, "setContactNamesHistogram:", v416);

  }
  v417 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v453, "objectForKeyedSubscript:", CFSTR("socialEventFromPhotoTraits")));

  if (v417)
  {
    v418 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v453, "objectForKeyedSubscript:", CFSTR("socialEventFromPhotoTraits")));
    -[MOClusterMetadata setSocialEventFromPhotoTraitsHistogram:](v394, "setSocialEventFromPhotoTraitsHistogram:", v418);

  }
  v419 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v453, "objectForKeyedSubscript:", CFSTR("otherSubjectFromPhotoTraits")));

  if (v419)
  {
    v420 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v453, "objectForKeyedSubscript:", CFSTR("otherSubjectFromPhotoTraits")));
    -[MOClusterMetadata setOtherSubjectFromPhotoTraitsHistogram:](v394, "setOtherSubjectFromPhotoTraitsHistogram:", v420);

  }
  -[MOClusterMetadata setPersonRelationshipHistogram:](v394, "setPersonRelationshipHistogram:", v476);
  if (-[NSMutableArray count](v469, "count"))
    -[MOClusterMetadata setSubBundleGoodnessScores:](v394, "setSubBundleGoodnessScores:", v469);
  -[MOEventBundle setClusterMetadata:](v437, "setClusterMetadata:", v394);
  v249 = v437;

  v248 = v433;
  v23 = v448;
  v233 = v449;
LABEL_377:

  return v249;
}

void __82__MOBundleClusteringManager__getClusterBundleFrom_withEmbeddings_andCreationDate___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "summaryDictionary"));
  objc_msgSend(v2, "addObject:", v3);

}

void __82__MOBundleClusteringManager__getClusterBundleFrom_withEmbeddings_andCreationDate___block_invoke_99(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_convertContextvalueToString:forKey:", v6, *(_QWORD *)(a1 + 40)));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bundleID")));
  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v7));
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v7));
      v13 = objc_msgSend(v12, "mutableCopy");

      objc_msgSend(v13, "addObject:", v8);
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v13, v7);

    }
    else
    {
      v15 = v8;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1));
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v14, v7);

    }
  }

}

int64_t __82__MOBundleClusteringManager__getClusterBundleFrom_withEmbeddings_andCreationDate___block_invoke_2(id a1, NSArray *a2, NSArray *a3)
{
  NSArray *v4;
  NSArray *v5;
  id v6;
  int64_t v7;
  id v8;

  v4 = a2;
  v5 = a3;
  v6 = -[NSArray count](v4, "count");
  if (v6 >= (id)-[NSArray count](v5, "count"))
  {
    v8 = -[NSArray count](v4, "count");
    if (v8 <= (id)-[NSArray count](v5, "count"))
      v7 = 0;
    else
      v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

int64_t __82__MOBundleClusteringManager__getClusterBundleFrom_withEmbeddings_andCreationDate___block_invoke_107(id a1, NSNumber *a2, NSNumber *a3)
{
  NSNumber *v4;
  NSNumber *v5;
  int v6;
  int64_t v7;
  int v8;

  v4 = a2;
  v5 = a3;
  v6 = -[NSNumber intValue](v4, "intValue");
  if (v6 >= -[NSNumber intValue](v5, "intValue"))
  {
    v8 = -[NSNumber intValue](v4, "intValue");
    if (v8 <= -[NSNumber intValue](v5, "intValue"))
      v7 = 0;
    else
      v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

int64_t __82__MOBundleClusteringManager__getClusterBundleFrom_withEmbeddings_andCreationDate___block_invoke_114(id a1, NSNumber *a2, NSNumber *a3)
{
  NSNumber *v4;
  NSNumber *v5;
  int v6;
  int64_t v7;
  int v8;

  v4 = a2;
  v5 = a3;
  v6 = -[NSNumber intValue](v4, "intValue");
  if (v6 >= -[NSNumber intValue](v5, "intValue"))
  {
    v8 = -[NSNumber intValue](v4, "intValue");
    if (v8 <= -[NSNumber intValue](v5, "intValue"))
      v7 = 0;
    else
      v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

void __82__MOBundleClusteringManager__getClusterBundleFrom_withEmbeddings_andCreationDate___block_invoke_126(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleIdentifier"));

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
    objc_msgSend(v4, "addObject:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "suggestionID"));

  if (v7)
  {
    v8 = *(void **)(a1 + 40);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "suggestionID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
    objc_msgSend(v8, "addObject:", v10);

  }
}

void __82__MOBundleClusteringManager__getClusterBundleFrom_withEmbeddings_andCreationDate___block_invoke_153(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "place"));

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "place"));
    objc_msgSend(v4, "addObject:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "places"));
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "places"));
    objc_msgSend(v8, "addObjectsFromArray:", v9);

  }
}

void __82__MOBundleClusteringManager__getClusterBundleFrom_withEmbeddings_andCreationDate___block_invoke_2_155(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rankingDictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bundleGoodnessScore")));

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rankingDictionary"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bundleGoodnessScore")));
    objc_msgSend(v5, "addObject:", v7);

  }
}

- (id)getClusteringParams
{
  return self->_clusteringParams;
}

- (id)_convertContextvalueToString:(id)a3 forKey:(id)a4
{
  id v5;
  __CFString *v6;
  void *v7;
  unsigned int v8;
  __CFString *v9;
  __CFString *v10;

  v5 = a3;
  v6 = (__CFString *)a4;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v8 = objc_msgSend(v5, "isEqual:", v7);

    if (!v8)
    {
      if (CFSTR("timeTag") != v6)
      {
        if (!-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("secondLevelActivityType")))
          -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("combinedPlaceType"));
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));
        goto LABEL_8;
      }
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", (int)objc_msgSend(v5, "intValue")));
      if (v10)
        goto LABEL_9;
    }
  }
  v9 = CFSTR("unavailable");
LABEL_8:
  v10 = v9;
LABEL_9:

  return v10;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (MOConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (MOClusteringParams)clusteringParams
{
  return self->_clusteringParams;
}

- (void)setClusteringParams:(id)a3
{
  objc_storeStrong((id *)&self->_clusteringParams, a3);
}

- (MOHDBSCANClustering)hdbscanClustering
{
  return self->_hdbscanClustering;
}

- (void)setHdbscanClustering:(id)a3
{
  objc_storeStrong((id *)&self->_hdbscanClustering, a3);
}

- (double)clusterPhenotypeMinimumRatioThreshold
{
  return self->_clusterPhenotypeMinimumRatioThreshold;
}

- (double)clusterPhenotypeArbirationThreshold
{
  return self->_clusterPhenotypeArbirationThreshold;
}

- (unint64_t)clusterPhenotypeMinimumCountThreshold
{
  return self->_clusterPhenotypeMinimumCountThreshold;
}

- (float)avgGoodnessScoreFilteringThreshold
{
  return self->_avgGoodnessScoreFilteringThreshold;
}

- (unint64_t)phenotypeSpecificityThreshold
{
  return self->_phenotypeSpecificityThreshold;
}

- (float)goodnessScoreAnomalySignificanceThreshold
{
  return self->_goodnessScoreAnomalySignificanceThreshold;
}

- (float)outlierScoreAnomalySignificanceThreshold
{
  return self->_outlierScoreAnomalySignificanceThreshold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hdbscanClustering, 0);
  objc_storeStrong((id *)&self->_clusteringParams, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __71__MOBundleClusteringManager_getEmbeddingsFromBundles_forEmbeddingType___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "description"));
  OUTLINED_FUNCTION_2();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Embedding for bundle %@ is nil. Skip and proceed to the next bundle", v4, 0xCu);

  OUTLINED_FUNCTION_5();
}

void __71__MOBundleClusteringManager_getEmbeddingsFromBundles_forEmbeddingType___block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "description"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, a2, v4, "Extracted embedding:%@", v5);

  OUTLINED_FUNCTION_5();
}

- (void)runHDBSCANClusteringOn:(NSObject *)a3 .cold.1(void *a1, id *a2, NSObject *a3)
{
  uint8_t v5[24];

  objc_msgSend(a1, "count");
  objc_msgSend(*a2, "minClusterSize");
  OUTLINED_FUNCTION_6_1();
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Embedding count (%lu) is equal to or less than min cluster size (%lu). Skip clustering", v5, 0x16u);
  OUTLINED_FUNCTION_2_0();
}

void __75__MOBundleClusteringManager_annotateAnomalyBundles_withEmbeddings_handler___block_invoke_3_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "bundleIdentifier"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, v2, v3, "Annotated anomaly bundle: id %@, outlierMetadata %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)_getClusterBundleFrom:(uint64_t)a3 withEmbeddings:(uint64_t)a4 andCreationDate:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8((void *)&_mh_execute_header, a1, a3, "Not enough subBundles after prunning. Skip cluster bundle generation.", a5, a6, a7, a8, 0);
}

- (void)_getClusterBundleFrom:(uint64_t)a1 withEmbeddings:(NSObject *)a2 andCreationDate:(float)a3 .cold.2(uint64_t a1, NSObject *a2, float a3)
{
  int v3;
  double v4;
  __int16 v5;
  uint64_t v6;

  v3 = 134218242;
  v4 = a3;
  v5 = 2112;
  v6 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Avg bundle goodness score %.3f, all goodness scores %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)_getClusterBundleFrom:withEmbeddings:andCreationDate:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "PersonalRelationship histogram: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_getClusterBundleFrom:(void *)a1 withEmbeddings:(void *)a2 andCreationDate:.cold.4(void *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "count");
  objc_msgSend(a2, "count");
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, v3, v4, "Original subBundle count:%lu, count after pruning:%lu", v5, v6, v7, v8, v9);
  OUTLINED_FUNCTION_2_0();
}

- (void)_getClusterBundleFrom:withEmbeddings:andCreationDate:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Pruning bundles with different values from phenotype: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)_getClusterBundleFrom:(uint64_t)a1 withEmbeddings:(uint64_t)a2 andCreationDate:.cold.7(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = objc_msgSend((id)OUTLINED_FUNCTION_4_0(a1, a2), "mask");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  *v3 = 138412290;
  *v2 = v5;
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v6, v7, "Could not find person object for %@. Ignoring from propagating to bundle.persons");

  OUTLINED_FUNCTION_7_1();
}

- (void)_getClusterBundleFrom:(uint64_t)a1 withEmbeddings:(uint64_t)a2 andCreationDate:.cold.8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = objc_msgSend((id)OUTLINED_FUNCTION_4_0(a1, a2), "mask");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  *v3 = 138412290;
  *v2 = v5;
  OUTLINED_FUNCTION_3_3((void *)&_mh_execute_header, v6, v7, "ContactName %@ was picked as phenotype");

  OUTLINED_FUNCTION_7_1();
}

@end
