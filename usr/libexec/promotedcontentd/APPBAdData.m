@implementation APPBAdData

- (NSString)adOriginalRequesterId
{
  return self->_adOriginalRequesterId;
}

- (NSMutableArray)creativeSizes
{
  return self->_creativeSizes;
}

- (BOOL)hasAdTagContentString
{
  return self->_adTagContentString != 0;
}

- (NSMutableArray)actions
{
  return self->_actions;
}

- (NSMutableArray)nativeMetadatas
{
  return self->_nativeMetadatas;
}

- (int)impressionCount
{
  return self->_impressionCount;
}

- (BOOL)hasTargetingDimensions
{
  return self->_targetingDimensions != 0;
}

- (BOOL)hasSpecification
{
  return self->_specification != 0;
}

- (BOOL)hasPolicyData
{
  return self->_policyData != 0;
}

- (BOOL)hasImpressionIdentifierData
{
  return self->_impressionIdentifierData != 0;
}

- (BOOL)hasExpressionToEvaluate
{
  return self->_expressionToEvaluate != 0;
}

- (BOOL)hasAdType
{
  return self->_adType != 0;
}

- (BOOL)hasAdPrivacyMarkPosition
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)hasAdFrequencyCapData
{
  return self->_adFrequencyCapData != 0;
}

- (BOOL)hasAdFormatType
{
  return self->_adFormatType != 0;
}

- (BOOL)hasAdDataResponseIdentifier
{
  return self->_adDataResponseIdentifier != 0;
}

- (NSString)adDataResponseIdentifier
{
  return self->_adDataResponseIdentifier;
}

- (NSMutableArray)journeyStartRelayValues
{
  return self->_journeyStartRelayValues;
}

- (int)unfilledReasonCode
{
  if ((*(_WORD *)&self->_has & 0x800) != 0)
    return self->_unfilledReasonCode;
  else
    return 201;
}

- (BOOL)hasUnfilledReasonCode
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (BOOL)hasMediaFiles
{
  return self->_mediaFiles != 0;
}

- (NSString)unfilledReasonInfo
{
  return self->_unfilledReasonInfo;
}

- (APPBMediaFiles)mediaFiles
{
  return self->_mediaFiles;
}

- (BOOL)hasUniqueIdentifier
{
  return self->_uniqueIdentifier != 0;
}

- (BOOL)hasInstallAttribution
{
  return self->_installAttribution != 0;
}

- (unint64_t)adLayoutDatasCount
{
  return (unint64_t)-[NSMutableArray count](self->_adLayoutDatas, "count");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *bannerURL;
  NSString *bannerWebArchiveURL;
  NSString *uniqueIdentifier;
  NSData *impressionIdentifierData;
  NSString *humanReadableName;
  void *v10;
  void *v11;
  NSMutableArray *trackingURLs;
  NSString *trackingURLSubstitutionParameter;
  void *v14;
  NSString *accessibilityDescription;
  NSMutableArray *confirmedClickPixelURLs;
  NSString *bannerQueryString;
  double v18;
  id v19;
  NSMutableArray *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  APPBMediaFiles *mediaFiles;
  void *v27;
  NSString *audioURL;
  NSString *slateImageURL;
  NSString *aTVTunerImageURL;
  __int16 has;
  void *v32;
  NSMutableArray *screenSaverImageURLs;
  NSMutableArray *excludeTags;
  NSString *iAdJSVersion;
  NSString *iAdJSURL;
  NSMutableArray *rewardTokens;
  void *v38;
  id v39;
  NSMutableArray *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *j;
  void *v45;
  void *v46;
  NSString *logoImageURL;
  NSString *headlineForLCD;
  NSString *descriptionForLCD;
  void *v50;
  id v51;
  NSMutableArray *v52;
  id v53;
  id v54;
  uint64_t v55;
  void *k;
  void *v57;
  NSString *targetAppBundleID;
  NSString *targetAppURLScheme;
  id v60;
  NSMutableArray *v61;
  id v62;
  id v63;
  uint64_t v64;
  void *m;
  void *v66;
  void *v67;
  APPBInstallAttribution *installAttribution;
  void *v69;
  APPBAdSpecification *specification;
  void *v71;
  __int16 v72;
  void *v73;
  void *v74;
  APPBMerchant *merchant;
  void *v76;
  id v77;
  NSMutableArray *v78;
  id v79;
  id v80;
  uint64_t v81;
  void *n;
  void *v83;
  int desiredPosition;
  __CFString *v85;
  void *v86;
  void *v87;
  id v88;
  NSMutableArray *v89;
  id v90;
  id v91;
  uint64_t v92;
  void *ii;
  void *v94;
  id v95;
  NSMutableArray *v96;
  id v97;
  id v98;
  uint64_t v99;
  void *jj;
  void *v101;
  APPBTransparencyDetails *transparencyDetails;
  void *v103;
  APPBNativeMediaCreativeMetadata *nativeMediaCreativeMetadata;
  void *v105;
  NSString *adTagContentString;
  __int16 v107;
  void *v108;
  uint64_t adPrivacyMarkPosition;
  void *v110;
  NSString *adDataResponseIdentifier;
  int v112;
  void *v113;
  NSString *unfilledReasonInfo;
  NSString *adOriginalRequesterId;
  NSString *expressionToEvaluate;
  id v117;
  NSMutableArray *v118;
  id v119;
  id v120;
  uint64_t v121;
  void *kk;
  void *v123;
  id v124;
  NSMutableArray *v125;
  id v126;
  id v127;
  uint64_t v128;
  void *mm;
  void *v130;
  NSString *adType;
  NSString *adFormatType;
  APPBAdFrequencyCapData *adFrequencyCapData;
  void *v134;
  APPBPolicyData *policyData;
  void *v136;
  APPBTargetingDimensions *targetingDimensions;
  void *v138;
  id v139;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  _BYTE v177[128];
  _BYTE v178[128];
  _BYTE v179[128];
  _BYTE v180[128];
  _BYTE v181[128];
  _BYTE v182[128];
  _BYTE v183[128];
  _BYTE v184[128];
  _BYTE v185[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  bannerURL = self->_bannerURL;
  if (bannerURL)
    objc_msgSend(v3, "setObject:forKey:", bannerURL, CFSTR("bannerURL"));
  bannerWebArchiveURL = self->_bannerWebArchiveURL;
  if (bannerWebArchiveURL)
    objc_msgSend(v4, "setObject:forKey:", bannerWebArchiveURL, CFSTR("bannerWebArchiveURL"));
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
    objc_msgSend(v4, "setObject:forKey:", uniqueIdentifier, CFSTR("uniqueIdentifier"));
  impressionIdentifierData = self->_impressionIdentifierData;
  if (impressionIdentifierData)
    objc_msgSend(v4, "setObject:forKey:", impressionIdentifierData, CFSTR("impressionIdentifierData"));
  humanReadableName = self->_humanReadableName;
  if (humanReadableName)
    objc_msgSend(v4, "setObject:forKey:", humanReadableName, CFSTR("humanReadableName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_impressionCount));
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("impressionCount"));

  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_expirationDate));
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("expirationDate"));

  }
  trackingURLs = self->_trackingURLs;
  if (trackingURLs)
    objc_msgSend(v4, "setObject:forKey:", trackingURLs, CFSTR("trackingURL"));
  trackingURLSubstitutionParameter = self->_trackingURLSubstitutionParameter;
  if (trackingURLSubstitutionParameter)
    objc_msgSend(v4, "setObject:forKey:", trackingURLSubstitutionParameter, CFSTR("trackingURLSubstitutionParameter"));
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_unbranded));
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("unbranded"));

  }
  accessibilityDescription = self->_accessibilityDescription;
  if (accessibilityDescription)
    objc_msgSend(v4, "setObject:forKey:", accessibilityDescription, CFSTR("accessibilityDescription"));
  confirmedClickPixelURLs = self->_confirmedClickPixelURLs;
  if (confirmedClickPixelURLs)
    objc_msgSend(v4, "setObject:forKey:", confirmedClickPixelURLs, CFSTR("confirmedClickPixelURLs"));
  bannerQueryString = self->_bannerQueryString;
  if (bannerQueryString)
    objc_msgSend(v4, "setObject:forKey:", bannerQueryString, CFSTR("bannerQueryString"));
  if (-[NSMutableArray count](self->_videoAssets, "count"))
  {
    v19 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_videoAssets, "count"));
    v173 = 0u;
    v174 = 0u;
    v175 = 0u;
    v176 = 0u;
    v20 = self->_videoAssets;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v173, v185, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v174;
      do
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(_QWORD *)v174 != v23)
            objc_enumerationMutation(v20);
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v173 + 1) + 8 * (_QWORD)i), "dictionaryRepresentation"));
          objc_msgSend(v19, "addObject:", v25);

        }
        v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v173, v185, 16);
      }
      while (v22);
    }

    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("videoAsset"));
  }
  mediaFiles = self->_mediaFiles;
  if (mediaFiles)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[APPBMediaFiles dictionaryRepresentation](mediaFiles, "dictionaryRepresentation"));
    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("mediaFiles"));

  }
  audioURL = self->_audioURL;
  if (audioURL)
    objc_msgSend(v4, "setObject:forKey:", audioURL, CFSTR("audioURL"));
  slateImageURL = self->_slateImageURL;
  if (slateImageURL)
    objc_msgSend(v4, "setObject:forKey:", slateImageURL, CFSTR("slateImageURL"));
  aTVTunerImageURL = self->_aTVTunerImageURL;
  if (aTVTunerImageURL)
    objc_msgSend(v4, "setObject:forKey:", aTVTunerImageURL, CFSTR("ATVTunerImageURL"));
  has = (__int16)self->_has;
  if ((has & 0x2000) != 0)
  {
    v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_downloadWebArchivesBeforeShowingBanner));
    objc_msgSend(v4, "setObject:forKey:", v86, CFSTR("downloadWebArchivesBeforeShowingBanner"));

    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_44:
      if ((has & 0x80) == 0)
        goto LABEL_46;
      goto LABEL_45;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_44;
  }
  *(float *)&v18 = self->_bannerImpressionThreshold;
  v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v18));
  objc_msgSend(v4, "setObject:forKey:", v87, CFSTR("bannerImpressionThreshold"));

  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_45:
    *(float *)&v18 = self->_bannerNewContentCandidacyThreshold;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v18));
    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("bannerNewContentCandidacyThreshold"));

  }
LABEL_46:
  screenSaverImageURLs = self->_screenSaverImageURLs;
  if (screenSaverImageURLs)
    objc_msgSend(v4, "setObject:forKey:", screenSaverImageURLs, CFSTR("screenSaverImageURL"));
  excludeTags = self->_excludeTags;
  if (excludeTags)
    objc_msgSend(v4, "setObject:forKey:", excludeTags, CFSTR("excludeTag"));
  iAdJSVersion = self->_iAdJSVersion;
  if (iAdJSVersion)
    objc_msgSend(v4, "setObject:forKey:", iAdJSVersion, CFSTR("iAdJSVersion"));
  iAdJSURL = self->_iAdJSURL;
  if (iAdJSURL)
    objc_msgSend(v4, "setObject:forKey:", iAdJSURL, CFSTR("iAdJSURL"));
  rewardTokens = self->_rewardTokens;
  if (rewardTokens)
    objc_msgSend(v4, "setObject:forKey:", rewardTokens, CFSTR("rewardTokens"));
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_rewardTokensExpiration));
    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("rewardTokensExpiration"));

  }
  if (-[NSMutableArray count](self->_matchTagClauses, "count"))
  {
    v39 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_matchTagClauses, "count"));
    v169 = 0u;
    v170 = 0u;
    v171 = 0u;
    v172 = 0u;
    v40 = self->_matchTagClauses;
    v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v169, v184, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v170;
      do
      {
        for (j = 0; j != v42; j = (char *)j + 1)
        {
          if (*(_QWORD *)v170 != v43)
            objc_enumerationMutation(v40);
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v169 + 1) + 8 * (_QWORD)j), "dictionaryRepresentation"));
          objc_msgSend(v39, "addObject:", v45);

        }
        v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v40, "countByEnumeratingWithState:objects:count:", &v169, v184, 16);
      }
      while (v42);
    }

    objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("matchTagClause"));
  }
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_skipThreshold));
    objc_msgSend(v4, "setObject:forKey:", v46, CFSTR("skipThreshold"));

  }
  logoImageURL = self->_logoImageURL;
  if (logoImageURL)
    objc_msgSend(v4, "setObject:forKey:", logoImageURL, CFSTR("logoImageURL"));
  headlineForLCD = self->_headlineForLCD;
  if (headlineForLCD)
    objc_msgSend(v4, "setObject:forKey:", headlineForLCD, CFSTR("headlineForLCD"));
  descriptionForLCD = self->_descriptionForLCD;
  if (descriptionForLCD)
    objc_msgSend(v4, "setObject:forKey:", descriptionForLCD, CFSTR("descriptionForLCD"));
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_priority));
    objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("priority"));

  }
  if (-[NSMutableArray count](self->_geofences, "count"))
  {
    v51 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_geofences, "count"));
    v165 = 0u;
    v166 = 0u;
    v167 = 0u;
    v168 = 0u;
    v52 = self->_geofences;
    v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v165, v183, 16);
    if (v53)
    {
      v54 = v53;
      v55 = *(_QWORD *)v166;
      do
      {
        for (k = 0; k != v54; k = (char *)k + 1)
        {
          if (*(_QWORD *)v166 != v55)
            objc_enumerationMutation(v52);
          v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v165 + 1) + 8 * (_QWORD)k), "dictionaryRepresentation"));
          objc_msgSend(v51, "addObject:", v57);

        }
        v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v165, v183, 16);
      }
      while (v54);
    }

    objc_msgSend(v4, "setObject:forKey:", v51, CFSTR("geofences"));
  }
  targetAppBundleID = self->_targetAppBundleID;
  if (targetAppBundleID)
    objc_msgSend(v4, "setObject:forKey:", targetAppBundleID, CFSTR("targetAppBundleID"));
  targetAppURLScheme = self->_targetAppURLScheme;
  if (targetAppURLScheme)
    objc_msgSend(v4, "setObject:forKey:", targetAppURLScheme, CFSTR("targetAppURLScheme"));
  if (-[NSMutableArray count](self->_creativeSizes, "count"))
  {
    v60 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_creativeSizes, "count"));
    v161 = 0u;
    v162 = 0u;
    v163 = 0u;
    v164 = 0u;
    v61 = self->_creativeSizes;
    v62 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v161, v182, 16);
    if (v62)
    {
      v63 = v62;
      v64 = *(_QWORD *)v162;
      do
      {
        for (m = 0; m != v63; m = (char *)m + 1)
        {
          if (*(_QWORD *)v162 != v64)
            objc_enumerationMutation(v61);
          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v161 + 1) + 8 * (_QWORD)m), "dictionaryRepresentation"));
          objc_msgSend(v60, "addObject:", v66);

        }
        v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v61, "countByEnumeratingWithState:objects:count:", &v161, v182, 16);
      }
      while (v63);
    }

    objc_msgSend(v4, "setObject:forKey:", v60, CFSTR("creativeSizes"));
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_letterboxCreativeColor));
    objc_msgSend(v4, "setObject:forKey:", v67, CFSTR("letterboxCreativeColor"));

  }
  installAttribution = self->_installAttribution;
  if (installAttribution)
  {
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[APPBInstallAttribution dictionaryRepresentation](installAttribution, "dictionaryRepresentation"));
    objc_msgSend(v4, "setObject:forKey:", v69, CFSTR("installAttribution"));

  }
  specification = self->_specification;
  if (specification)
  {
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdSpecification dictionaryRepresentation](specification, "dictionaryRepresentation"));
    objc_msgSend(v4, "setObject:forKey:", v71, CFSTR("specification"));

  }
  v72 = (__int16)self->_has;
  if ((v72 & 2) != 0)
  {
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_minimumIntervalBetweenPresentations));
    objc_msgSend(v4, "setObject:forKey:", v73, CFSTR("minimumIntervalBetweenPresentations"));

    v72 = (__int16)self->_has;
  }
  if ((v72 & 0x1000) != 0)
  {
    v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_doesNotResetListeningTime));
    objc_msgSend(v4, "setObject:forKey:", v74, CFSTR("doesNotResetListeningTime"));

  }
  merchant = self->_merchant;
  if (merchant)
  {
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[APPBMerchant dictionaryRepresentation](merchant, "dictionaryRepresentation"));
    objc_msgSend(v4, "setObject:forKey:", v76, CFSTR("merchant"));

  }
  if (-[NSMutableArray count](self->_nativeMetadatas, "count"))
  {
    v77 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_nativeMetadatas, "count"));
    v157 = 0u;
    v158 = 0u;
    v159 = 0u;
    v160 = 0u;
    v78 = self->_nativeMetadatas;
    v79 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v78, "countByEnumeratingWithState:objects:count:", &v157, v181, 16);
    if (v79)
    {
      v80 = v79;
      v81 = *(_QWORD *)v158;
      do
      {
        for (n = 0; n != v80; n = (char *)n + 1)
        {
          if (*(_QWORD *)v158 != v81)
            objc_enumerationMutation(v78);
          v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v157 + 1) + 8 * (_QWORD)n), "dictionaryRepresentation"));
          objc_msgSend(v77, "addObject:", v83);

        }
        v80 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v78, "countByEnumeratingWithState:objects:count:", &v157, v181, 16);
      }
      while (v80);
    }

    objc_msgSend(v4, "setObject:forKey:", v77, CFSTR("nativeMetadata"));
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    desiredPosition = self->_desiredPosition;
    if (desiredPosition == 1101)
    {
      v85 = CFSTR("ResellerNative");
    }
    else if (desiredPosition == 1102)
    {
      v85 = CFSTR("PublisherNative");
    }
    else
    {
      v85 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_desiredPosition));
    }
    objc_msgSend(v4, "setObject:forKey:", v85, CFSTR("desiredPosition"));

  }
  if (-[NSMutableArray count](self->_actions, "count"))
  {
    v88 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_actions, "count"));
    v153 = 0u;
    v154 = 0u;
    v155 = 0u;
    v156 = 0u;
    v89 = self->_actions;
    v90 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v89, "countByEnumeratingWithState:objects:count:", &v153, v180, 16);
    if (v90)
    {
      v91 = v90;
      v92 = *(_QWORD *)v154;
      do
      {
        for (ii = 0; ii != v91; ii = (char *)ii + 1)
        {
          if (*(_QWORD *)v154 != v92)
            objc_enumerationMutation(v89);
          v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v153 + 1) + 8 * (_QWORD)ii), "dictionaryRepresentation"));
          objc_msgSend(v88, "addObject:", v94);

        }
        v91 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v89, "countByEnumeratingWithState:objects:count:", &v153, v180, 16);
      }
      while (v91);
    }

    objc_msgSend(v4, "setObject:forKey:", v88, CFSTR("actions"));
  }
  if (-[NSMutableArray count](self->_iTunesMetadatas, "count"))
  {
    v95 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_iTunesMetadatas, "count"));
    v149 = 0u;
    v150 = 0u;
    v151 = 0u;
    v152 = 0u;
    v96 = self->_iTunesMetadatas;
    v97 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v96, "countByEnumeratingWithState:objects:count:", &v149, v179, 16);
    if (v97)
    {
      v98 = v97;
      v99 = *(_QWORD *)v150;
      do
      {
        for (jj = 0; jj != v98; jj = (char *)jj + 1)
        {
          if (*(_QWORD *)v150 != v99)
            objc_enumerationMutation(v96);
          v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v149 + 1) + 8 * (_QWORD)jj), "dictionaryRepresentation"));
          objc_msgSend(v95, "addObject:", v101);

        }
        v98 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v96, "countByEnumeratingWithState:objects:count:", &v149, v179, 16);
      }
      while (v98);
    }

    objc_msgSend(v4, "setObject:forKey:", v95, CFSTR("iTunesMetadata"));
  }
  transparencyDetails = self->_transparencyDetails;
  if (transparencyDetails)
  {
    v103 = (void *)objc_claimAutoreleasedReturnValue(-[APPBTransparencyDetails dictionaryRepresentation](transparencyDetails, "dictionaryRepresentation"));
    objc_msgSend(v4, "setObject:forKey:", v103, CFSTR("transparencyDetails"));

  }
  nativeMediaCreativeMetadata = self->_nativeMediaCreativeMetadata;
  if (nativeMediaCreativeMetadata)
  {
    v105 = (void *)objc_claimAutoreleasedReturnValue(-[APPBNativeMediaCreativeMetadata dictionaryRepresentation](nativeMediaCreativeMetadata, "dictionaryRepresentation"));
    objc_msgSend(v4, "setObject:forKey:", v105, CFSTR("nativeMediaCreativeMetadata"));

  }
  adTagContentString = self->_adTagContentString;
  if (adTagContentString)
    objc_msgSend(v4, "setObject:forKey:", adTagContentString, CFSTR("adTagContentString"));
  v107 = (__int16)self->_has;
  if ((v107 & 0x400) != 0)
  {
    v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->_maximumPretapRequestCount));
    objc_msgSend(v4, "setObject:forKey:", v108, CFSTR("maximumPretapRequestCount"));

    v107 = (__int16)self->_has;
  }
  if ((v107 & 0x20) != 0)
  {
    adPrivacyMarkPosition = self->_adPrivacyMarkPosition;
    if (adPrivacyMarkPosition >= 5)
      v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_adPrivacyMarkPosition));
    else
      v110 = *(&off_1002154C8 + adPrivacyMarkPosition);
    objc_msgSend(v4, "setObject:forKey:", v110, CFSTR("adPrivacyMarkPosition"));

  }
  adDataResponseIdentifier = self->_adDataResponseIdentifier;
  if (adDataResponseIdentifier)
    objc_msgSend(v4, "setObject:forKey:", adDataResponseIdentifier, CFSTR("adDataResponseIdentifier"));
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    v112 = self->_unfilledReasonCode - 201;
    if (v112 >= 5)
      v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), self->_unfilledReasonCode));
    else
      v113 = *(&off_1002154F0 + v112);
    objc_msgSend(v4, "setObject:forKey:", v113, CFSTR("unfilledReasonCode"));

  }
  unfilledReasonInfo = self->_unfilledReasonInfo;
  if (unfilledReasonInfo)
    objc_msgSend(v4, "setObject:forKey:", unfilledReasonInfo, CFSTR("unfilledReasonInfo"));
  adOriginalRequesterId = self->_adOriginalRequesterId;
  if (adOriginalRequesterId)
    objc_msgSend(v4, "setObject:forKey:", adOriginalRequesterId, CFSTR("adOriginalRequesterId"));
  expressionToEvaluate = self->_expressionToEvaluate;
  if (expressionToEvaluate)
    objc_msgSend(v4, "setObject:forKey:", expressionToEvaluate, CFSTR("expressionToEvaluate"));
  if (-[NSMutableArray count](self->_journeyStartRelayValues, "count"))
  {
    v117 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_journeyStartRelayValues, "count"));
    v145 = 0u;
    v146 = 0u;
    v147 = 0u;
    v148 = 0u;
    v118 = self->_journeyStartRelayValues;
    v119 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v118, "countByEnumeratingWithState:objects:count:", &v145, v178, 16);
    if (v119)
    {
      v120 = v119;
      v121 = *(_QWORD *)v146;
      do
      {
        for (kk = 0; kk != v120; kk = (char *)kk + 1)
        {
          if (*(_QWORD *)v146 != v121)
            objc_enumerationMutation(v118);
          v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v145 + 1) + 8 * (_QWORD)kk), "dictionaryRepresentation"));
          objc_msgSend(v117, "addObject:", v123);

        }
        v120 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v118, "countByEnumeratingWithState:objects:count:", &v145, v178, 16);
      }
      while (v120);
    }

    objc_msgSend(v4, "setObject:forKey:", v117, CFSTR("journeyStartRelayValues"));
  }
  if (-[NSMutableArray count](self->_adLayoutDatas, "count"))
  {
    v124 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_adLayoutDatas, "count"));
    v141 = 0u;
    v142 = 0u;
    v143 = 0u;
    v144 = 0u;
    v125 = self->_adLayoutDatas;
    v126 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v125, "countByEnumeratingWithState:objects:count:", &v141, v177, 16);
    if (v126)
    {
      v127 = v126;
      v128 = *(_QWORD *)v142;
      do
      {
        for (mm = 0; mm != v127; mm = (char *)mm + 1)
        {
          if (*(_QWORD *)v142 != v128)
            objc_enumerationMutation(v125);
          v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v141 + 1) + 8 * (_QWORD)mm), "dictionaryRepresentation"));
          objc_msgSend(v124, "addObject:", v130);

        }
        v127 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v125, "countByEnumeratingWithState:objects:count:", &v141, v177, 16);
      }
      while (v127);
    }

    objc_msgSend(v4, "setObject:forKey:", v124, CFSTR("adLayoutData"));
  }
  adType = self->_adType;
  if (adType)
    objc_msgSend(v4, "setObject:forKey:", adType, CFSTR("AdType"));
  adFormatType = self->_adFormatType;
  if (adFormatType)
    objc_msgSend(v4, "setObject:forKey:", adFormatType, CFSTR("AdFormatType"));
  adFrequencyCapData = self->_adFrequencyCapData;
  if (adFrequencyCapData)
  {
    v134 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdFrequencyCapData dictionaryRepresentation](adFrequencyCapData, "dictionaryRepresentation"));
    objc_msgSend(v4, "setObject:forKey:", v134, CFSTR("adFrequencyCapData"));

  }
  policyData = self->_policyData;
  if (policyData)
  {
    v136 = (void *)objc_claimAutoreleasedReturnValue(-[APPBPolicyData dictionaryRepresentation](policyData, "dictionaryRepresentation"));
    objc_msgSend(v4, "setObject:forKey:", v136, CFSTR("policyData"));

  }
  targetingDimensions = self->_targetingDimensions;
  if (targetingDimensions)
  {
    v138 = (void *)objc_claimAutoreleasedReturnValue(-[APPBTargetingDimensions dictionaryRepresentation](targetingDimensions, "dictionaryRepresentation"));
    objc_msgSend(v4, "setObject:forKey:", v138, CFSTR("targetingDimensions"));

  }
  v139 = v4;

  return v139;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoAssets, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_unfilledReasonInfo, 0);
  objc_storeStrong((id *)&self->_transparencyDetails, 0);
  objc_storeStrong((id *)&self->_trackingURLs, 0);
  objc_storeStrong((id *)&self->_trackingURLSubstitutionParameter, 0);
  objc_storeStrong((id *)&self->_targetingDimensions, 0);
  objc_storeStrong((id *)&self->_targetAppURLScheme, 0);
  objc_storeStrong((id *)&self->_targetAppBundleID, 0);
  objc_storeStrong((id *)&self->_specification, 0);
  objc_storeStrong((id *)&self->_slateImageURL, 0);
  objc_storeStrong((id *)&self->_screenSaverImageURLs, 0);
  objc_storeStrong((id *)&self->_rewardTokens, 0);
  objc_storeStrong((id *)&self->_policyData, 0);
  objc_storeStrong((id *)&self->_nativeMetadatas, 0);
  objc_storeStrong((id *)&self->_nativeMediaCreativeMetadata, 0);
  objc_storeStrong((id *)&self->_merchant, 0);
  objc_storeStrong((id *)&self->_mediaFiles, 0);
  objc_storeStrong((id *)&self->_matchTagClauses, 0);
  objc_storeStrong((id *)&self->_logoImageURL, 0);
  objc_storeStrong((id *)&self->_journeyStartRelayValues, 0);
  objc_storeStrong((id *)&self->_installAttribution, 0);
  objc_storeStrong((id *)&self->_impressionIdentifierData, 0);
  objc_storeStrong((id *)&self->_iTunesMetadatas, 0);
  objc_storeStrong((id *)&self->_iAdJSVersion, 0);
  objc_storeStrong((id *)&self->_iAdJSURL, 0);
  objc_storeStrong((id *)&self->_humanReadableName, 0);
  objc_storeStrong((id *)&self->_headlineForLCD, 0);
  objc_storeStrong((id *)&self->_geofences, 0);
  objc_storeStrong((id *)&self->_expressionToEvaluate, 0);
  objc_storeStrong((id *)&self->_excludeTags, 0);
  objc_storeStrong((id *)&self->_descriptionForLCD, 0);
  objc_storeStrong((id *)&self->_creativeSizes, 0);
  objc_storeStrong((id *)&self->_confirmedClickPixelURLs, 0);
  objc_storeStrong((id *)&self->_bannerWebArchiveURL, 0);
  objc_storeStrong((id *)&self->_bannerURL, 0);
  objc_storeStrong((id *)&self->_bannerQueryString, 0);
  objc_storeStrong((id *)&self->_audioURL, 0);
  objc_storeStrong((id *)&self->_adType, 0);
  objc_storeStrong((id *)&self->_adTagContentString, 0);
  objc_storeStrong((id *)&self->_adOriginalRequesterId, 0);
  objc_storeStrong((id *)&self->_adLayoutDatas, 0);
  objc_storeStrong((id *)&self->_adFrequencyCapData, 0);
  objc_storeStrong((id *)&self->_adFormatType, 0);
  objc_storeStrong((id *)&self->_adDataResponseIdentifier, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_accessibilityDescription, 0);
  objc_storeStrong((id *)&self->_aTVTunerImageURL, 0);
}

- (BOOL)hasBannerURL
{
  return self->_bannerURL != 0;
}

- (BOOL)hasBannerWebArchiveURL
{
  return self->_bannerWebArchiveURL != 0;
}

- (BOOL)hasHumanReadableName
{
  return self->_humanReadableName != 0;
}

- (void)setExpirationDate:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_expirationDate = a3;
}

- (void)setHasExpirationDate:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasExpirationDate
{
  return *(_WORD *)&self->_has & 1;
}

- (void)clearTrackingURLs
{
  -[NSMutableArray removeAllObjects](self->_trackingURLs, "removeAllObjects");
}

- (void)addTrackingURL:(id)a3
{
  id v4;
  NSMutableArray *trackingURLs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  trackingURLs = self->_trackingURLs;
  v8 = v4;
  if (!trackingURLs)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_trackingURLs;
    self->_trackingURLs = v6;

    v4 = v8;
    trackingURLs = self->_trackingURLs;
  }
  -[NSMutableArray addObject:](trackingURLs, "addObject:", v4);

}

- (unint64_t)trackingURLsCount
{
  return (unint64_t)-[NSMutableArray count](self->_trackingURLs, "count");
}

- (id)trackingURLAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_trackingURLs, "objectAtIndex:", a3);
}

+ (Class)trackingURLType
{
  return (Class)objc_opt_class(NSString, a2);
}

- (BOOL)hasTrackingURLSubstitutionParameter
{
  return self->_trackingURLSubstitutionParameter != 0;
}

- (void)setUnbranded:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_unbranded = a3;
}

- (void)setHasUnbranded:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasUnbranded
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (BOOL)hasAccessibilityDescription
{
  return self->_accessibilityDescription != 0;
}

- (void)clearConfirmedClickPixelURLs
{
  -[NSMutableArray removeAllObjects](self->_confirmedClickPixelURLs, "removeAllObjects");
}

- (void)addConfirmedClickPixelURLs:(id)a3
{
  id v4;
  NSMutableArray *confirmedClickPixelURLs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  confirmedClickPixelURLs = self->_confirmedClickPixelURLs;
  v8 = v4;
  if (!confirmedClickPixelURLs)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_confirmedClickPixelURLs;
    self->_confirmedClickPixelURLs = v6;

    v4 = v8;
    confirmedClickPixelURLs = self->_confirmedClickPixelURLs;
  }
  -[NSMutableArray addObject:](confirmedClickPixelURLs, "addObject:", v4);

}

- (unint64_t)confirmedClickPixelURLsCount
{
  return (unint64_t)-[NSMutableArray count](self->_confirmedClickPixelURLs, "count");
}

- (id)confirmedClickPixelURLsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_confirmedClickPixelURLs, "objectAtIndex:", a3);
}

+ (Class)confirmedClickPixelURLsType
{
  return (Class)objc_opt_class(NSString, a2);
}

- (BOOL)hasBannerQueryString
{
  return self->_bannerQueryString != 0;
}

- (void)clearVideoAssets
{
  -[NSMutableArray removeAllObjects](self->_videoAssets, "removeAllObjects");
}

- (void)addVideoAsset:(id)a3
{
  id v4;
  NSMutableArray *videoAssets;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  videoAssets = self->_videoAssets;
  v8 = v4;
  if (!videoAssets)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_videoAssets;
    self->_videoAssets = v6;

    v4 = v8;
    videoAssets = self->_videoAssets;
  }
  -[NSMutableArray addObject:](videoAssets, "addObject:", v4);

}

- (unint64_t)videoAssetsCount
{
  return (unint64_t)-[NSMutableArray count](self->_videoAssets, "count");
}

- (id)videoAssetAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_videoAssets, "objectAtIndex:", a3);
}

+ (Class)videoAssetType
{
  return (Class)objc_opt_class(APPBVideoAsset, a2);
}

- (BOOL)hasAudioURL
{
  return self->_audioURL != 0;
}

- (BOOL)hasSlateImageURL
{
  return self->_slateImageURL != 0;
}

- (BOOL)hasATVTunerImageURL
{
  return self->_aTVTunerImageURL != 0;
}

- (void)setDownloadWebArchivesBeforeShowingBanner:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_downloadWebArchivesBeforeShowingBanner = a3;
}

- (void)setHasDownloadWebArchivesBeforeShowingBanner:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasDownloadWebArchivesBeforeShowingBanner
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setBannerImpressionThreshold:(float)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_bannerImpressionThreshold = a3;
}

- (void)setHasBannerImpressionThreshold:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasBannerImpressionThreshold
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setBannerNewContentCandidacyThreshold:(float)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_bannerNewContentCandidacyThreshold = a3;
}

- (void)setHasBannerNewContentCandidacyThreshold:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasBannerNewContentCandidacyThreshold
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)clearScreenSaverImageURLs
{
  -[NSMutableArray removeAllObjects](self->_screenSaverImageURLs, "removeAllObjects");
}

- (void)addScreenSaverImageURL:(id)a3
{
  id v4;
  NSMutableArray *screenSaverImageURLs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  screenSaverImageURLs = self->_screenSaverImageURLs;
  v8 = v4;
  if (!screenSaverImageURLs)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_screenSaverImageURLs;
    self->_screenSaverImageURLs = v6;

    v4 = v8;
    screenSaverImageURLs = self->_screenSaverImageURLs;
  }
  -[NSMutableArray addObject:](screenSaverImageURLs, "addObject:", v4);

}

- (unint64_t)screenSaverImageURLsCount
{
  return (unint64_t)-[NSMutableArray count](self->_screenSaverImageURLs, "count");
}

- (id)screenSaverImageURLAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_screenSaverImageURLs, "objectAtIndex:", a3);
}

+ (Class)screenSaverImageURLType
{
  return (Class)objc_opt_class(NSString, a2);
}

- (void)clearExcludeTags
{
  -[NSMutableArray removeAllObjects](self->_excludeTags, "removeAllObjects");
}

- (void)addExcludeTag:(id)a3
{
  id v4;
  NSMutableArray *excludeTags;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  excludeTags = self->_excludeTags;
  v8 = v4;
  if (!excludeTags)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_excludeTags;
    self->_excludeTags = v6;

    v4 = v8;
    excludeTags = self->_excludeTags;
  }
  -[NSMutableArray addObject:](excludeTags, "addObject:", v4);

}

- (unint64_t)excludeTagsCount
{
  return (unint64_t)-[NSMutableArray count](self->_excludeTags, "count");
}

- (id)excludeTagAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_excludeTags, "objectAtIndex:", a3);
}

+ (Class)excludeTagType
{
  return (Class)objc_opt_class(NSString, a2);
}

- (BOOL)hasIAdJSVersion
{
  return self->_iAdJSVersion != 0;
}

- (BOOL)hasIAdJSURL
{
  return self->_iAdJSURL != 0;
}

- (void)clearRewardTokens
{
  -[NSMutableArray removeAllObjects](self->_rewardTokens, "removeAllObjects");
}

- (void)addRewardTokens:(id)a3
{
  id v4;
  NSMutableArray *rewardTokens;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  rewardTokens = self->_rewardTokens;
  v8 = v4;
  if (!rewardTokens)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_rewardTokens;
    self->_rewardTokens = v6;

    v4 = v8;
    rewardTokens = self->_rewardTokens;
  }
  -[NSMutableArray addObject:](rewardTokens, "addObject:", v4);

}

- (unint64_t)rewardTokensCount
{
  return (unint64_t)-[NSMutableArray count](self->_rewardTokens, "count");
}

- (id)rewardTokensAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_rewardTokens, "objectAtIndex:", a3);
}

+ (Class)rewardTokensType
{
  return (Class)objc_opt_class(NSString, a2);
}

- (void)setRewardTokensExpiration:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_rewardTokensExpiration = a3;
}

- (void)setHasRewardTokensExpiration:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasRewardTokensExpiration
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)clearMatchTagClauses
{
  -[NSMutableArray removeAllObjects](self->_matchTagClauses, "removeAllObjects");
}

- (void)addMatchTagClause:(id)a3
{
  id v4;
  NSMutableArray *matchTagClauses;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  matchTagClauses = self->_matchTagClauses;
  v8 = v4;
  if (!matchTagClauses)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_matchTagClauses;
    self->_matchTagClauses = v6;

    v4 = v8;
    matchTagClauses = self->_matchTagClauses;
  }
  -[NSMutableArray addObject:](matchTagClauses, "addObject:", v4);

}

- (unint64_t)matchTagClausesCount
{
  return (unint64_t)-[NSMutableArray count](self->_matchTagClauses, "count");
}

- (id)matchTagClauseAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_matchTagClauses, "objectAtIndex:", a3);
}

+ (Class)matchTagClauseType
{
  return (Class)objc_opt_class(APPBTagSet, a2);
}

- (void)setSkipThreshold:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_skipThreshold = a3;
}

- (void)setHasSkipThreshold:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasSkipThreshold
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasLogoImageURL
{
  return self->_logoImageURL != 0;
}

- (BOOL)hasHeadlineForLCD
{
  return self->_headlineForLCD != 0;
}

- (BOOL)hasDescriptionForLCD
{
  return self->_descriptionForLCD != 0;
}

- (void)setPriority:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_priority = a3;
}

- (void)setHasPriority:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasPriority
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)clearGeofences
{
  -[NSMutableArray removeAllObjects](self->_geofences, "removeAllObjects");
}

- (void)addGeofences:(id)a3
{
  id v4;
  NSMutableArray *geofences;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  geofences = self->_geofences;
  v8 = v4;
  if (!geofences)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_geofences;
    self->_geofences = v6;

    v4 = v8;
    geofences = self->_geofences;
  }
  -[NSMutableArray addObject:](geofences, "addObject:", v4);

}

- (unint64_t)geofencesCount
{
  return (unint64_t)-[NSMutableArray count](self->_geofences, "count");
}

- (id)geofencesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_geofences, "objectAtIndex:", a3);
}

+ (Class)geofencesType
{
  return (Class)objc_opt_class(APPBGeofence, a2);
}

- (BOOL)hasTargetAppBundleID
{
  return self->_targetAppBundleID != 0;
}

- (BOOL)hasTargetAppURLScheme
{
  return self->_targetAppURLScheme != 0;
}

- (void)clearCreativeSizes
{
  -[NSMutableArray removeAllObjects](self->_creativeSizes, "removeAllObjects");
}

- (void)addCreativeSizes:(id)a3
{
  id v4;
  NSMutableArray *creativeSizes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  creativeSizes = self->_creativeSizes;
  v8 = v4;
  if (!creativeSizes)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_creativeSizes;
    self->_creativeSizes = v6;

    v4 = v8;
    creativeSizes = self->_creativeSizes;
  }
  -[NSMutableArray addObject:](creativeSizes, "addObject:", v4);

}

- (unint64_t)creativeSizesCount
{
  return (unint64_t)-[NSMutableArray count](self->_creativeSizes, "count");
}

- (id)creativeSizesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_creativeSizes, "objectAtIndex:", a3);
}

+ (Class)creativeSizesType
{
  return (Class)objc_opt_class(APPBAdSize, a2);
}

- (void)setLetterboxCreativeColor:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_letterboxCreativeColor = a3;
}

- (void)setHasLetterboxCreativeColor:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasLetterboxCreativeColor
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setMinimumIntervalBetweenPresentations:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_minimumIntervalBetweenPresentations = a3;
}

- (void)setHasMinimumIntervalBetweenPresentations:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasMinimumIntervalBetweenPresentations
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)doesNotResetListeningTime
{
  return (*(_WORD *)&self->_has & 0x1000) != 0 && self->_doesNotResetListeningTime;
}

- (void)setDoesNotResetListeningTime:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_doesNotResetListeningTime = a3;
}

- (void)setHasDoesNotResetListeningTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasDoesNotResetListeningTime
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (BOOL)hasMerchant
{
  return self->_merchant != 0;
}

- (void)clearNativeMetadatas
{
  -[NSMutableArray removeAllObjects](self->_nativeMetadatas, "removeAllObjects");
}

- (void)addNativeMetadata:(id)a3
{
  id v4;
  NSMutableArray *nativeMetadatas;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  nativeMetadatas = self->_nativeMetadatas;
  v8 = v4;
  if (!nativeMetadatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_nativeMetadatas;
    self->_nativeMetadatas = v6;

    v4 = v8;
    nativeMetadatas = self->_nativeMetadatas;
  }
  -[NSMutableArray addObject:](nativeMetadatas, "addObject:", v4);

}

- (unint64_t)nativeMetadatasCount
{
  return (unint64_t)-[NSMutableArray count](self->_nativeMetadatas, "count");
}

- (id)nativeMetadataAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_nativeMetadatas, "objectAtIndex:", a3);
}

+ (Class)nativeMetadataType
{
  return (Class)objc_opt_class(APPBParameter, a2);
}

- (int)desiredPosition
{
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    return self->_desiredPosition;
  else
    return 1101;
}

- (void)setDesiredPosition:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_desiredPosition = a3;
}

- (void)setHasDesiredPosition:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasDesiredPosition
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)desiredPositionAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1101)
    return CFSTR("ResellerNative");
  if (a3 == 1102)
    v3 = CFSTR("PublisherNative");
  else
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  return v3;
}

- (int)StringAsDesiredPosition:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1101;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ResellerNative")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("PublisherNative")))
      v4 = 1102;
    else
      v4 = 1101;
  }

  return v4;
}

- (void)clearActions
{
  -[NSMutableArray removeAllObjects](self->_actions, "removeAllObjects");
}

- (void)addActions:(id)a3
{
  id v4;
  NSMutableArray *actions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  actions = self->_actions;
  v8 = v4;
  if (!actions)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_actions;
    self->_actions = v6;

    v4 = v8;
    actions = self->_actions;
  }
  -[NSMutableArray addObject:](actions, "addObject:", v4);

}

- (unint64_t)actionsCount
{
  return (unint64_t)-[NSMutableArray count](self->_actions, "count");
}

- (id)actionsAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_actions, "objectAtIndex:", a3);
}

+ (Class)actionsType
{
  return (Class)objc_opt_class(APPBAdAction, a2);
}

- (void)clearITunesMetadatas
{
  -[NSMutableArray removeAllObjects](self->_iTunesMetadatas, "removeAllObjects");
}

- (void)addITunesMetadata:(id)a3
{
  id v4;
  NSMutableArray *iTunesMetadatas;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  iTunesMetadatas = self->_iTunesMetadatas;
  v8 = v4;
  if (!iTunesMetadatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_iTunesMetadatas;
    self->_iTunesMetadatas = v6;

    v4 = v8;
    iTunesMetadatas = self->_iTunesMetadatas;
  }
  -[NSMutableArray addObject:](iTunesMetadatas, "addObject:", v4);

}

- (unint64_t)iTunesMetadatasCount
{
  return (unint64_t)-[NSMutableArray count](self->_iTunesMetadatas, "count");
}

- (id)iTunesMetadataAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_iTunesMetadatas, "objectAtIndex:", a3);
}

+ (Class)iTunesMetadataType
{
  return (Class)objc_opt_class(APPBParameter, a2);
}

- (BOOL)hasTransparencyDetails
{
  return self->_transparencyDetails != 0;
}

- (BOOL)hasNativeMediaCreativeMetadata
{
  return self->_nativeMediaCreativeMetadata != 0;
}

- (void)setMaximumPretapRequestCount:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_maximumPretapRequestCount = a3;
}

- (void)setHasMaximumPretapRequestCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasMaximumPretapRequestCount
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (int)adPrivacyMarkPosition
{
  if ((*(_WORD *)&self->_has & 0x20) != 0)
    return self->_adPrivacyMarkPosition;
  else
    return 0;
}

- (void)setAdPrivacyMarkPosition:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_adPrivacyMarkPosition = a3;
}

- (void)setHasAdPrivacyMarkPosition:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (id)adPrivacyMarkPositionAsString:(int)a3
{
  if (a3 >= 5)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_1002154C8 + a3);
}

- (int)StringAsAdPrivacyMarkPosition:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BottomRight")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TopRight")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TopLeft")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BottomLeft")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NoAdPrivacyMark")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setUnfilledReasonCode:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_unfilledReasonCode = a3;
}

- (void)setHasUnfilledReasonCode:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (id)unfilledReasonCodeAsString:(int)a3
{
  if ((a3 - 201) >= 5)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3));
  else
    return *(&off_1002154F0 + a3 - 201);
}

- (int)StringAsUnfilledReasonCode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("InventoryUnavailable")) & 1) != 0)
  {
    v4 = 201;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GlobalExclusion")) & 1) != 0)
  {
    v4 = 202;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PolicyExclusion")) & 1) != 0)
  {
    v4 = 203;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LimitExceeded")) & 1) != 0)
  {
    v4 = 204;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AdsDisabledInIssue")))
  {
    v4 = 205;
  }
  else
  {
    v4 = 201;
  }

  return v4;
}

- (BOOL)hasUnfilledReasonInfo
{
  return self->_unfilledReasonInfo != 0;
}

- (BOOL)hasAdOriginalRequesterId
{
  return self->_adOriginalRequesterId != 0;
}

- (void)clearJourneyStartRelayValues
{
  -[NSMutableArray removeAllObjects](self->_journeyStartRelayValues, "removeAllObjects");
}

- (void)addJourneyStartRelayValues:(id)a3
{
  id v4;
  NSMutableArray *journeyStartRelayValues;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  journeyStartRelayValues = self->_journeyStartRelayValues;
  v8 = v4;
  if (!journeyStartRelayValues)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_journeyStartRelayValues;
    self->_journeyStartRelayValues = v6;

    v4 = v8;
    journeyStartRelayValues = self->_journeyStartRelayValues;
  }
  -[NSMutableArray addObject:](journeyStartRelayValues, "addObject:", v4);

}

- (unint64_t)journeyStartRelayValuesCount
{
  return (unint64_t)-[NSMutableArray count](self->_journeyStartRelayValues, "count");
}

- (id)journeyStartRelayValuesAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_journeyStartRelayValues, "objectAtIndex:", a3);
}

+ (Class)journeyStartRelayValuesType
{
  return (Class)objc_opt_class(APPBAdJourneyStartRelayValue, a2);
}

- (void)clearAdLayoutDatas
{
  -[NSMutableArray removeAllObjects](self->_adLayoutDatas, "removeAllObjects");
}

- (void)addAdLayoutData:(id)a3
{
  id v4;
  NSMutableArray *adLayoutDatas;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  adLayoutDatas = self->_adLayoutDatas;
  v8 = v4;
  if (!adLayoutDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_adLayoutDatas;
    self->_adLayoutDatas = v6;

    v4 = v8;
    adLayoutDatas = self->_adLayoutDatas;
  }
  -[NSMutableArray addObject:](adLayoutDatas, "addObject:", v4);

}

- (id)adLayoutDataAtIndex:(unint64_t)a3
{
  return -[NSMutableArray objectAtIndex:](self->_adLayoutDatas, "objectAtIndex:", a3);
}

+ (Class)adLayoutDataType
{
  return (Class)objc_opt_class(APPBAdLayoutData, a2);
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBAdData;
  v3 = -[APPBAdData description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdData dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAdDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  NSString *bannerURL;
  NSString *bannerWebArchiveURL;
  NSString *uniqueIdentifier;
  NSData *impressionIdentifierData;
  NSString *humanReadableName;
  NSMutableArray *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  NSString *trackingURLSubstitutionParameter;
  NSString *accessibilityDescription;
  NSMutableArray *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  NSString *bannerQueryString;
  NSMutableArray *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *k;
  APPBMediaFiles *mediaFiles;
  NSString *audioURL;
  NSString *slateImageURL;
  NSString *aTVTunerImageURL;
  __int16 has;
  NSMutableArray *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *m;
  NSMutableArray *v39;
  id v40;
  id v41;
  uint64_t v42;
  void *n;
  NSString *iAdJSVersion;
  NSString *iAdJSURL;
  NSMutableArray *v46;
  id v47;
  id v48;
  uint64_t v49;
  void *ii;
  NSMutableArray *v51;
  id v52;
  id v53;
  uint64_t v54;
  void *jj;
  NSString *logoImageURL;
  NSString *headlineForLCD;
  NSString *descriptionForLCD;
  NSMutableArray *v59;
  id v60;
  id v61;
  uint64_t v62;
  void *kk;
  NSString *targetAppBundleID;
  NSString *targetAppURLScheme;
  NSMutableArray *v66;
  id v67;
  id v68;
  uint64_t v69;
  void *mm;
  APPBInstallAttribution *installAttribution;
  APPBAdSpecification *specification;
  __int16 v73;
  APPBMerchant *merchant;
  NSMutableArray *v75;
  id v76;
  id v77;
  uint64_t v78;
  void *nn;
  NSMutableArray *v80;
  id v81;
  id v82;
  uint64_t v83;
  void *i1;
  NSMutableArray *v85;
  id v86;
  id v87;
  uint64_t v88;
  void *i2;
  APPBTransparencyDetails *transparencyDetails;
  APPBNativeMediaCreativeMetadata *nativeMediaCreativeMetadata;
  NSString *adTagContentString;
  __int16 v93;
  NSString *adDataResponseIdentifier;
  NSString *unfilledReasonInfo;
  NSString *adOriginalRequesterId;
  NSString *expressionToEvaluate;
  NSMutableArray *v98;
  id v99;
  id v100;
  uint64_t v101;
  void *i3;
  NSMutableArray *v103;
  id v104;
  id v105;
  uint64_t v106;
  void *i4;
  NSString *adType;
  NSString *adFormatType;
  APPBAdFrequencyCapData *adFrequencyCapData;
  APPBPolicyData *policyData;
  APPBTargetingDimensions *targetingDimensions;
  __int128 v113;
  __int128 v114;
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
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  _BYTE v169[128];
  _BYTE v170[128];
  _BYTE v171[128];
  _BYTE v172[128];
  _BYTE v173[128];
  _BYTE v174[128];
  _BYTE v175[128];
  _BYTE v176[128];
  _BYTE v177[128];
  _BYTE v178[128];
  _BYTE v179[128];
  _BYTE v180[128];
  _BYTE v181[128];
  _BYTE v182[128];

  v4 = a3;
  v5 = v4;
  bannerURL = self->_bannerURL;
  if (bannerURL)
    PBDataWriterWriteStringField(v4, bannerURL, 1);
  bannerWebArchiveURL = self->_bannerWebArchiveURL;
  if (bannerWebArchiveURL)
    PBDataWriterWriteStringField(v5, bannerWebArchiveURL, 2);
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
    PBDataWriterWriteStringField(v5, uniqueIdentifier, 3);
  impressionIdentifierData = self->_impressionIdentifierData;
  if (impressionIdentifierData)
    PBDataWriterWriteDataField(v5, impressionIdentifierData, 4);
  humanReadableName = self->_humanReadableName;
  if (humanReadableName)
    PBDataWriterWriteStringField(v5, humanReadableName, 5);
  PBDataWriterWriteInt32Field(v5, self->_impressionCount, 6);
  if ((*(_WORD *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField(v5, 7, self->_expirationDate);
  v167 = 0u;
  v168 = 0u;
  v165 = 0u;
  v166 = 0u;
  v11 = self->_trackingURLs;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v165, v182, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v166;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v166 != v14)
          objc_enumerationMutation(v11);
        PBDataWriterWriteStringField(v5, *(_QWORD *)(*((_QWORD *)&v165 + 1) + 8 * (_QWORD)i), 8);
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v165, v182, 16);
    }
    while (v13);
  }

  trackingURLSubstitutionParameter = self->_trackingURLSubstitutionParameter;
  if (trackingURLSubstitutionParameter)
    PBDataWriterWriteStringField(v5, trackingURLSubstitutionParameter, 9);
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
    PBDataWriterWriteBOOLField(v5, self->_unbranded, 15);
  accessibilityDescription = self->_accessibilityDescription;
  if (accessibilityDescription)
    PBDataWriterWriteStringField(v5, accessibilityDescription, 16);
  v163 = 0u;
  v164 = 0u;
  v161 = 0u;
  v162 = 0u;
  v18 = self->_confirmedClickPixelURLs;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v161, v181, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v162;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(_QWORD *)v162 != v21)
          objc_enumerationMutation(v18);
        PBDataWriterWriteStringField(v5, *(_QWORD *)(*((_QWORD *)&v161 + 1) + 8 * (_QWORD)j), 35);
      }
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v161, v181, 16);
    }
    while (v20);
  }

  bannerQueryString = self->_bannerQueryString;
  if (bannerQueryString)
    PBDataWriterWriteStringField(v5, bannerQueryString, 36);
  v159 = 0u;
  v160 = 0u;
  v157 = 0u;
  v158 = 0u;
  v24 = self->_videoAssets;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v157, v180, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v158;
    do
    {
      for (k = 0; k != v26; k = (char *)k + 1)
      {
        if (*(_QWORD *)v158 != v27)
          objc_enumerationMutation(v24);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v157 + 1) + 8 * (_QWORD)k), 37);
      }
      v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v157, v180, 16);
    }
    while (v26);
  }

  mediaFiles = self->_mediaFiles;
  if (mediaFiles)
    PBDataWriterWriteSubmessage(v5, mediaFiles, 38);
  audioURL = self->_audioURL;
  if (audioURL)
    PBDataWriterWriteStringField(v5, audioURL, 43);
  slateImageURL = self->_slateImageURL;
  if (slateImageURL)
    PBDataWriterWriteStringField(v5, slateImageURL, 45);
  aTVTunerImageURL = self->_aTVTunerImageURL;
  if (aTVTunerImageURL)
    PBDataWriterWriteStringField(v5, aTVTunerImageURL, 46);
  has = (__int16)self->_has;
  if ((has & 0x2000) != 0)
  {
    PBDataWriterWriteBOOLField(v5, self->_downloadWebArchivesBeforeShowingBanner, 49);
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_52:
      if ((has & 0x80) == 0)
        goto LABEL_54;
      goto LABEL_53;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_52;
  }
  PBDataWriterWriteFloatField(v5, 50, self->_bannerImpressionThreshold);
  if ((*(_WORD *)&self->_has & 0x80) != 0)
LABEL_53:
    PBDataWriterWriteFloatField(v5, 51, self->_bannerNewContentCandidacyThreshold);
LABEL_54:
  v155 = 0u;
  v156 = 0u;
  v153 = 0u;
  v154 = 0u;
  v34 = self->_screenSaverImageURLs;
  v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v153, v179, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v154;
    do
    {
      for (m = 0; m != v36; m = (char *)m + 1)
      {
        if (*(_QWORD *)v154 != v37)
          objc_enumerationMutation(v34);
        PBDataWriterWriteStringField(v5, *(_QWORD *)(*((_QWORD *)&v153 + 1) + 8 * (_QWORD)m), 52);
      }
      v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v153, v179, 16);
    }
    while (v36);
  }

  v151 = 0u;
  v152 = 0u;
  v149 = 0u;
  v150 = 0u;
  v39 = self->_excludeTags;
  v40 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v149, v178, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v150;
    do
    {
      for (n = 0; n != v41; n = (char *)n + 1)
      {
        if (*(_QWORD *)v150 != v42)
          objc_enumerationMutation(v39);
        PBDataWriterWriteStringField(v5, *(_QWORD *)(*((_QWORD *)&v149 + 1) + 8 * (_QWORD)n), 54);
      }
      v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v149, v178, 16);
    }
    while (v41);
  }

  iAdJSVersion = self->_iAdJSVersion;
  if (iAdJSVersion)
    PBDataWriterWriteStringField(v5, iAdJSVersion, 56);
  iAdJSURL = self->_iAdJSURL;
  if (iAdJSURL)
    PBDataWriterWriteStringField(v5, iAdJSURL, 57);
  v147 = 0u;
  v148 = 0u;
  v145 = 0u;
  v146 = 0u;
  v46 = self->_rewardTokens;
  v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v145, v177, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v146;
    do
    {
      for (ii = 0; ii != v48; ii = (char *)ii + 1)
      {
        if (*(_QWORD *)v146 != v49)
          objc_enumerationMutation(v46);
        PBDataWriterWriteStringField(v5, *(_QWORD *)(*((_QWORD *)&v145 + 1) + 8 * (_QWORD)ii), 58);
      }
      v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v145, v177, 16);
    }
    while (v48);
  }

  if ((*(_WORD *)&self->_has & 8) != 0)
    PBDataWriterWriteDoubleField(v5, 59, self->_rewardTokensExpiration);
  v143 = 0u;
  v144 = 0u;
  v141 = 0u;
  v142 = 0u;
  v51 = self->_matchTagClauses;
  v52 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v141, v176, 16);
  if (v52)
  {
    v53 = v52;
    v54 = *(_QWORD *)v142;
    do
    {
      for (jj = 0; jj != v53; jj = (char *)jj + 1)
      {
        if (*(_QWORD *)v142 != v54)
          objc_enumerationMutation(v51);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v141 + 1) + 8 * (_QWORD)jj), 63);
      }
      v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v141, v176, 16);
    }
    while (v53);
  }

  if ((*(_WORD *)&self->_has & 0x10) != 0)
    PBDataWriterWriteDoubleField(v5, 70, self->_skipThreshold);
  logoImageURL = self->_logoImageURL;
  if (logoImageURL)
    PBDataWriterWriteStringField(v5, logoImageURL, 71);
  headlineForLCD = self->_headlineForLCD;
  if (headlineForLCD)
    PBDataWriterWriteStringField(v5, headlineForLCD, 72);
  descriptionForLCD = self->_descriptionForLCD;
  if (descriptionForLCD)
    PBDataWriterWriteStringField(v5, descriptionForLCD, 73);
  if ((*(_WORD *)&self->_has & 4) != 0)
    PBDataWriterWriteFixed64Field(v5, self->_priority, 74);
  v139 = 0u;
  v140 = 0u;
  v137 = 0u;
  v138 = 0u;
  v59 = self->_geofences;
  v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v137, v175, 16);
  if (v60)
  {
    v61 = v60;
    v62 = *(_QWORD *)v138;
    do
    {
      for (kk = 0; kk != v61; kk = (char *)kk + 1)
      {
        if (*(_QWORD *)v138 != v62)
          objc_enumerationMutation(v59);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v137 + 1) + 8 * (_QWORD)kk), 75);
      }
      v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v137, v175, 16);
    }
    while (v61);
  }

  targetAppBundleID = self->_targetAppBundleID;
  if (targetAppBundleID)
    PBDataWriterWriteStringField(v5, targetAppBundleID, 76);
  targetAppURLScheme = self->_targetAppURLScheme;
  if (targetAppURLScheme)
    PBDataWriterWriteStringField(v5, targetAppURLScheme, 77);
  v135 = 0u;
  v136 = 0u;
  v133 = 0u;
  v134 = 0u;
  v66 = self->_creativeSizes;
  v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v133, v174, 16);
  if (v67)
  {
    v68 = v67;
    v69 = *(_QWORD *)v134;
    do
    {
      for (mm = 0; mm != v68; mm = (char *)mm + 1)
      {
        if (*(_QWORD *)v134 != v69)
          objc_enumerationMutation(v66);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v133 + 1) + 8 * (_QWORD)mm), 78);
      }
      v68 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v133, v174, 16);
    }
    while (v68);
  }

  if ((*(_WORD *)&self->_has & 0x200) != 0)
    PBDataWriterWriteFixed32Field(v5, self->_letterboxCreativeColor, 80);
  installAttribution = self->_installAttribution;
  if (installAttribution)
    PBDataWriterWriteSubmessage(v5, installAttribution, 81);
  specification = self->_specification;
  if (specification)
    PBDataWriterWriteSubmessage(v5, specification, 200);
  v73 = (__int16)self->_has;
  if ((v73 & 2) != 0)
  {
    PBDataWriterWriteDoubleField(v5, 300, self->_minimumIntervalBetweenPresentations);
    v73 = (__int16)self->_has;
  }
  if ((v73 & 0x1000) != 0)
    PBDataWriterWriteBOOLField(v5, self->_doesNotResetListeningTime, 301);
  merchant = self->_merchant;
  if (merchant)
    PBDataWriterWriteSubmessage(v5, merchant, 400);
  v131 = 0u;
  v132 = 0u;
  v129 = 0u;
  v130 = 0u;
  v75 = self->_nativeMetadatas;
  v76 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v75, "countByEnumeratingWithState:objects:count:", &v129, v173, 16);
  if (v76)
  {
    v77 = v76;
    v78 = *(_QWORD *)v130;
    do
    {
      for (nn = 0; nn != v77; nn = (char *)nn + 1)
      {
        if (*(_QWORD *)v130 != v78)
          objc_enumerationMutation(v75);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v129 + 1) + 8 * (_QWORD)nn), 500);
      }
      v77 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v75, "countByEnumeratingWithState:objects:count:", &v129, v173, 16);
    }
    while (v77);
  }

  if ((*(_WORD *)&self->_has & 0x100) != 0)
    PBDataWriterWriteInt32Field(v5, self->_desiredPosition, 550);
  v127 = 0u;
  v128 = 0u;
  v125 = 0u;
  v126 = 0u;
  v80 = self->_actions;
  v81 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v80, "countByEnumeratingWithState:objects:count:", &v125, v172, 16);
  if (v81)
  {
    v82 = v81;
    v83 = *(_QWORD *)v126;
    do
    {
      for (i1 = 0; i1 != v82; i1 = (char *)i1 + 1)
      {
        if (*(_QWORD *)v126 != v83)
          objc_enumerationMutation(v80);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * (_QWORD)i1), 600);
      }
      v82 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v80, "countByEnumeratingWithState:objects:count:", &v125, v172, 16);
    }
    while (v82);
  }

  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  v85 = self->_iTunesMetadatas;
  v86 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v85, "countByEnumeratingWithState:objects:count:", &v121, v171, 16);
  if (v86)
  {
    v87 = v86;
    v88 = *(_QWORD *)v122;
    do
    {
      for (i2 = 0; i2 != v87; i2 = (char *)i2 + 1)
      {
        if (*(_QWORD *)v122 != v88)
          objc_enumerationMutation(v85);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * (_QWORD)i2), 700);
      }
      v87 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v85, "countByEnumeratingWithState:objects:count:", &v121, v171, 16);
    }
    while (v87);
  }

  transparencyDetails = self->_transparencyDetails;
  if (transparencyDetails)
    PBDataWriterWriteSubmessage(v5, transparencyDetails, 701);
  nativeMediaCreativeMetadata = self->_nativeMediaCreativeMetadata;
  if (nativeMediaCreativeMetadata)
    PBDataWriterWriteSubmessage(v5, nativeMediaCreativeMetadata, 702);
  adTagContentString = self->_adTagContentString;
  if (adTagContentString)
    PBDataWriterWriteStringField(v5, adTagContentString, 705);
  v93 = (__int16)self->_has;
  if ((v93 & 0x400) != 0)
  {
    PBDataWriterWriteInt32Field(v5, self->_maximumPretapRequestCount, 706);
    v93 = (__int16)self->_has;
  }
  if ((v93 & 0x20) != 0)
    PBDataWriterWriteInt32Field(v5, self->_adPrivacyMarkPosition, 707);
  adDataResponseIdentifier = self->_adDataResponseIdentifier;
  if (adDataResponseIdentifier)
    PBDataWriterWriteStringField(v5, adDataResponseIdentifier, 708);
  if ((*(_WORD *)&self->_has & 0x800) != 0)
    PBDataWriterWriteInt32Field(v5, self->_unfilledReasonCode, 709);
  unfilledReasonInfo = self->_unfilledReasonInfo;
  if (unfilledReasonInfo)
    PBDataWriterWriteStringField(v5, unfilledReasonInfo, 710);
  adOriginalRequesterId = self->_adOriginalRequesterId;
  if (adOriginalRequesterId)
    PBDataWriterWriteStringField(v5, adOriginalRequesterId, 711);
  expressionToEvaluate = self->_expressionToEvaluate;
  if (expressionToEvaluate)
    PBDataWriterWriteStringField(v5, expressionToEvaluate, 715);
  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  v98 = self->_journeyStartRelayValues;
  v99 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v98, "countByEnumeratingWithState:objects:count:", &v117, v170, 16);
  if (v99)
  {
    v100 = v99;
    v101 = *(_QWORD *)v118;
    do
    {
      for (i3 = 0; i3 != v100; i3 = (char *)i3 + 1)
      {
        if (*(_QWORD *)v118 != v101)
          objc_enumerationMutation(v98);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * (_QWORD)i3), 730);
      }
      v100 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v98, "countByEnumeratingWithState:objects:count:", &v117, v170, 16);
    }
    while (v100);
  }

  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v103 = self->_adLayoutDatas;
  v104 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v103, "countByEnumeratingWithState:objects:count:", &v113, v169, 16);
  if (v104)
  {
    v105 = v104;
    v106 = *(_QWORD *)v114;
    do
    {
      for (i4 = 0; i4 != v105; i4 = (char *)i4 + 1)
      {
        if (*(_QWORD *)v114 != v106)
          objc_enumerationMutation(v103);
        PBDataWriterWriteSubmessage(v5, *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * (_QWORD)i4), 750);
      }
      v105 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v103, "countByEnumeratingWithState:objects:count:", &v113, v169, 16);
    }
    while (v105);
  }

  adType = self->_adType;
  if (adType)
    PBDataWriterWriteStringField(v5, adType, 800);
  adFormatType = self->_adFormatType;
  if (adFormatType)
    PBDataWriterWriteStringField(v5, adFormatType, 801);
  adFrequencyCapData = self->_adFrequencyCapData;
  if (adFrequencyCapData)
    PBDataWriterWriteSubmessage(v5, adFrequencyCapData, 810);
  policyData = self->_policyData;
  if (policyData)
    PBDataWriterWriteSubmessage(v5, policyData, 811);
  targetingDimensions = self->_targetingDimensions;
  if (targetingDimensions)
    PBDataWriterWriteSubmessage(v5, targetingDimensions, 812);

}

- (void)copyTo:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  void *v16;
  _DWORD *v17;
  __int16 has;
  unint64_t v19;
  unint64_t v20;
  uint64_t m;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t n;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t ii;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t jj;
  void *v34;
  _QWORD *v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t kk;
  void *v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t mm;
  void *v43;
  _QWORD *v44;
  __int16 v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t nn;
  void *v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t i1;
  void *v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t i2;
  void *v57;
  _DWORD *v58;
  __int16 v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t i3;
  void *v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t i4;
  void *v67;
  void *v68;
  id v69;

  v4 = a3;
  v69 = v4;
  if (self->_bannerURL)
  {
    objc_msgSend(v4, "setBannerURL:");
    v4 = v69;
  }
  if (self->_bannerWebArchiveURL)
  {
    objc_msgSend(v69, "setBannerWebArchiveURL:");
    v4 = v69;
  }
  if (self->_uniqueIdentifier)
  {
    objc_msgSend(v69, "setUniqueIdentifier:");
    v4 = v69;
  }
  if (self->_impressionIdentifierData)
  {
    objc_msgSend(v69, "setImpressionIdentifierData:");
    v4 = v69;
  }
  if (self->_humanReadableName)
  {
    objc_msgSend(v69, "setHumanReadableName:");
    v4 = v69;
  }
  *((_DWORD *)v4 + 68) = self->_impressionCount;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_expirationDate;
    *((_WORD *)v4 + 246) |= 1u;
  }
  if (-[APPBAdData trackingURLsCount](self, "trackingURLsCount"))
  {
    objc_msgSend(v69, "clearTrackingURLs");
    v5 = -[APPBAdData trackingURLsCount](self, "trackingURLsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdData trackingURLAtIndex:](self, "trackingURLAtIndex:", i));
        objc_msgSend(v69, "addTrackingURL:", v8);

      }
    }
  }
  if (self->_trackingURLSubstitutionParameter)
    objc_msgSend(v69, "setTrackingURLSubstitutionParameter:");
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    *((_BYTE *)v69 + 490) = self->_unbranded;
    *((_WORD *)v69 + 246) |= 0x4000u;
  }
  if (self->_accessibilityDescription)
    objc_msgSend(v69, "setAccessibilityDescription:");
  if (-[APPBAdData confirmedClickPixelURLsCount](self, "confirmedClickPixelURLsCount"))
  {
    objc_msgSend(v69, "clearConfirmedClickPixelURLs");
    v9 = -[APPBAdData confirmedClickPixelURLsCount](self, "confirmedClickPixelURLsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdData confirmedClickPixelURLsAtIndex:](self, "confirmedClickPixelURLsAtIndex:", j));
        objc_msgSend(v69, "addConfirmedClickPixelURLs:", v12);

      }
    }
  }
  if (self->_bannerQueryString)
    objc_msgSend(v69, "setBannerQueryString:");
  if (-[APPBAdData videoAssetsCount](self, "videoAssetsCount"))
  {
    objc_msgSend(v69, "clearVideoAssets");
    v13 = -[APPBAdData videoAssetsCount](self, "videoAssetsCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdData videoAssetAtIndex:](self, "videoAssetAtIndex:", k));
        objc_msgSend(v69, "addVideoAsset:", v16);

      }
    }
  }
  if (self->_mediaFiles)
    objc_msgSend(v69, "setMediaFiles:");
  v17 = v69;
  if (self->_audioURL)
  {
    objc_msgSend(v69, "setAudioURL:");
    v17 = v69;
  }
  if (self->_slateImageURL)
  {
    objc_msgSend(v69, "setSlateImageURL:");
    v17 = v69;
  }
  if (self->_aTVTunerImageURL)
  {
    objc_msgSend(v69, "setATVTunerImageURL:");
    v17 = v69;
  }
  has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
    if ((has & 0x40) == 0)
      goto LABEL_43;
LABEL_155:
    v17[36] = LODWORD(self->_bannerImpressionThreshold);
    *((_WORD *)v17 + 246) |= 0x40u;
    if ((*(_WORD *)&self->_has & 0x80) == 0)
      goto LABEL_45;
    goto LABEL_44;
  }
  *((_BYTE *)v17 + 489) = self->_downloadWebArchivesBeforeShowingBanner;
  *((_WORD *)v17 + 246) |= 0x2000u;
  has = (__int16)self->_has;
  if ((has & 0x40) != 0)
    goto LABEL_155;
LABEL_43:
  if ((has & 0x80) != 0)
  {
LABEL_44:
    v17[37] = LODWORD(self->_bannerNewContentCandidacyThreshold);
    *((_WORD *)v17 + 246) |= 0x80u;
  }
LABEL_45:
  if (-[APPBAdData screenSaverImageURLsCount](self, "screenSaverImageURLsCount"))
  {
    objc_msgSend(v69, "clearScreenSaverImageURLs");
    v19 = -[APPBAdData screenSaverImageURLsCount](self, "screenSaverImageURLsCount");
    if (v19)
    {
      v20 = v19;
      for (m = 0; m != v20; ++m)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdData screenSaverImageURLAtIndex:](self, "screenSaverImageURLAtIndex:", m));
        objc_msgSend(v69, "addScreenSaverImageURL:", v22);

      }
    }
  }
  if (-[APPBAdData excludeTagsCount](self, "excludeTagsCount"))
  {
    objc_msgSend(v69, "clearExcludeTags");
    v23 = -[APPBAdData excludeTagsCount](self, "excludeTagsCount");
    if (v23)
    {
      v24 = v23;
      for (n = 0; n != v24; ++n)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdData excludeTagAtIndex:](self, "excludeTagAtIndex:", n));
        objc_msgSend(v69, "addExcludeTag:", v26);

      }
    }
  }
  if (self->_iAdJSVersion)
    objc_msgSend(v69, "setIAdJSVersion:");
  if (self->_iAdJSURL)
    objc_msgSend(v69, "setIAdJSURL:");
  if (-[APPBAdData rewardTokensCount](self, "rewardTokensCount"))
  {
    objc_msgSend(v69, "clearRewardTokens");
    v27 = -[APPBAdData rewardTokensCount](self, "rewardTokensCount");
    if (v27)
    {
      v28 = v27;
      for (ii = 0; ii != v28; ++ii)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdData rewardTokensAtIndex:](self, "rewardTokensAtIndex:", ii));
        objc_msgSend(v69, "addRewardTokens:", v30);

      }
    }
  }
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    *((_QWORD *)v69 + 4) = *(_QWORD *)&self->_rewardTokensExpiration;
    *((_WORD *)v69 + 246) |= 8u;
  }
  if (-[APPBAdData matchTagClausesCount](self, "matchTagClausesCount"))
  {
    objc_msgSend(v69, "clearMatchTagClauses");
    v31 = -[APPBAdData matchTagClausesCount](self, "matchTagClausesCount");
    if (v31)
    {
      v32 = v31;
      for (jj = 0; jj != v32; ++jj)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdData matchTagClauseAtIndex:](self, "matchTagClauseAtIndex:", jj));
        objc_msgSend(v69, "addMatchTagClause:", v34);

      }
    }
  }
  v35 = v69;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    *((_QWORD *)v69 + 5) = *(_QWORD *)&self->_skipThreshold;
    *((_WORD *)v69 + 246) |= 0x10u;
  }
  if (self->_logoImageURL)
  {
    objc_msgSend(v69, "setLogoImageURL:");
    v35 = v69;
  }
  if (self->_headlineForLCD)
  {
    objc_msgSend(v69, "setHeadlineForLCD:");
    v35 = v69;
  }
  if (self->_descriptionForLCD)
  {
    objc_msgSend(v69, "setDescriptionForLCD:");
    v35 = v69;
  }
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    v35[3] = self->_priority;
    *((_WORD *)v35 + 246) |= 4u;
  }
  if (-[APPBAdData geofencesCount](self, "geofencesCount"))
  {
    objc_msgSend(v69, "clearGeofences");
    v36 = -[APPBAdData geofencesCount](self, "geofencesCount");
    if (v36)
    {
      v37 = v36;
      for (kk = 0; kk != v37; ++kk)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdData geofencesAtIndex:](self, "geofencesAtIndex:", kk));
        objc_msgSend(v69, "addGeofences:", v39);

      }
    }
  }
  if (self->_targetAppBundleID)
    objc_msgSend(v69, "setTargetAppBundleID:");
  if (self->_targetAppURLScheme)
    objc_msgSend(v69, "setTargetAppURLScheme:");
  if (-[APPBAdData creativeSizesCount](self, "creativeSizesCount"))
  {
    objc_msgSend(v69, "clearCreativeSizes");
    v40 = -[APPBAdData creativeSizesCount](self, "creativeSizesCount");
    if (v40)
    {
      v41 = v40;
      for (mm = 0; mm != v41; ++mm)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdData creativeSizesAtIndex:](self, "creativeSizesAtIndex:", mm));
        objc_msgSend(v69, "addCreativeSizes:", v43);

      }
    }
  }
  v44 = v69;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    *((_DWORD *)v69 + 76) = self->_letterboxCreativeColor;
    *((_WORD *)v69 + 246) |= 0x200u;
  }
  if (self->_installAttribution)
  {
    objc_msgSend(v69, "setInstallAttribution:");
    v44 = v69;
  }
  if (self->_specification)
  {
    objc_msgSend(v69, "setSpecification:");
    v44 = v69;
  }
  v45 = (__int16)self->_has;
  if ((v45 & 2) != 0)
  {
    v44[2] = *(_QWORD *)&self->_minimumIntervalBetweenPresentations;
    *((_WORD *)v44 + 246) |= 2u;
    v45 = (__int16)self->_has;
  }
  if ((v45 & 0x1000) != 0)
  {
    *((_BYTE *)v44 + 488) = self->_doesNotResetListeningTime;
    *((_WORD *)v44 + 246) |= 0x1000u;
  }
  if (self->_merchant)
    objc_msgSend(v69, "setMerchant:");
  if (-[APPBAdData nativeMetadatasCount](self, "nativeMetadatasCount"))
  {
    objc_msgSend(v69, "clearNativeMetadatas");
    v46 = -[APPBAdData nativeMetadatasCount](self, "nativeMetadatasCount");
    if (v46)
    {
      v47 = v46;
      for (nn = 0; nn != v47; ++nn)
      {
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdData nativeMetadataAtIndex:](self, "nativeMetadataAtIndex:", nn));
        objc_msgSend(v69, "addNativeMetadata:", v49);

      }
    }
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *((_DWORD *)v69 + 50) = self->_desiredPosition;
    *((_WORD *)v69 + 246) |= 0x100u;
  }
  if (-[APPBAdData actionsCount](self, "actionsCount"))
  {
    objc_msgSend(v69, "clearActions");
    v50 = -[APPBAdData actionsCount](self, "actionsCount");
    if (v50)
    {
      v51 = v50;
      for (i1 = 0; i1 != v51; ++i1)
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdData actionsAtIndex:](self, "actionsAtIndex:", i1));
        objc_msgSend(v69, "addActions:", v53);

      }
    }
  }
  if (-[APPBAdData iTunesMetadatasCount](self, "iTunesMetadatasCount"))
  {
    objc_msgSend(v69, "clearITunesMetadatas");
    v54 = -[APPBAdData iTunesMetadatasCount](self, "iTunesMetadatasCount");
    if (v54)
    {
      v55 = v54;
      for (i2 = 0; i2 != v55; ++i2)
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdData iTunesMetadataAtIndex:](self, "iTunesMetadataAtIndex:", i2));
        objc_msgSend(v69, "addITunesMetadata:", v57);

      }
    }
  }
  if (self->_transparencyDetails)
    objc_msgSend(v69, "setTransparencyDetails:");
  v58 = v69;
  if (self->_nativeMediaCreativeMetadata)
  {
    objc_msgSend(v69, "setNativeMediaCreativeMetadata:");
    v58 = v69;
  }
  if (self->_adTagContentString)
  {
    objc_msgSend(v69, "setAdTagContentString:");
    v58 = v69;
  }
  v59 = (__int16)self->_has;
  if ((v59 & 0x400) != 0)
  {
    v58[82] = self->_maximumPretapRequestCount;
    *((_WORD *)v58 + 246) |= 0x400u;
    v59 = (__int16)self->_has;
  }
  if ((v59 & 0x20) != 0)
  {
    v58[28] = self->_adPrivacyMarkPosition;
    *((_WORD *)v58 + 246) |= 0x20u;
  }
  if (self->_adDataResponseIdentifier)
  {
    objc_msgSend(v69, "setAdDataResponseIdentifier:");
    v58 = v69;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    v58[114] = self->_unfilledReasonCode;
    *((_WORD *)v58 + 246) |= 0x800u;
  }
  if (self->_unfilledReasonInfo)
    objc_msgSend(v69, "setUnfilledReasonInfo:");
  if (self->_adOriginalRequesterId)
    objc_msgSend(v69, "setAdOriginalRequesterId:");
  if (self->_expressionToEvaluate)
    objc_msgSend(v69, "setExpressionToEvaluate:");
  if (-[APPBAdData journeyStartRelayValuesCount](self, "journeyStartRelayValuesCount"))
  {
    objc_msgSend(v69, "clearJourneyStartRelayValues");
    v60 = -[APPBAdData journeyStartRelayValuesCount](self, "journeyStartRelayValuesCount");
    if (v60)
    {
      v61 = v60;
      for (i3 = 0; i3 != v61; ++i3)
      {
        v63 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdData journeyStartRelayValuesAtIndex:](self, "journeyStartRelayValuesAtIndex:", i3));
        objc_msgSend(v69, "addJourneyStartRelayValues:", v63);

      }
    }
  }
  if (-[APPBAdData adLayoutDatasCount](self, "adLayoutDatasCount"))
  {
    objc_msgSend(v69, "clearAdLayoutDatas");
    v64 = -[APPBAdData adLayoutDatasCount](self, "adLayoutDatasCount");
    if (v64)
    {
      v65 = v64;
      for (i4 = 0; i4 != v65; ++i4)
      {
        v67 = (void *)objc_claimAutoreleasedReturnValue(-[APPBAdData adLayoutDataAtIndex:](self, "adLayoutDataAtIndex:", i4));
        objc_msgSend(v69, "addAdLayoutData:", v67);

      }
    }
  }
  if (self->_adType)
    objc_msgSend(v69, "setAdType:");
  v68 = v69;
  if (self->_adFormatType)
  {
    objc_msgSend(v69, "setAdFormatType:");
    v68 = v69;
  }
  if (self->_adFrequencyCapData)
  {
    objc_msgSend(v69, "setAdFrequencyCapData:");
    v68 = v69;
  }
  if (self->_policyData)
  {
    objc_msgSend(v69, "setPolicyData:");
    v68 = v69;
  }
  if (self->_targetingDimensions)
  {
    objc_msgSend(v69, "setTargetingDimensions:");
    v68 = v69;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  NSMutableArray *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  id v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  NSMutableArray *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *j;
  id v31;
  id v32;
  void *v33;
  NSMutableArray *v34;
  id v35;
  id v36;
  uint64_t v37;
  void *k;
  id v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  __int16 has;
  NSMutableArray *v49;
  id v50;
  id v51;
  uint64_t v52;
  void *m;
  id v54;
  NSMutableArray *v55;
  id v56;
  id v57;
  uint64_t v58;
  void *n;
  id v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  NSMutableArray *v65;
  id v66;
  id v67;
  uint64_t v68;
  void *ii;
  id v70;
  NSMutableArray *v71;
  id v72;
  id v73;
  uint64_t v74;
  void *jj;
  id v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  void *v82;
  NSMutableArray *v83;
  id v84;
  id v85;
  uint64_t v86;
  void *kk;
  id v88;
  id v89;
  void *v90;
  id v91;
  void *v92;
  NSMutableArray *v93;
  id v94;
  id v95;
  uint64_t v96;
  void *mm;
  id v98;
  id v99;
  void *v100;
  id v101;
  void *v102;
  __int16 v103;
  id v104;
  void *v105;
  NSMutableArray *v106;
  id v107;
  id v108;
  uint64_t v109;
  void *nn;
  id v111;
  NSMutableArray *v112;
  id v113;
  id v114;
  uint64_t v115;
  void *i1;
  id v117;
  NSMutableArray *v118;
  id v119;
  id v120;
  uint64_t v121;
  void *i2;
  id v123;
  id v124;
  void *v125;
  id v126;
  void *v127;
  id v128;
  void *v129;
  __int16 v130;
  id v131;
  void *v132;
  id v133;
  void *v134;
  id v135;
  void *v136;
  id v137;
  void *v138;
  NSMutableArray *v139;
  id v140;
  id v141;
  uint64_t v142;
  void *i3;
  id v144;
  NSMutableArray *v145;
  id v146;
  id v147;
  uint64_t v148;
  void *i4;
  id v150;
  id v151;
  void *v152;
  id v153;
  void *v154;
  id v155;
  void *v156;
  id v157;
  void *v158;
  id v159;
  void *v160;
  _QWORD *v161;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  _BYTE v219[128];
  _BYTE v220[128];
  _BYTE v221[128];
  _BYTE v222[128];
  _BYTE v223[128];
  _BYTE v224[128];
  _BYTE v225[128];
  _BYTE v226[128];
  _BYTE v227[128];
  _BYTE v228[128];
  _BYTE v229[128];
  _BYTE v230[128];
  _BYTE v231[128];
  _BYTE v232[128];

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_bannerURL, "copyWithZone:", a3);
  v7 = (void *)v5[20];
  v5[20] = v6;

  v8 = -[NSString copyWithZone:](self->_bannerWebArchiveURL, "copyWithZone:", a3);
  v9 = (void *)v5[21];
  v5[21] = v8;

  v10 = -[NSString copyWithZone:](self->_uniqueIdentifier, "copyWithZone:", a3);
  v11 = (void *)v5[59];
  v5[59] = v10;

  v12 = -[NSData copyWithZone:](self->_impressionIdentifierData, "copyWithZone:", a3);
  v13 = (void *)v5[35];
  v5[35] = v12;

  v14 = -[NSString copyWithZone:](self->_humanReadableName, "copyWithZone:", a3);
  v15 = (void *)v5[30];
  v5[30] = v14;

  *((_DWORD *)v5 + 68) = self->_impressionCount;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[1] = *(_QWORD *)&self->_expirationDate;
    *((_WORD *)v5 + 246) |= 1u;
  }
  v217 = 0u;
  v218 = 0u;
  v215 = 0u;
  v216 = 0u;
  v16 = self->_trackingURLs;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v215, v232, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v216;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v216 != v19)
          objc_enumerationMutation(v16);
        v21 = objc_msgSend(*(id *)(*((_QWORD *)&v215 + 1) + 8 * (_QWORD)i), "copyWithZone:", a3);
        objc_msgSend(v5, "addTrackingURL:", v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v215, v232, 16);
    }
    while (v18);
  }

  v22 = -[NSString copyWithZone:](self->_trackingURLSubstitutionParameter, "copyWithZone:", a3);
  v23 = (void *)v5[54];
  v5[54] = v22;

  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    *((_BYTE *)v5 + 490) = self->_unbranded;
    *((_WORD *)v5 + 246) |= 0x4000u;
  }
  v24 = -[NSString copyWithZone:](self->_accessibilityDescription, "copyWithZone:", a3);
  v25 = (void *)v5[7];
  v5[7] = v24;

  v213 = 0u;
  v214 = 0u;
  v211 = 0u;
  v212 = 0u;
  v26 = self->_confirmedClickPixelURLs;
  v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v211, v231, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v212;
    do
    {
      for (j = 0; j != v28; j = (char *)j + 1)
      {
        if (*(_QWORD *)v212 != v29)
          objc_enumerationMutation(v26);
        v31 = objc_msgSend(*(id *)(*((_QWORD *)&v211 + 1) + 8 * (_QWORD)j), "copyWithZone:", a3);
        objc_msgSend(v5, "addConfirmedClickPixelURLs:", v31);

      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v211, v231, 16);
    }
    while (v28);
  }

  v32 = -[NSString copyWithZone:](self->_bannerQueryString, "copyWithZone:", a3);
  v33 = (void *)v5[19];
  v5[19] = v32;

  v209 = 0u;
  v210 = 0u;
  v207 = 0u;
  v208 = 0u;
  v34 = self->_videoAssets;
  v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v207, v230, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v208;
    do
    {
      for (k = 0; k != v36; k = (char *)k + 1)
      {
        if (*(_QWORD *)v208 != v37)
          objc_enumerationMutation(v34);
        v39 = objc_msgSend(*(id *)(*((_QWORD *)&v207 + 1) + 8 * (_QWORD)k), "copyWithZone:", a3);
        objc_msgSend(v5, "addVideoAsset:", v39);

      }
      v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v207, v230, 16);
    }
    while (v36);
  }

  v40 = -[APPBMediaFiles copyWithZone:](self->_mediaFiles, "copyWithZone:", a3);
  v41 = (void *)v5[42];
  v5[42] = v40;

  v42 = -[NSString copyWithZone:](self->_audioURL, "copyWithZone:", a3);
  v43 = (void *)v5[17];
  v5[17] = v42;

  v44 = -[NSString copyWithZone:](self->_slateImageURL, "copyWithZone:", a3);
  v45 = (void *)v5[49];
  v5[49] = v44;

  v46 = -[NSString copyWithZone:](self->_aTVTunerImageURL, "copyWithZone:", a3);
  v47 = (void *)v5[6];
  v5[6] = v46;

  has = (__int16)self->_has;
  if ((has & 0x2000) != 0)
  {
    *((_BYTE *)v5 + 489) = self->_downloadWebArchivesBeforeShowingBanner;
    *((_WORD *)v5 + 246) |= 0x2000u;
    has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_28:
      if ((has & 0x80) == 0)
        goto LABEL_30;
      goto LABEL_29;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_28;
  }
  *((_DWORD *)v5 + 36) = LODWORD(self->_bannerImpressionThreshold);
  *((_WORD *)v5 + 246) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
LABEL_29:
    *((_DWORD *)v5 + 37) = LODWORD(self->_bannerNewContentCandidacyThreshold);
    *((_WORD *)v5 + 246) |= 0x80u;
  }
LABEL_30:
  v205 = 0u;
  v206 = 0u;
  v203 = 0u;
  v204 = 0u;
  v49 = self->_screenSaverImageURLs;
  v50 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v203, v229, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v204;
    do
    {
      for (m = 0; m != v51; m = (char *)m + 1)
      {
        if (*(_QWORD *)v204 != v52)
          objc_enumerationMutation(v49);
        v54 = objc_msgSend(*(id *)(*((_QWORD *)&v203 + 1) + 8 * (_QWORD)m), "copyWithZone:", a3);
        objc_msgSend(v5, "addScreenSaverImageURL:", v54);

      }
      v51 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v203, v229, 16);
    }
    while (v51);
  }

  v201 = 0u;
  v202 = 0u;
  v199 = 0u;
  v200 = 0u;
  v55 = self->_excludeTags;
  v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v199, v228, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v200;
    do
    {
      for (n = 0; n != v57; n = (char *)n + 1)
      {
        if (*(_QWORD *)v200 != v58)
          objc_enumerationMutation(v55);
        v60 = objc_msgSend(*(id *)(*((_QWORD *)&v199 + 1) + 8 * (_QWORD)n), "copyWithZone:", a3);
        objc_msgSend(v5, "addExcludeTag:", v60);

      }
      v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v55, "countByEnumeratingWithState:objects:count:", &v199, v228, 16);
    }
    while (v57);
  }

  v61 = -[NSString copyWithZone:](self->_iAdJSVersion, "copyWithZone:", a3);
  v62 = (void *)v5[32];
  v5[32] = v61;

  v63 = -[NSString copyWithZone:](self->_iAdJSURL, "copyWithZone:", a3);
  v64 = (void *)v5[31];
  v5[31] = v63;

  v197 = 0u;
  v198 = 0u;
  v195 = 0u;
  v196 = 0u;
  v65 = self->_rewardTokens;
  v66 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v195, v227, 16);
  if (v66)
  {
    v67 = v66;
    v68 = *(_QWORD *)v196;
    do
    {
      for (ii = 0; ii != v67; ii = (char *)ii + 1)
      {
        if (*(_QWORD *)v196 != v68)
          objc_enumerationMutation(v65);
        v70 = objc_msgSend(*(id *)(*((_QWORD *)&v195 + 1) + 8 * (_QWORD)ii), "copyWithZone:", a3);
        objc_msgSend(v5, "addRewardTokens:", v70);

      }
      v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v195, v227, 16);
    }
    while (v67);
  }

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    v5[4] = *(_QWORD *)&self->_rewardTokensExpiration;
    *((_WORD *)v5 + 246) |= 8u;
  }
  v193 = 0u;
  v194 = 0u;
  v191 = 0u;
  v192 = 0u;
  v71 = self->_matchTagClauses;
  v72 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v71, "countByEnumeratingWithState:objects:count:", &v191, v226, 16);
  if (v72)
  {
    v73 = v72;
    v74 = *(_QWORD *)v192;
    do
    {
      for (jj = 0; jj != v73; jj = (char *)jj + 1)
      {
        if (*(_QWORD *)v192 != v74)
          objc_enumerationMutation(v71);
        v76 = objc_msgSend(*(id *)(*((_QWORD *)&v191 + 1) + 8 * (_QWORD)jj), "copyWithZone:", a3);
        objc_msgSend(v5, "addMatchTagClause:", v76);

      }
      v73 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v71, "countByEnumeratingWithState:objects:count:", &v191, v226, 16);
    }
    while (v73);
  }

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    v5[5] = *(_QWORD *)&self->_skipThreshold;
    *((_WORD *)v5 + 246) |= 0x10u;
  }
  v77 = -[NSString copyWithZone:](self->_logoImageURL, "copyWithZone:", a3);
  v78 = (void *)v5[39];
  v5[39] = v77;

  v79 = -[NSString copyWithZone:](self->_headlineForLCD, "copyWithZone:", a3);
  v80 = (void *)v5[29];
  v5[29] = v79;

  v81 = -[NSString copyWithZone:](self->_descriptionForLCD, "copyWithZone:", a3);
  v82 = (void *)v5[24];
  v5[24] = v81;

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    v5[3] = self->_priority;
    *((_WORD *)v5 + 246) |= 4u;
  }
  v189 = 0u;
  v190 = 0u;
  v187 = 0u;
  v188 = 0u;
  v83 = self->_geofences;
  v84 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v83, "countByEnumeratingWithState:objects:count:", &v187, v225, 16);
  if (v84)
  {
    v85 = v84;
    v86 = *(_QWORD *)v188;
    do
    {
      for (kk = 0; kk != v85; kk = (char *)kk + 1)
      {
        if (*(_QWORD *)v188 != v86)
          objc_enumerationMutation(v83);
        v88 = objc_msgSend(*(id *)(*((_QWORD *)&v187 + 1) + 8 * (_QWORD)kk), "copyWithZone:", a3);
        objc_msgSend(v5, "addGeofences:", v88);

      }
      v85 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v83, "countByEnumeratingWithState:objects:count:", &v187, v225, 16);
    }
    while (v85);
  }

  v89 = -[NSString copyWithZone:](self->_targetAppBundleID, "copyWithZone:", a3);
  v90 = (void *)v5[51];
  v5[51] = v89;

  v91 = -[NSString copyWithZone:](self->_targetAppURLScheme, "copyWithZone:", a3);
  v92 = (void *)v5[52];
  v5[52] = v91;

  v185 = 0u;
  v186 = 0u;
  v183 = 0u;
  v184 = 0u;
  v93 = self->_creativeSizes;
  v94 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v93, "countByEnumeratingWithState:objects:count:", &v183, v224, 16);
  if (v94)
  {
    v95 = v94;
    v96 = *(_QWORD *)v184;
    do
    {
      for (mm = 0; mm != v95; mm = (char *)mm + 1)
      {
        if (*(_QWORD *)v184 != v96)
          objc_enumerationMutation(v93);
        v98 = objc_msgSend(*(id *)(*((_QWORD *)&v183 + 1) + 8 * (_QWORD)mm), "copyWithZone:", a3);
        objc_msgSend(v5, "addCreativeSizes:", v98);

      }
      v95 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v93, "countByEnumeratingWithState:objects:count:", &v183, v224, 16);
    }
    while (v95);
  }

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    *((_DWORD *)v5 + 76) = self->_letterboxCreativeColor;
    *((_WORD *)v5 + 246) |= 0x200u;
  }
  v99 = -[APPBInstallAttribution copyWithZone:](self->_installAttribution, "copyWithZone:", a3);
  v100 = (void *)v5[36];
  v5[36] = v99;

  v101 = -[APPBAdSpecification copyWithZone:](self->_specification, "copyWithZone:", a3);
  v102 = (void *)v5[50];
  v5[50] = v101;

  v103 = (__int16)self->_has;
  if ((v103 & 2) != 0)
  {
    v5[2] = *(_QWORD *)&self->_minimumIntervalBetweenPresentations;
    *((_WORD *)v5 + 246) |= 2u;
    v103 = (__int16)self->_has;
  }
  if ((v103 & 0x1000) != 0)
  {
    *((_BYTE *)v5 + 488) = self->_doesNotResetListeningTime;
    *((_WORD *)v5 + 246) |= 0x1000u;
  }
  v104 = -[APPBMerchant copyWithZone:](self->_merchant, "copyWithZone:", a3);
  v105 = (void *)v5[43];
  v5[43] = v104;

  v181 = 0u;
  v182 = 0u;
  v179 = 0u;
  v180 = 0u;
  v106 = self->_nativeMetadatas;
  v107 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v106, "countByEnumeratingWithState:objects:count:", &v179, v223, 16);
  if (v107)
  {
    v108 = v107;
    v109 = *(_QWORD *)v180;
    do
    {
      for (nn = 0; nn != v108; nn = (char *)nn + 1)
      {
        if (*(_QWORD *)v180 != v109)
          objc_enumerationMutation(v106);
        v111 = objc_msgSend(*(id *)(*((_QWORD *)&v179 + 1) + 8 * (_QWORD)nn), "copyWithZone:", a3);
        objc_msgSend(v5, "addNativeMetadata:", v111);

      }
      v108 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v106, "countByEnumeratingWithState:objects:count:", &v179, v223, 16);
    }
    while (v108);
  }

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *((_DWORD *)v5 + 50) = self->_desiredPosition;
    *((_WORD *)v5 + 246) |= 0x100u;
  }
  v177 = 0u;
  v178 = 0u;
  v175 = 0u;
  v176 = 0u;
  v112 = self->_actions;
  v113 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v112, "countByEnumeratingWithState:objects:count:", &v175, v222, 16);
  if (v113)
  {
    v114 = v113;
    v115 = *(_QWORD *)v176;
    do
    {
      for (i1 = 0; i1 != v114; i1 = (char *)i1 + 1)
      {
        if (*(_QWORD *)v176 != v115)
          objc_enumerationMutation(v112);
        v117 = objc_msgSend(*(id *)(*((_QWORD *)&v175 + 1) + 8 * (_QWORD)i1), "copyWithZone:", a3);
        objc_msgSend(v5, "addActions:", v117);

      }
      v114 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v112, "countByEnumeratingWithState:objects:count:", &v175, v222, 16);
    }
    while (v114);
  }

  v173 = 0u;
  v174 = 0u;
  v171 = 0u;
  v172 = 0u;
  v118 = self->_iTunesMetadatas;
  v119 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v118, "countByEnumeratingWithState:objects:count:", &v171, v221, 16);
  if (v119)
  {
    v120 = v119;
    v121 = *(_QWORD *)v172;
    do
    {
      for (i2 = 0; i2 != v120; i2 = (char *)i2 + 1)
      {
        if (*(_QWORD *)v172 != v121)
          objc_enumerationMutation(v118);
        v123 = objc_msgSend(*(id *)(*((_QWORD *)&v171 + 1) + 8 * (_QWORD)i2), "copyWithZone:", a3);
        objc_msgSend(v5, "addITunesMetadata:", v123);

      }
      v120 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v118, "countByEnumeratingWithState:objects:count:", &v171, v221, 16);
    }
    while (v120);
  }

  v124 = -[APPBTransparencyDetails copyWithZone:](self->_transparencyDetails, "copyWithZone:", a3);
  v125 = (void *)v5[56];
  v5[56] = v124;

  v126 = -[APPBNativeMediaCreativeMetadata copyWithZone:](self->_nativeMediaCreativeMetadata, "copyWithZone:", a3);
  v127 = (void *)v5[44];
  v5[44] = v126;

  v128 = -[NSString copyWithZone:](self->_adTagContentString, "copyWithZone:", a3);
  v129 = (void *)v5[15];
  v5[15] = v128;

  v130 = (__int16)self->_has;
  if ((v130 & 0x400) != 0)
  {
    *((_DWORD *)v5 + 82) = self->_maximumPretapRequestCount;
    *((_WORD *)v5 + 246) |= 0x400u;
    v130 = (__int16)self->_has;
  }
  if ((v130 & 0x20) != 0)
  {
    *((_DWORD *)v5 + 28) = self->_adPrivacyMarkPosition;
    *((_WORD *)v5 + 246) |= 0x20u;
  }
  v131 = -[NSString copyWithZone:](self->_adDataResponseIdentifier, "copyWithZone:", a3);
  v132 = (void *)v5[9];
  v5[9] = v131;

  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    *((_DWORD *)v5 + 114) = self->_unfilledReasonCode;
    *((_WORD *)v5 + 246) |= 0x800u;
  }
  v133 = -[NSString copyWithZone:](self->_unfilledReasonInfo, "copyWithZone:", a3);
  v134 = (void *)v5[58];
  v5[58] = v133;

  v135 = -[NSString copyWithZone:](self->_adOriginalRequesterId, "copyWithZone:", a3);
  v136 = (void *)v5[13];
  v5[13] = v135;

  v137 = -[NSString copyWithZone:](self->_expressionToEvaluate, "copyWithZone:", a3);
  v138 = (void *)v5[27];
  v5[27] = v137;

  v169 = 0u;
  v170 = 0u;
  v167 = 0u;
  v168 = 0u;
  v139 = self->_journeyStartRelayValues;
  v140 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v139, "countByEnumeratingWithState:objects:count:", &v167, v220, 16);
  if (v140)
  {
    v141 = v140;
    v142 = *(_QWORD *)v168;
    do
    {
      for (i3 = 0; i3 != v141; i3 = (char *)i3 + 1)
      {
        if (*(_QWORD *)v168 != v142)
          objc_enumerationMutation(v139);
        v144 = objc_msgSend(*(id *)(*((_QWORD *)&v167 + 1) + 8 * (_QWORD)i3), "copyWithZone:", a3);
        objc_msgSend(v5, "addJourneyStartRelayValues:", v144);

      }
      v141 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v139, "countByEnumeratingWithState:objects:count:", &v167, v220, 16);
    }
    while (v141);
  }

  v165 = 0u;
  v166 = 0u;
  v163 = 0u;
  v164 = 0u;
  v145 = self->_adLayoutDatas;
  v146 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v145, "countByEnumeratingWithState:objects:count:", &v163, v219, 16);
  if (v146)
  {
    v147 = v146;
    v148 = *(_QWORD *)v164;
    do
    {
      for (i4 = 0; i4 != v147; i4 = (char *)i4 + 1)
      {
        if (*(_QWORD *)v164 != v148)
          objc_enumerationMutation(v145);
        v150 = objc_msgSend(*(id *)(*((_QWORD *)&v163 + 1) + 8 * (_QWORD)i4), "copyWithZone:", a3, (_QWORD)v163);
        objc_msgSend(v5, "addAdLayoutData:", v150);

      }
      v147 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v145, "countByEnumeratingWithState:objects:count:", &v163, v219, 16);
    }
    while (v147);
  }

  v151 = -[NSString copyWithZone:](self->_adType, "copyWithZone:", a3);
  v152 = (void *)v5[16];
  v5[16] = v151;

  v153 = -[NSString copyWithZone:](self->_adFormatType, "copyWithZone:", a3);
  v154 = (void *)v5[10];
  v5[10] = v153;

  v155 = -[APPBAdFrequencyCapData copyWithZone:](self->_adFrequencyCapData, "copyWithZone:", a3);
  v156 = (void *)v5[11];
  v5[11] = v155;

  v157 = -[APPBPolicyData copyWithZone:](self->_policyData, "copyWithZone:", a3);
  v158 = (void *)v5[46];
  v5[46] = v157;

  v159 = -[APPBTargetingDimensions copyWithZone:](self->_targetingDimensions, "copyWithZone:", a3);
  v160 = (void *)v5[53];
  v5[53] = v159;

  v161 = v5;
  return v161;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *bannerURL;
  NSString *bannerWebArchiveURL;
  NSString *uniqueIdentifier;
  NSData *impressionIdentifierData;
  NSString *humanReadableName;
  __int16 v10;
  NSMutableArray *trackingURLs;
  NSString *trackingURLSubstitutionParameter;
  NSString *accessibilityDescription;
  NSMutableArray *confirmedClickPixelURLs;
  NSString *bannerQueryString;
  NSMutableArray *videoAssets;
  APPBMediaFiles *mediaFiles;
  NSString *audioURL;
  NSString *slateImageURL;
  NSString *aTVTunerImageURL;
  __int16 has;
  __int16 v22;
  NSMutableArray *screenSaverImageURLs;
  NSMutableArray *excludeTags;
  NSString *iAdJSVersion;
  NSString *iAdJSURL;
  NSMutableArray *rewardTokens;
  __int16 v28;
  __int16 v29;
  NSMutableArray *matchTagClauses;
  __int16 v31;
  NSString *logoImageURL;
  NSString *headlineForLCD;
  NSString *descriptionForLCD;
  __int16 v35;
  NSMutableArray *geofences;
  NSString *targetAppBundleID;
  NSString *targetAppURLScheme;
  NSMutableArray *creativeSizes;
  APPBInstallAttribution *installAttribution;
  APPBAdSpecification *specification;
  __int16 v42;
  APPBMerchant *merchant;
  NSMutableArray *nativeMetadatas;
  NSMutableArray *actions;
  NSMutableArray *iTunesMetadatas;
  APPBTransparencyDetails *transparencyDetails;
  APPBNativeMediaCreativeMetadata *nativeMediaCreativeMetadata;
  NSString *adTagContentString;
  __int16 v50;
  __int16 v51;
  NSString *adDataResponseIdentifier;
  NSString *unfilledReasonInfo;
  NSString *adOriginalRequesterId;
  NSString *expressionToEvaluate;
  NSMutableArray *journeyStartRelayValues;
  NSMutableArray *adLayoutDatas;
  NSString *adType;
  NSString *adFormatType;
  APPBAdFrequencyCapData *adFrequencyCapData;
  APPBPolicyData *policyData;
  APPBTargetingDimensions *targetingDimensions;
  unsigned __int8 v63;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_185;
  bannerURL = self->_bannerURL;
  if ((unint64_t)bannerURL | *((_QWORD *)v4 + 20))
  {
    if (!-[NSString isEqual:](bannerURL, "isEqual:"))
      goto LABEL_185;
  }
  bannerWebArchiveURL = self->_bannerWebArchiveURL;
  if ((unint64_t)bannerWebArchiveURL | *((_QWORD *)v4 + 21))
  {
    if (!-[NSString isEqual:](bannerWebArchiveURL, "isEqual:"))
      goto LABEL_185;
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if ((unint64_t)uniqueIdentifier | *((_QWORD *)v4 + 59))
  {
    if (!-[NSString isEqual:](uniqueIdentifier, "isEqual:"))
      goto LABEL_185;
  }
  impressionIdentifierData = self->_impressionIdentifierData;
  if ((unint64_t)impressionIdentifierData | *((_QWORD *)v4 + 35))
  {
    if (!-[NSData isEqual:](impressionIdentifierData, "isEqual:"))
      goto LABEL_185;
  }
  humanReadableName = self->_humanReadableName;
  if ((unint64_t)humanReadableName | *((_QWORD *)v4 + 30))
  {
    if (!-[NSString isEqual:](humanReadableName, "isEqual:"))
      goto LABEL_185;
  }
  if (self->_impressionCount != *((_DWORD *)v4 + 68))
    goto LABEL_185;
  v10 = *((_WORD *)v4 + 246);
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    if ((v10 & 1) == 0 || self->_expirationDate != *((double *)v4 + 1))
      goto LABEL_185;
  }
  else if ((v10 & 1) != 0)
  {
    goto LABEL_185;
  }
  trackingURLs = self->_trackingURLs;
  if ((unint64_t)trackingURLs | *((_QWORD *)v4 + 55)
    && !-[NSMutableArray isEqual:](trackingURLs, "isEqual:"))
  {
    goto LABEL_185;
  }
  trackingURLSubstitutionParameter = self->_trackingURLSubstitutionParameter;
  if ((unint64_t)trackingURLSubstitutionParameter | *((_QWORD *)v4 + 54))
  {
    if (!-[NSString isEqual:](trackingURLSubstitutionParameter, "isEqual:"))
      goto LABEL_185;
  }
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
  {
    if ((*((_WORD *)v4 + 246) & 0x4000) == 0)
      goto LABEL_185;
    if (self->_unbranded)
    {
      if (!*((_BYTE *)v4 + 490))
        goto LABEL_185;
    }
    else if (*((_BYTE *)v4 + 490))
    {
      goto LABEL_185;
    }
  }
  else if ((*((_WORD *)v4 + 246) & 0x4000) != 0)
  {
    goto LABEL_185;
  }
  accessibilityDescription = self->_accessibilityDescription;
  if ((unint64_t)accessibilityDescription | *((_QWORD *)v4 + 7)
    && !-[NSString isEqual:](accessibilityDescription, "isEqual:"))
  {
    goto LABEL_185;
  }
  confirmedClickPixelURLs = self->_confirmedClickPixelURLs;
  if ((unint64_t)confirmedClickPixelURLs | *((_QWORD *)v4 + 22))
  {
    if (!-[NSMutableArray isEqual:](confirmedClickPixelURLs, "isEqual:"))
      goto LABEL_185;
  }
  bannerQueryString = self->_bannerQueryString;
  if ((unint64_t)bannerQueryString | *((_QWORD *)v4 + 19))
  {
    if (!-[NSString isEqual:](bannerQueryString, "isEqual:"))
      goto LABEL_185;
  }
  videoAssets = self->_videoAssets;
  if ((unint64_t)videoAssets | *((_QWORD *)v4 + 60))
  {
    if (!-[NSMutableArray isEqual:](videoAssets, "isEqual:"))
      goto LABEL_185;
  }
  mediaFiles = self->_mediaFiles;
  if ((unint64_t)mediaFiles | *((_QWORD *)v4 + 42))
  {
    if (!-[APPBMediaFiles isEqual:](mediaFiles, "isEqual:"))
      goto LABEL_185;
  }
  audioURL = self->_audioURL;
  if ((unint64_t)audioURL | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](audioURL, "isEqual:"))
      goto LABEL_185;
  }
  slateImageURL = self->_slateImageURL;
  if ((unint64_t)slateImageURL | *((_QWORD *)v4 + 49))
  {
    if (!-[NSString isEqual:](slateImageURL, "isEqual:"))
      goto LABEL_185;
  }
  aTVTunerImageURL = self->_aTVTunerImageURL;
  if ((unint64_t)aTVTunerImageURL | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](aTVTunerImageURL, "isEqual:"))
      goto LABEL_185;
  }
  has = (__int16)self->_has;
  v22 = *((_WORD *)v4 + 246);
  if ((has & 0x2000) != 0)
  {
    if ((*((_WORD *)v4 + 246) & 0x2000) == 0)
      goto LABEL_185;
    if (self->_downloadWebArchivesBeforeShowingBanner)
    {
      if (!*((_BYTE *)v4 + 489))
        goto LABEL_185;
    }
    else if (*((_BYTE *)v4 + 489))
    {
      goto LABEL_185;
    }
  }
  else if ((*((_WORD *)v4 + 246) & 0x2000) != 0)
  {
    goto LABEL_185;
  }
  if ((has & 0x40) != 0)
  {
    if ((v22 & 0x40) == 0 || self->_bannerImpressionThreshold != *((float *)v4 + 36))
      goto LABEL_185;
  }
  else if ((v22 & 0x40) != 0)
  {
    goto LABEL_185;
  }
  if ((has & 0x80) != 0)
  {
    if ((v22 & 0x80) == 0 || self->_bannerNewContentCandidacyThreshold != *((float *)v4 + 37))
      goto LABEL_185;
  }
  else if ((v22 & 0x80) != 0)
  {
    goto LABEL_185;
  }
  screenSaverImageURLs = self->_screenSaverImageURLs;
  if ((unint64_t)screenSaverImageURLs | *((_QWORD *)v4 + 48)
    && !-[NSMutableArray isEqual:](screenSaverImageURLs, "isEqual:"))
  {
    goto LABEL_185;
  }
  excludeTags = self->_excludeTags;
  if ((unint64_t)excludeTags | *((_QWORD *)v4 + 26))
  {
    if (!-[NSMutableArray isEqual:](excludeTags, "isEqual:"))
      goto LABEL_185;
  }
  iAdJSVersion = self->_iAdJSVersion;
  if ((unint64_t)iAdJSVersion | *((_QWORD *)v4 + 32))
  {
    if (!-[NSString isEqual:](iAdJSVersion, "isEqual:"))
      goto LABEL_185;
  }
  iAdJSURL = self->_iAdJSURL;
  if ((unint64_t)iAdJSURL | *((_QWORD *)v4 + 31))
  {
    if (!-[NSString isEqual:](iAdJSURL, "isEqual:"))
      goto LABEL_185;
  }
  rewardTokens = self->_rewardTokens;
  if ((unint64_t)rewardTokens | *((_QWORD *)v4 + 47))
  {
    if (!-[NSMutableArray isEqual:](rewardTokens, "isEqual:"))
      goto LABEL_185;
  }
  v28 = (__int16)self->_has;
  v29 = *((_WORD *)v4 + 246);
  if ((v28 & 8) != 0)
  {
    if ((v29 & 8) == 0 || self->_rewardTokensExpiration != *((double *)v4 + 4))
      goto LABEL_185;
  }
  else if ((v29 & 8) != 0)
  {
    goto LABEL_185;
  }
  matchTagClauses = self->_matchTagClauses;
  if ((unint64_t)matchTagClauses | *((_QWORD *)v4 + 40))
  {
    if (!-[NSMutableArray isEqual:](matchTagClauses, "isEqual:"))
      goto LABEL_185;
    v28 = (__int16)self->_has;
  }
  v31 = *((_WORD *)v4 + 246);
  if ((v28 & 0x10) != 0)
  {
    if ((v31 & 0x10) == 0 || self->_skipThreshold != *((double *)v4 + 5))
      goto LABEL_185;
  }
  else if ((v31 & 0x10) != 0)
  {
    goto LABEL_185;
  }
  logoImageURL = self->_logoImageURL;
  if ((unint64_t)logoImageURL | *((_QWORD *)v4 + 39)
    && !-[NSString isEqual:](logoImageURL, "isEqual:"))
  {
    goto LABEL_185;
  }
  headlineForLCD = self->_headlineForLCD;
  if ((unint64_t)headlineForLCD | *((_QWORD *)v4 + 29))
  {
    if (!-[NSString isEqual:](headlineForLCD, "isEqual:"))
      goto LABEL_185;
  }
  descriptionForLCD = self->_descriptionForLCD;
  if ((unint64_t)descriptionForLCD | *((_QWORD *)v4 + 24))
  {
    if (!-[NSString isEqual:](descriptionForLCD, "isEqual:"))
      goto LABEL_185;
  }
  v35 = *((_WORD *)v4 + 246);
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    if ((v35 & 4) == 0 || self->_priority != *((_QWORD *)v4 + 3))
      goto LABEL_185;
  }
  else if ((v35 & 4) != 0)
  {
    goto LABEL_185;
  }
  geofences = self->_geofences;
  if ((unint64_t)geofences | *((_QWORD *)v4 + 28)
    && !-[NSMutableArray isEqual:](geofences, "isEqual:"))
  {
    goto LABEL_185;
  }
  targetAppBundleID = self->_targetAppBundleID;
  if ((unint64_t)targetAppBundleID | *((_QWORD *)v4 + 51))
  {
    if (!-[NSString isEqual:](targetAppBundleID, "isEqual:"))
      goto LABEL_185;
  }
  targetAppURLScheme = self->_targetAppURLScheme;
  if ((unint64_t)targetAppURLScheme | *((_QWORD *)v4 + 52))
  {
    if (!-[NSString isEqual:](targetAppURLScheme, "isEqual:"))
      goto LABEL_185;
  }
  creativeSizes = self->_creativeSizes;
  if ((unint64_t)creativeSizes | *((_QWORD *)v4 + 23))
  {
    if (!-[NSMutableArray isEqual:](creativeSizes, "isEqual:"))
      goto LABEL_185;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 246) & 0x200) == 0 || self->_letterboxCreativeColor != *((_DWORD *)v4 + 76))
      goto LABEL_185;
  }
  else if ((*((_WORD *)v4 + 246) & 0x200) != 0)
  {
    goto LABEL_185;
  }
  installAttribution = self->_installAttribution;
  if ((unint64_t)installAttribution | *((_QWORD *)v4 + 36)
    && !-[APPBInstallAttribution isEqual:](installAttribution, "isEqual:"))
  {
    goto LABEL_185;
  }
  specification = self->_specification;
  if ((unint64_t)specification | *((_QWORD *)v4 + 50))
  {
    if (!-[APPBAdSpecification isEqual:](specification, "isEqual:"))
      goto LABEL_185;
  }
  v42 = *((_WORD *)v4 + 246);
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    if ((v42 & 2) == 0 || self->_minimumIntervalBetweenPresentations != *((double *)v4 + 2))
      goto LABEL_185;
  }
  else if ((v42 & 2) != 0)
  {
    goto LABEL_185;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 246) & 0x1000) == 0)
      goto LABEL_185;
    if (self->_doesNotResetListeningTime)
    {
      if (!*((_BYTE *)v4 + 488))
        goto LABEL_185;
    }
    else if (*((_BYTE *)v4 + 488))
    {
      goto LABEL_185;
    }
  }
  else if ((*((_WORD *)v4 + 246) & 0x1000) != 0)
  {
    goto LABEL_185;
  }
  merchant = self->_merchant;
  if ((unint64_t)merchant | *((_QWORD *)v4 + 43) && !-[APPBMerchant isEqual:](merchant, "isEqual:"))
    goto LABEL_185;
  nativeMetadatas = self->_nativeMetadatas;
  if ((unint64_t)nativeMetadatas | *((_QWORD *)v4 + 45))
  {
    if (!-[NSMutableArray isEqual:](nativeMetadatas, "isEqual:"))
      goto LABEL_185;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 246) & 0x100) == 0 || self->_desiredPosition != *((_DWORD *)v4 + 50))
      goto LABEL_185;
  }
  else if ((*((_WORD *)v4 + 246) & 0x100) != 0)
  {
    goto LABEL_185;
  }
  actions = self->_actions;
  if ((unint64_t)actions | *((_QWORD *)v4 + 8) && !-[NSMutableArray isEqual:](actions, "isEqual:"))
    goto LABEL_185;
  iTunesMetadatas = self->_iTunesMetadatas;
  if ((unint64_t)iTunesMetadatas | *((_QWORD *)v4 + 33))
  {
    if (!-[NSMutableArray isEqual:](iTunesMetadatas, "isEqual:"))
      goto LABEL_185;
  }
  transparencyDetails = self->_transparencyDetails;
  if ((unint64_t)transparencyDetails | *((_QWORD *)v4 + 56))
  {
    if (!-[APPBTransparencyDetails isEqual:](transparencyDetails, "isEqual:"))
      goto LABEL_185;
  }
  nativeMediaCreativeMetadata = self->_nativeMediaCreativeMetadata;
  if ((unint64_t)nativeMediaCreativeMetadata | *((_QWORD *)v4 + 44))
  {
    if (!-[APPBNativeMediaCreativeMetadata isEqual:](nativeMediaCreativeMetadata, "isEqual:"))
      goto LABEL_185;
  }
  adTagContentString = self->_adTagContentString;
  if ((unint64_t)adTagContentString | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](adTagContentString, "isEqual:"))
      goto LABEL_185;
  }
  v50 = (__int16)self->_has;
  v51 = *((_WORD *)v4 + 246);
  if ((v50 & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 246) & 0x400) == 0 || self->_maximumPretapRequestCount != *((_DWORD *)v4 + 82))
      goto LABEL_185;
  }
  else if ((*((_WORD *)v4 + 246) & 0x400) != 0)
  {
    goto LABEL_185;
  }
  if ((v50 & 0x20) != 0)
  {
    if ((v51 & 0x20) == 0 || self->_adPrivacyMarkPosition != *((_DWORD *)v4 + 28))
      goto LABEL_185;
  }
  else if ((v51 & 0x20) != 0)
  {
    goto LABEL_185;
  }
  adDataResponseIdentifier = self->_adDataResponseIdentifier;
  if ((unint64_t)adDataResponseIdentifier | *((_QWORD *)v4 + 9))
  {
    if (-[NSString isEqual:](adDataResponseIdentifier, "isEqual:"))
    {
      v50 = (__int16)self->_has;
      goto LABEL_160;
    }
LABEL_185:
    v63 = 0;
    goto LABEL_186;
  }
LABEL_160:
  if ((v50 & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 246) & 0x800) == 0 || self->_unfilledReasonCode != *((_DWORD *)v4 + 114))
      goto LABEL_185;
  }
  else if ((*((_WORD *)v4 + 246) & 0x800) != 0)
  {
    goto LABEL_185;
  }
  unfilledReasonInfo = self->_unfilledReasonInfo;
  if ((unint64_t)unfilledReasonInfo | *((_QWORD *)v4 + 58)
    && !-[NSString isEqual:](unfilledReasonInfo, "isEqual:"))
  {
    goto LABEL_185;
  }
  adOriginalRequesterId = self->_adOriginalRequesterId;
  if ((unint64_t)adOriginalRequesterId | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](adOriginalRequesterId, "isEqual:"))
      goto LABEL_185;
  }
  expressionToEvaluate = self->_expressionToEvaluate;
  if ((unint64_t)expressionToEvaluate | *((_QWORD *)v4 + 27))
  {
    if (!-[NSString isEqual:](expressionToEvaluate, "isEqual:"))
      goto LABEL_185;
  }
  journeyStartRelayValues = self->_journeyStartRelayValues;
  if ((unint64_t)journeyStartRelayValues | *((_QWORD *)v4 + 37))
  {
    if (!-[NSMutableArray isEqual:](journeyStartRelayValues, "isEqual:"))
      goto LABEL_185;
  }
  adLayoutDatas = self->_adLayoutDatas;
  if ((unint64_t)adLayoutDatas | *((_QWORD *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](adLayoutDatas, "isEqual:"))
      goto LABEL_185;
  }
  adType = self->_adType;
  if ((unint64_t)adType | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](adType, "isEqual:"))
      goto LABEL_185;
  }
  adFormatType = self->_adFormatType;
  if ((unint64_t)adFormatType | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](adFormatType, "isEqual:"))
      goto LABEL_185;
  }
  adFrequencyCapData = self->_adFrequencyCapData;
  if ((unint64_t)adFrequencyCapData | *((_QWORD *)v4 + 11))
  {
    if (!-[APPBAdFrequencyCapData isEqual:](adFrequencyCapData, "isEqual:"))
      goto LABEL_185;
  }
  policyData = self->_policyData;
  if ((unint64_t)policyData | *((_QWORD *)v4 + 46))
  {
    if (!-[APPBPolicyData isEqual:](policyData, "isEqual:"))
      goto LABEL_185;
  }
  targetingDimensions = self->_targetingDimensions;
  if ((unint64_t)targetingDimensions | *((_QWORD *)v4 + 53))
    v63 = -[APPBTargetingDimensions isEqual:](targetingDimensions, "isEqual:");
  else
    v63 = 1;
LABEL_186:

  return v63;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  double expirationDate;
  double v6;
  long double v7;
  double v8;
  __int16 has;
  float bannerImpressionThreshold;
  float v11;
  float v12;
  float v13;
  unint64_t v14;
  unint64_t v15;
  float bannerNewContentCandidacyThreshold;
  float v17;
  float v18;
  float v19;
  unint64_t v20;
  double rewardTokensExpiration;
  double v22;
  long double v23;
  double v24;
  unint64_t v25;
  double skipThreshold;
  double v27;
  long double v28;
  double v29;
  __int16 v30;
  unint64_t v31;
  double minimumIntervalBetweenPresentations;
  double v33;
  long double v34;
  double v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  NSUInteger v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;
  NSUInteger v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  NSUInteger v64;
  NSUInteger v65;
  unint64_t v66;
  unint64_t v67;
  NSUInteger v68;
  NSUInteger v69;
  NSUInteger v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  NSUInteger v75;
  NSUInteger v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  NSUInteger v82;
  NSUInteger v83;
  NSUInteger v84;
  unint64_t v85;
  unint64_t v86;
  NSUInteger v87;
  unint64_t v88;
  NSUInteger v89;
  uint64_t v90;
  NSUInteger v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t impressionCount;
  NSUInteger v95;
  unint64_t v96;
  NSUInteger v97;
  NSUInteger v98;
  NSUInteger v99;

  v99 = -[NSString hash](self->_bannerURL, "hash");
  v98 = -[NSString hash](self->_bannerWebArchiveURL, "hash");
  v97 = -[NSString hash](self->_uniqueIdentifier, "hash");
  v96 = (unint64_t)-[NSData hash](self->_impressionIdentifierData, "hash");
  v3 = -[NSString hash](self->_humanReadableName, "hash");
  impressionCount = self->_impressionCount;
  v95 = v3;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    expirationDate = self->_expirationDate;
    v6 = -expirationDate;
    if (expirationDate >= 0.0)
      v6 = self->_expirationDate;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  v93 = v4;
  v92 = (unint64_t)-[NSMutableArray hash](self->_trackingURLs, "hash");
  v91 = -[NSString hash](self->_trackingURLSubstitutionParameter, "hash");
  if ((*(_WORD *)&self->_has & 0x4000) != 0)
    v90 = 2654435761 * self->_unbranded;
  else
    v90 = 0;
  v89 = -[NSString hash](self->_accessibilityDescription, "hash");
  v88 = (unint64_t)-[NSMutableArray hash](self->_confirmedClickPixelURLs, "hash");
  v87 = -[NSString hash](self->_bannerQueryString, "hash");
  v86 = (unint64_t)-[NSMutableArray hash](self->_videoAssets, "hash");
  v85 = -[APPBMediaFiles hash](self->_mediaFiles, "hash");
  v84 = -[NSString hash](self->_audioURL, "hash");
  v83 = -[NSString hash](self->_slateImageURL, "hash");
  v82 = -[NSString hash](self->_aTVTunerImageURL, "hash");
  has = (__int16)self->_has;
  if ((has & 0x2000) != 0)
  {
    v81 = 2654435761 * self->_downloadWebArchivesBeforeShowingBanner;
    if ((has & 0x40) != 0)
      goto LABEL_14;
LABEL_19:
    v14 = 0;
    goto LABEL_22;
  }
  v81 = 0;
  if ((has & 0x40) == 0)
    goto LABEL_19;
LABEL_14:
  bannerImpressionThreshold = self->_bannerImpressionThreshold;
  v11 = -bannerImpressionThreshold;
  if (bannerImpressionThreshold >= 0.0)
    v11 = self->_bannerImpressionThreshold;
  v12 = floorf(v11 + 0.5);
  v13 = (float)(v11 - v12) * 1.8447e19;
  v14 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0)
      v14 += (unint64_t)v13;
  }
  else
  {
    v14 -= (unint64_t)fabsf(v13);
  }
LABEL_22:
  v80 = v14;
  if ((has & 0x80) != 0)
  {
    bannerNewContentCandidacyThreshold = self->_bannerNewContentCandidacyThreshold;
    v17 = -bannerNewContentCandidacyThreshold;
    if (bannerNewContentCandidacyThreshold >= 0.0)
      v17 = self->_bannerNewContentCandidacyThreshold;
    v18 = floorf(v17 + 0.5);
    v19 = (float)(v17 - v18) * 1.8447e19;
    v15 = 2654435761u * (unint64_t)fmodf(v18, 1.8447e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0)
        v15 += (unint64_t)v19;
    }
    else
    {
      v15 -= (unint64_t)fabsf(v19);
    }
  }
  else
  {
    v15 = 0;
  }
  v79 = v15;
  v78 = (unint64_t)-[NSMutableArray hash](self->_screenSaverImageURLs, "hash");
  v77 = (unint64_t)-[NSMutableArray hash](self->_excludeTags, "hash");
  v76 = -[NSString hash](self->_iAdJSVersion, "hash");
  v75 = -[NSString hash](self->_iAdJSURL, "hash");
  v74 = (unint64_t)-[NSMutableArray hash](self->_rewardTokens, "hash");
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    rewardTokensExpiration = self->_rewardTokensExpiration;
    v22 = -rewardTokensExpiration;
    if (rewardTokensExpiration >= 0.0)
      v22 = self->_rewardTokensExpiration;
    v23 = floor(v22 + 0.5);
    v24 = (v22 - v23) * 1.84467441e19;
    v20 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0)
        v20 += (unint64_t)v24;
    }
    else
    {
      v20 -= (unint64_t)fabs(v24);
    }
  }
  else
  {
    v20 = 0;
  }
  v73 = v20;
  v72 = (unint64_t)-[NSMutableArray hash](self->_matchTagClauses, "hash");
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
    skipThreshold = self->_skipThreshold;
    v27 = -skipThreshold;
    if (skipThreshold >= 0.0)
      v27 = self->_skipThreshold;
    v28 = floor(v27 + 0.5);
    v29 = (v27 - v28) * 1.84467441e19;
    v25 = 2654435761u * (unint64_t)fmod(v28, 1.84467441e19);
    if (v29 >= 0.0)
    {
      if (v29 > 0.0)
        v25 += (unint64_t)v29;
    }
    else
    {
      v25 -= (unint64_t)fabs(v29);
    }
  }
  else
  {
    v25 = 0;
  }
  v71 = v25;
  v70 = -[NSString hash](self->_logoImageURL, "hash");
  v69 = -[NSString hash](self->_headlineForLCD, "hash");
  v68 = -[NSString hash](self->_descriptionForLCD, "hash");
  if ((*(_WORD *)&self->_has & 4) != 0)
    v67 = 2654435761u * self->_priority;
  else
    v67 = 0;
  v66 = (unint64_t)-[NSMutableArray hash](self->_geofences, "hash");
  v65 = -[NSString hash](self->_targetAppBundleID, "hash");
  v64 = -[NSString hash](self->_targetAppURLScheme, "hash");
  v63 = (unint64_t)-[NSMutableArray hash](self->_creativeSizes, "hash");
  if ((*(_WORD *)&self->_has & 0x200) != 0)
    v62 = 2654435761 * self->_letterboxCreativeColor;
  else
    v62 = 0;
  v61 = -[APPBInstallAttribution hash](self->_installAttribution, "hash");
  v60 = -[APPBAdSpecification hash](self->_specification, "hash");
  v30 = (__int16)self->_has;
  if ((v30 & 2) != 0)
  {
    minimumIntervalBetweenPresentations = self->_minimumIntervalBetweenPresentations;
    v33 = -minimumIntervalBetweenPresentations;
    if (minimumIntervalBetweenPresentations >= 0.0)
      v33 = self->_minimumIntervalBetweenPresentations;
    v34 = floor(v33 + 0.5);
    v35 = (v33 - v34) * 1.84467441e19;
    v31 = 2654435761u * (unint64_t)fmod(v34, 1.84467441e19);
    if (v35 >= 0.0)
    {
      if (v35 > 0.0)
        v31 += (unint64_t)v35;
    }
    else
    {
      v31 -= (unint64_t)fabs(v35);
    }
  }
  else
  {
    v31 = 0;
  }
  if ((v30 & 0x1000) != 0)
    v59 = 2654435761 * self->_doesNotResetListeningTime;
  else
    v59 = 0;
  v58 = -[APPBMerchant hash](self->_merchant, "hash");
  v57 = (unint64_t)-[NSMutableArray hash](self->_nativeMetadatas, "hash");
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    v56 = 2654435761 * self->_desiredPosition;
  else
    v56 = 0;
  v36 = (unint64_t)-[NSMutableArray hash](self->_actions, "hash");
  v37 = (unint64_t)-[NSMutableArray hash](self->_iTunesMetadatas, "hash");
  v38 = -[APPBTransparencyDetails hash](self->_transparencyDetails, "hash");
  v39 = -[APPBNativeMediaCreativeMetadata hash](self->_nativeMediaCreativeMetadata, "hash");
  v40 = -[NSString hash](self->_adTagContentString, "hash");
  v41 = (__int16)self->_has;
  if ((v41 & 0x400) != 0)
  {
    v42 = 2654435761 * self->_maximumPretapRequestCount;
    if ((v41 & 0x20) != 0)
      goto LABEL_68;
  }
  else
  {
    v42 = 0;
    if ((v41 & 0x20) != 0)
    {
LABEL_68:
      v43 = 2654435761 * self->_adPrivacyMarkPosition;
      goto LABEL_71;
    }
  }
  v43 = 0;
LABEL_71:
  v44 = -[NSString hash](self->_adDataResponseIdentifier, "hash");
  if ((*(_WORD *)&self->_has & 0x800) != 0)
    v45 = 2654435761 * self->_unfilledReasonCode;
  else
    v45 = 0;
  v46 = v38 ^ v39 ^ v40 ^ v42 ^ v43 ^ v44 ^ v45 ^ -[NSString hash](self->_unfilledReasonInfo, "hash");
  v47 = v46 ^ -[NSString hash](self->_adOriginalRequesterId, "hash");
  v48 = v47 ^ -[NSString hash](self->_expressionToEvaluate, "hash");
  v49 = v98 ^ v99 ^ v97 ^ v96 ^ v95 ^ v93 ^ (2654435761 * impressionCount) ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v31 ^ v59 ^ v58 ^ v57 ^ v56 ^ v36 ^ v37 ^ v48 ^ (unint64_t)-[NSMutableArray hash](self->_journeyStartRelayValues, "hash");
  v50 = (unint64_t)-[NSMutableArray hash](self->_adLayoutDatas, "hash");
  v51 = v50 ^ -[NSString hash](self->_adType, "hash");
  v52 = v51 ^ -[NSString hash](self->_adFormatType, "hash");
  v53 = v52 ^ -[APPBAdFrequencyCapData hash](self->_adFrequencyCapData, "hash");
  v54 = v53 ^ -[APPBPolicyData hash](self->_policyData, "hash");
  return v49 ^ v54 ^ -[APPBTargetingDimensions hash](self->_targetingDimensions, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *k;
  APPBMediaFiles *mediaFiles;
  uint64_t v21;
  __int16 v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *m;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *n;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  void *ii;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  void *jj;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  void *kk;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  void *mm;
  APPBInstallAttribution *installAttribution;
  uint64_t v54;
  APPBAdSpecification *specification;
  uint64_t v56;
  __int16 v57;
  APPBMerchant *merchant;
  uint64_t v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  void *nn;
  id v65;
  id v66;
  id v67;
  uint64_t v68;
  void *i1;
  id v70;
  id v71;
  id v72;
  uint64_t v73;
  void *i2;
  APPBTransparencyDetails *transparencyDetails;
  uint64_t v76;
  APPBNativeMediaCreativeMetadata *nativeMediaCreativeMetadata;
  uint64_t v78;
  __int16 v79;
  id v80;
  id v81;
  id v82;
  uint64_t v83;
  void *i3;
  id v85;
  id v86;
  id v87;
  uint64_t v88;
  void *i4;
  APPBAdFrequencyCapData *adFrequencyCapData;
  uint64_t v91;
  APPBPolicyData *policyData;
  uint64_t v93;
  APPBTargetingDimensions *targetingDimensions;
  uint64_t v95;
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
  __int128 v112;
  __int128 v113;
  __int128 v114;
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
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE v154[128];
  _BYTE v155[128];
  _BYTE v156[128];
  _BYTE v157[128];
  _BYTE v158[128];
  _BYTE v159[128];
  _BYTE v160[128];
  _BYTE v161[128];
  _BYTE v162[128];
  _BYTE v163[128];
  _BYTE v164[128];
  _BYTE v165[128];

  v4 = a3;
  if (*((_QWORD *)v4 + 20))
    -[APPBAdData setBannerURL:](self, "setBannerURL:");
  if (*((_QWORD *)v4 + 21))
    -[APPBAdData setBannerWebArchiveURL:](self, "setBannerWebArchiveURL:");
  if (*((_QWORD *)v4 + 59))
    -[APPBAdData setUniqueIdentifier:](self, "setUniqueIdentifier:");
  if (*((_QWORD *)v4 + 35))
    -[APPBAdData setImpressionIdentifierData:](self, "setImpressionIdentifierData:");
  if (*((_QWORD *)v4 + 30))
    -[APPBAdData setHumanReadableName:](self, "setHumanReadableName:");
  self->_impressionCount = *((_DWORD *)v4 + 68);
  if ((*((_BYTE *)v4 + 492) & 1) != 0)
  {
    self->_expirationDate = *((double *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
  v150 = 0u;
  v151 = 0u;
  v148 = 0u;
  v149 = 0u;
  v5 = *((id *)v4 + 55);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v148, v165, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v149;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v149 != v8)
          objc_enumerationMutation(v5);
        -[APPBAdData addTrackingURL:](self, "addTrackingURL:", *(_QWORD *)(*((_QWORD *)&v148 + 1) + 8 * (_QWORD)i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v148, v165, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 54))
    -[APPBAdData setTrackingURLSubstitutionParameter:](self, "setTrackingURLSubstitutionParameter:");
  if ((*((_WORD *)v4 + 246) & 0x4000) != 0)
  {
    self->_unbranded = *((_BYTE *)v4 + 490);
    *(_WORD *)&self->_has |= 0x4000u;
  }
  if (*((_QWORD *)v4 + 7))
    -[APPBAdData setAccessibilityDescription:](self, "setAccessibilityDescription:");
  v146 = 0u;
  v147 = 0u;
  v144 = 0u;
  v145 = 0u;
  v10 = *((id *)v4 + 22);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v144, v164, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v145;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(_QWORD *)v145 != v13)
          objc_enumerationMutation(v10);
        -[APPBAdData addConfirmedClickPixelURLs:](self, "addConfirmedClickPixelURLs:", *(_QWORD *)(*((_QWORD *)&v144 + 1) + 8 * (_QWORD)j));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v144, v164, 16);
    }
    while (v12);
  }

  if (*((_QWORD *)v4 + 19))
    -[APPBAdData setBannerQueryString:](self, "setBannerQueryString:");
  v142 = 0u;
  v143 = 0u;
  v140 = 0u;
  v141 = 0u;
  v15 = *((id *)v4 + 60);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v140, v163, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v141;
    do
    {
      for (k = 0; k != v17; k = (char *)k + 1)
      {
        if (*(_QWORD *)v141 != v18)
          objc_enumerationMutation(v15);
        -[APPBAdData addVideoAsset:](self, "addVideoAsset:", *(_QWORD *)(*((_QWORD *)&v140 + 1) + 8 * (_QWORD)k));
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v140, v163, 16);
    }
    while (v17);
  }

  mediaFiles = self->_mediaFiles;
  v21 = *((_QWORD *)v4 + 42);
  if (mediaFiles)
  {
    if (v21)
      -[APPBMediaFiles mergeFrom:](mediaFiles, "mergeFrom:");
  }
  else if (v21)
  {
    -[APPBAdData setMediaFiles:](self, "setMediaFiles:");
  }
  if (*((_QWORD *)v4 + 17))
    -[APPBAdData setAudioURL:](self, "setAudioURL:");
  if (*((_QWORD *)v4 + 49))
    -[APPBAdData setSlateImageURL:](self, "setSlateImageURL:");
  if (*((_QWORD *)v4 + 6))
    -[APPBAdData setATVTunerImageURL:](self, "setATVTunerImageURL:");
  v22 = *((_WORD *)v4 + 246);
  if ((v22 & 0x2000) != 0)
  {
    self->_downloadWebArchivesBeforeShowingBanner = *((_BYTE *)v4 + 489);
    *(_WORD *)&self->_has |= 0x2000u;
    v22 = *((_WORD *)v4 + 246);
    if ((v22 & 0x40) == 0)
    {
LABEL_55:
      if ((v22 & 0x80) == 0)
        goto LABEL_57;
      goto LABEL_56;
    }
  }
  else if ((v22 & 0x40) == 0)
  {
    goto LABEL_55;
  }
  self->_bannerImpressionThreshold = *((float *)v4 + 36);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)v4 + 246) & 0x80) != 0)
  {
LABEL_56:
    self->_bannerNewContentCandidacyThreshold = *((float *)v4 + 37);
    *(_WORD *)&self->_has |= 0x80u;
  }
LABEL_57:
  v138 = 0u;
  v139 = 0u;
  v136 = 0u;
  v137 = 0u;
  v23 = *((id *)v4 + 48);
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v136, v162, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v137;
    do
    {
      for (m = 0; m != v25; m = (char *)m + 1)
      {
        if (*(_QWORD *)v137 != v26)
          objc_enumerationMutation(v23);
        -[APPBAdData addScreenSaverImageURL:](self, "addScreenSaverImageURL:", *(_QWORD *)(*((_QWORD *)&v136 + 1) + 8 * (_QWORD)m));
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v136, v162, 16);
    }
    while (v25);
  }

  v134 = 0u;
  v135 = 0u;
  v132 = 0u;
  v133 = 0u;
  v28 = *((id *)v4 + 26);
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v132, v161, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v133;
    do
    {
      for (n = 0; n != v30; n = (char *)n + 1)
      {
        if (*(_QWORD *)v133 != v31)
          objc_enumerationMutation(v28);
        -[APPBAdData addExcludeTag:](self, "addExcludeTag:", *(_QWORD *)(*((_QWORD *)&v132 + 1) + 8 * (_QWORD)n));
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v132, v161, 16);
    }
    while (v30);
  }

  if (*((_QWORD *)v4 + 32))
    -[APPBAdData setIAdJSVersion:](self, "setIAdJSVersion:");
  if (*((_QWORD *)v4 + 31))
    -[APPBAdData setIAdJSURL:](self, "setIAdJSURL:");
  v130 = 0u;
  v131 = 0u;
  v128 = 0u;
  v129 = 0u;
  v33 = *((id *)v4 + 47);
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v128, v160, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v129;
    do
    {
      for (ii = 0; ii != v35; ii = (char *)ii + 1)
      {
        if (*(_QWORD *)v129 != v36)
          objc_enumerationMutation(v33);
        -[APPBAdData addRewardTokens:](self, "addRewardTokens:", *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * (_QWORD)ii));
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v128, v160, 16);
    }
    while (v35);
  }

  if ((*((_WORD *)v4 + 246) & 8) != 0)
  {
    self->_rewardTokensExpiration = *((double *)v4 + 4);
    *(_WORD *)&self->_has |= 8u;
  }
  v126 = 0u;
  v127 = 0u;
  v124 = 0u;
  v125 = 0u;
  v38 = *((id *)v4 + 40);
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v124, v159, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v125;
    do
    {
      for (jj = 0; jj != v40; jj = (char *)jj + 1)
      {
        if (*(_QWORD *)v125 != v41)
          objc_enumerationMutation(v38);
        -[APPBAdData addMatchTagClause:](self, "addMatchTagClause:", *(_QWORD *)(*((_QWORD *)&v124 + 1) + 8 * (_QWORD)jj));
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v124, v159, 16);
    }
    while (v40);
  }

  if ((*((_WORD *)v4 + 246) & 0x10) != 0)
  {
    self->_skipThreshold = *((double *)v4 + 5);
    *(_WORD *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v4 + 39))
    -[APPBAdData setLogoImageURL:](self, "setLogoImageURL:");
  if (*((_QWORD *)v4 + 29))
    -[APPBAdData setHeadlineForLCD:](self, "setHeadlineForLCD:");
  if (*((_QWORD *)v4 + 24))
    -[APPBAdData setDescriptionForLCD:](self, "setDescriptionForLCD:");
  if ((*((_WORD *)v4 + 246) & 4) != 0)
  {
    self->_priority = *((_QWORD *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  v43 = *((id *)v4 + 28);
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v120, v158, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v121;
    do
    {
      for (kk = 0; kk != v45; kk = (char *)kk + 1)
      {
        if (*(_QWORD *)v121 != v46)
          objc_enumerationMutation(v43);
        -[APPBAdData addGeofences:](self, "addGeofences:", *(_QWORD *)(*((_QWORD *)&v120 + 1) + 8 * (_QWORD)kk));
      }
      v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v120, v158, 16);
    }
    while (v45);
  }

  if (*((_QWORD *)v4 + 51))
    -[APPBAdData setTargetAppBundleID:](self, "setTargetAppBundleID:");
  if (*((_QWORD *)v4 + 52))
    -[APPBAdData setTargetAppURLScheme:](self, "setTargetAppURLScheme:");
  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  v48 = *((id *)v4 + 23);
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v116, v157, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v117;
    do
    {
      for (mm = 0; mm != v50; mm = (char *)mm + 1)
      {
        if (*(_QWORD *)v117 != v51)
          objc_enumerationMutation(v48);
        -[APPBAdData addCreativeSizes:](self, "addCreativeSizes:", *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * (_QWORD)mm));
      }
      v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v116, v157, 16);
    }
    while (v50);
  }

  if ((*((_WORD *)v4 + 246) & 0x200) != 0)
  {
    self->_letterboxCreativeColor = *((_DWORD *)v4 + 76);
    *(_WORD *)&self->_has |= 0x200u;
  }
  installAttribution = self->_installAttribution;
  v54 = *((_QWORD *)v4 + 36);
  if (installAttribution)
  {
    if (v54)
      -[APPBInstallAttribution mergeFrom:](installAttribution, "mergeFrom:");
  }
  else if (v54)
  {
    -[APPBAdData setInstallAttribution:](self, "setInstallAttribution:");
  }
  specification = self->_specification;
  v56 = *((_QWORD *)v4 + 50);
  if (specification)
  {
    if (v56)
      -[APPBAdSpecification mergeFrom:](specification, "mergeFrom:");
  }
  else if (v56)
  {
    -[APPBAdData setSpecification:](self, "setSpecification:");
  }
  v57 = *((_WORD *)v4 + 246);
  if ((v57 & 2) != 0)
  {
    self->_minimumIntervalBetweenPresentations = *((double *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
    v57 = *((_WORD *)v4 + 246);
  }
  if ((v57 & 0x1000) != 0)
  {
    self->_doesNotResetListeningTime = *((_BYTE *)v4 + 488);
    *(_WORD *)&self->_has |= 0x1000u;
  }
  merchant = self->_merchant;
  v59 = *((_QWORD *)v4 + 43);
  if (merchant)
  {
    if (v59)
      -[APPBMerchant mergeFrom:](merchant, "mergeFrom:");
  }
  else if (v59)
  {
    -[APPBAdData setMerchant:](self, "setMerchant:");
  }
  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  v60 = *((id *)v4 + 45);
  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v112, v156, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v113;
    do
    {
      for (nn = 0; nn != v62; nn = (char *)nn + 1)
      {
        if (*(_QWORD *)v113 != v63)
          objc_enumerationMutation(v60);
        -[APPBAdData addNativeMetadata:](self, "addNativeMetadata:", *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * (_QWORD)nn));
      }
      v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v112, v156, 16);
    }
    while (v62);
  }

  if ((*((_WORD *)v4 + 246) & 0x100) != 0)
  {
    self->_desiredPosition = *((_DWORD *)v4 + 50);
    *(_WORD *)&self->_has |= 0x100u;
  }
  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  v65 = *((id *)v4 + 8);
  v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v108, v155, 16);
  if (v66)
  {
    v67 = v66;
    v68 = *(_QWORD *)v109;
    do
    {
      for (i1 = 0; i1 != v67; i1 = (char *)i1 + 1)
      {
        if (*(_QWORD *)v109 != v68)
          objc_enumerationMutation(v65);
        -[APPBAdData addActions:](self, "addActions:", *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * (_QWORD)i1));
      }
      v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v108, v155, 16);
    }
    while (v67);
  }

  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v70 = *((id *)v4 + 33);
  v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v104, v154, 16);
  if (v71)
  {
    v72 = v71;
    v73 = *(_QWORD *)v105;
    do
    {
      for (i2 = 0; i2 != v72; i2 = (char *)i2 + 1)
      {
        if (*(_QWORD *)v105 != v73)
          objc_enumerationMutation(v70);
        -[APPBAdData addITunesMetadata:](self, "addITunesMetadata:", *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * (_QWORD)i2));
      }
      v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v104, v154, 16);
    }
    while (v72);
  }

  transparencyDetails = self->_transparencyDetails;
  v76 = *((_QWORD *)v4 + 56);
  if (transparencyDetails)
  {
    if (v76)
      -[APPBTransparencyDetails mergeFrom:](transparencyDetails, "mergeFrom:");
  }
  else if (v76)
  {
    -[APPBAdData setTransparencyDetails:](self, "setTransparencyDetails:");
  }
  nativeMediaCreativeMetadata = self->_nativeMediaCreativeMetadata;
  v78 = *((_QWORD *)v4 + 44);
  if (nativeMediaCreativeMetadata)
  {
    if (v78)
      -[APPBNativeMediaCreativeMetadata mergeFrom:](nativeMediaCreativeMetadata, "mergeFrom:");
  }
  else if (v78)
  {
    -[APPBAdData setNativeMediaCreativeMetadata:](self, "setNativeMediaCreativeMetadata:");
  }
  if (*((_QWORD *)v4 + 15))
    -[APPBAdData setAdTagContentString:](self, "setAdTagContentString:");
  v79 = *((_WORD *)v4 + 246);
  if ((v79 & 0x400) != 0)
  {
    self->_maximumPretapRequestCount = *((_DWORD *)v4 + 82);
    *(_WORD *)&self->_has |= 0x400u;
    v79 = *((_WORD *)v4 + 246);
  }
  if ((v79 & 0x20) != 0)
  {
    self->_adPrivacyMarkPosition = *((_DWORD *)v4 + 28);
    *(_WORD *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)v4 + 9))
    -[APPBAdData setAdDataResponseIdentifier:](self, "setAdDataResponseIdentifier:");
  if ((*((_WORD *)v4 + 246) & 0x800) != 0)
  {
    self->_unfilledReasonCode = *((_DWORD *)v4 + 114);
    *(_WORD *)&self->_has |= 0x800u;
  }
  if (*((_QWORD *)v4 + 58))
    -[APPBAdData setUnfilledReasonInfo:](self, "setUnfilledReasonInfo:");
  if (*((_QWORD *)v4 + 13))
    -[APPBAdData setAdOriginalRequesterId:](self, "setAdOriginalRequesterId:");
  if (*((_QWORD *)v4 + 27))
    -[APPBAdData setExpressionToEvaluate:](self, "setExpressionToEvaluate:");
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v80 = *((id *)v4 + 37);
  v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v100, v153, 16);
  if (v81)
  {
    v82 = v81;
    v83 = *(_QWORD *)v101;
    do
    {
      for (i3 = 0; i3 != v82; i3 = (char *)i3 + 1)
      {
        if (*(_QWORD *)v101 != v83)
          objc_enumerationMutation(v80);
        -[APPBAdData addJourneyStartRelayValues:](self, "addJourneyStartRelayValues:", *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * (_QWORD)i3));
      }
      v82 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v100, v153, 16);
    }
    while (v82);
  }

  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v85 = *((id *)v4 + 12);
  v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v96, v152, 16);
  if (v86)
  {
    v87 = v86;
    v88 = *(_QWORD *)v97;
    do
    {
      for (i4 = 0; i4 != v87; i4 = (char *)i4 + 1)
      {
        if (*(_QWORD *)v97 != v88)
          objc_enumerationMutation(v85);
        -[APPBAdData addAdLayoutData:](self, "addAdLayoutData:", *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * (_QWORD)i4), (_QWORD)v96);
      }
      v87 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v96, v152, 16);
    }
    while (v87);
  }

  if (*((_QWORD *)v4 + 16))
    -[APPBAdData setAdType:](self, "setAdType:");
  if (*((_QWORD *)v4 + 10))
    -[APPBAdData setAdFormatType:](self, "setAdFormatType:");
  adFrequencyCapData = self->_adFrequencyCapData;
  v91 = *((_QWORD *)v4 + 11);
  if (adFrequencyCapData)
  {
    if (v91)
      -[APPBAdFrequencyCapData mergeFrom:](adFrequencyCapData, "mergeFrom:");
  }
  else if (v91)
  {
    -[APPBAdData setAdFrequencyCapData:](self, "setAdFrequencyCapData:");
  }
  policyData = self->_policyData;
  v93 = *((_QWORD *)v4 + 46);
  if (policyData)
  {
    if (v93)
      -[APPBPolicyData mergeFrom:](policyData, "mergeFrom:");
  }
  else if (v93)
  {
    -[APPBAdData setPolicyData:](self, "setPolicyData:");
  }
  targetingDimensions = self->_targetingDimensions;
  v95 = *((_QWORD *)v4 + 53);
  if (targetingDimensions)
  {
    if (v95)
      -[APPBTargetingDimensions mergeFrom:](targetingDimensions, "mergeFrom:");
  }
  else if (v95)
  {
    -[APPBAdData setTargetingDimensions:](self, "setTargetingDimensions:");
  }

}

- (NSString)bannerURL
{
  return self->_bannerURL;
}

- (void)setBannerURL:(id)a3
{
  objc_storeStrong((id *)&self->_bannerURL, a3);
}

- (NSString)bannerWebArchiveURL
{
  return self->_bannerWebArchiveURL;
}

- (void)setBannerWebArchiveURL:(id)a3
{
  objc_storeStrong((id *)&self->_bannerWebArchiveURL, a3);
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueIdentifier, a3);
}

- (NSData)impressionIdentifierData
{
  return self->_impressionIdentifierData;
}

- (void)setImpressionIdentifierData:(id)a3
{
  objc_storeStrong((id *)&self->_impressionIdentifierData, a3);
}

- (NSString)humanReadableName
{
  return self->_humanReadableName;
}

- (void)setHumanReadableName:(id)a3
{
  objc_storeStrong((id *)&self->_humanReadableName, a3);
}

- (void)setImpressionCount:(int)a3
{
  self->_impressionCount = a3;
}

- (double)expirationDate
{
  return self->_expirationDate;
}

- (NSMutableArray)trackingURLs
{
  return self->_trackingURLs;
}

- (void)setTrackingURLs:(id)a3
{
  objc_storeStrong((id *)&self->_trackingURLs, a3);
}

- (NSString)trackingURLSubstitutionParameter
{
  return self->_trackingURLSubstitutionParameter;
}

- (void)setTrackingURLSubstitutionParameter:(id)a3
{
  objc_storeStrong((id *)&self->_trackingURLSubstitutionParameter, a3);
}

- (BOOL)unbranded
{
  return self->_unbranded;
}

- (NSString)accessibilityDescription
{
  return self->_accessibilityDescription;
}

- (void)setAccessibilityDescription:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityDescription, a3);
}

- (NSMutableArray)confirmedClickPixelURLs
{
  return self->_confirmedClickPixelURLs;
}

- (void)setConfirmedClickPixelURLs:(id)a3
{
  objc_storeStrong((id *)&self->_confirmedClickPixelURLs, a3);
}

- (NSString)bannerQueryString
{
  return self->_bannerQueryString;
}

- (void)setBannerQueryString:(id)a3
{
  objc_storeStrong((id *)&self->_bannerQueryString, a3);
}

- (NSMutableArray)videoAssets
{
  return self->_videoAssets;
}

- (void)setVideoAssets:(id)a3
{
  objc_storeStrong((id *)&self->_videoAssets, a3);
}

- (void)setMediaFiles:(id)a3
{
  objc_storeStrong((id *)&self->_mediaFiles, a3);
}

- (NSString)audioURL
{
  return self->_audioURL;
}

- (void)setAudioURL:(id)a3
{
  objc_storeStrong((id *)&self->_audioURL, a3);
}

- (NSString)slateImageURL
{
  return self->_slateImageURL;
}

- (void)setSlateImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_slateImageURL, a3);
}

- (NSString)aTVTunerImageURL
{
  return self->_aTVTunerImageURL;
}

- (void)setATVTunerImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_aTVTunerImageURL, a3);
}

- (BOOL)downloadWebArchivesBeforeShowingBanner
{
  return self->_downloadWebArchivesBeforeShowingBanner;
}

- (float)bannerImpressionThreshold
{
  return self->_bannerImpressionThreshold;
}

- (float)bannerNewContentCandidacyThreshold
{
  return self->_bannerNewContentCandidacyThreshold;
}

- (NSMutableArray)screenSaverImageURLs
{
  return self->_screenSaverImageURLs;
}

- (void)setScreenSaverImageURLs:(id)a3
{
  objc_storeStrong((id *)&self->_screenSaverImageURLs, a3);
}

- (NSMutableArray)excludeTags
{
  return self->_excludeTags;
}

- (void)setExcludeTags:(id)a3
{
  objc_storeStrong((id *)&self->_excludeTags, a3);
}

- (NSString)iAdJSVersion
{
  return self->_iAdJSVersion;
}

- (void)setIAdJSVersion:(id)a3
{
  objc_storeStrong((id *)&self->_iAdJSVersion, a3);
}

- (NSString)iAdJSURL
{
  return self->_iAdJSURL;
}

- (void)setIAdJSURL:(id)a3
{
  objc_storeStrong((id *)&self->_iAdJSURL, a3);
}

- (NSMutableArray)rewardTokens
{
  return self->_rewardTokens;
}

- (void)setRewardTokens:(id)a3
{
  objc_storeStrong((id *)&self->_rewardTokens, a3);
}

- (double)rewardTokensExpiration
{
  return self->_rewardTokensExpiration;
}

- (NSMutableArray)matchTagClauses
{
  return self->_matchTagClauses;
}

- (void)setMatchTagClauses:(id)a3
{
  objc_storeStrong((id *)&self->_matchTagClauses, a3);
}

- (double)skipThreshold
{
  return self->_skipThreshold;
}

- (NSString)logoImageURL
{
  return self->_logoImageURL;
}

- (void)setLogoImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_logoImageURL, a3);
}

- (NSString)headlineForLCD
{
  return self->_headlineForLCD;
}

- (void)setHeadlineForLCD:(id)a3
{
  objc_storeStrong((id *)&self->_headlineForLCD, a3);
}

- (NSString)descriptionForLCD
{
  return self->_descriptionForLCD;
}

- (void)setDescriptionForLCD:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionForLCD, a3);
}

- (unint64_t)priority
{
  return self->_priority;
}

- (NSMutableArray)geofences
{
  return self->_geofences;
}

- (void)setGeofences:(id)a3
{
  objc_storeStrong((id *)&self->_geofences, a3);
}

- (NSString)targetAppBundleID
{
  return self->_targetAppBundleID;
}

- (void)setTargetAppBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_targetAppBundleID, a3);
}

- (NSString)targetAppURLScheme
{
  return self->_targetAppURLScheme;
}

- (void)setTargetAppURLScheme:(id)a3
{
  objc_storeStrong((id *)&self->_targetAppURLScheme, a3);
}

- (void)setCreativeSizes:(id)a3
{
  objc_storeStrong((id *)&self->_creativeSizes, a3);
}

- (unsigned)letterboxCreativeColor
{
  return self->_letterboxCreativeColor;
}

- (APPBInstallAttribution)installAttribution
{
  return self->_installAttribution;
}

- (void)setInstallAttribution:(id)a3
{
  objc_storeStrong((id *)&self->_installAttribution, a3);
}

- (APPBAdSpecification)specification
{
  return self->_specification;
}

- (void)setSpecification:(id)a3
{
  objc_storeStrong((id *)&self->_specification, a3);
}

- (double)minimumIntervalBetweenPresentations
{
  return self->_minimumIntervalBetweenPresentations;
}

- (APPBMerchant)merchant
{
  return self->_merchant;
}

- (void)setMerchant:(id)a3
{
  objc_storeStrong((id *)&self->_merchant, a3);
}

- (void)setNativeMetadatas:(id)a3
{
  objc_storeStrong((id *)&self->_nativeMetadatas, a3);
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (NSMutableArray)iTunesMetadatas
{
  return self->_iTunesMetadatas;
}

- (void)setITunesMetadatas:(id)a3
{
  objc_storeStrong((id *)&self->_iTunesMetadatas, a3);
}

- (APPBTransparencyDetails)transparencyDetails
{
  return self->_transparencyDetails;
}

- (void)setTransparencyDetails:(id)a3
{
  objc_storeStrong((id *)&self->_transparencyDetails, a3);
}

- (APPBNativeMediaCreativeMetadata)nativeMediaCreativeMetadata
{
  return self->_nativeMediaCreativeMetadata;
}

- (void)setNativeMediaCreativeMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_nativeMediaCreativeMetadata, a3);
}

- (NSString)adTagContentString
{
  return self->_adTagContentString;
}

- (void)setAdTagContentString:(id)a3
{
  objc_storeStrong((id *)&self->_adTagContentString, a3);
}

- (int)maximumPretapRequestCount
{
  return self->_maximumPretapRequestCount;
}

- (void)setAdDataResponseIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_adDataResponseIdentifier, a3);
}

- (void)setUnfilledReasonInfo:(id)a3
{
  objc_storeStrong((id *)&self->_unfilledReasonInfo, a3);
}

- (void)setAdOriginalRequesterId:(id)a3
{
  objc_storeStrong((id *)&self->_adOriginalRequesterId, a3);
}

- (NSString)expressionToEvaluate
{
  return self->_expressionToEvaluate;
}

- (void)setExpressionToEvaluate:(id)a3
{
  objc_storeStrong((id *)&self->_expressionToEvaluate, a3);
}

- (void)setJourneyStartRelayValues:(id)a3
{
  objc_storeStrong((id *)&self->_journeyStartRelayValues, a3);
}

- (NSMutableArray)adLayoutDatas
{
  return self->_adLayoutDatas;
}

- (void)setAdLayoutDatas:(id)a3
{
  objc_storeStrong((id *)&self->_adLayoutDatas, a3);
}

- (NSString)adType
{
  return self->_adType;
}

- (void)setAdType:(id)a3
{
  objc_storeStrong((id *)&self->_adType, a3);
}

- (NSString)adFormatType
{
  return self->_adFormatType;
}

- (void)setAdFormatType:(id)a3
{
  objc_storeStrong((id *)&self->_adFormatType, a3);
}

- (APPBAdFrequencyCapData)adFrequencyCapData
{
  return self->_adFrequencyCapData;
}

- (void)setAdFrequencyCapData:(id)a3
{
  objc_storeStrong((id *)&self->_adFrequencyCapData, a3);
}

- (APPBPolicyData)policyData
{
  return self->_policyData;
}

- (void)setPolicyData:(id)a3
{
  objc_storeStrong((id *)&self->_policyData, a3);
}

- (APPBTargetingDimensions)targetingDimensions
{
  return self->_targetingDimensions;
}

- (void)setTargetingDimensions:(id)a3
{
  objc_storeStrong((id *)&self->_targetingDimensions, a3);
}

@end
