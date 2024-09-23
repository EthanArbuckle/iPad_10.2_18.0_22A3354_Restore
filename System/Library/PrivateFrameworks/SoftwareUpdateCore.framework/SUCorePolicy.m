@implementation SUCorePolicy

- (SUCorePolicy)initWithSoftwareUpdateAssetType:(id)a3 documentationAssetType:(id)a4 usingPolicies:(int64_t)a5 usingExtensions:(id)a6
{
  id v10;
  id v11;
  id v12;
  char *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  SUCorePolicySoftwareUpdateScan *v19;
  void *v20;
  SUCorePolicyDocumentationScan *v21;
  void *v22;
  SUCorePolicyDocumentationDownload *v23;
  void *v24;
  SUCorePolicyLoadBrain *v25;
  void *v26;
  SUCorePolicyPreflightDownloadSU *v27;
  void *v28;
  SUCorePolicySoftwareUpdateDownload *v29;
  void *v30;
  SUCorePolicyPrepare *v31;
  void *v32;
  SUCorePolicySuspend *v33;
  void *v34;
  SUCorePolicyResume *v35;
  void *v36;
  SUCorePolicyApply *v37;
  void *v38;
  SUCorePolicyPreflightWakeup *v39;
  void *v40;
  SUCorePolicyPreflightPrerequisiteCheck *v41;
  void *v42;
  SUCorePolicyPreflightPersonalize *v43;
  void *v44;
  SUCorePolicyPreflightFDRRecovery *v45;
  void *v46;
  SUCorePolicyRollback *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  uint64_t v85;
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
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  id v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  objc_super v112;
  uint8_t v113[128];
  uint8_t buf[4];
  void *v115;
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v112.receiver = self;
  v112.super_class = (Class)SUCorePolicy;
  v13 = -[SUCorePolicy init](&v112, sel_init);
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "oslog");
    v15 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "summary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v115 = v17;
      _os_log_impl(&dword_1DDFDD000, v15, OS_LOG_TYPE_DEFAULT, "[POLICY] Using SUCoreDevice for policy: %{public}@", buf, 0xCu);

    }
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *((_QWORD *)v13 + 5) = a5;
    v19 = objc_alloc_init(SUCorePolicySoftwareUpdateScan);
    v20 = (void *)*((_QWORD *)v13 + 6);
    *((_QWORD *)v13 + 6) = v19;

    v21 = objc_alloc_init(SUCorePolicyDocumentationScan);
    v22 = (void *)*((_QWORD *)v13 + 7);
    *((_QWORD *)v13 + 7) = v21;

    v23 = objc_alloc_init(SUCorePolicyDocumentationDownload);
    v24 = (void *)*((_QWORD *)v13 + 8);
    *((_QWORD *)v13 + 8) = v23;

    v25 = -[SUCorePolicyLoadBrain initWithSkipPhaseSet:]([SUCorePolicyLoadBrain alloc], "initWithSkipPhaseSet:", (objc_msgSend(v13, "specifiedUsedPolicies") & 1) == 0);
    v26 = (void *)*((_QWORD *)v13 + 9);
    *((_QWORD *)v13 + 9) = v25;

    v27 = -[SUCorePolicyPreflightDownloadSU initWithSkipPhaseSet:]([SUCorePolicyPreflightDownloadSU alloc], "initWithSkipPhaseSet:", (objc_msgSend(v13, "specifiedUsedPolicies") & 2) == 0);
    v28 = (void *)*((_QWORD *)v13 + 10);
    *((_QWORD *)v13 + 10) = v27;

    v29 = -[SUCorePolicySoftwareUpdateDownload initWithSkipPhaseSet:]([SUCorePolicySoftwareUpdateDownload alloc], "initWithSkipPhaseSet:", (objc_msgSend(v13, "specifiedUsedPolicies") & 4) == 0);
    v30 = (void *)*((_QWORD *)v13 + 11);
    *((_QWORD *)v13 + 11) = v29;

    v31 = -[SUCorePolicyPrepare initWithSkipPhaseSet:]([SUCorePolicyPrepare alloc], "initWithSkipPhaseSet:", (objc_msgSend(v13, "specifiedUsedPolicies") & 8) == 0);
    v32 = (void *)*((_QWORD *)v13 + 12);
    *((_QWORD *)v13 + 12) = v31;

    v33 = -[SUCorePolicySuspend initWithSkipPhaseSet:]([SUCorePolicySuspend alloc], "initWithSkipPhaseSet:", (objc_msgSend(v13, "specifiedUsedPolicies") & 0x10) == 0);
    v34 = (void *)*((_QWORD *)v13 + 13);
    *((_QWORD *)v13 + 13) = v33;

    v35 = -[SUCorePolicyResume initWithSkipPhaseSet:]([SUCorePolicyResume alloc], "initWithSkipPhaseSet:", (objc_msgSend(v13, "specifiedUsedPolicies") & 0x20) == 0);
    v36 = (void *)*((_QWORD *)v13 + 14);
    *((_QWORD *)v13 + 14) = v35;

    v37 = -[SUCorePolicyApply initWithSkipPhaseSet:]([SUCorePolicyApply alloc], "initWithSkipPhaseSet:", (objc_msgSend(v13, "specifiedUsedPolicies") & 0x40) == 0);
    v38 = (void *)*((_QWORD *)v13 + 15);
    *((_QWORD *)v13 + 15) = v37;

    v39 = objc_alloc_init(SUCorePolicyPreflightWakeup);
    v40 = (void *)*((_QWORD *)v13 + 17);
    *((_QWORD *)v13 + 17) = v39;

    v41 = objc_alloc_init(SUCorePolicyPreflightPrerequisiteCheck);
    v42 = (void *)*((_QWORD *)v13 + 18);
    *((_QWORD *)v13 + 18) = v41;

    v43 = objc_alloc_init(SUCorePolicyPreflightPersonalize);
    v44 = (void *)*((_QWORD *)v13 + 19);
    *((_QWORD *)v13 + 19) = v43;

    v45 = objc_alloc_init(SUCorePolicyPreflightFDRRecovery);
    v46 = (void *)*((_QWORD *)v13 + 20);
    *((_QWORD *)v13 + 20) = v45;

    v47 = objc_alloc_init(SUCorePolicyRollback);
    v48 = (void *)*((_QWORD *)v13 + 16);
    *((_QWORD *)v13 + 16) = v47;

    if (v10)
    {
      v49 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v10);
      v50 = (void *)*((_QWORD *)v13 + 21);
      *((_QWORD *)v13 + 21) = v49;
    }
    else
    {
      v50 = (void *)*((_QWORD *)v13 + 21);
      *((_QWORD *)v13 + 21) = 0;
    }

    if (v11)
    {
      v51 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v11);
      v52 = (void *)*((_QWORD *)v13 + 22);
      *((_QWORD *)v13 + 22) = v51;
    }
    else
    {
      v52 = (void *)*((_QWORD *)v13 + 22);
      *((_QWORD *)v13 + 22) = 0;
    }

    v53 = (void *)*((_QWORD *)v13 + 23);
    *((_QWORD *)v13 + 23) = 0;

    v110 = 0u;
    v111 = 0u;
    v108 = 0u;
    v109 = 0u;
    v107 = v12;
    v54 = v12;
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v108, v113, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v109;
      do
      {
        v58 = 0;
        do
        {
          if (*(_QWORD *)v109 != v57)
            objc_enumerationMutation(v54);
          v59 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v108 + 1) + 8 * v58), "copyWithZone:", 0);
          objc_msgSend(v18, "addObject:", v59);

          ++v58;
        }
        while (v56 != v58);
        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v108, v113, 16);
      }
      while (v56);
    }

    v60 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v18);
    v61 = (void *)*((_QWORD *)v13 + 51);
    *((_QWORD *)v13 + 51) = v60;

    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "buildVersion");
    v63 = objc_claimAutoreleasedReturnValue();
    v64 = (void *)*((_QWORD *)v13 + 24);
    *((_QWORD *)v13 + 24) = v63;

    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "productVersion");
    v66 = objc_claimAutoreleasedReturnValue();
    v67 = (void *)*((_QWORD *)v13 + 25);
    *((_QWORD *)v13 + 25) = v66;

    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "restoreVersion");
    v69 = objc_claimAutoreleasedReturnValue();
    v70 = (void *)*((_QWORD *)v13 + 26);
    *((_QWORD *)v13 + 26) = v69;

    v71 = (void *)*((_QWORD *)v13 + 27);
    *((_QWORD *)v13 + 27) = 0;

    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "sfrBuildVersion");
    v73 = objc_claimAutoreleasedReturnValue();
    v74 = (void *)*((_QWORD *)v13 + 28);
    *((_QWORD *)v13 + 28) = v73;

    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "deviceClass");
    v76 = objc_claimAutoreleasedReturnValue();
    v77 = (void *)*((_QWORD *)v13 + 29);
    *((_QWORD *)v13 + 29) = v76;

    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "hwModelString");
    v79 = objc_claimAutoreleasedReturnValue();
    v80 = (void *)*((_QWORD *)v13 + 30);
    *((_QWORD *)v13 + 30) = v79;

    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "productType");
    v82 = objc_claimAutoreleasedReturnValue();
    v83 = (void *)*((_QWORD *)v13 + 31);
    *((_QWORD *)v13 + 31) = v82;

    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "releaseType");
    v85 = objc_claimAutoreleasedReturnValue();
    v86 = (void *)*((_QWORD *)v13 + 32);
    *((_QWORD *)v13 + 32) = v85;

    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v13[12] = objc_msgSend(v87, "isInternal");

    *((_DWORD *)v13 + 2) = 0;
    v13[13] = 1;
    *((_DWORD *)v13 + 7) = -1;
    v88 = (void *)*((_QWORD *)v13 + 33);
    *((_QWORD *)v13 + 33) = 0;

    *((_WORD *)v13 + 7) = 0;
    v89 = (void *)*((_QWORD *)v13 + 34);
    *((_QWORD *)v13 + 34) = 0;

    v90 = (void *)*((_QWORD *)v13 + 35);
    *((_QWORD *)v13 + 35) = 0;

    v91 = (void *)*((_QWORD *)v13 + 36);
    *((_QWORD *)v13 + 36) = 0;

    v92 = (void *)*((_QWORD *)v13 + 37);
    *((_QWORD *)v13 + 37) = 0;

    v93 = (void *)*((_QWORD *)v13 + 38);
    *((_QWORD *)v13 + 38) = 0;

    v94 = (void *)*((_QWORD *)v13 + 39);
    *((_QWORD *)v13 + 39) = 0;

    v95 = (void *)*((_QWORD *)v13 + 40);
    *((_QWORD *)v13 + 40) = 0;

    v96 = (void *)*((_QWORD *)v13 + 41);
    *((_QWORD *)v13 + 41) = 0;

    v97 = (void *)*((_QWORD *)v13 + 42);
    *((_QWORD *)v13 + 42) = 0;

    v98 = (void *)*((_QWORD *)v13 + 43);
    *((_QWORD *)v13 + 43) = 0;

    *((_WORD *)v13 + 8) = 256;
    v99 = (void *)*((_QWORD *)v13 + 44);
    *((_QWORD *)v13 + 44) = 0;

    v100 = (void *)*((_QWORD *)v13 + 45);
    *((_QWORD *)v13 + 45) = 0;

    v101 = (void *)*((_QWORD *)v13 + 46);
    *((_QWORD *)v13 + 46) = 0;

    v13[20] = 0;
    v102 = (void *)*((_QWORD *)v13 + 47);
    *((_QWORD *)v13 + 47) = 0;

    *((_DWORD *)v13 + 8) = 0;
    *(_DWORD *)(v13 + 21) = 0;
    v13[25] = 0;
    v103 = (void *)*((_QWORD *)v13 + 48);
    *((_QWORD *)v13 + 48) = 0;

    v104 = (void *)*((_QWORD *)v13 + 49);
    *((_QWORD *)v13 + 49) = 0;

    v105 = (void *)*((_QWORD *)v13 + 50);
    *((_QWORD *)v13 + 50) = 0;

    *((_WORD *)v13 + 9) = 0;
    v12 = v107;
  }

  return (SUCorePolicy *)v13;
}

- (SUCorePolicy)initWithSoftwareUpdateAssetType:(id)a3 documentationAssetType:(id)a4 usingExtensions:(id)a5
{
  return -[SUCorePolicy initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:](self, "initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:", a3, a4, 127, a5);
}

- (SUCorePolicy)initWithSoftwareUpdateAssetType:(id)a3 documentationAssetType:(id)a4 updateBrainAssetType:(id)a5 usingExtensions:(id)a6
{
  id v10;
  id v11;
  id v12;
  objc_class *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  SUCorePolicy *v18;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (objc_class *)MEMORY[0x1E0CB3940];
  v14 = a5;
  v15 = (void *)objc_msgSend([v13 alloc], "initWithFormat:", CFSTR("this method has been deprecated (and was called with updateBrainAssetType=%@): initWithSoftwareUpdateAssetType:documentationAssetType:updateBrainAssetType:usingExtensions"), v14);

  objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v14)
  {
    objc_msgSend(v16, "trackFault:forReason:withResult:withError:", CFSTR("[POLICY] INIT"), v15, 8123, 0);

    v18 = 0;
  }
  else
  {
    objc_msgSend(v16, "trackAnomaly:forReason:withResult:withError:", CFSTR("[POLICY] INIT"), v15, 8123, 0);

    self = -[SUCorePolicy initWithSoftwareUpdateAssetType:documentationAssetType:usingExtensions:](self, "initWithSoftwareUpdateAssetType:documentationAssetType:usingExtensions:", v10, v11, v12);
    v18 = self;
  }

  return v18;
}

- (void)setRestrictToFull:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_restrictToFull = a3;
  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRestrictToFull:", v3);

}

- (BOOL)restrictToFull
{
  void *v2;
  char v3;

  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "restrictToFull");

  return v3;
}

- (void)setAllowSameVersion:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_allowSameVersion = a3;
  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowSameVersion:", v3);

}

- (BOOL)allowSameVersion
{
  void *v2;
  char v3;

  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowSameVersion");

  return v3;
}

- (void)setBackground:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  self->_background = a3;
  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDiscretionary:", v3);

  -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDiscretionary:", v3);

  -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDiscretionary:", v3);

  -[SUCorePolicy loadBrainPolicy](self, "loadBrainPolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDiscretionary:", v3);

  -[SUCorePolicy downloadPreflightPolicy](self, "downloadPreflightPolicy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDiscretionary:", v3);

  -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDiscretionary:", v3);

}

- (void)setAllowsCellular:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  self->_allowsCellular = a3;
  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowsCellular:", v3);

  -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsCellular:", v3);

  -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsCellular:", v3);

  -[SUCorePolicy loadBrainPolicy](self, "loadBrainPolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAllowsCellular:", v3);

  -[SUCorePolicy downloadPreflightPolicy](self, "downloadPreflightPolicy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllowsCellular:", v3);

  -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAllowsCellular:", v3);

}

- (id)constructSoftwareUpdateMAAssetQuery
{
  return -[SUCorePolicy constructSoftwareUpdateMAAssetQueryWithPurpose:](self, "constructSoftwareUpdateMAAssetQueryWithPurpose:", 0);
}

- (id)constructSoftwareUpdateMAAssetQueryWithPurpose:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t i;
  void *v65;
  void *v66;
  NSObject *v67;
  SUCorePolicy *v68;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t v83[128];
  uint8_t buf[4];
  SUCorePolicy *v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oslog");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v85 = self;
    _os_log_impl(&dword_1DDFDD000, v6, OS_LOG_TYPE_DEFAULT, "[POLICY] constructSoftwareUpdateMAAssetQuery for policy: %@", buf, 0xCu);
  }

  -[SUCorePolicy softwareUpdateAssetType](self, "softwareUpdateAssetType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "trackAnomaly:forReason:withResult:withError:", CFSTR("[POLICY] CONSTRUCT_SU_QUERY"), CFSTR("softwareUpdateAssetType was unexpectedly nil, client is required to init with softwareUpdateAssetType"), 8118, 0);
    goto LABEL_32;
  }
  v8 = objc_alloc(MEMORY[0x1E0D4E050]);
  -[SUCorePolicy softwareUpdateAssetType](self, "softwareUpdateAssetType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v8, "initWithType:andPurpose:", v9, v4);

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("|"), "stringByAppendingFormat:", CFSTR("purpose:%@|"), v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0x1E0CB3000uLL;
  if ((objc_msgSend(v12, "restrictToFull") & 1) != 0
    || (-[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion"),
        (v14 = objc_claimAutoreleasedReturnValue()) == 0))
  {

  }
  else
  {
    v15 = (void *)v14;
    -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "restrictToIncremental");

      v19 = (void *)MEMORY[0x1E0C99DE8];
      -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      if (v18)
      {
        objc_msgSend(v19, "arrayWithObjects:", v20, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addKeyValueArray:with:", CFSTR("PrerequisiteBuild"), v22);

        v23 = (void *)MEMORY[0x1E0C99DE8];
        -[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "arrayWithObjects:", v24, 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addKeyValueArray:with:", CFSTR("PrerequisiteOSVersion"), v25);

        v26 = objc_alloc(MEMORY[0x1E0CB3940]);
        -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
        v27 = objc_claimAutoreleasedReturnValue();
        -[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v26, "initWithFormat:", CFSTR("prerequisite:(incr)%@:%@|"), v27, v28);
      }
      else
      {
        objc_msgSend(v19, "arrayWithObjects:", v10, v20, 0);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addKeyValueArray:with:", CFSTR("PrerequisiteBuild"), v70);

        v71 = (void *)MEMORY[0x1E0C99DE8];
        -[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "arrayWithObjects:", v10, v72, 0);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addKeyValueArray:with:", CFSTR("PrerequisiteOSVersion"), v73);

        v74 = objc_alloc(MEMORY[0x1E0CB3940]);
        -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
        v27 = objc_claimAutoreleasedReturnValue();
        -[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v74, "initWithFormat:", CFSTR("prerequisite:%@:%@|"), v27, v28);
      }
      v75 = (void *)v29;
      objc_msgSend(v11, "stringByAppendingString:", v29);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = 0x1E0CB3000;
      v11 = (void *)v27;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v10);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addKeyValueArray:with:", CFSTR("PrerequisiteBuild"), v30);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v10);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addKeyValueArray:with:", CFSTR("PrerequisiteOSVersion"), v31);

  objc_msgSend(v11, "stringByAppendingString:", CFSTR("prerequisite:(full)|"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  -[SUCorePolicy hwModelStr](self, "hwModelStr");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v35 = v34;
  if (v33)
  {
    -[SUCorePolicy hwModelStr](self, "hwModelStr");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v35, "initWithObjects:", v10, v36, 0);
    objc_msgSend(v7, "addKeyValueArray:with:", CFSTR("SupportedDeviceModels"), v37);

  }
  else
  {
    v36 = (void *)objc_msgSend(v34, "initWithObjects:", v10, 0);
    objc_msgSend(v7, "addKeyValueArray:with:", CFSTR("SupportedDeviceModels"), v36);
  }

  v39 = objc_alloc(*(Class *)(v13 + 2368));
  -[SUCorePolicy hwModelStr](self, "hwModelStr");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)objc_msgSend(v39, "initWithFormat:", CFSTR("hwModelStr:%@|"), v40);
  objc_msgSend(v32, "stringByAppendingString:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCorePolicy productType](self, "productType");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    v44 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[SUCorePolicy productType](self, "productType");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)objc_msgSend(v44, "initWithObjects:", v10, v45, 0);
    objc_msgSend(v7, "addKeyValueArray:with:", CFSTR("SupportedDevices"), v46);

  }
  v47 = objc_alloc(*(Class *)(v13 + 2368));
  -[SUCorePolicy productType](self, "productType");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)objc_msgSend(v47, "initWithFormat:", CFSTR("productType:%@|"), v48);
  objc_msgSend(v42, "stringByAppendingString:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCorePolicy releaseType](self, "releaseType");
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v78 = v4;
  if (v51)
  {
    -[SUCorePolicy releaseType](self, "releaseType");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addKeyValuePair:with:", CFSTR("ReleaseType"), v52);

    v53 = objc_alloc(*(Class *)(v13 + 2368));
    -[SUCorePolicy releaseType](self, "releaseType");
    v54 = objc_claimAutoreleasedReturnValue();
    v55 = (void *)objc_msgSend(v53, "initWithFormat:", CFSTR("releaseType:%@|"), v54);
    objc_msgSend(v50, "stringByAppendingString:", v55);
    v56 = objc_claimAutoreleasedReturnValue();

    v50 = (void *)v54;
  }
  else
  {
    v57 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v10, 0);
    objc_msgSend(v7, "addKeyValueArray:with:", CFSTR("ReleaseType"), v57);

    objc_msgSend(v50, "stringByAppendingString:", CFSTR("releaseType:customer|"));
    v56 = objc_claimAutoreleasedReturnValue();
  }
  v77 = (void *)v10;

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "oslog");
  v59 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v85 = (SUCorePolicy *)v56;
    _os_log_impl(&dword_1DDFDD000, v59, OS_LOG_TYPE_DEFAULT, "[POLICY] querying SU metadata: %{public}@", buf, 0xCu);
  }
  v76 = (void *)v56;

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  -[SUCorePolicy policyExtensions](self, "policyExtensions");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v80;
    do
    {
      for (i = 0; i != v62; ++i)
      {
        if (*(_QWORD *)v80 != v63)
          objc_enumerationMutation(v60);
        v65 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "oslog");
        v67 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v65, "extensionName");
          v68 = (SUCorePolicy *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v85 = v68;
          _os_log_impl(&dword_1DDFDD000, v67, OS_LOG_TYPE_DEFAULT, "[POLICY] extending query for extension %{public}@", buf, 0xCu);

        }
        objc_msgSend(v65, "extendSoftwareUpdateMAAssetQuery:", v7);
      }
      v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
    }
    while (v62);
  }

  v38 = v77;
  v4 = v78;
LABEL_32:

  return v7;
}

- (id)constructDocumentationMAAssetQueryWithDocID:(id)a3 purpose:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  NSObject *v27;
  SUCorePolicy *v28;
  void *v29;
  void *v31;
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  SUCorePolicy *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "oslog");
  v9 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v40 = self;
    _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "[POLICY] constructDocumentationMAAssetQueryWithDocID for policy: %{public}@", buf, 0xCu);
  }

  -[SUCorePolicy documentationAssetType](self, "documentationAssetType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0D4E050]);
    -[SUCorePolicy documentationAssetType](self, "documentationAssetType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v11, "initWithType:andPurpose:", v12, v7);

    objc_msgSend(v10, "addKeyValuePair:with:", CFSTR("SUDocumentationID"), v6);
    -[SUCorePolicy deviceClass](self, "deviceClass");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addKeyValuePair:with:", CFSTR("Device"), v13);

    v33 = v6;
    objc_msgSend(CFSTR("|"), "stringByAppendingFormat:", CFSTR("documentationID:%@|"), v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCorePolicy deviceClass](self, "deviceClass");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingFormat:", CFSTR("deviceClass:%@|"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = v7;
    objc_msgSend(v16, "stringByAppendingFormat:", CFSTR("purpose:%@|"), v7);
    v17 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "oslog");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v40 = (SUCorePolicy *)v17;
      _os_log_impl(&dword_1DDFDD000, v19, OS_LOG_TYPE_DEFAULT, "[POLICY] documentation asset query options: %{public}@", buf, 0xCu);
    }
    v31 = (void *)v17;

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[SUCorePolicy policyExtensions](self, "policyExtensions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v35 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "oslog");
          v27 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v25, "extensionName");
            v28 = (SUCorePolicy *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v40 = v28;
            _os_log_impl(&dword_1DDFDD000, v27, OS_LOG_TYPE_DEFAULT, "[POLICY] extending documentation options for extension %{public}@", buf, 0xCu);

          }
          objc_msgSend(v25, "extendDocumentationMAAssetQuery:", v10);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v22);
    }

    v7 = v32;
    v6 = v33;
    v29 = v31;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "trackAnomaly:forReason:withResult:withError:", CFSTR("[POLICY] CONSTRUCT_DOC_QUERY"), CFSTR("documentationAssetType was unexpectedly nil, client is required to init with documentationAssetType"), 8118, 0);
  }

  return v10;
}

- (void)selectSoftwareUpdatePrimaryAsset:(id *)a3 secondaryAsset:(id *)a4 fromAssetQuery:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  id v44;
  void *v45;
  NSObject *v46;
  BOOL v47;
  void *v48;
  _QWORD *v49;
  void *v50;
  uint64_t v51;
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
  NSObject *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  NSObject *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  uint64_t v76;
  NSObject *v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  id v81;
  uint64_t v82;
  uint64_t i;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  NSObject *v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  NSObject *v100;
  void *v101;
  NSObject *v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  id v107;
  void *v108;
  NSObject *v109;
  void *v110;
  id v111;
  id *v112;
  id *v113;
  id v114;
  NSObject *v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _QWORD v120[4];
  id v121;
  _QWORD v122[4];
  id v123;
  _QWORD v124[5];
  _QWORD v125[5];
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  uint8_t v130[128];
  uint8_t buf[4];
  SUCorePolicy *v132;
  __int16 v133;
  void *v134;
  _BYTE v135[128];
  uint64_t v136;

  v136 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "oslog");
  v10 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v132 = self;
    _os_log_impl(&dword_1DDFDD000, v10, OS_LOG_TYPE_DEFAULT, "[POLICY] selectSoftwareUpdatePrimaryAsset:secondaryAsset:fromAssetQuery for policy: %@", buf, 0xCu);
  }

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = CFSTR("selectSoftwareUpdatePrimaryAsset called with unexpected nil primaryAsset param");
LABEL_13:
    objc_msgSend(v14, "trackError:forReason:withResult:withError:", CFSTR("[POLICY] SELECT_UPDATE_ASSET"), v16, 8102, 0);
    goto LABEL_93;
  }
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = CFSTR("selectSoftwareUpdatePrimaryAsset called with unexpected nil secondaryAsset param");
    goto LABEL_13;
  }
  -[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {

LABEL_16:
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("selectSoftwareUpdatePrimaryAsset called with unexpected nil/non-nil values for prerequisiteProductVersion (%@) and prerequisiteBuildVersion (%@)"), v19, v20);
      objc_msgSend(v15, "trackError:forReason:withResult:withError:", CFSTR("[POLICY] SELECT_UPDATE_ASSET"), v21, 8116, 0);

      goto LABEL_93;
    }
  }
  -[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    if (!v13)
      goto LABEL_16;
  }
  else
  {

    if (v11)
  }
  objc_msgSend(v8, "SUCoreBorder_results");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v15, "count");
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "oslog");
  v24 = objc_claimAutoreleasedReturnValue();

  v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (!v22)
  {
    if (v25)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDFDD000, v24, OS_LOG_TYPE_DEFAULT, "[POLICY] 0 SU query results (before filtering)", buf, 2u);
    }
    goto LABEL_92;
  }
  v112 = a3;
  v113 = a4;
  if (v25)
  {
    v26 = objc_msgSend(v15, "count");
    *(_DWORD *)buf = 134217984;
    v132 = (SUCorePolicy *)v26;
    _os_log_impl(&dword_1DDFDD000, v24, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu SU query results (before filtering)", buf, 0xCu);
  }
  v114 = v8;

  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  -[SUCorePolicy policyExtensions](self, "policyExtensions");
  v24 = objc_claimAutoreleasedReturnValue();
  v27 = -[NSObject countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v126, v135, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v127;
    do
    {
      v30 = 0;
      v31 = v15;
      do
      {
        if (*(_QWORD *)v127 != v29)
          objc_enumerationMutation(v24);
        v32 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * v30);
        objc_msgSend(v32, "filterSoftwareUpdateAssetArray:", v31);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "oslog");
        v34 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = objc_msgSend(v15, "count");
          objc_msgSend(v32, "extensionName");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v132 = (SUCorePolicy *)v35;
          v133 = 2114;
          v134 = v36;
          _os_log_impl(&dword_1DDFDD000, v34, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu assets left after filtering from SUCorePolicyExtension %{public}@", buf, 0x16u);

        }
        if (!objc_msgSend(v15, "count"))
        {
          objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "oslog");
          v43 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DDFDD000, v43, OS_LOG_TYPE_DEFAULT, "[POLICY] 0 assets found, stopping filtering early", buf, 2u);
          }

          v8 = v114;
          goto LABEL_92;
        }
        ++v30;
        v31 = v15;
      }
      while (v28 != v30);
      v28 = -[NSObject countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v126, v135, 16);
    }
    while (v28);
  }

  -[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion");
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = MEMORY[0x1E0C809B0];
  if (!v37
    || (v39 = (void *)v37,
        -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion"),
        v40 = (void *)objc_claimAutoreleasedReturnValue(),
        v40,
        v39,
        !v40))
  {
    v44 = v15;
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "oslog");
    v46 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDFDD000, v46, OS_LOG_TYPE_DEFAULT, "[POLICY] not filtering for productVersion or buildVersion in SUCorePolicy", buf, 2u);
    }
    v108 = 0;
    goto LABEL_49;
  }
  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v41, "allowSameVersion") & 1) != 0)
  {

LABEL_45:
    v48 = (void *)MEMORY[0x1E0CB3880];
    v125[0] = v38;
    v125[1] = 3221225472;
    v125[2] = __79__SUCorePolicy_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke;
    v125[3] = &unk_1EA877F48;
    v125[4] = self;
    v49 = v125;
    goto LABEL_47;
  }
  v47 = -[SUCorePolicy isSplatPolicy](self, "isSplatPolicy");

  if (v47)
    goto LABEL_45;
  v48 = (void *)MEMORY[0x1E0CB3880];
  v124[0] = v38;
  v124[1] = 3221225472;
  v124[2] = __79__SUCorePolicy_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke_403;
  v124[3] = &unk_1EA877F48;
  v124[4] = self;
  v49 = v124;
LABEL_47:
  objc_msgSend(v48, "predicateWithBlock:", v49);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "filteredArrayUsingPredicate:", v108);
  v44 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "oslog");
  v46 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    v51 = objc_msgSend(v44, "count");
    *(_DWORD *)buf = 134217984;
    v132 = (SUCorePolicy *)v51;
    _os_log_impl(&dword_1DDFDD000, v46, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu assets left after filtering for productVersion in SUCorePolicy", buf, 0xCu);
  }
LABEL_49:

  v111 = v44;
  objc_msgSend(v44, "sortedArrayUsingComparator:", &__block_literal_global_9);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "lastObject");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "attributes");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "safeStringForKey:", CFSTR("OSVersion"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCorePolicy _cleanProductVersion:](SUCorePolicy, "_cleanProductVersion:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = v52;
  v58 = (void *)MEMORY[0x1E0CB3880];
  v122[0] = v38;
  v122[1] = 3221225472;
  v122[2] = __79__SUCorePolicy_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke_2;
  v122[3] = &unk_1EA877F48;
  v107 = v56;
  v123 = v107;
  objc_msgSend(v58, "predicateWithBlock:", v122);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "filteredArrayUsingPredicate:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "oslog");
  v62 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    v63 = objc_msgSend(v60, "count");
    *(_DWORD *)buf = 134217984;
    v132 = (SUCorePolicy *)v63;
    _os_log_impl(&dword_1DDFDD000, v62, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu assets left after filtering for highestProductVersionAssets in SUCorePolicy", buf, 0xCu);
  }

  v110 = v60;
  if (!objc_msgSend(v60, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "oslog");
    v95 = objc_claimAutoreleasedReturnValue();

    v75 = v111;
    v109 = v95;
    if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDFDD000, v95, OS_LOG_TYPE_DEFAULT, "[POLICY] 0 assets found", buf, 2u);
    }
    v24 = 0;
    v96 = 0;
    v69 = 0;
    v97 = 0;
    v8 = v114;
    v98 = v107;
    goto LABEL_91;
  }
  objc_msgSend(v60, "sortedArrayUsingComparator:", &__block_literal_global_408);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "lastObject");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "attributes");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("Build"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = (void *)MEMORY[0x1E0CB3880];
  v69 = v64;
  v120[0] = v38;
  v120[1] = 3221225472;
  v120[2] = __79__SUCorePolicy_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke_2_409;
  v120[3] = &unk_1EA877F48;
  v70 = v67;
  v121 = v70;
  objc_msgSend(v68, "predicateWithBlock:", v120);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "filteredArrayUsingPredicate:", v71);
  v72 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "oslog");
  v74 = objc_claimAutoreleasedReturnValue();

  v75 = v111;
  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
  {
    v76 = -[NSObject count](v72, "count");
    *(_DWORD *)buf = 134217984;
    v132 = (SUCorePolicy *)v76;
    _os_log_impl(&dword_1DDFDD000, v74, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu assets left after filtering for highestBuildVersionAssets in SUCorePolicy", buf, 0xCu);
  }

  v109 = v72;
  v106 = v70;
  if (!-[NSObject count](v72, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "oslog");
    v100 = objc_claimAutoreleasedReturnValue();

    v98 = v107;
    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDFDD000, v100, OS_LOG_TYPE_DEFAULT, "[POLICY] 0 assets found", buf, 2u);
    }

    v24 = 0;
    v96 = 0;
    v8 = v114;
    goto LABEL_90;
  }
  v104 = v69;
  v105 = v57;
  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  v77 = v72;
  v78 = -[NSObject countByEnumeratingWithState:objects:count:](v77, "countByEnumeratingWithState:objects:count:", &v116, v130, 16);
  v115 = v77;
  if (!v78)
  {

    v8 = v114;
LABEL_83:
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "oslog");
    v102 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDFDD000, v102, OS_LOG_TYPE_DEFAULT, "[POLICY] query to locate update asset did not find pure partial or full; selecting first with highest build",
        buf,
        2u);
    }

    -[NSObject firstObject](v115, "firstObject");
    v80 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_88;
  }
  v79 = v78;
  v103 = v15;
  v80 = 0;
  v81 = 0;
  v82 = *(_QWORD *)v117;
  do
  {
    for (i = 0; i != v79; ++i)
    {
      if (*(_QWORD *)v117 != v82)
        objc_enumerationMutation(v77);
      v84 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * i);
      if (!v80)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v116 + 1) + 8 * i), "attributes");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "objectForKeyedSubscript:", CFSTR("PrerequisiteBuild"));
        v88 = objc_claimAutoreleasedReturnValue();
        if (v88)
        {
          v89 = (void *)v88;
          objc_msgSend(v84, "attributes");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "objectForKeyedSubscript:", CFSTR("PrerequisiteOSVersion"));
          v91 = (void *)objc_claimAutoreleasedReturnValue();

          v77 = v115;
          if (v91)
          {
            v80 = v84;
            continue;
          }
        }
        else
        {

        }
      }
      if (!v81)
      {
        objc_msgSend(v84, "attributes");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "objectForKeyedSubscript:", CFSTR("PrerequisiteBuild"));
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        if (v86)
        {

          v81 = 0;
        }
        else
        {
          objc_msgSend(v84, "attributes");
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR("PrerequisiteOSVersion"));
          v93 = (void *)objc_claimAutoreleasedReturnValue();

          if (v93)
            v81 = 0;
          else
            v81 = v84;
          v77 = v115;
        }
      }
    }
    v79 = -[NSObject countByEnumeratingWithState:objects:count:](v77, "countByEnumeratingWithState:objects:count:", &v116, v130, 16);
  }
  while (v79);

  if (v80)
  {
    v8 = v114;
    v15 = v103;
    goto LABEL_89;
  }
  v8 = v114;
  v15 = v103;
  if (!v81)
    goto LABEL_83;
  v80 = v81;
LABEL_88:
  v81 = 0;
LABEL_89:
  v24 = objc_retainAutorelease(v80);
  *v112 = v24;
  v96 = objc_retainAutorelease(v81);
  *v113 = v96;
  v75 = v111;
  v69 = v104;
  v57 = v105;
  v98 = v107;
LABEL_90:

  v97 = v106;
LABEL_91:

LABEL_92:
LABEL_93:

}

BOOL __79__SUCorePolicy_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("Build"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "safeStringForKey:", CFSTR("OSVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCoreDescriptor cleanProductVersion:](SUCoreDescriptor, "cleanProductVersion:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "prerequisiteProductVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "prerequisiteBuildVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[SUCorePolicy getAllowSameProductVersionPredicateResultWithAssetOSVersion:assetBuildVersion:prerequisiteProductVersion:prerequisiteBuildVersion:](SUCorePolicy, "getAllowSameProductVersionPredicateResultWithAssetOSVersion:assetBuildVersion:prerequisiteProductVersion:prerequisiteBuildVersion:", v8, v5, v9, v10);

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "oslog");
  v13 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "prerequisiteBuildVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "prerequisiteProductVersion");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    v19 = 138544386;
    v17 = CFSTR("NO");
    v20 = v5;
    if (v11)
      v17 = CFSTR("YES");
    v21 = 2114;
    v22 = v8;
    v23 = 2114;
    v24 = v14;
    v25 = 2114;
    v26 = v15;
    v27 = 2114;
    v28 = v17;
    _os_log_impl(&dword_1DDFDD000, v13, OS_LOG_TYPE_DEFAULT, "[POLICY] filtering by product version (allow same), assetBuildVersion=%{public}@, assetOSVersion=%{public}@, prerequisiteBuildVersion=%{public}@, prerequisiteProductVersion=%{public}@ | keep=%{public}@", (uint8_t *)&v19, 0x34u);

  }
  return v11;
}

BOOL __79__SUCorePolicy_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke_403(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("Build"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "safeStringForKey:", CFSTR("OSVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCoreDescriptor cleanProductVersion:](SUCoreDescriptor, "cleanProductVersion:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "prerequisiteProductVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "prerequisiteBuildVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[SUCorePolicy getNoAllowSameProductVersionPredicateResultWithAssetOSVersion:assetBuildVersion:prerequisiteProductVersion:prerequisiteBuildVersion:](SUCorePolicy, "getNoAllowSameProductVersionPredicateResultWithAssetOSVersion:assetBuildVersion:prerequisiteProductVersion:prerequisiteBuildVersion:", v8, v5, v9, v10);

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "oslog");
  v13 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "prerequisiteBuildVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "prerequisiteProductVersion");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    v19 = 138544386;
    v17 = CFSTR("NO");
    v20 = v5;
    if (v11)
      v17 = CFSTR("YES");
    v21 = 2114;
    v22 = v8;
    v23 = 2114;
    v24 = v14;
    v25 = 2114;
    v26 = v15;
    v27 = 2114;
    v28 = v17;
    _os_log_impl(&dword_1DDFDD000, v13, OS_LOG_TYPE_DEFAULT, "[POLICY] filtering by product version, assetBuildVersion=%{public}@, assetOSVersion=%{public}@, prerequisiteBuildVersion=%{public}@, prerequisiteProductVersion=%{public}@ | keep=%{public}@", (uint8_t *)&v19, 0x34u);

  }
  return v11;
}

uint64_t __79__SUCorePolicy_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke_404(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(a2, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeStringForKey:", CFSTR("OSVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCorePolicy _cleanProductVersion:](SUCorePolicy, "_cleanProductVersion:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "safeStringForKey:", CFSTR("OSVersion"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCorePolicy _cleanProductVersion:](SUCorePolicy, "_cleanProductVersion:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v7, "compare:options:", v10, 64);
  return v11;
}

uint64_t __79__SUCorePolicy_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  const __CFString *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("OSVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCorePolicy _cleanProductVersion:](SUCorePolicy, "_cleanProductVersion:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(MEMORY[0x1E0DA8920], "stringIsEqual:to:", v5, *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "oslog");
  v8 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = CFSTR("NO");
    v12 = 138543874;
    if ((_DWORD)v6)
      v10 = CFSTR("YES");
    v13 = v9;
    v14 = 2114;
    v15 = v5;
    v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_1DDFDD000, v8, OS_LOG_TYPE_DEFAULT, "[POLICY] filtering highest product version, highestProductVersion=%{public}@, assetProductVersion=%{public}@ | keep=%{public}@", (uint8_t *)&v12, 0x20u);
  }

  return v6;
}

uint64_t __79__SUCorePolicy_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke_407(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Build"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Build"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v6, "compare:options:", v8, 64);
  if (!v9)
    v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

uint64_t __79__SUCorePolicy_selectSoftwareUpdatePrimaryAsset_secondaryAsset_fromAssetQuery___block_invoke_2_409(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0DA8920];
  objc_msgSend(v3, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeStringForKey:", CFSTR("Build"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "stringIsEqual:to:", v6, *(_QWORD *)(a1 + 32));

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "oslog");
  v9 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "attributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Build"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = CFSTR("NO");
    v16 = 138543874;
    v17 = v10;
    v18 = 2114;
    if ((_DWORD)v7)
      v14 = CFSTR("YES");
    v19 = v12;
    v20 = 2114;
    v21 = v14;
    _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "[POLICY] filtering highest build version, highestBuildVersion=%{public}@, assetBuildVersion=%{public}@ | keep=%{public}@", (uint8_t *)&v16, 0x20u);

  }
  return v7;
}

+ (BOOL)getAllowSameProductVersionPredicateResultWithAssetOSVersion:(id)a3 assetBuildVersion:(id)a4 prerequisiteProductVersion:(id)a5 prerequisiteBuildVersion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  BOOL v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v9, "compare:options:", v11, 64) == 1)
  {
    v13 = 1;
  }
  else if (objc_msgSend(v9, "compare:options:", v11, 64))
  {
    v13 = 0;
  }
  else
  {
    v13 = objc_msgSend(v10, "compare:options:", v12, 64) != -1;
  }

  return v13;
}

+ (BOOL)getNoAllowSameProductVersionPredicateResultWithAssetOSVersion:(id)a3 assetBuildVersion:(id)a4 prerequisiteProductVersion:(id)a5 prerequisiteBuildVersion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  BOOL v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v9, "compare:options:", v11, 64) == 1)
  {
    v13 = 1;
  }
  else if (objc_msgSend(v9, "compare:options:", v11, 64))
  {
    v13 = 0;
  }
  else
  {
    v13 = objc_msgSend(v10, "compare:options:", v12, 64) == 1;
  }

  return v13;
}

- (void)selectSoftwareUpdateMajorPrimaryAsset:(id *)a3 majorSecondaryAsset:(id *)a4 minorPrimaryAsset:(id *)a5 minorSecondaryAsset:(id *)a6 fromAssetQuery:(id)a7
{
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  _BOOL4 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t i;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  SUCorePolicy *v48;
  void *v49;
  int v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  NSObject *v90;
  void *v91;
  void *v92;
  int v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  NSObject *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  void *v107;
  void *v108;
  void *v109;
  NSObject *v110;
  uint64_t v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  id v115;
  id v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  void *v124;
  id v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  uint64_t v130;
  void *v131;
  NSObject *v132;
  void *v133;
  SUCorePolicy *v134;
  id *v135;
  void *v136;
  NSObject *v137;
  id v138;
  id v139;
  id v140;
  void *v141;
  void *v142;
  void *v143;
  id v144;
  void *v145;
  id v146;
  id v147;
  id *v148;
  id *v149;
  id *v150;
  id v151;
  void *v152;
  SUCorePolicy *v153;
  id v154;
  id *v155;
  void *v156;
  void *v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  _QWORD v162[4];
  id v163;
  _QWORD v164[4];
  NSObject *v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  _QWORD v170[4];
  id v171;
  _QWORD v172[4];
  id v173;
  SUCorePolicy *v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  _BYTE v179[128];
  uint8_t v180[128];
  uint8_t buf[4];
  SUCorePolicy *v182;
  __int16 v183;
  void *v184;
  _BYTE v185[128];
  uint64_t v186;

  v186 = *MEMORY[0x1E0C80C00];
  v12 = a7;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "oslog");
  v14 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v182 = self;
    _os_log_impl(&dword_1DDFDD000, v14, OS_LOG_TYPE_DEFAULT, "[POLICY] Select major/minor software update for policy: %@", buf, 0xCu);
  }

  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  if (a6)
    *a6 = 0;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = CFSTR("Select major/minor software update called with unexpected nil majorPrimaryAsset param");
LABEL_25:
    objc_msgSend(v18, "trackError:forReason:withResult:withError:", CFSTR("[POLICY] SELECT_UPDATE_ASSET"), v20, 8102, 0);
    goto LABEL_26;
  }
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = CFSTR("Select major/minor software update called with unexpected nil majorSecondaryAsset param");
    goto LABEL_25;
  }
  if (!a5)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = CFSTR("Select major/minor software update called with unexpected nil minorPrimaryAsset param");
    goto LABEL_25;
  }
  if (!a6)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = CFSTR("Select major/minor software update called with unexpected nil minorSecondaryAsset param");
    goto LABEL_25;
  }
  -[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {

LABEL_29:
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("Select major/minor software update called with unexpected nil/non-nil values for prerequisiteProductVersion (%@) and prerequisiteBuildVersion (%@)"), v23, v24);
      objc_msgSend(v19, "trackError:forReason:withResult:withError:", CFSTR("[POLICY] SELECT_UPDATE_ASSET"), v25, 8116, 0);

      goto LABEL_26;
    }
  }
  v155 = a3;
  -[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    if (!v17)
      goto LABEL_29;
  }
  else
  {

    if (v15)
  }
  v26 = objc_alloc(MEMORY[0x1E0DA8980]);
  -[SUCorePolicy prerequisiteRestoreVersion](self, "prerequisiteRestoreVersion");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v26, "initWithRestoreVersion:", v27);

  -[SUCorePolicy prerequisiteRestoreVersion](self, "prerequisiteRestoreVersion");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28 || !v19)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "trackError:forReason:withResult:withError:", CFSTR("[POLICY] SELECT_UPDATE_ASSET"), CFSTR("Select major/minor software update called with unexpected nil prerequisiteRestoreVersion property or inability to parse version string"), 8116, 0);
    goto LABEL_129;
  }
  v153 = self;
  objc_msgSend(v12, "SUCoreBorder_results");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v156, "count");
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "oslog");
  v31 = objc_claimAutoreleasedReturnValue();

  v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
  if (!v29)
  {
    if (v32)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDFDD000, v31, OS_LOG_TYPE_DEFAULT, "[POLICY] 0 SU query results (before filtering)", buf, 2u);
    }
    goto LABEL_128;
  }
  if (v32)
  {
    v33 = objc_msgSend(v156, "count");
    *(_DWORD *)buf = 134217984;
    v182 = (SUCorePolicy *)v33;
    _os_log_impl(&dword_1DDFDD000, v31, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu SU query results (before filtering)", buf, 0xCu);
  }
  v148 = a4;
  v149 = a5;
  v150 = a6;
  v151 = v12;
  v152 = v19;

  v177 = 0u;
  v178 = 0u;
  v175 = 0u;
  v176 = 0u;
  -[SUCorePolicy policyExtensions](v153, "policyExtensions");
  v31 = objc_claimAutoreleasedReturnValue();
  v34 = -[NSObject countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v175, v185, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v176;
    v37 = v156;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v176 != v36)
          objc_enumerationMutation(v31);
        v39 = *(void **)(*((_QWORD *)&v175 + 1) + 8 * i);
        objc_msgSend(v39, "filterSoftwareUpdateAssetArray:", v37);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "oslog");
        v42 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          v43 = objc_msgSend(v40, "count");
          objc_msgSend(v39, "extensionName");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v182 = (SUCorePolicy *)v43;
          v183 = 2114;
          v184 = v44;
          _os_log_impl(&dword_1DDFDD000, v42, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu assets left after filtering from SUCorePolicyExtension %{public}@", buf, 0x16u);

        }
        if (!objc_msgSend(v40, "count"))
        {
          v156 = v40;
          objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "oslog");
          v47 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DDFDD000, v47, OS_LOG_TYPE_DEFAULT, "[POLICY] 0 assets found, stopping filtering early", buf, 2u);
          }

          goto LABEL_127;
        }
        v37 = v40;
      }
      v35 = -[NSObject countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v175, v185, 16);
      v37 = v40;
    }
    while (v35);
  }
  else
  {
    v37 = v156;
  }
  v156 = v37;

  v48 = v153;
  -[SUCorePolicy softwareUpdateScanPolicy](v153, "softwareUpdateScanPolicy");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "shouldScanForMinorUpdates");

  if (!v50)
  {
    v71 = 0;
    v147 = 0;
    v86 = v152;
    goto LABEL_90;
  }
  v51 = (void *)MEMORY[0x1E0CB3880];
  v52 = MEMORY[0x1E0C809B0];
  v172[0] = MEMORY[0x1E0C809B0];
  v172[1] = 3221225472;
  v172[2] = __127__SUCorePolicy_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke;
  v172[3] = &unk_1EA879C80;
  v173 = v152;
  v174 = v153;
  objc_msgSend(v51, "predicateWithBlock:", v172);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "filteredArrayUsingPredicate:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "oslog");
  v56 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
  {
    v57 = objc_msgSend(v54, "count");
    *(_DWORD *)buf = 134217984;
    v182 = (SUCorePolicy *)v57;
    _os_log_impl(&dword_1DDFDD000, v56, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu assets left after filtering for minor assets in SUCorePolicy", buf, 0xCu);
  }

  objc_msgSend(v54, "sortedArrayUsingComparator:", &__block_literal_global_424);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "lastObject");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "attributes");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "safeStringForKey:", CFSTR("RestoreVersion"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v62 = (void *)MEMORY[0x1E0CB3880];
  v170[0] = v52;
  v170[1] = 3221225472;
  v170[2] = __127__SUCorePolicy_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke_2;
  v170[3] = &unk_1EA877F48;
  v144 = v61;
  v171 = v144;
  objc_msgSend(v62, "predicateWithBlock:", v170);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = v58;
  objc_msgSend(v58, "filteredArrayUsingPredicate:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "oslog");
  v66 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    v67 = objc_msgSend(v64, "count");
    *(_DWORD *)buf = 134217984;
    v182 = (SUCorePolicy *)v67;
    _os_log_impl(&dword_1DDFDD000, v66, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu assets left after filtering for highest minor assets in SUCorePolicy", buf, 0xCu);
  }

  v168 = 0u;
  v169 = 0u;
  v166 = 0u;
  v167 = 0u;
  v68 = v64;
  v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v166, v180, 16);
  v157 = v68;
  if (!v69)
  {

    v86 = v152;
    v88 = v144;
    v87 = v58;
LABEL_83:
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "oslog");
    v90 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDFDD000, v90, OS_LOG_TYPE_DEFAULT, "[POLICY] query to locate minor update asset did not find pure partial or full; selecting first with highest build",
        buf,
        2u);
    }

    v91 = v157;
    objc_msgSend(v157, "firstObject");
    v71 = (id)objc_claimAutoreleasedReturnValue();
    v72 = 0;
    goto LABEL_89;
  }
  v70 = v69;
  v142 = v54;
  v71 = 0;
  v72 = 0;
  v73 = *(_QWORD *)v167;
  do
  {
    v74 = 0;
    do
    {
      if (*(_QWORD *)v167 != v73)
        objc_enumerationMutation(v68);
      v75 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * v74);
      if (!v71)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v166 + 1) + 8 * v74), "attributes");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "safeStringForKey:", CFSTR("PrerequisiteBuild"));
        v79 = objc_claimAutoreleasedReturnValue();
        if (v79)
        {
          v80 = (void *)v79;
          objc_msgSend(v75, "attributes");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v81, "safeStringForKey:", CFSTR("PrerequisiteOSVersion"));
          v82 = (void *)objc_claimAutoreleasedReturnValue();

          v71 = 0;
          v68 = v157;

          if (v82)
          {
            v71 = v75;
            goto LABEL_75;
          }
        }
        else
        {

        }
      }
      if (v72)
        goto LABEL_75;
      objc_msgSend(v75, "attributes");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "safeStringForKey:", CFSTR("PrerequisiteBuild"));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      if (v77)
      {

LABEL_74:
        v72 = 0;
        goto LABEL_75;
      }
      objc_msgSend(v75, "attributes");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "safeStringForKey:", CFSTR("PrerequisiteOSVersion"));
      v84 = (void *)objc_claimAutoreleasedReturnValue();

      if (v84)
        goto LABEL_74;
      v72 = v75;
LABEL_75:
      ++v74;
    }
    while (v70 != v74);
    v85 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v166, v180, 16);
    v70 = v85;
  }
  while (v85);

  v48 = v153;
  v54 = v142;
  if (v71)
  {
    v86 = v152;
    v88 = v144;
    v87 = v146;
    goto LABEL_88;
  }
  v86 = v152;
  v88 = v144;
  v87 = v146;
  if (!v72)
    goto LABEL_83;
  v71 = v72;
  v72 = 0;
LABEL_88:
  v91 = v157;
LABEL_89:
  v147 = v72;

LABEL_90:
  -[SUCorePolicy softwareUpdateScanPolicy](v48, "softwareUpdateScanPolicy");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = objc_msgSend(v92, "shouldScanForMajorUpdates");

  v154 = v71;
  if (!v93)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v131, "oslog");
    v132 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCorePolicy softwareUpdateScanPolicy](v48, "softwareUpdateScanPolicy");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      +[SUCorePolicySoftwareUpdateScan nameForScanUpdateType:](SUCorePolicySoftwareUpdateScan, "nameForScanUpdateType:", objc_msgSend(v133, "scanUpdateType"));
      v134 = (SUCorePolicy *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v182 = v134;
      _os_log_impl(&dword_1DDFDD000, v132, OS_LOG_TYPE_DEFAULT, "[POLICY] not scanning for major software update assets as scan update type is %{public}@", buf, 0xCu);

    }
    v115 = 0;
    v116 = 0;
    v135 = v155;
    goto LABEL_126;
  }
  v94 = (void *)MEMORY[0x1E0CB3880];
  v95 = MEMORY[0x1E0C809B0];
  v164[0] = MEMORY[0x1E0C809B0];
  v164[1] = 3221225472;
  v164[2] = __127__SUCorePolicy_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke_425;
  v164[3] = &unk_1EA877F48;
  v165 = v86;
  objc_msgSend(v94, "predicateWithBlock:", v164);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v156, "filteredArrayUsingPredicate:", v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "oslog");
  v99 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
  {
    v100 = objc_msgSend(v97, "count");
    *(_DWORD *)buf = 134217984;
    v182 = (SUCorePolicy *)v100;
    _os_log_impl(&dword_1DDFDD000, v99, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu assets left after filtering for major assets in SUCorePolicy", buf, 0xCu);
  }

  v143 = v97;
  objc_msgSend(v97, "sortedArrayUsingComparator:", &__block_literal_global_427);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "lastObject");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "attributes");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "safeStringForKey:", CFSTR("RestoreVersion"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  v105 = (void *)MEMORY[0x1E0CB3880];
  v162[0] = v95;
  v162[1] = 3221225472;
  v162[2] = __127__SUCorePolicy_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke_2_428;
  v162[3] = &unk_1EA877F48;
  v106 = v104;
  v163 = v106;
  objc_msgSend(v105, "predicateWithBlock:", v162);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = v101;
  objc_msgSend(v101, "filteredArrayUsingPredicate:", v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "oslog");
  v110 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
  {
    v111 = objc_msgSend(v108, "count");
    *(_DWORD *)buf = 134217984;
    v182 = (SUCorePolicy *)v111;
    _os_log_impl(&dword_1DDFDD000, v110, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu assets left after filtering for highest major assets in SUCorePolicy", buf, 0xCu);
  }

  v160 = 0u;
  v161 = 0u;
  v158 = 0u;
  v159 = 0u;
  v112 = v108;
  v113 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v158, v179, 16);
  v145 = v106;
  if (!v113)
  {

    goto LABEL_121;
  }
  v114 = v113;
  v115 = 0;
  v116 = 0;
  v117 = *(_QWORD *)v159;
  while (2)
  {
    v118 = 0;
    while (2)
    {
      if (*(_QWORD *)v159 != v117)
        objc_enumerationMutation(v112);
      v119 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * v118);
      if (v115)
      {
LABEL_101:
        if (!v116)
        {
          objc_msgSend(v119, "attributes");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v120, "safeStringForKey:", CFSTR("PrerequisiteBuild"));
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          if (v121)
          {

            goto LABEL_109;
          }
          objc_msgSend(v119, "attributes");
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v128, "safeStringForKey:", CFSTR("PrerequisiteOSVersion"));
          v129 = (void *)objc_claimAutoreleasedReturnValue();

          if (v129)
LABEL_109:
            v116 = 0;
          else
            v116 = v119;
        }
      }
      else
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v158 + 1) + 8 * v118), "attributes");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v122, "safeStringForKey:", CFSTR("PrerequisiteBuild"));
        v123 = objc_claimAutoreleasedReturnValue();
        if (!v123)
        {

          goto LABEL_101;
        }
        v124 = (void *)v123;
        objc_msgSend(v119, "attributes");
        v125 = v112;
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "safeStringForKey:", CFSTR("PrerequisiteOSVersion"));
        v127 = (void *)objc_claimAutoreleasedReturnValue();

        v112 = v125;
        v115 = 0;

        if (!v127)
          goto LABEL_101;
        v115 = v119;
      }
      if (v114 != ++v118)
        continue;
      break;
    }
    v130 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v158, v179, 16);
    v114 = v130;
    if (v130)
      continue;
    break;
  }

  if (!v115)
  {
    if (v116)
    {
      v115 = v116;
      goto LABEL_124;
    }
LABEL_121:
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "oslog");
    v137 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDFDD000, v137, OS_LOG_TYPE_DEFAULT, "[POLICY] query to locate major update asset did not find pure partial or full; selecting first with highest build",
        buf,
        2u);
    }

    objc_msgSend(v112, "firstObject");
    v115 = (id)objc_claimAutoreleasedReturnValue();
LABEL_124:
    v116 = 0;
  }
  v135 = v155;

  v132 = v165;
LABEL_126:

  v138 = objc_retainAutorelease(v115);
  *v135 = v138;
  v139 = objc_retainAutorelease(v116);
  *v148 = v139;
  v31 = objc_retainAutorelease(v154);
  *v149 = v31;
  v140 = objc_retainAutorelease(v147);
  *v150 = v140;

LABEL_127:
  v12 = v151;
  v19 = v152;
LABEL_128:

  v45 = v156;
LABEL_129:

LABEL_26:
}

BOOL __127__SUCorePolicy_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  _BOOL8 v10;
  void *v11;
  NSObject *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  int v20;
  const __CFString *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("RestoreVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8980]), "initWithRestoreVersion:", v4);
  if (objc_msgSend(*(id *)(a1 + 32), "isComparable:", v5)
    && (v6 = objc_msgSend(*(id *)(a1 + 32), "majorVersion"), v6 == objc_msgSend(v5, "majorVersion")))
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "compare:", v5);
    objc_msgSend(*(id *)(a1 + 40), "softwareUpdateScanPolicy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "allowSameVersion");

    if (v9)
      v10 = (unint64_t)(v7 + 1) < 2;
    else
      v10 = v7 == -1;
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "oslog");
  v12 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "softwareUpdateScanPolicy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "allowSameVersion"))
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    objc_msgSend(*(id *)(a1 + 32), "summary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "summary");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    v20 = 138544130;
    if (v10)
      v18 = CFSTR("YES");
    else
      v18 = CFSTR("NO");
    v21 = v14;
    v22 = 2114;
    v23 = v15;
    v24 = 2114;
    v25 = v16;
    v26 = 2114;
    v27 = v18;
    _os_log_impl(&dword_1DDFDD000, v12, OS_LOG_TYPE_DEFAULT, "[POLICY] filtering for minor assets only: allowSame:%{public}@ currentRestoreVersion=%{public}@ assetRestoreVersion=%{public}@ | keep=%{public}@", (uint8_t *)&v20, 0x2Au);

  }
  return v10;
}

uint64_t __127__SUCorePolicy_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke_423(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(a2, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeStringForKey:", CFSTR("RestoreVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "safeStringForKey:", CFSTR("RestoreVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8980]), "initWithRestoreVersion:", v6);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8980]), "initWithRestoreVersion:", v8);
  v11 = objc_msgSend(v9, "compare:", v10);

  return v11;
}

uint64_t __127__SUCorePolicy_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  const __CFString *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("RestoreVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(MEMORY[0x1E0DA8920], "stringIsEqual:to:", *(_QWORD *)(a1 + 32), v4);
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oslog");
  v7 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = CFSTR("NO");
    v11 = 138543874;
    if ((_DWORD)v5)
      v9 = CFSTR("YES");
    v12 = v8;
    v13 = 2114;
    v14 = v4;
    v15 = 2114;
    v16 = v9;
    _os_log_impl(&dword_1DDFDD000, v7, OS_LOG_TYPE_DEFAULT, "[POLICY] filtering highest minor restore version, highestMinorRestoreVersion=%{public}@, assetRestoreVersion=%{public}@ | keep=%{public}@", (uint8_t *)&v11, 0x20u);
  }

  return v5;
}

BOOL __127__SUCorePolicy_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke_425(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _BOOL8 v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("RestoreVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8980]), "initWithRestoreVersion:", v4);
  if (objc_msgSend(*(id *)(a1 + 32), "isComparable:", v5))
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "majorVersion");
    v7 = v6 < objc_msgSend(v5, "majorVersion");
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "oslog");
  v9 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "summary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "summary");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = CFSTR("NO");
    v15 = 138543874;
    v16 = v10;
    v17 = 2114;
    if (v7)
      v13 = CFSTR("YES");
    v18 = v11;
    v19 = 2114;
    v20 = v13;
    _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "[POLICY] filtering for major assets only, currentRestoreVersion=%{public}@, assetRestoreVersion=%{public}@ | keep=%{public}@", (uint8_t *)&v15, 0x20u);

  }
  return v7;
}

uint64_t __127__SUCorePolicy_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke_426(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(a2, "attributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeStringForKey:", CFSTR("RestoreVersion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "attributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "safeStringForKey:", CFSTR("RestoreVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8980]), "initWithRestoreVersion:", v6);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8980]), "initWithRestoreVersion:", v8);
  v11 = objc_msgSend(v9, "compare:", v10);

  return v11;
}

uint64_t __127__SUCorePolicy_selectSoftwareUpdateMajorPrimaryAsset_majorSecondaryAsset_minorPrimaryAsset_minorSecondaryAsset_fromAssetQuery___block_invoke_2_428(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  const __CFString *v9;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "attributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("RestoreVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(MEMORY[0x1E0DA8920], "stringIsEqual:to:", *(_QWORD *)(a1 + 32), v4);
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oslog");
  v7 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = CFSTR("NO");
    v11 = 138543874;
    if ((_DWORD)v5)
      v9 = CFSTR("YES");
    v12 = v8;
    v13 = 2114;
    v14 = v4;
    v15 = 2114;
    v16 = v9;
    _os_log_impl(&dword_1DDFDD000, v7, OS_LOG_TYPE_DEFAULT, "[POLICY] filtering highest major restore version, highestMajorRestoreVersion=%{public}@, assetRestoreVersion=%{public}@ | keep=%{public}@", (uint8_t *)&v11, 0x20u);
  }

  return v5;
}

- (void)selectDocumentationAsset:(id *)a3 fromAssetQuery:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  const char *v27;
  void *v28;
  SUCorePolicy *v29;
  id *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  SUCorePolicy *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "oslog");
  v8 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37 = self;
    _os_log_impl(&dword_1DDFDD000, v8, OS_LOG_TYPE_DEFAULT, "[POLICY] selectDocumentationAsset:fromAssetQuery for policy: %@", buf, 0xCu);
  }

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trackError:forReason:withResult:withError:", CFSTR("[POLICY] SELECT_DOC_ASSET"), CFSTR("selectDocumentationAsset called with unexpected nil docAsset param"), 8102, 0);
    goto LABEL_27;
  }
  objc_msgSend(v6, "SUCoreBorder_results");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "oslog");
    v26 = objc_claimAutoreleasedReturnValue();

    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
LABEL_26:

      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v27 = "[POLICY] 0 doc query results (before filtering)";
LABEL_25:
    _os_log_impl(&dword_1DDFDD000, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 2u);
    goto LABEL_26;
  }
  v30 = a3;
  v31 = v6;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v29 = self;
  -[SUCorePolicy policyExtensions](self, "policyExtensions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v33;
    while (2)
    {
      v14 = 0;
      v15 = v9;
      do
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v14);
        objc_msgSend(v16, "filterDocumentationAssetArray:", v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "oslog");
        v18 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = objc_msgSend(v9, "count");
          objc_msgSend(v16, "extensionName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v37 = (SUCorePolicy *)v19;
          v38 = 2114;
          v39 = v20;
          _os_log_impl(&dword_1DDFDD000, v18, OS_LOG_TYPE_DEFAULT, "[POLICY] %lu doc assets left after filtering from SUCorePolicyExtension %{public}@", buf, 0x16u);

        }
        if (!objc_msgSend(v9, "count"))
        {
          objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "oslog");
          v24 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DDFDD000, v24, OS_LOG_TYPE_DEFAULT, "[POLICY] 0 doc assets found, stopping filtering early", buf, 2u);
          }

          v6 = v31;
          goto LABEL_27;
        }
        ++v14;
        v15 = v9;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      if (v12)
        continue;
      break;
    }
  }

  if ((unint64_t)objc_msgSend(v9, "count") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ doc query with %lu results when only 1 expected"), v29, objc_msgSend(v9, "count"));
    objc_msgSend(v21, "trackAnomaly:forReason:withResult:withError:", CFSTR("[POLICY] SELECT_DOC_ASSET"), v22, 8116, 0);

  }
  v6 = v31;
  if (!objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "oslog");
    v26 = objc_claimAutoreleasedReturnValue();

    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    *(_WORD *)buf = 0;
    v27 = "[POLICY] 0 doc assets found";
    goto LABEL_25;
  }
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  *v30 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

}

- (id)constructMASoftwareUpdateCatalogDownloadOptionsWithUUID:(id)a3 assetAudience:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int16 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int16 v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  __int16 v47;
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
  const __CFString *v60;
  void *v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  NSObject *v75;
  void *v76;
  int v77;
  uint64_t v78;
  _BOOL4 v79;
  const __CFString *v80;
  void *v81;
  __CFString *v82;
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
  void *v96;
  id v97;
  const __CFString *v98;
  void *v99;
  void *v100;
  id v101;
  const __CFString *v102;
  void *v103;
  void *v104;
  id v105;
  const __CFString *v106;
  void *v107;
  void *v108;
  id v109;
  const __CFString *v110;
  void *v111;
  void *v112;
  id v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  void *v118;
  void *v119;
  void *v120;
  id v121;
  void *v122;
  void *v123;
  void *v124;
  id v125;
  void *v126;
  void *v127;
  void *v128;
  id v129;
  void *v130;
  void *v131;
  void *v132;
  id v133;
  void *v134;
  void *v135;
  void *v136;
  id v137;
  void *v138;
  void *v139;
  void *v140;
  id v141;
  void *v142;
  void *v143;
  void *v144;
  id v145;
  void *v146;
  void *v147;
  void *v148;
  id v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  id v155;
  void *v156;
  __int16 v157;
  __CFString *v158;
  void *v159;
  void *v160;
  id v161;
  void *v162;
  __int16 v163;
  __CFString *v164;
  void *v165;
  void *v166;
  id v167;
  int v168;
  const __CFString *v169;
  void *v170;
  void *v171;
  NSObject *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t i;
  void *v177;
  void *v178;
  NSObject *v179;
  void *v180;
  __CFString *v182;
  id v183;
  id v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  uint8_t v189[128];
  uint8_t buf[4];
  _BYTE v191[14];
  __int16 v192;
  const __CFString *v193;
  uint64_t v194;

  v194 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "oslog");
  v9 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v191 = self;
    _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "[POLICY] constructMASoftwareUpdateCatalogDownloadOptionsWithUUID for policy: %@", buf, 0xCu);
  }

  v10 = objc_alloc_init(MEMORY[0x1E0D4E098]);
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ unable to create software update catalog download options"), self);
    objc_msgSend(v11, "trackError:forReason:withResult:withError:", CFSTR("SU_CATALOG_DOWNLOAD_OPTIONS"), v18, 8100, 0);
LABEL_38:

    v82 = CFSTR("|");
    v83 = v11;
    v11 = 0;
    goto LABEL_84;
  }
  v11 = v10;
  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "additionalServerParams");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_alloc(MEMORY[0x1E0C99E08]);
    -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "additionalServerParams");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v14, "initWithDictionary:", v16);
    objc_msgSend(v11, "setAdditionalServerParams:", v17);

  }
  else
  {
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v11, "setAdditionalServerParams:", v15);
  }

  objc_msgSend(v11, "additionalServerParams");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ unable to create software update catalog download options additional server params"), self);
    objc_msgSend(v18, "trackError:forReason:withResult:withError:", CFSTR("SU_CATALOG_DOWNLOAD_OPTIONS"), v81, 8100, 0);

    goto LABEL_38;
  }
  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "specifiedFields");

  if ((v21 & 0x100) != 0)
  {
    objc_msgSend(v11, "additionalServerParams");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sessionId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setSafeObject:forKey:", v24, CFSTR("SessionId"));

  }
  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "specifiedFields");

  if ((v26 & 0x200) != 0)
  {
    objc_msgSend(v11, "additionalServerParams");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "rampingScanType");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setSafeObject:forKey:", v29, CFSTR("DeviceCheck"));

  }
  objc_msgSend(v11, "setSessionId:", v6);
  v30 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v11, "sessionId");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v30, "initWithFormat:", CFSTR("scanUUID:%@|"), v31);
  objc_msgSend(CFSTR("|"), "stringByAppendingString:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDiscretionary:", objc_msgSend(v34, "discretionary"));

  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v32) = objc_msgSend(v35, "specifiedFields");

  if ((v32 & 0x1000) != 0)
  {
    -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDisableUI:", objc_msgSend(v36, "disableUI"));

  }
  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "specifiedFields");

  if ((v38 & 2) != 0)
  {
    -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsCellularAccess:", objc_msgSend(v39, "allowsCellular"));

  }
  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "specifiedFields");

  if ((v41 & 8) != 0)
  {
    -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRequiresPowerPluggedIn:", objc_msgSend(v42, "requiresPowerPluggedIn"));

  }
  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "specifiedFields");

  if ((v44 & 0x40) != 0)
  {
    -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowSameVersion:", objc_msgSend(v45, "allowSameVersion"));

  }
  v184 = v6;
  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "specifiedFields");

  if ((v47 & 0x800) != 0)
  {
    -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLiveServerCatalogOnly:", objc_msgSend(v48, "liveServerCatalogOnly"));

  }
  -[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPrerequisiteProductVersion:", v49);

  -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPrerequisiteBuildVersion:", v50);

  -[SUCorePolicy releaseType](self, "releaseType");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPrerequisiteReleaseType:", v51);

  objc_msgSend(v11, "additionalServerParams");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy prerequisiteRestoreVersion](self, "prerequisiteRestoreVersion");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setSafeObject:forKey:", v53, CFSTR("RestoreVersion"));

  objc_msgSend(v11, "additionalServerParams");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy targetRestoreVersion](self, "targetRestoreVersion");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setSafeObject:forKey:", v55, CFSTR("TargetRestoreVersion"));

  objc_msgSend(v11, "additionalServerParams");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy installedSFRVersion](self, "installedSFRVersion");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setSafeObject:forKey:", v57, CFSTR("InstalledSFRVersion"));

  objc_msgSend(v11, "additionalServerParams");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v59, "allowSameVersion"))
    v60 = CFSTR("true");
  else
    v60 = CFSTR("false");
  objc_msgSend(v58, "setSafeObject:forKey:", v60, CFSTR("AllowSameBuildVersion"));

  objc_msgSend(v11, "additionalServerParams");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v62, "allowSameVersion"))
    v63 = CFSTR("true");
  else
    v63 = CFSTR("false");
  objc_msgSend(v61, "setSafeObject:forKey:", v63, CFSTR("AllowSameRestoreVersion"));

  objc_msgSend(v11, "additionalServerParams");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy productType](self, "productType");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "setSafeObject:forKey:", v65, CFSTR("ProductType"));

  objc_msgSend(v11, "additionalServerParams");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy hwModelStr](self, "hwModelStr");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setSafeObject:forKey:", v67, CFSTR("HWModelStr"));

  objc_msgSend(v11, "additionalServerParams");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy deviceClass](self, "deviceClass");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setSafeObject:forKey:", v69, CFSTR("DeviceName"));

  objc_msgSend(v11, "additionalServerParams");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
  v71 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setSafeObject:forKey:", v71, CFSTR("BuildVersion"));

  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v71) = objc_msgSend(v72, "specifiedFields");

  if ((v71 & 0x80) != 0)
  {
    -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
    v75 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTimeoutIntervalForResource:", (int)-[NSObject downloadTimeoutSecs](v75, "downloadTimeoutSecs"));
  }
  else
  {
    if (-[SUCorePolicy isInternal](self, "isInternal"))
      v73 = 60;
    else
      v73 = 30;
    objc_msgSend(v11, "setTimeoutIntervalForResource:", v73);
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "oslog");
    v75 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = objc_msgSend(v76, "downloadTimeoutSecs");
      v78 = objc_msgSend(v11, "timeoutIntervalForResource");
      v79 = -[SUCorePolicy isInternal](self, "isInternal");
      *(_DWORD *)buf = 67109634;
      v80 = CFSTR("YES");
      if (!v79)
        v80 = CFSTR("NO");
      *(_DWORD *)v191 = v77;
      *(_WORD *)&v191[4] = 2048;
      *(_QWORD *)&v191[6] = v78;
      v192 = 2114;
      v193 = v80;
      _os_log_impl(&dword_1DDFDD000, v75, OS_LOG_TYPE_DEFAULT, "[POLICY] downloadTimeoutSecs is %d, setting timeoutIntervalForResource to %ld (isInternal=%{public}@)", buf, 0x1Cu);

    }
  }

  -[SUCorePolicy downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  if (v84)
  {
    -[SUCorePolicy downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDownloadAuthorizationHeader:", v85);

  }
  if (v7)
  {
    v86 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v11, "setLiveAssetAudienceUUID:", v86);

    v87 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v11, "setPurpose:", v87);

    objc_msgSend(v11, "liveAssetAudienceUUID");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringByAppendingFormat:", CFSTR("assetAudience(param):%@|"), v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "purpose");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "stringByAppendingFormat:", CFSTR("purpose(param):%@|"), v90);
LABEL_46:
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_47;
  }
  -[SUCorePolicy assetAudienceUUID](self, "assetAudienceUUID");
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  if (v91)
  {
    -[SUCorePolicy assetAudienceUUID](self, "assetAudienceUUID");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = (void *)objc_msgSend(v92, "copy");
    objc_msgSend(v11, "setLiveAssetAudienceUUID:", v93);

    -[SUCorePolicy assetAudienceUUID](self, "assetAudienceUUID");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = (void *)objc_msgSend(v94, "copy");
    objc_msgSend(v11, "setPurpose:", v95);

    objc_msgSend(v11, "liveAssetAudienceUUID");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringByAppendingFormat:", CFSTR("assetAudience(self):%@|"), v96);
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "purpose");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "stringByAppendingFormat:", CFSTR("purpose(self):%@|"), v90);
    goto LABEL_46;
  }
LABEL_47:
  v183 = v7;
  v97 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (objc_msgSend(v11, "discretionary"))
    v98 = CFSTR("YES");
  else
    v98 = CFSTR("NO");
  v99 = (void *)objc_msgSend(v97, "initWithFormat:", CFSTR("discretionary:%@|"), v98);
  objc_msgSend(v33, "stringByAppendingString:", v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  v101 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (objc_msgSend(v11, "allowsCellularAccess"))
    v102 = CFSTR("YES");
  else
    v102 = CFSTR("NO");
  v103 = (void *)objc_msgSend(v101, "initWithFormat:", CFSTR("allowsCellular:%@|"), v102);
  objc_msgSend(v100, "stringByAppendingString:", v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  v105 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (objc_msgSend(v11, "requiresPowerPluggedIn"))
    v106 = CFSTR("YES");
  else
    v106 = CFSTR("NO");
  v107 = (void *)objc_msgSend(v105, "initWithFormat:", CFSTR("requiresPowerPluggedIn:%@|"), v106);
  objc_msgSend(v104, "stringByAppendingString:", v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  v109 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (objc_msgSend(v11, "allowSameVersion"))
    v110 = CFSTR("YES");
  else
    v110 = CFSTR("NO");
  v111 = (void *)objc_msgSend(v109, "initWithFormat:", CFSTR("allowSameVersion:%@|"), v110);
  objc_msgSend(v108, "stringByAppendingString:", v111);
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  v113 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v11, "prerequisiteProductVersion");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = (void *)objc_msgSend(v113, "initWithFormat:", CFSTR("prerequisiteProductVersion:%@|"), v114);
  objc_msgSend(v112, "stringByAppendingString:", v115);
  v116 = (void *)objc_claimAutoreleasedReturnValue();

  v117 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v11, "prerequisiteBuildVersion");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v119 = (void *)objc_msgSend(v117, "initWithFormat:", CFSTR("prerequisiteBuildVersion:%@|"), v118);
  objc_msgSend(v116, "stringByAppendingString:", v119);
  v120 = (void *)objc_claimAutoreleasedReturnValue();

  v121 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCorePolicy prerequisiteRestoreVersion](self, "prerequisiteRestoreVersion");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = (void *)objc_msgSend(v121, "initWithFormat:", CFSTR("prerequisiteRestoreVersion:%@|"), v122);
  objc_msgSend(v120, "stringByAppendingString:", v123);
  v124 = (void *)objc_claimAutoreleasedReturnValue();

  v125 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCorePolicy targetRestoreVersion](self, "targetRestoreVersion");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = (void *)objc_msgSend(v125, "initWithFormat:", CFSTR("targetRestoreVersion:%@|"), v126);
  objc_msgSend(v124, "stringByAppendingString:", v127);
  v128 = (void *)objc_claimAutoreleasedReturnValue();

  v129 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCorePolicy installedSFRVersion](self, "installedSFRVersion");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = (void *)objc_msgSend(v129, "initWithFormat:", CFSTR("installedSFRVersion:%@|"), v130);
  objc_msgSend(v128, "stringByAppendingString:", v131);
  v132 = (void *)objc_claimAutoreleasedReturnValue();

  v133 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v11, "prerequisiteReleaseType");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = (void *)objc_msgSend(v133, "initWithFormat:", CFSTR("prerequisiteReleaseType:%@|"), v134);
  objc_msgSend(v132, "stringByAppendingString:", v135);
  v136 = (void *)objc_claimAutoreleasedReturnValue();

  v137 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCorePolicy productType](self, "productType");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = (void *)objc_msgSend(v137, "initWithFormat:", CFSTR("productType:%@|"), v138);
  objc_msgSend(v136, "stringByAppendingString:", v139);
  v140 = (void *)objc_claimAutoreleasedReturnValue();

  v141 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCorePolicy hwModelStr](self, "hwModelStr");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = (void *)objc_msgSend(v141, "initWithFormat:", CFSTR("hwModelStr:%@|"), v142);
  objc_msgSend(v140, "stringByAppendingString:", v143);
  v144 = (void *)objc_claimAutoreleasedReturnValue();

  v145 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCorePolicy deviceClass](self, "deviceClass");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = (void *)objc_msgSend(v145, "initWithFormat:", CFSTR("deviceClass:%@|"), v146);
  objc_msgSend(v144, "stringByAppendingString:", v147);
  v148 = (void *)objc_claimAutoreleasedReturnValue();

  v149 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  v151 = (void *)objc_msgSend(v149, "initWithFormat:", CFSTR("buildVersion:%@|"), v150);
  objc_msgSend(v148, "stringByAppendingString:", v151);
  v152 = (void *)objc_claimAutoreleasedReturnValue();

  v153 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("timeout:%ld|"), objc_msgSend(v11, "timeoutIntervalForResource"));
  objc_msgSend(v152, "stringByAppendingString:", v153);
  v154 = (void *)objc_claimAutoreleasedReturnValue();

  v155 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = objc_msgSend(v156, "specifiedFields");
  if ((v157 & 0x100) != 0)
  {
    -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "sessionId");
    v158 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v158 = CFSTR("nil");
  }
  v159 = (void *)objc_msgSend(v155, "initWithFormat:", CFSTR("sessionId:%@|"), v158);
  objc_msgSend(v154, "stringByAppendingString:", v159);
  v160 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v157 & 0x100) != 0)
  {

  }
  v161 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  v163 = objc_msgSend(v162, "specifiedFields");
  if ((v163 & 0x200) != 0)
  {
    -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v152, "rampingScanType");
    v164 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v164 = CFSTR("nil");
  }
  v165 = (void *)objc_msgSend(v161, "initWithFormat:", CFSTR("rampingScanType:%@|"), v164);
  objc_msgSend(v160, "stringByAppendingString:", v165);
  v166 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v163 & 0x200) != 0)
  {

  }
  v167 = objc_alloc(MEMORY[0x1E0CB3940]);
  v168 = objc_msgSend(v11, "liveServerCatalogOnly");
  v169 = CFSTR("NO");
  if (v168)
    v169 = CFSTR("YES");
  v170 = (void *)objc_msgSend(v167, "initWithFormat:", CFSTR("liveServerCatalogOnly:%@|"), v169);
  objc_msgSend(v166, "stringByAppendingString:", v170);
  v82 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "oslog");
  v172 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v172, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)v191 = v82;
    _os_log_impl(&dword_1DDFDD000, v172, OS_LOG_TYPE_DEFAULT, "[POLICY] software update catalog download options: %{public}@", buf, 0xCu);
  }

  v187 = 0u;
  v188 = 0u;
  v185 = 0u;
  v186 = 0u;
  -[SUCorePolicy policyExtensions](self, "policyExtensions");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v173 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v185, v189, 16);
  if (v173)
  {
    v174 = v173;
    v182 = v82;
    v175 = *(_QWORD *)v186;
    do
    {
      for (i = 0; i != v174; ++i)
      {
        if (*(_QWORD *)v186 != v175)
          objc_enumerationMutation(v83);
        v177 = *(void **)(*((_QWORD *)&v185 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v178, "oslog");
        v179 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v179, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v177, "extensionName");
          v180 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)v191 = v180;
          _os_log_impl(&dword_1DDFDD000, v179, OS_LOG_TYPE_DEFAULT, "[POLICY] extending software update catalog download options for extension %{public}@", buf, 0xCu);

        }
        objc_msgSend(v177, "extendMASoftwareUpdateCatalogDownloadOptions:", v11);
      }
      v174 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v185, v189, 16);
    }
    while (v174);
    v7 = v183;
    v6 = v184;
    v82 = v182;
  }
  else
  {
    v7 = v183;
    v6 = v184;
  }
LABEL_84:

  return v11;
}

- (id)constructMADocumentationCatalogDownloadOptionsWithUUID:(id)a3 usingDescriptor:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  char v31;
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
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  id v51;
  const __CFString *v52;
  void *v53;
  void *v54;
  id v55;
  const __CFString *v56;
  void *v57;
  void *v58;
  id v59;
  const __CFString *v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  NSObject *v96;
  void *v97;
  int v98;
  uint64_t v99;
  _BOOL4 v100;
  const __CFString *v101;
  void *v102;
  __CFString *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  NSObject *v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  id v125;
  uint64_t v126;
  uint64_t i;
  void *v128;
  void *v129;
  NSObject *v130;
  void *v131;
  __CFString *v133;
  id v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  uint8_t v139[128];
  uint8_t buf[4];
  _BYTE v141[14];
  __int16 v142;
  const __CFString *v143;
  uint64_t v144;

  v144 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "oslog");
  v9 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)v141 = self;
    _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "[POLICY] constructMADocumentationCatalogDownloadOptionsWithUUID for policy: %{public}@", buf, 0xCu);
  }

  v10 = objc_alloc_init(MEMORY[0x1E0D4E098]);
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ unable to create documentation catalog download options"), self);
    objc_msgSend(v11, "trackError:forReason:withResult:withError:", CFSTR("DOC_CATALOG_DOWNLOAD_OPTIONS"), v18, 8100, 0);
LABEL_40:

    v103 = CFSTR("|");
    v104 = v11;
    v11 = 0;
    goto LABEL_59;
  }
  v11 = v10;
  -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "additionalServerParams");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = objc_alloc(MEMORY[0x1E0C99E08]);
    -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "additionalServerParams");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v14, "initWithDictionary:", v16);
    objc_msgSend(v11, "setAdditionalServerParams:", v17);

  }
  else
  {
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v11, "setAdditionalServerParams:", v15);
  }

  objc_msgSend(v11, "additionalServerParams");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ unable to create documentation catalog download options additional server params"), self);
    objc_msgSend(v18, "trackError:forReason:withResult:withError:", CFSTR("DOC_CATALOG_DOWNLOAD_OPTIONS"), v102, 8100, 0);

    goto LABEL_40;
  }
  objc_msgSend(v11, "setSessionId:", v6);
  -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDiscretionary:", objc_msgSend(v20, "discretionary"));

  -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "specifiedFields");

  if ((v22 & 0x40) != 0)
  {
    -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDisableUI:", objc_msgSend(v23, "disableUI"));

  }
  -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "specifiedFields");

  if ((v25 & 2) != 0)
  {
    -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsCellularAccess:", objc_msgSend(v26, "allowsCellular"));

  }
  -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "specifiedFields");

  if ((v28 & 8) != 0)
  {
    -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRequiresPowerPluggedIn:", objc_msgSend(v29, "requiresPowerPluggedIn"));

  }
  -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "specifiedFields");

  if ((v31 & 0x20) != 0)
  {
    -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLiveServerCatalogOnly:", objc_msgSend(v32, "liveServerCatalogOnly"));

  }
  v134 = v6;
  -[SUCorePolicy downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[SUCorePolicy downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDownloadAuthorizationHeader:", v34);

  }
  objc_msgSend(v11, "additionalServerParams");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy productType](self, "productType");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setSafeObject:forKey:", v36, CFSTR("ProductType"));

  objc_msgSend(v11, "additionalServerParams");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy hwModelStr](self, "hwModelStr");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setSafeObject:forKey:", v38, CFSTR("HWModelStr"));

  objc_msgSend(v11, "additionalServerParams");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy deviceClass](self, "deviceClass");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setSafeObject:forKey:", v40, CFSTR("DeviceName"));

  objc_msgSend(v11, "additionalServerParams");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setSafeObject:forKey:", v42, CFSTR("BuildVersion"));

  v43 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v11, "sessionId");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend(v43, "initWithFormat:", CFSTR("scanUUID:%@|"), v44);
  objc_msgSend(CFSTR("|"), "stringByAppendingString:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (objc_msgSend(v11, "discretionary"))
    v48 = CFSTR("YES");
  else
    v48 = CFSTR("NO");
  v49 = (void *)objc_msgSend(v47, "initWithFormat:", CFSTR("discretionary:%@|"), v48);
  objc_msgSend(v46, "stringByAppendingString:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (objc_msgSend(v11, "allowsCellularAccess"))
    v52 = CFSTR("YES");
  else
    v52 = CFSTR("NO");
  v53 = (void *)objc_msgSend(v51, "initWithFormat:", CFSTR("allowsCellular:%@|"), v52);
  objc_msgSend(v50, "stringByAppendingString:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (objc_msgSend(v11, "requiresPowerPluggedIn"))
    v56 = CFSTR("YES");
  else
    v56 = CFSTR("NO");
  v57 = (void *)objc_msgSend(v55, "initWithFormat:", CFSTR("requiresPowerPluggedIn:%@|"), v56);
  objc_msgSend(v54, "stringByAppendingString:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (objc_msgSend(v11, "liveServerCatalogOnly"))
    v60 = CFSTR("YES");
  else
    v60 = CFSTR("NO");
  v61 = (void *)objc_msgSend(v59, "initWithFormat:", CFSTR("liveServerCatalogOnly:%@|"), v60);
  objc_msgSend(v58, "stringByAppendingString:", v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v63 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCorePolicy productType](self, "productType");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (void *)objc_msgSend(v63, "initWithFormat:", CFSTR("productType:%@|"), v64);
  objc_msgSend(v62, "stringByAppendingString:", v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  v67 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCorePolicy hwModelStr](self, "hwModelStr");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = (void *)objc_msgSend(v67, "initWithFormat:", CFSTR("hwModelStr:%@|"), v68);
  objc_msgSend(v66, "stringByAppendingString:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  v71 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCorePolicy deviceClass](self, "deviceClass");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = (void *)objc_msgSend(v71, "initWithFormat:", CFSTR("deviceClass:%@|"), v72);
  objc_msgSend(v70, "stringByAppendingString:", v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = (void *)objc_msgSend(v75, "initWithFormat:", CFSTR("buildVersion:%@|"), v76);
  objc_msgSend(v74, "stringByAppendingString:", v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "additionalServerParams");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "documentationID");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v79, "setSafeObject:forKey:", v80, CFSTR("SUDocumentationID"));

  objc_msgSend(v11, "additionalServerParams");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy deviceClass](self, "deviceClass");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "setSafeObject:forKey:", v82, CFSTR("DeviceName"));

  v83 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v11, "additionalServerParams");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "safeStringForKey:", CFSTR("SUDocumentationID"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = (void *)objc_msgSend(v83, "initWithFormat:", CFSTR("documentationID:%@"), v85);
  objc_msgSend(v78, "stringByAppendingString:", v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  v88 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v11, "additionalServerParams");
  v89 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v89, "safeStringForKey:", CFSTR("DeviceName"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = (void *)objc_msgSend(v88, "initWithFormat:", CFSTR("deviceClass:%@"), v90);
  objc_msgSend(v87, "stringByAppendingString:", v91);
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v89) = objc_msgSend(v93, "specifiedFields");

  if ((v89 & 0x10) != 0)
  {
    -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
    v96 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTimeoutIntervalForResource:", (int)-[NSObject downloadTimeoutSecs](v96, "downloadTimeoutSecs"));
  }
  else
  {
    if (-[SUCorePolicy isInternal](self, "isInternal"))
      v94 = 60;
    else
      v94 = 30;
    objc_msgSend(v11, "setTimeoutIntervalForResource:", v94);
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "oslog");
    v96 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = objc_msgSend(v97, "downloadTimeoutSecs");
      v99 = objc_msgSend(v11, "timeoutIntervalForResource");
      v100 = -[SUCorePolicy isInternal](self, "isInternal");
      *(_DWORD *)buf = 67109634;
      v101 = CFSTR("NO");
      if (v100)
        v101 = CFSTR("YES");
      *(_DWORD *)v141 = v98;
      *(_WORD *)&v141[4] = 2048;
      *(_QWORD *)&v141[6] = v99;
      v142 = 2114;
      v143 = v101;
      _os_log_impl(&dword_1DDFDD000, v96, OS_LOG_TYPE_DEFAULT, "[POLICY] downloadTimeoutSecs is %d, setting timeoutIntervalForResource to %ld (isInternal=%{public}@)", buf, 0x1Cu);

    }
  }

  v105 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("timeout:%ld|"), objc_msgSend(v11, "timeoutIntervalForResource"));
  objc_msgSend(v92, "stringByAppendingString:", v105);
  v103 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "assetAudienceUUID");
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  if (v106)
  {
    objc_msgSend(v7, "assetAudienceUUID");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = (void *)objc_msgSend(v107, "copy");
    objc_msgSend(v11, "setLiveAssetAudienceUUID:", v108);

    objc_msgSend(v7, "assetAudienceUUID");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = (void *)objc_msgSend(v109, "copy");
    objc_msgSend(v11, "setPurpose:", v110);

    objc_msgSend(v11, "liveAssetAudienceUUID");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v103, "stringByAppendingFormat:", CFSTR("liveAssetAudienceUUID(param):%@"), v111);
    v112 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "purpose");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "stringByAppendingFormat:", CFSTR("purpose(param):%@"), v113);
LABEL_46:
    v103 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_47;
  }
  -[SUCorePolicy assetAudienceUUID](self, "assetAudienceUUID");
  v114 = (void *)objc_claimAutoreleasedReturnValue();

  if (v114)
  {
    -[SUCorePolicy assetAudienceUUID](self, "assetAudienceUUID");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = (void *)objc_msgSend(v115, "copy");
    objc_msgSend(v11, "setLiveAssetAudienceUUID:", v116);

    -[SUCorePolicy assetAudienceUUID](self, "assetAudienceUUID");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = (void *)objc_msgSend(v117, "copy");
    objc_msgSend(v11, "setPurpose:", v118);

    objc_msgSend(v11, "liveAssetAudienceUUID");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v103, "stringByAppendingFormat:", CFSTR("liveAssetAudienceUUID(self):%@"), v119);
    v112 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "purpose");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "stringByAppendingFormat:", CFSTR("purpose(self):%@"), v113);
    goto LABEL_46;
  }
LABEL_47:
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v120, "oslog");
  v121 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)v141 = v103;
    _os_log_impl(&dword_1DDFDD000, v121, OS_LOG_TYPE_DEFAULT, "[POLICY] documentation catalog download options: %{public}@", buf, 0xCu);
  }

  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  -[SUCorePolicy policyExtensions](self, "policyExtensions");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v135, v139, 16);
  if (v122)
  {
    v123 = v122;
    v133 = v103;
    v124 = v11;
    v125 = v7;
    v126 = *(_QWORD *)v136;
    do
    {
      for (i = 0; i != v123; ++i)
      {
        if (*(_QWORD *)v136 != v126)
          objc_enumerationMutation(v104);
        v128 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "oslog");
        v130 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v128, "extensionName");
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)v141 = v131;
          _os_log_impl(&dword_1DDFDD000, v130, OS_LOG_TYPE_DEFAULT, "[POLICY] extending documentation catalog download options for extension %{public}@", buf, 0xCu);

        }
        objc_msgSend(v128, "extendMADocumentationCatalogDownloadOptions:descriptor:", v124, v125);
      }
      v123 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v135, v139, 16);
    }
    while (v123);
    v103 = v133;
    v6 = v134;
    v7 = v125;
    v11 = v124;
  }
LABEL_59:

  return v11;
}

- (id)constructMASoftwareUpdateAssetDownloadOptionsWithUUID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  id v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  id v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  id v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  void *v60;
  void *v61;
  NSObject *v62;
  SUCorePolicy *v63;
  __CFString *v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint8_t v71[128];
  uint8_t buf[4];
  SUCorePolicy *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oslog");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v73 = self;
    _os_log_impl(&dword_1DDFDD000, v6, OS_LOG_TYPE_DEFAULT, "[POLICY] constructMASoftwareUpdateAssetDownloadOptionsWithUUID for policy: %@", buf, 0xCu);
  }

  v7 = objc_alloc_init(MEMORY[0x1E0D4E098]);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ unable to create software update asset download options"), self);
    objc_msgSend(v8, "trackError:forReason:withResult:withError:", CFSTR("SU_ASSET_DOWNLOAD_OPTIONS"), v49, 8100, 0);
LABEL_31:

    v48 = CFSTR("|");
    v51 = v8;
    v8 = 0;
    goto LABEL_45;
  }
  v8 = v7;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v8, "setAdditionalServerParams:", v9);

  objc_msgSend(v8, "additionalServerParams");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ unable to create software update asset download options additional server params"), self);
    objc_msgSend(v49, "trackError:forReason:withResult:withError:", CFSTR("SU_ASSET_DOWNLOAD_OPTIONS"), v50, 8100, 0);

    goto LABEL_31;
  }
  objc_msgSend(v8, "setSessionId:", v4);
  -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDiscretionary:", objc_msgSend(v11, "discretionary"));

  -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "specifiedFields");

  if (v13 < 0)
  {
    -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDisableUI:", objc_msgSend(v14, "disableUI"));

  }
  -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "specifiedFields");

  if ((v16 & 2) != 0)
  {
    -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsCellularAccess:", objc_msgSend(v17, "allowsCellular"));

  }
  -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "specifiedFields");

  if ((v19 & 0x10) != 0)
  {
    -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRequiresPowerPluggedIn:", objc_msgSend(v20, "requiresPowerPluggedIn"));

  }
  -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "specifiedFields");

  if ((v22 & 0x40) != 0)
  {
    -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsExpensiveAccess:", objc_msgSend(v23, "requiresInexpensiveAccess") ^ 1);

  }
  -[SUCorePolicy downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[SUCorePolicy downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDownloadAuthorizationHeader:", v25);

  }
  v26 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v8, "sessionId");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v26, "initWithFormat:", CFSTR("scanUUID:%@|"), v27);
  objc_msgSend(CFSTR("|"), "stringByAppendingString:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (objc_msgSend(v8, "discretionary"))
    v31 = CFSTR("YES");
  else
    v31 = CFSTR("NO");
  v32 = (void *)objc_msgSend(v30, "initWithFormat:", CFSTR("discretionary:%@|"), v31);
  objc_msgSend(v29, "stringByAppendingString:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (objc_msgSend(v8, "allowsCellularAccess"))
    v35 = CFSTR("YES");
  else
    v35 = CFSTR("NO");
  v36 = (void *)objc_msgSend(v34, "initWithFormat:", CFSTR("allowsCellular:%@|"), v35);
  objc_msgSend(v33, "stringByAppendingString:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (objc_msgSend(v8, "requiresPowerPluggedIn"))
    v39 = CFSTR("YES");
  else
    v39 = CFSTR("NO");
  v40 = (void *)objc_msgSend(v38, "initWithFormat:", CFSTR("requiresPowerPluggedIn:%@|"), v39);
  objc_msgSend(v37, "stringByAppendingString:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (objc_msgSend(v8, "allowsExpensiveAccess"))
    v43 = CFSTR("YES");
  else
    v43 = CFSTR("NO");
  v44 = (void *)objc_msgSend(v42, "initWithFormat:", CFSTR("allowsExpensiveAccess:%@|"), v43);
  objc_msgSend(v41, "stringByAppendingString:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "specifiedFields");

  v66 = v4;
  if ((v47 & 0x20) != 0)
  {
    -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTimeoutIntervalForResource:", (int)objc_msgSend(v52, "downloadTimeoutSecs"));

    v53 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("timeout:%ld|"), objc_msgSend(v8, "timeoutIntervalForResource"));
    objc_msgSend(v45, "stringByAppendingString:", v53);
    v48 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v45 = (void *)v53;
  }
  else
  {
    objc_msgSend(v45, "stringByAppendingString:", CFSTR("timeout:MobileAsset|"));
    v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "oslog");
  v55 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v73 = (SUCorePolicy *)v48;
    _os_log_impl(&dword_1DDFDD000, v55, OS_LOG_TYPE_DEFAULT, "[POLICY] software update asset download options: %{public}@", buf, 0xCu);
  }

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  -[SUCorePolicy policyExtensions](self, "policyExtensions");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
  if (v56)
  {
    v57 = v56;
    v65 = v48;
    v58 = *(_QWORD *)v68;
    do
    {
      for (i = 0; i != v57; ++i)
      {
        if (*(_QWORD *)v68 != v58)
          objc_enumerationMutation(v51);
        v60 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "oslog");
        v62 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v60, "extensionName");
          v63 = (SUCorePolicy *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v73 = v63;
          _os_log_impl(&dword_1DDFDD000, v62, OS_LOG_TYPE_DEFAULT, "[POLICY] extending software update asset download options for extension %{public}@", buf, 0xCu);

        }
        objc_msgSend(v60, "extendMASoftwareUpdateAssetDownloadOptions:", v8);
      }
      v57 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
    }
    while (v57);
    v48 = v65;
    v4 = v66;
  }
LABEL_45:

  return v8;
}

- (id)constructMADocumentationAssetDownloadOptionsWithUUID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  id v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  id v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  id v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  __CFString *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  void *v56;
  void *v57;
  NSObject *v58;
  SUCorePolicy *v59;
  void *v60;
  void *v61;
  __CFString *v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t v69[128];
  uint8_t buf[4];
  SUCorePolicy *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oslog");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v71 = self;
    _os_log_impl(&dword_1DDFDD000, v6, OS_LOG_TYPE_DEFAULT, "[POLICY] constructMADocumentationAssetDownloadOptionsWithUUID for policy: %@", buf, 0xCu);
  }

  v7 = objc_alloc_init(MEMORY[0x1E0D4E098]);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ unable to create documentation asset download options"), self);
    objc_msgSend(v8, "trackError:forReason:withResult:withError:", CFSTR("DOC_ASSET_DOWNLOAD_OPTIONS"), v60, 8100, 0);
LABEL_41:

    v48 = CFSTR("|");
    v51 = v8;
    v8 = 0;
    goto LABEL_42;
  }
  v8 = v7;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v8, "setAdditionalServerParams:", v9);

  objc_msgSend(v8, "additionalServerParams");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ unable to create documentation asset download options additional server params"), self);
    objc_msgSend(v60, "trackError:forReason:withResult:withError:", CFSTR("DOC_ASSET_DOWNLOAD_OPTIONS"), v61, 8100, 0);

    goto LABEL_41;
  }
  objc_msgSend(v8, "setSessionId:", v4);
  -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDiscretionary:", objc_msgSend(v11, "discretionary"));

  -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "specifiedFields");

  if ((v13 & 0x40) != 0)
  {
    -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDisableUI:", objc_msgSend(v14, "disableUI"));

  }
  -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "specifiedFields");

  if ((v16 & 2) != 0)
  {
    -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsCellularAccess:", objc_msgSend(v17, "allowsCellular"));

  }
  -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "specifiedFields");

  if ((v19 & 8) != 0)
  {
    -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRequiresPowerPluggedIn:", objc_msgSend(v20, "requiresPowerPluggedIn"));

  }
  -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "specifiedFields");

  if ((v22 & 0x20) != 0)
  {
    -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsExpensiveAccess:", objc_msgSend(v23, "requiresInexpensiveAccess") ^ 1);

  }
  -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimeoutIntervalForResource:", (int)objc_msgSend(v24, "downloadTimeoutSecs"));

  -[SUCorePolicy downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[SUCorePolicy downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDownloadAuthorizationHeader:", v26);

  }
  v27 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v8, "sessionId");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v27, "initWithFormat:", CFSTR("scanUUID:%@|"), v28);
  objc_msgSend(CFSTR("|"), "stringByAppendingString:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (objc_msgSend(v8, "discretionary"))
    v32 = CFSTR("YES");
  else
    v32 = CFSTR("NO");
  v33 = (void *)objc_msgSend(v31, "initWithFormat:", CFSTR("discretionary:%@|"), v32);
  objc_msgSend(v30, "stringByAppendingString:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (objc_msgSend(v8, "allowsCellularAccess"))
    v36 = CFSTR("YES");
  else
    v36 = CFSTR("NO");
  v37 = (void *)objc_msgSend(v35, "initWithFormat:", CFSTR("allowsCellular:%@|"), v36);
  objc_msgSend(v34, "stringByAppendingString:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (objc_msgSend(v8, "requiresPowerPluggedIn"))
    v40 = CFSTR("YES");
  else
    v40 = CFSTR("NO");
  v41 = (void *)objc_msgSend(v39, "initWithFormat:", CFSTR("requiresPowerPluggedIn:%@|"), v40);
  objc_msgSend(v38, "stringByAppendingString:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (objc_msgSend(v8, "allowsExpensiveAccess"))
    v44 = CFSTR("YES");
  else
    v44 = CFSTR("NO");
  v45 = (void *)objc_msgSend(v43, "initWithFormat:", CFSTR("allowsExpensiveAccess:%@|"), v44);
  objc_msgSend(v42, "stringByAppendingString:", v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("timeout:%ld|"), objc_msgSend(v8, "timeoutIntervalForResource"));
  objc_msgSend(v46, "stringByAppendingString:", v47);
  v48 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "oslog");
  v50 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v71 = (SUCorePolicy *)v48;
    _os_log_impl(&dword_1DDFDD000, v50, OS_LOG_TYPE_DEFAULT, "[POLICY] documentation asset download options: %{public}@", buf, 0xCu);
  }

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  -[SUCorePolicy policyExtensions](self, "policyExtensions");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
  if (v52)
  {
    v53 = v52;
    v63 = v48;
    v64 = v4;
    v54 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v53; ++i)
      {
        if (*(_QWORD *)v66 != v54)
          objc_enumerationMutation(v51);
        v56 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "oslog");
        v58 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v56, "extensionName");
          v59 = (SUCorePolicy *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v71 = v59;
          _os_log_impl(&dword_1DDFDD000, v58, OS_LOG_TYPE_DEFAULT, "[POLICY] extending documentation asset download options for extension %{public}@", buf, 0xCu);

        }
        objc_msgSend(v56, "extendMADocumentationAssetDownloadOptions:", v8);
      }
      v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
    }
    while (v53);
    v48 = v63;
    v4 = v64;
  }
LABEL_42:

  return v8;
}

- (id)setUpdateMetricEventFieldsFromDictionary:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SUCorePolicy *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[SUCorePolicy setUpdateMetricEventFields:](self, "setUpdateMetricEventFields:", 0);
  if (v4)
  {
    v19 = v4;
    v18 = self;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(v5, "setSafeObject:forKey:", v12, v11);
          }
          else
          {
            v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("SET_UPDATE_METRIC_EVENT_FIELDS failed due to invalid parameter (non-NSString value in dictionary for key %@)"), v11);
            objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "buildError:underlying:description:", 8102, 0, v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "trackAnomaly:forReason:withResult:withError:", CFSTR("SET_UPDATE_METRIC_EVENT_FIELDS"), v13, 8102, v15);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v8);
    }

    -[SUCorePolicy setUpdateMetricEventFields:](v18, "setUpdateMetricEventFields:", v5);
    v4 = v19;
  }

  return 0;
}

- (void)updateApplyOptionsWithExtensions:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  SUCorePolicy *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  SUCorePolicy *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oslog");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = self;
    _os_log_impl(&dword_1DDFDD000, v6, OS_LOG_TYPE_DEFAULT, "[POLICY] updateApplyOptionsWithExtensions for policy: %{public}@", buf, 0xCu);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SUCorePolicy policyExtensions](self, "policyExtensions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "oslog");
          v14 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v12, "extensionName");
            v15 = (SUCorePolicy *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v22 = v15;
            _os_log_impl(&dword_1DDFDD000, v14, OS_LOG_TYPE_DEFAULT, "[POLICY] extending query for extension %{public}@", buf, 0xCu);

          }
          objc_msgSend(v12, "extendMSUApplyOptions:", v4);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (void)updateRollbackOptionsWithExtensions:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  SUCorePolicy *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  SUCorePolicy *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oslog");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = self;
    _os_log_impl(&dword_1DDFDD000, v6, OS_LOG_TYPE_DEFAULT, "[POLICY] updateRollbackOptionsWithExtensions for policy: %{public}@", buf, 0xCu);
  }

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[SUCorePolicy policyExtensions](self, "policyExtensions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "oslog");
          v14 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v12, "extensionName");
            v15 = (SUCorePolicy *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v22 = v15;
            _os_log_impl(&dword_1DDFDD000, v14, OS_LOG_TYPE_DEFAULT, "[POLICY] extending rollback options for extension %{public}@", buf, 0xCu);

          }
          objc_msgSend(v12, "extendMSURollbackOptions:", v4);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (BOOL)isSplatPolicy
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SUCorePolicy policyExtensions](self, "policyExtensions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v5 |= objc_msgSend(v8, "isSplatPolicy");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5 & 1;
}

- (BOOL)isSupervisedPolicy
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SUCorePolicy policyExtensions](self, "policyExtensions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v5 |= objc_msgSend(v8, "isSupervisedPolicy");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5 & 1;
}

- (BOOL)isRequestedPMVSupervisedPolicy
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SUCorePolicy policyExtensions](self, "policyExtensions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v5 |= objc_msgSend(v8, "isRequestedPMVSupervisedPolicy");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5 & 1;
}

- (id)requestedProductMarketingVersion
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SUCorePolicy policyExtensions](self, "policyExtensions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v8, "requestedProductMarketingVersion");
          v9 = objc_claimAutoreleasedReturnValue();

          v5 = (void *)v9;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)delayPeriodDays
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SUCorePolicy policyExtensions](self, "policyExtensions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v5 = objc_msgSend(v8, "delayPeriodDays");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)mdmPathName
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SUCorePolicy policyExtensions](self, "policyExtensions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v8, "mdmPathName");
          v9 = objc_claimAutoreleasedReturnValue();

          v5 = (void *)v9;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (SUCorePolicy)initWithCoder:(id)a3
{
  id v4;
  SUCorePolicy *v5;
  uint64_t v6;
  SUCorePolicySoftwareUpdateScan *softwareUpdateScanPolicy;
  uint64_t v8;
  SUCorePolicyDocumentationScan *documentationScanPolicy;
  uint64_t v10;
  SUCorePolicyDocumentationDownload *documentationDownloadPolicy;
  uint64_t v12;
  SUCorePolicyLoadBrain *loadBrainPolicy;
  uint64_t v14;
  SUCorePolicyPreflightDownloadSU *downloadPreflightPolicy;
  uint64_t v16;
  SUCorePolicyPreflightWakeup *wakeupPreflightPolicy;
  uint64_t v18;
  SUCorePolicyPreflightPrerequisiteCheck *prerequisiteCheckPreflightPolicy;
  uint64_t v20;
  SUCorePolicyPreflightPersonalize *personalizePreflightPolicy;
  uint64_t v22;
  SUCorePolicyPreflightFDRRecovery *fdrRecoveryPreflightPolicy;
  uint64_t v24;
  SUCorePolicySoftwareUpdateDownload *softwareUpdateDownloadPolicy;
  uint64_t v26;
  SUCorePolicyPrepare *preparePolicy;
  uint64_t v28;
  SUCorePolicySuspend *suspendPolicy;
  uint64_t v30;
  SUCorePolicyResume *resumePolicy;
  uint64_t v32;
  SUCorePolicyApply *applyPolicy;
  uint64_t v34;
  SUCorePolicyRollback *rollbackPolicy;
  uint64_t v36;
  NSString *softwareUpdateAssetType;
  uint64_t v38;
  NSString *documentationAssetType;
  uint64_t v40;
  NSString *targetVolumeUUID;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSArray *policyExtensions;
  uint64_t v47;
  NSString *prerequisiteBuildVersion;
  uint64_t v49;
  NSString *prerequisiteProductVersion;
  uint64_t v51;
  NSString *prerequisiteRestoreVersion;
  uint64_t v53;
  NSString *targetRestoreVersion;
  uint64_t v55;
  NSString *installedSFRVersion;
  uint64_t v57;
  NSString *deviceClass;
  uint64_t v59;
  NSString *hwModelStr;
  uint64_t v61;
  NSString *productType;
  uint64_t v63;
  NSString *releaseType;
  uint64_t v65;
  NSString *userAgentString;
  uint64_t v67;
  NSString *updateVolumePath;
  uint64_t v69;
  NSData *ssoToken;
  uint64_t v71;
  NSString *personalizedManifestRootsPath;
  uint64_t v73;
  NSData *localAuthenticationContext;
  uint64_t v75;
  NSNumber *localAuthenticationUserID;
  uint64_t v77;
  NSString *mdmBootstrapToken;
  uint64_t v79;
  NSString *downloadAuthorizationHeader;
  uint64_t v81;
  NSString *updateBrainLocationOverride;
  uint64_t v83;
  NSString *assetAudienceUUID;
  uint64_t v85;
  NSString *alternateAssetAudienceUUID;
  uint64_t v87;
  NSString *personalizationServerURL;
  uint64_t v89;
  NSString *proxyHostName;
  uint64_t v91;
  NSNumber *proxyPortNumber;
  uint64_t v93;
  NSString *bridgeOSDownloadDirectory;
  id v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  NSDictionary *updateMetricEventFields;
  uint64_t v100;
  NSString *updateMetricContext;
  id v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  NSDictionary *defaultDescriptorValues;
  objc_super v108;

  v4 = a3;
  v108.receiver = self;
  v108.super_class = (Class)SUCorePolicy;
  v5 = -[SUCorePolicy init](&v108, sel_init);
  if (v5)
  {
    v5->_specifiedUsedPolicies = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("SpecifiedPolicies"));
    v5->_restrictToFull = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("RestrictToFull"));
    v5->_allowSameVersion = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AllowSameVersion"));
    v5->_background = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("Background"));
    v5->_allowsCellular = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AllowsCellular"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UpdateScanPolicy"));
    v6 = objc_claimAutoreleasedReturnValue();
    softwareUpdateScanPolicy = v5->_softwareUpdateScanPolicy;
    v5->_softwareUpdateScanPolicy = (SUCorePolicySoftwareUpdateScan *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DocumentationScanPolicy"));
    v8 = objc_claimAutoreleasedReturnValue();
    documentationScanPolicy = v5->_documentationScanPolicy;
    v5->_documentationScanPolicy = (SUCorePolicyDocumentationScan *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DocumentationDownloadPolicy"));
    v10 = objc_claimAutoreleasedReturnValue();
    documentationDownloadPolicy = v5->_documentationDownloadPolicy;
    v5->_documentationDownloadPolicy = (SUCorePolicyDocumentationDownload *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LoadBrainUpdatePolicy"));
    v12 = objc_claimAutoreleasedReturnValue();
    loadBrainPolicy = v5->_loadBrainPolicy;
    v5->_loadBrainPolicy = (SUCorePolicyLoadBrain *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PreflightDownloadPolicy"));
    v14 = objc_claimAutoreleasedReturnValue();
    downloadPreflightPolicy = v5->_downloadPreflightPolicy;
    v5->_downloadPreflightPolicy = (SUCorePolicyPreflightDownloadSU *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PreflightWakeupPolicy"));
    v16 = objc_claimAutoreleasedReturnValue();
    wakeupPreflightPolicy = v5->_wakeupPreflightPolicy;
    v5->_wakeupPreflightPolicy = (SUCorePolicyPreflightWakeup *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PreflightPrerequisiteCheckPolicy"));
    v18 = objc_claimAutoreleasedReturnValue();
    prerequisiteCheckPreflightPolicy = v5->_prerequisiteCheckPreflightPolicy;
    v5->_prerequisiteCheckPreflightPolicy = (SUCorePolicyPreflightPrerequisiteCheck *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PreflightPersonalizePolicy"));
    v20 = objc_claimAutoreleasedReturnValue();
    personalizePreflightPolicy = v5->_personalizePreflightPolicy;
    v5->_personalizePreflightPolicy = (SUCorePolicyPreflightPersonalize *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PreflightFDRRecoveryPolicy"));
    v22 = objc_claimAutoreleasedReturnValue();
    fdrRecoveryPreflightPolicy = v5->_fdrRecoveryPreflightPolicy;
    v5->_fdrRecoveryPreflightPolicy = (SUCorePolicyPreflightFDRRecovery *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DownloadSoftwareUpdatePolicy"));
    v24 = objc_claimAutoreleasedReturnValue();
    softwareUpdateDownloadPolicy = v5->_softwareUpdateDownloadPolicy;
    v5->_softwareUpdateDownloadPolicy = (SUCorePolicySoftwareUpdateDownload *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrepareUpdatePolicy"));
    v26 = objc_claimAutoreleasedReturnValue();
    preparePolicy = v5->_preparePolicy;
    v5->_preparePolicy = (SUCorePolicyPrepare *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SuspendUpdatePolicy"));
    v28 = objc_claimAutoreleasedReturnValue();
    suspendPolicy = v5->_suspendPolicy;
    v5->_suspendPolicy = (SUCorePolicySuspend *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ResumeUpdatePolicy"));
    v30 = objc_claimAutoreleasedReturnValue();
    resumePolicy = v5->_resumePolicy;
    v5->_resumePolicy = (SUCorePolicyResume *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ApplyUpdatePolicy"));
    v32 = objc_claimAutoreleasedReturnValue();
    applyPolicy = v5->_applyPolicy;
    v5->_applyPolicy = (SUCorePolicyApply *)v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RollbackUpdatePolicy"));
    v34 = objc_claimAutoreleasedReturnValue();
    rollbackPolicy = v5->_rollbackPolicy;
    v5->_rollbackPolicy = (SUCorePolicyRollback *)v34;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SoftwareUpdateAssetType"));
    v36 = objc_claimAutoreleasedReturnValue();
    softwareUpdateAssetType = v5->_softwareUpdateAssetType;
    v5->_softwareUpdateAssetType = (NSString *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DocumentationAssetType"));
    v38 = objc_claimAutoreleasedReturnValue();
    documentationAssetType = v5->_documentationAssetType;
    v5->_documentationAssetType = (NSString *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TargetVolumeUUID"));
    v40 = objc_claimAutoreleasedReturnValue();
    targetVolumeUUID = v5->_targetVolumeUUID;
    v5->_targetVolumeUUID = (NSString *)v40;

    v42 = (void *)MEMORY[0x1E0C99E60];
    v43 = objc_opt_class();
    objc_msgSend(v42, "setWithObjects:", v43, objc_opt_class(), 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v44, CFSTR("PolicyExtensions"));
    v45 = objc_claimAutoreleasedReturnValue();
    policyExtensions = v5->_policyExtensions;
    v5->_policyExtensions = (NSArray *)v45;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrerequisiteBuildVersion"));
    v47 = objc_claimAutoreleasedReturnValue();
    prerequisiteBuildVersion = v5->_prerequisiteBuildVersion;
    v5->_prerequisiteBuildVersion = (NSString *)v47;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrerequisiteProductVersion"));
    v49 = objc_claimAutoreleasedReturnValue();
    prerequisiteProductVersion = v5->_prerequisiteProductVersion;
    v5->_prerequisiteProductVersion = (NSString *)v49;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrerequisiteRestoreVersion"));
    v51 = objc_claimAutoreleasedReturnValue();
    prerequisiteRestoreVersion = v5->_prerequisiteRestoreVersion;
    v5->_prerequisiteRestoreVersion = (NSString *)v51;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("TargetRestoreVersion"));
    v53 = objc_claimAutoreleasedReturnValue();
    targetRestoreVersion = v5->_targetRestoreVersion;
    v5->_targetRestoreVersion = (NSString *)v53;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("InstalledSFRVersion"));
    v55 = objc_claimAutoreleasedReturnValue();
    installedSFRVersion = v5->_installedSFRVersion;
    v5->_installedSFRVersion = (NSString *)v55;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DeviceClass"));
    v57 = objc_claimAutoreleasedReturnValue();
    deviceClass = v5->_deviceClass;
    v5->_deviceClass = (NSString *)v57;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HWModelStr"));
    v59 = objc_claimAutoreleasedReturnValue();
    hwModelStr = v5->_hwModelStr;
    v5->_hwModelStr = (NSString *)v59;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProductType"));
    v61 = objc_claimAutoreleasedReturnValue();
    productType = v5->_productType;
    v5->_productType = (NSString *)v61;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ReleaseType"));
    v63 = objc_claimAutoreleasedReturnValue();
    releaseType = v5->_releaseType;
    v5->_releaseType = (NSString *)v63;

    v5->_isInternal = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsInternal"));
    v5->_checkAvailableSpace = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CheckAvailableSpace"));
    v5->_cacheDeleteUrgency = objc_msgSend(v4, "decodeIntForKey:", CFSTR("CacheDeleteUrgency"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UserAgentString"));
    v65 = objc_claimAutoreleasedReturnValue();
    userAgentString = v5->_userAgentString;
    v5->_userAgentString = (NSString *)v65;

    v5->_performPreflightEncryptedCheck = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PerformPreflightEncryptedCheck"));
    v5->_performPreflightSnapshotCheck = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PerformPreflightSnapshotCheck"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UpdateVolumePath"));
    v67 = objc_claimAutoreleasedReturnValue();
    updateVolumePath = v5->_updateVolumePath;
    v5->_updateVolumePath = (NSString *)v67;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SSOToken"));
    v69 = objc_claimAutoreleasedReturnValue();
    ssoToken = v5->_ssoToken;
    v5->_ssoToken = (NSData *)v69;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PersonalizedManifestRootsPath"));
    v71 = objc_claimAutoreleasedReturnValue();
    personalizedManifestRootsPath = v5->_personalizedManifestRootsPath;
    v5->_personalizedManifestRootsPath = (NSString *)v71;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LocalAuthenticationContext"));
    v73 = objc_claimAutoreleasedReturnValue();
    localAuthenticationContext = v5->_localAuthenticationContext;
    v5->_localAuthenticationContext = (NSData *)v73;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("LocalAuthenticationUserID"));
    v75 = objc_claimAutoreleasedReturnValue();
    localAuthenticationUserID = v5->_localAuthenticationUserID;
    v5->_localAuthenticationUserID = (NSNumber *)v75;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MDMBootstrapToken"));
    v77 = objc_claimAutoreleasedReturnValue();
    mdmBootstrapToken = v5->_mdmBootstrapToken;
    v5->_mdmBootstrapToken = (NSString *)v77;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DownloadAuthorizationHeader"));
    v79 = objc_claimAutoreleasedReturnValue();
    downloadAuthorizationHeader = v5->_downloadAuthorizationHeader;
    v5->_downloadAuthorizationHeader = (NSString *)v79;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UpdateBrainLocationOverride"));
    v81 = objc_claimAutoreleasedReturnValue();
    updateBrainLocationOverride = v5->_updateBrainLocationOverride;
    v5->_updateBrainLocationOverride = (NSString *)v81;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AssetAudienceUUID"));
    v83 = objc_claimAutoreleasedReturnValue();
    assetAudienceUUID = v5->_assetAudienceUUID;
    v5->_assetAudienceUUID = (NSString *)v83;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AlternateAssetAudienceUUID"));
    v85 = objc_claimAutoreleasedReturnValue();
    alternateAssetAudienceUUID = v5->_alternateAssetAudienceUUID;
    v5->_alternateAssetAudienceUUID = (NSString *)v85;

    v5->_disableAlternateUpdate = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DisableAlternateUpdate"));
    v5->_disableSplatCombo = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("DisableSplombo"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PersonalizationServerURL"));
    v87 = objc_claimAutoreleasedReturnValue();
    personalizationServerURL = v5->_personalizationServerURL;
    v5->_personalizationServerURL = (NSString *)v87;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProxyHostName"));
    v89 = objc_claimAutoreleasedReturnValue();
    proxyHostName = v5->_proxyHostName;
    v5->_proxyHostName = (NSString *)v89;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProxyPortNumber"));
    v91 = objc_claimAutoreleasedReturnValue();
    proxyPortNumber = v5->_proxyPortNumber;
    v5->_proxyPortNumber = (NSNumber *)v91;

    v5->_bridgeOSIgnoreMinimumVersionCheck = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("BridgeOSIgnoreMinimumVersionCheck"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BridgeOSDownloadDirectory"));
    v93 = objc_claimAutoreleasedReturnValue();
    bridgeOSDownloadDirectory = v5->_bridgeOSDownloadDirectory;
    v5->_bridgeOSDownloadDirectory = (NSString *)v93;

    v5->_enableEmbeddedOSInstall = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EnableEmbeddedOSInstall"));
    v5->_enableBridgeOSInstall = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EnableBridgeOSInstall"));
    v5->_enableOSPersonalization = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EnableOSPersonalization"));
    v5->_userInitiated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UserInitiated"));
    v5->_skipVolumeSealing = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SkipVolumeSealing"));
    v5->_qualityOfService = objc_msgSend(v4, "decodeIntForKey:", CFSTR("QualityOfService"));
    v95 = objc_alloc(MEMORY[0x1E0C99E60]);
    v96 = objc_opt_class();
    v97 = (void *)objc_msgSend(v95, "initWithObjects:", v96, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v97, CFSTR("UpdateMetricEventFields"));
    v98 = objc_claimAutoreleasedReturnValue();
    updateMetricEventFields = v5->_updateMetricEventFields;
    v5->_updateMetricEventFields = (NSDictionary *)v98;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UpdateMetricContext"));
    v100 = objc_claimAutoreleasedReturnValue();
    updateMetricContext = v5->_updateMetricContext;
    v5->_updateMetricContext = (NSString *)v100;

    v102 = objc_alloc(MEMORY[0x1E0C99E60]);
    v103 = objc_opt_class();
    v104 = (void *)objc_msgSend(v102, "initWithObjects:", v103, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v104, CFSTR("DefaultDescriptorValues"));
    v105 = objc_claimAutoreleasedReturnValue();
    defaultDescriptorValues = v5->_defaultDescriptorValues;
    v5->_defaultDescriptorValues = (NSDictionary *)v105;

    v5->_enablePreSUStaging = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EnablePSUSAssets"));
    v5->_enablePreSUStagingForOptionalAssets = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("EnablePSUSForOptionalAssets"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
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
  id v50;

  v50 = a3;
  objc_msgSend(v50, "encodeInt64:forKey:", -[SUCorePolicy specifiedUsedPolicies](self, "specifiedUsedPolicies"), CFSTR("SpecifiedPolicies"));
  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy restrictToFull](self, "restrictToFull"), CFSTR("RestrictToFull"));
  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy allowSameVersion](self, "allowSameVersion"), CFSTR("AllowSameVersion"));
  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy background](self, "background"), CFSTR("Background"));
  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy allowsCellular](self, "allowsCellular"), CFSTR("AllowsCellular"));
  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v4, CFSTR("UpdateScanPolicy"));

  -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v5, CFSTR("DocumentationScanPolicy"));

  -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v6, CFSTR("DocumentationDownloadPolicy"));

  -[SUCorePolicy loadBrainPolicy](self, "loadBrainPolicy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v7, CFSTR("LoadBrainUpdatePolicy"));

  -[SUCorePolicy downloadPreflightPolicy](self, "downloadPreflightPolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v8, CFSTR("PreflightDownloadPolicy"));

  -[SUCorePolicy wakeupPreflightPolicy](self, "wakeupPreflightPolicy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v9, CFSTR("PreflightWakeupPolicy"));

  -[SUCorePolicy prerequisiteCheckPreflightPolicy](self, "prerequisiteCheckPreflightPolicy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v10, CFSTR("PreflightPrerequisiteCheckPolicy"));

  -[SUCorePolicy personalizePreflightPolicy](self, "personalizePreflightPolicy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v11, CFSTR("PreflightPersonalizePolicy"));

  -[SUCorePolicy fdrRecoveryPreflightPolicy](self, "fdrRecoveryPreflightPolicy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v12, CFSTR("PreflightFDRRecoveryPolicy"));

  -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v13, CFSTR("DownloadSoftwareUpdatePolicy"));

  -[SUCorePolicy preparePolicy](self, "preparePolicy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v14, CFSTR("PrepareUpdatePolicy"));

  -[SUCorePolicy suspendPolicy](self, "suspendPolicy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v15, CFSTR("SuspendUpdatePolicy"));

  -[SUCorePolicy resumePolicy](self, "resumePolicy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v16, CFSTR("ResumeUpdatePolicy"));

  -[SUCorePolicy applyPolicy](self, "applyPolicy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v17, CFSTR("ApplyUpdatePolicy"));

  -[SUCorePolicy rollbackPolicy](self, "rollbackPolicy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v18, CFSTR("RollbackUpdatePolicy"));

  -[SUCorePolicy softwareUpdateAssetType](self, "softwareUpdateAssetType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v19, CFSTR("SoftwareUpdateAssetType"));

  -[SUCorePolicy documentationAssetType](self, "documentationAssetType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v20, CFSTR("DocumentationAssetType"));

  -[SUCorePolicy targetVolumeUUID](self, "targetVolumeUUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v21, CFSTR("TargetVolumeUUID"));

  -[SUCorePolicy policyExtensions](self, "policyExtensions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v22, CFSTR("PolicyExtensions"));

  -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v23, CFSTR("PrerequisiteBuildVersion"));

  -[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v24, CFSTR("PrerequisiteProductVersion"));

  -[SUCorePolicy prerequisiteRestoreVersion](self, "prerequisiteRestoreVersion");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v25, CFSTR("PrerequisiteRestoreVersion"));

  -[SUCorePolicy targetRestoreVersion](self, "targetRestoreVersion");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v26, CFSTR("TargetRestoreVersion"));

  -[SUCorePolicy installedSFRVersion](self, "installedSFRVersion");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v27, CFSTR("InstalledSFRVersion"));

  -[SUCorePolicy deviceClass](self, "deviceClass");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v28, CFSTR("DeviceClass"));

  -[SUCorePolicy hwModelStr](self, "hwModelStr");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v29, CFSTR("HWModelStr"));

  -[SUCorePolicy productType](self, "productType");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v30, CFSTR("ProductType"));

  -[SUCorePolicy releaseType](self, "releaseType");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v31, CFSTR("ReleaseType"));

  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy isInternal](self, "isInternal"), CFSTR("IsInternal"));
  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy checkAvailableSpace](self, "checkAvailableSpace"), CFSTR("CheckAvailableSpace"));
  objc_msgSend(v50, "encodeInt:forKey:", -[SUCorePolicy cacheDeleteUrgency](self, "cacheDeleteUrgency"), CFSTR("CacheDeleteUrgency"));
  -[SUCorePolicy userAgentString](self, "userAgentString");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v32, CFSTR("UserAgentString"));

  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy performPreflightEncryptedCheck](self, "performPreflightEncryptedCheck"), CFSTR("PerformPreflightEncryptedCheck"));
  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy performPreflightSnapshotCheck](self, "performPreflightSnapshotCheck"), CFSTR("PerformPreflightSnapshotCheck"));
  -[SUCorePolicy updateVolumePath](self, "updateVolumePath");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v33, CFSTR("UpdateVolumePath"));

  -[SUCorePolicy ssoToken](self, "ssoToken");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v34, CFSTR("SSOToken"));

  -[SUCorePolicy personalizedManifestRootsPath](self, "personalizedManifestRootsPath");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v35, CFSTR("PersonalizedManifestRootsPath"));

  -[SUCorePolicy localAuthenticationContext](self, "localAuthenticationContext");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v36, CFSTR("LocalAuthenticationContext"));

  -[SUCorePolicy localAuthenticationUserID](self, "localAuthenticationUserID");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v37, CFSTR("LocalAuthenticationUserID"));

  -[SUCorePolicy mdmBootstrapToken](self, "mdmBootstrapToken");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v38, CFSTR("MDMBootstrapToken"));

  -[SUCorePolicy downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v39, CFSTR("DownloadAuthorizationHeader"));

  -[SUCorePolicy updateBrainLocationOverride](self, "updateBrainLocationOverride");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v40, CFSTR("UpdateBrainLocationOverride"));

  -[SUCorePolicy assetAudienceUUID](self, "assetAudienceUUID");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v41, CFSTR("AssetAudienceUUID"));

  -[SUCorePolicy alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v42, CFSTR("AlternateAssetAudienceUUID"));

  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy disableAlternateUpdate](self, "disableAlternateUpdate"), CFSTR("DisableAlternateUpdate"));
  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy disableSplatCombo](self, "disableSplatCombo"), CFSTR("DisableSplombo"));
  -[SUCorePolicy personalizationServerURL](self, "personalizationServerURL");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v43, CFSTR("PersonalizationServerURL"));

  -[SUCorePolicy proxyHostName](self, "proxyHostName");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v44, CFSTR("ProxyHostName"));

  -[SUCorePolicy proxyPortNumber](self, "proxyPortNumber");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v45, CFSTR("ProxyPortNumber"));

  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy bridgeOSIgnoreMinimumVersionCheck](self, "bridgeOSIgnoreMinimumVersionCheck"), CFSTR("BridgeOSIgnoreMinimumVersionCheck"));
  -[SUCorePolicy bridgeOSDownloadDirectory](self, "bridgeOSDownloadDirectory");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v46, CFSTR("BridgeOSDownloadDirectory"));

  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy enableEmbeddedOSInstall](self, "enableEmbeddedOSInstall"), CFSTR("EnableEmbeddedOSInstall"));
  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy enableBridgeOSInstall](self, "enableBridgeOSInstall"), CFSTR("EnableBridgeOSInstall"));
  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy enableOSPersonalization](self, "enableOSPersonalization"), CFSTR("EnableOSPersonalization"));
  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy userInitiated](self, "userInitiated"), CFSTR("UserInitiated"));
  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy skipVolumeSealing](self, "skipVolumeSealing"), CFSTR("SkipVolumeSealing"));
  objc_msgSend(v50, "encodeInt:forKey:", -[SUCorePolicy qualityOfService](self, "qualityOfService"), CFSTR("QualityOfService"));
  -[SUCorePolicy updateMetricEventFields](self, "updateMetricEventFields");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v47, CFSTR("UpdateMetricEventFields"));

  -[SUCorePolicy updateMetricContext](self, "updateMetricContext");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v48, CFSTR("UpdateMetricContext"));

  -[SUCorePolicy defaultDescriptorValues](self, "defaultDescriptorValues");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "encodeObject:forKey:", v49, CFSTR("DefaultDescriptorValues"));

  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy enablePreSUStaging](self, "enablePreSUStaging"), CFSTR("EnablePSUSAssets"));
  objc_msgSend(v50, "encodeBool:forKey:", -[SUCorePolicy enablePreSUStagingForOptionalAssets](self, "enablePreSUStagingForOptionalAssets"), CFSTR("EnablePSUSForOptionalAssets"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  SUCorePolicy *v4;
  SUCorePolicy *v5;
  int64_t v6;
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
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  _BOOL4 v47;
  _BOOL4 v48;
  _BOOL4 v49;
  _BOOL4 v50;
  _BOOL4 v51;
  _BOOL4 v52;
  int v53;
  int v54;
  int v55;
  int v56;
  char v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  char v65;
  int v66;
  int v67;
  SUCorePolicy *v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  void *v75;
  uint64_t v76;
  _BOOL4 v77;
  _BOOL4 v78;
  void *v79;
  uint64_t v80;
  int v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  _BOOL4 v100;
  _BOOL4 v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  _BOOL4 v108;
  void *v109;
  uint64_t v110;
  _BOOL4 v111;
  _BOOL4 v112;
  _BOOL4 v113;
  _BOOL4 v114;
  _BOOL4 v115;
  int v116;
  void *v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  _BOOL4 v123;
  _BOOL4 v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  SUCorePolicy *v217;
  SUCorePolicy *v218;
  void *v219;
  void *v220;
  _QWORD v221[3];
  _BYTE v222[12];
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  _QWORD v227[3];
  uint64_t v228;
  int v229;
  int v230;
  int v231;
  int v232;
  _BYTE v233[28];
  uint64_t v234;
  int64_t v235;

  v4 = (SUCorePolicy *)a3;
  if (v4 == self)
  {
    v57 = 1;
    goto LABEL_136;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v57 = 0;
    goto LABEL_136;
  }
  v5 = v4;
  v6 = -[SUCorePolicy specifiedUsedPolicies](self, "specifiedUsedPolicies");
  v234 = -[SUCorePolicy specifiedUsedPolicies](v5, "specifiedUsedPolicies");
  v235 = v6;
  if (v6 != v234
    || (-[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        -[SUCorePolicy softwareUpdateScanPolicy](v5, "softwareUpdateScanPolicy"),
        v220 = v8,
        v219 = (void *)objc_claimAutoreleasedReturnValue(),
        !objc_msgSend(v8, "isEqual:")))
  {
    v58 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v62 = 0;
    v232 = 0;
    memset(v233, 0, sizeof(v233));
    v230 = 0;
    v231 = 0;
    v229 = 0;
    v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    v226 = 0;
    v225 = 0;
    v224 = 0;
    memset(v227, 0, sizeof(v227));
    v228 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    goto LABEL_41;
  }
  -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy documentationScanPolicy](v5, "documentationScanPolicy");
  v216 = v9;
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqual:"))
  {
    v58 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v62 = 0;
    memset(v233, 0, 24);
    v230 = 0;
    v231 = 0;
    v229 = 0;
    v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    v226 = 0;
    v225 = 0;
    v224 = 0;
    memset(v227, 0, sizeof(v227));
    v228 = 0;
    v232 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_DWORD *)&v233[24] = 1;
    goto LABEL_41;
  }
  -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy documentationDownloadPolicy](v5, "documentationDownloadPolicy");
  v214 = v10;
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "isEqual:"))
  {
    v58 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v62 = 0;
    v232 = 0;
    memset(v233, 0, 20);
    v230 = 0;
    v231 = 0;
    v229 = 0;
    v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    v226 = 0;
    v225 = 0;
    v224 = 0;
    memset(v227, 0, sizeof(v227));
    v228 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    goto LABEL_41;
  }
  -[SUCorePolicy loadBrainPolicy](self, "loadBrainPolicy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy loadBrainPolicy](v5, "loadBrainPolicy");
  v212 = v11;
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "isEqual:"))
  {
    *(_QWORD *)&v233[8] = 0;
    v58 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v62 = 0;
    *(_QWORD *)v233 = 0;
    v230 = 0;
    v231 = 0;
    v229 = 0;
    v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    v226 = 0;
    v225 = 0;
    v224 = 0;
    memset(v227, 0, sizeof(v227));
    v228 = 0;
    v232 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    goto LABEL_41;
  }
  -[SUCorePolicy downloadPreflightPolicy](self, "downloadPreflightPolicy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy downloadPreflightPolicy](v5, "downloadPreflightPolicy");
  v210 = v12;
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isEqual:"))
  {
    *(_QWORD *)&v233[4] = 0;
    v58 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v62 = 0;
    v232 = 0;
    *(_DWORD *)v233 = 0;
    v230 = 0;
    v231 = 0;
    v229 = 0;
    v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    v226 = 0;
    v225 = 0;
    v224 = 0;
    memset(v227, 0, sizeof(v227));
    v228 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_DWORD *)&v233[12] = 1;
    goto LABEL_41;
  }
  -[SUCorePolicy wakeupPreflightPolicy](self, "wakeupPreflightPolicy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy wakeupPreflightPolicy](v5, "wakeupPreflightPolicy");
  v208 = v13;
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "isEqual:"))
  {
    v58 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v62 = 0;
    *(_QWORD *)v233 = 0;
    v230 = 0;
    v231 = 0;
    v229 = 0;
    v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    v226 = 0;
    v225 = 0;
    v224 = 0;
    memset(v227, 0, sizeof(v227));
    v228 = 0;
    v232 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    goto LABEL_41;
  }
  -[SUCorePolicy prerequisiteCheckPreflightPolicy](self, "prerequisiteCheckPreflightPolicy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy prerequisiteCheckPreflightPolicy](v5, "prerequisiteCheckPreflightPolicy");
  v206 = v14;
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "isEqual:"))
  {
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v62 = 0;
    *(_QWORD *)v233 = 0;
    v230 = 0;
    v231 = 0;
    v229 = 0;
    v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    v226 = 0;
    v225 = 0;
    v224 = 0;
    memset(v227, 0, sizeof(v227));
    v228 = 0;
    v232 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    goto LABEL_41;
  }
  -[SUCorePolicy personalizePreflightPolicy](self, "personalizePreflightPolicy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy personalizePreflightPolicy](v5, "personalizePreflightPolicy");
  v204 = v15;
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "isEqual:"))
  {
    v60 = 0;
    v61 = 0;
    v62 = 0;
    *(_QWORD *)v233 = 0;
    v230 = 0;
    v231 = 0;
    v229 = 0;
    v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    v226 = 0;
    v225 = 0;
    v224 = 0;
    memset(v227, 0, sizeof(v227));
    v228 = 0;
    v232 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    goto LABEL_41;
  }
  -[SUCorePolicy fdrRecoveryPreflightPolicy](self, "fdrRecoveryPreflightPolicy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy fdrRecoveryPreflightPolicy](v5, "fdrRecoveryPreflightPolicy");
  v202 = v16;
  v201 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "isEqual:"))
  {
    v61 = 0;
    v62 = 0;
    *(_QWORD *)v233 = 0;
    v230 = 0;
    v231 = 0;
    v229 = 0;
    v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    v226 = 0;
    v225 = 0;
    v224 = 0;
    memset(v227, 0, sizeof(v227));
    v228 = 0;
    v232 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    goto LABEL_41;
  }
  -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy softwareUpdateDownloadPolicy](v5, "softwareUpdateDownloadPolicy");
  v200 = v17;
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v17, "isEqual:"))
  {
    v62 = 0;
    *(_QWORD *)v233 = 0;
    v230 = 0;
    v231 = 0;
    v229 = 0;
    v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    v226 = 0;
    v225 = 0;
    v224 = 0;
    memset(v227, 0, sizeof(v227));
    v228 = 0;
    v232 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    goto LABEL_41;
  }
  -[SUCorePolicy preparePolicy](self, "preparePolicy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy preparePolicy](v5, "preparePolicy");
  v198 = v18;
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v18, "isEqual:"))
  {
    *(_QWORD *)v233 = 0;
    v230 = 0;
    v231 = 0;
    v229 = 0;
    v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    v226 = 0;
    v225 = 0;
    v224 = 0;
    memset(v227, 0, sizeof(v227));
    v228 = 0;
    v232 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    goto LABEL_41;
  }
  -[SUCorePolicy suspendPolicy](self, "suspendPolicy");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy suspendPolicy](v5, "suspendPolicy");
  v196 = v19;
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v19, "isEqual:"))
  {
    v232 = 0;
    *(_QWORD *)v233 = 0x100000000;
    v230 = 0;
    v231 = 0;
    v229 = 0;
    v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    v226 = 0;
    v225 = 0;
    v224 = 0;
    memset(v227, 0, sizeof(v227));
    v228 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    goto LABEL_41;
  }
  -[SUCorePolicy resumePolicy](self, "resumePolicy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v217 = v5;
  -[SUCorePolicy resumePolicy](v5, "resumePolicy");
  v194 = v20;
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v20, "isEqual:"))
  {
    v230 = 0;
    v231 = 0;
    v229 = 0;
    v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    v226 = 0;
    v225 = 0;
    v224 = 0;
    memset(v227, 0, sizeof(v227));
    v228 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    v232 = 0;
    *(_QWORD *)v233 = 0x100000001;
    goto LABEL_162;
  }
  -[SUCorePolicy applyPolicy](self, "applyPolicy");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy applyPolicy](v5, "applyPolicy");
  v192 = v21;
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v21, "isEqual:"))
  {
    v229 = 0;
    v230 = 0;
    v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    v226 = 0;
    v225 = 0;
    v224 = 0;
    memset(v227, 0, sizeof(v227));
    v228 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    v232 = 0;
    *(_QWORD *)v233 = 0x100000001;
    v231 = 1;
    goto LABEL_162;
  }
  -[SUCorePolicy rollbackPolicy](self, "rollbackPolicy");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy rollbackPolicy](v5, "rollbackPolicy");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  v190 = v22;
  if (!objc_msgSend(v22, "isEqual:"))
  {
    v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    v226 = 0;
    v225 = 0;
    v224 = 0;
    memset(v227, 0, sizeof(v227));
    v228 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    v232 = 0;
    *(_QWORD *)v233 = 0x100000001;
    v230 = 0;
    v231 = 1;
    v229 = 1;
    goto LABEL_162;
  }
  v23 = (void *)MEMORY[0x1E0DA8920];
  -[SUCorePolicy softwareUpdateAssetType](v5, "softwareUpdateAssetType");
  v24 = objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy softwareUpdateAssetType](self, "softwareUpdateAssetType");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v188 = (void *)v24;
  if (!objc_msgSend(v23, "stringIsEqual:to:", v24))
  {
    v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    v226 = 0;
    v225 = 0;
    v224 = 0;
    memset(v227, 0, 20);
    v228 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    v232 = 0;
    *(_QWORD *)v233 = 0x100000001;
    v230 = 0;
    v231 = 1;
    v229 = 1;
    HIDWORD(v227[2]) = 1;
    goto LABEL_162;
  }
  v25 = (void *)MEMORY[0x1E0DA8920];
  -[SUCorePolicy documentationAssetType](v5, "documentationAssetType");
  v26 = objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy documentationAssetType](self, "documentationAssetType");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v186 = (void *)v26;
  if (!objc_msgSend(v25, "stringIsEqual:to:", v26))
  {
    v227[1] = 0;
    v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    v226 = 0;
    v225 = 0;
    v224 = 0;
    v227[0] = 0;
    v228 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    v232 = 0;
    *(_QWORD *)v233 = 0x100000001;
    v230 = 0;
    v231 = 1;
    v229 = 1;
    v227[2] = 0x100000001;
    goto LABEL_162;
  }
  v27 = (void *)MEMORY[0x1E0DA8920];
  -[SUCorePolicy targetVolumeUUID](v5, "targetVolumeUUID");
  v28 = objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy targetVolumeUUID](self, "targetVolumeUUID");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v184 = (void *)v28;
  if (!objc_msgSend(v27, "stringIsEqual:to:", v28))
  {
    v223 = 0;
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    v226 = 0;
    v225 = 0;
    v224 = 0;
    v227[0] = 0;
    v227[1] = 0x100000000;
    v228 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    v232 = 0;
    *(_QWORD *)v233 = 0x100000001;
    v230 = 0;
    v231 = 1;
    v229 = 1;
    v227[2] = 0x100000001;
    goto LABEL_162;
  }
  v29 = (void *)MEMORY[0x1E0DA8920];
  -[SUCorePolicy prerequisiteBuildVersion](v5, "prerequisiteBuildVersion");
  v30 = objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v182 = (void *)v30;
  if (!objc_msgSend(v29, "stringIsEqual:to:", v30))
  {
    memset(v221, 0, sizeof(v221));
    memset(v222, 0, sizeof(v222));
    v223 = 0x100000000;
    v226 = 0;
    v225 = 0;
    v224 = 0;
    v227[0] = 0;
    v227[1] = 0x100000000;
    v228 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    v232 = 0;
    *(_QWORD *)v233 = 0x100000001;
    v230 = 0;
    v231 = 1;
    v229 = 1;
    v227[2] = 0x100000001;
    goto LABEL_162;
  }
  v31 = (void *)MEMORY[0x1E0DA8920];
  -[SUCorePolicy prerequisiteProductVersion](v5, "prerequisiteProductVersion");
  v32 = objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v180 = (void *)v32;
  if (!objc_msgSend(v31, "stringIsEqual:to:", v32))
  {
    *(_QWORD *)v222 = 0;
    memset(v221, 0, sizeof(v221));
    v223 = 0x100000000;
    v226 = 0;
    v225 = 0;
    v224 = 0;
    v227[0] = 0;
    v227[1] = 0x100000000;
    v228 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    v232 = 0;
    *(_QWORD *)v233 = 0x100000001;
    v230 = 0;
    v231 = 1;
    v229 = 1;
    v227[2] = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    goto LABEL_162;
  }
  v33 = (void *)MEMORY[0x1E0DA8920];
  -[SUCorePolicy prerequisiteRestoreVersion](v5, "prerequisiteRestoreVersion");
  v34 = objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy prerequisiteRestoreVersion](self, "prerequisiteRestoreVersion");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v178 = (void *)v34;
  if (!objc_msgSend(v33, "stringIsEqual:to:", v34))
  {
    memset(v221, 0, sizeof(v221));
    *(_QWORD *)v222 = 0x100000000;
    v223 = 0x100000000;
    v226 = 0;
    v225 = 0;
    v224 = 0;
    v227[0] = 0;
    v227[1] = 0x100000000;
    v228 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    v232 = 0;
    *(_QWORD *)v233 = 0x100000001;
    v230 = 0;
    v231 = 1;
    v229 = 1;
    v227[2] = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    goto LABEL_162;
  }
  v35 = (void *)MEMORY[0x1E0DA8920];
  -[SUCorePolicy targetRestoreVersion](v5, "targetRestoreVersion");
  v36 = objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy targetRestoreVersion](self, "targetRestoreVersion");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v176 = (void *)v36;
  if (!objc_msgSend(v35, "stringIsEqual:to:", v36))
  {
    memset(v221, 0, 20);
    *(_QWORD *)v222 = 0x100000000;
    v223 = 0x100000000;
    v226 = 0;
    v225 = 0;
    v224 = 0;
    v227[0] = 0;
    v227[1] = 0x100000000;
    v228 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    v232 = 0;
    *(_QWORD *)v233 = 0x100000001;
    v230 = 0;
    v231 = 1;
    v229 = 1;
    v227[2] = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    HIDWORD(v221[2]) = 1;
    goto LABEL_162;
  }
  v37 = (void *)MEMORY[0x1E0DA8920];
  -[SUCorePolicy installedSFRVersion](v5, "installedSFRVersion");
  v38 = objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy installedSFRVersion](self, "installedSFRVersion");
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  v174 = (void *)v38;
  if (!objc_msgSend(v37, "stringIsEqual:to:", v38))
  {
    v221[0] = 0;
    v221[1] = 0;
    *(_QWORD *)v222 = 0x100000000;
    v223 = 0x100000000;
    v226 = 0;
    v225 = 0;
    v224 = 0;
    v227[0] = 0;
    v227[1] = 0x100000000;
    v228 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    v232 = 0;
    *(_QWORD *)v233 = 0x100000001;
    v230 = 0;
    v231 = 1;
    v229 = 1;
    v227[2] = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    goto LABEL_162;
  }
  v39 = (void *)MEMORY[0x1E0DA8920];
  -[SUCorePolicy deviceClass](v5, "deviceClass");
  v40 = objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy deviceClass](self, "deviceClass");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v172 = (void *)v40;
  if (!objc_msgSend(v39, "stringIsEqual:to:", v40))
  {
    *(_QWORD *)((char *)v221 + 4) = 0;
    LODWORD(v221[0]) = 0;
    *(_QWORD *)v222 = 0x100000000;
    v223 = 0x100000000;
    v226 = 0;
    v225 = 0;
    v224 = 0;
    v227[0] = 0;
    v227[1] = 0x100000000;
    v228 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    v232 = 0;
    *(_QWORD *)v233 = 0x100000001;
    v230 = 0;
    v231 = 1;
    v229 = 1;
    v227[2] = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    HIDWORD(v221[1]) = 1;
    goto LABEL_162;
  }
  v41 = (void *)MEMORY[0x1E0DA8920];
  -[SUCorePolicy hwModelStr](v5, "hwModelStr");
  v42 = objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy hwModelStr](self, "hwModelStr");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v170 = (void *)v42;
  if (!objc_msgSend(v41, "stringIsEqual:to:", v42))
  {
    v221[0] = 0;
    *(_QWORD *)v222 = 0x100000000;
    v223 = 0x100000000;
    v226 = 0;
    v225 = 0;
    v224 = 0;
    v227[0] = 0;
    v227[1] = 0x100000000;
    v228 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    v232 = 0;
    *(_QWORD *)v233 = 0x100000001;
    v230 = 0;
    v231 = 1;
    v229 = 1;
    v227[2] = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    goto LABEL_162;
  }
  v43 = (void *)MEMORY[0x1E0DA8920];
  -[SUCorePolicy productType](v5, "productType");
  v44 = objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy productType](self, "productType");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = (void *)v44;
  if (!objc_msgSend(v43, "stringIsEqual:to:", v44))
  {
    v221[0] = 0x100000000;
    *(_QWORD *)v222 = 0x100000000;
    v223 = 0x100000000;
    v226 = 0;
    v225 = 0;
    v224 = 0;
    v227[0] = 0;
    v227[1] = 0x100000000;
    v228 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    v232 = 0;
    *(_QWORD *)v233 = 0x100000001;
    v230 = 0;
    v231 = 1;
    v229 = 1;
    v227[2] = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    goto LABEL_162;
  }
  v45 = (void *)MEMORY[0x1E0DA8920];
  -[SUCorePolicy releaseType](v5, "releaseType");
  v46 = objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy releaseType](self, "releaseType");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = (void *)v46;
  if (!objc_msgSend(v45, "stringIsEqual:to:", v46)
    || (v47 = -[SUCorePolicy isInternal](v217, "isInternal"), v47 != -[SUCorePolicy isInternal](self, "isInternal"))
    || (v48 = -[SUCorePolicy checkAvailableSpace](v217, "checkAvailableSpace"),
        v48 != -[SUCorePolicy checkAvailableSpace](self, "checkAvailableSpace"))
    || (v49 = -[SUCorePolicy restrictToFull](v217, "restrictToFull"),
        v49 != -[SUCorePolicy restrictToFull](self, "restrictToFull"))
    || (v50 = -[SUCorePolicy allowSameVersion](v217, "allowSameVersion"),
        v50 != -[SUCorePolicy allowSameVersion](self, "allowSameVersion"))
    || (v51 = -[SUCorePolicy background](v217, "background"), v51 != -[SUCorePolicy background](self, "background"))
    || (v52 = -[SUCorePolicy allowsCellular](v217, "allowsCellular"),
        v52 != -[SUCorePolicy allowsCellular](self, "allowsCellular")))
  {
    *(_QWORD *)v222 = 0x100000000;
    v223 = 0x100000000;
    v226 = 0;
    v225 = 0;
    v224 = 0;
    v227[0] = 0;
    v227[1] = 0x100000000;
    v228 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    v232 = 0;
    *(_QWORD *)v233 = 0x100000001;
    v230 = 0;
    v231 = 1;
    v229 = 1;
    v227[2] = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
LABEL_162:
    v5 = v217;
    goto LABEL_41;
  }
  v75 = (void *)MEMORY[0x1E0DA8920];
  -[SUCorePolicy userAgentString](v217, "userAgentString");
  v76 = objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy userAgentString](self, "userAgentString");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  v164 = (void *)v76;
  if (!objc_msgSend(v75, "stringIsEqual:to:", v76)
    || (v77 = -[SUCorePolicy performPreflightEncryptedCheck](v217, "performPreflightEncryptedCheck"),
        v77 != -[SUCorePolicy performPreflightEncryptedCheck](self, "performPreflightEncryptedCheck"))
    || (v78 = -[SUCorePolicy performPreflightSnapshotCheck](v217, "performPreflightSnapshotCheck"),
        v78 != -[SUCorePolicy performPreflightSnapshotCheck](self, "performPreflightSnapshotCheck")))
  {
    v223 = 0x100000000;
    v226 = 0;
    v225 = 0;
    v224 = 0;
    v227[0] = 0;
    v227[1] = 0x100000000;
    v228 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    v232 = 0;
    *(_QWORD *)v233 = 0x100000001;
    v230 = 0;
    v231 = 1;
    v229 = 1;
    v227[2] = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(_QWORD *)v222 = 0x100000001;
    goto LABEL_162;
  }
  v79 = (void *)MEMORY[0x1E0DA8920];
  -[SUCorePolicy ssoToken](v217, "ssoToken");
  v80 = objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy ssoToken](self, "ssoToken");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = (void *)v80;
  if (!objc_msgSend(v79, "dataIsEqual:to:", v80)
    || (v81 = -[SUCorePolicy cacheDeleteUrgency](v217, "cacheDeleteUrgency"),
        v81 != -[SUCorePolicy cacheDeleteUrgency](self, "cacheDeleteUrgency")))
  {
    v226 = 0;
    v225 = 0;
    v224 = 0;
    v227[0] = 0;
    v227[1] = 0x100000000;
    v228 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    v232 = 0;
    *(_QWORD *)v233 = 0x100000001;
    v230 = 0;
    v231 = 1;
    v229 = 1;
    v227[2] = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(_QWORD *)v222 = 0x100000001;
    v223 = 0x100000001;
    goto LABEL_162;
  }
  v82 = (void *)MEMORY[0x1E0DA8920];
  -[SUCorePolicy updateVolumePath](v217, "updateVolumePath");
  v83 = objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy updateVolumePath](self, "updateVolumePath");
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = (void *)v83;
  if (!objc_msgSend(v82, "stringIsEqual:to:", v83))
  {
    v225 = 0;
    v224 = 0;
    v226 = 0x100000000;
    v227[0] = 0;
    v227[1] = 0x100000000;
    v228 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    v232 = 0;
    *(_QWORD *)v233 = 0x100000001;
    v230 = 0;
    v231 = 1;
    v229 = 1;
    v227[2] = 0x100000001;
    v223 = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(_QWORD *)v222 = 0x100000001;
    goto LABEL_162;
  }
  v84 = (void *)MEMORY[0x1E0DA8920];
  -[SUCorePolicy personalizedManifestRootsPath](v217, "personalizedManifestRootsPath");
  v85 = objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy personalizedManifestRootsPath](self, "personalizedManifestRootsPath");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = (void *)v85;
  if (!objc_msgSend(v84, "stringIsEqual:to:", v85))
  {
    v224 = 0;
    v225 = 0x100000000;
    v226 = 0x100000000;
    v227[0] = 0;
    v227[1] = 0x100000000;
    v228 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    v232 = 0;
    *(_QWORD *)v233 = 0x100000001;
    v230 = 0;
    v231 = 1;
    v229 = 1;
    v227[2] = 0x100000001;
    v223 = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(_QWORD *)v222 = 0x100000001;
    goto LABEL_162;
  }
  v86 = (void *)MEMORY[0x1E0DA8920];
  -[SUCorePolicy localAuthenticationContext](v217, "localAuthenticationContext");
  v87 = objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy localAuthenticationContext](self, "localAuthenticationContext");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  v156 = (void *)v87;
  if (!objc_msgSend(v86, "dataIsEqual:to:", v87))
  {
    v224 = 0x100000000;
    v225 = 0x100000000;
    v226 = 0x100000000;
    v227[0] = 0;
    v227[1] = 0x100000000;
    v228 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    v232 = 0;
    *(_QWORD *)v233 = 0x100000001;
    v230 = 0;
    v231 = 1;
    v229 = 1;
    v227[2] = 0x100000001;
    v223 = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(_QWORD *)v222 = 0x100000001;
    goto LABEL_162;
  }
  v88 = (void *)MEMORY[0x1E0DA8920];
  -[SUCorePolicy localAuthenticationUserID](v217, "localAuthenticationUserID");
  v89 = objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy localAuthenticationUserID](self, "localAuthenticationUserID");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  v154 = (void *)v89;
  if (!objc_msgSend(v88, "numberIsEqual:to:", v89))
  {
    v225 = 0x100000000;
    v226 = 0x100000000;
    v227[0] = 0;
    v227[1] = 0x100000000;
    v228 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    v232 = 0;
    *(_QWORD *)v233 = 0x100000001;
    v230 = 0;
    v231 = 1;
    v229 = 1;
    v227[2] = 0x100000001;
    v223 = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(_QWORD *)v222 = 0x100000001;
    v224 = 0x100000001;
    goto LABEL_162;
  }
  v90 = (void *)MEMORY[0x1E0DA8920];
  -[SUCorePolicy mdmBootstrapToken](v217, "mdmBootstrapToken");
  v91 = objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy mdmBootstrapToken](self, "mdmBootstrapToken");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = (void *)v91;
  if (!objc_msgSend(v90, "stringIsEqual:to:", v91))
  {
    v226 = 0x100000000;
    v227[0] = 0;
    v227[1] = 0x100000000;
    v228 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    v232 = 0;
    *(_QWORD *)v233 = 0x100000001;
    v230 = 0;
    v231 = 1;
    v229 = 1;
    v227[2] = 0x100000001;
    v223 = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(_QWORD *)v222 = 0x100000001;
    v224 = 0x100000001;
    v225 = 0x100000001;
    goto LABEL_162;
  }
  v92 = (void *)MEMORY[0x1E0DA8920];
  -[SUCorePolicy downloadAuthorizationHeader](v217, "downloadAuthorizationHeader");
  v93 = objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = (void *)v93;
  if (!objc_msgSend(v92, "stringIsEqual:to:", v93))
  {
    v227[0] = 0;
    v227[1] = 0x100000000;
    v228 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    v232 = 0;
    *(_QWORD *)v233 = 0x100000001;
    v230 = 0;
    v231 = 1;
    v229 = 1;
    v227[2] = 0x100000001;
    v223 = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(_QWORD *)v222 = 0x100000001;
    v225 = 0x100000001;
    v224 = 0x100000001;
    v226 = 0x100000001;
    goto LABEL_162;
  }
  v94 = (void *)MEMORY[0x1E0DA8920];
  -[SUCorePolicy updateBrainLocationOverride](v217, "updateBrainLocationOverride");
  v95 = objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy updateBrainLocationOverride](self, "updateBrainLocationOverride");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = (void *)v95;
  if (!objc_msgSend(v94, "stringIsEqual:to:", v95))
  {
    *(_QWORD *)((char *)v227 + 4) = 0;
    v228 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    v232 = 0;
    *(_QWORD *)v233 = 0x100000001;
    v230 = 0;
    v231 = 1;
    v229 = 1;
    v227[2] = 0x100000001;
    HIDWORD(v227[1]) = 1;
    v223 = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(_QWORD *)v222 = 0x100000001;
    v226 = 0x100000001;
    v225 = 0x100000001;
    v224 = 0x100000001;
    LODWORD(v227[0]) = 1;
    goto LABEL_162;
  }
  v96 = (void *)MEMORY[0x1E0DA8920];
  -[SUCorePolicy assetAudienceUUID](v217, "assetAudienceUUID");
  v97 = objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy assetAudienceUUID](self, "assetAudienceUUID");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  v146 = (void *)v97;
  if (!objc_msgSend(v96, "stringIsEqual:to:", v97))
  {
    v228 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    v232 = 0;
    *(_QWORD *)v233 = 0x100000001;
    v230 = 0;
    v231 = 1;
    v229 = 1;
    v227[2] = 0x100000001;
    v223 = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(_QWORD *)v222 = 0x100000001;
    v226 = 0x100000001;
    v225 = 0x100000001;
    v224 = 0x100000001;
    v227[0] = 1;
    v227[1] = 0x100000001;
    goto LABEL_162;
  }
  v98 = (void *)MEMORY[0x1E0DA8920];
  -[SUCorePolicy alternateAssetAudienceUUID](v217, "alternateAssetAudienceUUID");
  v99 = objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v144 = (void *)v99;
  if (!objc_msgSend(v98, "stringIsEqual:to:", v99)
    || (v100 = -[SUCorePolicy disableAlternateUpdate](v217, "disableAlternateUpdate"),
        v100 != -[SUCorePolicy disableAlternateUpdate](self, "disableAlternateUpdate"))
    || (v101 = -[SUCorePolicy disableSplatCombo](v217, "disableSplatCombo"),
        v101 != -[SUCorePolicy disableSplatCombo](self, "disableSplatCombo")))
  {
    v228 = 0;
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    v232 = 0;
    *(_QWORD *)v233 = 0x100000001;
    v230 = 0;
    v231 = 1;
    v229 = 1;
    v227[2] = 0x100000001;
    v227[1] = 0x100000001;
    v223 = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(_QWORD *)v222 = 0x100000001;
    v226 = 0x100000001;
    v225 = 0x100000001;
    v224 = 0x100000001;
    v227[0] = 0x100000001;
    goto LABEL_162;
  }
  v102 = (void *)MEMORY[0x1E0DA8920];
  -[SUCorePolicy personalizationServerURL](v217, "personalizationServerURL");
  v103 = objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy personalizationServerURL](self, "personalizationServerURL");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = (void *)v103;
  if (!objc_msgSend(v102, "stringIsEqual:to:", v103))
  {
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    v232 = 0;
    *(_QWORD *)v233 = 0x100000001;
    v230 = 0;
    v231 = 1;
    v229 = 1;
    v227[2] = 0x100000001;
    v227[1] = 0x100000001;
    v223 = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(_QWORD *)v222 = 0x100000001;
    v226 = 0x100000001;
    v225 = 0x100000001;
    v224 = 0x100000001;
    v227[0] = 0x100000001;
    v228 = 1;
    goto LABEL_162;
  }
  v104 = (void *)MEMORY[0x1E0DA8920];
  -[SUCorePolicy proxyHostName](v217, "proxyHostName");
  v105 = objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy proxyHostName](self, "proxyHostName");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = (void *)v105;
  if (!objc_msgSend(v104, "stringIsEqual:to:", v105))
  {
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    v232 = 0;
    *(_QWORD *)v233 = 0x100000001;
    v230 = 0;
    v231 = 1;
    v229 = 1;
    v227[2] = 0x100000001;
    v227[1] = 0x100000001;
    v223 = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(_QWORD *)v222 = 0x100000001;
    v226 = 0x100000001;
    v225 = 0x100000001;
    v224 = 0x100000001;
    v227[0] = 0x100000001;
    v228 = 0x100000001;
    goto LABEL_162;
  }
  v106 = (void *)MEMORY[0x1E0DA8920];
  -[SUCorePolicy proxyPortNumber](v217, "proxyPortNumber");
  v107 = objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy proxyPortNumber](self, "proxyPortNumber");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v138 = (void *)v107;
  if (!objc_msgSend(v106, "numberIsEqual:to:", v107)
    || (v108 = -[SUCorePolicy bridgeOSIgnoreMinimumVersionCheck](v217, "bridgeOSIgnoreMinimumVersionCheck"),
        v108 != -[SUCorePolicy bridgeOSIgnoreMinimumVersionCheck](self, "bridgeOSIgnoreMinimumVersionCheck")))
  {
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    v232 = 0;
    *(_QWORD *)v233 = 0x100000001;
    v231 = 1;
    v229 = 1;
    v227[2] = 0x100000001;
    v227[1] = 0x100000001;
    v223 = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(_QWORD *)v222 = 0x100000001;
    v226 = 0x100000001;
    v225 = 0x100000001;
    v224 = 0x100000001;
    v227[0] = 0x100000001;
    v228 = 0x100000001;
    v230 = 1;
    goto LABEL_162;
  }
  v109 = (void *)MEMORY[0x1E0DA8920];
  -[SUCorePolicy bridgeOSDownloadDirectory](v217, "bridgeOSDownloadDirectory");
  v110 = objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy bridgeOSDownloadDirectory](self, "bridgeOSDownloadDirectory");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = (void *)v110;
  if (!objc_msgSend(v109, "stringIsEqual:to:", v110)
    || (v111 = -[SUCorePolicy enableEmbeddedOSInstall](v217, "enableEmbeddedOSInstall"),
        v111 != -[SUCorePolicy enableEmbeddedOSInstall](self, "enableEmbeddedOSInstall"))
    || (v112 = -[SUCorePolicy enableBridgeOSInstall](v217, "enableBridgeOSInstall"),
        v112 != -[SUCorePolicy enableBridgeOSInstall](self, "enableBridgeOSInstall"))
    || (v113 = -[SUCorePolicy enableOSPersonalization](v217, "enableOSPersonalization"),
        v113 != -[SUCorePolicy enableOSPersonalization](self, "enableOSPersonalization"))
    || (v114 = -[SUCorePolicy userInitiated](v217, "userInitiated"),
        v114 != -[SUCorePolicy userInitiated](self, "userInitiated"))
    || (v115 = -[SUCorePolicy skipVolumeSealing](v217, "skipVolumeSealing"),
        v115 != -[SUCorePolicy skipVolumeSealing](self, "skipVolumeSealing"))
    || (v116 = -[SUCorePolicy qualityOfService](v217, "qualityOfService"),
        v116 != -[SUCorePolicy qualityOfService](self, "qualityOfService")))
  {
    v53 = 0;
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    *(_QWORD *)v233 = 0x100000001;
    v231 = 1;
    v229 = 1;
    v227[2] = 0x100000001;
    v227[1] = 0x100000001;
    v223 = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(_QWORD *)v222 = 0x100000001;
    v226 = 0x100000001;
    v225 = 0x100000001;
    v224 = 0x100000001;
    v227[0] = 0x100000001;
    v228 = 0x100000001;
    v230 = 1;
    v232 = 1;
    goto LABEL_162;
  }
  v117 = (void *)MEMORY[0x1E0DA8920];
  -[SUCorePolicy updateMetricEventFields](v217, "updateMetricEventFields");
  v118 = objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy updateMetricEventFields](self, "updateMetricEventFields");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = (void *)v118;
  if (!objc_msgSend(v117, "dictionaryIsEqual:to:", v118))
  {
    v54 = 0;
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    *(_QWORD *)v233 = 0x100000001;
    v231 = 1;
    v229 = 1;
    v227[2] = 0x100000001;
    v227[1] = 0x100000001;
    v223 = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(_QWORD *)v222 = 0x100000001;
    v226 = 0x100000001;
    v225 = 0x100000001;
    v224 = 0x100000001;
    v227[0] = 0x100000001;
    v228 = 0x100000001;
    v230 = 1;
    v232 = 1;
    v53 = 1;
    goto LABEL_162;
  }
  v119 = (void *)MEMORY[0x1E0DA8920];
  -[SUCorePolicy updateMetricContext](v217, "updateMetricContext");
  v120 = objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy updateMetricContext](self, "updateMetricContext");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = (void *)v120;
  if (!objc_msgSend(v119, "stringIsEqual:to:", v120))
  {
    v55 = 0;
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    *(_QWORD *)v233 = 0x100000001;
    v231 = 1;
    v229 = 1;
    v227[2] = 0x100000001;
    v227[1] = 0x100000001;
    v223 = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(_QWORD *)v222 = 0x100000001;
    v226 = 0x100000001;
    v225 = 0x100000001;
    v224 = 0x100000001;
    v227[0] = 0x100000001;
    v228 = 0x100000001;
    v230 = 1;
    v232 = 1;
    v53 = 1;
    v54 = 1;
    goto LABEL_162;
  }
  v121 = (void *)MEMORY[0x1E0DA8920];
  -[SUCorePolicy defaultDescriptorValues](v217, "defaultDescriptorValues");
  v122 = objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy defaultDescriptorValues](self, "defaultDescriptorValues");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = (void *)v122;
  if (!objc_msgSend(v121, "dictionaryIsEqual:to:", v122)
    || (v123 = -[SUCorePolicy enablePreSUStaging](v217, "enablePreSUStaging"),
        v123 != -[SUCorePolicy enablePreSUStaging](self, "enablePreSUStaging"))
    || (v124 = -[SUCorePolicy enablePreSUStagingForOptionalAssets](v217, "enablePreSUStagingForOptionalAssets"),
        v124 != -[SUCorePolicy enablePreSUStagingForOptionalAssets](self, "enablePreSUStagingForOptionalAssets")))
  {
    v56 = 0;
    v57 = 0;
    *(_QWORD *)&v233[20] = 0x100000001;
    *(_DWORD *)&v233[16] = 1;
    *(_QWORD *)&v233[8] = 0x100000001;
    v58 = 1;
    v59 = 1;
    v60 = 1;
    v61 = 1;
    v62 = 1;
    *(_QWORD *)v233 = 0x100000001;
    v231 = 1;
    v229 = 1;
    v227[2] = 0x100000001;
    v227[1] = 0x100000001;
    v223 = 0x100000001;
    *(_DWORD *)&v222[8] = 1;
    v221[2] = 0x100000001;
    v221[1] = 0x100000001;
    v221[0] = 0x100000001;
    *(_QWORD *)v222 = 0x100000001;
    v226 = 0x100000001;
    v225 = 0x100000001;
    v224 = 0x100000001;
    v227[0] = 0x100000001;
    v228 = 0x100000001;
    v230 = 1;
    v232 = 1;
    v53 = 1;
    v54 = 1;
    v55 = 1;
    goto LABEL_162;
  }
  v125 = (void *)MEMORY[0x1E0DA8920];
  -[SUCorePolicy policyExtensions](self, "policyExtensions");
  v126 = objc_claimAutoreleasedReturnValue();
  v5 = v217;
  -[SUCorePolicy policyExtensions](v217, "policyExtensions");
  v127 = objc_claimAutoreleasedReturnValue();
  v128 = (void *)v126;
  v57 = objc_msgSend(v125, "arrayIsEqual:to:", v126, v127);
  v7 = (void *)v127;
  v56 = 1;
  *(_QWORD *)&v233[20] = 0x100000001;
  *(_DWORD *)&v233[16] = 1;
  *(_QWORD *)&v233[8] = 0x100000001;
  v58 = 1;
  v59 = 1;
  v60 = 1;
  v61 = 1;
  v62 = 1;
  *(_QWORD *)v233 = 0x100000001;
  v231 = 1;
  v229 = 1;
  v227[2] = 0x100000001;
  v227[1] = 0x100000001;
  v223 = 0x100000001;
  *(_DWORD *)&v222[8] = 1;
  v221[2] = 0x100000001;
  v221[1] = 0x100000001;
  v221[0] = 0x100000001;
  *(_QWORD *)v222 = 0x100000001;
  v226 = 0x100000001;
  v225 = 0x100000001;
  v224 = 0x100000001;
  v227[0] = 0x100000001;
  v228 = 0x100000001;
  v230 = 1;
  v232 = 1;
  v53 = 1;
  v54 = 1;
  v55 = 1;
LABEL_41:
  if (v56)
  {
    v218 = v4;
    v63 = v62;
    v64 = v61;
    v65 = v57;
    v66 = v60;
    v67 = v59;
    v68 = v5;
    v69 = v53;
    v70 = v58;
    v71 = v54;
    v72 = v55;

    v73 = v72;
    v54 = v71;
    v58 = v70;
    v53 = v69;
    v5 = v68;
    v59 = v67;
    v60 = v66;
    v57 = v65;
    v61 = v64;
    v62 = v63;
    v4 = v218;
    if (!v73)
      goto LABEL_43;
  }
  else if (!v55)
  {
LABEL_43:
    if (v54)
      goto LABEL_44;
LABEL_48:
    if (!v53)
      goto LABEL_50;
    goto LABEL_49;
  }

  if (!v54)
    goto LABEL_48;
LABEL_44:

  if (v53)
  {
LABEL_49:

  }
LABEL_50:
  if (v232)
  {

  }
  if (v230)
  {

  }
  if (HIDWORD(v228))
  {

  }
  if ((_DWORD)v228)
  {

  }
  if (HIDWORD(v227[0]))
  {

  }
  if (LODWORD(v227[1]))
  {

  }
  if (LODWORD(v227[0]))
  {

  }
  if ((_DWORD)v226)
  {

  }
  if ((_DWORD)v225)
  {

  }
  if ((_DWORD)v224)
  {

  }
  if (HIDWORD(v224))
  {

  }
  if (HIDWORD(v225))
  {

  }
  if (HIDWORD(v226))
  {

  }
  if ((_DWORD)v223)
  {

  }
  if (*(_DWORD *)v222)
  {

  }
  if (LODWORD(v221[0]))
  {

  }
  if (HIDWORD(v221[0]))
  {

  }
  if (LODWORD(v221[1]))
  {

  }
  if (HIDWORD(v221[1]))
  {

  }
  if (LODWORD(v221[2]))
  {

  }
  if (HIDWORD(v221[2]))
  {

  }
  if (*(_DWORD *)&v222[4])
  {

  }
  if (*(_DWORD *)&v222[8])
  {

  }
  if (HIDWORD(v223))
  {

  }
  if (HIDWORD(v227[1]))
  {

  }
  if (LODWORD(v227[2]))
  {

  }
  if (HIDWORD(v227[2]))
  {

  }
  if (v229)
  {

  }
  if (v231)
  {

  }
  if (*(_DWORD *)v233)
  {

  }
  if (*(_DWORD *)&v233[4])
  {

    if (!v62)
      goto LABEL_112;
  }
  else if (!v62)
  {
LABEL_112:
    if (v61)
      goto LABEL_113;
    goto LABEL_119;
  }

  if (v61)
  {
LABEL_113:

    if (!v60)
      goto LABEL_114;
    goto LABEL_120;
  }
LABEL_119:
  if (!v60)
  {
LABEL_114:
    if (v59)
      goto LABEL_115;
    goto LABEL_121;
  }
LABEL_120:

  if (v59)
  {
LABEL_115:

    if (!v58)
      goto LABEL_123;
    goto LABEL_122;
  }
LABEL_121:
  if (v58)
  {
LABEL_122:

  }
LABEL_123:
  if (*(_DWORD *)&v233[8])
  {

  }
  if (*(_DWORD *)&v233[12])
  {

  }
  if (*(_DWORD *)&v233[16])
  {

  }
  if (*(_DWORD *)&v233[20])
  {

  }
  if (*(_DWORD *)&v233[24])
  {

  }
  if (v235 == v234)
  {

  }
LABEL_136:

  return v57;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
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
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;

  v5 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[SUCorePolicy softwareUpdateAssetType](self, "softwareUpdateAssetType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy documentationAssetType](self, "documentationAssetType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SUCorePolicy specifiedUsedPolicies](self, "specifiedUsedPolicies");
  -[SUCorePolicy policyExtensions](self, "policyExtensions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v5, "initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:", v6, v7, v8, v9);

  objc_msgSend(v10, "softwareUpdateScanPolicy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "specifiedFields");

  objc_msgSend(v10, "documentationScanPolicy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "specifiedFields");

  objc_msgSend(v10, "documentationDownloadPolicy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "specifiedFields");

  objc_msgSend(v10, "loadBrainPolicy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "specifiedFields");

  objc_msgSend(v10, "downloadPreflightPolicy");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "specifiedFields");

  objc_msgSend(v10, "softwareUpdateDownloadPolicy");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "specifiedFields");

  objc_msgSend(v10, "setRestrictToFull:", -[SUCorePolicy restrictToFull](self, "restrictToFull"));
  objc_msgSend(v10, "setAllowSameVersion:", -[SUCorePolicy allowSameVersion](self, "allowSameVersion"));
  objc_msgSend(v10, "setBackground:", -[SUCorePolicy background](self, "background"));
  objc_msgSend(v10, "setAllowsCellular:", -[SUCorePolicy allowsCellular](self, "allowsCellular"));
  objc_msgSend(v10, "softwareUpdateScanPolicy");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setSpecifiedFields:", v12);

  objc_msgSend(v10, "documentationScanPolicy");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setSpecifiedFields:", v14);

  objc_msgSend(v10, "documentationDownloadPolicy");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setSpecifiedFields:", v16);

  objc_msgSend(v10, "loadBrainPolicy");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setSpecifiedFields:", v18);

  objc_msgSend(v10, "downloadPreflightPolicy");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setSpecifiedFields:", v20);

  objc_msgSend(v10, "softwareUpdateDownloadPolicy");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setSpecifiedFields:", v22);

  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v29, "copyWithZone:", a3);
  objc_msgSend(v10, "setSoftwareUpdateScanPolicy:", v30);

  -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "copyWithZone:", a3);
  objc_msgSend(v10, "setDocumentationScanPolicy:", v32);

  -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "copyWithZone:", a3);
  objc_msgSend(v10, "setDocumentationDownloadPolicy:", v34);

  -[SUCorePolicy loadBrainPolicy](self, "loadBrainPolicy");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v35, "copyWithZone:", a3);
  objc_msgSend(v10, "setLoadBrainPolicy:", v36);

  -[SUCorePolicy downloadPreflightPolicy](self, "downloadPreflightPolicy");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v37, "copyWithZone:", a3);
  objc_msgSend(v10, "setDownloadPreflightPolicy:", v38);

  -[SUCorePolicy wakeupPreflightPolicy](self, "wakeupPreflightPolicy");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v39, "copyWithZone:", a3);
  objc_msgSend(v10, "setWakeupPreflightPolicy:", v40);

  -[SUCorePolicy prerequisiteCheckPreflightPolicy](self, "prerequisiteCheckPreflightPolicy");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (void *)objc_msgSend(v41, "copyWithZone:", a3);
  objc_msgSend(v10, "setPrerequisiteCheckPreflightPolicy:", v42);

  -[SUCorePolicy personalizePreflightPolicy](self, "personalizePreflightPolicy");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v43, "copyWithZone:", a3);
  objc_msgSend(v10, "setPersonalizePreflightPolicy:", v44);

  -[SUCorePolicy fdrRecoveryPreflightPolicy](self, "fdrRecoveryPreflightPolicy");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v45, "copyWithZone:", a3);
  objc_msgSend(v10, "setFdrRecoveryPreflightPolicy:", v46);

  -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v47, "copyWithZone:", a3);
  objc_msgSend(v10, "setSoftwareUpdateDownloadPolicy:", v48);

  -[SUCorePolicy preparePolicy](self, "preparePolicy");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)objc_msgSend(v49, "copyWithZone:", a3);
  objc_msgSend(v10, "setPreparePolicy:", v50);

  -[SUCorePolicy suspendPolicy](self, "suspendPolicy");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend(v51, "copyWithZone:", a3);
  objc_msgSend(v10, "setSuspendPolicy:", v52);

  -[SUCorePolicy resumePolicy](self, "resumePolicy");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend(v53, "copyWithZone:", a3);
  objc_msgSend(v10, "setResumePolicy:", v54);

  -[SUCorePolicy applyPolicy](self, "applyPolicy");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)objc_msgSend(v55, "copyWithZone:", a3);
  objc_msgSend(v10, "setApplyPolicy:", v56);

  -[SUCorePolicy rollbackPolicy](self, "rollbackPolicy");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)objc_msgSend(v57, "copyWithZone:", a3);
  objc_msgSend(v10, "setRollbackPolicy:", v58);

  -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_msgSend(v59, "copyWithZone:", a3);
  objc_msgSend(v10, "setPrerequisiteBuildVersion:", v60);

  -[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)objc_msgSend(v61, "copyWithZone:", a3);
  objc_msgSend(v10, "setPrerequisiteProductVersion:", v62);

  -[SUCorePolicy prerequisiteRestoreVersion](self, "prerequisiteRestoreVersion");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)objc_msgSend(v63, "copyWithZone:", a3);
  objc_msgSend(v10, "setPrerequisiteRestoreVersion:", v64);

  -[SUCorePolicy targetRestoreVersion](self, "targetRestoreVersion");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = (void *)objc_msgSend(v65, "copyWithZone:", a3);
  objc_msgSend(v10, "setTargetRestoreVersion:", v66);

  -[SUCorePolicy installedSFRVersion](self, "installedSFRVersion");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (void *)objc_msgSend(v67, "copyWithZone:", a3);
  objc_msgSend(v10, "setInstalledSFRVersion:", v68);

  -[SUCorePolicy targetVolumeUUID](self, "targetVolumeUUID");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (void *)objc_msgSend(v69, "copyWithZone:", a3);
  objc_msgSend(v10, "setTargetVolumeUUID:", v70);

  -[SUCorePolicy deviceClass](self, "deviceClass");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = (void *)objc_msgSend(v71, "copyWithZone:", a3);
  objc_msgSend(v10, "setDeviceClass:", v72);

  -[SUCorePolicy hwModelStr](self, "hwModelStr");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = (void *)objc_msgSend(v73, "copyWithZone:", a3);
  objc_msgSend(v10, "setHwModelStr:", v74);

  -[SUCorePolicy productType](self, "productType");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = (void *)objc_msgSend(v75, "copyWithZone:", a3);
  objc_msgSend(v10, "setProductType:", v76);

  -[SUCorePolicy releaseType](self, "releaseType");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = (void *)objc_msgSend(v77, "copyWithZone:", a3);
  objc_msgSend(v10, "setReleaseType:", v78);

  objc_msgSend(v10, "setIsInternal:", -[SUCorePolicy isInternal](self, "isInternal"));
  objc_msgSend(v10, "setCheckAvailableSpace:", -[SUCorePolicy checkAvailableSpace](self, "checkAvailableSpace"));
  objc_msgSend(v10, "setCacheDeleteUrgency:", -[SUCorePolicy cacheDeleteUrgency](self, "cacheDeleteUrgency"));
  -[SUCorePolicy userAgentString](self, "userAgentString");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = (void *)objc_msgSend(v79, "copyWithZone:", a3);
  objc_msgSend(v10, "setUserAgentString:", v80);

  objc_msgSend(v10, "setPerformPreflightEncryptedCheck:", -[SUCorePolicy performPreflightEncryptedCheck](self, "performPreflightEncryptedCheck"));
  objc_msgSend(v10, "setPerformPreflightSnapshotCheck:", -[SUCorePolicy performPreflightSnapshotCheck](self, "performPreflightSnapshotCheck"));
  -[SUCorePolicy updateVolumePath](self, "updateVolumePath");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = (void *)objc_msgSend(v81, "copyWithZone:", a3);
  objc_msgSend(v10, "setUpdateVolumePath:", v82);

  -[SUCorePolicy ssoToken](self, "ssoToken");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = (void *)objc_msgSend(v83, "copyWithZone:", a3);
  objc_msgSend(v10, "setSsoToken:", v84);

  -[SUCorePolicy personalizedManifestRootsPath](self, "personalizedManifestRootsPath");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = (void *)objc_msgSend(v85, "copyWithZone:", a3);
  objc_msgSend(v10, "setPersonalizedManifestRootsPath:", v86);

  -[SUCorePolicy localAuthenticationContext](self, "localAuthenticationContext");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = (void *)objc_msgSend(v87, "copyWithZone:", a3);
  objc_msgSend(v10, "setLocalAuthenticationContext:", v88);

  -[SUCorePolicy localAuthenticationUserID](self, "localAuthenticationUserID");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = (void *)objc_msgSend(v89, "copyWithZone:", a3);
  objc_msgSend(v10, "setLocalAuthenticationUserID:", v90);

  -[SUCorePolicy mdmBootstrapToken](self, "mdmBootstrapToken");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = (void *)objc_msgSend(v91, "copyWithZone:", a3);
  objc_msgSend(v10, "setMdmBootstrapToken:", v92);

  -[SUCorePolicy downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = (void *)objc_msgSend(v93, "copyWithZone:", a3);
  objc_msgSend(v10, "setDownloadAuthorizationHeader:", v94);

  -[SUCorePolicy updateBrainLocationOverride](self, "updateBrainLocationOverride");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = (void *)objc_msgSend(v95, "copyWithZone:", a3);
  objc_msgSend(v10, "setUpdateBrainLocationOverride:", v96);

  -[SUCorePolicy assetAudienceUUID](self, "assetAudienceUUID");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = (void *)objc_msgSend(v97, "copyWithZone:", a3);
  objc_msgSend(v10, "setAssetAudienceUUID:", v98);

  -[SUCorePolicy alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = (void *)objc_msgSend(v99, "copyWithZone:", a3);
  objc_msgSend(v10, "setAlternateAssetAudienceUUID:", v100);

  objc_msgSend(v10, "setDisableAlternateUpdate:", -[SUCorePolicy disableAlternateUpdate](self, "disableAlternateUpdate"));
  objc_msgSend(v10, "setDisableSplatCombo:", -[SUCorePolicy disableSplatCombo](self, "disableSplatCombo"));
  -[SUCorePolicy personalizationServerURL](self, "personalizationServerURL");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = (void *)objc_msgSend(v101, "copyWithZone:", a3);
  objc_msgSend(v10, "setPersonalizationServerURL:", v102);

  -[SUCorePolicy proxyHostName](self, "proxyHostName");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = (void *)objc_msgSend(v103, "copyWithZone:", a3);
  objc_msgSend(v10, "setProxyHostName:", v104);

  -[SUCorePolicy proxyPortNumber](self, "proxyPortNumber");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = (void *)objc_msgSend(v105, "copyWithZone:", a3);
  objc_msgSend(v10, "setProxyPortNumber:", v106);

  objc_msgSend(v10, "setBridgeOSIgnoreMinimumVersionCheck:", -[SUCorePolicy bridgeOSIgnoreMinimumVersionCheck](self, "bridgeOSIgnoreMinimumVersionCheck"));
  -[SUCorePolicy bridgeOSDownloadDirectory](self, "bridgeOSDownloadDirectory");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = (void *)objc_msgSend(v107, "copyWithZone:", a3);
  objc_msgSend(v10, "setBridgeOSDownloadDirectory:", v108);

  objc_msgSend(v10, "setEnableEmbeddedOSInstall:", -[SUCorePolicy enableEmbeddedOSInstall](self, "enableEmbeddedOSInstall"));
  objc_msgSend(v10, "setEnableBridgeOSInstall:", -[SUCorePolicy enableBridgeOSInstall](self, "enableBridgeOSInstall"));
  objc_msgSend(v10, "setEnableOSPersonalization:", -[SUCorePolicy enableOSPersonalization](self, "enableOSPersonalization"));
  objc_msgSend(v10, "setUserInitiated:", -[SUCorePolicy userInitiated](self, "userInitiated"));
  objc_msgSend(v10, "setSkipVolumeSealing:", -[SUCorePolicy skipVolumeSealing](self, "skipVolumeSealing"));
  objc_msgSend(v10, "setQualityOfService:", -[SUCorePolicy qualityOfService](self, "qualityOfService"));
  -[SUCorePolicy updateMetricEventFields](self, "updateMetricEventFields");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = (void *)objc_msgSend(v109, "copyWithZone:", a3);
  objc_msgSend(v10, "setUpdateMetricEventFields:", v110);

  -[SUCorePolicy updateMetricContext](self, "updateMetricContext");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = (void *)objc_msgSend(v111, "copyWithZone:", a3);
  objc_msgSend(v10, "setUpdateMetricContext:", v112);

  -[SUCorePolicy defaultDescriptorValues](self, "defaultDescriptorValues");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = (void *)objc_msgSend(v113, "copyWithZone:", a3);
  objc_msgSend(v10, "setDefaultDescriptorValues:", v114);

  objc_msgSend(v10, "setEnablePreSUStaging:", -[SUCorePolicy enablePreSUStaging](self, "enablePreSUStaging"));
  objc_msgSend(v10, "setEnablePreSUStagingForOptionalAssets:", -[SUCorePolicy enablePreSUStagingForOptionalAssets](self, "enablePreSUStagingForOptionalAssets"));
  return v10;
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
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
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  const __CFString *v52;
  const __CFString *v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  void *v57;
  const __CFString *v58;
  const __CFString *v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  void *v70;
  const __CFString *v71;
  const __CFString *v72;
  const __CFString *v73;
  void *v74;
  const __CFString *v75;
  const __CFString *v76;
  const __CFString *v77;
  const __CFString *v78;
  const __CFString *v79;
  int64_t v80;
  id v81;
  id v82;
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
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  -[SUCorePolicy policyExtensions](self, "policyExtensions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v103, v107, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v104;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v104 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * i);
        objc_msgSend(v9, "extensionName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("\n\t%@:%@"), v10, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v103, v107, 16);
    }
    while (v6);
  }

  v11 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendFormat:", CFSTR("    %@\n"), v12);

  -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendFormat:", CFSTR("    %@\n"), v13);

  -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendFormat:", CFSTR("    %@\n"), v14);

  -[SUCorePolicy loadBrainPolicy](self, "loadBrainPolicy");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendFormat:", CFSTR("    %@\n"), v15);

  -[SUCorePolicy downloadPreflightPolicy](self, "downloadPreflightPolicy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendFormat:", CFSTR("    %@\n"), v16);

  -[SUCorePolicy wakeupPreflightPolicy](self, "wakeupPreflightPolicy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendFormat:", CFSTR("    %@\n"), v17);

  -[SUCorePolicy prerequisiteCheckPreflightPolicy](self, "prerequisiteCheckPreflightPolicy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendFormat:", CFSTR("    %@\n"), v18);

  -[SUCorePolicy personalizePreflightPolicy](self, "personalizePreflightPolicy");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendFormat:", CFSTR("    %@\n"), v19);

  -[SUCorePolicy fdrRecoveryPreflightPolicy](self, "fdrRecoveryPreflightPolicy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendFormat:", CFSTR("    %@\n"), v20);

  -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendFormat:", CFSTR("    %@\n"), v21);

  -[SUCorePolicy preparePolicy](self, "preparePolicy");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendFormat:", CFSTR("    %@\n"), v22);

  -[SUCorePolicy suspendPolicy](self, "suspendPolicy");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendFormat:", CFSTR("    %@\n"), v23);

  -[SUCorePolicy resumePolicy](self, "resumePolicy");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendFormat:", CFSTR("    %@\n"), v24);

  -[SUCorePolicy applyPolicy](self, "applyPolicy");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = v11;
  objc_msgSend(v11, "appendFormat:", CFSTR("    %@\n"), v25);

  -[SUCorePolicy rollbackPolicy](self, "rollbackPolicy");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendFormat:", CFSTR("    %@\n"), v26);

  v81 = objc_alloc(MEMORY[0x1E0CB3940]);
  v80 = -[SUCorePolicy specifiedUsedPolicies](self, "specifiedUsedPolicies");
  -[SUCorePolicy softwareUpdateAssetType](self, "softwareUpdateAssetType");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy documentationAssetType](self, "documentationAssetType");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy prerequisiteBuildVersion](self, "prerequisiteBuildVersion");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy prerequisiteProductVersion](self, "prerequisiteProductVersion");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy prerequisiteRestoreVersion](self, "prerequisiteRestoreVersion");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy targetRestoreVersion](self, "targetRestoreVersion");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy installedSFRVersion](self, "installedSFRVersion");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy deviceClass](self, "deviceClass");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy hwModelStr](self, "hwModelStr");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy productType](self, "productType");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy releaseType](self, "releaseType");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCorePolicy isInternal](self, "isInternal"))
    v27 = CFSTR("YES");
  else
    v27 = CFSTR("NO");
  v79 = v27;
  if (-[SUCorePolicy restrictToFull](self, "restrictToFull"))
    v28 = CFSTR("YES");
  else
    v28 = CFSTR("NO");
  v78 = v28;
  if (-[SUCorePolicy allowSameVersion](self, "allowSameVersion"))
    v29 = CFSTR("YES");
  else
    v29 = CFSTR("NO");
  v77 = v29;
  if (-[SUCorePolicy background](self, "background"))
    v30 = CFSTR("YES");
  else
    v30 = CFSTR("NO");
  v76 = v30;
  if (-[SUCorePolicy allowsCellular](self, "allowsCellular"))
    v31 = CFSTR("YES");
  else
    v31 = CFSTR("NO");
  v75 = v31;
  if (-[SUCorePolicy checkAvailableSpace](self, "checkAvailableSpace"))
    v32 = CFSTR("YES");
  else
    v32 = CFSTR("NO");
  v73 = v32;
  +[SUCoreSpace cacheDeleteUrgencyName:](SUCoreSpace, "cacheDeleteUrgencyName:", -[SUCorePolicy cacheDeleteUrgency](self, "cacheDeleteUrgency"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy userAgentString](self, "userAgentString");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCorePolicy userInitiated](self, "userInitiated"))
    v33 = CFSTR("YES");
  else
    v33 = CFSTR("NO");
  v72 = v33;
  if (-[SUCorePolicy skipVolumeSealing](self, "skipVolumeSealing"))
    v34 = CFSTR("YES");
  else
    v34 = CFSTR("NO");
  v71 = v34;
  -[SUCorePolicy stringForQoS:](self, "stringForQoS:", -[SUCorePolicy qualityOfService](self, "qualityOfService"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy targetVolumeUUID](self, "targetVolumeUUID");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy updateVolumePath](self, "updateVolumePath");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCorePolicy performPreflightEncryptedCheck](self, "performPreflightEncryptedCheck"))
    v35 = CFSTR("YES");
  else
    v35 = CFSTR("NO");
  v68 = v35;
  if (-[SUCorePolicy performPreflightSnapshotCheck](self, "performPreflightSnapshotCheck"))
    v36 = CFSTR("YES");
  else
    v36 = CFSTR("NO");
  v66 = v36;
  -[SUCorePolicy updateBrainLocationOverride](self, "updateBrainLocationOverride");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy ssoToken](self, "ssoToken");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if (v74)
    v37 = CFSTR("present");
  else
    v37 = CFSTR("none");
  v63 = v37;
  -[SUCorePolicy personalizedManifestRootsPath](self, "personalizedManifestRootsPath");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy personalizationServerURL](self, "personalizationServerURL");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy proxyHostName](self, "proxyHostName");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy proxyPortNumber](self, "proxyPortNumber");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy localAuthenticationContext](self, "localAuthenticationContext");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  if (v70)
    v38 = CFSTR("present");
  else
    v38 = CFSTR("none");
  -[SUCorePolicy downloadAuthorizationHeader](self, "downloadAuthorizationHeader");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (v69)
    v39 = CFSTR("present");
  else
    v39 = CFSTR("none");
  v61 = v39;
  -[SUCorePolicy localAuthenticationUserID](self, "localAuthenticationUserID");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy mdmBootstrapToken](self, "mdmBootstrapToken");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (v67)
    v40 = CFSTR("present");
  else
    v40 = CFSTR("none");
  v59 = v40;
  if (-[SUCorePolicy bridgeOSIgnoreMinimumVersionCheck](self, "bridgeOSIgnoreMinimumVersionCheck"))
    v41 = CFSTR("YES");
  else
    v41 = CFSTR("NO");
  v58 = v41;
  -[SUCorePolicy bridgeOSDownloadDirectory](self, "bridgeOSDownloadDirectory");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCorePolicy enableEmbeddedOSInstall](self, "enableEmbeddedOSInstall"))
    v42 = CFSTR("YES");
  else
    v42 = CFSTR("NO");
  v55 = v42;
  if (-[SUCorePolicy enableBridgeOSInstall](self, "enableBridgeOSInstall"))
    v43 = CFSTR("YES");
  else
    v43 = CFSTR("NO");
  v53 = v43;
  if (-[SUCorePolicy enableOSPersonalization](self, "enableOSPersonalization"))
    v44 = CFSTR("YES");
  else
    v44 = CFSTR("NO");
  v52 = v44;
  -[SUCorePolicy updateMetricEventFields](self, "updateMetricEventFields");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy updateMetricContext](self, "updateMetricContext");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy defaultDescriptorValues](self, "defaultDescriptorValues");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy assetAudienceUUID](self, "assetAudienceUUID");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCorePolicy disableAlternateUpdate](self, "disableAlternateUpdate"))
    v47 = CFSTR("YES");
  else
    v47 = CFSTR("NO");
  if (-[SUCorePolicy disableSplatCombo](self, "disableSplatCombo"))
    v48 = CFSTR("YES");
  else
    v48 = CFSTR("NO");
  if (-[SUCorePolicy enablePreSUStaging](self, "enablePreSUStaging"))
    v49 = CFSTR("YES");
  else
    v49 = CFSTR("NO");
  if (-[SUCorePolicy enablePreSUStagingForOptionalAssets](self, "enablePreSUStagingForOptionalAssets"))
    v50 = CFSTR("YES");
  else
    v50 = CFSTR("NO");
  v82 = (id)objc_msgSend(v81, "initWithFormat:", CFSTR("\n[>>>\n    SubPolicies(specifiedUsedPolicies:0x%llX)\n%@    AssetTypes(softwareUpdateAssetType:%@|documentationAssetType:%@)\n    Versions(prerequisiteBuildVersion:%@|prerequisiteProductVersion:%@|prerequisiteRestoreVersion:%@|targetRestoreVersion:%@|installedSFRVersion:%@)\n    Device(deviceClass:%@|hwModelStr:%@|productType:%@|releaseType:%@|isInternal:%@)\n    Config(restrictToFull:%@|allowSameVersion:%@|background:%@|allowsCellular:%@|checkAvailableSpace:%@|cacheDeleteUrgency:%@|userAgentString:%@|userInitiated:%@|skipVolumeSealing:%@|qualityOfService:%@)\n    Target(targetVolumeUUID:%@|updateVolumePath:%@)\n    Preflight(performPreflightEncryptedCheck:%@|performPreflightSnapshotCheck:%@|updateBrainLocationOverride:%@)\n    Personalization(SSOToken:%@|personalizedManifestRootsPath:%@|personalizationServerURL:%@|proxyHostName:%@|proxyPortNumber:%@)\n    Authentication(localAuthenticationContext:%@|downloadAuthorizationHeader:%@|localAuthenticationUserID:%@|mdmBootstrapToken:%@)\n    BridgeOS(bridgeOSIgnoreMinimumVersionCheck:%@|bridgeOSDownloadDirectory:%@|enableEmbeddedOSInstall:%@|enableBridgeOSInstall:%@|enableOSPersonalization:%@)\n    Metrics(updateMetricEventFields:%@|updateMetricContext:%@\n    Defaults(defaultDescriptorValues:%@|assetAudienceUUID:%@|alternateAssetAudienceUUID:%@|disableAlternateUpdate:%@|disableSplombo:%@)\n    PSUS(enable:%@|enableForOptionalAssets:%@)\n    Extensions(%@)\n<<<]"), v80, v91, v102, v101, v100, v99, v98, v97, v96, v95, v94, v93, v92, v79, v78, v77,
              v76,
              v75,
              v73,
              v89,
              v90,
              v72,
              v71,
              v87,
              v88,
              v84,
              v68,
              v66,
              v86,
              v63,
              v85,
              v83,
              v65,
              v64,
              v38,
              v61,
              v62,
              v59,
              v58,
              v60,
              v55,
              v53,
              v52,
              v45,
              v57,
              v56,
              v54,
              v46,
              v47,
              v48,
              v49,
              v50,
              v3);

  return v82;
}

- (id)summary
{
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  const __CFString *v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  const __CFString *v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  uint64_t v114;
  void *v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  id v123;

  -[SUCorePolicy policyExtensions](self, "policyExtensions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[SUCorePolicy policyExtensions](self, "policyExtensions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&stru_1EA87A8E8, "stringByAppendingFormat:", CFSTR("|extensions(%lu)"), objc_msgSend(v5, "count"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_1EA87A8E8;
  }
  if (-[SUCorePolicy specifiedUsedPolicies](self, "specifiedUsedPolicies") != 127)
  {
    -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", CFSTR("|SubPolCfg=%llX"), -[SUCorePolicy specifiedUsedPolicies](self, "specifiedUsedPolicies"));
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v7;
  }
  -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SUCorePolicy softwareUpdateScanPolicy](self, "softwareUpdateScanPolicy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "summary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", CFSTR("|UpdateScan=%@"), v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v11;
  }
  -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SUCorePolicy documentationScanPolicy](self, "documentationScanPolicy");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "summary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", CFSTR("|DocScan=%@"), v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v15;
  }
  -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[SUCorePolicy documentationDownloadPolicy](self, "documentationDownloadPolicy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "summary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", CFSTR("|DocDownload=%@"), v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v19;
  }
  -[SUCorePolicy loadBrainPolicy](self, "loadBrainPolicy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[SUCorePolicy loadBrainPolicy](self, "loadBrainPolicy");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "summary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", CFSTR("|LoadBrainUpdate=%@"), v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v23;
  }
  -[SUCorePolicy downloadPreflightPolicy](self, "downloadPreflightPolicy");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[SUCorePolicy downloadPreflightPolicy](self, "downloadPreflightPolicy");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "summary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", CFSTR("|PreflightDownload=%@"), v26);
    v27 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v27;
  }
  -[SUCorePolicy wakeupPreflightPolicy](self, "wakeupPreflightPolicy");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[SUCorePolicy wakeupPreflightPolicy](self, "wakeupPreflightPolicy");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "summary");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", CFSTR("|PreflightWakeup=%@"), v30);
    v31 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v31;
  }
  -[SUCorePolicy prerequisiteCheckPreflightPolicy](self, "prerequisiteCheckPreflightPolicy");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[SUCorePolicy prerequisiteCheckPreflightPolicy](self, "prerequisiteCheckPreflightPolicy");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "summary");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", CFSTR("|PreflightPrerequisiteCheck=%@"), v34);
    v35 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v35;
  }
  -[SUCorePolicy personalizePreflightPolicy](self, "personalizePreflightPolicy");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    -[SUCorePolicy personalizePreflightPolicy](self, "personalizePreflightPolicy");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "summary");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", CFSTR("|PreflightPersonalize=%@"), v38);
    v39 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v39;
  }
  -[SUCorePolicy fdrRecoveryPreflightPolicy](self, "fdrRecoveryPreflightPolicy");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    -[SUCorePolicy fdrRecoveryPreflightPolicy](self, "fdrRecoveryPreflightPolicy");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "summary");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", CFSTR("|PreflightFDRRecovery=%@"), v42);
    v43 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v43;
  }
  -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    -[SUCorePolicy softwareUpdateDownloadPolicy](self, "softwareUpdateDownloadPolicy");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "summary");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", CFSTR("|DownloadSU=%@"), v46);
    v47 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v47;
  }
  -[SUCorePolicy preparePolicy](self, "preparePolicy");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
  {
    -[SUCorePolicy preparePolicy](self, "preparePolicy");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "summary");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", CFSTR("|PrepareUpdate=%@"), v50);
    v51 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v51;
  }
  -[SUCorePolicy suspendPolicy](self, "suspendPolicy");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
  {
    -[SUCorePolicy suspendPolicy](self, "suspendPolicy");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "summary");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", CFSTR("|SuspendUpdate=%@"), v54);
    v55 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v55;
  }
  -[SUCorePolicy resumePolicy](self, "resumePolicy");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    -[SUCorePolicy resumePolicy](self, "resumePolicy");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "summary");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", CFSTR("|ResumeUpdate=%@"), v58);
    v59 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v59;
  }
  -[SUCorePolicy applyPolicy](self, "applyPolicy");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  if (v60)
  {
    -[SUCorePolicy applyPolicy](self, "applyPolicy");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "summary");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", CFSTR("|ApplyUpdate=%@"), v62);
    v63 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v63;
  }
  -[SUCorePolicy rollbackPolicy](self, "rollbackPolicy");
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  if (v64)
  {
    -[SUCorePolicy rollbackPolicy](self, "rollbackPolicy");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "summary");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", CFSTR("|rollbackUpdate=%@"), v66);
    v67 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v67;
  }
  -[SUCorePolicy targetVolumeUUID](self, "targetVolumeUUID");
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  if (v68)
  {
    -[SUCorePolicy targetVolumeUUID](self, "targetVolumeUUID");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", CFSTR("|targetVolumeUUID=%@"), v69);
    v70 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v70;
  }
  -[SUCorePolicy deviceClass](self, "deviceClass");
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  if (v71)
  {
    -[SUCorePolicy deviceClass](self, "deviceClass");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", CFSTR("|deviceClass=%@"), v72);
    v73 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v73;
  }
  -[SUCorePolicy hwModelStr](self, "hwModelStr");
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (v74)
  {
    -[SUCorePolicy hwModelStr](self, "hwModelStr");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", CFSTR("|hwModelStr=%@"), v75);
    v76 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v76;
  }
  -[SUCorePolicy productType](self, "productType");
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  if (v77)
  {
    -[SUCorePolicy productType](self, "productType");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", CFSTR("|productType=%@"), v78);
    v79 = objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v79;
  }
  -[SUCorePolicy releaseType](self, "releaseType");
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  if (v80)
  {
    -[SUCorePolicy releaseType](self, "releaseType");
    v81 = objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v6, "stringByAppendingFormat:", CFSTR("|releaseType=%@"), v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (__CFString *)v81;
  }
  else
  {
    -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", CFSTR("|releaseType=customer"));
    v82 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (!-[SUCorePolicy checkAvailableSpace](self, "checkAvailableSpace"))
  {
    objc_msgSend(v82, "stringByAppendingString:", CFSTR("|!checkSpace"));
    v83 = objc_claimAutoreleasedReturnValue();

    v82 = (void *)v83;
  }
  if (-[SUCorePolicy cacheDeleteUrgency](self, "cacheDeleteUrgency") != -1)
  {
    +[SUCoreSpace cacheDeleteUrgencyName:](SUCoreSpace, "cacheDeleteUrgencyName:", -[SUCorePolicy cacheDeleteUrgency](self, "cacheDeleteUrgency"));
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "stringByAppendingFormat:", CFSTR("|deleteUrgency=%@"), v84);
    v85 = objc_claimAutoreleasedReturnValue();

    v82 = (void *)v85;
  }
  -[SUCorePolicy userAgentString](self, "userAgentString");
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  if (v86)
  {
    -[SUCorePolicy userAgentString](self, "userAgentString");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "stringByAppendingFormat:", CFSTR("|userAgentString=%@"), v87);
    v88 = objc_claimAutoreleasedReturnValue();

    v82 = (void *)v88;
  }
  if (-[SUCorePolicy performPreflightEncryptedCheck](self, "performPreflightEncryptedCheck"))
  {
    objc_msgSend(v82, "stringByAppendingString:", CFSTR("|performPreflightEncryptedCheck=YES"));
    v89 = objc_claimAutoreleasedReturnValue();

    v82 = (void *)v89;
  }
  if (-[SUCorePolicy performPreflightSnapshotCheck](self, "performPreflightSnapshotCheck"))
  {
    objc_msgSend(v82, "stringByAppendingString:", CFSTR("|performPreflightSnapshotCheck=YES"));
    v90 = objc_claimAutoreleasedReturnValue();

    v82 = (void *)v90;
  }
  -[SUCorePolicy updateVolumePath](self, "updateVolumePath");
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  if (v91)
  {
    -[SUCorePolicy updateVolumePath](self, "updateVolumePath");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "stringByAppendingFormat:", CFSTR("|updateVolumePath=%@"), v92);
    v93 = objc_claimAutoreleasedReturnValue();

    v82 = (void *)v93;
  }
  -[SUCorePolicy ssoToken](self, "ssoToken");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  if (v94)
    v95 = CFSTR("|withSSO");
  else
    v95 = CFSTR("|noSSO");
  objc_msgSend(v82, "stringByAppendingString:", v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCorePolicy personalizationServerURL](self, "personalizationServerURL");
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  if (v97)
  {
    -[SUCorePolicy personalizationServerURL](self, "personalizationServerURL");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "stringByAppendingFormat:", CFSTR("|personalizationServerURL=%@"), v98);
    v99 = objc_claimAutoreleasedReturnValue();

    v96 = (void *)v99;
  }
  -[SUCorePolicy proxyHostName](self, "proxyHostName");
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  if (v100)
  {
    -[SUCorePolicy proxyHostName](self, "proxyHostName");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "stringByAppendingFormat:", CFSTR("|proxyHostName=%@"), v101);
    v102 = objc_claimAutoreleasedReturnValue();

    v96 = (void *)v102;
  }
  -[SUCorePolicy proxyPortNumber](self, "proxyPortNumber");
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  if (v103)
  {
    -[SUCorePolicy proxyPortNumber](self, "proxyPortNumber");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "stringByAppendingFormat:", CFSTR("|proxyPortNumber=%@"), v104);
    v105 = objc_claimAutoreleasedReturnValue();

    v96 = (void *)v105;
  }
  -[SUCorePolicy updateMetricEventFields](self, "updateMetricEventFields");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  if (v106)
    v107 = CFSTR("|withUpdateMetricEventFields");
  else
    v107 = CFSTR("|noUpdateMetricEventFields");
  objc_msgSend(v96, "stringByAppendingString:", v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCorePolicy updateMetricContext](self, "updateMetricContext");
  v109 = (void *)objc_claimAutoreleasedReturnValue();

  if (v109)
  {
    -[SUCorePolicy updateMetricContext](self, "updateMetricContext");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "stringByAppendingFormat:", CFSTR("|updateMetricContext=%@"), v110);
    v111 = objc_claimAutoreleasedReturnValue();

    v108 = (void *)v111;
  }
  -[SUCorePolicy assetAudienceUUID](self, "assetAudienceUUID");
  v112 = (void *)objc_claimAutoreleasedReturnValue();

  if (v112)
  {
    -[SUCorePolicy assetAudienceUUID](self, "assetAudienceUUID");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "stringByAppendingFormat:", CFSTR("|assetAudienceUUID=%@"), v113);
    v114 = objc_claimAutoreleasedReturnValue();

    v108 = (void *)v114;
  }
  -[SUCorePolicy alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  if (v115)
  {
    -[SUCorePolicy alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "stringByAppendingFormat:", CFSTR("|alternateAssetAudienceUUID=%@"), v116);
    v117 = objc_claimAutoreleasedReturnValue();

    v108 = (void *)v117;
  }
  if (-[SUCorePolicy disableAlternateUpdate](self, "disableAlternateUpdate"))
  {
    objc_msgSend(v108, "stringByAppendingString:", CFSTR("|disableAlternateUpdate=YES"));
    v118 = objc_claimAutoreleasedReturnValue();

    v108 = (void *)v118;
  }
  if (-[SUCorePolicy disableSplatCombo](self, "disableSplatCombo"))
  {
    objc_msgSend(v108, "stringByAppendingString:", CFSTR("|disableSplombo=YES"));
    v119 = objc_claimAutoreleasedReturnValue();

    v108 = (void *)v119;
  }
  if (-[SUCorePolicy enablePreSUStaging](self, "enablePreSUStaging"))
  {
    objc_msgSend(v108, "stringByAppendingString:", CFSTR("|enablePSUS=YES"));
    v120 = objc_claimAutoreleasedReturnValue();

    v108 = (void *)v120;
  }
  if (-[SUCorePolicy enablePreSUStagingForOptionalAssets](self, "enablePreSUStagingForOptionalAssets"))
  {
    objc_msgSend(v108, "stringByAppendingString:", CFSTR("|enablePSUSForOptionalAssets=YES"));
    v121 = objc_claimAutoreleasedReturnValue();

    v108 = (void *)v121;
  }
  if ((objc_msgSend(v108, "isEqualToString:", &stru_1EA87A8E8) & 1) == 0)
  {
    objc_msgSend(v108, "stringByAppendingString:", CFSTR("|"));
    v122 = objc_claimAutoreleasedReturnValue();

    v108 = (void *)v122;
  }
  v123 = v108;

  return v123;
}

- (id)assetTypeSummary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SUCorePolicy softwareUpdateAssetType](self, "softwareUpdateAssetType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCorePolicy documentationAssetType](self, "documentationAssetType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("|su=%@|doc=%@|"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)stringForQoS:(int)a3
{
  if ((a3 - 1) > 4)
    return CFSTR("MSUQualityOfServiceUnspecified");
  else
    return off_1EA879CE0[a3 - 1];
}

- (id)_copyGestaltValueForKey:(__CFString *)a3
{
  return (id)MGCopyAnswer();
}

+ (id)_cleanProductVersion:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") >= 4
    && objc_msgSend(v3, "rangeOfString:options:range:", CFSTR("9.9."), 0, 0, 4) != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v3, "stringByReplacingCharactersInRange:withString:", 0, 4, &stru_1EA87A8E8);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v4;
  }
  return v3;
}

- (BOOL)background
{
  return self->_background;
}

- (BOOL)allowsCellular
{
  return self->_allowsCellular;
}

- (int64_t)specifiedUsedPolicies
{
  return self->_specifiedUsedPolicies;
}

- (void)setSpecifiedUsedPolicies:(int64_t)a3
{
  self->_specifiedUsedPolicies = a3;
}

- (SUCorePolicySoftwareUpdateScan)softwareUpdateScanPolicy
{
  return self->_softwareUpdateScanPolicy;
}

- (void)setSoftwareUpdateScanPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateScanPolicy, a3);
}

- (SUCorePolicyDocumentationScan)documentationScanPolicy
{
  return self->_documentationScanPolicy;
}

- (void)setDocumentationScanPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_documentationScanPolicy, a3);
}

- (SUCorePolicyDocumentationDownload)documentationDownloadPolicy
{
  return self->_documentationDownloadPolicy;
}

- (void)setDocumentationDownloadPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_documentationDownloadPolicy, a3);
}

- (SUCorePolicyLoadBrain)loadBrainPolicy
{
  return self->_loadBrainPolicy;
}

- (void)setLoadBrainPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_loadBrainPolicy, a3);
}

- (SUCorePolicyPreflightDownloadSU)downloadPreflightPolicy
{
  return self->_downloadPreflightPolicy;
}

- (void)setDownloadPreflightPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_downloadPreflightPolicy, a3);
}

- (SUCorePolicySoftwareUpdateDownload)softwareUpdateDownloadPolicy
{
  return self->_softwareUpdateDownloadPolicy;
}

- (void)setSoftwareUpdateDownloadPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateDownloadPolicy, a3);
}

- (SUCorePolicyPrepare)preparePolicy
{
  return self->_preparePolicy;
}

- (void)setPreparePolicy:(id)a3
{
  objc_storeStrong((id *)&self->_preparePolicy, a3);
}

- (SUCorePolicySuspend)suspendPolicy
{
  return self->_suspendPolicy;
}

- (void)setSuspendPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_suspendPolicy, a3);
}

- (SUCorePolicyResume)resumePolicy
{
  return self->_resumePolicy;
}

- (void)setResumePolicy:(id)a3
{
  objc_storeStrong((id *)&self->_resumePolicy, a3);
}

- (SUCorePolicyApply)applyPolicy
{
  return self->_applyPolicy;
}

- (void)setApplyPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_applyPolicy, a3);
}

- (SUCorePolicyRollback)rollbackPolicy
{
  return self->_rollbackPolicy;
}

- (void)setRollbackPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_rollbackPolicy, a3);
}

- (SUCorePolicyPreflightWakeup)wakeupPreflightPolicy
{
  return self->_wakeupPreflightPolicy;
}

- (void)setWakeupPreflightPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_wakeupPreflightPolicy, a3);
}

- (SUCorePolicyPreflightPrerequisiteCheck)prerequisiteCheckPreflightPolicy
{
  return self->_prerequisiteCheckPreflightPolicy;
}

- (void)setPrerequisiteCheckPreflightPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_prerequisiteCheckPreflightPolicy, a3);
}

- (SUCorePolicyPreflightPersonalize)personalizePreflightPolicy
{
  return self->_personalizePreflightPolicy;
}

- (void)setPersonalizePreflightPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_personalizePreflightPolicy, a3);
}

- (SUCorePolicyPreflightFDRRecovery)fdrRecoveryPreflightPolicy
{
  return self->_fdrRecoveryPreflightPolicy;
}

- (void)setFdrRecoveryPreflightPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_fdrRecoveryPreflightPolicy, a3);
}

- (NSString)softwareUpdateAssetType
{
  return self->_softwareUpdateAssetType;
}

- (void)setSoftwareUpdateAssetType:(id)a3
{
  objc_storeStrong((id *)&self->_softwareUpdateAssetType, a3);
}

- (NSString)documentationAssetType
{
  return self->_documentationAssetType;
}

- (void)setDocumentationAssetType:(id)a3
{
  objc_storeStrong((id *)&self->_documentationAssetType, a3);
}

- (NSString)targetVolumeUUID
{
  return self->_targetVolumeUUID;
}

- (void)setTargetVolumeUUID:(id)a3
{
  objc_storeStrong((id *)&self->_targetVolumeUUID, a3);
}

- (NSString)prerequisiteBuildVersion
{
  return self->_prerequisiteBuildVersion;
}

- (void)setPrerequisiteBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_prerequisiteBuildVersion, a3);
}

- (NSString)prerequisiteProductVersion
{
  return self->_prerequisiteProductVersion;
}

- (void)setPrerequisiteProductVersion:(id)a3
{
  objc_storeStrong((id *)&self->_prerequisiteProductVersion, a3);
}

- (NSString)prerequisiteRestoreVersion
{
  return self->_prerequisiteRestoreVersion;
}

- (void)setPrerequisiteRestoreVersion:(id)a3
{
  objc_storeStrong((id *)&self->_prerequisiteRestoreVersion, a3);
}

- (NSString)targetRestoreVersion
{
  return self->_targetRestoreVersion;
}

- (void)setTargetRestoreVersion:(id)a3
{
  objc_storeStrong((id *)&self->_targetRestoreVersion, a3);
}

- (NSString)installedSFRVersion
{
  return self->_installedSFRVersion;
}

- (void)setInstalledSFRVersion:(id)a3
{
  objc_storeStrong((id *)&self->_installedSFRVersion, a3);
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
  objc_storeStrong((id *)&self->_deviceClass, a3);
}

- (NSString)hwModelStr
{
  return self->_hwModelStr;
}

- (void)setHwModelStr:(id)a3
{
  objc_storeStrong((id *)&self->_hwModelStr, a3);
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
  objc_storeStrong((id *)&self->_productType, a3);
}

- (NSString)releaseType
{
  return self->_releaseType;
}

- (void)setReleaseType:(id)a3
{
  objc_storeStrong((id *)&self->_releaseType, a3);
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (void)setIsInternal:(BOOL)a3
{
  self->_isInternal = a3;
}

- (BOOL)checkAvailableSpace
{
  return self->_checkAvailableSpace;
}

- (void)setCheckAvailableSpace:(BOOL)a3
{
  self->_checkAvailableSpace = a3;
}

- (NSString)userAgentString
{
  return self->_userAgentString;
}

- (void)setUserAgentString:(id)a3
{
  objc_storeStrong((id *)&self->_userAgentString, a3);
}

- (BOOL)performPreflightEncryptedCheck
{
  return self->_performPreflightEncryptedCheck;
}

- (void)setPerformPreflightEncryptedCheck:(BOOL)a3
{
  self->_performPreflightEncryptedCheck = a3;
}

- (BOOL)performPreflightSnapshotCheck
{
  return self->_performPreflightSnapshotCheck;
}

- (void)setPerformPreflightSnapshotCheck:(BOOL)a3
{
  self->_performPreflightSnapshotCheck = a3;
}

- (NSString)updateVolumePath
{
  return self->_updateVolumePath;
}

- (void)setUpdateVolumePath:(id)a3
{
  objc_storeStrong((id *)&self->_updateVolumePath, a3);
}

- (NSData)ssoToken
{
  return self->_ssoToken;
}

- (void)setSsoToken:(id)a3
{
  objc_storeStrong((id *)&self->_ssoToken, a3);
}

- (int)cacheDeleteUrgency
{
  return self->_cacheDeleteUrgency;
}

- (void)setCacheDeleteUrgency:(int)a3
{
  self->_cacheDeleteUrgency = a3;
}

- (NSString)personalizedManifestRootsPath
{
  return self->_personalizedManifestRootsPath;
}

- (void)setPersonalizedManifestRootsPath:(id)a3
{
  objc_storeStrong((id *)&self->_personalizedManifestRootsPath, a3);
}

- (NSData)localAuthenticationContext
{
  return self->_localAuthenticationContext;
}

- (void)setLocalAuthenticationContext:(id)a3
{
  objc_storeStrong((id *)&self->_localAuthenticationContext, a3);
}

- (NSNumber)localAuthenticationUserID
{
  return self->_localAuthenticationUserID;
}

- (void)setLocalAuthenticationUserID:(id)a3
{
  objc_storeStrong((id *)&self->_localAuthenticationUserID, a3);
}

- (NSString)mdmBootstrapToken
{
  return self->_mdmBootstrapToken;
}

- (void)setMdmBootstrapToken:(id)a3
{
  objc_storeStrong((id *)&self->_mdmBootstrapToken, a3);
}

- (NSString)downloadAuthorizationHeader
{
  return self->_downloadAuthorizationHeader;
}

- (void)setDownloadAuthorizationHeader:(id)a3
{
  objc_storeStrong((id *)&self->_downloadAuthorizationHeader, a3);
}

- (NSString)updateBrainLocationOverride
{
  return self->_updateBrainLocationOverride;
}

- (void)setUpdateBrainLocationOverride:(id)a3
{
  objc_storeStrong((id *)&self->_updateBrainLocationOverride, a3);
}

- (NSString)assetAudienceUUID
{
  return self->_assetAudienceUUID;
}

- (void)setAssetAudienceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_assetAudienceUUID, a3);
}

- (NSString)alternateAssetAudienceUUID
{
  return self->_alternateAssetAudienceUUID;
}

- (void)setAlternateAssetAudienceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_alternateAssetAudienceUUID, a3);
}

- (BOOL)disableAlternateUpdate
{
  return self->_disableAlternateUpdate;
}

- (void)setDisableAlternateUpdate:(BOOL)a3
{
  self->_disableAlternateUpdate = a3;
}

- (BOOL)disableSplatCombo
{
  return self->_disableSplatCombo;
}

- (void)setDisableSplatCombo:(BOOL)a3
{
  self->_disableSplatCombo = a3;
}

- (BOOL)enablePreSUStaging
{
  return self->_enablePreSUStaging;
}

- (void)setEnablePreSUStaging:(BOOL)a3
{
  self->_enablePreSUStaging = a3;
}

- (BOOL)enablePreSUStagingForOptionalAssets
{
  return self->_enablePreSUStagingForOptionalAssets;
}

- (void)setEnablePreSUStagingForOptionalAssets:(BOOL)a3
{
  self->_enablePreSUStagingForOptionalAssets = a3;
}

- (NSString)personalizationServerURL
{
  return self->_personalizationServerURL;
}

- (void)setPersonalizationServerURL:(id)a3
{
  objc_storeStrong((id *)&self->_personalizationServerURL, a3);
}

- (NSString)proxyHostName
{
  return self->_proxyHostName;
}

- (void)setProxyHostName:(id)a3
{
  objc_storeStrong((id *)&self->_proxyHostName, a3);
}

- (NSNumber)proxyPortNumber
{
  return self->_proxyPortNumber;
}

- (void)setProxyPortNumber:(id)a3
{
  objc_storeStrong((id *)&self->_proxyPortNumber, a3);
}

- (BOOL)bridgeOSIgnoreMinimumVersionCheck
{
  return self->_bridgeOSIgnoreMinimumVersionCheck;
}

- (void)setBridgeOSIgnoreMinimumVersionCheck:(BOOL)a3
{
  self->_bridgeOSIgnoreMinimumVersionCheck = a3;
}

- (NSString)bridgeOSDownloadDirectory
{
  return self->_bridgeOSDownloadDirectory;
}

- (void)setBridgeOSDownloadDirectory:(id)a3
{
  objc_storeStrong((id *)&self->_bridgeOSDownloadDirectory, a3);
}

- (BOOL)enableEmbeddedOSInstall
{
  return self->_enableEmbeddedOSInstall;
}

- (void)setEnableEmbeddedOSInstall:(BOOL)a3
{
  self->_enableEmbeddedOSInstall = a3;
}

- (BOOL)enableBridgeOSInstall
{
  return self->_enableBridgeOSInstall;
}

- (void)setEnableBridgeOSInstall:(BOOL)a3
{
  self->_enableBridgeOSInstall = a3;
}

- (BOOL)enableOSPersonalization
{
  return self->_enableOSPersonalization;
}

- (void)setEnableOSPersonalization:(BOOL)a3
{
  self->_enableOSPersonalization = a3;
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (BOOL)skipVolumeSealing
{
  return self->_skipVolumeSealing;
}

- (void)setSkipVolumeSealing:(BOOL)a3
{
  self->_skipVolumeSealing = a3;
}

- (int)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int)a3
{
  self->_qualityOfService = a3;
}

- (NSDictionary)updateMetricEventFields
{
  return self->_updateMetricEventFields;
}

- (void)setUpdateMetricEventFields:(id)a3
{
  objc_storeStrong((id *)&self->_updateMetricEventFields, a3);
}

- (NSString)updateMetricContext
{
  return self->_updateMetricContext;
}

- (void)setUpdateMetricContext:(id)a3
{
  objc_storeStrong((id *)&self->_updateMetricContext, a3);
}

- (NSDictionary)defaultDescriptorValues
{
  return self->_defaultDescriptorValues;
}

- (void)setDefaultDescriptorValues:(id)a3
{
  objc_storeStrong((id *)&self->_defaultDescriptorValues, a3);
}

- (NSArray)policyExtensions
{
  return self->_policyExtensions;
}

- (void)setPolicyExtensions:(id)a3
{
  objc_storeStrong((id *)&self->_policyExtensions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyExtensions, 0);
  objc_storeStrong((id *)&self->_defaultDescriptorValues, 0);
  objc_storeStrong((id *)&self->_updateMetricContext, 0);
  objc_storeStrong((id *)&self->_updateMetricEventFields, 0);
  objc_storeStrong((id *)&self->_bridgeOSDownloadDirectory, 0);
  objc_storeStrong((id *)&self->_proxyPortNumber, 0);
  objc_storeStrong((id *)&self->_proxyHostName, 0);
  objc_storeStrong((id *)&self->_personalizationServerURL, 0);
  objc_storeStrong((id *)&self->_alternateAssetAudienceUUID, 0);
  objc_storeStrong((id *)&self->_assetAudienceUUID, 0);
  objc_storeStrong((id *)&self->_updateBrainLocationOverride, 0);
  objc_storeStrong((id *)&self->_downloadAuthorizationHeader, 0);
  objc_storeStrong((id *)&self->_mdmBootstrapToken, 0);
  objc_storeStrong((id *)&self->_localAuthenticationUserID, 0);
  objc_storeStrong((id *)&self->_localAuthenticationContext, 0);
  objc_storeStrong((id *)&self->_personalizedManifestRootsPath, 0);
  objc_storeStrong((id *)&self->_ssoToken, 0);
  objc_storeStrong((id *)&self->_updateVolumePath, 0);
  objc_storeStrong((id *)&self->_userAgentString, 0);
  objc_storeStrong((id *)&self->_releaseType, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_hwModelStr, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_installedSFRVersion, 0);
  objc_storeStrong((id *)&self->_targetRestoreVersion, 0);
  objc_storeStrong((id *)&self->_prerequisiteRestoreVersion, 0);
  objc_storeStrong((id *)&self->_prerequisiteProductVersion, 0);
  objc_storeStrong((id *)&self->_prerequisiteBuildVersion, 0);
  objc_storeStrong((id *)&self->_targetVolumeUUID, 0);
  objc_storeStrong((id *)&self->_documentationAssetType, 0);
  objc_storeStrong((id *)&self->_softwareUpdateAssetType, 0);
  objc_storeStrong((id *)&self->_fdrRecoveryPreflightPolicy, 0);
  objc_storeStrong((id *)&self->_personalizePreflightPolicy, 0);
  objc_storeStrong((id *)&self->_prerequisiteCheckPreflightPolicy, 0);
  objc_storeStrong((id *)&self->_wakeupPreflightPolicy, 0);
  objc_storeStrong((id *)&self->_rollbackPolicy, 0);
  objc_storeStrong((id *)&self->_applyPolicy, 0);
  objc_storeStrong((id *)&self->_resumePolicy, 0);
  objc_storeStrong((id *)&self->_suspendPolicy, 0);
  objc_storeStrong((id *)&self->_preparePolicy, 0);
  objc_storeStrong((id *)&self->_softwareUpdateDownloadPolicy, 0);
  objc_storeStrong((id *)&self->_downloadPreflightPolicy, 0);
  objc_storeStrong((id *)&self->_loadBrainPolicy, 0);
  objc_storeStrong((id *)&self->_documentationDownloadPolicy, 0);
  objc_storeStrong((id *)&self->_documentationScanPolicy, 0);
  objc_storeStrong((id *)&self->_softwareUpdateScanPolicy, 0);
}

@end
