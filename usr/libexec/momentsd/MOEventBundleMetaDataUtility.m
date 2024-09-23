@implementation MOEventBundleMetaDataUtility

+ (void)defineClassCollections
{
  if (defineClassCollections_onceToken != -1)
    dispatch_once(&defineClassCollections_onceToken, &__block_literal_global);
}

void __54__MOEventBundleMetaDataUtility_defineClassCollections__block_invoke(id a1)
{
  void *v1;
  void *v2;

  v1 = (void *)noSavoringPromptLabels;
  noSavoringPromptLabels = (uint64_t)&off_1002DC488;

  v2 = (void *)noReappraisalPromptLabels;
  noReappraisalPromptLabels = (uint64_t)&off_1002DC4A0;

}

+ (id)buildMetaDataForEventBundle:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a3;
  v4 = 0;
  switch((unint64_t)objc_msgSend(v3, "interfaceType"))
  {
    case 1uLL:
      v5 = objc_claimAutoreleasedReturnValue(+[MOEventBundleMetaDataUtility buildActivityMetaDataForEventBundle:](MOEventBundleMetaDataUtility, "buildActivityMetaDataForEventBundle:", v3));
      goto LABEL_18;
    case 2uLL:
      v5 = objc_claimAutoreleasedReturnValue(+[MOEventBundleMetaDataUtility buildOutingMetaDataForEventBundle:](MOEventBundleMetaDataUtility, "buildOutingMetaDataForEventBundle:", v3));
      goto LABEL_18;
    case 4uLL:
      v5 = objc_claimAutoreleasedReturnValue(+[MOEventBundleMetaDataUtility buildSignificantContactMetaDataForEventBundle:](MOEventBundleMetaDataUtility, "buildSignificantContactMetaDataForEventBundle:", v3));
      goto LABEL_18;
    case 5uLL:
      v5 = objc_claimAutoreleasedReturnValue(+[MOEventBundleMetaDataUtility buildMediaPlayMetaDataForEventBundle:](MOEventBundleMetaDataUtility, "buildMediaPlayMetaDataForEventBundle:", v3));
      goto LABEL_18;
    case 6uLL:
      v5 = objc_claimAutoreleasedReturnValue(+[MOEventBundleMetaDataUtility buildSharedContentMetaDataForEventBundle:](MOEventBundleMetaDataUtility, "buildSharedContentMetaDataForEventBundle:", v3));
      goto LABEL_18;
    case 7uLL:
      v5 = objc_claimAutoreleasedReturnValue(+[MOEventBundleMetaDataUtility buildTimeAtHomeMetaDataForEventBundle:](MOEventBundleMetaDataUtility, "buildTimeAtHomeMetaDataForEventBundle:", v3));
      goto LABEL_18;
    case 9uLL:
      v5 = objc_claimAutoreleasedReturnValue(+[MOEventBundleMetaDataUtility buildTrendMetaDataForEventBundle:](MOEventBundleMetaDataUtility, "buildTrendMetaDataForEventBundle:", v3));
      goto LABEL_18;
    case 0xAuLL:
      v5 = objc_claimAutoreleasedReturnValue(+[MOEventBundleMetaDataUtility buildPhotoMemoryMetaDataForEventBundle:](MOEventBundleMetaDataUtility, "buildPhotoMemoryMetaDataForEventBundle:", v3));
      goto LABEL_18;
    case 0xBuLL:
      v5 = objc_claimAutoreleasedReturnValue(+[MOEventBundleMetaDataUtility buildEvergreenMetaDataForEventBundle:](MOEventBundleMetaDataUtility, "buildEvergreenMetaDataForEventBundle:", v3));
      goto LABEL_18;
    case 0xCuLL:
      if (objc_msgSend(v3, "bundleSubType") == (id)205 || objc_msgSend(v3, "bundleSubType") == (id)206)
        v5 = objc_claimAutoreleasedReturnValue(+[MOEventBundleMetaDataUtility buildTimeContextTransitMetaDataForEventBundle:](MOEventBundleMetaDataUtility, "buildTimeContextTransitMetaDataForEventBundle:", v3));
      else
        v5 = objc_claimAutoreleasedReturnValue(+[MOEventBundleMetaDataUtility buildTimeContextMetaDataForEventBundle:](MOEventBundleMetaDataUtility, "buildTimeContextMetaDataForEventBundle:", v3));
      goto LABEL_18;
    case 0xDuLL:
      v5 = objc_claimAutoreleasedReturnValue(+[MOEventBundleMetaDataUtility buildTripMetaDataForEventBundle:](MOEventBundleMetaDataUtility, "buildTripMetaDataForEventBundle:", v3));
      goto LABEL_18;
    case 0xEuLL:
      v5 = objc_claimAutoreleasedReturnValue(+[MOEventBundleMetaDataUtility buildStateOfMindMetaDataForEventBundle:](MOEventBundleMetaDataUtility, "buildStateOfMindMetaDataForEventBundle:", v3));
      goto LABEL_18;
    case 0xFuLL:
      v5 = objc_claimAutoreleasedReturnValue(+[MOEventBundleMetaDataUtility buildClusteringMetaDataForEventBundle:](MOEventBundleMetaDataUtility, "buildClusteringMetaDataForEventBundle:", v3));
LABEL_18:
      v4 = (void *)v5;
      if (v5)
        +[MOEventBundleMetaDataUtility appendDefaultMetaData:](MOEventBundleMetaDataUtility, "appendDefaultMetaData:", v5);
      break;
    default:
      break;
  }

  return v4;
}

+ (void)appendDefaultMetaData:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer preferredLocalization](MOEventBundleLabelLocalizer, "preferredLocalization"));
  if (v3)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("language"));

}

+ (id)buildActivityMetaDataForEventBundle:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
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
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
    +[MOEventBundleMetaDataUtility setMetaDataForActivityAction:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForActivityAction:metaData:", v6, v4);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "concurrentMediaAction"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "concurrentMediaAction"));
    +[MOEventBundleMetaDataUtility setMetaDataForActivityConcurrentMediaAction:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForActivityConcurrentMediaAction:metaData:", v8, v4);

  }
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "places"));
  if (v9)
  {
    v10 = (void *)v9;
    if (objc_msgSend(v3, "bundleSubType") == (id)204 || objc_msgSend(v3, "bundleSubType") == (id)207)
    {

LABEL_9:
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "places", 0));
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v30 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "placeName"));

            if (v17)
              +[MOEventBundleMetaDataUtility setMetaDataForActivityPlace:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForActivityPlace:metaData:", v16, v4);
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v13);
      }

      goto LABEL_22;
    }
    v18 = objc_msgSend(v3, "bundleSubType");

    if (v18 == (id)208)
      goto LABEL_9;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    +[MOEventBundleMetaDataUtility setMetaDataForActivityPlace:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForActivityPlace:metaData:", v20, v4);

  }
LABEL_22:
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "time"));

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "time"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
    +[MOEventBundleMetaDataUtility setMetaDataForTime:startDate:endDate:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForTime:startDate:endDate:metaData:", v22, v23, v24, v4);

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persons"));

  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persons"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "suggestionID"));
    +[MOEventBundleMetaDataUtility setMetaDataForPersons:suggestionId:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForPersons:suggestionId:metaData:", v26, v27, v4);

  }
  return v4;
}

+ (id)buildOutingMetaDataForEventBundle:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v4 = a3;
  v5 = objc_opt_new(NSMutableDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "actions"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "actions"));
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K = %lu"), CFSTR("actionType"), 2));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "actions"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "filteredArrayUsingPredicate:", v9));

      if (objc_msgSend(v11, "count"))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "actionName"));

      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "action"));
  if (v13)
  {
    v14 = (void *)v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "action"));
    if (objc_msgSend(v15, "actionType") == (id)9)
    {

    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "action"));
      v17 = objc_msgSend(v16, "actionType");

      if (v17 != (id)10)
        goto LABEL_13;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "action"));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "actionName"));

    v6 = (void *)v19;
  }
LABEL_13:
  if (v6)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v6));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v20, CFSTR("action"));

    v22 = objc_msgSend((id)objc_opt_class(a1, v21), "keywordFromString:", v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v23, CFSTR("action_type"));

  }
  v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "action"));
  if (v24)
  {
    v25 = (void *)v24;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "action"));
    v27 = objc_msgSend(v26, "actionType");

    if (v27 == (id)11)
      -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", CFSTR("flight"), CFSTR("flight"));
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "action"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
  +[MOEventBundleMetaDataUtility setMetaDataForDiningAction:metaData:startDate:endDate:](MOEventBundleMetaDataUtility, "setMetaDataForDiningAction:metaData:startDate:endDate:", v28, v5, v29, v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "place"));
  +[MOEventBundleMetaDataUtility setMetaDataForPlace:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForPlace:metaData:", v31, v5);

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persons"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suggestionID"));
  +[MOEventBundleMetaDataUtility setMetaDataForPersons:suggestionId:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForPersons:suggestionId:metaData:", v32, v33, v5);

  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "time"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
  +[MOEventBundleMetaDataUtility setMetaDataForTime:startDate:endDate:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForTime:startDate:endDate:metaData:", v34, v35, v36, v5);

  return v5;
}

+ (id)buildSharedContentMetaDataForEventBundle:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  const __CFString *v10;
  void *v11;

  v3 = a3;
  v4 = objc_alloc((Class)NSMutableDictionary);
  v10 = CFSTR("default_label");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "actionName"));
  v11 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  v8 = objc_msgSend(v4, "initWithDictionary:", v7);

  return v8;
}

+ (id)buildTimeAtHomeMetaDataForEventBundle:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  _UNKNOWN **v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "actionName"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v6, CFSTR("default_label"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "actionName"));
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("Hosting at Home"));

  if (v9)
    v10 = &off_1002D7FA0;
  else
    v10 = &off_1002D7FB8;
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v10, CFSTR("home_activity"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persons"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persons"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "suggestionID"));
    +[MOEventBundleMetaDataUtility setMetaDataForPersons:suggestionId:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForPersons:suggestionId:metaData:", v12, v13, v4);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "resources"));
  +[MOEventBundleMetaDataUtility setMetaDataForPhotos:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForPhotos:metaData:", v14, v4);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "time"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
  +[MOEventBundleMetaDataUtility setMetaDataForTime:startDate:endDate:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForTime:startDate:endDate:metaData:", v15, v16, v17, v4);

  return v4;
}

+ (id)buildSignificantContactMetaDataForEventBundle:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSMutableDictionary *v10;
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
  uint64_t v22;
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

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "action"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persons"));
    if (v7)
    {
      v8 = (void *)v7;
      v9 = objc_msgSend(v4, "summarizationGranularity");

      if (v9 != (id)2)
      {
        v10 = objc_opt_new(NSMutableDictionary);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "action"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persons"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionName"));
        v16 = v15;
        if (v14)
        {
          v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingString:", v14));

          v16 = (void *)v17;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v16, CFSTR("default_label"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionName"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v18));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v19, CFSTR("header"));

        -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v14, CFSTR("title"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionName"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v20));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v21, CFSTR("action"));

        v23 = (void *)objc_opt_class(a1, v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionName"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "keywordFromString:", v24));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v25, CFSTR("action_type"));

        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persons"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suggestionID"));
        +[MOEventBundleMetaDataUtility setMetaDataForPersons:suggestionId:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForPersons:suggestionId:metaData:", v26, v27, v10);

        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "time"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
        +[MOEventBundleMetaDataUtility setMetaDataForTime:startDate:endDate:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForTime:startDate:endDate:metaData:", v28, v29, v30, v10);

        goto LABEL_12;
      }
    }
    else
    {

    }
  }
  if (objc_msgSend(v4, "summarizationGranularity") == (id)2
    && (objc_msgSend(v4, "isAggregatedAndSuppressed") & 1) == 0)
  {
    v10 = objc_opt_new(NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", CFSTR("contact_summary"), CFSTR("summary_type"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persons"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suggestionID"));
    +[MOEventBundleMetaDataUtility setMetaDataForPersons:suggestionId:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForPersons:suggestionId:metaData:", v31, v32, v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "time"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
    +[MOEventBundleMetaDataUtility setMetaDataForTime:startDate:endDate:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForTime:startDate:endDate:metaData:", v11, v14, v16, v10);
LABEL_12:

    goto LABEL_13;
  }
  v10 = 0;
LABEL_13:

  return v10;
}

+ (id)buildMediaPlayMetaDataForEventBundle:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSMutableDictionary *v10;
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
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  void *v38;
  void *v39;
  void *v40;
  unsigned int v41;
  void *v42;
  void *v43;
  uint64_t v44;
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
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  unsigned int v71;
  void *v72;
  void *v73;
  void *v75;
  unsigned __int8 v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  unsigned __int8 v83;
  uint64_t v84;
  void *v85;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "action"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resources"));
    if (v7)
    {
      v8 = (void *)v7;
      v9 = objc_msgSend(v4, "summarizationGranularity");

      if (v9 != (id)2)
      {
        v80 = a1;
        v81 = objc_autoreleasePoolPush();
        v10 = objc_opt_new(NSMutableDictionary);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "action"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resources"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "getDictionary"));
        v84 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("media_album")));

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionName"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@"), v15, v16));

        -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v17, CFSTR("default_label"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionName"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v18));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v19, CFSTR("header"));

        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "name"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v20));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v21, CFSTR("title"));

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resources"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v22, "count")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v23, CFSTR("media_event_count"));

        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "getDictionary"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("MOMediaPlayMetaDataKeyPlayerMediaTypeKey")));

        v82 = v25;
        if ((objc_msgSend(v25, "isEqual:", MOMediaPlayMetaDataKeyPlayerMediaTypeSongAlbum[0]) & 1) != 0
          || (objc_msgSend(v25, "isEqual:", MOMediaPlayMetaDataKeyPlayerMediaTypePodcastArtist[0]) & 1) != 0
          || objc_msgSend(v25, "isEqual:", MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMediaAlbum[0]))
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "events"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v26, "count")));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v27, CFSTR("media_event_count"));

        }
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "getDictionary"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("media_type")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v29, CFSTR("media_type"));

        -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v84, CFSTR("media_album"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "time"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "endDate"));
        +[MOEventBundleMetaDataUtility setMetaDataForTime:startDate:endDate:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForTime:startDate:endDate:metaData:", v30, v31, v32, v10);

        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionName"));
        if ((objc_msgSend(v33, "isEqualToString:", CFSTR("songs_on_repeat")) & 1) == 0)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionName"));
          if (!objc_msgSend(v34, "isEqualToString:", CFSTR("song_on_repeat")))
          {
            v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionName"));
            v76 = objc_msgSend(v75, "isEqualToString:", CFSTR("media_on_repeat"));

            if ((v76 & 1) == 0)
              goto LABEL_13;
            goto LABEL_12;
          }

        }
LABEL_12:
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionName"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v35, CFSTR("media_on_repeat"));

LABEL_13:
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionName"));
        v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("media_on_repeat_third_party"));

        v38 = v81;
        if (v37)
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionName"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v39, CFSTR("media_on_repeat_third_party"));

        }
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionName"));
        v41 = objc_msgSend(v40, "isEqualToString:", CFSTR("played_media_sessions"));

        if (v41)
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionName"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v42, CFSTR("played_media_sessions"));

        }
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionName"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v43, CFSTR("action"));

        v45 = (void *)objc_opt_class(v80, v44);
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionName"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "keywordFromString:", v46));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v47, CFSTR("action_type"));

        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "getDictionary"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("third_party_dominate_value")));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v49, CFSTR("third_party_dominate_value"));

        v50 = (void *)v84;
LABEL_34:

        objc_autoreleasePoolPop(v38);
        goto LABEL_35;
      }
    }
    else
    {

    }
  }
  if (objc_msgSend(v4, "summarizationGranularity") == (id)2
    && (objc_msgSend(v4, "isAggregatedAndSuppressed") & 1) == 0)
  {
    v38 = objc_autoreleasePoolPush();
    v10 = objc_opt_new(NSMutableDictionary);
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resources"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "firstObject"));

    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", CFSTR("media_summary"), CFSTR("summary_type"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resources"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v52, "count")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v53, CFSTR("media_event_count"));

    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resources"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "firstObject"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "getDictionary"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("MOMediaPlayMetaDataKeyPlayerMediaTypeKey")));

    if ((objc_msgSend(v13, "isEqual:", MOMediaPlayMetaDataKeyPlayerMediaTypeSongAlbum[0]) & 1) != 0
      || (objc_msgSend(v13, "isEqual:", MOMediaPlayMetaDataKeyPlayerMediaTypePodcastArtist[0]) & 1) != 0
      || objc_msgSend(v13, "isEqual:", MOMediaPlayMetaDataKeyPlayerMediaTypeThirdPartyMediaAlbum[0]))
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "events"));
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v57, "count")));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v58, CFSTR("media_event_count"));

    }
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resources"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "firstObject"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "getDictionary"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("media_type")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v62, CFSTR("media_type"));

    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "action"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "actionName"));
    if ((objc_msgSend(v64, "isEqualToString:", CFSTR("songs_on_repeat")) & 1) == 0)
    {
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "action"));
      v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "actionName"));
      if ((objc_msgSend(v66, "isEqualToString:", CFSTR("song_on_repeat")) & 1) == 0)
      {
        v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "action"));
        v85 = v13;
        v78 = v38;
        v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "actionName"));
        v83 = objc_msgSend(v79, "isEqualToString:", CFSTR("media_on_repeat"));

        v38 = v78;
        v13 = v85;

        if ((v83 & 1) == 0)
          goto LABEL_31;
        goto LABEL_30;
      }

    }
LABEL_30:
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "action"));
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "actionName"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v68, CFSTR("media_on_repeat"));

LABEL_31:
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "action"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "actionName"));
    v71 = objc_msgSend(v70, "isEqualToString:", CFSTR("media_on_repeat_third_party"));

    if (v71)
    {
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "action"));
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "actionName"));
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v73, CFSTR("media_on_repeat_third_party"));

    }
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "getDictionary"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("third_party_dominate_value")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v17, CFSTR("third_party_dominate_value"));
    goto LABEL_34;
  }
  v10 = 0;
LABEL_35:

  return v10;
}

+ (id)buildPhotoMemoryMetaDataForEventBundle:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v3 = a3;
  v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "resources"));

    if (v5)
    {
      v4 = objc_opt_new(NSMutableDictionary);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), CFSTR("Memories from Photos")));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionName"));
      v9 = objc_msgSend(v8, "length");

      if ((unint64_t)v9 >= 2)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v7, CFSTR("default_label"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionName"));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v10, CFSTR("title"));

      }
    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

+ (id)buildTrendMetaDataForEventBundle:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = a3;
  v5 = objc_opt_new(NSMutableDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "events"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
  v8 = objc_msgSend(v7, "category");

  if (v8 == (id)10)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "action"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persons"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingString:", v12));

    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v14, CFSTR("default_label"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v15));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v16, CFSTR("header"));

    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v12, CFSTR("title"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionName"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v17));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v18, CFSTR("action"));

    v20 = (void *)objc_opt_class(a1, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "actionName"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "keywordFromString:", v21));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v22, CFSTR("action_type"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persons"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suggestionID"));
    +[MOEventBundleMetaDataUtility setMetaDataForPersons:suggestionId:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForPersons:suggestionId:metaData:", v23, v24, v5);

  }
  return v5;
}

+ (id)buildEvergreenMetaDataForEventBundle:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id os_log;
  NSObject *v15;
  char *v16;
  char *j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  void *v28;
  NSMutableDictionary *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];

  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "resources"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "type") == (id)9)
        {
          v28 = v3;
          v9 = objc_opt_new(NSMutableDictionary);
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", CFSTR("EVERGREEN_LABEL")));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v10, CFSTR("default_label"));

          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("evergreen_type"), v11));

          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
          v29 = v9;
          +[MOEventBundleMetaDataUtility setMetaDataWithKeyword:extendedKeyword:value:metaData:](MOEventBundleMetaDataUtility, "setMetaDataWithKeyword:extendedKeyword:value:metaData:", CFSTR("evergreen_type"), v12, v13, v9);

          os_log = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
          v15 = objc_claimAutoreleasedReturnValue(os_log);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            +[MOEventBundleMetaDataUtility buildEvergreenMetaDataForEventBundle:].cold.2(v8);

          v16 = (char *)objc_msgSend(v8, "promptCount");
          if (v16)
          {
            for (j = 0; j != v16; ++j)
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "promptIndexes"));
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndex:", j));

              if (v19)
              {
                v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%d"), CFSTR("evergreen_slot_"), j));
                -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v19, v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%d"), CFSTR("evergreen_index"), objc_msgSend(v19, "intValue")));
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "stringValue"));
                +[MOEventBundleMetaDataUtility setMetaDataWithKeyword:extendedKeyword:value:metaData:](MOEventBundleMetaDataUtility, "setMetaDataWithKeyword:extendedKeyword:value:metaData:", v20, v21, v22, v29);

              }
            }
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", &off_1002D7FD0, CFSTR("shuffle_mode"));
          v23 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
          v24 = objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            +[MOEventBundleMetaDataUtility buildEvergreenMetaDataForEventBundle:].cold.2(v8);

          v25 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
          v26 = objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            +[MOEventBundleMetaDataUtility buildEvergreenMetaDataForEventBundle:].cold.1(v8, (uint64_t)v16, v26);

          v3 = v28;
          goto LABEL_22;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v5)
        continue;
      break;
    }
  }
  v29 = 0;
LABEL_22:

  return v29;
}

+ (id)buildTimeContextMetaDataForEventBundle:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
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
  id os_log;
  NSObject *v24;
  void *v25;
  void *v26;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
  v6 = objc_msgSend(v5, "actionType");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
  if (v6 == (id)4)
    +[MOEventBundleMetaDataUtility setMetaDataForActivityAction:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForActivityAction:metaData:", v7, v4);
  else
    +[MOEventBundleMetaDataUtility setMetaDataForAction:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForAction:metaData:", v7, v4);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actions"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actions"));
    +[MOEventBundleMetaDataUtility setMetaDataForActions:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForActions:metaData:", v9, v4);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    +[MOEventBundleMetaDataUtility setMetaDataForPlace:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForPlace:metaData:", v11, v4);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "places"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "places"));
    +[MOEventBundleMetaDataUtility setMetaDataForPlaces:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForPlaces:metaData:", v13, v4);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "time"));

  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "time"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
    +[MOEventBundleMetaDataUtility setMetaDataForTime:startDate:endDate:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForTime:startDate:endDate:metaData:", v15, v16, v17, v4);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persons"));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persons"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "suggestionID"));
    +[MOEventBundleMetaDataUtility setMetaDataForPersons:suggestionId:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForPersons:suggestionId:metaData:", v19, v20, v4);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
  if (objc_msgSend(v21, "actionType") != (id)4)
    goto LABEL_17;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "concurrentMediaAction"));

  if (v22)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "concurrentMediaAction"));
    +[MOEventBundleMetaDataUtility setMetaDataForActivityConcurrentMediaAction:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForActivityConcurrentMediaAction:metaData:", v21, v4);
LABEL_17:

  }
  if (objc_msgSend(v3, "bundleSubType") == (id)202
    && objc_msgSend(v3, "summarizationGranularity") == (id)2
    && (objc_msgSend(v3, "isAggregatedAndSuppressed") & 1) == 0)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", CFSTR("workout_summary"), CFSTR("summary_type"));
  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySummarization);
  v24 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v4, "allKeys"));
    v28 = 138412546;
    v29 = v25;
    v30 = 2112;
    v31 = v26;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "build meta for time context bundle, bundle startDate, %@, metaData, %@", (uint8_t *)&v28, 0x16u);

  }
  return v4;
}

+ (id)buildTimeContextTransitMetaDataForEventBundle:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
    +[MOEventBundleMetaDataUtility setMetaDataForActivityAction:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForActivityAction:metaData:", v6, v4);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "places"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "places"));
    +[MOEventBundleMetaDataUtility setMetaDataForPlaces:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForPlaces:metaData:", v8, v4);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "time"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "time"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
    +[MOEventBundleMetaDataUtility setMetaDataForTime:startDate:endDate:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForTime:startDate:endDate:metaData:", v10, v11, v12, v4);

  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", CFSTR("transit_summary"), CFSTR("summary_type"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "places"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));

  if ((objc_msgSend(v14, "placeType") == (id)2 || objc_msgSend(v14, "placeType") == (id)3)
    && objc_msgSend(v14, "placeType") != (id)4
    && objc_msgSend(v14, "placeType") != (id)5
    && objc_msgSend(v14, "proposition") != (id)4)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", CFSTR("YES"), CFSTR("destination_format"));
  }

  return v4;
}

+ (id)buildTripMetaDataForEventBundle:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  __CFString **v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
  v6 = objc_msgSend(v5, "actionType");

  if (v6 == (id)2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
    +[MOEventBundleMetaDataUtility setMetaDataForAction:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForAction:metaData:", v7, v4);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    +[MOEventBundleMetaDataUtility setMetaDataForPlace:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForPlace:metaData:", v9, v4);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("placeType"), &off_1002DC4B8));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "places"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "filteredArrayUsingPredicate:", v10));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    objc_msgSend(v13, "placeNameConfidence");
    v15 = v14;

    if ((unint64_t)objc_msgSend(v12, "count") >= 2)
    {
      v16 = kMOLabelFormatterMetaKeywordSingleDominantPlace;
      if (v15 < 0.8)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 0));
        objc_msgSend(v17, "placeNameConfidence");
        v19 = v18;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", 1));
        objc_msgSend(v20, "placeNameConfidence");
        v22 = v19 + v21;

        v16 = kMOLabelFormatterMetaKeywordDoubleDominantPlaces;
        if (v22 < 0.8)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", CFSTR("YES"), CFSTR("many_places"));
          if (v15 >= 0.4)
            v16 = kMOLabelFormatterMetaKeywordSingleDominantPlace;
        }
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", CFSTR("YES"), *v16);
      +[MOEventBundleMetaDataUtility setMetaDataForPlaces:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForPlaces:metaData:", v12, v4);
    }

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "time"));

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "time"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
    +[MOEventBundleMetaDataUtility setMetaDataForTime:startDate:endDate:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForTime:startDate:endDate:metaData:", v24, v25, v26, v4);

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persons"));

  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "persons"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "suggestionID"));
    +[MOEventBundleMetaDataUtility setMetaDataForPersons:suggestionId:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForPersons:suggestionId:metaData:", v28, v29, v4);

  }
  return v4;
}

+ (id)buildClusteringMetaDataForEventBundle:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "getSubTypeString"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v5, CFSTR("cluster_subtype"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
  v7 = objc_msgSend(v6, "actionType");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
  if (v7 == (id)4)
    +[MOEventBundleMetaDataUtility setMetaDataForActivityAction:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForActivityAction:metaData:", v8, v4);
  else
    +[MOEventBundleMetaDataUtility setMetaDataForAction:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForAction:metaData:", v8, v4);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "place"));
    +[MOEventBundleMetaDataUtility setMetaDataForPlace:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForPlace:metaData:", v10, v4);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "time"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "time"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
    +[MOEventBundleMetaDataUtility setMetaDataForTime:startDate:endDate:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForTime:startDate:endDate:metaData:", v12, v13, v14, v4);

  }
  return v4;
}

+ (id)buildStateOfMindMetaDataForEventBundle:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  char *v11;
  char *v12;
  uint64_t v13;
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
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  NSMutableDictionary *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *i;
  uint64_t v40;
  void *v41;
  unsigned int v42;
  void *v43;
  unsigned __int8 v44;
  void *v45;
  unsigned __int8 v46;
  void *v47;
  unsigned int v48;
  void *v49;
  unsigned __int8 v50;
  void *v51;
  unsigned __int8 v52;
  id obj;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];

  v3 = a3;
  +[MOEventBundleMetaDataUtility defineClassCollections](MOEventBundleMetaDataUtility, "defineClassCollections");
  v4 = objc_opt_new(NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "time"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "time"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "startDate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "endDate"));
    +[MOEventBundleMetaDataUtility setMetaDataForTime:startDate:endDate:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForTime:startDate:endDate:metaData:", v6, v7, v8, v4);

  }
  if (objc_msgSend(v3, "bundleSubType") == (id)802)
    v9 = CFSTR("momentary_emotion");
  else
    v9 = CFSTR("daily_mood");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v9, CFSTR("reflective_interval"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
  v11 = (char *)objc_msgSend(v10, "actionSubtype");

  v12 = v11 - 1;
  if ((unint64_t)(v11 - 1) <= 6)
  {
    v13 = (uint64_t)*(&off_1002AD940 + (_QWORD)v12);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", *(&off_1002AD908 + (_QWORD)v12), CFSTR("valence_classification_granular"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v13, CFSTR("valence_classification"));
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "actionMetaData"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("MediaActionMetaDataAppName")));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "actionMetaData"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("MediaActionMetaDataAppName")));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v19, CFSTR("state_of_mind_app_name"));

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "metaDataForRank"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKey:", CFSTR("StateOfMindLabels")));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "count")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v22, CFSTR("state_of_mind_label_count"));

  if (objc_msgSend(v21, "count"))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", 0));
    v24 = (int)objc_msgSend(v23, "intValue");

    v25 = HKUILocalizedStringForStateOfMindLabel(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lowercaseString"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v27));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v28, CFSTR("state_of_mind_label_1"));

  }
  if ((unint64_t)objc_msgSend(v21, "count") >= 2)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", 1));
    v30 = (int)objc_msgSend(v29, "intValue");

    v31 = HKUILocalizedStringForStateOfMindLabel(v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "lowercaseString"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v33));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v34, CFSTR("state_of_mind_label_2"));

  }
  v35 = v4;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v21;
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v37; i = (char *)i + 1)
      {
        if (*(_QWORD *)v56 != v38)
          objc_enumerationMutation(obj);
        v40 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
        if (objc_msgSend(v41, "actionSubtype") == (id)2)
        {
          v42 = objc_msgSend((id)noSavoringPromptLabels, "containsObject:", v40);

          if (v42)
            goto LABEL_27;
        }
        else
        {
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
          if (objc_msgSend(v43, "actionSubtype") == (id)3)
          {
            v44 = objc_msgSend((id)noSavoringPromptLabels, "containsObject:", v40);

            if ((v44 & 1) != 0)
              goto LABEL_27;
          }
          else
          {
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
            if (objc_msgSend(v45, "actionSubtype") == (id)4)
            {
              v46 = objc_msgSend((id)noSavoringPromptLabels, "containsObject:", v40);

              if ((v46 & 1) == 0)
                goto LABEL_29;
LABEL_27:
              -[NSMutableDictionary setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", CFSTR("Yes"), CFSTR("no_savoring_prompt"));
              goto LABEL_29;
            }

          }
        }
LABEL_29:
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
        if (objc_msgSend(v47, "actionSubtype") == (id)5)
        {
          v48 = objc_msgSend((id)noReappraisalPromptLabels, "containsObject:", v40);

          if (v48)
            goto LABEL_37;
        }
        else
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
          if (objc_msgSend(v49, "actionSubtype") == (id)6)
          {
            v50 = objc_msgSend((id)noReappraisalPromptLabels, "containsObject:", v40);

            if ((v50 & 1) != 0)
              goto LABEL_37;
          }
          else
          {
            v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "action"));
            if (objc_msgSend(v51, "actionSubtype") == (id)7)
            {
              v52 = objc_msgSend((id)noReappraisalPromptLabels, "containsObject:", v40);

              if ((v52 & 1) == 0)
                continue;
LABEL_37:
              -[NSMutableDictionary setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", CFSTR("Yes"), CFSTR("no_reappraisal_prompt"));
              continue;
            }

          }
        }
      }
      v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    }
    while (v37);
  }

  return v35;
}

+ (void)setMetaDataForAction:(id)a3 metaData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  if (a3)
  {
    v6 = a4;
    v7 = a3;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "actionName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v8));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("action"));

    v11 = (void *)objc_opt_class(a1, v10);
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "actionName"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "keywordFromString:", v13));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("action_type"));

  }
}

+ (void)setMetaDataForDiningAction:(id)a3 metaData:(id)a4 startDate:(id)a5 endDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v23)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "actionName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v13));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("action"));

    v16 = (void *)objc_opt_class(a1, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "actionName"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "keywordFromString:", v17));
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, CFSTR("action_type"));

    if (objc_msgSend(v23, "actionType") == (id)10)
    {
      v19 = +[MOTime mealtagFromStartDate:endDate:](MOTime, "mealtagFromStartDate:endDate:", v11, v12);
      if (v19 - 2000 <= 2)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", v19));
        if (v20)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("meal_type"), v20));
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v20));
          +[MOEventBundleMetaDataUtility setMetaDataWithKeyword:extendedKeyword:value:metaData:](MOEventBundleMetaDataUtility, "setMetaDataWithKeyword:extendedKeyword:value:metaData:", CFSTR("meal_type"), v21, v22, v10);

        }
      }
    }
  }

}

+ (void)setMetaDataForActions:(id)a3 metaData:(id)a4
{
  id v5;
  id v6;
  NSMutableSet *v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  unsigned __int8 v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  unsigned int v43;
  id obj;
  uint64_t v46;
  unsigned int v47;
  NSMutableSet *v48;
  NSMutableSet *v49;
  id v50;
  uint64_t v51;
  unsigned int v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];

  v5 = a3;
  v6 = a4;
  if (v5 && objc_msgSend(v5, "count"))
  {
    v49 = objc_opt_new(NSMutableSet);
    v7 = objc_opt_new(NSMutableSet);
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v42 = v5;
    obj = v5;
    v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    v48 = v7;
    v8 = 0;
    if (v50)
    {
      v47 = 0;
      v43 = 0;
      LODWORD(v9) = 0;
      v46 = *(_QWORD *)v54;
      v51 = 1;
      do
      {
        for (i = 0; i != v50; i = (char *)i + 1)
        {
          if (*(_QWORD *)v54 != v46)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%d"), CFSTR("action_"), (char *)i + v51));
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%d"), CFSTR("action_type"), (char *)i + v51));
          if (objc_msgSend(v11, "actionType") == (id)4)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionName"));
            +[MOEventBundleMetaDataUtility setActivityNameFromActionName:metaData:keyword:keywordType:](MOEventBundleMetaDataUtility, "setActivityNameFromActionName:metaData:keyword:keywordType:", v14, v6, v12, v13);
          }
          else
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionName"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v15));
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, v12);

            v18 = (void *)objc_opt_class(a1, v17);
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionName"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "keywordFromString:", v14));
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, v13);

          }
          if (objc_msgSend(v11, "actionType") == (id)4)
            LODWORD(v9) = v9 + 1;
          v52 = v9;
          if (objc_msgSend(v11, "actionType") == (id)2)
            v20 = (v8 + 1);
          else
            v20 = v8;
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionName"));
          v22 = -[NSMutableSet containsObject:](v48, "containsObject:", v21);

          if ((v22 & 1) == 0)
          {
            v23 = v6;
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionName"));
            -[NSMutableSet addObject:](v48, "addObject:", v24);

            v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%d"), CFSTR("unique_action_"), -[NSMutableSet count](v48, "count")));
            v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%d"), CFSTR("unique_action_type"), -[NSMutableSet count](v48, "count")));
            if (objc_msgSend(v11, "actionType") == (id)4)
            {
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionName"));
              +[MOEventBundleMetaDataUtility setActivityNameFromActionName:metaData:keyword:keywordType:](MOEventBundleMetaDataUtility, "setActivityNameFromActionName:metaData:keyword:keywordType:", v27, v6, v25, v26);

              ++v43;
            }
            else
            {
              v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionName"));
              v29 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v28));
              objc_msgSend(v23, "setObject:forKeyedSubscript:", v29, v25);

              v31 = (void *)objc_opt_class(a1, v30);
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "actionName"));
              v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "keywordFromString:", v32));
              objc_msgSend(v23, "setObject:forKeyedSubscript:", v33, v26);

              v6 = v23;
            }

          }
          v34 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedInteger:", objc_msgSend(v11, "actionType"));
          v35 = -[NSMutableSet containsObject:](v49, "containsObject:", v34);

          if ((v35 & 1) == 0)
          {
            ++v47;
            v36 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedInteger:", objc_msgSend(v11, "actionType"));
            -[NSMutableSet addObject:](v49, "addObject:", v36);

          }
          v8 = v20;
          v9 = v52;
        }
        v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
        v51 = (v51 + (_DWORD)i);
      }
      while (v50);
    }
    else
    {
      v47 = 0;
      v43 = 0;
      v9 = 0;
    }

    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(obj, "count")));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v37, CFSTR("action_count"));

    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v38, CFSTR("activity_count"));

    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v47));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v39, CFSTR("unique_action_type_count"));

    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v43));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v40, CFSTR("unique_activity_count"));

    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v8));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v41, CFSTR("visit_count"));

    v5 = v42;
  }

}

+ (void)setActivityNameFromActionName:(id)a3 metaData:(id)a4 keyword:(id)a5 keywordType:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int IsValid;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  char v20;
  id v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  const __CFString *v29;
  uint64_t v30;
  id v31;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "lowercaseString"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_CapitalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_CapitalizedStringForKey:", v13));
  v31 = v10;
  v15 = (uint64_t)+[HKWorkout _workoutActivityTypeFromString:](HKWorkout, "_workoutActivityTypeFromString:", v31);
  IsValid = _HKWorkoutActivityTypeIsValid();
  v17 = v31;
  if (IsValid)
  {
    v18 = HKUILocalizedWorkoutTypeName(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v18);

  }
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_LowercaseNounForKey:](MOEventBundleLabelLocalizer, "_Moments_LowercaseNounForKey:", v17));

  v20 = 1;
  if (v15 > 36)
  {
    v29 = 0;
    switch(v15)
    {
      case '-':
        v21 = v12;
        v22 = v14;
        v29 = 0;
        v23 = CFSTR("surfing");
        goto LABEL_22;
      case '.':
        v21 = v12;
        v22 = v14;
        v29 = 0;
        v23 = CFSTR("swim");
        goto LABEL_22;
      case '/':
      case '0':
      case '2':
      case '3':
        goto LABEL_23;
      case '1':
        v21 = v12;
        v22 = v14;
        v20 = 0;
        v29 = CFSTR("Track and Field");
        v23 = CFSTR("track and field");
        goto LABEL_22;
      case '4':
        v21 = v12;
        v22 = v14;
        v29 = 0;
        v23 = CFSTR("walk");
        goto LABEL_22;
      default:
        if (v15 == 37)
        {
          v21 = v12;
          v22 = v14;
          v29 = 0;
          v23 = CFSTR("run");
        }
        else
        {
          if (v15 != 63)
            goto LABEL_31;
          v21 = v12;
          v22 = v14;
          v29 = 0;
          v23 = CFSTR("HIIT");
        }
        break;
    }
    goto LABEL_22;
  }
  if (v15 > 23)
  {
    if (v15 == 24)
    {
      v21 = v12;
      v22 = v14;
      v29 = 0;
      v23 = CFSTR("hike");
    }
    else
    {
      if (v15 != 29)
      {
LABEL_31:
        v29 = 0;
        goto LABEL_23;
      }
      v21 = v12;
      v22 = v14;
      v20 = 0;
      v29 = CFSTR("Mind and Body Workout");
      v23 = CFSTR("mind and body workout");
    }
    goto LABEL_22;
  }
  v29 = 0;
  if (v15 == 1)
  {
    v21 = v12;
    v22 = v14;
    v23 = CFSTR("American football");
    goto LABEL_22;
  }
  if (v15 == 3)
  {
    v21 = v12;
    v22 = v14;
    v29 = 0;
    v23 = CFSTR("Australian football");
LABEL_22:

    IsValid = 0;
    v19 = (__CFString *)v23;
    v14 = v22;
    v12 = v21;
  }
LABEL_23:
  if ((unint64_t)v15 > 0x4F || v15 == 33)
  {

    v19 = CFSTR("workout");
  }
  else if (IsValid)
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, v13, v29);
    goto LABEL_30;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v19, v29));
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v25, v13);

  if ((v20 & 1) == 0)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v30));
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v26, v14);

  }
LABEL_30:
  v27 = objc_msgSend((id)objc_opt_class(a1, v24), "keywordFromString:", v19);
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v28, v12);

}

+ (void)setMetaDataForActivityAction:(id)a3 metaData:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = a4;
  if (v12)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "actionName"));
    +[MOEventBundleMetaDataUtility setActivityNameFromActionName:metaData:keyword:keywordType:](MOEventBundleMetaDataUtility, "setActivityNameFromActionName:metaData:keyword:keywordType:", v6, v5, CFSTR("action"), CFSTR("action_type"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v12, "actionSubtype")));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("workoutSubtype"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "actionMetaData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MediaActionMetaDataAppName")));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "actionMetaData"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MediaActionMetaDataAppName")));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("workout_app_name"));

    }
  }

}

+ (void)setMetaDataForMediaAction:(id)a3 metaData:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = a4;
  if (v7 && objc_msgSend(v7, "actionType") == (id)6)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "actionName"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("media"));

  }
}

+ (id)mediaKeywordWithType:(unint64_t)a3
{
  id result;
  NSString *v4;

  switch(a3)
  {
    case 1uLL:
      v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_title"), CFSTR("media"));
      goto LABEL_8;
    case 2uLL:
      v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_album"), CFSTR("media"));
      goto LABEL_8;
    case 3uLL:
      v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_artist"), CFSTR("media"));
      goto LABEL_8;
    case 4uLL:
      v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_genre"), CFSTR("media"));
      goto LABEL_8;
    case 5uLL:
      v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_app"), CFSTR("media"));
LABEL_8:
      result = (id)objc_claimAutoreleasedReturnValue(v4);
      break;
    default:
      result = CFSTR("media");
      break;
  }
  return result;
}

+ (void)setMetaDataForActivityConcurrentMediaAction:(id)a3 metaData:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  if (v17)
  {
    if (objc_msgSend(v17, "actionType") == (id)6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "actionMetaData"));

      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "actionName"));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("media"));

        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "actionMetaData"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MediaActionMetaDataMediaType")));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("media_type"));

        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "actionMetaData"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MediaActionMetaDataMediaInfoType")));

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "actionMetaData"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("MediaActionMetaDataMediaInfoType")));

          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "mediaKeywordWithType:", (int)objc_msgSend(v14, "intValue")));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "actionName"));
          +[MOEventBundleMetaDataUtility setMetaDataWithKeyword:extendedKeyword:value:metaData:](MOEventBundleMetaDataUtility, "setMetaDataWithKeyword:extendedKeyword:value:metaData:", CFSTR("media_name"), v15, v16, v6);

        }
      }
    }
  }

}

+ (void)setMetaDataWithKeyword:(id)a3 extendedKeyword:(id)a4 value:(id)a5 metaData:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id os_log;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v9 && v10 && v11)
  {
    v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v9, CFSTR("_string")));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, v9);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v10);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
    v13 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      v19 = 2048;
      v20 = objc_msgSend(v11, "length");
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "build meta, keyword, %@, extendedKeyword, %@, value, %lu", buf, 0x20u);
    }
  }

}

+ (void)setMetaDataForTime:(id)a3 startDate:(id)a4 endDate:(id)a5 metaData:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id os_log;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  id v32;
  id v33;
  NSObject *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  unint64_t v43;
  unint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  unint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  NSObject *v61;
  void *v62;
  unint64_t v63;
  unint64_t v64;
  void *v65;
  void *v66;
  id v67;
  uint8_t buf[4];
  id v69;
  __int16 v70;
  id v71;
  __int16 v72;
  unint64_t v73;
  __int16 v74;
  unint64_t v75;
  __int16 v76;
  unint64_t v77;
  __int16 v78;
  unint64_t v79;
  __int16 v80;
  void *v81;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timeZoneObject"));
  os_log = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
  v15 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    v69 = v13;
    v70 = 2112;
    v71 = v10;
    v72 = 2112;
    v73 = (unint64_t)v11;
    v74 = 2112;
    v75 = (unint64_t)v9;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "build meta, time zone, %@, startDate, %@, endDate, %@, time, %@", buf, 0x2Au);
  }

  if (v11)
  {
    if ((objc_msgSend(v11, "isBeforeDate:", v10) & 1) != 0)
    {
      v16 = v11;
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "snapToTheDay"));
      if (!objc_msgSend(v16, "isAfterDate:", v10))
        goto LABEL_14;
      v17 = v16;

      if (v17)
      {
        if (!objc_msgSend(v17, "isBeforeDate:", v10))
        {
          v11 = v17;
          goto LABEL_14;
        }
        v18 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v69 = v10;
          v70 = 2112;
          v71 = v17;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "setMetaDataForTime, startDate, %@, endDate, %@, the timestamps are inverted after snapping.", buf, 0x16u);
        }

      }
    }
    v11 = 0;
LABEL_14:

  }
  if (v9)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timeString"));

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "timeString"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v21));
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, CFSTR("time"));

    }
  }
  if (!v10)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "date"));

    v11 = 0;
  }
  if (!v13)
  {
    v26 = v11;
    v23 = v10;
LABEL_36:
    if (!v23)
    {
      v27 = 0;
      goto LABEL_68;
    }
    if (!v26)
      goto LABEL_42;
    goto LABEL_38;
  }
  if (v10)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime localTimeOfDate:timeZone:](MOTime, "localTimeOfDate:timeZone:", v10, v13));
    v24 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v69 = v13;
      v70 = 2112;
      v71 = v10;
      v72 = 2112;
      v73 = (unint64_t)v23;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "build meta, time zone, %@, startDate, %@, localDate, %@", buf, 0x20u);
    }

    if (!v11)
    {
      v26 = 0;
      v27 = 0;
      if (!v23)
        goto LABEL_68;
      goto LABEL_42;
    }
  }
  else
  {
    v23 = 0;
    v27 = 0;
    v26 = 0;
    if (!v11)
      goto LABEL_68;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime localTimeOfDate:timeZone:](MOTime, "localTimeOfDate:timeZone:", v11, v13));
  v28 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v69 = v13;
    v70 = 2112;
    v71 = v11;
    v72 = 2112;
    v73 = (unint64_t)v26;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "build meta, time zone, %@, endDate, %@, localDate, %@", buf, 0x20u);
  }

  if (!v23 || !v26)
    goto LABEL_36;
  if (objc_msgSend(v26, "isBeforeDate:", v23))
  {
    v30 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v69 = v23;
      v70 = 2112;
      v71 = v26;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "setMetaDataForTime, startDate, %@, endDate, %@, the timestamps are inverted after time zone shifting.", buf, 0x16u);
    }
LABEL_41:

    v26 = 0;
    goto LABEL_42;
  }
LABEL_38:
  if (objc_msgSend(v26, "isBeforeDate:", v23))
  {
    v32 = _mo_log_facility_get_os_log(&MOLogFacilityEventBundleManager);
    v31 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      +[MOEventBundleMetaDataUtility setMetaDataForTime:startDate:endDate:metaData:].cold.1((uint64_t)v23, (uint64_t)v26, v31);
    goto LABEL_41;
  }
LABEL_42:
  v33 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v69 = v13;
    v70 = 2112;
    v71 = v23;
    v72 = 2112;
    v73 = (unint64_t)v26;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "build meta after timezone shift, time zone, %@, startDate, %@, endDate, %@", buf, 0x20u);
  }

  v35 = +[MOTime dateReferenceTagFromStartDate:endDate:](MOTime, "dateReferenceTagFromStartDate:endDate:", v23, v26);
  if (v9)
    objc_msgSend(v9, "setDateReferenceTag:", v35);
  if (v35 >= 2)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", v35));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v36, CFSTR("date_referece_time_tag"));

  }
  if ((v35 & 0xFFFFFFFFFFFFFFFELL) == 0x64)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", v35));
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v37));
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("date_reference_"), v37));
    +[MOEventBundleMetaDataUtility setMetaDataWithKeyword:extendedKeyword:value:metaData:](MOEventBundleMetaDataUtility, "setMetaDataWithKeyword:extendedKeyword:value:metaData:", CFSTR("date_reference"), v39, v38, v12);

  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "dateByAddingTimeInterval:", -604800.0));

  v65 = (void *)v41;
  if (objc_msgSend(v23, "isAfterDate:", v41))
    objc_msgSend(v12, "setObject:forKeyedSubscript:", &off_1002D7FA0, CFSTR("date_referece_recency"));
  v67 = v9;
  v63 = +[MOTime typeOfDayTagFromStartDate:endDate:timeZone:](MOTime, "typeOfDayTagFromStartDate:endDate:timeZone:", v23, v26, 0);
  if (v63 == 10001)
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", 10001));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v42, CFSTR("typeOfDay"));

  }
  v66 = v13;
  v43 = +[MOTime dayOfWeekTagFromStartDate:endDate:](MOTime, "dayOfWeekTagFromStartDate:endDate:", v23, v26);
  v44 = v43 - 102;
  if (v43 - 102 <= 6)
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", v43));
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v45));
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), CFSTR("date_reference_"), v45));
    +[MOEventBundleMetaDataUtility setMetaDataWithKeyword:extendedKeyword:value:metaData:](MOEventBundleMetaDataUtility, "setMetaDataWithKeyword:extendedKeyword:value:metaData:", CFSTR("date_reference_weekday"), v47, v46, v12);

  }
  v64 = v43;
  v48 = v12;
  v49 = +[MOTime timetagFromStartDate:endDate:](MOTime, "timetagFromStartDate:endDate:", v23, v26);
  if (v49 - 2 <= 6)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", v49));
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v50));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v51, CFSTR("timeOfDay"));

    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("time")));
    if (!v52)
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("timeOfDay")));
      objc_msgSend(v48, "setObject:forKeyedSubscript:", v53, CFSTR("time"));

    }
    if (v44 <= 6)
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", v64));
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", v49));
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v54, v55));
      v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@_%@"), CFSTR("date_reference_"), v54, v55));
      +[MOEventBundleMetaDataUtility setMetaDataWithKeyword:extendedKeyword:value:metaData:](MOEventBundleMetaDataUtility, "setMetaDataWithKeyword:extendedKeyword:value:metaData:", CFSTR("date_reference_weekday_timeofday"), v57, v56, v48);

    }
  }
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime localizedDateStringFromDate:](MOTime, "localizedDateStringFromDate:", v23));
  objc_msgSend(v48, "setObject:forKeyedSubscript:", v58, CFSTR("date_string"));

  if (v26 && (objc_msgSend(v26, "isSameDayWithDate:", v23) & 1) == 0)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[MOTime localizedDateStringFromDate:](MOTime, "localizedDateStringFromDate:", v26));
    objc_msgSend(v48, "setObject:forKeyedSubscript:", v59, CFSTR("end_date_string"));

  }
  v60 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
  v61 = objc_claimAutoreleasedReturnValue(v60);
  if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
  {
    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("date_string")));
    *(_DWORD *)buf = 138413826;
    v69 = v23;
    v70 = 2112;
    v71 = v26;
    v72 = 2048;
    v73 = v35;
    v74 = 2048;
    v75 = v63;
    v76 = 2048;
    v77 = v64;
    v78 = 2048;
    v79 = v49;
    v80 = 2112;
    v81 = v62;
    _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_INFO, "build meta, startDate, %@, endDate, %@, dateTag, %lu, typeOfDay, %lu, dayOfWeek, %lu, timeOfDay, %lu, dateString, %@", buf, 0x48u);

  }
  v27 = v23;
  v12 = v48;
  v13 = v66;
  v9 = v67;
LABEL_68:

}

+ (void)setMetaDataForTime:(id)a3 metaData:(id)a4
{
  +[MOEventBundleMetaDataUtility setMetaDataForTime:startDate:endDate:metaData:](MOEventBundleMetaDataUtility, "setMetaDataForTime:startDate:endDate:metaData:", a3, 0, 0, a4);
}

+ (void)setMetaDataForPlace:(id)a3 metaData:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  double v27;
  double v28;
  const __CFString *v29;
  double v30;
  double v31;
  id v32;

  v32 = a3;
  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "placeName"));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = objc_msgSend(v32, "placeType");

    if (v8)
    {
      if (objc_msgSend(v32, "placeUserType")
        && (objc_msgSend(v32, "placeUserType") == (id)1 || objc_msgSend(v32, "placeUserType") == (id)2))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "placeName"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lowercaseString"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v10));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("place"));

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "placeName"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v12));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("Place"));

      }
      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "placeName"));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("place"));

        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "placeName"));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("Place"));
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "enclosingArea"));
      if (v15)
      {
        if (objc_msgSend(v32, "placeType") != (id)101 && objc_msgSend(v32, "placeType") != (id)102)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "enclosingArea"));
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("city"));

          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "placeName"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "enclosingArea"));
          v19 = objc_msgSend(v17, "containsString:", v18);

          if (v19)
            objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Yes"), CFSTR("place_name_overlap_with_city"));
        }
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v32, "placeType")));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("place_type"));

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v32, "placeUserType")));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("place_user_type"));

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventRoutine stringOfPlaceUserType:](MOEventRoutine, "stringOfPlaceUserType:", objc_msgSend(v32, "placeUserType")));
      v23 = v22;
      if (v22)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "lowercaseString"));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, CFSTR("place_user_type_tag"));

      }
      if (objc_msgSend(v32, "proposition") == (id)4)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("flight")));
        v26 = objc_msgSend(v25, "isEqual:", CFSTR("flight"));

        if ((v26 & 1) == 0)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", &off_1002D7FA0, CFSTR("vicinity"));
      }
      if (objc_msgSend(v32, "locationMode") == (id)2)
        objc_msgSend(v5, "setObject:forKeyedSubscript:", &off_1002D7FA0, CFSTR("trip"));
      if (objc_msgSend(v32, "placeType") == (id)3 && (objc_msgSend(v32, "placeNameConfidence"), v27 >= 0.95)
        || objc_msgSend(v32, "placeType") == (id)2 && (objc_msgSend(v32, "placeNameConfidence"), v28 >= 0.95)
        || objc_msgSend(v32, "placeUserType") && (unint64_t)objc_msgSend(v32, "placeUserType") < 0x64)
      {
        v29 = CFSTR("high");
      }
      else if (objc_msgSend(v32, "placeType") == (id)3 && (objc_msgSend(v32, "placeNameConfidence"), v30 >= 0.9)
             || objc_msgSend(v32, "placeType") == (id)2 && (objc_msgSend(v32, "placeNameConfidence"), v31 >= 0.5))
      {
        v29 = CFSTR("medium");
      }
      else
      {
        v29 = CFSTR("low");
      }
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, CFSTR("confidence"));

    }
  }

}

+ (BOOL)isAddressForPlace:(id)a3
{
  return (unint64_t)objc_msgSend(a3, "placeType") > 3;
}

+ (void)setMetaDataForActivityPlace:(id)a3 metaData:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned __int8 v22;
  id v23;

  v23 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "placeName"));
  if (v6 && objc_msgSend(v23, "placeType"))
  {
    v7 = objc_msgSend(v23, "placeUserType");

    if (v7 != (id)2)
    {
      if (objc_msgSend(v23, "placeUserType") && objc_msgSend(v23, "placeUserType") == (id)1)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "placeName"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lowercaseString"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v9));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("place"));

        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "placeName"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v11));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("Place"));

      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "placeName"));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("place"));

        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "placeName"));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("Place"));
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "enclosingArea"));
      if (v14)
      {
        if (objc_msgSend(v23, "placeType") != (id)101 && objc_msgSend(v23, "placeType") != (id)102)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "enclosingArea"));
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("city"));

          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "placeName"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "enclosingArea"));
          v18 = objc_msgSend(v16, "containsString:", v17);

          if (v18)
            objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("Yes"), CFSTR("place_name_overlap_with_city"));
        }
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v23, "placeType")));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("place_type"));

      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v23, "placeUserType")));
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("place_user_type"));

      if (objc_msgSend(v23, "proposition") == (id)4)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("flight")));
        v22 = objc_msgSend(v21, "isEqual:", CFSTR("flight"));

        if ((v22 & 1) == 0)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", &off_1002D7FA0, CFSTR("vicinity"));
      }
    }
  }
  else
  {

  }
}

+ (void)setMetaDataForPersons:(id)a3 suggestionId:(id)a4 metaData:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id os_log;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  NSObject *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  void *j;
  uint64_t v38;
  id v39;
  NSObject *v40;
  id v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
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
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  id obj;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE v79[128];
  uint8_t v80[128];
  uint8_t buf[4];
  uint64_t v82;
  _BYTE v83[128];

  v7 = a3;
  v8 = a4;
  v65 = a5;
  if (v7 && objc_msgSend(v7, "count"))
  {
    v62 = v7;
    v63 = v8;
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "allObjects"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "sortedArrayUsingSelector:", "comparePersons:"));
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
    v11 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "After Sorting setMetaDataForPersons", buf, 2u);
    }

    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v76;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v76 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)i);
          v18 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v82 = v17;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, " Person %@", buf, 0xCu);
          }

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v75, v83, 16);
      }
      while (v14);
    }

    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isMePerson == NO")));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "filteredArrayUsingPredicate:"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isMePerson == YES")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "filteredArrayUsingPredicate:"));
    if (objc_msgSend(v21, "count"))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstObject"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "name"));
      objc_msgSend(v65, "setObject:forKeyedSubscript:", v23, CFSTR("me_person"));

      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstObject"));
      LODWORD(v23) = objc_msgSend(v24, "mePersonIdentified");

      if ((_DWORD)v23)
        objc_msgSend(v65, "setObject:forKeyedSubscript:", CFSTR("Yes"), CFSTR("me_person_identified"));
      if ((unint64_t)objc_msgSend(v21, "count") >= 2)
      {
        v25 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          +[MOEventBundleMetaDataUtility setMetaDataForPersons:suggestionId:metaData:].cold.1((uint64_t)v21, v26);

      }
    }
    v64 = v12;
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isPHPersonTypeImportant == YES")));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "filteredArrayUsingPredicate:"));
    v27 = objc_msgSend(v54, "mutableCopy");
    v28 = objc_msgSend(v63, "hash");
    objc_msgSend(v27, "shuffleWithSeed:", v28);
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("isPHPersonTypeImportant == NO")));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "filteredArrayUsingPredicate:"));
    v29 = objc_msgSend(v51, "mutableCopy");
    objc_msgSend(v29, "shuffleWithSeed:", v28);
    v53 = v27;
    v50 = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "arrayByAddingObjectsFromArray:", v29));
    v31 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "all shuffed persons by importance except me Person", buf, 2u);
    }
    v56 = v21;
    v58 = v20;

    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v33 = v30;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v72;
      do
      {
        for (j = 0; j != v35; j = (char *)j + 1)
        {
          if (*(_QWORD *)v72 != v36)
            objc_enumerationMutation(v33);
          v38 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)j);
          v39 = _mo_log_facility_get_os_log(&MOLogFacilityFramework);
          v40 = objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v82 = v38;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, " Person %@", buf, 0xCu);
          }

        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
      }
      while (v35);
    }

    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    obj = v33;
    v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
    v42 = v64;
    if (v41)
    {
      v43 = v41;
      v44 = *(_QWORD *)v68;
      v45 = 1;
LABEL_34:
      v46 = 0;
      while (1)
      {
        if (*(_QWORD *)v68 != v44)
          objc_enumerationMutation(obj);
        v47 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v46);
        if (objc_msgSend(v47, "mePersonIdentified"))
          objc_msgSend(v65, "setObject:forKeyedSubscript:", CFSTR("Yes"), CFSTR("me_person_identified"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%d"), CFSTR("person_"), v45 + v46));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "name"));
        objc_msgSend(v65, "setObject:forKeyedSubscript:", v49, v48);

        v42 = v64;
        if ((unint64_t)((int)v45 + v46 + 1) > 3)
          break;
        if (v43 == (id)++v46)
        {
          v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
          v45 = (int)v45 + v46;
          if (v43)
            goto LABEL_34;
          break;
        }
      }
    }

    v7 = v62;
    v8 = v63;
  }

}

+ (void)setMetaDataForPlaces:(id)a3 metaData:(id)a4
{
  id v5;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;
  _UNKNOWN **v9;
  void *i;
  char *v11;
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
  unsigned __int8 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSMutableSet *v34;
  unsigned __int8 v35;
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
  double v47;
  double v48;
  const __CFString *v49;
  double v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  char v60;
  unsigned int v61;
  id v62;
  NSMutableSet *v63;
  unsigned int v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  NSMutableSet *v68;
  id v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];

  v5 = a3;
  v69 = a4;
  if (!v5 || !objc_msgSend(v5, "count"))
  {
    v52 = 0;
    v64 = 0;
    v53 = 0;
    goto LABEL_55;
  }
  v6 = objc_opt_new(NSMutableSet);
  v7 = objc_opt_new(NSMutableSet);
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v59 = v5;
  v8 = v5;
  v66 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
  if (!v66)
  {
    v61 = 0;
    v64 = 0;
    v60 = 0;
    goto LABEL_54;
  }
  v61 = 0;
  v64 = 0;
  v60 = 0;
  v65 = *(_QWORD *)v72;
  v67 = 1;
  v9 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;
  v62 = v8;
  v63 = v6;
  v68 = v7;
  do
  {
    for (i = 0; i != v66; i = (char *)i + 1)
    {
      if (*(_QWORD *)v72 != v65)
        objc_enumerationMutation(v8);
      v11 = (char *)i + v67;
      v12 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)i);
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[329], "stringWithFormat:", CFSTR("%@%d"), CFSTR("place_"), (char *)i + v67));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[329], "stringWithFormat:", CFSTR("%@%d"), CFSTR("Place_"), (char *)i + v67));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "placeName"));

      if (v14)
      {
        if (objc_msgSend(v12, "placeUserType") && objc_msgSend(v12, "placeUserType") == (id)1)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "placeName"));
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lowercaseString"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v16));
          objc_msgSend(v69, "setObject:forKeyedSubscript:", v17, v70);

          v6 = v63;
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "placeName"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v18));
          objc_msgSend(v69, "setObject:forKeyedSubscript:", v19, v13);

        }
        else
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "placeName"));
          objc_msgSend(v69, "setObject:forKeyedSubscript:", v20, v70);

          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "placeName"));
          objc_msgSend(v69, "setObject:forKeyedSubscript:", v18, v13);
        }

      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "enclosingArea"));

      if (v21 && objc_msgSend(v12, "placeType") != (id)101 && objc_msgSend(v12, "placeType") != (id)102)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%d"), CFSTR("city"), v11));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "enclosingArea"));
        objc_msgSend(v69, "setObject:forKeyedSubscript:", v23, v22);

        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "enclosingArea"));
        v25 = -[NSMutableSet containsObject:](v68, "containsObject:", v24);

        if ((v25 & 1) == 0)
        {
          ++v61;
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "enclosingArea"));
          -[NSMutableSet addObject:](v68, "addObject:", v26);

          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%d"), CFSTR("unique_city_"), -[NSMutableSet count](v68, "count")));
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "enclosingArea"));
          objc_msgSend(v69, "setObject:forKeyedSubscript:", v28, v27);

        }
        v6 = v63;

        v8 = v62;
      }
      if (objc_msgSend(v12, "proposition") == (id)4)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("flight")));
        v30 = objc_msgSend(v29, "isEqual:", CFSTR("flight"));

        if ((v30 & 1) == 0 && (_DWORD)v11 == 1)
          objc_msgSend(v69, "setObject:forKeyedSubscript:", &off_1002D7FA0, CFSTR("vicinity"));
      }
      v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "placeName"));
      if (!v31)
        goto LABEL_27;
      v32 = (void *)v31;
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "placeName"));
      v34 = v6;
      v35 = -[NSMutableSet containsObject:](v6, "containsObject:", v33);

      if ((v35 & 1) != 0)
      {
        v6 = v34;
LABEL_27:
        v7 = v68;
        goto LABEL_49;
      }
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "placeName"));
      -[NSMutableSet addObject:](v34, "addObject:", v36);

      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%d"), CFSTR("unique_place_"), -[NSMutableSet count](v34, "count")));
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%d"), CFSTR("Unique_place_"), -[NSMutableSet count](v34, "count")));
      v6 = v34;
      if (objc_msgSend(v12, "placeUserType") && objc_msgSend(v12, "placeUserType") == (id)1)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "placeName"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "lowercaseString"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v40));
        objc_msgSend(v69, "setObject:forKeyedSubscript:", v41, v37);

        v8 = v62;
        v6 = v63;
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "placeName"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(+[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:", v42));
        objc_msgSend(v69, "setObject:forKeyedSubscript:", v43, v38);

      }
      else
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "placeName"));
        objc_msgSend(v69, "setObject:forKeyedSubscript:", v44, v37);

        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "placeName"));
        objc_msgSend(v69, "setObject:forKeyedSubscript:", v42, v38);
      }

      if (objc_msgSend(v12, "proposition") == (id)4)
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%d"), CFSTR("vicinity_"), -[NSMutableSet count](v6, "count")));
        objc_msgSend(v69, "setObject:forKeyedSubscript:", &off_1002D7FA0, v45);

      }
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%d"), CFSTR("confidence_"), -[NSMutableSet count](v6, "count")));
      if (objc_msgSend(v12, "placeType") == (id)3 && (objc_msgSend(v12, "placeNameConfidence"), v47 >= 0.95))
      {
        v49 = CFSTR("high");
        v7 = v68;
      }
      else
      {
        v7 = v68;
        if (objc_msgSend(v12, "placeType") == (id)2 && (objc_msgSend(v12, "placeNameConfidence"), v48 >= 0.95)
          || objc_msgSend(v12, "placeUserType") && (unint64_t)objc_msgSend(v12, "placeUserType") < 0x64)
        {
          v49 = CFSTR("high");
        }
        else if (objc_msgSend(v12, "placeType") == (id)3 && (objc_msgSend(v12, "placeNameConfidence"), v50 >= 0.9))
        {
          v49 = CFSTR("medium");
        }
        else if (objc_msgSend(v12, "placeType") != (id)2
               || (objc_msgSend(v12, "placeNameConfidence"), v49 = CFSTR("medium"), v51 < 0.5))
        {
          v60 = 1;
          v49 = CFSTR("low");
        }
      }
      ++v64;
      objc_msgSend(v69, "setObject:forKeyedSubscript:", v49, v46);

LABEL_49:
      v9 = &_s10Foundation11MeasurementV19_bridgeToObjectiveCSo13NSMeasurementCyF_ptr;

    }
    v66 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v71, v75, 16);
    v67 = (v67 + (_DWORD)i);
  }
  while (v66);
LABEL_54:

  v53 = v60 & 1;
  v5 = v59;
  v52 = v61;
LABEL_55:
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v53));
  objc_msgSend(v69, "setObject:forKeyedSubscript:", v54, CFSTR("include_low_confidence_place_name"));

  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count")));
  objc_msgSend(v69, "setObject:forKeyedSubscript:", v55, CFSTR("place_count"));

  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v64));
  objc_msgSend(v69, "setObject:forKeyedSubscript:", v56, CFSTR("unique_place_count"));

  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v52));
  objc_msgSend(v69, "setObject:forKeyedSubscript:", v57, CFSTR("unique_city_count"));

  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)objc_msgSend(v5, "count") - 1));
    objc_msgSend(v69, "setObject:forKeyedSubscript:", v58, CFSTR("place_count_minus_one"));

  }
}

+ (void)setMetaDataForPhotos:(id)a3 metaData:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v5 = a3;
  v6 = a4;
  if (v5 && objc_msgSend(v5, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "type", (_QWORD)v12) == (id)2)
          {
            objc_msgSend(v6, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("photo_attached"));
            goto LABEL_13;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_13:

  }
}

+ (id)andStringFromArray:(id)a3 propertyPath:(id)a4 maxCount:(unint64_t)a5
{
  id v7;
  id v8;
  char *v9;
  char *v10;
  void *v11;
  unint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = (char *)objc_msgSend(v7, "count");
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0;
    v13 = v9 - 1;
    while (1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v12));
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForKeyPath:", v8));
      v16 = (void *)v15;
      if (v11)
      {
        if (v13 == (char *)v12)
        {
          objc_msgSend(v11, "appendFormat:", CFSTR(" and %@"), v15);
        }
        else
        {
          if (v12 >= a5 - 1)
          {
            objc_msgSend(v11, "appendFormat:", CFSTR(", %@ and more"), v15);

            goto LABEL_13;
          }
          objc_msgSend(v11, "appendFormat:", CFSTR(", %@"), v15);
        }
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", v15));
      }

      if (v10 == (char *)++v12)
        goto LABEL_13;
    }
  }
  v11 = 0;
LABEL_13:
  v17 = objc_msgSend(v11, "copy");

  return v17;
}

+ (id)keywordFromString:(id)a3
{
  return objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("_"));
}

+ (void)buildEvergreenMetaDataForEventBundle:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  void *v12;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "name"));
  v7 = 138412802;
  v8 = v6;
  v9 = 2048;
  v10 = a2;
  v11 = 2112;
  v12 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "build meta, Evergreen, type, %@, count, %lu, resource, %@", (uint8_t *)&v7, 0x20u);

}

+ (void)buildEvergreenMetaDataForEventBundle:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "name"));
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, v2, v3, "build meta, Evergreen, type, %@, metaData, %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_0();
}

+ (void)setMetaDataForTime:(os_log_t)log startDate:endDate:metaData:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "setMetaDataForTime, startDate, %@, endDate, %@, the timestamps are inverted at the end", (uint8_t *)&v3, 0x16u);
}

+ (void)setMetaDataForPersons:(uint64_t)a1 suggestionId:(NSObject *)a2 metaData:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "More than one person found : %@", (uint8_t *)&v2, 0xCu);
}

@end
