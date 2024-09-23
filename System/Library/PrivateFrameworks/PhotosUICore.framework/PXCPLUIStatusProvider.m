@implementation PXCPLUIStatusProvider

- (PXCPLUIStatusProvider)initWithPhotoLibrary:(id)a3 actionManager:(id)a4
{
  return -[PXCPLUIStatusProvider initWithPhotoLibrary:actionManager:countsController:presentationStyle:](self, "initWithPhotoLibrary:actionManager:countsController:presentationStyle:", a3, a4, 0, 0);
}

- (PXCPLUIStatusProvider)initWithPhotoLibrary:(id)a3 actionManager:(id)a4 presentationStyle:(unint64_t)a5
{
  return -[PXCPLUIStatusProvider initWithPhotoLibrary:actionManager:countsController:presentationStyle:](self, "initWithPhotoLibrary:actionManager:countsController:presentationStyle:", a3, a4, 0, a5);
}

- (PXCPLUIStatusProvider)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCPLUIStatusProvider.m"), 43, CFSTR("%s is not available as initializer"), "-[PXCPLUIStatusProvider init]");

  abort();
}

- (PXCPLUIStatusProvider)initWithStatusProvider:(id)a3 actionManager:(id)a4 countsController:(id)a5 presentationStyle:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  PXCPLUIStatusProvider *v14;
  PXCPLUIStatusProvider *v15;
  void *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PXCPLUIStatusProvider;
  v14 = -[PXCPLUIStatusProvider init](&v18, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_actionManager, a4);
    objc_storeStrong((id *)&v15->_statusProvider, a3);
    objc_storeStrong((id *)&v15->_countsController, a5);
    v15->_presentationStyle = a6;
    -[PXCPLStatusProvider registerChangeObserver:context:](v15->_statusProvider, "registerChangeObserver:context:", v15, PXCPLStatusProviderObservationContext);
    -[PXCPLStatusProvider status](v15->_statusProvider, "status");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      -[PXCPLUIStatusProvider _statusDidChange:](v15, "_statusDidChange:", v16);

  }
  return v15;
}

- (PXCPLUIStatusProvider)initWithPhotoLibrary:(id)a3
{
  return -[PXCPLUIStatusProvider initWithPhotoLibrary:actionManager:](self, "initWithPhotoLibrary:actionManager:", a3, 0);
}

- (PXCPLUIStatusProvider)initWithPhotoLibrary:(id)a3 countsController:(id)a4
{
  return -[PXCPLUIStatusProvider initWithPhotoLibrary:actionManager:countsController:presentationStyle:](self, "initWithPhotoLibrary:actionManager:countsController:presentationStyle:", a3, 0, a4, 0);
}

- (PXCPLUIStatusProvider)initWithPhotoLibrary:(id)a3 actionManager:(id)a4 countsController:(id)a5 presentationStyle:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  PXCPLStatusProviderMonitor *v14;
  void *v15;
  PXCPLUIStatusProvider *v16;
  PXCPLUIStatusProvider *v17;
  void *v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCPLUIStatusProvider.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  v14 = -[PXCPLStatusProviderMonitor initWithPhotoLibrary:]([PXCPLStatusProviderMonitor alloc], "initWithPhotoLibrary:", v11);
  -[PXCPLStatusProviderMonitor statusProvider](v14, "statusProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PXCPLUIStatusProvider initWithStatusProvider:actionManager:countsController:presentationStyle:](self, "initWithStatusProvider:actionManager:countsController:presentationStyle:", v15, v12, v13, a6);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_statusProviderMonitor, v14);
    -[PXCPLStatusProviderMonitor registerChangeObserver:context:](v17->_statusProviderMonitor, "registerChangeObserver:context:", v17, PXCPLStatusProviderMonitorObservationContext);
    objc_storeStrong((id *)&v17->_countsController, a5);
    -[PXAssetsDataSourceCountsController registerChangeObserver:context:](v17->_countsController, "registerChangeObserver:context:", v17, PXAssetsDataSourceCountsControllerObserverContext_281235);
    -[PXAssetsDataSourceCountsController prepareCountsIfNeeded](v17->_countsController, "prepareCountsIfNeeded");
  }

  return v17;
}

- (void)_statusDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  PXCPLUIStatus *v7;
  float v8;
  float v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  BOOL v22;
  int v23;
  float v24;
  float v25;
  float v26;
  uint64_t v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  uint64_t v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  PXCPLUIStatusProvider *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  __CFString *v43;
  char v44;
  __CFString *v45;
  void *v46;
  __CFString *v47;
  void *v48;
  float v49;
  void *v50;
  uint64_t v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  id v63;
  __CFString *v64;
  __CFString *v65;
  uint64_t v66;
  double v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  const __CFString *v73;
  char v74;
  void *v75;
  void *v76;
  void *v77;
  PXAssetsDataSourceCountsController *countsController;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  float v83;
  float v84;
  unint64_t v85;
  float v86;
  float v87;
  float v88;
  __CFString *v89;
  void *v90;
  float v91;
  float v92;
  double v93;
  void *v94;
  void *v95;
  void *v96;
  float v97;
  float v98;
  double v99;
  void *v100;
  void *v101;
  void *v102;
  float v103;
  float v104;
  void *v105;
  void *v106;
  __CFString *v107;
  void *v108;
  float v109;
  float v110;
  void *v111;
  void *v112;
  double v113;
  uint64_t v114;
  uint64_t v115;
  NSObject *v116;
  void *v117;
  __CFString *v118;
  int v119;
  int v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  void *v138;
  uint64_t v139;
  __CFString *v140;
  void *v141;
  void *v142;
  id v143;
  uint64_t v144;
  id v145;
  id v146;
  void *v147;
  double v148;
  double v149;
  void *v150;
  uint64_t v151;
  unint64_t v152;
  __CFString *v153;
  void *v154;
  const __CFString *v155;
  const __CFString *v156;
  __CFString *v157;
  uint64_t v158;
  __CFString *v159;
  void *v160;
  unsigned int v161;
  __CFString *v162;
  uint64_t v163;
  __CFString *v164;
  uint64_t v165;
  __CFString *v166;
  void *v167;
  void *v168;
  __CFString *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  __CFString *v175;
  void *v176;
  uint64_t v177;
  void *v178;
  void *v179;
  __CFString *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  uint64_t v185;
  void *v186;
  void *v187;
  void *v188;
  unsigned int v189;
  void *v190;
  void *v191;
  __CFString *v192;
  unsigned int v193;
  uint64_t v194;
  __CFString *v195;
  void *v196;
  unint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  int v201;
  void *v202;
  void *v203;
  void *v204;
  PXCPLUIStatusProvider *v205;
  unsigned int v206;
  unint64_t v207;
  int v208;
  uint64_t v209;
  _QWORD v210[5];
  PXCPLUIStatus *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  _QWORD aBlock[4];
  id v217[2];
  _BYTE location[12];
  __int16 v219;
  PXCPLUIStatus *v220;
  uint64_t v221;

  v221 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "isEnabled"))
  {
    v7 = 0;
    goto LABEL_177;
  }
  if ((objc_msgSend(v5, "isInSoftResetSync") & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(v5, "isInHardResetSync");
  objc_msgSend(v5, "fractionCompletedForLibraryRebuild");
  v9 = v8;
  objc_msgSend(v5, "syncDate");
  v203 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "syncDate");
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exitDate");
  v10 = objc_claimAutoreleasedReturnValue();
  v194 = objc_msgSend(v5, "numberOfItemsFailingToUpload");
  v200 = objc_msgSend(v5, "numberOfPhotoAssets");
  v199 = objc_msgSend(v5, "numberOfVideoAssets");
  v198 = objc_msgSend(v5, "numberOfOtherAssets");
  v11 = objc_msgSend(v5, "numberOfReferencedItems");
  if (v11)
  {
    v12 = v11;
    _PXCPLUIStatusLocalizedString(CFSTR("PXCPLStatus_Referenced_NItems"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v185 = v12;
    PXLocalizedStringWithValidatedFormat(v13, CFSTR("%lu"));
    v14 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  v15 = objc_msgSend(v5, "sharedLibraryState", v185);
  v193 = objc_msgSend(v5, "isUpgradeSuggestedToAccessAllPhotos");
  v16 = (objc_msgSend(v5, "isExceedingQuota") & 1) != 0 || objc_msgSend(v5, "cloudQuotaState") == 2;
  if (objc_msgSend(v5, "sharedLibraryMovingToShared"))
    v17 = objc_msgSend(v5, "isExceedingSharedLibraryQuota");
  else
    v17 = 1;
  if (objc_msgSend(v5, "numberOfItemsToUpload"))
    v18 = !v16 | v17;
  else
    v18 = 0;
  v19 = objc_msgSend(v5, "sharedLibraryMovingToPersonal");
  if (objc_msgSend(v5, "sharedLibraryMovingToShared"))
  {
    v20 = objc_msgSend(v5, "isExceedingSharedLibraryQuota") ^ 1;
    if (!v19)
      v20 = 1;
    v21 = v20 | v16;
  }
  else
  {
    v21 = 0;
  }
  v22 = (v15 & 0xFFFFFFFFFFFFFFFELL) == 2 && v10 == 0;
  v23 = !v22;
  v204 = (void *)v10;
  v205 = self;
  v206 = v6;
  v190 = (void *)v14;
  v208 = v23;
  if (v22)
  {
    v27 = objc_msgSend(v5, "sharedLibraryExitingWithNumberOfAssetsRemaining");
    v32 = 0;
    v28 = 0;
    v201 = 0;
    v30 = 0;
    v31 = 0;
    v29 = 1;
    v24 = -1.0;
    v33 = 7;
LABEL_38:
    v207 = v33;
    goto LABEL_39;
  }
  if (v18)
  {
    objc_msgSend(v5, "fractionCompletedForUpload");
    v24 = -1.0;
    if (v25 != -1.0)
    {
      objc_msgSend(v5, "fractionCompletedForUpload");
      v24 = v26;
    }
    v27 = objc_msgSend(v5, "numberOfItemsToUpload");
    v28 = 0;
    v201 = 0;
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v32 = 1;
    v33 = 3;
    goto LABEL_38;
  }
  if (objc_msgSend(v5, "numberOfItemsToAdd"))
  {
    v27 = objc_msgSend(v5, "numberOfItemsToAdd");
    v32 = 0;
    v28 = 0;
    v201 = 0;
    v30 = 0;
    v31 = 0;
    v29 = 1;
    v24 = -1.0;
    v33 = 2;
    goto LABEL_38;
  }
  if (v21)
  {
    v27 = objc_msgSend(v5, "sharedLibraryMovingToShared");
    v32 = 0;
    v28 = 0;
    v30 = 0;
    v31 = 0;
    v201 = 1;
    v24 = -1.0;
    v38 = 5;
LABEL_53:
    v207 = v38;
    v29 = 1;
    goto LABEL_39;
  }
  if (objc_msgSend(v5, "sharedLibraryMovingToPersonal"))
  {
    v27 = objc_msgSend(v5, "sharedLibraryMovingToPersonal");
    v32 = 0;
    v201 = 0;
    v30 = 0;
    v31 = 0;
    v28 = 1;
    v24 = -1.0;
    v38 = 6;
    goto LABEL_53;
  }
  if (objc_msgSend(v5, "numberOfOriginalsToDownload"))
  {
    v27 = objc_msgSend(v5, "numberOfOriginalsToDownload");
    v32 = 0;
    v28 = 0;
    v201 = 0;
    v31 = 0;
    v29 = 1;
    v24 = -1.0;
    v207 = 4;
    v30 = 1;
  }
  else
  {
    v119 = objc_msgSend(v5, "isSyncing");
    v27 = 0;
    v32 = 0;
    v28 = 0;
    v201 = 0;
    v30 = 0;
    if (v203)
      v120 = v119;
    else
      v120 = 1;
    v207 = v120 | v206;
    v31 = v207 ^ 1;
    v29 = 1;
    v24 = -1.0;
  }
LABEL_39:
  v34 = objc_msgSend(v5, "isExceedingSharedLibraryQuota");
  v196 = v5;
  if ((objc_msgSend(v5, "isInHeavyThermalPressure") & 1) != 0)
  {
    v35 = 0;
    v36 = 0;
    v37 = 17;
LABEL_61:
    v209 = v37;
    v39 = v205;
    v40 = v206;
    goto LABEL_62;
  }
  if ((objc_msgSend(v5, "isInAirplaneMode") & 1) != 0)
  {
    v35 = 0;
    v36 = 6;
    v37 = 12;
    goto LABEL_61;
  }
  if ((objc_msgSend(v5, "isOffline") & 1) != 0)
  {
    v35 = 0;
    v36 = 0;
    v37 = 11;
    goto LABEL_61;
  }
  if ((objc_msgSend(v5, "isCellularDataDisabled") & 1) != 0)
  {
    v35 = 0;
    v36 = 5;
    v37 = 10;
    goto LABEL_61;
  }
  if ((objc_msgSend(v5, "isClientVersionTooOld") & 1) != 0)
  {
    v35 = 0;
    v36 = 9;
    v37 = 8;
    goto LABEL_61;
  }
  if ((objc_msgSend(v5, "isClientNotAuthenticated") & 1) != 0)
  {
    v35 = 0;
    v36 = 10;
    v37 = 9;
    goto LABEL_61;
  }
  if ((objc_msgSend(v5, "isVeryLowDiskSpace") & 1) != 0
    || (v29 & objc_msgSend(v5, "isLowDiskSpace") & 1) != 0)
  {
    v35 = 0;
    v36 = 4;
    v37 = 3;
    goto LABEL_61;
  }
  if (((v16 & (v32 | v28) | v201 & v34) & 1) != 0)
  {
    v39 = v205;
    v40 = v206;
    if ((objc_msgSend(v5, "isExceedingSharedLibraryQuota") & 1) != 0)
    {
      v35 = 0;
      v36 = 0;
    }
    else
    {
      v35 = 0;
      if (objc_msgSend(v5, "hasCloudQuotaOffer"))
        v36 = 0;
      else
        v36 = 3;
    }
    v209 = 2;
LABEL_62:
    -[PXCPLUIStatusProvider currentDateForTesting](v39, "currentDateForTesting");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v41)
    {
      v43 = v41;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v43 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();

    }
    _RegisterServiceActivity(v207, v43);
    _PXCPLStatusPendingStateDescription(2, v207, v209, v40, v27, v15, -[PXCPLUIStatusProvider presentationStyle](v39, "presentationStyle") == 1);
    v192 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v5, "hasCloudQuotaOffer");
    switch(v209)
    {
      case 2:
        if (v201)
        {
          v45 = CFSTR("PXCPLStatusPauseReasonSharedLibraryCloudStorageBudget");
          goto LABEL_85;
        }
        if ((v44 & 1) != 0)
          goto LABEL_170;
        v45 = CFSTR("PXCPLStatusCloudStorageFull");
        goto LABEL_85;
      case 3:
        PXLocalizationKeyByAddingDeviceModelSuffix(CFSTR("PXCPLStatusPauseReasonLowDiskSpace_"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        PXLocalizedStringFromTable(v46, CFSTR("PhotosUICore"));
        v195 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_81;
      case 4:
        v45 = CFSTR("PXCPLStatusPauseReasonBatteryBudget");
        goto LABEL_85;
      case 5:
        v45 = CFSTR("PXCPLStatusPauseReasonCellularBudget");
        goto LABEL_85;
      case 6:
        v45 = CFSTR("PXCPLStatusPauseReasonLowDataMode");
        goto LABEL_85;
      case 7:
        v45 = CFSTR("PXCPLStatusPauseReasonLowPowerMode");
        goto LABEL_85;
      case 8:
        +[PXLocalization currentDeviceCanonicalModel](PXLocalization, "currentDeviceCanonicalModel");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = CFSTR("PXCPLStatusPauseReasonClientVersionTooOld_");
        goto LABEL_80;
      case 9:
        +[PXLocalization currentDeviceCanonicalModel](PXLocalization, "currentDeviceCanonicalModel");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = CFSTR("PXCPLStatusPauseReasonClientNotAuthenticated_");
LABEL_80:
        -[__CFString stringByAppendingString:](v47, "stringByAppendingString:", v46);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        _PXCPLUIStatusLocalizedString(v48);
        v195 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_81:
        break;
      case 10:
        v45 = CFSTR("PXCPLStatusPauseReasonCellularDataDisabled");
        goto LABEL_85;
      case 11:
        v45 = CFSTR("PXCPLStatusPauseReasonOffline");
        goto LABEL_85;
      case 12:
        v45 = CFSTR("PXCPLStatusPauseReasonAirplaneMode");
        goto LABEL_85;
      case 13:
        v45 = CFSTR("PXCPLStatusPauseReasonCapturingSnapshot");
        goto LABEL_85;
      case 14:
        v45 = CFSTR("PXCPLStatusPauseReasonOptimizingSystemPerformance");
        goto LABEL_85;
      case 15:
        v45 = CFSTR("PXCPLStatusPauseReasonPoorNetworkConnection");
        goto LABEL_85;
      case 16:
      case 17:
        v45 = CFSTR("PXCPLStatusPauseReasonThermalPressure");
        goto LABEL_85;
      case 18:
        v45 = CFSTR("PXCPLStatusPauseReasonLowBattery");
LABEL_85:
        _PXCPLUIStatusLocalizedString(v45);
        v195 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
      default:
LABEL_170:
        v195 = 0;
        break;
    }
    if (v35)
      v49 = v24;
    else
      v49 = -1.0;
    if (v40)
      v24 = -1.0;
    else
      v24 = v49;
    v189 = 1;
    v197 = 2;
    goto LABEL_93;
  }
  if ((objc_msgSend(v5, "isCapturingSnapshot") & 1) != 0)
  {
    v35 = 0;
    v36 = 0;
    v37 = 13;
    goto LABEL_61;
  }
  if ((objc_msgSend(v5, "isUserPaused") & 1) != 0)
  {
    v35 = 1;
    v36 = 2;
    v37 = 1;
    goto LABEL_61;
  }
  if ((objc_msgSend(v5, "isInLowPowerMode") & 1) != 0)
  {
    v35 = 0;
    v36 = 2;
    v37 = 7;
    goto LABEL_61;
  }
  if ((objc_msgSend(v5, "isInLowDataMode") & 1) != 0)
  {
    v35 = 0;
    v36 = 2;
    v37 = 6;
    goto LABEL_61;
  }
  if ((objc_msgSend(v5, "isExceedingBatteryQuota") & 1) != 0)
  {
    v35 = 0;
    v36 = 2;
    v136 = 4;
LABEL_240:
    v209 = v136;
    v39 = v205;
    v40 = v206;
    goto LABEL_62;
  }
  if ((objc_msgSend(v5, "isExceedingCellularQuota") & 1) != 0)
  {
    v35 = 0;
    v36 = 2;
    v136 = 5;
    goto LABEL_240;
  }
  if ((objc_msgSend(v5, "isInLowBattery") & 1) != 0)
  {
    v35 = 0;
    v36 = 2;
    v136 = 18;
    goto LABEL_240;
  }
  if ((objc_msgSend(v5, "isOptimizingSystemPerformance") & 1) != 0)
  {
    v35 = 0;
    v36 = 2;
    v136 = 14;
    goto LABEL_240;
  }
  if ((objc_msgSend(v5, "isInPoorNetworkConnection") & 1) != 0)
  {
    v35 = 0;
    v36 = 2;
    v136 = 15;
    goto LABEL_240;
  }
  if ((objc_msgSend(v5, "isInModerateThermalPressure") & 1) != 0)
  {
    v35 = 0;
    v36 = 2;
    v136 = 16;
    goto LABEL_240;
  }
  if (!v31)
  {
    v36 = (v28 | v201 | v32 | v30 | v208 ^ 1) & (v206 ^ 1);
    -[PXCPLUIStatusProvider currentDateForTesting](v205, "currentDateForTesting");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = v137;
    if (v137)
    {
      v43 = v137;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v43 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();

    }
    _RegisterServiceActivity(v207, v43);
    v39 = v205;
    v197 = 1;
    LOBYTE(v40) = v206;
    _PXCPLStatusPendingStateDescription(1, v207, 0, v206, v27, v15, -[PXCPLUIStatusProvider presentationStyle](v205, "presentationStyle") == 1);
    v192 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v209 = 0;
    v195 = 0;
    v189 = 0;
    if (v206)
      v24 = -1.0;
    goto LABEL_93;
  }
  if (v194 && !v204)
  {
    v195 = 0;
    v36 = 7;
    goto LABEL_260;
  }
  if (objc_msgSend(v5, "cloudQuotaState"))
    v36 = 3;
  else
    v36 = 0;
  if (!v204)
  {
    v195 = 0;
    goto LABEL_260;
  }
  if (PXCPLIsInTestReadonlyMode_onceToken != -1)
    dispatch_once(&PXCPLIsInTestReadonlyMode_onceToken, &__block_literal_global_122356);
  if (PXCPLIsInTestReadonlyMode_isInTestReadOnlyMode)
  {
    v209 = 0;
    v197 = 0;
    v189 = 0;
    v192 = CFSTR("Read-Only iCloud Photos");
    v24 = -1.0;
    v36 = 8;
    v195 = CFSTR("Apple Internal. Some interactions with the Cloud might be limited.");
LABEL_310:
    v39 = v205;
    LOBYTE(v40) = v206;
    goto LABEL_94;
  }
  v165 = -[PXCPLUIStatusProvider presentationStyle](v205, "presentationStyle");
  if (!v165)
  {
    v166 = CFSTR("PXCPLStatus_DisabledAndDeleted");
    goto LABEL_326;
  }
  if (v165 == 1)
  {
    v166 = CFSTR("PXCPLStatus_DisabledAndDeleted_Short");
LABEL_326:
    _PXCPLUIStatusLocalizedString(v166);
    v192 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_328;
  }
  v192 = 0;
LABEL_328:
  v177 = PXCPLNumberOfCalendarUnitsUntilDate(16, v204);
  if (v177 < 1)
  {
    _PXCPLUIStatusLocalizedString(CFSTR("PXCPLStatus_DisabledAndDeleted_Soon"));
    v195 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v178 = (void *)v177;
    _PXCPLUIStatusLocalizedString(CFSTR("PXCPLStatus_DisabledAndDeleted_NDays"));
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    v186 = v178;
    PXLocalizedStringWithValidatedFormat(v179, CFSTR("%lu"));
    v195 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v36 = 8;
  if (!v192)
  {
LABEL_260:
    if (!_HasUploadActivityInLastSeconds(480.0))
      goto LABEL_266;
    v139 = -[PXCPLUIStatusProvider presentationStyle](v205, "presentationStyle");
    if (v139)
    {
      if (v139 != 1)
        goto LABEL_266;
      v140 = CFSTR("PXCPLStatus_UploadComplete_Short");
    }
    else
    {
      v140 = CFSTR("PXCPLStatus_UploadComplete");
    }
    _PXCPLUIStatusLocalizedString(v140);
    v192 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v192)
      goto LABEL_290;
LABEL_266:
    -[PXCPLUIStatusProvider currentDateForTesting](v205, "currentDateForTesting", v186);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = v141;
    if (v141)
    {
      v143 = v141;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v143 = (id)objc_claimAutoreleasedReturnValue();

    }
    v144 = -[PXCPLUIStatusProvider presentationStyle](v205, "presentationStyle");
    v145 = v191;
    v146 = v143;
    v147 = v146;
    if (v145)
    {
      if (v146)
        goto LABEL_271;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *_PXCPLStatusLastUpdateDescription(NSDate *__strong, NSDate *__strong, BOOL)");
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v181, "handleFailureInFunction:file:lineNumber:description:", v182, CFSTR("PXCPLUIStatusProvider.m"), 414, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("lastSyncDate"));

      if (v147)
        goto LABEL_271;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *_PXCPLStatusLastUpdateDescription(NSDate *__strong, NSDate *__strong, BOOL)");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v183, "handleFailureInFunction:file:lineNumber:description:", v184, CFSTR("PXCPLUIStatusProvider.m"), 415, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("currentDate"));

LABEL_271:
    objc_msgSend(v147, "timeIntervalSinceDate:", v145);
    v149 = v148;
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v151 = PXCPLNumberOfCalendarUnitsBetweenDates(16, v145, v147, v150);
    if (v149 <= 60.0)
    {
      v155 = CFSTR("PXCPLStatus_JustNow");
      v156 = CFSTR("PXCPLStatus_JustNow_Short");
    }
    else
    {
      if (v149 < 3600.0)
      {
        v152 = vcvtmd_s64_f64(v149 / 60.0);
        if (v144 == 1)
          v153 = CFSTR("PXCPLStatus_LastUpdatedNMinutesAgo_Short");
        else
          v153 = CFSTR("PXCPLStatus_LastUpdatedNMinutesAgo");
        _PXCPLUIStatusLocalizedString(v153);
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        v186 = (void *)v152;
        PXLocalizedStringWithValidatedFormat(v154, CFSTR("%lu"));
        v192 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_288:

LABEL_289:
        goto LABEL_290;
      }
      v158 = v151;
      if (v151 != 1)
      {
        if (v151)
        {
          v170 = (void *)objc_opt_new();
          v171 = v170;
          if (v158 > 6)
          {
            objc_msgSend(v170, "setTimeStyle:", 0);
            objc_msgSend(v171, "setDateStyle:", 2);
            if (v144 == 1)
              v180 = CFSTR("PXCPLStatus_Date_Short");
            else
              v180 = CFSTR("PXCPLStatus_Date");
            _PXCPLUIStatusLocalizedString(v180);
            v174 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v171, "stringFromDate:", v145);
            v176 = (void *)objc_claimAutoreleasedReturnValue();
            v186 = v176;
            PXLocalizedStringWithValidatedFormat(v174, CFSTR("%@"));
            v192 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v172 = (void *)MEMORY[0x1E0CB3578];
            objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
            v173 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v172, "dateFormatFromTemplate:options:locale:", CFSTR("EEEE"), 0, v173);
            v174 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v171, "setDateFormat:", v174);
            if (v144 == 1)
              v175 = CFSTR("PXCPLStatus_Weekday_Short");
            else
              v175 = CFSTR("PXCPLStatus_Weekday");
            _PXCPLUIStatusLocalizedString(v175);
            v176 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v171, "stringFromDate:", v145);
            v186 = (void *)objc_claimAutoreleasedReturnValue();
            PXLocalizedStringWithValidatedFormat(v176, CFSTR("%@"));
            v192 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_289;
        }
        v154 = (void *)objc_opt_new();
        objc_msgSend(v154, "setTimeStyle:", 1);
        objc_msgSend(v154, "setDateStyle:", 0);
        if (v144 == 1)
          v159 = CFSTR("PXCPLStatus_AtTime_Short");
        else
          v159 = CFSTR("PXCPLStatus_AtTime");
        _PXCPLUIStatusLocalizedString(v159);
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v154, "stringFromDate:", v145);
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        PXLocalizedStringWithValidatedFormat(v160, CFSTR("%@"));
        v192 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_288;
      }
      v155 = CFSTR("PXCPLStatus_Yesterday");
      v156 = CFSTR("PXCPLStatus_Yesterday_Short");
    }
    if (v144 == 1)
      v157 = (__CFString *)v156;
    else
      v157 = (__CFString *)v155;
    _PXCPLUIStatusLocalizedString(v157);
    v192 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_289;
  }
LABEL_290:
  v161 = v193;
  if (v195)
    v161 = 0;
  if (v161 == 1)
  {
    v162 = v192;
    PXLocalizedStringFromTable(CFSTR("PXCPLStatusUpgradeSuggestedToAccessAllPhotos"), CFSTR("PhotosUICore"));
    v192 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v195 = v162;

    v36 = 11;
  }
  v24 = -1.0;
  if (v195)
    goto LABEL_309;
  if (objc_msgSend(v5, "isRebuildingThumbnails"))
  {
    PXLocalizedStringFromTable(CFSTR("PXCPLStatusRebuildingThumbnails"), CFSTR("PhotosUICore"));
    v195 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v195 = 0;
  }
  if (!v195 && v194)
  {
    v163 = -[PXCPLUIStatusProvider presentationStyle](v205, "presentationStyle");
    if (v163)
    {
      if (v163 != 1)
        goto LABEL_311;
      v164 = CFSTR("PXCPLStatus_Push_Failed_NItems_Short");
    }
    else
    {
      v164 = CFSTR("PXCPLStatus_Push_Failed_NItems");
    }
    _PXCPLUIStatusLocalizedString(v164);
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    v186 = (void *)v194;
    PXLocalizedStringWithValidatedFormat(v167, CFSTR("%lu"));
    v195 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  if (v195)
  {
LABEL_309:
    v209 = 0;
    v197 = 0;
    v189 = 0;
    goto LABEL_310;
  }
LABEL_311:
  objc_msgSend(v5, "cloudQuotaCustomTitle", v186);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v168)
  {
    if (objc_msgSend(v5, "cloudQuotaState") == 1)
    {
      v169 = CFSTR("PXCPLStatusCloudStorageAlmostFull");
    }
    else
    {
      if (objc_msgSend(v5, "cloudQuotaState") != 2)
      {
        v43 = 0;
        v209 = 0;
        v197 = 0;
        v195 = 0;
        goto LABEL_342;
      }
      v169 = CFSTR("PXCPLStatusCloudStorageFull");
    }
    PXLocalizedStringFromTable(v169, CFSTR("PhotosUICore"));
    v195 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    v209 = 0;
    v197 = 0;
LABEL_342:
    v189 = 0;
    goto LABEL_343;
  }
  v43 = v168;
  v209 = 0;
  v197 = 0;
  v189 = 0;
  v195 = v43;
LABEL_343:
  v39 = v205;
  LOBYTE(v40) = v206;
LABEL_93:

LABEL_94:
  v7 = objc_alloc_init(PXCPLUIStatus);
  -[PXCPLUIStatusProvider actionManager](v39, "actionManager");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = 0;
  v202 = (void *)v36;
  v52 = 0;
  if (!v36)
  {
    v53 = 0;
    v54 = 0;
    goto LABEL_118;
  }
  v53 = 0;
  v54 = 0;
  if (!v50)
    goto LABEL_118;
  objc_msgSend(v5, "cloudQuotaCustomActionTitle");
  v55 = (id)objc_claimAutoreleasedReturnValue();
  v56 = v55;
  v57 = v202;
  switch((unint64_t)v202)
  {
    case 1uLL:
      _PXCPLUIStatusLocalizedString(CFSTR("PXCPLStatusActionPause_Title"));
      v51 = objc_claimAutoreleasedReturnValue();

      if (v207 < 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _PXCPLStatusPauseActionConfirmationAlertTitles(PXCPLStatusActivity, NSString *__autoreleasing *, NSString *__autoreleasing *, NSString *__autoreleasing *)");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        v133 = v131;
        v134 = v132;
        v135 = 473;
LABEL_324:
        objc_msgSend(v133, "handleFailureInFunction:file:lineNumber:description:", v134, CFSTR("PXCPLUIStatusProvider.m"), v135, CFSTR("Code which should be unreachable has been reached"), v186, v188);

        abort();
      }
      _PXCPLUIStatusLocalizedString(CFSTR("PXCPLStatus_Pause_AlertTitle_iOS"));
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      _PXCPLUIStatusLocalizedString(CFSTR("PXCPLStatus_Pause_AlertButtonTitle"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_retainAutorelease(v58);
      v61 = objc_retainAutorelease(v59);

      v62 = v60;
      v63 = v61;
      v52 = v62;
      v53 = v63;
LABEL_117:
      objc_initWeak((id *)location, v39);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __42__PXCPLUIStatusProvider__statusDidChange___block_invoke;
      aBlock[3] = &unk_1E5144A70;
      objc_copyWeak(v217, (id *)location);
      v217[1] = v57;
      v54 = _Block_copy(aBlock);
      objc_destroyWeak(v217);
      objc_destroyWeak((id *)location);
LABEL_118:
      if ((objc_msgSend(v5, "isLocalModeEnabled", v186, v188) & 1) != 0)
      {
        v73 = CFSTR("Local Mode Enabled");
      }
      else if (objc_msgSend(v5, "isMockStatus"))
      {
        v73 = CFSTR("Mock Status");
      }
      else
      {
        v73 = 0;
      }
      if (v9 == -1.0)
        v74 = v40;
      else
        v74 = 1;
      if ((v74 & 1) != 0 || !v203)
      {
        countsController = v39->_countsController;
        if (countsController)
        {
          -[PXAssetsDataSourceCountsController counts](countsController, "counts");
          v79 = v213;
          v80 = 0x7FFFFFFFFFFFFFFFLL;
          if (v213 == 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_136;
          v81 = v214;
          v82 = v215;
        }
        else
        {
          v82 = 0;
          v81 = 0;
          v79 = 0;
          v213 = 0;
          v214 = 0;
          v215 = 0;
        }
        v80 = 0x7FFFFFFFFFFFFFFFLL;
        if (v81 != 0x7FFFFFFFFFFFFFFFLL && v82 != 0x7FFFFFFFFFFFFFFFLL)
          v80 = v81 + v79 + v82;
LABEL_136:
        objc_msgSend(v5, "fractionCompletedForLibraryRebuild");
        v84 = v83;
        v85 = v199 + v200 + v198;
        v86 = -1.0;
        if (v85 != 0x7FFFFFFFFFFFFFFFLL && v80 != 0x7FFFFFFFFFFFFFFFLL && v80 && v85 && v85 != v80)
        {
          if (v85 > v80)
          {
            v87 = (float)v80;
            v88 = (float)v85;
          }
          else
          {
            v87 = (float)v85;
            v88 = (float)v80;
          }
          v86 = v87 / v88;
        }
        if (v197 >= 2)
        {
          if ((v40 & 1) != 0)
          {
            v75 = v52;
            v76 = (void *)v51;
            v89 = CFSTR("PXCPLStatus_Rebuild_Paused_Short");
            goto LABEL_168;
          }
          if (v203
            || (+[PXFooterSettings sharedInstance](PXFooterSettings, "sharedInstance"),
                v108 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v108, "minimumDisplayedProgress"),
                v110 = v109,
                v108,
                v86 > 0.99)
            || v86 < v110)
          {
            v75 = v52;
            v76 = (void *)v51;
            if (v9 == -1.0
              || (+[PXFooterSettings sharedInstance](PXFooterSettings, "sharedInstance"),
                  v96 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v96, "minimumDisplayedProgress"),
                  v98 = v97,
                  v96,
                  v84 > 0.99)
              || v98 > v84)
            {
              v89 = CFSTR("PXCPLStatus_Sync_Paused_Short");
              goto LABEL_168;
            }
            v100 = (void *)MEMORY[0x1E0CB37F0];
            v101 = (void *)MEMORY[0x1E0CB37E8];
            *(float *)&v99 = v84;
          }
          else
          {
            v75 = v52;
            v76 = (void *)v51;
            v100 = (void *)MEMORY[0x1E0CB37F0];
            v101 = (void *)MEMORY[0x1E0CB37E8];
            *(float *)&v99 = v86;
          }
          objc_msgSend(v101, "numberWithFloat:", v99);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "localizedStringFromNumber:numberStyle:", v111, 3);
          v106 = (void *)objc_claimAutoreleasedReturnValue();

          v107 = CFSTR("PXCPLStatus_SyncingPausedPercent");
        }
        else
        {
          if ((v40 & 1) != 0)
          {
            v75 = v52;
            v76 = (void *)v51;
            v89 = CFSTR("PXCPLStatus_Rebuild_Short");
LABEL_168:
            _PXCPLUIStatusLocalizedString(v89);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_176;
          }
          if (v203
            || (+[PXFooterSettings sharedInstance](PXFooterSettings, "sharedInstance"),
                v102 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v102, "minimumDisplayedProgress"),
                v104 = v103,
                v102,
                v86 > 0.99)
            || v86 < v104)
          {
            v75 = v52;
            v76 = (void *)v51;
            if (v9 == -1.0
              || (+[PXFooterSettings sharedInstance](PXFooterSettings, "sharedInstance"),
                  v90 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v90, "minimumDisplayedProgress"),
                  v92 = v91,
                  v90,
                  v84 > 0.99)
              || v92 > v84)
            {
              v89 = CFSTR("PXCPLStatus_Sync_Short");
              goto LABEL_168;
            }
            v94 = (void *)MEMORY[0x1E0CB37F0];
            v95 = (void *)MEMORY[0x1E0CB37E8];
            *(float *)&v93 = v84;
          }
          else
          {
            v75 = v52;
            v76 = (void *)v51;
            v94 = (void *)MEMORY[0x1E0CB37F0];
            v95 = (void *)MEMORY[0x1E0CB37E8];
            *(float *)&v93 = v86;
          }
          objc_msgSend(v95, "numberWithFloat:", v93);
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "localizedStringFromNumber:numberStyle:", v105, 3);
          v106 = (void *)objc_claimAutoreleasedReturnValue();

          v107 = CFSTR("PXCPLStatus_SyncingPercent");
        }
        _PXCPLUIStatusLocalizedString(v107);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v187 = v106;
        PXLocalizedStringWithValidatedFormat(v112, CFSTR("%@"));
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_176;
      }
      v75 = v52;
      v76 = (void *)v51;
      v77 = 0;
LABEL_176:
      LODWORD(v72) = -1.0;
      -[PXCPLUIStatus setStateDescription:](v7, "setStateDescription:", v192, v72, v187);
      -[PXCPLUIStatus setStartSyncDescription:](v7, "setStartSyncDescription:", v77);
      -[PXCPLUIStatus setFailureDescription:](v7, "setFailureDescription:", v195);
      -[PXCPLUIStatus setInternalInformationMessage:](v7, "setInternalInformationMessage:", v73);
      -[PXCPLUIStatus setPaused:](v7, "setPaused:", v189);
      *(float *)&v113 = v24;
      -[PXCPLUIStatus setProgress:](v7, "setProgress:", v113);
      -[PXCPLUIStatus setActionTitle:](v7, "setActionTitle:", v76);
      -[PXCPLUIStatus setActionConfirmationAlertTitle:](v7, "setActionConfirmationAlertTitle:", v75);
      -[PXCPLUIStatus setActionConfirmationAlertSubtitle:](v7, "setActionConfirmationAlertSubtitle:", 0);
      -[PXCPLUIStatus setActionConfirmationAlertButtonTitle:](v7, "setActionConfirmationAlertButtonTitle:", v53);
      -[PXCPLUIStatus setAction:](v7, "setAction:", v54);
      -[PXCPLUIStatus setReferencedItemsDescription:](v7, "setReferencedItemsDescription:", v190);
      -[PXCPLUIStatus setState:](v7, "setState:", v197);
      -[PXCPLUIStatus setActivity:](v7, "setActivity:", v207);
      -[PXCPLUIStatus setPauseReason:](v7, "setPauseReason:", v209);
      -[PXCPLUIStatus setServiceAction:](v7, "setServiceAction:", v202);
      -[PXCPLUIStatus setInResetSync:](v7, "setInResetSync:", v206);
      -[PXCPLUIStatus setIsRestoringLibrary:](v7, "setIsRestoringLibrary:", v9 != -1.0);
      -[PXCPLUIStatus setHasCompletedInitialSync:](v7, "setHasCompletedInitialSync:", v203 != 0);
      -[PXCPLUIStatus setIsExiting:](v7, "setIsExiting:", v204 != 0);
      -[PXCPLUIStatus setNumberOfItemsFailingToUpload:](v7, "setNumberOfItemsFailingToUpload:", v194);
      -[PXCPLUIStatus setIsUpgradeSuggestedToAccessAllPhotos:](v7, "setIsUpgradeSuggestedToAccessAllPhotos:", v193);
      -[PXCPLUIStatus setNumberOfPhotoAssets:](v7, "setNumberOfPhotoAssets:", v200);
      -[PXCPLUIStatus setNumberOfVideoAssets:](v7, "setNumberOfVideoAssets:", v199);
      -[PXCPLUIStatus setNumberOfOtherAssets:](v7, "setNumberOfOtherAssets:", v198);

      self = v205;
      v5 = v196;
LABEL_177:
      v114 = PXCPLUIStatusDiff(self->_status, v7);
      if (v114)
      {
        v115 = v114;
        v210[0] = MEMORY[0x1E0C809B0];
        v210[1] = 3221225472;
        v210[2] = __42__PXCPLUIStatusProvider__statusDidChange___block_invoke_2;
        v210[3] = &unk_1E5144A98;
        v210[4] = self;
        v211 = v7;
        v212 = v115;
        -[PXCPLUIStatusProvider performChanges:](self, "performChanges:", v210);

      }
      else
      {
        PLUserStatusGetLog();
        v116 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)location = 138412546;
          *(_QWORD *)&location[4] = self;
          v219 = 2112;
          v220 = v7;
          _os_log_impl(&dword_1A6789000, v116, OS_LOG_TYPE_DEBUG, "%@ Suppressing update that resulted in no change: %@", location, 0x16u);
        }

      }
      return;
    case 2uLL:
      if (((1 << v209) & 0x5C0F0) != 0)
      {
        v65 = CFSTR("PXCPLStatusActionSyncNow_Title");
      }
      else
      {
        if (v209 != 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nullable _PXCPLStatusResumeActionTitle(PXCPLStatusPauseReason)");
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          v133 = v131;
          v134 = v132;
          v135 = 694;
          goto LABEL_324;
        }
        v65 = CFSTR("PXCPLStatusActionResume_Title");
      }
      _PXCPLUIStatusLocalizedString(v65);
      v66 = objc_claimAutoreleasedReturnValue();

      -[PXCPLStatusProvider nextOverrideResumeTimeInterval](v39->_statusProvider, "nextOverrideResumeTimeInterval");
      v68 = vcvtad_u64_f64(v67 / 3600.0);
      if (v68 > 11)
      {
        v69 = v209;
        if (v68 == 12)
        {
          v70 = 2;
          goto LABEL_190;
        }
        if (v68 == 24)
        {
          v70 = 3;
          goto LABEL_190;
        }
      }
      else
      {
        v69 = v209;
        if (v68 == 1)
        {
          v70 = 0;
          goto LABEL_190;
        }
        if (v68 == 4)
        {
          v70 = 1;
          goto LABEL_190;
        }
      }
      v70 = 4;
LABEL_190:
      v117 = 0;
      v118 = CFSTR("PXCPLStatus_Resume_Update_Battery_AlertTitle_Description");
      switch(v69)
      {
        case 0:
        case 2:
        case 3:
        case 8:
        case 9:
        case 10:
        case 11:
        case 12:
        case 13:
        case 17:
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *_PXCPLStatusResumeActionConfirmationAlertMessage(PXCPLStatusPauseReason, PXCPLUIStatusProviderResumeTime)");
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          v133 = v131;
          v134 = v132;
          v135 = 556;
          goto LABEL_324;
        case 4:
          goto LABEL_202;
        case 5:
          v118 = CFSTR("PXCPLStatus_Resume_Update_Cellular_AlertTitle_Description");
          goto LABEL_202;
        case 6:
          v118 = CFSTR("PXCPLStatus_Resume_Update_LowDataMode_AlertTitle_Description");
          goto LABEL_202;
        case 7:
          v118 = CFSTR("PXCPLStatus_Resume_Update_LowPowerMode_AlertTitle_Description");
          goto LABEL_202;
        case 14:
          v118 = CFSTR("PXCPLStatus_Resume_Update_OptimizingSystemPerformance_AlertTitle_Description");
          goto LABEL_202;
        case 15:
          v118 = CFSTR("PXCPLStatus_Resume_Update_PoorNetworkConnection_AlertTitle_Description");
          goto LABEL_202;
        case 16:
          v118 = CFSTR("PXCPLStatus_Resume_Update_ThermalPressure_AlertTitle_Description");
          goto LABEL_202;
        case 18:
          v118 = CFSTR("PXCPLStatus_Resume_Update_LowBattery_AlertTitle_Description");
LABEL_202:
          _PXCPLUIStatusLocalizedString(v118);
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          break;
        default:
          break;
      }
      _PXCPLUIStatusLocalizedString(off_1E5144AB8[v70]);
      v121 = objc_claimAutoreleasedReturnValue();
      v122 = (void *)v121;
      v123 = 0;
      if (v117 && v121)
      {
        _PXCPLUIStatusLocalizedString(CFSTR("PXCPLStatus_Resume_Update_TitleFormat"));
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        v186 = v117;
        v188 = v122;
        PXStringWithValidatedFormat();
        v123 = (void *)objc_claimAutoreleasedReturnValue();

        v57 = v202;
      }

      v125 = 0;
      if (((1 << v209) & 0x5C0F0) != 0)
      {
        v126 = v123;
        _PXCPLUIStatusLocalizedString(CFSTR("PXCPLStatus_Resume_AlertButtonTitle_iOS"));
        v125 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v126 = 0;
        if (((1 << v209) & 0x23F01) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _PXCPLStatusResumeActionConfirmationAlertTitles(PXCPLStatusPauseReason, PXCPLUIStatusProviderResumeTime, NSString *__autoreleasing *, NSString *__autoreleasing *, NSString *__autoreleasing *)");
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          v133 = v131;
          v134 = v132;
          v135 = 515;
          goto LABEL_324;
        }
      }
      v127 = objc_retainAutorelease(v126);
      v128 = objc_retainAutorelease(v125);

      v129 = v127;
      v130 = v128;
      v52 = v129;
      v53 = v130;
      v51 = v66;
      v5 = v196;
      goto LABEL_117;
    case 3uLL:
      v64 = CFSTR("PXCPLStatusActionManageCloudStorage_Title");
      goto LABEL_114;
    case 4uLL:
      v64 = CFSTR("PXCPLStatusActionManageLocalStorage_Title");
      goto LABEL_114;
    case 5uLL:
      v64 = CFSTR("PXCPLStatusActionManageCellularDataDisabled_Title");
      goto LABEL_114;
    case 6uLL:
      v64 = CFSTR("PXCPLStatusActionManageAirplaneMode_Title");
      goto LABEL_114;
    case 7uLL:
      v64 = CFSTR("PXCPLStatusActionViewItemsFailingToUpload_Title");
      goto LABEL_114;
    case 8uLL:
      v64 = CFSTR("PXCPLStatusActionManageExitMode_Title");
      goto LABEL_114;
    case 9uLL:
      v64 = CFSTR("PXCPLStatusActionLearnMoreClientVersionTooOld_Title");
      goto LABEL_114;
    case 0xAuLL:
      v64 = CFSTR("PXCPLStatusActionManageClientAuthentication_Title");
LABEL_114:
      _PXCPLUIStatusLocalizedString(v64);
      v71 = objc_claimAutoreleasedReturnValue();
      goto LABEL_115;
    case 0xBuLL:
      PXLocalizedStringFromTable(CFSTR("PXCPLStatusActionLearnMoreUpgradeSuggested_Title"), CFSTR("PhotosUICore"));
      v71 = objc_claimAutoreleasedReturnValue();
LABEL_115:
      v51 = v71;

      goto LABEL_116;
    default:

      v51 = 0;
LABEL_116:
      v52 = 0;
      v53 = 0;
      goto LABEL_117;
  }
}

- (void)_updateStatusProviderMonitor
{
  PXCPLStatusProvider *v3;
  PXCPLStatusProvider *statusProvider;

  -[PXCPLStatusProvider unregisterChangeObserver:context:](self->_statusProvider, "unregisterChangeObserver:context:", self, PXCPLStatusProviderObservationContext);
  -[PXCPLStatusProviderMonitor statusProvider](self->_statusProviderMonitor, "statusProvider");
  v3 = (PXCPLStatusProvider *)objc_claimAutoreleasedReturnValue();
  statusProvider = self->_statusProvider;
  self->_statusProvider = v3;

  -[PXCPLStatusProvider registerChangeObserver:context:](self->_statusProvider, "registerChangeObserver:context:", self, PXCPLStatusProviderObservationContext);
  -[PXCPLUIStatusProvider _updateStatus](self, "_updateStatus");
}

- (void)_updateStatus
{
  id v3;

  -[PXCPLStatusProvider status](self->_statusProvider, "status");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXCPLUIStatusProvider _statusDidChange:](self, "_statusDidChange:", v3);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)PXCPLStatusProviderMonitorObservationContext == a5)
  {
    v11 = v9;
    -[PXCPLUIStatusProvider _updateStatusProviderMonitor](self, "_updateStatusProviderMonitor");
    goto LABEL_7;
  }
  if ((void *)PXCPLStatusProviderObservationContext == a5)
    goto LABEL_5;
  if ((void *)PXAssetsDataSourceCountsControllerObserverContext_281235 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCPLUIStatusProvider.m"), 1238, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
LABEL_5:
    v11 = v9;
    -[PXCPLUIStatusProvider _updateStatus](self, "_updateStatus");
LABEL_7:
    v9 = v11;
  }

}

- (PXCPLUIStatus)status
{
  return self->_status;
}

- (PXCPLActionManager)actionManager
{
  return self->_actionManager;
}

- (unint64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (NSDate)currentDateForTesting
{
  return self->_currentDateForTesting;
}

- (void)setCurrentDateForTesting:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDateForTesting, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_countsController, 0);
  objc_storeStrong((id *)&self->_statusProvider, 0);
  objc_storeStrong((id *)&self->_statusProviderMonitor, 0);
}

void __42__PXCPLUIStatusProvider__statusDidChange___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  void *v5;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "actionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performAction:forCPLUIStatus:", *(_QWORD *)(a1 + 40), v4);

}

uint64_t __42__PXCPLUIStatusProvider__statusDidChange___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 120), *(id *)(a1 + 40));
  PLUserStatusGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(v3 + 120);
    v6 = 138543618;
    v7 = v3;
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ >> %{public}@", (uint8_t *)&v6, 0x16u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "signalChange:", *(_QWORD *)(a1 + 48));
}

@end
