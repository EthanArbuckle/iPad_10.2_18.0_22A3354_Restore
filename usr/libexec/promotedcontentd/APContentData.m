@implementation APContentData

- (APContentData)initWithAdData:(id)a3 identifier:(id)a4 contextIdentifier:(id)a5 placementType:(int64_t)a6 maxSize:(id)a7
{
  double var1;
  double var0;
  id v13;
  id v14;
  id v15;
  APContentData *v16;
  APContentData *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  void *i;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  unsigned int v55;
  id v56;
  uint64_t v57;
  NSObject *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  APContentData *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  APContentData *v80;
  void *v81;
  APContentData *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  double v95;
  void *v96;
  void *v97;
  void *v98;
  float v99;
  APContentData *v100;
  int64_t v102;
  id v103;
  void *v104;
  id v105;
  id v106;
  id v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  uint8_t buf[4];
  id v113;
  __int16 v114;
  id v115;
  __int16 v116;
  void *v117;
  __int16 v118;
  void *v119;
  _BYTE v120[128];

  var1 = a7.var1;
  var0 = a7.var0;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = -[APContentData init](self, "init");
  v17 = v16;
  if (!v16)
  {
LABEL_61:
    v100 = v17;
    goto LABEL_62;
  }
  -[APContentData setIdentifier:](v16, "setIdentifier:", v14);
  -[APContentData setContextIdentifier:](v17, "setContextIdentifier:", v15);
  if (objc_msgSend(v13, "hasUniqueIdentifier"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uniqueIdentifier"));
    -[APContentData setUniqueIdentifier:](v17, "setUniqueIdentifier:", v18);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mediaFiles"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "mediaAssets"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[APContentData _createRepresentationsFromAdData:placementType:maxSize:mediaAssets:](v17, "_createRepresentationsFromAdData:placementType:maxSize:mediaAssets:", v13, a6, v20, var0, var1));

  if (objc_msgSend(v13, "hasMediaFiles"))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mediaFiles"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "mediaAssets"));
    v24 = objc_msgSend(v23, "count");

    if (v24)
    {
      v102 = a6;
      v103 = v14;
      v105 = v15;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[APDeviceInfo current](APDeviceInfo, "current"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "signalStrength"));
      v27 = objc_msgSend(v26, "unsignedIntegerValue");

      v28 = (void *)objc_claimAutoreleasedReturnValue(+[APDeviceInfo current](APDeviceInfo, "current"));
      v29 = objc_msgSend(v28, "connectionType");

      v110 = 0u;
      v111 = 0u;
      v108 = 0u;
      v109 = 0u;
      v30 = v21;
      v31 = v21;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v108, v120, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v109;
        do
        {
          for (i = 0; i != v33; i = (char *)i + 1)
          {
            if (*(_QWORD *)v109 != v34)
              objc_enumerationMutation(v31);
            v36 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v36, "setSignalStrength:", v27);
            objc_msgSend(v36, "setConnectionType:", v29);
          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v108, v120, 16);
        }
        while (v33);
      }

      v14 = v103;
      v15 = v105;
      v21 = v30;
      a6 = v102;
    }
  }
  -[APContentData addRepresentations:](v17, "addRepresentations:", v21);
  if (objc_msgSend(v13, "hasInstallAttribution"))
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "installAttribution"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[APContentData _createInstallAttributionFromAdData:](v17, "_createInstallAttributionFromAdData:", v37));
    -[APContentData setInstallAttribution:](v17, "setInstallAttribution:", v38);

  }
  if (objc_msgSend(v13, "hasUnfilledReasonCode"))
  {
    -[APContentData setServerUnfilledReason:](v17, "setServerUnfilledReason:", +[APLegacyTypeTranslator AdDataUnfilledReasonCodeToUnfilledReasonCode:](APLegacyTypeTranslator, "AdDataUnfilledReasonCodeToUnfilledReasonCode:", objc_msgSend(v13, "unfilledReasonCode")));
    v39 = APLogForCategory(21);
    v40 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      v41 = v21;
      v42 = (void *)(int)objc_msgSend(v13, "unfilledReasonCode");
      v43 = objc_msgSend(v13, "unfilledReasonCode");
      if (((_DWORD)v43 - 201) >= 5)
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v43));
      else
        v44 = *(&off_1002147F8 + (int)v43 - 201);
      v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "unfilledReasonInfo"));
      *(_DWORD *)buf = 138544130;
      v113 = v14;
      v114 = 2048;
      v115 = v42;
      v116 = 2114;
      v117 = v44;
      v118 = 2114;
      v119 = v81;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "Ad %{public}@ returned unfilled with code %ld (%{public}@) and reason %{public}@", buf, 0x2Au);

      v21 = v41;
    }

    v82 = v17;
    goto LABEL_47;
  }
  v104 = v21;
  v106 = v15;
  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))
  {
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[APMockAdServerSettings settings](APMockAdServerSettings, "settings"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "statusConditionExpression"));

    if (v46)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[APMockAdServerSettings settings](APMockAdServerSettings, "settings"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "statusConditionExpression"));
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v48));
      objc_msgSend(v13, "setExpressionToEvaluate:", v49);

      v50 = APLogForCategory(21);
      v51 = objc_claimAutoreleasedReturnValue(v50);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "expressionToEvaluate"));
        *(_DWORD *)buf = 138412290;
        v113 = v52;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "Forcing status condition expression from defaults write: %@", buf, 0xCu);

      }
    }
  }
  if (objc_msgSend(v13, "hasExpressionToEvaluate"))
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[PCStatusConditionsService sharedInstance](PCStatusConditionsService, "sharedInstance"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "expressionToEvaluate"));
    v107 = 0;
    v55 = objc_msgSend(v53, "evaluate:error:", v54, &v107);
    v56 = v107;

    if (v56)
    {
      v57 = APLogForCategory(21);
      v58 = objc_claimAutoreleasedReturnValue(v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v113 = v14;
        v114 = 2114;
        v115 = v56;
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "Error in status condition for content %{public}@: %{public}@", buf, 0x16u);
      }

      v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "localizedDescription"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[APLegacyInterfaceError validationErrorWithCode:andReason:](APLegacyInterfaceError, "validationErrorWithCode:andReason:", 4507, v59));
      -[APContentData setError:](v17, "setError:", v60);

      -[APContentData setServerUnfilledReason:](v17, "setServerUnfilledReason:", 1021);
    }
    if (v55)
    {
      v61 = APLogForCategory(21);
      v62 = objc_claimAutoreleasedReturnValue(v61);
      if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
      {
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "expressionToEvaluate"));
        *(_DWORD *)buf = 138543618;
        v113 = v14;
        v114 = 2112;
        v115 = v63;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "Discarding content %{public}@ for status condition %@", buf, 0x16u);

      }
      v64 = (void *)objc_claimAutoreleasedReturnValue(+[APLegacyInterfaceError discardedErrorWithCode:andReason:](APLegacyInterfaceError, "discardedErrorWithCode:andReason:", 2600, CFSTR("Status condition hit")));
      -[APContentData setError:](v17, "setError:", v64);

      -[APContentData setServerUnfilledReason:](v17, "setServerUnfilledReason:", 1020);
    }

  }
  if (!objc_msgSend(v13, "hasExpirationDate"))
  {
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "adDataResponseIdentifier"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[APContentData identifier](v17, "identifier"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Ad %@ with adOpID %@ has no expiration date set."), v76, v77));
    v79 = (void *)objc_claimAutoreleasedReturnValue(+[APLegacyInterfaceError validationErrorWithCode:andReason:](APLegacyInterfaceError, "validationErrorWithCode:andReason:", 4502, v78));
    -[APContentData setError:](v17, "setError:", v79);

    -[APContentData setServerUnfilledReason:](v17, "setServerUnfilledReason:", 1021);
    v80 = v17;
    goto LABEL_43;
  }
  objc_msgSend(v13, "expirationDate");
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:"));
  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall")&& +[APMockAdServerSettings isAdResponseMockedForPlacementType:](APMockAdServerSettings, "isAdResponseMockedForPlacementType:", a6))
  {
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v67 = objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "dateByAddingTimeInterval:", 14400.0));

    v65 = (void *)v67;
  }
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "dateByAddingTimeInterval:", 2592000.0));
  if (objc_msgSend(v65, "compare:", v68) != (id)-1 && objc_msgSend(v65, "compare:", v69) != (id)1)
  {
    -[APContentData setExpirationDate:](v17, "setExpirationDate:", v65);

    v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[APContentData setMetadata:](v17, "setMetadata:", v83);

    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "nativeMetadatas"));
    if (v84)
    {
      v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "nativeMetadatas"));
      v86 = (void *)objc_claimAutoreleasedReturnValue(+[APLegacyTypeTranslator parameterArrayToDictionaryForMetadata:](APLegacyTypeTranslator, "parameterArrayToDictionaryForMetadata:", v85));

      v87 = (void *)objc_claimAutoreleasedReturnValue(-[APContentData metadata](v17, "metadata"));
      objc_msgSend(v87, "setValue:forKey:", v86, CFSTR("nativeMetadata"));

    }
    if (objc_msgSend(v13, "hasTransparencyDetails"))
    {
      v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "transparencyDetails"));
      v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "transparencyRendererURL"));
      v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v89));
      -[APContentData setDisclosureURL:](v17, "setDisclosureURL:", v90);

      v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "transparencyDetails"));
      v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "transparencyRendererPayload"));
      -[APContentData setDisclosureRendererPayload:](v17, "setDisclosureRendererPayload:", v92);

      v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "transparencyDetails"));
      v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "targetingExpressionId"));
      -[APContentData setTargetingExpressionId:](v17, "setTargetingExpressionId:", v94);

    }
    if (objc_msgSend(v13, "hasMinimumIntervalBetweenPresentations"))
    {
      objc_msgSend(v13, "minimumIntervalBetweenPresentations");
      -[APContentData setMinimumTimeBetweenPresentation:](v17, "setMinimumTimeBetweenPresentation:", (unint64_t)v95);
    }
    if (objc_msgSend(v13, "hasHumanReadableName"))
    {
      v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "humanReadableName"));
      -[APContentData setBrandName:](v17, "setBrandName:", v96);

      v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "humanReadableName"));
      -[APContentData setHumanReadableName:](v17, "setHumanReadableName:", v97);

    }
    if (objc_msgSend(v13, "hasAccessibilityDescription"))
    {
      v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "accessibilityDescription"));
      -[APContentData setCampaignText:](v17, "setCampaignText:", v98);

    }
    if (objc_msgSend(v13, "hasBannerImpressionThreshold"))
    {
      objc_msgSend(v13, "bannerImpressionThreshold");
      -[APContentData setImpressionThreshold:](v17, "setImpressionThreshold:", v99);
    }

    goto LABEL_61;
  }
  v70 = v14;
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "adDataResponseIdentifier"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[APContentData identifier](v17, "identifier"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Ad %@ with adOpID %@ has an invalid expiration date."), v71, v72));
  v74 = (void *)objc_claimAutoreleasedReturnValue(+[APLegacyInterfaceError validationErrorWithCode:andReason:](APLegacyInterfaceError, "validationErrorWithCode:andReason:", 4502, v73));
  -[APContentData setError:](v17, "setError:", v74);

  v14 = v70;
  v15 = v106;
  -[APContentData setServerUnfilledReason:](v17, "setServerUnfilledReason:", 1021);
  v75 = v17;

LABEL_43:
  v21 = v104;
LABEL_47:

LABEL_62:
  return v17;
}

- (id)_createRepresentationsFromAdData:(id)a3 placementType:(int64_t)a4 maxSize:(id)a5 mediaAssets:(id)a6
{
  double var1;
  double var0;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *j;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  id v40;
  id v42;
  void *v43;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[128];
  uint8_t buf[4];
  void *v58;
  _BYTE v59[128];

  var1 = a5.var1;
  var0 = a5.var0;
  v10 = a3;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v43 = v12;
  if (objc_msgSend(v10, "adLayoutDatasCount"))
  {
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "adLayoutDatas"));
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
    if (v14)
    {
      v15 = v14;
      v42 = v11;
      v16 = 0;
      v17 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          v19 = v16;
          if (*(_QWORD *)v53 != v17)
            objc_enumerationMutation(v13);
          v20 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * (_QWORD)i);
          v21 = objc_alloc((Class)PCNativeRepresentation);
          v51 = v16;
          v22 = objc_msgSend(v21, "initWithAdData:placementType:maxSize:nativeLayout:error:", v10, a4, v20, &v51, var0, var1);
          v16 = v51;

          if (v16)
          {
            -[APContentData setError:](self, "setError:", v16);
          }
          else if (v22)
          {
            objc_msgSend(v12, "addObject:", v22);
          }
          else
          {
            v23 = APLogForCategory(21);
            v24 = objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue(-[APContentData identifier](self, "identifier"));
              *(_DWORD *)buf = 138543362;
              v58 = v25;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Unknown error creating representation for content %{public}@", buf, 0xCu);

              v12 = v43;
            }

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
      }
      while (v15);
LABEL_32:
      v11 = v42;
      goto LABEL_41;
    }
    goto LABEL_33;
  }
  if (v11)
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v13 = v11;
    v26 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    if (v26)
    {
      v27 = v26;
      v42 = v11;
      v16 = 0;
      v28 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          v30 = v16;
          if (*(_QWORD *)v48 != v28)
            objc_enumerationMutation(v13);
          v31 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)j);
          v32 = objc_alloc((Class)APRepresentationData);
          v46 = v16;
          v33 = objc_msgSend(v32, "initWithAdData:placementType:maxSize:mediaAsset:error:", v10, a4, v31, &v46, var0, var1);
          v16 = v46;

          if (v16)
          {
            -[APContentData setError:](self, "setError:", v16);
          }
          else if (v33)
          {
            objc_msgSend(v12, "addObject:", v33);
          }
          else
          {
            v34 = APLogForCategory(21);
            v35 = objc_claimAutoreleasedReturnValue(v34);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              v36 = (void *)objc_claimAutoreleasedReturnValue(-[APContentData identifier](self, "identifier"));
              *(_DWORD *)buf = 138543362;
              v58 = v36;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Unknown error creating representation for content %{public}@", buf, 0xCu);

              v12 = v43;
            }

          }
        }
        v27 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
      }
      while (v27);
      goto LABEL_32;
    }
LABEL_33:
    v16 = 0;
    goto LABEL_41;
  }
  v45 = 0;
  v13 = objc_msgSend(objc_alloc((Class)APRepresentationData), "initWithAdData:placementType:maxSize:mediaAsset:error:", v10, a4, 0, &v45, var0, var1);
  v16 = v45;
  if (v16)
  {
    -[APContentData setError:](self, "setError:", v16);
  }
  else if (v13)
  {
    objc_msgSend(v12, "addObject:", v13);
  }
  else
  {
    v37 = APLogForCategory(21);
    v38 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[APContentData identifier](self, "identifier"));
      *(_DWORD *)buf = 138543362;
      v58 = v39;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Unknown error creating representation for content %{public}@", buf, 0xCu);

    }
  }
LABEL_41:

  v40 = objc_msgSend(v12, "copy");
  return v40;
}

- (id)initRateLimitedForContextId:(id)a3 containerSize:(id)a4 placementType:(int64_t)a5
{
  double var1;
  double var0;
  id v9;
  APContentData *v10;
  APContentData *v11;

  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a3;
  v10 = -[APContentData init](self, "init");
  v11 = v10;
  if (v10)
  {
    -[APContentData setContextIdentifier:](v10, "setContextIdentifier:", v9);
    -[APContentData setServerUnfilledReason:](v11, "setServerUnfilledReason:", 1000);
    -[APContentData addRepresentationWithSize:andPlacementType:](v11, "addRepresentationWithSize:andPlacementType:", a5, var0, var1);
  }

  return v11;
}

- (APContentData)initWithUnfilledReason:(int64_t)a3 error:(id)a4 contentIdentifier:(id)a5 contextIdentifier:(id)a6 containerSize:(id)a7 placementType:(int64_t)a8
{
  double var1;
  double var0;
  id v15;
  id v16;
  id v17;
  APContentData *v18;
  APContentData *v19;

  var1 = a7.var1;
  var0 = a7.var0;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = -[APContentData init](self, "init");
  v19 = v18;
  if (v18)
  {
    -[APContentData setIdentifier:](v18, "setIdentifier:", v16);
    -[APContentData setContextIdentifier:](v19, "setContextIdentifier:", v17);
    -[APContentData setError:](v19, "setError:", v15);
    -[APContentData setServerUnfilledReason:](v19, "setServerUnfilledReason:", a3);
    -[APContentData addRepresentationWithSize:andPlacementType:](v19, "addRepresentationWithSize:andPlacementType:", a8, var0, var1);
  }

  return v19;
}

- (void)addRepresentationWithSize:(id)a3 andPlacementType:(int64_t)a4
{
  double var1;
  double var0;
  id v8;

  var1 = a3.var1;
  var0 = a3.var0;
  v8 = objc_alloc_init((Class)APRepresentationData);
  objc_msgSend(v8, "setPlacementType:", a4);
  +[APLegacyTypeTranslator errorAdSizeForContainerSize:](APLegacyTypeTranslator, "errorAdSizeForContainerSize:", var0, var1);
  objc_msgSend(v8, "setSize:");
  -[APContentData addRepresentation:](self, "addRepresentation:", v8);

}

- (id)_createInstallAttributionFromAdData:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v3 = a3;
  v4 = objc_alloc_init((Class)APInstallAttribution);
  objc_msgSend(v4, "setAdamId:", objc_msgSend(v3, "adamId"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "adNetworkId"));
  objc_msgSend(v4, "setAdNetworkId:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attributionSignature"));
  objc_msgSend(v4, "setAttributionSignature:", v6);

  objc_msgSend(v4, "setCampaignId:", objc_msgSend(v3, "campaignId"));
  v7 = objc_alloc((Class)NSUUID);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
  v9 = objc_msgSend(v7, "initWithUUIDString:", v8);
  objc_msgSend(v4, "setContextIdentifier:", v9);

  objc_msgSend(v4, "setSourceAppAdamId:", objc_msgSend(v3, "sourceAppAdamId"));
  objc_msgSend(v4, "setTimestamp:", objc_msgSend(v3, "timestamp"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "version"));

  objc_msgSend(v4, "setVersion:", v10);
  return v4;
}

@end
