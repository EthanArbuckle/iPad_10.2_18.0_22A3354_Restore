@implementation APLegacyTypeTranslator

+ (int)placementTypeToCreativeType:(int64_t)a3
{
  if ((unint64_t)a3 < 8 && ((0x9Fu >> a3) & 1) != 0)
    return dword_1001B81C8[a3];
  objc_msgSend(a1, "_invalidElementError:");
  return 0;
}

+ (int)connectionTypeToAPPBAdConnection:(int64_t)a3
{
  if ((unint64_t)a3 < 0xA)
    return a3 + 1;
  else
    return 0;
}

+ ($F24F406B2B787EFB06265DBA3D28CBD5)adSizeForContainerSize:(id)a3 adData:(id)a4
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  void *i;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  NSObject *v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  NSObject *v26;
  float v27;
  uint64_t v28;
  NSObject *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  id v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  double var0;
  __int16 v44;
  double var1;
  __int16 v46;
  double v47;
  __int16 v48;
  double v49;
  __int16 v50;
  double v51;
  __int16 v52;
  double v53;
  _BYTE v54[128];
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v4 = a4;
  v5 = APLogForCategory(21);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    var0 = a3.var0;
    v44 = 2048;
    var1 = a3.var1;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Attempting to find best fit for container (%.0f, %.0f)", buf, 0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "creativeSizes"));
  v8 = v7;
  if (v7 && objc_msgSend(v7, "count"))
  {
    v35 = v8;
    v36 = v4;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v39;
      v13 = 0.0;
      v14 = 0.0;
      v15 = 0.0;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v39 != v12)
            objc_enumerationMutation(v9);
          v17 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
          v18 = (double)(int)objc_msgSend(v17, "width", v35, v36);
          v19 = (double)(int)objc_msgSend(v17, "height");
          v20 = APLogForCategory(21);
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218496;
            var0 = v18;
            v44 = 2048;
            var1 = v19;
            v46 = 2048;
            v47 = v18 / v19;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Candidate size: (%.0f, %.0f) Aspect: %.2f", buf, 0x20u);
          }

          if (a3.var0 / v18 >= a3.var1 / v19)
            v22 = a3.var1 / v19;
          else
            v22 = a3.var0 / v18;
          v23 = v22 * v18;
          v24 = v22 * v19;
          v25 = APLogForCategory(21);
          v26 = objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134219264;
            var0 = v22 * v18;
            v44 = 2048;
            var1 = v22 * v19;
            v46 = 2048;
            v47 = v23 / v24;
            v48 = 2048;
            v49 = v22;
            v50 = 2048;
            v51 = a3.var0;
            v52 = 2048;
            v53 = a3.var1;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Scaling candidate to (%.0f, %.0f) Aspect: %.2f, Scale factor: %.2f, to fit in container (%.0f, %.0f)", buf, 0x3Eu);
          }

          v28 = APLogForCategory(21);
          v29 = objc_claimAutoreleasedReturnValue(v28);
          v27 = v23 * v24;
          v30 = v27;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            var0 = v30 / (a3.var1 * a3.var0);
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Scaled candidate fill ratio: %.2f", buf, 0xCu);
          }

          if (v13 < v30)
          {
            v13 = v30;
            v14 = v19;
            v15 = v18;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v54, 16);
      }
      while (v11);
    }
    else
    {
      v14 = 0.0;
      v15 = 0.0;
    }

    v8 = v35;
    v4 = v36;
  }
  else
  {
    v14 = 0.0;
    v15 = 0.0;
    if (objc_msgSend(v4, "hasUnfilledReasonCode"))
    {
      +[APLegacyTypeTranslator errorAdSizeForContainerSize:](APLegacyTypeTranslator, "errorAdSizeForContainerSize:", a3.var0, a3.var1);
      v15 = v31;
      v14 = v32;
    }
  }

  v33 = v15;
  v34 = v14;
  result.var1 = v34;
  result.var0 = v33;
  return result;
}

+ ($F24F406B2B787EFB06265DBA3D28CBD5)errorAdSizeForContainerSize:(id)result
{
  double v3;

  v3 = 50.0;
  result.var1 = v3;
  return result;
}

+ (int64_t)AdDataUnfilledReasonCodeToUnfilledReasonCode:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = (a3 - 201);
  if (v5 < 5)
    return v5 + 201;
  objc_msgSend(a1, "_invalidElementError:", a3, v3, v4);
  return 0;
}

+ (void)_invalidElementError:(int64_t)a3
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  int64_t v7;

  v4 = APLogForCategory(21);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "LegacyTypeTranslator error - InvalidElement: %ld", (uint8_t *)&v6, 0xCu);
  }

}

+ (int64_t)creativeTypeToPlacementType:(int)a3
{
  if (a3 < 0xC && ((0xF35u >> a3) & 1) != 0)
    return qword_1001B81E8[a3];
  objc_msgSend(a1, "_invalidElementError:", a3);
  return -1;
}

+ (unint64_t)adPrivacyMarkPositionToAdPrivacyMarkerPosition:(int)a3
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;

  v6 = 0;
  v4 = xmmword_1001B81A0;
  v5 = xmmword_1001B81B0;
  if (a3 < 5)
    return *((_QWORD *)&v4 + a3);
  objc_msgSend(a1, "_invalidElementError:", a3, v4, v5, v6);
  return 0;
}

+ (int64_t)clickActionTypeToTapActionType:(int)a3
{
  if (a3 < 0xE && ((0x3D03u >> a3) & 1) != 0)
    return qword_1001B8248[a3];
  objc_msgSend(a1, "_invalidElementError:", a3);
  return 0;
}

+ (int64_t)RelevantIdentifierToRelevantIdentifierType:(int)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((a3 - 15001) < 5)
    return (a3 - 15001) + 15001;
  objc_msgSend(a1, "_invalidElementError:", a3, v3, v4);
  return 0;
}

+ (int)AdDataUnfilledReasonCodeToASECode:(int)a3
{
  if ((a3 - 201) < 5)
    return dword_1001B82B8[a3 - 201];
  objc_msgSend(a1, "_invalidElementError:", a3);
  return 0;
}

+ (int64_t)AppStoreViewTemplateTypeToTemplateType:(int)a3
{
  uint64_t v3;

  v3 = (a3 - 4781);
  if (v3 >= 0xA)
    return 4780;
  else
    return v3 + 4781;
}

+ (int)unfilledReasonCodeToASEStatusCode:(int64_t)a3
{
  int result;
  uint64_t v5;
  NSObject *v6;
  int v7;
  int64_t v8;

  if (a3 > 1009)
  {
    if (a3 > 1023)
    {
      if (a3 == 1024)
        return 4;
      if (a3 == 1029)
        return 360;
    }
    else
    {
      if ((unint64_t)(a3 - 1021) < 3)
        return 9;
      if (a3 == 1010)
        return 3001;
    }
LABEL_18:
    v5 = APLogForCategory(21);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 134349056;
      v8 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Unable to determine ASE status code with unfilled reason code: %{public}ld.", (uint8_t *)&v7, 0xCu);
    }

    return 0;
  }
  else
  {
    result = 3;
    switch(a3)
    {
      case 201:
        return result;
      case 202:
        result = 12;
        break;
      case 203:
        result = 13;
        break;
      case 204:
        result = 14;
        break;
      case 205:
        result = 15;
        break;
      default:
        if (a3 != 1000)
          goto LABEL_18;
        result = 2;
        break;
    }
  }
  return result;
}

+ (id)parameterArrayToDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "key", (_QWORD)v17));
        if (v11)
        {
          v12 = (void *)v11;
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "value"));

          if (v13)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "value"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "key"));
            objc_msgSend(v4, "setValue:forKey:", v14, v15);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)numericParameterArrayToDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "key", (_QWORD)v17));
        if (v11)
        {
          v12 = (void *)v11;
          v13 = objc_msgSend(v10, "value");

          if (v13)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v10, "value")));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "key"));
            objc_msgSend(v4, "setValue:forKey:", v14, v15);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)parameterArrayToDictionaryForMetadata:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "key", (_QWORD)v19));
        if (v11)
        {
          v12 = (void *)v11;
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "value"));

          if (v13)
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "value"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "key"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[APLegacyTypeTranslator valueTranslated:forKey:](APLegacyTypeTranslator, "valueTranslated:forKey:", v14, v15));

            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "key"));
            objc_msgSend(v4, "setValue:forKey:", v16, v17);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)valueTranslated:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];

  v5 = a3;
  v15[0] = CFSTR("adCampaignBlacklistedKeywords");
  v15[1] = CFSTR("adGloballyBlacklistedKeywords");
  v15[2] = CFSTR("adCampaignBlacklistedCategories");
  v15[3] = CFSTR("adGloballyBlacklistedCategories");
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 4));
  v8 = objc_msgSend(v7, "containsObject:", v6);

  if (v8 && (v9 = objc_opt_class(NSArray), (objc_opt_isKindOfClass(v5, v9) & 1) == 0))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", CFSTR("[]")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v12));

    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(", ")));
  }
  else
  {
    v10 = v5;
    v11 = v10;
  }
  v13 = v10;

  return v13;
}

+ (id)base64Decode:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v10[16];
  uint8_t buf[16];

  v3 = a3;
  if (!v3)
  {
    v6 = APLogForCategory(21);
    v4 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "We can't decode a nil string.", buf, 2u);
    }
    goto LABEL_9;
  }
  v4 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v3, 0);
  if (!v4)
  {
    v7 = APLogForCategory(21);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to decode Base64.", v10, 2u);
    }

LABEL_9:
    v5 = 0;
    goto LABEL_10;
  }
  v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v4, 4);
LABEL_10:

  return v5;
}

+ (int64_t)directionToGradientOrientation:(int)a3
{
  if (a3 == 90)
    return 20001;
  else
    return 20002;
}

@end
