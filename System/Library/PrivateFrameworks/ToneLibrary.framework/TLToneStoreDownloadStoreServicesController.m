@implementation TLToneStoreDownloadStoreServicesController

- (TLToneStoreDownloadStoreServicesController)init
{
  TLToneStoreDownloadStoreServicesController *v2;
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *accessQueueLabel;
  dispatch_queue_t v12;
  OS_dispatch_queue *accessQueue;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  id *v19;
  void *v20;
  id v21;
  id *v22;
  void *v23;
  id v24;
  id *v25;
  void *v26;
  id v27;
  id *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id *v33;
  void *v34;
  id *v35;
  void *v36;
  id *v37;
  void *v38;
  id *v39;
  void *v40;
  id *v41;
  void *v42;
  id *v43;
  void *v44;
  id v45;
  id *v46;
  void *v47;
  id v48;
  id *v49;
  void *v50;
  id v51;
  id *v52;
  void *v53;
  id v54;
  id *v55;
  void *v56;
  id v57;
  id *v58;
  void *v59;
  id v60;
  id *v61;
  void *v62;
  id v63;
  id *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  objc_class *v70;
  uint64_t v71;
  SSDownloadManager *storeDownloadManager;
  void *v73;
  objc_class *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  objc_class *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  SSPurchaseManager *storePurchaseManager;
  TLToneStoreDownloadStoreServicesController *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;
  _QWORD v96[4];
  TLToneStoreDownloadStoreServicesController *v97;
  objc_super v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t v107;
  _QWORD v108[12];
  id v109;
  _QWORD v110[3];
  id v111;
  _QWORD v112[4];

  v112[2] = *MEMORY[0x1E0C80C00];
  v98.receiver = self;
  v98.super_class = (Class)TLToneStoreDownloadStoreServicesController;
  v2 = -[TLToneStoreDownloadStoreServicesController init](&v98, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@-%@-%@"), v6, v7, CFSTR("AccessQueue"), v9);
    v10 = objc_claimAutoreleasedReturnValue();
    accessQueueLabel = v2->_accessQueueLabel;
    v2->_accessQueueLabel = (NSString *)v10;

    v12 = dispatch_queue_create(-[NSString UTF8String](v2->_accessQueueLabel, "UTF8String"), 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v12;

    v104 = 0;
    v105 = &v104;
    v106 = 0x2050000000;
    v14 = (void *)getSSDownloadManagerOptionsClass_softClass;
    v107 = getSSDownloadManagerOptionsClass_softClass;
    if (!getSSDownloadManagerOptionsClass_softClass)
    {
      v99 = MEMORY[0x1E0C809B0];
      v100 = 3221225472;
      v101 = (uint64_t)__getSSDownloadManagerOptionsClass_block_invoke;
      v102 = &unk_1E952AB10;
      v103 = &v104;
      __getSSDownloadManagerOptionsClass_block_invoke((uint64_t)&v99);
      v14 = (void *)v105[3];
    }
    v15 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v104, 8);
    v95 = objc_alloc_init(v15);
    getSSDownloadKindRingtone();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v112[0] = v16;
    getSSDownloadKindTone();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v112[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v112, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "setDownloadKinds:", v18);

    v99 = 0;
    v100 = (uint64_t)&v99;
    v101 = 0x2020000000;
    v19 = (id *)getSSDownloadExternalPropertyBytesDownloadedSymbolLoc_ptr;
    v102 = (void *)getSSDownloadExternalPropertyBytesDownloadedSymbolLoc_ptr;
    if (!getSSDownloadExternalPropertyBytesDownloadedSymbolLoc_ptr)
    {
      v20 = (void *)StoreServicesLibrary();
      v19 = (id *)dlsym(v20, "SSDownloadExternalPropertyBytesDownloaded");
      *(_QWORD *)(v100 + 24) = v19;
      getSSDownloadExternalPropertyBytesDownloadedSymbolLoc_ptr = (uint64_t)v19;
    }
    _Block_object_dispose(&v99, 8);
    if (!v19)
      goto LABEL_61;
    v21 = *v19;
    v110[0] = v21;
    v99 = 0;
    v100 = (uint64_t)&v99;
    v101 = 0x2020000000;
    v22 = (id *)getSSDownloadExternalPropertyPercentCompleteSymbolLoc_ptr;
    v102 = (void *)getSSDownloadExternalPropertyPercentCompleteSymbolLoc_ptr;
    if (!getSSDownloadExternalPropertyPercentCompleteSymbolLoc_ptr)
    {
      v23 = (void *)StoreServicesLibrary();
      v22 = (id *)dlsym(v23, "SSDownloadExternalPropertyPercentComplete");
      *(_QWORD *)(v100 + 24) = v22;
      getSSDownloadExternalPropertyPercentCompleteSymbolLoc_ptr = (uint64_t)v22;
    }
    _Block_object_dispose(&v99, 8);
    if (!v22)
      goto LABEL_61;
    v24 = *v22;
    v110[1] = v24;
    v99 = 0;
    v100 = (uint64_t)&v99;
    v101 = 0x2020000000;
    v25 = (id *)getSSDownloadExternalPropertyPolicySizeLimitSymbolLoc_ptr;
    v102 = (void *)getSSDownloadExternalPropertyPolicySizeLimitSymbolLoc_ptr;
    if (!getSSDownloadExternalPropertyPolicySizeLimitSymbolLoc_ptr)
    {
      v26 = (void *)StoreServicesLibrary();
      v25 = (id *)dlsym(v26, "SSDownloadExternalPropertyPolicySizeLimit");
      *(_QWORD *)(v100 + 24) = v25;
      getSSDownloadExternalPropertyPolicySizeLimitSymbolLoc_ptr = (uint64_t)v25;
    }
    _Block_object_dispose(&v99, 8);
    if (!v25)
      goto LABEL_61;
    v27 = *v25;
    v110[2] = v27;
    v99 = 0;
    v100 = (uint64_t)&v99;
    v101 = 0x2020000000;
    v28 = (id *)getSSDownloadExternalPropertyRentalInformationSymbolLoc_ptr;
    v102 = (void *)getSSDownloadExternalPropertyRentalInformationSymbolLoc_ptr;
    if (!getSSDownloadExternalPropertyRentalInformationSymbolLoc_ptr)
    {
      v29 = (void *)StoreServicesLibrary();
      v28 = (id *)dlsym(v29, "SSDownloadExternalPropertyRentalInformation");
      *(_QWORD *)(v100 + 24) = v28;
      getSSDownloadExternalPropertyRentalInformationSymbolLoc_ptr = (uint64_t)v28;
    }
    _Block_object_dispose(&v99, 8);
    if (!v28)
      goto LABEL_61;
    v111 = *v28;
    v30 = (void *)MEMORY[0x1E0C99D20];
    v31 = v111;
    objc_msgSend(v30, "arrayWithObjects:count:", v110, 4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v95, "setPrefetchedDownloadExternalProperties:", v32);
    v99 = 0;
    v100 = (uint64_t)&v99;
    v101 = 0x2020000000;
    v33 = (id *)getSSDownloadPropertyClientBundleIdentifierSymbolLoc_ptr;
    v102 = (void *)getSSDownloadPropertyClientBundleIdentifierSymbolLoc_ptr;
    if (!getSSDownloadPropertyClientBundleIdentifierSymbolLoc_ptr)
    {
      v34 = (void *)StoreServicesLibrary();
      v33 = (id *)dlsym(v34, "SSDownloadPropertyClientBundleIdentifier");
      *(_QWORD *)(v100 + 24) = v33;
      getSSDownloadPropertyClientBundleIdentifierSymbolLoc_ptr = (uint64_t)v33;
    }
    _Block_object_dispose(&v99, 8);
    if (!v33)
      goto LABEL_61;
    v94 = *v33;
    v108[0] = v94;
    v99 = 0;
    v100 = (uint64_t)&v99;
    v101 = 0x2020000000;
    v35 = (id *)getSSDownloadPropertyDownloadPhaseSymbolLoc_ptr;
    v102 = (void *)getSSDownloadPropertyDownloadPhaseSymbolLoc_ptr;
    if (!getSSDownloadPropertyDownloadPhaseSymbolLoc_ptr)
    {
      v36 = (void *)StoreServicesLibrary();
      v35 = (id *)dlsym(v36, "SSDownloadPropertyDownloadPhase");
      *(_QWORD *)(v100 + 24) = v35;
      getSSDownloadPropertyDownloadPhaseSymbolLoc_ptr = (uint64_t)v35;
    }
    _Block_object_dispose(&v99, 8);
    if (!v35)
      goto LABEL_61;
    v93 = *v35;
    v108[1] = v93;
    v99 = 0;
    v100 = (uint64_t)&v99;
    v101 = 0x2020000000;
    v37 = (id *)getSSDownloadPropertyEncodedErrorDataSymbolLoc_ptr;
    v102 = (void *)getSSDownloadPropertyEncodedErrorDataSymbolLoc_ptr;
    if (!getSSDownloadPropertyEncodedErrorDataSymbolLoc_ptr)
    {
      v38 = (void *)StoreServicesLibrary();
      v37 = (id *)dlsym(v38, "SSDownloadPropertyEncodedErrorData");
      *(_QWORD *)(v100 + 24) = v37;
      getSSDownloadPropertyEncodedErrorDataSymbolLoc_ptr = (uint64_t)v37;
    }
    _Block_object_dispose(&v99, 8);
    if (!v37)
      goto LABEL_61;
    v92 = *v37;
    v108[2] = v92;
    v99 = 0;
    v100 = (uint64_t)&v99;
    v101 = 0x2020000000;
    v39 = (id *)getSSDownloadPropertyIsRestoreSymbolLoc_ptr;
    v102 = (void *)getSSDownloadPropertyIsRestoreSymbolLoc_ptr;
    if (!getSSDownloadPropertyIsRestoreSymbolLoc_ptr)
    {
      v40 = (void *)StoreServicesLibrary();
      v39 = (id *)dlsym(v40, "SSDownloadPropertyIsRestore");
      *(_QWORD *)(v100 + 24) = v39;
      getSSDownloadPropertyIsRestoreSymbolLoc_ptr = (uint64_t)v39;
    }
    _Block_object_dispose(&v99, 8);
    if (!v39)
      goto LABEL_61;
    v91 = *v39;
    v108[3] = v91;
    v99 = 0;
    v100 = (uint64_t)&v99;
    v101 = 0x2020000000;
    v41 = (id *)getSSDownloadPropertyKindSymbolLoc_ptr;
    v102 = (void *)getSSDownloadPropertyKindSymbolLoc_ptr;
    if (!getSSDownloadPropertyKindSymbolLoc_ptr)
    {
      v42 = (void *)StoreServicesLibrary();
      v41 = (id *)dlsym(v42, "SSDownloadPropertyKind");
      *(_QWORD *)(v100 + 24) = v41;
      getSSDownloadPropertyKindSymbolLoc_ptr = (uint64_t)v41;
    }
    _Block_object_dispose(&v99, 8);
    if (!v41)
      goto LABEL_61;
    v90 = *v41;
    v108[4] = v90;
    v99 = 0;
    v100 = (uint64_t)&v99;
    v101 = 0x2020000000;
    v43 = (id *)getSSDownloadPropertyReasonSymbolLoc_ptr;
    v102 = (void *)getSSDownloadPropertyReasonSymbolLoc_ptr;
    if (!getSSDownloadPropertyReasonSymbolLoc_ptr)
    {
      v44 = (void *)StoreServicesLibrary();
      v43 = (id *)dlsym(v44, "SSDownloadPropertyReason");
      *(_QWORD *)(v100 + 24) = v43;
      getSSDownloadPropertyReasonSymbolLoc_ptr = (uint64_t)v43;
    }
    _Block_object_dispose(&v99, 8);
    if (!v43)
      goto LABEL_61;
    v45 = *v43;
    v108[5] = v45;
    v99 = 0;
    v100 = (uint64_t)&v99;
    v101 = 0x2020000000;
    v46 = (id *)getSSDownloadPropertyStoreItemIdentifierSymbolLoc_ptr;
    v102 = (void *)getSSDownloadPropertyStoreItemIdentifierSymbolLoc_ptr;
    if (!getSSDownloadPropertyStoreItemIdentifierSymbolLoc_ptr)
    {
      v47 = (void *)StoreServicesLibrary();
      v46 = (id *)dlsym(v47, "SSDownloadPropertyStoreItemIdentifier");
      *(_QWORD *)(v100 + 24) = v46;
      getSSDownloadPropertyStoreItemIdentifierSymbolLoc_ptr = (uint64_t)v46;
    }
    _Block_object_dispose(&v99, 8);
    if (!v46)
      goto LABEL_61;
    v48 = *v46;
    v108[6] = v48;
    v99 = 0;
    v100 = (uint64_t)&v99;
    v101 = 0x2020000000;
    v49 = (id *)getSSDownloadPropertyTitleSymbolLoc_ptr;
    v102 = (void *)getSSDownloadPropertyTitleSymbolLoc_ptr;
    if (!getSSDownloadPropertyTitleSymbolLoc_ptr)
    {
      v50 = (void *)StoreServicesLibrary();
      v49 = (id *)dlsym(v50, "SSDownloadPropertyTitle");
      *(_QWORD *)(v100 + 24) = v49;
      getSSDownloadPropertyTitleSymbolLoc_ptr = (uint64_t)v49;
    }
    _Block_object_dispose(&v99, 8);
    if (!v49)
      goto LABEL_61;
    v51 = *v49;
    v108[7] = v51;
    v99 = 0;
    v100 = (uint64_t)&v99;
    v101 = 0x2020000000;
    v52 = (id *)getSSDownloadPropertyHandlerIDSymbolLoc_ptr;
    v102 = (void *)getSSDownloadPropertyHandlerIDSymbolLoc_ptr;
    if (!getSSDownloadPropertyHandlerIDSymbolLoc_ptr)
    {
      v53 = (void *)StoreServicesLibrary();
      v52 = (id *)dlsym(v53, "SSDownloadPropertyHandlerID");
      *(_QWORD *)(v100 + 24) = v52;
      getSSDownloadPropertyHandlerIDSymbolLoc_ptr = (uint64_t)v52;
    }
    _Block_object_dispose(&v99, 8);
    if (!v52)
      goto LABEL_61;
    v54 = *v52;
    v108[8] = v54;
    v99 = 0;
    v100 = (uint64_t)&v99;
    v101 = 0x2020000000;
    v55 = (id *)getSSDownloadPropertyCollectionNameSymbolLoc_ptr;
    v102 = (void *)getSSDownloadPropertyCollectionNameSymbolLoc_ptr;
    if (!getSSDownloadPropertyCollectionNameSymbolLoc_ptr)
    {
      v56 = (void *)StoreServicesLibrary();
      v55 = (id *)dlsym(v56, "SSDownloadPropertyCollectionName");
      *(_QWORD *)(v100 + 24) = v55;
      getSSDownloadPropertyCollectionNameSymbolLoc_ptr = (uint64_t)v55;
    }
    _Block_object_dispose(&v99, 8);
    if (!v55)
      goto LABEL_61;
    v57 = *v55;
    v108[9] = v57;
    v99 = 0;
    v100 = (uint64_t)&v99;
    v101 = 0x2020000000;
    v58 = (id *)getSSDownloadPropertyArtistNameSymbolLoc_ptr;
    v102 = (void *)getSSDownloadPropertyArtistNameSymbolLoc_ptr;
    if (!getSSDownloadPropertyArtistNameSymbolLoc_ptr)
    {
      v59 = (void *)StoreServicesLibrary();
      v58 = (id *)dlsym(v59, "SSDownloadPropertyArtistName");
      *(_QWORD *)(v100 + 24) = v58;
      getSSDownloadPropertyArtistNameSymbolLoc_ptr = (uint64_t)v58;
    }
    _Block_object_dispose(&v99, 8);
    if (!v58)
      goto LABEL_61;
    v60 = *v58;
    v108[10] = v60;
    v99 = 0;
    v100 = (uint64_t)&v99;
    v101 = 0x2020000000;
    v61 = (id *)getSSDownloadPropertyGenreSymbolLoc_ptr;
    v102 = (void *)getSSDownloadPropertyGenreSymbolLoc_ptr;
    if (!getSSDownloadPropertyGenreSymbolLoc_ptr)
    {
      v62 = (void *)StoreServicesLibrary();
      v61 = (id *)dlsym(v62, "SSDownloadPropertyGenre");
      *(_QWORD *)(v100 + 24) = v61;
      getSSDownloadPropertyGenreSymbolLoc_ptr = (uint64_t)v61;
    }
    _Block_object_dispose(&v99, 8);
    if (!v61)
      goto LABEL_61;
    v63 = *v61;
    v108[11] = v63;
    v99 = 0;
    v100 = (uint64_t)&v99;
    v101 = 0x2020000000;
    v64 = (id *)getSSDownloadPropertyDurationInMillisecondsSymbolLoc_ptr;
    v102 = (void *)getSSDownloadPropertyDurationInMillisecondsSymbolLoc_ptr;
    if (!getSSDownloadPropertyDurationInMillisecondsSymbolLoc_ptr)
    {
      v65 = (void *)StoreServicesLibrary();
      v64 = (id *)dlsym(v65, "SSDownloadPropertyDurationInMilliseconds");
      *(_QWORD *)(v100 + 24) = v64;
      getSSDownloadPropertyDurationInMillisecondsSymbolLoc_ptr = (uint64_t)v64;
    }
    _Block_object_dispose(&v99, 8);
    if (!v64)
    {
LABEL_61:
      __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
      __break(1u);
    }
    v109 = *v64;
    v66 = (void *)MEMORY[0x1E0C99D20];
    v67 = v109;
    objc_msgSend(v66, "arrayWithObjects:count:", v108, 13);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v95, "setPrefetchedDownloadProperties:", v68);
    objc_msgSend(v95, "setShouldFilterExternalOriginatedDownloads:", 0);
    v104 = 0;
    v105 = &v104;
    v106 = 0x2050000000;
    v69 = (void *)getSSDownloadManagerClass_softClass;
    v107 = getSSDownloadManagerClass_softClass;
    if (!getSSDownloadManagerClass_softClass)
    {
      v99 = MEMORY[0x1E0C809B0];
      v100 = 3221225472;
      v101 = (uint64_t)__getSSDownloadManagerClass_block_invoke;
      v102 = &unk_1E952AB10;
      v103 = &v104;
      __getSSDownloadManagerClass_block_invoke((uint64_t)&v99);
      v69 = (void *)v105[3];
    }
    v70 = objc_retainAutorelease(v69);
    _Block_object_dispose(&v104, 8);
    v71 = objc_msgSend([v70 alloc], "initWithManagerOptions:", v95);
    storeDownloadManager = v2->_storeDownloadManager;
    v2->_storeDownloadManager = (SSDownloadManager *)v71;

    -[SSDownloadManager addObserver:](v2->_storeDownloadManager, "addObserver:", v2);
    v104 = 0;
    v105 = &v104;
    v106 = 0x2050000000;
    v73 = (void *)getSSPurchaseManagerClass_softClass;
    v107 = getSSPurchaseManagerClass_softClass;
    if (!getSSPurchaseManagerClass_softClass)
    {
      v99 = MEMORY[0x1E0C809B0];
      v100 = 3221225472;
      v101 = (uint64_t)__getSSPurchaseManagerClass_block_invoke;
      v102 = &unk_1E952AB10;
      v103 = &v104;
      __getSSPurchaseManagerClass_block_invoke((uint64_t)&v99);
      v73 = (void *)v105[3];
    }
    v74 = objc_retainAutorelease(v73);
    _Block_object_dispose(&v104, 8);
    v75 = [v74 alloc];
    v76 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "bundleIdentifier");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = (objc_class *)objc_opt_class();
    NSStringFromClass(v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "stringWithFormat:", CFSTR("%@.%@"), v78, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v75, "initWithManagerIdentifier:", v81);
    storePurchaseManager = v2->_storePurchaseManager;
    v2->_storePurchaseManager = (SSPurchaseManager *)v82;

    -[SSPurchaseManager setDelegate:](v2->_storePurchaseManager, "setDelegate:", v2);
    v96[0] = MEMORY[0x1E0C809B0];
    v96[1] = 3221225472;
    v96[2] = __50__TLToneStoreDownloadStoreServicesController_init__block_invoke;
    v96[3] = &unk_1E952A748;
    v84 = v2;
    v97 = v84;
    -[TLToneStoreDownloadStoreServicesController _performBlockOnAccessQueue:](v84, "_performBlockOnAccessQueue:", v96);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    getSSAccountStoreChangedNotification();
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(getSSAccountStoreClass(), "defaultStore");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "addObserver:selector:name:object:", v84, sel__handleAccountStoreDidChangeNotification_, v86, v87);

    +[TLToneManager sharedToneManager](TLToneManager, "sharedToneManager");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "addObserver:selector:name:object:", v84, sel__handleToneManagerContentsDidChangeNotification_, CFSTR("_TLToneManagerContentsChangedNotification"), v88);

  }
  return v2;
}

uint64_t __50__TLToneStoreDownloadStoreServicesController_init__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "_updateStoreAccountName");
}

- (void)dealloc
{
  OS_dispatch_queue *accessQueue;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  accessQueue = self->_accessQueue;
  self->_accessQueue = 0;
  v4 = accessQueue;

  -[SSDownloadManager removeObserver:](self->_storeDownloadManager, "removeObserver:", self);
  -[SSPurchaseManager setDelegate:](self->_storePurchaseManager, "setDelegate:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  getSSAccountStoreChangedNotification();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(getSSAccountStoreClass(), "defaultStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, v6, v7);

  +[TLToneManager sharedToneManager](TLToneManager, "sharedToneManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("_TLToneManagerContentsChangedNotification"), v8);

  dispatch_sync(v4, &__block_literal_global_1);
  v9.receiver = self;
  v9.super_class = (Class)TLToneStoreDownloadStoreServicesController;
  -[TLToneStoreDownloadStoreServicesController dealloc](&v9, sel_dealloc);
}

- (NSString)storeAccountName
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  __CFString *v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  v10 = &stru_1E952DE48;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__TLToneStoreDownloadStoreServicesController_storeAccountName__block_invoke;
  v4[3] = &unk_1E952A6F8;
  v4[4] = self;
  v4[5] = &v5;
  -[TLToneStoreDownloadStoreServicesController _performBlockOnAccessQueue:](self, "_performBlockOnAccessQueue:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __62__TLToneStoreDownloadStoreServicesController_storeAccountName__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_updateStoreAccountName
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  BOOL v9;
  id v10;

  -[TLToneStoreDownloadStoreServicesController _assertRunningOnAccessQueue](self, "_assertRunningOnAccessQueue");
  objc_msgSend(getSSAccountStoreClass(), "defaultStore");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = self->_storeAccountName;
  v7 = v5;
  v8 = (void *)v7;
  if (v7 | v6)
  {
    if (!v7 || !v6)
    {

LABEL_9:
      objc_storeStrong((id *)&self->_storeAccountName, v5);
      -[TLToneStoreDownloadStoreServicesController _notifyObserversOfUpdatedStoreAccountName:](self, "_notifyObserversOfUpdatedStoreAccountName:", v8);
      goto LABEL_10;
    }
    if (v6 != v7)
    {
      v9 = objc_msgSend((id)v6, "isEqualToString:", v7);

      if (v9)
        goto LABEL_10;
      goto LABEL_9;
    }
  }

LABEL_10:
}

- (void)_handleAccountStoreDidChangeNotification:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __87__TLToneStoreDownloadStoreServicesController__handleAccountStoreDidChangeNotification___block_invoke;
  v3[3] = &unk_1E952A748;
  v3[4] = self;
  -[TLToneStoreDownloadStoreServicesController _performBlockOnAccessQueue:](self, "_performBlockOnAccessQueue:", v3);
}

uint64_t __87__TLToneStoreDownloadStoreServicesController__handleAccountStoreDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStoreAccountName");
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  TLToneStoreDownloadStoreServicesController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__TLToneStoreDownloadStoreServicesController_addObserver___block_invoke;
  v6[3] = &unk_1E952A6A8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[TLToneStoreDownloadStoreServicesController _performBlockOnAccessQueue:](self, "_performBlockOnAccessQueue:", v6);

}

uint64_t __58__TLToneStoreDownloadStoreServicesController_addObserver___block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    result = objc_msgSend(*(id *)(*(_QWORD *)(result + 40) + 24), "containsObject:");
    if ((result & 1) == 0)
    {
      v2 = *(void **)(*(_QWORD *)(v1 + 40) + 24);
      if (!v2)
      {
        objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
        v3 = objc_claimAutoreleasedReturnValue();
        v4 = *(_QWORD *)(v1 + 40);
        v5 = *(void **)(v4 + 24);
        *(_QWORD *)(v4 + 24) = v3;

        v2 = *(void **)(*(_QWORD *)(v1 + 40) + 24);
      }
      return objc_msgSend(v2, "addObject:", *(_QWORD *)(v1 + 32));
    }
  }
  return result;
}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  TLToneStoreDownloadStoreServicesController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__TLToneStoreDownloadStoreServicesController_removeObserver___block_invoke;
  v6[3] = &unk_1E952A6A8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[TLToneStoreDownloadStoreServicesController _performBlockOnAccessQueue:](self, "_performBlockOnAccessQueue:", v6);

}

uint64_t __61__TLToneStoreDownloadStoreServicesController_removeObserver___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    result = objc_msgSend(*(id *)(*(_QWORD *)(result + 40) + 24), "containsObject:");
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 40) + 24), "removeObject:", *(_QWORD *)(v1 + 32));
  }
  return result;
}

- (void)_notifyObserversOfUpdatedStoreAccountName:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  -[TLToneStoreDownloadStoreServicesController _assertRunningOnAccessQueue](self, "_assertRunningOnAccessQueue");
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __88__TLToneStoreDownloadStoreServicesController__notifyObserversOfUpdatedStoreAccountName___block_invoke;
  v9[3] = &unk_1E952A6A8;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(v6, v9);

}

void __88__TLToneStoreDownloadStoreServicesController__notifyObserversOfUpdatedStoreAccountName___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "storeAccountNameDidChange:", *(_QWORD *)(a1 + 40), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_notifyObserversOfCheckingForDownloadsFinishedWithoutNeedToIssueAnyDownload
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  -[TLToneStoreDownloadStoreServicesController _assertRunningOnAccessQueue](self, "_assertRunningOnAccessQueue");
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __121__TLToneStoreDownloadStoreServicesController__notifyObserversOfCheckingForDownloadsFinishedWithoutNeedToIssueAnyDownload__block_invoke;
  block[3] = &unk_1E952A748;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __121__TLToneStoreDownloadStoreServicesController__notifyObserversOfCheckingForDownloadsFinishedWithoutNeedToIssueAnyDownload__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * v5);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v6, "didFinishCheckingForAvailableToneStoreDownloads:", 0, (_QWORD)v7);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (void)_notifyObserversOfStartedToneStoreDownloads:(id)a3 progressedToneStoreDownload:(id)a4 finishedToneStoreDownloads:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  BOOL v15;
  void *v16;
  NSObject *v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  id v23;
  BOOL v24;
  BOOL v25;
  BOOL v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[TLToneStoreDownloadStoreServicesController _assertRunningOnAccessQueue](self, "_assertRunningOnAccessQueue");
  v11 = objc_msgSend(v8, "count");
  v12 = objc_msgSend(v9, "count");
  v13 = objc_msgSend(v10, "count");
  if (v11 || v12 || v13)
  {
    v14 = v13 != 0;
    v15 = v11 != 0;
    -[NSHashTable allObjects](self->_observers, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __145__TLToneStoreDownloadStoreServicesController__notifyObserversOfStartedToneStoreDownloads_progressedToneStoreDownload_finishedToneStoreDownloads___block_invoke;
    block[3] = &unk_1E952AD30;
    v20 = v16;
    v24 = v15;
    v21 = v8;
    v25 = v12 != 0;
    v22 = v9;
    v26 = v14;
    v23 = v10;
    v18 = v16;
    dispatch_async(v17, block);

  }
}

void __145__TLToneStoreDownloadStoreServicesController__notifyObserversOfStartedToneStoreDownloads_progressedToneStoreDownload_finishedToneStoreDownloads___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if (*(_BYTE *)(a1 + 64))
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v7, "didFinishCheckingForAvailableToneStoreDownloads:", 1, (_QWORD)v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v7, "toneStoreDownloadsDidStart:", *(_QWORD *)(a1 + 40));
        }
        if (*(_BYTE *)(a1 + 65) && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "toneStoreDownloadsDidProgress:", *(_QWORD *)(a1 + 48));
        if (*(_BYTE *)(a1 + 66) && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "toneStoreDownloadsDidFinish:", *(_QWORD *)(a1 + 56));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)openAlertToneStore
{
  _QWORD *v3;
  void *v4;
  _Unwind_Exception *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v3 = (_QWORD *)getSSItemKindToneSymbolLoc_ptr;
  v9 = getSSItemKindToneSymbolLoc_ptr;
  if (!getSSItemKindToneSymbolLoc_ptr)
  {
    v4 = (void *)StoreServicesLibrary();
    v3 = dlsym(v4, "SSItemKindTone");
    v7[3] = (uint64_t)v3;
    getSSItemKindToneSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v6, 8);
  if (!v3)
  {
    v5 = (_Unwind_Exception *)__73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  -[TLToneStoreDownloadStoreServicesController _openToneStoreWithStoreItemKind:](self, "_openToneStoreWithStoreItemKind:", *v3, v6);
}

- (void)openRingtoneStore
{
  _QWORD *v3;
  void *v4;
  _Unwind_Exception *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v3 = (_QWORD *)getSSItemKindRingtoneSymbolLoc_ptr;
  v9 = getSSItemKindRingtoneSymbolLoc_ptr;
  if (!getSSItemKindRingtoneSymbolLoc_ptr)
  {
    v4 = (void *)StoreServicesLibrary();
    v3 = dlsym(v4, "SSItemKindRingtone");
    v7[3] = (uint64_t)v3;
    getSSItemKindRingtoneSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v6, 8);
  if (!v3)
  {
    v5 = (_Unwind_Exception *)__73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  -[TLToneStoreDownloadStoreServicesController _openToneStoreWithStoreItemKind:](self, "_openToneStoreWithStoreItemKind:", *v3, v6);
}

- (void)_openToneStoreWithStoreItemKind:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _Unwind_Exception *v9;
  _QWORD block[2];
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;

  v3 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v4 = getSSItemStoreFrontURLForItemKindSymbolLoc_ptr;
  v17 = getSSItemStoreFrontURLForItemKindSymbolLoc_ptr;
  if (!getSSItemStoreFrontURLForItemKindSymbolLoc_ptr)
  {
    v5 = (void *)StoreServicesLibrary();
    v4 = dlsym(v5, "SSItemStoreFrontURLForItemKind");
    v15[3] = (uint64_t)v4;
    getSSItemStoreFrontURLForItemKindSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v14, 8);
  if (!v4)
  {
    v9 = (_Unwind_Exception *)__73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
    _Block_object_dispose(&v14, 8);
    _Unwind_Resume(v9);
  }
  ((void (*)(id))v4)(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  v11 = __78__TLToneStoreDownloadStoreServicesController__openToneStoreWithStoreItemKind___block_invoke;
  v12 = &unk_1E952A748;
  v13 = v6;
  v7 = (void *)MEMORY[0x1E0CB3978];
  v8 = v6;
  if (objc_msgSend(v7, "isMainThread"))
    v11((uint64_t)block);
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __78__TLToneStoreDownloadStoreServicesController__openToneStoreWithStoreItemKind___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getUIApplicationClass_softClass;
  v9 = getUIApplicationClass_softClass;
  if (!getUIApplicationClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getUIApplicationClass_block_invoke;
    v5[3] = &unk_1E952AB10;
    v5[4] = &v6;
    __getUIApplicationClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v3, "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openURL:options:completionHandler:", *(_QWORD *)(a1 + 32), MEMORY[0x1E0C9AA70], 0);

}

- (void)redownloadAllTones
{
  void *v3;
  objc_class *v4;
  id v5;
  id *v6;
  void *v7;
  id v8;
  id *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  NSObject *v19;
  SSPurchaseManager *storePurchaseManager;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v27 = 0;
  v28 = &v27;
  v29 = 0x2050000000;
  v3 = (void *)getSSTonePurchaseClass_softClass;
  v30 = getSSTonePurchaseClass_softClass;
  if (!getSSTonePurchaseClass_softClass)
  {
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = (uint64_t)__getSSTonePurchaseClass_block_invoke;
    v25 = &unk_1E952AB10;
    v26 = &v27;
    __getSSTonePurchaseClass_block_invoke((uint64_t)&v22);
    v3 = (void *)v28[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v27, 8);
  v5 = objc_alloc_init(v4);
  v22 = 0;
  v23 = (uint64_t)&v22;
  v24 = 0x2020000000;
  v6 = (id *)getSSItemToneStyleRingtoneSymbolLoc_ptr;
  v25 = (void *)getSSItemToneStyleRingtoneSymbolLoc_ptr;
  if (!getSSItemToneStyleRingtoneSymbolLoc_ptr)
  {
    v7 = (void *)StoreServicesLibrary();
    v6 = (id *)dlsym(v7, "SSItemToneStyleRingtone");
    *(_QWORD *)(v23 + 24) = v6;
    getSSItemToneStyleRingtoneSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v22, 8);
  if (!v6)
    goto LABEL_17;
  v8 = *v6;
  v32 = v8;
  v22 = 0;
  v23 = (uint64_t)&v22;
  v24 = 0x2020000000;
  v9 = (id *)getSSItemToneStyleTextToneSymbolLoc_ptr;
  v25 = (void *)getSSItemToneStyleTextToneSymbolLoc_ptr;
  if (!getSSItemToneStyleTextToneSymbolLoc_ptr)
  {
    v10 = (void *)StoreServicesLibrary();
    v9 = (id *)dlsym(v10, "SSItemToneStyleTextTone");
    *(_QWORD *)(v23 + 24) = v9;
    getSSItemToneStyleTextToneSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v22, 8);
  if (!v9)
    goto LABEL_17;
  v33 = *v9;
  v11 = (void *)MEMORY[0x1E0C99D20];
  v12 = v33;
  objc_msgSend(v11, "arrayWithObjects:count:", &v32, 2, v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAllowedToneStyles:", v13);

  objc_msgSend(v5, "setCreatesDownloads:", 0);
  v22 = 0;
  v23 = (uint64_t)&v22;
  v24 = 0x2020000000;
  v14 = (_QWORD *)getSSDownloadPropertyIsRedownloadSymbolLoc_ptr;
  v25 = (void *)getSSDownloadPropertyIsRedownloadSymbolLoc_ptr;
  if (!getSSDownloadPropertyIsRedownloadSymbolLoc_ptr)
  {
    v15 = (void *)StoreServicesLibrary();
    v14 = dlsym(v15, "SSDownloadPropertyIsRedownload");
    *(_QWORD *)(v23 + 24) = v14;
    getSSDownloadPropertyIsRedownloadSymbolLoc_ptr = (uint64_t)v14;
  }
  _Block_object_dispose(&v22, 8);
  if (!v14)
  {
LABEL_17:
    __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
    __break(1u);
  }
  objc_msgSend(v5, "setValue:forDownloadProperty:", MEMORY[0x1E0C9AAB0], *v14, v22);
  v27 = 0;
  v28 = &v27;
  v29 = 0x2050000000;
  v16 = (void *)getSSMutableURLRequestPropertiesClass_softClass;
  v30 = getSSMutableURLRequestPropertiesClass_softClass;
  if (!getSSMutableURLRequestPropertiesClass_softClass)
  {
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = (uint64_t)__getSSMutableURLRequestPropertiesClass_block_invoke;
    v25 = &unk_1E952AB10;
    v26 = &v27;
    __getSSMutableURLRequestPropertiesClass_block_invoke((uint64_t)&v22);
    v16 = (void *)v28[3];
  }
  v17 = objc_retainAutorelease(v16);
  _Block_object_dispose(&v27, 8);
  v18 = (void *)objc_msgSend([v17 alloc], "initWithURLRequest:", 0);
  objc_msgSend(v18, "setURLBagKey:", CFSTR("redownloadAllTones"));
  objc_msgSend(v5, "setRequestProperties:", v18);
  TLLogToneManagement();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22) = 0;
    _os_log_impl(&dword_1D33D5000, v19, OS_LOG_TYPE_DEFAULT, "Issuing store purchase for tones.", (uint8_t *)&v22, 2u);
  }

  storePurchaseManager = self->_storePurchaseManager;
  v31 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSPurchaseManager addPurchases:withCompletionBlock:](storePurchaseManager, "addPurchases:withCompletionBlock:", v21, &__block_literal_global_34);

}

void __64__TLToneStoreDownloadStoreServicesController_redownloadAllTones__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  TLLogToneManagement();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D33D5000, v6, OS_LOG_TYPE_DEFAULT, "Store purchase did complete successfully for tones.", v7, 2u);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    __64__TLToneStoreDownloadStoreServicesController_redownloadAllTones__block_invoke_cold_1(v4);
  }

}

- (void)downloadManager:(id)a3 downloadStatesDidChange:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  TLToneStoreDownloadStoreServicesController *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __86__TLToneStoreDownloadStoreServicesController_downloadManager_downloadStatesDidChange___block_invoke;
  v7[3] = &unk_1E952A6A8;
  v8 = v5;
  v9 = self;
  v6 = v5;
  -[TLToneStoreDownloadStoreServicesController _performBlockOnAccessQueue:](self, "_performBlockOnAccessQueue:", v7);

}

void __86__TLToneStoreDownloadStoreServicesController_downloadManager_downloadStatesDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  void *v10;
  id v11;
  id *v12;
  void *v13;
  id v14;
  double v15;
  _QWORD *v16;
  void *v17;
  char v18;
  uint64_t v19;
  id obj;
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = a1;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v24;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v24 != v3)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v4);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v5, "persistentIdentifier"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(v22 + 40) + 40), "objectForKey:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          objc_msgSend(v5, "downloadPhaseIdentifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = 0;
          v28 = &v27;
          v29 = 0x2020000000;
          v9 = (id *)getSSDownloadPhaseFinishedSymbolLoc_ptr;
          v30 = getSSDownloadPhaseFinishedSymbolLoc_ptr;
          if (!getSSDownloadPhaseFinishedSymbolLoc_ptr)
          {
            v10 = (void *)StoreServicesLibrary();
            v9 = (id *)dlsym(v10, "SSDownloadPhaseFinished");
            v28[3] = (uint64_t)v9;
            getSSDownloadPhaseFinishedSymbolLoc_ptr = (uint64_t)v9;
          }
          _Block_object_dispose(&v27, 8);
          if (!v9)
          {
LABEL_29:
            __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
            __break(1u);
          }
          v11 = *v9;
          if ((objc_msgSend(v8, "isEqualToString:", v11) & 1) != 0)
          {
LABEL_16:

          }
          else
          {
            v27 = 0;
            v28 = &v27;
            v29 = 0x2020000000;
            v12 = (id *)getSSDownloadPhaseFailedSymbolLoc_ptr;
            v30 = getSSDownloadPhaseFailedSymbolLoc_ptr;
            if (!getSSDownloadPhaseFailedSymbolLoc_ptr)
            {
              v13 = (void *)StoreServicesLibrary();
              v12 = (id *)dlsym(v13, "SSDownloadPhaseFailed");
              v28[3] = (uint64_t)v12;
              getSSDownloadPhaseFailedSymbolLoc_ptr = (uint64_t)v12;
            }
            _Block_object_dispose(&v27, 8);
            if (!v12)
              goto LABEL_29;
            v14 = *v12;
            if (objc_msgSend(v8, "isEqualToString:", v14))
            {

              goto LABEL_16;
            }
            v27 = 0;
            v28 = &v27;
            v29 = 0x2020000000;
            v16 = (_QWORD *)getSSDownloadPhaseCanceledSymbolLoc_ptr;
            v30 = getSSDownloadPhaseCanceledSymbolLoc_ptr;
            if (!getSSDownloadPhaseCanceledSymbolLoc_ptr)
            {
              v17 = (void *)StoreServicesLibrary();
              v16 = dlsym(v17, "SSDownloadPhaseCanceled");
              v28[3] = (uint64_t)v16;
              getSSDownloadPhaseCanceledSymbolLoc_ptr = (uint64_t)v16;
            }
            _Block_object_dispose(&v27, 8);
            if (!v16)
              goto LABEL_29;
            v18 = objc_msgSend(v8, "isEqualToString:", *v16);

            if ((v18 & 1) == 0)
            {
              objc_msgSend(v5, "percentComplete");
LABEL_19:
              *(float *)&v15 = v15;
              objc_msgSend(v7, "_setDownloadProgress:", v15);
              objc_msgSend(v21, "addObject:", v7);

              goto LABEL_20;
            }
          }
          objc_msgSend(v5, "percentComplete");
          if (v15 < 0.99)
            v15 = 0.99;
          goto LABEL_19;
        }
LABEL_20:

        ++v4;
      }
      while (v2 != v4);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      v2 = v19;
    }
    while (v19);
  }

  objc_msgSend(*(id *)(v22 + 40), "_notifyObserversOfStartedToneStoreDownloads:progressedToneStoreDownload:finishedToneStoreDownloads:", 0, v21, 0);
}

- (void)purchaseManager:(id)a3 didFinishPurchasesWithResponses:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;
  TLToneStoreDownload *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  TLITunesTone *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  objc_class *v38;
  _QWORD *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t v43;
  int v44;
  SSDownloadManager *storeDownloadManager;
  id v46;
  id obj;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  void *v60;
  void *v61;
  _QWORD v62[4];
  id v63;
  id v64;
  _QWORD v65[5];
  id v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint8_t v86[128];
  _BYTE buf[24];
  void *v88;
  uint64_t *v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v5 = a4;
  v53 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v52 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v58 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  obj = v5;
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
  if (v50)
  {
    v49 = *(_QWORD *)v77;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v77 != v49)
        {
          v7 = v6;
          objc_enumerationMutation(obj);
          v6 = v7;
        }
        v51 = v6;
        v8 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v6);
        TLLogToneManagement();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v8, "URLResponse", v46);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "storeCorrelationID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v11;
          _os_log_impl(&dword_1D33D5000, v9, OS_LOG_TYPE_DEFAULT, "Did finish store purchase with correlation key: %{public}@.", buf, 0xCu);

        }
        +[TLToneManager sharedToneManager](TLToneManager, "sharedToneManager");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "_installedTones");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "downloadsMetadata");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        v55 = v12;
        v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
        if (v57)
        {
          v56 = *(_QWORD *)v73;
          while (2)
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v73 != v56)
              {
                v14 = v13;
                objc_enumerationMutation(v55);
                v13 = v14;
              }
              v59 = v13;
              v15 = *(id *)(*((_QWORD *)&v72 + 1) + 8 * v13);
              objc_msgSend(v15, "kind");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              getSSDownloadKindRingtone();
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v60, "isEqualToString:", v16))
              {

              }
              else
              {
                getSSDownloadKindTone();
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v60, "isEqualToString:", v17);

                if ((v18 & 1) == 0)
                {
                  getSSDownloadKindRingtone();
                  v19 = objc_claimAutoreleasedReturnValue();

                  v20 = (void *)objc_msgSend(v15, "copy");
                  objc_msgSend(v20, "setKind:", v19);
                  v60 = (void *)v19;
                  v15 = v20;
                }
              }
              v21 = objc_alloc_init(TLToneStoreDownload);
              objc_msgSend(v15, "title");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              -[TLToneStoreDownload _setName:](v21, "_setName:", v22);

              objc_msgSend(v15, "collectionName");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              -[TLToneStoreDownload _setAlbumTitle:](v21, "_setAlbumTitle:", v23);

              objc_msgSend(v15, "artistName");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[TLToneStoreDownload _setArtistName:](v21, "_setArtistName:", v24);

              objc_msgSend(v15, "durationInMilliseconds");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_opt_respondsToSelector() & 1) != 0)
                v26 = objc_msgSend(v25, "unsignedIntegerValue");
              else
                v26 = 0;
              -[TLToneStoreDownload _setDuration:](v21, "_setDuration:", (double)v26 / 1000.0, v46);

              objc_msgSend(v15, "genre");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[TLToneStoreDownload _setGenreName:](v21, "_setGenreName:", v27);

              -[TLToneStoreDownload _setStoreItemIdentifier:](v21, "_setStoreItemIdentifier:", objc_msgSend(v15, "itemIdentifier"));
              getSSDownloadKindTone();
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              -[TLToneStoreDownload _setRingtone:](v21, "_setRingtone:", objc_msgSend(v60, "isEqualToString:", v28) ^ 1);

              v29 = objc_msgSend(v58, "indexOfObject:", v21);
              if (v29 == 0x7FFFFFFFFFFFFFFFLL)
              {
                v30 = -[TLITunesTone initWithToneStoreDownload:]([TLITunesTone alloc], "initWithToneStoreDownload:", v21);
                v70 = 0u;
                v71 = 0u;
                v68 = 0u;
                v69 = 0u;
                v31 = v54;
                v32 = -[NSObject countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
                if (v32)
                {
                  v9 = *(NSObject **)v69;
                  while (2)
                  {
                    for (i = 0; i != v32; ++i)
                    {
                      if (*(NSObject **)v69 != v9)
                        objc_enumerationMutation(v31);
                      v34 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
                      if (-[TLITunesTone isDuplicateOfTone:](v30, "isDuplicateOfTone:", v34))
                      {
                        objc_msgSend(v34, "identifier");
                        v35 = (void *)objc_claimAutoreleasedReturnValue();
                        v36 = objc_msgSend(v61, "toneWithIdentifierIsValid:", v35);

                        if (v36)
                        {
                          TLLogToneManagement();
                          v42 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)buf = 138543618;
                            *(_QWORD *)&buf[4] = v15;
                            *(_WORD *)&buf[12] = 2114;
                            *(_QWORD *)&buf[14] = v34;
                            _os_log_impl(&dword_1D33D5000, v42, OS_LOG_TYPE_DEFAULT, "Store download metadata %{public}@ of tone was found to be a duplicate of the following existing tone: %{public}@. This tone will not be re-downloaded.", buf, 0x16u);
                          }

                          goto LABEL_43;
                        }
                      }
                    }
                    v32 = -[NSObject countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v68, v84, 16);
                    if (v32)
                      continue;
                    break;
                  }
                }

                objc_msgSend(v58, "addObject:", v21);
                v80 = 0;
                v81 = &v80;
                v82 = 0x2050000000;
                v37 = (void *)getSSDownloadClass_softClass;
                v83 = getSSDownloadClass_softClass;
                if (!getSSDownloadClass_softClass)
                {
                  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                  *(_QWORD *)&buf[8] = 3221225472;
                  *(_QWORD *)&buf[16] = __getSSDownloadClass_block_invoke;
                  v88 = &unk_1E952AB10;
                  v89 = &v80;
                  __getSSDownloadClass_block_invoke((uint64_t)buf);
                  v37 = (void *)v81[3];
                }
                v38 = objc_retainAutorelease(v37);
                _Block_object_dispose(&v80, 8);
                v30 = (TLITunesTone *)objc_msgSend([v38 alloc], "initWithDownloadMetadata:", v15);
                *(_QWORD *)buf = 0;
                *(_QWORD *)&buf[8] = buf;
                *(_QWORD *)&buf[16] = 0x2020000000;
                v39 = (_QWORD *)getSSDownloadPropertyIsStoreDownloadSymbolLoc_ptr;
                v88 = (void *)getSSDownloadPropertyIsStoreDownloadSymbolLoc_ptr;
                if (!getSSDownloadPropertyIsStoreDownloadSymbolLoc_ptr)
                {
                  v40 = (void *)StoreServicesLibrary();
                  v39 = dlsym(v40, "SSDownloadPropertyIsStoreDownload");
                  *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v39;
                  getSSDownloadPropertyIsStoreDownloadSymbolLoc_ptr = (uint64_t)v39;
                }
                _Block_object_dispose(buf, 8);
                if (!v39)
                {
                  v44 = __73__TLToneManager__ensureTCCAccessPreflightAndCheckForFileExistenceAtPath___block_invoke_cold_1();
                  __break(1u);
                  goto LABEL_52;
                }
                -[TLITunesTone setValue:forProperty:](v30, "setValue:forProperty:", MEMORY[0x1E0C9AAB0], *v39);
                objc_msgSend(v53, "addObject:", v30);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[TLITunesTone persistentIdentifier](v30, "persistentIdentifier"));
                v31 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "setObject:forKey:", v21, v31);
                TLLogToneManagement();
                v41 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543874;
                  *(_QWORD *)&buf[4] = v21;
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v30;
                  *(_WORD *)&buf[22] = 2114;
                  v88 = v15;
                  _os_log_impl(&dword_1D33D5000, v41, OS_LOG_TYPE_DEFAULT, "Issuing store download for %{public}@: %{public}@ (based on %{public}@).", buf, 0x20u);
                }

              }
              else
              {
                objc_msgSend(v58, "objectAtIndex:", v29);
                v30 = (TLITunesTone *)objc_claimAutoreleasedReturnValue();
                TLLogToneManagement();
                v31 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  *(_QWORD *)&buf[4] = v15;
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = v30;
                  _os_log_impl(&dword_1D33D5000, v31, OS_LOG_TYPE_DEFAULT, "Store download metadata %{public}@ of tone was found to be a duplicate of the following upcoming tone download: %{public}@. This tone will not be re-downloaded.", buf, 0x16u);
                }
              }
LABEL_43:

              v13 = v59 + 1;
            }
            while (v59 + 1 != v57);
            v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v72, v85, 16);
            if (v57)
              continue;
            break;
          }
        }

        v6 = v51 + 1;
      }
      while (v51 + 1 != v50);
      v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v86, 16);
    }
    while (v50);
  }

  v43 = objc_msgSend(v53, "count");
  v65[0] = MEMORY[0x1E0C809B0];
  v65[1] = 3221225472;
  v65[2] = __94__TLToneStoreDownloadStoreServicesController_purchaseManager_didFinishPurchasesWithResponses___block_invoke;
  v65[3] = &unk_1E952AD98;
  v67 = v43;
  v65[4] = self;
  v39 = v52;
  v66 = v39;
  -[TLToneStoreDownloadStoreServicesController _performBlockOnAccessQueue:](self, "_performBlockOnAccessQueue:", v65);
  TLLogToneManagement();
  v9 = objc_claimAutoreleasedReturnValue();
  v44 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v43)
  {
    if (v44)
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v43;
      _os_log_impl(&dword_1D33D5000, v9, OS_LOG_TYPE_DEFAULT, "Adding %lu tone store downloads.", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    storeDownloadManager = self->_storeDownloadManager;
    v62[0] = MEMORY[0x1E0C809B0];
    v62[1] = 3221225472;
    v62[2] = __94__TLToneStoreDownloadStoreServicesController_purchaseManager_didFinishPurchasesWithResponses___block_invoke_39;
    v62[3] = &unk_1E952ADC0;
    objc_copyWeak(&v64, (id *)buf);
    v63 = v58;
    -[SSDownloadManager addDownloads:completionBlock:](storeDownloadManager, "addDownloads:completionBlock:", v53, v62);

    objc_destroyWeak(&v64);
    objc_destroyWeak((id *)buf);
  }
  else
  {
LABEL_52:
    if (v44)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D33D5000, v9, OS_LOG_TYPE_DEFAULT, "No previously purchased tone needs to be redownloaded. We're done here.", buf, 2u);
    }

  }
}

uint64_t __94__TLToneStoreDownloadStoreServicesController_purchaseManager_didFinishPurchasesWithResponses___block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 48))
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addEntriesFromDictionary:", *(_QWORD *)(a1 + 40));
  else
    return objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfCheckingForDownloadsFinishedWithoutNeedToIssueAnyDownload");
}

void __94__TLToneStoreDownloadStoreServicesController_purchaseManager_didFinishPurchasesWithResponses___block_invoke_39(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[8];
  _QWORD v10[5];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    TLLogToneManagement();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __94__TLToneStoreDownloadStoreServicesController_purchaseManager_didFinishPurchasesWithResponses___block_invoke_39_cold_1(v3);

      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __94__TLToneStoreDownloadStoreServicesController_purchaseManager_didFinishPurchasesWithResponses___block_invoke_40;
      v10[3] = &unk_1E952A748;
      v10[4] = WeakRetained;
      objc_msgSend(WeakRetained, "_performBlockOnAccessQueue:", v10);
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D33D5000, v6, OS_LOG_TYPE_DEFAULT, "Successfully added store downloads for tones.", buf, 2u);
      }

      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __94__TLToneStoreDownloadStoreServicesController_purchaseManager_didFinishPurchasesWithResponses___block_invoke_41;
      v7[3] = &unk_1E952A6A8;
      v7[4] = WeakRetained;
      v8 = *(id *)(a1 + 32);
      objc_msgSend(WeakRetained, "_performBlockOnAccessQueue:", v7);

    }
  }

}

uint64_t __94__TLToneStoreDownloadStoreServicesController_purchaseManager_didFinishPurchasesWithResponses___block_invoke_40(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfCheckingForDownloadsFinishedWithoutNeedToIssueAnyDownload");
}

uint64_t __94__TLToneStoreDownloadStoreServicesController_purchaseManager_didFinishPurchasesWithResponses___block_invoke_41(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfStartedToneStoreDownloads:progressedToneStoreDownload:finishedToneStoreDownloads:", *(_QWORD *)(a1 + 40), 0, 0);
}

- (void)_handleToneManagerContentsDidChangeNotification:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  +[TLToneManager sharedToneManager](TLToneManager, "sharedToneManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_installedTones");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__TLToneStoreDownloadStoreServicesController__handleToneManagerContentsDidChangeNotification___block_invoke;
  v8[3] = &unk_1E952AE10;
  v8[4] = self;
  v9 = v5;
  v10 = v4;
  v6 = v4;
  v7 = v5;
  -[TLToneStoreDownloadStoreServicesController _performBlockOnAccessQueue:](self, "_performBlockOnAccessQueue:", v8);

}

void __94__TLToneStoreDownloadStoreServicesController__handleToneManagerContentsDidChangeNotification___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__TLToneStoreDownloadStoreServicesController__handleToneManagerContentsDidChangeNotification___block_invoke_2;
  v8[3] = &unk_1E952ADE8;
  v9 = v4;
  v10 = *(id *)(a1 + 48);
  v11 = v2;
  v12 = v3;
  v6 = v3;
  v7 = v2;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectsForKeys:", v6);
  objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfStartedToneStoreDownloads:progressedToneStoreDownload:finishedToneStoreDownloads:", 0, 0, v7);

}

void __94__TLToneStoreDownloadStoreServicesController__handleToneManagerContentsDidChangeNotification___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  TLITunesTone *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = -[TLITunesTone initWithToneStoreDownload:]([TLITunesTone alloc], "initWithToneStoreDownload:", v6);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = a1[4];
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v13, "identifier", (_QWORD)v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isDuplicateOfTone:", v7)
          && objc_msgSend(a1[5], "toneWithIdentifierIsValid:", v14))
        {
          objc_msgSend(v6, "_setToneIdentifier:", v14);
          objc_msgSend(a1[6], "addObject:", v6);
          objc_msgSend(a1[7], "addObject:", v5);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (void)_performBlockOnAccessQueue:(id)a3
{
  NSObject *accessQueue;

  accessQueue = self->_accessQueue;
  if (accessQueue)
    dispatch_sync(accessQueue, a3);
}

- (void)_assertRunningOnAccessQueue
{
  OUTLINED_FUNCTION_5(&dword_1D33D5000, a1, a3, "*** Assertion failure.", a5, a6, a7, a8, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storePurchaseManager, 0);
  objc_storeStrong((id *)&self->_storeDownloadManager, 0);
  objc_storeStrong((id *)&self->_toneStoreDownloadsByStoreDownloadPersistentIdentifiers, 0);
  objc_storeStrong((id *)&self->_storeAccountName, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_accessQueueLabel, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

void __64__TLToneStoreDownloadStoreServicesController_redownloadAllTones__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "tl_nonRedundantDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1D33D5000, v2, v3, "Failed to add store purchase for tones with error: %{public}@.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

void __94__TLToneStoreDownloadStoreServicesController_purchaseManager_didFinishPurchasesWithResponses___block_invoke_39_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "tl_nonRedundantDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1D33D5000, v2, v3, "Failed to add store downloads for tones with error: %{public}@.", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

@end
