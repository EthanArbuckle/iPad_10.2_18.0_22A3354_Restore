@implementation SUCoreScan

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
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  _QWORD v73[2];
  _QWORD v74[2];
  uint64_t v75;
  const __CFString *v76;
  uint64_t v77;
  const __CFString *v78;
  uint64_t v79;
  const __CFString *v80;
  uint64_t v81;
  const __CFString *v82;
  _QWORD v83[2];
  _QWORD v84[2];
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[2];
  _QWORD v88[2];
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  uint64_t v93;
  const __CFString *v94;
  uint64_t v95;
  const __CFString *v96;
  uint64_t v97;
  const __CFString *v98;
  uint64_t v99;
  const __CFString *v100;
  uint64_t v101;
  const __CFString *v102;
  uint64_t v103;
  const __CFString *v104;
  uint64_t v105;
  const __CFString *v106;
  uint64_t v107;
  const __CFString *v108;
  _QWORD v109[18];
  _QWORD v110[18];
  _QWORD v111[2];
  _QWORD v112[2];
  uint64_t v113;
  const __CFString *v114;
  _QWORD v115[2];
  _QWORD v116[2];
  _QWORD v117[2];
  _QWORD v118[2];
  _QWORD v119[4];
  _QWORD v120[4];
  uint64_t v121;
  const __CFString *v122;
  uint64_t v123;
  uint64_t v124;
  _QWORD v125[2];
  _QWORD v126[2];
  _QWORD v127[2];
  _QWORD v128[2];
  _QWORD v129[2];
  _QWORD v130[2];
  _QWORD v131[2];
  _QWORD v132[2];
  _QWORD v133[6];
  _QWORD v134[6];
  _QWORD v135[2];
  _QWORD v136[2];
  uint64_t v137;
  uint64_t v138;
  _QWORD v139[2];
  _QWORD v140[2];
  _QWORD v141[2];
  _QWORD v142[2];
  _QWORD v143[4];
  _QWORD v144[4];
  _QWORD v145[2];
  _QWORD v146[2];
  uint64_t v147;
  uint64_t v148;
  _QWORD v149[2];
  _QWORD v150[2];
  _QWORD v151[2];
  _QWORD v152[2];
  _QWORD v153[4];
  _QWORD v154[4];
  uint64_t v155;
  const __CFString *v156;
  uint64_t v157;
  uint64_t v158;
  _QWORD v159[2];
  _QWORD v160[2];
  _QWORD v161[2];
  _QWORD v162[2];
  _QWORD v163[2];
  _QWORD v164[2];
  _QWORD v165[5];
  _QWORD v166[5];
  _QWORD v167[2];
  _QWORD v168[2];
  uint64_t v169;
  uint64_t v170;
  _QWORD v171[2];
  _QWORD v172[2];
  _QWORD v173[2];
  _QWORD v174[2];
  _QWORD v175[4];
  _QWORD v176[4];
  uint64_t v177;
  const __CFString *v178;
  _QWORD v179[2];
  _QWORD v180[2];
  _QWORD v181[2];
  _QWORD v182[2];
  _QWORD v183[2];
  _QWORD v184[2];
  _QWORD v185[2];
  _QWORD v186[2];
  uint64_t v187;
  const __CFString *v188;
  _QWORD v189[6];
  _QWORD v190[6];
  _QWORD v191[9];
  _QWORD v192[11];

  v192[9] = *MEMORY[0x1E0C80C00];
  v191[0] = CFSTR("Idle");
  v189[0] = CFSTR("DecideNextScanStep");
  v187 = *MEMORY[0x1E0DA8990];
  v2 = v187;
  v188 = CFSTR("DecideNextScanStep");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v188, &v187, 1);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v190[0] = v68;
  v189[1] = CFSTR("CheckForAvailableUpdate");
  v185[0] = *MEMORY[0x1E0DA8B88];
  v3 = v185[0];
  v185[1] = v2;
  v186[0] = CFSTR("DownloadingSUCatalog");
  v186[1] = CFSTR("DownloadSUCatalog");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v186, v185, 2);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v190[1] = v67;
  v189[2] = CFSTR("VerifyLatestAvailable");
  v183[0] = v3;
  v183[1] = v2;
  v184[0] = CFSTR("DownloadingSUCatalog");
  v184[1] = CFSTR("DownloadSUCatalog");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v184, v183, 2);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v190[2] = v66;
  v189[3] = CFSTR("CollectDocMetadata");
  v181[0] = v3;
  v181[1] = v2;
  v182[0] = CFSTR("DownloadingDocCatalog");
  v182[1] = CFSTR("DownloadDocCatalog");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v182, v181, 2);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v190[3] = v65;
  v189[4] = CFSTR("DeterminePSUSAssets");
  v179[0] = v3;
  v179[1] = v2;
  v180[0] = CFSTR("DeterminingPSUSAssets");
  v180[1] = CFSTR("DeterminePSUSAssets");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v180, v179, 2);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v190[4] = v64;
  v189[5] = CFSTR("ScanComplete");
  v177 = v2;
  v178 = CFSTR("ScanComplete");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v178, &v177, 1);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v190[5] = v63;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v190, v189, 6);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v192[0] = v62;
  v191[1] = CFSTR("DownloadingSUCatalog");
  v175[0] = CFSTR("CatalogDownloadSuccess");
  v173[0] = v3;
  v173[1] = v2;
  v174[0] = CFSTR("QueryingSUMetadata");
  v174[1] = CFSTR("QuerySUMetadata");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v174, v173, 2);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v176[0] = v61;
  v175[1] = CFSTR("CatalogDownloadFailed");
  v171[0] = v3;
  v171[1] = v2;
  v172[0] = CFSTR("Idle");
  v172[1] = CFSTR("ScanFailed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v172, v171, 2);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v176[1] = v60;
  v175[2] = CFSTR("AlterCurrentPolicy");
  v169 = v2;
  v170 = *MEMORY[0x1E0DA8B68];
  v4 = v170;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v170, &v169, 1);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v176[2] = v59;
  v175[3] = CFSTR("CancelCurrentScan");
  v167[0] = v3;
  v167[1] = v2;
  v168[0] = CFSTR("Canceling");
  v168[1] = CFSTR("CancelSUCatalogDownload");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v168, v167, 2);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v176[3] = v58;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v176, v175, 4);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v192[1] = v57;
  v191[2] = CFSTR("QueryingSUMetadata");
  v165[0] = CFSTR("QueryMetadataNoAssetFound");
  v163[0] = v3;
  v163[1] = v2;
  v164[0] = CFSTR("Idle");
  v164[1] = CFSTR("ScanCompleteNoUpdate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v164, v163, 2);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v166[0] = v56;
  v165[1] = CFSTR("QueryMetadataUpdateAvailable");
  v161[0] = v3;
  v161[1] = v2;
  v162[0] = CFSTR("Idle");
  v162[1] = CFSTR("ScanSuccess");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v162, v161, 2);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v166[1] = v55;
  v165[2] = CFSTR("QueryMetadataFailed");
  v159[0] = v3;
  v159[1] = v2;
  v160[0] = CFSTR("Idle");
  v160[1] = CFSTR("ScanFailed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v160, v159, 2);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v166[2] = v54;
  v165[3] = CFSTR("AlterCurrentPolicy");
  v157 = v2;
  v158 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v158, &v157, 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v166[3] = v53;
  v165[4] = CFSTR("CancelCurrentScan");
  v155 = v3;
  v156 = CFSTR("Canceling");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v156, &v155, 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v166[4] = v52;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v166, v165, 5);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v192[2] = v51;
  v191[3] = CFSTR("DeterminingPSUSAssets");
  v153[0] = CFSTR("PSUSAssetsDetermineSuccess");
  v151[0] = v3;
  v151[1] = v2;
  v152[0] = CFSTR("Idle");
  v152[1] = CFSTR("DeterminePSUSAssetsSuccess");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v152, v151, 2);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v154[0] = v50;
  v153[1] = CFSTR("PSUSAssetsDetermineFailed");
  v149[0] = v3;
  v149[1] = v2;
  v150[0] = CFSTR("Idle");
  v150[1] = CFSTR("DeterminePSUSAssetsFailed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v150, v149, 2);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v154[1] = v49;
  v153[2] = CFSTR("AlterCurrentPolicy");
  v147 = v2;
  v148 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v148, &v147, 1);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v154[2] = v48;
  v153[3] = CFSTR("CancelCurrentScan");
  v145[0] = v3;
  v145[1] = v2;
  v146[0] = CFSTR("Canceling");
  v146[1] = CFSTR("CancelPSUSAssetsDetermination");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v146, v145, 2);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v154[3] = v47;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v154, v153, 4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v192[3] = v46;
  v191[4] = CFSTR("DownloadingDocCatalog");
  v143[0] = CFSTR("CatalogDownloadSuccess");
  v141[0] = v3;
  v141[1] = v2;
  v142[0] = CFSTR("QueryingDocMetadata");
  v142[1] = CFSTR("QueryDocMetadata");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v142, v141, 2);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v144[0] = v45;
  v143[1] = CFSTR("CatalogDownloadFailed");
  v139[0] = v3;
  v139[1] = v2;
  v140[0] = CFSTR("Idle");
  v140[1] = CFSTR("ScanFailed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v140, v139, 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v144[1] = v44;
  v143[2] = CFSTR("AlterCurrentPolicy");
  v137 = v2;
  v138 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v138, &v137, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v144[2] = v43;
  v143[3] = CFSTR("CancelCurrentScan");
  v135[0] = v3;
  v135[1] = v2;
  v136[0] = CFSTR("Canceling");
  v136[1] = CFSTR("CancelDocCatalogDownload");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v136, v135, 2);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v144[3] = v42;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v144, v143, 4);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v192[4] = v41;
  v191[5] = CFSTR("QueryingDocMetadata");
  v133[0] = CFSTR("QueryMetadataNoAssetFound");
  v131[0] = v3;
  v131[1] = v2;
  v132[0] = CFSTR("Idle");
  v132[1] = CFSTR("ScanFailed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v132, v131, 2);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v134[0] = v40;
  v133[1] = CFSTR("QueryMetadataSuccess");
  v129[0] = v3;
  v129[1] = v2;
  v130[0] = CFSTR("Idle");
  v130[1] = CFSTR("ScanSuccess");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v130, v129, 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v134[1] = v39;
  v133[2] = CFSTR("QueryMetadataNeedDoc");
  v127[0] = v3;
  v127[1] = v2;
  v128[0] = CFSTR("DownloadingDocAsset");
  v128[1] = CFSTR("DownloadDocAsset");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v128, v127, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v134[2] = v38;
  v133[3] = CFSTR("QueryMetadataFailed");
  v125[0] = v3;
  v125[1] = v2;
  v126[0] = CFSTR("Idle");
  v126[1] = CFSTR("ScanFailed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v126, v125, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v134[3] = v37;
  v133[4] = CFSTR("AlterCurrentPolicy");
  v123 = v2;
  v124 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v134[4] = v36;
  v133[5] = CFSTR("CancelCurrentScan");
  v121 = v3;
  v122 = CFSTR("Canceling");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v122, &v121, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v134[5] = v35;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v134, v133, 6);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v192[5] = v34;
  v191[6] = CFSTR("DownloadingDocAsset");
  v119[0] = CFSTR("DocDownloadSuccess");
  v117[0] = v3;
  v117[1] = v2;
  v118[0] = CFSTR("Idle");
  v118[1] = CFSTR("ScanSuccess");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v118, v117, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v120[0] = v33;
  v119[1] = CFSTR("DocDownloadFailed");
  v115[0] = v3;
  v115[1] = v2;
  v116[0] = CFSTR("Idle");
  v116[1] = CFSTR("ScanFailed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, v115, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v120[1] = v32;
  v119[2] = CFSTR("AlterCurrentPolicy");
  v113 = v2;
  v114 = CFSTR("AlterDocDownloadConfig");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v120[2] = v31;
  v119[3] = CFSTR("CancelCurrentScan");
  v111[0] = v3;
  v111[1] = v2;
  v112[0] = CFSTR("Canceling");
  v112[1] = CFSTR("RemoveDocAsset");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, v111, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v120[3] = v30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v120, v119, 4);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v192[6] = v29;
  v191[7] = CFSTR("Canceling");
  v109[0] = CFSTR("CatalogDownloadSuccess");
  v107 = v2;
  v108 = CFSTR("CheckCancelDone");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v110[0] = v28;
  v109[1] = CFSTR("CatalogDownloadFailed");
  v105 = v2;
  v106 = CFSTR("AfterFailCheckCancelDone");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v110[1] = v27;
  v109[2] = CFSTR("CatalogDownloadCancelSuccess");
  v103 = v2;
  v104 = CFSTR("CheckCancelDone");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v110[2] = v26;
  v109[3] = CFSTR("CatalogDownloadCancelFailed");
  v101 = v2;
  v102 = CFSTR("AfterFailCheckCancelDone");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v110[3] = v25;
  v109[4] = CFSTR("PSUSAssetsDetermineSuccess");
  v99 = v2;
  v100 = CFSTR("CheckCancelDone");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v110[4] = v24;
  v109[5] = CFSTR("PSUSAssetsDetermineFailed");
  v97 = v2;
  v98 = CFSTR("AfterFailCheckCancelDone");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v110[5] = v23;
  v109[6] = CFSTR("PSUSAssetsDetermineCancelSuccess");
  v95 = v2;
  v96 = CFSTR("CheckCancelDone");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v110[6] = v22;
  v109[7] = CFSTR("PSUSAssetsDetermineCancelFailed");
  v93 = v2;
  v94 = CFSTR("AfterFailCheckCancelDone");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v110[7] = v21;
  v109[8] = CFSTR("QueryMetadataNoAssetFound");
  v91[0] = v3;
  v91[1] = v2;
  v92[0] = CFSTR("Idle");
  v92[1] = CFSTR("CancelSuccess");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v91, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v110[8] = v20;
  v109[9] = CFSTR("QueryMetadataUpdateAvailable");
  v89[0] = v3;
  v89[1] = v2;
  v90[0] = CFSTR("Idle");
  v90[1] = CFSTR("AfterAvailCancelSuccess");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, v89, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v110[9] = v18;
  v109[10] = CFSTR("QueryMetadataNeedDoc");
  v87[0] = v3;
  v87[1] = v2;
  v88[0] = CFSTR("Idle");
  v88[1] = CFSTR("CancelSuccess");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, v87, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v110[10] = v17;
  v109[11] = CFSTR("QueryMetadataSuccess");
  v85[0] = v3;
  v85[1] = v2;
  v86[0] = CFSTR("Idle");
  v86[1] = CFSTR("CancelSuccess");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v110[11] = v16;
  v109[12] = CFSTR("QueryMetadataFailed");
  v83[0] = v3;
  v83[1] = v2;
  v84[0] = CFSTR("Idle");
  v84[1] = CFSTR("AfterFailCancelSuccess");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v110[12] = v5;
  v109[13] = CFSTR("DocDownloadSuccess");
  v81 = v2;
  v82 = CFSTR("CheckCancelDone");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v110[13] = v6;
  v109[14] = CFSTR("DocDownloadFailed");
  v79 = v2;
  v80 = CFSTR("AfterFailCheckCancelDone");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v110[14] = v7;
  v109[15] = CFSTR("DocRemoveSuccess");
  v77 = v2;
  v78 = CFSTR("CheckCancelDone");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v110[15] = v8;
  v109[16] = CFSTR("DocRemoveFailed");
  v75 = v2;
  v76 = CFSTR("AfterFailCheckCancelDone");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v110[16] = v9;
  v109[17] = CFSTR("CancelComplete");
  v73[0] = v3;
  v73[1] = v2;
  v74[0] = CFSTR("Idle");
  v74[1] = CFSTR("CancelDone");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v110[17] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, v109, 18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v192[7] = v11;
  v191[8] = *MEMORY[0x1E0DA8B78];
  v71 = *MEMORY[0x1E0DA8B70];
  v69 = v3;
  v70 = *MEMORY[0x1E0DA8B80];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v192[8] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v192, v191, 9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", v19, 1);
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
  -[SUCoreScan scanFSM](self, "scanFSM");
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
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("DecideNextScanStep")))
    {
      v16 = -[SUCoreScan actionDecideNextScanStep:](self, "actionDecideNextScanStep:", a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("DownloadSUCatalog")))
    {
      v16 = -[SUCoreScan actionDownloadSUCatalog:](self, "actionDownloadSUCatalog:", a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("QuerySUMetadata")))
    {
      v16 = -[SUCoreScan actionQuerySUMetadata:](self, "actionQuerySUMetadata:", a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("DeterminePSUSAssets")))
    {
      v16 = -[SUCoreScan actionDeterminePSUSAssets:](self, "actionDeterminePSUSAssets:", a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("DownloadDocCatalog")))
    {
      v16 = -[SUCoreScan actionDownloadDocCatalog:](self, "actionDownloadDocCatalog:", a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("QueryDocMetadata")))
    {
      v16 = -[SUCoreScan actionQueryDocMetadata:](self, "actionQueryDocMetadata:", a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("DownloadDocAsset")))
    {
      v16 = -[SUCoreScan actionDownloadDocAsset:](self, "actionDownloadDocAsset:", a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("AlterDocDownloadConfig")))
    {
      v16 = -[SUCoreScan actionAlterDocDownloadConfig:](self, "actionAlterDocDownloadConfig:", a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("RemoveDocAsset")))
    {
      v16 = -[SUCoreScan actionRemoveDocAsset:](self, "actionRemoveDocAsset:", a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ScanCompleteNoUpdate")))
    {
      v16 = -[SUCoreScan actionScanCompleteNoUpdate:](self, "actionScanCompleteNoUpdate:", a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ScanSuccess")))
    {
      v16 = -[SUCoreScan actionScanSuccess:error:](self, "actionScanSuccess:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ScanFailed")))
    {
      v16 = -[SUCoreScan actionScanFailed:error:](self, "actionScanFailed:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("DeterminePSUSAssetsSuccess")))
    {
      v16 = -[SUCoreScan actionDeterminePSUSAssetsSuccess:](self, "actionDeterminePSUSAssetsSuccess:", a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("DeterminePSUSAssetsFailed")))
    {
      v16 = -[SUCoreScan actionDeterminePSUSAssetsFailed:error:](self, "actionDeterminePSUSAssetsFailed:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("ScanComplete")))
    {
      v16 = -[SUCoreScan actionScanComplete:](self, "actionScanComplete:", a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("CancelSUCatalogDownload")))
    {
      v16 = -[SUCoreScan actionCancelSUCatalogDownload:](self, "actionCancelSUCatalogDownload:", a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("CancelDocCatalogDownload")))
    {
      v16 = -[SUCoreScan actionCancelDocCatalogDownload:](self, "actionCancelDocCatalogDownload:", a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("CancelSuccess")))
    {
      v16 = -[SUCoreScan actionCancelSuccess:](self, "actionCancelSuccess:", a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("AfterAvailCancelSuccess")))
    {
      v16 = -[SUCoreScan actionAfterAvailCancelSuccess:error:](self, "actionAfterAvailCancelSuccess:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("AfterFailCancelSuccess")))
    {
      v16 = -[SUCoreScan actionAfterFailCancelSuccess:error:](self, "actionAfterFailCancelSuccess:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("CancelRemoveFailed")))
    {
      v16 = -[SUCoreScan actionCancelRemoveFailed:error:](self, "actionCancelRemoveFailed:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("CheckCancelDone")))
    {
      v16 = -[SUCoreScan actionCheckCancelDone:](self, "actionCheckCancelDone:", a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("AfterFailCheckCancelDone")))
    {
      v16 = -[SUCoreScan actionAfterFailCheckCancelDone:error:](self, "actionAfterFailCheckCancelDone:error:", v12, a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("CancelDone")))
    {
      v16 = -[SUCoreScan actionCancelDone:](self, "actionCancelDone:", a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("CancelPSUSAssetsDetermination")))
    {
      v16 = -[SUCoreScan actionCancelPSUSAssetsDetermination:](self, "actionCancelPSUSAssetsDetermination:", a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("SimCatalogDownloadSuccess")))
    {
      v16 = -[SUCoreScan a_SimCatalogDownloadSuccess:](self, "a_SimCatalogDownloadSuccess:", a8);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("SimQueryMetadataUpdateAvailable")))
    {
      v16 = -[SUCoreScan a_SimQueryMetadataUpdateAvailable:](self, "a_SimQueryMetadataUpdateAvailable:", a8);
    }
    else
    {
      v16 = -[SUCoreScan actionUnknownAction:error:](self, "actionUnknownAction:error:", v11, a8);
    }
    v15 = v16;
  }

  return v15;
}

- (int64_t)actionDeterminePSUSAssets:(id *)a3
{
  void *v4;
  NSObject *v5;

  -[SUCoreScan scanFSM](self, "scanFSM", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extendedStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  return -[SUCoreScan _determinePSUSAssets](self, "_determinePSUSAssets");
}

- (int64_t)actionDownloadSUCatalog:(id *)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[SUCoreScan scanFSM](self, "scanFSM", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extendedStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreScan scanPolicy](self, "scanPolicy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "softwareUpdateAssetType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SUCoreScan _downloadCatalog:withIdentifier:](self, "_downloadCatalog:withIdentifier:", v7, CFSTR("su"));

  return v8;
}

- (int64_t)actionQuerySUMetadata:(id *)a3
{
  void *v4;
  NSObject *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  SUCoreScanParam *v25;
  _QWORD v27[5];
  id v28;
  uint8_t buf[4];
  SUCoreScan *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[SUCoreScan scanFSM](self, "scanFSM", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extendedStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = -[SUCoreScan _decrementMobileAssetPending:](self, "_decrementMobileAssetPending:", CFSTR("DownloadSUCatalog"));
  -[SUCoreScan alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SUCoreScan alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v30 = self;
      v31 = 2114;
      v32 = v8;
      v11 = "%{public}@ SU metadata query using alternateAssetAudienceUUID as purpose: %{public}@";
LABEL_7:
      _os_log_impl(&dword_1DDFDD000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 0x16u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  -[SUCoreScan scanPolicy](self, "scanPolicy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "assetAudienceUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SUCoreScan scanPolicy](self, "scanPolicy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "assetAudienceUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "oslog");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v30 = self;
      v31 = 2114;
      v32 = v8;
      v11 = "%{public}@ SU metadata query using scan policy assetAudienceUUID as purpose: %{public}@";
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  v8 = 0;
LABEL_9:
  -[SUCoreScan scanPolicy](self, "scanPolicy");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constructSoftwareUpdateMAAssetQueryWithPurpose:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreScan _incrementMobileAssetPending:](self, "_incrementMobileAssetPending:", CFSTR("QuerySUMetadata"));
  if (v17)
  {
    -[SUCoreScan _trackScanBegin:withIdentifier:](self, "_trackScanBegin:withIdentifier:", CFSTR("queryMetaDataWithError"), CFSTR("su"));
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __36__SUCoreScan_actionQuerySUMetadata___block_invoke;
    v27[3] = &unk_1EA878800;
    v27[4] = self;
    v28 = v17;
    objc_msgSend(v28, "SUCoreBorder_queryMetaDataWithError:", v27);

  }
  else
  {
    v18 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCoreScan scanPolicy](self, "scanPolicy");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "summary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("failed to construct SU asset query from policy[%@]"), v20);

    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 8100;
    objc_msgSend(v22, "buildError:underlying:description:", 8100, 0, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreScan scanFSM](self, "scanFSM");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[SUCoreScanParam initWithResult:withError:]([SUCoreScanParam alloc], "initWithResult:withError:", 8100, v23);
    objc_msgSend(v24, "postEvent:withInfo:", CFSTR("QueryMetadataFailed"), v25);

  }
  return v6;
}

void __36__SUCoreScan_actionQuerySUMetadata___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  SUCoreScanParam *v8;
  id v9;

  v9 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_trackScanEnd:withIdentifier:withResult:withError:", CFSTR("queryMetaDataWithError"), CFSTR("su"), a2);
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "buildError:underlying:description:", 8401, v9, CFSTR("failed to query SU metadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "scanFSM");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SUCoreScanParam initWithResult:withError:]([SUCoreScanParam alloc], "initWithResult:withError:", a2, v6);
    objc_msgSend(v7, "postEvent:withInfo:", CFSTR("QueryMetadataFailed"), v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_filterSUQueryResults:", *(_QWORD *)(a1 + 40));
  }

}

- (unint64_t)actionDeterminePSUSAssetsSuccess:(id *)a3
{
  void *v4;
  NSObject *v5;
  unint64_t v6;
  void *v7;

  -[SUCoreScan scanFSM](self, "scanFSM", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extendedStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = -[SUCoreScan _decrementMobileAssetPending:](self, "_decrementMobileAssetPending:", CFSTR("DeterminePSUSAssets succeeded"));
  -[SUCoreScan scanFSM](self, "scanFSM");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "followupEvent:", CFSTR("DecideNextScanStep"));

  return v6;
}

- (unint64_t)actionDeterminePSUSAssetsFailed:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  unint64_t v8;
  void *v9;

  v5 = a3;
  -[SUCoreScan scanFSM](self, "scanFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = -[SUCoreScan _decrementMobileAssetPending:](self, "_decrementMobileAssetPending:", CFSTR("DeterminePSUSAssets failed"));
  -[SUCoreScan setInterimScanResult:](self, "setInterimScanResult:", v5);

  -[SUCoreScan scanFSM](self, "scanFSM");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "followupEvent:", CFSTR("DecideNextScanStep"));

  return v8;
}

- (unint64_t)actionScanComplete:(id *)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v16;

  -[SUCoreScan scanFSM](self, "scanFSM", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extendedStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[SUCoreScan operation](self, "operation") != 1)
  {
    -[SUCoreScan scanFSM](self, "scanFSM");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "diag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ invalid operation (%d) detected"), self, -[SUCoreScan operation](self, "operation"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 8117;
    objc_msgSend(v7, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SCAN] COMPLETE"), v8, 8117, 0);
    goto LABEL_12;
  }
  -[SUCoreScan interimScanResult](self, "interimScanResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScan scanPolicy](self, "scanPolicy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUCoreScan operationSPIType](self, "operationSPIType") == 1)
  {
    -[SUCoreScan checkCompletion](self, "checkCompletion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan setCheckCompletion:](self, "setCheckCompletion:", 0);
    -[SUCoreScan scanPolicy](self, "scanPolicy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "descriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fallbackDescriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan _checkEndComplete:scanPolicy:primary:secondary:error:clearingTransaction:](self, "_checkEndComplete:scanPolicy:primary:secondary:error:clearingTransaction:", v8, v9, v10, v11, v12, 1);
  }
  else
  {
    if (-[SUCoreScan operationSPIType](self, "operationSPIType") == 2)
    {
      -[SUCoreScan checkMajorMinorCompletion](self, "checkMajorMinorCompletion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreScan setCheckMajorMinorCompletion:](self, "setCheckMajorMinorCompletion:", 0);
      objc_msgSend(v6, "majorPrimaryDescriptor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "majorSecondaryDescriptor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "minorPrimaryDescriptor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "minorSecondaryDescriptor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "error");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v16) = 1;
      -[SUCoreScan _checkMajorMinorEndComplete:scanPolicy:majorPrimary:majorSecondary:minorPrimary:minorSecondary:error:clearingTransaction:](self, "_checkMajorMinorEndComplete:scanPolicy:majorPrimary:majorSecondary:minorPrimary:minorSecondary:error:clearingTransaction:", v8, v7, v9, v10, v11, v12, v14, v16);
    }
    else
    {
      if (-[SUCoreScan operationSPIType](self, "operationSPIType") != 3)
      {
        -[SUCoreScan scanFSM](self, "scanFSM");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "diag");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ unknown operationSPIType (%d) found"), self, -[SUCoreScan operationSPIType](self, "operationSPIType"));
        v13 = 8117;
        objc_msgSend(v9, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SCAN] COMPLETE"), v10, 8117, 0);
        goto LABEL_11;
      }
      -[SUCoreScan checkSlowReleaseCompletion](self, "checkSlowReleaseCompletion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreScan setCheckSlowReleaseCompletion:](self, "setCheckSlowReleaseCompletion:", 0);
      objc_msgSend(v6, "majorPrimaryDescriptor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "majorSecondaryDescriptor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "minorPrimaryDescriptor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "minorSecondaryDescriptor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "error");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v16) = 1;
      -[SUCoreScan _checkSlowReleaseEndComplete:scanPolicy:primary:secondary:alternatePrimary:alternateSecondary:error:clearingTransaction:](self, "_checkSlowReleaseEndComplete:scanPolicy:primary:secondary:alternatePrimary:alternateSecondary:error:clearingTransaction:", v8, v7, v9, v10, v11, v12, v14, v16);
    }

  }
  v13 = 0;
LABEL_11:

LABEL_12:
  if (!-[SUCoreScan cancelingOperation](self, "cancelingOperation"))
    -[SUCoreScan _clearCurrentOperation](self, "_clearCurrentOperation");
  return v13;
}

- (int)_getPhaseAndPostEventAfterReachingScanPhase:(int)a3
{
  uint64_t v3;
  void *v5;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  SUCoreScanParam *v29;
  SUCoreScanParam *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  uint8_t buf[4];
  SUCoreScan *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  const __CFString *v44;
  uint64_t v45;

  v3 = *(_QWORD *)&a3;
  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "oslog");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    +[SUCoreScan _phaseName:](SUCoreScan, "_phaseName:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v40 = self;
    v41 = 2114;
    v42 = v7;
    _os_log_impl(&dword_1DDFDD000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ DecideNextScanStep: reached phase = %{public}@", buf, 0x16u);

  }
  v8 = CFSTR("CheckForAvailableUpdate");
  v9 = 1;
  switch((int)v3)
  {
    case 0:
      goto LABEL_36;
    case 1:
      if (!-[SUCoreScan _decideAndProcessSplomboScan](self, "_decideAndProcessSplomboScan"))
        goto LABEL_6;
      v9 = 2;
      goto LABEL_36;
    case 2:
LABEL_6:
      if (!-[SUCoreScan _decideAndProcessSlowReleaseScan](self, "_decideAndProcessSlowReleaseScan"))
        goto LABEL_8;
      v9 = 3;
      goto LABEL_36;
    case 3:
LABEL_8:
      if (-[SUCoreScan operationSPIType](self, "operationSPIType") == 1)
      {
        -[SUCoreScan interimScanResult](self, "interimScanResult");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "descriptor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[SUCoreScan interimScanResult](self, "interimScanResult");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "fallbackDescriptor");
        v13 = objc_claimAutoreleasedReturnValue();
LABEL_14:
        v16 = (void *)v13;

        goto LABEL_15;
      }
      if (-[SUCoreScan operationSPIType](self, "operationSPIType") == 2
        || -[SUCoreScan operationSPIType](self, "operationSPIType") == 3)
      {
        -[SUCoreScan interimScanResult](self, "interimScanResult");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "majorPrimaryDescriptor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[SUCoreScan interimScanResult](self, "interimScanResult");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "majorSecondaryDescriptor");
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      v11 = 0;
      v16 = 0;
LABEL_15:
      -[SUCoreScan interimScanResult](self, "interimScanResult");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "error");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = -[SUCoreScan _decideAndProcessPSUSScanForPrimaryDescriptor:secondaryDescriptor:andError:](self, "_decideAndProcessPSUSScanForPrimaryDescriptor:secondaryDescriptor:andError:", v11, v16, v18);
      if (v19)
        v8 = CFSTR("DeterminePSUSAssets");
      else
        v8 = 0;
      if (v19)
        v14 = 3;
      else
        v14 = 4;

LABEL_22:
      if (v14 == 4)
      {
        if (-[SUCoreScan operationSPIType](self, "operationSPIType") == 2
          || -[SUCoreScan operationSPIType](self, "operationSPIType") == 3)
        {
          -[SUCoreScan interimScanResult](self, "interimScanResult");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "minorPrimaryDescriptor");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          -[SUCoreScan interimScanResult](self, "interimScanResult");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "minorSecondaryDescriptor");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v21 = 0;
          v23 = 0;
        }
        -[SUCoreScan interimScanResult](self, "interimScanResult");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "error");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (-[SUCoreScan _decideAndProcessPSUSScanForPrimaryDescriptor:secondaryDescriptor:andError:](self, "_decideAndProcessPSUSScanForPrimaryDescriptor:secondaryDescriptor:andError:", v21, v23, v25))
        {
          v8 = CFSTR("DeterminePSUSAssets");
          v14 = 4;
        }
        else
        {
          v14 = 5;
        }

      }
      if (v14 == 5)
      {
        v8 = CFSTR("ScanComplete");
        v9 = 6;
        goto LABEL_36;
      }
      if (v14 >= 6)
      {
        -[SUCoreScan scanFSM](self, "scanFSM");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "diag");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ invalid phase detected"), self);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SCAN_GET_NEXT_PHASE]"), v28, 8117, 0);

        v9 = 0;
        v8 = 0;
        v29 = 0;
LABEL_37:

        goto LABEL_38;
      }
      v9 = (v14 + 1);
      if (v8)
      {
LABEL_36:
        v30 = [SUCoreScanParam alloc];
        v31 = (void *)MEMORY[0x1E0CB3940];
        +[SUCoreScan _phaseName:](SUCoreScan, "_phaseName:", v3);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        +[SUCoreScan _phaseName:](SUCoreScan, "_phaseName:", v9);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stringWithFormat:", CFSTR("DecideNextScanStep: reached phase = %@, next (reached) phase = %@"), v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[SUCoreScanParam initWithNote:](v30, "initWithNote:", v34);

        -[SUCoreScan scanFSM](self, "scanFSM");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "followupEvent:withInfo:", v8, v29);
        goto LABEL_37;
      }
      v29 = 0;
LABEL_38:
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "oslog");
      v36 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        +[SUCoreScan _phaseName:](SUCoreScan, "_phaseName:", v9);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v40 = self;
        v41 = 2114;
        v42 = v37;
        v43 = 2114;
        v44 = v8;
        _os_log_impl(&dword_1DDFDD000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ DecideNextScanStep: next (reached) phase = %{public}@, next event = %{public}@", buf, 0x20u);

      }
      return v9;
    default:
      v8 = 0;
      v14 = v3;
      goto LABEL_22;
  }
}

- (unint64_t)actionDecideNextScanStep:(id *)a3
{
  void *v4;
  NSObject *v5;

  -[SUCoreScan scanFSM](self, "scanFSM", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extendedStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreScan setPhase:](self, "setPhase:", -[SUCoreScan _getPhaseAndPostEventAfterReachingScanPhase:](self, "_getPhaseAndPostEventAfterReachingScanPhase:", -[SUCoreScan phase](self, "phase")));
  return 0;
}

- (int64_t)actionDownloadDocCatalog:(id *)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[SUCoreScan scanFSM](self, "scanFSM", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extendedStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreScan scanPolicy](self, "scanPolicy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "documentationAssetType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SUCoreScan _downloadCatalog:withIdentifier:](self, "_downloadCatalog:withIdentifier:", v7, CFSTR("doc"));

  return v8;
}

- (int64_t)actionQueryDocMetadata:(id *)a3
{
  void *v4;
  NSObject *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  SUCoreScanParam *v31;
  _QWORD v33[5];
  id v34;
  uint8_t buf[4];
  SUCoreScan *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[SUCoreScan scanFSM](self, "scanFSM", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extendedStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = -[SUCoreScan _decrementMobileAssetPending:](self, "_decrementMobileAssetPending:", CFSTR("DownloadDocCatalog"));
  -[SUCoreScan activeDescriptor](self, "activeDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetAudienceUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SUCoreScan activeDescriptor](self, "activeDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetAudienceUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v36 = self;
      v37 = 2114;
      v38 = v10;
      v13 = "%{public}@ doc metadata query using activeDescriptor assetAudienceUUID as purpose: %{public}@";
LABEL_7:
      _os_log_impl(&dword_1DDFDD000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0x16u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  -[SUCoreScan scanPolicy](self, "scanPolicy");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "assetAudienceUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[SUCoreScan scanPolicy](self, "scanPolicy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "assetAudienceUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "oslog");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v36 = self;
      v37 = 2114;
      v38 = v10;
      v13 = "%{public}@ doc metadata query using scan policy assetAudienceUUID as purpose: %{public}@";
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  v10 = 0;
LABEL_9:
  -[SUCoreScan scanPolicy](self, "scanPolicy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScan activeDescriptor](self, "activeDescriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "documentationID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constructDocumentationMAAssetQueryWithDocID:purpose:", v20, v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreScan _incrementMobileAssetPending:](self, "_incrementMobileAssetPending:", CFSTR("QueryDocMetadata"));
  if (v21)
  {
    -[SUCoreScan _trackScanBegin:withIdentifier:](self, "_trackScanBegin:withIdentifier:", CFSTR("queryMetaDataWithError"), CFSTR("doc"));
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __37__SUCoreScan_actionQueryDocMetadata___block_invoke;
    v33[3] = &unk_1EA878800;
    v33[4] = self;
    v34 = v21;
    objc_msgSend(v34, "SUCoreBorder_queryMetaDataWithError:", v33);

  }
  else
  {
    v22 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCoreScan activeDescriptor](self, "activeDescriptor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "documentationID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan scanPolicy](self, "scanPolicy");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "summary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("failed to construct doc asset query for docID[%@] from policy[%@]"), v24, v26);

    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 8100;
    objc_msgSend(v28, "buildError:underlying:description:", 8100, 0, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreScan scanFSM](self, "scanFSM");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[SUCoreScanParam initWithResult:withError:]([SUCoreScanParam alloc], "initWithResult:withError:", 8100, v29);
    objc_msgSend(v30, "postEvent:withInfo:", CFSTR("QueryMetadataFailed"), v31);

  }
  return v6;
}

void __37__SUCoreScan_actionQueryDocMetadata___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  SUCoreScanParam *v8;
  id v9;

  v9 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_trackScanEnd:withIdentifier:withResult:withError:", CFSTR("queryMetaDataWithError"), CFSTR("doc"), a2);
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "buildError:underlying:description:", 8401, v9, CFSTR("failed to query doc metadata"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "scanFSM");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SUCoreScanParam initWithResult:withError:]([SUCoreScanParam alloc], "initWithResult:withError:", a2, v6);
    objc_msgSend(v7, "postEvent:withInfo:", CFSTR("QueryMetadataFailed"), v8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_filterDocQueryResults:", *(_QWORD *)(a1 + 40));
  }

}

- (int64_t)actionDownloadDocAsset:(id *)a3
{
  void *v4;
  NSObject *v5;
  int64_t v6;
  SUCoreMobileAsset *v7;
  void *v8;
  void *v9;
  void *v10;
  SUCoreMobileAsset *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SUCoreScanParam *v21;
  _QWORD v23[5];

  -[SUCoreScan scanFSM](self, "scanFSM", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extendedStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = -[SUCoreScan _decrementMobileAssetPending:](self, "_decrementMobileAssetPending:", CFSTR("DownloadDocAsset"));
  -[SUCoreScan _incrementMobileAssetPending:](self, "_incrementMobileAssetPending:", CFSTR("DownloadDocAsset"));
  v7 = [SUCoreMobileAsset alloc];
  -[SUCoreScan activeDescriptor](self, "activeDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "documentationAsset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScan scanUUID](self, "scanUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SUCoreMobileAsset initWithDelegate:forAsset:updateUUID:](v7, "initWithDelegate:forAsset:updateUUID:", 0, v9, v10);
  -[SUCoreScan setMaDocumentationControl:](self, "setMaDocumentationControl:", v11);

  -[SUCoreScan maDocumentationControl](self, "maDocumentationControl");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SUCoreScan maDocumentationControl](self, "maDocumentationControl");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan scanPolicy](self, "scanPolicy");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan scanUUID](self, "scanUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan activeDescriptor](self, "activeDescriptor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "productBuildVersion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __37__SUCoreScan_actionDownloadDocAsset___block_invoke;
    v23[3] = &unk_1EA878828;
    v23[4] = self;
    objc_msgSend(v13, "downloadDocumentationAssetWithPolicy:withUUID:stashingDocumentationForBuild:completion:", v14, v15, v17, v23);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 8100;
    objc_msgSend(v18, "buildError:underlying:description:", 8100, 0, CFSTR("failed to allocate MA documentation control"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreScan scanFSM](self, "scanFSM");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[SUCoreScanParam initWithResult:withError:]([SUCoreScanParam alloc], "initWithResult:withError:", 8100, v19);
    objc_msgSend(v20, "postEvent:withInfo:", CFSTR("DocDownloadFailed"), v21);

  }
  return v6;
}

void __37__SUCoreScan_actionDownloadDocAsset___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  SUCoreScanParam *v6;
  void *v7;
  void *v8;
  SUCoreScanParam *v9;
  SUCoreScanParam *v10;
  id v11;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v11 = v3;
  if (v3)
  {
    objc_msgSend(v4, "scanFSM");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SUCoreScanParam initWithResult:withError:]([SUCoreScanParam alloc], "initWithResult:withError:", objc_msgSend(v11, "code"), v11);
    objc_msgSend(v5, "postEvent:withInfo:", CFSTR("DocDownloadFailed"), v6);
  }
  else
  {
    objc_msgSend(v4, "activeDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "documentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "extendDocumentationProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "scanFSM");
    v9 = (SUCoreScanParam *)objc_claimAutoreleasedReturnValue();
    v6 = v9;
    if (v5)
    {
      v10 = -[SUCoreScanParam initWithResult:withError:]([SUCoreScanParam alloc], "initWithResult:withError:", objc_msgSend(v5, "code"), v5);
      -[SUCoreScanParam postEvent:withInfo:](v6, "postEvent:withInfo:", CFSTR("DocDownloadFailed"), v10);

    }
    else
    {
      -[SUCoreScanParam postEvent:](v9, "postEvent:", CFSTR("DocDownloadSuccess"));
    }
  }

}

- (int64_t)actionAlterDocDownloadConfig:(id *)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;

  -[SUCoreScan scanFSM](self, "scanFSM", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extendedStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreScan maDocumentationControl](self, "maDocumentationControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D4E080]);
    -[SUCoreScan scanPolicy](self, "scanPolicy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "documentationDownloadPolicy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDiscretionary:", objc_msgSend(v9, "discretionary"));

    -[SUCoreScan maDocumentationControl](self, "maDocumentationControl");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "alterDownloadOptions:", v7);
    v11 = 0;
  }
  else
  {
    -[SUCoreScan scanFSM](self, "scanFSM");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "diag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ alter documentation download configuration when not downloading"), self);
    v11 = 8116;
    objc_msgSend(v10, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SCAN] ALTER"), v12, 8116, 0);

  }
  return v11;
}

- (int64_t)actionRemoveDocAsset:(id *)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v9;
  _QWORD v10[5];

  -[SUCoreScan scanFSM](self, "scanFSM", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extendedStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreScan _incrementMobileAssetPending:](self, "_incrementMobileAssetPending:", CFSTR("RemoveDocAsset"));
  -[SUCoreScan maDocumentationControl](self, "maDocumentationControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SUCoreScan maDocumentationControl](self, "maDocumentationControl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __35__SUCoreScan_actionRemoveDocAsset___block_invoke;
    v10[3] = &unk_1EA878828;
    v10[4] = self;
    objc_msgSend(v7, "removeAsset:", v10);

    return 0;
  }
  else
  {
    -[SUCoreScan scanFSM](self, "scanFSM");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postEvent:", CFSTR("DocRemoveFailed"));

    return 8116;
  }
}

void __35__SUCoreScan_actionRemoveDocAsset___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  SUCoreScanParam *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "scanFSM");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v4 = -[SUCoreScanParam initWithResult:withError:]([SUCoreScanParam alloc], "initWithResult:withError:", objc_msgSend(v5, "code"), v5);
    objc_msgSend(v3, "postEvent:withInfo:", CFSTR("DocRemoveFailed"), v4);

  }
  else
  {
    objc_msgSend(v3, "postEvent:", CFSTR("DocRemoveSuccess"));
  }

}

- (int64_t)actionScanCompleteNoUpdate:(id *)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  -[SUCoreScan scanFSM](self, "scanFSM", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extendedStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreScan _decrementMobileAssetPending:](self, "_decrementMobileAssetPending:", CFSTR("ScanCompleteNoUpdate"));
  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buildError:underlying:description:", 8406, 0, CFSTR("no update found"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v9) = 1;
  -[SUCoreScan _scanCompleteFoundPrimary:foundSecondary:majorPrimary:majorSecondary:minorPrimary:minorSecondary:clearingOperation:error:](self, "_scanCompleteFoundPrimary:foundSecondary:majorPrimary:majorSecondary:minorPrimary:minorSecondary:clearingOperation:error:", 0, 0, 0, 0, 0, 0, v9, v7);

  return 0;
}

- (int64_t)actionScanSuccess:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  int64_t v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const char *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v51;
  int64_t v52;
  SUCoreScan *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  SUCoreScan *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[SUCoreScan scanFSM](self, "scanFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = -[SUCoreScan _decrementMobileAssetPending:](self, "_decrementMobileAssetPending:", CFSTR("ScanSuccess"));
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v53 = self;
  v52 = v8;
  switch(-[SUCoreScan operation](self, "operation"))
  {
    case 1:
      objc_msgSend(v5, "fallbackDescriptor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "oslog");
      v12 = objc_claimAutoreleasedReturnValue();

      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v10)
      {
        if (v13)
        {
          objc_msgSend(v5, "descriptor");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "summary");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "descriptor");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "overviewWithMaxValueLength:providingSubstitutionMap:", 96, v9);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v60 = self;
          v61 = 2114;
          v62 = v15;
          v63 = 2114;
          v64 = v17;
          _os_log_impl(&dword_1DDFDD000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ found primary descriptor:%{public}@\n%{public}@", buf, 0x20u);

        }
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "oslog");
        v12 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v5, "fallbackDescriptor");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "summary");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "fallbackDescriptor");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "overviewWithMaxValueLength:providingSubstitutionMap:", 96, v9);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v60 = self;
          v61 = 2114;
          v62 = v20;
          v63 = 2114;
          v64 = v22;
          v23 = "%{public}@ with fallback descriptor:%{public}@\n%{public}@";
          goto LABEL_17;
        }
        goto LABEL_22;
      }
      if (!v13)
        goto LABEL_22;
      objc_msgSend(v5, "descriptor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "summary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "descriptor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "overviewWithMaxValueLength:providingSubstitutionMap:", 96, v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v60 = self;
      v61 = 2114;
      v62 = v20;
      v63 = 2114;
      v64 = v22;
      v23 = "%{public}@ found descriptor:%{public}@\n%{public}@";
      goto LABEL_17;
    case 2:
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "oslog");
      v12 = objc_claimAutoreleasedReturnValue();

      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      objc_msgSend(v5, "descriptor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "summary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "descriptor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "overviewWithMaxValueLength:providingSubstitutionMap:", 96, v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v60 = self;
      v61 = 2114;
      v62 = v20;
      v63 = 2114;
      v64 = v22;
      v23 = "%{public}@ verified active descriptor:%{public}@\n%{public}@";
LABEL_17:
      _os_log_impl(&dword_1DDFDD000, v12, OS_LOG_TYPE_DEFAULT, v23, buf, 0x20u);

      goto LABEL_21;
    case 3:
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "oslog");
      v12 = objc_claimAutoreleasedReturnValue();

      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      objc_msgSend(v5, "descriptor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "summary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "descriptor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "documentation");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "summary");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v60 = self;
      v61 = 2114;
      v62 = v20;
      v63 = 2114;
      v64 = v29;
      _os_log_impl(&dword_1DDFDD000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ collected descriptor:%{public}@ doc metadata:%{public}@", buf, 0x20u);

      goto LABEL_21;
    case 4:
      -[SUCoreScan secondaryUpdateAsset](self, "secondaryUpdateAsset");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "oslog");
      v12 = objc_claimAutoreleasedReturnValue();

      v32 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v30)
      {
        if (!v32)
          goto LABEL_22;
        -[SUCoreScan primaryUpdateAsset](self, "primaryUpdateAsset");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "assetId");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreScan secondaryUpdateAsset](self, "secondaryUpdateAsset");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "assetId");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v60 = self;
        v61 = 2114;
        v62 = v33;
        v63 = 2114;
        v64 = v35;
        _os_log_impl(&dword_1DDFDD000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ found primary update asset ID:%{public}@ with secondary update asset ID:%{public}@", buf, 0x20u);

      }
      else
      {
        if (!v32)
          goto LABEL_22;
        -[SUCoreScan primaryUpdateAsset](self, "primaryUpdateAsset");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "assetId");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v60 = self;
        v61 = 2114;
        v62 = v33;
        _os_log_impl(&dword_1DDFDD000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ found update asset ID:%{public}@", buf, 0x16u);
      }

LABEL_21:
LABEL_22:

LABEL_23:
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v36 = v9;
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
      if (v37)
      {
        v38 = v37;
        v39 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v38; ++i)
          {
            if (*(_QWORD *)v55 != v39)
              objc_enumerationMutation(v36);
            v41 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "oslog");
            v43 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v60 = v53;
              v61 = 2114;
              v62 = v41;
              _os_log_impl(&dword_1DDFDD000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
            }

          }
          v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
        }
        while (v38);
      }

      objc_msgSend(v5, "descriptor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fallbackDescriptor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "majorPrimaryDescriptor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "majorSecondaryDescriptor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "minorPrimaryDescriptor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "minorSecondaryDescriptor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v51) = 1;
      -[SUCoreScan _scanCompleteFoundPrimary:foundSecondary:majorPrimary:majorSecondary:minorPrimary:minorSecondary:clearingOperation:error:](v53, "_scanCompleteFoundPrimary:foundSecondary:majorPrimary:majorSecondary:minorPrimary:minorSecondary:clearingOperation:error:", v44, v45, v46, v47, v48, v49, v51, 0);

      return v52;
    default:
      -[SUCoreScan _invalidOperation:](self, "_invalidOperation:", CFSTR("[SCAN] SUCCESS"));
      v52 = 8112;
      goto LABEL_23;
  }
}

- (int64_t)actionScanFailed:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v13;

  v5 = a3;
  -[SUCoreScan scanFSM](self, "scanFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUCoreScan _decrementMobileAssetPending:](self, "_decrementMobileAssetPending:", CFSTR("ScanFailed"));
  objc_msgSend(v5, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = objc_msgSend(v5, "resultCode");
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      v11 = objc_msgSend(v5, "resultCode");
    else
      v11 = 8402;
    objc_msgSend(v10, "buildError:underlying:description:", v11, 0, CFSTR("scan failed"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  LOBYTE(v13) = 1;
  -[SUCoreScan _scanCompleteFoundPrimary:foundSecondary:majorPrimary:majorSecondary:minorPrimary:minorSecondary:clearingOperation:error:](self, "_scanCompleteFoundPrimary:foundSecondary:majorPrimary:majorSecondary:minorPrimary:minorSecondary:clearingOperation:error:", 0, 0, 0, 0, 0, 0, v13, v8);

  return 0;
}

- (int64_t)actionCancelPSUSAssetsDetermination:(id *)a3
{
  void *v4;
  NSObject *v5;
  _QWORD v7[5];

  -[SUCoreScan scanFSM](self, "scanFSM", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extendedStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreScan _incrementMobileAssetPending:](self, "_incrementMobileAssetPending:", CFSTR("CancelPSUSAssetsDetermination"));
  -[SUCoreScan _trackScanBegin:](self, "_trackScanBegin:", CFSTR("stageCancelOperation"));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__SUCoreScan_actionCancelPSUSAssetsDetermination___block_invoke;
  v7[3] = &unk_1EA878828;
  v7[4] = self;
  objc_msgSend(MEMORY[0x1E0D4E060], "SUCoreBorder_stageCancelOperation:", v7);
  return 0;
}

void __50__SUCoreScan_actionCancelPSUSAssetsDetermination___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  const __CFString *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_trackScanEnd:withResult:withError:", CFSTR("stageCancelOperation"), objc_msgSend(v4, "code"), v4);

  objc_msgSend(*(id *)(a1 + 32), "scanFSM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v4)
    v6 = CFSTR("PSUSAssetsDetermineCancelFailed");
  else
    v6 = CFSTR("PSUSAssetsDetermineCancelSuccess");
  objc_msgSend(v5, "postEvent:", v6);

}

- (int64_t)actionCancelSUCatalogDownload:(id *)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  -[SUCoreScan scanFSM](self, "scanFSM", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extendedStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreScan _incrementMobileAssetPending:](self, "_incrementMobileAssetPending:", CFSTR("CancelSUCatalogDownload"));
  -[SUCoreScan _trackScanBegin:withIdentifier:](self, "_trackScanBegin:withIdentifier:", CFSTR("cancelCatalogDownload"), CFSTR("su"));
  v6 = (void *)MEMORY[0x1E0D4E038];
  -[SUCoreScan scanPolicy](self, "scanPolicy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "softwareUpdateAssetType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__SUCoreScan_actionCancelSUCatalogDownload___block_invoke;
  v10[3] = &unk_1EA878850;
  v10[4] = self;
  objc_msgSend(v6, "SUCoreBorder_cancelCatalogDownload:completionWithCancelResult:", v8, v10);

  return 0;
}

void __44__SUCoreScan_actionCancelSUCatalogDownload___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  const __CFString *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_trackScanEnd:withIdentifier:withResult:withError:", CFSTR("cancelCatalogDownload"), CFSTR("su"), a2, 0);
  objc_msgSend(*(id *)(a1 + 32), "scanFSM");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (a2)
    v5 = CFSTR("CatalogDownloadCancelFailed");
  else
    v5 = CFSTR("CatalogDownloadCancelSuccess");
  objc_msgSend(v4, "postEvent:", v5);

}

- (int64_t)actionCancelDocCatalogDownload:(id *)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  -[SUCoreScan scanFSM](self, "scanFSM", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extendedStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreScan _incrementMobileAssetPending:](self, "_incrementMobileAssetPending:", CFSTR("CancelDocCatalogDownload"));
  -[SUCoreScan _trackScanBegin:withIdentifier:](self, "_trackScanBegin:withIdentifier:", CFSTR("cancelCatalogDownload"), CFSTR("doc"));
  v6 = (void *)MEMORY[0x1E0D4E038];
  -[SUCoreScan scanPolicy](self, "scanPolicy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "documentationAssetType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__SUCoreScan_actionCancelDocCatalogDownload___block_invoke;
  v10[3] = &unk_1EA878850;
  v10[4] = self;
  objc_msgSend(v6, "SUCoreBorder_cancelCatalogDownload:completionWithCancelResult:", v8, v10);

  return 0;
}

void __45__SUCoreScan_actionCancelDocCatalogDownload___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  const __CFString *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_trackScanEnd:withIdentifier:withResult:withError:", CFSTR("cancelCatalogDownload"), CFSTR("doc"), a2, 0);
  objc_msgSend(*(id *)(a1 + 32), "scanFSM");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (a2)
    v5 = CFSTR("CatalogDownloadCancelFailed");
  else
    v5 = CFSTR("CatalogDownloadCancelSuccess");
  objc_msgSend(v4, "postEvent:", v5);

}

- (int64_t)actionCancelSuccess:(id *)a3
{
  void *v4;
  NSObject *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;

  -[SUCoreScan scanFSM](self, "scanFSM", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extendedStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = -[SUCoreScan _decrementMobileAssetPending:](self, "_decrementMobileAssetPending:", CFSTR("CancelSuccess"));
  if (-[SUCoreScan cancelingOperation](self, "cancelingOperation"))
  {
    -[SUCoreScan _cancelCompleteWithError:](self, "_cancelCompleteWithError:", 0);
  }
  else
  {
    -[SUCoreScan scanFSM](self, "scanFSM");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "diag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ cancel success when not canceling"), self);
    v6 = 8405;
    objc_msgSend(v8, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SCAN] CANCEL"), v9, 8405, 0);

  }
  return v6;
}

- (int64_t)actionAfterAvailCancelSuccess:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;

  -[SUCoreScan scanFSM](self, "scanFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = -[SUCoreScan _decrementMobileAssetPending:](self, "_decrementMobileAssetPending:", CFSTR("AfterAvailCancelSuccess"));
  if (-[SUCoreScan cancelingOperation](self, "cancelingOperation"))
  {
    -[SUCoreScan _cancelCompleteWithError:](self, "_cancelCompleteWithError:", 0);
  }
  else
  {
    -[SUCoreScan scanFSM](self, "scanFSM");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "diag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ cancel (after update availabvle) when not canceling"), self);
    v7 = 8405;
    objc_msgSend(v9, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SCAN] CANCEL"), v10, 8405, 0);

  }
  return v7;
}

- (int64_t)actionAfterFailCancelSuccess:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;

  -[SUCoreScan scanFSM](self, "scanFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = -[SUCoreScan _decrementMobileAssetPending:](self, "_decrementMobileAssetPending:", CFSTR("AfterFailCancelSuccess"));
  if (-[SUCoreScan cancelingOperation](self, "cancelingOperation"))
  {
    -[SUCoreScan _cancelCompleteWithError:](self, "_cancelCompleteWithError:", 0);
  }
  else
  {
    -[SUCoreScan scanFSM](self, "scanFSM");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "diag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ cancel (after fail) when not canceling"), self);
    v7 = 8405;
    objc_msgSend(v9, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SCAN] CANCEL"), v10, 8405, 0);

  }
  return v7;
}

- (int64_t)actionCancelRemoveFailed:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = a3;
  -[SUCoreScan scanFSM](self, "scanFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = -[SUCoreScan _decrementMobileAssetPending:](self, "_decrementMobileAssetPending:", CFSTR("CancelRemoveFailed"));
  if (-[SUCoreScan cancelingOperation](self, "cancelingOperation"))
  {
    objc_msgSend(v5, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan _cancelCompleteWithError:](self, "_cancelCompleteWithError:", v9);
  }
  else
  {
    -[SUCoreScan scanFSM](self, "scanFSM");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "diag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ cancel (after remove fail) when not canceling"), self);
    v12 = objc_msgSend(v5, "resultCode");
    objc_msgSend(v5, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SCAN] CANCEL"), v11, v12, v13);

    v8 = 8405;
  }

  return v8;
}

- (int64_t)actionCheckCancelDone:(id *)a3
{
  void *v4;
  NSObject *v5;
  int64_t v6;
  void *v7;

  -[SUCoreScan scanFSM](self, "scanFSM", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extendedStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = -[SUCoreScan _decrementMobileAssetPending:](self, "_decrementMobileAssetPending:", CFSTR("CheckCancelDone"));
  if (!-[SUCoreScan pendingMobileAssetRequests](self, "pendingMobileAssetRequests"))
  {
    -[SUCoreScan scanFSM](self, "scanFSM");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "followupEvent:", CFSTR("CancelComplete"));

  }
  return v6;
}

- (int64_t)actionAfterFailCheckCancelDone:(id)a3 error:(id *)a4
{
  void *v5;
  NSObject *v6;
  int64_t v7;
  void *v8;

  -[SUCoreScan scanFSM](self, "scanFSM", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = -[SUCoreScan _decrementMobileAssetPending:](self, "_decrementMobileAssetPending:", CFSTR("AfterFailCheckCancelDone"));
  if (!-[SUCoreScan pendingMobileAssetRequests](self, "pendingMobileAssetRequests"))
  {
    -[SUCoreScan scanFSM](self, "scanFSM");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "followupEvent:", CFSTR("CancelComplete"));

  }
  return v7;
}

- (int64_t)actionCancelDone:(id *)a3
{
  void *v4;
  NSObject *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;

  -[SUCoreScan scanFSM](self, "scanFSM", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extendedStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[SUCoreScan cancelingOperation](self, "cancelingOperation"))
  {
    -[SUCoreScan _cancelCompleteWithError:](self, "_cancelCompleteWithError:", 0);
    return 0;
  }
  else
  {
    -[SUCoreScan scanFSM](self, "scanFSM");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "diag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ cancel done when not canceling"), self);
    v6 = 8405;
    objc_msgSend(v8, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SCAN] CANCEL"), v9, 8405, 0);

  }
  return v6;
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
  -[SUCoreScan scanFSM](self, "scanFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUCoreScan scanFSM](self, "scanFSM");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "diag");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ unknown action(%@)"), self, v5);

  objc_msgSend(v9, "dumpTracked:dumpingTo:usingFilename:clearingStatistics:clearingHistory:", v10, 5, 0, 0, 0);
  return 8102;
}

- (int64_t)a_SimCatalogDownloadSuccess:(id *)a3
{
  void *v4;
  NSObject *v5;
  void *v6;

  -[SUCoreScan scanFSM](self, "scanFSM", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extendedStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreScan scanFSM](self, "scanFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postEvent:", CFSTR("CatalogDownloadSuccess"));

  return 0;
}

- (int64_t)a_SimQueryMetadataUpdateAvailable:(id *)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  SUCoreDescriptor *v9;
  void *v10;
  SUCoreScanParam *v11;

  -[SUCoreScan scanFSM](self, "scanFSM", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "extendedStateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = objc_alloc(MEMORY[0x1E0D4E038]);
  -[SUCoreScan _simDescriptorAttributes](self, "_simDescriptorAttributes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithAttributes:", v7);

  v9 = -[SUCoreDescriptor initWithSUAsset:releaseDate:defaultValues:]([SUCoreDescriptor alloc], "initWithSUAsset:releaseDate:defaultValues:", v8, CFSTR("2018-10-22"), 0);
  -[SUCoreScan scanFSM](self, "scanFSM");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SUCoreScanParam initWithDescriptor:withFallbackDescriptor:]([SUCoreScanParam alloc], "initWithDescriptor:withFallbackDescriptor:", v9, 0);
  objc_msgSend(v10, "postEvent:withInfo:", CFSTR("QueryMetadataUpdateAvailable"), v11);

  return 0;
}

- (SUCoreScan)initWithUUID:(id)a3
{
  return -[SUCoreScan initWithUUID:withCompletionQueue:](self, "initWithUUID:withCompletionQueue:", a3, 0);
}

- (SUCoreScan)initWithUUID:(id)a3 withCompletionQueue:(id)a4
{
  id v7;
  id v8;
  SUCoreScan *v9;
  void *v10;
  uint64_t v11;
  SUCoreFSM *scanFSM;
  void *v13;
  uint64_t v14;
  OS_dispatch_queue *clientCompletionQueue;
  SUCorePolicy *scanPolicy;
  SUCoreDescriptor *activeDescriptor;
  NSString *alternateAssetAudienceUUID;
  SUCoreMobileAsset *maDocumentationControl;
  MAAsset *primaryUpdateAsset;
  MAAsset *secondaryUpdateAsset;
  SUCorePolicy *originalScanPolicy;
  SUCoreScanParam *interimScanResult;
  SUCoreDescriptor *psusPrimaryDescriptor;
  SUCoreDescriptor *psusSecondaryDescriptor;
  id checkCompletion;
  id checkMajorMinorCompletion;
  id checkSlowReleaseCompletion;
  id verifyCompletion;
  id collectCompletion;
  id locateCompletion;
  id cancelCompletion;
  SUCoreScan *v33;
  void *v34;
  SUCoreScan *v35;
  _QWORD v37[4];
  SUCoreScan *v38;
  objc_super v39;

  v7 = a3;
  v8 = a4;
  v39.receiver = self;
  v39.super_class = (Class)SUCoreScan;
  v9 = -[SUCoreScan init](&v39, sel_init);
  if (v9)
  {
    +[SUCoreScan _generateStateTable](SUCoreScan, "_generateStateTable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA8958]), "initMachine:ofInstance:withTable:startingIn:", CFSTR("scan"), v7, v10, CFSTR("Idle"));
    scanFSM = v9->_scanFSM;
    v9->_scanFSM = (SUCoreFSM *)v11;

    if (!v9->_scanFSM)
    {

      v35 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v9->_scanUUID, a3);
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "selectCompletionQueue:", v8);
    v14 = objc_claimAutoreleasedReturnValue();
    clientCompletionQueue = v9->_clientCompletionQueue;
    v9->_clientCompletionQueue = (OS_dispatch_queue *)v14;

    v9->_operation = 0;
    v9->_operationSPIType = 0;
    v9->_cancelingOperation = 0;
    scanPolicy = v9->_scanPolicy;
    v9->_scanPolicy = 0;

    activeDescriptor = v9->_activeDescriptor;
    v9->_activeDescriptor = 0;

    v9->_downloadDocumentation = 0;
    v9->_pendingMobileAssetRequests = 0;
    alternateAssetAudienceUUID = v9->_alternateAssetAudienceUUID;
    v9->_alternateAssetAudienceUUID = 0;

    maDocumentationControl = v9->_maDocumentationControl;
    v9->_maDocumentationControl = 0;

    primaryUpdateAsset = v9->_primaryUpdateAsset;
    v9->_primaryUpdateAsset = 0;

    secondaryUpdateAsset = v9->_secondaryUpdateAsset;
    v9->_secondaryUpdateAsset = 0;

    originalScanPolicy = v9->_originalScanPolicy;
    v9->_originalScanPolicy = 0;

    v9->_phase = 0;
    interimScanResult = v9->_interimScanResult;
    v9->_interimScanResult = 0;

    psusPrimaryDescriptor = v9->_psusPrimaryDescriptor;
    v9->_psusPrimaryDescriptor = 0;

    psusSecondaryDescriptor = v9->_psusSecondaryDescriptor;
    v9->_psusSecondaryDescriptor = 0;

    checkCompletion = v9->_checkCompletion;
    v9->_checkCompletion = 0;

    checkMajorMinorCompletion = v9->_checkMajorMinorCompletion;
    v9->_checkMajorMinorCompletion = 0;

    checkSlowReleaseCompletion = v9->_checkSlowReleaseCompletion;
    v9->_checkSlowReleaseCompletion = 0;

    verifyCompletion = v9->_verifyCompletion;
    v9->_verifyCompletion = 0;

    collectCompletion = v9->_collectCompletion;
    v9->_collectCompletion = 0;

    locateCompletion = v9->_locateCompletion;
    v9->_locateCompletion = 0;

    cancelCompletion = v9->_cancelCompletion;
    v9->_cancelCompletion = 0;

    +[SUCoreMobileAsset mapMobileAssetErrorIndications](SUCoreMobileAsset, "mapMobileAssetErrorIndications");
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __47__SUCoreScan_initWithUUID_withCompletionQueue___block_invoke;
    v37[3] = &unk_1EA8788A0;
    v33 = v9;
    v38 = v33;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v37);
    -[SUCoreScan scanFSM](v33, "scanFSM");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "activateMachine");

  }
  v35 = v9;
LABEL_6:

  return v35;
}

void __47__SUCoreScan_initWithUUID_withCompletionQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__SUCoreScan_initWithUUID_withCompletionQueue___block_invoke_2;
  v7[3] = &unk_1EA878878;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v6 = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __47__SUCoreScan_initWithUUID_withCompletionQueue___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(a3, "safeStringForKey:", *MEMORY[0x1E0DA8990]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("CatalogDownloadFailed")) & 1) != 0
      || (objc_msgSend(v8, "isEqualToString:", CFSTR("QueryMetadataFailed")) & 1) != 0
      || (objc_msgSend(v8, "isEqualToString:", CFSTR("QueryMetadataNoAssetFound")) & 1) != 0
      || (objc_msgSend(v8, "isEqualToString:", CFSTR("QueryMetadataUpdateAvailable")) & 1) != 0
      || (objc_msgSend(v8, "isEqualToString:", CFSTR("DocDownloadFailed")) & 1) != 0
      || (objc_msgSend(v8, "isEqualToString:", CFSTR("DocRemoveFailed")) & 1) != 0
      || (objc_msgSend(v8, "isEqualToString:", CFSTR("PSUSAssetsDetermineFailed")) & 1) != 0
      || (objc_msgSend(v8, "isEqualToString:", CFSTR("CheckForAvailableUpdate")) & 1) != 0
      || (objc_msgSend(v8, "isEqualToString:", CFSTR("DeterminePSUSAssets")) & 1) != 0
      || (objc_msgSend(v8, "isEqualToString:", CFSTR("ScanComplete")) & 1) != 0
      || objc_msgSend(v8, "isEqualToString:", CFSTR("PSUSAssetsDetermineSuccess")))
    {
      v6 = objc_opt_class();
    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "scanFSM");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerAction:ForEvent:inState:usingDelegate:withInfoClass:", v5, v8, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), v6);

  }
}

- (void)checkForAvailableUpdateWithPolicy:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("scan.CheckForAvailableUpdate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScan scanFSM](self, "scanFSM");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "extendedStateQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59__SUCoreScan_checkForAvailableUpdateWithPolicy_completion___block_invoke;
  v14[3] = &unk_1EA8788C8;
  v14[4] = self;
  v15 = v6;
  v16 = v8;
  v17 = v7;
  v11 = v8;
  v12 = v6;
  v13 = v7;
  dispatch_async(v10, v14);

}

void __59__SUCoreScan_checkForAvailableUpdateWithPolicy_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "_trackScanBegin:", CFSTR("checkForAvailableUpdateWithPolicy"));
  if (objc_msgSend(*(id *)(a1 + 32), "operation"))
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "buildError:underlying:description:", 8111, 0, CFSTR("check when already performing scan operation"));
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "scanFSM");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "diag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ already performing scan operation"), *(_QWORD *)(a1 + 32));
    v6 = v4;
    v7 = v5;
    v8 = 8111;
LABEL_5:
    objc_msgSend(v6, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SCAN] CHECK"), v7, v8, v14);

    objc_msgSend(*(id *)(a1 + 32), "_checkEndComplete:scanPolicy:primary:secondary:error:clearingTransaction:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), 0, 0, v14, 0);
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 48), CFSTR("scan.CheckForAvailableUpdate"));
    goto LABEL_6;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "cancelingOperation"))
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "buildError:underlying:description:", 8115, 0, CFSTR("check when canceling"));
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "scanFSM");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "diag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ check when canceling scan operation"), *(_QWORD *)(a1 + 32));
    v6 = v4;
    v7 = v5;
    v8 = 8115;
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "scanCheckTransaction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "scanFSM");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "diag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SCAN] CHECK"), CFSTR("existing transaction found for kSUCoreTransactionCheckForAvailableUpdate"), 8120, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "setScanCheckTransaction:", *(_QWORD *)(a1 + 48));
  v13 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(*(id *)(a1 + 32), "setScanPolicy:", v13);

  objc_msgSend(*(id *)(a1 + 32), "setCheckCompletion:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setOperation:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setOperationSPIType:", 1);
  objc_msgSend(*(id *)(a1 + 32), "scanFSM");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postProtectedEvent:", CFSTR("DecideNextScanStep"));
LABEL_6:

}

- (void)checkForAvailableMajorMinorUpdatesWithPolicy:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("scan.CheckForAvailableUpdate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScan scanFSM](self, "scanFSM");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "extendedStateQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__SUCoreScan_checkForAvailableMajorMinorUpdatesWithPolicy_completion___block_invoke;
  v14[3] = &unk_1EA8788C8;
  v14[4] = self;
  v15 = v6;
  v16 = v8;
  v17 = v7;
  v11 = v8;
  v12 = v6;
  v13 = v7;
  dispatch_async(v10, v14);

}

void __70__SUCoreScan_checkForAvailableMajorMinorUpdatesWithPolicy_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "_trackScanBegin:", CFSTR("checkForAvailableUpdateWithPolicy"));
  if (objc_msgSend(*(id *)(a1 + 32), "operation"))
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "buildError:underlying:description:", 8111, 0, CFSTR("check when already performing scan operation"));
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "scanFSM");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "diag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ already performing scan operation"), *(_QWORD *)(a1 + 32));
    v6 = v4;
    v7 = v5;
    v8 = 8111;
LABEL_5:
    objc_msgSend(v6, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SCAN] CHECK MAJOR_MINOR"), v7, v8, v15);

    LOBYTE(v14) = 0;
    objc_msgSend(*(id *)(a1 + 32), "_checkMajorMinorEndComplete:scanPolicy:majorPrimary:majorSecondary:minorPrimary:minorSecondary:error:clearingTransaction:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), 0, 0, 0, 0, v15, v14);
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 48), CFSTR("scan.CheckForAvailableUpdate"));
    goto LABEL_6;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "cancelingOperation"))
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "buildError:underlying:description:", 8115, 0, CFSTR("check when canceling"));
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "scanFSM");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "diag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ check when canceling scan operation"), *(_QWORD *)(a1 + 32));
    v6 = v4;
    v7 = v5;
    v8 = 8115;
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "scanCheckTransaction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "scanFSM");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "diag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SCAN] CHECK MAJOR_MINOR"), CFSTR("existing transaction found for kSUCoreTransactionCheckForAvailableUpdate"), 8120, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "setScanCheckTransaction:", *(_QWORD *)(a1 + 48));
  v13 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(*(id *)(a1 + 32), "setScanPolicy:", v13);

  objc_msgSend(*(id *)(a1 + 32), "setCheckMajorMinorCompletion:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setOperation:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setOperationSPIType:", 2);
  objc_msgSend(*(id *)(a1 + 32), "scanFSM");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "postProtectedEvent:", CFSTR("DecideNextScanStep"));
LABEL_6:

}

- (void)checkForAvailableSlowReleaseUpdatesWithPolicy:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("scan.CheckForAvailableUpdate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScan scanFSM](self, "scanFSM");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "extendedStateQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__SUCoreScan_checkForAvailableSlowReleaseUpdatesWithPolicy_completion___block_invoke;
  v14[3] = &unk_1EA8788C8;
  v14[4] = self;
  v15 = v6;
  v16 = v8;
  v17 = v7;
  v11 = v8;
  v12 = v6;
  v13 = v7;
  dispatch_async(v10, v14);

}

void __71__SUCoreScan_checkForAvailableSlowReleaseUpdatesWithPolicy_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "_trackScanBegin:", CFSTR("checkForAvailableSlowReleaseUpdatesWithPolicy"));
  if (objc_msgSend(*(id *)(a1 + 32), "operation"))
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "buildError:underlying:description:", 8111, 0, CFSTR("check when already performing scan operation"));
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "scanFSM");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "diag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ already performing scan operation"), *(_QWORD *)(a1 + 32));
    v6 = v4;
    v7 = v5;
    v8 = 8111;
  }
  else
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "cancelingOperation"))
    {
      objc_msgSend(*(id *)(a1 + 32), "setScanCheckTransaction:", *(_QWORD *)(a1 + 48));
      v10 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
      objc_msgSend(*(id *)(a1 + 32), "setScanPolicy:", v10);

      objc_msgSend(*(id *)(a1 + 32), "setCheckSlowReleaseCompletion:", *(_QWORD *)(a1 + 56));
      objc_msgSend(*(id *)(a1 + 32), "setOperation:", 1);
      objc_msgSend(*(id *)(a1 + 32), "setOperationSPIType:", 3);
      objc_msgSend(*(id *)(a1 + 32), "scanFSM");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "postProtectedEvent:", CFSTR("DecideNextScanStep"));
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "buildError:underlying:description:", 8115, 0, CFSTR("check when canceling"));
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "scanFSM");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "diag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ check when canceling scan operation"), *(_QWORD *)(a1 + 32));
    v6 = v4;
    v7 = v5;
    v8 = 8115;
  }
  objc_msgSend(v6, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SCAN] CHECK SLOW_RELEASE"), v7, v8, v12);

  LOBYTE(v11) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_checkSlowReleaseEndComplete:scanPolicy:primary:secondary:alternatePrimary:alternateSecondary:error:clearingTransaction:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), 0, 0, 0, 0, v12, v11);
  objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 48), CFSTR("scan.CheckForAvailableUpdate"));
LABEL_7:

}

- (void)verifyLatestAvailableWithPolicy:(id)a3 descriptor:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("scan.VerifyLatestAvailable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScan scanFSM](self, "scanFSM");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "extendedStateQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__SUCoreScan_verifyLatestAvailableWithPolicy_descriptor_completion___block_invoke;
  block[3] = &unk_1EA8788F0;
  v21 = v11;
  v22 = v10;
  block[4] = self;
  v19 = v8;
  v20 = v9;
  v14 = v11;
  v15 = v9;
  v16 = v8;
  v17 = v10;
  dispatch_async(v13, block);

}

void __68__SUCoreScan_verifyLatestAvailableWithPolicy_descriptor_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "_trackScanBegin:", CFSTR("verifyLatestAvailableWithPolicy"));
  if (objc_msgSend(*(id *)(a1 + 32), "operation"))
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "buildError:underlying:description:", 8111, 0, CFSTR("verify when already performing scan operation"));
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "scanFSM");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "diag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ already performing scan operation"), *(_QWORD *)(a1 + 32));
    v6 = v4;
    v7 = v5;
    v8 = 8111;
LABEL_5:
    objc_msgSend(v6, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SCAN] VERIFY"), v7, v8, v15);

    LOBYTE(v14) = 0;
    objc_msgSend(*(id *)(a1 + 32), "_verifyEndComplete:scanPolicy:active:primary:secondary:error:clearingTransaction:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, 0, v15, v14);
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 56), CFSTR("scan.VerifyLatestAvailable"));
    goto LABEL_6;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "cancelingOperation"))
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "buildError:underlying:description:", 8115, 0, CFSTR("verify when canceling"));
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "scanFSM");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "diag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ verify when canceling scan operation"), *(_QWORD *)(a1 + 32));
    v6 = v4;
    v7 = v5;
    v8 = 8115;
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "scanVerifyTransaction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "scanFSM");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "diag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SCAN] VERIFY"), CFSTR("existing transaction found for kSUCoreTransactionVerifyLatestAvailable"), 8120, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "setScanVerifyTransaction:", *(_QWORD *)(a1 + 56));
  v13 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(*(id *)(a1 + 32), "setScanPolicy:", v13);

  objc_msgSend(*(id *)(a1 + 32), "setActiveDescriptor:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setVerifyCompletion:", *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "setOperation:", 2);
  objc_msgSend(*(id *)(a1 + 32), "setOperationSPIType:", 1);
  objc_msgSend(*(id *)(a1 + 32), "scanFSM");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "postProtectedEvent:", CFSTR("VerifyLatestAvailable"));
LABEL_6:

}

- (void)collectDocumentationMetadataWithPolicy:(id)a3 descriptor:(id)a4 downloadDocumentation:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  id v24;
  BOOL v25;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("scan.CollectDocumentationMetadata"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScan scanFSM](self, "scanFSM");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "extendedStateQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __97__SUCoreScan_collectDocumentationMetadataWithPolicy_descriptor_downloadDocumentation_completion___block_invoke;
  v20[3] = &unk_1EA878918;
  v23 = v13;
  v24 = v12;
  v20[4] = self;
  v21 = v10;
  v22 = v11;
  v25 = a5;
  v16 = v13;
  v17 = v11;
  v18 = v10;
  v19 = v12;
  dispatch_async(v15, v20);

}

void __97__SUCoreScan_collectDocumentationMetadataWithPolicy_descriptor_downloadDocumentation_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "_trackScanBegin:", CFSTR("collectDocumentationMetadataWithPolicy"));
  if (objc_msgSend(*(id *)(a1 + 32), "operation"))
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "buildError:underlying:description:", 8111, 0, CFSTR("collect when already performing scan operation"));
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "scanFSM");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "diag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ already performing scan operation"), *(_QWORD *)(a1 + 32));
    v6 = v4;
    v7 = v5;
    v8 = 8111;
LABEL_5:
    objc_msgSend(v6, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SCAN] COLLECT"), v7, v8, v14);

    objc_msgSend(*(id *)(a1 + 32), "_collectEndComplete:scanPolicy:active:error:clearingTransaction:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v14, 0);
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 56), CFSTR("scan.CollectDocumentationMetadata"));
    goto LABEL_6;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "cancelingOperation"))
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "buildError:underlying:description:", 8115, 0, CFSTR("collect when canceling"));
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "scanFSM");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "diag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ collect when canceling scan operation"), *(_QWORD *)(a1 + 32));
    v6 = v4;
    v7 = v5;
    v8 = 8115;
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "scanCollectTransaction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "scanFSM");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "diag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SCAN] COLLECT"), CFSTR("existing transaction found for kSUCoreTransactionCollectDocumentationMetadata"), 8120, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "setScanCollectTransaction:", *(_QWORD *)(a1 + 56));
  v13 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(*(id *)(a1 + 32), "setScanPolicy:", v13);

  objc_msgSend(*(id *)(a1 + 32), "setActiveDescriptor:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setDownloadDocumentation:", *(unsigned __int8 *)(a1 + 72));
  objc_msgSend(*(id *)(a1 + 32), "setCollectCompletion:", *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "setOperation:", 3);
  objc_msgSend(*(id *)(a1 + 32), "setOperationSPIType:", 1);
  objc_msgSend(*(id *)(a1 + 32), "scanFSM");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postProtectedEvent:", CFSTR("CollectDocMetadata"));
LABEL_6:

}

- (void)locateAvailableUpdateWithPolicy:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("scan.LocateAvailableUpdate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScan scanFSM](self, "scanFSM");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "extendedStateQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__SUCoreScan_locateAvailableUpdateWithPolicy_completion___block_invoke;
  v14[3] = &unk_1EA8788C8;
  v14[4] = self;
  v15 = v6;
  v16 = v8;
  v17 = v7;
  v11 = v8;
  v12 = v6;
  v13 = v7;
  dispatch_async(v10, v14);

}

void __57__SUCoreScan_locateAvailableUpdateWithPolicy_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SUCoreScanParam *v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "_trackScanBegin:", CFSTR("locateAvailableUpdateWithPolicy"));
  if (objc_msgSend(*(id *)(a1 + 32), "operation"))
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "buildError:underlying:description:", 8111, 0, CFSTR("locate when already performing scan operation"));
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "scanFSM");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "diag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ already performing scan operation"), *(_QWORD *)(a1 + 32));
    v6 = v4;
    v7 = v5;
    v8 = 8111;
LABEL_5:
    objc_msgSend(v6, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SCAN] LOCATE"), v7, v8, v15);

    objc_msgSend(*(id *)(a1 + 32), "_locateEndComplete:scanPolicy:primary:secondary:error:clearingTransaction:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), 0, 0, v15, 0);
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 48), CFSTR("scan.LocateAvailableUpdate"));
    goto LABEL_6;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "cancelingOperation"))
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "buildError:underlying:description:", 8115, 0, CFSTR("locate when canceling"));
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "scanFSM");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "diag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ locate when canceling scan operation"), *(_QWORD *)(a1 + 32));
    v6 = v4;
    v7 = v5;
    v8 = 8115;
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "scanLocateTransaction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "scanFSM");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "diag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SCAN] COLLECT"), CFSTR("existing transaction found for kSUCoreTransactionLocateAvailableUpdate"), 8120, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "setScanLocateTransaction:", *(_QWORD *)(a1 + 48));
  v13 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(*(id *)(a1 + 32), "setScanPolicy:", v13);

  objc_msgSend(*(id *)(a1 + 32), "setLocateCompletion:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setOperation:", 4);
  objc_msgSend(*(id *)(a1 + 32), "setOperationSPIType:", 1);
  objc_msgSend(*(id *)(a1 + 32), "scanFSM");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v14 = -[SUCoreScanParam initWithNote:]([SUCoreScanParam alloc], "initWithNote:", CFSTR("API locateAvailableUpdateWithPolicy"));
  objc_msgSend(v15, "postProtectedEvent:withInfo:", CFSTR("CheckForAvailableUpdate"), v14);

LABEL_6:
}

- (void)alterCurrentPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("scan.AlterCurrentPolicy"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScan scanFSM](self, "scanFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SUCoreScan_alterCurrentPolicy___block_invoke;
  block[3] = &unk_1EA878940;
  block[4] = self;
  v11 = v4;
  v12 = v5;
  v8 = v5;
  v9 = v4;
  dispatch_async(v7, block);

}

uint64_t __33__SUCoreScan_alterCurrentPolicy___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "_trackScanBegin:", CFSTR("alterCurrentPolicy"));
  if (objc_msgSend(*(id *)(a1 + 32), "cancelingOperation"))
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "buildError:underlying:description:", 8115, 0, CFSTR("no alterations permitted when canceling scan operation"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "scanFSM");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "diag");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ currently canceling"), *(_QWORD *)(a1 + 32));
    objc_msgSend(v5, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SCAN] ALTER"), v6, 8115, v3);

LABEL_5:
    return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 48), CFSTR("scan.AlterCurrentPolicy"));
  }
  v7 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(*(id *)(a1 + 32), "setScanPolicy:", v7);

  if (objc_msgSend(*(id *)(a1 + 32), "operation") == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "scanFSM");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postProtectedEvent:", CFSTR("AlterCurrentPolicy"));
    goto LABEL_5;
  }
  return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 48), CFSTR("scan.AlterCurrentPolicy"));
}

- (void)cancelCurrentScan:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DA8920], "beginTransactionWithName:", CFSTR("scan.CancelCurrentScan"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScan scanFSM](self, "scanFSM");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extendedStateQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__SUCoreScan_cancelCurrentScan___block_invoke;
  block[3] = &unk_1EA878968;
  v11 = v5;
  v12 = v4;
  block[4] = self;
  v8 = v5;
  v9 = v4;
  dispatch_async(v7, block);

}

void __32__SUCoreScan_cancelCurrentScan___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SUCoreScanParam *v15;
  void *v16;
  uint64_t v17;
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "_trackScanBegin:", CFSTR("cancelCurrentScan"));
  if (objc_msgSend(*(id *)(a1 + 32), "cancelingOperation"))
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "buildError:underlying:description:", 8111, 0, CFSTR("already canceling scan operation"));
    v18 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "scanFSM");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "diag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ already canceling"), *(_QWORD *)(a1 + 32));
    v6 = v4;
    v7 = v5;
    v8 = 8111;
LABEL_9:
    objc_msgSend(v6, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SCAN] CANCEL"), v7, v8, v18);

    objc_msgSend(*(id *)(a1 + 32), "_cancelEndComplete:error:clearingTransaction:", *(_QWORD *)(a1 + 48), v18, 0);
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", *(_QWORD *)(a1 + 40), CFSTR("scan.CancelCurrentScan"));
    goto LABEL_12;
  }
  v9 = objc_msgSend(*(id *)(a1 + 32), "operation");
  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(v10, "buildError:underlying:description:", 8115, 0, CFSTR("cancel when not performing scan operation"));
    v18 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "scanFSM");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "diag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ no scan operation to cancel"), *(_QWORD *)(a1 + 32));
    v6 = v4;
    v7 = v5;
    v8 = 8115;
    goto LABEL_9;
  }
  objc_msgSend(v10, "buildError:underlying:description:", 8403, 0, CFSTR("scan operation canceled"));
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "scanCancelTransaction");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "scanFSM");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "diag");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SCAN] CANCEL"), CFSTR("existing transaction found for kSUCoreTransactionCancelCurrentScan"), 8120, 0);

  }
  objc_msgSend(*(id *)(a1 + 32), "setScanCancelTransaction:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setCancelingOperation:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setCancelCompletion:", *(_QWORD *)(a1 + 48));
  if (objc_msgSend(*(id *)(a1 + 32), "operation") == 1)
  {
    v15 = -[SUCoreScanParam initWithResult:withError:]([SUCoreScanParam alloc], "initWithResult:withError:", 8403, v18);
    objc_msgSend(*(id *)(a1 + 32), "setInterimScanResult:", v15);

    objc_msgSend(*(id *)(a1 + 32), "actionScanComplete:", 0);
  }
  else
  {
    LOBYTE(v17) = 0;
    objc_msgSend(*(id *)(a1 + 32), "_scanCompleteFoundPrimary:foundSecondary:majorPrimary:majorSecondary:minorPrimary:minorSecondary:clearingOperation:error:", 0, 0, 0, 0, 0, 0, v17, v18);
  }
  objc_msgSend(*(id *)(a1 + 32), "scanFSM");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "postProtectedEvent:", CFSTR("CancelCurrentScan"));

LABEL_12:
}

- (void)_updateInterimScanResultForSlowReleaseWithPrimary:(id)a3 secondary:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  SUCoreScanParam *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  const __CFString *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  SUCoreScanParam *v30;
  unint64_t v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  uint64_t v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  id v52;
  SUCoreScanParam *v53;
  SUCoreScanParam *v54;
  SUCoreScanParam *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  NSObject *v62;
  SUCoreScanParam *v63;
  id v64;
  SUCoreScanParam *v65;
  void *v66;
  NSObject *v67;
  SUCoreScanParam *v68;
  int v69;
  const __CFString *v70;
  SUCoreScanParam *v71;
  void *v72;
  id v73;
  int v74;
  SUCoreScanParam *v75;
  void *v76;
  NSObject *v77;
  id v78;
  SUCoreScanParam *v79;
  void *v80;
  NSObject *v81;
  _BOOL4 v82;
  void *v83;
  void *v84;
  NSObject *v85;
  void *v86;
  NSObject *v87;
  void *v88;
  NSObject *v89;
  SUCoreScanParam *v90;
  uint64_t v91;
  id v92;
  id v93;
  id v94;
  void *v95;
  id v96;
  void *v97;
  SUCoreScanParam *v98;
  void *v99;
  SUCoreScanParam *v100;
  SUCoreScanParam *v101;
  id v102;
  SUCoreScan *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  uint8_t v108[128];
  uint8_t buf[4];
  SUCoreScan *v110;
  __int16 v111;
  id v112;
  __int16 v113;
  uint64_t v114;
  __int16 v115;
  const __CFString *v116;
  __int16 v117;
  void *v118;
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[SUCoreScan operationSPIType](self, "operationSPIType") != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ invalid operationSPIType (%d) found"), self, -[SUCoreScan operationSPIType](self, "operationSPIType"));
LABEL_23:
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan _trackInconsistentAnomalyAndUpdateInterimResult:reason:](self, "_trackInconsistentAnomalyAndUpdateInterimResult:reason:", CFSTR("[SCAN] UPDATE_INTERIM_SLOWROLL"), v34);

    goto LABEL_109;
  }
  -[SUCoreScan interimScanResult](self, "interimScanResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ unexpected no previous scan result for slow release scan"), self, v91);
    goto LABEL_23;
  }
  v12 = v10;
  -[SUCoreScan interimScanResult](self, "interimScanResult");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "majorPrimaryDescriptor");
  v14 = (SUCoreScanParam *)objc_claimAutoreleasedReturnValue();

  -[SUCoreScan interimScanResult](self, "interimScanResult");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "majorSecondaryDescriptor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v100 = (SUCoreScanParam *)v8;
  v102 = v9;
  if (v100 && !v14)
    goto LABEL_8;
  v17 = 1;
  v18 = 2;
  if (v100 && v14)
  {
    if (-[SUCoreScanParam promoteAlternateUpdate](v14, "promoteAlternateUpdate"))
    {
LABEL_8:
      v17 = 2;
      v18 = 1;
      goto LABEL_9;
    }
    v17 = 1;
    v18 = 2;
  }
LABEL_9:
  v98 = v14;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "oslog");
  v20 = objc_claimAutoreleasedReturnValue();

  v97 = v12;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v96 = v8;
    v21 = CFSTR("YES");
    v93 = v10;
    if (v98)
      v22 = CFSTR("YES");
    else
      v22 = CFSTR("NO");
    +[SUCoreDescriptor nameForDescriptorPreferredUpdateType:](SUCoreDescriptor, "nameForDescriptorPreferredUpdateType:", v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v100)
      v21 = CFSTR("NO");
    +[SUCoreDescriptor nameForDescriptorPreferredUpdateType:](SUCoreDescriptor, "nameForDescriptorPreferredUpdateType:", v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v110 = self;
    v111 = 2112;
    v112 = (id)v22;
    v10 = v93;
    v113 = 2114;
    v114 = (uint64_t)v23;
    v115 = 2112;
    v116 = v21;
    v8 = v96;
    v117 = 2114;
    v118 = v24;
    _os_log_impl(&dword_1DDFDD000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ [DUAL_AUDIENCE] assigning to descriptors (Default) promotedPrimary=%@ primaryPreferredType=%{public}@ and (Alternate) promotedAlternatePrimary=%@ alternatePreferredType=%{public}@", buf, 0x34u);

    v12 = v97;
  }

  -[SUCoreScanParam assignDescriptorAudienceType:descriptorPreferredUpdateType:assetAudienceUUID:](v98, "assignDescriptorAudienceType:descriptorPreferredUpdateType:assetAudienceUUID:", 1, v18, 0);
  objc_msgSend(v16, "assignDescriptorAudienceType:descriptorPreferredUpdateType:assetAudienceUUID:", 1, v18, 0);
  -[SUCoreScan alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScanParam assignDescriptorAudienceType:descriptorPreferredUpdateType:assetAudienceUUID:](v100, "assignDescriptorAudienceType:descriptorPreferredUpdateType:assetAudienceUUID:", 2, v17, v25);

  -[SUCoreScan alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "assignDescriptorAudienceType:descriptorPreferredUpdateType:assetAudienceUUID:", 2, v17, v26);

  objc_msgSend(v12, "domain");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0DA8AD8]))
  {
    v99 = v12;
    v30 = v100;
    v31 = 0x1E0DA8000;
LABEL_25:

    goto LABEL_27;
  }
  v28 = objc_msgSend(v12, "code");

  v29 = v12;
  v30 = v100;
  v31 = 0x1E0DA8000uLL;
  if (v28 == 8406)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "oslog");
    v33 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[SUCoreScan _updateInterimScanResultForSlowReleaseWithPrimary:secondary:error:].cold.1();

    v30 = 0;
    v99 = 0;
    v27 = v102;
    v102 = 0;
    goto LABEL_25;
  }
  v99 = v29;
LABEL_27:
  -[SUCoreScan scanPolicy](self, "scanPolicy");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "isSupervisedPolicy");

  if (v36)
  {
    v92 = v9;
    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    v103 = self;
    -[SUCoreScan scanPolicy](self, "scanPolicy");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "policyExtensions");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v104, v108, 16);
    if (v39)
    {
      v40 = v39;
      v101 = v30;
      v94 = v10;
      v95 = v16;
      v41 = 0;
      v42 = 0;
      v43 = *(_QWORD *)v105;
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v105 != v43)
            objc_enumerationMutation(v38);
          v45 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v45, "requestedPMV");
            v46 = objc_claimAutoreleasedReturnValue();

            v42 = objc_msgSend(v45, "mdmSoftwareUpdatePath");
            objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "oslog");
            v48 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              +[SUCorePolicyExtensionManagedUpdates nameForMDMSoftwareUpdatePath:](SUCorePolicyExtensionManagedUpdates, "nameForMDMSoftwareUpdatePath:", v42);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v110 = v103;
              v111 = 2112;
              v112 = v49;
              v113 = 2048;
              v114 = v42;
              _os_log_impl(&dword_1DDFDD000, v48, OS_LOG_TYPE_DEFAULT, "%{public}@ [DUAL_AUDIENCE] Found SUCorePolicyExtensionManagedUpdates with mdmSoftwareUpdatePath: %@ (%ld)", buf, 0x20u);

            }
            v41 = (void *)v46;
          }
        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v104, v108, 16);
      }
      while (v40);

      if (v98)
      {
        v53 = v101;
        v38 = v102;
        v101 = v98;
        v16 = v95;
        v9 = v92;
      }
      else
      {
        v16 = v95;
        v9 = v92;
        if (v101 && v41)
        {
          objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "oslog");
          v51 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v110 = v103;
            _os_log_impl(&dword_1DDFDD000, v51, OS_LOG_TYPE_DEFAULT, "%{public}@ [DUAL_AUDIENCE] MDM scan performed using a requested PMV with no primary update found, using alternate update instead", buf, 0xCu);
          }

          v52 = v102;
          v38 = 0;
          v53 = 0;
          v16 = v52;
        }
        else
        {
          v53 = v101;
          v38 = v102;
          v101 = 0;
        }
      }
      if (v42 == 1)
      {
        v55 = v101;
        if (!-[SUCoreScanParam enableAlternateAssetAudience](v101, "enableAlternateAssetAudience") || v41)
        {
          v58 = v41;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "oslog");
          v57 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v110 = v103;
            _os_log_impl(&dword_1DDFDD000, v57, OS_LOG_TYPE_DEFAULT, "%{public}@ [DUAL_AUDIENCE] MDM software update path indicates SUCoreMDMSoftwareUpdatePathSlow and primary update found with dual audiences enabled, dropping primary update", buf, 0xCu);
          }

          v58 = 0;
          v16 = 0;
          v55 = 0;
        }
        if (!v41 && v53)
        {
          objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "oslog");
          v62 = objc_claimAutoreleasedReturnValue();

          v10 = v94;
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v110 = v103;
            _os_log_impl(&dword_1DDFDD000, v62, OS_LOG_TYPE_DEFAULT, "%{public}@ [DUAL_AUDIENCE] MDM software update path indicates SUCoreMDMSoftwareUpdatePathSlow and alternate update found, using alternate update only", buf, 0xCu);
          }

          v63 = v53;
          v64 = v38;

          v38 = 0;
          v16 = v64;
          goto LABEL_77;
        }
        goto LABEL_72;
      }
      if (v41 || v42 != 2)
      {
        v58 = v41;
        v10 = v94;
        v55 = v101;
        goto LABEL_73;
      }
      v55 = v101;
      if (!v53)
      {
        v58 = 0;
LABEL_72:
        v10 = v94;
LABEL_73:
        if (v99 || v53 || v55)
        {
LABEL_78:
          v54 = v55;

          v102 = v38;
          v30 = v53;
          self = v103;
          v31 = 0x1E0DA8000uLL;
          if (v53)
            goto LABEL_79;
LABEL_87:
          v74 = -[SUCoreScanParam promoteAlternateUpdate](v54, "promoteAlternateUpdate");
          if (v30 && v74)
          {
            v75 = v54;
            objc_msgSend(*(id *)(v31 + 2400), "sharedLogger");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "oslog");
            v77 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v110 = self;
              _os_log_impl(&dword_1DDFDD000, v77, OS_LOG_TYPE_DEFAULT, "%{public}@ [DUAL_AUDIENCE] Primary descriptor indicates alternate updates should be promoted, swapping now", buf, 0xCu);
            }

            v54 = v30;
            v30 = v75;

            v78 = v102;
            v102 = v16;
            v16 = v78;
          }
          v79 = v54;
          goto LABEL_95;
        }
        objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
        v64 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "buildError:underlying:description:", 8406, v97, CFSTR("Supervised device MDM restrictions resulted in no update found"));
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = 0;
LABEL_77:

        v53 = 0;
        v55 = v63;
        goto LABEL_78;
      }
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "oslog");
      v60 = objc_claimAutoreleasedReturnValue();

      v10 = v94;
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v110 = v103;
        _os_log_impl(&dword_1DDFDD000, v60, OS_LOG_TYPE_DEFAULT, "%{public}@ [DUAL_AUDIENCE] MDM software update path indicates SUCoreMDMSoftwareUpdatePathFast and alternate update found, dropping alternate update", buf, 0xCu);
      }

      v102 = 0;
      v53 = 0;
    }
    else
    {
      v53 = v30;
      v55 = v98;
    }

    v58 = 0;
    v38 = v102;
    goto LABEL_73;
  }
  v54 = v98;
  if (!v30)
    goto LABEL_87;
LABEL_79:
  if (!v54 || !-[SUCoreScanParam isEqual:](v54, "isEqual:", v30))
    goto LABEL_87;
  objc_msgSend(*(id *)(v31 + 2400), "sharedLogger");
  v65 = v54;
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "oslog");
  v67 = objc_claimAutoreleasedReturnValue();

  v68 = v65;
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
  {
    v69 = -[SUCoreScanParam promoteAlternateUpdate](v65, "promoteAlternateUpdate");
    v70 = CFSTR("NO");
    if (v69)
      v70 = CFSTR("YES");
    *(_DWORD *)buf = 138543618;
    v110 = self;
    v111 = 2114;
    v112 = (id)v70;
    _os_log_impl(&dword_1DDFDD000, v67, OS_LOG_TYPE_DEFAULT, "%{public}@ [DUAL_AUDIENCE] Primary update and alternate update descriptors are equal, not returning alternate update (promoteAlternateUpdate=%{public}@)", buf, 0x16u);
  }

  if (-[SUCoreScanParam promoteAlternateUpdate](v65, "promoteAlternateUpdate"))
  {
    v71 = v30;

    v72 = v102;
    v73 = v102;

    v16 = v73;
    v68 = v71;
  }
  else
  {
    v72 = v102;
  }

  v79 = v68;
  -[SUCoreScanParam promoteAlternateUpdate](v68, "promoteAlternateUpdate");
  v102 = 0;
  v30 = 0;
LABEL_95:
  objc_msgSend(*(id *)(v31 + 2400), "sharedLogger");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "oslog");
  v81 = objc_claimAutoreleasedReturnValue();

  v82 = os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT);
  if (v99)
  {
    if (v82)
    {
      *(_DWORD *)buf = 138543362;
      v110 = self;
      _os_log_impl(&dword_1DDFDD000, v81, OS_LOG_TYPE_DEFAULT, "%{public}@ [DUAL_AUDIENCE] An error was found while processing the scan for dual audience updates, not returning any updates", buf, 0xCu);
    }

    v83 = v99;
    v79 = -[SUCoreScanParam initWithResult:withError:]([SUCoreScanParam alloc], "initWithResult:withError:", objc_msgSend(v99, "code"), v99);
    -[SUCoreScan setInterimScanResult:](self, "setInterimScanResult:", v79);
  }
  else
  {
    if (v82)
    {
      *(_DWORD *)buf = 138543618;
      v110 = self;
      v111 = 2114;
      v112 = v79;
      _os_log_impl(&dword_1DDFDD000, v81, OS_LOG_TYPE_DEFAULT, "%{public}@ [DUAL_AUDIENCE] promoted primary update: %{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(v31 + 2400), "sharedLogger");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "oslog");
    v85 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v110 = self;
      v111 = 2114;
      v112 = v16;
      _os_log_impl(&dword_1DDFDD000, v85, OS_LOG_TYPE_DEFAULT, "%{public}@ [DUAL_AUDIENCE] promoted secondary update: %{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(v31 + 2400), "sharedLogger");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "oslog");
    v87 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v110 = self;
      v111 = 2114;
      v112 = v30;
      _os_log_impl(&dword_1DDFDD000, v87, OS_LOG_TYPE_DEFAULT, "%{public}@ [DUAL_AUDIENCE] promoted alternate primary update: %{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(v31 + 2400), "sharedLogger");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "oslog");
    v89 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v110 = self;
      v111 = 2114;
      v112 = v102;
      _os_log_impl(&dword_1DDFDD000, v89, OS_LOG_TYPE_DEFAULT, "%{public}@ [DUAL_AUDIENCE] promoted alternate secondary update: %{public}@", buf, 0x16u);
    }

    v90 = -[SUCoreScanParam initWithMajorPrimaryDescriptor:majorSecondaryDescriptor:minorPrimaryDescriptor:minorSecondaryDescriptor:]([SUCoreScanParam alloc], "initWithMajorPrimaryDescriptor:majorSecondaryDescriptor:minorPrimaryDescriptor:minorSecondaryDescriptor:", v79, v16, v30, v102);
    -[SUCoreScan setInterimScanResult:](self, "setInterimScanResult:", v90);

    v83 = 0;
  }

LABEL_109:
}

- (void)_updateInterimScanResultForSplomboWithPrimary:(id)a3 secondary:(id)a4 majorPrimary:(id)a5 majorSecondary:(id)a6 minorPrimary:(id)a7 minorSecondary:(id)a8 error:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  SUCoreScanParam *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  SUCoreScanParam *v45;
  void *v46;
  SUCoreScanParam *v47;
  void *v48;
  id v49;
  id v50;
  uint8_t buf[4];
  SUCoreScan *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  -[SUCoreScan interimScanResult](self, "interimScanResult");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ unexpected no previous scan result for Splombo scan"), self);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan _trackInconsistentAnomalyAndUpdateInterimResult:reason:](self, "_trackInconsistentAnomalyAndUpdateInterimResult:reason:", CFSTR("[SCAN] UPDATE_INTERIM_SPLOMBO"), v26);

    goto LABEL_18;
  }
  if (!v21)
  {
    if (-[SUCoreScan operationSPIType](self, "operationSPIType") == 1)
    {
      -[SUCoreScan interimScanResult](self, "interimScanResult");
      v49 = v20;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "descriptor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      -[SUCoreScan interimScanResult](self, "interimScanResult");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "fallbackDescriptor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = v49;
      objc_msgSend(v28, "setAssociatedSplatDescriptor:", v15);
      objc_msgSend(v30, "setAssociatedSplatDescriptor:", v15);
      v31 = -[SUCoreScanParam initWithDescriptor:withFallbackDescriptor:]([SUCoreScanParam alloc], "initWithDescriptor:withFallbackDescriptor:", v28, v30);
      -[SUCoreScan setInterimScanResult:](self, "setInterimScanResult:", v31);

      v16 = v30;
    }
    else
    {
      if (-[SUCoreScan operationSPIType](self, "operationSPIType") == 2)
      {
        v15 = v15;
        -[SUCoreScan interimScanResult](self, "interimScanResult");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "majorPrimaryDescriptor");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        -[SUCoreScan interimScanResult](self, "interimScanResult");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "majorSecondaryDescriptor");
        v35 = objc_claimAutoreleasedReturnValue();

        -[SUCoreScan interimScanResult](self, "interimScanResult");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "minorPrimaryDescriptor");
        v37 = v20;
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        -[SUCoreScan interimScanResult](self, "interimScanResult");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "minorSecondaryDescriptor");
        v40 = objc_claimAutoreleasedReturnValue();

        if (v33)
        {
          objc_msgSend(v33, "setAssociatedSplatDescriptor:", v15);
          v41 = (void *)v35;
        }
        else
        {
          objc_msgSend(v38, "setAssociatedSplatDescriptor:", v15);
          v41 = (void *)v40;
        }
        objc_msgSend(v41, "setAssociatedSplatDescriptor:", v15);

        v47 = -[SUCoreScanParam initWithMajorPrimaryDescriptor:majorSecondaryDescriptor:minorPrimaryDescriptor:minorSecondaryDescriptor:]([SUCoreScanParam alloc], "initWithMajorPrimaryDescriptor:majorSecondaryDescriptor:minorPrimaryDescriptor:minorSecondaryDescriptor:", v33, v35, v38, v40);
        -[SUCoreScan setInterimScanResult:](self, "setInterimScanResult:", v47);

        v18 = (id)v35;
        v19 = v38;
        v20 = (id)v40;
        v17 = v33;
        goto LABEL_18;
      }
      if (-[SUCoreScan operationSPIType](self, "operationSPIType") != 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ unknown operationSPIType (%d) found"), self, -[SUCoreScan operationSPIType](self, "operationSPIType"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreScan _trackInconsistentAnomalyAndUpdateInterimResult:reason:](self, "_trackInconsistentAnomalyAndUpdateInterimResult:reason:", CFSTR("[SCAN] UPDATE_INTERIM_SPLOMBO"), v46);

        goto LABEL_18;
      }
      -[SUCoreScan interimScanResult](self, "interimScanResult");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "majorPrimaryDescriptor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      -[SUCoreScan interimScanResult](self, "interimScanResult");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "majorSecondaryDescriptor");
      v50 = v20;
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v28, "setAssociatedSplatDescriptor:", v15);
      objc_msgSend(v44, "setAssociatedSplatDescriptor:", v15);
      v45 = -[SUCoreScanParam initWithMajorPrimaryDescriptor:majorSecondaryDescriptor:minorPrimaryDescriptor:minorSecondaryDescriptor:]([SUCoreScanParam alloc], "initWithMajorPrimaryDescriptor:majorSecondaryDescriptor:minorPrimaryDescriptor:minorSecondaryDescriptor:", v28, v44, 0, 0);
      -[SUCoreScan setInterimScanResult:](self, "setInterimScanResult:", v45);

      v16 = v44;
      v20 = v50;
    }
    v15 = v28;
    goto LABEL_18;
  }
  v23 = v20;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "oslog");
  v25 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v52 = self;
    v53 = 2114;
    v54 = v21;
    _os_log_impl(&dword_1DDFDD000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ [SPLOMBO] splombo scan failed with %{public}@, but this is non-fatal", buf, 0x16u);
  }

  v20 = v23;
LABEL_18:
  -[SUCoreScan originalScanPolicy](self, "originalScanPolicy");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScan setScanPolicy:](self, "setScanPolicy:", v48);

  -[SUCoreScan setOriginalScanPolicy:](self, "setOriginalScanPolicy:", 0);
}

- (void)_updateInterimScanResultWithPrimary:(id)a3 secondary:(id)a4 majorPrimary:(id)a5 majorSecondary:(id)a6 minorPrimary:(id)a7 minorSecondary:(id)a8 error:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  SUCoreScanParam *v21;
  void *v22;
  SUCoreScanParam *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;

  v29 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  if (-[SUCoreScan operation](self, "operation") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown operation (%d) found"), -[SUCoreScan operation](self, "operation"), v28);
    goto LABEL_6;
  }
  if (-[SUCoreScan phase](self, "phase") == 1)
  {
    if (v20)
    {
      v21 = -[SUCoreScanParam initWithResult:withError:]([SUCoreScanParam alloc], "initWithResult:withError:", objc_msgSend(v20, "code"), v20);
LABEL_19:
      v22 = v21;
      -[SUCoreScan setInterimScanResult:](self, "setInterimScanResult:", v21);
      goto LABEL_20;
    }
    if (-[SUCoreScan operationSPIType](self, "operationSPIType") == 1)
    {
      v21 = -[SUCoreScanParam initWithDescriptor:withFallbackDescriptor:]([SUCoreScanParam alloc], "initWithDescriptor:withFallbackDescriptor:", v29, v15);
      goto LABEL_19;
    }
    if (-[SUCoreScan operationSPIType](self, "operationSPIType") == 2)
    {
      v23 = [SUCoreScanParam alloc];
      v24 = v16;
      v25 = v17;
      v26 = v18;
      v27 = v19;
LABEL_18:
      v21 = -[SUCoreScanParam initWithMajorPrimaryDescriptor:majorSecondaryDescriptor:minorPrimaryDescriptor:minorSecondaryDescriptor:](v23, "initWithMajorPrimaryDescriptor:majorSecondaryDescriptor:minorPrimaryDescriptor:minorSecondaryDescriptor:", v24, v25, v26, v27);
      goto LABEL_19;
    }
    if (-[SUCoreScan operationSPIType](self, "operationSPIType") == 3)
    {
      objc_msgSend(v29, "assignDescriptorAudienceType:descriptorPreferredUpdateType:assetAudienceUUID:", 1, 2, 0);
      objc_msgSend(v15, "assignDescriptorAudienceType:descriptorPreferredUpdateType:assetAudienceUUID:", 1, 2, 0);
      v23 = [SUCoreScanParam alloc];
      v24 = v29;
      v25 = v15;
      v26 = 0;
      v27 = 0;
      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ unknown operationSPIType (%d) found"), self, -[SUCoreScan operationSPIType](self, "operationSPIType"));
LABEL_6:
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan _trackInconsistentAnomalyAndUpdateInterimResult:reason:](self, "_trackInconsistentAnomalyAndUpdateInterimResult:reason:", CFSTR("[SCAN] UPDATE_INTERIM"), v22);
LABEL_20:

    goto LABEL_21;
  }
  if (-[SUCoreScan phase](self, "phase") == 2)
  {
    -[SUCoreScan _updateInterimScanResultForSplomboWithPrimary:secondary:majorPrimary:majorSecondary:minorPrimary:minorSecondary:error:](self, "_updateInterimScanResultForSplomboWithPrimary:secondary:majorPrimary:majorSecondary:minorPrimary:minorSecondary:error:", v29, v15, v16, v17, v18, v19, v20);
  }
  else
  {
    if (-[SUCoreScan phase](self, "phase") != 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ invalid phase (%d) found"), self, -[SUCoreScan phase](self, "phase"));
      goto LABEL_6;
    }
    -[SUCoreScan _updateInterimScanResultForSlowReleaseWithPrimary:secondary:error:](self, "_updateInterimScanResultForSlowReleaseWithPrimary:secondary:error:", v29, v15, v20);
  }
LABEL_21:

}

- (void)_trackInconsistentAnomalyAndUpdateInterimResult:(id)a3 reason:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  SUCoreScanParam *v12;
  id v13;

  v6 = (void *)MEMORY[0x1E0DA8920];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "sharedCore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "buildError:underlying:description:", 8117, 0, v7);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[SUCoreScan scanFSM](self, "scanFSM");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "diag");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trackAnomaly:forReason:withResult:withError:", v8, v7, objc_msgSend(v13, "code"), v13);

  v12 = -[SUCoreScanParam initWithResult:withError:]([SUCoreScanParam alloc], "initWithResult:withError:", objc_msgSend(v13, "code"), v13);
  -[SUCoreScan setInterimScanResult:](self, "setInterimScanResult:", v12);

}

- (void)_scanCompleteFoundPrimary:(id)a3 foundSecondary:(id)a4 majorPrimary:(id)a5 majorSecondary:(id)a6 minorPrimary:(id)a7 minorSecondary:(id)a8 clearingOperation:(BOOL)a9 error:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  id v42;

  v42 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a10;
  -[SUCoreScan scanFSM](self, "scanFSM");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "extendedStateQueue");
  v23 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v23);

  -[SUCoreScan scanPolicy](self, "scanPolicy");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScan activeDescriptor](self, "activeDescriptor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  switch(-[SUCoreScan operation](self, "operation"))
  {
    case 1:
      -[SUCoreScan _updateInterimScanResultWithPrimary:secondary:majorPrimary:majorSecondary:minorPrimary:minorSecondary:error:](self, "_updateInterimScanResultWithPrimary:secondary:majorPrimary:majorSecondary:minorPrimary:minorSecondary:error:", v42, v16, v17, v18, v19, v20, v21);
      -[SUCoreScan scanFSM](self, "scanFSM");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "followupEvent:", CFSTR("DecideNextScanStep"));

      if (a9)
        goto LABEL_13;
      break;
    case 2:
      v40 = v18;
      v27 = v17;
      -[SUCoreScan verifyCompletion](self, "verifyCompletion");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreScan setVerifyCompletion:](self, "setVerifyCompletion:", 0);
      v29 = v21;
      if (!v29 && ((objc_msgSend(v25, "isEqual:", v42) & 1) != 0 || objc_msgSend(v25, "isEqual:", v16)))
      {

        v16 = 0;
        v42 = 0;
      }
      LOBYTE(v38) = 1;
      -[SUCoreScan _verifyEndComplete:scanPolicy:active:primary:secondary:error:clearingTransaction:](self, "_verifyEndComplete:scanPolicy:active:primary:secondary:error:clearingTransaction:", v28, v24, v25, v42, v16, v29, v38);

      v17 = v27;
      v18 = v40;
      goto LABEL_12;
    case 3:
      -[SUCoreScan collectCompletion](self, "collectCompletion");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreScan setCollectCompletion:](self, "setCollectCompletion:", 0);
      -[SUCoreScan _collectEndComplete:scanPolicy:active:error:clearingTransaction:](self, "_collectEndComplete:scanPolicy:active:error:clearingTransaction:", v30, v24, v25, v21, 1);

      goto LABEL_12;
    case 4:
      -[SUCoreScan primaryUpdateAsset](self, "primaryUpdateAsset");
      v41 = v21;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreScan secondaryUpdateAsset](self, "secondaryUpdateAsset");
      v39 = v17;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreScan setPrimaryUpdateAsset:](self, "setPrimaryUpdateAsset:", 0);
      -[SUCoreScan setSecondaryUpdateAsset:](self, "setSecondaryUpdateAsset:", 0);
      -[SUCoreScan locateCompletion](self, "locateCompletion");
      v33 = v16;
      v34 = v20;
      v35 = v19;
      v36 = v18;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreScan setLocateCompletion:](self, "setLocateCompletion:", 0);
      -[SUCoreScan _locateEndComplete:scanPolicy:primary:secondary:error:clearingTransaction:](self, "_locateEndComplete:scanPolicy:primary:secondary:error:clearingTransaction:", v37, v24, v31, v32, v41, 1);

      v18 = v36;
      v19 = v35;
      v20 = v34;
      v16 = v33;

      v17 = v39;
      v21 = v41;
LABEL_12:
      if (a9)
      {
LABEL_13:
        if (-[SUCoreScan operation](self, "operation") != 1)
          -[SUCoreScan _clearCurrentOperation](self, "_clearCurrentOperation");
      }
      break;
    default:
      -[SUCoreScan _invalidOperation:](self, "_invalidOperation:", CFSTR("[SCAN] COMPLETION"));
      break;
  }

}

- (void)_cancelCompleteWithError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;

  v4 = a3;
  -[SUCoreScan scanFSM](self, "scanFSM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreScan cancelCompletion](self, "cancelCompletion");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SUCoreScan setCancelCompletion:](self, "setCancelCompletion:", 0);
  -[SUCoreScan _cancelEndComplete:error:clearingTransaction:](self, "_cancelEndComplete:error:clearingTransaction:", v7, v4, 1);

  -[SUCoreScan _clearCurrentOperation](self, "_clearCurrentOperation");
}

- (void)_checkEndComplete:(id)a3 scanPolicy:(id)a4 primary:(id)a5 secondary:(id)a6 error:(id)a7 clearingTransaction:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v8 = a8;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  -[SUCoreScan scanFSM](self, "scanFSM");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "extendedStateQueue");
  v20 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v20);

  if (v8)
  {
    -[SUCoreScan scanCheckTransaction](self, "scanCheckTransaction");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan setScanCheckTransaction:](self, "setScanCheckTransaction:", 0);
  }
  else
  {
    v21 = 0;
  }
  v22 = (void *)MEMORY[0x1DF0E6BC4](v14);
  -[SUCoreScan _operationCompleting:error:clearingTransaction:](self, "_operationCompleting:error:clearingTransaction:", v22, v18, v8);

  if (v14)
  {
    -[SUCoreScan clientCompletionQueue](self, "clientCompletionQueue");
    v23 = objc_claimAutoreleasedReturnValue();
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __87__SUCoreScan__checkEndComplete_scanPolicy_primary_secondary_error_clearingTransaction___block_invoke;
    v28 = &unk_1EA878990;
    v34 = v14;
    v29 = v15;
    v30 = v16;
    v31 = v17;
    v32 = v18;
    v33 = v21;
    dispatch_async(v23, &v25);

  }
  else if (v21)
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v21, CFSTR("scan.CheckForAvailableUpdate"));
  }
  if (v18)
    v24 = objc_msgSend(v18, "code");
  else
    v24 = 0;
  -[SUCoreScan _trackScanEnd:withResult:withError:](self, "_trackScanEnd:withResult:withError:", CFSTR("checkForAvailableUpdateWithPolicy"), v24, v18, v25, v26, v27, v28);

}

uint64_t __87__SUCoreScan__checkEndComplete_scanPolicy_primary_secondary_error_clearingTransaction___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  v3 = *(_QWORD *)(a1 + 64);
  if (v3)
    return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v3, CFSTR("scan.CheckForAvailableUpdate"));
  return result;
}

- (void)_checkMajorMinorEndComplete:(id)a3 scanPolicy:(id)a4 majorPrimary:(id)a5 majorSecondary:(id)a6 minorPrimary:(id)a7 minorSecondary:(id)a8 error:(id)a9 clearingTransaction:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  id v29;
  _QWORD block[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;

  v16 = a3;
  v29 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  -[SUCoreScan scanFSM](self, "scanFSM");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "extendedStateQueue");
  v23 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v23);

  if (a10)
  {
    -[SUCoreScan scanCheckTransaction](self, "scanCheckTransaction");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan setScanCheckTransaction:](self, "setScanCheckTransaction:", 0);
  }
  else
  {
    v24 = 0;
  }
  v25 = (void *)MEMORY[0x1DF0E6BC4](v16);
  -[SUCoreScan _operationCompleting:error:clearingTransaction:](self, "_operationCompleting:error:clearingTransaction:", v25, v21, a10);

  if (v16)
  {
    -[SUCoreScan clientCompletionQueue](self, "clientCompletionQueue");
    v26 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __135__SUCoreScan__checkMajorMinorEndComplete_scanPolicy_majorPrimary_majorSecondary_minorPrimary_minorSecondary_error_clearingTransaction___block_invoke;
    block[3] = &unk_1EA8789B8;
    v38 = v16;
    v27 = v29;
    v31 = v29;
    v32 = v17;
    v33 = v18;
    v34 = v19;
    v35 = v20;
    v36 = v21;
    v37 = v24;
    dispatch_async(v26, block);

  }
  else
  {
    v27 = v29;
    if (v24)
      objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v24, CFSTR("scan.CheckForAvailableUpdate"));
  }
  if (v21)
    v28 = objc_msgSend(v21, "code");
  else
    v28 = 0;
  -[SUCoreScan _trackScanEnd:withResult:withError:](self, "_trackScanEnd:withResult:withError:", CFSTR("checkForAvailableUpdateWithPolicy"), v28, v21);

}

uint64_t __135__SUCoreScan__checkMajorMinorEndComplete_scanPolicy_majorPrimary_majorSecondary_minorPrimary_minorSecondary_error_clearingTransaction___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
  v3 = *(_QWORD *)(a1 + 80);
  if (v3)
    return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v3, CFSTR("scan.CheckForAvailableUpdate"));
  return result;
}

- (BOOL)_decideAndProcessSlowReleaseScan
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  int v33;
  SUCoreScan *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[SUCoreScan scanFSM](self, "scanFSM");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extendedStateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (-[SUCoreScan phase](self, "phase") <= 2
    && -[SUCoreScan operation](self, "operation") == 1
    && -[SUCoreScan operationSPIType](self, "operationSPIType") == 3)
  {
    -[SUCoreScan interimScanResult](self, "interimScanResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "majorPrimaryDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreScan interimScanResult](self, "interimScanResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safeObjectForKey:ofClass:", *MEMORY[0x1E0CB3388], objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0DA8AD8])
        && objc_msgSend(v8, "code") == 8400
        && v10)
      {
        objc_msgSend(v10, "domain");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.MobileAssetError.Download"))
          && objc_msgSend(v10, "code") == 18)
        {
          -[SUCoreScan scanPolicy](self, "scanPolicy");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isRequestedPMVSupervisedPolicy");

          if (!v14)
            goto LABEL_19;
LABEL_15:
          -[SUCoreScan scanPolicy](self, "scanPolicy");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "alternateAssetAudienceUUID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            -[SUCoreScan setAlternateAssetAudienceUUID:](self, "setAlternateAssetAudienceUUID:", v20);
          }
          else
          {
            objc_msgSend(v6, "alternateAssetAudienceUUID");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[SUCoreScan setAlternateAssetAudienceUUID:](self, "setAlternateAssetAudienceUUID:", v21);

          }
          if (v8)
          {
            -[SUCoreScan alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v22)
            {
              v23 = objc_alloc(MEMORY[0x1E0DA8928]);
              v24 = (void *)objc_msgSend(v23, "initWithProjectName:", *MEMORY[0x1E0DA8A10]);
              objc_msgSend(v24, "getStringConfigForKey:", *MEMORY[0x1E0DA89A0]);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[SUCoreScan setAlternateAssetAudienceUUID:](self, "setAlternateAssetAudienceUUID:", v25);

              -[SUCoreScan alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              if (v26)
              {
                objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "oslog");
                v28 = objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  -[SUCoreScan alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v33 = 138543618;
                  v34 = self;
                  v35 = 2114;
                  v36 = v29;
                  _os_log_impl(&dword_1DDFDD000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ [DUAL_AUDIENCE] Using alternate asset audience from SUCoreConfig: %{public}@", (uint8_t *)&v33, 0x16u);

                }
              }
              else
              {
                -[SUCoreScan setAlternateAssetAudienceUUID:](self, "setAlternateAssetAudienceUUID:", CFSTR("c724cb61-e974-42d3-a911-ffd4dce11eda"));
              }
            }
          }
          objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "oslog");
          v31 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            -[SUCoreScan alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = 138543618;
            v34 = self;
            v35 = 2114;
            v36 = v32;
            _os_log_impl(&dword_1DDFDD000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ [DUAL_AUDIENCE] alternate scan using asset audience: %{public}@", (uint8_t *)&v33, 0x16u);

          }
          v15 = 1;
          goto LABEL_31;
        }

      }
    }
    else
    {
      -[SUCoreScan scanPolicy](self, "scanPolicy");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[SUCoreScan _shouldPerformAlternateScanFromFoundDescriptor:policy:](self, "_shouldPerformAlternateScanFromFoundDescriptor:policy:", v6, v17);

      if (v18)
        goto LABEL_15;
    }
LABEL_19:
    v15 = 0;
LABEL_31:

    return v15;
  }
  return 0;
}

- (BOOL)_decideAndProcessSplomboScan
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  SUCorePolicyExtensionSplatUpdate *v23;
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
  uint64_t v37;
  void *v38;

  -[SUCoreScan scanFSM](self, "scanFSM");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extendedStateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (-[SUCoreScan phase](self, "phase") <= 1 && -[SUCoreScan operation](self, "operation") == 1)
  {
    -[SUCoreScan interimScanResult](self, "interimScanResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[SUCoreScan operationSPIType](self, "operationSPIType") == 1)
    {
      -[SUCoreScan interimScanResult](self, "interimScanResult");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "descriptor");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (-[SUCoreScan operationSPIType](self, "operationSPIType") == 2)
      {
        -[SUCoreScan interimScanResult](self, "interimScanResult");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "majorPrimaryDescriptor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          v9 = v11;
        }
        else
        {
          -[SUCoreScan interimScanResult](self, "interimScanResult");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "minorPrimaryDescriptor");
          v9 = (id)objc_claimAutoreleasedReturnValue();

        }
LABEL_15:

        v10 = 0;
        if (!v6 && v9)
        {
          -[SUCoreScan scanPolicy](self, "scanPolicy");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[SUCoreScan _shouldPerformSplomboScanFromFoundDescriptor:policy:](self, "_shouldPerformSplomboScanFromFoundDescriptor:policy:", v9, v14);

          if (v15)
          {
            -[SUCoreScan scanPolicy](self, "scanPolicy");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = (void *)objc_msgSend(v16, "copy");

            objc_msgSend(v9, "productBuildVersion");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setPrerequisiteBuildVersion:", v18);

            objc_msgSend(v9, "productVersion");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setPrerequisiteProductVersion:", v19);

            objc_msgSend(v9, "restoreVersion");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setPrerequisiteRestoreVersion:", v20);

            objc_msgSend(v17, "softwareUpdateScanPolicy");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setRestrictToFull:", 0);

            objc_msgSend(v17, "softwareUpdateScanPolicy");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setRestrictToIncremental:", 1);

            v23 = objc_alloc_init(SUCorePolicyExtensionSplatUpdate);
            objc_msgSend(v9, "restoreVersion");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[SUCorePolicyExtensionSplatUpdate setInstalledSplatRestoreVersion:](v23, "setInstalledSplatRestoreVersion:", v24);

            objc_msgSend(v9, "productBuildVersion");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[SUCorePolicyExtensionSplatUpdate setInstalledSplatBuildVersion:](v23, "setInstalledSplatBuildVersion:", v25);

            objc_msgSend(v9, "productVersion");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[SUCorePolicyExtensionSplatUpdate setInstalledSplatProductVersion:](v23, "setInstalledSplatProductVersion:", v26);

            -[SUCorePolicyExtensionSplatUpdate setInstalledSplatProductVersionExtra:](v23, "setInstalledSplatProductVersionExtra:", 0);
            objc_msgSend(v9, "releaseType");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[SUCorePolicyExtensionSplatUpdate setInstalledSplatReleaseType:](v23, "setInstalledSplatReleaseType:", v27);

            objc_msgSend(v9, "restoreVersion");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[SUCorePolicyExtensionSplatUpdate setInstalledBaseOSRestoreVersion:](v23, "setInstalledBaseOSRestoreVersion:", v28);

            objc_msgSend(v9, "productBuildVersion");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[SUCorePolicyExtensionSplatUpdate setInstalledBaseOSBuildVersion:](v23, "setInstalledBaseOSBuildVersion:", v29);

            objc_msgSend(v9, "productVersion");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[SUCorePolicyExtensionSplatUpdate setInstalledSplatProductVersion:](v23, "setInstalledSplatProductVersion:", v30);

            objc_msgSend(v9, "releaseType");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[SUCorePolicyExtensionSplatUpdate setInstalledBaseOSReleaseType:](v23, "setInstalledBaseOSReleaseType:", v31);

            objc_msgSend(v17, "softwareUpdateScanPolicy");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[SUCorePolicyExtensionSplatUpdate setAllowSameRestoreVersion:](v23, "setAllowSameRestoreVersion:", objc_msgSend(v32, "allowSameVersion"));

            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "policyExtensions");
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            if (v34)
            {
              v35 = (void *)MEMORY[0x1E0C99DE8];
              objc_msgSend(v17, "policyExtensions");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "arrayWithArray:", v36);
              v37 = objc_claimAutoreleasedReturnValue();

              v33 = (void *)v37;
            }
            objc_msgSend(v33, "addObject:", v23);
            objc_msgSend(v17, "setPolicyExtensions:", v33);
            objc_msgSend(v17, "setSoftwareUpdateAssetType:", CFSTR("com.apple.MobileAsset.SplatSoftwareUpdate"));
            -[SUCoreScan scanPolicy](self, "scanPolicy");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[SUCoreScan setOriginalScanPolicy:](self, "setOriginalScanPolicy:", v38);

            -[SUCoreScan setScanPolicy:](self, "setScanPolicy:", v17);
            v10 = 1;
          }
          else
          {
            v10 = 0;
          }
        }
        goto LABEL_22;
      }
      if (-[SUCoreScan operationSPIType](self, "operationSPIType") != 3)
      {
        v10 = 0;
        v9 = 0;
LABEL_22:

        return v10;
      }
      -[SUCoreScan interimScanResult](self, "interimScanResult");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "majorPrimaryDescriptor");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (id)v8;
    goto LABEL_15;
  }
  return 0;
}

- (BOOL)_decideAndProcessPSUSScanForPrimaryDescriptor:(id)a3 secondaryDescriptor:(id)a4 andError:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _BOOL4 v11;
  BOOL v12;
  id v13;

  v8 = a3;
  v9 = a4;
  if (-[SUCoreScan phase](self, "phase") <= 4 && -[SUCoreScan operation](self, "operation") == 1)
  {
    if (v8
      && !a5
      && (-[SUCoreScan scanPolicy](self, "scanPolicy"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = -[SUCoreScan _shouldPerformPSUSScanFromFoundDescriptor:policy:](self, "_shouldPerformPSUSScanFromFoundDescriptor:policy:", v8, v10), v10, v11))
    {
      -[SUCoreScan setPsusPrimaryDescriptor:](self, "setPsusPrimaryDescriptor:", v8);
      v12 = 1;
      v13 = v9;
    }
    else
    {
      -[SUCoreScan setPsusPrimaryDescriptor:](self, "setPsusPrimaryDescriptor:", 0);
      v13 = 0;
      v12 = 0;
    }
    -[SUCoreScan setPsusSecondaryDescriptor:](self, "setPsusSecondaryDescriptor:", v13);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_shouldPerformPSUSScanFromFoundDescriptor:(id)a3 policy:(id)a4
{
  _BOOL4 v5;
  id v6;
  void *v7;
  NSObject *v8;
  const __CFString *v9;
  id v11;
  uint8_t buf[4];
  SUCoreScan *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v5 = +[SUCoreScan isPreSUStagingEnabledForUpdate:policy:reason:](SUCoreScan, "isPreSUStagingEnabledForUpdate:policy:reason:", a3, a4, &v11);
  v6 = v11;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "oslog");
  v8 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("NO");
    *(_DWORD *)buf = 138543874;
    v13 = self;
    v14 = 2114;
    if (v5)
      v9 = CFSTR("YES");
    v15 = v9;
    v16 = 2114;
    v17 = v6;
    _os_log_impl(&dword_1DDFDD000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ [PreSUStaging] Performing psus scan: %{public}@; reason; %{public}@",
      buf,
      0x20u);
  }

  return v5;
}

- (BOOL)_shouldPerformSplomboScanFromFoundDescriptor:(id)a3 policy:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  const __CFString *v10;
  int v11;
  void *v12;
  NSObject *v13;
  const __CFString *v14;
  int v16;
  SUCoreScan *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    if ((objc_msgSend(v7, "disableSplatCombo") & 1) != 0)
    {
      v9 = 0;
      v10 = CFSTR("Splombo scan disabled via policy");
    }
    else if ((objc_msgSend(v8, "isSplatPolicy") & 1) != 0)
    {
      v9 = 0;
      v10 = CFSTR("Policy is a splat policy; don't perform splombo scan");
    }
    else if ((objc_msgSend(v6, "splatOnly") & 1) != 0)
    {
      v9 = 0;
      v10 = CFSTR("Located descriptor is a splat update; don't perform splombo scan");
    }
    else
    {
      v11 = objc_msgSend(v6, "disableSplatCombo");
      v9 = v11 ^ 1;
      if (v11)
        v10 = CFSTR("Splombo is disabled by server");
      else
        v10 = CFSTR("Splombo scan should be perfromed since it isn't disbaled and the found descriptor is a normal SU");
    }
  }
  else
  {
    v9 = 0;
    v10 = CFSTR("Unexpected nil policy; don't perform the splombo scan");
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "oslog");
  v13 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = CFSTR("NO");
    v16 = 138543874;
    v17 = self;
    v18 = 2114;
    if (v9)
      v14 = CFSTR("YES");
    v19 = v14;
    v20 = 2114;
    v21 = v10;
    _os_log_impl(&dword_1DDFDD000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ [SPLOMBO] Performing splombo scan: %{public}@ (%{public}@)", (uint8_t *)&v16, 0x20u);
  }

  return v9;
}

- (BOOL)_shouldPerformAlternateScanFromFoundDescriptor:(id)a3 policy:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  NSObject *v14;
  const __CFString *v15;
  int v17;
  SUCoreScan *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "disableAlternateUpdate") & 1) != 0)
  {
    v8 = 0;
    v9 = CFSTR("Alternate scan disabled via policy");
  }
  else if ((objc_msgSend(v7, "isRequestedPMVSupervisedPolicy") & 1) != 0)
  {
    v8 = 0;
    v9 = CFSTR("Alternate scan disabled for supervised PMV requests");
  }
  else
  {
    objc_msgSend(v7, "alternateAssetAudienceUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v9 = CFSTR("Alternate scan enabled via policy alternate asset audience");
      v8 = 1;
    }
    else
    {
      v9 = CFSTR("Defaults to not performing alternate scan");
      if (objc_msgSend(v6, "enableAlternateAssetAudience"))
      {
        objc_msgSend(v6, "alternateAssetAudienceUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = v11 == 0;
        v8 = v11 != 0;
        if (!v12)
          v9 = CFSTR("Located descriptor indicates an alternate scan should be performed");
      }
      else
      {
        v8 = 0;
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "oslog");
  v14 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = CFSTR("NO");
    v17 = 138543874;
    v18 = self;
    v19 = 2114;
    if (v8)
      v15 = CFSTR("YES");
    v20 = v15;
    v21 = 2114;
    v22 = v9;
    _os_log_impl(&dword_1DDFDD000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ [DUAL_AUDIENCE] Performing alternate scan: %{public}@ (%{public}@)", (uint8_t *)&v17, 0x20u);
  }

  return v8;
}

- (void)_checkSlowReleaseEndComplete:(id)a3 scanPolicy:(id)a4 primary:(id)a5 secondary:(id)a6 alternatePrimary:(id)a7 alternateSecondary:(id)a8 error:(id)a9 clearingTransaction:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  id v30;
  _QWORD block[4];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;

  v16 = a3;
  v30 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  -[SUCoreScan scanFSM](self, "scanFSM");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "extendedStateQueue");
  v23 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v23);

  v24 = v21;
  if (a10)
  {
    -[SUCoreScan scanCheckTransaction](self, "scanCheckTransaction");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan setScanCheckTransaction:](self, "setScanCheckTransaction:", 0);
  }
  else
  {
    v25 = 0;
  }
  v26 = (void *)MEMORY[0x1DF0E6BC4](v16);
  -[SUCoreScan _operationCompleting:error:clearingTransaction:](self, "_operationCompleting:error:clearingTransaction:", v26, v24, a10);

  if (v16)
  {
    -[SUCoreScan clientCompletionQueue](self, "clientCompletionQueue");
    v27 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __134__SUCoreScan__checkSlowReleaseEndComplete_scanPolicy_primary_secondary_alternatePrimary_alternateSecondary_error_clearingTransaction___block_invoke;
    block[3] = &unk_1EA8789B8;
    v39 = v16;
    v28 = v30;
    v32 = v30;
    v33 = v17;
    v34 = v18;
    v35 = v19;
    v36 = v20;
    v37 = v24;
    v38 = v25;
    dispatch_async(v27, block);

  }
  else
  {
    v28 = v30;
    if (v25)
      objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v25, CFSTR("scan.CheckForAvailableUpdate"));
  }
  if (v24)
    v29 = objc_msgSend(v24, "code");
  else
    v29 = 0;
  -[SUCoreScan _trackScanEnd:withResult:withError:](self, "_trackScanEnd:withResult:withError:", CFSTR("checkForAvailableSlowReleaseUpdatesWithPolicy"), v29, v24);

}

uint64_t __134__SUCoreScan__checkSlowReleaseEndComplete_scanPolicy_primary_secondary_alternatePrimary_alternateSecondary_error_clearingTransaction___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
  v3 = *(_QWORD *)(a1 + 80);
  if (v3)
    return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v3, CFSTR("scan.CheckForAvailableUpdate"));
  return result;
}

- (void)_verifyEndComplete:(id)a3 scanPolicy:(id)a4 active:(id)a5 primary:(id)a6 secondary:(id)a7 error:(id)a8 clearingTransaction:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  _QWORD block[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  -[SUCoreScan scanFSM](self, "scanFSM");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "extendedStateQueue");
  v22 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v22);

  if (a9)
  {
    -[SUCoreScan scanVerifyTransaction](self, "scanVerifyTransaction");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan setScanVerifyTransaction:](self, "setScanVerifyTransaction:", 0);
  }
  else
  {
    v23 = 0;
  }
  v24 = (void *)MEMORY[0x1DF0E6BC4](v15);
  -[SUCoreScan _operationCompleting:error:clearingTransaction:](self, "_operationCompleting:error:clearingTransaction:", v24, v20, a9);

  if (v15)
  {
    -[SUCoreScan clientCompletionQueue](self, "clientCompletionQueue");
    v25 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__SUCoreScan__verifyEndComplete_scanPolicy_active_primary_secondary_error_clearingTransaction___block_invoke;
    block[3] = &unk_1EA8789E0;
    v34 = v15;
    v28 = v16;
    v29 = v17;
    v30 = v18;
    v31 = v19;
    v32 = v20;
    v33 = v23;
    dispatch_async(v25, block);

  }
  else if (v23)
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v23, CFSTR("scan.VerifyLatestAvailable"));
  }
  if (v20)
    v26 = objc_msgSend(v20, "code");
  else
    v26 = 0;
  -[SUCoreScan _trackScanEnd:withResult:withError:](self, "_trackScanEnd:withResult:withError:", CFSTR("verifyLatestAvailableWithPolicy"), v26, v20);

}

uint64_t __95__SUCoreScan__verifyEndComplete_scanPolicy_active_primary_secondary_error_clearingTransaction___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  v3 = *(_QWORD *)(a1 + 72);
  if (v3)
    return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v3, CFSTR("scan.VerifyLatestAvailable"));
  return result;
}

- (void)_collectEndComplete:(id)a3 scanPolicy:(id)a4 active:(id)a5 error:(id)a6 clearingTransaction:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  _QWORD block[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  -[SUCoreScan scanFSM](self, "scanFSM");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "extendedStateQueue");
  v17 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v17);

  if (v7)
  {
    -[SUCoreScan scanCollectTransaction](self, "scanCollectTransaction");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan setScanCollectTransaction:](self, "setScanCollectTransaction:", 0);
  }
  else
  {
    v18 = 0;
  }
  v19 = (void *)MEMORY[0x1DF0E6BC4](v12);
  -[SUCoreScan _operationCompleting:error:clearingTransaction:](self, "_operationCompleting:error:clearingTransaction:", v19, v15, v7);

  if (v12)
  {
    -[SUCoreScan clientCompletionQueue](self, "clientCompletionQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78__SUCoreScan__collectEndComplete_scanPolicy_active_error_clearingTransaction___block_invoke;
    block[3] = &unk_1EA878A08;
    v27 = v12;
    v23 = v13;
    v24 = v14;
    v25 = v15;
    v26 = v18;
    dispatch_async(v20, block);

  }
  else if (v18)
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v18, CFSTR("scan.CollectDocumentationMetadata"));
  }
  if (v15)
    v21 = objc_msgSend(v15, "code");
  else
    v21 = 0;
  -[SUCoreScan _trackScanEnd:withResult:withError:](self, "_trackScanEnd:withResult:withError:", CFSTR("collectDocumentationMetadataWithPolicy"), v21, v15);

}

uint64_t __78__SUCoreScan__collectEndComplete_scanPolicy_active_error_clearingTransaction___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  v3 = *(_QWORD *)(a1 + 56);
  if (v3)
    return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v3, CFSTR("scan.CollectDocumentationMetadata"));
  return result;
}

- (void)_locateEndComplete:(id)a3 scanPolicy:(id)a4 primary:(id)a5 secondary:(id)a6 error:(id)a7 clearingTransaction:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v8 = a8;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  -[SUCoreScan scanFSM](self, "scanFSM");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "extendedStateQueue");
  v20 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v20);

  if (v8)
  {
    -[SUCoreScan scanLocateTransaction](self, "scanLocateTransaction");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan setScanLocateTransaction:](self, "setScanLocateTransaction:", 0);
  }
  else
  {
    v21 = 0;
  }
  v22 = (void *)MEMORY[0x1DF0E6BC4](v14);
  -[SUCoreScan _operationCompleting:error:clearingTransaction:](self, "_operationCompleting:error:clearingTransaction:", v22, v18, v8);

  if (v14)
  {
    -[SUCoreScan clientCompletionQueue](self, "clientCompletionQueue");
    v23 = objc_claimAutoreleasedReturnValue();
    v25 = MEMORY[0x1E0C809B0];
    v26 = 3221225472;
    v27 = __88__SUCoreScan__locateEndComplete_scanPolicy_primary_secondary_error_clearingTransaction___block_invoke;
    v28 = &unk_1EA878990;
    v34 = v14;
    v29 = v15;
    v30 = v16;
    v31 = v17;
    v32 = v18;
    v33 = v21;
    dispatch_async(v23, &v25);

  }
  else if (v21)
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v21, CFSTR("scan.LocateAvailableUpdate"));
  }
  if (v18)
    v24 = objc_msgSend(v18, "code");
  else
    v24 = 0;
  -[SUCoreScan _trackScanEnd:withResult:withError:](self, "_trackScanEnd:withResult:withError:", CFSTR("locateAvailableUpdateWithPolicy"), v24, v18, v25, v26, v27, v28);

}

uint64_t __88__SUCoreScan__locateEndComplete_scanPolicy_primary_secondary_error_clearingTransaction___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  v3 = *(_QWORD *)(a1 + 64);
  if (v3)
    return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v3, CFSTR("scan.LocateAvailableUpdate"));
  return result;
}

- (void)_cancelEndComplete:(id)a3 error:(id)a4 clearingTransaction:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[SUCoreScan scanFSM](self, "scanFSM");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "extendedStateQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  if (v5)
  {
    -[SUCoreScan scanCancelTransaction](self, "scanCancelTransaction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan setScanCancelTransaction:](self, "setScanCancelTransaction:", 0);
  }
  else
  {
    v12 = 0;
  }
  v13 = (void *)MEMORY[0x1DF0E6BC4](v8);
  -[SUCoreScan _operationCompleting:error:clearingTransaction:](self, "_operationCompleting:error:clearingTransaction:", v13, v9, v5);

  if (v8)
  {
    -[SUCoreScan clientCompletionQueue](self, "clientCompletionQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__SUCoreScan__cancelEndComplete_error_clearingTransaction___block_invoke;
    block[3] = &unk_1EA877E80;
    v19 = v8;
    v17 = v9;
    v18 = v12;
    dispatch_async(v14, block);

  }
  else if (v12)
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v12, CFSTR("scan.CancelCurrentScan"));
  }
  if (v9)
    v15 = objc_msgSend(v9, "code");
  else
    v15 = 0;
  -[SUCoreScan _trackScanEnd:withResult:withError:](self, "_trackScanEnd:withResult:withError:", CFSTR("cancelCurrentScan"), v15, v9);

}

uint64_t __59__SUCoreScan__cancelEndComplete_error_clearingTransaction___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    return objc_msgSend(MEMORY[0x1E0DA8920], "endTransaction:withName:", v3, CFSTR("scan.CancelCurrentScan"));
  return result;
}

- (void)_clearCurrentOperation
{
  int v3;
  void *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 1024;
  v6 = objc_msgSend(a1, "pendingMobileAssetRequests");
  _os_log_error_impl(&dword_1DDFDD000, a2, OS_LOG_TYPE_ERROR, "%{public}@ [MA_PENDING] clearCurrentOperation - non-zero MA pending (%d) - clearing", (uint8_t *)&v3, 0x12u);
}

uint64_t __36__SUCoreScan__clearCurrentOperation__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, 0, *(_QWORD *)(a1 + 32));
}

uint64_t __36__SUCoreScan__clearCurrentOperation__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, 0, 0, 0, *(_QWORD *)(a1 + 32));
}

uint64_t __36__SUCoreScan__clearCurrentOperation__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, 0, 0, 0, *(_QWORD *)(a1 + 32));
}

uint64_t __36__SUCoreScan__clearCurrentOperation__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, 0, 0, *(_QWORD *)(a1 + 32));
}

uint64_t __36__SUCoreScan__clearCurrentOperation__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, *(_QWORD *)(a1 + 32));
}

uint64_t __36__SUCoreScan__clearCurrentOperation__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, 0, *(_QWORD *)(a1 + 32));
}

uint64_t __36__SUCoreScan__clearCurrentOperation__block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (id)_phaseName:(int)a3
{
  __CFString *v3;

  if (a3 > 6)
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UNKNOWN(%d)"), *(_QWORD *)&a3);
  else
    v3 = kSUCoreScanPhaseName[a3];
  return v3;
}

- (id)_operationName
{
  void *v3;
  NSObject *v4;
  __CFString *v5;

  -[SUCoreScan scanFSM](self, "scanFSM");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extendedStateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (-[SUCoreScan operation](self, "operation") < 0 || -[SUCoreScan operation](self, "operation") > 4)
    v5 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("UNKNOWN(%d)"), -[SUCoreScan operation](self, "operation"));
  else
    v5 = kSUCoreScanOperationName[-[SUCoreScan operation](self, "operation")];
  return v5;
}

- (void)_operationCompleting:(id)a3 error:(id)a4 clearingTransaction:(BOOL)a5
{
  _BOOL4 v5;
  __CFString *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  int v16;
  SUCoreScan *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v5 = a5;
  v26 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a4;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "oslog");
  v10 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCoreScan _operationName](self, "_operationName");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = CFSTR("calling client completion");
    if (!a3)
      v13 = CFSTR("has completed (no client completion)");
    v14 = CFSTR("NO");
    v16 = 138544386;
    v17 = self;
    if (v5)
      v14 = CFSTR("YES");
    v18 = 2114;
    v19 = v11;
    v20 = 2114;
    v21 = v13;
    v22 = 2114;
    v23 = v14;
    if (v8)
      v15 = v8;
    else
      v15 = CFSTR("SUCCESS");
    v24 = 2114;
    v25 = v15;
    _os_log_impl(&dword_1DDFDD000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ %{public}@ [clearingTransaction:%{public}@] | %{public}@", (uint8_t *)&v16, 0x34u);

  }
}

- (void)_invalidOperation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[SUCoreScan scanFSM](self, "scanFSM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreScan scanFSM](self, "scanFSM");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "diag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCoreScan _operationName](self, "_operationName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("%@ invalid scan operation: %@"), self, v9);
  objc_msgSend(v7, "trackAnomaly:forReason:withResult:withError:", v4, v10, 8102, 0);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  -[SUCoreScan scanPolicy](self, "scanPolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SUCoreScan scanPolicy](self, "scanPolicy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "softwareUpdateScanPolicy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rampingScanType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCoreScan scanUUID](self, "scanUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan scanPolicy](self, "scanPolicy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "softwareUpdateScanPolicy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "discretionary"))
      v11 = CFSTR("Y");
    else
      v11 = CFSTR("N");
    if (v6)
    {
      -[SUCoreScan scanPolicy](self, "scanPolicy");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "softwareUpdateScanPolicy");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "rampingScanType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("[SCAN(%@) SU disc:%@, ramp:%@]"), v8, v11, v14);

    }
    else
    {
      v15 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("[SCAN(%@) SU disc:%@]"), v8, v11);
    }

  }
  else
  {
    v16 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCoreScan scanUUID](self, "scanUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("[SCAN(%@)]"), v8);
  }

  return v15;
}

- (int64_t)_determinePSUSAssets
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SUCoreScanParam *v18;
  void *v19;
  _QWORD v21[5];

  -[SUCoreScan scanFSM](self, "scanFSM");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extendedStateQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[SUCoreScan _incrementMobileAssetPending:](self, "_incrementMobileAssetPending:", CFSTR("_determinePSUSAssets"));
  -[SUCoreScan psusPrimaryDescriptor](self, "psusPrimaryDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __34__SUCoreScan__determinePSUSAssets__block_invoke;
    v21[3] = &unk_1EA878A30;
    v21[4] = self;
    v6 = (void *)MEMORY[0x1DF0E6BC4](v21);
    objc_msgSend(v5, "productVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "productBuildVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trainName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "restoreVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSafeObject:forKey:", v7, CFSTR("OSVersion"));
    objc_msgSend(v11, "setSafeObject:forKey:", v8, CFSTR("Build"));
    objc_msgSend(v11, "setSafeObject:forKey:", v9, CFSTR("TrainName"));
    objc_msgSend(v11, "setSafeObject:forKey:", v10, CFSTR("RestoreVersion"));
    objc_msgSend(v11, "setSafeObject:forKey:", &unk_1EA89AB60, CFSTR("GroupNames"));
    -[SUCoreScan _trackScanBegin:](self, "_trackScanBegin:", CFSTR("stageDetermineGroupsAvailableForUpdate"));
    objc_msgSend(MEMORY[0x1E0D4E060], "SUCoreBorder_stageDetermineGroupsAvailableForUpdate:completion:", v11, v6);

    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ psus descriptor is nil"), self);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 8411;
    objc_msgSend(v14, "buildError:underlying:description:", 8411, 0, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreScan scanFSM](self, "scanFSM");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "diag");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SCAN] PSUS"), v13, 8411, v15);

    v18 = -[SUCoreScanParam initWithResult:withError:]([SUCoreScanParam alloc], "initWithResult:withError:", 8411, v15);
    -[SUCoreScan scanFSM](self, "scanFSM");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "postProtectedEvent:withInfo:", CFSTR("PSUSAssetsDetermineFailed"), v18);

  }
  return v12;
}

void __34__SUCoreScan__determinePSUSAssets__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  SUCoreScanParam *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  SUCoreScanParam *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "_trackScanEnd:withResult:withError:", CFSTR("stageDetermineGroupsAvailableForUpdate"), objc_msgSend(v9, "code"), v9);
  if (!v9)
  {
    v12 = objc_msgSend(v8, "safeULLForKey:defaultValue:", CFSTR("STAGE_GROUP_REQUIRED"), 0);
    v13 = objc_msgSend(v8, "safeULLForKey:defaultValue:", CFSTR("STAGE_GROUP_OPTIONAL"), 0);
    objc_msgSend(*(id *)(a1 + 32), "psusPrimaryDescriptor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPreSUStagingRequiredSize:", v12);

    objc_msgSend(*(id *)(a1 + 32), "psusPrimaryDescriptor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPreSUStagingOptionalSize:", v13);

    objc_msgSend(*(id *)(a1 + 32), "psusSecondaryDescriptor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPreSUStagingRequiredSize:", v12);

    objc_msgSend(*(id *)(a1 + 32), "psusSecondaryDescriptor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPreSUStagingOptionalSize:", v13);

    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "psusPrimaryDescriptor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "summary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("found assets with {requiredSize=%llu, optionalSize=%llu} for %@"), v12, v13, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "oslog");
    v23 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138544130;
      v44 = v24;
      v45 = 2114;
      v46 = v21;
      v47 = 2112;
      v48 = v7;
      v49 = 2114;
      v50 = v8;
      v25 = "%{public}@ [PreSUStaging] succeeded; %{public}@\n"
            "[>>>\n"
            "byGroupAvailableForStagingAttributes = %@\n"
            "byGroupTotalExpectedBytes = %{public}@\n"
            "<<<]";
      v26 = v23;
      v27 = 42;
LABEL_15:
      _os_log_impl(&dword_1DDFDD000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
    }
LABEL_16:

    v39 = -[SUCoreScanParam initWithNote:]([SUCoreScanParam alloc], "initWithNote:", v21);
    objc_msgSend(*(id *)(a1 + 32), "scanFSM");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "postEvent:withInfo:", CFSTR("PSUSAssetsDetermineSuccess"), v39);

    goto LABEL_17;
  }
  objc_msgSend(v9, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.MobileAssetError.AutoAsset")))
  {

LABEL_8:
    objc_msgSend(v9, "domain");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "isEqualToString:", CFSTR("com.apple.MobileAssetError.AutoAsset")))
    {
      v29 = objc_msgSend(v9, "code");

      if (v29 == 6609)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Operation canceled"), v41, v42);
        goto LABEL_11;
      }
    }
    else
    {

    }
    v34 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "psusPrimaryDescriptor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "summary");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "stringWithFormat:", CFSTR("failed to determine for %@ with %@, but this is non-fatal"), v36, v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "oslog");
    v23 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v38 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v44 = v38;
      v45 = 2114;
      v46 = v21;
      v25 = "%{public}@ [PreSUStaging] %{public}@";
      v26 = v23;
      v27 = 22;
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  v11 = objc_msgSend(v9, "code");

  if (v11 != 6602)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to determine PSUS, assets: %@, bytes: %@"), v7, v8);
LABEL_11:
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "buildError:underlying:description:", 8411, v9, v21);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = -[SUCoreScanParam initWithResult:withError:]([SUCoreScanParam alloc], "initWithResult:withError:", objc_msgSend(v31, "code"), v31);
  objc_msgSend(*(id *)(a1 + 32), "scanFSM");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "postEvent:withInfo:", CFSTR("PSUSAssetsDetermineFailed"), v32);

LABEL_17:
}

+ (BOOL)isPreSUStagingEnabledForUpdate:(id)a3 policy:(id)a4 reason:(id *)a5
{
  id v7;
  id v8;
  int v9;
  __CFString *v10;
  void *v11;
  NSObject *v12;
  const __CFString *v13;
  int v15;
  int v16;
  const __CFString *v17;
  __int16 v18;
  __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "enablePreSUStaging"))
  {
    if (objc_msgSend(v8, "enablePreSUStaging"))
    {
      if (_MSUPreferencesGetAppBooleanValueWithDefaultValue())
      {
        v9 = 0;
        v10 = CFSTR("disabled by MSU default");
      }
      else if ((objc_msgSend(v7, "splatOnly") & 1) != 0)
      {
        v9 = 0;
        v10 = CFSTR("disabled for a Splat update");
      }
      else if (objc_msgSend(v7, "descriptorType") == 3)
      {
        v9 = 0;
        v10 = CFSTR("disabled for SFR-only updates");
      }
      else
      {
        v15 = os_variant_uses_ephemeral_storage();
        if (v15)
          v10 = CFSTR("disabled in limited environment (NeRD)");
        else
          v10 = CFSTR("not disabled by anything");
        v9 = v15 ^ 1;
      }
    }
    else
    {
      v9 = 0;
      v10 = CFSTR("disabled by policy");
    }
  }
  else
  {
    v9 = 0;
    v10 = CFSTR("disabled by server (through software update asset metadata)");
  }
  if (a5)
  {
    *a5 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "oslog");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = CFSTR("disabled");
      if (v9)
        v13 = CFSTR("enabled");
      v16 = 138543618;
      v17 = v13;
      v18 = 2114;
      v19 = v10;
      _os_log_impl(&dword_1DDFDD000, v12, OS_LOG_TYPE_DEFAULT, "[PreSUStaging] %{public}@: %{public}@", (uint8_t *)&v16, 0x16u);
    }

  }
  return v9;
}

- (int64_t)_downloadCatalog:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int64_t v31;
  id v32;
  void *v33;
  void *v34;
  SUCoreScanParam *v35;
  _QWORD v37[5];
  id v38;

  v6 = a3;
  v7 = a4;
  -[SUCoreScan scanFSM](self, "scanFSM");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "extendedStateQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[SUCoreScan _incrementMobileAssetPending:](self, "_incrementMobileAssetPending:", CFSTR("_downloadCatalog"));
  v10 = -[SUCoreScan operation](self, "operation");
  if ((v10 - 1) < 2)
  {
    -[SUCoreScan scanPolicy](self, "scanPolicy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan scanUUID](self, "scanUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constructMASoftwareUpdateCatalogDownloadOptionsWithUUID:assetAudience:", v12, v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  if (v10 != 3)
  {
    if (v10 != 4)
    {
      v26 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[SUCoreScan _operationName](self, "_operationName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v26, "initWithFormat:", CFSTR("downloadCatalog received unsupported SUCoreScanOperation (%@)"), v27);

      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "oslog");
      v16 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[SUCoreScan _downloadCatalog:withIdentifier:].cold.1();
      goto LABEL_19;
    }
    -[SUCoreScan scanPolicy](self, "scanPolicy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan scanUUID](self, "scanUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constructMASoftwareUpdateCatalogDownloadOptionsWithUUID:assetAudience:", v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

    if (!v13)
    {
      v15 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[SUCoreScan _operationName](self, "_operationName");
      v16 = objc_claimAutoreleasedReturnValue();
      -[SUCoreScan scanPolicy](self, "scanPolicy");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "summary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v15, "initWithFormat:", CFSTR("failed to construct MA SU catalog download options (for %@) from scan policy[%@]"), v16, v18);
LABEL_18:
      v13 = (void *)v19;

LABEL_19:
      objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 8100;
      objc_msgSend(v33, "buildError:underlying:description:", 8100, 0, v13);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      -[SUCoreScan scanFSM](self, "scanFSM");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = -[SUCoreScanParam initWithResult:withError:]([SUCoreScanParam alloc], "initWithResult:withError:", 8100, v29);
      objc_msgSend(v34, "postProtectedEvent:withInfo:", CFSTR("CatalogDownloadFailed"), v35);

      goto LABEL_20;
    }
    goto LABEL_9;
  }
  -[SUCoreScan scanPolicy](self, "scanPolicy");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScan scanUUID](self, "scanUUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScan activeDescriptor](self, "activeDescriptor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constructMADocumentationCatalogDownloadOptionsWithUUID:usingDescriptor:", v21, v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v32 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[SUCoreScan _operationName](self, "_operationName");
    v16 = objc_claimAutoreleasedReturnValue();
    -[SUCoreScan scanPolicy](self, "scanPolicy");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "summary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v32, "initWithFormat:", CFSTR("failed to construct MA documentation catalog download options (for %@) from scan policy[%@]"), v16, v18);
    goto LABEL_18;
  }
LABEL_9:
  objc_msgSend(v13, "additionalServerParams");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
    v25 = v23;
  else
    v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v29 = v25;

  objc_msgSend(v29, "setSafeObject:forKey:", &unk_1EA89AA00, CFSTR("ScanRequestCount"));
  if (-[SUCoreScan phase](self, "phase") >= 3)
    objc_msgSend(v29, "setSafeObject:forKey:", &unk_1EA89AA18, CFSTR("ScanRequestCount"));
  objc_msgSend(v13, "setAdditionalServerParams:", v29);
  -[SUCoreScan _trackScanBegin:withIdentifier:](self, "_trackScanBegin:withIdentifier:", CFSTR("startCatalogDownload"), v7);
  v30 = (void *)MEMORY[0x1E0D4E038];
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __46__SUCoreScan__downloadCatalog_withIdentifier___block_invoke;
  v37[3] = &unk_1EA878800;
  v37[4] = self;
  v38 = v7;
  objc_msgSend(v30, "SUCoreBorder_startCatalogDownload:options:completionWithError:", v6, v13, v37);

  v31 = 0;
LABEL_20:

  return v31;
}

void __46__SUCoreScan__downloadCatalog_withIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  SUCoreScanParam *v10;
  id v11;

  v11 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_trackScanEnd:withIdentifier:withResult:withError:", CFSTR("startCatalogDownload"), *(_QWORD *)(a1 + 40), a2);
  if (!a2)
    goto LABEL_4;
  if (a2 == 18)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed to download catalog - no match found (MADownload domain result:%ld)"), 18);
LABEL_7:
    v5 = (void *)v6;
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "buildError:underlying:description:", 8400, v11, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "scanFSM");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SUCoreScanParam initWithResult:withError:]([SUCoreScanParam alloc], "initWithResult:withError:", a2, v8);
    objc_msgSend(v9, "postEvent:withInfo:", CFSTR("CatalogDownloadFailed"), v10);

    goto LABEL_8;
  }
  if (a2 != 10)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed to download catalog (MADownload domain result:%ld)"), a2);
    goto LABEL_7;
  }
LABEL_4:
  objc_msgSend(*(id *)(a1 + 32), "scanFSM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postEvent:", CFSTR("CatalogDownloadSuccess"));
LABEL_8:

}

- (void)_filterSUQueryResults:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SUCoreScanParam *v11;
  id v12;

  v12 = a3;
  if (-[SUCoreScan operationSPIType](self, "operationSPIType") == 1
    || -[SUCoreScan operationSPIType](self, "operationSPIType") == 3
    || -[SUCoreScan phase](self, "phase") == 2)
  {
    -[SUCoreScan _filterSUQueryResultsForSPITypeSingleFromQuery:](self, "_filterSUQueryResultsForSPITypeSingleFromQuery:", v12);
  }
  else if (-[SUCoreScan operationSPIType](self, "operationSPIType") == 2)
  {
    -[SUCoreScan _filterSUQueryResultsForSPITypeMajorMinorFromQuery:](self, "_filterSUQueryResultsForSPITypeMajorMinorFromQuery:", v12);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8920], "sharedCore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ unknown operationSPIType found (%i)"), self, -[SUCoreScan operationSPIType](self, "operationSPIType"));
    objc_msgSend(v4, "buildError:underlying:description:", 8117, 0, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreScan scanFSM](self, "scanFSM");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "diag");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SCAN] FILTER_SU_QUERY"), v9, objc_msgSend(v6, "code"), v6);

    -[SUCoreScan scanFSM](self, "scanFSM");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SUCoreScanParam initWithResult:withError:]([SUCoreScanParam alloc], "initWithResult:withError:", 8117, v6);
    objc_msgSend(v10, "postEvent:withInfo:", CFSTR("QueryMetadataFailed"), v11);

  }
}

- (void)_filterSUQueryResultsForSPITypeSingleFromQuery:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  SUCoreScanParam *v24;
  const __CFString *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  SUCoreScanParam *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  SUCoreDescriptor *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  SUCoreDescriptor *v39;
  void *v40;
  void *v41;
  SUCoreScanParam *v42;
  SUCoreScanParam *v43;
  SUCoreScanParam *v44;
  id v45;
  id v46;
  uint8_t buf[4];
  SUCoreScan *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreScan scanPolicy](self, "scanPolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  v46 = 0;
  objc_msgSend(v5, "selectSoftwareUpdatePrimaryAsset:secondaryAsset:fromAssetQuery:", &v46, &v45, v4);
  v6 = v46;
  v7 = v45;

  if (v6)
  {
    v8 = -[SUCoreScan operation](self, "operation");
    if ((v8 - 1) < 2)
    {
      objc_msgSend(v4, "postedDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        objc_msgSend(v4, "postedDate");
        v27 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "oslog");
        v34 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v48 = self;
          _os_log_impl(&dword_1DDFDD000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ Asset query did not return posting date. Setting posting date to now", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v27 = objc_claimAutoreleasedReturnValue();
      }
      v23 = (void *)v27;
      v35 = [SUCoreDescriptor alloc];
      -[SUCoreScan scanPolicy](self, "scanPolicy");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "defaultDescriptorValues");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[SUCoreDescriptor initWithSUAsset:releaseDate:defaultValues:](v35, "initWithSUAsset:releaseDate:defaultValues:", v6, v23, v37);

      if (v7)
      {
        v39 = [SUCoreDescriptor alloc];
        -[SUCoreScan scanPolicy](self, "scanPolicy");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "defaultDescriptorValues");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[SUCoreDescriptor initWithSUAsset:releaseDate:defaultValues:](v39, "initWithSUAsset:releaseDate:defaultValues:", v7, v23, v41);

      }
      else
      {
        v24 = 0;
      }
      -[SUCoreScan scanFSM](self, "scanFSM");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = [SUCoreScanParam alloc];
      if (v38)
      {
        v43 = -[SUCoreScanParam initWithDescriptor:withFallbackDescriptor:](v42, "initWithDescriptor:withFallbackDescriptor:", v38, v24);
        objc_msgSend(v28, "postEvent:withInfo:", CFSTR("QueryMetadataUpdateAvailable"), v43);

        v24 = (SUCoreScanParam *)v38;
        goto LABEL_27;
      }
      v44 = -[SUCoreScanParam initWithResult:withError:](v42, "initWithResult:withError:", 8406, 0);
      objc_msgSend(v28, "postEvent:withInfo:", CFSTR("QueryMetadataNoAssetFound"), v44);

    }
    else
    {
      if (v8 == 3)
      {
        -[SUCoreScan scanFSM](self, "scanFSM");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "diag");
        v24 = (SUCoreScanParam *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ SUCoreScanOperation (SU_SCAN_OP_COLLECT) should never filter SU query results"), self);
        v29 = CFSTR("[SCAN] FILTER_SU_QUERY");
        v30 = v24;
        v31 = v28;
        v32 = 8115;
      }
      else
      {
        if (v8 == 4)
        {
          -[SUCoreScan primaryUpdateAsset](self, "primaryUpdateAsset");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            -[SUCoreScan scanFSM](self, "scanFSM");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "diag");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_alloc(MEMORY[0x1E0CB3940]);
            -[SUCoreScan primaryUpdateAsset](self, "primaryUpdateAsset");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "assetId");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("%@ discarding existing primary update asset ID:%@"), self, v14);
            objc_msgSend(v11, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SCAN] FILTER_SU_QUERY"), v15, 8111, 0);

          }
          -[SUCoreScan setPrimaryUpdateAsset:](self, "setPrimaryUpdateAsset:", v6);
          -[SUCoreScan secondaryUpdateAsset](self, "secondaryUpdateAsset");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            -[SUCoreScan scanFSM](self, "scanFSM");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "diag");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_alloc(MEMORY[0x1E0CB3940]);
            -[SUCoreScan secondaryUpdateAsset](self, "secondaryUpdateAsset");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "assetId");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = (void *)objc_msgSend(v19, "initWithFormat:", CFSTR("%@ discarding existing secondary update asset ID:%@"), self, v21);
            objc_msgSend(v18, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SCAN] FILTER_SU_QUERY"), v22, 8111, 0);

          }
          -[SUCoreScan setSecondaryUpdateAsset:](self, "setSecondaryUpdateAsset:", v7);
          -[SUCoreScan scanFSM](self, "scanFSM");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_alloc_init(SUCoreScanParam);
          v25 = CFSTR("QueryMetadataUpdateAvailable");
          goto LABEL_11;
        }
        -[SUCoreScan scanFSM](self, "scanFSM");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "diag");
        v24 = (SUCoreScanParam *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ filter SU query results for unknown operation:%d"), self, -[SUCoreScan operation](self, "operation"));
        v29 = CFSTR("[SCAN] UNKNOWN OPERATION");
        v30 = v24;
        v31 = v28;
        v32 = 8117;
      }
      -[SUCoreScanParam trackAnomaly:forReason:withResult:withError:](v30, "trackAnomaly:forReason:withResult:withError:", v29, v31, v32, 0);
    }

    goto LABEL_27;
  }
  -[SUCoreScan scanFSM](self, "scanFSM");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[SUCoreScanParam initWithResult:withError:]([SUCoreScanParam alloc], "initWithResult:withError:", 8406, 0);
  v25 = CFSTR("QueryMetadataNoAssetFound");
LABEL_11:
  objc_msgSend(v23, "postEvent:withInfo:", v25, v24);
LABEL_27:

}

- (void)_filterSUQueryResultsForSPITypeMajorMinorFromQuery:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  SUCoreDescriptor *v17;
  void *v18;
  void *v19;
  SUCoreDescriptor *v20;
  void *v21;
  void *v22;
  SUCoreDescriptor *v23;
  void *v24;
  SUCoreDescriptor *v25;
  void *v26;
  void *v27;
  SUCoreDescriptor *v28;
  void *v29;
  void *v30;
  SUCoreDescriptor *v31;
  void *v32;
  SUCoreScanParam *v33;
  SUCoreScanParam *v34;
  const __CFString *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  SUCoreScan *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SUCoreScan operation](self, "operation") == 1)
  {
    -[SUCoreScan scanPolicy](self, "scanPolicy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    v43 = 0;
    v40 = 0;
    v41 = 0;
    objc_msgSend(v5, "selectSoftwareUpdateMajorPrimaryAsset:majorSecondaryAsset:minorPrimaryAsset:minorSecondaryAsset:fromAssetQuery:", &v43, &v42, &v41, &v40, v4);
    v6 = v43;
    v7 = v42;
    v8 = (uint64_t)v41;
    v39 = v40;

    objc_msgSend(v4, "postedDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v4, "postedDate");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "oslog");
      v15 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v45 = self;
        _os_log_impl(&dword_1DDFDD000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Asset query did not return posting date. Setting posting date to now", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v10;
    if (v6)
    {
      v17 = [SUCoreDescriptor alloc];
      -[SUCoreScan scanPolicy](self, "scanPolicy");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "defaultDescriptorValues");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = -[SUCoreDescriptor initWithSUAsset:releaseDate:defaultValues:](v17, "initWithSUAsset:releaseDate:defaultValues:", v6, v16, v19);

    }
    else
    {
      v37 = 0;
    }
    v38 = (void *)v8;
    v36 = v7;
    if (v7)
    {
      v20 = [SUCoreDescriptor alloc];
      -[SUCoreScan scanPolicy](self, "scanPolicy");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "defaultDescriptorValues");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[SUCoreDescriptor initWithSUAsset:releaseDate:defaultValues:](v20, "initWithSUAsset:releaseDate:defaultValues:", v7, v16, v22);

      v8 = (uint64_t)v38;
    }
    else
    {
      v23 = 0;
    }
    v24 = v6;
    if (v8)
    {
      v25 = [SUCoreDescriptor alloc];
      -[SUCoreScan scanPolicy](self, "scanPolicy");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "defaultDescriptorValues");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[SUCoreDescriptor initWithSUAsset:releaseDate:defaultValues:](v25, "initWithSUAsset:releaseDate:defaultValues:", v8, v16, v27);

    }
    if (v39)
    {
      v28 = [SUCoreDescriptor alloc];
      -[SUCoreScan scanPolicy](self, "scanPolicy");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "defaultDescriptorValues");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = -[SUCoreDescriptor initWithSUAsset:releaseDate:defaultValues:](v28, "initWithSUAsset:releaseDate:defaultValues:", v39, v16, v30);

    }
    else
    {
      v31 = 0;
    }
    -[SUCoreScan scanFSM](self, "scanFSM");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = [SUCoreScanParam alloc];
    if (v37 | v8)
    {
      v34 = -[SUCoreScanParam initWithMajorPrimaryDescriptor:majorSecondaryDescriptor:minorPrimaryDescriptor:minorSecondaryDescriptor:](v33, "initWithMajorPrimaryDescriptor:majorSecondaryDescriptor:minorPrimaryDescriptor:minorSecondaryDescriptor:", v37, v23, v8, v31);
      v35 = CFSTR("QueryMetadataUpdateAvailable");
    }
    else
    {
      v34 = -[SUCoreScanParam initWithResult:withError:](v33, "initWithResult:withError:", 8406, 0);
      v35 = CFSTR("QueryMetadataNoAssetFound");
    }
    objc_msgSend(v32, "postEvent:withInfo:", v35, v34);

  }
  else
  {
    -[SUCoreScan scanFSM](self, "scanFSM");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "diag");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ SU_SCAN_OP_CHECK is not supported for current operation"), self);
    objc_msgSend(v12, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SCAN] FILTER_SU_QUERY"), v13, 8117, 0);

  }
}

- (void)_filterDocQueryResults:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  SUCoreScanParam *v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  SUCoreScan *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreScan scanPolicy](self, "scanPolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v5, "selectDocumentationAsset:fromAssetQuery:", &v18, v4);

  v6 = v18;
  if (v6)
  {
    -[SUCoreScan activeDescriptor](self, "activeDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assignDocumentationFromAsset:extendingBundleProperties:", v6, objc_msgSend(v6, "wasLocal"));

    LODWORD(v7) = -[SUCoreScan downloadDocumentation](self, "downloadDocumentation");
    -[SUCoreScan scanFSM](self, "scanFSM");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((_DWORD)v7)
      v10 = CFSTR("QueryMetadataNeedDoc");
    else
      v10 = CFSTR("QueryMetadataSuccess");
LABEL_12:
    objc_msgSend(v8, "postEvent:", v10);
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "requiresDocAssetForUpdate");

  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "oslog");
  v14 = objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "deviceClass");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = self;
      v21 = 2114;
      v22 = v17;
      _os_log_impl(&dword_1DDFDD000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ documentation not required for device: %{public}@", buf, 0x16u);

    }
    -[SUCoreScan scanFSM](self, "scanFSM");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("QueryMetadataSuccess");
    goto LABEL_12;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[SUCoreScan _filterDocQueryResults:].cold.1((uint64_t)self, v14);

  -[SUCoreScan scanFSM](self, "scanFSM");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SUCoreScanParam initWithResult:withError:]([SUCoreScanParam alloc], "initWithResult:withError:", 8407, 0);
  objc_msgSend(v9, "postEvent:withInfo:", CFSTR("QueryMetadataNoAssetFound"), v15);

LABEL_13:
}

- (void)_incrementMobileAssetPending:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v9;
  SUCoreScan *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreScan scanFSM](self, "scanFSM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreScan setPendingMobileAssetRequests:](self, "setPendingMobileAssetRequests:", -[SUCoreScan pendingMobileAssetRequests](self, "pendingMobileAssetRequests") + 1);
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "oslog");
  v8 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543874;
    v10 = self;
    v11 = 2114;
    v12 = v4;
    v13 = 1024;
    v14 = -[SUCoreScan pendingMobileAssetRequests](self, "pendingMobileAssetRequests");
    _os_log_impl(&dword_1DDFDD000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ [MA_PENDING(INCR)] %{public}@ - incremented MA pending (%d remaining)", (uint8_t *)&v9, 0x1Cu);
  }

}

- (int64_t)_decrementMobileAssetPending:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  uint8_t buf[4];
  SUCoreScan *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SUCoreScan scanFSM](self, "scanFSM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extendedStateQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (-[SUCoreScan pendingMobileAssetRequests](self, "pendingMobileAssetRequests") < 1)
  {
    -[SUCoreScan scanFSM](self, "scanFSM");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "diag");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ MobileAsset operation completed when nothing pending (%@)"), self, v4);
    objc_msgSend((id)v11, "trackAnomaly:forReason:withResult:withError:", CFSTR("[SCAN] MA_PENDING(DECR)"), v12, 8117, 0);

    LODWORD(v11) = -[SUCoreScan pendingMobileAssetRequests](self, "pendingMobileAssetRequests");
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "oslog");
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if ((v11 & 0x80000000) != 0)
    {
      if (v15)
        -[SUCoreScan _decrementMobileAssetPending:].cold.1(self, (uint64_t)v4, v14);

      -[SUCoreScan setPendingMobileAssetRequests:](self, "setPendingMobileAssetRequests:", 0);
    }
    else
    {
      if (v15)
        -[SUCoreScan _decrementMobileAssetPending:].cold.2();

    }
    v9 = 8117;
  }
  else
  {
    -[SUCoreScan setPendingMobileAssetRequests:](self, "setPendingMobileAssetRequests:", -[SUCoreScan pendingMobileAssetRequests](self, "pendingMobileAssetRequests") - 1);
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "oslog");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v18 = self;
      v19 = 2114;
      v20 = v4;
      v21 = 1024;
      v22 = -[SUCoreScan pendingMobileAssetRequests](self, "pendingMobileAssetRequests");
      _os_log_impl(&dword_1DDFDD000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ [MA_PENDING(DECR)] %{public}@ - decremented MA pending (%d remaining)", buf, 0x1Cu);
    }

    v9 = 0;
  }

  return v9;
}

- (void)_trackScanBegin:(id)a3
{
  -[SUCoreScan _trackScanBegin:withIdentifier:](self, "_trackScanBegin:withIdentifier:", a3, 0);
}

- (void)_trackScanBegin:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[SUCoreScan scanFSM](self, "scanFSM");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "diag");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trackBegin:atLevel:forModule:withIdentifier:", v7, 1, CFSTR("scan"), v6);

}

- (void)_trackScanEnd:(id)a3 withResult:(int64_t)a4 withError:(id)a5
{
  -[SUCoreScan _trackScanEnd:withIdentifier:withResult:withError:](self, "_trackScanEnd:withIdentifier:withResult:withError:", a3, 0, a4, a5);
}

- (void)_trackScanEnd:(id)a3 withIdentifier:(id)a4 withResult:(int64_t)a5 withError:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[SUCoreScan scanFSM](self, "scanFSM");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "diag");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trackEnd:atLevel:forModule:withIdentifier:withResult:withError:", v12, 1, CFSTR("scan"), v11, a5, v10);

}

- (id)_simDescriptorAttributes
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[38];
  _QWORD v22[40];

  v22[38] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v2, "setDateFormat:", CFSTR("dd-MMM-yy"));
  objc_msgSend(v2, "dateFromString:", CFSTR("07-Jul-07"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99D50]);
  v21[0] = CFSTR("OSVersion");
  v21[1] = CFSTR("Build");
  v22[0] = CFSTR("9.9.13.0");
  v22[1] = CFSTR("17A408a");
  v21[2] = CFSTR("SUProductSystemName");
  v21[3] = CFSTR("ReleaseType");
  v22[2] = CFSTR("iOS");
  v22[3] = CFSTR("Internal");
  v21[4] = CFSTR("SUPublisher");
  v21[5] = CFSTR("ReleaseDate");
  v22[4] = CFSTR("Apple Inc.");
  v22[5] = v16;
  v21[6] = CFSTR("SupportedDevices");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("D11AP"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v4;
  v21[7] = *MEMORY[0x1E0D4DEF8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 3209145381);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v5;
  v21[8] = *MEMORY[0x1E0D4DF10];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 3309669376);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[8] = v6;
  v21[9] = CFSTR("ActualMinimumSystemPartition");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 5674);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0D4DF00];
  v9 = MEMORY[0x1E0C9AAB0];
  v22[9] = v7;
  v22[10] = MEMORY[0x1E0C9AAB0];
  v21[10] = v8;
  v21[11] = CFSTR("SystemPartitionPadding");
  v22[11] = MEMORY[0x1E0C9AA70];
  v22[12] = MEMORY[0x1E0C9AAB0];
  v21[12] = CFSTR("AutomaticDownloadOver3G");
  v21[13] = CFSTR("AllowableOverCellular");
  v22[13] = MEMORY[0x1E0C9AAB0];
  v22[14] = MEMORY[0x1E0C9AAB0];
  v21[14] = CFSTR("AllowableOTA");
  v21[15] = CFSTR("SUDisableSiriVoiceDeletion");
  v22[15] = MEMORY[0x1E0C9AAB0];
  v22[16] = MEMORY[0x1E0C9AAB0];
  v21[16] = CFSTR("SUDisableCDLevel4");
  v21[17] = CFSTR("SUDisableAppDemotion");
  v22[17] = MEMORY[0x1E0C9AAB0];
  v22[18] = MEMORY[0x1E0C9AAB0];
  v21[18] = CFSTR("SUInstallTonightEnabled");
  v21[19] = CFSTR("Ramp");
  v22[19] = MEMORY[0x1E0C9AAB0];
  v21[20] = CFSTR("MDMDelayInterval");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[20] = v10;
  v22[21] = v9;
  v21[21] = CFSTR("AutoUpdate");
  v21[22] = CFSTR("SetupCritical");
  v22[22] = CFSTR("kSUAssetSetupCriticalKey");
  v22[23] = v9;
  v21[23] = CFSTR("SetupCriticalCellularOverride");
  v21[24] = CFSTR("SetupCriticalUpdateOutOfBoxOnly");
  v22[24] = v9;
  v22[25] = CFSTR("kSUAssetLastEmergencyBuildKey");
  v21[25] = CFSTR("LastEmergencyBuild");
  v21[26] = CFSTR("LastEmergencyOSVersion");
  v22[26] = CFSTR("kSUAssetLastEmergencyOSVersionKey");
  v22[27] = v3;
  v21[27] = CFSTR("SEPDigest");
  v21[28] = CFSTR("SEPTBMDigests");
  v22[28] = v3;
  v22[29] = v3;
  v21[29] = CFSTR("RSEPDigest");
  v21[30] = CFSTR("RSEPTBMDigests");
  v22[30] = v3;
  v22[31] = CFSTR("PreRelease");
  v21[31] = CFSTR("SUDocumentationID");
  v21[32] = CFSTR("Language");
  v22[32] = CFSTR("kSUAssetLanguageKey");
  v22[33] = CFSTR("kSUAssetReleaseNotesSummaryFileNameKey");
  v21[33] = CFSTR("ReleaseNotesSummaryFileName");
  v21[34] = CFSTR("ReleaseNotesFileName");
  v22[34] = CFSTR("kSUAssetReleaseNotesFileNameKey");
  v22[35] = CFSTR("kSUAssetLicenseAgreementFileNameKey");
  v21[35] = CFSTR("LicenseAgreementFileName");
  v21[36] = CFSTR("_Measurement");
  v21[37] = CFSTR("_MeasurementAlgorithm");
  v22[36] = v3;
  v22[37] = CFSTR("SHA-1");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 38);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = CFSTR("AssetProperties");
  v19[1] = CFSTR("AssetAddedProperties");
  v20[0] = v11;
  v17[0] = CFSTR("AssetState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = CFSTR("com.apple.MobileAsset.SoftwareUpdateCoreTest");
  v17[1] = CFSTR("AssetType");
  v17[2] = CFSTR("AssetId");
  v18[2] = CFSTR("ma-asset-id");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSString)scanUUID
{
  return self->_scanUUID;
}

- (OS_dispatch_queue)clientCompletionQueue
{
  return self->_clientCompletionQueue;
}

- (int)operation
{
  return self->_operation;
}

- (void)setOperation:(int)a3
{
  self->_operation = a3;
}

- (int)operationSPIType
{
  return self->_operationSPIType;
}

- (void)setOperationSPIType:(int)a3
{
  self->_operationSPIType = a3;
}

- (BOOL)cancelingOperation
{
  return self->_cancelingOperation;
}

- (void)setCancelingOperation:(BOOL)a3
{
  self->_cancelingOperation = a3;
}

- (SUCoreFSM)scanFSM
{
  return self->_scanFSM;
}

- (SUCorePolicy)scanPolicy
{
  return self->_scanPolicy;
}

- (void)setScanPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_scanPolicy, a3);
}

- (SUCoreDescriptor)activeDescriptor
{
  return self->_activeDescriptor;
}

- (void)setActiveDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_activeDescriptor, a3);
}

- (BOOL)downloadDocumentation
{
  return self->_downloadDocumentation;
}

- (void)setDownloadDocumentation:(BOOL)a3
{
  self->_downloadDocumentation = a3;
}

- (int)pendingMobileAssetRequests
{
  return self->_pendingMobileAssetRequests;
}

- (void)setPendingMobileAssetRequests:(int)a3
{
  self->_pendingMobileAssetRequests = a3;
}

- (NSString)alternateAssetAudienceUUID
{
  return self->_alternateAssetAudienceUUID;
}

- (void)setAlternateAssetAudienceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_alternateAssetAudienceUUID, a3);
}

- (SUCoreMobileAsset)maDocumentationControl
{
  return self->_maDocumentationControl;
}

- (void)setMaDocumentationControl:(id)a3
{
  objc_storeStrong((id *)&self->_maDocumentationControl, a3);
}

- (MAAsset)primaryUpdateAsset
{
  return self->_primaryUpdateAsset;
}

- (void)setPrimaryUpdateAsset:(id)a3
{
  objc_storeStrong((id *)&self->_primaryUpdateAsset, a3);
}

- (MAAsset)secondaryUpdateAsset
{
  return self->_secondaryUpdateAsset;
}

- (void)setSecondaryUpdateAsset:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryUpdateAsset, a3);
}

- (id)checkCompletion
{
  return self->_checkCompletion;
}

- (void)setCheckCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)checkMajorMinorCompletion
{
  return self->_checkMajorMinorCompletion;
}

- (void)setCheckMajorMinorCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)checkSlowReleaseCompletion
{
  return self->_checkSlowReleaseCompletion;
}

- (void)setCheckSlowReleaseCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)verifyCompletion
{
  return self->_verifyCompletion;
}

- (void)setVerifyCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)collectCompletion
{
  return self->_collectCompletion;
}

- (void)setCollectCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (id)locateCompletion
{
  return self->_locateCompletion;
}

- (void)setLocateCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (id)cancelCompletion
{
  return self->_cancelCompletion;
}

- (void)setCancelCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (SUCorePolicy)originalScanPolicy
{
  return self->_originalScanPolicy;
}

- (void)setOriginalScanPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_originalScanPolicy, a3);
}

- (int)phase
{
  return self->_phase;
}

- (void)setPhase:(int)a3
{
  self->_phase = a3;
}

- (SUCoreScanParam)interimScanResult
{
  return self->_interimScanResult;
}

- (void)setInterimScanResult:(id)a3
{
  objc_storeStrong((id *)&self->_interimScanResult, a3);
}

- (SUCoreDescriptor)psusPrimaryDescriptor
{
  return self->_psusPrimaryDescriptor;
}

- (void)setPsusPrimaryDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_psusPrimaryDescriptor, a3);
}

- (SUCoreDescriptor)psusSecondaryDescriptor
{
  return self->_psusSecondaryDescriptor;
}

- (void)setPsusSecondaryDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_psusSecondaryDescriptor, a3);
}

- (OS_os_transaction)scanCheckTransaction
{
  return self->_scanCheckTransaction;
}

- (void)setScanCheckTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_scanCheckTransaction, a3);
}

- (OS_os_transaction)scanVerifyTransaction
{
  return self->_scanVerifyTransaction;
}

- (void)setScanVerifyTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_scanVerifyTransaction, a3);
}

- (OS_os_transaction)scanCollectTransaction
{
  return self->_scanCollectTransaction;
}

- (void)setScanCollectTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_scanCollectTransaction, a3);
}

- (OS_os_transaction)scanLocateTransaction
{
  return self->_scanLocateTransaction;
}

- (void)setScanLocateTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_scanLocateTransaction, a3);
}

- (OS_os_transaction)scanCancelTransaction
{
  return self->_scanCancelTransaction;
}

- (void)setScanCancelTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_scanCancelTransaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scanCancelTransaction, 0);
  objc_storeStrong((id *)&self->_scanLocateTransaction, 0);
  objc_storeStrong((id *)&self->_scanCollectTransaction, 0);
  objc_storeStrong((id *)&self->_scanVerifyTransaction, 0);
  objc_storeStrong((id *)&self->_scanCheckTransaction, 0);
  objc_storeStrong((id *)&self->_psusSecondaryDescriptor, 0);
  objc_storeStrong((id *)&self->_psusPrimaryDescriptor, 0);
  objc_storeStrong((id *)&self->_interimScanResult, 0);
  objc_storeStrong((id *)&self->_originalScanPolicy, 0);
  objc_storeStrong(&self->_cancelCompletion, 0);
  objc_storeStrong(&self->_locateCompletion, 0);
  objc_storeStrong(&self->_collectCompletion, 0);
  objc_storeStrong(&self->_verifyCompletion, 0);
  objc_storeStrong(&self->_checkSlowReleaseCompletion, 0);
  objc_storeStrong(&self->_checkMajorMinorCompletion, 0);
  objc_storeStrong(&self->_checkCompletion, 0);
  objc_storeStrong((id *)&self->_secondaryUpdateAsset, 0);
  objc_storeStrong((id *)&self->_primaryUpdateAsset, 0);
  objc_storeStrong((id *)&self->_maDocumentationControl, 0);
  objc_storeStrong((id *)&self->_alternateAssetAudienceUUID, 0);
  objc_storeStrong((id *)&self->_activeDescriptor, 0);
  objc_storeStrong((id *)&self->_scanPolicy, 0);
  objc_storeStrong((id *)&self->_scanFSM, 0);
  objc_storeStrong((id *)&self->_clientCompletionQueue, 0);
  objc_storeStrong((id *)&self->_scanUUID, 0);
}

- (void)_updateInterimScanResultForSlowReleaseWithPrimary:secondary:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DDFDD000, v0, v1, "%{public}@ [DUAL_AUDIENCE] Dropping no update found alternate scan error: %{public}@");
  OUTLINED_FUNCTION_2_0();
}

- (void)_downloadCatalog:withIdentifier:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DDFDD000, v0, v1, "%{public}@ %{public}@");
  OUTLINED_FUNCTION_2_0();
}

- (void)_filterDocQueryResults:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1DDFDD000, a2, OS_LOG_TYPE_ERROR, "%{public}@ no documentation asset (after filtering/selection)", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

- (void)_decrementMobileAssetPending:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  int v4;
  void *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = 138543874;
  v5 = a1;
  v6 = 2114;
  v7 = a2;
  v8 = 1024;
  v9 = objc_msgSend(a1, "pendingMobileAssetRequests");
  _os_log_error_impl(&dword_1DDFDD000, a3, OS_LOG_TYPE_ERROR, "%{public}@ [MA_PENDING(DECR)] %{public}@ - negative MA pending (%d) - clearing", (uint8_t *)&v4, 0x1Cu);
}

- (void)_decrementMobileAssetPending:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1DDFDD000, v0, v1, "%{public}@ [MA_PENDING(DECR)] %{public}@ - 0 MA pending");
  OUTLINED_FUNCTION_2_0();
}

@end
