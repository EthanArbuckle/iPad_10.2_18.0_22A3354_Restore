@implementation PSEVideoProcessor

+ (BOOL)needsProcessing
{
  void *v2;
  void *v3;
  int v4;
  uint64_t (*v5)(void);
  _Unwind_Exception *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;

  v8 = 0;
  v9 = (uint64_t)&v8;
  v10 = 0x2020000000;
  v2 = get_AXSPhotosensitiveMitigationEnabledSymbolLoc_ptr;
  v11 = get_AXSPhotosensitiveMitigationEnabledSymbolLoc_ptr;
  if (!get_AXSPhotosensitiveMitigationEnabledSymbolLoc_ptr)
  {
    v3 = (void *)libAccessibilityLibrary();
    v2 = dlsym(v3, "_AXSPhotosensitiveMitigationEnabled");
    *(_QWORD *)(v9 + 24) = v2;
    get_AXSPhotosensitiveMitigationEnabledSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v8, 8);
  if (!v2)
  {
    +[PSEVideoProcessor needsProcessing].cold.1();
    goto LABEL_11;
  }
  v4 = ((uint64_t (*)(void))v2)();
  if (v4)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v5 = (uint64_t (*)(void))getAXDeviceSupportsPhotosensitiveMitigationSymbolLoc_ptr;
    v16 = getAXDeviceSupportsPhotosensitiveMitigationSymbolLoc_ptr;
    if (!getAXDeviceSupportsPhotosensitiveMitigationSymbolLoc_ptr)
    {
      v8 = MEMORY[0x24BDAC760];
      v9 = 3221225472;
      v10 = (uint64_t)__getAXDeviceSupportsPhotosensitiveMitigationSymbolLoc_block_invoke;
      v11 = &unk_2514EC2C0;
      v12 = &v13;
      __getAXDeviceSupportsPhotosensitiveMitigationSymbolLoc_block_invoke((uint64_t)&v8);
      v5 = (uint64_t (*)(void))v14[3];
    }
    _Block_object_dispose(&v13, 8);
    if (v5)
    {
      LOBYTE(v4) = v5();
      return v4;
    }
LABEL_11:
    v6 = (_Unwind_Exception *)+[PSEVideoProcessor needsProcessing].cold.1();
    _Block_object_dispose(&v13, 8);
    _Unwind_Resume(v6);
  }
  return v4;
}

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  v2 = os_log_create("com.apple.Accessibility", "Photosensitivity");
  v3 = (void *)PSELog;
  PSELog = (uint64_t)v2;

}

- (PSEVideoProcessor)init
{
  PSEVideoProcessor *v2;
  MTLDevice *v3;
  MTLDevice *device;
  uint64_t v5;
  SwiftVideoProcessor *swiftProcessor;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  _Unwind_Exception *v14;
  objc_super v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v15.receiver = self;
  v15.super_class = (Class)PSEVideoProcessor;
  v2 = -[PSEVideoProcessor init](&v15, sel_init);
  v2->_needsInitialization = 1;
  v3 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  device = v2->_device;
  v2->_device = v3;

  if (!v2->_swiftProcessor)
  {
    v5 = objc_opt_new();
    swiftProcessor = v2->_swiftProcessor;
    v2->_swiftProcessor = (SwiftVideoProcessor *)v5;

  }
  -[PSEVideoProcessor _visualDebuggingChanged:](v2, "_visualDebuggingChanged:", 0);
  -[PSEVideoProcessor _sourceCopyDebuggingChanged:](v2, "_sourceCopyDebuggingChanged:", 0);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v8 = (_QWORD *)getkAXSPhotosensitiveVisualDebuggingEnabledNotificationSymbolLoc_ptr;
  v19 = getkAXSPhotosensitiveVisualDebuggingEnabledNotificationSymbolLoc_ptr;
  if (!getkAXSPhotosensitiveVisualDebuggingEnabledNotificationSymbolLoc_ptr)
  {
    v9 = (void *)libAccessibilityLibrary();
    v8 = dlsym(v9, "kAXSPhotosensitiveVisualDebuggingEnabledNotification");
    v17[3] = (uint64_t)v8;
    getkAXSPhotosensitiveVisualDebuggingEnabledNotificationSymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v16, 8);
  if (!v8)
  {
    +[PSEVideoProcessor needsProcessing].cold.1();
    goto LABEL_11;
  }
  objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__visualDebuggingChanged_, *v8, 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v11 = (_QWORD *)getkAXSPhotosensitiveSourceCopyDebuggingEnabledNotificationSymbolLoc_ptr;
  v19 = getkAXSPhotosensitiveSourceCopyDebuggingEnabledNotificationSymbolLoc_ptr;
  if (!getkAXSPhotosensitiveSourceCopyDebuggingEnabledNotificationSymbolLoc_ptr)
  {
    v12 = (void *)libAccessibilityLibrary();
    v11 = dlsym(v12, "kAXSPhotosensitiveSourceCopyDebuggingEnabledNotification");
    v17[3] = (uint64_t)v11;
    getkAXSPhotosensitiveSourceCopyDebuggingEnabledNotificationSymbolLoc_ptr = (uint64_t)v11;
  }
  _Block_object_dispose(&v16, 8);
  if (!v11)
  {
LABEL_11:
    v14 = (_Unwind_Exception *)+[PSEVideoProcessor needsProcessing].cold.1();
    _Block_object_dispose(&v16, 8);
    _Unwind_Resume(v14);
  }
  objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel__sourceCopyDebuggingChanged_, *v11, 0);

  return v2;
}

- (void)_visualDebuggingChanged:(id)a3
{
  void *v5;
  void *v6;
  _BOOL8 bCopyOnly;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  self->_bufferConstants.bDebug = soft_AXSPhotosensitiveVisualDebuggingEnabled() != 0;
  -[SwiftVideoProcessor setDebugMode:](self->_swiftProcessor, "setDebugMode:", soft_AXSPhotosensitiveVisualDebuggingEnabled() != 0);
  if (a3)
  {
    v5 = (void *)PSELog;
    if (os_log_type_enabled((os_log_t)PSELog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)MEMORY[0x24BDD16E0];
      bCopyOnly = self->_bufferConstants.bCopyOnly;
      v8 = v5;
      objc_msgSend(v6, "numberWithBool:", bCopyOnly);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_2443B6000, v8, OS_LOG_TYPE_DEFAULT, "Visual debug mode: %@", (uint8_t *)&v10, 0xCu);

    }
  }
}

- (void)_sourceCopyDebuggingChanged:(id)a3
{
  void *v5;
  void *v6;
  _BOOL8 bCopyOnly;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  self->_bufferConstants.bCopyOnly = soft_AXSPhotosensitiveSourceCopyDebuggingEnabled() != 0;
  -[SwiftVideoProcessor setCopySourceOnlyDebugging:](self->_swiftProcessor, "setCopySourceOnlyDebugging:", soft_AXSPhotosensitiveSourceCopyDebuggingEnabled() != 0);
  if (a3)
  {
    v5 = (void *)PSELog;
    if (os_log_type_enabled((os_log_t)PSELog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)MEMORY[0x24BDD16E0];
      bCopyOnly = self->_bufferConstants.bCopyOnly;
      v8 = v5;
      objc_msgSend(v6, "numberWithBool:", bCopyOnly);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_2443B6000, v8, OS_LOG_TYPE_DEFAULT, "Source copy only mode: %@", (uint8_t *)&v10, 0xCu);

    }
  }
}

- (void)setValidationCallback:(id)a3
{
  id v4;
  void *v5;
  id validationCallback;

  v4 = a3;
  v5 = _Block_copy(v4);
  validationCallback = self->_validationCallback;
  self->_validationCallback = v5;

  -[SwiftVideoProcessor setValidationCallback:](self->_swiftProcessor, "setValidationCallback:", v4);
  self->_bufferConstants.bCallbackValues = v4 != 0;
}

- (void)_initialize
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2443B6000, v0, v1, "No library: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __32__PSEVideoProcessor__initialize__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
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
  NSObject *v105;
  uint8_t v106[16];

  v0 = (void *)UFMKernels;
  UFMKernels = (uint64_t)&unk_2514FB428;

  v1 = (void *)qword_25735D528;
  qword_25735D528 = (uint64_t)&unk_2514FB440;

  v2 = (void *)qword_25735D530;
  qword_25735D530 = (uint64_t)&unk_2514FB458;

  v3 = (void *)qword_25735D538;
  qword_25735D538 = (uint64_t)&unk_2514FB470;

  v4 = (void *)qword_25735D540;
  qword_25735D540 = (uint64_t)&unk_2514FB488;

  v5 = (void *)qword_25735D548;
  qword_25735D548 = (uint64_t)&unk_2514FB4A0;

  v6 = (void *)qword_25735D550;
  qword_25735D550 = (uint64_t)&unk_2514FB4B8;

  v7 = (void *)qword_25735D558;
  qword_25735D558 = (uint64_t)&unk_2514FB4D0;

  v8 = (void *)qword_25735D560;
  qword_25735D560 = (uint64_t)&unk_2514FB4E8;

  v9 = (void *)qword_25735D568;
  qword_25735D568 = (uint64_t)&unk_2514FB500;

  v10 = (void *)qword_25735D570;
  qword_25735D570 = (uint64_t)&unk_2514FB518;

  v11 = (void *)qword_25735D578;
  qword_25735D578 = (uint64_t)&unk_2514FB530;

  v12 = (void *)qword_25735D580;
  qword_25735D580 = (uint64_t)&unk_2514FB548;

  v13 = (void *)qword_25735D588;
  qword_25735D588 = (uint64_t)&unk_2514FB560;

  v14 = (void *)qword_25735D590;
  qword_25735D590 = (uint64_t)&unk_2514FB578;

  v15 = (void *)qword_25735D598;
  qword_25735D598 = (uint64_t)&unk_2514FB590;

  v16 = (void *)qword_25735D5A0;
  qword_25735D5A0 = (uint64_t)&unk_2514FB5A8;

  v17 = (void *)qword_25735D5A8;
  qword_25735D5A8 = (uint64_t)&unk_2514FB5C0;

  v18 = (void *)qword_25735D5B0;
  qword_25735D5B0 = (uint64_t)&unk_2514FB5D8;

  v19 = (void *)qword_25735D5B8;
  qword_25735D5B8 = (uint64_t)&unk_2514FB5F0;

  v20 = (void *)qword_25735D5C0;
  qword_25735D5C0 = (uint64_t)&unk_2514FB608;

  v21 = (void *)qword_25735D5C8;
  qword_25735D5C8 = (uint64_t)&unk_2514FB620;

  v22 = (void *)qword_25735D5D0;
  qword_25735D5D0 = (uint64_t)&unk_2514FB638;

  v23 = (void *)qword_25735D5D8;
  qword_25735D5D8 = (uint64_t)&unk_2514FB650;

  v24 = (void *)qword_25735D5E0;
  qword_25735D5E0 = (uint64_t)&unk_2514FB668;

  v25 = (void *)qword_25735D5E8;
  qword_25735D5E8 = (uint64_t)&unk_2514FB680;

  v26 = (void *)qword_25735D5F0;
  qword_25735D5F0 = (uint64_t)&unk_2514FB698;

  v27 = (void *)qword_25735D5F8;
  qword_25735D5F8 = (uint64_t)&unk_2514FB6B0;

  v28 = (void *)qword_25735D600;
  qword_25735D600 = (uint64_t)&unk_2514FB6C8;

  v29 = (void *)qword_25735D608;
  qword_25735D608 = (uint64_t)&unk_2514FB6E0;

  v30 = (void *)qword_25735D610;
  qword_25735D610 = (uint64_t)&unk_2514FB6F8;

  v31 = (void *)qword_25735D618;
  qword_25735D618 = (uint64_t)&unk_2514FB710;

  v32 = (void *)qword_25735D620;
  qword_25735D620 = (uint64_t)&unk_2514FB728;

  v33 = (void *)qword_25735D628;
  qword_25735D628 = (uint64_t)&unk_2514FB740;

  v34 = (void *)qword_25735D630;
  qword_25735D630 = (uint64_t)&unk_2514FB758;

  v35 = (void *)qword_25735D638;
  qword_25735D638 = (uint64_t)&unk_2514FB770;

  v36 = (void *)qword_25735D640;
  qword_25735D640 = (uint64_t)&unk_2514FB788;

  v37 = (void *)qword_25735D648;
  qword_25735D648 = (uint64_t)&unk_2514FB7A0;

  v38 = (void *)qword_25735D650;
  qword_25735D650 = (uint64_t)&unk_2514FB7B8;

  v39 = (void *)qword_25735D658;
  qword_25735D658 = (uint64_t)&unk_2514FB7D0;

  v40 = (void *)qword_25735D660;
  qword_25735D660 = (uint64_t)&unk_2514FB7E8;

  v41 = (void *)qword_25735D668;
  qword_25735D668 = (uint64_t)&unk_2514FB800;

  v42 = (void *)qword_25735D670;
  qword_25735D670 = (uint64_t)&unk_2514FB818;

  v43 = (void *)qword_25735D678;
  qword_25735D678 = (uint64_t)&unk_2514FB830;

  v44 = (void *)qword_25735D680;
  qword_25735D680 = (uint64_t)&unk_2514FB848;

  v45 = (void *)qword_25735D688;
  qword_25735D688 = (uint64_t)&unk_2514FB860;

  v46 = (void *)qword_25735D690;
  qword_25735D690 = (uint64_t)&unk_2514FB878;

  v47 = (void *)qword_25735D698;
  qword_25735D698 = (uint64_t)&unk_2514FB890;

  v48 = (void *)qword_25735D6A0;
  qword_25735D6A0 = (uint64_t)&unk_2514FB8A8;

  v49 = (void *)qword_25735D6A8;
  qword_25735D6A8 = (uint64_t)&unk_2514FB8C0;

  v50 = (void *)qword_25735D6B0;
  qword_25735D6B0 = (uint64_t)&unk_2514FB8D8;

  v51 = (void *)qword_25735D6B8;
  qword_25735D6B8 = (uint64_t)&unk_2514FB8F0;

  v52 = (void *)qword_25735D6C0;
  qword_25735D6C0 = (uint64_t)&unk_2514FB908;

  v53 = (void *)qword_25735D6C8;
  qword_25735D6C8 = (uint64_t)&unk_2514FB920;

  v54 = (void *)qword_25735D6D0;
  qword_25735D6D0 = (uint64_t)&unk_2514FB938;

  v55 = (void *)qword_25735D6D8;
  qword_25735D6D8 = (uint64_t)&unk_2514FB950;

  v56 = (void *)qword_25735D6E0;
  qword_25735D6E0 = (uint64_t)&unk_2514FB968;

  v57 = (void *)qword_25735D6E8;
  qword_25735D6E8 = (uint64_t)&unk_2514FB980;

  v58 = (void *)qword_25735D6F0;
  qword_25735D6F0 = (uint64_t)&unk_2514FB998;

  v59 = (void *)qword_25735D6F8;
  qword_25735D6F8 = (uint64_t)&unk_2514FB9B0;

  v60 = (void *)qword_25735D700;
  qword_25735D700 = (uint64_t)&unk_2514FB9C8;

  v61 = (void *)qword_25735D708;
  qword_25735D708 = (uint64_t)&unk_2514FB9E0;

  v62 = (void *)qword_25735D710;
  qword_25735D710 = (uint64_t)&unk_2514FB9F8;

  v63 = (void *)qword_25735D718;
  qword_25735D718 = (uint64_t)&unk_2514FBA10;

  v64 = (void *)qword_25735D720;
  qword_25735D720 = (uint64_t)&unk_2514FBA28;

  v65 = (void *)qword_25735D728;
  qword_25735D728 = (uint64_t)&unk_2514FBA40;

  v66 = (void *)qword_25735D730;
  qword_25735D730 = (uint64_t)&unk_2514FBA58;

  v67 = (void *)qword_25735D738;
  qword_25735D738 = (uint64_t)&unk_2514FBA70;

  v68 = (void *)qword_25735D740;
  qword_25735D740 = (uint64_t)&unk_2514FBA88;

  v69 = (void *)qword_25735D748;
  qword_25735D748 = (uint64_t)&unk_2514FBAA0;

  v70 = (void *)qword_25735D750;
  qword_25735D750 = (uint64_t)&unk_2514FBAB8;

  v71 = (void *)qword_25735D758;
  qword_25735D758 = (uint64_t)&unk_2514FBAD0;

  v72 = (void *)qword_25735D760;
  qword_25735D760 = (uint64_t)&unk_2514FBAE8;

  v73 = (void *)qword_25735D768;
  qword_25735D768 = (uint64_t)&unk_2514FBB00;

  v74 = (void *)qword_25735D770;
  qword_25735D770 = (uint64_t)&unk_2514FBB18;

  v75 = (void *)qword_25735D778;
  qword_25735D778 = (uint64_t)&unk_2514FBB30;

  v76 = (void *)qword_25735D780;
  qword_25735D780 = (uint64_t)&unk_2514FBB48;

  v77 = (void *)qword_25735D788;
  qword_25735D788 = (uint64_t)&unk_2514FBB60;

  v78 = (void *)qword_25735D790;
  qword_25735D790 = (uint64_t)&unk_2514FBB78;

  v79 = (void *)qword_25735D798;
  qword_25735D798 = (uint64_t)&unk_2514FBB90;

  v80 = (void *)qword_25735D7A0;
  qword_25735D7A0 = (uint64_t)&unk_2514FBBA8;

  v81 = (void *)qword_25735D7A8;
  qword_25735D7A8 = (uint64_t)&unk_2514FBBC0;

  v82 = (void *)qword_25735D7B0;
  qword_25735D7B0 = (uint64_t)&unk_2514FBBD8;

  v83 = (void *)qword_25735D7B8;
  qword_25735D7B8 = (uint64_t)&unk_2514FBBF0;

  v84 = (void *)qword_25735D7C0;
  qword_25735D7C0 = (uint64_t)&unk_2514FBC08;

  v85 = (void *)qword_25735D7C8;
  qword_25735D7C8 = (uint64_t)&unk_2514FBC20;

  v86 = (void *)qword_25735D7D0;
  qword_25735D7D0 = (uint64_t)&unk_2514FBC38;

  v87 = (void *)qword_25735D7D8;
  qword_25735D7D8 = (uint64_t)&unk_2514FBC50;

  v88 = (void *)qword_25735D7E0;
  qword_25735D7E0 = (uint64_t)&unk_2514FBC68;

  v89 = (void *)qword_25735D7E8;
  qword_25735D7E8 = (uint64_t)&unk_2514FBC80;

  v90 = (void *)qword_25735D7F0;
  qword_25735D7F0 = (uint64_t)&unk_2514FBC98;

  v91 = (void *)qword_25735D7F8;
  qword_25735D7F8 = (uint64_t)&unk_2514FBCB0;

  v92 = (void *)qword_25735D800;
  qword_25735D800 = (uint64_t)&unk_2514FBCC8;

  v93 = (void *)qword_25735D808;
  qword_25735D808 = (uint64_t)&unk_2514FBCE0;

  v94 = (void *)qword_25735D810;
  qword_25735D810 = (uint64_t)&unk_2514FBCF8;

  v95 = (void *)qword_25735D818;
  qword_25735D818 = (uint64_t)&unk_2514FBD10;

  v96 = (void *)qword_25735D820;
  qword_25735D820 = (uint64_t)&unk_2514FBD28;

  v97 = (void *)qword_25735D828;
  qword_25735D828 = (uint64_t)&unk_2514FBD40;

  v98 = (void *)qword_25735D830;
  qword_25735D830 = (uint64_t)&unk_2514FBD58;

  v99 = (void *)qword_25735D838;
  qword_25735D838 = (uint64_t)&unk_2514FBD70;

  v100 = (void *)qword_25735D840;
  qword_25735D840 = (uint64_t)&unk_2514FBD88;

  v101 = (void *)qword_25735D848;
  qword_25735D848 = (uint64_t)&unk_2514FBDA0;

  v102 = (void *)qword_25735D850;
  qword_25735D850 = (uint64_t)&unk_2514FBDB8;

  v103 = (void *)qword_25735D858;
  qword_25735D858 = (uint64_t)&unk_2514FBDD0;

  v104 = (void *)qword_25735D860;
  qword_25735D860 = (uint64_t)&unk_2514FBDE8;

  v105 = PSELog;
  if (os_log_type_enabled((os_log_t)PSELog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v106 = 0;
    _os_log_impl(&dword_2443B6000, v105, OS_LOG_TYPE_DEFAULT, "UMF Kernels Initialized", v106, 2u);
  }
}

- (void)_initializeProtectedBuffers:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  MTLBuffer *v16;
  MTLBuffer *v17;
  MTLBuffer *v18;
  MTLBuffer *v19;
  MTLBuffer *v20;
  MTLBuffer *v21;
  MTLBuffer *v22;
  MTLBuffer *v23;
  MTLBuffer *v24;
  MTLBuffer *v25;
  MTLBuffer *v26;
  MTLBuffer *v27;
  MTLBuffer *v28;
  MTLBuffer *v29;
  MTLBuffer *v30;
  MTLBuffer *v31;
  MTLBuffer *v32;
  MTLBuffer *v33;
  MTLBuffer *v34;
  MTLBuffer *v35;
  MTLBuffer *v36;
  MTLBuffer *v37;
  MTLBuffer *v38;
  MTLBuffer *v39;
  MTLBuffer *v40;
  MTLBuffer *v41;
  MTLBuffer *v42;
  MTLBuffer *v43;
  MTLBuffer *v44;
  MTLBuffer *v45;
  MTLBuffer *v46;
  MTLBuffer *v47;
  MTLBuffer *v48;
  MTLBuffer *v49;
  MTLBuffer *v50;
  MTLBuffer *v51;
  MTLBuffer *v52;
  MTLBuffer *v53;
  MTLBuffer *v54;
  MTLBuffer *v55;
  MTLBuffer *v56;
  MTLBuffer *v57;
  MTLBuffer *v58;
  MTLBuffer *v59;
  int v60;
  void *v61;
  uint64_t v62;

  v5 = 0;
  v6 = 0;
  v62 = *MEMORY[0x24BDAC8D0];
  do
  {
    v7 = -[MTLDevice heapBufferSizeAndAlignWithLength:options:](self->_device, "heapBufferSizeAndAlignWithLength:options:", qword_2443C5208[v5], 544);
    v6 += (v8 + v7 - 1) & -v8;
    ++v5;
  }
  while (v5 != 11);
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setSize:", v6);
  objc_msgSend(v9, "setHazardTrackingMode:", 2);
  v10 = (void *)-[MTLDevice newHeapWithDescriptor:](self->_device, "newHeapWithDescriptor:", v9);
  objc_msgSend(v9, "setProtectionOptions:", a3);
  v11 = (void *)-[MTLDevice newHeapWithDescriptor:](self->_device, "newHeapWithDescriptor:", v9);
  v12 = (void *)PSELog;
  if (os_log_type_enabled((os_log_t)PSELog, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)MEMORY[0x24BDD16E0];
    v14 = v12;
    objc_msgSend(v13, "numberWithUnsignedLongLong:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = 138412290;
    v61 = v15;
    _os_log_impl(&dword_2443B6000, v14, OS_LOG_TYPE_DEFAULT, "Making new protected heap with %@", (uint8_t *)&v60, 0xCu);

  }
  v16 = (MTLBuffer *)objc_msgSend(v10, "newBufferWithLength:options:", 4, 544);
  v17 = self->_bufferFrameLumaSum[0];
  self->_bufferFrameLumaSum[0] = v16;

  v18 = (MTLBuffer *)objc_msgSend(v10, "newBufferWithLength:options:", 56, 544);
  v19 = self->_bufferData[0];
  self->_bufferData[0] = v18;

  v20 = (MTLBuffer *)objc_msgSend(v10, "newBufferWithLength:options:", 144, 544);
  v21 = self->_bufferCurState[0];
  self->_bufferCurState[0] = v20;

  v22 = (MTLBuffer *)objc_msgSend(v10, "newBufferWithLength:options:", 1024, 544);
  v23 = self->_bufferGammaKernel[0];
  self->_bufferGammaKernel[0] = v22;

  v24 = (MTLBuffer *)objc_msgSend(v10, "newBufferWithLength:options:", 5120, 544);
  v25 = self->_bufferEnergy[0];
  self->_bufferEnergy[0] = v24;

  v26 = (MTLBuffer *)objc_msgSend(v10, "newBufferWithLength:options:", 5120, 544);
  v27 = self->_bufferEnergy2[0];
  self->_bufferEnergy2[0] = v26;

  v28 = (MTLBuffer *)objc_msgSend(v10, "newBufferWithLength:options:", 640, 544);
  v29 = self->_bufferContrastKernel[0];
  self->_bufferContrastKernel[0] = v28;

  v30 = (MTLBuffer *)objc_msgSend(v10, "newBufferWithLength:options:", 640, 544);
  v31 = self->_bufferContrast[0];
  self->_bufferContrast[0] = v30;

  v32 = (MTLBuffer *)objc_msgSend(v10, "newBufferWithLength:options:", 20, 544);
  v33 = self->_bufferResponses[0];
  self->_bufferResponses[0] = v32;

  v34 = (MTLBuffer *)objc_msgSend(v10, "newBufferWithLength:options:", 20, 544);
  v35 = self->_bufferResponsesNorm[0];
  self->_bufferResponsesNorm[0] = v34;

  v36 = (MTLBuffer *)objc_msgSend(v10, "newBufferWithLength:options:", 40, 544);
  v37 = self->_bufferResults[0];
  self->_bufferResults[0] = v36;

  if (v11)
  {
    v38 = (MTLBuffer *)objc_msgSend(v11, "newBufferWithLength:options:", 4, 544);
    v39 = self->_bufferFrameLumaSum[1];
    self->_bufferFrameLumaSum[1] = v38;

    v40 = (MTLBuffer *)objc_msgSend(v11, "newBufferWithLength:options:", 56, 544);
    v41 = self->_bufferData[1];
    self->_bufferData[1] = v40;

    v42 = (MTLBuffer *)objc_msgSend(v11, "newBufferWithLength:options:", 144, 544);
    v43 = self->_bufferCurState[1];
    self->_bufferCurState[1] = v42;

    v44 = (MTLBuffer *)objc_msgSend(v11, "newBufferWithLength:options:", 1024, 544);
    v45 = self->_bufferGammaKernel[1];
    self->_bufferGammaKernel[1] = v44;

    v46 = (MTLBuffer *)objc_msgSend(v11, "newBufferWithLength:options:", 5120, 544);
    v47 = self->_bufferEnergy[1];
    self->_bufferEnergy[1] = v46;

    v48 = (MTLBuffer *)objc_msgSend(v11, "newBufferWithLength:options:", 5120, 544);
    v49 = self->_bufferEnergy2[1];
    self->_bufferEnergy2[1] = v48;

    v50 = (MTLBuffer *)objc_msgSend(v11, "newBufferWithLength:options:", 640, 544);
    v51 = self->_bufferContrastKernel[1];
    self->_bufferContrastKernel[1] = v50;

    v52 = (MTLBuffer *)objc_msgSend(v11, "newBufferWithLength:options:", 640, 544);
    v53 = self->_bufferContrast[1];
    self->_bufferContrast[1] = v52;

    v54 = (MTLBuffer *)objc_msgSend(v11, "newBufferWithLength:options:", 20, 544);
    v55 = self->_bufferResponses[1];
    self->_bufferResponses[1] = v54;

    v56 = (MTLBuffer *)objc_msgSend(v11, "newBufferWithLength:options:", 20, 544);
    v57 = self->_bufferResponsesNorm[1];
    self->_bufferResponsesNorm[1] = v56;

    v58 = (MTLBuffer *)objc_msgSend(v11, "newBufferWithLength:options:", 40, 544);
    v59 = self->_bufferResults[1];
    self->_bufferResults[1] = v58;

    self->_protectionStatus = a3;
    self->_madeProtectedBuffers = self->_bufferFrameLumaSum[1] != 0;
  }

}

- (int)_deviceClass
{
  return MGGetSInt32Answer();
}

- (BOOL)canProcessSurface:(__IOSurface *)a3
{
  void *v5;
  signed int PixelFormat;
  BOOL result;
  int v8;

  v5 = (void *)PSELog;
  if (os_log_type_enabled((os_log_t)PSELog, OS_LOG_TYPE_DEBUG))
    -[PSEVideoProcessor canProcessSurface:].cold.1(v5, a3);
  self->_anon_15c[12] = 0;
  PixelFormat = IOSurfaceGetPixelFormat(a3);
  result = 1;
  if (PixelFormat <= 1380401728)
  {
    if (PixelFormat > 645428783)
    {
      if (PixelFormat > 875704437)
      {
        if (PixelFormat == 875704438)
          return result;
        v8 = 1111970369;
      }
      else
      {
        if (PixelFormat == 645428784)
          return result;
        v8 = 875704422;
      }
      goto LABEL_28;
    }
    if ((PixelFormat - 645166640) <= 4 && ((1 << (PixelFormat - 48)) & 0x15) != 0)
      return -[MTLDevice supportsYCBCRPackedFormats12](self->_device, "supportsYCBCRPackedFormats12");
    if (PixelFormat == 641230384)
      return result;
    v8 = 641234480;
    goto LABEL_28;
  }
  if (PixelFormat > 1953903151)
  {
    if (PixelFormat <= 1999843441)
    {
      if (PixelFormat == 1953903152)
        return result;
      v8 = 1953903154;
      goto LABEL_28;
    }
    if (PixelFormat == 1999843442 || PixelFormat == 2016686640)
      return result;
    v8 = 2019963440;
LABEL_28:
    if (PixelFormat != v8)
      return 0;
    return result;
  }
  if (PixelFormat <= 1815162993)
  {
    if (PixelFormat == 1380401729)
      return result;
    v8 = 1380411457;
    goto LABEL_28;
  }
  if (PixelFormat != 1815162994 && PixelFormat != 1882468912)
  {
    v8 = 1885745712;
    goto LABEL_28;
  }
  return result;
}

- (unint64_t)_pixelFormatForSurface:(__IOSurface *)a3
{
  signed int PixelFormat;
  unint64_t result;
  int v5;
  unint64_t v6;
  BOOL v7;
  unint64_t v8;

  PixelFormat = IOSurfaceGetPixelFormat(a3);
  result = 70;
  if (PixelFormat <= 1882468911)
  {
    if (PixelFormat > 875704421)
    {
      if (PixelFormat <= 1111970368)
      {
        if (PixelFormat != 875704422 && PixelFormat != 875704438)
          return result;
        return 500;
      }
      v5 = 1111970369;
      v6 = 80;
      v7 = PixelFormat == 1380411457;
      v8 = 115;
      goto LABEL_22;
    }
    if (PixelFormat == 641230384 || PixelFormat == 641234480)
      return 500;
    if (PixelFormat != 645428784)
      return result;
    return 508;
  }
  if (PixelFormat <= 1953903153)
  {
    if (PixelFormat == 1882468912 || PixelFormat == 1885745712)
      return 508;
    if (PixelFormat == 1953903152)
      return 580;
  }
  else
  {
    if (PixelFormat <= 2016686639)
    {
      v5 = 1953903154;
      v6 = 581;
      v7 = PixelFormat == 1999843442;
      v8 = 554;
LABEL_22:
      if (!v7)
        v8 = 70;
      if (PixelFormat == v5)
        return v6;
      else
        return v8;
    }
    if (PixelFormat == 2016686640 || PixelFormat == 2019963440)
      return 505;
  }
  return result;
}

- (void)_computeDisplaySizeIndexSelection
{
  int v3;
  int v4;
  int v5;
  float v6;

  v3 = -[PSEVideoProcessor _deviceClass](self, "_deviceClass") - 1;
  if (v3 > 5)
  {
    v5 = 3;
    v4 = 2;
    v6 = 1265.6;
  }
  else
  {
    v4 = dword_2443C5338[v3];
    v5 = dword_2443C5350[v3];
    v6 = flt_2443C5368[v3];
  }
  self->_idxEquivalentKernelIndex = v4;
  self->_idxEquivalentSize = v5;
  self->_area = v6;
}

- (int)_computeFrameRateIndexSelection
{
  uint64_t v2;
  int v3;
  float v4;
  float v5;
  void *v6;

  v2 = 0;
  v3 = 0;
  v4 = 1000.0;
  do
  {
    v5 = vabds_f32(*(float *)&standardFrameRates[v2], self->_fps);
    if (v5 <= v4)
    {
      v3 = v2;
      v4 = v5;
    }
    ++v2;
  }
  while (v2 != 7);
  v6 = (void *)PSELog;
  if (os_log_type_enabled((os_log_t)PSELog, OS_LOG_TYPE_DEBUG))
    -[PSEVideoProcessor _computeFrameRateIndexSelection].cold.1(v3, v6);
  return v3;
}

- (KernelData)_prepare_contrast_kernels
{
  char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  KernelData *result;
  char *v14;

  v5 = (char *)malloc_type_malloc(0x280uLL, 0xF8EBE3E6uLL);
  bzero(v5, 0x280uLL);
  v6 = 0;
  *(_QWORD *)retstr->var0 = 0;
  *(_QWORD *)&retstr->var0[2] = 0;
  LODWORD(retstr->var1) = 0;
  v14 = v5;
  *(_QWORD *)&retstr->var0[4] = 0;
  do
  {
    objc_msgSend((id)UFMKernels[35 * self->_idxEquivalentKernelIndex + 7 * v6 + self->_idxFrameRate], "objectEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    retstr->var0[v6] = 0;
    objc_msgSend(v7, "nextObject");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = 0;
      do
      {
        objc_msgSend(v9, "floatValue");
        *(_DWORD *)&v5[4 * v10++] = v11;
        retstr->var0[v6] = v10;
        objc_msgSend(v7, "nextObject");
        v12 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v12;
      }
      while (v12);
    }

    ++v6;
    v5 += 128;
  }
  while (v6 != 5);
  *(_QWORD *)&retstr->var0[5] = v14;
  return result;
}

- (id)_prepare_gamma_kernel:(float)a3 shape:(float)a4 scale:(float)a5
{
  void *v8;
  float v9;
  float v10;
  float v11;
  float v12;
  int v13;
  float v14;
  float v16;
  double v18;
  float v19;
  float v20;

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", 1024);
  objc_msgSend(v8, "resetBytesInRange:", 0, objc_msgSend(v8, "length"));
  v9 = a4 + -1.0;
  v19 = flt_2443C527C[(float)(a4 + -1.0)];
  v10 = a3;
  v18 = 1.0 / a3;
  v11 = powf(a5, -a4);
  v12 = 0.0;
  v13 = 256;
  v14 = 0.0;
  do
  {
    if ((float)(v12 / v10) > 0.99 && v14 >= 2.0)
      break;
    v14 = v18 + v14;
    v16 = v11 * expf((float)-v14 / a5);
    v20 = (float)(powf(v14, v9) * v16) / v19;
    v12 = v12 + v20;
    objc_msgSend(v8, "appendBytes:length:", &v20, 4);
    --v13;
  }
  while (v13);
  return v8;
}

- (int)_colorSpaceFromSurface:(__IOSurface *)a3
{
  CFTypeRef v5;
  const void *v6;
  CGColorSpace *v7;
  CFStringRef Name;
  CFTypeRef v9;
  const void *v10;
  CFTypeID v11;
  CGColorSpace *v12;

  v5 = IOSurfaceCopyValue(a3, (CFStringRef)*MEMORY[0x24BDD8E88]);
  if (v5)
  {
    v6 = v5;
    v7 = CGColorSpaceCreateWithPropertyList(v5);
    Name = CGColorSpaceGetName(v7);
    CFRelease(v6);
    CGColorSpaceRelease(v7);
    if (Name)
      return -[PSEVideoProcessor _colorSpaceValueForName:](self, "_colorSpaceValueForName:", Name);
  }
  v9 = IOSurfaceCopyValue(a3, (CFStringRef)*MEMORY[0x24BDD8EB8]);
  if (v9)
  {
    v10 = v9;
    v11 = CFGetTypeID(v9);
    if (v11 == CFDataGetTypeID())
    {
      v12 = (CGColorSpace *)MEMORY[0x24950D638](v10);
      Name = CGColorSpaceGetName(v12);
      CGColorSpaceRelease(v12);
      CFRelease(v10);
      if (Name)
        return -[PSEVideoProcessor _colorSpaceValueForName:](self, "_colorSpaceValueForName:", Name);
    }
    else
    {
      CFRelease(v10);
    }
  }
  if (IOSurfaceGetBulkAttachments())
    return 0;
  else
    return 0;
}

- (int)_colorSpaceValueForName:(__CFString *)a3
{
  void *v4;
  int v5;

  if (_colorSpaceValueForName__onceToken != -1)
    dispatch_once(&_colorSpaceValueForName__onceToken, &__block_literal_global_40);
  objc_msgSend((id)_colorSpaceValueForName__Values, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  return v5;
}

void __45__PSEVideoProcessor__colorSpaceValueForName___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[25];
  _QWORD v15[26];

  v15[25] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDBF230];
  v14[0] = *MEMORY[0x24BDBF228];
  v14[1] = v0;
  v15[0] = &unk_2514F5410;
  v15[1] = &unk_2514F5428;
  v1 = *MEMORY[0x24BDBF318];
  v14[2] = *MEMORY[0x24BDBF258];
  v14[3] = v1;
  v15[2] = &unk_2514F5440;
  v15[3] = &unk_2514F5458;
  v2 = *MEMORY[0x24BDBF278];
  v14[4] = *MEMORY[0x24BDBF308];
  v14[5] = v2;
  v15[4] = &unk_2514F5470;
  v15[5] = &unk_2514F5488;
  v3 = *MEMORY[0x24BDBF290];
  v14[6] = *MEMORY[0x24BDBF270];
  v14[7] = v3;
  v15[6] = &unk_2514F54A0;
  v15[7] = &unk_2514F54B8;
  v4 = *MEMORY[0x24BDBF248];
  v14[8] = *MEMORY[0x24BDBF2F8];
  v14[9] = v4;
  v15[8] = &unk_2514F54D0;
  v15[9] = &unk_2514F54E8;
  v5 = *MEMORY[0x24BDBF2A8];
  v14[10] = *MEMORY[0x24BDBF260];
  v14[11] = v5;
  v15[10] = &unk_2514F5500;
  v15[11] = &unk_2514F5518;
  v6 = *MEMORY[0x24BDBF2B0];
  v14[12] = *MEMORY[0x24BDBF280];
  v14[13] = v6;
  v15[12] = &unk_2514F5530;
  v15[13] = &unk_2514F5548;
  v7 = *MEMORY[0x24BDBF210];
  v14[14] = *MEMORY[0x24BDBF298];
  v14[15] = v7;
  v15[14] = &unk_2514F5560;
  v15[15] = &unk_2514F5578;
  v8 = *MEMORY[0x24BDBF220];
  v14[16] = *MEMORY[0x24BDBF218];
  v14[17] = v8;
  v15[16] = &unk_2514F5590;
  v15[17] = &unk_2514F55A8;
  v9 = *MEMORY[0x24BDBF310];
  v14[18] = *MEMORY[0x24BDBF2D8];
  v14[19] = v9;
  v15[18] = &unk_2514F55C0;
  v15[19] = &unk_2514F55D8;
  v10 = *MEMORY[0x24BDBF268];
  v14[20] = *MEMORY[0x24BDBF2B8];
  v14[21] = v10;
  v15[20] = &unk_2514F55F0;
  v15[21] = &unk_2514F5608;
  v11 = *MEMORY[0x24BDBF288];
  v14[22] = *MEMORY[0x24BDBF2A0];
  v14[23] = v11;
  v15[22] = &unk_2514F5620;
  v15[23] = &unk_2514F5638;
  v14[24] = *MEMORY[0x24BDBF2D0];
  v15[24] = &unk_2514F5650;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 25);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)_colorSpaceValueForName__Values;
  _colorSpaceValueForName__Values = v12;

}

- (void)processSourceSurface:(__IOSurface *)a3 withTimestamp:(double)a4 toDestinationSurface:(__IOSurface *)a5 options:(id)a6
{
  id v10;
  NSObject *v11;

  v10 = a6;
  if (v10)
  {
    -[SwiftVideoProcessor processSurfaceWithSourceSurface:timestamp:destinationSurface:options:](self->_swiftProcessor, "processSurfaceWithSourceSurface:timestamp:destinationSurface:options:", a3, a5, v10, a4);
  }
  else
  {
    v11 = PSELog;
    if (os_log_type_enabled((os_log_t)PSELog, OS_LOG_TYPE_ERROR))
      -[PSEVideoProcessor processSourceSurface:withTimestamp:toDestinationSurface:options:].cold.1(v11);
  }

}

- (void)_processSurface:(__IOSurface *)a3 withTimestamp:(double)a4 destinationSurface:(__IOSurface *)a5 options:(id)a6
{
  id v10;
  NSObject *v11;
  uint64_t v12;
  double v13;
  int v14;
  int v15;
  float v16;
  float v17;
  float v18;
  float v19;
  uint64_t v20;
  float v21;
  float v22;
  float fps;
  void *v24;
  size_t Width;
  size_t Height;
  uint64_t v27;
  unsigned int v28;
  unsigned int v29;
  void *v30;
  double v31;
  float v32;
  void *v33;
  NSObject *v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  uint64_t ProtectionOptions;
  uint64_t v41;
  void *v42;
  void *v43;
  double v44;
  NSObject *v45;
  void *v46;
  double v47;
  void *v48;
  double WidthOfPlane;
  void *v50;
  MTLTexture *v51;
  MTLTexture *processedTexture;
  MTLTexture *v53;
  MTLTexture *sourceTexture;
  MTLTexture *v55;
  MTLTexture *sourceCbCrTexture;
  MTLTexture *v57;
  MTLTexture *v58;
  MTLTexture *v59;
  void *v60;
  float v61;
  void *v62;
  float v63;
  void *v64;
  void *v65;
  float v66;
  void *v67;
  float v68;
  float v69;
  dispatch_semaphore_t v70;
  void *v71;
  NSObject *v72;
  uint64_t v73;
  uint64_t v74;
  void (*v75)(uint64_t, void *);
  void *v76;
  PSEVideoProcessor *v77;
  dispatch_semaphore_t v78;
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  if (self->_needsInitialization)
  {
    -[PSEVideoProcessor _initialize](self, "_initialize");
    v11 = PSELog;
    if (os_log_type_enabled((os_log_t)PSELog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2443B6000, v11, OS_LOG_TYPE_DEFAULT, "PSE V8.1 Initialization Called", buf, 2u);
    }
  }
  if (a3)
  {
    v12 = 0;
    v13 = a4 - self->_previousSurfaceTime;
    if (v13 < 0.00833333333)
      v13 = 0.00833333333;
    *(float *)&v14 = fmin(v13, 0.0416666667);
    v15 = FramePoolIdx;
    FrameDeltas[FramePoolIdx] = v14;
    FramePoolIdx = (v15 + 1) % 0xAu;
    v16 = 0.0;
    v17 = 10.0;
    v18 = 0.001;
    do
    {
      v19 = *(float *)&FrameDeltas[v12];
      if (v17 >= v19)
        v17 = *(float *)&FrameDeltas[v12];
      if (v18 < v19)
        v18 = *(float *)&FrameDeltas[v12];
      v16 = v16 + v19;
      ++v12;
    }
    while (v12 != 10);
    v20 = 0;
    v21 = 0.0;
    v22 = v16 / 10.0;
    do
    {
      v21 = (float)(*(float *)&FrameDeltas[v20] - v22) * (float)(*(float *)&FrameDeltas[v20] - v22) / 10.0 + v21;
      ++v20;
    }
    while (v20 != 10);
    fps = self->_fps;
    self->_fps = 8.0 / (float)((float)(v16 - v17) - v18);
    self->_previousSurfaceTime = a4;
    v24 = (void *)PSELog;
    if (os_log_type_enabled((os_log_t)PSELog, OS_LOG_TYPE_DEBUG))
    {
      v31 = fabs(sqrt(v21));
      if (v21 == -INFINITY)
        v31 = INFINITY;
      v32 = v31 / v22;
      v33 = (void *)MEMORY[0x24BDD16E0];
      v34 = v24;
      *(float *)&v35 = v32;
      objc_msgSend(v33, "numberWithFloat:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v37 = self->_fps;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_previousSurfaceTime);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v80 = v36;
      v81 = 2112;
      v82 = v38;
      v83 = 2112;
      v84 = v39;
      _os_log_debug_impl(&dword_2443B6000, v34, OS_LOG_TYPE_DEBUG, "PSE stdDelta value: %@, fps: %@ %@", buf, 0x20u);

    }
    Width = IOSurfaceGetWidth(a3);
    Height = IOSurfaceGetHeight(a3);
    v27 = -[PSEVideoProcessor _colorSpaceFromSurface:](self, "_colorSpaceFromSurface:", a3);
    v28 = 1;
    v29 = 1;
    switch((int)v27)
    {
      case 0:
      case 9:
      case 10:
      case 11:
      case 12:
      case 14:
      case 15:
      case 16:
      case 19:
      case 21:
      case 26:
      case 27:
      case 29:
      case 31:
      case 32:
        v30 = (void *)PSELog;
        if (os_log_type_enabled((os_log_t)PSELog, OS_LOG_TYPE_DEBUG))
          -[PSEVideoProcessor _processSurface:withTimestamp:destinationSurface:options:].cold.1(v30, v27);
        v29 = 0;
        v28 = 1;
        goto LABEL_32;
      case 1:
      case 2:
        goto LABEL_32;
      case 4:
      case 33:
        v28 = 0;
        goto LABEL_32;
      case 5:
      case 7:
      case 20:
      case 30:
        goto LABEL_21;
      case 6:
      case 8:
      case 13:
        v28 = 0;
LABEL_21:
        v29 = 0;
        goto LABEL_32;
      case 17:
      case 25:
        v28 = 0;
        goto LABEL_29;
      case 18:
      case 34:
        goto LABEL_29;
      case 22:
        v28 = 2;
LABEL_29:
        v29 = 2;
        goto LABEL_32;
      case 24:
      case 28:
        v29 = 2;
        goto LABEL_31;
      case 35:
        v29 = 0;
LABEL_31:
        v28 = 3;
LABEL_32:
        self->_bufferConstants.uEOTF = v28;
        self->_bufferConstants.uColSpace = v29;
        break;
      default:
        break;
    }
    ProtectionOptions = IOSurfaceGetProtectionOptions();
    v41 = ProtectionOptions;
    if (ProtectionOptions && ProtectionOptions != self->_protectionStatus)
    {
      -[PSEVideoProcessor _initializeProtectedBuffers:](self, "_initializeProtectedBuffers:", ProtectionOptions);
    }
    else
    {
      if (a4 - self->_previousSurfaceTime <= 1.0 && vabds_f32(self->_fps, fps) < 5.0)
      {
LABEL_41:
        if (self->_anon_15c[12])
        {
          WidthOfPlane = (double)IOSurfaceGetWidthOfPlane(a3, 0);
          objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 115, (unint64_t)WidthOfPlane, (unint64_t)(double)IOSurfaceGetHeightOfPlane(a3, 0), 0);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "setUsage:", 2);
          objc_msgSend(v50, "setProtectionOptions:", v41);
          v51 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:", v50, a5, 0);
          processedTexture = self->_processedTexture;
          self->_processedTexture = v51;

          objc_msgSend(v50, "setUsage:", 1);
          objc_msgSend(v50, "setPixelFormat:", 20);
          v53 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:", v50, a3, 0);
          sourceTexture = self->_sourceTexture;
          self->_sourceTexture = v53;

          objc_msgSend(v50, "setWidth:", IOSurfaceGetWidthOfPlane(a3, 1uLL));
          objc_msgSend(v50, "setHeight:", IOSurfaceGetHeightOfPlane(a3, 1uLL));
          objc_msgSend(v50, "setPixelFormat:", 60);
          v55 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:", v50, a3, 1);
          sourceCbCrTexture = self->_sourceCbCrTexture;
          self->_sourceCbCrTexture = v55;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", -[PSEVideoProcessor _pixelFormatForSurface:](self, "_pixelFormatForSurface:", a3), (unint64_t)(double)Width, (unint64_t)(double)Height, 0);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "setUsage:", 1);
          objc_msgSend(v50, "setProtectionOptions:", v41);
          v57 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:", v50, a3, 0);
          v58 = self->_sourceTexture;
          self->_sourceTexture = v57;

          objc_msgSend(v50, "setUsage:", 2);
          objc_msgSend(v50, "setPixelFormat:", -[PSEVideoProcessor _pixelFormatForSurface:](self, "_pixelFormatForSurface:", a5));
          v59 = (MTLTexture *)-[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_device, "newTextureWithDescriptor:iosurface:plane:", v50, a5, 0);
          sourceCbCrTexture = self->_processedTexture;
          self->_processedTexture = v59;
        }

        objc_msgSend(v10, "objectForKey:", CFSTR("displayMaxNits"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "floatValue");
        self->_bufferConstants.maxNits = v61;

        objc_msgSend(v10, "objectForKey:", CFSTR("sourceSurfaceEDR"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "floatValue");
        self->_bufferConstants.edr = v63;

        objc_msgSend(v10, "objectForKey:", CFSTR("displayEDRFactor"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = v64;
        if (v64)
          objc_msgSend(v64, "floatValue");
        else
          v66 = 1.0;
        self->_bufferConstants.displayEDR = v66;
        objc_msgSend(v10, "objectForKey:", CFSTR("currentFPS"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "floatValue");
        v69 = v68;

        if (v69 <= 0.0)
          v69 = self->_fps;
        self->_bufferConstants.fps = v69;
        v70 = dispatch_semaphore_create(0);
        -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setProtectionOptions:", v41);
        v73 = MEMORY[0x24BDAC760];
        v74 = 3221225472;
        v75 = __78__PSEVideoProcessor__processSurface_withTimestamp_destinationSurface_options___block_invoke;
        v76 = &unk_2514EC298;
        v77 = self;
        v78 = v70;
        v72 = v70;
        objc_msgSend(v71, "addCompletedHandler:", &v73);
        -[PSEVideoProcessor _processFrame:sourceSurface:outSurface:](self, "_processFrame:sourceSurface:outSurface:", v71, a3, a5, v73, v74, v75, v76, v77);
        objc_msgSend(v71, "commit");
        dispatch_semaphore_wait(v72, 0xFFFFFFFFFFFFFFFFLL);

        goto LABEL_50;
      }
      v42 = (void *)PSELog;
      if (os_log_type_enabled((os_log_t)PSELog, OS_LOG_TYPE_INFO))
      {
        v43 = (void *)MEMORY[0x24BDD16E0];
        v44 = a4 - self->_previousSurfaceTime;
        v45 = v42;
        objc_msgSend(v43, "numberWithDouble:", v44);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v47 = vabds_f32(self->_fps, fps);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v80 = v46;
        v81 = 2112;
        v82 = v48;
        _os_log_impl(&dword_2443B6000, v45, OS_LOG_TYPE_INFO, "Resetting state due to time %@ or fps: %@", buf, 0x16u);

      }
    }
    -[PSEVideoProcessor _resetState:](self, "_resetState:", v41);
    goto LABEL_41;
  }
LABEL_50:

}

void __78__PSEVideoProcessor__processSurface_withTimestamp_destinationSurface_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  float *v5;
  _BYTE *v6;
  NSObject *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void (**v23)(double, double, double);
  int v24;
  double v25;
  __int16 v26;
  double v27;
  __int16 v28;
  double v29;
  __int16 v30;
  double v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  __int16 v38;
  double v39;
  __int16 v40;
  double v41;
  __int16 v42;
  double v43;
  __int16 v44;
  double v45;
  __int16 v46;
  double v47;
  __int16 v48;
  double v49;
  __int16 v50;
  double v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(v4 + 318) || *(_BYTE *)(v4 + 317)) && !*(_BYTE *)(v4 + 321))
  {
    v5 = (float *)objc_msgSend(*(id *)(v4 + 280), "contents");
    v6 = *(_BYTE **)(a1 + 32);
    if (v6[317])
    {
      v7 = PSELog;
      if (os_log_type_enabled((os_log_t)PSELog, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *v5;
        v9 = v5[1];
        v10 = v5[2];
        v11 = v5[3];
        v12 = v5[4];
        v13 = v5[5];
        v14 = v5[6];
        v15 = v5[7];
        v16 = v5[13];
        v17 = v5[8];
        v18 = v5[11];
        v19 = v5[12];
        v20 = v5[9];
        v21 = v5[10];
        v24 = 134221312;
        v25 = v8;
        v26 = 2048;
        v27 = v9;
        v28 = 2048;
        v29 = v10;
        v30 = 2048;
        v31 = v11;
        v32 = 2048;
        v33 = v12;
        v34 = 2048;
        v35 = v13;
        v36 = 2048;
        v37 = v14;
        v38 = 2048;
        v39 = v15;
        v40 = 2048;
        v41 = v16;
        v42 = 2048;
        v43 = v17;
        v44 = 2048;
        v45 = v18;
        v46 = 2048;
        v47 = v19;
        v48 = 2048;
        v49 = v20;
        v50 = 2048;
        v51 = v21;
        _os_log_impl(&dword_2443B6000, v7, OS_LOG_TYPE_DEFAULT, "APL:%7.2fnits, AdaptLevel:%5.1fnits, Contrast:%6.2f, Response:%7.2f, Response2:%6.2f, Energy:%6.1f, E2:%4.2f, Risk:%6.2f, VFML:%6.2f, MitigateCF:%5.2f, MuAdapt:%5.3f, FPS:%3.0f, EDR:%4.2f, DisplayEDR:%4.2f", (uint8_t *)&v24, 0x8Eu);
      }
      v6 = *(_BYTE **)(a1 + 32);
    }
    objc_msgSend(v6, "validationCallback");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(*(id *)(a1 + 32), "validationCallback");
      v23 = (void (**)(double, double, double))objc_claimAutoreleasedReturnValue();
      v23[2](*v5, v5[7], (float)(v5[8] * 100.0));

    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }

}

- (void)_resetState:(unint64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  float fps;
  float v11;
  float v12;
  double v13;
  double gain;
  float v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  float *v22;
  float v23;
  uint64_t v24;
  double v25;
  void *v26;
  MTLDevice *device;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _DWORD v35[16];
  __int128 v36;
  __int128 v37;
  void *v38[4];

  self->_idxFrameRate = -[PSEVideoProcessor _computeFrameRateIndexSelection](self, "_computeFrameRateIndexSelection");
  -[PSEVideoProcessor _computeDisplaySizeIndexSelection](self, "_computeDisplaySizeIndexSelection");
  v5 = (void *)PSELog;
  if (os_log_type_enabled((os_log_t)PSELog, OS_LOG_TYPE_DEBUG))
    -[PSEVideoProcessor _resetState:].cold.2((uint64_t)self, v5);
  *(float *)&v6 = self->_fps;
  *(float *)&v7 = self->_energyPoolGammaShape;
  *(float *)&v8 = self->_energyPoolGammaScale;
  -[PSEVideoProcessor _prepare_gamma_kernel:shape:scale:](self, "_prepare_gamma_kernel:shape:scale:", v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v38, 0, 28);
  -[PSEVideoProcessor _prepare_contrast_kernels](self, "_prepare_contrast_kernels");
  v35[1] = objc_msgSend(v9, "length", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                           0) >> 2;
  *(float *)&v35[2] = self->_nits * self->_avl;
  fps = self->_fps;
  v11 = 1.0 - exp(-1.0 / (float)(self->_tauadapt * fps));
  *(float *)&v35[3] = v11;
  v12 = 1.0 - exp(-1.0 / (float)(fps * self->_taumitigation));
  *(float *)&v35[4] = v12;
  v13 = pow(sqrt(self->_area * 1.6) / *(float *)&standardSizes[self->_idxEquivalentSize], self->_cA + self->_cA);
  gain = self->_gain;
  v15 = v13 * (gain / pow(fps, 1.0 / self->_energypoolexponent));
  *(float *)&v35[5] = v15;
  v35[14] = 1065353216;
  v36 = 0uLL;
  LODWORD(v37) = 0;
  v16 = (void *)PSELog;
  if (os_log_type_enabled((os_log_t)PSELog, OS_LOG_TYPE_DEBUG))
    -[PSEVideoProcessor _resetState:].cold.1(v16, v11);
  v17 = 0;
  v18 = 0;
  v19 = *(uint64_t *)((char *)&v38[2] + 4);
  v20 = (char *)&NormEnergyThreshold + 20 * self->_idxFrameRate;
  do
  {
    v21 = *((unsigned int *)v38 + v18);
    v22 = (float *)&v35[v18];
    *((_DWORD *)v22 + 21) = v21;
    v23 = 0.0;
    if ((_DWORD)v21)
    {
      v24 = v17;
      do
      {
        v25 = *(float *)(v19 + 4 * v24);
        v23 = v25 * v25 + v23;
        ++v24;
        --v21;
      }
      while (v21);
    }
    v22[26] = v23;
    v22[31] = *(float *)&v20[4 * v18++];
    v17 += 32;
  }
  while (v18 != 5);
  v26 = (void *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", v19, 640, 0);
  free(*(void **)((char *)&v38[2] + 4));
  device = self->_device;
  v28 = objc_retainAutorelease(v9);
  v29 = (void *)-[MTLDevice newBufferWithBytes:length:options:](device, "newBufferWithBytes:length:options:", objc_msgSend(v28, "bytes"), objc_msgSend(v28, "length"), 0);
  v30 = (void *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", v35, 144, 0);
  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "blitCommandEncoder");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v30, 0, self->_bufferCurState[0], 0, 144);
  objc_msgSend(v32, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v29, 0, self->_bufferGammaKernel[0], 0, objc_msgSend(v28, "length"));
  objc_msgSend(v32, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v26, 0, self->_bufferContrastKernel[0], 0, 640);
  objc_msgSend(v32, "fillBuffer:range:value:", self->_bufferContrast[0], 0, 640, 0);
  objc_msgSend(v32, "fillBuffer:range:value:", self->_bufferEnergy[0], 0, objc_msgSend(v28, "length"), 0);
  objc_msgSend(v32, "fillBuffer:range:value:", self->_bufferEnergy2[0], 0, objc_msgSend(v28, "length"), 0);
  objc_msgSend(v32, "fillBuffer:range:value:", self->_bufferDataDebug, 0, 56, 0);
  objc_msgSend(v32, "endEncoding");
  objc_msgSend(v31, "commit");
  if (!-[PSEVideoProcessor inTestingMode](self, "inTestingMode") && self->_madeProtectedBuffers)
  {
    -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "setProtectionOptions:", a3);
    objc_msgSend(v33, "blitCommandEncoder");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v30, 0, self->_bufferCurState[1], 0, 144);
    objc_msgSend(v34, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v29, 0, self->_bufferGammaKernel[1], 0, objc_msgSend(v28, "length"));
    objc_msgSend(v34, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", v26, 0, self->_bufferContrastKernel[1], 0, 640);
    objc_msgSend(v34, "fillBuffer:range:value:", self->_bufferContrast[1], 0, 640, 0);
    objc_msgSend(v34, "fillBuffer:range:value:", self->_bufferEnergy[1], 0, objc_msgSend(v28, "length"), 0);
    objc_msgSend(v34, "fillBuffer:range:value:", self->_bufferEnergy2[1], 0, objc_msgSend(v28, "length"), 0);
    objc_msgSend(v34, "endEncoding");
    objc_msgSend(v33, "commit");
    v32 = v34;
    v31 = v33;
  }

}

- (void)_processFrame:(id)a3 sourceSurface:(__IOSurface *)a4 outSurface:(__IOSurface *)a5
{
  id v7;
  _BOOL8 v8;
  double Width;
  double Height;
  float v11;
  void *v12;
  void *v13;
  MTLBuffer **bufferData;
  MTLBuffer **bufferGammaKernel;
  MTLBuffer **bufferCurState;
  unint64_t v17;
  unint64_t v18;
  Class *v19;
  void *v20;
  void *v21;
  int64x2_t v22;
  uint64_t v23;
  int64x2_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  _QWORD v34[3];
  _QWORD v35[4];

  v7 = a3;
  v8 = objc_msgSend(v7, "protectionOptions") != 0;
  self->_bufferConstants.bProtected = v8;
  Width = (double)IOSurfaceGetWidth(a4);
  Height = (double)IOSurfaceGetHeight(a4);
  v11 = Width * Height;
  self->_bufferConstants.fPixelCnt = v11;
  objc_msgSend(v7, "blitCommandEncoder");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fillBuffer:range:value:", self->_bufferFrameLumaSum[v8], 0, -[MTLBuffer length](self->_bufferFrameLumaSum[v8], "length"), 0);
  objc_msgSend(v12, "endEncoding");
  v21 = v7;
  objc_msgSend(v7, "computeCommandEncoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLabel:", CFSTR("Primary Compute Encoder"));
  objc_msgSend(v13, "setComputePipelineState:", self->_cptPSO_RiskComputePass0);
  objc_msgSend(v13, "setTexture:atIndex:", self->_sourceTexture, 0);
  objc_msgSend(v13, "setTexture:atIndex:", self->_sourceCbCrTexture, 1);
  objc_msgSend(v13, "setTexture:atIndex:", self->_processedTexture, 2);
  objc_msgSend(v13, "setBytes:length:atIndex:", &self->_bufferConstants, 56, 0);
  objc_msgSend(v13, "setBuffer:offset:atIndex:", self->_bufferFrameLumaSum[v8], 0, 1);
  bufferData = self->_bufferData;
  objc_msgSend(v13, "setBuffer:offset:atIndex:", self->_bufferData[v8], 0, 2);
  bufferGammaKernel = self->_bufferGammaKernel;
  objc_msgSend(v13, "setBuffer:offset:atIndex:", self->_bufferGammaKernel[v8], 0, 3);
  bufferCurState = self->_bufferCurState;
  objc_msgSend(v13, "setBuffer:offset:atIndex:", self->_bufferCurState[v8], 0, 4);
  v17 = -[MTLComputePipelineState threadExecutionWidth](self->_cptPSO_RiskComputePass0, "threadExecutionWidth");
  v18 = -[MTLComputePipelineState maxTotalThreadsPerThreadgroup](self->_cptPSO_RiskComputePass0, "maxTotalThreadsPerThreadgroup");
  v35[0] = (unint64_t)Width;
  v35[1] = (unint64_t)Height;
  v35[2] = 1;
  v34[0] = v17;
  v34[1] = v18 / v17;
  v34[2] = 1;
  objc_msgSend(v13, "dispatchThreads:threadsPerThreadgroup:", v35, v34);
  if (!self->_bufferConstants.bCopyOnly)
  {
    objc_msgSend(v13, "setComputePipelineState:", self->_cptPSO_RiskComputePass1);
    objc_msgSend(v13, "setBytes:length:atIndex:", &self->_bufferConstants, 56, 0);
    objc_msgSend(v13, "setBuffer:offset:atIndex:", self->_bufferFrameLumaSum[v8], 0, 1);
    objc_msgSend(v13, "setBuffer:offset:atIndex:", bufferData[v8], 0, 2);
    objc_msgSend(v13, "setBuffer:offset:atIndex:", bufferGammaKernel[v8], 0, 3);
    objc_msgSend(v13, "setBuffer:offset:atIndex:", bufferCurState[v8], 0, 4);
    v19 = &self->super.isa + v8;
    objc_msgSend(v13, "setBuffer:offset:atIndex:", v19[23], 0, 5);
    objc_msgSend(v13, "setBuffer:offset:atIndex:", v19[25], 0, 6);
    objc_msgSend(v13, "setBuffer:offset:atIndex:", v19[27], 0, 7);
    objc_msgSend(v13, "setBuffer:offset:atIndex:", v19[29], 0, 8);
    v32 = xmmword_2443C5180;
    v33 = 1;
    v30 = xmmword_2443C5190;
    v31 = 1;
    objc_msgSend(v13, "dispatchThreads:threadsPerThreadgroup:", &v32, &v30);
    objc_msgSend(v13, "setComputePipelineState:", self->_cptPSO_RiskComputePass2);
    objc_msgSend(v13, "setBytes:length:atIndex:", &self->_bufferConstants, 56, 0);
    objc_msgSend(v13, "setBuffer:offset:atIndex:", bufferData[v8], 0, 2);
    objc_msgSend(v13, "setBuffer:offset:atIndex:", bufferGammaKernel[v8], 0, 3);
    objc_msgSend(v13, "setBuffer:offset:atIndex:", bufferCurState[v8], 0, 4);
    objc_msgSend(v13, "setBuffer:offset:atIndex:", v19[27], 0, 7);
    objc_msgSend(v13, "setBuffer:offset:atIndex:", v19[29], 0, 8);
    objc_msgSend(v13, "setBuffer:offset:atIndex:", v19[19], 0, 9);
    objc_msgSend(v13, "setBuffer:offset:atIndex:", v19[21], 0, 10);
    objc_msgSend(v13, "setBuffer:offset:atIndex:", v19[31], 0, 11);
    v28 = xmmword_2443C51A0;
    v29 = 1;
    v26 = xmmword_2443C51B0;
    v27 = 1;
    objc_msgSend(v13, "dispatchThreads:threadsPerThreadgroup:", &v28, &v26);
    objc_msgSend(v13, "setComputePipelineState:", self->_cptPSO_RiskComputePass3);
    objc_msgSend(v13, "setBytes:length:atIndex:", &self->_bufferConstants, 56, 0);
    objc_msgSend(v13, "setBuffer:offset:atIndex:", bufferCurState[v8], 0, 4);
    objc_msgSend(v13, "setBuffer:offset:atIndex:", bufferData[v8], 0, 2);
    objc_msgSend(v13, "setBuffer:offset:atIndex:", v19[31], 0, 11);
    v24 = vdupq_n_s64(1uLL);
    v25 = 1;
    v22 = v24;
    v23 = 1;
    objc_msgSend(v13, "dispatchThreads:threadsPerThreadgroup:", &v24, &v22);
  }
  objc_msgSend(v13, "endEncoding");
  if ((self->_bufferConstants.bCallbackValues || self->_bufferConstants.bDebug) && !self->_bufferConstants.bProtected)
  {
    objc_msgSend(v21, "blitCommandEncoder");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:", self->_bufferData[0], 0, self->_bufferDataDebug, 0, 56);
    objc_msgSend(v20, "endEncoding");

  }
}

- (id)validationCallback
{
  return self->_validationCallback;
}

- (BOOL)inTestingMode
{
  return self->_inTestingMode;
}

- (void)setInTestingMode:(BOOL)a3
{
  self->_inTestingMode = a3;
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  uint64_t n;
  uint64_t ii;
  uint64_t jj;
  uint64_t kk;
  uint64_t mm;
  uint64_t nn;
  uint64_t i1;

  objc_storeStrong(&self->_validationCallback, 0);
  objc_storeStrong((id *)&self->_processedTexture, 0);
  objc_storeStrong((id *)&self->_sourceCbCrTexture, 0);
  objc_storeStrong((id *)&self->_sourceTexture, 0);
  objc_storeStrong((id *)&self->_bufferDataDebug, 0);
  for (i = 0; i != -2; --i)
    objc_storeStrong((id *)&self->_bufferResults[i + 1], 0);
  for (j = 0; j != -2; --j)
    objc_storeStrong((id *)&self->_bufferResponsesNorm[j + 1], 0);
  for (k = 0; k != -2; --k)
    objc_storeStrong((id *)&self->_bufferResponses[k + 1], 0);
  for (m = 0; m != -2; --m)
    objc_storeStrong((id *)&self->_bufferContrast[m + 1], 0);
  for (n = 0; n != -2; --n)
    objc_storeStrong((id *)&self->_bufferContrastKernel[n + 1], 0);
  for (ii = 0; ii != -2; --ii)
    objc_storeStrong((id *)&self->_bufferEnergy2[ii + 1], 0);
  for (jj = 0; jj != -2; --jj)
    objc_storeStrong((id *)&self->_bufferEnergy[jj + 1], 0);
  for (kk = 0; kk != -2; --kk)
    objc_storeStrong((id *)&self->_bufferGammaKernel[kk + 1], 0);
  for (mm = 0; mm != -2; --mm)
    objc_storeStrong((id *)&self->_bufferCurState[mm + 1], 0);
  for (nn = 0; nn != -2; --nn)
    objc_storeStrong((id *)&self->_bufferData[nn + 1], 0);
  for (i1 = 0; i1 != -2; --i1)
    objc_storeStrong((id *)&self->_bufferFrameLumaSum[i1 + 1], 0);
  objc_storeStrong((id *)&self->_cptPSO_RiskComputePass3, 0);
  objc_storeStrong((id *)&self->_cptPSO_RiskComputePass2, 0);
  objc_storeStrong((id *)&self->_cptPSO_RiskComputePass1, 0);
  objc_storeStrong((id *)&self->_cptPSO_RiskComputePass0, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_swiftProcessor, 0);
}

+ (uint64_t)needsProcessing
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return -[PSEVideoProcessor _initialize].cold.1(v0);
}

- (void)canProcessSurface:(void *)a1 .cold.1(void *a1, __IOSurface *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a1;
  objc_msgSend(v3, "numberWithUnsignedInt:", IOSurfaceGetPixelFormat(a2));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2443B6000, v4, v6, "Pixel format: %@", v7);

  OUTLINED_FUNCTION_4();
}

- (void)_computeFrameRateIndexSelection
{
  void *v2;
  int v3;
  NSObject *v4;
  double v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD16E0];
  v3 = standardFrameRates[a1];
  v4 = a2;
  LODWORD(v5) = v3;
  objc_msgSend(v2, "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2443B6000, v4, v7, "Choosing standard FPS: %@", v8);

  OUTLINED_FUNCTION_4();
}

- (void)processSourceSurface:(os_log_t)log withTimestamp:toDestinationSurface:options:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2443B6000, log, OS_LOG_TYPE_ERROR, "Options should be passed in", v1, 2u);
}

- (void)_processSurface:(void *)a1 withTimestamp:(uint64_t)a2 destinationSurface:options:.cold.1(void *a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a1;
  objc_msgSend(v3, "numberWithInt:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2443B6000, v4, v6, "Unsupported color space: %@", v7);

  OUTLINED_FUNCTION_4();
}

- (void)_resetState:(void *)a1 .cold.1(void *a1, float a2)
{
  void *v3;
  NSObject *v4;
  double v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = a1;
  *(float *)&v5 = a2;
  objc_msgSend(v3, "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_2443B6000, v4, v7, "Current value for mu: %@", v8);

  OUTLINED_FUNCTION_4();
}

- (void)_resetState:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  NSObject *v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = standardSizes[*(int *)(a1 + 428)];
  v5 = a2;
  LODWORD(v6) = v4;
  objc_msgSend(v3, "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = *(_DWORD *)(a1 + 368);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138412546;
  v11 = v7;
  v12 = 2112;
  v13 = v9;
  _os_log_debug_impl(&dword_2443B6000, v5, OS_LOG_TYPE_DEBUG, "Choosing standard screen size: %@, fps: %@", (uint8_t *)&v10, 0x16u);

}

@end
