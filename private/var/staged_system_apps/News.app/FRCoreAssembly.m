@implementation FRCoreAssembly

- (FRCoreAssembly)initWithCloudContext:(id)a3 configurationManager:(id)a4 appActivityMonitor:(id)a5 networkBehaviorMonitor:(id)a6 offlineModeMonitor:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  FRCoreAssembly *v17;
  FRCoreAssembly *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)FRCoreAssembly;
  v17 = -[FRCoreAssembly init](&v21, "init");
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_cloudContext, a3);
    objc_storeStrong((id *)&v18->_configurationManager, a4);
    objc_storeStrong((id *)&v18->_appActivityMonitor, a5);
    objc_storeStrong((id *)&v18->_networkBehaviorMonitor, a6);
    objc_storeStrong((id *)&v18->_offlineModeMonitor, a7);
  }

  return v18;
}

- (void)loadInRegistry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  uint64_t v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  uint64_t v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  uint64_t v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  uint64_t v80;
  id v81;
  void *v82;
  id v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  id v88;
  void *v89;
  uint64_t v90;
  id v91;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  id v102;
  void *v103;
  uint64_t v104;
  id v105;
  void *v106;
  id v107;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  void *v112;
  id v113;
  void *v114;
  void *v115;
  id v116;
  void *v117;
  uint64_t v118;
  id v119;
  void *v120;
  id v121;
  void *v122;
  uint64_t v123;
  id v124;
  void *v125;
  id v126;
  void *v127;
  uint64_t v128;
  id v129;
  void *v130;
  void *v131;
  id v132;
  void *v133;
  id v134;
  void *v135;
  id v136;
  void *v137;
  id v138;
  void *v139;
  void *v140;
  id v141;
  void *v142;
  void *v143;
  id v144;
  void *v145;
  void *v146;
  id v147;
  void *v148;
  void *v149;
  id v150;
  void *v151;
  id v152;
  void *v153;
  void *v154;
  id v155;
  void *v156;
  void *v157;
  id v158;
  void *v159;
  uint64_t v160;
  id v161;
  void *v162;
  id v163;
  _QWORD v164[5];
  _QWORD v165[5];
  _QWORD v166[5];
  _QWORD v167[5];
  _QWORD v168[5];
  _QWORD v169[5];
  _QWORD v170[5];
  _QWORD v171[5];
  _QWORD v172[4];
  id v173;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRCoreAssembly cloudContext](self, "cloudContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v8 = objc_opt_class(FCCloudContext, v7);
  v172[0] = _NSConcreteStackBlock;
  v172[1] = 3221225472;
  v172[2] = sub_10001897C;
  v172[3] = &unk_1000DA550;
  v173 = v5;
  v9 = v5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "registerClass:factory:", v8, v172));
  v11 = objc_msgSend(v10, "inScope:", 2);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v171[0] = _NSConcreteStackBlock;
  v171[1] = 3221225472;
  v171[2] = sub_100018974;
  v171[3] = &unk_1000DA578;
  v171[4] = self;
  v14 = objc_msgSend(v12, "registerClass:factory:", objc_opt_class(FCNetworkBehaviorMonitor, v13), v171);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = objc_msgSend(v15, "inScope:", 2);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v170[0] = _NSConcreteStackBlock;
  v170[1] = 3221225472;
  v170[2] = sub_10002FB8C;
  v170[3] = &unk_1000DA578;
  v170[4] = self;
  v19 = objc_msgSend(v17, "registerClass:factory:", objc_opt_class(FCOfflineModeMonitor, v18), v170);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = objc_msgSend(v20, "inScope:", 2);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v24 = objc_msgSend(v22, "registerClass:factory:", objc_opt_class(FCOfflineIssueList, v23), &stru_1000DA5B8);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = objc_msgSend(v25, "inScope:", 2);

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v28 = objc_msgSend(v27, "registerProtocol:factory:", &OBJC_PROTOCOL___FCAppActivityMonitor, &stru_1000DA5F8);

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v30 = objc_msgSend(v29, "registerProtocol:factory:", &OBJC_PROTOCOL___FCBackgroundTaskable, &stru_1000DA638);

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v32 = objc_msgSend(v31, "registerProtocol:factory:", &OBJC_PROTOCOL___SXAppStateMonitor, &stru_1000DA678);

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v35 = objc_msgSend(v33, "registerClass:factory:", objc_opt_class(FCTagController, v34), &stru_1000DA6B8);
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  v37 = objc_msgSend(v36, "inScope:", 2);

  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v40 = objc_msgSend(v38, "registerClass:factory:", objc_opt_class(FCSportsEventController, v39), &stru_1000DA6F8);
  v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
  v42 = objc_msgSend(v41, "inScope:", 2);

  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v45 = objc_msgSend(v43, "registerClass:factory:", objc_opt_class(FCArticleController, v44), &stru_1000DA738);
  v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
  v47 = objc_msgSend(v46, "inScope:", 2);

  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v50 = objc_msgSend(v48, "registerClass:factory:", objc_opt_class(FCSubscriptionController, v49), &stru_1000DA778);
  v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
  v52 = objc_msgSend(v51, "inScope:", 2);

  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v55 = objc_msgSend(v53, "registerClass:factory:", objc_opt_class(FCNotificationController, v54), &stru_1000DA7B8);
  v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
  v57 = objc_msgSend(v56, "inScope:", 2);

  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v60 = objc_msgSend(v58, "registerClass:factory:", objc_opt_class(FCPuzzleController, v59), &stru_1000DA7F8);
  v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
  v62 = objc_msgSend(v61, "inScope:", 2);

  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v65 = objc_msgSend(v63, "registerClass:factory:", objc_opt_class(FCPuzzleTypeController, v64), &stru_1000DA838);
  v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
  v67 = objc_msgSend(v66, "inScope:", 2);

  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v70 = objc_msgSend(v68, "registerClass:factory:", objc_opt_class(FCPurchaseController, v69), &stru_1000DA878);
  v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
  v72 = objc_msgSend(v71, "inScope:", 2);

  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "registerProtocol:factory:", &OBJC_PROTOCOL___FCPurchaseProviderType, &stru_1000DA8B8));
  v75 = objc_msgSend(v74, "inScope:", 2);

  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "registerProtocol:factory:", &OBJC_PROTOCOL___FCPurchaseManagerType, &stru_1000DA8F8));
  v78 = objc_msgSend(v77, "inScope:", 2);

  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v81 = objc_msgSend(v79, "registerClass:factory:", objc_opt_class(FCEntitlementService, v80), &stru_1000DA938);
  v82 = (void *)objc_claimAutoreleasedReturnValue(v81);
  v83 = objc_msgSend(v82, "inScope:", 2);

  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "registerProtocol:factory:", &OBJC_PROTOCOL___FCPPTContext, &stru_1000DA978));
  v86 = objc_msgSend(v85, "inScope:", 2);

  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v88 = objc_msgSend(v87, "registerProtocol:factory:", &OBJC_PROTOCOL___FCPaidAccessCheckerType, &stru_1000DA9B8);

  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v91 = objc_msgSend(v89, "registerClass:factory:", objc_opt_class(FCAssetManager, v90), &stru_1000DA9F8);
  v92 = (void *)objc_claimAutoreleasedReturnValue(v91);
  v93 = objc_msgSend(v92, "inScope:", 2);

  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v169[0] = _NSConcreteStackBlock;
  v169[1] = 3221225472;
  v169[2] = sub_10001896C;
  v169[3] = &unk_1000DAA20;
  v169[4] = self;
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "registerProtocol:factory:", &OBJC_PROTOCOL___FCMagazinesConfigurationManager, v169));
  v96 = objc_msgSend(v95, "inScope:", 2);

  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v168[0] = _NSConcreteStackBlock;
  v168[1] = 3221225472;
  v168[2] = sub_10002FBA4;
  v168[3] = &unk_1000DAA48;
  v168[4] = self;
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "registerProtocol:factory:", &OBJC_PROTOCOL___FCTodayFeedConfigurationManager, v168));
  v99 = objc_msgSend(v98, "inScope:", 2);

  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v167[0] = _NSConcreteStackBlock;
  v167[1] = 3221225472;
  v167[2] = sub_100018964;
  v167[3] = &unk_1000DAA70;
  v167[4] = self;
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "registerProtocol:factory:", &OBJC_PROTOCOL___FCAudioFeedConfigManager, v167));
  v102 = objc_msgSend(v101, "inScope:", 2);

  v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v166[0] = _NSConcreteStackBlock;
  v166[1] = 3221225472;
  v166[2] = sub_10001895C;
  v166[3] = &unk_1000DAA98;
  v166[4] = self;
  v105 = objc_msgSend(v103, "registerClass:factory:", objc_opt_class(FCConfigurationManager, v104), v166);
  v106 = (void *)objc_claimAutoreleasedReturnValue(v105);
  v107 = objc_msgSend(v106, "inScope:", 2);

  v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v165[0] = _NSConcreteStackBlock;
  v165[1] = 3221225472;
  v165[2] = sub_100018954;
  v165[3] = &unk_1000DAA98;
  v165[4] = self;
  v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "registerProtocol:factory:", &OBJC_PROTOCOL___FCCoreConfigurationManager, v165));
  v110 = objc_msgSend(v109, "inScope:", 2);

  v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v111, "registerProtocol:factory:", &OBJC_PROTOCOL___FCTranslationManager, &stru_1000DAAD8));
  v113 = objc_msgSend(v112, "inScope:", 2);

  v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "registerProtocol:factory:", &OBJC_PROTOCOL___FCLocalAreasManager, &stru_1000DAB18));
  v116 = objc_msgSend(v115, "inScope:", 2);

  v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v119 = objc_msgSend(v117, "registerClass:factory:", objc_opt_class(FCBundleSubscriptionManager, v118), &stru_1000DAB58);
  v120 = (void *)objc_claimAutoreleasedReturnValue(v119);
  v121 = objc_msgSend(v120, "inScope:", 2);

  v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v124 = objc_msgSend(v122, "registerClass:factory:", objc_opt_class(FCPersonalizationData, v123), &stru_1000DAB98);
  v125 = (void *)objc_claimAutoreleasedReturnValue(v124);
  v126 = objc_msgSend(v125, "inScope:", 2);

  v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v129 = objc_msgSend(v127, "registerClass:factory:", objc_opt_class(FCIssueReadingHistory, v128), &stru_1000DABD8);

  v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v130, "registerProtocol:factory:", &OBJC_PROTOCOL___FCClearableReadingHistory, &stru_1000DAC18));
  v132 = objc_msgSend(v131, "inScope:", 2);

  v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v134 = objc_msgSend(v133, "registerProtocol:factory:", &OBJC_PROTOCOL___FCArticleDownloadServiceType, &stru_1000DAC58);

  v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v136 = objc_msgSend(v135, "registerProtocol:factory:", &OBJC_PROTOCOL___FCIssueDownloadServiceType, &stru_1000DAC98);

  v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v138 = objc_msgSend(v137, "registerProtocol:factory:", &OBJC_PROTOCOL___FCPuzzleDownloadServiceType, &stru_1000DACD8);

  v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "registerProtocol:factory:", &OBJC_PROTOCOL___FCAVAssetPrewarming, &stru_1000DAD18));
  v141 = objc_msgSend(v140, "inScope:", 2);

  v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "registerProtocol:factory:", &OBJC_PROTOCOL___FCAVAssetFactoryType, &stru_1000DAD58));
  v144 = objc_msgSend(v143, "inScope:", 2);

  v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "registerProtocol:factory:", &OBJC_PROTOCOL___TSSharedImageCacheType, &stru_1000DAD98));
  v147 = objc_msgSend(v146, "inScope:", 2);

  v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v148, "registerProtocol:name:factory:", &OBJC_PROTOCOL___TSSharedImageCacheType, CFSTR("Format"), &stru_1000DADB8));
  v150 = objc_msgSend(v149, "inScope:", 2);

  v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v152 = objc_msgSend(v151, "registerProtocol:factory:", &OBJC_PROTOCOL___FCReceiptRefresherType, &stru_1000DADF8);

  v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v164[0] = _NSConcreteStackBlock;
  v164[1] = 3221225472;
  v164[2] = sub_1000188F0;
  v164[3] = &unk_1000DAE20;
  v164[4] = self;
  v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "registerProtocol:factory:", &OBJC_PROTOCOL___NUAppActivityMonitor, v164));
  v155 = objc_msgSend(v154, "inScope:", 2);

  v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publicContainer"));
  v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "registerProtocol:factory:", &OBJC_PROTOCOL___TFDiagnosticFileManagerType, &stru_1000DAE60));
  v158 = objc_msgSend(v157, "inScope:", 2);

  v159 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "privateContainer"));
  v161 = objc_msgSend(v159, "registerClass:factory:", objc_opt_class(FRCachesClearableReadingHistory, v160), &stru_1000DAEA0);
  v162 = (void *)objc_claimAutoreleasedReturnValue(v161);
  v163 = objc_msgSend(v162, "inScope:", 2);

}

- (FCConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (FCNetworkBehaviorMonitor)networkBehaviorMonitor
{
  return self->_networkBehaviorMonitor;
}

- (FCCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (NUAppActivityMonitor)appActivityMonitor
{
  return self->_appActivityMonitor;
}

- (FCOfflineModeMonitor)offlineModeMonitor
{
  return self->_offlineModeMonitor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineModeMonitor, 0);
  objc_storeStrong((id *)&self->_networkBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_appActivityMonitor, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
}

@end
