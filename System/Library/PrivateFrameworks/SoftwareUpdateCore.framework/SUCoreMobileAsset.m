@implementation SUCoreMobileAsset

- (SUCoreMobileAsset)initWithDelegate:(id)a3 forAsset:(id)a4 updateUUID:(id)a5
{
  return -[SUCoreMobileAsset initWithDelegate:forAsset:updateUUID:withCallbackQueue:withCompletionQueue:](self, "initWithDelegate:forAsset:updateUUID:withCallbackQueue:withCompletionQueue:", a3, a4, a5, 0, 0);
}

- (SUCoreMobileAsset)initWithDelegate:(id)a3 forAsset:(id)a4 updateUUID:(id)a5 withCallbackQueue:(id)a6 withCompletionQueue:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  SUCoreMobileAsset *v17;
  SUCoreMobileAsset *v18;
  NSString *documentationStashBuild;
  MADownloadOptions *downloadOptions;
  MADownloadConfig *currentDownloadConfig;
  MADownloadConfig *requestedDownloadConfig;
  MADownloadConfig *desiredDownloadConfig;
  NSString *operationName;
  id downloadCompletion;
  id alterDownloadCompletion;
  id removeCompletion;
  void *v28;
  void *v29;
  id v30;
  const char *v31;
  NSObject *v32;
  dispatch_queue_t v33;
  OS_dispatch_queue *maControlQueue;
  void *v35;
  NSObject *v36;
  _BOOL4 v37;
  void *v38;
  char v39;
  const __CFString *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  char v44;
  const __CFString *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  char v49;
  const __CFString *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  char v54;
  const __CFString *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  char v59;
  const __CFString *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  char v64;
  const __CFString *v65;
  void *v66;
  void *v67;
  char v68;
  const __CFString *v69;
  void *v70;
  SUCoreMobileAsset *v71;
  void *v72;
  uint64_t v73;
  OS_dispatch_queue *clientDelegateCallbackQueue;
  void *v75;
  uint64_t v76;
  OS_dispatch_queue *clientCompletionQueue;
  objc_super v79;
  uint8_t buf[4];
  const __CFString *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v79.receiver = self;
  v79.super_class = (Class)SUCoreMobileAsset;
  v17 = -[SUCoreMobileAsset init](&v79, sel_init);
  v18 = v17;
  if (!v17)
  {
LABEL_36:
    v71 = v18;
    goto LABEL_37;
  }
  objc_storeWeak(&v17->_maDelegate, v12);
  objc_storeStrong((id *)&v18->_asset, a4);
  objc_storeStrong((id *)&v18->_updateUUID, a5);
  documentationStashBuild = v18->_documentationStashBuild;
  v18->_documentationStashBuild = 0;

  downloadOptions = v18->_downloadOptions;
  v18->_downloadOptions = 0;

  currentDownloadConfig = v18->_currentDownloadConfig;
  v18->_currentDownloadConfig = 0;

  requestedDownloadConfig = v18->_requestedDownloadConfig;
  v18->_requestedDownloadConfig = 0;

  desiredDownloadConfig = v18->_desiredDownloadConfig;
  v18->_desiredDownloadConfig = 0;

  v18->_assetRemoved = 0;
  *(_DWORD *)&v18->_downloadingAsset = 0;
  operationName = v18->_operationName;
  v18->_operationName = 0;

  downloadCompletion = v18->_downloadCompletion;
  v18->_downloadCompletion = 0;

  alterDownloadCompletion = v18->_alterDownloadCompletion;
  v18->_alterDownloadCompletion = 0;

  removeCompletion = v18->_removeCompletion;
  v18->_removeCompletion = 0;

  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "commonDomain");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%@"), v29, CFSTR("ma.control")));
  v31 = (const char *)objc_msgSend(v30, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = dispatch_queue_create(v31, v32);
  maControlQueue = v18->_maControlQueue;
  v18->_maControlQueue = (OS_dispatch_queue *)v33;

  if (v18->_maControlQueue)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "oslog");
    v36 = objc_claimAutoreleasedReturnValue();

    v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v37)
      {
        -[SUCoreMobileAsset maDelegate](v18, "maDelegate");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_opt_respondsToSelector();
        v40 = CFSTR("NO");
        if ((v39 & 1) != 0)
          v40 = CFSTR("YES");
        *(_DWORD *)buf = 138543362;
        v81 = v40;
        _os_log_impl(&dword_1DDFDD000, v36, OS_LOG_TYPE_DEFAULT, "[MA] operating with delegate: respondsToSelector(maDownloadProgress:) %{public}@", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "oslog");
      v42 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        -[SUCoreMobileAsset maDelegate](v18, "maDelegate");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_opt_respondsToSelector();
        v45 = CFSTR("NO");
        if ((v44 & 1) != 0)
          v45 = CFSTR("YES");
        *(_DWORD *)buf = 138543362;
        v81 = v45;
        _os_log_impl(&dword_1DDFDD000, v42, OS_LOG_TYPE_DEFAULT, "[MA] operating with delegate: respondsToSelector(maDownloadStalled:) %{public}@", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "oslog");
      v47 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        -[SUCoreMobileAsset maDelegate](v18, "maDelegate");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = objc_opt_respondsToSelector();
        v50 = CFSTR("NO");
        if ((v49 & 1) != 0)
          v50 = CFSTR("YES");
        *(_DWORD *)buf = 138543362;
        v81 = v50;
        _os_log_impl(&dword_1DDFDD000, v47, OS_LOG_TYPE_DEFAULT, "[MA] operating with delegate: respondsToSelector(maDownloaded:) %{public}@", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "oslog");
      v52 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        -[SUCoreMobileAsset maDelegate](v18, "maDelegate");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_opt_respondsToSelector();
        v55 = CFSTR("NO");
        if ((v54 & 1) != 0)
          v55 = CFSTR("YES");
        *(_DWORD *)buf = 138543362;
        v81 = v55;
        _os_log_impl(&dword_1DDFDD000, v52, OS_LOG_TYPE_DEFAULT, "[MA] operating with delegate: respondsToSelector(maDownloadFailed:) %{public}@", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "oslog");
      v57 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        -[SUCoreMobileAsset maDelegate](v18, "maDelegate");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_opt_respondsToSelector();
        v60 = CFSTR("NO");
        if ((v59 & 1) != 0)
          v60 = CFSTR("YES");
        *(_DWORD *)buf = 138543362;
        v81 = v60;
        _os_log_impl(&dword_1DDFDD000, v57, OS_LOG_TYPE_DEFAULT, "[MA] operating with delegate: respondsToSelector(maAssetRemoved) %{public}@", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "oslog");
      v62 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        -[SUCoreMobileAsset maDelegate](v18, "maDelegate");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_opt_respondsToSelector();
        v65 = CFSTR("NO");
        if ((v64 & 1) != 0)
          v65 = CFSTR("YES");
        *(_DWORD *)buf = 138543362;
        v81 = v65;
        _os_log_impl(&dword_1DDFDD000, v62, OS_LOG_TYPE_DEFAULT, "[MA] operating with delegate: respondsToSelector(maAssetRemoveFailed:) %{public}@", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "oslog");
      v36 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        -[SUCoreMobileAsset maDelegate](v18, "maDelegate");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = objc_opt_respondsToSelector();
        v69 = CFSTR("NO");
        if ((v68 & 1) != 0)
          v69 = CFSTR("YES");
        *(_DWORD *)buf = 138543362;
        v81 = v69;
        _os_log_impl(&dword_1DDFDD000, v36, OS_LOG_TYPE_DEFAULT, "[MA] operating with delegate: respondsToSelector(maAnomaly:) %{public}@", buf, 0xCu);

      }
    }
    else if (v37)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDFDD000, v36, OS_LOG_TYPE_DEFAULT, "[MA] operating without delegate", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "selectDelegateCallbackQueue:", v15);
    v73 = objc_claimAutoreleasedReturnValue();
    clientDelegateCallbackQueue = v18->_clientDelegateCallbackQueue;
    v18->_clientDelegateCallbackQueue = (OS_dispatch_queue *)v73;

    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "selectCompletionQueue:", v16);
    v76 = objc_claimAutoreleasedReturnValue();
    clientCompletionQueue = v18->_clientCompletionQueue;
    v18->_clientCompletionQueue = (OS_dispatch_queue *)v76;

    +[SUCoreMobileAsset mapMobileAssetErrorIndications](SUCoreMobileAsset, "mapMobileAssetErrorIndications");
    goto LABEL_36;
  }
  objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "trackError:forReason:withResult:withError:", CFSTR("[MA]"), CFSTR("unable to create MA control dispatch queue"), 8100, 0);

  v71 = 0;
LABEL_37:

  return v71;
}

+ (void)mapMobileAssetErrorIndications
{
  if (mapMobileAssetErrorIndications_mobileAssetErrorInfoOnce != -1)
    dispatch_once(&mapMobileAssetErrorIndications_mobileAssetErrorInfoOnce, &__block_literal_global_8);
}

void __51__SUCoreMobileAsset_mapMobileAssetErrorIndications__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[6];
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("checkSpaceNeeded");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 4);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v0;
  v7[1] = CFSTR("checkNetwork");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v1;
  v7[2] = CFSTR("checkTimeoutConditions");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v2;
  v7[3] = CFSTR("pallasNoPMVMatchFound");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v3;
  v7[4] = CFSTR("pallasNoBuildVersionMatchFound");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 64);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[4] = v4;
  v7[5] = CFSTR("timeoutWithDetail");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 128);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[5] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8940], "associateLayer:withDomain:keyMatchTrueMap:", 411, CFSTR("com.apple.MobileAssetError.Download"), v6);
  objc_msgSend(MEMORY[0x1E0DA8940], "associateLayer:withDomain:keyMatchTrueMap:", 412, CFSTR("com.apple.MobileAssetError.Query"), v6);
  objc_msgSend(MEMORY[0x1E0DA8940], "associateLayer:withDomain:keyMatchTrueMap:", 413, CFSTR("com.apple.MobileAssetError.Purge"), v6);
  objc_msgSend(MEMORY[0x1E0DA8940], "associateLayer:withDomain:keyMatchTrueMap:", 414, CFSTR("com.apple.MobileAssetError.Xpc"), v6);
  objc_msgSend(MEMORY[0x1E0DA8940], "associateLayer:withDomain:indicating:ifKeyTrue:", 411, CFSTR("com.apple.MobileAssetError.Download"), 32, CFSTR("pallasNoPMVMatchFound"));
  objc_msgSend(MEMORY[0x1E0DA8940], "associateLayer:withDomain:indicating:ifKeyTrue:", 411, CFSTR("com.apple.MobileAssetError.Download"), 128, CFSTR("timeoutWithDetail"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 1, CFSTR("MADownloadXpcError"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 2, CFSTR("MADownloadConnectionInterrupted"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 3, CFSTR("MADownloadFailed"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 4, CFSTR("MADownloadStagingFailed"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 5, CFSTR("MADownloadMetaDataProcessFailed"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 6, CFSTR("MADownloadUnzipFailed"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 7, CFSTR("MADownloadMoveFailed"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 8, CFSTR("MADownloadInstallFailed"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 9, CFSTR("MADownloadDaemonExit"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 10, CFSTR("MADownloadAssetAlreadyInstalled"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 11, CFSTR("MADownloadInvalidSZExtractor"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 12, CFSTR("MADownloadNotEntitled"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 13, CFSTR("MADownloadDaemonNotReady"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 14, CFSTR("MADownloadNoChange"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 15, CFSTR("MADownloadNotApplicableForRequireByOs"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 16, CFSTR("MADownloadNoExtractorFailure"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 17, CFSTR("MADownloadTransformFailure"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:indicating:", CFSTR("com.apple.MobileAssetError.Download"), 18, CFSTR("MADownloadNoMatchFound"), 32);
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 19, CFSTR("MADownloadNilAssetType"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 20, CFSTR("MADownloadNilAssetId"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 21, CFSTR("MADownloadStreamingZipNotSupported"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 22, CFSTR("MADownloadBadOptions"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 23, CFSTR("MADownloadAssetBadMetaData"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 24, CFSTR("MADownloadUnableToCreateMessage"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 25, CFSTR("MADownloadFailedNoStandardUrl"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 26, CFSTR("MADownloadFailedNoFallBackUrl"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 27, CFSTR("MADownloadFailedNoPallasUrl"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 28, CFSTR("MADownloadLostTask"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 29, CFSTR("MADownloadNotApplicableForInstalledWithOs"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 30, CFSTR("MADownloadNoValidSession"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 31, CFSTR("MADownloadResponseDeferred"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 32, CFSTR("MADownloadIncomplete"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 33, CFSTR("MADownloadNoStagingDir"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 34, CFSTR("MADownloadsNotAllowed"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 35, CFSTR("MADownloadUnknownResult"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 36, CFSTR("MADownloadAssetNoLongerInCatalog"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 37, CFSTR("MADownloadNoSpaceLeft"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 38, CFSTR("MADownloadCouldNotReplace"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 39, CFSTR("MADownloadMalformedAssetType"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 40, CFSTR("MADownloadServerBadRequest"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 41, CFSTR("MADownloadServerAuthFailure"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 42, CFSTR("MADownloadServerError"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 43, CFSTR("MADownloadNotFoundOrDenied"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 44, CFSTR("MADownloadNotFound"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 45, CFSTR("MADownloadServerInternalError"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 46, CFSTR("MADownloadMalformedAssetData"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 47, CFSTR("MADownloadNetworkingError"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 48, CFSTR("MADownloadCancelled"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 49, CFSTR("MADownloadBadUrl"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 50, CFSTR("MADownloadBadServerResponse"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 51, CFSTR("MADownloadTimedOut"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 52, CFSTR("MADownloadTimedOutRequest"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 53, CFSTR("MADownloadTimedOutResource"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 54, CFSTR("MADownloadTimedOutWatchdog"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 55, CFSTR("MADownloadTimedOutStart"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 56, CFSTR("MADownloadTimedOutConnection"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 80, CFSTR("MADownloadTimedOutNoContent"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 81, CFSTR("MADownloadTimedOutBecameStalled"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 82, CFSTR("MADownloadTimedOutSlowDownload"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 83, CFSTR("MADownloadTimedOutFrequentStalls"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 57, CFSTR("MADownloadCannotLoadFromNetwork"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 58, CFSTR("MADownloadUnsupportedURL"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 59, CFSTR("MADownloadCannotFindHost"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 60, CFSTR("MADownloadCannotConnectToHost"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 61, CFSTR("MADownloadNetworkConnectionLost"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 62, CFSTR("MADownloadDNSLookupFailed"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 63, CFSTR("MADownloadHTTPTooManyRedirects"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 64, CFSTR("MADownloadResourceUnavailable"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 65, CFSTR("MADownloadNotConnectedToInternet"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 66, CFSTR("MADownloadRedirectToNonExistentLocation"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 67, CFSTR("MADownloadInternationalRoamingOff"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 68, CFSTR("MADownloadCallIsActive"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 69, CFSTR("MADownloadDataNotAllowed"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 70, CFSTR("MADownloadSecureConnectionFailed"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 71, CFSTR("MADownloadInvalidReceipts"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 72, CFSTR("MADownloadFailedNoFallbackAllowed"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 73, CFSTR("MADownloadLiveServerDisabledNoFallback"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Download"), 74, CFSTR("MADownloadMalformedPurpose"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Query"), 1, CFSTR("MAQueryXpcError"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Query"), 2, CFSTR("MAQueryCatalogNotDownloaded"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Query"), 3, CFSTR("MAQueryFailed"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Query"), 4, CFSTR("MAQueryDaemonExit"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Query"), 5, CFSTR("MAQueryNotEntitled"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Query"), 6, CFSTR("MAQueryCannotCreateMessage"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Query"), 7, CFSTR("MAQueryNilAssetType"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Query"), 8, CFSTR("MAQueryParamsEncodeFailure"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Query"), 9, CFSTR("MAQueryBeforeFirstUnlock"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Query"), 10, CFSTR("MAQueryCouldNotEncodeResults"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Query"), 11, CFSTR("MAQueryXpcLengthError"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Query"), 12, CFSTR("MAQueryUnknownResult"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Query"), 13, CFSTR("MAQueryTooManyResults"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Query"), 14, CFSTR("MAQueryHasAllowedDifferences"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Purge"), 1, CFSTR("MAPurgeXpcError"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Purge"), 2, CFSTR("MAPurgeConnectionInterrupted"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Purge"), 3, CFSTR("MAPurgeAssetDidntExist"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Purge"), 4, CFSTR("MAPurgeAssetCouldntPurge"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Purge"), 5, CFSTR("MAPurgeFailed"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Purge"), 6, CFSTR("MAPurgeNotEntitled"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Purge"), 7, CFSTR("MAPurgeNotApplicableForRequireByOs"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Purge"), 8, CFSTR("MAPurgeCouldNotCancelAllDownloads"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Purge"), 9, CFSTR("MAPurgeCannotCreateMessage"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Purge"), 10, CFSTR("MAPurgeEncodingFailure"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Purge"), 11, CFSTR("MAPurgeFailedBeforeFirstUnlock"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Xpc"), 1, CFSTR("MAXpcErrorParamMissing"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Xpc"), 2, CFSTR("MAXpcErrorLengthZero"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Xpc"), 3, CFSTR("MAXpcErrorLengthMissing"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Xpc"), 4, CFSTR("MAXpcErrorLengthMismatch"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Xpc"), 5, CFSTR("MAXpcErrorDataMismatch"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Xpc"), 6, CFSTR("MAXpcErrorEmptyData"));
  objc_msgSend(MEMORY[0x1E0DA8940], "attributesOfErrorForDomain:withCode:codeName:", CFSTR("com.apple.MobileAssetError.Xpc"), 7, CFSTR("MAXpcErrorConnectionTerminated"));

}

- (void)downloadSoftwareUpdateAssetWithPolicy:(id)a3 withUUID:(id)a4
{
  -[SUCoreMobileAsset downloadSoftwareUpdateAssetWithPolicy:withUUID:completion:](self, "downloadSoftwareUpdateAssetWithPolicy:withUUID:completion:", a3, a4, 0);
}

- (void)downloadSoftwareUpdateAssetWithPolicy:(id)a3 withUUID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  objc_msgSend(a3, "constructMASoftwareUpdateAssetDownloadOptionsWithUUID:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SUCoreMobileAsset _downloadAssetWithOptions:completion:](self, "_downloadAssetWithOptions:completion:", v9, v8);

}

- (void)downloadDocumentationAssetWithPolicy:(id)a3 withUUID:(id)a4
{
  -[SUCoreMobileAsset downloadDocumentationAssetWithPolicy:withUUID:stashingDocumentationForBuild:completion:](self, "downloadDocumentationAssetWithPolicy:withUUID:stashingDocumentationForBuild:completion:", a3, a4, 0, 0);
}

- (void)downloadDocumentationAssetWithPolicy:(id)a3 withUUID:(id)a4 completion:(id)a5
{
  -[SUCoreMobileAsset downloadDocumentationAssetWithPolicy:withUUID:stashingDocumentationForBuild:completion:](self, "downloadDocumentationAssetWithPolicy:withUUID:stashingDocumentationForBuild:completion:", a3, a4, 0, a5);
}

- (void)downloadDocumentationAssetWithPolicy:(id)a3 withUUID:(id)a4 stashingDocumentationForBuild:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;

  v10 = a6;
  v11 = a5;
  objc_msgSend(a3, "constructMADocumentationAssetDownloadOptionsWithUUID:", a4);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[SUCoreMobileAsset _downloadAssetWithOptions:stashingDocumentationForBuild:completion:](self, "_downloadAssetWithOptions:stashingDocumentationForBuild:completion:", v12, v11, v10);

}

- (void)alterDownloadOptions:(id)a3
{
  -[SUCoreMobileAsset alterDownloadOptions:completion:](self, "alterDownloadOptions:completion:", a3, 0);
}

- (void)alterDownloadOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("ma.AlterDownloadOptions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMobileAsset maControlQueue](self, "maControlQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke;
  v13[3] = &unk_1EA8788C8;
  v13[4] = self;
  v14 = v8;
  v15 = v6;
  v16 = v7;
  v10 = v6;
  v11 = v8;
  v12 = v7;
  dispatch_async(v9, v13);

}

void __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  __CFString *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  const char *v33;
  void *v34;
  id v35;
  void *v36;
  _BOOL4 v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  _QWORD v44[4];
  const __CFString *v45;
  id v46;
  id v47;
  _QWORD v48[4];
  const __CFString *v49;
  id v50;
  id v51;
  _QWORD block[4];
  const __CFString *v53;
  id v54;
  id v55;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "alterDownloadCompletion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "oslog");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_cold_3();

    if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 32), "clientCompletionQueue");
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_689;
      block[3] = &unk_1EA878968;
      v53 = CFSTR("alter download config when already altering with completion - cannot accept additional alteration request");
      v55 = *(id *)(a1 + 56);
      v54 = *(id *)(a1 + 40);
      dispatch_async(v6, block);

      v7 = (__CFString *)v53;
LABEL_18:

      return;
    }
    goto LABEL_19;
  }
  if (objc_msgSend(*v2, "removingAsset"))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "oslog");
    v9 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_cold_1();

    if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 32), "clientCompletionQueue");
      v10 = objc_claimAutoreleasedReturnValue();
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_692;
      v48[3] = &unk_1EA878968;
      v49 = CFSTR("alter download config when removing asset - alteration of configuration ignored");
      v51 = *(id *)(a1 + 56);
      v50 = *(id *)(a1 + 40);
      dispatch_async(v10, v48);

      v7 = (__CFString *)v49;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if (!objc_msgSend(*v2, "downloadingAsset"))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_cold_2();

    if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 32), "clientCompletionQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_697;
      v44[3] = &unk_1EA878968;
      v45 = CFSTR("alter download config when not downloading - alteration of configuration ignored");
      v47 = *(id *)(a1 + 56);
      v46 = *(id *)(a1 + 40);
      dispatch_async(v13, v44);

      v7 = (__CFString *)v45;
      goto LABEL_18;
    }
LABEL_19:
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("ma.AlterDownloadOptions"));
    return;
  }
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "setAlterDownloadCompletion:");
    objc_msgSend(*(id *)(a1 + 32), "setAlterDownloadTransaction:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("ma.AlterDownloadOptions"));
  }
  objc_msgSend(*v2, "desiredDownloadConfig");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(*(id *)(a1 + 32), "requestedDownloadConfig");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = *(_QWORD *)(a1 + 48);
    v25 = *(void **)(a1 + 32);
    if (!v23)
    {
      objc_msgSend(v25, "currentDownloadConfig");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = +[SUCoreMobileAsset downloadConfig:isEqualToConfig:](SUCoreMobileAsset, "downloadConfig:isEqualToConfig:", v24, v36);

      if (v37)
      {
        v38 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(*v2, "currentDownloadConfig");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        +[SUCoreMobileAsset downloadConfigSummary:](SUCoreMobileAsset, "downloadConfigSummary:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (id)objc_msgSend(v38, "initWithFormat:", CFSTR("alter download config when currently at expressed config (%@)"), v40);

        objc_msgSend(*v2, "_issueAlterDownloadCompletion:forReason:", 0, v43);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "_requestChangeConfigDownload:", *(_QWORD *)(a1 + 48));
      }
      return;
    }
    objc_msgSend(v25, "requestedDownloadConfig");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = +[SUCoreMobileAsset downloadConfig:isEqualToConfig:](SUCoreMobileAsset, "downloadConfig:isEqualToConfig:", v24, v26);

    if (v27)
    {
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "oslog");
      v29 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = *v2;
        objc_msgSend(v30, "requestedDownloadConfig");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[SUCoreMobileAsset downloadConfigSummary:](SUCoreMobileAsset, "downloadConfigSummary:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v57 = v30;
        v58 = 2114;
        v59 = v32;
        v33 = "%{public}@ alter download config to same as being requested (%{public}@)";
LABEL_36:
        _os_log_impl(&dword_1DDFDD000, v29, OS_LOG_TYPE_DEFAULT, v33, buf, 0x16u);

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setDesiredDownloadConfig:", *(_QWORD *)(a1 + 48));
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "oslog");
      v29 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v42 = *v2;
        objc_msgSend(v42, "desiredDownloadConfig");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[SUCoreMobileAsset downloadConfigSummary:](SUCoreMobileAsset, "downloadConfigSummary:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v57 = v42;
        v58 = 2114;
        v59 = v32;
        v33 = "%{public}@ alter download config to different than being requested | remembering desired (%{public}@)";
        goto LABEL_36;
      }
    }
LABEL_37:

    return;
  }
  v15 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "requestedDownloadConfig");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = +[SUCoreMobileAsset downloadConfig:isEqualToConfig:](SUCoreMobileAsset, "downloadConfig:isEqualToConfig:", v15, v16);

  if (!v17)
  {
    objc_msgSend(*(id *)(a1 + 32), "setDesiredDownloadConfig:", *(_QWORD *)(a1 + 48));
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "oslog");
    v29 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v35 = *v2;
      objc_msgSend(v35, "desiredDownloadConfig");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[SUCoreMobileAsset downloadConfigSummary:](SUCoreMobileAsset, "downloadConfigSummary:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v57 = v35;
      v58 = 2114;
      v59 = v32;
      v33 = "%{public}@ alter download config to different than requested | replacing earlier desire to alter with latest"
            " desired (%{public}@)";
      goto LABEL_36;
    }
    goto LABEL_37;
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "oslog");
  v19 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = *v2;
    objc_msgSend(*v2, "requestedDownloadConfig");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCoreMobileAsset downloadConfigSummary:](SUCoreMobileAsset, "downloadConfigSummary:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v57 = v20;
    v58 = 2114;
    v59 = v22;
    _os_log_impl(&dword_1DDFDD000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ alter download config to same as being requested (%{public}@) | dropping earlier desire to alter", buf, 0x16u);

  }
  objc_msgSend(*v2, "setDesiredDownloadConfig:", 0);
}

void __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_689(_QWORD *a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buildError:underlying:description:", 8703, 0, a1[4]);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(a1[6] + 16))();
  objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", a1[5], CFSTR("ma.AlterDownloadOptions"));

}

void __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_692(_QWORD *a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buildError:underlying:description:", 8703, 0, a1[4]);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(a1[6] + 16))();
  objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", a1[5], CFSTR("ma.AlterDownloadOptions"));

}

void __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_697(_QWORD *a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buildError:underlying:description:", 8703, 0, a1[4]);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(a1[6] + 16))();
  objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", a1[5], CFSTR("ma.AlterDownloadOptions"));

}

- (void)downloadConfigStatus:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("ma.DownloadConfigStatus.Completion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMobileAsset maControlQueue](self, "maControlQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SUCoreMobileAsset_downloadConfigStatus___block_invoke;
  block[3] = &unk_1EA878968;
  v10 = v5;
  v11 = v4;
  block[4] = self;
  v7 = v5;
  v8 = v4;
  dispatch_async(v6, block);

}

void __42__SUCoreMobileAsset_downloadConfigStatus___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  if (objc_msgSend(a1[4], "downloadingAsset") && (objc_msgSend(a1[4], "removingAsset") & 1) == 0)
  {
    objc_msgSend(a1[4], "currentDownloadConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCoreMobileAsset downloadConfigCopy:](SUCoreMobileAsset, "downloadConfigCopy:", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[4], "requestedDownloadConfig");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCoreMobileAsset downloadConfigCopy:](SUCoreMobileAsset, "downloadConfigCopy:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[4], "desiredDownloadConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCoreMobileAsset downloadConfigCopy:](SUCoreMobileAsset, "downloadConfigCopy:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1[4], "currentDownloadConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCoreMobileAsset downloadConfigCopy:](SUCoreMobileAsset, "downloadConfigCopy:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 0;
    v5 = 0;
  }

  v8 = a1[4];
  if (a1[6])
  {
    objc_msgSend(v8, "clientCompletionQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __42__SUCoreMobileAsset_downloadConfigStatus___block_invoke_2;
    v10[3] = &unk_1EA878990;
    v16 = a1[6];
    v11 = v3;
    v12 = v4;
    v13 = v5;
    v14 = 0;
    v15 = a1[5];
    dispatch_async(v9, v10);

  }
  else
  {
    objc_msgSend(v8, "_trackMAAnomaly:result:description:", CFSTR("CONFIG"), 8101, CFSTR("download config status requested with no completion provided"));
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", a1[5], CFSTR("ma.DownloadConfigStatus.Completion"));
  }

}

uint64_t __42__SUCoreMobileAsset_downloadConfigStatus___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 64), CFSTR("ma.DownloadConfigStatus.Completion"));
}

- (void)removeAsset
{
  -[SUCoreMobileAsset removeAsset:](self, "removeAsset:", 0);
}

- (void)removeAsset:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("ma.RemoveAsset"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMobileAsset maControlQueue](self, "maControlQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SUCoreMobileAsset_removeAsset___block_invoke;
  block[3] = &unk_1EA878968;
  v10 = v5;
  v11 = v4;
  block[4] = self;
  v7 = v5;
  v8 = v4;
  dispatch_async(v6, block);

}

uint64_t __33__SUCoreMobileAsset_removeAsset___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  if (objc_msgSend(*(id *)(a1 + 32), "removingAsset"))
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "buildError:underlying:description:", 8115, 0, CFSTR("remove requested when already removing"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_reportAnomaly:issuingCompletion:", v4, *(_QWORD *)(a1 + 48));

    return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("ma.RemoveAsset"));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setRemoveAssetTransaction:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "setRemoveCompletion:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "setRemovingAsset:", 1);
    objc_msgSend(*(id *)(a1 + 32), "setAssetDownloaded:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setAssetRemoved:", 0);
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(*(id *)(a1 + 32), "_updateAssetTypeName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "updateUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("[MA-REMOVE:%@(%@)]"), v7, v8);
    objc_msgSend(*(id *)(a1 + 32), "setOperationName:", v9);

    return objc_msgSend(*(id *)(a1 + 32), "_cancelDownloadAndPurge");
  }
}

- (void)_downloadAssetWithOptions:(id)a3 completion:(id)a4
{
  -[SUCoreMobileAsset _downloadAssetWithOptions:stashingDocumentationForBuild:completion:](self, "_downloadAssetWithOptions:stashingDocumentationForBuild:completion:", a3, 0, a4);
}

- (void)_downloadAssetWithOptions:(id)a3 stashingDocumentationForBuild:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("ma.DownloadAsset"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMobileAsset maControlQueue](self, "maControlQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__SUCoreMobileAsset__downloadAssetWithOptions_stashingDocumentationForBuild_completion___block_invoke;
  block[3] = &unk_1EA8788F0;
  v20 = v9;
  v21 = v10;
  block[4] = self;
  v18 = v11;
  v19 = v8;
  v13 = v9;
  v14 = v8;
  v15 = v11;
  v16 = v10;
  dispatch_async(v12, block);

}

void __88__SUCoreMobileAsset__downloadAssetWithOptions_stashingDocumentationForBuild_completion___block_invoke(uint64_t a1)
{
  id v2;
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  __CFString *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "downloadingAsset") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "removingAsset"))
  {
    v2 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (objc_msgSend(*(id *)(a1 + 32), "downloadingAsset"))
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    if (objc_msgSend(*(id *)(a1 + 32), "removingAsset"))
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    v36 = (id)objc_msgSend(v2, "initWithFormat:", CFSTR("download requested when busy performing other MA operation (downloading=%@, removing=%@)"), v3, v4);
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "buildError:underlying:description:", 8115, 0, v36);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_reportAnomaly:issuingCompletion:", v7, *(_QWORD *)(a1 + 64));

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("ma.DownloadAsset"));
    return;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "assetDownloaded"))
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "buildError:underlying:description:", 8115, 0, CFSTR("download requested when asset was already downloaded"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_reportAnomaly:issuingCompletion:", v10, *(_QWORD *)(a1 + 64));

    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("ma.DownloadAsset"));
    return;
  }
  objc_msgSend(*(id *)(a1 + 32), "setDownloadAssetTransaction:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "currentDownloadConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11
    || (objc_msgSend(*(id *)(a1 + 32), "requestedDownloadConfig"),
        (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_15:
    v12 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(*(id *)(a1 + 32), "currentDownloadConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "currentDownloadConfig");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = CFSTR("NONE");
    }
    objc_msgSend(*(id *)(a1 + 32), "requestedDownloadConfig");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 32), "requestedDownloadConfig");
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = CFSTR("NONE");
    }
    objc_msgSend(*(id *)(a1 + 32), "desiredDownloadConfig");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(*(id *)(a1 + 32), "desiredDownloadConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("starting to download asset with stale download config, current=%@, requested=%@, desired=%@"), v14, v16, v18);

    }
    else
    {
      v19 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("starting to download asset with stale download config, current=%@, requested=%@, desired=%@"), v14, v16, CFSTR("NONE"));
    }

    if (v15)
    if (v13)

    v20 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "buildError:underlying:description:", 8111, 0, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_reportAnomaly:issuingCompletion:", v22, 0);

    objc_msgSend(*(id *)(a1 + 32), "setCurrentDownloadConfig:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setRequestedDownloadConfig:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setDesiredDownloadConfig:", 0);

    goto LABEL_29;
  }
  objc_msgSend(*(id *)(a1 + 32), "desiredDownloadConfig");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
    goto LABEL_15;
LABEL_29:
  objc_msgSend(*(id *)(a1 + 32), "setDownloadOptions:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setDocumentationStashBuild:", *(_QWORD *)(a1 + 56));
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "oslog");
  v24 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = *(_QWORD *)(a1 + 56);
    *(_DWORD *)buf = 138412290;
    v38 = v25;
    _os_log_impl(&dword_1DDFDD000, v24, OS_LOG_TYPE_DEFAULT, "Setting stashDocumentationBuild=%@", buf, 0xCu);
  }

  v26 = objc_alloc_init(MEMORY[0x1E0D4E080]);
  objc_msgSend(*(id *)(a1 + 32), "setCurrentDownloadConfig:", v26);

  objc_msgSend(*(id *)(a1 + 32), "downloadOptions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(*(id *)(a1 + 32), "downloadOptions");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "discretionary");
    objc_msgSend(*(id *)(a1 + 32), "currentDownloadConfig");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setDiscretionary:", v29);

  }
  objc_msgSend(*(id *)(a1 + 32), "setDownloadCompletion:", *(_QWORD *)(a1 + 64));
  v31 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "_updateAssetTypeName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "updateUUID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v31, "initWithFormat:", CFSTR("[MA-DOWNLOAD:%@(%@)]"), v32, v33);
  objc_msgSend(*(id *)(a1 + 32), "setOperationName:", v34);

  objc_msgSend(*(id *)(a1 + 32), "setDownloadingAsset:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setAssetDownloaded:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setAssetRemoved:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_registerProgressAndStartDownload");
}

- (void)_registerProgressAndStartDownload
{
  OUTLINED_FUNCTION_1_1(&dword_1DDFDD000, a2, a3, "%{public}@ download options unexpectedly MADownloadOptions when expecting MAMsuDownloadOptions", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __54__SUCoreMobileAsset__registerProgressAndStartDownload__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "maControlQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__SUCoreMobileAsset__registerProgressAndStartDownload__block_invoke_2;
  v6[3] = &unk_1EA878A88;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

void __54__SUCoreMobileAsset__registerProgressAndStartDownload__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  float v8;
  float v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "removingAsset") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "assetRemoved"))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "oslog");
    v3 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(void **)(a1 + 32);
      if (objc_msgSend(v4, "removingAsset"))
        v5 = CFSTR("YES");
      else
        v5 = CFSTR("NO");
      v6 = objc_msgSend(*(id *)(a1 + 32), "assetRemoved");
      *(_DWORD *)buf = 138543874;
      if (v6)
        v7 = CFSTR("YES");
      else
        v7 = CFSTR("NO");
      v22 = v4;
      v23 = 2114;
      v24 = v5;
      v25 = 2114;
      v26 = v7;
      _os_log_impl(&dword_1DDFDD000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ download progress when removing(%{public}@), removed(%{public}@) - progress report ignored", buf, 0x20u);
    }

  }
  else if (objc_msgSend(*(id *)(a1 + 32), "downloadingAsset"))
  {
    v8 = 0.0;
    if (objc_msgSend(*(id *)(a1 + 40), "totalWritten") >= 1 && objc_msgSend(*(id *)(a1 + 40), "totalExpected"))
    {
      v9 = (float)objc_msgSend(*(id *)(a1 + 40), "totalWritten");
      v8 = v9 / (float)objc_msgSend(*(id *)(a1 + 40), "totalExpected");
    }
    v10 = objc_alloc(MEMORY[0x1E0DA8978]);
    v11 = *MEMORY[0x1E0DA8BA8];
    v12 = objc_msgSend(*(id *)(a1 + 40), "isStalled");
    v13 = objc_msgSend(*(id *)(a1 + 40), "totalWritten");
    v14 = objc_msgSend(*(id *)(a1 + 40), "totalExpected");
    objc_msgSend(*(id *)(a1 + 40), "expectedTimeRemaining");
    v16 = v15;
    objc_msgSend(*(id *)(a1 + 40), "taskDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v18 = v8;
    v20 = (id)objc_msgSend(v10, "initWithPhase:isStalled:portionComplete:totalWrittenBytes:totalExpectedBytes:remaining:taskDescription:", v11, v12, v13, v14, v17, v18, v16);

    v19 = *(void **)(a1 + 32);
    if (v20)
      objc_msgSend(v19, "_reportDownloadProgress:");
    else
      objc_msgSend(v19, "_trackMAAnomaly:result:description:", CFSTR("PROGRESS"), 8100, CFSTR("unable to create progress report"));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_trackMAAnomaly:result:description:", CFSTR("PROGRESS"), 8115, CFSTR("progress indication when not downloading (and not removing)"));
  }
}

void __54__SUCoreMobileAsset__registerProgressAndStartDownload__block_invoke_732(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD block[5];
  id v10;
  uint64_t v11;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_trackMobileAssetEnd:withResult:withError:", CFSTR("startDownload"), a2, v5);
  objc_msgSend(*(id *)(a1 + 32), "maControlQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SUCoreMobileAsset__registerProgressAndStartDownload__block_invoke_2_733;
  block[3] = &unk_1EA879B50;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = a2;
  block[4] = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

void __54__SUCoreMobileAsset__registerProgressAndStartDownload__block_invoke_2_733(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  void *v6;
  id v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v2 = objc_msgSend(*(id *)(a1 + 32), "downloadingAsset");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "setDownloadingAsset:", 0);
    v4 = *(_QWORD *)(a1 + 48);
    if (v4 == 10 || v4 == 0)
    {
      v6 = *(void **)(a1 + 32);
      v7 = objc_alloc(MEMORY[0x1E0DA8978]);
      LODWORD(v8) = 1.0;
      v9 = (void *)objc_msgSend(v7, "initWithPhase:isStalled:portionComplete:totalWrittenBytes:totalExpectedBytes:remaining:", *MEMORY[0x1E0DA8BA8], 0, -1, -1, v8, 0.0);
      objc_msgSend(v6, "_reportDownloaded:", v9);

      if ((objc_msgSend(*(id *)(a1 + 32), "removingAsset") & 1) == 0)
        objc_msgSend(*(id *)(a1 + 32), "setAssetDownloaded:", 1);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "buildError:underlying:description:", 8700, *(_QWORD *)(a1 + 40), CFSTR("failed to download asset"));
      v11 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "_reportDownloadFailed:", v11);
    }
  }
  else
  {
    objc_msgSend(v3, "_trackMAAnomaly:result:description:", CFSTR("DOWNLOAD"), 8115, CFSTR("download finished when not downloading"));
  }
}

- (void)_requestChangeConfigDownload:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;

  v4 = a3;
  -[SUCoreMobileAsset maControlQueue](self, "maControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMobileAsset asset](self, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SUCoreMobileAsset setRequestedDownloadConfig:](self, "setRequestedDownloadConfig:", v4);
    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCoreMobileAsset operationName](self, "operationName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCoreMobileAsset downloadConfigSummary:](SUCoreMobileAsset, "downloadConfigSummary:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("%@ [requesting (%@)]"), v8, v9);

    -[SUCoreMobileAsset _trackMobileAssetBegin:withIdentifier:](self, "_trackMobileAssetBegin:withIdentifier:", CFSTR("configDownload"), v10);
    -[SUCoreMobileAsset asset](self, "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __50__SUCoreMobileAsset__requestChangeConfigDownload___block_invoke;
    v21[3] = &unk_1EA879BF0;
    v21[4] = self;
    v22 = v10;
    v12 = v10;
    objc_msgSend(v11, "SUCoreBorder_configDownload:completion:", v4, v21);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "oslog");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SUCoreMobileAsset _requestChangeConfigDownload:].cold.1((uint64_t)self, v14, v15, v16, v17, v18, v19, v20);

    -[SUCoreMobileAsset setRequestedDownloadConfig:](self, "setRequestedDownloadConfig:", 0);
    -[SUCoreMobileAsset setDesiredDownloadConfig:](self, "setDesiredDownloadConfig:", 0);
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("alter download config failed - unable to change download config (self.asset is not present)"));
    -[SUCoreMobileAsset _issueAlterDownloadCompletion:forReason:](self, "_issueAlterDownloadCompletion:forReason:", 8703, v12);
  }

}

void __50__SUCoreMobileAsset__requestChangeConfigDownload___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _QWORD v5[6];

  objc_msgSend(*(id *)(a1 + 32), "_trackMobileAssetEnd:withIdentifier:withResult:withError:", CFSTR("configDownload"), *(_QWORD *)(a1 + 40), a2, 0);
  objc_msgSend(*(id *)(a1 + 32), "maControlQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__SUCoreMobileAsset__requestChangeConfigDownload___block_invoke_2;
  v5[3] = &unk_1EA879BC8;
  v5[4] = *(_QWORD *)(a1 + 32);
  v5[5] = a2;
  dispatch_async(v4, v5);

}

void __50__SUCoreMobileAsset__requestChangeConfigDownload___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 40);
  if (v2 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "alterDownloadCompletion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {

    }
    else if ((objc_msgSend(*(id *)(a1 + 32), "checkedDownloadState") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "setCheckedDownloadState:", 1);
      objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "waitedOperationQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __50__SUCoreMobileAsset__requestChangeConfigDownload___block_invoke_3;
      block[3] = &unk_1EA877EF8;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_async(v13, block);

      return;
    }
    v2 = *(_QWORD *)(a1 + 40);
  }
  v4 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v4, "setRequestedDownloadConfig:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setDesiredDownloadConfig:", 0);
    v5 = *(void **)(a1 + 32);
    v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("alter download config failed with result:%ld (MAOperationResult)"), *(_QWORD *)(a1 + 40));
    objc_msgSend(v5, "_issueAlterDownloadCompletion:forReason:", 8703, v14);
LABEL_8:

    return;
  }
  objc_msgSend(v4, "requestedDownloadConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v7, "requestedDownloadConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setCurrentDownloadConfig:", v8);

    objc_msgSend(*(id *)(a1 + 32), "setRequestedDownloadConfig:", 0);
    objc_msgSend(*(id *)(a1 + 32), "desiredDownloadConfig");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *(void **)(a1 + 32);
    if (v9)
    {
      objc_msgSend(v10, "desiredDownloadConfig");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setDesiredDownloadConfig:", 0);
      objc_msgSend(*(id *)(a1 + 32), "_requestChangeConfigDownload:", v14);
      goto LABEL_8;
    }
    v11 = CFSTR("successful config and no later desired config");
  }
  else
  {
    objc_msgSend(v7, "_trackMAAnomaly:result:description:", CFSTR("CONFIG"), 8101, CFSTR("successful config change when no change requested"));
    objc_msgSend(*(id *)(a1 + 32), "setDesiredDownloadConfig:", 0);
    v10 = *(void **)(a1 + 32);
    v11 = CFSTR("successful config change when no requested config");
  }
  objc_msgSend(v10, "_issueAlterDownloadCompletion:forReason:", 0, v11);
}

void __50__SUCoreMobileAsset__requestChangeConfigDownload___block_invoke_3(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  NSObject *v4;
  _QWORD v5[5];
  char v6;

  objc_msgSend(*(id *)(a1 + 32), "_trackMobileAssetBegin:", CFSTR("refreshState"));
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "SUCoreBorder_refreshState");

  objc_msgSend(*(id *)(a1 + 32), "_trackMobileAssetEnd:withResult:withError:", CFSTR("refreshState"), v3, 0);
  objc_msgSend(*(id *)(a1 + 32), "maControlQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__SUCoreMobileAsset__requestChangeConfigDownload___block_invoke_4;
  v5[3] = &unk_1EA879BA0;
  v6 = v3;
  v5[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v4, v5);

}

void __50__SUCoreMobileAsset__requestChangeConfigDownload___block_invoke_4(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  id v12;

  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  if (!v2)
  {
    objc_msgSend(v3, "setRequestedDownloadConfig:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setDesiredDownloadConfig:", 0);
    v9 = *(void **)(a1 + 32);
    v10 = CFSTR("alter download config failed to config and failed to refresh state");
    v11 = 8115;
    goto LABEL_6;
  }
  objc_msgSend(v3, "desiredDownloadConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "currentDownloadConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "desiredDownloadConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = +[SUCoreMobileAsset downloadConfig:isEqualToConfig:](SUCoreMobileAsset, "downloadConfig:isEqualToConfig:", v5, v6);

    v8 = *(void **)(a1 + 32);
    if (v7)
    {
      objc_msgSend(v8, "setRequestedDownloadConfig:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setDesiredDownloadConfig:", 0);
      v9 = *(void **)(a1 + 32);
      v10 = CFSTR("successfully refreshed state when desired config matches current config");
      v11 = 0;
LABEL_6:
      objc_msgSend(v9, "_issueAlterDownloadCompletion:forReason:", v11, v10);
      return;
    }
    objc_msgSend(v8, "desiredDownloadConfig");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setDesiredDownloadConfig:", 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "requestedDownloadConfig");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "setRequestedDownloadConfig:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_requestChangeConfigDownload:", v12);

}

- (void)_issueAlterDownloadCompletion:(int64_t)a3 forReason:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  SUCoreMobileAsset *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[SUCoreMobileAsset maControlQueue](self, "maControlQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "oslog");
  v9 = objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SUCoreMobileAsset _issueAlterDownloadCompletion:forReason:].cold.1();

    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject buildError:underlying:description:](v9, "buildError:underlying:description:", a3, 0, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreMobileAsset currentDownloadConfig](self, "currentDownloadConfig");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[SUCoreMobileAsset downloadConfigSummary:](SUCoreMobileAsset, "downloadConfigSummary:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = self;
      v25 = 2114;
      v26 = v12;
      v27 = 2114;
      v28 = v6;
      _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully altered download config (%{public}@) | %{public}@", buf, 0x20u);

    }
    v10 = 0;
  }

  -[SUCoreMobileAsset alterDownloadCompletion](self, "alterDownloadCompletion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SUCoreMobileAsset alterDownloadCompletion](self, "alterDownloadCompletion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMobileAsset alterDownloadTransaction](self, "alterDownloadTransaction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMobileAsset setAlterDownloadCompletion:](self, "setAlterDownloadCompletion:", 0);
    -[SUCoreMobileAsset setAlterDownloadTransaction:](self, "setAlterDownloadTransaction:", 0);
    -[SUCoreMobileAsset clientCompletionQueue](self, "clientCompletionQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__SUCoreMobileAsset__issueAlterDownloadCompletion_forReason___block_invoke;
    block[3] = &unk_1EA877E80;
    v22 = v14;
    v20 = v10;
    v21 = v15;
    v17 = v15;
    v18 = v14;
    dispatch_async(v16, block);

  }
}

uint64_t __61__SUCoreMobileAsset__issueAlterDownloadCompletion_forReason___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("ma.AlterDownloadOptions"));
}

- (void)_cancelDownloadAndPurge
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  -[SUCoreMobileAsset maControlQueue](self, "maControlQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMobileAsset asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUCoreMobileAsset _trackMobileAssetBegin:](self, "_trackMobileAssetBegin:", CFSTR("cancelDownload"));
    -[SUCoreMobileAsset asset](self, "asset");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __44__SUCoreMobileAsset__cancelDownloadAndPurge__block_invoke;
    v8[3] = &unk_1EA878850;
    v8[4] = self;
    objc_msgSend(v5, "SUCoreBorder_cancelDownload:", v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "buildError:underlying:description:", 8701, 0, CFSTR("failed to purge asset (self.asset is not present)"));
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[SUCoreMobileAsset _reportAssetRemoveFailed:](self, "_reportAssetRemoveFailed:", v7);
  }
}

void __44__SUCoreMobileAsset__cancelDownloadAndPurge__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1 + 32), "_trackMobileAssetEnd:withResult:withError:", CFSTR("cancelDownload"), a2, 0);
  objc_msgSend(*(id *)(a1 + 32), "_trackMobileAssetBegin:", CFSTR("purgeWithError"));
  objc_msgSend(*(id *)(a1 + 32), "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__SUCoreMobileAsset__cancelDownloadAndPurge__block_invoke_2;
  v4[3] = &unk_1EA879B78;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "SUCoreBorder_purgeWithError:", v4);

}

void __44__SUCoreMobileAsset__cancelDownloadAndPurge__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD block[5];
  id v10;
  uint64_t v11;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_trackMobileAssetEnd:withResult:withError:", CFSTR("purgeWithError"), a2, v5);
  objc_msgSend(*(id *)(a1 + 32), "maControlQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__SUCoreMobileAsset__cancelDownloadAndPurge__block_invoke_3;
  block[3] = &unk_1EA879B50;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = a2;
  block[4] = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __44__SUCoreMobileAsset__cancelDownloadAndPurge__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v5;
  void *v6;

  if (!objc_msgSend(*(id *)(a1 + 32), "removingAsset"))
    return objc_msgSend(*(id *)(a1 + 32), "_trackMAAnomaly:result:description:", CFSTR("CANCEL"), 8115, CFSTR("purge finished when not removing"));
  v2 = *(_QWORD *)(a1 + 48);
  if (v2 == 3 || v2 == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_reportAssetRemoved");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "buildError:underlying:description:", 8701, *(_QWORD *)(a1 + 40), CFSTR("failed to purge asset"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_reportAssetRemoveFailed:", v6);
  }
  objc_msgSend(*(id *)(a1 + 32), "setAssetRemoved:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "setRemovingAsset:", 0);
}

- (void)_reportDownloadProgress:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD block[5];
  id v19;
  uint8_t buf[4];
  SUCoreMobileAsset *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreMobileAsset maControlQueue](self, "maControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (!-[SUCoreMobileAsset removingAsset](self, "removingAsset")
    && !-[SUCoreMobileAsset assetRemoved](self, "assetRemoved"))
  {
    v6 = objc_msgSend(v4, "isStalled");
    -[SUCoreMobileAsset maDelegate](self, "maDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        -[SUCoreMobileAsset clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
        v9 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __45__SUCoreMobileAsset__reportDownloadProgress___block_invoke;
        block[3] = &unk_1EA878A88;
        block[4] = self;
        v19 = v4;
        dispatch_async(v9, block);

        v10 = v19;
LABEL_8:

        goto LABEL_12;
      }
    }
    else
    {
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) != 0)
      {
        -[SUCoreMobileAsset clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
        v12 = objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __45__SUCoreMobileAsset__reportDownloadProgress___block_invoke_2;
        v16[3] = &unk_1EA878A88;
        v16[4] = self;
        v17 = v4;
        dispatch_async(v12, v16);

        v10 = v17;
        goto LABEL_8;
      }
    }
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "oslog");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "summary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = self;
      v22 = 2114;
      v23 = v15;
      _os_log_impl(&dword_1DDFDD000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ download progress (not reported): progress=%{public}@", buf, 0x16u);

    }
  }
LABEL_12:

}

void __45__SUCoreMobileAsset__reportDownloadProgress___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "maDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maDownloadStalled:", *(_QWORD *)(a1 + 40));

}

void __45__SUCoreMobileAsset__reportDownloadProgress___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "maDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maDownloadProgress:", *(_QWORD *)(a1 + 40));

}

- (void)_reportDownloaded:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  SUCoreMobileAsset *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  char v22;
  void *v23;
  NSObject *v24;
  id v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  id v40;
  id v41;
  _QWORD block[5];
  id v43;
  id v44;
  id v45;
  uint8_t buf[4];
  SUCoreMobileAsset *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreMobileAsset maControlQueue](self, "maControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oslog");
  v7 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCoreMobileAsset documentationStashBuild](self, "documentationStashBuild");
    v8 = (SUCoreMobileAsset *)objc_claimAutoreleasedReturnValue();
    +[SUCoreDocumentationDataManager sharedManager](SUCoreDocumentationDataManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v47 = v8;
    v48 = 2112;
    v49 = v9;
    _os_log_impl(&dword_1DDFDD000, v7, OS_LOG_TYPE_DEFAULT, "Report downloaded, found stashDocumentationBuild=%@ sharedmanager:%@", buf, 0x16u);

  }
  -[SUCoreMobileAsset documentationStashBuild](self, "documentationStashBuild");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreMobileAsset documentationStashBuild](self, "documentationStashBuild");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v47 = self;
      v48 = 2114;
      v49 = v13;
      _os_log_impl(&dword_1DDFDD000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Stashing documentation asset for build: %{public}@", buf, 0x16u);

    }
    +[SUCoreDocumentationDataManager sharedManager](SUCoreDocumentationDataManager, "sharedManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMobileAsset asset](self, "asset");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMobileAsset documentationStashBuild](self, "documentationStashBuild");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0;
    v17 = objc_msgSend(v14, "stashDocumentationAssetData:forBuildVersion:error:", v15, v16, &v45);
    v18 = v45;

    if ((v17 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "oslog");
      v20 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[SUCoreMobileAsset _reportDownloaded:].cold.1();

    }
    -[SUCoreMobileAsset setDocumentationStashBuild:](self, "setDocumentationStashBuild:", 0);

  }
  if (-[SUCoreMobileAsset removingAsset](self, "removingAsset")
    || -[SUCoreMobileAsset assetRemoved](self, "assetRemoved")
    || (-[SUCoreMobileAsset maDelegate](self, "maDelegate"),
        v21 = (void *)objc_claimAutoreleasedReturnValue(),
        v22 = objc_opt_respondsToSelector(),
        v21,
        (v22 & 1) == 0))
  {
    v26 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("ma.DownloadAsset.Delegate"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMobileAsset clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v24 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__SUCoreMobileAsset__reportDownloaded___block_invoke;
    block[3] = &unk_1EA878940;
    block[4] = self;
    v43 = v4;
    v44 = v23;
    v25 = v23;
    dispatch_async(v24, block);

    v26 = 1;
  }
  -[SUCoreMobileAsset downloadCompletion](self, "downloadCompletion");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[SUCoreMobileAsset downloadCompletion](self, "downloadCompletion");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMobileAsset setDownloadCompletion:](self, "setDownloadCompletion:", 0);
    objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("ma.DownloadAsset.Completion"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMobileAsset clientCompletionQueue](self, "clientCompletionQueue");
    v30 = objc_claimAutoreleasedReturnValue();
    v36 = MEMORY[0x1E0C809B0];
    v37 = 3221225472;
    v38 = __39__SUCoreMobileAsset__reportDownloaded___block_invoke_2;
    v39 = &unk_1EA878088;
    v40 = v29;
    v41 = v28;
    v31 = v29;
    v32 = v28;
    dispatch_async(v30, &v36);

LABEL_18:
    goto LABEL_19;
  }
  if ((v26 & 1) != 0)
    goto LABEL_20;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "oslog");
  v32 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "summary");
    v31 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = self;
    v48 = 2114;
    v49 = v31;
    _os_log_impl(&dword_1DDFDD000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ downloaded (not reported): progress=%{public}@", buf, 0x16u);
    goto LABEL_18;
  }
LABEL_19:

LABEL_20:
  v33 = (void *)MEMORY[0x1E0DA8920];
  -[SUCoreMobileAsset downloadAssetTransaction](self, "downloadAssetTransaction", v36, v37, v38, v39);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "endTransaction:withName:", v34, CFSTR("ma.DownloadAsset"));

  -[SUCoreMobileAsset setDownloadAssetTransaction:](self, "setDownloadAssetTransaction:", 0);
}

uint64_t __39__SUCoreMobileAsset__reportDownloaded___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "maDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maDownloaded:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 48), CFSTR("ma.DownloadAsset.Delegate"));
}

uint64_t __39__SUCoreMobileAsset__reportDownloaded___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 32), CFSTR("ma.DownloadAsset.Completion"));
}

- (void)_reportDownloadFailed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  SUCoreMobileAsset *v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  id v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  id v28;
  id v29;
  id v30;
  _QWORD block[5];
  id v32;
  id v33;
  uint8_t buf[4];
  SUCoreMobileAsset *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreMobileAsset maControlQueue](self, "maControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "oslog");
  v7 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCoreMobileAsset documentationStashBuild](self, "documentationStashBuild");
    v8 = (SUCoreMobileAsset *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v35 = v8;
    _os_log_impl(&dword_1DDFDD000, v7, OS_LOG_TYPE_DEFAULT, "Report download failed, found stashDocumentationBuild=%@", buf, 0xCu);

  }
  if (-[SUCoreMobileAsset removingAsset](self, "removingAsset")
    || -[SUCoreMobileAsset assetRemoved](self, "assetRemoved")
    || (-[SUCoreMobileAsset maDelegate](self, "maDelegate"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_opt_respondsToSelector(),
        v9,
        (v10 & 1) == 0))
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("ma.DownloadAsset.Delegate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMobileAsset clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__SUCoreMobileAsset__reportDownloadFailed___block_invoke;
    block[3] = &unk_1EA878940;
    block[4] = self;
    v32 = v4;
    v33 = v11;
    v13 = v11;
    dispatch_async(v12, block);

    v14 = 1;
  }
  -[SUCoreMobileAsset downloadCompletion](self, "downloadCompletion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[SUCoreMobileAsset downloadCompletion](self, "downloadCompletion");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMobileAsset setDownloadCompletion:](self, "setDownloadCompletion:", 0);
    objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("ma.DownloadAsset.Completion"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMobileAsset clientCompletionQueue](self, "clientCompletionQueue");
    v18 = objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __43__SUCoreMobileAsset__reportDownloadFailed___block_invoke_2;
    v27 = &unk_1EA877E80;
    v30 = v16;
    v28 = v4;
    v29 = v17;
    v19 = v17;
    v20 = v16;
    dispatch_async(v18, &v24);

  }
  else
  {
    if ((v14 & 1) != 0)
      goto LABEL_11;
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "oslog");
    v20 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v35 = self;
      v36 = 2114;
      v37 = v4;
      _os_log_impl(&dword_1DDFDD000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ download failed (not reported): error=%{public}@", buf, 0x16u);
    }
  }

LABEL_11:
  -[SUCoreMobileAsset setDocumentationStashBuild:](self, "setDocumentationStashBuild:", 0, v24, v25, v26, v27);
  v21 = (void *)MEMORY[0x1E0DA8920];
  -[SUCoreMobileAsset downloadAssetTransaction](self, "downloadAssetTransaction");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "endTransaction:withName:", v22, CFSTR("ma.DownloadAsset"));

  -[SUCoreMobileAsset setDownloadAssetTransaction:](self, "setDownloadAssetTransaction:", 0);
}

uint64_t __43__SUCoreMobileAsset__reportDownloadFailed___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "maDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maDownloadFailed:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 48), CFSTR("ma.DownloadAsset.Delegate"));
}

uint64_t __43__SUCoreMobileAsset__reportDownloadFailed___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("ma.DownloadAsset.Completion"));
}

- (void)_reportAssetRemoved
{
  NSObject *v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  _QWORD block[5];
  id v26;
  uint8_t buf[4];
  SUCoreMobileAsset *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[SUCoreMobileAsset maControlQueue](self, "maControlQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMobileAsset maDelegate](self, "maDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  v6 = MEMORY[0x1E0C809B0];
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("ma.RemoveAsset.Delegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMobileAsset clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = v6;
    block[1] = 3221225472;
    block[2] = __40__SUCoreMobileAsset__reportAssetRemoved__block_invoke;
    block[3] = &unk_1EA878A88;
    block[4] = self;
    v26 = v7;
    v9 = v7;
    dispatch_async(v8, block);

  }
  -[SUCoreMobileAsset removeCompletion](self, "removeCompletion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[SUCoreMobileAsset removeCompletion](self, "removeCompletion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMobileAsset setRemoveCompletion:](self, "setRemoveCompletion:", 0);
    objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("ma.RemoveAsset.Completion"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMobileAsset clientCompletionQueue](self, "clientCompletionQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v19 = v6;
    v20 = 3221225472;
    v21 = __40__SUCoreMobileAsset__reportAssetRemoved__block_invoke_2;
    v22 = &unk_1EA878088;
    v23 = v12;
    v24 = v11;
    v14 = v12;
    v15 = v11;
    dispatch_async(v13, &v19);

  }
  else
  {
    if ((v5 & 1) != 0)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "oslog");
    v15 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v28 = self;
      _os_log_impl(&dword_1DDFDD000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ asset removed (not reported)", buf, 0xCu);
    }
  }

LABEL_6:
  v16 = (void *)MEMORY[0x1E0DA8920];
  -[SUCoreMobileAsset removeAssetTransaction](self, "removeAssetTransaction", v19, v20, v21, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "endTransaction:withName:", v17, CFSTR("ma.RemoveAsset"));

  -[SUCoreMobileAsset setRemoveAssetTransaction:](self, "setRemoveAssetTransaction:", 0);
}

uint64_t __40__SUCoreMobileAsset__reportAssetRemoved__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "maDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maAssetRemoved");

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("ma.RemoveAsset.Delegate"));
}

uint64_t __40__SUCoreMobileAsset__reportAssetRemoved__block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 32), CFSTR("ma.RemoveAsset.Completion"));
}

- (void)_reportAssetRemoveFailed:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  id v25;
  id v26;
  id v27;
  _QWORD block[5];
  id v29;
  id v30;
  uint8_t buf[4];
  SUCoreMobileAsset *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreMobileAsset maControlQueue](self, "maControlQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMobileAsset maDelegate](self, "maDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  v8 = MEMORY[0x1E0C809B0];
  if ((v7 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("ma.RemoveAsset.Delegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMobileAsset clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __46__SUCoreMobileAsset__reportAssetRemoveFailed___block_invoke;
    block[3] = &unk_1EA878940;
    block[4] = self;
    v29 = v4;
    v30 = v9;
    v11 = v9;
    dispatch_async(v10, block);

  }
  -[SUCoreMobileAsset removeCompletion](self, "removeCompletion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SUCoreMobileAsset removeCompletion](self, "removeCompletion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMobileAsset setRemoveCompletion:](self, "setRemoveCompletion:", 0);
    objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("ma.RemoveAsset.Completion"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMobileAsset clientCompletionQueue](self, "clientCompletionQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v21 = v8;
    v22 = 3221225472;
    v23 = __46__SUCoreMobileAsset__reportAssetRemoveFailed___block_invoke_2;
    v24 = &unk_1EA877E80;
    v27 = v13;
    v25 = v4;
    v26 = v14;
    v16 = v14;
    v17 = v13;
    dispatch_async(v15, &v21);

  }
  else
  {
    if ((v7 & 1) != 0)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "oslog");
    v17 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v32 = self;
      v33 = 2114;
      v34 = v4;
      _os_log_impl(&dword_1DDFDD000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ asset remove failed (not reported): error=%{public}@", buf, 0x16u);
    }
  }

LABEL_6:
  v18 = (void *)MEMORY[0x1E0DA8920];
  -[SUCoreMobileAsset removeAssetTransaction](self, "removeAssetTransaction", v21, v22, v23, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "endTransaction:withName:", v19, CFSTR("ma.RemoveAsset"));

  -[SUCoreMobileAsset setRemoveAssetTransaction:](self, "setRemoveAssetTransaction:", 0);
}

uint64_t __46__SUCoreMobileAsset__reportAssetRemoveFailed___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "maDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maAssetRemoveFailed:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 48), CFSTR("ma.RemoveAsset.Delegate"));
}

uint64_t __46__SUCoreMobileAsset__reportAssetRemoveFailed___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("ma.RemoveAsset.Completion"));
}

- (void)_reportAnomaly:(id)a3
{
  -[SUCoreMobileAsset _reportAnomaly:issuingCompletion:](self, "_reportAnomaly:issuingCompletion:", a3, 0);
}

- (void)_reportAnomaly:(id)a3 issuingCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  char v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  NSObject *v18;
  _QWORD block[5];
  id v20;
  uint8_t buf[4];
  SUCoreMobileAsset *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SUCoreMobileAsset maControlQueue](self, "maControlQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[SUCoreMobileAsset maDelegate](self, "maDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  v11 = MEMORY[0x1E0C809B0];
  if ((v10 & 1) != 0)
  {
    -[SUCoreMobileAsset clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = v11;
    block[1] = 3221225472;
    block[2] = __54__SUCoreMobileAsset__reportAnomaly_issuingCompletion___block_invoke;
    block[3] = &unk_1EA878A88;
    block[4] = self;
    v20 = v6;
    dispatch_async(v12, block);

    if (!v7)
      goto LABEL_7;
  }
  else if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "oslog");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v22 = self;
      v23 = 2114;
      v24 = v6;
      _os_log_impl(&dword_1DDFDD000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ anomaly (not reported): error=%{public}@", buf, 0x16u);
    }
    goto LABEL_6;
  }
  -[SUCoreMobileAsset clientCompletionQueue](self, "clientCompletionQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __54__SUCoreMobileAsset__reportAnomaly_issuingCompletion___block_invoke_2;
  v16[3] = &unk_1EA878088;
  v18 = v7;
  v17 = v6;
  dispatch_async(v13, v16);

  v14 = v18;
LABEL_6:

LABEL_7:
}

void __54__SUCoreMobileAsset__reportAnomaly_issuingCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "maDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maAnomaly:", *(_QWORD *)(a1 + 40));

}

uint64_t __54__SUCoreMobileAsset__reportAnomaly_issuingCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_trackMobileAssetBegin:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SUCoreMobileAsset operationName](self, "operationName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SUCoreMobileAsset _trackMobileAssetBegin:withIdentifier:](self, "_trackMobileAssetBegin:withIdentifier:", v4, v5);

}

- (void)_trackMobileAssetBegin:(id)a3 withIdentifier:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0DA8938];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedDiag");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trackBegin:atLevel:forModule:withIdentifier:", v7, 1, CFSTR("ma"), v6);

}

- (void)_trackMobileAssetEnd:(id)a3 withResult:(int64_t)a4 withError:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[SUCoreMobileAsset operationName](self, "operationName");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[SUCoreMobileAsset _trackMobileAssetEnd:withIdentifier:withResult:withError:](self, "_trackMobileAssetEnd:withIdentifier:withResult:withError:", v9, v10, a4, v8);

}

- (void)_trackMobileAssetEnd:(id)a3 withIdentifier:(id)a4 withResult:(int64_t)a5 withError:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = (void *)MEMORY[0x1E0DA8938];
  v10 = a6;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "sharedDiag");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trackEnd:atLevel:forModule:withIdentifier:withResult:withError:", v12, 1, CFSTR("ma"), v11, a5, v10);

}

- (void)_trackMAAnomaly:(id)a3 result:(int64_t)a4 description:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v8 = a5;
  v9 = a3;
  -[SUCoreMobileAsset maControlQueue](self, "maControlQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "buildError:underlying:description:", a4, 0, v8);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("[MA] %@"), v9);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ %@"), self, v8);
  objc_msgSend(v12, "trackAnomaly:forReason:withResult:withError:", v13, v14, a4, v15);

  -[SUCoreMobileAsset _reportAnomaly:](self, "_reportAnomaly:", v15);
}

- (id)_updateAssetTypeName
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SUCoreMobileAsset maControlQueue](self, "maControlQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMobileAsset asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SUCoreMobileAsset asset](self, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "assetType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)description
{
  __CFString *v2;

  -[SUCoreMobileAsset operationName](self, "operationName");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = CFSTR("[MA(initialized)]");
  return v2;
}

+ (id)downloadOptionsDescription:(id)a3
{
  id v3;
  id v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  __CFString *v12;
  const __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  uint64_t v24;
  const __CFString *v25;
  id v26;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v26 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (objc_msgSend(v3, "allowsCellularAccess"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v25 = v5;
  v24 = objc_msgSend(v3, "timeoutIntervalForResource");
  if (objc_msgSend(v3, "discretionary"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v23 = v6;
  if (objc_msgSend(v3, "allowsExpensiveAccess"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v22 = v7;
  if (objc_msgSend(v3, "requiresPowerPluggedIn"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v21 = v8;
  if (objc_msgSend(v3, "canUseLocalCacheServer"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v20 = v9;
  if (objc_msgSend(v3, "prefersInfraWiFi"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v3, "sessionId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v3, "sessionId");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = CFSTR("NONE");
  }
  if (objc_msgSend(v3, "liveServerCatalogOnly"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  if (v4)
  {
    objc_msgSend(v4, "liveAssetAudienceUUID");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "purpose");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = CFSTR("NONE");
    v15 = CFSTR("NONE");
  }
  objc_msgSend(v3, "additionalServerParams");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v3, "additionalServerParams");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v26, "initWithFormat:", CFSTR("\n[>>>\n       allowsCellularAccess: %@\n timeoutIntervalForResource: %ld\n              discretionary: %@\n      allowsExpensiveAccess: %@\n     requiresPowerPluggedIn: %@\n     canUseLocalCacheServer: %@\n           prefersInfraWiFi: %@\n                  sessionId: %@\n      liveServerCatalogOnly: %@\n      liveAssetAudienceUUID: %@\n                    purpose: %@\n     additionalServerParams: %@\n<<<]"), v25, v24, v23, v22, v21, v20, v10, v12, v13, v14, v15, v17);

  }
  else
  {
    v18 = (void *)objc_msgSend(v26, "initWithFormat:", CFSTR("\n[>>>\n       allowsCellularAccess: %@\n timeoutIntervalForResource: %ld\n              discretionary: %@\n      allowsExpensiveAccess: %@\n     requiresPowerPluggedIn: %@\n     canUseLocalCacheServer: %@\n           prefersInfraWiFi: %@\n                  sessionId: %@\n      liveServerCatalogOnly: %@\n      liveAssetAudienceUUID: %@\n                    purpose: %@\n     additionalServerParams: %@\n<<<]"), v25, v24, v23, v22, v21, v20, v10, v12, v13, v14, v15, CFSTR("NONE"));
  }

  if (v4)
  {

  }
  if (v11)

  return v18;
}

+ (id)downloadConfigSummary:(id)a3
{
  if (objc_msgSend(a3, "discretionary"))
    return CFSTR("background(discretionary)");
  else
    return CFSTR("foreground(non-discretionary)");
}

+ (BOOL)downloadConfig:(id)a3 isEqualToConfig:(id)a4
{
  id v5;
  char v6;

  v5 = a4;
  LOBYTE(a3) = objc_msgSend(a3, "discretionary");
  v6 = objc_msgSend(v5, "discretionary");

  return a3 ^ v6 ^ 1;
}

+ (id)downloadConfigCopy:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E0D4E080];
    v4 = a3;
    v5 = objc_alloc_init(v3);
    v6 = objc_msgSend(v4, "discretionary");

    objc_msgSend(v5, "setDiscretionary:", v6);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (void)reloadDescriptor:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0D4E048];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "requireSameAssetTypeAndAssetId");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[SUCoreMobileAsset reloadDescriptor:allowingDifferences:forceReload:completion:](SUCoreMobileAsset, "reloadDescriptor:allowingDifferences:forceReload:completion:", v7, v8, 0, v6);

}

+ (void)reloadDescriptor:(id)a3 allowingDifferences:(id)a4 forceReload:(BOOL)a5 completion:(id)a6
{
  +[SUCoreMobileAsset reloadDescriptor:allowingDifferences:forceReload:defaultValues:completion:](SUCoreMobileAsset, "reloadDescriptor:allowingDifferences:forceReload:defaultValues:completion:", a3, a4, a5, 0, a6);
}

+ (void)reloadDescriptor:(id)a3 allowingDifferences:(id)a4 forceReload:(BOOL)a5 defaultValues:(id)a6 completion:(id)a7
{
  +[SUCoreMobileAsset reloadDescriptor:allowingDifferences:forceReload:skipMSU:defaultValues:completion:](SUCoreMobileAsset, "reloadDescriptor:allowingDifferences:forceReload:skipMSU:defaultValues:completion:", a3, a4, a5, 0, a6, a7);
}

+ (void)reloadDescriptor:(id)a3 allowingDifferences:(id)a4 forceReload:(BOOL)a5 skipMSU:(BOOL)a6 defaultValues:(id)a7 completion:(id)a8
{
  const __CFString *v10;
  const __CFString *v11;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  const __CFString *v19;
  id v20;
  const __CFString *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  char v31;
  id v32;
  _QWORD block[4];
  id v34;
  id v35;
  id v36;
  id v37;
  char v38;
  char v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  const __CFString *v49;
  __int16 v50;
  const __CFString *v51;
  __int16 v52;
  const __CFString *v53;
  uint64_t v54;

  LODWORD(v10) = a6;
  LODWORD(v11) = a5;
  v54 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a7;
  v16 = a8;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "oslog");
  v18 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v13, "summary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "summary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v14;
    if ((_DWORD)v11)
      v19 = CFSTR("YES");
    else
      v19 = CFSTR("NO");
    v30 = (char)v11;
    v31 = (char)v10;
    if ((_DWORD)v10)
      v10 = CFSTR("YES");
    else
      v10 = CFSTR("NO");
    if (v16)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    v20 = v16;
    if (objc_msgSend(v13, "requiresSoftwareUpdateAssetReload"))
      v21 = CFSTR("YES");
    else
      v21 = CFSTR("NO");
    *(_DWORD *)buf = 138544898;
    if (objc_msgSend(v13, "requiresDocumentationReload"))
      v22 = CFSTR("YES");
    else
      v22 = CFSTR("NO");
    v41 = v29;
    v42 = 2114;
    v43 = v28;
    v44 = 2114;
    v45 = v19;
    v14 = v32;
    v46 = 2114;
    v47 = v10;
    v48 = 2114;
    v49 = v11;
    LOBYTE(v11) = v30;
    LOBYTE(v10) = v31;
    v50 = 2114;
    v51 = v21;
    v16 = v20;
    v52 = 2114;
    v53 = v22;
    _os_log_impl(&dword_1DDFDD000, v18, OS_LOG_TYPE_DEFAULT, "[ReloadDescriptor] Reload descriptor method called, descriptor:%{public}@ allowingDifferences:%{public}@ forceReload:%{public}@ skipMSU:%{public}@ completion:%{public}@ requiresSoftwareUpdateAssetReload:%{public}@ requiresDocumentationReload:%{public}@", buf, 0x48u);

  }
  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v13)
  {
    objc_msgSend(v23, "waitedOperationQueue");
    v25 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __103__SUCoreMobileAsset_reloadDescriptor_allowingDifferences_forceReload_skipMSU_defaultValues_completion___block_invoke;
    block[3] = &unk_1EA879C18;
    v34 = v13;
    v35 = v14;
    v38 = (char)v11;
    v39 = (char)v10;
    v36 = v15;
    v37 = v16;
    dispatch_async(v25, block);

    v26 = v34;
  }
  else
  {
    objc_msgSend(v23, "buildError:underlying:description:", 8116, 0, CFSTR("No descriptor was provided for descriptor reload"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "trackAnomaly:forReason:withResult:withError:", CFSTR("ReloadDescriptor"), CFSTR("No descriptor was provided for descriptor reload"), 8116, v26);

    +[SUCoreMobileAsset _callReloadCompletion:withDescriptor:suError:docError:](SUCoreMobileAsset, "_callReloadCompletion:withDescriptor:suError:docError:", v16, 0, v26, v26);
  }

}

void __103__SUCoreMobileAsset_reloadDescriptor_allowingDifferences_forceReload_skipMSU_defaultValues_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint8_t buf[16];
  id v21;
  id v22;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(unsigned __int8 *)(a1 + 64);
  v5 = *(unsigned __int8 *)(a1 + 65);
  v6 = *(_QWORD *)(a1 + 48);
  v21 = 0;
  v22 = 0;
  +[SUCoreMobileAsset _reloadDescriptor:allowingDifferences:forceReload:skipMSU:defaultValues:pSUReloadError:pDocReloadError:](SUCoreMobileAsset, "_reloadDescriptor:allowingDifferences:forceReload:skipMSU:defaultValues:pSUReloadError:pDocReloadError:", v2, v3, v4, v5, v6, &v22, &v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v22;
  v9 = v21;
  objc_msgSend(*(id *)(a1 + 32), "associatedSplatDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && !v8 && !v9)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDFDD000, v12, OS_LOG_TYPE_DEFAULT, "[ReloadDescriptor] Reload the associated splat descriptor", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "associatedSplatDescriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    v15 = *(unsigned __int8 *)(a1 + 64);
    v16 = *(unsigned __int8 *)(a1 + 65);
    v18 = 0;
    v19 = 0;
    +[SUCoreMobileAsset _reloadDescriptor:allowingDifferences:forceReload:skipMSU:defaultValues:pSUReloadError:pDocReloadError:](SUCoreMobileAsset, "_reloadDescriptor:allowingDifferences:forceReload:skipMSU:defaultValues:pSUReloadError:pDocReloadError:", v13, v14, v15, v16, 0, &v19, &v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v19;
    v9 = v18;

    if (!v8)
      objc_msgSend(v7, "setAssociatedSplatDescriptor:", v17);

  }
  +[SUCoreMobileAsset _callReloadCompletion:withDescriptor:suError:docError:](SUCoreMobileAsset, "_callReloadCompletion:withDescriptor:suError:docError:", *(_QWORD *)(a1 + 56), v7, v8, v9);

}

+ (id)_reloadDescriptor:(id)a3 allowingDifferences:(id)a4 forceReload:(BOOL)a5 skipMSU:(BOOL)a6 defaultValues:(id)a7 pSUReloadError:(id *)a8 pDocReloadError:(id *)a9
{
  _BOOL4 v10;
  id v13;
  id v14;
  SUCoreDescriptor *v15;
  SUCoreDescriptor *v16;
  unint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  uint64_t v33;
  id v34;
  void *v35;
  SUCoreDescriptor *v36;
  SUCoreDescriptor *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  const __CFString *v54;
  uint64_t v55;
  id v56;
  id v59;
  id v60;
  id v61;
  uint8_t buf[4];
  id v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v10 = a6;
  v68 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v59 = a7;
  v15 = (SUCoreDescriptor *)v13;
  v16 = v15;
  v17 = 0x1E0DA8000uLL;
  if (a5 || -[SUCoreDescriptor requiresSoftwareUpdateAssetReload](v15, "requiresSoftwareUpdateAssetReload"))
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "oslog");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      -[SUCoreDescriptor softwareUpdateAssetAbsoluteID](v16, "softwareUpdateAssetAbsoluteID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDescriptor softwareUpdateAssetPurpose](v16, "softwareUpdateAssetPurpose");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v63 = v14;
      v64 = 2114;
      v65 = v20;
      v66 = 2114;
      v67 = v21;
      _os_log_impl(&dword_1DDFDD000, v19, OS_LOG_TYPE_DEFAULT, "[ReloadDescriptor] Attempting to reload software update asset, allowing differences:%{public}@ absoluteAssetID:%{public}@ purpose:%{public}@", buf, 0x20u);

    }
    v22 = (void *)MEMORY[0x1E0D4E038];
    -[SUCoreDescriptor softwareUpdateAssetAbsoluteID](v16, "softwareUpdateAssetAbsoluteID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDescriptor softwareUpdateAssetPurpose](v16, "softwareUpdateAssetPurpose");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0;
    objc_msgSend(v22, "SUCoreBorder_loadSync:allowingDifferences:withPurpose:error:simulateForDescriptor:simulateForType:", v23, v14, v24, &v61, v16, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v61;

    if (v26 || !v25)
    {
      objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v31;
      if (v26)
      {
        v32 = CFSTR("Failed to reload software update asset for descriptor with MobileAsset error");
        v33 = 8704;
        v34 = v26;
      }
      else
      {
        v32 = CFSTR("Failed to reload software update asset for descriptor as asset was not found (no MobileAsset error)");
        v33 = 8705;
        v34 = 0;
      }
      objc_msgSend(v31, "buildError:underlying:description:", v33, v34, v32);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v16;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "oslog");
      v28 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DDFDD000, v28, OS_LOG_TYPE_DEFAULT, "[ReloadDescriptor] Software update asset reload completed successfully", buf, 2u);
      }

      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SUCoreDescriptor msuPrepareSize](v16, "msuPrepareSize"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[SUCoreDescriptor installationSize](v16, "installationSize"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v29 = 0;
        v30 = 0;
      }
      v37 = [SUCoreDescriptor alloc];
      -[SUCoreDescriptor releaseDate](v16, "releaseDate");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = -[SUCoreDescriptor initWithSUAsset:releaseDate:prepareSize:applySize:defaultValues:](v37, "initWithSUAsset:releaseDate:prepareSize:applySize:defaultValues:", v25, v38, v29, v30, v59);

      -[SUCoreDescriptor transferNonAssetPropertiesFromDescriptor:](v36, "transferNonAssetPropertiesFromDescriptor:", v16);
      v35 = 0;
      v17 = 0x1E0DA8000;
    }

    if (a5)
      goto LABEL_20;
  }
  else
  {
    v35 = 0;
    v36 = v16;
  }
  if (!-[SUCoreDescriptor requiresDocumentationReload](v16, "requiresDocumentationReload"))
  {
    v51 = 0;
    goto LABEL_33;
  }
LABEL_20:
  v39 = v17;
  objc_msgSend(*(id *)(v17 + 2400), "sharedLogger");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "oslog");
  v41 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCoreDescriptor documentationAssetAbsoluteID](v16, "documentationAssetAbsoluteID");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDescriptor documentationAssetPurpose](v16, "documentationAssetPurpose");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v63 = v14;
    v64 = 2114;
    v65 = v42;
    v66 = 2114;
    v67 = v43;
    _os_log_impl(&dword_1DDFDD000, v41, OS_LOG_TYPE_DEFAULT, "[ReloadDescriptor] Attempting to reload documentation asset, allowing differences:%{public}@ absoluteAssetID:%{public}@ purpose:%{public}@", buf, 0x20u);

  }
  v44 = (void *)MEMORY[0x1E0D4E038];
  -[SUCoreDescriptor documentationAssetAbsoluteID](v16, "documentationAssetAbsoluteID");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDescriptor documentationAssetPurpose](v16, "documentationAssetPurpose");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = 0;
  objc_msgSend(v44, "SUCoreBorder_loadSync:allowingDifferences:withPurpose:error:simulateForDescriptor:simulateForType:", v45, v14, v46, &v60, v36, 2);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v60;

  if (v48 || !v47)
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v52;
    if (v48)
    {
      v54 = CFSTR("Failed to reload documentation asset for descriptor with MobileAsset error");
      v55 = 8704;
      v56 = v48;
    }
    else
    {
      v54 = CFSTR("Failed to reload documentation asset for descriptor as asset was not found (no MobileAsset error)");
      v55 = 8705;
      v56 = 0;
    }
    objc_msgSend(v52, "buildError:underlying:description:", v55, v56, v54);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(*(id *)(v39 + 2400), "sharedLogger");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "oslog");
    v50 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DDFDD000, v50, OS_LOG_TYPE_DEFAULT, "[ReloadDescriptor] Documentation asset reload completed successfully", buf, 2u);
    }

    -[SUCoreDescriptor assignDocumentationFromAsset:extendingBundleProperties:](v36, "assignDocumentationFromAsset:extendingBundleProperties:", v47, objc_msgSend(v47, "wasLocal"));
    v51 = 0;
  }

LABEL_33:
  if (a8)
    *a8 = objc_retainAutorelease(v35);
  if (a9)
    *a9 = objc_retainAutorelease(v51);

  return v36;
}

+ (void)_callReloadCompletion:(id)a3 withDescriptor:(id)a4 suError:(id)a5 docError:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "oslog");
  v14 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v24 = v10;
    v25 = 2114;
    v26 = v11;
    v27 = 2114;
    v28 = v12;
    _os_log_impl(&dword_1DDFDD000, v14, OS_LOG_TYPE_DEFAULT, "[ReloadDescriptor] Dispatching onto shared completion queue and calling provided reload completion with descriptor:%{public}@ suError:%{public}@ docError:%{public}@", buf, 0x20u);
  }

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "completionQueue");
    v16 = objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __75__SUCoreMobileAsset__callReloadCompletion_withDescriptor_suError_docError___block_invoke;
    v18[3] = &unk_1EA878060;
    v22 = v9;
    v19 = v10;
    v20 = v11;
    v21 = v12;
    dispatch_async(v16, v18);

    v17 = v22;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trackAnomaly:forReason:withResult:withError:", CFSTR("ReloadDescriptor"), CFSTR("No completion was provided for descriptor reload"), 8116, 0);
  }

}

uint64_t __75__SUCoreMobileAsset__callReloadCompletion_withDescriptor_suError_docError___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (id)maDelegate
{
  return objc_loadWeakRetained(&self->_maDelegate);
}

- (NSString)updateUUID
{
  return self->_updateUUID;
}

- (void)setUpdateUUID:(id)a3
{
  objc_storeStrong((id *)&self->_updateUUID, a3);
}

- (MAAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (NSString)documentationStashBuild
{
  return self->_documentationStashBuild;
}

- (void)setDocumentationStashBuild:(id)a3
{
  objc_storeStrong((id *)&self->_documentationStashBuild, a3);
}

- (MADownloadOptions)downloadOptions
{
  return self->_downloadOptions;
}

- (void)setDownloadOptions:(id)a3
{
  objc_storeStrong((id *)&self->_downloadOptions, a3);
}

- (MADownloadConfig)currentDownloadConfig
{
  return self->_currentDownloadConfig;
}

- (void)setCurrentDownloadConfig:(id)a3
{
  objc_storeStrong((id *)&self->_currentDownloadConfig, a3);
}

- (MADownloadConfig)requestedDownloadConfig
{
  return self->_requestedDownloadConfig;
}

- (void)setRequestedDownloadConfig:(id)a3
{
  objc_storeStrong((id *)&self->_requestedDownloadConfig, a3);
}

- (MADownloadConfig)desiredDownloadConfig
{
  return self->_desiredDownloadConfig;
}

- (void)setDesiredDownloadConfig:(id)a3
{
  objc_storeStrong((id *)&self->_desiredDownloadConfig, a3);
}

- (OS_dispatch_queue)clientDelegateCallbackQueue
{
  return self->_clientDelegateCallbackQueue;
}

- (OS_dispatch_queue)clientCompletionQueue
{
  return self->_clientCompletionQueue;
}

- (OS_dispatch_queue)maControlQueue
{
  return self->_maControlQueue;
}

- (BOOL)downloadingAsset
{
  return self->_downloadingAsset;
}

- (void)setDownloadingAsset:(BOOL)a3
{
  self->_downloadingAsset = a3;
}

- (BOOL)checkedDownloadState
{
  return self->_checkedDownloadState;
}

- (void)setCheckedDownloadState:(BOOL)a3
{
  self->_checkedDownloadState = a3;
}

- (BOOL)assetDownloaded
{
  return self->_assetDownloaded;
}

- (void)setAssetDownloaded:(BOOL)a3
{
  self->_assetDownloaded = a3;
}

- (BOOL)removingAsset
{
  return self->_removingAsset;
}

- (void)setRemovingAsset:(BOOL)a3
{
  self->_removingAsset = a3;
}

- (NSString)operationName
{
  return self->_operationName;
}

- (void)setOperationName:(id)a3
{
  objc_storeStrong((id *)&self->_operationName, a3);
}

- (BOOL)assetRemoved
{
  return self->_assetRemoved;
}

- (void)setAssetRemoved:(BOOL)a3
{
  self->_assetRemoved = a3;
}

- (id)downloadCompletion
{
  return self->_downloadCompletion;
}

- (void)setDownloadCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)alterDownloadCompletion
{
  return self->_alterDownloadCompletion;
}

- (void)setAlterDownloadCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)removeCompletion
{
  return self->_removeCompletion;
}

- (void)setRemoveCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (OS_os_transaction)downloadAssetTransaction
{
  return self->_downloadAssetTransaction;
}

- (void)setDownloadAssetTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_downloadAssetTransaction, a3);
}

- (OS_os_transaction)alterDownloadTransaction
{
  return self->_alterDownloadTransaction;
}

- (void)setAlterDownloadTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_alterDownloadTransaction, a3);
}

- (OS_os_transaction)removeAssetTransaction
{
  return self->_removeAssetTransaction;
}

- (void)setRemoveAssetTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_removeAssetTransaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeAssetTransaction, 0);
  objc_storeStrong((id *)&self->_alterDownloadTransaction, 0);
  objc_storeStrong((id *)&self->_downloadAssetTransaction, 0);
  objc_storeStrong(&self->_removeCompletion, 0);
  objc_storeStrong(&self->_alterDownloadCompletion, 0);
  objc_storeStrong(&self->_downloadCompletion, 0);
  objc_storeStrong((id *)&self->_operationName, 0);
  objc_storeStrong((id *)&self->_maControlQueue, 0);
  objc_storeStrong((id *)&self->_clientCompletionQueue, 0);
  objc_storeStrong((id *)&self->_clientDelegateCallbackQueue, 0);
  objc_storeStrong((id *)&self->_desiredDownloadConfig, 0);
  objc_storeStrong((id *)&self->_requestedDownloadConfig, 0);
  objc_storeStrong((id *)&self->_currentDownloadConfig, 0);
  objc_storeStrong((id *)&self->_downloadOptions, 0);
  objc_storeStrong((id *)&self->_documentationStashBuild, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_updateUUID, 0);
  objc_destroyWeak(&self->_maDelegate);
}

void __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  v3 = CFSTR("alter download config when removing asset - alteration of configuration ignored");
  OUTLINED_FUNCTION_0_5(&dword_1DDFDD000, v0, v1, "%{public}@ %{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

void __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  v3 = CFSTR("alter download config when not downloading - alteration of configuration ignored");
  OUTLINED_FUNCTION_0_5(&dword_1DDFDD000, v0, v1, "%{public}@ %{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

void __53__SUCoreMobileAsset_alterDownloadOptions_completion___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[14];
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  v3 = CFSTR("alter download config when already altering with completion - cannot accept additional alteration request");
  OUTLINED_FUNCTION_0_5(&dword_1DDFDD000, v0, v1, "%{public}@ %{public}@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)_requestChangeConfigDownload:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1DDFDD000, a2, a3, "%{public}@ Unable to change download config (self.asset is not present)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)_issueAlterDownloadCompletion:forReason:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_5(&dword_1DDFDD000, v0, (uint64_t)v0, "%{public}@ %{public}@", v1);
  OUTLINED_FUNCTION_2_0();
}

- (void)_reportDownloaded:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_5(&dword_1DDFDD000, v0, (uint64_t)v0, "%{public}@ Failed to stash documentation asset data: %{public}@", v1);
  OUTLINED_FUNCTION_2_0();
}

@end
