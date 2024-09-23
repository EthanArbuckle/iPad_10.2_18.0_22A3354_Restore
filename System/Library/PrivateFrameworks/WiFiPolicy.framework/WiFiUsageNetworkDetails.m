@implementation WiFiUsageNetworkDetails

- (NSString)disable6eMode
{
  return self->_disable6eMode;
}

- (WiFiUsageBssDetails)connectedBss
{
  return self->_connectedBss;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateMacType, 0);
  objc_storeStrong((id *)&self->_lastJoinDate, 0);
  objc_storeStrong((id *)&self->_downloadSpeedResults, 0);
  objc_storeStrong((id *)&self->_connectedBss, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
  objc_storeStrong((id *)&self->_bssEnvironment, 0);
  objc_storeStrong((id *)&self->_privateRelayBlockedReason, 0);
}

- (WiFiUsageNetworkDetails)initWithNetworkName:(id)a3
{
  id v3;
  WiFiUsageNetworkDetails *v4;
  uint64_t v5;
  NSString *networkName;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WiFiUsageNetworkDetails;
  v3 = a3;
  v4 = -[WiFiUsageNetworkDetails init](&v8, sel_init);
  v5 = objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  networkName = v4->_networkName;
  v4->_networkName = (NSString *)v5;

  return v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NetworkName:%@ BSSDetails:%@"), self->_networkName, self->_connectedBss);
}

- (id)redactedDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[WiFiUsageBssDetails redactedDescription](self->_connectedBss, "redactedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("NetworkName:REDACTED BSSDetails:%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc((Class)objc_opt_class());
  -[WiFiUsageNetworkDetails networkName](self, "networkName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithNetworkName:", v5);

  objc_msgSend(v6, "setIsKnown:", self->_isKnown);
  objc_msgSend(v6, "setIsOpen:", self->_isOpen);
  objc_msgSend(v6, "setIsOpen:", self->_isOpen);
  objc_msgSend(v6, "setCaptiveStatus:", self->_captiveStatus);
  objc_msgSend(v6, "setIsPublic:", self->_isPublic);
  objc_msgSend(v6, "setIsLowQuality:", self->_isLowQuality);
  objc_msgSend(v6, "setIsHome:", self->_isHome);
  objc_msgSend(v6, "setIsWork:", self->_isWork);
  objc_msgSend(v6, "setIsInternal:", self->_isInternal);
  objc_msgSend(v6, "setIsManaged:", self->_isManaged);
  objc_msgSend(v6, "setIsCarrierBased:", self->_isCarrierBased);
  objc_msgSend(v6, "setIsCarPlay:", self->_isCarPlay);
  objc_msgSend(v6, "setIsAppBased:", self->_isAppBased);
  objc_msgSend(v6, "setIsWalletBased:", self->_isWalletBased);
  objc_msgSend(v6, "setIsPersonalHotspot:", self->_isPersonalHotspot);
  objc_msgSend(v6, "setIsMoving:", self->_isMoving);
  objc_msgSend(v6, "setIsMesh:", self->_isMesh);
  objc_msgSend(v6, "setIsWidelyDeployed:", self->_isWidelyDeployed);
  objc_msgSend(v6, "setIsAutoJoined:", self->_isAutoJoined);
  objc_msgSend(v6, "setIsAdhoc:", self->_isAdhoc);
  objc_msgSend(v6, "setIsHidden:", self->_isHidden);
  objc_msgSend(v6, "setIsPasspoint:", self->_isPasspoint);
  objc_msgSend(v6, "setIsMetered:", self->_isMetered);
  objc_msgSend(v6, "setIsBlueAtlas:", self->_isBlueAtlas);
  objc_msgSend(v6, "setHasWapi:", self->_hasWapi);
  objc_msgSend(v6, "setHasWeakSecurity:", self->_hasWeakSecurity);
  objc_msgSend(v6, "setHasWpa3:", self->_hasWpa3);
  objc_msgSend(v6, "setHasWep:", self->_hasWep);
  objc_msgSend(v6, "setHasEnterpriseSecurity:", self->_hasEnterpriseSecurity);
  objc_msgSend(v6, "setHasLegacyEnterpriseSecurity:", self->_hasLegacyEnterpriseSecurity);
  objc_msgSend(v6, "setHasNoMap:", self->_hasNoMap);
  objc_msgSend(v6, "setHasAmbiguousSsid:", self->_hasAmbiguousSsid);
  objc_msgSend(v6, "setHasCustomNetworkSettings:", self->_hasCustomNetworkSettings);
  objc_msgSend(v6, "setRequiresUsername:", self->_requiresUsername);
  objc_msgSend(v6, "setRequiresPassword:", self->_requiresPassword);
  objc_msgSend(v6, "setRequiresIdentity:", self->_requiresIdentity);
  objc_msgSend(v6, "setRequiresOtp:", self->_requiresOtp);
  objc_msgSend(v6, "setCanExposeImsi:", self->_canExposeImsi);
  objc_msgSend(v6, "setAddedFromUI:", self->_addedFromUI);
  objc_msgSend(v6, "setAddedFromApp:", self->_addedFromApp);
  objc_msgSend(v6, "setAddedViaSync:", self->_addedViaSync);
  objc_msgSend(v6, "setAddedViaATJ:", self->_addedViaATJ);
  objc_msgSend(v6, "setAddedViaRecommendation:", self->_addedViaRecommendation);
  objc_msgSend(v6, "setAddedViaSharing:", self->_addedViaSharing);
  objc_msgSend(v6, "setUsageRank:", self->_usageRank);
  objc_msgSend(v6, "setAutoJoinDisabled:", self->_autoJoinDisabled);
  objc_msgSend(v6, "setAutoLoginDisabled:", self->_autoLoginDisabled);
  objc_msgSend(v6, "setLowDataModeEnabled:", self->_lowDataModeEnabled);
  objc_msgSend(v6, "setControlCenterDisabled:", self->_controlCenterDisabled);
  objc_msgSend(v6, "setPrivateRelayEnabled:", self->_privateRelayEnabled);
  objc_msgSend(v6, "setPrivateRelayBlockedReason:", self->_privateRelayBlockedReason);
  objc_msgSend(v6, "setAdvertisedCountryCode:", self->_advertisedCountryCode);
  objc_msgSend(v6, "setAppliedCountryCode:", self->_appliedCountryCode);
  objc_msgSend(v6, "setLocaleSource:", self->_localeSource);
  objc_msgSend(v6, "setBssEnvironment:", self->_bssEnvironment);
  objc_msgSend(v6, "setLastJoinDate:", self->_lastJoinDate);
  objc_msgSend(v6, "setConnectedBss:", self->_connectedBss);
  objc_msgSend(v6, "setColocatedNetworkCount:", self->_colocatedNetworkCount);
  objc_msgSend(v6, "setSwitchedToCount:", self->_switchedToCount);
  objc_msgSend(v6, "setSwitchedAwayCount:", self->_switchedAwayCount);
  objc_msgSend(v6, "setNetworkScore:", self->_networkScore);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_downloadSpeedResults;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "doubleValue", (_QWORD)v13);
        objc_msgSend(v6, "addDownloadSpeed:");
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  objc_msgSend(v6, "setPrivateMacType:", self->_privateMacType);
  objc_msgSend(v6, "setPrivateMacFeatureToggled:", self->_privateMacFeatureToggled);
  objc_msgSend(v6, "setPrivateMacUnderClassification:", self->_privateMacUnderClassification);
  objc_msgSend(v6, "setPrivateMacDisabledByProfile:", self->_privateMacDisabledByProfile);
  objc_msgSend(v6, "setPrivateMacNetworkTypeHome:", self->_privateMacNetworkTypeHome);
  objc_msgSend(v6, "setUsageDayTimeInLastDay:", self->_usageDayTimeInLastDay);
  objc_msgSend(v6, "setUsageDayTimeInLastWeek:", self->_usageDayTimeInLastWeek);
  objc_msgSend(v6, "setUsageDayTimeInLastMonth:", self->_usageDayTimeInLastMonth);
  objc_msgSend(v6, "setUsageNightTimeInLastDay:", self->_usageNightTimeInLastDay);
  objc_msgSend(v6, "setUsageNightTimeInLastWeek:", self->_usageNightTimeInLastWeek);
  objc_msgSend(v6, "setUsageNightTimeInLastMonth:", self->_usageNightTimeInLastMonth);
  objc_msgSend(v6, "setUsageStationaryDayTimeInLastDay:", self->_usageStationaryDayTimeInLastDay);
  objc_msgSend(v6, "setUsageStationaryDayTimeInLastWeek:", self->_usageStationaryDayTimeInLastWeek);
  objc_msgSend(v6, "setUsageStationaryDayTimeInLastMonth:", self->_usageStationaryDayTimeInLastMonth);
  objc_msgSend(v6, "setUsageStationaryNightTimeInLastDay:", self->_usageStationaryNightTimeInLastDay);
  objc_msgSend(v6, "setUsageStationaryNightTimeInLastWeek:", self->_usageStationaryNightTimeInLastWeek);
  objc_msgSend(v6, "setUsageStationaryNightTimeInLastMonth:", self->_usageStationaryNightTimeInLastMonth);
  objc_msgSend(v6, "setUsageChargingDayTimeInLastDay:", self->_usageChargingDayTimeInLastDay);
  objc_msgSend(v6, "setUsageChargingDayTimeInLastWeek:", self->_usageChargingDayTimeInLastWeek);
  objc_msgSend(v6, "setUsageChargingDayTimeInLastMonth:", self->_usageChargingDayTimeInLastMonth);
  objc_msgSend(v6, "setUsageChargingNightTimeInLastDay:", self->_usageChargingNightTimeInLastDay);
  objc_msgSend(v6, "setUsageChargingNightTimeInLastWeek:", self->_usageChargingNightTimeInLastWeek);
  objc_msgSend(v6, "setUsageChargingNightTimeInLastMonth:", self->_usageChargingNightTimeInLastMonth);
  objc_msgSend(v6, "setIsAtPrimaryHMHome:", self->_isAtPrimaryHMHome);
  objc_msgSend(v6, "setIsAtNonPrimaryHMHome:", self->_isAtNonPrimaryHMHome);
  objc_msgSend(v6, "setJoinSuccessCountInLastDay:", self->_joinSuccessCountInLastDay);
  objc_msgSend(v6, "setJoinSuccessCountInLastWeek:", self->_joinSuccessCountInLastWeek);
  objc_msgSend(v6, "setJoinSuccessCountInLastMonth:", self->_joinSuccessCountInLastMonth);
  objc_msgSend(v6, "setJoinFailCountInLastDay:", self->_joinFailCountInLastDay);
  objc_msgSend(v6, "setJoinFailCountInLastWeek:", self->_joinFailCountInLastWeek);
  objc_msgSend(v6, "setJoinFailCountInLastMonth:", self->_joinFailCountInLastMonth);
  objc_msgSend(v6, "setColocatedScopeCount:", self->_colocatedScopeCount);
  objc_msgSend(v6, "setDisable6eMode:", self->_disable6eMode);
  objc_msgSend(v6, "setIsStandalone6E:", self->_isStandalone6E);
  return v6;
}

- (void)addDownloadSpeed:(double)a3
{
  NSMutableArray *downloadSpeedResults;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  downloadSpeedResults = self->_downloadSpeedResults;
  if (!downloadSpeedResults)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_downloadSpeedResults;
    self->_downloadSpeedResults = v6;

    downloadSpeedResults = self->_downloadSpeedResults;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](downloadSpeedResults, "addObject:", v8);

}

- (BOOL)isCurrentBssOnChannel:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[WiFiUsageNetworkDetails connectedBss](self, "connectedBss");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isOnChannel:", v4);

  return v6;
}

- (id)eventDictionary:(BOOL)a3
{
  _BOOL8 v3;
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
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
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
  void *v95;
  _QWORD v97[2];

  v3 = a3;
  v97[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    +[WiFiUsagePrivacyFilter localTimestamp:](WiFiUsagePrivacyFilter, "localTimestamp:", self->_lastJoinDate);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("NetworkJoinDate"));

LABEL_9:
    objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_networkName, CFSTR("NetworkName"));
    goto LABEL_10;
  }
  if ((self->_isPublic || self->_isCarrierBased)
    && +[WiFiUsagePrivacyFilter canPerformActionWithSampleRate:](WiFiUsagePrivacyFilter, "canPerformActionWithSampleRate:", 1)|| +[WiFiUsagePrivacyFilter isInternalInstall](WiFiUsagePrivacyFilter, "isInternalInstall")&& +[WiFiUsagePrivacyFilter canPerformActionWithSampleRate:](WiFiUsagePrivacyFilter, "canPerformActionWithSampleRate:", 3))
  {
    goto LABEL_9;
  }
LABEL_10:
  if (+[WiFiUsagePrivacyFilter isInternalInstall](WiFiUsagePrivacyFilter, "isInternalInstall"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isHome);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("NetworkIsHome"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isWork);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("NetworkIsWork"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isKnown);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("NetworkIsKnown"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isOpen);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("NetworkIsOpen"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_captiveStatus == 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("NetworkIsCaptive"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isPublic);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("NetworkIsPublic"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isLowQuality);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("NetworkIsLowQuality"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isInternal);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("NetworkIsInternal"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isManaged);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("NetworkIsManaged"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isCarrierBased);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("NetworkIsCarrierBased"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isCarPlay);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("NetworkIsCarPlay"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAppBased);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("NetworkIsAppBased"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isWalletBased);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("NetworkIsWalletBased"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isPersonalHotspot);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("NetworkIsPersonalHotspot"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isMoving);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("NetworkIsMoving"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isMesh);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("NetworkIsMesh"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isWidelyDeployed);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, CFSTR("NetworkIsWidelyDeployed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAutoJoined);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, CFSTR("NetworkIsAutoJoined"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAdhoc);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, CFSTR("NetworkIsAdhoc"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isHidden);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, CFSTR("NetworkIsHidden"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isPasspoint);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, CFSTR("NetworkIsPasspoint"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isMetered);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v28, CFSTR("NetworkIsMetered"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isBlueAtlas);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, CFSTR("NetworkIsBlueAtlas"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasWapi);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v30, CFSTR("NetworkHasWapi"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasWeakSecurity);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v31, CFSTR("NetworkHasWeakSecurity"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasWpa3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v32, CFSTR("NetworkHasWpa3"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasWep);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v33, CFSTR("NetworkHasWep"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasEnterpriseSecurity);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v34, CFSTR("NetworkHasEnterpriseSecurity"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasLegacyEnterpriseSecurity);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v35, CFSTR("NetworkHasLegacyEnterprise"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasNoMap);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v36, CFSTR("NetworkHasNoMap"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasAmbiguousSsid);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v37, CFSTR("NetworkHasAmbiguousName"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasCustomNetworkSettings);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v38, CFSTR("NetworkHasCustomSettings"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requiresUsername);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v39, CFSTR("NetworkRequiresUsername"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requiresPassword);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v40, CFSTR("NetworkRequiresPassword"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requiresIdentity);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v41, CFSTR("NetworkRequiresIdentity"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requiresOtp);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v42, CFSTR("NetworkRequiresOtp"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_canExposeImsi);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v43, CFSTR("NetworkCanExposeImsi"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_addedFromUI);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v44, CFSTR("NetworkAddedFromUi"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_addedFromApp);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v45, CFSTR("NetworkAddedFromApp"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_addedViaSync);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v46, CFSTR("NetworkAddedViaSync"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_addedViaATJ);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v47, CFSTR("NetworkAddedViaAtj"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_addedViaRecommendation);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v48, CFSTR("NetworkAddedViaRecommendation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_addedViaSharing);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v49, CFSTR("NetworkAddedViaSharing"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_usageRank);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v50, CFSTR("NetworkUsageRank"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_autoJoinDisabled);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v51, CFSTR("NetworkAutoJoinDisabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_autoLoginDisabled);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v52, CFSTR("NetworkAutoLoginDisabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_lowDataModeEnabled);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v53, CFSTR("NetworkLowDataModeEnabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_controlCenterDisabled);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v54, CFSTR("NetworkControlCenterDisabled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_privateRelayEnabled);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v55, CFSTR("NetworkPrivateRelayEnabled"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_privateRelayBlockedReason, CFSTR("NetworkPrivateRelayBlockedReason"));
  v97[0] = self->_advertisedCountryCode;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v97, 4);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v56, CFSTR("NetworkCountryCodeAdvertised"));

  v97[0] = self->_appliedCountryCode;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v97, 4);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v57, CFSTR("NetworkCountryCodeApplied"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_localeSource);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v58, CFSTR("NetworkCountryCodeSource"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_colocatedNetworkCount);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v59, CFSTR("NetworkColocatedCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_switchedAwayCount);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v60, CFSTR("NetworkSwitchedAwayCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_switchedToCount);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v61, CFSTR("NetworkSwitchedToCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_networkScore);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v62, CFSTR("NetworkScore"));

  if (-[NSMutableArray count](self->_downloadSpeedResults, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_downloadSpeedResults, "objectAtIndexedSubscript:", 0);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v63, CFSTR("NetworkDownloadSpeed"));

  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_privateMacType, CFSTR("NetworkPrivateMacType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_privateMacFeatureToggled);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v64, CFSTR("NetworkPrivateMacFeatureToggled"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_privateMacUnderClassification);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v65, CFSTR("NetworkPrivateMacUnderClassification"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_privateMacDisabledByProfile);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v66, CFSTR("NetworkPrivateMacDisabledByProfile"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_privateMacNetworkTypeHome);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v67, CFSTR("NetworkPrivateMacNetworkTypeHome"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_usageDayTimeInLastDay);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v68, CFSTR("NetworkUsageDayTimeInLastDay"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_usageDayTimeInLastWeek);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v69, CFSTR("NetworkUsageDayTimeInLastWeek"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_usageDayTimeInLastMonth);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v70, CFSTR("NetworkUsageDayTimeInLastMonth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_usageNightTimeInLastDay);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v71, CFSTR("NetworkUsageNightTimeInLastDay"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_usageNightTimeInLastWeek);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v72, CFSTR("NetworkUsageNightTimeInLastWeek"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_usageNightTimeInLastMonth);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v73, CFSTR("NetworkUsageNightTimeInLastMonth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_usageStationaryDayTimeInLastDay);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v74, CFSTR("NetworkUsageStationaryDayTimeInLastDay"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_usageStationaryDayTimeInLastWeek);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v75, CFSTR("NetworkUsageStationaryDayTimeInLastWeek"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_usageStationaryDayTimeInLastMonth);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v76, CFSTR("NetworkUsageStationaryDayTimeInLastMonth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_usageStationaryNightTimeInLastDay);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v77, CFSTR("NetworkUsageStationaryNightTimeInLastDay"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_usageStationaryNightTimeInLastWeek);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v78, CFSTR("NetworkUsageStationaryNightTimeInLastWeek"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_usageStationaryNightTimeInLastMonth);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v79, CFSTR("NetworkUsageStationaryNightTimeInLastMonth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_usageChargingDayTimeInLastDay);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v80, CFSTR("NetworkUsageChargingDayTimeInLastDay"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_usageChargingDayTimeInLastWeek);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v81, CFSTR("NetworkUsageChargingDayTimeInLastWeek"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_usageChargingDayTimeInLastMonth);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v82, CFSTR("NetworkUsageChargingDayTimeInLastMonth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_usageChargingNightTimeInLastDay);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v83, CFSTR("NetworkUsageChargingNightTimeInLastDay"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_usageChargingNightTimeInLastWeek);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v84, CFSTR("NetworkUsageChargingNightTimeInLastWeek"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_usageChargingNightTimeInLastMonth);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v85, CFSTR("NetworkUsageChargingNightTimeInLastMonth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAtPrimaryHMHome);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v86, CFSTR("NetworkAtPrimaryHMHome"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isAtNonPrimaryHMHome);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v87, CFSTR("NetworkAtNonPrimaryHMHome"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_joinSuccessCountInLastDay);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v88, CFSTR("NetworkJoinSuccessCountInLastDay"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_joinSuccessCountInLastWeek);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v89, CFSTR("NetworkJoinSuccessCountInLastWeek"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_joinSuccessCountInLastMonth);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v90, CFSTR("NetworkJoinSuccessCountInLastMonth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_joinFailCountInLastDay);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v91, CFSTR("NetworkJoinFailCountInLastDay"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_joinFailCountInLastWeek);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v92, CFSTR("NetworkJoinFailCountInLastWeek"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_joinFailCountInLastMonth);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v93, CFSTR("NetworkJoinFailCountInLastMonth"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_colocatedScopeCount);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v94, CFSTR("NetworkColocatedScopeCount"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_bssEnvironment, CFSTR("NetworkBssEnvironment"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_bssEnvironment, CFSTR("NetworkBssEnvironmentString"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", self->_disable6eMode, CFSTR("NetworkDisable6EMode"));
  -[WiFiUsageBssDetails eventDictionary:](self->_connectedBss, "eventDictionary:", v3);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v95);

  return v5;
}

- (BOOL)isKnown
{
  return self->_isKnown;
}

- (void)setIsKnown:(BOOL)a3
{
  self->_isKnown = a3;
}

- (BOOL)isOpen
{
  return self->_isOpen;
}

- (void)setIsOpen:(BOOL)a3
{
  self->_isOpen = a3;
}

- (BOOL)isPublic
{
  return self->_isPublic;
}

- (void)setIsPublic:(BOOL)a3
{
  self->_isPublic = a3;
}

- (BOOL)isLowQuality
{
  return self->_isLowQuality;
}

- (void)setIsLowQuality:(BOOL)a3
{
  self->_isLowQuality = a3;
}

- (BOOL)isHome
{
  return self->_isHome;
}

- (void)setIsHome:(BOOL)a3
{
  self->_isHome = a3;
}

- (BOOL)isWork
{
  return self->_isWork;
}

- (void)setIsWork:(BOOL)a3
{
  self->_isWork = a3;
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (void)setIsInternal:(BOOL)a3
{
  self->_isInternal = a3;
}

- (BOOL)isManaged
{
  return self->_isManaged;
}

- (void)setIsManaged:(BOOL)a3
{
  self->_isManaged = a3;
}

- (BOOL)isCarrierBased
{
  return self->_isCarrierBased;
}

- (void)setIsCarrierBased:(BOOL)a3
{
  self->_isCarrierBased = a3;
}

- (BOOL)isCarPlay
{
  return self->_isCarPlay;
}

- (void)setIsCarPlay:(BOOL)a3
{
  self->_isCarPlay = a3;
}

- (BOOL)isAppBased
{
  return self->_isAppBased;
}

- (void)setIsAppBased:(BOOL)a3
{
  self->_isAppBased = a3;
}

- (BOOL)isWalletBased
{
  return self->_isWalletBased;
}

- (void)setIsWalletBased:(BOOL)a3
{
  self->_isWalletBased = a3;
}

- (BOOL)isPersonalHotspot
{
  return self->_isPersonalHotspot;
}

- (void)setIsPersonalHotspot:(BOOL)a3
{
  self->_isPersonalHotspot = a3;
}

- (BOOL)isInstantHotspot
{
  return self->_isInstantHotspot;
}

- (void)setIsInstantHotspot:(BOOL)a3
{
  self->_isInstantHotspot = a3;
}

- (BOOL)isAutoHotspot
{
  return self->_isAutoHotspot;
}

- (void)setIsAutoHotspot:(BOOL)a3
{
  self->_isAutoHotspot = a3;
}

- (BOOL)isMoving
{
  return self->_isMoving;
}

- (void)setIsMoving:(BOOL)a3
{
  self->_isMoving = a3;
}

- (BOOL)isMesh
{
  return self->_isMesh;
}

- (void)setIsMesh:(BOOL)a3
{
  self->_isMesh = a3;
}

- (BOOL)isWidelyDeployed
{
  return self->_isWidelyDeployed;
}

- (void)setIsWidelyDeployed:(BOOL)a3
{
  self->_isWidelyDeployed = a3;
}

- (BOOL)isAutoJoined
{
  return self->_isAutoJoined;
}

- (void)setIsAutoJoined:(BOOL)a3
{
  self->_isAutoJoined = a3;
}

- (BOOL)isAdhoc
{
  return self->_isAdhoc;
}

- (void)setIsAdhoc:(BOOL)a3
{
  self->_isAdhoc = a3;
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (void)setIsHidden:(BOOL)a3
{
  self->_isHidden = a3;
}

- (BOOL)isPasspoint
{
  return self->_isPasspoint;
}

- (void)setIsPasspoint:(BOOL)a3
{
  self->_isPasspoint = a3;
}

- (BOOL)isMetered
{
  return self->_isMetered;
}

- (void)setIsMetered:(BOOL)a3
{
  self->_isMetered = a3;
}

- (BOOL)isBlueAtlas
{
  return self->_isBlueAtlas;
}

- (void)setIsBlueAtlas:(BOOL)a3
{
  self->_isBlueAtlas = a3;
}

- (BOOL)isStandalone6E
{
  return self->_isStandalone6E;
}

- (void)setIsStandalone6E:(BOOL)a3
{
  self->_isStandalone6E = a3;
}

- (BOOL)hasWapi
{
  return self->_hasWapi;
}

- (void)setHasWapi:(BOOL)a3
{
  self->_hasWapi = a3;
}

- (BOOL)hasWeakSecurity
{
  return self->_hasWeakSecurity;
}

- (void)setHasWeakSecurity:(BOOL)a3
{
  self->_hasWeakSecurity = a3;
}

- (BOOL)hasWpa3
{
  return self->_hasWpa3;
}

- (void)setHasWpa3:(BOOL)a3
{
  self->_hasWpa3 = a3;
}

- (BOOL)hasWep
{
  return self->_hasWep;
}

- (void)setHasWep:(BOOL)a3
{
  self->_hasWep = a3;
}

- (BOOL)hasEnterpriseSecurity
{
  return self->_hasEnterpriseSecurity;
}

- (void)setHasEnterpriseSecurity:(BOOL)a3
{
  self->_hasEnterpriseSecurity = a3;
}

- (BOOL)hasLegacyEnterpriseSecurity
{
  return self->_hasLegacyEnterpriseSecurity;
}

- (void)setHasLegacyEnterpriseSecurity:(BOOL)a3
{
  self->_hasLegacyEnterpriseSecurity = a3;
}

- (BOOL)hasNoMap
{
  return self->_hasNoMap;
}

- (void)setHasNoMap:(BOOL)a3
{
  self->_hasNoMap = a3;
}

- (BOOL)hasAmbiguousSsid
{
  return self->_hasAmbiguousSsid;
}

- (void)setHasAmbiguousSsid:(BOOL)a3
{
  self->_hasAmbiguousSsid = a3;
}

- (BOOL)hasCustomNetworkSettings
{
  return self->_hasCustomNetworkSettings;
}

- (void)setHasCustomNetworkSettings:(BOOL)a3
{
  self->_hasCustomNetworkSettings = a3;
}

- (BOOL)requiresUsername
{
  return self->_requiresUsername;
}

- (void)setRequiresUsername:(BOOL)a3
{
  self->_requiresUsername = a3;
}

- (BOOL)requiresPassword
{
  return self->_requiresPassword;
}

- (void)setRequiresPassword:(BOOL)a3
{
  self->_requiresPassword = a3;
}

- (BOOL)requiresIdentity
{
  return self->_requiresIdentity;
}

- (void)setRequiresIdentity:(BOOL)a3
{
  self->_requiresIdentity = a3;
}

- (BOOL)requiresOtp
{
  return self->_requiresOtp;
}

- (void)setRequiresOtp:(BOOL)a3
{
  self->_requiresOtp = a3;
}

- (BOOL)canExposeImsi
{
  return self->_canExposeImsi;
}

- (void)setCanExposeImsi:(BOOL)a3
{
  self->_canExposeImsi = a3;
}

- (BOOL)addedFromUI
{
  return self->_addedFromUI;
}

- (void)setAddedFromUI:(BOOL)a3
{
  self->_addedFromUI = a3;
}

- (BOOL)addedFromApp
{
  return self->_addedFromApp;
}

- (void)setAddedFromApp:(BOOL)a3
{
  self->_addedFromApp = a3;
}

- (BOOL)addedViaSync
{
  return self->_addedViaSync;
}

- (void)setAddedViaSync:(BOOL)a3
{
  self->_addedViaSync = a3;
}

- (BOOL)addedViaATJ
{
  return self->_addedViaATJ;
}

- (void)setAddedViaATJ:(BOOL)a3
{
  self->_addedViaATJ = a3;
}

- (BOOL)addedViaRecommendation
{
  return self->_addedViaRecommendation;
}

- (void)setAddedViaRecommendation:(BOOL)a3
{
  self->_addedViaRecommendation = a3;
}

- (BOOL)addedViaSharing
{
  return self->_addedViaSharing;
}

- (void)setAddedViaSharing:(BOOL)a3
{
  self->_addedViaSharing = a3;
}

- (int64_t)usageRank
{
  return self->_usageRank;
}

- (void)setUsageRank:(int64_t)a3
{
  self->_usageRank = a3;
}

- (BOOL)autoJoinDisabled
{
  return self->_autoJoinDisabled;
}

- (void)setAutoJoinDisabled:(BOOL)a3
{
  self->_autoJoinDisabled = a3;
}

- (BOOL)autoLoginDisabled
{
  return self->_autoLoginDisabled;
}

- (void)setAutoLoginDisabled:(BOOL)a3
{
  self->_autoLoginDisabled = a3;
}

- (BOOL)lowDataModeEnabled
{
  return self->_lowDataModeEnabled;
}

- (void)setLowDataModeEnabled:(BOOL)a3
{
  self->_lowDataModeEnabled = a3;
}

- (BOOL)controlCenterDisabled
{
  return self->_controlCenterDisabled;
}

- (void)setControlCenterDisabled:(BOOL)a3
{
  self->_controlCenterDisabled = a3;
}

- (BOOL)privateRelayEnabled
{
  return self->_privateRelayEnabled;
}

- (void)setPrivateRelayEnabled:(BOOL)a3
{
  self->_privateRelayEnabled = a3;
}

- (NSString)privateRelayBlockedReason
{
  return self->_privateRelayBlockedReason;
}

- (void)setPrivateRelayBlockedReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unint64_t)advertisedCountryCode
{
  return self->_advertisedCountryCode;
}

- (void)setAdvertisedCountryCode:(unint64_t)a3
{
  self->_advertisedCountryCode = a3;
}

- (unint64_t)appliedCountryCode
{
  return self->_appliedCountryCode;
}

- (void)setAppliedCountryCode:(unint64_t)a3
{
  self->_appliedCountryCode = a3;
}

- (unint64_t)localeSource
{
  return self->_localeSource;
}

- (void)setLocaleSource:(unint64_t)a3
{
  self->_localeSource = a3;
}

- (NSString)bssEnvironment
{
  return self->_bssEnvironment;
}

- (void)setBssEnvironment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)networkName
{
  return self->_networkName;
}

- (void)setNetworkName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (unint64_t)colocatedNetworkCount
{
  return self->_colocatedNetworkCount;
}

- (void)setColocatedNetworkCount:(unint64_t)a3
{
  self->_colocatedNetworkCount = a3;
}

- (void)setConnectedBss:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (unint64_t)switchedAwayCount
{
  return self->_switchedAwayCount;
}

- (void)setSwitchedAwayCount:(unint64_t)a3
{
  self->_switchedAwayCount = a3;
}

- (unint64_t)switchedToCount
{
  return self->_switchedToCount;
}

- (void)setSwitchedToCount:(unint64_t)a3
{
  self->_switchedToCount = a3;
}

- (int64_t)networkScore
{
  return self->_networkScore;
}

- (void)setNetworkScore:(int64_t)a3
{
  self->_networkScore = a3;
}

- (NSMutableArray)downloadSpeedResults
{
  return self->_downloadSpeedResults;
}

- (void)setDownloadSpeedResults:(id)a3
{
  objc_storeStrong((id *)&self->_downloadSpeedResults, a3);
}

- (NSDate)lastJoinDate
{
  return self->_lastJoinDate;
}

- (void)setLastJoinDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)privateMacType
{
  return self->_privateMacType;
}

- (void)setPrivateMacType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (BOOL)privateMacFeatureToggled
{
  return self->_privateMacFeatureToggled;
}

- (void)setPrivateMacFeatureToggled:(BOOL)a3
{
  self->_privateMacFeatureToggled = a3;
}

- (BOOL)privateMacUnderClassification
{
  return self->_privateMacUnderClassification;
}

- (void)setPrivateMacUnderClassification:(BOOL)a3
{
  self->_privateMacUnderClassification = a3;
}

- (BOOL)privateMacDisabledByProfile
{
  return self->_privateMacDisabledByProfile;
}

- (void)setPrivateMacDisabledByProfile:(BOOL)a3
{
  self->_privateMacDisabledByProfile = a3;
}

- (BOOL)privateMacNetworkTypeHome
{
  return self->_privateMacNetworkTypeHome;
}

- (void)setPrivateMacNetworkTypeHome:(BOOL)a3
{
  self->_privateMacNetworkTypeHome = a3;
}

- (unint64_t)captiveStatus
{
  return self->_captiveStatus;
}

- (void)setCaptiveStatus:(unint64_t)a3
{
  self->_captiveStatus = a3;
}

- (int64_t)usageDayTimeInLastDay
{
  return self->_usageDayTimeInLastDay;
}

- (void)setUsageDayTimeInLastDay:(int64_t)a3
{
  self->_usageDayTimeInLastDay = a3;
}

- (int64_t)usageDayTimeInLastWeek
{
  return self->_usageDayTimeInLastWeek;
}

- (void)setUsageDayTimeInLastWeek:(int64_t)a3
{
  self->_usageDayTimeInLastWeek = a3;
}

- (int64_t)usageDayTimeInLastMonth
{
  return self->_usageDayTimeInLastMonth;
}

- (void)setUsageDayTimeInLastMonth:(int64_t)a3
{
  self->_usageDayTimeInLastMonth = a3;
}

- (int64_t)usageNightTimeInLastDay
{
  return self->_usageNightTimeInLastDay;
}

- (void)setUsageNightTimeInLastDay:(int64_t)a3
{
  self->_usageNightTimeInLastDay = a3;
}

- (int64_t)usageNightTimeInLastWeek
{
  return self->_usageNightTimeInLastWeek;
}

- (void)setUsageNightTimeInLastWeek:(int64_t)a3
{
  self->_usageNightTimeInLastWeek = a3;
}

- (int64_t)usageNightTimeInLastMonth
{
  return self->_usageNightTimeInLastMonth;
}

- (void)setUsageNightTimeInLastMonth:(int64_t)a3
{
  self->_usageNightTimeInLastMonth = a3;
}

- (int64_t)usageStationaryDayTimeInLastDay
{
  return self->_usageStationaryDayTimeInLastDay;
}

- (void)setUsageStationaryDayTimeInLastDay:(int64_t)a3
{
  self->_usageStationaryDayTimeInLastDay = a3;
}

- (int64_t)usageStationaryDayTimeInLastWeek
{
  return self->_usageStationaryDayTimeInLastWeek;
}

- (void)setUsageStationaryDayTimeInLastWeek:(int64_t)a3
{
  self->_usageStationaryDayTimeInLastWeek = a3;
}

- (int64_t)usageStationaryDayTimeInLastMonth
{
  return self->_usageStationaryDayTimeInLastMonth;
}

- (void)setUsageStationaryDayTimeInLastMonth:(int64_t)a3
{
  self->_usageStationaryDayTimeInLastMonth = a3;
}

- (int64_t)usageStationaryNightTimeInLastDay
{
  return self->_usageStationaryNightTimeInLastDay;
}

- (void)setUsageStationaryNightTimeInLastDay:(int64_t)a3
{
  self->_usageStationaryNightTimeInLastDay = a3;
}

- (int64_t)usageStationaryNightTimeInLastWeek
{
  return self->_usageStationaryNightTimeInLastWeek;
}

- (void)setUsageStationaryNightTimeInLastWeek:(int64_t)a3
{
  self->_usageStationaryNightTimeInLastWeek = a3;
}

- (int64_t)usageStationaryNightTimeInLastMonth
{
  return self->_usageStationaryNightTimeInLastMonth;
}

- (void)setUsageStationaryNightTimeInLastMonth:(int64_t)a3
{
  self->_usageStationaryNightTimeInLastMonth = a3;
}

- (int64_t)usageChargingDayTimeInLastDay
{
  return self->_usageChargingDayTimeInLastDay;
}

- (void)setUsageChargingDayTimeInLastDay:(int64_t)a3
{
  self->_usageChargingDayTimeInLastDay = a3;
}

- (int64_t)usageChargingDayTimeInLastWeek
{
  return self->_usageChargingDayTimeInLastWeek;
}

- (void)setUsageChargingDayTimeInLastWeek:(int64_t)a3
{
  self->_usageChargingDayTimeInLastWeek = a3;
}

- (int64_t)usageChargingDayTimeInLastMonth
{
  return self->_usageChargingDayTimeInLastMonth;
}

- (void)setUsageChargingDayTimeInLastMonth:(int64_t)a3
{
  self->_usageChargingDayTimeInLastMonth = a3;
}

- (int64_t)usageChargingNightTimeInLastDay
{
  return self->_usageChargingNightTimeInLastDay;
}

- (void)setUsageChargingNightTimeInLastDay:(int64_t)a3
{
  self->_usageChargingNightTimeInLastDay = a3;
}

- (int64_t)usageChargingNightTimeInLastWeek
{
  return self->_usageChargingNightTimeInLastWeek;
}

- (void)setUsageChargingNightTimeInLastWeek:(int64_t)a3
{
  self->_usageChargingNightTimeInLastWeek = a3;
}

- (int64_t)usageChargingNightTimeInLastMonth
{
  return self->_usageChargingNightTimeInLastMonth;
}

- (void)setUsageChargingNightTimeInLastMonth:(int64_t)a3
{
  self->_usageChargingNightTimeInLastMonth = a3;
}

- (BOOL)isAtPrimaryHMHome
{
  return self->_isAtPrimaryHMHome;
}

- (void)setIsAtPrimaryHMHome:(BOOL)a3
{
  self->_isAtPrimaryHMHome = a3;
}

- (BOOL)isAtNonPrimaryHMHome
{
  return self->_isAtNonPrimaryHMHome;
}

- (void)setIsAtNonPrimaryHMHome:(BOOL)a3
{
  self->_isAtNonPrimaryHMHome = a3;
}

- (int64_t)joinSuccessCountInLastDay
{
  return self->_joinSuccessCountInLastDay;
}

- (void)setJoinSuccessCountInLastDay:(int64_t)a3
{
  self->_joinSuccessCountInLastDay = a3;
}

- (int64_t)joinSuccessCountInLastWeek
{
  return self->_joinSuccessCountInLastWeek;
}

- (void)setJoinSuccessCountInLastWeek:(int64_t)a3
{
  self->_joinSuccessCountInLastWeek = a3;
}

- (int64_t)joinSuccessCountInLastMonth
{
  return self->_joinSuccessCountInLastMonth;
}

- (void)setJoinSuccessCountInLastMonth:(int64_t)a3
{
  self->_joinSuccessCountInLastMonth = a3;
}

- (int64_t)joinFailCountInLastDay
{
  return self->_joinFailCountInLastDay;
}

- (void)setJoinFailCountInLastDay:(int64_t)a3
{
  self->_joinFailCountInLastDay = a3;
}

- (int64_t)joinFailCountInLastWeek
{
  return self->_joinFailCountInLastWeek;
}

- (void)setJoinFailCountInLastWeek:(int64_t)a3
{
  self->_joinFailCountInLastWeek = a3;
}

- (int64_t)joinFailCountInLastMonth
{
  return self->_joinFailCountInLastMonth;
}

- (void)setJoinFailCountInLastMonth:(int64_t)a3
{
  self->_joinFailCountInLastMonth = a3;
}

- (unint64_t)colocatedScopeCount
{
  return self->_colocatedScopeCount;
}

- (void)setColocatedScopeCount:(unint64_t)a3
{
  self->_colocatedScopeCount = a3;
}

- (void)setDisable6eMode:(id)a3
{
  self->_disable6eMode = (NSString *)a3;
}

@end
