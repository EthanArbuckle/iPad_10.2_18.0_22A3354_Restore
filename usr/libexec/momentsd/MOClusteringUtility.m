@implementation MOClusteringUtility

+ (unint64_t)getTheBestPersonRelationtshipTagFor:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  _UNKNOWN **v21;
  NSObject *v22;
  unint64_t v23;
  id os_log;
  id v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "personRelationships"));
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
    v22 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      +[MOClusteringUtility getTheBestPersonRelationtshipTagFor:].cold.1(v3);
    v23 = 0;
    goto LABEL_45;
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "personRelationships"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (!v8)
    goto LABEL_25;
  v9 = v8;
  v10 = *(_QWORD *)v33;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(_QWORD *)v33 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
      if (objc_msgSend(v12, "relationship") == (id)4)
      {
        objc_msgSend(v12, "score");
        if (v13 >= 0.927661)
        {
          objc_msgSend(v12, "score");
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v19 = v4;
          v20 = v18;
          v21 = &off_1002D8630;
          goto LABEL_22;
        }
      }
      if (objc_msgSend(v12, "relationship") == (id)15)
      {
        objc_msgSend(v12, "score");
        if (v14 >= 0.959)
        {
          objc_msgSend(v12, "score");
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v19 = v4;
          v20 = v18;
          v21 = &off_1002D8648;
          goto LABEL_22;
        }
      }
      if (objc_msgSend(v12, "relationship") == (id)27)
      {
        objc_msgSend(v12, "score");
        if (v15 >= 1.0)
        {
          objc_msgSend(v12, "score");
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v19 = v4;
          v20 = v18;
          v21 = &off_1002D8660;
          goto LABEL_22;
        }
      }
      if (objc_msgSend(v12, "relationship") == (id)21)
      {
        objc_msgSend(v12, "score");
        if (v16 >= 0.949924)
        {
          objc_msgSend(v12, "score");
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v19 = v4;
          v20 = v18;
          v21 = &off_1002D8678;
          goto LABEL_22;
        }
      }
      if (objc_msgSend(v12, "relationship") == (id)22)
      {
        objc_msgSend(v12, "score");
        if (v17 >= 0.96)
        {
          objc_msgSend(v12, "score");
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v19 = v4;
          v20 = v18;
          v21 = &off_1002D8690;
LABEL_22:
          -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v20, v21);

          continue;
        }
      }
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  }
  while (v9);
LABEL_25:

  if (-[NSMutableDictionary count](v4, "count"))
  {
    v22 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary keysOfEntriesPassingTest:](v4, "keysOfEntriesPassingTest:", &__block_literal_global_12));
    if (!-[NSObject count](v22, "count"))
      goto LABEL_41;
    if ((-[NSObject containsObject:](v22, "containsObject:", &off_1002D8648) & 1) != 0)
      goto LABEL_44;
    if ((-[NSObject containsObject:](v22, "containsObject:", &off_1002D8660) & 1) != 0)
      goto LABEL_29;
    if ((-[NSObject containsObject:](v22, "containsObject:", &off_1002D8678) & 1) != 0)
    {
LABEL_37:
      v23 = 21;
      goto LABEL_45;
    }
    if ((-[NSObject containsObject:](v22, "containsObject:", &off_1002D8690) & 1) != 0)
    {
      v23 = 22;
      goto LABEL_45;
    }
    if ((-[NSObject containsObject:](v22, "containsObject:", &off_1002D8630) & 1) != 0)
    {
LABEL_42:
      v23 = 4;
      goto LABEL_45;
    }
LABEL_41:
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v4, "objectForKey:", &off_1002D8630));

    if (v26)
      goto LABEL_42;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v4, "objectForKey:", &off_1002D8648));

    if (v27)
    {
LABEL_44:
      v23 = 15;
      goto LABEL_45;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v4, "objectForKey:", &off_1002D8660));

    if (v29)
    {
LABEL_29:
      v23 = 27;
    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v4, "objectForKey:", &off_1002D8678));

      if (v30)
        goto LABEL_37;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v4, "objectForKey:", &off_1002D8690));

      if (v31)
        v23 = 22;
      else
        v23 = 1;
    }
  }
  else
  {
    v25 = _mo_log_facility_get_os_log(&MOLogFacilityPatternEmbedding);
    v22 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      +[MOClusteringUtility getTheBestPersonRelationtshipTagFor:].cold.2(v3);
    v23 = 1;
  }
LABEL_45:

  return v23;
}

BOOL __59__MOClusteringUtility_getTheBestPersonRelationtshipTagFor___block_invoke(id a1, id a2, id a3, BOOL *a4)
{
  float v4;

  objc_msgSend(a3, "floatValue");
  return v4 >= 1.0;
}

+ (void)getTheBestPersonRelationtshipTagFor:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "name"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "mask"));
  OUTLINED_FUNCTION_1_8((void *)&_mh_execute_header, v3, v4, "No personalRelationship is available for person %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2_0();
}

+ (void)getTheBestPersonRelationtshipTagFor:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "name"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "mask"));
  OUTLINED_FUNCTION_1_8((void *)&_mh_execute_header, v3, v4, "None of personalRelationships are confident enough to generate the best relationship tag for person %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2_0();
}

@end
