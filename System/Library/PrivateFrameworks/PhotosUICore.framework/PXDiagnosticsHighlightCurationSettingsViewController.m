@implementation PXDiagnosticsHighlightCurationSettingsViewController

- (PXDiagnosticsHighlightCurationSettingsViewController)initWithDelegate:(id)a3
{
  id v5;
  PXDiagnosticsHighlightCurationSettingsViewController *v6;
  PXDiagnosticsHighlightCurationSettingsViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXDiagnosticsHighlightCurationSettingsViewController;
  v6 = -[PXDiagnosticsHighlightCurationSettingsViewController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_delegate, a3);

  return v7;
}

- (void)loadView
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  id v11;
  void (**v12)(void *, const __CFString *, void *);
  id v13;
  void (**v14)(void *, const __CFString *, void *);
  id v15;
  void (**v16)(void *, const __CFString *);
  NSDictionary *v17;
  void *v18;
  UISwitch *v19;
  UISwitch *doIdenticalDedupingSwitch;
  void *v21;
  UITextField *v22;
  UITextField *identicalDedupingTimeIntervalTextField;
  void *v24;
  UITextField *v25;
  UITextField *identicalDedupingTimeIntervalForPeopleTextField;
  void *v27;
  UITextField *v28;
  UITextField *identicalDedupingMaximumTimeGroupExtensionTextField;
  void *v30;
  UITextField *v31;
  UITextField *maximumNumberOfItemsPerIdenticalClusterTextField;
  void *v33;
  UITextField *v34;
  UITextField *identicalDedupingThresholdTextField;
  void *v36;
  UITextField *v37;
  UITextField *identicalDedupingThresholdForPeopleTextField;
  void *v39;
  UITextField *v40;
  UITextField *identicalDedupingThresholdForBestItemsTextField;
  void *v42;
  UISwitch *v43;
  UISwitch *useFaceprintsForIdenticalDedupingSwitch;
  void *v45;
  UITextField *v46;
  UITextField *identicalDedupingFaceprintDistanceTextField;
  void *v48;
  UISwitch *v49;
  UISwitch *doSemanticalDedupingSwitch;
  void *v51;
  UISwitch *v52;
  UISwitch *doNotSemanticallyDedupePeopleSwitch;
  void *v54;
  UISwitch *v55;
  UISwitch *doNotSemanticallyDedupePersonsSwitch;
  void *v57;
  UITextField *v58;
  UITextField *semanticalDedupingTimeIntervalTextField;
  void *v60;
  UITextField *v61;
  UITextField *semanticalDedupingTimeIntervalForPeopleTextField;
  void *v63;
  UITextField *v64;
  UITextField *semanticalDedupingTimeIntervalForPersonsTextField;
  void *v66;
  UITextField *v67;
  UITextField *semanticalDedupingMaximumTimeGroupExtensionTextField;
  void *v69;
  UITextField *v70;
  UITextField *maximumNumberOfItemsPerSemanticalClusterTextField;
  void *v72;
  UITextField *v73;
  UITextField *semanticalDedupingThresholdTextField;
  void *v75;
  UITextField *v76;
  UITextField *semanticalDedupingThresholdForPeopleTextField;
  void *v78;
  UITextField *v79;
  UITextField *semanticalDedupingThresholdForPersonsTextField;
  void *v81;
  UISwitch *v82;
  UISwitch *allowAdaptiveForSemanticalDedupingSwitch;
  void *v84;
  UISwitch *v85;
  UISwitch *useOnlyScenesForDedupingSwitch;
  void *v87;
  UISwitch *v88;
  UISwitch *useAllPersonsForDedupingSwitch;
  void *v90;
  UISwitch *v91;
  UISwitch *useFaceQualityForElectionSwitch;
  void *v93;
  UISwitch *v94;
  UISwitch *doNotDedupeVideosSwitch;
  void *v96;
  UISwitch *v97;
  UISwitch *doNotDedupeInterestingPortraitsAndLivePicturesSwitch;
  void *v99;
  UISwitch *v100;
  UISwitch *onlyDedupeContiguousItemsSwitch;
  void *v102;
  UISwitch *v103;
  UISwitch *doDejunkSwitch;
  void *v105;
  UISwitch *v106;
  UISwitch *returnDedupedJunkIfOnlyJunkSwitch;
  void *v108;
  UISwitch *v109;
  UISwitch *doFinalPassSwitch;
  void *v111;
  UITextField *v112;
  UITextField *finalPassTimeIntervalTextField;
  void *v114;
  UITextField *v115;
  UITextField *finalPassMaximumTimeGroupExtensionTextField;
  void *v117;
  UITextField *v118;
  UITextField *finalPassDedupingThresholdTextField;
  double v120;
  _QWORD v121[4];
  id v122;
  uint64_t *v123;
  double v124;
  _QWORD v125[4];
  id v126;
  uint64_t *v127;
  double v128;
  _QWORD aBlock[4];
  id v130;
  uint64_t *v131;
  double v132;
  uint64_t v133;
  double *v134;
  uint64_t v135;
  uint64_t v136;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, 320.0, 480.0);
  -[PXDiagnosticsHighlightCurationSettingsViewController setView:](self, "setView:", v3);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = v3;
  objc_msgSend(v5, "frame");
  v7 = v6;
  objc_msgSend(v5, "frame");
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C28]), "initWithFrame:", 0.0, 10.0, v7, v8 + -10.0 + -20.0 + -26.0 + -10.0);
  objc_msgSend(v9, "setAutoresizingMask:", 18);
  objc_msgSend(v9, "setKeyboardDismissMode:", 1);
  objc_msgSend(v5, "addSubview:", v9);
  v133 = 0;
  v134 = (double *)&v133;
  v135 = 0x2020000000;
  v136 = 0x4000000000000000;
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PXDiagnosticsHighlightCurationSettingsViewController_loadView__block_invoke;
  aBlock[3] = &unk_1E5133180;
  v132 = v7;
  v131 = &v133;
  v11 = v9;
  v130 = v11;
  v12 = (void (**)(void *, const __CFString *, void *))_Block_copy(aBlock);
  v125[0] = v10;
  v125[1] = 3221225472;
  v125[2] = __64__PXDiagnosticsHighlightCurationSettingsViewController_loadView__block_invoke_2;
  v125[3] = &unk_1E51331A8;
  v128 = v7;
  v127 = &v133;
  v13 = v11;
  v126 = v13;
  v14 = (void (**)(void *, const __CFString *, void *))_Block_copy(v125);
  v121[0] = v10;
  v121[1] = 3221225472;
  v121[2] = __64__PXDiagnosticsHighlightCurationSettingsViewController_loadView__block_invoke_3;
  v121[3] = &unk_1E51331D0;
  v123 = &v133;
  v124 = v7;
  v15 = v13;
  v122 = v15;
  v16 = (void (**)(void *, const __CFString *))_Block_copy(v121);
  v17 = self->_options;
  v16[2](v16, CFSTR("Identical Deduping"));
  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("doIdenticalDeduping"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2](v12, CFSTR("Do Identical Deduping:"), v18);
  v19 = (UISwitch *)objc_claimAutoreleasedReturnValue();
  doIdenticalDedupingSwitch = self->_doIdenticalDedupingSwitch;
  self->_doIdenticalDedupingSwitch = v19;

  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("identicalDedupingTimeInterval"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, CFSTR("Time Interval (s):"), v21);
  v22 = (UITextField *)objc_claimAutoreleasedReturnValue();
  identicalDedupingTimeIntervalTextField = self->_identicalDedupingTimeIntervalTextField;
  self->_identicalDedupingTimeIntervalTextField = v22;

  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("identicalDedupingTimeIntervalForPeople"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, CFSTR("People Time Interval (s):"), v24);
  v25 = (UITextField *)objc_claimAutoreleasedReturnValue();
  identicalDedupingTimeIntervalForPeopleTextField = self->_identicalDedupingTimeIntervalForPeopleTextField;
  self->_identicalDedupingTimeIntervalForPeopleTextField = v25;

  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("identicalDedupingMaximumTimeGroupExtension"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, CFSTR("Maximum Time Group Extension:"), v27);
  v28 = (UITextField *)objc_claimAutoreleasedReturnValue();
  identicalDedupingMaximumTimeGroupExtensionTextField = self->_identicalDedupingMaximumTimeGroupExtensionTextField;
  self->_identicalDedupingMaximumTimeGroupExtensionTextField = v28;

  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("maximumNumberOfItemsPerIdenticalCluster"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, CFSTR("Max Identical Cluster Size:"), v30);
  v31 = (UITextField *)objc_claimAutoreleasedReturnValue();
  maximumNumberOfItemsPerIdenticalClusterTextField = self->_maximumNumberOfItemsPerIdenticalClusterTextField;
  self->_maximumNumberOfItemsPerIdenticalClusterTextField = v31;

  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("identicalDedupingThreshold"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, CFSTR("Threshold:"), v33);
  v34 = (UITextField *)objc_claimAutoreleasedReturnValue();
  identicalDedupingThresholdTextField = self->_identicalDedupingThresholdTextField;
  self->_identicalDedupingThresholdTextField = v34;

  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("identicalDedupingThresholdForPeople"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, CFSTR("People Threshold:"), v36);
  v37 = (UITextField *)objc_claimAutoreleasedReturnValue();
  identicalDedupingThresholdForPeopleTextField = self->_identicalDedupingThresholdForPeopleTextField;
  self->_identicalDedupingThresholdForPeopleTextField = v37;

  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("identicalDedupingThresholdForBestItems"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, CFSTR("Best Items Threshold:"), v39);
  v40 = (UITextField *)objc_claimAutoreleasedReturnValue();
  identicalDedupingThresholdForBestItemsTextField = self->_identicalDedupingThresholdForBestItemsTextField;
  self->_identicalDedupingThresholdForBestItemsTextField = v40;

  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("useFaceprintsForIdenticalDeduping"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2](v12, CFSTR("Use Faceprints:"), v42);
  v43 = (UISwitch *)objc_claimAutoreleasedReturnValue();
  useFaceprintsForIdenticalDedupingSwitch = self->_useFaceprintsForIdenticalDedupingSwitch;
  self->_useFaceprintsForIdenticalDedupingSwitch = v43;

  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("identicalDedupingFaceprintDistance"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, CFSTR("Faceprint Distance:"), v45);
  v46 = (UITextField *)objc_claimAutoreleasedReturnValue();
  identicalDedupingFaceprintDistanceTextField = self->_identicalDedupingFaceprintDistanceTextField;
  self->_identicalDedupingFaceprintDistanceTextField = v46;

  v16[2](v16, CFSTR("Semantical Deduping"));
  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("doSemanticalDeduping"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2](v12, CFSTR("Do Semantical Deduping:"), v48);
  v49 = (UISwitch *)objc_claimAutoreleasedReturnValue();
  doSemanticalDedupingSwitch = self->_doSemanticalDedupingSwitch;
  self->_doSemanticalDedupingSwitch = v49;

  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("dontSemanticallyDedupePeople"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2](v12, CFSTR("Disable People Deduping:"), v51);
  v52 = (UISwitch *)objc_claimAutoreleasedReturnValue();
  doNotSemanticallyDedupePeopleSwitch = self->_doNotSemanticallyDedupePeopleSwitch;
  self->_doNotSemanticallyDedupePeopleSwitch = v52;

  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("dontSemanticallyDedupePersons"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2](v12, CFSTR("Disable Persons Deduping:"), v54);
  v55 = (UISwitch *)objc_claimAutoreleasedReturnValue();
  doNotSemanticallyDedupePersonsSwitch = self->_doNotSemanticallyDedupePersonsSwitch;
  self->_doNotSemanticallyDedupePersonsSwitch = v55;

  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("semanticalDedupingTimeInterval"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, CFSTR("Time Interval (s):"), v57);
  v58 = (UITextField *)objc_claimAutoreleasedReturnValue();
  semanticalDedupingTimeIntervalTextField = self->_semanticalDedupingTimeIntervalTextField;
  self->_semanticalDedupingTimeIntervalTextField = v58;

  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("semanticalDedupingTimeIntervalForPeople"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, CFSTR("People Time Interval (s):"), v60);
  v61 = (UITextField *)objc_claimAutoreleasedReturnValue();
  semanticalDedupingTimeIntervalForPeopleTextField = self->_semanticalDedupingTimeIntervalForPeopleTextField;
  self->_semanticalDedupingTimeIntervalForPeopleTextField = v61;

  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("semanticalDedupingTimeIntervalForPersons"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, CFSTR("Persons Time Interval (s):"), v63);
  v64 = (UITextField *)objc_claimAutoreleasedReturnValue();
  semanticalDedupingTimeIntervalForPersonsTextField = self->_semanticalDedupingTimeIntervalForPersonsTextField;
  self->_semanticalDedupingTimeIntervalForPersonsTextField = v64;

  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("semanticalDedupingMaximumTimeGroupExtension"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, CFSTR("Maximum Time Group Extension:"), v66);
  v67 = (UITextField *)objc_claimAutoreleasedReturnValue();
  semanticalDedupingMaximumTimeGroupExtensionTextField = self->_semanticalDedupingMaximumTimeGroupExtensionTextField;
  self->_semanticalDedupingMaximumTimeGroupExtensionTextField = v67;

  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("maximumNumberOfItemsPerSemanticalCluster"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, CFSTR("Max Semantical Cluster Size:"), v69);
  v70 = (UITextField *)objc_claimAutoreleasedReturnValue();
  maximumNumberOfItemsPerSemanticalClusterTextField = self->_maximumNumberOfItemsPerSemanticalClusterTextField;
  self->_maximumNumberOfItemsPerSemanticalClusterTextField = v70;

  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("semanticalDedupingThreshold"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, CFSTR("Threshold:"), v72);
  v73 = (UITextField *)objc_claimAutoreleasedReturnValue();
  semanticalDedupingThresholdTextField = self->_semanticalDedupingThresholdTextField;
  self->_semanticalDedupingThresholdTextField = v73;

  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("semanticalDedupingThresholdForPeople"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, CFSTR("People Threshold:"), v75);
  v76 = (UITextField *)objc_claimAutoreleasedReturnValue();
  semanticalDedupingThresholdForPeopleTextField = self->_semanticalDedupingThresholdForPeopleTextField;
  self->_semanticalDedupingThresholdForPeopleTextField = v76;

  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("semanticalDedupingThresholdForPersons"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, CFSTR("Persons Threshold:"), v78);
  v79 = (UITextField *)objc_claimAutoreleasedReturnValue();
  semanticalDedupingThresholdForPersonsTextField = self->_semanticalDedupingThresholdForPersonsTextField;
  self->_semanticalDedupingThresholdForPersonsTextField = v79;

  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("allowAdaptiveForSemanticalDeduping"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2](v12, CFSTR("Allow Adaptive For Semantical:"), v81);
  v82 = (UISwitch *)objc_claimAutoreleasedReturnValue();
  allowAdaptiveForSemanticalDedupingSwitch = self->_allowAdaptiveForSemanticalDedupingSwitch;
  self->_allowAdaptiveForSemanticalDedupingSwitch = v82;

  -[UISwitch setEnabled:](self->_allowAdaptiveForSemanticalDedupingSwitch, "setEnabled:", 0);
  v16[2](v16, CFSTR("Misc. Deduping"));
  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("useOnlyScenesForDeduping"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2](v12, CFSTR("Use Only Scenes:"), v84);
  v85 = (UISwitch *)objc_claimAutoreleasedReturnValue();
  useOnlyScenesForDedupingSwitch = self->_useOnlyScenesForDedupingSwitch;
  self->_useOnlyScenesForDedupingSwitch = v85;

  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("useAllPersonsForDeduping"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2](v12, CFSTR("Use All Persons:"), v87);
  v88 = (UISwitch *)objc_claimAutoreleasedReturnValue();
  useAllPersonsForDedupingSwitch = self->_useAllPersonsForDedupingSwitch;
  self->_useAllPersonsForDedupingSwitch = v88;

  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("useFaceQualityForElection"));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2](v12, CFSTR("Use Face Quality for Election:"), v90);
  v91 = (UISwitch *)objc_claimAutoreleasedReturnValue();
  useFaceQualityForElectionSwitch = self->_useFaceQualityForElectionSwitch;
  self->_useFaceQualityForElectionSwitch = v91;

  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("doNotDedupeVideos"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2](v12, CFSTR("Don't Dedupe Videos:"), v93);
  v94 = (UISwitch *)objc_claimAutoreleasedReturnValue();
  doNotDedupeVideosSwitch = self->_doNotDedupeVideosSwitch;
  self->_doNotDedupeVideosSwitch = v94;

  -[UISwitch setEnabled:](self->_doNotDedupeVideosSwitch, "setEnabled:", 0);
  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("doNotDedupeInterestingPortraitsAndLivePictures"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2](v12, CFSTR("Don't Dedupe Portraits with Live:"), v96);
  v97 = (UISwitch *)objc_claimAutoreleasedReturnValue();
  doNotDedupeInterestingPortraitsAndLivePicturesSwitch = self->_doNotDedupeInterestingPortraitsAndLivePicturesSwitch;
  self->_doNotDedupeInterestingPortraitsAndLivePicturesSwitch = v97;

  -[UISwitch setEnabled:](self->_doNotDedupeInterestingPortraitsAndLivePicturesSwitch, "setEnabled:", 0);
  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("onlyDedupeContiguousItems"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2](v12, CFSTR("Only Contiguous Items:"), v99);
  v100 = (UISwitch *)objc_claimAutoreleasedReturnValue();
  onlyDedupeContiguousItemsSwitch = self->_onlyDedupeContiguousItemsSwitch;
  self->_onlyDedupeContiguousItemsSwitch = v100;

  -[UISwitch setEnabled:](self->_onlyDedupeContiguousItemsSwitch, "setEnabled:", 0);
  v16[2](v16, CFSTR("Dejunking"));
  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("doDejunk"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2](v12, CFSTR("Do Dejunking:"), v102);
  v103 = (UISwitch *)objc_claimAutoreleasedReturnValue();
  doDejunkSwitch = self->_doDejunkSwitch;
  self->_doDejunkSwitch = v103;

  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("returnDedupedJunkIfOnlyJunk"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2](v12, CFSTR("Return Deduped Junk:"), v105);
  v106 = (UISwitch *)objc_claimAutoreleasedReturnValue();
  returnDedupedJunkIfOnlyJunkSwitch = self->_returnDedupedJunkIfOnlyJunkSwitch;
  self->_returnDedupedJunkIfOnlyJunkSwitch = v106;

  v16[2](v16, CFSTR("Final Pass"));
  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("doFinalPass"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2](v12, CFSTR("Do Final Pass:"), v108);
  v109 = (UISwitch *)objc_claimAutoreleasedReturnValue();
  doFinalPassSwitch = self->_doFinalPassSwitch;
  self->_doFinalPassSwitch = v109;

  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("finalPassTimeInterval"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, CFSTR("Final Pass Time Interval:"), v111);
  v112 = (UITextField *)objc_claimAutoreleasedReturnValue();
  finalPassTimeIntervalTextField = self->_finalPassTimeIntervalTextField;
  self->_finalPassTimeIntervalTextField = v112;

  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("finalPassMaximumTimeGroupExtension"));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, CFSTR("Maximum Time Group Extension:"), v114);
  v115 = (UITextField *)objc_claimAutoreleasedReturnValue();
  finalPassMaximumTimeGroupExtensionTextField = self->_finalPassMaximumTimeGroupExtensionTextField;
  self->_finalPassMaximumTimeGroupExtensionTextField = v115;

  -[NSDictionary objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("finalPassDedupingThreshold"));
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, CFSTR("Final Pass Deduping Threshold:"), v117);
  v118 = (UITextField *)objc_claimAutoreleasedReturnValue();
  finalPassDedupingThresholdTextField = self->_finalPassDedupingThresholdTextField;
  self->_finalPassDedupingThresholdTextField = v118;

  objc_msgSend(v15, "frame");
  objc_msgSend(v15, "setContentSize:", v120, v134[3]);

  _Block_object_dispose(&v133, 8);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)PXDiagnosticsHighlightCurationSettingsViewController;
  -[PXDiagnosticsHighlightCurationSettingsViewController viewDidLoad](&v12, sel_viewDidLoad);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancel_);
  -[PXDiagnosticsHighlightCurationSettingsViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLeftBarButtonItem:", v3);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__done_);
  -[PXDiagnosticsHighlightCurationSettingsViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR("Apply Globally"), 0, self, sel__applySettingsGlobally_);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR("Restore Defaults"), 0, self, sel__resetSettings_);
  v13[0] = v7;
  v13[1] = v8;
  v13[2] = v7;
  v13[3] = v9;
  v13[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDiagnosticsHighlightCurationSettingsViewController setToolbarItems:](self, "setToolbarItems:", v10);

  -[PXDiagnosticsHighlightCurationSettingsViewController navigationController](self, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setToolbarHidden:animated:", 0, 1);

}

- (NSDictionary)options
{
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
  id v33;
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
  _QWORD v77[34];
  _QWORD v78[36];

  v78[34] = *MEMORY[0x1E0C80C00];
  v77[0] = CFSTR("doIdenticalDeduping");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UISwitch isOn](self->_doIdenticalDedupingSwitch, "isOn"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = v76;
  v77[1] = CFSTR("identicalDedupingTimeInterval");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[UITextField text](self->_identicalDedupingTimeIntervalTextField, "text");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "doubleValue");
  objc_msgSend(v3, "numberWithDouble:");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v78[1] = v74;
  v77[2] = CFSTR("identicalDedupingTimeIntervalForPeople");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[UITextField text](self->_identicalDedupingTimeIntervalForPeopleTextField, "text");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "doubleValue");
  objc_msgSend(v4, "numberWithDouble:");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v78[2] = v72;
  v77[3] = CFSTR("identicalDedupingMaximumTimeGroupExtension");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[UITextField text](self->_identicalDedupingMaximumTimeGroupExtensionTextField, "text");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "doubleValue");
  objc_msgSend(v5, "numberWithDouble:");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v78[3] = v70;
  v77[4] = CFSTR("maximumNumberOfItemsPerIdenticalCluster");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[UITextField text](self->_maximumNumberOfItemsPerIdenticalClusterTextField, "text");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v69, "integerValue"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v78[4] = v68;
  v77[5] = CFSTR("identicalDedupingThreshold");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[UITextField text](self->_identicalDedupingThresholdTextField, "text");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "doubleValue");
  objc_msgSend(v7, "numberWithDouble:");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v78[5] = v66;
  v77[6] = CFSTR("identicalDedupingThresholdForPeople");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[UITextField text](self->_identicalDedupingThresholdForPeopleTextField, "text");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "doubleValue");
  objc_msgSend(v8, "numberWithDouble:");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v78[6] = v64;
  v77[7] = CFSTR("identicalDedupingThresholdForBestItems");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[UITextField text](self->_identicalDedupingThresholdForBestItemsTextField, "text");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "doubleValue");
  objc_msgSend(v9, "numberWithDouble:");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v78[7] = v62;
  v77[8] = CFSTR("useFaceprintsForIdenticalDeduping");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UISwitch isOn](self->_useFaceprintsForIdenticalDedupingSwitch, "isOn"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v78[8] = v61;
  v77[9] = CFSTR("identicalDedupingFaceprintDistance");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[UITextField text](self->_identicalDedupingFaceprintDistanceTextField, "text");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "doubleValue");
  objc_msgSend(v10, "numberWithDouble:");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v78[9] = v59;
  v77[10] = CFSTR("doSemanticalDeduping");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UISwitch isOn](self->_doSemanticalDedupingSwitch, "isOn"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v78[10] = v58;
  v77[11] = CFSTR("semanticalDedupingTimeInterval");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[UITextField text](self->_semanticalDedupingTimeIntervalTextField, "text");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "doubleValue");
  objc_msgSend(v11, "numberWithDouble:");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v78[11] = v56;
  v77[12] = CFSTR("semanticalDedupingTimeIntervalForPeople");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[UITextField text](self->_semanticalDedupingTimeIntervalForPeopleTextField, "text");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "doubleValue");
  objc_msgSend(v12, "numberWithDouble:");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v78[12] = v54;
  v77[13] = CFSTR("semanticalDedupingTimeIntervalForPersons");
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[UITextField text](self->_semanticalDedupingTimeIntervalForPersonsTextField, "text");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "doubleValue");
  objc_msgSend(v13, "numberWithDouble:");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v78[13] = v52;
  v77[14] = CFSTR("semanticalDedupingMaximumTimeGroupExtension");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  -[UITextField text](self->_semanticalDedupingMaximumTimeGroupExtensionTextField, "text");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "doubleValue");
  objc_msgSend(v14, "numberWithDouble:");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v78[14] = v50;
  v77[15] = CFSTR("maximumNumberOfItemsPerSemanticalCluster");
  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[UITextField text](self->_maximumNumberOfItemsPerSemanticalClusterTextField, "text");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "numberWithInteger:", objc_msgSend(v49, "integerValue"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v78[15] = v48;
  v77[16] = CFSTR("semanticalDedupingThreshold");
  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[UITextField text](self->_semanticalDedupingThresholdTextField, "text");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "doubleValue");
  objc_msgSend(v16, "numberWithDouble:");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v78[16] = v46;
  v77[17] = CFSTR("semanticalDedupingThresholdForPeople");
  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[UITextField text](self->_semanticalDedupingThresholdForPeopleTextField, "text");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "doubleValue");
  objc_msgSend(v17, "numberWithDouble:");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v78[17] = v44;
  v77[18] = CFSTR("semanticalDedupingThresholdForPersons");
  v18 = (void *)MEMORY[0x1E0CB37E8];
  -[UITextField text](self->_semanticalDedupingThresholdForPersonsTextField, "text");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "doubleValue");
  objc_msgSend(v18, "numberWithDouble:");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v78[18] = v42;
  v77[19] = CFSTR("dontSemanticallyDedupePeople");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UISwitch isOn](self->_doNotSemanticallyDedupePeopleSwitch, "isOn"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v78[19] = v41;
  v77[20] = CFSTR("dontSemanticallyDedupePersons");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UISwitch isOn](self->_doNotSemanticallyDedupePersonsSwitch, "isOn"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v78[20] = v40;
  v77[21] = CFSTR("allowAdaptiveForSemanticalDeduping");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UISwitch isOn](self->_allowAdaptiveForSemanticalDedupingSwitch, "isOn"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v78[21] = v39;
  v77[22] = CFSTR("useOnlyScenesForDeduping");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UISwitch isOn](self->_useOnlyScenesForDedupingSwitch, "isOn"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v78[22] = v38;
  v77[23] = CFSTR("useAllPersonsForDeduping");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UISwitch isOn](self->_useAllPersonsForDedupingSwitch, "isOn"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v78[23] = v37;
  v77[24] = CFSTR("useFaceQualityForElection");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UISwitch isOn](self->_useFaceQualityForElectionSwitch, "isOn"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v78[24] = v36;
  v77[25] = CFSTR("doNotDedupeVideos");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UISwitch isOn](self->_doNotDedupeVideosSwitch, "isOn"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v78[25] = v35;
  v77[26] = CFSTR("doNotDedupeInterestingPortraitsAndLivePictures");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UISwitch isOn](self->_doNotDedupeInterestingPortraitsAndLivePicturesSwitch, "isOn"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v78[26] = v34;
  v77[27] = CFSTR("onlyDedupeContiguousItems");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UISwitch isOn](self->_onlyDedupeContiguousItemsSwitch, "isOn"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v78[27] = v19;
  v77[28] = CFSTR("doDejunk");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UISwitch isOn](self->_doDejunkSwitch, "isOn"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v78[28] = v20;
  v77[29] = CFSTR("returnDedupedJunkIfOnlyJunk");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UISwitch isOn](self->_returnDedupedJunkIfOnlyJunkSwitch, "isOn"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v78[29] = v21;
  v77[30] = CFSTR("doFinalPass");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[UISwitch isOn](self->_doFinalPassSwitch, "isOn"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v78[30] = v22;
  v77[31] = CFSTR("finalPassTimeInterval");
  v23 = (void *)MEMORY[0x1E0CB37E8];
  -[UITextField text](self->_finalPassTimeIntervalTextField, "text");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "doubleValue");
  objc_msgSend(v23, "numberWithDouble:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v78[31] = v25;
  v77[32] = CFSTR("finalPassMaximumTimeGroupExtension");
  v26 = (void *)MEMORY[0x1E0CB37E8];
  -[UITextField text](self->_finalPassMaximumTimeGroupExtensionTextField, "text");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "doubleValue");
  objc_msgSend(v26, "numberWithDouble:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v78[32] = v28;
  v77[33] = CFSTR("finalPassDedupingThreshold");
  v29 = (void *)MEMORY[0x1E0CB37E8];
  -[UITextField text](self->_finalPassDedupingThresholdTextField, "text");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "doubleValue");
  objc_msgSend(v29, "numberWithDouble:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v78[33] = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 34);
  v33 = (id)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v33;
}

- (void)setOptions:(id)a3
{
  id v5;
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
  id v58;

  objc_storeStrong((id *)&self->_options, a3);
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("doIdenticalDeduping"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISwitch setOn:](self->_doIdenticalDedupingSwitch, "setOn:", objc_msgSend(v6, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identicalDedupingTimeInterval"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](self->_identicalDedupingTimeIntervalTextField, "setText:", v8);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identicalDedupingTimeIntervalForPeople"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](self->_identicalDedupingTimeIntervalForPeopleTextField, "setText:", v10);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identicalDedupingMaximumTimeGroupExtension"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](self->_identicalDedupingMaximumTimeGroupExtensionTextField, "setText:", v12);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("maximumNumberOfItemsPerIdenticalCluster"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](self->_maximumNumberOfItemsPerIdenticalClusterTextField, "setText:", v14);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identicalDedupingThreshold"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](self->_identicalDedupingThresholdTextField, "setText:", v16);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identicalDedupingThresholdForPeople"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringValue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](self->_identicalDedupingThresholdForPeopleTextField, "setText:", v18);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identicalDedupingThresholdForBestItems"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](self->_identicalDedupingThresholdForBestItemsTextField, "setText:", v20);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("useFaceprintsForIdenticalDeduping"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISwitch setOn:](self->_useFaceprintsForIdenticalDedupingSwitch, "setOn:", objc_msgSend(v21, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identicalDedupingFaceprintDistance"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "stringValue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](self->_identicalDedupingFaceprintDistanceTextField, "setText:", v23);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("doSemanticalDeduping"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISwitch setOn:](self->_doSemanticalDedupingSwitch, "setOn:", objc_msgSend(v24, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("semanticalDedupingTimeInterval"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringValue");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](self->_semanticalDedupingTimeIntervalTextField, "setText:", v26);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("semanticalDedupingTimeIntervalForPeople"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringValue");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](self->_semanticalDedupingTimeIntervalForPeopleTextField, "setText:", v28);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("semanticalDedupingTimeIntervalForPersons"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringValue");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](self->_semanticalDedupingTimeIntervalForPersonsTextField, "setText:", v30);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("semanticalDedupingMaximumTimeGroupExtension"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringValue");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](self->_semanticalDedupingMaximumTimeGroupExtensionTextField, "setText:", v32);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("maximumNumberOfItemsPerSemanticalCluster"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "stringValue");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](self->_maximumNumberOfItemsPerSemanticalClusterTextField, "setText:", v34);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("semanticalDedupingThreshold"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "stringValue");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](self->_semanticalDedupingThresholdTextField, "setText:", v36);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("semanticalDedupingThresholdForPeople"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "stringValue");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](self->_semanticalDedupingThresholdForPeopleTextField, "setText:", v38);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("semanticalDedupingThresholdForPersons"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "stringValue");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](self->_semanticalDedupingThresholdForPersonsTextField, "setText:", v40);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dontSemanticallyDedupePeople"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISwitch setOn:](self->_doNotSemanticallyDedupePeopleSwitch, "setOn:", objc_msgSend(v41, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dontSemanticallyDedupePersons"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISwitch setOn:](self->_doNotSemanticallyDedupePersonsSwitch, "setOn:", objc_msgSend(v42, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("allowAdaptiveForSemanticalDeduping"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISwitch setOn:](self->_allowAdaptiveForSemanticalDedupingSwitch, "setOn:", objc_msgSend(v43, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("useOnlyScenesForDeduping"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISwitch setOn:](self->_useOnlyScenesForDedupingSwitch, "setOn:", objc_msgSend(v44, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("useAllPersonsForDeduping"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISwitch setOn:](self->_useAllPersonsForDedupingSwitch, "setOn:", objc_msgSend(v45, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("useFaceQualityForElection"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISwitch setOn:](self->_useFaceQualityForElectionSwitch, "setOn:", objc_msgSend(v46, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("doNotDedupeVideos"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISwitch setOn:](self->_doNotDedupeVideosSwitch, "setOn:", objc_msgSend(v47, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("doNotDedupeInterestingPortraitsAndLivePictures"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISwitch setOn:](self->_doNotDedupeInterestingPortraitsAndLivePicturesSwitch, "setOn:", objc_msgSend(v48, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("onlyDedupeContiguousItems"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISwitch setOn:](self->_onlyDedupeContiguousItemsSwitch, "setOn:", objc_msgSend(v49, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("doDejunk"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISwitch setOn:](self->_doDejunkSwitch, "setOn:", objc_msgSend(v50, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("returnDedupedJunkIfOnlyJunk"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISwitch setOn:](self->_returnDedupedJunkIfOnlyJunkSwitch, "setOn:", objc_msgSend(v51, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("doFinalPass"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISwitch setOn:](self->_doFinalPassSwitch, "setOn:", objc_msgSend(v52, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("finalPassTimeInterval"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "stringValue");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](self->_finalPassTimeIntervalTextField, "setText:", v54);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("finalPassMaximumTimeGroupExtension"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "stringValue");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](self->_finalPassMaximumTimeGroupExtensionTextField, "setText:", v56);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("finalPassDedupingThreshold"));
  v58 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "stringValue");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setText:](self->_finalPassDedupingThresholdTextField, "setText:", v57);

}

- (void)_applySettingsGlobally:(id)a3
{
  PXDiagnosticsHighlightCurationSettingsViewControllerDelegate *delegate;
  id v4;

  delegate = self->_delegate;
  -[PXDiagnosticsHighlightCurationSettingsViewController options](self, "options", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXDiagnosticsHighlightCurationSettingsViewControllerDelegate applySettings:globally:](delegate, "applySettings:globally:", v4, 1);

}

- (void)_resetSettings:(id)a3
{
  -[PXDiagnosticsHighlightCurationSettingsViewControllerDelegate applySettings:globally:](self->_delegate, "applySettings:globally:", 0, 1);
}

- (void)_cancel:(id)a3
{
  id v3;
  id v4;

  -[PXDiagnosticsHighlightCurationSettingsViewController navigationController](self, "navigationController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

}

- (void)_done:(id)a3
{
  PXDiagnosticsHighlightCurationSettingsViewControllerDelegate *delegate;
  void *v5;
  id v6;
  id v7;

  delegate = self->_delegate;
  -[PXDiagnosticsHighlightCurationSettingsViewController options](self, "options", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDiagnosticsHighlightCurationSettingsViewControllerDelegate applySettings:globally:](delegate, "applySettings:globally:", v5, 0);

  -[PXDiagnosticsHighlightCurationSettingsViewController navigationController](self, "navigationController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v7, "popViewControllerAnimated:", 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_finalPassDedupingThresholdTextField, 0);
  objc_storeStrong((id *)&self->_finalPassMaximumTimeGroupExtensionTextField, 0);
  objc_storeStrong((id *)&self->_finalPassTimeIntervalTextField, 0);
  objc_storeStrong((id *)&self->_doFinalPassSwitch, 0);
  objc_storeStrong((id *)&self->_returnDedupedJunkIfOnlyJunkSwitch, 0);
  objc_storeStrong((id *)&self->_doDejunkSwitch, 0);
  objc_storeStrong((id *)&self->_onlyDedupeContiguousItemsSwitch, 0);
  objc_storeStrong((id *)&self->_doNotDedupeInterestingPortraitsAndLivePicturesSwitch, 0);
  objc_storeStrong((id *)&self->_doNotDedupeVideosSwitch, 0);
  objc_storeStrong((id *)&self->_useFaceQualityForElectionSwitch, 0);
  objc_storeStrong((id *)&self->_useAllPersonsForDedupingSwitch, 0);
  objc_storeStrong((id *)&self->_useOnlyScenesForDedupingSwitch, 0);
  objc_storeStrong((id *)&self->_allowAdaptiveForSemanticalDedupingSwitch, 0);
  objc_storeStrong((id *)&self->_doNotSemanticallyDedupePersonsSwitch, 0);
  objc_storeStrong((id *)&self->_doNotSemanticallyDedupePeopleSwitch, 0);
  objc_storeStrong((id *)&self->_semanticalDedupingThresholdForPersonsTextField, 0);
  objc_storeStrong((id *)&self->_semanticalDedupingThresholdForPeopleTextField, 0);
  objc_storeStrong((id *)&self->_semanticalDedupingThresholdTextField, 0);
  objc_storeStrong((id *)&self->_maximumNumberOfItemsPerSemanticalClusterTextField, 0);
  objc_storeStrong((id *)&self->_semanticalDedupingMaximumTimeGroupExtensionTextField, 0);
  objc_storeStrong((id *)&self->_semanticalDedupingTimeIntervalForPersonsTextField, 0);
  objc_storeStrong((id *)&self->_semanticalDedupingTimeIntervalForPeopleTextField, 0);
  objc_storeStrong((id *)&self->_semanticalDedupingTimeIntervalTextField, 0);
  objc_storeStrong((id *)&self->_doSemanticalDedupingSwitch, 0);
  objc_storeStrong((id *)&self->_identicalDedupingFaceprintDistanceTextField, 0);
  objc_storeStrong((id *)&self->_useFaceprintsForIdenticalDedupingSwitch, 0);
  objc_storeStrong((id *)&self->_identicalDedupingThresholdForBestItemsTextField, 0);
  objc_storeStrong((id *)&self->_identicalDedupingThresholdForPeopleTextField, 0);
  objc_storeStrong((id *)&self->_identicalDedupingThresholdTextField, 0);
  objc_storeStrong((id *)&self->_maximumNumberOfItemsPerIdenticalClusterTextField, 0);
  objc_storeStrong((id *)&self->_identicalDedupingMaximumTimeGroupExtensionTextField, 0);
  objc_storeStrong((id *)&self->_identicalDedupingTimeIntervalForPeopleTextField, 0);
  objc_storeStrong((id *)&self->_identicalDedupingTimeIntervalTextField, 0);
  objc_storeStrong((id *)&self->_doIdenticalDedupingSwitch, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

id __64__PXDiagnosticsHighlightCurationSettingsViewController_loadView__block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  double v12;
  double v13;
  double v14;
  void *v15;

  v5 = (objc_class *)MEMORY[0x1E0DC3D18];
  v6 = a3;
  v7 = a2;
  v8 = [v5 alloc];
  v9 = (void *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v9, "setAutoresizingMask:", 33);
  v10 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v9, "setOn:", v10);
  objc_msgSend(v9, "frame");
  objc_msgSend(v9, "frame");
  PXRectWithOriginAndSize();
  objc_msgSend(v9, "setFrame:");
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v9);
  v11 = objc_alloc(MEMORY[0x1E0DC3990]);
  v12 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v13 = *(double *)(a1 + 48) + -20.0 + -20.0;
  objc_msgSend(v9, "frame");
  v15 = (void *)objc_msgSend(v11, "initWithFrame:", 20.0, v12, v13 - v14 + -8.0, 26.0);
  objc_msgSend(v15, "setAutoresizingMask:", 36);
  objc_msgSend(v15, "setText:", v7);

  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v15);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24)
                                                              + 34.0;

  return v9;
}

id __64__PXDiagnosticsHighlightCurationSettingsViewController_loadView__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  void *v14;

  v5 = (objc_class *)MEMORY[0x1E0DC3DB8];
  v6 = a3;
  v7 = a2;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithFrame:", 0.0, 0.0, 60.0, 26.0);
  objc_msgSend(v8, "setAutoresizingMask:", 33);
  objc_msgSend(v6, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setText:", v9);
  objc_msgSend(v8, "setKeyboardType:", 8);
  objc_msgSend(v8, "frame");
  objc_msgSend(v8, "frame");
  PXRectWithOriginAndSize();
  objc_msgSend(v8, "setFrame:");
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v8);
  v10 = objc_alloc(MEMORY[0x1E0DC3990]);
  v11 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v12 = *(double *)(a1 + 48) + -20.0 + -20.0;
  objc_msgSend(v8, "frame");
  v14 = (void *)objc_msgSend(v10, "initWithFrame:", 20.0, v11, v12 - v13 + -8.0, 26.0);
  objc_msgSend(v14, "setAutoresizingMask:", 36);
  objc_msgSend(v14, "setText:", v7);

  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v14);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24)
                                                              + 34.0;

  return v8;
}

void __64__PXDiagnosticsHighlightCurationSettingsViewController_loadView__block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24)
                                                              + 8.0;
  v3 = (objc_class *)MEMORY[0x1E0DC3990];
  v4 = a2;
  v11 = (id)objc_msgSend([v3 alloc], "initWithFrame:", 20.0, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), *(double *)(a1 + 48) + -20.0 + -20.0, 26.0);
  objc_msgSend(v11, "setAutoresizingMask:", 34);
  v5 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontSize");
  objc_msgSend(v5, "boldSystemFontOfSize:", v6 + 2.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "uppercaseString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringWithFormat:", CFSTR("-- %@ --"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v10);

  objc_msgSend(v11, "setTextAlignment:", 1);
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v11);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24)
                                                              + 34.0;

}

@end
