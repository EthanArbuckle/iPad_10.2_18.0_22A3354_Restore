@implementation PXCPLStatus

- (id)_initWithDictionaryRepresentation:(id)a3 currentDate:(id)a4
{
  id v7;
  id v8;
  PXCPLStatus *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  uint64_t v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  uint64_t v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  id v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  id v120;
  void *v121;
  void *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  uint64_t v126;
  void *v127;
  void *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  uint64_t v132;
  void *v133;
  void *v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  void *v138;
  void *v139;
  uint64_t v140;
  void *v141;
  void *v142;
  uint64_t v143;
  void *v144;
  void *v145;
  uint64_t v146;
  void *v147;
  void *v148;
  uint64_t v149;
  void *v150;
  void *v151;
  uint64_t v152;
  void *v153;
  void *v154;
  uint64_t v155;
  PXCPLStatus *v156;
  void *v158;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v158, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCPLStatus_Serialization.m"), 298, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dictionaryRepresentation"));

  }
  v9 = -[PXCPLStatus init](self, "init");

  if (v9)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("enabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      v12 = objc_msgSend(v10, "BOOLValue");
    else
      v12 = 0;
    -[PXCPLStatus setIsEnabled:](v9, "setIsEnabled:", v12);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("rebuild"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13 && (objc_msgSend(v13, "isEqualToString:", CFSTR("-")) & 1) == 0)
      v15 = objc_msgSend(v14, "integerValue");
    else
      v15 = -1;
    -[PXCPLStatus setPercentCompletedForLibraryRebuild:](v9, "setPercentCompletedForLibraryRebuild:", v15);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("thumbnails"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
      v18 = objc_msgSend(v16, "BOOLValue");
    else
      v18 = 0;
    -[PXCPLStatus setIsRebuildingThumbnails:](v9, "setIsRebuildingThumbnails:", v18);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("syncing"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
      v21 = objc_msgSend(v19, "BOOLValue");
    else
      v21 = 0;
    -[PXCPLStatus setIsSyncing:](v9, "setIsSyncing:", v21);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("upload"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
      v24 = objc_msgSend(v22, "integerValue");
    else
      v24 = 0;
    -[PXCPLStatus setNumberOfItemsToUpload:](v9, "setNumberOfItemsToUpload:", v24);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("progress"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25 && (objc_msgSend(v25, "isEqualToString:", CFSTR("-")) & 1) == 0)
      v27 = objc_msgSend(v26, "integerValue");
    else
      v27 = -1;
    -[PXCPLStatus setPercentCompletedForUpload:](v9, "setPercentCompletedForUpload:", v27);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("add"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28)
      v30 = objc_msgSend(v28, "integerValue");
    else
      v30 = 0;
    -[PXCPLStatus setNumberOfItemsToAdd:](v9, "setNumberOfItemsToAdd:", v30);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("download"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v31)
      v33 = objc_msgSend(v31, "integerValue");
    else
      v33 = 0;
    -[PXCPLStatus setNumberOfOriginalsToDownload:](v9, "setNumberOfOriginalsToDownload:", v33);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("offline"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v34)
      v36 = objc_msgSend(v34, "BOOLValue");
    else
      v36 = 0;
    -[PXCPLStatus setIsOffline:](v9, "setIsOffline:", v36);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("soft-reset"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v37)
      v39 = objc_msgSend(v37, "BOOLValue");
    else
      v39 = 0;
    -[PXCPLStatus setIsInSoftResetSync:](v9, "setIsInSoftResetSync:", v39);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("hard-reset"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (v40)
      v42 = objc_msgSend(v40, "BOOLValue");
    else
      v42 = 0;
    -[PXCPLStatus setIsInHardResetSync:](v9, "setIsInHardResetSync:", v42);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("cloud-quota"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (v43)
      v45 = objc_msgSend(v43, "BOOLValue");
    else
      v45 = 0;
    -[PXCPLStatus setIsExceedingQuota:](v9, "setIsExceedingQuota:", v45);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("offer"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v46;
    if (v46)
      v48 = objc_msgSend(v46, "BOOLValue");
    else
      v48 = 0;
    -[PXCPLStatus setHasCloudQuotaOffer:](v9, "setHasCloudQuotaOffer:", v48);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("quota-state"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v49, "isEqualToString:", CFSTR("almost-full")) & 1) != 0)
    {
      v50 = 1;
    }
    else if (objc_msgSend(v49, "isEqualToString:", CFSTR("full")))
    {
      v50 = 2;
    }
    else
    {
      v50 = 0;
    }
    -[PXCPLStatus setCloudQuotaState:](v9, "setCloudQuotaState:", v50);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("quota-custom-title"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v51, "length") && (objc_msgSend(v51, "isEqualToString:", CFSTR("-")) & 1) == 0)
      v52 = v51;
    else
      v52 = 0;
    -[PXCPLStatus setCloudQuotaCustomTitle:](v9, "setCloudQuotaCustomTitle:", v52);
    v53 = v52;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("quota-custom-message"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v54, "length") && (objc_msgSend(v54, "isEqualToString:", CFSTR("-")) & 1) == 0)
      v55 = v54;
    else
      v55 = 0;
    -[PXCPLStatus setCloudQuotaCustomMessage:](v9, "setCloudQuotaCustomMessage:", v55);
    v56 = v55;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("quota-custom-action-title"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v57, "length") && (objc_msgSend(v57, "isEqualToString:", CFSTR("-")) & 1) == 0)
      v58 = v57;
    else
      v58 = 0;
    -[PXCPLStatus setCloudQuotaCustomActionTitle:](v9, "setCloudQuotaCustomActionTitle:", v58);
    v59 = v58;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("low-disk-space"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v60;
    if (v60)
      v62 = objc_msgSend(v60, "BOOLValue");
    else
      v62 = 0;
    -[PXCPLStatus setIsLowDiskSpace:](v9, "setIsLowDiskSpace:", v62);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("very-low-disk-space"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v63;
    if (v63)
      v65 = objc_msgSend(v63, "BOOLValue");
    else
      v65 = 0;
    -[PXCPLStatus setIsVeryLowDiskSpace:](v9, "setIsVeryLowDiskSpace:", v65);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("battery-budget"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v66;
    if (v66)
      v68 = objc_msgSend(v66, "BOOLValue");
    else
      v68 = 0;
    -[PXCPLStatus setIsExceedingBatteryQuota:](v9, "setIsExceedingBatteryQuota:", v68);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("cellular-budget"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v69;
    if (v69)
      v71 = objc_msgSend(v69, "BOOLValue");
    else
      v71 = 0;
    -[PXCPLStatus setIsExceedingCellularQuota:](v9, "setIsExceedingCellularQuota:", v71);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("cellular-disabled"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v72;
    if (v72)
      v74 = objc_msgSend(v72, "BOOLValue");
    else
      v74 = 0;
    -[PXCPLStatus setIsCellularDataDisabled:](v9, "setIsCellularDataDisabled:", v74);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("airplane-mode"));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v75;
    if (v75)
      v77 = objc_msgSend(v75, "BOOLValue");
    else
      v77 = 0;
    -[PXCPLStatus setIsInAirplaneMode:](v9, "setIsInAirplaneMode:", v77);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("user"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v78;
    if (v78)
      v80 = objc_msgSend(v78, "BOOLValue");
    else
      v80 = 0;
    -[PXCPLStatus setIsUserPaused:](v9, "setIsUserPaused:", v80);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("low-data-mode"));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v81;
    if (v81)
      v83 = objc_msgSend(v81, "BOOLValue");
    else
      v83 = 0;
    -[PXCPLStatus setIsInLowDataMode:](v9, "setIsInLowDataMode:", v83);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("low-power-mode"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v84;
    if (v84)
      v86 = objc_msgSend(v84, "BOOLValue");
    else
      v86 = 0;
    -[PXCPLStatus setIsInLowPowerMode:](v9, "setIsInLowPowerMode:", v86);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("version"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v87;
    if (v87)
      v89 = objc_msgSend(v87, "BOOLValue");
    else
      v89 = 0;
    -[PXCPLStatus setIsClientVersionTooOld:](v9, "setIsClientVersionTooOld:", v89);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("authenticate"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = v90;
    if (v90)
      v92 = objc_msgSend(v90, "BOOLValue");
    else
      v92 = 0;
    -[PXCPLStatus setIsClientNotAuthenticated:](v9, "setIsClientNotAuthenticated:", v92);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("capture-snapshot"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = v93;
    if (v93)
      v95 = objc_msgSend(v93, "BOOLValue");
    else
      v95 = 0;
    -[PXCPLStatus setIsCapturingSnapshot:](v9, "setIsCapturingSnapshot:", v95);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("optimizing-system-performance"));
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = v96;
    if (v96)
      v98 = objc_msgSend(v96, "BOOLValue");
    else
      v98 = 0;
    -[PXCPLStatus setIsOptimizingSystemPerformance:](v9, "setIsOptimizingSystemPerformance:", v98);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("poor-network-connection"));
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = v99;
    if (v99)
      v101 = objc_msgSend(v99, "BOOLValue");
    else
      v101 = 0;
    -[PXCPLStatus setIsInPoorNetworkConnection:](v9, "setIsInPoorNetworkConnection:", v101);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("moderate-thermal-pressure"));
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = v102;
    if (v102)
      v104 = objc_msgSend(v102, "BOOLValue");
    else
      v104 = 0;
    -[PXCPLStatus setIsInModerateThermalPressure:](v9, "setIsInModerateThermalPressure:", v104);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("heavy-thermal-pressure"));
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v105;
    if (v105)
      v107 = objc_msgSend(v105, "BOOLValue");
    else
      v107 = 0;
    -[PXCPLStatus setIsInHeavyThermalPressure:](v9, "setIsInHeavyThermalPressure:", v107);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("low-battery"));
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = v108;
    if (v108)
      v110 = objc_msgSend(v108, "BOOLValue");
    else
      v110 = 0;
    -[PXCPLStatus setIsInLowBattery:](v9, "setIsInLowBattery:", v110);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sync-date"));
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = v111;
    if (v111 && (objc_msgSend(v111, "isEqualToString:", CFSTR("-")) & 1) == 0)
    {
      _DateForPlaceholderString(v112, v8);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v113)
      {
        _SerializationDateFormatter();
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "dateFromString:", v112);
        v113 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v113 = 0;
    }
    -[PXCPLStatus setSyncDate:](v9, "setSyncDate:", v113);
    v115 = v113;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("exit-date"));
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = v116;
    if (v116 && (objc_msgSend(v116, "isEqualToString:", CFSTR("-")) & 1) == 0)
    {
      _DateForPlaceholderString(v117, v8);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v118)
      {
        _SerializationDateFormatter();
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v119, "dateFromString:", v117);
        v118 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v118 = 0;
    }
    -[PXCPLStatus setExitDate:](v9, "setExitDate:", v118);
    v120 = v118;

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("failed"));
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = v121;
    if (v121)
      v123 = objc_msgSend(v121, "integerValue");
    else
      v123 = 0;
    -[PXCPLStatus setNumberOfItemsFailingToUpload:](v9, "setNumberOfItemsFailingToUpload:", v123);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("referenced"));
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = v124;
    if (v124)
      v126 = objc_msgSend(v124, "integerValue");
    else
      v126 = 0;
    -[PXCPLStatus setNumberOfReferencedItems:](v9, "setNumberOfReferencedItems:", v126);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("photos"));
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = v127;
    if (v127)
      v129 = objc_msgSend(v127, "integerValue");
    else
      v129 = 0;
    -[PXCPLStatus setNumberOfPhotoAssets:](v9, "setNumberOfPhotoAssets:", v129);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("videos"));
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = v130;
    if (v130)
      v132 = objc_msgSend(v130, "integerValue");
    else
      v132 = 0;
    -[PXCPLStatus setNumberOfVideoAssets:](v9, "setNumberOfVideoAssets:", v132);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("others"));
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    v134 = v133;
    if (v133)
      v135 = objc_msgSend(v133, "integerValue");
    else
      v135 = 0;
    -[PXCPLStatus setNumberOfOtherAssets:](v9, "setNumberOfOtherAssets:", v135);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("shared-library-state"));
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v136, "isEqualToString:", CFSTR("active")) & 1) != 0)
    {
      v137 = 1;
    }
    else if ((objc_msgSend(v136, "isEqualToString:", CFSTR("deleting")) & 1) != 0)
    {
      v137 = 2;
    }
    else if (objc_msgSend(v136, "isEqualToString:", CFSTR("leaving")))
    {
      v137 = 3;
    }
    else
    {
      v137 = 0;
    }
    -[PXCPLStatus setSharedLibraryState:](v9, "setSharedLibraryState:", v137);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("shared-library-exiting-count"));
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    v139 = v138;
    if (v138)
      v140 = objc_msgSend(v138, "integerValue");
    else
      v140 = 0;
    -[PXCPLStatus setSharedLibraryExitingWithNumberOfAssetsRemaining:](v9, "setSharedLibraryExitingWithNumberOfAssetsRemaining:", v140);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("move-to-shared"));
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = v141;
    if (v141)
      v143 = objc_msgSend(v141, "integerValue");
    else
      v143 = 0;
    -[PXCPLStatus setSharedLibraryMovingToShared:](v9, "setSharedLibraryMovingToShared:", v143);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("move-to-personal"));
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v145 = v144;
    if (v144)
      v146 = objc_msgSend(v144, "integerValue");
    else
      v146 = 0;
    -[PXCPLStatus setSharedLibraryMovingToPersonal:](v9, "setSharedLibraryMovingToPersonal:", v146);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("shared-library-cloud-quota"));
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    v148 = v147;
    if (v147)
      v149 = objc_msgSend(v147, "BOOLValue");
    else
      v149 = 0;
    -[PXCPLStatus setIsExceedingSharedLibraryQuota:](v9, "setIsExceedingSharedLibraryQuota:", v149);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("local-mode"));
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v151 = v150;
    if (v150)
      v152 = objc_msgSend(v150, "BOOLValue");
    else
      v152 = 0;
    -[PXCPLStatus setIsLocalModeEnabled:](v9, "setIsLocalModeEnabled:", v152);

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("upgrade-suggested"));
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    v154 = v153;
    if (v153)
      v155 = objc_msgSend(v153, "BOOLValue");
    else
      v155 = 0;
    -[PXCPLStatus setIsUpgradeSuggestedToAccessAllPhotos:](v9, "setIsUpgradeSuggestedToAccessAllPhotos:", v155);

  }
  v156 = v9;

  return v156;
}

- (id)_dictionaryRepresentation
{
  id v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int64_t v29;
  const __CFString *v30;
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
  unint64_t v57;
  void *v58;
  void *v59;
  unint64_t v60;
  void *v61;
  void *v62;
  unint64_t v63;
  void *v64;
  void *v65;
  unint64_t v66;
  void *v67;
  void *v68;
  unint64_t v69;
  void *v70;
  void *v71;
  unint64_t v72;
  unint64_t v73;
  void *v74;
  void *v75;
  unint64_t v76;
  void *v77;
  void *v78;
  unint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = -[PXCPLStatus isEnabled](self, "isEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("enabled"));

  v7 = -[PXCPLStatus percentCompletedForLibraryRebuild](self, "percentCompletedForLibraryRebuild");
  if (v7 != -1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("rebuild"));

  }
  if (-[PXCPLStatus isRebuildingThumbnails](self, "isRebuildingThumbnails"))
  {
    objc_msgSend(MEMORY[0x1E0C9AAB0], "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("thumbnails"));

  }
  if (-[PXCPLStatus isSyncing](self, "isSyncing"))
  {
    objc_msgSend(MEMORY[0x1E0C9AAB0], "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("syncing"));

  }
  v12 = -[PXCPLStatus numberOfItemsToUpload](self, "numberOfItemsToUpload");
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("upload"));

  }
  v15 = -[PXCPLStatus percentCompletedForUpload](self, "percentCompletedForUpload");
  if (v15 != -1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("progress"));

  }
  v18 = -[PXCPLStatus numberOfItemsToAdd](self, "numberOfItemsToAdd");
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("add"));

  }
  v21 = -[PXCPLStatus numberOfOriginalsToDownload](self, "numberOfOriginalsToDownload");
  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("download"));

  }
  if (-[PXCPLStatus isOffline](self, "isOffline"))
  {
    objc_msgSend(MEMORY[0x1E0C9AAB0], "stringValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("offline"));

  }
  if (-[PXCPLStatus isInSoftResetSync](self, "isInSoftResetSync"))
  {
    objc_msgSend(MEMORY[0x1E0C9AAB0], "stringValue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("soft-reset"));

  }
  if (-[PXCPLStatus isInHardResetSync](self, "isInHardResetSync"))
  {
    objc_msgSend(MEMORY[0x1E0C9AAB0], "stringValue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("hard-reset"));

  }
  if (-[PXCPLStatus isExceedingQuota](self, "isExceedingQuota"))
  {
    objc_msgSend(MEMORY[0x1E0C9AAB0], "stringValue");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("cloud-quota"));

  }
  if (-[PXCPLStatus hasCloudQuotaOffer](self, "hasCloudQuotaOffer"))
  {
    objc_msgSend(MEMORY[0x1E0C9AAB0], "stringValue");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("offer"));

  }
  v29 = -[PXCPLStatus cloudQuotaState](self, "cloudQuotaState");
  if (v29 == 1)
  {
    v30 = CFSTR("almost-full");
  }
  else
  {
    if (v29 != 2)
      goto LABEL_30;
    v30 = CFSTR("full");
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("quota-state"));
LABEL_30:
  -[PXCPLStatus cloudQuotaCustomTitle](self, "cloudQuotaCustomTitle");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("quota-custom-title"));

  -[PXCPLStatus cloudQuotaCustomMessage](self, "cloudQuotaCustomMessage");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v32, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("quota-custom-message"));

  -[PXCPLStatus cloudQuotaCustomActionTitle](self, "cloudQuotaCustomActionTitle");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("quota-custom-action-title"));

  if (-[PXCPLStatus isLowDiskSpace](self, "isLowDiskSpace"))
  {
    objc_msgSend(MEMORY[0x1E0C9AAB0], "stringValue");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v34, CFSTR("low-disk-space"));

  }
  if (-[PXCPLStatus isVeryLowDiskSpace](self, "isVeryLowDiskSpace"))
  {
    objc_msgSend(MEMORY[0x1E0C9AAB0], "stringValue");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("very-low-disk-space"));

  }
  if (-[PXCPLStatus isExceedingBatteryQuota](self, "isExceedingBatteryQuota"))
  {
    objc_msgSend(MEMORY[0x1E0C9AAB0], "stringValue");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("battery-budget"));

  }
  if (-[PXCPLStatus isExceedingCellularQuota](self, "isExceedingCellularQuota"))
  {
    objc_msgSend(MEMORY[0x1E0C9AAB0], "stringValue");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v37, CFSTR("cellular-budget"));

  }
  if (-[PXCPLStatus isCellularDataDisabled](self, "isCellularDataDisabled"))
  {
    objc_msgSend(MEMORY[0x1E0C9AAB0], "stringValue");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v38, CFSTR("cellular-disabled"));

  }
  if (-[PXCPLStatus isInAirplaneMode](self, "isInAirplaneMode"))
  {
    objc_msgSend(MEMORY[0x1E0C9AAB0], "stringValue");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("airplane-mode"));

  }
  if (-[PXCPLStatus isUserPaused](self, "isUserPaused"))
  {
    objc_msgSend(MEMORY[0x1E0C9AAB0], "stringValue");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("user"));

  }
  if (-[PXCPLStatus isInLowDataMode](self, "isInLowDataMode"))
  {
    objc_msgSend(MEMORY[0x1E0C9AAB0], "stringValue");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v41, CFSTR("low-data-mode"));

  }
  if (-[PXCPLStatus isInLowPowerMode](self, "isInLowPowerMode"))
  {
    objc_msgSend(MEMORY[0x1E0C9AAB0], "stringValue");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("low-power-mode"));

  }
  if (-[PXCPLStatus isClientVersionTooOld](self, "isClientVersionTooOld"))
  {
    objc_msgSend(MEMORY[0x1E0C9AAB0], "stringValue");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("version"));

  }
  if (-[PXCPLStatus isClientNotAuthenticated](self, "isClientNotAuthenticated"))
  {
    objc_msgSend(MEMORY[0x1E0C9AAB0], "stringValue");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("authenticate"));

  }
  if (-[PXCPLStatus isCapturingSnapshot](self, "isCapturingSnapshot"))
  {
    objc_msgSend(MEMORY[0x1E0C9AAB0], "stringValue");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v45, CFSTR("capture-snapshot"));

  }
  if (-[PXCPLStatus isOptimizingSystemPerformance](self, "isOptimizingSystemPerformance"))
  {
    objc_msgSend(MEMORY[0x1E0C9AAB0], "stringValue");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v46, CFSTR("optimizing-system-performance"));

  }
  if (-[PXCPLStatus isInPoorNetworkConnection](self, "isInPoorNetworkConnection"))
  {
    objc_msgSend(MEMORY[0x1E0C9AAB0], "stringValue");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v47, CFSTR("poor-network-connection"));

  }
  if (-[PXCPLStatus isInModerateThermalPressure](self, "isInModerateThermalPressure"))
  {
    objc_msgSend(MEMORY[0x1E0C9AAB0], "stringValue");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v48, CFSTR("moderate-thermal-pressure"));

  }
  if (-[PXCPLStatus isInHeavyThermalPressure](self, "isInHeavyThermalPressure"))
  {
    objc_msgSend(MEMORY[0x1E0C9AAB0], "stringValue");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v49, CFSTR("heavy-thermal-pressure"));

  }
  if (-[PXCPLStatus isInLowBattery](self, "isInLowBattery"))
  {
    objc_msgSend(MEMORY[0x1E0C9AAB0], "stringValue");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v50, CFSTR("low-battery"));

  }
  -[PXCPLStatus syncDate](self, "syncDate");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    _SerializationDateFormatter();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "stringFromDate:", v51);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v53, CFSTR("sync-date"));

  }
  -[PXCPLStatus exitDate](self, "exitDate");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    _SerializationDateFormatter();
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "stringFromDate:", v54);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v56, CFSTR("exit-date"));

  }
  v57 = -[PXCPLStatus numberOfItemsFailingToUpload](self, "numberOfItemsFailingToUpload");
  if (v57)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "stringValue");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v59, CFSTR("failed"));

  }
  v60 = -[PXCPLStatus numberOfReferencedItems](self, "numberOfReferencedItems");
  if (v60)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "stringValue");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v62, CFSTR("referenced"));

  }
  v63 = -[PXCPLStatus numberOfPhotoAssets](self, "numberOfPhotoAssets");
  if (v63)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "stringValue");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v65, CFSTR("photos"));

  }
  v66 = -[PXCPLStatus numberOfVideoAssets](self, "numberOfVideoAssets");
  if (v66)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "stringValue");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v68, CFSTR("videos"));

  }
  v69 = -[PXCPLStatus numberOfOtherAssets](self, "numberOfOtherAssets");
  if (v69)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "stringValue");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v71, CFSTR("others"));

  }
  v72 = -[PXCPLStatus sharedLibraryState](self, "sharedLibraryState") - 1;
  if (v72 <= 2)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", off_1E5129B78[v72], CFSTR("shared-library-state"));
  v73 = -[PXCPLStatus sharedLibraryExitingWithNumberOfAssetsRemaining](self, "sharedLibraryExitingWithNumberOfAssetsRemaining");
  if (v73)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "stringValue");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v75, CFSTR("shared-library-exiting-count"));

  }
  v76 = -[PXCPLStatus sharedLibraryMovingToShared](self, "sharedLibraryMovingToShared");
  if (v76)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "stringValue");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v78, CFSTR("move-to-shared"));

  }
  v79 = -[PXCPLStatus sharedLibraryMovingToPersonal](self, "sharedLibraryMovingToPersonal");
  if (v79)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "stringValue");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v81, CFSTR("move-to-personal"));

  }
  if (-[PXCPLStatus isExceedingSharedLibraryQuota](self, "isExceedingSharedLibraryQuota"))
  {
    objc_msgSend(MEMORY[0x1E0C9AAB0], "stringValue");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v82, CFSTR("shared-library-cloud-quota"));

  }
  if (-[PXCPLStatus isLocalModeEnabled](self, "isLocalModeEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0C9AAB0], "stringValue");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v83, CFSTR("local-mode"));

  }
  if (-[PXCPLStatus isUpgradeSuggestedToAccessAllPhotos](self, "isUpgradeSuggestedToAccessAllPhotos"))
  {
    objc_msgSend(MEMORY[0x1E0C9AAB0], "stringValue");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v84, CFSTR("upgrade-suggested"));

  }
  v85 = v3;

  return v85;
}

- (NSString)stringRepresentation
{
  void *v2;
  void *v3;

  -[PXCPLStatus _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _DictionaryRepresentationToString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (PXCPLStatus)statusWithStringRepresentation:(id)a3
{
  return (PXCPLStatus *)objc_msgSend(a1, "statusWithStringRepresentation:currentDate:", a3, 0);
}

+ (PXCPLStatus)statusWithStringRepresentation:(id)a3 currentDate:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v16;
  void *v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSDictionary<NSString *,id> * _Nullable _StringToDictionaryRepresentation(NSString *__strong)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PXCPLStatus_Serialization.m"), 140, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string"));

  }
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__122665;
  v23 = __Block_byref_object_dispose__122666;
  v24 = 0;
  if (objc_msgSend(v8, "hasPrefix:", CFSTR("{"))
    && objc_msgSend(v8, "hasSuffix:", CFSTR("}")))
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = (void *)v20[5];
    v20[5] = (uint64_t)v9;

    objc_msgSend(v8, "substringWithRange:", 1, objc_msgSend(v8, "length") - 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("; "));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = ___StringToDictionaryRepresentation_block_invoke;
    v18[3] = &unk_1E5129B58;
    v18[4] = &v19;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v18);

  }
  v13 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  if (v13)
    v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithDictionaryRepresentation:currentDate:", v13, v7);
  else
    v14 = 0;

  return (PXCPLStatus *)v14;
}

- (PXCPLStatus)init
{
  PXCPLStatus *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCPLStatus;
  result = -[PXCPLStatus init](&v3, sel_init);
  if (result)
  {
    result->_percentCompletedForLibraryRebuild = -1;
    result->_percentCompletedForUpload = -1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PXCPLStatus *v4;

  v4 = objc_alloc_init(PXCPLStatus);
  -[PXCPLStatus setIsEnabled:](v4, "setIsEnabled:", self->_isEnabled);
  -[PXCPLStatus setPercentCompletedForLibraryRebuild:](v4, "setPercentCompletedForLibraryRebuild:", self->_percentCompletedForLibraryRebuild);
  -[PXCPLStatus setIsRebuildingThumbnails:](v4, "setIsRebuildingThumbnails:", self->_isRebuildingThumbnails);
  -[PXCPLStatus setIsSyncing:](v4, "setIsSyncing:", self->_isSyncing);
  -[PXCPLStatus setSyncDate:](v4, "setSyncDate:", self->_syncDate);
  -[PXCPLStatus setExitDate:](v4, "setExitDate:", self->_exitDate);
  -[PXCPLStatus setNumberOfItemsToUpload:](v4, "setNumberOfItemsToUpload:", self->_numberOfItemsToUpload);
  -[PXCPLStatus setPercentCompletedForUpload:](v4, "setPercentCompletedForUpload:", self->_percentCompletedForUpload);
  -[PXCPLStatus setNumberOfItemsToAdd:](v4, "setNumberOfItemsToAdd:", self->_numberOfItemsToAdd);
  -[PXCPLStatus setNumberOfOriginalsToDownload:](v4, "setNumberOfOriginalsToDownload:", self->_numberOfOriginalsToDownload);
  -[PXCPLStatus setNumberOfItemsFailingToUpload:](v4, "setNumberOfItemsFailingToUpload:", self->_numberOfItemsFailingToUpload);
  -[PXCPLStatus setNumberOfPhotoAssets:](v4, "setNumberOfPhotoAssets:", self->_numberOfPhotoAssets);
  -[PXCPLStatus setNumberOfVideoAssets:](v4, "setNumberOfVideoAssets:", self->_numberOfVideoAssets);
  -[PXCPLStatus setNumberOfOtherAssets:](v4, "setNumberOfOtherAssets:", self->_numberOfOtherAssets);
  -[PXCPLStatus setNumberOfReferencedItems:](v4, "setNumberOfReferencedItems:", self->_numberOfReferencedItems);
  -[PXCPLStatus setIsUserPaused:](v4, "setIsUserPaused:", self->_isUserPaused);
  -[PXCPLStatus setIsInLowDataMode:](v4, "setIsInLowDataMode:", self->_isInLowDataMode);
  -[PXCPLStatus setIsInLowPowerMode:](v4, "setIsInLowPowerMode:", self->_isInLowPowerMode);
  -[PXCPLStatus setIsExceedingBatteryQuota:](v4, "setIsExceedingBatteryQuota:", self->_isExceedingBatteryQuota);
  -[PXCPLStatus setIsExceedingCellularQuota:](v4, "setIsExceedingCellularQuota:", self->_isExceedingCellularQuota);
  -[PXCPLStatus setIsLowDiskSpace:](v4, "setIsLowDiskSpace:", self->_isLowDiskSpace);
  -[PXCPLStatus setIsVeryLowDiskSpace:](v4, "setIsVeryLowDiskSpace:", self->_isVeryLowDiskSpace);
  -[PXCPLStatus setIsExceedingQuota:](v4, "setIsExceedingQuota:", self->_isExceedingQuota);
  -[PXCPLStatus setIsCellularDataDisabled:](v4, "setIsCellularDataDisabled:", self->_isCellularDataDisabled);
  -[PXCPLStatus setIsInAirplaneMode:](v4, "setIsInAirplaneMode:", self->_isInAirplaneMode);
  -[PXCPLStatus setIsClientVersionTooOld:](v4, "setIsClientVersionTooOld:", self->_isClientVersionTooOld);
  -[PXCPLStatus setIsClientNotAuthenticated:](v4, "setIsClientNotAuthenticated:", self->_isClientNotAuthenticated);
  -[PXCPLStatus setIsOffline:](v4, "setIsOffline:", self->_isOffline);
  -[PXCPLStatus setIsInSoftResetSync:](v4, "setIsInSoftResetSync:", self->_isInSoftResetSync);
  -[PXCPLStatus setIsInHardResetSync:](v4, "setIsInHardResetSync:", self->_isInHardResetSync);
  -[PXCPLStatus setIsCapturingSnapshot:](v4, "setIsCapturingSnapshot:", self->_isCapturingSnapshot);
  -[PXCPLStatus setIsOptimizingSystemPerformance:](v4, "setIsOptimizingSystemPerformance:", self->_isOptimizingSystemPerformance);
  -[PXCPLStatus setIsInPoorNetworkConnection:](v4, "setIsInPoorNetworkConnection:", self->_isInPoorNetworkConnection);
  -[PXCPLStatus setIsInModerateThermalPressure:](v4, "setIsInModerateThermalPressure:", self->_isInModerateThermalPressure);
  -[PXCPLStatus setIsInHeavyThermalPressure:](v4, "setIsInHeavyThermalPressure:", self->_isInHeavyThermalPressure);
  -[PXCPLStatus setIsInLowBattery:](v4, "setIsInLowBattery:", self->_isInLowBattery);
  -[PXCPLStatus setHasCloudQuotaOffer:](v4, "setHasCloudQuotaOffer:", self->_hasCloudQuotaOffer);
  -[PXCPLStatus setCloudQuotaState:](v4, "setCloudQuotaState:", self->_cloudQuotaState);
  -[PXCPLStatus setCloudQuotaCustomTitle:](v4, "setCloudQuotaCustomTitle:", self->_cloudQuotaCustomTitle);
  -[PXCPLStatus setCloudQuotaCustomMessage:](v4, "setCloudQuotaCustomMessage:", self->_cloudQuotaCustomMessage);
  -[PXCPLStatus setCloudQuotaCustomActionTitle:](v4, "setCloudQuotaCustomActionTitle:", self->_cloudQuotaCustomActionTitle);
  -[PXCPLStatus setSharedLibraryState:](v4, "setSharedLibraryState:", self->_sharedLibraryState);
  -[PXCPLStatus setSharedLibraryExitingWithNumberOfAssetsRemaining:](v4, "setSharedLibraryExitingWithNumberOfAssetsRemaining:", self->_sharedLibraryExitingWithNumberOfAssetsRemaining);
  -[PXCPLStatus setSharedLibraryMovingToShared:](v4, "setSharedLibraryMovingToShared:", self->_sharedLibraryMovingToShared);
  -[PXCPLStatus setSharedLibraryMovingToPersonal:](v4, "setSharedLibraryMovingToPersonal:", self->_sharedLibraryMovingToPersonal);
  -[PXCPLStatus setIsExceedingSharedLibraryQuota:](v4, "setIsExceedingSharedLibraryQuota:", self->_isExceedingSharedLibraryQuota);
  -[PXCPLStatus setIsLocalModeEnabled:](v4, "setIsLocalModeEnabled:", self->_isLocalModeEnabled);
  -[PXCPLStatus setIsMockStatus:](v4, "setIsMockStatus:", self->_isMockStatus);
  -[PXCPLStatus setIsUpgradeSuggestedToAccessAllPhotos:](v4, "setIsUpgradeSuggestedToAccessAllPhotos:", self->_isUpgradeSuggestedToAccessAllPhotos);
  return v4;
}

- (BOOL)_isEqualToCPLStatus:(id)a3
{
  id v4;
  int isEnabled;
  int64_t percentCompletedForLibraryRebuild;
  int isRebuildingThumbnails;
  int isSyncing;
  NSDate *syncDate;
  NSDate *v10;
  NSDate *v11;
  int v12;
  NSDate *exitDate;
  NSDate *v14;
  NSDate *v15;
  int v16;
  unint64_t numberOfItemsToUpload;
  int64_t percentCompletedForUpload;
  unint64_t numberOfItemsToAdd;
  unint64_t numberOfOriginalsToDownload;
  unint64_t numberOfItemsFailingToUpload;
  unint64_t numberOfPhotoAssets;
  unint64_t numberOfVideoAssets;
  unint64_t numberOfOtherAssets;
  unint64_t numberOfReferencedItems;
  int isUserPaused;
  int isInLowDataMode;
  int isInLowPowerMode;
  int isExceedingBatteryQuota;
  int isExceedingCellularQuota;
  int isLowDiskSpace;
  int isVeryLowDiskSpace;
  int isExceedingQuota;
  int isCellularDataDisabled;
  int isInAirplaneMode;
  int isClientVersionTooOld;
  int isClientNotAuthenticated;
  int isOffline;
  int isInSoftResetSync;
  int isInHardResetSync;
  int isCapturingSnapshot;
  int isOptimizingSystemPerformance;
  int isInPoorNetworkConnection;
  int isInModerateThermalPressure;
  int isInHeavyThermalPressure;
  int isInLowBattery;
  int hasCloudQuotaOffer;
  int64_t cloudQuotaState;
  NSString *cloudQuotaCustomTitle;
  NSString *v50;
  NSString *v51;
  _BOOL4 v52;
  NSString *cloudQuotaCustomMessage;
  NSString *v54;
  NSString *v55;
  _BOOL4 v56;
  NSString *cloudQuotaCustomActionTitle;
  NSString *v58;
  NSString *v59;
  _BOOL4 v60;
  int64_t sharedLibraryState;
  unint64_t sharedLibraryExitingWithNumberOfAssetsRemaining;
  unint64_t sharedLibraryMovingToShared;
  unint64_t sharedLibraryMovingToPersonal;
  int isExceedingSharedLibraryQuota;
  int isLocalModeEnabled;
  int isMockStatus;
  int isUpgradeSuggestedToAccessAllPhotos;
  BOOL v69;

  v4 = a3;
  isEnabled = self->_isEnabled;
  if (isEnabled != objc_msgSend(v4, "isEnabled"))
    goto LABEL_65;
  percentCompletedForLibraryRebuild = self->_percentCompletedForLibraryRebuild;
  if (percentCompletedForLibraryRebuild != objc_msgSend(v4, "percentCompletedForLibraryRebuild"))
    goto LABEL_65;
  isRebuildingThumbnails = self->_isRebuildingThumbnails;
  if (isRebuildingThumbnails != objc_msgSend(v4, "isRebuildingThumbnails"))
    goto LABEL_65;
  isSyncing = self->_isSyncing;
  if (isSyncing != objc_msgSend(v4, "isSyncing"))
    goto LABEL_65;
  syncDate = self->_syncDate;
  objc_msgSend(v4, "syncDate");
  v10 = (NSDate *)(id)objc_claimAutoreleasedReturnValue();
  if (syncDate == v10)
  {

  }
  else
  {
    v11 = v10;
    v12 = -[NSDate isEqual:](syncDate, "isEqual:", v10);

    if (!v12)
    {
LABEL_65:
      v69 = 0;
      goto LABEL_66;
    }
  }
  exitDate = self->_exitDate;
  objc_msgSend(v4, "exitDate");
  v14 = (NSDate *)(id)objc_claimAutoreleasedReturnValue();
  if (exitDate == v14)
  {

  }
  else
  {
    v15 = v14;
    v16 = -[NSDate isEqual:](exitDate, "isEqual:", v14);

    if (!v16)
      goto LABEL_65;
  }
  numberOfItemsToUpload = self->_numberOfItemsToUpload;
  if (numberOfItemsToUpload != objc_msgSend(v4, "numberOfItemsToUpload"))
    goto LABEL_65;
  percentCompletedForUpload = self->_percentCompletedForUpload;
  if (percentCompletedForUpload != objc_msgSend(v4, "percentCompletedForUpload"))
    goto LABEL_65;
  numberOfItemsToAdd = self->_numberOfItemsToAdd;
  if (numberOfItemsToAdd != objc_msgSend(v4, "numberOfItemsToAdd"))
    goto LABEL_65;
  numberOfOriginalsToDownload = self->_numberOfOriginalsToDownload;
  if (numberOfOriginalsToDownload != objc_msgSend(v4, "numberOfOriginalsToDownload"))
    goto LABEL_65;
  numberOfItemsFailingToUpload = self->_numberOfItemsFailingToUpload;
  if (numberOfItemsFailingToUpload != objc_msgSend(v4, "numberOfItemsFailingToUpload"))
    goto LABEL_65;
  numberOfPhotoAssets = self->_numberOfPhotoAssets;
  if (numberOfPhotoAssets != objc_msgSend(v4, "numberOfPhotoAssets"))
    goto LABEL_65;
  numberOfVideoAssets = self->_numberOfVideoAssets;
  if (numberOfVideoAssets != objc_msgSend(v4, "numberOfVideoAssets"))
    goto LABEL_65;
  numberOfOtherAssets = self->_numberOfOtherAssets;
  if (numberOfOtherAssets != objc_msgSend(v4, "numberOfOtherAssets"))
    goto LABEL_65;
  numberOfReferencedItems = self->_numberOfReferencedItems;
  if (numberOfReferencedItems != objc_msgSend(v4, "numberOfReferencedItems"))
    goto LABEL_65;
  isUserPaused = self->_isUserPaused;
  if (isUserPaused != objc_msgSend(v4, "isUserPaused"))
    goto LABEL_65;
  isInLowDataMode = self->_isInLowDataMode;
  if (isInLowDataMode != objc_msgSend(v4, "isInLowDataMode"))
    goto LABEL_65;
  isInLowPowerMode = self->_isInLowPowerMode;
  if (isInLowPowerMode != objc_msgSend(v4, "isInLowPowerMode"))
    goto LABEL_65;
  isExceedingBatteryQuota = self->_isExceedingBatteryQuota;
  if (isExceedingBatteryQuota != objc_msgSend(v4, "isExceedingBatteryQuota"))
    goto LABEL_65;
  isExceedingCellularQuota = self->_isExceedingCellularQuota;
  if (isExceedingCellularQuota != objc_msgSend(v4, "isExceedingCellularQuota"))
    goto LABEL_65;
  isLowDiskSpace = self->_isLowDiskSpace;
  if (isLowDiskSpace != objc_msgSend(v4, "isLowDiskSpace"))
    goto LABEL_65;
  isVeryLowDiskSpace = self->_isVeryLowDiskSpace;
  if (isVeryLowDiskSpace != objc_msgSend(v4, "isVeryLowDiskSpace"))
    goto LABEL_65;
  isExceedingQuota = self->_isExceedingQuota;
  if (isExceedingQuota != objc_msgSend(v4, "isExceedingQuota"))
    goto LABEL_65;
  isCellularDataDisabled = self->_isCellularDataDisabled;
  if (isCellularDataDisabled != objc_msgSend(v4, "isCellularDataDisabled"))
    goto LABEL_65;
  isInAirplaneMode = self->_isInAirplaneMode;
  if (isInAirplaneMode != objc_msgSend(v4, "isInAirplaneMode"))
    goto LABEL_65;
  isClientVersionTooOld = self->_isClientVersionTooOld;
  if (isClientVersionTooOld != objc_msgSend(v4, "isClientVersionTooOld"))
    goto LABEL_65;
  isClientNotAuthenticated = self->_isClientNotAuthenticated;
  if (isClientNotAuthenticated != objc_msgSend(v4, "isClientNotAuthenticated"))
    goto LABEL_65;
  isOffline = self->_isOffline;
  if (isOffline != objc_msgSend(v4, "isOffline"))
    goto LABEL_65;
  isInSoftResetSync = self->_isInSoftResetSync;
  if (isInSoftResetSync != objc_msgSend(v4, "isInSoftResetSync"))
    goto LABEL_65;
  isInHardResetSync = self->_isInHardResetSync;
  if (isInHardResetSync != objc_msgSend(v4, "isInHardResetSync"))
    goto LABEL_65;
  isCapturingSnapshot = self->_isCapturingSnapshot;
  if (isCapturingSnapshot != objc_msgSend(v4, "isCapturingSnapshot"))
    goto LABEL_65;
  isOptimizingSystemPerformance = self->_isOptimizingSystemPerformance;
  if (isOptimizingSystemPerformance != objc_msgSend(v4, "isOptimizingSystemPerformance"))
    goto LABEL_65;
  isInPoorNetworkConnection = self->_isInPoorNetworkConnection;
  if (isInPoorNetworkConnection != objc_msgSend(v4, "isInPoorNetworkConnection"))
    goto LABEL_65;
  isInModerateThermalPressure = self->_isInModerateThermalPressure;
  if (isInModerateThermalPressure != objc_msgSend(v4, "isInModerateThermalPressure"))
    goto LABEL_65;
  isInHeavyThermalPressure = self->_isInHeavyThermalPressure;
  if (isInHeavyThermalPressure != objc_msgSend(v4, "isInHeavyThermalPressure"))
    goto LABEL_65;
  isInLowBattery = self->_isInLowBattery;
  if (isInLowBattery != objc_msgSend(v4, "isInLowBattery"))
    goto LABEL_65;
  hasCloudQuotaOffer = self->_hasCloudQuotaOffer;
  if (hasCloudQuotaOffer != objc_msgSend(v4, "hasCloudQuotaOffer"))
    goto LABEL_65;
  cloudQuotaState = self->_cloudQuotaState;
  if (cloudQuotaState != objc_msgSend(v4, "cloudQuotaState"))
    goto LABEL_65;
  cloudQuotaCustomTitle = self->_cloudQuotaCustomTitle;
  objc_msgSend(v4, "cloudQuotaCustomTitle");
  v50 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
  if (cloudQuotaCustomTitle == v50)
  {

  }
  else
  {
    v51 = v50;
    v52 = -[NSString isEqualToString:](cloudQuotaCustomTitle, "isEqualToString:", v50);

    if (!v52)
      goto LABEL_65;
  }
  cloudQuotaCustomMessage = self->_cloudQuotaCustomMessage;
  objc_msgSend(v4, "cloudQuotaCustomMessage");
  v54 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
  if (cloudQuotaCustomMessage == v54)
  {

  }
  else
  {
    v55 = v54;
    v56 = -[NSString isEqualToString:](cloudQuotaCustomMessage, "isEqualToString:", v54);

    if (!v56)
      goto LABEL_65;
  }
  cloudQuotaCustomActionTitle = self->_cloudQuotaCustomActionTitle;
  objc_msgSend(v4, "cloudQuotaCustomActionTitle");
  v58 = (NSString *)(id)objc_claimAutoreleasedReturnValue();
  if (cloudQuotaCustomActionTitle == v58)
  {

  }
  else
  {
    v59 = v58;
    v60 = -[NSString isEqualToString:](cloudQuotaCustomActionTitle, "isEqualToString:", v58);

    if (!v60)
      goto LABEL_65;
  }
  sharedLibraryState = self->_sharedLibraryState;
  if (sharedLibraryState != objc_msgSend(v4, "sharedLibraryState"))
    goto LABEL_65;
  sharedLibraryExitingWithNumberOfAssetsRemaining = self->_sharedLibraryExitingWithNumberOfAssetsRemaining;
  if (sharedLibraryExitingWithNumberOfAssetsRemaining != objc_msgSend(v4, "sharedLibraryExitingWithNumberOfAssetsRemaining"))goto LABEL_65;
  sharedLibraryMovingToShared = self->_sharedLibraryMovingToShared;
  if (sharedLibraryMovingToShared != objc_msgSend(v4, "sharedLibraryMovingToShared"))
    goto LABEL_65;
  sharedLibraryMovingToPersonal = self->_sharedLibraryMovingToPersonal;
  if (sharedLibraryMovingToPersonal != objc_msgSend(v4, "sharedLibraryMovingToPersonal"))
    goto LABEL_65;
  isExceedingSharedLibraryQuota = self->_isExceedingSharedLibraryQuota;
  if (isExceedingSharedLibraryQuota != objc_msgSend(v4, "isExceedingSharedLibraryQuota"))
    goto LABEL_65;
  isLocalModeEnabled = self->_isLocalModeEnabled;
  if (isLocalModeEnabled != objc_msgSend(v4, "isLocalModeEnabled"))
    goto LABEL_65;
  isMockStatus = self->_isMockStatus;
  if (isMockStatus != objc_msgSend(v4, "isMockStatus"))
    goto LABEL_65;
  isUpgradeSuggestedToAccessAllPhotos = self->_isUpgradeSuggestedToAccessAllPhotos;
  v69 = isUpgradeSuggestedToAccessAllPhotos == objc_msgSend(v4, "isUpgradeSuggestedToAccessAllPhotos");
LABEL_66:

  return v69;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[PXCPLStatus _isEqualToCPLStatus:](self, "_isEqualToCPLStatus:", v4);

  return v5;
}

- (void)setFractionCompletedForLibraryRebuild:(float)a3
{
  NSObject *v7;
  int64_t v8;
  int v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((a3 > 1.0 || a3 < 0.0) && a3 != -1.0)
  {
    PXAssertGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 134217984;
      v10 = a3;
      _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Fraction completed must be in the range of 0.0 through 1.0, or PXCPLProgressUnavailable - but is: %f", (uint8_t *)&v9, 0xCu);
    }

  }
  if (a3 >= 0.0)
  {
    v8 = vcvtps_s32_f32(a3 * 100.0);
    if (v8 >= 100)
      v8 = 100;
  }
  else
  {
    v8 = -1;
  }
  self->_percentCompletedForLibraryRebuild = v8;
}

- (float)fractionCompletedForLibraryRebuild
{
  int64_t percentCompletedForLibraryRebuild;
  float result;

  percentCompletedForLibraryRebuild = self->_percentCompletedForLibraryRebuild;
  if (percentCompletedForLibraryRebuild < 0)
    return -1.0;
  result = (double)percentCompletedForLibraryRebuild / 100.0;
  if (result > 1.0)
    return 1.0;
  return result;
}

- (void)setFractionCompletedForUpload:(float)a3
{
  NSObject *v7;
  int64_t v8;
  int v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((a3 > 1.0 || a3 < 0.0) && a3 != -1.0)
  {
    PXAssertGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 134217984;
      v10 = a3;
      _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Fraction completed must be in the range of 0.0 through 1.0, or PXCPLProgressUnavailable - but is: %f", (uint8_t *)&v9, 0xCu);
    }

  }
  if (a3 >= 0.0)
  {
    v8 = vcvtps_s32_f32(a3 * 100.0);
    if (v8 >= 100)
      v8 = 100;
  }
  else
  {
    v8 = -1;
  }
  self->_percentCompletedForUpload = v8;
}

- (float)fractionCompletedForUpload
{
  int64_t percentCompletedForUpload;
  float result;

  percentCompletedForUpload = self->_percentCompletedForUpload;
  if (percentCompletedForUpload < 0)
    return -1.0;
  result = (double)percentCompletedForUpload / 100.0;
  if (result > 1.0)
    return 1.0;
  return result;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (BOOL)isRebuildingThumbnails
{
  return self->_isRebuildingThumbnails;
}

- (void)setIsRebuildingThumbnails:(BOOL)a3
{
  self->_isRebuildingThumbnails = a3;
}

- (BOOL)isSyncing
{
  return self->_isSyncing;
}

- (void)setIsSyncing:(BOOL)a3
{
  self->_isSyncing = a3;
}

- (NSDate)syncDate
{
  return self->_syncDate;
}

- (void)setSyncDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)exitDate
{
  return self->_exitDate;
}

- (void)setExitDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)numberOfItemsToUpload
{
  return self->_numberOfItemsToUpload;
}

- (void)setNumberOfItemsToUpload:(unint64_t)a3
{
  self->_numberOfItemsToUpload = a3;
}

- (unint64_t)numberOfItemsToAdd
{
  return self->_numberOfItemsToAdd;
}

- (void)setNumberOfItemsToAdd:(unint64_t)a3
{
  self->_numberOfItemsToAdd = a3;
}

- (unint64_t)numberOfOriginalsToDownload
{
  return self->_numberOfOriginalsToDownload;
}

- (void)setNumberOfOriginalsToDownload:(unint64_t)a3
{
  self->_numberOfOriginalsToDownload = a3;
}

- (unint64_t)numberOfItemsFailingToUpload
{
  return self->_numberOfItemsFailingToUpload;
}

- (void)setNumberOfItemsFailingToUpload:(unint64_t)a3
{
  self->_numberOfItemsFailingToUpload = a3;
}

- (unint64_t)numberOfPhotoAssets
{
  return self->_numberOfPhotoAssets;
}

- (void)setNumberOfPhotoAssets:(unint64_t)a3
{
  self->_numberOfPhotoAssets = a3;
}

- (unint64_t)numberOfVideoAssets
{
  return self->_numberOfVideoAssets;
}

- (void)setNumberOfVideoAssets:(unint64_t)a3
{
  self->_numberOfVideoAssets = a3;
}

- (unint64_t)numberOfOtherAssets
{
  return self->_numberOfOtherAssets;
}

- (void)setNumberOfOtherAssets:(unint64_t)a3
{
  self->_numberOfOtherAssets = a3;
}

- (unint64_t)numberOfReferencedItems
{
  return self->_numberOfReferencedItems;
}

- (void)setNumberOfReferencedItems:(unint64_t)a3
{
  self->_numberOfReferencedItems = a3;
}

- (BOOL)isUserPaused
{
  return self->_isUserPaused;
}

- (void)setIsUserPaused:(BOOL)a3
{
  self->_isUserPaused = a3;
}

- (BOOL)isInLowDataMode
{
  return self->_isInLowDataMode;
}

- (void)setIsInLowDataMode:(BOOL)a3
{
  self->_isInLowDataMode = a3;
}

- (BOOL)isInLowPowerMode
{
  return self->_isInLowPowerMode;
}

- (void)setIsInLowPowerMode:(BOOL)a3
{
  self->_isInLowPowerMode = a3;
}

- (BOOL)isExceedingBatteryQuota
{
  return self->_isExceedingBatteryQuota;
}

- (void)setIsExceedingBatteryQuota:(BOOL)a3
{
  self->_isExceedingBatteryQuota = a3;
}

- (BOOL)isExceedingCellularQuota
{
  return self->_isExceedingCellularQuota;
}

- (void)setIsExceedingCellularQuota:(BOOL)a3
{
  self->_isExceedingCellularQuota = a3;
}

- (BOOL)isLowDiskSpace
{
  return self->_isLowDiskSpace;
}

- (void)setIsLowDiskSpace:(BOOL)a3
{
  self->_isLowDiskSpace = a3;
}

- (BOOL)isVeryLowDiskSpace
{
  return self->_isVeryLowDiskSpace;
}

- (void)setIsVeryLowDiskSpace:(BOOL)a3
{
  self->_isVeryLowDiskSpace = a3;
}

- (BOOL)isExceedingQuota
{
  return self->_isExceedingQuota;
}

- (void)setIsExceedingQuota:(BOOL)a3
{
  self->_isExceedingQuota = a3;
}

- (BOOL)isCellularDataDisabled
{
  return self->_isCellularDataDisabled;
}

- (void)setIsCellularDataDisabled:(BOOL)a3
{
  self->_isCellularDataDisabled = a3;
}

- (BOOL)isInAirplaneMode
{
  return self->_isInAirplaneMode;
}

- (void)setIsInAirplaneMode:(BOOL)a3
{
  self->_isInAirplaneMode = a3;
}

- (BOOL)isClientVersionTooOld
{
  return self->_isClientVersionTooOld;
}

- (void)setIsClientVersionTooOld:(BOOL)a3
{
  self->_isClientVersionTooOld = a3;
}

- (BOOL)isClientNotAuthenticated
{
  return self->_isClientNotAuthenticated;
}

- (void)setIsClientNotAuthenticated:(BOOL)a3
{
  self->_isClientNotAuthenticated = a3;
}

- (BOOL)isOffline
{
  return self->_isOffline;
}

- (void)setIsOffline:(BOOL)a3
{
  self->_isOffline = a3;
}

- (BOOL)isInSoftResetSync
{
  return self->_isInSoftResetSync;
}

- (void)setIsInSoftResetSync:(BOOL)a3
{
  self->_isInSoftResetSync = a3;
}

- (BOOL)isInHardResetSync
{
  return self->_isInHardResetSync;
}

- (void)setIsInHardResetSync:(BOOL)a3
{
  self->_isInHardResetSync = a3;
}

- (BOOL)isCapturingSnapshot
{
  return self->_isCapturingSnapshot;
}

- (void)setIsCapturingSnapshot:(BOOL)a3
{
  self->_isCapturingSnapshot = a3;
}

- (BOOL)isOptimizingSystemPerformance
{
  return self->_isOptimizingSystemPerformance;
}

- (void)setIsOptimizingSystemPerformance:(BOOL)a3
{
  self->_isOptimizingSystemPerformance = a3;
}

- (BOOL)isInPoorNetworkConnection
{
  return self->_isInPoorNetworkConnection;
}

- (void)setIsInPoorNetworkConnection:(BOOL)a3
{
  self->_isInPoorNetworkConnection = a3;
}

- (BOOL)isInModerateThermalPressure
{
  return self->_isInModerateThermalPressure;
}

- (void)setIsInModerateThermalPressure:(BOOL)a3
{
  self->_isInModerateThermalPressure = a3;
}

- (BOOL)isInHeavyThermalPressure
{
  return self->_isInHeavyThermalPressure;
}

- (void)setIsInHeavyThermalPressure:(BOOL)a3
{
  self->_isInHeavyThermalPressure = a3;
}

- (BOOL)isInLowBattery
{
  return self->_isInLowBattery;
}

- (void)setIsInLowBattery:(BOOL)a3
{
  self->_isInLowBattery = a3;
}

- (BOOL)hasCloudQuotaOffer
{
  return self->_hasCloudQuotaOffer;
}

- (void)setHasCloudQuotaOffer:(BOOL)a3
{
  self->_hasCloudQuotaOffer = a3;
}

- (int64_t)cloudQuotaState
{
  return self->_cloudQuotaState;
}

- (void)setCloudQuotaState:(int64_t)a3
{
  self->_cloudQuotaState = a3;
}

- (NSString)cloudQuotaCustomTitle
{
  return self->_cloudQuotaCustomTitle;
}

- (void)setCloudQuotaCustomTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)cloudQuotaCustomMessage
{
  return self->_cloudQuotaCustomMessage;
}

- (void)setCloudQuotaCustomMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)cloudQuotaCustomActionTitle
{
  return self->_cloudQuotaCustomActionTitle;
}

- (void)setCloudQuotaCustomActionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (int64_t)sharedLibraryState
{
  return self->_sharedLibraryState;
}

- (void)setSharedLibraryState:(int64_t)a3
{
  self->_sharedLibraryState = a3;
}

- (unint64_t)sharedLibraryExitingWithNumberOfAssetsRemaining
{
  return self->_sharedLibraryExitingWithNumberOfAssetsRemaining;
}

- (void)setSharedLibraryExitingWithNumberOfAssetsRemaining:(unint64_t)a3
{
  self->_sharedLibraryExitingWithNumberOfAssetsRemaining = a3;
}

- (unint64_t)sharedLibraryMovingToShared
{
  return self->_sharedLibraryMovingToShared;
}

- (void)setSharedLibraryMovingToShared:(unint64_t)a3
{
  self->_sharedLibraryMovingToShared = a3;
}

- (unint64_t)sharedLibraryMovingToPersonal
{
  return self->_sharedLibraryMovingToPersonal;
}

- (void)setSharedLibraryMovingToPersonal:(unint64_t)a3
{
  self->_sharedLibraryMovingToPersonal = a3;
}

- (BOOL)isExceedingSharedLibraryQuota
{
  return self->_isExceedingSharedLibraryQuota;
}

- (void)setIsExceedingSharedLibraryQuota:(BOOL)a3
{
  self->_isExceedingSharedLibraryQuota = a3;
}

- (BOOL)isLocalModeEnabled
{
  return self->_isLocalModeEnabled;
}

- (void)setIsLocalModeEnabled:(BOOL)a3
{
  self->_isLocalModeEnabled = a3;
}

- (BOOL)isMockStatus
{
  return self->_isMockStatus;
}

- (void)setIsMockStatus:(BOOL)a3
{
  self->_isMockStatus = a3;
}

- (BOOL)isUpgradeSuggestedToAccessAllPhotos
{
  return self->_isUpgradeSuggestedToAccessAllPhotos;
}

- (void)setIsUpgradeSuggestedToAccessAllPhotos:(BOOL)a3
{
  self->_isUpgradeSuggestedToAccessAllPhotos = a3;
}

- (int64_t)percentCompletedForLibraryRebuild
{
  return self->_percentCompletedForLibraryRebuild;
}

- (void)setPercentCompletedForLibraryRebuild:(int64_t)a3
{
  self->_percentCompletedForLibraryRebuild = a3;
}

- (int64_t)percentCompletedForUpload
{
  return self->_percentCompletedForUpload;
}

- (void)setPercentCompletedForUpload:(int64_t)a3
{
  self->_percentCompletedForUpload = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudQuotaCustomActionTitle, 0);
  objc_storeStrong((id *)&self->_cloudQuotaCustomMessage, 0);
  objc_storeStrong((id *)&self->_cloudQuotaCustomTitle, 0);
  objc_storeStrong((id *)&self->_exitDate, 0);
  objc_storeStrong((id *)&self->_syncDate, 0);
}

@end
