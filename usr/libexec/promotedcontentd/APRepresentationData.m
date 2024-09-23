@implementation APRepresentationData

- (id)initWithAdData:(id)a3 placementType:(int64_t)a4 maxSize:(id)a5 mediaAsset:(id)a6 error:(id *)a7
{
  double var1;
  double var0;
  id v13;
  id v14;
  APRepresentationData *v15;
  APRepresentationData *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  APRepresentationData *v34;
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
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  int v53;
  void *v54;

  var1 = a5.var1;
  var0 = a5.var0;
  v13 = a3;
  v14 = a6;
  v15 = -[APRepresentationData init](self, "init");
  v16 = v15;
  if (!v15)
  {
LABEL_39:
    v34 = v16;
    goto LABEL_40;
  }
  -[APRepresentationData setPlacementType:](v15, "setPlacementType:", a4);
  if (a4 == 4 && objc_msgSend(v13, "hasDesiredPosition"))
    v17 = (int)objc_msgSend(v13, "desiredPosition");
  else
    v17 = 0;
  -[APRepresentationData setDesiredPosition:](v16, "setDesiredPosition:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[APRepresentationData _tapActionFromAdData:error:](v16, "_tapActionFromAdData:error:", v13, a7));
  -[APRepresentationData setTapAction:](v16, "setTapAction:", v18);

  if (objc_msgSend(v13, "hasSpecification"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "specification"));
    v20 = objc_msgSend(v19, "hasType");

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "specification"));
      -[APRepresentationData setPlacementType:](v16, "setPlacementType:", +[APLegacyTypeTranslator creativeTypeToPlacementType:](APLegacyTypeTranslator, "creativeTypeToPlacementType:", objc_msgSend(v21, "type")));

    }
  }
  if (objc_msgSend(v13, "hasAdType"))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "adType"));
    -[APRepresentationData setRawAdType:](v16, "setRawAdType:", v22);

  }
  if (objc_msgSend(v13, "hasAdFormatType"))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "adFormatType"));
    -[APRepresentationData setRawAdFormatType:](v16, "setRawAdFormatType:", v23);

  }
  -[APRepresentationData setPrivacyMarkerPosition:](v16, "setPrivacyMarkerPosition:", 3);
  if (objc_msgSend(v13, "hasAdPrivacyMarkPosition"))
    -[APRepresentationData setPrivacyMarkerPosition:](v16, "setPrivacyMarkerPosition:", +[APLegacyTypeTranslator adPrivacyMarkPositionToAdPrivacyMarkerPosition:](APLegacyTypeTranslator, "adPrivacyMarkPositionToAdPrivacyMarkerPosition:", objc_msgSend(v13, "adPrivacyMarkPosition")));
  if (v14)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mediaURL"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v24));
    -[APRepresentationData setVideoURL:](v16, "setVideoURL:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mediaFiles"));
    objc_msgSend(v26, "duration");
    -[APRepresentationData setDuration:](v16, "setDuration:");

    -[APRepresentationData setSize:](v16, "setSize:", (double)(int)objc_msgSend(v14, "width"), (double)(int)objc_msgSend(v14, "height"));
    objc_msgSend(v13, "skipThreshold");
    -[APRepresentationData setSkipThreshold:](v16, "setSkipThreshold:");
    objc_msgSend(v14, "bitrate");
    -[APRepresentationData setBitrate:](v16, "setBitrate:");
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "actions"));
  if (!objc_msgSend(v27, "count"))
  {

LABEL_23:
    if (-[APRepresentationData placementType](v16, "placementType") != (id)3)
    {
      +[APLegacyTypeTranslator adSizeForContainerSize:adData:](APLegacyTypeTranslator, "adSizeForContainerSize:adData:", v13, var0, var1);
      -[APRepresentationData setSize:](v16, "setSize:");
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "nativeMetadatas"));

    if (v35)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "nativeMetadatas"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[APLegacyTypeTranslator parameterArrayToDictionary:](APLegacyTypeTranslator, "parameterArrayToDictionary:", v36));

      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("nativeAdArticleId")));
      -[APRepresentationData setArticleID:](v16, "setArticleID:", v38);

      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("nativeAdTitle")));
      -[APRepresentationData setArticleTitle:](v16, "setArticleTitle:", v39);

      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("nativeAdSponsoredBy")));
      -[APRepresentationData setAdvertiserName:](v16, "setAdvertiserName:", v40);

      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("nativeAdCampaignData")));
      -[APRepresentationData setCampaignData:](v16, "setCampaignData:", v41);

      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("videoSkipEnabled")));
      -[APRepresentationData setSkipEnabled:](v16, "setSkipEnabled:", objc_msgSend(v42, "BOOLValue"));

      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("unbranded")));
      -[APRepresentationData setUnbranded:](v16, "setUnbranded:", objc_msgSend(v43, "BOOLValue"));

    }
    if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall")&& (v44 = (void *)objc_claimAutoreleasedReturnValue(+[APMockAdServerSettings settings](APMockAdServerSettings, "settings")), v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "adTag")), v45, v44, v45))
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[APMockAdServerSettings settings](APMockAdServerSettings, "settings"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "adTag"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[APLegacyTypeTranslator base64Decode:](APLegacyTypeTranslator, "base64Decode:", v47));
      -[APRepresentationData setAdTag:](v16, "setAdTag:", v48);

    }
    else
    {
      if (!objc_msgSend(v13, "hasAdTagContentString"))
      {
LABEL_33:
        if (objc_msgSend(v13, "hasAdFrequencyCapData"))
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue(-[APRepresentationData _frequencyCapDataFromAdData:](v16, "_frequencyCapDataFromAdData:", v13));
          -[APRepresentationData setFrequencyCapData:](v16, "setFrequencyCapData:", v49);

        }
        if (objc_msgSend(v13, "hasPolicyData"))
        {
          v50 = (void *)objc_claimAutoreleasedReturnValue(-[APRepresentationData _policyDataFromAdData:](v16, "_policyDataFromAdData:", v13));
          -[APRepresentationData setPolicyData:](v16, "setPolicyData:", v50);

        }
        if (objc_msgSend(v13, "hasTargetingDimensions"))
        {
          v51 = (void *)objc_claimAutoreleasedReturnValue(-[APRepresentationData _targetingDimensionsFromAdData:](v16, "_targetingDimensionsFromAdData:", v13));
          -[APRepresentationData setTargetingDimensions:](v16, "setTargetingDimensions:", v51);

        }
        goto LABEL_39;
      }
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "adTagContentString"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[APLegacyTypeTranslator base64Decode:](APLegacyTypeTranslator, "base64Decode:", v46));
      -[APRepresentationData setAdTag:](v16, "setAdTag:", v47);
    }

    goto LABEL_33;
  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "actions"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndexedSubscript:", 0));
  v30 = objc_msgSend(v29, "hasAppStoreViewTemplate");

  if (!v30)
    goto LABEL_23;
  -[APRepresentationData setSize:](v16, "setSize:", var0, var1);
  v31 = APLogForCategory(21);
  v32 = objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[APRepresentationData identifier](v16, "identifier"));
    v53 = 138543362;
    v54 = v33;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "We are turning off NAAN ads. Following content is being dropped: %{public}@", (uint8_t *)&v53, 0xCu);

  }
  v34 = 0;
LABEL_40:

  return v34;
}

- (id)_tapActionFromAdData:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actions"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actions"));
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actions"));
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", 0));

      v13 = objc_alloc_init((Class)APTapAction);
      objc_msgSend(v13, "setActionType:", +[APLegacyTypeTranslator clickActionTypeToTapActionType:](APLegacyTypeTranslator, "clickActionTypeToTapActionType:", -[NSObject action](v12, "action")));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject actionURL](v12, "actionURL"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:encodingInvalidCharacters:](NSURL, "URLWithString:encodingInvalidCharacters:", v14, 0));
      objc_msgSend(v13, "setActionURL:", v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "actionURL"));
      if (v16)
      {

      }
      else
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject actionURL](v12, "actionURL"));

        if (v25)
        {
          v26 = APLogForCategory(21);
          v27 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[APRepresentationData identifier](self, "identifier"));
            v30 = 138543362;
            v31 = v28;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Action URL for content %{public}@ is empty.", (uint8_t *)&v30, 0xCu);

          }
          if (a4)
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Tap Action is nil")));
            *a4 = (id)objc_claimAutoreleasedReturnValue(+[APLegacyInterfaceError validationErrorWithCode:andReason:](APLegacyInterfaceError, "validationErrorWithCode:andReason:", 4512, v29));

            a4 = 0;
          }
          goto LABEL_10;
        }
      }
      -[NSObject confirmedClickTimeInterval](v12, "confirmedClickTimeInterval");
      objc_msgSend(v13, "setConfirmedClickInterval:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[NSObject adamIdentifier](v12, "adamIdentifier")));
      objc_msgSend(v13, "setAdamIdentifier:", v18);

      if (-[NSObject hasAppStoreViewTemplate](v12, "hasAppStoreViewTemplate"))
        objc_msgSend(v13, "setTemplateType:", +[APLegacyTypeTranslator AppStoreViewTemplateTypeToTemplateType:](APLegacyTypeTranslator, "AppStoreViewTemplateTypeToTemplateType:", -[NSObject appStoreViewTemplate](v12, "appStoreViewTemplate")));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "iTunesMetadatas"));

      if (v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "iTunesMetadatas"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[APLegacyTypeTranslator parameterArrayToDictionary:](APLegacyTypeTranslator, "parameterArrayToDictionary:", v20));
        objc_msgSend(v13, "setITunesMetadata:", v21);

      }
      a4 = (id *)v13;
LABEL_10:

      goto LABEL_14;
    }
  }
  v22 = APLogForCategory(21);
  v12 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[APRepresentationData identifier](self, "identifier"));
    v30 = 138543362;
    v31 = v23;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Content %{public}@ has no actions.", (uint8_t *)&v30, 0xCu);

  }
  a4 = 0;
LABEL_14:

  return a4;
}

- (id)_frequencyCapDataFromAdData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "adFrequencyCapData"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "adFrequencyCapData"));
    v7 = objc_alloc_init((Class)APFrequencyCapData);
    objc_msgSend(v7, "setRelevantIdentifier:", +[APLegacyTypeTranslator RelevantIdentifierToRelevantIdentifierType:](APLegacyTypeTranslator, "RelevantIdentifierToRelevantIdentifierType:", objc_msgSend(v6, "relevantIdentifier")));
    objc_msgSend(v7, "setValue:", (int)objc_msgSend(v6, "adFrequencyValue"));
    objc_msgSend(v7, "setDuration:", objc_msgSend(v6, "adFrequencyDuration"));

  }
  else
  {
    v8 = APLogForCategory(21);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[APRepresentationData identifier](self, "identifier"));
      v12 = 138543362;
      v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Content %{public}@ has no frequency cap data.", (uint8_t *)&v12, 0xCu);

    }
    v7 = 0;
  }

  return v7;
}

- (id)_policyDataFromAdData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "policyData"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "policyData"));
    v7 = objc_alloc_init((Class)APPolicyData);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    objc_msgSend(v7, "setCreativeIdentifier:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "policyValues"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[APLegacyTypeTranslator numericParameterArrayToDictionary:](APLegacyTypeTranslator, "numericParameterArrayToDictionary:", v9));
    objc_msgSend(v7, "setPolicyValue:", v10);

  }
  else
  {
    v11 = APLogForCategory(21);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[APRepresentationData identifier](self, "identifier"));
      v15 = 138543362;
      v16 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Content %{public}@ has no policy data.", (uint8_t *)&v15, 0xCu);

    }
    v7 = 0;
  }

  return v7;
}

- (id)_targetingDimensionsFromAdData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint8_t v43[128];
  uint8_t buf[4];
  void *v45;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "targetingDimensions"));

  if (v5)
  {
    v6 = objc_alloc_init((Class)NSMutableArray);
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "targetingDimensions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "inclusionCriterias"));

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v39;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v39 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v12);
          v14 = objc_alloc_init((Class)APTargetingCriteria);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "criteriaIdentifier"));
          objc_msgSend(v14, "setIdentifier:", v15);

          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "criteriaValues"));
          objc_msgSend(v14, "setValues:", v16);

          objc_msgSend(v6, "addObject:", v14);
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v10);
    }

    v17 = objc_alloc_init((Class)NSMutableArray);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v33 = v4;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "targetingDimensions"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "exclusionCriterias"));

    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v35;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v35 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v23);
          v25 = objc_alloc_init((Class)APTargetingCriteria);
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "criteriaIdentifier"));
          objc_msgSend(v25, "setIdentifier:", v26);

          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "criteriaValues"));
          objc_msgSend(v25, "setValues:", v27);

          objc_msgSend(v17, "addObject:", v25);
          v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v21);
    }

    v28 = objc_alloc_init((Class)APTargetingDimensions);
    objc_msgSend(v28, "setInclusionCriteria:", v6);
    objc_msgSend(v28, "setExclusionCriteria:", v17);

    v4 = v33;
  }
  else
  {
    v29 = APLogForCategory(21);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[APRepresentationData identifier](self, "identifier"));
      *(_DWORD *)buf = 138543362;
      v45 = v31;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Content %{public}@ has no targeting dimensions data.", buf, 0xCu);

    }
    v28 = objc_alloc_init((Class)APTargetingDimensions);
    objc_msgSend(v28, "setInclusionCriteria:", &__NSArray0__struct);
    objc_msgSend(v28, "setExclusionCriteria:", &__NSArray0__struct);
  }

  return v28;
}

@end
