@implementation SUCoreUpdateDownloader

- (SUCoreUpdateDownloader)initWithDelegate:(id)a3 forUpdate:(id)a4 updateUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  SUCoreUpdateDownloader *v12;
  SUCoreMobileAsset *v13;
  void *v14;
  SUCoreMobileAsset *v15;
  SUCoreMobileAsset *maControl;
  void *v17;
  void *v18;
  SUCoreMobileAsset *v19;
  void *v20;
  SUCoreMobileAsset *v21;
  SUCoreMobileAsset *maControlSplombo;
  void *v23;
  NSObject *v24;
  SUCoreUpdateDownloader *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  SUCorePolicy *policy;
  void *v30;
  OS_dispatch_queue *v31;
  OS_dispatch_queue *delegateCallBackQueue;
  NSDictionary *v33;
  NSDictionary *stateTable;
  SUCoreFSM *v35;
  SUCoreFSM *downloadFSM;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  objc_super v42;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v9 && v10)
  {
    v42.receiver = self;
    v42.super_class = (Class)SUCoreUpdateDownloader;
    v12 = -[SUCoreUpdateDownloader init](&v42, sel_init);
    self = v12;
    if (!v12)
    {
LABEL_18:
      self = self;
      v25 = self;
      goto LABEL_19;
    }
    v12->_shouldDownloadSplat = 0;
    if (objc_msgSend(v9, "descriptorType") == 1
      || objc_msgSend(v9, "descriptorType") == 3
      || objc_msgSend(v9, "descriptorType") == 5)
    {
      v13 = [SUCoreMobileAsset alloc];
      objc_msgSend(v9, "softwareUpdateAsset");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[SUCoreMobileAsset initWithDelegate:forAsset:updateUUID:](v13, "initWithDelegate:forAsset:updateUUID:", self, v14, v11);
      maControl = self->_maControl;
      self->_maControl = v15;

      objc_msgSend(v9, "associatedSplatDescriptor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        if (objc_msgSend(v17, "descriptorType") != 1)
        {
          objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "oslog");
          v39 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            -[SUCoreUpdateDownloader initWithDelegate:forUpdate:updateUUID:].cold.2(v18);

          goto LABEL_13;
        }
        v19 = [SUCoreMobileAsset alloc];
        objc_msgSend(v18, "softwareUpdateAsset");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[SUCoreMobileAsset initWithDelegate:forAsset:updateUUID:](v19, "initWithDelegate:forAsset:updateUUID:", self, v20, v11);
        maControlSplombo = self->_maControlSplombo;
        self->_maControlSplombo = v21;

        self->_shouldDownloadSplat = 1;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "oslog");
        v27 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("init: not creating ma for Splat"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v44 = v28;
          _os_log_impl(&dword_1DDFDD000, v27, OS_LOG_TYPE_DEFAULT, "[SUCoreUpdateDownloader] %{public}@", buf, 0xCu);

        }
      }

      policy = self->_policy;
      self->_policy = 0;

      objc_storeWeak((id *)&self->_delegate, v8);
      objc_storeStrong((id *)&self->_updateDescriptor, a4);
      objc_storeStrong((id *)&self->_updateUUID, a5);
      objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "selectDelegateCallbackQueue:", 0);
      v31 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
      delegateCallBackQueue = self->_delegateCallBackQueue;
      self->_delegateCallBackQueue = v31;

      +[SUCoreUpdateDownloader _generateStateTable](SUCoreUpdateDownloader, "_generateStateTable");
      v33 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      stateTable = self->_stateTable;
      self->_stateTable = v33;

      v35 = (SUCoreFSM *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8958]), "initMachine:ofInstance:withTable:startingIn:usingDelegate:registeringAllInfoClass:", CFSTR("update_downloader"), self->_updateUUID, self->_stateTable, CFSTR("Idle"), self, objc_opt_class());
      downloadFSM = self->_downloadFSM;
      self->_downloadFSM = v35;

      if (self->_downloadFSM)
        goto LABEL_18;
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "oslog");
      v24 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[SUCoreUpdateDownloader initWithDelegate:forUpdate:updateUUID:].cold.1();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "oslog");
      v24 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[SUCoreUpdateDownloader initWithDelegate:forUpdate:updateUUID:].cold.3(v9);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "oslog");
    v24 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[SUCoreUpdateDownloader initWithDelegate:forUpdate:updateUUID:].cold.4();
  }

LABEL_13:
  v25 = 0;
LABEL_19:

  return v25;
}

- (void)downloadUpdateWithPolicy:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__SUCoreUpdateDownloader_downloadUpdateWithPolicy___block_invoke;
  v8[3] = &unk_1EA878A88;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __51__SUCoreUpdateDownloader_downloadUpdateWithPolicy___block_invoke(uint64_t a1)
{
  SUCoreUpdateDownloaderParam *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setPolicy:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "downloadFSM");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(SUCoreUpdateDownloaderParam);
  objc_msgSend(v3, "postProtectedEvent:withInfo:", CFSTR("DownloadUpdate"), v2);

}

- (void)removeUpdate
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extendedStateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__SUCoreUpdateDownloader_removeUpdate__block_invoke;
  block[3] = &unk_1EA877EF8;
  block[4] = self;
  dispatch_async(v4, block);

}

void __38__SUCoreUpdateDownloader_removeUpdate__block_invoke(uint64_t a1)
{
  SUCoreUpdateDownloaderParam *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "downloadFSM");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc_init(SUCoreUpdateDownloaderParam);
  objc_msgSend(v2, "postProtectedEvent:withInfo:", CFSTR("RemoveUpdate"), v1);

}

- (void)alterPolicy:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  SUCoreUpdateDownloader *v10;

  v4 = a3;
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__SUCoreUpdateDownloader_alterPolicy___block_invoke;
  v8[3] = &unk_1EA878A88;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __38__SUCoreUpdateDownloader_alterPolicy___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "setPolicy:");
    v2 = objc_alloc_init(MEMORY[0x1E0D4E080]);
    objc_msgSend(*(id *)(a1 + 32), "softwareUpdateDownloadPolicy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setDiscretionary:", objc_msgSend(v3, "discretionary"));

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "oslog");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = (void *)MEMORY[0x1E0CB3940];
      +[SUCoreMobileAsset downloadConfigSummary:](SUCoreMobileAsset, "downloadConfigSummary:", v2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("adjusting configuration: %@"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v6;
      v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_1DDFDD000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "maControl");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "alterDownloadOptions:", v2);

    objc_msgSend(*(id *)(a1 + 40), "maControlSplombo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "alterDownloadOptions:", v2);

  }
}

+ (id)_generateStateTable
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD v73[2];
  _QWORD v74[2];
  _QWORD v75[2];
  _QWORD v76[2];
  _QWORD v77[2];
  _QWORD v78[2];
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD v83[9];
  _QWORD v84[9];
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD v93[2];
  _QWORD v94[2];
  _QWORD v95[2];
  _QWORD v96[2];
  _QWORD v97[2];
  _QWORD v98[2];
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  _QWORD v103[9];
  _QWORD v104[9];
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  _QWORD v113[2];
  _QWORD v114[2];
  _QWORD v115[2];
  _QWORD v116[2];
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  _QWORD v121[8];
  _QWORD v122[8];
  _QWORD v123[2];
  _QWORD v124[2];
  uint64_t v125;
  const __CFString *v126;
  _QWORD v127[2];
  _QWORD v128[2];
  uint64_t v129;
  const __CFString *v130;
  uint64_t v131;
  const __CFString *v132;
  _QWORD v133[2];
  _QWORD v134[2];
  _QWORD v135[2];
  _QWORD v136[2];
  _QWORD v137[2];
  _QWORD v138[2];
  _QWORD v139[2];
  _QWORD v140[2];
  uint64_t v141;
  uint64_t v142;
  _QWORD v143[7];
  _QWORD v144[7];
  uint64_t v145;
  const __CFString *v146;
  uint64_t v147;
  const __CFString *v148;
  _QWORD v149[2];
  _QWORD v150[2];
  _QWORD v151[2];
  _QWORD v152[2];
  _QWORD v153[2];
  _QWORD v154[2];
  _QWORD v155[2];
  _QWORD v156[2];
  uint64_t v157;
  uint64_t v158;
  _QWORD v159[7];
  _QWORD v160[7];
  uint64_t v161;
  const __CFString *v162;
  uint64_t v163;
  const __CFString *v164;
  _QWORD v165[2];
  _QWORD v166[2];
  _QWORD v167[2];
  _QWORD v168[2];
  _QWORD v169[2];
  _QWORD v170[2];
  uint64_t v171;
  uint64_t v172;
  _QWORD v173[6];
  _QWORD v174[6];
  uint64_t v175;
  const __CFString *v176;
  _QWORD v177[2];
  _QWORD v178[2];
  _QWORD v179[2];
  _QWORD v180[2];
  _QWORD v181[8];
  _QWORD v182[10];

  v182[8] = *MEMORY[0x1E0C80C00];
  v181[0] = CFSTR("Idle");
  v179[0] = CFSTR("DownloadUpdate");
  v3 = *MEMORY[0x1E0DA8990];
  v177[0] = *MEMORY[0x1E0DA8B88];
  v2 = v177[0];
  v177[1] = v3;
  v178[0] = CFSTR("DownloadingSU");
  v178[1] = CFSTR("DownloadSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v178, v177, 2);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v179[1] = CFSTR("RemoveUpdate");
  v180[0] = v64;
  v175 = v3;
  v176 = CFSTR("ReportUpdateRemoved");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v176, &v175, 1);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v180[1] = v63;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v180, v179, 2);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v182[0] = v62;
  v181[1] = CFSTR("DownloadingSU");
  v173[0] = CFSTR("DownloadUpdate");
  v171 = v3;
  v172 = *MEMORY[0x1E0DA8B68];
  v4 = v172;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v172, &v171, 1);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v174[0] = v61;
  v173[1] = CFSTR("RemoveUpdate");
  v169[0] = v2;
  v169[1] = v3;
  v170[0] = CFSTR("RemovingSU");
  v170[1] = CFSTR("RemoveSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v170, v169, 2);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v174[1] = v60;
  v173[2] = CFSTR("DownloadSucceeded");
  v167[0] = v2;
  v167[1] = v3;
  v168[0] = CFSTR("DownloadingSplat");
  v168[1] = CFSTR("DownloadSplat");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v168, v167, 2);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v174[2] = v59;
  v173[3] = CFSTR("DownloadFailed");
  v165[0] = v2;
  v165[1] = v3;
  v166[0] = CFSTR("Idle");
  v166[1] = CFSTR("ReportUpdateFailedToDownload");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v166, v165, 2);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v174[3] = v58;
  v173[4] = CFSTR("DownloadProgress");
  v163 = v3;
  v164 = CFSTR("ReportDownloadProgress");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v164, &v163, 1);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v174[4] = v57;
  v173[5] = CFSTR("DownloadStalled");
  v161 = v3;
  v162 = CFSTR("ReportDownloadStalled");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v162, &v161, 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v174[5] = v56;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v174, v173, 6);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v182[1] = v55;
  v181[2] = CFSTR("DownloadingSplat");
  v159[0] = CFSTR("DownloadUpdate");
  v157 = v3;
  v158 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v158, &v157, 1);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v160[0] = v54;
  v159[1] = CFSTR("RemoveUpdate");
  v155[0] = v2;
  v155[1] = v3;
  v156[0] = CFSTR("RemovingSU");
  v156[1] = CFSTR("RemoveSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v156, v155, 2);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v160[1] = v53;
  v159[2] = CFSTR("DownloadSucceeded");
  v153[0] = v2;
  v153[1] = v3;
  v154[0] = CFSTR("DownloadingPSUSAssets");
  v154[1] = CFSTR("DownloadPSUSAssets");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v154, v153, 2);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v160[2] = v52;
  v159[3] = CFSTR("OperationSkipped");
  v151[0] = v2;
  v151[1] = v3;
  v152[0] = CFSTR("DownloadingPSUSAssets");
  v152[1] = CFSTR("DownloadPSUSAssets");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v152, v151, 2);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v160[3] = v51;
  v159[4] = CFSTR("DownloadFailed");
  v149[0] = v2;
  v149[1] = v3;
  v150[0] = CFSTR("Idle");
  v150[1] = CFSTR("ReportUpdateFailedToDownload");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v150, v149, 2);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v160[4] = v50;
  v159[5] = CFSTR("DownloadProgress");
  v147 = v3;
  v148 = CFSTR("ReportDownloadProgress");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v148, &v147, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v160[5] = v49;
  v159[6] = CFSTR("DownloadStalled");
  v145 = v3;
  v146 = CFSTR("ReportDownloadStalled");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v146, &v145, 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v160[6] = v48;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v160, v159, 7);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v182[2] = v47;
  v181[3] = CFSTR("DownloadingPSUSAssets");
  v143[0] = CFSTR("DownloadUpdate");
  v141 = v3;
  v142 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v142, &v141, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v144[0] = v46;
  v143[1] = CFSTR("RemoveUpdate");
  v139[0] = v2;
  v139[1] = v3;
  v140[0] = CFSTR("RemovingSU");
  v140[1] = CFSTR("RemoveSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v140, v139, 2);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v144[1] = v45;
  v143[2] = CFSTR("DownloadSucceeded");
  v137[0] = v2;
  v137[1] = v3;
  v138[0] = CFSTR("Downloaded");
  v138[1] = CFSTR("ReportUpdateDownloaded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v138, v137, 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v144[2] = v44;
  v143[3] = CFSTR("OperationSkipped");
  v135[0] = v2;
  v135[1] = v3;
  v136[0] = CFSTR("Downloaded");
  v136[1] = CFSTR("ReportUpdateDownloaded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v136, v135, 2);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v144[3] = v43;
  v143[4] = CFSTR("DownloadFailed");
  v133[0] = v2;
  v133[1] = v3;
  v134[0] = CFSTR("Idle");
  v134[1] = CFSTR("ReportUpdateFailedToDownload");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v134, v133, 2);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v144[4] = v42;
  v143[5] = CFSTR("DownloadProgress");
  v131 = v3;
  v132 = CFSTR("ReportDownloadProgress");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v132, &v131, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v144[5] = v41;
  v143[6] = CFSTR("DownloadStalled");
  v129 = v3;
  v130 = CFSTR("ReportDownloadStalled");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v130, &v129, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v144[6] = v40;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v144, v143, 7);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v182[3] = v39;
  v181[4] = CFSTR("Downloaded");
  v127[0] = CFSTR("DownloadUpdate");
  v125 = v3;
  v126 = CFSTR("ReportUpdateDownloaded");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v126, &v125, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v128[0] = v38;
  v127[1] = CFSTR("RemoveUpdate");
  v123[0] = v2;
  v123[1] = v3;
  v124[0] = CFSTR("RemovingSU");
  v124[1] = CFSTR("RemoveSU");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v124, v123, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v128[1] = v37;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v128, v127, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v182[4] = v36;
  v181[5] = CFSTR("RemovingSU");
  v121[0] = CFSTR("DownloadUpdate");
  v119 = v3;
  v120 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v122[0] = v35;
  v121[1] = CFSTR("RemoveUpdate");
  v117 = v3;
  v118 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v122[1] = v34;
  v121[2] = CFSTR("RemoveSucceeded");
  v115[0] = v2;
  v115[1] = v3;
  v116[0] = CFSTR("RemovingSplat");
  v116[1] = CFSTR("RemoveSplat");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, v115, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v122[2] = v33;
  v121[3] = CFSTR("RemoveFailed");
  v113[0] = v2;
  v113[1] = v3;
  v114[0] = CFSTR("Idle");
  v114[1] = CFSTR("ReportUpdateFailedToRemove");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, v113, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v122[3] = v32;
  v121[4] = CFSTR("DownloadSucceeded");
  v111 = v3;
  v112 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v122[4] = v31;
  v121[5] = CFSTR("DownloadFailed");
  v109 = v3;
  v110 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v122[5] = v30;
  v121[6] = CFSTR("DownloadProgress");
  v107 = v3;
  v108 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v122[6] = v29;
  v121[7] = CFSTR("DownloadStalled");
  v105 = v3;
  v106 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v122[7] = v28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v122, v121, 8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v182[5] = v27;
  v181[6] = CFSTR("RemovingSplat");
  v103[0] = CFSTR("DownloadUpdate");
  v101 = v3;
  v102 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v104[0] = v26;
  v103[1] = CFSTR("RemoveUpdate");
  v99 = v3;
  v100 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v104[1] = v25;
  v103[2] = CFSTR("RemoveSucceeded");
  v97[0] = v2;
  v97[1] = v3;
  v98[0] = CFSTR("RemovingPSUSAssets");
  v98[1] = CFSTR("RemovePSUSAssets");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v104[2] = v24;
  v103[3] = CFSTR("OperationSkipped");
  v95[0] = v2;
  v95[1] = v3;
  v96[0] = CFSTR("RemovingPSUSAssets");
  v96[1] = CFSTR("RemovePSUSAssets");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, v95, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v104[3] = v23;
  v103[4] = CFSTR("RemoveFailed");
  v93[0] = v2;
  v93[1] = v3;
  v94[0] = CFSTR("Idle");
  v94[1] = CFSTR("ReportUpdateFailedToRemove");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v104[4] = v22;
  v103[5] = CFSTR("DownloadSucceeded");
  v91 = v3;
  v92 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v104[5] = v21;
  v103[6] = CFSTR("DownloadFailed");
  v89 = v3;
  v90 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v104[6] = v20;
  v103[7] = CFSTR("DownloadProgress");
  v87 = v3;
  v88 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v104[7] = v19;
  v103[8] = CFSTR("DownloadStalled");
  v85 = v3;
  v86 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v104[8] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v104, v103, 9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v182[6] = v17;
  v181[7] = CFSTR("RemovingPSUSAssets");
  v83[0] = CFSTR("DownloadUpdate");
  v81 = v3;
  v82 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v84[0] = v16;
  v83[1] = CFSTR("RemoveUpdate");
  v79 = v3;
  v80 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v84[1] = v5;
  v83[2] = CFSTR("RemoveSucceeded");
  v77[0] = v2;
  v77[1] = v3;
  v78[0] = CFSTR("Idle");
  v78[1] = CFSTR("ReportUpdateRemoved");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v84[2] = v6;
  v83[3] = CFSTR("OperationSkipped");
  v75[0] = v2;
  v75[1] = v3;
  v76[0] = CFSTR("Idle");
  v76[1] = CFSTR("ReportUpdateRemoved");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v84[3] = v7;
  v83[4] = CFSTR("RemoveFailed");
  v73[0] = v2;
  v73[1] = v3;
  v74[0] = CFSTR("Idle");
  v74[1] = CFSTR("ReportUpdateFailedToRemove");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v84[4] = v8;
  v83[5] = CFSTR("DownloadSucceeded");
  v71 = v3;
  v72 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v84[5] = v9;
  v83[6] = CFSTR("DownloadFailed");
  v69 = v3;
  v70 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v84[6] = v10;
  v83[7] = CFSTR("DownloadProgress");
  v67 = v3;
  v68 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v84[7] = v11;
  v83[8] = CFSTR("DownloadStalled");
  v65 = v3;
  v66 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v84[8] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v182[7] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v182, v181, 8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8
{
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  int64_t v15;
  int64_t v16;

  v11 = a3;
  v12 = a6;
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "extendedStateQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0DA8B68]) & 1) != 0)
  {
    v15 = 0;
  }
  else
  {
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("DownloadSU")))
    {
      v16 = -[SUCoreUpdateDownloader actionDownloadSU:error:](self, "actionDownloadSU:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("DownloadSplat")))
    {
      v16 = -[SUCoreUpdateDownloader actionDownloadSplat:error:](self, "actionDownloadSplat:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("DownloadPSUSAssets")))
    {
      v16 = -[SUCoreUpdateDownloader actionDownloadPSUSAssets:error:](self, "actionDownloadPSUSAssets:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportUpdateDownloaded")))
    {
      v16 = -[SUCoreUpdateDownloader actionReportUpdateDownloaded:error:](self, "actionReportUpdateDownloaded:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportUpdateFailedToDownload")))
    {
      v16 = -[SUCoreUpdateDownloader actionReportUpdateFailedToDownload:error:](self, "actionReportUpdateFailedToDownload:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportDownloadStalled")))
    {
      v16 = -[SUCoreUpdateDownloader actionReportDownloadStalled:error:](self, "actionReportDownloadStalled:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportDownloadProgress")))
    {
      v16 = -[SUCoreUpdateDownloader actionReportDownloadProgress:error:](self, "actionReportDownloadProgress:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("RemoveSU")))
    {
      v16 = -[SUCoreUpdateDownloader actionRemoveSU:error:](self, "actionRemoveSU:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("RemoveSplat")))
    {
      v16 = -[SUCoreUpdateDownloader actionRemoveSplat:error:](self, "actionRemoveSplat:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("RemovePSUSAssets")))
    {
      v16 = -[SUCoreUpdateDownloader actionRemovePSUSAssets:error:](self, "actionRemovePSUSAssets:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportUpdateRemoved")))
    {
      v16 = -[SUCoreUpdateDownloader actionReportUpdateRemoved:error:](self, "actionReportUpdateRemoved:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ReportUpdateFailedToRemove")))
    {
      v16 = -[SUCoreUpdateDownloader actionReportUpdateFailedToRemove:error:](self, "actionReportUpdateFailedToRemove:error:", v12, a8);
    }
    else
    {
      v16 = -[SUCoreUpdateDownloader actionUnknownAction:error:](self, "actionUnknownAction:error:", v11, a8);
    }
    v15 = v16;
  }

  return v15;
}

- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "diag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ unknown action(%@)"), self, v5);

  objc_msgSend(v9, "dumpTracked:dumpingTo:usingFilename:clearingStatistics:clearingHistory:", v10, 5, 0, 0, 0);
  return 8102;
}

- (int64_t)actionDownloadSU:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SUCoreUpdateDownloaderParam *v17;
  int64_t v18;
  void *v19;

  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreUpdateDownloader setTotalWrittenBytesUpToLastPhase:](self, "setTotalWrittenBytesUpToLastPhase:", 0);
  -[SUCoreUpdateDownloader setTotalToWriteBytesForPhase:](self, "setTotalToWriteBytesForPhase:", 0);
  v7 = objc_alloc(MEMORY[0x1E0DA8978]);
  v8 = *MEMORY[0x1E0DA8BA8];
  -[SUCoreUpdateDownloader updateDescriptor](self, "updateDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "downloadSize");
  LODWORD(v11) = 0;
  v12 = (void *)objc_msgSend(v7, "initWithPhase:isStalled:portionComplete:totalWrittenBytes:totalExpectedBytes:remaining:", v8, 0, 0, v10, v11, -1.0);
  -[SUCoreUpdateDownloader setUnifiedProgress:](self, "setUnifiedProgress:", v12);

  -[SUCoreUpdateDownloader maControl](self, "maControl");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SUCoreUpdateDownloader updateDescriptor](self, "updateDescriptor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreUpdateDownloader setTotalToWriteBytesForPhase:](self, "setTotalToWriteBytesForPhase:", objc_msgSend(v14, "suDownloadSize"));

    -[SUCoreUpdateDownloader maControl](self, "maControl");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreUpdateDownloader policy](self, "policy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreUpdateDownloader updateUUID](self, "updateUUID");
    v17 = (SUCoreUpdateDownloaderParam *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "downloadSoftwareUpdateAssetWithPolicy:withUUID:", v16, v17);
    v18 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 8116;
    objc_msgSend(v19, "buildError:underlying:description:", 8116, 0, CFSTR("unexpected no maControl when trying to download SU"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreUpdateDownloader _trackAnomaly:reason:result:error:](self, "_trackAnomaly:reason:result:error:", CFSTR("[DOWNLOAD_SU]"), CFSTR("unexpected no maControl when trying to download SU"), 8116, v15);
    -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[SUCoreUpdateDownloaderParam initWithError:]([SUCoreUpdateDownloaderParam alloc], "initWithError:", v15);
    objc_msgSend(v16, "followupEvent:withInfo:", CFSTR("DownloadFailed"), v17);
  }

  return v18;
}

- (int64_t)actionDownloadSplat:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  SUCoreUpdateDownloaderParam *v17;

  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (-[SUCoreUpdateDownloader shouldDownloadSplat](self, "shouldDownloadSplat"))
  {
    -[SUCoreUpdateDownloader maControlSplombo](self, "maControlSplombo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 8116;
      objc_msgSend(v14, "buildError:underlying:description:", 8116, 0, CFSTR("unexpected no maControlSplombo when tyring to download Splat"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[SUCoreUpdateDownloader _trackAnomaly:reason:result:error:](self, "_trackAnomaly:reason:result:error:", CFSTR("[DOWNLOAD_SPLAT]"), CFSTR("unexpected no maControlSplombo when tyring to download Splat"), 8116, v15);
      -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[SUCoreUpdateDownloaderParam initWithError:]([SUCoreUpdateDownloaderParam alloc], "initWithError:", v15);
      objc_msgSend(v16, "followupEvent:withInfo:", CFSTR("DownloadFailed"), v17);

      return v13;
    }
    -[SUCoreUpdateDownloader setTotalWrittenBytesUpToLastPhase:](self, "setTotalWrittenBytesUpToLastPhase:", -[SUCoreUpdateDownloader totalWrittenBytesUpToLastPhase](self, "totalWrittenBytesUpToLastPhase")+ -[SUCoreUpdateDownloader totalToWriteBytesForPhase](self, "totalToWriteBytesForPhase"));
    -[SUCoreUpdateDownloader updateDescriptor](self, "updateDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "associatedSplatDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreUpdateDownloader setTotalToWriteBytesForPhase:](self, "setTotalToWriteBytesForPhase:", objc_msgSend(v9, "downloadSize"));

    -[SUCoreUpdateDownloader maControlSplombo](self, "maControlSplombo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreUpdateDownloader policy](self, "policy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreUpdateDownloader updateUUID](self, "updateUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "downloadSoftwareUpdateAssetWithPolicy:withUUID:", v11, v12);

  }
  else
  {
    -[SUCoreUpdateDownloader _skipCurrentOperationFor:](self, "_skipCurrentOperationFor:", CFSTR("[Splombo] No splat to download; skip downloading splat"));
  }
  return 0;
}

- (int64_t)actionDownloadPSUSAssets:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
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
  _QWORD v31[5];
  _QWORD v32[5];
  uint8_t buf[4];
  SUCoreUpdateDownloader *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[SUCoreUpdateDownloader _isPreSUStagingEnabled](self, "_isPreSUStagingEnabled"))
  {
    v10 = CFSTR("[PreSUStaging] disabled; skip downloading assets");
LABEL_15:
    -[SUCoreUpdateDownloader _skipCurrentOperationFor:](self, "_skipCurrentOperationFor:", v10);
    goto LABEL_16;
  }
  -[SUCoreUpdateDownloader updateDescriptor](self, "updateDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "preSUStagingRequiredSize");

  if (v9)
  {
    objc_msgSend(v7, "addObject:", CFSTR("STAGE_GROUP_REQUIRED"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[PreSUStaging] No required assets to stage"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = self;
      v35 = 2114;
      v36 = v13;
      _os_log_impl(&dword_1DDFDD000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);

    }
  }
  if (-[SUCoreUpdateDownloader _shouldStageOptionalPSUSAssets](self, "_shouldStageOptionalPSUSAssets"))
    objc_msgSend(v7, "addObject:", CFSTR("STAGE_GROUP_OPTIONAL"));
  if (!objc_msgSend(v7, "count"))
  {
    v10 = CFSTR("[PreSUStaging] No assets to download; skip downloading assets");
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "oslog");
  v15 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[PreSUStaging] PSUS groups to stage: %@"), v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v34 = self;
    v35 = 2114;
    v36 = v16;
    _os_log_impl(&dword_1DDFDD000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);

  }
  -[SUCoreUpdateDownloader setTotalWrittenBytesUpToLastPhase:](self, "setTotalWrittenBytesUpToLastPhase:", -[SUCoreUpdateDownloader totalWrittenBytesUpToLastPhase](self, "totalWrittenBytesUpToLastPhase")+ -[SUCoreUpdateDownloader totalToWriteBytesForPhase](self, "totalToWriteBytesForPhase"));
  -[SUCoreUpdateDownloader updateDescriptor](self, "updateDescriptor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdateDownloader setTotalToWriteBytesForPhase:](self, "setTotalToWriteBytesForPhase:", objc_msgSend(v17, "preSUStagingRequiredSize"));

  v18 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __57__SUCoreUpdateDownloader_actionDownloadPSUSAssets_error___block_invoke;
  v32[3] = &unk_1EA878A30;
  v32[4] = self;
  v19 = (void *)MEMORY[0x1DF0E6BC4](v32);
  v31[0] = v18;
  v31[1] = 3221225472;
  v31[2] = __57__SUCoreUpdateDownloader_actionDownloadPSUSAssets_error___block_invoke_291;
  v31[3] = &unk_1EA8791B0;
  v31[4] = self;
  v20 = (void *)MEMORY[0x1DF0E6BC4](v31);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdateDownloader updateDescriptor](self, "updateDescriptor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "productVersion");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSafeObject:forKey:", v23, CFSTR("OSVersion"));

  -[SUCoreUpdateDownloader updateDescriptor](self, "updateDescriptor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "productBuildVersion");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSafeObject:forKey:", v25, CFSTR("Build"));

  -[SUCoreUpdateDownloader updateDescriptor](self, "updateDescriptor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "trainName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSafeObject:forKey:", v27, CFSTR("TrainName"));

  -[SUCoreUpdateDownloader updateDescriptor](self, "updateDescriptor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "restoreVersion");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSafeObject:forKey:", v29, CFSTR("RestoreVersion"));

  objc_msgSend(v21, "setSafeObject:forKey:", v7, CFSTR("GroupNames"));
  objc_msgSend(MEMORY[0x1E0D4E060], "SUCoreBorder_stageDownloadGroups:awaitingAllGroups:withStagingTimeout:reportingProgress:completion:", v21, 0, -1, v20, v19);

LABEL_16:
  return 0;
}

void __57__SUCoreUpdateDownloader_actionDownloadPSUSAssets_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  SUCoreUpdateDownloaderParam *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  SUCoreUpdateDownloaderParam *v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "downloadFSM");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_alloc_init(SUCoreUpdateDownloaderParam);
    v15 = CFSTR("DownloadSucceeded");
    goto LABEL_6;
  }
  objc_msgSend(v9, "domain");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.MobileAssetError.AutoAsset")))
  {
    v12 = objc_msgSend(v10, "code");

    if (v12 == 6611)
    {
      objc_msgSend(*(id *)(a1 + 32), "downloadFSM");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[SUCoreUpdateDownloaderParam initWithError:]([SUCoreUpdateDownloaderParam alloc], "initWithError:", v10);
      v15 = CFSTR("DownloadFailed");
LABEL_6:
      objc_msgSend(v13, "postEvent:withInfo:", v15, v14);

      goto LABEL_11;
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("download failed with %@, but this is non-fatal"), v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "oslog");
  v18 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[PreSUStaging] %@"), v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v19;
    v25 = 2114;
    v26 = v20;
    _os_log_impl(&dword_1DDFDD000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "downloadFSM");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[SUCoreUpdateDownloaderParam initWithNote:]([SUCoreUpdateDownloaderParam alloc], "initWithNote:", v16);
  objc_msgSend(v21, "postEvent:withInfo:", CFSTR("DownloadSucceeded"), v22);

LABEL_11:
}

void __57__SUCoreUpdateDownloader_actionDownloadPSUSAssets_error___block_invoke_291(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  float v7;
  float v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  SUCoreUpdateDownloaderParam *v20;
  id v21;

  v21 = a3;
  if (v21)
  {
    objc_msgSend(*(id *)(a1 + 32), "_trackAnomaly:reason:result:error:", CFSTR("[DOWNLOAD_PSUS]"), CFSTR("unexpected progress error"), objc_msgSend(v21, "code"), v21);
  }
  else
  {
    objc_msgSend(a2, "downloadProgress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = 0.0;
      if (objc_msgSend(v5, "totalWrittenBytes") >= 1 && objc_msgSend(v6, "totalExpectedBytes") >= 1)
      {
        v8 = (float)objc_msgSend(v6, "totalWrittenBytes");
        v7 = v8 / (float)objc_msgSend(v6, "totalExpectedBytes");
      }
      v9 = objc_alloc(MEMORY[0x1E0DA8978]);
      v10 = *MEMORY[0x1E0DA8BA8];
      v11 = objc_msgSend(v6, "isStalled");
      v12 = objc_msgSend(v6, "totalWrittenBytes");
      v13 = objc_msgSend(v6, "totalExpectedBytes");
      objc_msgSend(v6, "expectedTimeRemainingSecs");
      v15 = v14;
      objc_msgSend(v6, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v17 = v7;
      v18 = (void *)objc_msgSend(v9, "initWithPhase:isStalled:portionComplete:totalWrittenBytes:totalExpectedBytes:remaining:taskDescription:", v10, v11, v12, v13, v16, v17, v15);

      objc_msgSend(*(id *)(a1 + 32), "downloadFSM");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[SUCoreUpdateDownloaderParam initWithProgress:]([SUCoreUpdateDownloaderParam alloc], "initWithProgress:", v18);
      objc_msgSend(v19, "postEvent:withInfo:", CFSTR("DownloadProgress"), v20);

    }
  }

}

- (int64_t)actionReportDownloadProgress:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  uint64_t v25;
  void *v26;
  double v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD block[5];
  uint8_t buf[4];
  SUCoreUpdateDownloader *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(v5, "progress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdateDownloader unifiedProgress](self, "unifiedProgress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIsStalled:", 0);

  v10 = objc_msgSend(v8, "totalWrittenBytes");
  v11 = -[SUCoreUpdateDownloader totalWrittenBytesUpToLastPhase](self, "totalWrittenBytesUpToLastPhase") + v10;
  -[SUCoreUpdateDownloader unifiedProgress](self, "unifiedProgress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTotalWrittenBytes:", v11);

  -[SUCoreUpdateDownloader unifiedProgress](self, "unifiedProgress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "totalExpectedBytes");
  -[SUCoreUpdateDownloader unifiedProgress](self, "unifiedProgress");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 - objc_msgSend(v15, "totalWrittenBytes");

  v17 = objc_msgSend(v8, "totalExpectedBytes");
  v18 = objc_msgSend(v8, "totalWrittenBytes");
  if (v16 >= 1 && v17 - v18 >= 1)
  {
    v19 = (double)v16 / (double)(v17 - v18);
    objc_msgSend(v8, "estimatedTimeRemaining");
    v21 = v19 * v20;
    -[SUCoreUpdateDownloader unifiedProgress](self, "unifiedProgress");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setEstimatedTimeRemaining:", v21);

  }
  -[SUCoreUpdateDownloader unifiedProgress](self, "unifiedProgress");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (double)objc_msgSend(v23, "totalWrittenBytes");
  -[SUCoreUpdateDownloader unifiedProgress](self, "unifiedProgress");
  v25 = objc_claimAutoreleasedReturnValue();
  *(float *)&v24 = v24 / (double)objc_msgSend((id)v25, "totalExpectedBytes");
  -[SUCoreUpdateDownloader unifiedProgress](self, "unifiedProgress");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v27) = LODWORD(v24);
  objc_msgSend(v26, "setPortionComplete:", v27);

  -[SUCoreUpdateDownloader delegate](self, "delegate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v25) = objc_opt_respondsToSelector();

  if ((v25 & 1) != 0)
  {
    -[SUCoreUpdateDownloader delegateCallBackQueue](self, "delegateCallBackQueue");
    v29 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__SUCoreUpdateDownloader_actionReportDownloadProgress_error___block_invoke;
    block[3] = &unk_1EA877EF8;
    block[4] = self;
    dispatch_async(v29, block);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "oslog");
    v29 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v31 = (void *)MEMORY[0x1E0CB3940];
      -[SUCoreUpdateDownloader unifiedProgress](self, "unifiedProgress");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringWithFormat:", CFSTR("delegate does not respond to selector(downloadProgress:) so not reporting progress=%@"), v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = self;
      v38 = 2114;
      v39 = v33;
      _os_log_impl(&dword_1DDFDD000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);

    }
  }

  return 0;
}

void __61__SUCoreUpdateDownloader_actionReportDownloadProgress_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "unifiedProgress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "downloadProgress:", v2);

}

- (int64_t)actionReportDownloadStalled:(id)a3 error:(id *)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD block[5];
  uint8_t buf[4];
  SUCoreUpdateDownloader *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)v6);

  -[SUCoreUpdateDownloader unifiedProgress](self, "unifiedProgress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsStalled:", 1);

  -[SUCoreUpdateDownloader delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreUpdateDownloader delegateCallBackQueue](self, "delegateCallBackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__SUCoreUpdateDownloader_actionReportDownloadStalled_error___block_invoke;
    block[3] = &unk_1EA877EF8;
    block[4] = self;
    dispatch_async(v9, block);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      -[SUCoreUpdateDownloader unifiedProgress](self, "unifiedProgress");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("delegate does not respond to selector(downloadStalled:) so not reporting progress=%@"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = self;
      v18 = 2114;
      v19 = v13;
      _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);

    }
  }

  return 0;
}

void __60__SUCoreUpdateDownloader_actionReportDownloadStalled_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "unifiedProgress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "downloadStalled:", v2);

}

- (int64_t)actionReportUpdateDownloaded:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;
  id v7;
  double v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD block[5];
  id v18;
  uint8_t buf[4];
  SUCoreUpdateDownloader *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = objc_alloc(MEMORY[0x1E0DA8978]);
  LODWORD(v8) = 1.0;
  v9 = (void *)objc_msgSend(v7, "initWithPhase:isStalled:portionComplete:totalWrittenBytes:totalExpectedBytes:remaining:", *MEMORY[0x1E0DA8BA8], 0, -1, -1, v8, 0.0);
  -[SUCoreUpdateDownloader setUnifiedProgress:](self, "setUnifiedProgress:", v9);
  -[SUCoreUpdateDownloader delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[SUCoreUpdateDownloader delegateCallBackQueue](self, "delegateCallBackQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__SUCoreUpdateDownloader_actionReportUpdateDownloaded_error___block_invoke;
    block[3] = &unk_1EA878A88;
    block[4] = self;
    v18 = v9;
    dispatch_async(v12, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "oslog");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("delegate does not respond to selector(downloaded:) so not reporting progress=%@"), v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = self;
      v21 = 2114;
      v22 = v15;
      _os_log_impl(&dword_1DDFDD000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);

    }
  }

  return 0;
}

void __61__SUCoreUpdateDownloader_actionReportUpdateDownloaded_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "downloaded:", *(_QWORD *)(a1 + 40));

}

- (int64_t)actionReportUpdateFailedToDownload:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD block[5];
  id v17;
  uint8_t buf[4];
  SUCoreUpdateDownloader *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)v7);

  -[SUCoreUpdateDownloader delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SUCoreUpdateDownloader delegateCallBackQueue](self, "delegateCallBackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__SUCoreUpdateDownloader_actionReportUpdateFailedToDownload_error___block_invoke;
    block[3] = &unk_1EA878A88;
    block[4] = self;
    v17 = v5;
    dispatch_async(v9, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("delegate does not respond to selector(downloadedFailed:) so not reporting error=%@"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = self;
      v20 = 2114;
      v21 = v14;
      _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);

    }
  }

  return 0;
}

void __67__SUCoreUpdateDownloader_actionReportUpdateFailedToDownload_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "downloadFailed:", v2);

}

- (int64_t)actionRemoveSU:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  SUCoreUpdateDownloaderParam *v12;

  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreUpdateDownloader maControl](self, "maControl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SUCoreUpdateDownloader maControl](self, "maControl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeAsset");
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 8116;
    objc_msgSend(v10, "buildError:underlying:description:", 8116, 0, CFSTR("unexpected no maControl when tyring to remove SU"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreUpdateDownloader _trackAnomaly:reason:result:error:](self, "_trackAnomaly:reason:result:error:", CFSTR("[REMOVE_SU]"), CFSTR("unexpected no maControl when tyring to remove SU"), 8116, v8);
    -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SUCoreUpdateDownloaderParam initWithError:]([SUCoreUpdateDownloaderParam alloc], "initWithError:", v8);
    objc_msgSend(v11, "followupEvent:withInfo:", CFSTR("RemoveFailed"), v12);

  }
  return v9;
}

- (int64_t)actionRemoveSplat:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  SUCoreUpdateDownloaderParam *v13;

  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (-[SUCoreUpdateDownloader shouldDownloadSplat](self, "shouldDownloadSplat"))
  {
    -[SUCoreUpdateDownloader maControlSplombo](self, "maControlSplombo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 8116;
      objc_msgSend(v10, "buildError:underlying:description:", 8116, 0, CFSTR("unexpected no maControlSplombo when tyring to remove Splat"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[SUCoreUpdateDownloader _trackAnomaly:reason:result:error:](self, "_trackAnomaly:reason:result:error:", CFSTR("[REMOVE_SPLAT]"), CFSTR("unexpected no maControlSplombo when tyring to remove Splat"), 8116, v11);
      -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[SUCoreUpdateDownloaderParam initWithError:]([SUCoreUpdateDownloaderParam alloc], "initWithError:", v11);
      objc_msgSend(v12, "followupEvent:withInfo:", CFSTR("RemoveFailed"), v13);

      return v9;
    }
    -[SUCoreUpdateDownloader maControlSplombo](self, "maControlSplombo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeAsset");

  }
  else
  {
    -[SUCoreUpdateDownloader _skipCurrentOperationFor:](self, "_skipCurrentOperationFor:", CFSTR("[Splombo] No need to remove Splat, skip removing Splat"));
  }
  return 0;
}

- (int64_t)actionRemovePSUSAssets:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;
  _QWORD v8[5];

  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (-[SUCoreUpdateDownloader _isPreSUStagingEnabled](self, "_isPreSUStagingEnabled"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__SUCoreUpdateDownloader_actionRemovePSUSAssets_error___block_invoke;
    v8[3] = &unk_1EA878828;
    v8[4] = self;
    objc_msgSend(MEMORY[0x1E0D4E060], "SUCoreBorder_stagePurgeAll:", v8);
  }
  else
  {
    -[SUCoreUpdateDownloader _skipCurrentOperationFor:](self, "_skipCurrentOperationFor:", CFSTR("[PreSUStaging] disabled; skip removing assets"));
  }
  return 0;
}

void __55__SUCoreUpdateDownloader_actionRemovePSUSAssets_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  SUCoreUpdateDownloaderParam *v4;
  const __CFString *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "downloadFSM");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v4 = -[SUCoreUpdateDownloaderParam initWithError:]([SUCoreUpdateDownloaderParam alloc], "initWithError:", v6);
    v5 = CFSTR("RemoveFailed");
  }
  else
  {
    v4 = objc_alloc_init(SUCoreUpdateDownloaderParam);
    v5 = CFSTR("RemoveSucceeded");
  }
  objc_msgSend(v3, "postEvent:withInfo:", v5, v4);

}

- (int64_t)actionReportUpdateRemoved:(id)a3 error:(id *)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD block[5];
  uint8_t buf[4];
  SUCoreUpdateDownloader *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)v6);

  -[SUCoreUpdateDownloader delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreUpdateDownloader delegateCallBackQueue](self, "delegateCallBackQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__SUCoreUpdateDownloader_actionReportUpdateRemoved_error___block_invoke;
    block[3] = &unk_1EA877EF8;
    block[4] = self;
    dispatch_async(v8, block);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("delegate does not respond to selector(updateRemoved) so not reporting updateRemoved"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = self;
      v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_1DDFDD000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);

    }
  }

  return 0;
}

void __58__SUCoreUpdateDownloader_actionReportUpdateRemoved_error___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateRemoved");

}

- (int64_t)actionReportUpdateFailedToRemove:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD block[5];
  id v17;
  uint8_t buf[4];
  SUCoreUpdateDownloader *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)v7);

  -[SUCoreUpdateDownloader delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SUCoreUpdateDownloader delegateCallBackQueue](self, "delegateCallBackQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__SUCoreUpdateDownloader_actionReportUpdateFailedToRemove_error___block_invoke;
    block[3] = &unk_1EA878A88;
    block[4] = self;
    v17 = v5;
    dispatch_async(v9, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "oslog");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v5, "error");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("delegate does not respond to selector(updateRemoveFailed:) so not reporting error=%@"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = self;
      v20 = 2114;
      v21 = v14;
      _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);

    }
  }

  return 0;
}

void __65__SUCoreUpdateDownloader_actionReportUpdateFailedToRemove_error___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateRemoveFailed:", v2);

}

- (void)maDownloadProgress:(id)a3
{
  id v4;
  SUCoreUpdateDownloaderParam *v5;
  id v6;

  v4 = a3;
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreUpdateDownloaderParam initWithProgress:]([SUCoreUpdateDownloaderParam alloc], "initWithProgress:", v4);

  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("DownloadProgress"), v5);
}

- (void)maDownloadStalled:(id)a3
{
  id v4;
  SUCoreUpdateDownloaderParam *v5;
  id v6;

  v4 = a3;
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreUpdateDownloaderParam initWithProgress:]([SUCoreUpdateDownloaderParam alloc], "initWithProgress:", v4);

  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("DownloadStalled"), v5);
}

- (void)maDownloaded:(id)a3
{
  id v4;
  SUCoreUpdateDownloaderParam *v5;
  id v6;

  v4 = a3;
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreUpdateDownloaderParam initWithProgress:]([SUCoreUpdateDownloaderParam alloc], "initWithProgress:", v4);

  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("DownloadSucceeded"), v5);
}

- (void)maDownloadFailed:(id)a3
{
  id v4;
  SUCoreUpdateDownloaderParam *v5;
  id v6;

  v4 = a3;
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreUpdateDownloaderParam initWithError:]([SUCoreUpdateDownloaderParam alloc], "initWithError:", v4);

  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("DownloadFailed"), v5);
}

- (void)maAssetRemoved
{
  SUCoreUpdateDownloaderParam *v2;
  id v3;

  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(SUCoreUpdateDownloaderParam);
  objc_msgSend(v3, "postEvent:withInfo:", CFSTR("RemoveSucceeded"), v2);

}

- (void)maAssetRemoveFailed:(id)a3
{
  id v4;
  SUCoreUpdateDownloaderParam *v5;
  id v6;

  v4 = a3;
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[SUCoreUpdateDownloaderParam initWithError:]([SUCoreUpdateDownloaderParam alloc], "initWithError:", v4);

  objc_msgSend(v6, "postEvent:withInfo:", CFSTR("RemoveFailed"), v5);
}

- (void)maAnomaly:(id)a3
{
  id v4;

  v4 = a3;
  -[SUCoreUpdateDownloader _trackAnomaly:reason:result:error:](self, "_trackAnomaly:reason:result:error:", CFSTR("[MA_ANOMALY]"), CFSTR("maAnomaly called"), objc_msgSend(v4, "code"), v4);

}

- (void)_trackAnomaly:(id)a3 reason:(id)a4 result:(int64_t)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "diag");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "trackAnomaly:forReason:withResult:withError:", v12, v11, a5, v10);

  -[SUCoreUpdateDownloader delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[SUCoreUpdateDownloader delegateCallBackQueue](self, "delegateCallBackQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __60__SUCoreUpdateDownloader__trackAnomaly_reason_result_error___block_invoke;
    v17[3] = &unk_1EA878A88;
    v17[4] = self;
    v18 = v10;
    dispatch_async(v16, v17);

  }
}

void __60__SUCoreUpdateDownloader__trackAnomaly_reason_result_error___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anomaly:", *(_QWORD *)(a1 + 40));

}

- (BOOL)_isPreSUStagingEnabled
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  SUCoreUpdateDownloader *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[SUCoreUpdateDownloader updateDescriptor](self, "updateDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdateDownloader policy](self, "policy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v5 = +[SUCoreScan isPreSUStagingEnabledForUpdate:policy:reason:](SUCoreScan, "isPreSUStagingEnabledForUpdate:policy:reason:", v3, v4, &v12);
  v6 = v12;

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "oslog");
  v8 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("disabled");
    if (v5)
      v9 = CFSTR("enabled");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[PreSUStaging] %@: %@"), v9, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = self;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_1DDFDD000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);

  }
  return v5;
}

- (BOOL)_shouldStageOptionalPSUSAssets
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  SUCoreUpdateDownloader *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[SUCoreUpdateDownloader updateDescriptor](self, "updateDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "preSUStagingOptionalSize");

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[PreSUStaging] no optional assets to stage"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = self;
    v20 = 2114;
    v21 = v15;
LABEL_13:
    _os_log_impl(&dword_1DDFDD000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", (uint8_t *)&v18, 0x16u);

    goto LABEL_14;
  }
  -[SUCoreUpdateDownloader updateDescriptor](self, "updateDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enablePreSUStagingForOptionalAssets");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[PreSUStaging] staging optional assets is disabled by server (through the update)"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = self;
    v20 = 2114;
    v21 = v15;
    goto LABEL_13;
  }
  -[SUCoreUpdateDownloader policy](self, "policy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "enablePreSUStagingForOptionalAssets");

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "oslog");
  v10 = objc_claimAutoreleasedReturnValue();

  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if ((v8 & 1) == 0)
  {
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[PreSUStaging] staging optional assets is disabled by policy"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = self;
      v20 = 2114;
      v21 = v15;
      goto LABEL_13;
    }
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[PreSUStaging] should stage optional assets"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = self;
    v20 = 2114;
    v21 = v12;
    _os_log_impl(&dword_1DDFDD000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", (uint8_t *)&v18, 0x16u);

  }
  v13 = 1;
LABEL_15:

  return v13;
}

- (void)_skipCurrentOperationFor:(id)a3
{
  id v4;
  void *v5;
  SUCoreUpdateDownloaderParam *v6;

  v4 = a3;
  v6 = -[SUCoreUpdateDownloaderParam initWithNote:]([SUCoreUpdateDownloaderParam alloc], "initWithNote:", v4);

  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "followupEvent:withInfo:", CFSTR("OperationSkipped"), v6);

}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[SUCoreUpdateDownloader updateUUID](self, "updateUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[UPDATE_DOWNLOADER(%@)]"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (SUCorePolicy)policy
{
  return self->_policy;
}

- (void)setPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_policy, a3);
}

- (SUCoreDescriptor)updateDescriptor
{
  return self->_updateDescriptor;
}

- (SUCoreUpdateDownloaderDelegate)delegate
{
  return (SUCoreUpdateDownloaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)updateUUID
{
  return self->_updateUUID;
}

- (NSDictionary)stateTable
{
  return self->_stateTable;
}

- (SUCoreFSM)downloadFSM
{
  return self->_downloadFSM;
}

- (SUCoreMobileAsset)maControl
{
  return self->_maControl;
}

- (SUCoreMobileAsset)maControlSplombo
{
  return self->_maControlSplombo;
}

- (BOOL)shouldDownloadSplat
{
  return self->_shouldDownloadSplat;
}

- (SUCoreProgress)unifiedProgress
{
  return self->_unifiedProgress;
}

- (void)setUnifiedProgress:(id)a3
{
  objc_storeStrong((id *)&self->_unifiedProgress, a3);
}

- (unint64_t)totalToWriteBytesForPhase
{
  return self->_totalToWriteBytesForPhase;
}

- (void)setTotalToWriteBytesForPhase:(unint64_t)a3
{
  self->_totalToWriteBytesForPhase = a3;
}

- (unint64_t)totalWrittenBytesUpToLastPhase
{
  return self->_totalWrittenBytesUpToLastPhase;
}

- (void)setTotalWrittenBytesUpToLastPhase:(unint64_t)a3
{
  self->_totalWrittenBytesUpToLastPhase = a3;
}

- (OS_dispatch_queue)delegateCallBackQueue
{
  return self->_delegateCallBackQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateCallBackQueue, 0);
  objc_storeStrong((id *)&self->_unifiedProgress, 0);
  objc_storeStrong((id *)&self->_maControlSplombo, 0);
  objc_storeStrong((id *)&self->_maControl, 0);
  objc_storeStrong((id *)&self->_downloadFSM, 0);
  objc_storeStrong((id *)&self->_stateTable, 0);
  objc_storeStrong((id *)&self->_updateUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_updateDescriptor, 0);
  objc_storeStrong((id *)&self->_policy, 0);
}

- (void)initWithDelegate:forUpdate:updateUUID:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("init: failed to create the FSM"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138543362;
  v4 = v0;
  OUTLINED_FUNCTION_0_3(&dword_1DDFDD000, v1, v2, "[SUCoreUpdateDownloader] %{public}@", (uint8_t *)&v3);

  OUTLINED_FUNCTION_1();
}

- (void)initWithDelegate:(void *)a1 forUpdate:updateUUID:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("init: invalid udpate descriptor, descriptor type of splat (%ld) invalid"), objc_msgSend(a1, "descriptorType"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v1;
  OUTLINED_FUNCTION_0_3(&dword_1DDFDD000, v2, v3, "[SUCoreUpdateDownloader] %{public}@", (uint8_t *)&v4);

  OUTLINED_FUNCTION_1_3();
}

- (void)initWithDelegate:(void *)a1 forUpdate:updateUUID:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("init: invalid udpate descriptor, descriptor type (%ld) invalid"), objc_msgSend(a1, "descriptorType"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v1;
  OUTLINED_FUNCTION_0_3(&dword_1DDFDD000, v2, v3, "[SUCoreUpdateDownloader] %{public}@", (uint8_t *)&v4);

  OUTLINED_FUNCTION_1_3();
}

- (void)initWithDelegate:forUpdate:updateUUID:.cold.4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("init: invalid param, update and updateUUID must be nonnull"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138543362;
  v4 = v0;
  OUTLINED_FUNCTION_0_3(&dword_1DDFDD000, v1, v2, "[SUCoreUpdateDownloader] %{public}@", (uint8_t *)&v3);

  OUTLINED_FUNCTION_1();
}

@end
