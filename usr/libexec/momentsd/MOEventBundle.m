@implementation MOEventBundle

- (unint64_t)state
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](self, "action"));

  if (!v3)
    return 1;
  if (-[MOEventBundle isAggregatedAndSuppressed](self, "isAggregatedAndSuppressed"))
    return 3;
  return 2;
}

- (MOEventBundle)initWithBundleIdentifier:(id)a3 suggestionID:(id)a4 startDate:(id)a5 endDate:(id)a6 creationDate:(id)a7
{
  id v14;
  id v15;
  id v16;
  id v17;
  MOEventBundle *v18;
  id *p_isa;
  MOEventBundle *v20;
  void *v21;
  id os_log;
  NSObject *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  SEL v27;
  MOEventBundle *v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  id v37;
  NSObject *v38;
  void *v39;
  id v40;
  id v41;
  objc_super v42;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v41 = a6;
  v17 = a7;
  if (!v14)
  {
    v21 = v17;
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[MOEventBundle initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:].cold.1();

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v25 = v24;
    v26 = CFSTR("Invalid parameter not satisfying: bundleIdentifier");
    v27 = a2;
    v28 = self;
    v29 = 197;
    goto LABEL_21;
  }
  if (!v15)
  {
    v21 = v17;
    v30 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[MOEventBundle initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:].cold.2();

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v25 = v24;
    v26 = CFSTR("Invalid parameter not satisfying: suggestionID");
    v27 = a2;
    v28 = self;
    v29 = 198;
    goto LABEL_21;
  }
  if (!v16)
  {
    v21 = v17;
    v32 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[MOEventBundle initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:].cold.3();

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v25 = v24;
    v26 = CFSTR("Invalid parameter not satisfying: startDate");
    v27 = a2;
    v28 = self;
    v29 = 199;
    goto LABEL_21;
  }
  if (!v41)
  {
    v21 = v17;
    v34 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[MOEventBundle initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:].cold.4();

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v25 = v24;
    v26 = CFSTR("Invalid parameter not satisfying: endDate");
    v27 = a2;
    v28 = self;
    v29 = 200;
LABEL_21:
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", v27, v28, CFSTR("MOEventBundle.m"), v29, v26);

    v20 = 0;
    goto LABEL_22;
  }
  v40 = v17;
  if (v17)
  {
    v42.receiver = self;
    v42.super_class = (Class)MOEventBundle;
    v18 = -[MOEventBundle init](&v42, "init");
    p_isa = (id *)&v18->super.isa;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_bundleIdentifier, a3);
      objc_storeStrong(p_isa + 3, a4);
      objc_storeStrong(p_isa + 4, a5);
      objc_storeStrong(p_isa + 5, a6);
      objc_storeStrong(p_isa + 6, a7);
    }
    self = p_isa;
    v20 = self;
  }
  else
  {
    v37 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[MOEventBundle initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:].cold.5();

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventBundle.m"), 201, CFSTR("Invalid parameter not satisfying: creationDate"));

    v20 = 0;
  }
  v21 = v40;
LABEL_22:

  return v20;
}

- (MOEventBundle)initWithBundleIdentifier:(id)a3 suggestionID:(id)a4 bundleType:(id)a5 creationDate:(id)a6 firstCreationDate:(id)a7 endDate:(id)a8 expirationDate:(id)a9 events:(id)a10 filtered:(BOOL)a11 interfaceType:(unint64_t)a12 photoSource:(unint64_t)a13 promptLanguage:(id)a14 source:(unint64_t)a15 startDate:(id)a16 action:(id)a17 concurrentMediaAction:(id)a18 actions:(id)a19 persons:(id)a20 place:(id)a21 predominantWeather:(id)a22 resources:(id)a23 time:(id)a24 metaDataForRank:(id)a25 suggestionEngagements:(id)a26 suggestionEngagementViewCount:(unint64_t)a27 appEntryEngagements:(id)a28 isAggregatedAndSuppressed:(BOOL)a29 summarizationGranularity:(unint64_t)a30 places:(id)a31 subBundleIDs:(id)a32 subSuggestionIDs:(id)a33 includedInSummaryBundleOnly:(BOOL)a34 bundleSubType:(unint64_t)a35 bundleSuperType:(unint64_t)a36 photoTraits:(id)a37
{
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  MOEventBundle *v46;
  MOEventBundle *v47;
  NSArray *v48;
  NSArray *events;
  NSArray *v50;
  NSArray *actions;
  NSArray *v52;
  NSArray *persons;
  NSArray *v54;
  NSArray *resources;
  NSDictionary *v56;
  NSDictionary *metaDataForRank;
  NSMutableSet *v58;
  NSMutableSet *suggestionEngagementEvents;
  NSMutableSet *v60;
  NSMutableSet *appEntryEngagementEvents;
  NSArray *v62;
  NSArray *places;
  NSArray *v64;
  NSArray *subBundleIDs;
  NSArray *v66;
  NSArray *subSuggestionIDs;
  NSArray *v68;
  NSArray *photoTraits;
  id obj;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;

  v86 = a5;
  obj = a7;
  v85 = a7;
  v84 = a9;
  v89 = a10;
  v83 = a14;
  v82 = a17;
  v81 = a18;
  v38 = a19;
  v39 = a20;
  v80 = a21;
  v79 = a22;
  v40 = a23;
  v78 = a24;
  v41 = a25;
  v42 = a26;
  v43 = a28;
  v44 = a31;
  v45 = a32;
  v88 = a33;
  v87 = a37;
  v46 = -[MOEventBundle initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:](self, "initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:", a3, a4, a16, a8, a6);
  v47 = v46;
  if (v46)
  {
    objc_storeStrong((id *)&v46->_firstCreationDate, obj);
    objc_storeStrong((id *)&v47->_bundleType, a5);
    objc_storeStrong((id *)&v47->_expirationDate, a9);
    v48 = (NSArray *)objc_msgSend(v89, "copy");
    events = v47->_events;
    v47->_events = v48;

    v47->_filtered = a11;
    v47->_interfaceType = a12;
    v47->_photoSource = a13;
    objc_storeStrong((id *)&v47->_promptLanguage, a14);
    v47->_source = a15;
    objc_storeStrong((id *)&v47->_action, a17);
    objc_storeStrong((id *)&v47->_concurrentMediaAction, a18);
    v50 = (NSArray *)objc_msgSend(v38, "copy");
    actions = v47->_actions;
    v47->_actions = v50;

    v52 = (NSArray *)objc_msgSend(v39, "copy");
    persons = v47->_persons;
    v47->_persons = v52;

    objc_storeStrong((id *)&v47->_place, a21);
    objc_storeStrong((id *)&v47->_predominantWeather, a22);
    v54 = (NSArray *)objc_msgSend(v40, "copy");
    resources = v47->_resources;
    v47->_resources = v54;

    objc_storeStrong((id *)&v47->_time, a24);
    v56 = (NSDictionary *)objc_msgSend(v41, "copy");
    metaDataForRank = v47->_metaDataForRank;
    v47->_metaDataForRank = v56;

    v58 = (NSMutableSet *)objc_msgSend(v42, "mutableCopy");
    suggestionEngagementEvents = v47->_suggestionEngagementEvents;
    v47->_suggestionEngagementEvents = v58;

    v47->_suggestionEngagementViewCount = a27;
    v60 = (NSMutableSet *)objc_msgSend(v43, "mutableCopy");
    appEntryEngagementEvents = v47->_appEntryEngagementEvents;
    v47->_appEntryEngagementEvents = v60;

    v47->_isAggregatedAndSuppressed = a29;
    v47->_summarizationGranularity = a30;
    v62 = (NSArray *)objc_msgSend(v44, "copy");
    places = v47->_places;
    v47->_places = v62;

    v64 = (NSArray *)objc_msgSend(v45, "copy");
    subBundleIDs = v47->_subBundleIDs;
    v47->_subBundleIDs = v64;

    v66 = (NSArray *)objc_msgSend(v88, "copy");
    subSuggestionIDs = v47->_subSuggestionIDs;
    v47->_subSuggestionIDs = v66;

    v47->_includedInSummaryBundleOnly = a34;
    v47->_bundleSubType = a35;
    v47->_bundleSuperType = a36;
    v68 = (NSArray *)objc_msgSend(v87, "copy");
    photoTraits = v47->_photoTraits;
    v47->_photoTraits = v68;

  }
  return v47;
}

- (MOEventBundle)initWithBundleIdentifier:(id)a3 usingBundle:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  unsigned __int8 v31;
  id v32;
  MOEventBundle *v34;
  void *v35;
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

  v5 = a4;
  v32 = a3;
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "suggestionID"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleType"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "creationDate"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstCreationDate"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "endDate"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "expirationDate"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "events"));
  v31 = objc_msgSend(v5, "filtered");
  v30 = objc_msgSend(v5, "interfaceType");
  v29 = objc_msgSend(v5, "photoSource");
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "promptLanguage"));
  v28 = objc_msgSend(v5, "source");
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startDate"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "action"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "concurrentMediaAction"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "actions"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "persons"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "place"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "predominantWeather"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resources"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "time"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metaDataForRank"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "suggestionEngagementEvents"));
  v21 = objc_msgSend(v5, "suggestionEngagementViewCount");
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appEntryEngagementEvents"));
  v19 = objc_msgSend(v5, "isAggregatedAndSuppressed");
  v16 = objc_msgSend(v5, "summarizationGranularity");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "places"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subBundleIDs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subSuggestionIDs"));
  v8 = objc_msgSend(v5, "includedInSummaryBundleOnly");
  v9 = objc_msgSend(v5, "bundleSubType");
  v10 = objc_msgSend(v5, "bundleSuperType");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "photoTraits"));

  LOBYTE(v15) = v8;
  LOBYTE(v14) = v19;
  LOBYTE(v13) = v31;
  v34 = -[MOEventBundle initWithBundleIdentifier:suggestionID:bundleType:creationDate:firstCreationDate:endDate:expirationDate:events:filtered:interfaceType:photoSource:promptLanguage:source:startDate:action:concurrentMediaAction:actions:persons:place:predominantWeather:resources:time:metaDataForRank:suggestionEngagements:suggestionEngagementViewCount:appEntryEngagements:isAggregatedAndSuppressed:summarizationGranularity:places:subBundleIDs:subSuggestionIDs:includedInSummaryBundleOnly:bundleSubType:bundleSuperType:photoTraits:](self, "initWithBundleIdentifier:suggestionID:bundleType:creationDate:firstCreationDate:endDate:expirationDate:events:filtered:interfaceType:photoSource:promptLanguage:source:startDate:action:concurrentMediaAction:actions:persons:place:predominantWeather:resources:time:metaDataForRank:suggestionEngagements:suggestionEngagementViewCount:appEntryEngagements:isAggregatedAndSuppressed:summarizationGranularity:places:subBundleIDs:subSuggestionIDs:includedInSummaryBundleOnly:bundleSubType:bundleSuperType:photoTraits:", v32, v46, v45, v44, v43, v41, v42, v40, v13, v30, v29, v39, v28,
          v37,
          v38,
          v36,
          v27,
          v26,
          v25,
          v24,
          v23,
          v35,
          v20,
          v22,
          v21,
          v18,
          v14,
          v16,
          v17,
          v6,
          v7,
          v15,
          v9,
          v10,
          v11);

  return v34;
}

- (MOEventBundle)initWithBundleIdentifier:(id)a3 bundleType:(id)a4 creationDate:(id)a5 endDate:(id)a6 expirationDate:(id)a7 events:(id)a8 filtered:(BOOL)a9 interfaceType:(unint64_t)a10 photoSource:(unint64_t)a11 promptLanguage:(id)a12 source:(unint64_t)a13 startDate:(id)a14 action:(id)a15 concurrentMediaAction:(id)a16 actions:(id)a17 persons:(id)a18 place:(id)a19 predominantWeather:(id)a20 resources:(id)a21 time:(id)a22 metaDataForRank:(id)a23 suggestionEngagements:(id)a24 suggestionEngagementViewCount:(unint64_t)a25 appEntryEngagements:(id)a26 isAggregatedAndSuppressed:(BOOL)a27 summarizationGranularity:(unint64_t)a28 places:(id)a29 subBundleIDs:(id)a30 subSuggestionIDs:(id)a31 includedInSummaryBundleOnly:(BOOL)a32 bundleSubType:(unint64_t)a33 bundleSuperType:(unint64_t)a34 photoTraits:(id)a35
{
  id v35;
  id v36;
  id v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v49;
  id v50;
  void *v52;
  void *v53;
  id v54;
  MOEventBundle *v56;
  id v58;
  id v60;
  id v62;
  id v63;
  id v64;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;

  v54 = a35;
  v50 = a31;
  v35 = a30;
  v47 = a29;
  v36 = a26;
  v37 = a23;
  v46 = a22;
  v45 = a21;
  v44 = a20;
  v43 = a19;
  v70 = a18;
  v69 = a17;
  v68 = a16;
  v67 = a15;
  v64 = a14;
  v63 = a12;
  v66 = a8;
  v62 = a7;
  v42 = a6;
  v49 = a5;
  v60 = a4;
  v58 = a3;
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", a24));
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v36));

  LOBYTE(v41) = a32;
  LOBYTE(v40) = a27;
  LOBYTE(v39) = a9;
  v56 = -[MOEventBundle initWithBundleIdentifier:suggestionID:bundleType:creationDate:firstCreationDate:endDate:expirationDate:events:filtered:interfaceType:photoSource:promptLanguage:source:startDate:action:concurrentMediaAction:actions:persons:place:predominantWeather:resources:time:metaDataForRank:suggestionEngagements:suggestionEngagementViewCount:appEntryEngagements:isAggregatedAndSuppressed:summarizationGranularity:places:subBundleIDs:subSuggestionIDs:includedInSummaryBundleOnly:bundleSubType:bundleSuperType:photoTraits:](self, "initWithBundleIdentifier:suggestionID:bundleType:creationDate:firstCreationDate:endDate:expirationDate:events:filtered:interfaceType:photoSource:promptLanguage:source:startDate:action:concurrentMediaAction:actions:persons:place:predominantWeather:resources:time:metaDataForRank:suggestionEngagements:suggestionEngagementViewCount:appEntryEngagements:isAggregatedAndSuppressed:summarizationGranularity:places:subBundleIDs:subSuggestionIDs:includedInSummaryBundleOnly:bundleSubType:bundleSuperType:photoTraits:", v58, v58, v60, v49, 0, v42, v62, v66, v39, a10, a11, v63, a13,
          v64,
          v67,
          v68,
          v69,
          v70,
          v43,
          v44,
          v45,
          v46,
          v37,
          v53,
          a25,
          v52,
          v40,
          a28,
          v47,
          v35,
          v50,
          v41,
          a33,
          a34,
          v54);

  return v56;
}

- (MOEventBundle)initWithBundleIdentifier:(id)a3 bundleType:(id)a4 creationDate:(id)a5 endDate:(id)a6 expirationDate:(id)a7 events:(id)a8 filtered:(BOOL)a9 interfaceType:(unint64_t)a10 photoSource:(unint64_t)a11 promptLanguage:(id)a12 source:(unint64_t)a13 startDate:(id)a14 action:(id)a15 concurrentMediaAction:(id)a16 actions:(id)a17 persons:(id)a18 place:(id)a19 predominantWeather:(id)a20 resources:(id)a21 time:(id)a22 metaDataForRank:(id)a23 suggestionEngagements:(id)a24 suggestionEngagementViewCount:(unint64_t)a25 appEntryEngagements:(id)a26 isAggregatedAndSuppressed:(BOOL)a27 summarizationGranularity:(unint64_t)a28 places:(id)a29 subBundleIDs:(id)a30 subSuggestionIDs:(id)a31 photoTraits:(id)a32
{
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  void *v49;
  MOEventBundle *v51;
  id v53;
  id v54;
  id v55;
  id v57;
  id v59;
  id v61;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;

  v46 = a32;
  v45 = a31;
  v32 = a30;
  v44 = a29;
  v33 = a26;
  v34 = a23;
  v43 = a22;
  v42 = a21;
  v41 = a20;
  v40 = a19;
  v55 = a18;
  v54 = a17;
  v67 = a16;
  v66 = a15;
  v65 = a14;
  v64 = a12;
  v63 = a8;
  v61 = a7;
  v59 = a6;
  v57 = a5;
  v35 = a4;
  v53 = a3;
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", a24));
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v33));

  LOBYTE(v39) = 0;
  LOBYTE(v38) = a27;
  LOBYTE(v37) = a9;
  v51 = -[MOEventBundle initWithBundleIdentifier:suggestionID:bundleType:creationDate:firstCreationDate:endDate:expirationDate:events:filtered:interfaceType:photoSource:promptLanguage:source:startDate:action:concurrentMediaAction:actions:persons:place:predominantWeather:resources:time:metaDataForRank:suggestionEngagements:suggestionEngagementViewCount:appEntryEngagements:isAggregatedAndSuppressed:summarizationGranularity:places:subBundleIDs:subSuggestionIDs:includedInSummaryBundleOnly:bundleSubType:bundleSuperType:photoTraits:](self, "initWithBundleIdentifier:suggestionID:bundleType:creationDate:firstCreationDate:endDate:expirationDate:events:filtered:interfaceType:photoSource:promptLanguage:source:startDate:action:concurrentMediaAction:actions:persons:place:predominantWeather:resources:time:metaDataForRank:suggestionEngagements:suggestionEngagementViewCount:appEntryEngagements:isAggregatedAndSuppressed:summarizationGranularity:places:subBundleIDs:subSuggestionIDs:includedInSummaryBundleOnly:bundleSubType:bundleSuperType:photoTraits:", v53, v53, v35, v57, 0, v59, v61, v63, v37, a10, a11, v64, a13,
          v65,
          v66,
          v67,
          v54,
          v55,
          v40,
          v41,
          v42,
          v43,
          v34,
          v49,
          a25,
          v47,
          v38,
          a28,
          v44,
          v32,
          v45,
          v39,
          0,
          0,
          v46);

  return v51;
}

- (MOEventBundle)initWithBundleIdentifier:(id)a3 creationDate:(id)a4
{
  return -[MOEventBundle initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:](self, "initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:", a3, a3, a4, a4, a4);
}

- (id)getBundleType
{
  return +[MOEventBundle getInterfaceTypeString:superType:](MOEventBundle, "getInterfaceTypeString:superType:", -[MOEventBundle interfaceType](self, "interfaceType"), -[MOEventBundle bundleSuperType](self, "bundleSuperType"));
}

+ (id)getInterfaceTypeString:(unint64_t)a3 superType:(unint64_t)a4
{
  id result;
  __CFString *v5;

  switch(a3)
  {
    case 1uLL:
      result = CFSTR("activity");
      break;
    case 2uLL:
      result = CFSTR("outing");
      break;
    case 3uLL:
      result = CFSTR("photo_moment");
      break;
    case 4uLL:
      result = CFSTR("significant_contact");
      break;
    case 5uLL:
      result = CFSTR("media");
      break;
    case 6uLL:
      result = CFSTR("shared_content");
      break;
    case 7uLL:
      result = CFSTR("time_at_home");
      break;
    case 8uLL:
      result = CFSTR("topics_of_interest");
      break;
    case 9uLL:
      if (a4)
      {
        v5 = CFSTR("workoutTrend");
        if (a4 == 3)
          v5 = CFSTR("conversationTrend");
        result = v5;
      }
      else
      {
        result = CFSTR("trend");
      }
      break;
    case 0xAuLL:
      result = CFSTR("photo_memory");
      break;
    case 0xBuLL:
      result = CFSTR("evergreen");
      break;
    case 0xCuLL:
      result = CFSTR("timeContext");
      break;
    case 0xDuLL:
      result = CFSTR("trip");
      break;
    case 0xEuLL:
      result = CFSTR("state_of_mind");
      break;
    case 0xFuLL:
      result = CFSTR("clustering");
      break;
    default:
      result = CFSTR("unknown");
      break;
  }
  return result;
}

- (id)getSuperTypeString
{
  unint64_t v2;

  v2 = -[MOEventBundle bundleSuperType](self, "bundleSuperType");
  if (v2 - 1 > 8)
    return CFSTR("unknown");
  else
    return *(&off_1002B1140 + v2 - 1);
}

- (id)getSubTypeString
{
  uint64_t v2;
  id result;
  __CFString *v4;
  __CFString *v5;
  BOOL v6;

  v2 = -[MOEventBundle bundleSubType](self, "bundleSubType");
  result = CFSTR("unknown");
  if (v2 <= 600)
  {
    if (v2 <= 301)
    {
      switch(v2)
      {
        case 201:
          result = CFSTR("workout");
          break;
        case 202:
          result = CFSTR("workout_weekly_summary");
          break;
        case 203:
          result = CFSTR("workout_routine");
          break;
        case 204:
          result = CFSTR("motion_activity_walking");
          break;
        case 205:
          result = CFSTR("workout_transit");
          break;
        case 206:
          result = CFSTR("motion_activity_transit");
          break;
        case 207:
          result = CFSTR("motion_activity_running");
          break;
        case 208:
          result = CFSTR("motion_activity_mixed_running_walking");
          break;
        default:
          switch(v2)
          {
            case 'e':
              result = CFSTR("visit");
              break;
            case 'f':
              result = CFSTR("flight");
              break;
            case 'g':
              result = CFSTR("dining");
              break;
            case 'h':
              result = CFSTR("shopping");
              break;
            case 'i':
              result = CFSTR("trip");
              break;
            case 'j':
              result = CFSTR("pre_onboarded_visit");
              break;
            default:
              if (v2 == 301)
                result = CFSTR("contact");
              break;
          }
          break;
      }
    }
    else if (v2 > 500)
    {
      switch(v2)
      {
        case 501:
          result = CFSTR("time_at_home");
          break;
        case 502:
          result = CFSTR("photos_at_home");
          break;
        case 503:
          result = CFSTR("hosting_at_home");
          break;
        case 504:
          result = CFSTR("evergreen_at_home");
          break;
        default:
          return result;
      }
    }
    else
    {
      switch(v2)
      {
        case 401:
          result = CFSTR("song_on_repeat");
          break;
        case 402:
          result = CFSTR("played_song");
          break;
        case 403:
          result = CFSTR("played_podcast");
          break;
        case 404:
          result = CFSTR("media_on_repeat_weekly_summary");
          break;
        case 405:
          result = CFSTR("played_media_weekly_summary");
          break;
        case 406:
          result = CFSTR("media_suppressed");
          break;
        case 407:
          result = CFSTR("media_on_repeat_third_party");
          break;
        case 408:
          result = CFSTR("played_media_third_party");
          break;
        case 409:
          result = CFSTR("media_on_repeat_weekly_summary_third_party");
          break;
        case 410:
          result = CFSTR("played_media_weekly_summary_third_party");
          break;
        default:
          v4 = CFSTR("contact_weekly_summary");
          v5 = CFSTR("contact_trend");
          if (v2 != 303)
            v5 = CFSTR("unknown");
          v6 = v2 == 302;
LABEL_25:
          if (v6)
            result = v4;
          else
            result = v5;
          break;
      }
    }
  }
  else if (v2 <= 800)
  {
    switch(v2)
    {
      case 601:
        result = CFSTR("photo_memory_single_moment");
        break;
      case 602:
        result = CFSTR("photo_memory_person");
        break;
      case 603:
        result = CFSTR("photo_memory_social_group");
        break;
      case 604:
        result = CFSTR("photo_memory_last_month_at_home");
        break;
      case 605:
        result = CFSTR("photo_memory_lookbacks");
        break;
      case 606:
        result = CFSTR("photo_memory_foodie");
        break;
      case 607:
        result = CFSTR("photo_memory_pet");
        break;
      case 608:
        result = CFSTR("photo_memory_location");
        break;
      case 609:
        result = CFSTR("photo_memory_meaningful_event");
        break;
      case 610:
        result = CFSTR("photo_memory_trip");
        break;
      case 611:
        result = CFSTR("photo_memory_past_super_set");
        break;
      case 612:
        result = CFSTR("photo_memory_season");
        break;
      case 613:
        result = CFSTR("photo_memory_recent_highlights");
        break;
      case 614:
        result = CFSTR("photo_memory_family");
        break;
      case 615:
        result = CFSTR("photo_memory_exciting_moments");
        break;
      case 616:
        result = CFSTR("photo_memory_trends");
        break;
      case 617:
        result = CFSTR("photo_memory_others");
        break;
      default:
        switch(v2)
        {
          case 701:
          case 707:
            result = CFSTR("evergreen_gratitude");
            break;
          case 702:
            result = CFSTR("evergreen_wisdom");
            break;
          case 703:
            result = CFSTR("evergreen_resillience");
            break;
          case 704:
            result = CFSTR("evergreen_creativity");
            break;
          case 705:
            result = CFSTR("evergreen_kindness");
            break;
          case 706:
          case 709:
            result = CFSTR("evergreen_purpose");
            break;
          case 708:
            result = CFSTR("evergreen_resilience");
            break;
          default:
            return result;
        }
        break;
    }
  }
  else
  {
    switch(v2)
    {
      case 901:
        result = CFSTR("clustering_outing_routine");
        break;
      case 902:
        result = CFSTR("clustering_activity_routine");
        break;
      case 903:
        result = CFSTR("clustering_contact_routine");
        break;
      case 904:
        result = CFSTR("clustering_time_at_home_routine");
        break;
      case 905:
        result = CFSTR("clustering_location_grouping");
        break;
      case 906:
        result = CFSTR("clustering_activity_grouping");
        break;
      case 907:
        result = CFSTR("clustering_contact_grouping");
        break;
      case 908:
        result = CFSTR("clustering_thematic_grouping");
        break;
      case 909:
        result = CFSTR("clustering_time_at_home_grouping");
        break;
      case 910:
        result = CFSTR("clustering_unspecified_grouping");
        break;
      default:
        v4 = CFSTR("daily_mood");
        v5 = CFSTR("momentary_emotion");
        if (v2 != 802)
          v5 = CFSTR("unknown");
        v6 = v2 == 801;
        goto LABEL_25;
    }
  }
  return result;
}

- (unint64_t)getInterfaceTypeEnum:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("activity")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("outing")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("photo_moment")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("significant_contact")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("media")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("shared_content")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("time_at_home")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("evergreen")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("topics_of_interest")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("trend")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("workoutTrend")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("conversationTrend")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("photo_memory")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("timeContext")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("trip")) & 1) != 0)
  {
    v4 = 13;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("state_of_mind")))
  {
    v4 = 14;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)description
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  unint64_t v32;
  const __CFString *v33;
  const __CFString *v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
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
  void *v55;
  void *v56;
  void *v57;

  v41 = objc_autoreleasePoolPush();
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle bundleIdentifier](self, "bundleIdentifier"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle suggestionID](self, "suggestionID"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle subSuggestionIDs](self, "subSuggestionIDs"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](self, "startDate"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](self, "endDate"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle creationDate](self, "creationDate"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle expirationDate](self, "expirationDate"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle firstCreationDate](self, "firstCreationDate"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle displayStartDate](self, "displayStartDate"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle displayEndDate](self, "displayEndDate"));
  v38 = -[MOEventBundle source](self, "source");
  v37 = -[MOEventBundle interfaceType](self, "interfaceType");
  v36 = -[MOEventBundle bundleSubType](self, "bundleSubType");
  v35 = -[MOEventBundle bundleSuperType](self, "bundleSuperType");
  if (-[MOEventBundle filtered](self, "filtered"))
    v3 = CFSTR("Yes");
  else
    v3 = CFSTR("No");
  v34 = v3;
  if (-[MOEventBundle isAggregatedAndSuppressed](self, "isAggregatedAndSuppressed"))
    v4 = CFSTR("Yes");
  else
    v4 = CFSTR("No");
  v33 = v4;
  v32 = -[MOEventBundle summarizationGranularity](self, "summarizationGranularity");
  if (-[MOEventBundle includedInSummaryBundleOnly](self, "includedInSummaryBundleOnly"))
    v5 = CFSTR("Yes");
  else
    v5 = CFSTR("No");
  v28 = v5;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle promptLanguage](self, "promptLanguage"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "mask"));
  v29 = -[MOEventBundle photoSource](self, "photoSource");
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle photoTraits](self, "photoTraits"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle action](self, "action"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle concurrentMediaAction](self, "concurrentMediaAction"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](self, "place"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle time](self, "time"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle predominantWeather](self, "predominantWeather"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle actions](self, "actions"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle persons](self, "persons"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle places](self, "places"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle subBundleIDs](self, "subBundleIDs"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle metaData](self, "metaData"));
  v18 = objc_msgSend(v31, "count");
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](self, "events"));
  v17 = objc_msgSend(v30, "count");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle labels](self, "labels"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle promptLanguages](self, "promptLanguages"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle _allResourcesImpl](self, "_allResourcesImpl"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle metaData](self, "metaData"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "allKeys"));
  v6 = objc_msgSend(v22, "count");
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle metaData](self, "metaData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "allKeys"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle metaDataForRank](self, "metaDataForRank"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "allKeys"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle rankingDictionary](self, "rankingDictionary"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle suggestionEngagementEvents](self, "suggestionEngagementEvents"));
  v11 = -[MOEventBundle suggestionEngagementViewCount](self, "suggestionEngagementViewCount");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle appEntryEngagementEvents](self, "appEntryEngagementEvents"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<MOEventBundle bundleIdentifier, %@, suggestionID, %@, sub Suggestion IDs, %@, startDate, %@, endDate, %@, creationDate, %@, expirationDate, %@, firstCreationDate, %@, displayStartDate, %@, displayEndDate, %@, source, %lu, interfaceType, %lu, bundleSubType, %lu, bundleSuperType, %lu, filtered, %@, agg./suppressed, %@, sum. granularity, %lu, includedInSummaryOnly, %@, promptLanguage, %@, photoSource, %lu, traits, %@, action, %@, concurrentMediaAction, %@, place, %@, time, %@, predominantWeather %@, actions, %@, persons, %@, places, %@, sub bundle IDs, %@, metaData.count, %lu,  events.count, %lu, labels, %@, prompts, %@, allResources, %@, meta, %lu, meta keywords, %@, metaDataForRank, %@, rankings, %@, suggestionEngagements, %@, suggestionEngagementViewCount, %lu, appEntryEngagementEvents %@>"), v56, v55, v57, v54, v53, v52, v51, v50, v48, v47, v38, v37, v36, v35, v34,
                    v33,
                    v32,
                    v28,
                    v49,
                    v29,
                    v46,
                    v44,
                    v45,
                    v43,
                    v27,
                    v42,
                    v26,
                    v25,
                    v16,
                    v23,
                    v18,
                    v17,
                    v15,
                    v19,
                    v14,
                    v6,
                    v7,
                    v8,
                    v9,
                    v10,
                    v11,
                    v12));

  objc_autoreleasePoolPop(v41);
  return v40;
}

- (MOEventBundle)initWithEventSet:(id)a3 filtered:(BOOL)a4
{
  id v6;
  void *v7;
  void *v8;
  MOEventBundle *v9;
  uint64_t v10;
  NSArray *events;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v9 = -[MOEventBundle initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:](self, "initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:", v8, v8, v7, v7, v7);
  if (v9)
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
    events = v9->_events;
    v9->_events = (NSArray *)v10;

    v9->_filtered = a4;
    -[MOEventBundle setPropertiesBasedOnEvents](v9, "setPropertiesBasedOnEvents");
  }

  return v9;
}

- (NSSet)getCategories
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](self, "events"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "valueForKeyPath:", CFSTR("@distinctUnionOfObjects.category")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v3));

  return (NSSet *)v4;
}

- (void)setPropertiesBasedOnEvents
{
  NSDate *v3;
  NSDate *startDate;
  NSDate *v5;
  NSDate *endDate;
  NSDate *v7;
  NSDate *expirationDate;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  NSDate *v15;
  void *v16;
  void *v17;
  NSDate *v18;
  NSDate *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  NSDate *v23;
  NSDate *v24;
  NSDate *v25;
  void *v26;
  void *v27;
  NSDate *v28;
  NSDate *v29;
  unint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v3 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  startDate = self->_startDate;
  self->_startDate = v3;

  v5 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
  endDate = self->_endDate;
  self->_endDate = v5;

  v7 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  expirationDate = self->_expirationDate;
  self->_expirationDate = v7;

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](self, "events", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v15 = self->_startDate;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "startDate"));
        LODWORD(v15) = -[NSDate isAfterDate:](v15, "isAfterDate:", v16);

        if ((_DWORD)v15)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "startDate"));
          v18 = (NSDate *)objc_msgSend(v17, "copy");
          v19 = self->_startDate;
          self->_startDate = v18;

        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "endDate"));
        v21 = objc_msgSend(v20, "isAfterDate:", self->_endDate);

        if (v21)
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "endDate"));
          v23 = (NSDate *)objc_msgSend(v22, "copy");
          v24 = self->_endDate;
          self->_endDate = v23;

        }
        v25 = self->_expirationDate;
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "expirationDate"));
        LODWORD(v25) = -[NSDate isAfterDate:](v25, "isAfterDate:", v26);

        if ((_DWORD)v25)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "expirationDate"));
          v28 = (NSDate *)objc_msgSend(v27, "copy");
          v29 = self->_expirationDate;
          self->_expirationDate = v28;

        }
        v30 = (unint64_t)objc_msgSend(v14, "provider") - 1;
        if (v30 <= 0xA)
          self->_source |= qword_10029EED0[v30];
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v11);
  }

}

- (void)addBackgroundAction:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle backgroundActions](self, "backgroundActions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v4));

  if (v6)
    objc_msgSend(v5, "addObject:", v6);
  -[MOEventBundle setBackgroundActions:](self, "setBackgroundActions:", v5);

}

- (void)addAction:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle actions](self, "actions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v4));

  if (v6)
    objc_msgSend(v5, "addObject:", v6);
  -[MOEventBundle setActions:](self, "setActions:", v5);

}

- (unint64_t)bundleManagementPolicy
{
  return (id)-[MOEventBundle interfaceType](self, "interfaceType") == (id)13
      || (id)-[MOEventBundle interfaceType](self, "interfaceType") == (id)11
      || (id)-[MOEventBundle interfaceType](self, "interfaceType") == (id)10;
}

- (id)localStartDate
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v3 = objc_claimAutoreleasedReturnValue(-[MOEventBundle time](self, "time"));
  if (v3
    && (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle time](self, "time")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timeZone")),
        v6,
        v5,
        v4,
        v6))
  {
    v7 = objc_alloc((Class)NSTimeZone);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle time](self, "time"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "timeZone"));
    v10 = objc_msgSend(v7, "initWithName:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](self, "startDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime localTimeOfDate:timeZone:](MOTime, "localTimeOfDate:timeZone:", v11, v10));

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](self, "startDate"));
  }
  return v12;
}

- (id)localEndDate
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v3 = objc_claimAutoreleasedReturnValue(-[MOEventBundle time](self, "time"));
  if (v3
    && (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle time](self, "time")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timeZone")),
        v6,
        v5,
        v4,
        v6))
  {
    v7 = objc_alloc((Class)NSTimeZone);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle time](self, "time"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "timeZone"));
    v10 = objc_msgSend(v7, "initWithName:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](self, "endDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime localTimeOfDate:timeZone:](MOTime, "localTimeOfDate:timeZone:", v11, v10));

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](self, "endDate"));
  }
  return v12;
}

- (id)displayStartDate
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  void *j;
  void *v38;
  double v39;
  double v40;
  void *v41;
  id v42;
  const __CFString *v43;
  uint64_t v44;
  void *v45;
  id v46;
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
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];

  if ((id)-[MOEventBundle bundleSubType](self, "bundleSubType") == (id)202
    || (id)-[MOEventBundle bundleSubType](self, "bundleSubType") == (id)404
    || (id)-[MOEventBundle bundleSubType](self, "bundleSubType") == (id)405)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](self, "events"));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v56 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v9, "category") == (id)2 || objc_msgSend(v9, "category") == (id)4)
            && objc_msgSend(v9, "provider") != (id)5)
          {
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startDate"));
            v11 = objc_msgSend(v3, "isAfterDate:", v10);

            if (v11)
            {
              v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startDate"));

              v3 = (void *)v12;
            }
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
      }
      while (v6);
    }

    v13 = objc_claimAutoreleasedReturnValue(-[MOEventBundle time](self, "time"));
    if (v13
      && (v14 = (void *)v13,
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle time](self, "time")),
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "timeZone")),
          v16,
          v15,
          v14,
          v16))
    {
      v17 = objc_alloc((Class)NSTimeZone);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle time](self, "time"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "timeZone"));
      v20 = objc_msgSend(v17, "initWithName:", v19);

      v21 = (id)objc_claimAutoreleasedReturnValue(+[MOTime localTimeOfDate:timeZone:](MOTime, "localTimeOfDate:timeZone:", v3, v20));
    }
    else
    {
      v21 = v3;
    }

  }
  else if ((id)-[MOEventBundle bundleSubType](self, "bundleSubType") == (id)203)
  {
    v21 = (id)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](self, "startDate"));
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](self, "events"));
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v52;
      v27 = CFSTR("kEventResourcePatternWorkoutInfoDictArray");
      v44 = *(_QWORD *)v52;
      v45 = v23;
      v43 = CFSTR("kEventResourcePatternWorkoutInfoDictArray");
      do
      {
        v28 = 0;
        v46 = v25;
        do
        {
          if (*(_QWORD *)v52 != v26)
            objc_enumerationMutation(v23);
          v29 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)v28);
          if (objc_msgSend(v29, "provider", v43, v44, v45) == (id)5 && objc_msgSend(v29, "category") == (id)2)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "patterns"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", v27));

            if (v31)
            {
              v49 = 0u;
              v50 = 0u;
              v47 = 0u;
              v48 = 0u;
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "patterns"));
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", v27));

              v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
              if (v34)
              {
                v35 = v34;
                v36 = *(_QWORD *)v48;
                do
                {
                  for (j = 0; j != v35; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v48 != v36)
                      objc_enumerationMutation(v33);
                    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)j), "objectForKeyedSubscript:", CFSTR("kEventResourcePatternWorkoutStartDate")));
                    objc_msgSend(v38, "doubleValue");
                    v40 = v39;

                    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", v40));
                    if (objc_msgSend(v21, "isAfterDate:", v41))
                    {
                      v42 = v41;

                      v21 = v42;
                    }

                  }
                  v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
                }
                while (v35);
              }

              v26 = v44;
              v23 = v45;
              v27 = v43;
            }
            v25 = v46;
          }
          v28 = (char *)v28 + 1;
        }
        while (v28 != v25);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      }
      while (v25);
    }

  }
  else
  {
    v21 = (id)objc_claimAutoreleasedReturnValue(-[MOEventBundle localStartDate](self, "localStartDate"));
  }
  return v21;
}

- (id)displayEndDate
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  void *j;
  void *v38;
  double v39;
  double v40;
  void *v41;
  id v42;
  const __CFString *v43;
  uint64_t v44;
  void *v45;
  id v46;
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
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];

  if ((id)-[MOEventBundle bundleSubType](self, "bundleSubType") == (id)202
    || (id)-[MOEventBundle bundleSubType](self, "bundleSubType") == (id)404
    || (id)-[MOEventBundle bundleSubType](self, "bundleSubType") == (id)405)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](self, "events"));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v56 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v9, "category") == (id)2 || objc_msgSend(v9, "category") == (id)4)
            && objc_msgSend(v9, "provider") != (id)5)
          {
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endDate"));
            v11 = objc_msgSend(v3, "isBeforeDate:", v10);

            if (v11)
            {
              v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endDate"));

              v3 = (void *)v12;
            }
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
      }
      while (v6);
    }

    v13 = objc_claimAutoreleasedReturnValue(-[MOEventBundle time](self, "time"));
    if (v13
      && (v14 = (void *)v13,
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle time](self, "time")),
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "timeZone")),
          v16,
          v15,
          v14,
          v16))
    {
      v17 = objc_alloc((Class)NSTimeZone);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle time](self, "time"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "timeZone"));
      v20 = objc_msgSend(v17, "initWithName:", v19);

      v21 = (id)objc_claimAutoreleasedReturnValue(+[MOTime localTimeOfDate:timeZone:](MOTime, "localTimeOfDate:timeZone:", v3, v20));
    }
    else
    {
      v21 = v3;
    }

  }
  else if ((id)-[MOEventBundle bundleSubType](self, "bundleSubType") == (id)203)
  {
    v21 = (id)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](self, "endDate"));
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](self, "events"));
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v52;
      v27 = CFSTR("kEventResourcePatternWorkoutInfoDictArray");
      v44 = *(_QWORD *)v52;
      v45 = v23;
      v43 = CFSTR("kEventResourcePatternWorkoutInfoDictArray");
      do
      {
        v28 = 0;
        v46 = v25;
        do
        {
          if (*(_QWORD *)v52 != v26)
            objc_enumerationMutation(v23);
          v29 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)v28);
          if (objc_msgSend(v29, "provider", v43, v44, v45) == (id)5 && objc_msgSend(v29, "category") == (id)2)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "patterns"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKey:", v27));

            if (v31)
            {
              v49 = 0u;
              v50 = 0u;
              v47 = 0u;
              v48 = 0u;
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "patterns"));
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", v27));

              v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
              if (v34)
              {
                v35 = v34;
                v36 = *(_QWORD *)v48;
                do
                {
                  for (j = 0; j != v35; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v48 != v36)
                      objc_enumerationMutation(v33);
                    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)j), "objectForKeyedSubscript:", CFSTR("kEventResourcePatternWorkoutEndDate")));
                    objc_msgSend(v38, "doubleValue");
                    v40 = v39;

                    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", v40));
                    if (objc_msgSend(v21, "isBeforeDate:", v41))
                    {
                      v42 = v41;

                      v21 = v42;
                    }

                  }
                  v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
                }
                while (v35);
              }

              v26 = v44;
              v23 = v45;
              v27 = v43;
            }
            v25 = v46;
          }
          v28 = (char *)v28 + 1;
        }
        while (v28 != v25);
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      }
      while (v25);
    }

  }
  else
  {
    v21 = (id)objc_claimAutoreleasedReturnValue(-[MOEventBundle localEndDate](self, "localEndDate"));
  }
  return v21;
}

- (void)addPerson:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle persons](self, "persons"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v4));

  if (v6)
    objc_msgSend(v5, "addObject:", v6);
  -[MOEventBundle setPersons:](self, "setPersons:", v5);

}

- (void)addResource:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](self, "resources"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v4));

  if (v6)
    objc_msgSend(v5, "addObject:", v6);
  -[MOEventBundle setResources:](self, "setResources:", v5);

}

- (void)addPhotoTraits:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle photoTraits](self, "photoTraits"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v4));

  if (objc_msgSend(v5, "count"))
    objc_msgSend(v5, "addObjectsFromArray:", v6);
  -[MOEventBundle setPhotoTraits:](self, "setPhotoTraits:", v5);

}

- (void)addResources:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](self, "resources"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v4));

  if (objc_msgSend(v6, "count"))
    objc_msgSend(v5, "addObjectsFromArray:", v6);
  -[MOEventBundle setResources:](self, "setResources:", v5);

}

- (void)addMetaDataForRankForKey:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle metaDataForRank](self, "metaDataForRank"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v8));

  objc_msgSend(v10, "setObject:forKey:", v6, v7);
  v9 = objc_msgSend(v10, "copy");
  -[MOEventBundle setMetaDataForRank:](self, "setMetaDataForRank:", v9);

}

- (id)_allResourcesImpl
{
  NSMutableArray *v3;
  _QWORD v5[4];
  NSMutableArray *v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __34__MOEventBundle__allResourcesImpl__block_invoke;
  v5[3] = &unk_1002B10F8;
  v3 = objc_opt_new(NSMutableArray);
  v6 = v3;
  -[MOEventBundle withResourcesUsingBlock:](self, "withResourcesUsingBlock:", v5);

  return v3;
}

id __34__MOEventBundle__allResourcesImpl__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)withResourcesUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  MOResource *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  MOResource *v24;
  void *v25;
  MOResource *v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  MOResource *v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  MOResource *v42;
  void *v43;
  MOResource *v44;
  void *v45;
  void *v46;
  MOEventBundle *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  id v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  char v62;
  _BYTE v63[128];
  _BYTE v64[128];

  v4 = a3;
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  v47 = self;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](self, "resources"));
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472;
  v56[2] = __41__MOEventBundle_withResourcesUsingBlock___block_invoke;
  v56[3] = &unk_1002B1120;
  v6 = v4;
  v57 = v6;
  v58 = &v59;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v56);

  if (!*((_BYTE *)v60 + 24))
  {
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle persons](v47, "persons"));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v53;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v53 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v10);
        v12 = objc_autoreleasePoolPush();
        v13 = -[MOResource initWithPerson:]([MOResource alloc], "initWithPerson:", v11);
        v15 = 1;
        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sourceEventIdentifier"));
          -[MOResource setSourceEventIdentifier:](v13, "setSourceEventIdentifier:", v14);

          (*((void (**)(id, MOResource *, uint64_t *))v6 + 2))(v6, v13, v60 + 3);
          if (*((_BYTE *)v60 + 24))
            v15 = 0;
        }

        objc_autoreleasePoolPop(v12);
        if (!v15)
          goto LABEL_45;
        if (v8 == (id)++v10)
        {
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
          if (v8)
            goto LABEL_4;
          break;
        }
      }
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v47, "place"));
    if (!v16)
      goto LABEL_25;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle places](v47, "places"));
    v18 = objc_msgSend(v17, "count") == 0;

    if (!v18)
      goto LABEL_25;
    v19 = objc_autoreleasePoolPush();
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v47, "place"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "startDate"));

    if (!v21)
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v47, "startDate"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v47, "place"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "endDate"));

    if (!v23)
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](v47, "endDate"));
    v24 = [MOResource alloc];
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v47, "place"));
    v26 = -[MOResource initWithPlace:startDate:endDate:](v24, "initWithPlace:startDate:endDate:", v25, v21, v23);

    if (!v26)
      goto LABEL_23;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v47, "place"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "sourceEventIdentifier"));
    -[MOResource setSourceEventIdentifier:](v26, "setSourceEventIdentifier:", v28);

    (*((void (**)(id, MOResource *, uint64_t *))v6 + 2))(v6, v26, v60 + 3);
    if (*((_BYTE *)v60 + 24))
      v29 = 0;
    else
LABEL_23:
      v29 = 1;

    objc_autoreleasePoolPop(v19);
    if (v29)
    {
LABEL_25:
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle places](v47, "places"));
      v30 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
      if (v30)
      {
        v31 = *(_QWORD *)v49;
LABEL_27:
        v32 = 0;
        while (1)
        {
          if (*(_QWORD *)v49 != v31)
            objc_enumerationMutation(v7);
          v33 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v32);
          v34 = objc_autoreleasePoolPush();
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "startDate"));
          if (!v35)
            v35 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v47, "startDate"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "endDate"));
          if (!v36)
            v36 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](v47, "endDate"));
          v37 = -[MOResource initWithPlace:startDate:endDate:]([MOResource alloc], "initWithPlace:startDate:endDate:", v33, v35, v36);
          v39 = 1;
          if (v37)
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "sourceEventIdentifier"));
            -[MOResource setSourceEventIdentifier:](v37, "setSourceEventIdentifier:", v38);

            (*((void (**)(id, MOResource *, uint64_t *))v6 + 2))(v6, v37, v60 + 3);
            if (*((_BYTE *)v60 + 24))
              v39 = 0;
          }

          objc_autoreleasePoolPop(v34);
          if (!v39)
            break;
          if (v30 == (id)++v32)
          {
            v30 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
            if (v30)
              goto LABEL_27;
            goto LABEL_41;
          }
        }
LABEL_45:

        goto LABEL_46;
      }
LABEL_41:

      v40 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle predominantWeather](v47, "predominantWeather"));
      if (v40)
      {
        v41 = objc_autoreleasePoolPush();
        v42 = [MOResource alloc];
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle predominantWeather](v47, "predominantWeather"));
        v44 = -[MOResource initWithWeather:](v42, "initWithWeather:", v43);

        if (v44)
        {
          v45 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle predominantWeather](v47, "predominantWeather"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "sourceEventIdentifier"));
          -[MOResource setSourceEventIdentifier:](v44, "setSourceEventIdentifier:", v46);

          (*((void (**)(id, MOResource *, uint64_t *))v6 + 2))(v6, v44, v60 + 3);
        }

        objc_autoreleasePoolPop(v41);
      }
    }
  }
LABEL_46:

  _Block_object_dispose(&v59, 8);
}

uint64_t __41__MOEventBundle_withResourcesUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *a4;
  return result;
}

- (void)buildResources
{
  MOResource *v2;
  void *v3;
  id v4;
  NSMutableArray *v6;
  void *v7;
  id v8;
  void **p_vtable;
  id v10;
  int v11;
  void *i;
  void *v13;
  MOResource *v14;
  void *v15;
  double v16;
  MOEventBundle *v17;
  id v18;
  id v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  MOResource *v31;
  void *v32;
  MOResource *v33;
  void *v34;
  void *v35;
  double v36;
  id v37;
  id v38;
  uint64_t v39;
  void *j;
  void *v41;
  double v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  BOOL v48;
  id v49;
  void *v50;
  MOResource *v51;
  void *v52;
  double v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  double v60;
  void *v61;
  id v62;
  id v63;
  uint64_t v64;
  void *k;
  void *v66;
  double v67;
  MOEventBundle *v68;
  id obj;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];

  v6 = objc_opt_new(NSMutableArray);
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v68 = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle persons](self, "persons"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
  p_vtable = &OBJC_METACLASS___MOSignificantContactManager.vtable;
  if (v8)
  {
    v10 = v8;
    v11 = 0;
    v4 = *(id *)v79;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(id *)v79 != v4)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)i);
        v14 = -[MOResource initWithPerson:]([MOResource alloc], "initWithPerson:", v13);
        v2 = v14;
        if (v14)
        {
          v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOResource identifier](v14, "identifier"));

          if (v3)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sourceEventIdentifier"));
            -[MOResource setSourceEventIdentifier:](v2, "setSourceEventIdentifier:", v15);

            -[MOResource priorityScore](v2, "priorityScore");
            if (v16 <= 0.0)
              -[MOResource setPriorityScore:](v2, "setPriorityScore:", (double)v11++ + 10000.0);
            -[NSMutableArray addObject:](v6, "addObject:", v2);
          }
        }

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  v17 = v68;
  if ((id)-[MOEventBundle interfaceType](v68, "interfaceType") != (id)7)
  {
    v18 = -[MOEventBundle interfaceType](v68, "interfaceType");
    if (v18 == (id)1)
    {
      obj = (id)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v68, "place"));
      if (objc_msgSend(obj, "placeUserType") == (id)1)
      {
LABEL_84:

        goto LABEL_85;
      }
    }
    v19 = -[MOEventBundle interfaceType](v68, "interfaceType");
    if (v19 == (id)1)
    {
      v2 = (MOResource *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v68, "place"));
      if ((id)-[MOResource placeUserType](v2, "placeUserType") == (id)2)
      {
        v20 = 0;
        goto LABEL_35;
      }
    }
    v4 = -[MOEventBundle interfaceType](v68, "interfaceType");
    if (v4 == (id)12)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v68, "place"));
      if (objc_msgSend(v3, "placeUserType") == (id)1)
      {
        v20 = 0;
LABEL_29:

        goto LABEL_34;
      }
      if ((id)-[MOEventBundle interfaceType](v68, "interfaceType") == (id)12)
      {
LABEL_27:
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v68, "place"));
        v20 = objc_msgSend(v21, "placeUserType") != (id)2;

        if (v4 != (id)12)
        {
          v17 = v68;
          if (v19 != (id)1)
          {
LABEL_36:
            if (v18 == (id)1)
            {

              if (!v20)
                goto LABEL_85;
            }
            else if (!v20)
            {
              goto LABEL_85;
            }
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v17, "place"));
            objc_msgSend(v22, "priorityScore");
            if (v23 < 20000.0)
            {
              v24 = objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v17, "place"));
              if (v24)
              {
                v25 = (void *)v24;
                v26 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle places](v17, "places"));
                v27 = objc_msgSend(v26, "count");

                if (v27)
                {
LABEL_53:
                  v76 = 0u;
                  v77 = 0u;
                  v74 = 0u;
                  v75 = 0u;
                  obj = (id)objc_claimAutoreleasedReturnValue(-[MOEventBundle places](v17, "places"));
                  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
                  if (!v37)
                    goto LABEL_84;
                  v38 = v37;
                  v39 = *(_QWORD *)v75;
                  while (1)
                  {
                    for (j = 0; j != v38; j = (char *)j + 1)
                    {
                      if (*(_QWORD *)v75 != v39)
                        objc_enumerationMutation(obj);
                      v41 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)j);
                      objc_msgSend(v41, "priorityScore");
                      if (v42 < 20000.0)
                      {
                        v43 = -[MOEventBundle interfaceType](v17, "interfaceType");
                        if (v43 == (id)12)
                        {
                          v4 = (id)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v17, "place"));
                          if (objc_msgSend(v4, "placeUserType") == (id)1)
                          {
                            v44 = v4;
LABEL_81:

                            continue;
                          }
                          if ((id)-[MOEventBundle interfaceType](v17, "interfaceType") == (id)12)
                          {
LABEL_65:
                            v45 = v4;
                            v46 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v17, "place"));
                            v47 = objc_msgSend(v46, "placeUserType");

                            if (v43 == (id)12)
                            {

                              v48 = v47 == (id)2;
                              v4 = v45;
                              v17 = v68;
                              if (v48)
                                goto LABEL_70;
                            }
                            else
                            {
                              v48 = v47 == (id)2;
                              v17 = v68;
                              v4 = v45;
                              if (v48)
                              {
LABEL_70:
                                p_vtable = (void **)(&OBJC_METACLASS___MOSignificantContactManager + 24);
                                continue;
                              }
                            }
                          }
                          else
                          {

                          }
                        }
                        else if ((id)-[MOEventBundle interfaceType](v17, "interfaceType") == (id)12)
                        {
                          goto LABEL_65;
                        }
                        v49 = v4;
                        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "startDate"));
                        if (!v44)
                          v44 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v17, "startDate"));
                        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "endDate"));
                        if (!v50)
                          v50 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](v17, "endDate"));
                        v51 = -[MOResource initWithPlace:startDate:endDate:]([MOResource alloc], "initWithPlace:startDate:endDate:", v41, v44, v50);
                        if (v51)
                        {
                          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "sourceEventIdentifier"));
                          -[MOResource setSourceEventIdentifier:](v51, "setSourceEventIdentifier:", v52);

                          -[MOResource priorityScore](v51, "priorityScore");
                          if (v53 <= 0.0)
                            -[MOResource setPriorityScore:](v51, "setPriorityScore:", (double)v11++ + 10000.0);
                          -[NSMutableArray addObject:](v6, "addObject:", v51);
                        }

                        v17 = v68;
                        v4 = v49;
                        p_vtable = &OBJC_METACLASS___MOSignificantContactManager.vtable;
                        goto LABEL_81;
                      }
                    }
                    v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
                    if (!v38)
                      goto LABEL_84;
                  }
                }
                v28 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v17, "place"));
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "startDate"));

                if (!v22)
                  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v17, "startDate"));
                v29 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v17, "place"));
                v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "endDate"));

                if (!v30)
                  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](v17, "endDate"));
                v31 = [MOResource alloc];
                v32 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v17, "place"));
                v33 = -[MOResource initWithPlace:startDate:endDate:](v31, "initWithPlace:startDate:endDate:", v32, v22, v30);

                if (v33)
                {
                  v34 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v17, "place"));
                  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "sourceEventIdentifier"));
                  -[MOResource setSourceEventIdentifier:](v33, "setSourceEventIdentifier:", v35);

                  -[MOResource priorityScore](v33, "priorityScore");
                  if (v36 <= 0.0)
                    -[MOResource setPriorityScore:](v33, "setPriorityScore:", (double)v11++ + 10000.0);
                  -[NSMutableArray addObject:](v6, "addObject:", v33);
                }

              }
            }

            goto LABEL_53;
          }
LABEL_35:

          goto LABEL_36;
        }
        v17 = v68;
        goto LABEL_29;
      }

    }
    else if ((id)-[MOEventBundle interfaceType](v68, "interfaceType") == (id)12)
    {
      goto LABEL_27;
    }
    v20 = 1;
LABEL_34:
    if (v19 != (id)1)
      goto LABEL_36;
    goto LABEL_35;
  }
LABEL_85:
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle predominantWeather](v17, "predominantWeather"));

  if (v54)
  {
    v55 = objc_alloc((Class)(p_vtable + 342));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle predominantWeather](v17, "predominantWeather"));
    v57 = objc_msgSend(v55, "initWithWeather:", v56);

    if (v57)
    {
      v58 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle predominantWeather](v17, "predominantWeather"));
      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "sourceEventIdentifier"));
      objc_msgSend(v57, "setSourceEventIdentifier:", v59);

      objc_msgSend(v57, "priorityScore");
      if (v60 <= 0.0)
        objc_msgSend(v57, "setPriorityScore:", (double)v11++ + 10000.0);
      -[NSMutableArray addObject:](v6, "addObject:", v57);
    }

  }
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v17, "resources"));
  v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
  if (v62)
  {
    v63 = v62;
    v64 = *(_QWORD *)v71;
    do
    {
      for (k = 0; k != v63; k = (char *)k + 1)
      {
        if (*(_QWORD *)v71 != v64)
          objc_enumerationMutation(v61);
        v66 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)k);
        objc_msgSend(v66, "priorityScore");
        if (v67 <= 0.0)
          objc_msgSend(v66, "setPriorityScore:", (double)v11++ + 10000.0);
        -[NSMutableArray addObject:](v6, "addObject:", v66);
      }
      v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v70, v82, 16);
    }
    while (v63);
  }

  -[MOEventBundle setResources:](v17, "setResources:", v6);
}

- (void)addEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](self, "events"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](self, "events"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v6));

      objc_msgSend(v7, "addObject:", v4);
      v8 = objc_msgSend(v7, "copy");
      -[MOEventBundle setEvents:](self, "setEvents:", v8);

    }
    else
    {
      v9 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
      -[MOEventBundle setEvents:](self, "setEvents:", v7);
    }

  }
}

- (void)addEvents:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v11 = v4;
    v6 = objc_msgSend(v4, "count");
    v5 = v11;
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](self, "events"));

      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](self, "events"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v8));

        if (objc_msgSend(v11, "count"))
          objc_msgSend(v9, "addObjectsFromArray:", v11);
        v10 = objc_msgSend(v9, "copy");
        -[MOEventBundle setEvents:](self, "setEvents:", v10);

      }
      else
      {
        -[MOEventBundle setEvents:](self, "setEvents:", v11);
      }
      v5 = v11;
    }
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOEventBundle)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  MOEventBundle *v13;
  MOEventBundle *v14;
  uint64_t v15;
  MOEventBundle *v16;
  id v17;
  uint64_t v18;
  NSDate *startDate;
  uint64_t v20;
  id v21;
  uint64_t v22;
  NSDate *endDate;
  uint64_t v24;
  id v25;
  uint64_t v26;
  NSDate *firstCreationDate;
  uint64_t v28;
  id v29;
  uint64_t v30;
  NSDate *expirationDate;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSSet *v35;
  void *v36;
  uint64_t v37;
  NSArray *events;
  uint64_t v39;
  id v40;
  uint64_t v41;
  NSString *promptLanguage;
  uint64_t v43;
  id v44;
  uint64_t v45;
  MOAction *action;
  uint64_t v47;
  id v48;
  uint64_t v49;
  MOAction *concurrentMediaAction;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSSet *v54;
  void *v55;
  uint64_t v56;
  NSArray *actions;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSSet *v61;
  void *v62;
  uint64_t v63;
  NSArray *backgroundActions;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSSet *v68;
  void *v69;
  uint64_t v70;
  NSArray *persons;
  uint64_t v72;
  id v73;
  uint64_t v74;
  MOPlace *place;
  uint64_t v76;
  id v77;
  uint64_t v78;
  MOWeather *predominantWeather;
  uint64_t v80;
  id v81;
  uint64_t v82;
  MOTime *time;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  NSSet *v87;
  void *v88;
  uint64_t v89;
  NSArray *resources;
  uint64_t v91;
  id v92;
  void *v93;
  uint64_t v94;
  NSDictionary *rankingDictionary;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  NSSet *v99;
  void *v100;
  uint64_t v101;
  NSArray *labels;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  NSSet *v106;
  void *v107;
  uint64_t v108;
  NSArray *promptLanguages;
  id v110;
  uint64_t v111;
  id v112;
  void *v113;
  void *v114;
  NSMutableDictionary *v115;
  NSMutableDictionary *metaData;
  uint64_t v117;
  id v118;
  void *v119;
  uint64_t v120;
  NSDictionary *metaDataForRank;
  uint64_t v122;
  id v123;
  uint64_t v124;
  NSUUID *suggestionID;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  NSSet *v129;
  void *v130;
  void *v131;
  uint64_t v132;
  NSMutableSet *suggestionEngagementEvents;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  NSSet *v137;
  void *v138;
  uint64_t v139;
  NSArray *places;
  uint64_t v141;
  id v142;
  uint64_t v143;
  NSArray *subBundleIDs;
  uint64_t v145;
  id v146;
  uint64_t v147;
  NSArray *subSuggestionIDs;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  NSSet *v152;
  void *v153;
  void *v154;
  uint64_t v155;
  NSMutableSet *appEntryEngagementEvents;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  NSSet *v160;
  void *v161;
  uint64_t v162;
  NSArray *visitEventsRejectedByWatchLocation;
  uint64_t v164;
  id v165;
  uint64_t v166;
  MOClusterMetadata *clusterMetadata;
  uint64_t v168;
  id v169;
  uint64_t v170;
  MOOutlierMetadata *outlierMetadata;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  NSSet *v175;
  void *v176;
  uint64_t v177;
  NSArray *photoTraits;

  v4 = a3;
  v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v5), CFSTR("bundleIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v8), CFSTR("creationDate"));
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)v10;
  if (v7)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (v12)
  {
    v13 = 0;
  }
  else
  {
    v14 = -[MOEventBundle initWithBundleIdentifier:creationDate:](self, "initWithBundleIdentifier:creationDate:", v7, v10);
    v16 = v14;
    if (v14)
    {
      v17 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v15), CFSTR("startDate"));
      v18 = objc_claimAutoreleasedReturnValue(v17);
      startDate = v16->_startDate;
      v16->_startDate = (NSDate *)v18;

      v21 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v20), CFSTR("endDate"));
      v22 = objc_claimAutoreleasedReturnValue(v21);
      endDate = v16->_endDate;
      v16->_endDate = (NSDate *)v22;

      v25 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v24), CFSTR("firstCreationDate"));
      v26 = objc_claimAutoreleasedReturnValue(v25);
      firstCreationDate = v16->_firstCreationDate;
      v16->_firstCreationDate = (NSDate *)v26;

      v29 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate, v28), CFSTR("expirationDate"));
      v30 = objc_claimAutoreleasedReturnValue(v29);
      expirationDate = v16->_expirationDate;
      v16->_expirationDate = (NSDate *)v30;

      v16->_source = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("source"));
      v16->_interfaceType = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("interfaceType"));
      v16->_photoSource = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("photoSource"));
      v33 = objc_opt_class(NSArray, v32);
      v35 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v33, objc_opt_class(MOEvent, v34), 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, CFSTR("events")));
      events = v16->_events;
      v16->_events = (NSArray *)v37;

      v16->_filtered = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("filtered"));
      v40 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v39), CFSTR("promptLanguage"));
      v41 = objc_claimAutoreleasedReturnValue(v40);
      promptLanguage = v16->_promptLanguage;
      v16->_promptLanguage = (NSString *)v41;

      v44 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(MOAction, v43), CFSTR("action"));
      v45 = objc_claimAutoreleasedReturnValue(v44);
      action = v16->_action;
      v16->_action = (MOAction *)v45;

      v48 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(MOAction, v47), CFSTR("concurrentMediaAction"));
      v49 = objc_claimAutoreleasedReturnValue(v48);
      concurrentMediaAction = v16->_concurrentMediaAction;
      v16->_concurrentMediaAction = (MOAction *)v49;

      v52 = objc_opt_class(NSArray, v51);
      v54 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v52, objc_opt_class(MOAction, v53), 0);
      v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
      v56 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v55, CFSTR("actions")));
      actions = v16->_actions;
      v16->_actions = (NSArray *)v56;

      v59 = objc_opt_class(NSArray, v58);
      v61 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v59, objc_opt_class(MOAction, v60), 0);
      v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
      v63 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v62, CFSTR("backgroundActions")));
      backgroundActions = v16->_backgroundActions;
      v16->_backgroundActions = (NSArray *)v63;

      v66 = objc_opt_class(NSArray, v65);
      v68 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v66, objc_opt_class(MOPerson, v67), 0);
      v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
      v70 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v69, CFSTR("persons")));
      persons = v16->_persons;
      v16->_persons = (NSArray *)v70;

      v73 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(MOPlace, v72), CFSTR("place"));
      v74 = objc_claimAutoreleasedReturnValue(v73);
      place = v16->_place;
      v16->_place = (MOPlace *)v74;

      v77 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(MOWeather, v76), CFSTR("weather"));
      v78 = objc_claimAutoreleasedReturnValue(v77);
      predominantWeather = v16->_predominantWeather;
      v16->_predominantWeather = (MOWeather *)v78;

      v81 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(MOTime, v80), CFSTR("time"));
      v82 = objc_claimAutoreleasedReturnValue(v81);
      time = v16->_time;
      v16->_time = (MOTime *)v82;

      v85 = objc_opt_class(NSArray, v84);
      v87 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v85, objc_opt_class(MOResource, v86), 0);
      v88 = (void *)objc_claimAutoreleasedReturnValue(v87);
      v89 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v88, CFSTR("resources")));
      resources = v16->_resources;
      v16->_resources = (NSArray *)v89;

      v92 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v91), CFSTR("rankingDictionary"));
      v93 = (void *)objc_claimAutoreleasedReturnValue(v92);
      v94 = objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v93));
      rankingDictionary = v16->_rankingDictionary;
      v16->_rankingDictionary = (NSDictionary *)v94;

      v97 = objc_opt_class(NSArray, v96);
      v99 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v97, objc_opt_class(NSString, v98), 0);
      v100 = (void *)objc_claimAutoreleasedReturnValue(v99);
      v101 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v100, CFSTR("labels")));
      labels = v16->_labels;
      v16->_labels = (NSArray *)v101;

      v104 = objc_opt_class(NSArray, v103);
      v106 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v104, objc_opt_class(NSString, v105), 0);
      v107 = (void *)objc_claimAutoreleasedReturnValue(v106);
      v108 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v107, CFSTR("promptLanguages")));
      promptLanguages = v16->_promptLanguages;
      v16->_promptLanguages = (NSArray *)v108;

      v110 = objc_alloc((Class)NSMutableDictionary);
      v112 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v111), CFSTR("metaData"));
      v113 = (void *)objc_claimAutoreleasedReturnValue(v112);
      v114 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v113));
      v115 = (NSMutableDictionary *)objc_msgSend(v110, "initWithDictionary:", v114);
      metaData = v16->_metaData;
      v16->_metaData = v115;

      v118 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v117), CFSTR("metaDataForRank"));
      v119 = (void *)objc_claimAutoreleasedReturnValue(v118);
      v120 = objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder decodeToDictionary:](MODictionaryEncoder, "decodeToDictionary:", v119));
      metaDataForRank = v16->_metaDataForRank;
      v16->_metaDataForRank = (NSDictionary *)v120;

      v123 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID, v122), CFSTR("suggestionID"));
      v124 = objc_claimAutoreleasedReturnValue(v123);
      suggestionID = v16->_suggestionID;
      v16->_suggestionID = (NSUUID *)v124;

      v127 = objc_opt_class(NSArray, v126);
      v129 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v127, objc_opt_class(NSString, v128), 0);
      v130 = (void *)objc_claimAutoreleasedReturnValue(v129);
      v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v130, CFSTR("suggestionEngagements")));
      v132 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v131));
      suggestionEngagementEvents = v16->_suggestionEngagementEvents;
      v16->_suggestionEngagementEvents = (NSMutableSet *)v132;

      v135 = objc_opt_class(NSArray, v134);
      v137 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v135, objc_opt_class(MOPlace, v136), 0);
      v138 = (void *)objc_claimAutoreleasedReturnValue(v137);
      v139 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v138, CFSTR("places")));
      places = v16->_places;
      v16->_places = (NSArray *)v139;

      v16->_isAggregatedAndSuppressed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAggregatedAndSuppressed"));
      v16->_summarizationGranularity = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("summarizationGranularity"));
      v142 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(NSString, v141), CFSTR("subBundleIDs"));
      v143 = objc_claimAutoreleasedReturnValue(v142);
      subBundleIDs = v16->_subBundleIDs;
      v16->_subBundleIDs = (NSArray *)v143;

      v146 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(NSString, v145), CFSTR("subSuggestionIDs"));
      v147 = objc_claimAutoreleasedReturnValue(v146);
      subSuggestionIDs = v16->_subSuggestionIDs;
      v16->_subSuggestionIDs = (NSArray *)v147;

      v16->_suggestionEngagementViewCount = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("suggestionViewCount"));
      v150 = objc_opt_class(NSArray, v149);
      v152 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v150, objc_opt_class(NSString, v151), 0);
      v153 = (void *)objc_claimAutoreleasedReturnValue(v152);
      v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v153, CFSTR("appEntryEngagements")));
      v155 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithArray:](NSMutableSet, "setWithArray:", v154));
      appEntryEngagementEvents = v16->_appEntryEngagementEvents;
      v16->_appEntryEngagementEvents = (NSMutableSet *)v155;

      v158 = objc_opt_class(NSArray, v157);
      v160 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v158, objc_opt_class(NSString, v159), 0);
      v161 = (void *)objc_claimAutoreleasedReturnValue(v160);
      v162 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v161, CFSTR("visitEventsRejectedByWatchLocation")));
      visitEventsRejectedByWatchLocation = v16->_visitEventsRejectedByWatchLocation;
      v16->_visitEventsRejectedByWatchLocation = (NSArray *)v162;

      v16->_bundleSubType = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("bundleSubType"));
      v16->_bundleSuperType = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("bundleSuperType"));
      v165 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(MOClusterMetadata, v164), CFSTR("clusterMetadata"));
      v166 = objc_claimAutoreleasedReturnValue(v165);
      clusterMetadata = v16->_clusterMetadata;
      v16->_clusterMetadata = (MOClusterMetadata *)v166;

      v169 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(MOOutlierMetadata, v168), CFSTR("outlierMetadata"));
      v170 = objc_claimAutoreleasedReturnValue(v169);
      outlierMetadata = v16->_outlierMetadata;
      v16->_outlierMetadata = (MOOutlierMetadata *)v170;

      v173 = objc_opt_class(NSArray, v172);
      v175 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v173, objc_opt_class(MOPhotoTrait, v174), 0);
      v176 = (void *)objc_claimAutoreleasedReturnValue(v175);
      v177 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v176, CFSTR("photoTraits")));
      photoTraits = v16->_photoTraits;
      v16->_photoTraits = (NSArray *)v177;

    }
    self = v16;
    v13 = self;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *bundleIdentifier;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  bundleIdentifier = self->_bundleIdentifier;
  v12 = a3;
  objc_msgSend(v12, "encodeObject:forKey:", bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_firstCreationDate, CFSTR("firstCreationDate"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));
  objc_msgSend(v12, "encodeInteger:forKey:", self->_source, CFSTR("source"));
  objc_msgSend(v12, "encodeInteger:forKey:", self->_interfaceType, CFSTR("interfaceType"));
  objc_msgSend(v12, "encodeInteger:forKey:", self->_photoSource, CFSTR("photoSource"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_events, CFSTR("events"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_filtered, CFSTR("filtered"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_promptLanguage, CFSTR("promptLanguage"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_action, CFSTR("action"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_concurrentMediaAction, CFSTR("concurrentMediaAction"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_actions, CFSTR("actions"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_backgroundActions, CFSTR("backgroundActions"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_persons, CFSTR("persons"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_place, CFSTR("place"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_predominantWeather, CFSTR("weather"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_time, CFSTR("time"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_resources, CFSTR("resources"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_rankingDictionary));
  objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("rankingDictionary"));

  objc_msgSend(v12, "encodeObject:forKey:", self->_labels, CFSTR("labels"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_promptLanguages, CFSTR("promptLanguages"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_metaData));
  objc_msgSend(v12, "encodeObject:forKey:", v6, CFSTR("metaData"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MODictionaryEncoder encodeDictionary:](MODictionaryEncoder, "encodeDictionary:", self->_metaDataForRank));
  objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("metaDataForRank"));

  objc_msgSend(v12, "encodeObject:forKey:", self->_suggestionID, CFSTR("suggestionID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle suggestionEngagementEvents](self, "suggestionEngagementEvents"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "allObjects"));
  objc_msgSend(v12, "encodeObject:forKey:", v9, CFSTR("suggestionEngagements"));

  objc_msgSend(v12, "encodeObject:forKey:", self->_places, CFSTR("places"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_isAggregatedAndSuppressed, CFSTR("isAggregatedAndSuppressed"));
  objc_msgSend(v12, "encodeInteger:forKey:", self->_summarizationGranularity, CFSTR("summarizationGranularity"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_subBundleIDs, CFSTR("subBundleIDs"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_subSuggestionIDs, CFSTR("subSuggestionIDs"));
  objc_msgSend(v12, "encodeInteger:forKey:", self->_suggestionEngagementViewCount, CFSTR("suggestionViewCount"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_visitEventsRejectedByWatchLocation, CFSTR("visitEventsRejectedByWatchLocation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle appEntryEngagementEvents](self, "appEntryEngagementEvents"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allObjects"));
  objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("appEntryEngagements"));

  objc_msgSend(v12, "encodeInteger:forKey:", self->_bundleSubType, CFSTR("bundleSubType"));
  objc_msgSend(v12, "encodeInteger:forKey:", self->_bundleSuperType, CFSTR("bundleSuperType"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_clusterMetadata, CFSTR("clusterMetadata"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_outlierMetadata, CFSTR("outlierMetadata"));
  objc_msgSend(v12, "encodeObject:forKey:", self->_photoTraits, CFSTR("photoTraits"));

}

- (id)dateInterval
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id os_log;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  id v18;
  id v19;
  void *v20;
  void *v21;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](self, "startDate"));
  if (v4)
  {

    goto LABEL_4;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](self, "endDate"));

  if (v5)
  {
LABEL_4:
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](self, "endDate"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](self, "startDate"));
    v8 = v7;
    if (v6)
    {

      if (v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](self, "startDate"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](self, "endDate"));
        v11 = objc_msgSend(v9, "isOnOrBefore:", v10);

        if ((v11 & 1) == 0)
        {
          os_log = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
          v13 = objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            -[MOEventBundle dateInterval].cold.1((uint64_t)self, v13);

          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
          objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MOEventBundle.m"), 1434, CFSTR("startDate is NOT earlier than endDate, bundle, %@ (in %s:%d)"), self, "-[MOEventBundle dateInterval]", 1434);

        }
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](self, "startDate"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](self, "endDate"));
        v17 = objc_msgSend(v15, "isBeforeDate:", v16);

        if ((v17 & 1) == 0)
          goto LABEL_11;
LABEL_15:
        v19 = objc_alloc((Class)NSDateInterval);
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](self, "startDate"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](self, "endDate"));
        v18 = objc_msgSend(v19, "initWithStartDate:endDate:", v20, v21);

        return v18;
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](self, "endDate"));
      -[MOEventBundle setStartDate:](self, "setStartDate:", v8);
    }
    else
    {
      -[MOEventBundle setEndDate:](self, "setEndDate:", v7);
    }

    goto LABEL_15;
  }
LABEL_11:
  v18 = 0;
  return v18;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle bundleIdentifier](self, "bundleIdentifier"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqualToEventBundle:(id)a3
{
  MOEventBundle *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  unsigned int v8;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  MOEventBundle *v20;
  MOEventBundle *v21;
  MOEventBundle *v22;
  double v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *i;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *k;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  uint64_t v60;
  void *m;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  uint64_t v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  uint64_t v84;
  void *v85;
  id v86;
  id v87;
  void *v88;
  uint64_t v89;
  void *j;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
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
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];

  v4 = (MOEventBundle *)a3;
  if (self == v4)
    goto LABEL_3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle bundleIdentifier](self, "bundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle bundleIdentifier](v4, "bundleIdentifier"));
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) != 0)
    goto LABEL_3;
  v10 = objc_claimAutoreleasedReturnValue(-[MOEventBundle suggestionID](self, "suggestionID"));
  if (v10)
  {
    v11 = (void *)v10;
    v12 = objc_claimAutoreleasedReturnValue(-[MOEventBundle suggestionID](v4, "suggestionID"));
    if (v12)
    {
      v13 = (void *)v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle suggestionID](self, "suggestionID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle suggestionID](v4, "suggestionID"));
      v16 = objc_msgSend(v14, "isEqual:", v15);

      if ((v16 & 1) != 0)
      {
LABEL_3:
        LOBYTE(v8) = 1;
        goto LABEL_4;
      }
    }
    else
    {

    }
  }
  v17 = -[MOEventBundle interfaceType](self, "interfaceType");
  if (v17 != (void *)-[MOEventBundle interfaceType](v4, "interfaceType"))
  {
LABEL_84:
    LOBYTE(v8) = 0;
    goto LABEL_4;
  }
  LOBYTE(v8) = 0;
  switch(-[MOEventBundle interfaceType](v4, "interfaceType"))
  {
    case 0uLL:
      if (!-[MOEventBundle isEqualPropertyForObject:other:propertyPath:threshold:](self, "isEqualPropertyForObject:other:propertyPath:threshold:", self, v4, CFSTR("startDate"), 60.0))goto LABEL_84;
      v19 = CFSTR("endDate");
      v23 = 60.0;
      goto LABEL_32;
    case 1uLL:
    case 2uLL:
      if (!-[MOEventBundle isEqualPropertyForObject:other:propertyPath:threshold:](self, "isEqualPropertyForObject:other:propertyPath:threshold:", self, v4, CFSTR("startDate"), 600.0))goto LABEL_84;
      v19 = CFSTR("endDate");
      v20 = self;
      v21 = self;
      v22 = v4;
      v23 = 600.0;
      goto LABEL_33;
    case 4uLL:
      if (!-[MOEventBundle isEqualBasicPropertiesForObject:other:](self, "isEqualBasicPropertiesForObject:other:", self, v4))goto LABEL_84;
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](self, "startDate"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v4, "startDate"));
      v8 = objc_msgSend(v24, "isSameDayWithDate:", v25);

      if (!v8)
        goto LABEL_4;
      v26 = -[MOEventBundle isEqualPersonsForObject:other:](self, "isEqualPersonsForObject:other:", self, v4);
      goto LABEL_34;
    case 5uLL:
      if (!-[MOEventBundle isEqualBasicPropertiesForObject:other:](self, "isEqualBasicPropertiesForObject:other:", self, v4))goto LABEL_84;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](self, "startDate"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v4, "startDate"));
      v8 = objc_msgSend(v27, "isSameDayWithDate:", v28);

      if (!v8)
        goto LABEL_4;
      v110 = 0u;
      v111 = 0u;
      v108 = 0u;
      v109 = 0u;
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](self, "resources"));
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v108, v115, 16);
      if (v30)
      {
        v31 = v30;
        v32 = 0;
        v33 = *(_QWORD *)v109;
        do
        {
          for (i = 0; i != v31; i = (char *)i + 1)
          {
            if (*(_QWORD *)v109 != v33)
              objc_enumerationMutation(v29);
            v35 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * (_QWORD)i);
            v36 = objc_autoreleasePoolPush();
            if (objc_msgSend(v35, "type") == (id)3)
            {
              v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "getDictionary"));

              v32 = (void *)v37;
            }
            objc_autoreleasePoolPop(v36);
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v108, v115, 16);
        }
        while (v31);
      }
      else
      {
        v32 = 0;
      }

      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      v85 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v4, "resources"));
      v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v104, v114, 16);
      if (!v86)
      {
        v88 = 0;
LABEL_106:

        goto LABEL_107;
      }
      v87 = v86;
      v88 = 0;
      v89 = *(_QWORD *)v105;
      do
      {
        for (j = 0; j != v87; j = (char *)j + 1)
        {
          if (*(_QWORD *)v105 != v89)
            objc_enumerationMutation(v85);
          v91 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * (_QWORD)j);
          v92 = objc_autoreleasePoolPush();
          if (objc_msgSend(v91, "type") == (id)3)
          {
            v93 = objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "getDictionary"));

            v88 = (void *)v93;
          }
          objc_autoreleasePoolPop(v92);
        }
        v87 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v104, v114, 16);
      }
      while (v87);

      if (v32 && v88)
      {
        v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerBundleID")));
        v94 = objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "objectForKey:", CFSTR("MOMediaPlayMetaDataKeyPlayerBundleID")));
        v95 = (void *)v94;
        if (v85 && v94)
          objc_msgSend(v85, "isEqualToString:", v94);

        goto LABEL_106;
      }
LABEL_107:

      goto LABEL_3;
    case 6uLL:
      v19 = CFSTR("dateInterval");
      v23 = 0.8;
LABEL_32:
      v20 = self;
      v21 = self;
      v22 = v4;
LABEL_33:
      v26 = -[MOEventBundle isEqualPropertyForObject:other:propertyPath:threshold:](v20, "isEqualPropertyForObject:other:propertyPath:threshold:", v21, v22, v19, v23);
      goto LABEL_34;
    case 7uLL:
      v38 = -[MOEventBundle bundleSubType](self, "bundleSubType");
      if (v38 != (void *)-[MOEventBundle bundleSubType](v4, "bundleSubType"))
        goto LABEL_84;
      goto LABEL_83;
    case 8uLL:
      if (!-[MOEventBundle isEqualPropertyForObject:other:propertyPath:threshold:](self, "isEqualPropertyForObject:other:propertyPath:threshold:", self, v4, CFSTR("dateInterval"), 0.8))goto LABEL_84;
      v26 = -[MOEventBundle isEqualResourcesForObject:other:resourceType:](self, "isEqualResourcesForObject:other:resourceType:", self, v4, 8);
      goto LABEL_34;
    case 0xAuLL:
      v102 = 0u;
      v103 = 0u;
      v100 = 0u;
      v101 = 0u;
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](self, "resources"));
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v100, v113, 16);
      if (v40)
      {
        v41 = v40;
        v42 = 0;
        v43 = *(_QWORD *)v101;
        do
        {
          for (k = 0; k != v41; k = (char *)k + 1)
          {
            if (*(_QWORD *)v101 != v43)
              objc_enumerationMutation(v39);
            v45 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * (_QWORD)k);
            v46 = objc_autoreleasePoolPush();
            if (objc_msgSend(v45, "type") == (id)15)
            {
              v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "getDictionary"));

              v42 = (void *)v47;
            }
            objc_autoreleasePoolPop(v46);
          }
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v100, v113, 16);
        }
        while (v41);
      }
      else
      {
        v42 = 0;
      }

      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      v56 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle resources](v4, "resources", 0));
      v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v96, v112, 16);
      if (!v57)
      {

        v59 = 0;
LABEL_76:
        LOBYTE(v8) = -[MOEventBundle isEqualBaseActionForObject:other:](self, "isEqualBaseActionForObject:other:", self, v4);

        goto LABEL_4;
      }
      v58 = v57;
      v59 = 0;
      v60 = *(_QWORD *)v97;
      do
      {
        for (m = 0; m != v58; m = (char *)m + 1)
        {
          if (*(_QWORD *)v97 != v60)
            objc_enumerationMutation(v56);
          v62 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * (_QWORD)m);
          v63 = objc_autoreleasePoolPush();
          if (objc_msgSend(v62, "type") == (id)15)
          {
            v64 = objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "getDictionary"));

            v59 = (void *)v64;
          }
          objc_autoreleasePoolPop(v63);
        }
        v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v96, v112, 16);
      }
      while (v58);

      if (!v42 || !v59)
        goto LABEL_76;
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKey:", CFSTR("MOPHMemoryMetaDataKeyMemoryIdentifier")));
      v66 = objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKey:", CFSTR("MOPHMemoryMetaDataKeyMemoryIdentifier")));
      v67 = (void *)v66;
      if (v65 && v66 && (objc_msgSend(v65, "isEqualToString:", v66) & 1) != 0)
      {

        goto LABEL_3;
      }

LABEL_88:
      v83 = objc_msgSend((id)objc_opt_class(self, v18), "castEvergreenSubType:", -[MOEventBundle bundleSubType](v4, "bundleSubType"));
      LOBYTE(v8) = v83 == objc_msgSend((id)objc_opt_class(self, v84), "castEvergreenSubType:", -[MOEventBundle bundleSubType](self, "bundleSubType"));
LABEL_4:

      return v8;
    case 0xBuLL:
      goto LABEL_88;
    case 0xCuLL:
      v48 = -[MOEventBundle summarizationGranularity](self, "summarizationGranularity");
      if (v48 != (void *)-[MOEventBundle summarizationGranularity](v4, "summarizationGranularity"))
        goto LABEL_84;
      if (-[MOEventBundle isEqualPropertyForObject:other:propertyPath:threshold:](self, "isEqualPropertyForObject:other:propertyPath:threshold:", self, v4, CFSTR("startDate"), 600.0))
      {
        goto LABEL_3;
      }
      v49 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle subBundleIDs](self, "subBundleIDs"));
      v50 = objc_msgSend(v49, "count");

      if (v50)
      {
        if (-[MOEventBundle intersectedSubBundleIDForObject:other:](self, "intersectedSubBundleIDForObject:other:", self, v4))
        {
          goto LABEL_3;
        }
      }
      v26 = -[MOEventBundle intersectedActivityOrVisitForObject:other:](self, "intersectedActivityOrVisitForObject:other:", self, v4);
LABEL_34:
      LOBYTE(v8) = v26;
      goto LABEL_4;
    case 0xDuLL:
      v51 = objc_claimAutoreleasedReturnValue(-[MOEventBundle place](self, "place"));
      if (!v51)
        goto LABEL_84;
      v52 = (void *)v51;
      v53 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v4, "place"));

      if (!v53)
        goto LABEL_84;
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](self, "place"));
      v55 = objc_msgSend(v54, "placeType");
      if ((unint64_t)v55 > 0x64
        || (v53 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v4, "place")),
            (unint64_t)objc_msgSend(v53, "placeType") > 0x64))
      {
        v68 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](self, "place"));
        v69 = objc_msgSend(v68, "placeType");
        v70 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle place](v4, "place"));
        v71 = objc_msgSend(v70, "placeType");

        if ((unint64_t)v55 <= 0x64)
        if (v69 != v71)
          goto LABEL_84;
      }
      else
      {

      }
      v72 = objc_alloc((Class)NSDateInterval);
      v73 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](self, "startDate"));
      v74 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](self, "endDate"));
      v75 = objc_msgSend(v72, "initWithStartDate:endDate:", v73, v74);

      v76 = objc_alloc((Class)NSDateInterval);
      v77 = objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v4, "startDate"));
      v78 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](v4, "endDate"));
      v79 = objc_msgSend(v76, "initWithStartDate:endDate:", v77, v78);

      LOBYTE(v77) = objc_msgSend(v75, "intersectsDateInterval:", v79);
      if ((v77 & 1) != 0)
        goto LABEL_3;
LABEL_81:
      if ((id)-[MOEventBundle bundleSubType](self, "bundleSubType") == (id)801
        && (id)-[MOEventBundle bundleSubType](v4, "bundleSubType") == (id)801)
      {
LABEL_83:
        v80 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](self, "startDate"));
        v81 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v4, "startDate"));
        LOBYTE(v8) = objc_msgSend(v80, "isSameDayWithDate:", v81);

      }
      else
      {
        v80 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](self, "startDate"));
        v82 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](v4, "startDate"));
        LOBYTE(v8) = v80 == v82;

      }
      goto LABEL_4;
    case 0xEuLL:
      goto LABEL_81;
    default:
      goto LABEL_4;
  }
}

+ (unint64_t)castEvergreenSubType:(unint64_t)a3
{
  unint64_t result;

  result = a3;
  if (a3 - 707 <= 2)
    return qword_10029EF28[a3 - 707];
  return result;
}

- (BOOL)intersectedSubBundleIDForObject:(id)a3 other:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v5 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "subBundleIDs"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subBundleIDs", 0));
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v20;
          while (2)
          {
            for (j = 0; j != v14; j = (char *)j + 1)
            {
              if (*(_QWORD *)v20 != v15)
                objc_enumerationMutation(v12);
              if ((objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)j)) & 1) != 0)
              {

                v17 = 1;
                goto LABEL_19;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            if (v14)
              continue;
            break;
          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      v17 = 0;
    }
    while (v8);
  }
  else
  {
    v17 = 0;
  }
LABEL_19:

  return v17;
}

- (BOOL)intersectedActivityOrVisitForObject:(id)a3 other:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  id v19;
  id v20;
  BOOL v21;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];

  v6 = a4;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "events"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v32;
    v25 = v7;
    v26 = v6;
    v23 = *(_QWORD *)v32;
    do
    {
      v11 = 0;
      v24 = v9;
      do
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v11);
        if (objc_msgSend(v12, "category", v23) == (id)1 || objc_msgSend(v12, "category") == (id)2)
        {
          v29 = 0u;
          v30 = 0u;
          v27 = 0u;
          v28 = 0u;
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "events"));
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v28;
            while (2)
            {
              for (i = 0; i != v15; i = (char *)i + 1)
              {
                if (*(_QWORD *)v28 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
                if (objc_msgSend(v18, "category") == (id)1 || objc_msgSend(v18, "category") == (id)2)
                {
                  if ((v19 = objc_msgSend(v12, "category"), v19 == objc_msgSend(v18, "category"))
                    && objc_msgSend(v12, "category") == (id)1
                    && -[MOEventBundle isEqualPropertyForObject:other:propertyPath:threshold:](self, "isEqualPropertyForObject:other:propertyPath:threshold:", v12, v18, CFSTR("startDate"), 600.0)|| (v20 = objc_msgSend(v12, "category"), v20 == objc_msgSend(v18, "category"))&& objc_msgSend(v12, "category") == (id)2&& -[MOEventBundle isEqualPropertyForObject:other:propertyPath:threshold:](self, "isEqualPropertyForObject:other:propertyPath:threshold:", v12, v18, CFSTR("startDate"), 600.0))
                  {

                    v21 = 1;
                    v7 = v25;
                    v6 = v26;
                    goto LABEL_29;
                  }
                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
              if (v15)
                continue;
              break;
            }
          }

          v7 = v25;
          v6 = v26;
          v10 = v23;
          v9 = v24;
        }
        v11 = (char *)v11 + 1;
      }
      while (v11 != v9);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      v21 = 0;
    }
    while (v9);
  }
  else
  {
    v21 = 0;
  }
LABEL_29:

  return v21;
}

- (BOOL)isEqualBasicPropertiesForObject:(id)a3 other:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  BOOL v11;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "bundleSuperType");
  if (v7 == objc_msgSend(v6, "bundleSuperType")
    && (v8 = objc_msgSend(v5, "bundleSubType"), v8 == objc_msgSend(v6, "bundleSubType"))
    && (v9 = objc_msgSend(v5, "interfaceType"), v9 == objc_msgSend(v6, "interfaceType")))
  {
    v10 = objc_msgSend(v5, "summarizationGranularity");
    v11 = v10 == objc_msgSend(v6, "summarizationGranularity");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqualPropertyForObject:(id)a3 other:(id)a4 propertyPath:(id)a5 threshold:(double)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  unsigned __int8 v32;
  uint64_t v33;
  id v34;
  double v35;
  double v36;
  double v37;
  double v38;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKeyPath:", v11));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForKeyPath:", v11));

  if (!(v12 | v13))
  {
    v15 = 1;
    goto LABEL_22;
  }
  v15 = 0;
  if (v12 && v13)
  {
    v16 = objc_opt_class(NSDate, v14);
    if ((objc_opt_isKindOfClass(v12, v16) & 1) != 0)
    {
      objc_msgSend((id)v12, "timeIntervalSinceDate:", v13);
      v19 = fabs(v18);
LABEL_7:
      v15 = v19 < a6;
      goto LABEL_22;
    }
    v20 = objc_opt_class(NSDateInterval, v17);
    if ((objc_opt_isKindOfClass(v12, v20) & 1) == 0)
    {
      v30 = objc_opt_class(NSString, v21);
      if ((objc_opt_isKindOfClass(v12, v30) & 1) != 0)
      {
        v32 = objc_msgSend((id)v12, "isEqualToString:", v13);
      }
      else
      {
        v33 = objc_opt_class(NSNumber, v31);
        if ((objc_opt_isKindOfClass(v12, v33) & 1) != 0)
        {
          v34 = (id)v13;
          objc_msgSend((id)v12, "doubleValue");
          v36 = v35;
          objc_msgSend(v34, "doubleValue");
          v38 = v37;

          v19 = v36 - v38;
          if (v36 - v38 < 0.0)
            v19 = -(v36 - v38);
          goto LABEL_7;
        }
        v32 = objc_msgSend(v9, "isEqual:", v10);
      }
      v15 = v32;
      goto LABEL_22;
    }
    v22 = (id)v12;
    v23 = (id)v13;
    if (!objc_msgSend(v22, "intersectsDateInterval:", v23))
      goto LABEL_14;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "intersectionWithDateInterval:", v23));
    objc_msgSend(v24, "duration");
    v26 = v25;

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "unionWithDateInterval:", v23));
    objc_msgSend(v27, "duration");
    v29 = v28;

    if (v29 == 0.0)
LABEL_14:
      v15 = 0;
    else
      v15 = v26 / v29 > a6;

  }
LABEL_22:

  return v15;
}

- (BOOL)isEqualResourcesForObject:(id)a3 other:(id)a4 resourceType:(unint64_t)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  unsigned __int8 v30;
  void *v32;
  id v33;
  NSMutableSet *v34;
  NSMutableSet *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];

  v7 = a3;
  v33 = a4;
  v35 = objc_opt_new(NSMutableSet);
  v34 = objc_opt_new(NSMutableSet);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v32 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "resources"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
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
        if (objc_msgSend(v13, "type") == (id)a5)
        {
          v14 = objc_alloc((Class)NSString);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "assets"));
          objc_msgSend(v13, "value");
          v18 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@,%@,%f"), v15, v16, v17);

          if (v18)
            -[NSMutableSet addObject:](v35, "addObject:", v18);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v10);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "resources"));
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(_QWORD *)v37 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)j);
        if (objc_msgSend(v24, "type") == (id)a5)
        {
          v25 = objc_alloc((Class)NSString);
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "name"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "assets"));
          objc_msgSend(v24, "value");
          v29 = objc_msgSend(v25, "initWithFormat:", CFSTR("%@,%@,%f"), v26, v27, v28);

          if (v29)
            -[NSMutableSet addObject:](v34, "addObject:", v29);

        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v21);
  }

  v30 = -[NSMutableSet isEqualToSet:](v35, "isEqualToSet:", v34);
  return v30;
}

- (BOOL)isEqualPersonsForObject:(id)a3 other:(id)a4
{
  id v5;
  id v6;
  NSMutableSet *v7;
  NSMutableSet *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *j;
  void *v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_new(NSMutableSet);
  v8 = objc_opt_new(NSMutableSet);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "persons"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v32 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contactIdentifier"));

        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "contactIdentifier"));
          -[NSMutableSet addObject:](v7, "addObject:", v16);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v11);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "persons", 0));
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)j);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "contactIdentifier"));

        if (v23)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "contactIdentifier"));
          -[NSMutableSet addObject:](v8, "addObject:", v24);

        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v19);
  }

  v25 = -[NSMutableSet isEqualToSet:](v7, "isEqualToSet:", v8);
  return v25;
}

- (BOOL)isEqualBaseActionForObject:(id)a3 other:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  BOOL v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "action"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "action"));

  if (v6 | v7)
  {
    v8 = 0;
    if (v7)
      v9 = 0;
    else
      v9 = v6 != 0;
    if (v7)
      v10 = v6 == 0;
    else
      v10 = 0;
    if (!v10 && !v9)
    {
      v11 = objc_msgSend((id)v6, "actionType");
      if (v11 == objc_msgSend((id)v7, "actionType"))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v6, "actionName"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v7, "actionName"));
        v8 = objc_msgSend(v12, "isEqualToString:", v13);

      }
      else
      {
        v8 = 0;
      }
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  MOEventBundle *v5;
  uint64_t v6;
  MOEventBundle *v7;
  uint64_t v8;
  MOEventBundle *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;

  v5 = (MOEventBundle *)a3;
  v7 = v5;
  if (self == v5)
  {
    v13 = 1;
  }
  else
  {
    if (v5)
    {
      v8 = objc_opt_class(self, v6);
      if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
      {
        v9 = v7;
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle bundleIdentifier](self, "bundleIdentifier"));
        if (v10
          || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle bundleIdentifier](v9, "bundleIdentifier"))) != 0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle bundleIdentifier](self, "bundleIdentifier"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle bundleIdentifier](v9, "bundleIdentifier"));
          v13 = objc_msgSend(v11, "isEqual:", v12);

          if (v10)
          {
LABEL_12:

            goto LABEL_13;
          }
        }
        else
        {
          v13 = 1;
        }

        goto LABEL_12;
      }
    }
    v13 = 0;
  }
LABEL_13:

  return v13;
}

- (BOOL)containTheSameEventSet:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  id v19;
  id v20;

  v5 = a3;
  if (v5 && (v6 = objc_opt_class(self, v4), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](self, "events"));
    v9 = objc_msgSend(v8, "mutableCopy");

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "events"));
    v11 = objc_msgSend(v10, "mutableCopy");

    v12 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("startDate"), 1);
    v20 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sortedArrayUsingDescriptors:", v13));

    v19 = v12;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sortedArrayUsingDescriptors:", v15));

    v17 = objc_msgSend(v14, "isEqualToArray:", v16);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)shareEvents:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  NSMutableSet *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *j;
  void *v20;
  NSMutableSet *v21;
  id v22;
  id v23;
  NSMutableSet *v24;
  uint64_t v25;
  void *k;
  void *v27;
  void *v28;
  id v29;
  char v30;
  void *v32;
  id v33;
  id obj;
  char v35;
  uint64_t v36;
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
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];

  v5 = a3;
  if (v5 && (v6 = objc_opt_class(self, v4), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v33 = v5;
    v7 = v5;
    v8 = objc_opt_new(NSMutableSet);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v32 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "events"));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v46 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "eventIdentifier"));

          if (v15)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "eventIdentifier"));
            -[NSMutableSet addObject:](v8, "addObject:", v16);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      }
      while (v11);
    }

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[MOEventBundle events](self, "events"));
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    if (v17)
    {
      v18 = v17;
      v35 = 0;
      v36 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v18; j = (char *)j + 1)
        {
          if (*(_QWORD *)v42 != v36)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)j);
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v21 = v8;
          v22 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
          if (v22)
          {
            v23 = v22;
            v24 = v8;
            v25 = *(_QWORD *)v38;
            while (2)
            {
              for (k = 0; k != v23; k = (char *)k + 1)
              {
                if (*(_QWORD *)v38 != v25)
                  objc_enumerationMutation(v21);
                v27 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)k);
                v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "eventIdentifier"));
                v29 = objc_msgSend(v27, "compare:", v28);

                if (!v29)
                {
                  v35 = 1;
                  goto LABEL_27;
                }
              }
              v23 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
              if (v23)
                continue;
              break;
            }
LABEL_27:
            v8 = v24;
          }

        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      }
      while (v18);
    }
    else
    {
      v35 = 0;
    }

    v5 = v33;
    v30 = v35;
  }
  else
  {
    v30 = 0;
  }

  return v30 & 1;
}

- (id)getCustomLabelsForMetaData:(id)a3 templateFilePath:(id)a4
{
  id v6;
  id v7;
  MOEventBundleLabelFormatter *v8;
  MOEventBundleLabelFormatter *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  if (v6)
    v8 = -[MOEventBundleLabelFormatter initWithTemplatePath:]([MOEventBundleLabelFormatter alloc], "initWithTemplatePath:", v6);
  else
    v8 = objc_opt_new(MOEventBundleLabelFormatter);
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle getCustomLabelsForMetaData:labelFormatter:](self, "getCustomLabelsForMetaData:labelFormatter:", v7, v8));

  return v10;
}

- (id)getCustomLabelsForMetaData:(id)a3 labelFormatter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle getBundleType](self, "getBundleType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "formattedBundleLabelsForMetaData:bundleType:", v6, v8));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle metaData](self, "metaData"));
    v10 = objc_claimAutoreleasedReturnValue(-[MOEventBundle getBundleType](self, "getBundleType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "formattedBundleLabelsForMetaData:bundleType:", v8, v10));

    v7 = (id)v10;
  }

  return v9;
}

- (id)getCustomPromptsForMetaData:(id)a3 templateFilePath:(id)a4
{
  id v6;
  id v7;
  MOEventBundleLabelFormatter *v8;
  MOEventBundleLabelFormatter *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  if (v6)
    v8 = -[MOEventBundleLabelFormatter initWithTemplatePath:]([MOEventBundleLabelFormatter alloc], "initWithTemplatePath:", v6);
  else
    v8 = objc_opt_new(MOEventBundleLabelFormatter);
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle getCustomPromptsForMetaData:labelFormatter:](self, "getCustomPromptsForMetaData:labelFormatter:", v7, v8));

  return v10;
}

- (id)getCustomPromptsForMetaData:(id)a3 labelFormatter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle getBundleType](self, "getBundleType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "formattedBundlePromptsForMetaData:bundleType:", v6, v8));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle metaData](self, "metaData"));
    v10 = objc_claimAutoreleasedReturnValue(-[MOEventBundle getBundleType](self, "getBundleType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "formattedBundlePromptsForMetaData:bundleType:", v8, v10));

    v7 = (id)v10;
  }

  return v9;
}

- (BOOL)hasSuggestionEngagementEvent:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle suggestionEngagementEvents](self, "suggestionEngagementEvents"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)setSuggestionEngagementEvent:(id)a3
{
  void *v4;
  NSMutableSet *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle suggestionEngagementEvents](self, "suggestionEngagementEvents"));

  if (!v4)
  {
    v5 = objc_opt_new(NSMutableSet);
    -[MOEventBundle setSuggestionEngagementEvents:](self, "setSuggestionEngagementEvents:", v5);

  }
  v6 = v8;
  if (v8)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle suggestionEngagementEvents](self, "suggestionEngagementEvents"));
    objc_msgSend(v7, "addObject:", v8);

    v6 = v8;
  }

}

- (void)clearSuggestionEngagementEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MOEventBundle suggestionEngagementEvents](self, "suggestionEngagementEvents"));
  objc_msgSend(v5, "removeObject:", v4);

}

- (BOOL)hasAppEntryEngagementEvent:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle appEntryEngagementEvents](self, "appEntryEngagementEvents"));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)setAppEntryEngagementEvent:(id)a3
{
  void *v4;
  NSMutableSet *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle appEntryEngagementEvents](self, "appEntryEngagementEvents"));

  if (!v4)
  {
    v5 = objc_opt_new(NSMutableSet);
    -[MOEventBundle setAppEntryEngagementEvents:](self, "setAppEntryEngagementEvents:", v5);

  }
  v6 = v8;
  if (v8)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle appEntryEngagementEvents](self, "appEntryEngagementEvents"));
    objc_msgSend(v7, "addObject:", v8);

    v6 = v8;
  }

}

- (void)clearAppEntryEngagementEvent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MOEventBundle appEntryEngagementEvents](self, "appEntryEngagementEvents"));
  objc_msgSend(v5, "removeObject:", v4);

}

- (double)duration
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle endDate](self, "endDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventBundle startDate](self, "startDate"));
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  return v6;
}

- (NSUUID)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSUUID)suggestionID
{
  return self->_suggestionID;
}

- (void)setSuggestionID:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionID, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (unint64_t)source
{
  return self->_source;
}

- (void)setSource:(unint64_t)a3
{
  self->_source = a3;
}

- (BOOL)filtered
{
  return self->_filtered;
}

- (void)setFiltered:(BOOL)a3
{
  self->_filtered = a3;
}

- (NSString)bundleType
{
  return self->_bundleType;
}

- (void)setBundleType:(id)a3
{
  objc_storeStrong((id *)&self->_bundleType, a3);
}

- (unint64_t)interfaceType
{
  return self->_interfaceType;
}

- (void)setInterfaceType:(unint64_t)a3
{
  self->_interfaceType = a3;
}

- (NSMutableDictionary)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_metaData, a3);
}

- (NSArray)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
  objc_storeStrong((id *)&self->_labels, a3);
}

- (NSArray)promptLanguages
{
  return self->_promptLanguages;
}

- (void)setPromptLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_promptLanguages, a3);
}

- (NSString)promptLanguage
{
  return self->_promptLanguage;
}

- (void)setPromptLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_promptLanguage, a3);
}

- (NSDictionary)metaDataForRank
{
  return self->_metaDataForRank;
}

- (void)setMetaDataForRank:(id)a3
{
  objc_storeStrong((id *)&self->_metaDataForRank, a3);
}

- (unint64_t)photoSource
{
  return self->_photoSource;
}

- (void)setPhotoSource:(unint64_t)a3
{
  self->_photoSource = a3;
}

- (NSArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
  objc_storeStrong((id *)&self->_events, a3);
}

- (MOAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_storeStrong((id *)&self->_action, a3);
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (MOAction)concurrentMediaAction
{
  return self->_concurrentMediaAction;
}

- (void)setConcurrentMediaAction:(id)a3
{
  objc_storeStrong((id *)&self->_concurrentMediaAction, a3);
}

- (NSArray)backgroundActions
{
  return self->_backgroundActions;
}

- (void)setBackgroundActions:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundActions, a3);
}

- (NSArray)persons
{
  return self->_persons;
}

- (void)setPersons:(id)a3
{
  objc_storeStrong((id *)&self->_persons, a3);
}

- (MOPlace)place
{
  return self->_place;
}

- (void)setPlace:(id)a3
{
  objc_storeStrong((id *)&self->_place, a3);
}

- (MOWeather)predominantWeather
{
  return self->_predominantWeather;
}

- (void)setPredominantWeather:(id)a3
{
  objc_storeStrong((id *)&self->_predominantWeather, a3);
}

- (NSArray)places
{
  return self->_places;
}

- (void)setPlaces:(id)a3
{
  objc_storeStrong((id *)&self->_places, a3);
}

- (MOTime)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
  objc_storeStrong((id *)&self->_time, a3);
}

- (NSArray)resources
{
  return self->_resources;
}

- (void)setResources:(id)a3
{
  objc_storeStrong((id *)&self->_resources, a3);
}

- (NSArray)photoTraits
{
  return self->_photoTraits;
}

- (void)setPhotoTraits:(id)a3
{
  objc_storeStrong((id *)&self->_photoTraits, a3);
}

- (NSDictionary)rankingDictionary
{
  return self->_rankingDictionary;
}

- (void)setRankingDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_rankingDictionary, a3);
}

- (NSMutableSet)suggestionEngagementEvents
{
  return self->_suggestionEngagementEvents;
}

- (void)setSuggestionEngagementEvents:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionEngagementEvents, a3);
}

- (unint64_t)suggestionEngagementViewCount
{
  return self->_suggestionEngagementViewCount;
}

- (void)setSuggestionEngagementViewCount:(unint64_t)a3
{
  self->_suggestionEngagementViewCount = a3;
}

- (NSMutableSet)appEntryEngagementEvents
{
  return self->_appEntryEngagementEvents;
}

- (void)setAppEntryEngagementEvents:(id)a3
{
  objc_storeStrong((id *)&self->_appEntryEngagementEvents, a3);
}

- (BOOL)isAggregatedAndSuppressed
{
  return self->_isAggregatedAndSuppressed;
}

- (void)setIsAggregatedAndSuppressed:(BOOL)a3
{
  self->_isAggregatedAndSuppressed = a3;
}

- (unint64_t)summarizationGranularity
{
  return self->_summarizationGranularity;
}

- (void)setSummarizationGranularity:(unint64_t)a3
{
  self->_summarizationGranularity = a3;
}

- (NSArray)subBundleIDs
{
  return self->_subBundleIDs;
}

- (void)setSubBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_subBundleIDs, a3);
}

- (NSArray)subSuggestionIDs
{
  return self->_subSuggestionIDs;
}

- (void)setSubSuggestionIDs:(id)a3
{
  objc_storeStrong((id *)&self->_subSuggestionIDs, a3);
}

- (unint64_t)timeAtHomeSubType
{
  return self->_timeAtHomeSubType;
}

- (void)setTimeAtHomeSubType:(unint64_t)a3
{
  self->_timeAtHomeSubType = a3;
}

- (BOOL)includedInSummaryBundleOnly
{
  return self->_includedInSummaryBundleOnly;
}

- (void)setIncludedInSummaryBundleOnly:(BOOL)a3
{
  self->_includedInSummaryBundleOnly = a3;
}

- (NSArray)visitEventsRejectedByWatchLocation
{
  return self->_visitEventsRejectedByWatchLocation;
}

- (void)setVisitEventsRejectedByWatchLocation:(id)a3
{
  objc_storeStrong((id *)&self->_visitEventsRejectedByWatchLocation, a3);
}

- (unint64_t)bundleSubType
{
  return self->_bundleSubType;
}

- (void)setBundleSubType:(unint64_t)a3
{
  self->_bundleSubType = a3;
}

- (unint64_t)bundleSuperType
{
  return self->_bundleSuperType;
}

- (void)setBundleSuperType:(unint64_t)a3
{
  self->_bundleSuperType = a3;
}

- (NSDate)firstCreationDate
{
  return self->_firstCreationDate;
}

- (void)setFirstCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_firstCreationDate, a3);
}

- (MOClusterMetadata)clusterMetadata
{
  return self->_clusterMetadata;
}

- (void)setClusterMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_clusterMetadata, a3);
}

- (MOOutlierMetadata)outlierMetadata
{
  return self->_outlierMetadata;
}

- (void)setOutlierMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_outlierMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outlierMetadata, 0);
  objc_storeStrong((id *)&self->_clusterMetadata, 0);
  objc_storeStrong((id *)&self->_firstCreationDate, 0);
  objc_storeStrong((id *)&self->_visitEventsRejectedByWatchLocation, 0);
  objc_storeStrong((id *)&self->_subSuggestionIDs, 0);
  objc_storeStrong((id *)&self->_subBundleIDs, 0);
  objc_storeStrong((id *)&self->_appEntryEngagementEvents, 0);
  objc_storeStrong((id *)&self->_suggestionEngagementEvents, 0);
  objc_storeStrong((id *)&self->_rankingDictionary, 0);
  objc_storeStrong((id *)&self->_photoTraits, 0);
  objc_storeStrong((id *)&self->_resources, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_places, 0);
  objc_storeStrong((id *)&self->_predominantWeather, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_persons, 0);
  objc_storeStrong((id *)&self->_backgroundActions, 0);
  objc_storeStrong((id *)&self->_concurrentMediaAction, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_metaDataForRank, 0);
  objc_storeStrong((id *)&self->_promptLanguage, 0);
  objc_storeStrong((id *)&self->_promptLanguages, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_bundleType, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_suggestionID, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (MOEventBundle)initWithEventBundleMO:(id)a3
{
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
  MOEventBundle *v14;
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
  NSMutableArray *v28;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  MOEvent *v34;
  id v35;
  SEL v36;
  void *v37;
  MOAction *v38;
  void *v39;
  MOAction *v40;
  SEL v41;
  void *v42;
  MOAction *v43;
  void *v44;
  MOAction *v45;
  SEL v46;
  NSMutableArray *v47;
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  void *j;
  MOAction *v53;
  id v54;
  SEL v55;
  NSMutableArray *v56;
  void *v57;
  id v58;
  id v59;
  uint64_t v60;
  void *k;
  MOPerson *v62;
  id v63;
  SEL v64;
  void *v65;
  MOPlace *v66;
  void *v67;
  MOPlace *v68;
  SEL v69;
  NSMutableArray *v70;
  void *v71;
  id v72;
  id v73;
  uint64_t v74;
  void *m;
  MOPlace *v76;
  id v77;
  SEL v78;
  void *v79;
  MOTime *v80;
  void *v81;
  MOTime *v82;
  SEL v83;
  void *v84;
  MOWeather *v85;
  void *v86;
  MOWeather *v87;
  SEL v88;
  NSMutableArray *v89;
  void *v90;
  id v91;
  id v92;
  uint64_t v93;
  void *n;
  MOResource *v95;
  id v96;
  SEL v97;
  void *v98;
  MOClusterMetadata *v99;
  void *v100;
  MOClusterMetadata *v101;
  SEL v102;
  NSMutableArray *v103;
  void *v104;
  id v105;
  id v106;
  uint64_t v107;
  void *ii;
  MOPhotoTrait *v109;
  id v110;
  SEL v111;
  void *v112;
  MOOutlierMetadata *v113;
  void *v114;
  MOOutlierMetadata *v115;
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
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _BYTE v141[128];
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "creationDate"));
    self = -[MOEventBundle initWithBundleIdentifier:creationDate:](self, "initWithBundleIdentifier:creationDate:", v6, v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "suggestionID"));
    -[MOEventBundle setSuggestionID:](self, "setSuggestionID:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "endDate"));
    -[MOEventBundle setEndDate:](self, "setEndDate:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startDate"));
    -[MOEventBundle setStartDate:](self, "setStartDate:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstCreationDate"));
    -[MOEventBundle setFirstCreationDate:](self, "setFirstCreationDate:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "expirationDate"));
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "expirationDate"));
      -[MOEventBundle setExpirationDate:](self, "setExpirationDate:", v13);
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "endDate"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dateByAddingTimeInterval:", 2419200.0));
      -[MOEventBundle setExpirationDate:](self, "setExpirationDate:", v15);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "source"));
    -[MOEventBundle setSource:](self, "setSource:", objc_msgSend(v16, "unsignedIntegerValue"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "interfaceType"));
    -[MOEventBundle setInterfaceType:](self, "setInterfaceType:", objc_msgSend(v17, "unsignedIntValue"));

    -[MOEventBundle setFiltered:](self, "setFiltered:", objc_msgSend(v5, "filtered"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "promptLanguage"));
    -[MOEventBundle setPromptLanguage:](self, "setPromptLanguage:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "metaDataForRank"));
    -[MOEventBundle setMetaDataForRank:](self, "setMetaDataForRank:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "photoSource"));
    -[MOEventBundle setPhotoSource:](self, "setPhotoSource:", objc_msgSend(v20, "unsignedIntValue"));

    -[MOEventBundle setIsAggregatedAndSuppressed:](self, "setIsAggregatedAndSuppressed:", objc_msgSend(v5, "isAggregatedAndSuppressed"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "summarizationGranularity"));
    -[MOEventBundle setSummarizationGranularity:](self, "setSummarizationGranularity:", objc_msgSend(v21, "unsignedIntValue"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subBundleIDs"));
    -[MOEventBundle setSubBundleIDs:](self, "setSubBundleIDs:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subSuggestionIDs"));
    -[MOEventBundle setSubSuggestionIDs:](self, "setSubSuggestionIDs:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "timeAtHomeSubType"));
    -[MOEventBundle setTimeAtHomeSubType:](self, "setTimeAtHomeSubType:", objc_msgSend(v24, "unsignedIntValue"));

    -[MOEventBundle setIncludedInSummaryBundleOnly:](self, "setIncludedInSummaryBundleOnly:", objc_msgSend(v5, "includedInSummaryBundleOnly"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "visitEventsRejectedByWatchLocation"));
    -[MOEventBundle setVisitEventsRejectedByWatchLocation:](self, "setVisitEventsRejectedByWatchLocation:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleSubType"));
    -[MOEventBundle setBundleSubType:](self, "setBundleSubType:", objc_msgSend(v26, "unsignedIntValue"));

    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleSuperType"));
    -[MOEventBundle setBundleSuperType:](self, "setBundleSuperType:", objc_msgSend(v27, "unsignedIntValue"));

    v28 = objc_opt_new(NSMutableArray);
    v137 = 0u;
    v138 = 0u;
    v139 = 0u;
    v140 = 0u;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "events"));
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v137, v146, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v138;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(_QWORD *)v138 != v32)
            objc_enumerationMutation(v29);
          v34 = -[MOEvent initWithEventMO:]([MOEvent alloc], "initWithEventMO:", *(_QWORD *)(*((_QWORD *)&v137 + 1) + 8 * (_QWORD)i));
          -[NSMutableArray addObject:](v28, "addObject:", v34);

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v137, v146, 16);
      }
      while (v31);
    }

    v35 = -[NSMutableArray copy](v28, "copy");
    -[MOEventBundle setEvents:](self, "setEvents:", v35);

    v36 = NSSelectorFromString(CFSTR("action"));
    if ((objc_opt_respondsToSelector(v5, v36) & 1) != 0)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "action"));

      if (v37)
      {
        v38 = [MOAction alloc];
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "action"));
        v40 = -[MOAction initWithActionMO:](v38, "initWithActionMO:", v39);
        -[MOEventBundle setAction:](self, "setAction:", v40);

      }
    }
    v41 = NSSelectorFromString(CFSTR("concurrentMediaAction"));
    if ((objc_opt_respondsToSelector(v5, v41) & 1) != 0)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "concurrentMediaAction"));

      if (v42)
      {
        v43 = [MOAction alloc];
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "concurrentMediaAction"));
        v45 = -[MOAction initWithActionMO:](v43, "initWithActionMO:", v44);
        -[MOEventBundle setConcurrentMediaAction:](self, "setConcurrentMediaAction:", v45);

      }
    }
    v46 = NSSelectorFromString(CFSTR("actions"));
    if ((objc_opt_respondsToSelector(v5, v46) & 1) != 0)
    {
      v47 = objc_opt_new(NSMutableArray);
      v133 = 0u;
      v134 = 0u;
      v135 = 0u;
      v136 = 0u;
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "actions"));
      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v133, v145, 16);
      if (v49)
      {
        v50 = v49;
        v51 = *(_QWORD *)v134;
        do
        {
          for (j = 0; j != v50; j = (char *)j + 1)
          {
            if (*(_QWORD *)v134 != v51)
              objc_enumerationMutation(v48);
            v53 = -[MOAction initWithActionMO:]([MOAction alloc], "initWithActionMO:", *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * (_QWORD)j));
            -[NSMutableArray addObject:](v47, "addObject:", v53);

          }
          v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v133, v145, 16);
        }
        while (v50);
      }

      v54 = -[NSMutableArray copy](v47, "copy");
      -[MOEventBundle setActions:](self, "setActions:", v54);

    }
    v55 = NSSelectorFromString(CFSTR("persons"));
    if ((objc_opt_respondsToSelector(v5, v55) & 1) != 0)
    {
      v56 = objc_opt_new(NSMutableArray);
      v129 = 0u;
      v130 = 0u;
      v131 = 0u;
      v132 = 0u;
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "persons"));
      v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v129, v144, 16);
      if (v58)
      {
        v59 = v58;
        v60 = *(_QWORD *)v130;
        do
        {
          for (k = 0; k != v59; k = (char *)k + 1)
          {
            if (*(_QWORD *)v130 != v60)
              objc_enumerationMutation(v57);
            v62 = -[MOPerson initWithPersonMO:]([MOPerson alloc], "initWithPersonMO:", *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * (_QWORD)k));
            -[NSMutableArray addObject:](v56, "addObject:", v62);

          }
          v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v129, v144, 16);
        }
        while (v59);
      }

      v63 = -[NSMutableArray copy](v56, "copy");
      -[MOEventBundle setPersons:](self, "setPersons:", v63);

    }
    v64 = NSSelectorFromString(CFSTR("place"));
    if ((objc_opt_respondsToSelector(v5, v64) & 1) != 0)
    {
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "place"));

      if (v65)
      {
        v66 = [MOPlace alloc];
        v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "place"));
        v68 = -[MOPlace initWithPlaceMO:](v66, "initWithPlaceMO:", v67);
        -[MOEventBundle setPlace:](self, "setPlace:", v68);

      }
    }
    v69 = NSSelectorFromString(CFSTR("places"));
    if ((objc_opt_respondsToSelector(v5, v69) & 1) != 0)
    {
      v70 = objc_opt_new(NSMutableArray);
      v125 = 0u;
      v126 = 0u;
      v127 = 0u;
      v128 = 0u;
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "places"));
      v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v125, v143, 16);
      if (v72)
      {
        v73 = v72;
        v74 = *(_QWORD *)v126;
        do
        {
          for (m = 0; m != v73; m = (char *)m + 1)
          {
            if (*(_QWORD *)v126 != v74)
              objc_enumerationMutation(v71);
            v76 = -[MOPlace initWithPlaceMO:]([MOPlace alloc], "initWithPlaceMO:", *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * (_QWORD)m));
            -[NSMutableArray addObject:](v70, "addObject:", v76);

          }
          v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v125, v143, 16);
        }
        while (v73);
      }

      v77 = -[NSMutableArray copy](v70, "copy");
      -[MOEventBundle setPlaces:](self, "setPlaces:", v77);

    }
    v78 = NSSelectorFromString(CFSTR("time"));
    if ((objc_opt_respondsToSelector(v5, v78) & 1) != 0)
    {
      v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "time"));

      if (v79)
      {
        v80 = [MOTime alloc];
        v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "time"));
        v82 = -[MOTime initWithTimeMO:](v80, "initWithTimeMO:", v81);
        -[MOEventBundle setTime:](self, "setTime:", v82);

      }
    }
    v83 = NSSelectorFromString(CFSTR("predominantWeather"));
    if ((objc_opt_respondsToSelector(v5, v83) & 1) != 0)
    {
      v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "predominantWeather"));

      if (v84)
      {
        v85 = [MOWeather alloc];
        v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "predominantWeather"));
        v87 = -[MOWeather initWithWeatherMO:](v85, "initWithWeatherMO:", v86);
        -[MOEventBundle setPredominantWeather:](self, "setPredominantWeather:", v87);

      }
    }
    v88 = NSSelectorFromString(CFSTR("resources"));
    if ((objc_opt_respondsToSelector(v5, v88) & 1) != 0)
    {
      v89 = objc_opt_new(NSMutableArray);
      v121 = 0u;
      v122 = 0u;
      v123 = 0u;
      v124 = 0u;
      v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resources"));
      v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v121, v142, 16);
      if (v91)
      {
        v92 = v91;
        v93 = *(_QWORD *)v122;
        do
        {
          for (n = 0; n != v92; n = (char *)n + 1)
          {
            if (*(_QWORD *)v122 != v93)
              objc_enumerationMutation(v90);
            v95 = -[MOResource initWithResourceMO:]([MOResource alloc], "initWithResourceMO:", *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * (_QWORD)n));
            -[NSMutableArray addObject:](v89, "addObject:", v95);

          }
          v92 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v121, v142, 16);
        }
        while (v92);
      }

      v96 = -[NSMutableArray copy](v89, "copy");
      -[MOEventBundle setResources:](self, "setResources:", v96);

    }
    v97 = NSSelectorFromString(CFSTR("clusterMetadata"));
    if ((objc_opt_respondsToSelector(v5, v97) & 1) != 0)
    {
      v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clusterMetadata"));

      if (v98)
      {
        v99 = [MOClusterMetadata alloc];
        v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clusterMetadata"));
        v101 = -[MOClusterMetadata initWithClusterMetadataMO:](v99, "initWithClusterMetadataMO:", v100);
        -[MOEventBundle setClusterMetadata:](self, "setClusterMetadata:", v101);

      }
    }
    v102 = NSSelectorFromString(CFSTR("photoTraits"));
    if ((objc_opt_respondsToSelector(v5, v102) & 1) != 0)
    {
      v103 = objc_opt_new(NSMutableArray);
      v117 = 0u;
      v118 = 0u;
      v119 = 0u;
      v120 = 0u;
      v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "photoTraits", 0));
      v105 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v117, v141, 16);
      if (v105)
      {
        v106 = v105;
        v107 = *(_QWORD *)v118;
        do
        {
          for (ii = 0; ii != v106; ii = (char *)ii + 1)
          {
            if (*(_QWORD *)v118 != v107)
              objc_enumerationMutation(v104);
            v109 = -[MOPhotoTrait initWithPhotoTraitMO:]([MOPhotoTrait alloc], "initWithPhotoTraitMO:", *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * (_QWORD)ii));
            -[NSMutableArray addObject:](v103, "addObject:", v109);

          }
          v106 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v117, v141, 16);
        }
        while (v106);
      }

      v110 = -[NSMutableArray copy](v103, "copy");
      -[MOEventBundle setPhotoTraits:](self, "setPhotoTraits:", v110);

    }
    v111 = NSSelectorFromString(CFSTR("outlierMetadata"));
    if ((objc_opt_respondsToSelector(v5, v111) & 1) != 0)
    {
      v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "outlierMetadata"));

      if (v112)
      {
        v113 = [MOOutlierMetadata alloc];
        v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "outlierMetadata"));
        v115 = -[MOOutlierMetadata initWithOutlierMetadataMO:](v113, "initWithOutlierMetadataMO:", v114);
        -[MOEventBundle setOutlierMetadata:](self, "setOutlierMetadata:", v115);

      }
    }

    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)primarySourceTypes
{
  unint64_t v3;
  void *v4;
  __CFString **v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  __CFString *v10;
  __CFString *v11;
  _QWORD v12[2];
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  _QWORD v23[2];
  __CFString *v24;
  __CFString *v25;

  v3 = -[MOEventBundle interfaceType](self, "interfaceType");
  v4 = &__NSArray0__struct;
  switch(v3)
  {
    case 1uLL:
      v25 = MOEventBundleSourceTypeActivity;
      v5 = &v25;
      goto LABEL_30;
    case 2uLL:
    case 0xDuLL:
      v24 = MOEventBundleSourceTypeVisitLocation[0];
      v5 = &v24;
      goto LABEL_30;
    case 3uLL:
    case 0xAuLL:
      v22 = MOEventBundleSourceTypePhoto[0];
      v5 = &v22;
      goto LABEL_30;
    case 4uLL:
      v21 = MOEventBundleSourceTypeContact[0];
      v5 = &v21;
      goto LABEL_30;
    case 5uLL:
      v20 = MOEventBundleSourceTypeMedia[0];
      v5 = &v20;
      goto LABEL_30;
    case 7uLL:
      v23[0] = MOEventBundleSourceTypeVisitLocation[0];
      v23[1] = MOEventBundleSourceTypePhoto[0];
      v5 = (__CFString **)v23;
      goto LABEL_8;
    case 9uLL:
      v7 = -[MOEventBundle bundleSubType](self, "bundleSubType");
      switch(v7)
      {
        case 0x268uLL:
          v15 = MOEventBundleSourceTypePhoto[0];
          v5 = &v15;
          goto LABEL_30;
        case 0x12FuLL:
          v16 = MOEventBundleSourceTypeContact[0];
          v5 = &v16;
          goto LABEL_30;
        case 0xCBuLL:
          v17 = MOEventBundleSourceTypeActivity;
          v5 = &v17;
          goto LABEL_30;
      }
      return &__NSArray0__struct;
    case 0xBuLL:
      v19 = MOEventBundleSourceTypeReflectionPrompt[0];
      v5 = &v19;
      goto LABEL_30;
    case 0xCuLL:
      v8 = -[MOEventBundle bundleSubType](self, "bundleSubType");
      v4 = &__NSArray0__struct;
      if (v8 <= 204)
      {
        if ((unint64_t)(v8 - 101) >= 5)
        {
          if ((unint64_t)(v8 - 201) >= 4)
            return v4;
          v13 = MOEventBundleSourceTypeActivity;
          v5 = &v13;
        }
        else
        {
          v14 = MOEventBundleSourceTypeVisitLocation[0];
          v5 = &v14;
        }
        goto LABEL_30;
      }
      if ((unint64_t)(v8 - 401) <= 4 && ((1 << (v8 + 111)) & 0x19) != 0)
      {
        v10 = MOEventBundleSourceTypeMedia[0];
        v5 = &v10;
LABEL_30:
        v6 = 1;
        goto LABEL_31;
      }
      if ((unint64_t)(v8 - 205) >= 2)
      {
        if (v8 != 302)
          return v4;
        v11 = MOEventBundleSourceTypeContact[0];
        v5 = &v11;
        goto LABEL_30;
      }
      v12[0] = MOEventBundleSourceTypeActivity;
      v12[1] = MOEventBundleSourceTypeVisitLocation[0];
      v5 = (__CFString **)v12;
LABEL_8:
      v6 = 2;
LABEL_31:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, v6));
      return v4;
    case 0xEuLL:
      v18 = MOEventBundleSourceTypeStateOfMind[0];
      v5 = &v18;
      goto LABEL_30;
    default:
      return v4;
  }
}

- (void)initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: bundleIdentifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: suggestionID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: startDate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: endDate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)initWithBundleIdentifier:suggestionID:startDate:endDate:creationDate:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_3((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: creationDate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)dateInterval
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  __int16 v6;
  int v7;

  v2 = 138412802;
  v3 = a1;
  v4 = 2080;
  v5 = "-[MOEventBundle dateInterval]";
  v6 = 1024;
  v7 = 1434;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "startDate is NOT earlier than endDate, bundle, %@ (in %s:%d)", (uint8_t *)&v2, 0x1Cu);
}

@end
